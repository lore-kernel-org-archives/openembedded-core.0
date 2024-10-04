Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F4CCFA759
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:14:13 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.18831.1728036843728681157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 03:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1swfJx-00012V-Q8; Fri, 04 Oct 2024 12:14:01 +0200
Message-ID: <739cdd73-470e-4fa4-8901-750c246a28bd@pengutronix.de>
Date: Fri, 4 Oct 2024 12:14:00 +0200
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
Content-Language: en-US
In-Reply-To: <2d49a0a6-b2ed-4615-b23b-85c20af36f14@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 10:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205225

Hello,

On 02.10.24 10:17, Ahmad Fatoum wrote:
> I am building for MACHINE = "qemuarm64" already, but something else catches
> my eye: QEMU_USE_KVM = 'True'
> 
> I wasn't aware that I need to manually set this. I do this now and it fails
> for other reasons: qemu-system-aarch64: KVM does not support GICv3 emulation
> 
> I'll look into how to resolve this and maybe I am lucky and can reproduce
> this issue, once KVM is enabled.

Good news: I managed to reproduce this issue and write a few lines long reproducer
that I sent in a bug report to the KVM/QEMU development mailing lists:

    https://lore.kernel.org/all/89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de/

I will look after any fixes that may result.

As far as this series here is concerned, both barebox and U-Boot function correctly
with KVM disabled, so could we just disable KVM for only the U-Boot/barebox runqemu tests
to unblock merge of this series?


Some more info on my debugging below.

I managed to reproduce by enabling KVM and changing:

-QB_CPU_KVM = "-cpu host -machine gic-version=3"
+QB_CPU_KVM = "-cpu host -machine virt"

and by disabling migration across the big-little cluster with
taskset -a --cpu-list 2-5

I even got a U-Boot crash register dump:

  Flash: 64 MiB
  Loading Environment from Flash... *** Warning - bad CRC, using default environment

  In:    serial,usbkbd
  Out:   serial,vidconsole
  Err:   serial,vidconsole
  Bus xhci_pci: Register 8001040 NbrPorts 8
  Starting the controller
  "Synchronous Abort" handler, esr 0x96000010, far 0x10090040
  elr: 0000000000055114 lr : 00000000000550f8 (reloc)
  elr: 000000004f724114 lr : 000000004f7240f8
  x0 : 0000000010090040 x1 : 0000000000000001
  x2 : 0000000000000000 x3 : 0000000000003e80
  x4 : 0000000000000038 x5 : 000000004e58e7a2
  x6 : 0000000000000000 x7 : 0000000000000000
  x8 : 000000004e58ec30 x9 : 00000000ffffffd8
  x10: 000000000000000d x11: 0000000000000006
  x12: 000000004e58ea88 x13: 000000004e58ed90
  x14: 0000000000000000 x15: 000000004e58e7a2
  x16: 000000004f716d84 x17: 0000000000000000
  x18: 000000004e68ed90 x19: 000000004e695b00
  x20: 0000000000000000 x21: 0000000010090040
  x22: 0000000010090000 x23: 000000004f79553c
  x24: 0000000000000000 x25: 0000000000000000

Removing -enable-kvm makes the issue disappear. barebox also reaches
the shell normally when -enable-kvm is omitted.

Given that I am more familiar with barebox (and the stack traces there
actually walk the stack and contain symbols if the data abort happens
after the vector table is installed), I debugged the issue there and
narrowed it down to a specific encoding of the LDR instruction operating
on an MMIO peripheral.

More information about that in the bug report linked above.

Cheers,
Ahmad

> 
> Can you share what SoC is used for the ARM CI server? I assume it doesn't
> run into this problem, because it has a GIC >= v3. Mine is a GIC-400,
> which apparently only implements GICv2.
> 
> Cheers,
> Ahmad
> 
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

