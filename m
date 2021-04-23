Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by mx.groups.io with SMTP id smtpd.web12.1323.1619206272546875614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 12:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=S6AnCzVo;
 spf=pass (domain: mg.codeaurora.org, ip: 69.72.43.7, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619206272; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SAvtt9UVoUDDpVfGg2pbrzK6J7Fpnp1QQAoYTajCSHg=;
 b=S6AnCzVoiw2fPK6+f2LUN918GyofQxvGchsLqD+0tSEXh/9CjbYxMTFOMuH6qg8Tsha9nbeS
 x1tkIRPfNUNDKDrSek2umItz8lNdY8NMcuqInFsJcNRtcRkqDEyULKXohVXYneSu691Mb/cL
 e2QpSBeqJXRel5CYEuspJRIiAiI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6083207d03cfff3452cf1703 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Apr 2021 19:31:09
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id C21EAC4338A; Fri, 23 Apr 2021 19:31:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CEE8C433F1;
	Fri, 23 Apr 2021 19:31:08 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 24 Apr 2021 01:01:08 +0530
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Need suggestions: in case where linux-lib-headers and the kernel versions differ
In-Reply-To: <57e178c2-1711-9e6a-ce71-227d4dd7e7cd@gmail.com>
References: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
 <57e178c2-1711-9e6a-ce71-227d4dd7e7cd@gmail.com>
Message-ID: <fd9e8073844931cab52e4c9b84a1918a@codeaurora.org>
X-Sender: sbanerje@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit


Thank you for sharing your thoughts!

Let me focus a bit on the case where the BSP kernel is lower than libc.
I.e., BSP layer comes with kernel 4.19 support for the machine in 
question.

 From your replies I see following options:

Option #1)
Use linux-libc-headers_5.4 as it is from poky. BSP layer provides the 
lower version of kernel.
There may be selective bugs for application (Such as the libnl case 
discussed on thread).

Deal with such applications case-by-case. By case-by-case, I mean, with 
a linux-vendor-headers.
And make the application depend on linux-vendor-headers and look for the 
header under custom path?

Option #2)
Implement a linux-libc-headers_4.19 (or the lower version you are at).
This way seemingly, the headers and kernel coming from BSP layer are 
reconciled.

But, doing so violates the "Poky" distro, as "Poky" originally came with 
linux-libc-headers_5.4 on Dunfell.
And, that is bad idea, hence create your own higher distro layer that 
chooses linux-libc-headers_4.19.


All done, this approach still does not make things right!

As all testing/validation of 3rd-Party applications/3rd-Party layers 
that Yocto Project
and different contributors have done using Poky and with the original 
linux-libc-headers_5.4, are lost.

The lower version of headers are exposing those 3rd-Party 
applications/3rd-Party to unknown issues.

It's sort of a dilemma!
The customer I am working with is worried about "Option #1" 
(linux-libc-headers_5.4 + lower BSP kernel).
As discovery of 5.4 vs 4.19 bugs may not be easy to uncover. And then 
for for a case-by-case fix they will
have to deviate away from linux-libc-headers, and make application 
recipes, header path specific fixes.

"Option #2" (linux-libc-headers_4.19 from a higher distro layer), seems 
like a way out, but at the cost of upending all
the testing and validation done with linux-libc-headers_5.4 for upstream 
recipes/3rd-party layer.

Upgrading the machine from 4.19 to 5.4 is also off the table at this 
time.


Option #3)
Selective Backport.

I am trying to get a feel if this is even the right path?
Let linux-libc-headers_5.4 be as it is from poky. BSP layer provides the 
lower version of kernel.
Identify and freeze on list of the UAPI headers that customer plans to 
use from linux-libc-headers_5.4.

Determine what is the gap between 4.19 and 5.4, backport those from 5.4 
to 4.19.
Do a similar exercise with 3rd-party OSS applications/frameworks/layers 
to be used on project and
weed out cases like libnl by way of backporting from 5.4 to 4.19.


Does this seem to keep things aligned with linux-libc-headers from 
"Poky" and still addresses the holes that lower
BSP kernel creates when working with linux-libc-headers_5.4?

Thanks for your time!
-- 
Regards,
Sourabh


On 2021-04-23 23:31, Khem Raj wrote:
> On 4/23/21 8:03 AM, Sourabh Banerjee wrote:
>> Hi All,
>> I need your suggestion on how to reconcile if the linux-libc-headers 
>> and kernel versions are different?
>> For this discussion let's consider we are using the LTS branch YP-3.1 
>> (Dunfell).
>> With Dunfell let's consider following 3 cases:
>> 
>> 1) Machine is supported on 5.4 kernel
>> *Kernel Recipe:* linux-yocto_5.4.bb
>> *libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>>      There is no conflict in this case as libc-headers and linux-yocto 
>> are on same version.
>> 
>> 2) Machine is supported on a higher kernel (let's say 5.10)
>> *Kernel Recipe:* Let's assume provided by a BSP layer, linux_5.10.bb
>> *libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>>      The kernel version is higher in this case. But, should be okay as 
>> 5.10 UAPI is backward compatible and supports  
>> linux-libc-headers_5.4 completely.
>> 
>> 3) Machine is supported on a lower kernel (let's say 4.19)
>> Kernel Recipe: Let's assume provided by a BSP layer, linux_4.19.bb
>> libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>>      The kernel version is lower in this case. I suppose, this may 
>> lead to some runtime issues? As the kernel built from 4.19 will not be 
>> able to support 5.4 UAPI fully.
>>      What's the recommendation here? Should the BSP provider port 
>> linux-libc-header_4.19.bb in BSP layer and 
>> set PREFERRED_VERSION_linux-libc-headers = "4.19%"
>> 
>>      I suspect this as UAPI headers such as following differ, and what 
>> if this leads to runtime issues in case #3
>>        -  videodev2.h: This header is enhanced in 5.4
>>        -  fsverity.h : this header is not present in 4.19
>> 
> 
> right. all this combos should work fine in general case, however they
> all are not tested with equal coverage. So best is always to try have
> UAPIs older or equal to the kernel you intend to use. Generally
> releases support supported LTS kernels and that should be good enough,
> however if you have very old kernel and want to use latest yocto
> release, be aware that we are not testing it with those old UAPIs so
> all testing falls on your in this regard.
> 
>> -- Regards,
>> Sourabh
>> 
>> 
>> 
>> 


-- 
Regards,
Sourabh
