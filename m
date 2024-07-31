Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E6FC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 14:10:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.43670.1722435032495922042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 07:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lpjwHtnr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E0C01BF20A;
	Wed, 31 Jul 2024 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722435030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LcrAFfRgd1o7B01XmueXgHPYoItNIDblaxSzDtqYZYs=;
	b=lpjwHtnrsTUVQ3g8IUNK29CxBc5vloZFoW5sdoqyCwcfvwkDweQkS7L1kINPnfoV8XoT92
	uCV2Pzn68Yq9kT1oDK97kZR0689AZSIH7tIBFgkzC8H3pQCSQQGOsC3wHDBkKYprjDWBrX
	W749J+AoazJlu1eLzkslshln8nCiVkc9BQKXrcfWt5NqxzeNzK9pu3JIvMb3FcvbFXq6fi
	p/avBSEdZ72dL0j0TBVlCuL8Ni9uSaaOhC2wp6UCeNPc/T+veYrEsyp0WFNDyqQueg4Ssj
	EydsXxAlExcA/GwgmwxWa8DiSx0OZ6w081sJOxckDMTQaPrt7WsUe1+1HvVYVA==
Date: Wed, 31 Jul 2024 16:10:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 02/33] cryptodev-linux: upgrade 1.13 -> 1.14
Message-ID: <20240731141030ffa2aa32@mail.local>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
 <1722215408-27541-2-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1722215408-27541-2-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 14:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202710

Hello,

This causes:

ERROR: cryptodev-module-1.14-r0 do_patch: Applying patch '0001-Disable-installing-header-file-provided-by-another-p.patch' on target directory '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/qemux86_64-poky-linux/cryptodev-module/1.14/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/qemux86_64-poky-linux/cryptodev-module/1.14/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Disable-installing-header-file-provided-by-another-p.patch
patching file Makefile
Hunk #1 FAILED at 36.
1 out of 1 hunk FAILED -- rejects in file Makefile
Patch 0001-Disable-installing-header-file-provided-by-another-p.patch can be reverse-applied
stderr: ')
NOTE: recipe xorg-minimal-fonts-1_1.0-r0: task do_patch: Succeeded
NOTE: recipe lib32-initramfs-live-install-1.0-r0: task do_patch: Started
NOTE: recipe lib32-libxfont-1_1.5.4-r0: task do_patch: Succeeded
ERROR: cryptodev-tests-1.14-r0 do_patch: Applying patch '0001-tests-Makefile-do-not-use-Werror.patch' on target directory '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/cryptodev-tests/1.14/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/cryptodev-tests/1.14/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-tests-Makefile-do-not-use-Werror.patch
patching file tests/Makefile
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file tests/Makefile
Patch 0001-tests-Makefile-do-not-use-Werror.patch can be reverse-applied
stderr: ')

On 29/07/2024 09:09:37+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ===========
> * Fix compilation issues after API changes in several Linux kernels
> * Split install targets to help package maintainers
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-kernel/cryptodev/cryptodev.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> index 64a9c2926b..8d0aad4a01 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
>             "
> -SRCREV = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> -PV = "1.13+git${SRCPV}"
> +SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
> +PV = "1.14"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202576): https://lists.openembedded.org/g/openembedded-core/message/202576
> Mute This Topic: https://lists.openembedded.org/mt/107601630/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

