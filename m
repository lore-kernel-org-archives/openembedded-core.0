Return-Path: <preid@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECB2D24461
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 23:40:35 +0000 (UTC)
Received: from anchovy2.45ru.net.au (anchovy2.45ru.net.au [203.30.46.146])
 by mx.groups.io with SMTP id smtpd.web11.59015.1728603627606218794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 16:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: electromag.com.au, ip: 203.30.46.146, mailfrom: preid@electromag.com.au)
Received: (qmail 11476 invoked by uid 5089); 10 Oct 2024 23:40:24 -0000
Received: by simscan 1.2.0 ppid: 11192, pid: 11193, t: 0.8381s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950 spam: 3.1.4
Received: from unknown (HELO ?10.1.1.111?) (preid@electromag.com.au@203.221.104.202)
  by anchovy3.45ru.net.au with ESMTPA; 10 Oct 2024 23:40:23 -0000
Message-ID: <f05b8b5d-0bda-4e16-a925-9e74eeb03c8d@electromag.com.au>
Date: Fri, 11 Oct 2024 07:40:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Phil Reid <preid@electromag.com.au>
Subject: Re: [OE-core] [PATCH] archiver.bbclass: Fix archiver interaction with
 kernel recipes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
  openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>
References: <20241010052529.18502-1-preid@electromag.com.au>
 <26e580e6dadced007020601689e3d7a4f2790e45.camel@linuxfoundation.org>
Content-Language: en-AU
In-Reply-To: <26e580e6dadced007020601689e3d7a4f2790e45.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 23:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205650

On 10/10/2024 15:17, Richard Purdie wrote:
> On Thu, 2024-10-10 at 13:25 +0800, Phil Reid via lists.openembedded.org
> wrote:
>> Changes to the logic of is_work_shared where made in
>> commit: 5fbb4ca8da4f4f1ea426275c45634802dcb5a575
>> "archiver.bbclass: Improve work-shared checking"
>>
>> The resuled in a change of the logic (simplifed here) from:
>>    inherits(gcc-source) or inherits(kernel) or (inherits(kernelsrc)
>> and srcin(work-shared))
>> to just
>>    srcin(work-shared)
>>
>> With INHERIT += "archiver" in the local.conf and a kernel recipe that
>> uses
>> KERNEL_PACKAGE_NAME. When KERNEL_PACKAGE_NAME is defined the kernel
>> source is not placed into work-shared, but the archiver ends up
>> deleting the source folder in the work dir, and the build
>> subsequently fails.
>>
>> Restore the previous logic while also mainting the referenced commits
>> intent
>> to consider all recipes that use work-shared. Logic is now
>>    inherits(gcc-source) or inherits(kernel) or srcin(work-shared)
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>> ---
>>   meta/classes/archiver.bbclass | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> You're effectively reverting that commit whilst changing the logic so
> it looks slightly different.
> 
> Was there a problem with gcc-source archiving as I notice the patch
> adds gcc-source back too?
To be honest I didn't test without the gcc-source, I reverted the commit first after
finding that commit to be the cause and modified it so it consider it always considered
work-shared path and called it done and the old logic conditions.

> 
> The commit message isn't quite accurate as gcc-source isn't something
> which gets inherited.
Fair enough.

> 
> Does this only happen with kernel recipes which use
> KERNEL_PACKAGE_NAME? That might be the key missing detail which would
> allow us to reproduce the failure.
> 

I haven't seen the problem on a virtual/kernel.
When KERNEL_PACKAGE_NAME is specified the kernel source isn't put into work-shared.


How would you like to see this fixed?


-- 
Regards
Phil Reid
  
ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au
  
23 Junction Parade, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100

Email: preid@electromag.com.au

