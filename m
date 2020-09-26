Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.16133.1601141175754065619
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 10:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08QHPDXJ001706
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sat, 26 Sep 2020 10:25:34 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 26 Sep
 2020 10:25:03 -0700
Subject: Re: [OE-core] [PATCH] sysvinit rc: Use PSPLASH_FIFO_DIR for progress fifo
To: <mihai.lindner@gmail.com>, <openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20200829030901.488431-1-mgloff@emacinc.com>
 <27286.1601119672816825649@lists.openembedded.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <414449f1-4bfc-87b2-a73f-952d362f54fb@windriver.com>
Date: Sat, 26 Sep 2020 13:24:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <27286.1601119672816825649@lists.openembedded.org>
X-Originating-IP: [172.25.44.2]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Add Steve, who maintains dunfell.

On 2020-09-26 7:27 a.m., mihai.lindner@gmail.com wrote:
> Please backport this to dunfell.

Hi Mihai,

Steve might do that but it would be better if you
could cherry-pick it back, test it, and send a patch:
   http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Thanks,

../Randy

> 
> Thanks,
> Mihai
> 
> On Sat, Aug 29, 2020 at 06:09 AM, Michael Gloff wrote:
> 
>>
>> psplash expects the fifo to be in /run or specified
>> by PSPLASH_FIFO_DIR. This patch allows psplash to
>> quit normally. Also, fix the work around of using
>> echo directly into the fifo and use psplash-write.
>>
>> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
>> ---
>>   meta/recipes-core/sysvinit/sysvinit/rc | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-core/sysvinit/sysvinit/rc
>> b/meta/recipes-core/sysvinit/sysvinit/rc
>> index 7ca41ae1ae..fd1fdd26ba 100755
>> --- a/meta/recipes-core/sysvinit/sysvinit/rc
>> +++ b/meta/recipes-core/sysvinit/sysvinit/rc
>> @@ -26,11 +26,8 @@ startup_progress() {
>>           progress=$progress_size
>>       fi
>>       #echo "PROGRESS is $progress $runlevel $first_step + ($step of
>> $num_steps) $step_change $progress_size"
>> -    #if type psplash-write >/dev/null 2>&1; then
>> -    #    TMPDIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
>> -    #fi
>> -    if [ -e /mnt/.psplash/psplash_fifo ]; then
>> -        echo "PROGRESS $progress" > /mnt/.psplash/psplash_fifo
>> +    if type psplash-write >/dev/null 2>&1; then
>> +        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS $progress" ||
>> true
>>       fi
>>   }
>>   
>> @@ -176,7 +173,7 @@ startup() {
>>   #Uncomment to cause psplash to exit manually, otherwise it exits when it sees
>> a VC switch
>>   if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ];
>> then
>>       if type psplash-write >/dev/null 2>&1; then
>> -        TMPDIR=/mnt/.psplash psplash-write "QUIT" || true
>> +        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "QUIT" || true
>>       	umount -l /mnt/.psplash
>>       fi
>>   fi
>> -- 
>> 2.28.0
>>
>>
>>
>>
>> 
>>


-- 
# Randy MacLeod
# Wind River Linux
