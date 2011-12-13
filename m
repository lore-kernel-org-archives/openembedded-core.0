Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1RaS38-0003MZ-NT
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 14:05:38 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 13 Dec 2011 14:58:44 +0200
Message-ID: <4EE74C03.6050407@bluegiga.com>
Date: Tue, 13 Dec 2011 14:58:43 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>	<1323779213.2731.63.camel@ted>
	<1323779786.24417.140.camel@phil-desktop>
In-Reply-To: <1323779786.24417.140.camel@phil-desktop>
X-OriginalArrivalTime: 13 Dec 2011 12:58:44.0950 (UTC)
	FILETIME=[F25FCF60:01CCB996]
Subject: Re: [PATCH v2] initscripts: fix timestamp check at bootmisc.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 13:05:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2011 02:36 PM, Phil Blundell wrote:
> On Tue, 2011-12-13 at 12:26 +0000, Richard Purdie wrote:
>> On Tue, 2011-12-13 at 08:58 +0200, Lauri Hintsala wrote:
>>>   # Set the system clock from hardware clock
>>> -# If the timestamp is 1 day or more recent than the current time,
>>> +# If the timestamp is more recent than the current time,
>>>   # use the timestamp instead.
>>>   /etc/init.d/hwclock.sh start
>>>   if test -e /etc/timestamp
>>>   then
>>> -	SYSTEMDATE=`date  -u +%2m%2d%2H%2M%4Y`
>>> -	read TIMESTAMP<  /etc/timestamp
>>> -        NEEDUPDATE=`expr \( $TIMESTAMP \>  $SYSTEMDATE + 10000 \)`
>>> -        if [ $NEEDUPDATE -eq 1 ]; then
>>> -		date -u $TIMESTAMP
>>> +	SYSTEMDATE=`date -u +%4Y%2m%2d`
>>> +	TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0,1,4); }'`
>>> +	NEEDUPDATE=`expr \( $TIMESTAMP \>  $SYSTEMDATE \)`
>>> +	if [ $NEEDUPDATE -eq 1 ]; then
>>> +		date -u `cat /etc/timestamp`
>>>   		/etc/init.d/hwclock.sh stop
>>>   	fi
>>>   fi
>>
>>
>> For reference, the code in the boot process is trying not to cause
>> fork/exec calls. This is why it does:
>>
>> read TIMESTAMP<  /etc/timestamp
>>
>> since this is faster than forking to run cat. Could we fix this in a
>> different way to avoid the fork/execs?
>
> For the same reason it would probably be nice to replace that call to
> "expr" (which was in the old version too) with a shell expansion.

SYSTEMDATE=`date -u +%4Y%2m%2d`
TIMESTAMP=`awk '{ print substr($0,9,4) substr($0,1,4); }' < /etc/timestamp`
if [ $TIMESTAMP -gt $SYSTEMDATE ]; then
	read TIMESTAMP < /etc/timestamp
	date -u $TIMESTAMP
	/etc/init.d/hwclock.sh stop
fi

How about this?

Lauri


