Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F69C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 14:24:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.29788.1704205483274859282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 06:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JlWQ0fgp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 663A9240006;
	Tue,  2 Jan 2024 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704205480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TPFMKZ5cb6UownOONt6dkmk7J7X3p4jBQQEZGTiXa9c=;
	b=JlWQ0fgp7aB/ynX0rOC94wemtutJgvXuxRspK904sFB0yAhmZlU4Q2QtLlsE4jztv3/5bE
	xWsvTm+Rf49vJnocxKTpRSD7vKzmSINv6BSPe0cfcjQLtvVSCLxdtkE+EKm8n/HkKwXx12
	O7d0zL5tvUNQ0Dsp7LIlm4tOnjXYl/4T+iFfgU16jOha7qA4dtwZpdTOp+W4ZCQUj1tsTX
	2tpPDc6n6JwgcBcdm+s7ISvFeXKbKmFu8uWE9MrEiZ/HAwmFJ8ak5yIj4K7Cy3URO2D16v
	gW0ReTHZLF3tU+s/59jXPwu5tMVpYguo5itf1DLvu17tK97d7tYJL1pd4y31zA==
Date: Tue, 2 Jan 2024 15:24:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/7] kernel: consolidated pull request
Message-ID: <20240102142440c632ce21@mail.local>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1704169585.git.bruce.ashfield@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 14:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193233

Hello,

This breaks meta-virt:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2705/steps/12/logs/stdio

and I believe this also causes:

AssertionError: 2 != 0 : Log: /home/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/target_logs/dmesg
-----------------------
Central error: [    0.455917] ACPI: _OSC evaluation for CPUs failed, trying _PDC
***********************
[    0.413863] raid6: sse2x2   gen() 14704 MB/s
[    0.430863] raid6: sse2x1   gen() 11500 MB/s
[    0.431830] raid6: using algorithm sse2x4 gen() 15109 MB/s
[    0.448863] raid6: .... xor() 8116 MB/s, rmw enabled
[    0.449864] raid6: using ssse3x2 recovery algorithm
[    0.450948] ACPI: Added _OSI(Module Device)
[    0.451846] ACPI: Added _OSI(Processor Device)
[    0.451865] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.452865] ACPI: Added _OSI(Processor Aggregator Device)
[    0.454666] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.455917] ACPI: _OSC evaluation for CPUs failed, trying _PDC
[    0.457035] ACPI: Interpreter enabled
[    0.457889] ACPI: PM: (supports S0 S3 S5)
[    0.458874] ACPI: Using IOAPIC for interrupt routing
[    0.459924] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.460865] PCI: Using E820 reservations for host bridge windows
[    0.461998] ACPI: Enabled 2 GPEs in block 00 to 3F
[    0.465281] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.465869] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.466904] acpi PNP0A08:00: _OSC: platform does not support [LTR]
[    0.467913] acpi PNP0A08:00: _OSC: OS now controls [PME PCIeCapability]


On 01/01/2024 23:31:02-0500, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> As promised, I waited until the new year to send this update
> to introduce the 6.6 kernel and libc-headers.
> 
> I'll be sending patches to the appropriate lists to remove
> 6.5 shortly and make 6.6 the default. Once we have the reference
> boards updated to 6.6, the 6.1 kernel will also be removed.
> 
> I've built 6.6 for all supported arches, core-image-* and have
> also tested against musl.
> 
> Patches to meta-oe have been sent, and the work done with
> 6.6 as the -dev kernel means that the tightly coupled packages
> already build against 6.6.
> 
> I'm sure there will be issues .. as there always are, but at
> this point, I need more eyes and test cycles to find those
> issues.
> 
> Bruce
> 
> 
> The following changes since commit fe5d2f0b666c83e3336ea9962c8e2e4c39816e21:
> 
>   bitbake: lib/bb: Add workaround for libgcc issues with python 3.8 and 3.9 (2023-12-30 11:03:25 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.yoctoproject.org/poky-contrib zedd/kernel
>   https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (7):
>   linux-libc-headers: update to v6.6-lts
>   linux-yocto: introduce 6.6 reference kernel
>   linux-yocto/6.6: fix AB-INT: QEMU kernel panic: No irq handler for
>     vector
>   linux-yocto-rt/6.6: fix CVE exclusion include
>   linux-yocto/6.6: update CVE exclusions
>   linux-yocto/6.6: update to v6.6.8
>   linux-yocto/6.1: update to v6.1.69
> 
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  ...aders_6.5.bb => linux-libc-headers_6.6.bb} |    2 +-
>  .../linux/cve-exclusion_6.6.inc               | 5172 +++++++++++++++++
>  .../linux/linux-yocto-rt_6.1.bb               |    6 +-
>  .../linux/linux-yocto-rt_6.6.bb               |   48 +
>  .../linux/linux-yocto-tiny_6.1.bb             |    6 +-
>  .../linux/linux-yocto-tiny_6.6.bb             |   33 +
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   28 +-
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   72 +
>  9 files changed, 5347 insertions(+), 22 deletions(-)
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.5.bb => linux-libc-headers_6.6.bb} (83%)
>  create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.6.inc
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.6.bb
> 
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193196): https://lists.openembedded.org/g/openembedded-core/message/193196
> Mute This Topic: https://lists.openembedded.org/mt/103476582/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

