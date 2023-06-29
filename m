Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B7CEB64DC
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 09:45:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.4697.1688031933202939389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 02:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C5xPIqp5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688031931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZIDWFza7RB8ImRrAB9f/xITIFdpHjNk7UGttixC0VQ=;
	b=C5xPIqp5I/SMSKaepCUdYrpi9DFwTDO8gCpw7ieGOuVSffrrCwu5+QQDTidZG7P2oTlf6Q
	GD9o7GhWTUGOHL+VOZRKzzAae3bDHurxVek0v69jzIVbozEHOcCuUEcTNQyo+bXjo/PJ8y
	0Z4Xwim0XjWrCwsxzDnSCdIqi+W4rd9XMVho/xnKI5sYx+LmNJ09gktSwrlx9AfJBLuMpm
	El+ucVDynS9UenZOxPBVfTo23YkyPasPYEGwdKRkyGTja6eTz8JrAd9mq8C4r6EZF+k5KI
	YmI1rAGuzXHGcdaA4ZVbmd7iwzvstdWXgAX2iuaBjBbpEIdGwMhw8dYptTclOw==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04D6E2000D;
	Thu, 29 Jun 2023 09:45:30 +0000 (UTC)
Date: Thu, 29 Jun 2023 11:45:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] tiff: upgrade 4.5.0 -> 4.5.1
Message-ID: <20230629094530eaffd643@mail.local>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
 <1687850250-20040-31-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1687850250-20040-31-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 09:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183615

Hello,

Can you rebase on master as we have a few more CVE patch that need to be
reviewed too?

On 27/06/2023 15:17:28+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> CVE-2022-48281.patch
> CVE-2023-2731.patch
> removed since they're included in 4.5.1
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libtiff/files/CVE-2022-48281.patch        | 29 --------------
>  .../libtiff/files/CVE-2023-2731.patch         | 39 -------------------
>  .../libtiff/{tiff_4.5.0.bb => tiff_4.5.1.bb}  |  7 +---
>  3 files changed, 2 insertions(+), 73 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
>  delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
>  rename meta/recipes-multimedia/libtiff/{tiff_4.5.0.bb => tiff_4.5.1.bb} (91%)
> 
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
> deleted file mode 100644
> index e356d377ea..0000000000
> --- a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -CVE: CVE-2022-48281
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
> -From: Su Laus <sulau@freenet.de>
> -Date: Sat, 21 Jan 2023 15:58:10 +0000
> -Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
> -
> ----
> - tools/tiffcrop.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
> -index 14fa18da..7db69883 100644
> ---- a/tools/tiffcrop.c
> -+++ b/tools/tiffcrop.c
> -@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data *image,
> -                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
> -             else
> -             {
> --                prev_cropsize = seg_buffs[0].size;
> -+                prev_cropsize = seg_buffs[i].size;
> -                 if (prev_cropsize < cropsize)
> -                 {
> -                     next_buff = _TIFFrealloc(
> --- 
> -GitLab
> -
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
> deleted file mode 100644
> index 7db0a35f72..0000000000
> --- a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 9be22b639ea69e102d3847dca4c53ef025e9527b Mon Sep 17 00:00:00 2001
> -From: Even Rouault <even.rouault@spatialys.com>
> -Date: Sat, 29 Apr 2023 12:20:46 +0200
> -Subject: [PATCH] LZWDecode(): avoid crash when trying to read again from a
> - strip whith a missing end-of-information marker (fixes #548)
> -
> -CVE: CVE-2023-2731
> -Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9be22b639ea69e102d3847dca4c53ef025e9527b]
> -
> ----
> - libtiff/tif_lzw.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
> -index ba75a07e..d631fa10 100644
> ---- a/libtiff/tif_lzw.c
> -+++ b/libtiff/tif_lzw.c
> -@@ -423,6 +423,10 @@ static int LZWDecode(TIFF *tif, uint8_t *op0, tmsize_t occ0, uint16_t s)
> - 
> -     if (sp->read_error)
> -     {
> -+        TIFFErrorExtR(tif, module,
> -+                      "LZWDecode: Scanline %" PRIu32 " cannot be read due to "
> -+                      "previous error",
> -+                      tif->tif_row);
> -         return 0;
> -     }
> - 
> -@@ -742,6 +746,7 @@ after_loop:
> -     return (1);
> - 
> - no_eoi:
> -+    sp->read_error = 1;
> -     TIFFErrorExtR(tif, module,
> -                   "LZWDecode: Strip %" PRIu32 " not terminated with EOI code",
> -                   tif->tif_curstrip);
> --- 
> -2.34.1
> -
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
> similarity index 91%
> rename from meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
> rename to meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
> index ca4a3eff91..1c0d54900a 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
> @@ -8,12 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
>  
>  CVE_PRODUCT = "libtiff"
>  
> -SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
> -           file://CVE-2022-48281.patch \
> -           file://CVE-2023-2731.patch \
> -"
> +SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
>  
> -SRC_URI[sha256sum] = "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464"
> +SRC_URI[sha256sum] = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b"
>  
>  # exclude betas
>  UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183472): https://lists.openembedded.org/g/openembedded-core/message/183472
> Mute This Topic: https://lists.openembedded.org/mt/99805188/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

