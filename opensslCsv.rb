require 'csv'
require 'base64'

#puts Base64.decode64(customers[2][14])
  def writeToFile( file, data)
      	target = open(file,'w') do |f2|
      	f2.puts
	 	f2.puts data
	 	end
	 end
$pCounter =1
#customers = CSV.read('/tmp/index.html')
CSV.foreach('/tmp/index.html.1') do |row|



#0        #1  #2    #3  4     6          7             8              9      10         11          12       13       14     15
#HostName,IP,Score,Ping,Speed,CountryLong,CountryShort,NumVpnSessions,Uptime,TotalUsers,TotalTraffic,LogType,Operator,Message,OpenVPN_ConfigData_Base64
  puts row[3]

  config = row[14].to_s		#Get Base64 of string

  if (config.length > 100 )
    plain = Base64.decode64( config )
    plain = Base64.decode64( config )
    filename =	'OpenVPNcfg'
    filename << '_'
    filename << row[6]
    filename << '_'
    filename << row[1]
    filename << "_Ping_"
    filename << row[3]
    filename << '_NumSess_'
    filename << row[8]
    filename << '_'
    filename << '.txt'
    puts row.inspect

    #if ( row[3] >  49)
 #   target = open(filename,'w') do |f2|
 #     f2.puts
 #     f2.puts plain
 # end
 #Checking score
   if  row[2].to_i > 50000 
   	writeToFile(filename, plain)
   end
   #check ping
 #   if  row[3].to_i > 30 
 #  	writeToFile(filename, plain)
 #  end




    
  else
  end
  $pCounter = 1 + $pCounter
  puts $pCounter
# puts the lenght of array.
#This does not work for first and last element
end


