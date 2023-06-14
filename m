Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B614EB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 08:05:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6232.1686729928489543635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 01:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XYJcrA7X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686729926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jve5ISW93Y7tTCfIQDsyC2pErkUQ0aB/RINGrGMFGJ8=;
	b=XYJcrA7XJLT9wJmQ0cWmR4OnhFY3ijPNFgy8WdIQhHaSf6AmSKEUCUP+OfOPh2ou4haY0G
	G2iNCjeWIfcTykhApSJ4SqJjWve+Jsq4g4mtKZsZJBkcSSxGgnHxoduUCKQt+dohgdGD5X
	9hcHc2XItNLcZidEu5s8zo+rFN0yLWKbGCrV3VR3HnV/vaJcM8EW4mb71/KbRoS6TGLzXQ
	otUZyNW/KzHCiqSFoUK8Xpp3YiC7aWhhZx5XkCuapcishKQkbmYrkSgZVv7gmdo085+rNs
	xnrLOz7XWLVg7PhteWEX2ZZ+Pu78DweIJzlH0lWmXWf/MYH3jABsUBBfGklE4g==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 233804000C;
	Wed, 14 Jun 2023 08:05:24 +0000 (UTC)
Date: Wed, 14 Jun 2023 10:05:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: devarsht@ti.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, denys@konsulko.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, khasim@ti.com,
	nsekhar@ti.com, afd@ti.com, rs@ti.com, n-jain1@ti.com
Subject: Re: [oe-core][PATCH v2] wic: bootimg: Add support to install
 directories
Message-ID: <202306140805248816625d@mail.local>
References: <20230613091011.3624628-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613091011.3624628-1-devarsht@ti.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 08:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182738

Hello,

This breaks x86:


https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5277/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5328/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5320/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5355/steps/14/logs/stdio

On 13/06/2023 14:40:11+0530, Devarsh Thakkar via lists.openembedded.org wrote:
> IMAGE_BOOTFILES can contains directories to install in boot partition
> for e.g. below declaration allows to install files into boot dir as per
> example given in yocto documentation [1].
> 
> $ IMAGE_BOOT_FILES = "bcm2835-bootfiles/*;boot/
> 
> So to install directories in target boot parition of wic image,
> use `-t` option of install command so that if there are any directories
> present in IMAGE_BOOT_FILES macro they get created in target area and
> respective files get installed in created directory in target area.
> 
> This also fixes below error, which was faced while trying to install logos
> directory inside the boot partition :
> 
> $ "install -m 0644 -D <src_path>/deploy/images/am62xx-evm/ti.gz
> <dst_path>/1.0-r0/tmp-wic/hdd/boot/logos/ returned '1' instead of 0
> | output: install: target '<dst_path>/1.0-r0/tmp-wic/hdd/boot/logos/'
> is not a directory: No such file or directory"
> 
> Link:
> [1] https://docs.yoctoproject.org/ref-manual/variables.html?highlight=image_boot_files
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2: s/Logs/Link (in commit message)
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py       | 4 ++--
>  scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index c28d3917c2..966606a39e 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -341,13 +341,13 @@ class BootimgEFIPlugin(SourcePlugin):
>                  objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
>                  exec_native_cmd(objcopy_cmd, native_sysroot)
>          else:
> -            install_cmd = "install -m 0644 %s/%s %s/%s" % \
> +            install_cmd = "install -m 0644 -D %s/%s -t %s/%s" % \
>                  (staging_kernel_dir, kernel, hdddir, kernel)
>              exec_cmd(install_cmd)
>  
>          if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
>              for src_path, dst_path in cls.install_task:
> -                install_cmd = "install -m 0644 -D %s %s" \
> +                install_cmd = "install -m 0644 -D %s -t %s" \
>                                % (os.path.join(kernel_dir, src_path),
>                                   os.path.join(hdddir, dst_path))
>                  exec_cmd(install_cmd)
> diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
> index 5dbe2558d2..32cc5d38ab 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> @@ -184,7 +184,7 @@ class BootimgPartitionPlugin(SourcePlugin):
>          for task in cls.install_task:
>              src_path, dst_path = task
>              logger.debug('Install %s as %s', src_path, dst_path)
> -            install_cmd = "install -m 0644 -D %s %s" \
> +            install_cmd = "install -m 0644 -D %s -t %s" \
>                            % (os.path.join(kernel_dir, src_path),
>                               os.path.join(hdddir, dst_path))
>              exec_cmd(install_cmd)
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182701): https://lists.openembedded.org/g/openembedded-core/message/182701
> Mute This Topic: https://lists.openembedded.org/mt/99501427/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

