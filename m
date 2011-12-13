Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1RaNnU-0008EU-On
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 09:33:12 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 13 Dec 2011 10:26:19 +0200
Message-ID: <4EE70C29.3070407@bluegiga.com>
Date: Tue, 13 Dec 2011 10:26:17 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
	<CCC5D6B0-34D4-445E-A0A6-FED2FEF1CF7A@dominion.thruhere.net>
In-Reply-To: <CCC5D6B0-34D4-445E-A0A6-FED2FEF1CF7A@dominion.thruhere.net>
X-OriginalArrivalTime: 13 Dec 2011 08:26:19.0116 (UTC)
	FILETIME=[E37F7AC0:01CCB970]
Subject: Re: [PATCH v2] initscripts: fix timestamp check at	bootmisc.sh
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
X-List-Received-Date: Tue, 13 Dec 2011 08:33:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 09:45 AM, Koen Kooi wrote:
>
>
> Op 13 dec. 2011 om 07:58 heeft Lauri
> Hintsala<lauri.hintsala@bluegiga.com>  het volgende geschreven:
>
>> Timestamp checking has been broken by the commit
>> 2078af333d704fd894a2dedbc19cef5775cdadbb. Fix timestamp checking
>> and clean the code.
>>
>> cc: sgw@linux.intel.com cc: gary@mlbassoc.com
>>
>> Signed-off-by: Lauri Hintsala<lauri.hintsala@bluegiga.com> ---
>> .../initscripts/initscripts-1.0/bootmisc.sh        |   12
>> ++++++------ 1 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git
>> a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
>> b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh index
>> 03fd67c..6d68b35 100755 ---
>> a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh +++
>> b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh @@
>> -62,16 +62,16 @@ then fi
>>
>> # Set the system clock from hardware clock -# If the timestamp is 1
>> day or more recent than the current time, +# If the timestamp is
>> more recent than the current time, # use the timestamp instead.
>> /etc/init.d/hwclock.sh start if test -e /etc/timestamp then -
>> SYSTEMDATE=`date  -u +%2m%2d%2H%2M%4Y` -    read TIMESTAMP<
>> /etc/timestamp -        NEEDUPDATE=`expr \( $TIMESTAMP \>
>> $SYSTEMDATE + 10000 \)` -        if [ $NEEDUPDATE -eq 1 ]; then -
>> date -u $TIMESTAMP +    SYSTEMDATE=`date -u +%4Y%2m%2d` +
>> TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4)
>> substr($0,1,4); }'` +    NEEDUPDATE=`expr \( $TIMESTAMP \>
>> $SYSTEMDATE \)` +    if [ $NEEDUPDATE -eq 1 ]; then +        date
>> -u `cat /etc/timestamp` /etc/init.d/hwclock.sh stop fi fi
>
> This changes the format of timestamp, which breaks the code in
> image.bbclass.

No. Patch doesn't change the format of timestamp file. Format 
"+%4Y%2m%2d" is used only for comparing system date and timestamp file.


> Have a look at
> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/commit/?id=e003be8cba3d387f44a502fdbebf58e774afd677
> for backwards compatible Logic

Timestamp file is still saved by save-rtc.sh script and it is untouched.


Lauri Hintsala



