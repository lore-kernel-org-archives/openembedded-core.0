Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1RaSMj-00047z-KY
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 14:25:53 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 13 Dec 2011 15:18:57 +0200
Message-ID: <4EE750C0.8050703@bluegiga.com>
Date: Tue, 13 Dec 2011 15:18:56 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>	<1323779213.2731.63.camel@ted>	<1323779786.24417.140.camel@phil-desktop>	<4EE74C03.6050407@bluegiga.com>
	<1323781625.24417.150.camel@phil-desktop>
In-Reply-To: <1323781625.24417.150.camel@phil-desktop>
X-OriginalArrivalTime: 13 Dec 2011 13:18:57.0955 (UTC)
	FILETIME=[C561AF30:01CCB999]
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
X-List-Received-Date: Tue, 13 Dec 2011 13:25:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2011 03:07 PM, Phil Blundell wrote:
> On Tue, 2011-12-13 at 14:58 +0200, Lauri Hintsala wrote:
>> SYSTEMDATE=`date -u +%4Y%2m%2d`
>> TIMESTAMP=`awk '{ print substr($0,9,4) substr($0,1,4); }'<  /etc/timestamp`
>> if [ $TIMESTAMP -gt $SYSTEMDATE ]; then
>> 	read TIMESTAMP<  /etc/timestamp
>> 	date -u $TIMESTAMP
>> 	/etc/init.d/hwclock.sh stop
>> fi
>>
>> How about this?
>
> You could lose the call to "awk" as well:
>
> read RAWTIMESTAMP<  /etc/timestamp
> TIMESTAMP=${RAWTIMESTAMP#????????}${RAWTIMESTAMP%????????}
>
> Or, er, something like that.  You might need to tweak the patterns a bit
> depending on what exactly the format of /etc/timestamp actually is, but
> I guess you get the idea.

Yes I got your idea and it seems to work. Thanks for your tips!

Second try:

SYSTEMDATE=`date -u +%4Y%2m%2d`
read TIMESTAMP < /etc/timestamp
if [ ${TIMESTAMP:8:4}${TIMESTAMP:0:4} -gt $SYSTEMDATE ]; then
     date -u $TIMESTAMP
     /etc/init.d/hwclock.sh stop
fi

Is this okay? Should I generate patch?

Lauri


