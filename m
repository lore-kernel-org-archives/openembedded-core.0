Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CAFCF31A0
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:17:52 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.2462.1727857063492514520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 01:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1svuYH-0000Cc-8Q; Wed, 02 Oct 2024 10:17:41 +0200
Message-ID: <2d49a0a6-b2ed-4615-b23b-85c20af36f14@pengutronix.de>
Date: Wed, 2 Oct 2024 10:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] [PATCH v7 0/7] Add barebox bootloader support (and
 testing)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, yocto@pengutronix.de
References: <20240919120640.19714-1-ejo@pengutronix.de>
 <b77f2c6737c330ef9ecce325d50a4aaa25b3e536.camel@linuxfoundation.org>
 <ee536d88a5b6468b20e37f3daabe4aa63047d1ad.camel@pengutronix.de>
 <92a6efc1-51a0-4153-b894-581fbe868595@pengutronix.de>
 <99df937c036d57a532b29851ffe7d0055d35d83f.camel@linuxfoundation.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <99df937c036d57a532b29851ffe7d0055d35d83f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 08:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205181

Hello Richard,

On 01.10.24 16:56, Richard Purdie wrote:
> On Tue, 2024-10-01 at 16:35 +0200, Ahmad Fatoum wrote:
>> My successful run looks identical to yours. barebox start up is also
>> successful and uneventful.
>>
>> Note that barebox' XHCI driver doesn't have PCI support unlike U-Boot, so
>> if the same issue is affecting both barebox and U-Boot breakage in CI,
>> it might not be USB emulation related as barebox doesn't do any
>> USB on that platform...
>>
>> Is `selftest -r uboot -v -v -v -K` close enough to what the CI server runs
>> or should I try something else to reproduce this?
> 
> That should have worked. "selftest -r barebox" should also fail.
> 
> The config used on the autobuilder for that can be seen here:
> 
> https://valkyrie.yoctoproject.org/#/builders/23/builds/168/steps/13/logs/stdio
> 
> in case the MACHINE value in particular makes a difference.

I am building for MACHINE = "qemuarm64" already, but something else catches
my eye: QEMU_USE_KVM = 'True'

I wasn't aware that I need to manually set this. I do this now and it fails
for other reasons: qemu-system-aarch64: KVM does not support GICv3 emulation

I'll look into how to resolve this and maybe I am lucky and can reproduce
this issue, once KVM is enabled.

Can you share what SoC is used for the ARM CI server? I assume it doesn't
run into this problem, because it has a GIC >= v3. Mine is a GIC-400,
which apparently only implements GICv2.

Cheers,
Ahmad

> 
> Cheers,
> 
> Richard
> 
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

