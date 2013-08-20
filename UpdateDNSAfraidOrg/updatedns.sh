#!/bin/bash
ip=$(<previousip.txt)
ipf=previousip.txt
cip=$(curl -s http://icanhazip.com)
now="$(date)"
if [ "$ip" == "$cip" ]
then
        printf "Same IP %s\n" "$now"
        echo $cip > $ipf
else
        printf "NOT Same %s\n" "$now"
        echo $cip > $ipf
        curl -k http://freedns.afraid.org/dynamic/update.php?REPLACEWITHYOUROWNLINK
fi
