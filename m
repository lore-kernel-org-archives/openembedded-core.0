Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFABCED610
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 06:45:57 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.9808.1728456356996144968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 23:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1syQSI-0000ms-Vq; Wed, 09 Oct 2024 08:45:55 +0200
Message-ID: <2553e06f-11de-413f-b705-dfa6f19c23a1@pengutronix.de>
Date: Wed, 9 Oct 2024 08:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] [PATCH v7 0/7] Add barebox bootloader support (and
 testing)
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, yocto@pengutronix.de
References: <20240919120640.19714-1-ejo@pengutronix.de>
 <b77f2c6737c330ef9ecce325d50a4aaa25b3e536.camel@linuxfoundation.org>
 <ee536d88a5b6468b20e37f3daabe4aa63047d1ad.camel@pengutronix.de>
 <92a6efc1-51a0-4153-b894-581fbe868595@pengutronix.de>
 <99df937c036d57a532b29851ffe7d0055d35d83f.camel@linuxfoundation.org>
 <2d49a0a6-b2ed-4615-b23b-85c20af36f14@pengutronix.de>
 <739cdd73-470e-4fa4-8901-750c246a28bd@pengutronix.de>
Content-Language: en-US
In-Reply-To: <739cdd73-470e-4fa4-8901-750c246a28bd@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 06:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205341

Hello,

On 04.10.24 12:14, Ahmad Fatoum wrote:
> On 02.10.24 10:17, Ahmad Fatoum wrote:
>> I am building for MACHINE = "qemuarm64" already, but something else catches
>> my eye: QEMU_USE_KVM = 'True'
>>
>> I wasn't aware that I need to manually set this. I do this now and it fails
>> for other reasons: qemu-system-aarch64: KVM does not support GICv3 emulation
>>
>> I'll look into how to resolve this and maybe I am lucky and can reproduce
>> this issue, once KVM is enabled.
> 
> Good news: I managed to reproduce this issue and write a few lines long reproducer
> that I sent in a bug report to the KVM/QEMU development mailing lists:
> 
>     https://lore.kernel.org/all/89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de/

TL;DR: Turns out this is not a bug, but a known quirk of KVM and software that
wishes to run under KVM needs to adapt the instructions it uses to access MMIO
regions accordingly.

For barebox, I sent a series adding KVM compatibility here:
https://lore.kernel.org/barebox/20241009060511.4121157-1-a.fatoum@pengutronix.de

For U-Boot, I reported the issue here:
https://lore.kernel.org/u-boot/2211f9f0-cd7d-4b55-860d-a34c04877e7b@pengutronix.de

> As far as this series here is concerned, both barebox and U-Boot function correctly
> with KVM disabled, so could we just disable KVM for only the U-Boot/barebox runqemu tests
> to unblock merge of this series?

I am more certain now that we should disable KVM for bootloader testing.
Full system tests with Linux are much more demanding, so KVM absolutely
makes sense there.

In the bootloader however, normal emulation should suffice, especially when
their upstream isn't KVM-compatible yet anyway.

Cheers,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

