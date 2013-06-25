Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42BCE6AB67
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 21:56:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5PLus9C015308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2013 14:56:54 -0700 (PDT)
Received: from [128.224.147.234] (128.224.147.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 25 Jun 2013 14:56:54 -0700
Message-ID: <51CA1222.9000705@windriver.com>
Date: Tue, 25 Jun 2013 17:56:50 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Luo Zhenhua-B19537 <B19537@freescale.com>
References: <1371560890-26412-1-git-send-email-zhenhua.luo@freescale.com>
	<1371560653.20823.113.camel@ted>
	<CA452391058F6D4E9715FB2C29D9312A015BA748@039-SN2MPN1-022.039d.mgd.msft.net>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A015BA748@039-SN2MPN1-022.039d.mgd.msft.net>
X-Originating-IP: [128.224.147.234]
Cc: Yu Zongchun-B40527 <B40527@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [patch v2] sanity.bbclass: correct the gcc_arch check logic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2013 21:56:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-06-19 11:28 PM, Luo Zhenhua-B19537 wrote:
> Ping.

I'm not sure what the protocol is for being swamped but
I still haven't gotten to this. Mark and I made some changes
to the -march tests to deal with old compilers so one of us
will send that here as soon as we can.

Sorry for the delay,

// Randy

>
>> -----Original Message-----
>> From: Luo Zhenhua-B19537
>> Sent: Tuesday, June 18, 2013 9:26 PM
>> To: 'Richard Purdie'; Randy MacLeod
>> Cc: openembedded-core@lists.openembedded.org; Yu Zongchun-B40527
>> Subject: RE: [OE-core] [oe-core][patch v2] sanity.bbclass: correct the
>> gcc_arch check logic
>>
>> Hi Randy,
>>
>> During the test on my machine with gcc-4.1.2, if -march=native is not
>> supported by host gcc, a non-zero value(256) returns, otherwise 0 returns.
>>
>> [LOG]
>> status is 256
>> result is gcc_test.c:1: error: bad value (native) for -march= switch
>> gcc_test.c:1: error: bad value (native) for -mtune= switch
>>
>> Please confirm if this is same as your result.
>>
>>
>> Best Regards,
>>
>> Zhenhua
>>
>>
>>> -----Original Message-----
>>> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
>>> Sent: Tuesday, June 18, 2013 9:04 PM
>>> To: Luo Zhenhua-B19537; Randy MacLeod
>>> Cc: openembedded-core@lists.openembedded.org; Yu Zongchun-B40527
>>> Subject: Re: [OE-core] [oe-core][patch v2] sanity.bbclass: correct the
>>> gcc_arch check logic
>>>
>>> On Tue, 2013-06-18 at 21:08 +0800, Zhenhua Luo wrote:
>>>> The gcc arch check result is incorrect when gcc version is older
>>>> than
>>> 4.5.
>>>> Sanity checker requests user to add "-march=native" into
>>>> BUILD_CFLAGS even if the flag is not supported by host gcc.
>>>>
>>>> The status is 0 when -march=native is supported by host gcc, so set
>>>> result to True, otherwise set result to False.
>>>>
>>>> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>>>> ---
>>>>   meta/classes/sanity.bbclass |    2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/sanity.bbclass
>>>> b/meta/classes/sanity.bbclass index 3b9934b..ee09679 100644
>>>> --- a/meta/classes/sanity.bbclass
>>>> +++ b/meta/classes/sanity.bbclass
>>>> @@ -325,7 +325,7 @@ def check_gcc_march(sanity_data):
>>>>           if status != 0:
>>>>               # Check if GCC could work with march
>>>>               status,result =
>>> oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c
>>> -o
>>> gcc_test")
>>>> -            if status != 0:
>>>> +            if status == 0:
>>>>                   result = True
>>>>               else:
>>>>                   result = False
>>>
>>> Can you and Randy please sort out what the correct value is here please.
>>> This appears to directly revert
>>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ad276d7d89190c57a
>>> 152
>>> 867d7278ee18f784ff2c
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

