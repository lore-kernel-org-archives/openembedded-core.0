Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C52EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 13:49:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8612.1689601785085595257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 06:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eXQeh6pU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4885C0002;
	Mon, 17 Jul 2023 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689601783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wVfL62P/k4qp/Ap5NQDipJ3k2VuRYIwP95ZZzp6TUSE=;
	b=eXQeh6pUTsNd/BeJ22WFNd+j/EQbqYhsMrdfbqdwjI0gQSF75NFZyaOur/DpbVQOS9Aqrs
	c+XHSkpqHUlLnpAusyfSYVPJJNfK7YK/BYEvcyb5kFNHWhRjUDHKNRoUw6DzcbgUypiL7h
	YJxbC02VPcScxqgvHmU6aSuEuqtDp0wBxG/JrDpk4JzNgBujzOY+AgC0zim9Dqb8Rj8XoI
	IMSkGbVapOpOBsuFVaaAkogpWF6r/N7/1Mu47UmAukf9x23dLZ5csKxy9aAeZX/T63xtSE
	N6djfcqdipOVWR9iCVP1pcSrKEhQPmrsX5SpQJ1IA+AEFOxtGlQRtZNfd3ms8A==
Date: Mon, 17 Jul 2023 15:49:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Heiko <heiko.thole@entwicklung.eq-3.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic: Add dependencies for erofs-utils
Message-ID: <202307171349425149c051@mail.local>
References: <20230717044449.11556-1-heiko.thole@entwicklung.eq-3.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717044449.11556-1-heiko.thole@entwicklung.eq-3.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 13:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184467

Hello,

Commit 68e364340c43 ("wic: Add dependencies for erofs-utils") has
already done so for a while, maybe you want a backport instead?

On 17/07/2023 06:44:49+0200, Heiko wrote:
> In order to build erofs filesystems, wic must have the erofs-utils package installed into its sysroot.
> 
> Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
> ---
>  meta/classes/image_types_wic.bbclass | 2 +-
>  meta/recipes-core/meta/wic-tools.bb  | 2 +-
>  scripts/lib/wic/misc.py              | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index 6453dd1b74..8497916d48 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -83,7 +83,7 @@ do_image_wic[recrdeptask] += "do_deploy"
>  do_image_wic[deptask] += "do_image_complete"
> 
>  WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> -WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
> +WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
>  # Unified kernel images need objcopy
>  WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
>  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
> index daaf3ea576..9282d36a4d 100644
> --- a/meta/recipes-core/meta/wic-tools.bb
> +++ b/meta/recipes-core/meta/wic-tools.bb
> @@ -6,7 +6,7 @@ DEPENDS = "\
>             parted-native gptfdisk-native dosfstools-native \
>             mtools-native bmap-tools-native grub-native cdrtools-native \
>             btrfs-tools-native squashfs-tools-native pseudo-native \
> -           e2fsprogs-native util-linux-native tar-native \
> +           e2fsprogs-native util-linux-native tar-native erofs-utils-native \
>             virtual/${TARGET_PREFIX}binutils \
>             "
>  DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
> diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> index a8aab6c524..2b90821b30 100644
> --- a/scripts/lib/wic/misc.py
> +++ b/scripts/lib/wic/misc.py
> @@ -36,6 +36,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
>                    "mkdosfs": "dosfstools",
>                    "mkisofs": "cdrtools",
>                    "mkfs.btrfs": "btrfs-tools",
> +                  "mkfs.erofs": "erofs-utils",
>                    "mkfs.ext2": "e2fsprogs",
>                    "mkfs.ext3": "e2fsprogs",
>                    "mkfs.ext4": "e2fsprogs",
> --
> 2.41.0
> 
> eQ-3 Entwicklung GmbH, Maiburger Str. 36, 26789 Leer
> Gesch?ftsf?hrer: Prof. Heinz-G. Redeker
> Registergericht: Amtsgericht Aurich, HRB 110388
> eQ-3 AG, Maiburger Str. 29, 26789 Leer
> Vorstand: Prof. Heinz-G. Redeker (Vorsitzender), Helga Redeker
> Vorsitzende des Aufsichtsrats: Irmgard Keplin
> Registergericht: Amtsgericht Aurich, HRB 200335

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184427): https://lists.openembedded.org/g/openembedded-core/message/184427
> Mute This Topic: https://lists.openembedded.org/mt/100189195/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

