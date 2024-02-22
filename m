Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96260C48BEB
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 03:22:34 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.5331.1708572152453500268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 19:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41M3LQjU024953;
	Wed, 21 Feb 2024 21:21:26 -0600
Message-ID: <08d73f7d-2b5e-4f04-a00c-9c57c32e622f@kernel.crashing.org>
Date: Wed, 21 Feb 2024 21:21:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [poky] [Openembedded-architecture] [RFC PATCH] Add genericarm64
 MACHINE using upstream defconfig
Content-Language: en-US
To: Paul Barker <pbarker.renesas@gmail.com>,
        Ross Burton
 <ross.burton@arm.com>, poky@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
        openembedded-architecture@lists.openembedded.org
References: <20240221105723.1501833-1-ross.burton@arm.com>
 <95d22879-3f51-466c-a544-91db3fff6dcd@bp.renesas.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <95d22879-3f51-466c-a544-91db3fff6dcd@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 03:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196005



On 2/21/24 9:06 AM, Paul Barker wrote:
> On 21/02/2024 10:57, Ross Burton wrote:
>> From: Ross Burton <ross.burton@arm.com>
>>
>> This is a new 64-bit "generic" Arm machine, that expects the hardware to
>> be SystemReady IR compatible. This is slightly forward-leaning as there's
>> not a _lot_ of SystemReady hardware in the wild, but most modern boards
>> are and the number will only grow.  Also, this is the only way to have a
>> 'generic' machine as without standardised bootloaders and firmware it
>> would be impossible.
>>
>> The base machine configuration isn't that exciting: it's a fully featured
>> machine that supports most things, booting via UEFI and an initramfs.
>>
>> However, the kernel is more interesting.  This RFC uses the upstream defconfig
>> because unlike some other platforms, the arm64 defconfig is actively
>> maintained with the goal of being a 'boots on most hardware' configuration.
>> My argument is: why would we duplicate that effort?
>>
>> The "linux-yocto way" is configuration fragments and after a week of
>> hair-pulling I do actually have fragments that boot on a BeaglePlay, but
>> to say this was a tiresome and frustrating exercise would be understating it.
>>
>> So, a request for comments: is it acceptable to use the upstream defconfig in
>> a reference BSP?  Personally I'm torn: the Yocto way is fragments not monolithic
>> configs, but repeating the effort to fragmentise the configuration and then
>> also have it sufficiently modular that it can be used in pieces - instead of
>> just being a large file split up into smaller files - is a lot of effort for
>> what might end up being minimal gain.  My fear is we end up with a fragmented
>> configuration that can't be easily modified without breaking some platforms,
>> and badly copies what the defconfig already does.
> 
> I am in favour of this - I think the "genericarm64" machine should use
> the in-tree defconfig so that it can support the widest array of
> hardware. If someone wants to trim down the kernel for a particular
> platform then they should probably create a specific MACHINE anyway.
> 
> If we take the other approach of building up the kernel config from
> fragments, how would we know that all SystemReady IR capable systems
> will be supported? Yocto Project doesn't have the resources to test
> every platform.

I disagree here.  I think it would be MUCH better to have a 'SystemReady IR' 
hardware configuration.  So if SystemReady IR is desired, it is something that 
anyone can enable (starting with genericarm64).  Remember the defconfig is going 
to have more then hardware configs in it.  Will it have the right systemd 
configurations?  Will is have the magic filesystem a random user wants?  Will 
avoid having some other filesystem type that another user doesn't want?

Building up the kernel, and considering SystemReady IR as a 'hardware feature', 
and then add in the additional things that are needed for whatever reason is a 
much more reasonable way to do this and make it useful to otthers.

> For the Renesas RZ SoCs I work on these days, the in-tree defconfig is
> the configuration we test with the mainline kernel.

AMD does the same thing, for the kernel development it makes sense.  Kernel is 
built and tested standalone from userspace.

But with that said, I think it's the wrong way to do Yocto Project development. 
Yocto Project development needs further control and the separation of hardware 
and software configurations is pretty essential to having a system that can be 
customized appropriately.

The defconfig can be used as a guide to the other configurations, but separating 
hardware and software configs is a necessary first step in my opinion.

--Mark

> Thanks,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13264): https://lists.yoctoproject.org/g/poky/message/13264
> Mute This Topic: https://lists.yoctoproject.org/mt/104489783/3616948
> Group Owner: poky+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/poky/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

