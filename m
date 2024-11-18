Return-Path: <m.salvini@koansoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D694BD4922D
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 14:49:08 +0000 (UTC)
Received: from mail.koansoftware.com (mail.koansoftware.com [172.104.12.216])
 by mx.groups.io with SMTP id smtpd.web10.42352.1731941347166085375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 06:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: koansoftware.com, ip: 172.104.12.216, mailfrom: m.salvini@koansoftware.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.koansoftware.com (Postfix) with ESMTP id CB0C642D7A
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 15:49:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail
Received: from mail.koansoftware.com ([127.0.0.1])
	by localhost (mail.koansoftware.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4nkydk6TnbUJ
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2024 15:49:04 +0100 (CET)
Message-ID: <3c967bf5-9856-4a91-874a-5e40b4b4e7cd@koansoftware.com>
Date: Mon, 18 Nov 2024 15:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] wic builds an empty rootfs on second image build with
 rm_work enabled
To: openembedded-core@lists.openembedded.org
References: <Zyjj-0oflBsZfj1C@nuoska>
 <553b223a0d437044e587b0ddaf0519803ff57f2f.camel@linuxfoundation.org>
 <ZztNMmHa7s21MJXI@nuoska>
Content-Language: en-US, it
From: Mauro Salvini <m.salvini@koansoftware.com>
In-Reply-To: <ZztNMmHa7s21MJXI@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 14:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207217

On 18/11/24 15:20, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
> 
> On Tue, Nov 05, 2024 at 03:53:49PM +0000, Richard Purdie wrote:
>> On Mon, 2024-11-04 at 17:10 +0200, Mikko Rapeli via lists.openembedded.org wrote:
>>> Hi,
>>>
>>> After image build completes, rootfs directory is wiped by rm_work_rootfs.
>>>
>>> If the image recipe is built again without clean, for example when
>>> TESTIMAGE_AUTO is enabled to run tests, then rootfs task will not
>>> run and thus wic uses an empty rootfs directory to populate the rootfs which
>>> of course then fails at runtime.
>>>
>>> How to fix this?
>>>
>>> I know RP doesn't like rm_work, but I really need it. I can't leave all
>>> builds laying around and bitbake IPC setup fails if a lot of IO is wiping
>>> build/tpm's while recipe parsing is happening (the famous 30 second timeout).
>>>
>>> wic image related tasks could possible depend on do_rootfs instead of
>>> do_image_complete but seems to break the whole do_image_complete design.
>>>
>>> Should rm_work_rootfs be moved from after do_image_complete to after do_image_wic
>>> if wic images are used?
>>>
>>> Or should users just remember to "bitbake -c clean image && bitbake image" if things
>>> fail?
>>>
>>> There are some other issues with testimage.bbclass and leaking cooker processes
>>> which confused me for a long time but I'll try to send patches for those.
>>
>> Does changing:
>>
>> image_types_wic.bbclass:
>>          bb.build.addtask('do_image_wic', 'do_image_complete', None, d)
>> to
>>          bb.build.addtask('do_image_wic', 'do_image_complete', 'do_rootfs', d)
>>
>> help?
> 
> This did not help. I need to dig deeper. Some of my changes may be
> triggering this. I'm seeing this now on aarch64 and x86_64 build machines.
> 
> Cheers,
> 
> -Mikko
> 

Hi Mikko,

my two cents: do you have the rm_work enabled? I've seen something 
similar in the past, but with initramfs (the generated cpio.gz file 
sometimes was empty). It seemed that adding and then removing a change 
to the image triggered the problem, as if an older but "corrupted" 
sstate has been used.
I've not found the time to dig into that, but I supposed that rm_work 
could be the culprit.

Hope it could help and not add more confusion.

Cheers

-- 
Mauro

