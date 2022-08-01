Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00009C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 14:12:18 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.25224.1659363129983841859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YJLcXmdG;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 95C7A200004;
	Mon,  1 Aug 2022 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659363128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLrvmRamCdP59dK+nI63tdTZ1mz9EcjaA05nlARdcMA=;
	b=YJLcXmdGbOSAenVMYbHrXz8h92AzgmnGS5O50D+LxuwAdiHomA3P5XrWebI7HQs37p2qZS
	Gf13/o1O7oXqNrixcTrtdMRZhnWNxT1LI88IpCFhQTGvLzAcPtm9StFaKT3bw/5G5FcsHS
	y10683smvsf5+WRtsoJbVoR9CU9Qwws4gI/JczVNxL6Mue6qnCNEqFqc1/yzRpSu0oxRbH
	qfsvc+nrVSBuQ2quIe8xGh/yFhJ8zqT6pKTk+y7hF2nz/zMPDeaJzYrlxB03+Hp+OSXgmV
	bf3xR+R30WOrOeceqgQl6gj3xzRhh34Fnwug6YI4ospSALLfZb/WysZOqepYoA==
Date: Mon, 1 Aug 2022 16:12:05 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jan Kiszka" <jan.kiszka@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Ross Burton
 <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH 2/2] wic/bootimg-efi: Add support for loading
 devicetree files
Message-ID: <20220801161205.735ef5a5@booty>
In-Reply-To: <5e8d6c83-8795-3040-3131-3b181e6f01ff@siemens.com>
References: <bc3dd2ac-3ae7-4818-e212-6f49147c306c@siemens.com>
	<5e8d6c83-8795-3040-3131-3b181e6f01ff@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 14:12:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168749

Hello Jan,

On Sat, 30 Jul 2022 10:24:43 +0200
"Jan Kiszka" <jan.kiszka@siemens.com> wrote:

> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> For device tree using systems, add support to set a custom devices tree
> during UEFI boot. This requires to copy the DTB file to the boot
> partition and to add the respective loader entries to the configuration
> files.
> 
> Both grub and systemd-boot support only loading a specific device tree.
> Therefore refuse to work if the 'dtb' parameter contains more than one
> entry.
> 
> Out of scope for now are overlays (only supported by systemd-boot).
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---

[...]

> @@ -327,11 +350,13 @@ class BootimgEFIPlugin(SourcePlugin):
>                  objcopy_cmd = "objcopy \
>                      --add-section .osrel=%s --change-section-vma .osrel=0x20000 \
>                      --add-section .cmdline=%s --change-section-vma .cmdline=0x30000 \
> +                    %s \
>                      --add-section .linux=%s --change-section-vma .linux=0x2000000 \
>                      --add-section .initrd=%s --change-section-vma .initrd=0x3000000 \
>                      %s %s" % \
>                      ("%s/usr/lib/os-release" % staging_dir_host,
>                      cmdline.name,
> +                    dtb_params,
>                      "%s/%s" % (staging_kernel_dir, kernel),
>                      initrd.name,
>                      efi_stub,

This hunk conflicts with the changes introduced by [0], which is
already in my testing branch. I have applied your patch with a little
change to resolve the conflict, can you please have a look at the result
[1] to ensure I correctly followed the logic of your patch?

[0] https://lists.openembedded.org/g/openembedded-core/message/168553
[1]
https://git.openembedded.org/openembedded-core-contrib/commit/?h=lucaceresoli/master-next&id=7547ec3e2065e55a8caa6118fc962130b8c6bd98

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

