Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF6CCA482
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:29 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.4014.1657773381730273070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5cRZBhlU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so7199801pjn.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=64RHQ0xlPyRY+MHk8EYpCcm8KPGjlJG8jq+3EjLTKfY=;
        b=5cRZBhlU9wilaaXSkT6Vc2LukWoLUPaSybWsYZhd4xUkhjy08jkt/jMPJxC5QNetzn
         h/zZpJdM6rNwNXmFiQx9K7zmwmX2mzHwZxKgVef9+6KhTIRFcjUq/q6wFqp/zSDTAK3l
         BM6PK86TiTQ7h7ZIh+qJr9Z0n4nREoved2H7U4OQAEWDmZTCuUr77RnLjmhZYt07QW8k
         iCksVbs/ee28D3SEZU0D1Bvo+nMnMAB1f7fsHsZYw3rYOWfo/gk/vXoN5ABMUyrtPIOZ
         g113bjcAetzSXlKn7OYRnJSHBZCwtMnyDhGO8Bjjx/JVL+MHh+9eO7QcxaL/3QlxeYNL
         21mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=64RHQ0xlPyRY+MHk8EYpCcm8KPGjlJG8jq+3EjLTKfY=;
        b=hOp5fN1R/J4v1SES5Nqu4O+kKY+si4ataiT+ufotcO4O5CDGPe+xn28u0CgdN/Idlx
         T9JHHpMcsVLC4DVN+5XJLQAwxTzEbrwyi0ukJx5B7c9sNxjPeAnMuKRnTDRzaJ7ufK1i
         6tEHNVgsnfM+/y7DNORclII3Z/tOk3mjOTL4vUC8f+45/SEztHbpkjPQg4C+sBej+abZ
         m+l7O1/dBGhIMZ5jSS6NX2ZR0xOS9gFJ90RqtEJZ+UfB7kIOTfNpsAuJpCiU5Tr7YhWn
         le9VHR1irCoPQfBFuNQ9TR0jxcRrI9g4rNgBwpMIUPshuUnbW3orXwiRvKwLFgxVSNr5
         w9Wg==
X-Gm-Message-State: AJIora+Ej+LEK1KKsp8ybZWdqD+bKFZ6baL8nmIpqY6Kx98+n2WU7E8X
	Tb/wtdPXHvJyXczwlZAHYvM6qdJUIyqlysId
X-Google-Smtp-Source: 
 AGRyM1tQO3cympUBPCMwZYBSPBKrUNc6Idc5yQuV4BIYp5vVFb5ZMU4c1Q3GWQgBzzER22RwRfPApw==
X-Received: by 2002:a17:90b:3848:b0:1f0:2686:87aa with SMTP id
 nl8-20020a17090b384800b001f0268687aamr7780591pjb.67.1657773380645;
        Wed, 13 Jul 2022 21:36:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/27] tiff: backport the fix for CVE-2022-2056,
 CVE-2022-2057, and CVE-2022-2058
Date: Wed, 13 Jul 2022 18:35:26 -1000
Message-Id: 
 <dc627cea881a98e451766a8fa3a5edf82f7477c0.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168003

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a84538dbe760fed94cfe22a39b0a6f95c61c307d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-the-FPE-in-tiffcrop-415-427-and-428.patch | 182 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch b/meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch
new file mode 100644
index 0000000000..a28df6ed8c
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch
@@ -0,0 +1,182 @@
+From 029da2cf70e8e38f10d62d4b0be440fb9d145af0 Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Sat, 11 Jun 2022 09:31:43 +0000
+Subject: [PATCH] fix the FPE in tiffcrop (#415, #427, and #428)
+
+CVE: CVE-2022-2056 CVE-2022-2057 CVE-2022-2058
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ libtiff/tif_aux.c |  9 +++++++
+ libtiff/tiffiop.h |  1 +
+ tools/tiffcrop.c  | 62 ++++++++++++++++++++++++++---------------------
+ 3 files changed, 44 insertions(+), 28 deletions(-)
+
+diff --git a/libtiff/tif_aux.c b/libtiff/tif_aux.c
+index 140f26c..5b88c8d 100644
+--- a/libtiff/tif_aux.c
++++ b/libtiff/tif_aux.c
+@@ -402,6 +402,15 @@ float _TIFFClampDoubleToFloat( double val )
+     return (float)val;
+ }
+ 
++uint32_t _TIFFClampDoubleToUInt32(double val)
++{
++    if( val < 0 )
++        return 0;
++    if( val > 0xFFFFFFFFU || val != val )
++        return 0xFFFFFFFFU;
++    return (uint32_t)val;
++}
++
+ int _TIFFSeekOK(TIFF* tif, toff_t off)
+ {
+     /* Huge offsets, especially -1 / UINT64_MAX, can cause issues */
+diff --git a/libtiff/tiffiop.h b/libtiff/tiffiop.h
+index f1151f5..c1d0276 100644
+--- a/libtiff/tiffiop.h
++++ b/libtiff/tiffiop.h
+@@ -368,6 +368,7 @@ extern double _TIFFUInt64ToDouble(uint64_t);
+ extern float _TIFFUInt64ToFloat(uint64_t);
+ 
+ extern float _TIFFClampDoubleToFloat(double);
++extern uint32_t _TIFFClampDoubleToUInt32(double);
+ 
+ extern tmsize_t
+ _TIFFReadEncodedStripAndAllocBuffer(TIFF* tif, uint32_t strip,
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index e407bf5..b9b13d8 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5182,17 +5182,17 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+       {
+       if ((crop->res_unit == RESUNIT_INCH) || (crop->res_unit == RESUNIT_CENTIMETER))
+         {
+-	x1 = (uint32_t) (crop->corners[i].X1 * scale * xres);
+-	x2 = (uint32_t) (crop->corners[i].X2 * scale * xres);
+-	y1 = (uint32_t) (crop->corners[i].Y1 * scale * yres);
+-	y2 = (uint32_t) (crop->corners[i].Y2 * scale * yres);
++	x1 = _TIFFClampDoubleToUInt32(crop->corners[i].X1 * scale * xres);
++	x2 = _TIFFClampDoubleToUInt32(crop->corners[i].X2 * scale * xres);
++	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1 * scale * yres);
++	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2 * scale * yres);
+         }
+       else
+         {
+-	x1 = (uint32_t) (crop->corners[i].X1);
+-	x2 = (uint32_t) (crop->corners[i].X2);
+-	y1 = (uint32_t) (crop->corners[i].Y1);
+-	y2 = (uint32_t) (crop->corners[i].Y2);
++	x1 = _TIFFClampDoubleToUInt32(crop->corners[i].X1);
++	x2 = _TIFFClampDoubleToUInt32(crop->corners[i].X2);
++	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
++	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+ 	}
+       if (x1 < 1)
+         crop->regionlist[i].x1 = 0;
+@@ -5255,17 +5255,17 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+     {
+     if (crop->res_unit != RESUNIT_INCH && crop->res_unit != RESUNIT_CENTIMETER)
+       { /* User has specified pixels as reference unit */
+-      tmargin = (uint32_t)(crop->margins[0]);
+-      lmargin = (uint32_t)(crop->margins[1]);
+-      bmargin = (uint32_t)(crop->margins[2]);
+-      rmargin = (uint32_t)(crop->margins[3]);
++      tmargin = _TIFFClampDoubleToUInt32(crop->margins[0]);
++      lmargin = _TIFFClampDoubleToUInt32(crop->margins[1]);
++      bmargin = _TIFFClampDoubleToUInt32(crop->margins[2]);
++      rmargin = _TIFFClampDoubleToUInt32(crop->margins[3]);
+       }
+     else
+       { /* inches or centimeters specified */
+-      tmargin = (uint32_t)(crop->margins[0] * scale * yres);
+-      lmargin = (uint32_t)(crop->margins[1] * scale * xres);
+-      bmargin = (uint32_t)(crop->margins[2] * scale * yres);
+-      rmargin = (uint32_t)(crop->margins[3] * scale * xres);
++      tmargin = _TIFFClampDoubleToUInt32(crop->margins[0] * scale * yres);
++      lmargin = _TIFFClampDoubleToUInt32(crop->margins[1] * scale * xres);
++      bmargin = _TIFFClampDoubleToUInt32(crop->margins[2] * scale * yres);
++      rmargin = _TIFFClampDoubleToUInt32(crop->margins[3] * scale * xres);
+       }
+ 
+     if ((lmargin + rmargin) > image->width)
+@@ -5295,24 +5295,24 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+   if (crop->res_unit != RESUNIT_INCH && crop->res_unit != RESUNIT_CENTIMETER)
+     {
+     if (crop->crop_mode & CROP_WIDTH)
+-      width = (uint32_t)crop->width;
++      width = _TIFFClampDoubleToUInt32(crop->width);
+     else
+       width = image->width - lmargin - rmargin;
+ 
+     if (crop->crop_mode & CROP_LENGTH)
+-      length  = (uint32_t)crop->length;
++      length  = _TIFFClampDoubleToUInt32(crop->length);
+     else
+       length = image->length - tmargin - bmargin;
+     }
+   else
+     {
+     if (crop->crop_mode & CROP_WIDTH)
+-      width = (uint32_t)(crop->width * scale * image->xres);
++      width = _TIFFClampDoubleToUInt32(crop->width * scale * image->xres);
+     else
+       width = image->width - lmargin - rmargin;
+ 
+     if (crop->crop_mode & CROP_LENGTH)
+-      length  = (uint32_t)(crop->length * scale * image->yres);
++      length  = _TIFFClampDoubleToUInt32(crop->length * scale * image->yres);
+     else
+       length = image->length - tmargin - bmargin;
+     }
+@@ -5711,13 +5711,13 @@ computeOutputPixelOffsets (struct crop_mask *crop, struct image_data *image,
+     {
+     if (page->res_unit == RESUNIT_INCH || page->res_unit == RESUNIT_CENTIMETER)
+       { /* inches or centimeters specified */
+-      hmargin = (uint32_t)(page->hmargin * scale * page->hres * ((image->bps + 7) / 8));
+-      vmargin = (uint32_t)(page->vmargin * scale * page->vres * ((image->bps + 7) / 8));
++      hmargin = _TIFFClampDoubleToUInt32(page->hmargin * scale * page->hres * ((image->bps + 7) / 8));
++      vmargin = _TIFFClampDoubleToUInt32(page->vmargin * scale * page->vres * ((image->bps + 7) / 8));
+       }
+     else
+       { /* Otherwise user has specified pixels as reference unit */
+-      hmargin = (uint32_t)(page->hmargin * scale * ((image->bps + 7) / 8));
+-      vmargin = (uint32_t)(page->vmargin * scale * ((image->bps + 7) / 8));
++      hmargin = _TIFFClampDoubleToUInt32(page->hmargin * scale * ((image->bps + 7) / 8));
++      vmargin = _TIFFClampDoubleToUInt32(page->vmargin * scale * ((image->bps + 7) / 8));
+       }
+ 
+     if ((hmargin * 2.0) > (pwidth * page->hres))
+@@ -5755,13 +5755,13 @@ computeOutputPixelOffsets (struct crop_mask *crop, struct image_data *image,
+     {
+     if (page->mode & PAGE_MODE_PAPERSIZE )
+       {
+-      owidth  = (uint32_t)((pwidth * page->hres) - (hmargin * 2));
+-      olength = (uint32_t)((plength * page->vres) - (vmargin * 2));
++      owidth  = _TIFFClampDoubleToUInt32((pwidth * page->hres) - (hmargin * 2));
++      olength = _TIFFClampDoubleToUInt32((plength * page->vres) - (vmargin * 2));
+       }
+     else
+       {
+-      owidth = (uint32_t)(iwidth - (hmargin * 2 * page->hres));
+-      olength = (uint32_t)(ilength - (vmargin * 2 * page->vres));
++      owidth = _TIFFClampDoubleToUInt32(iwidth - (hmargin * 2 * page->hres));
++      olength = _TIFFClampDoubleToUInt32(ilength - (vmargin * 2 * page->vres));
+       }
+     }
+ 
+@@ -5770,6 +5770,12 @@ computeOutputPixelOffsets (struct crop_mask *crop, struct image_data *image,
+   if (olength > ilength)
+     olength = ilength;
+ 
++  if (owidth == 0 || olength == 0)
++  {
++    TIFFError("computeOutputPixelOffsets", "Integer overflow when calculating the number of pages");
++    exit(EXIT_FAILURE);
++  }
++
+   /* Compute the number of pages required for Portrait or Landscape */
+   switch (page->orient)
+     {
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 7a5e4816a6..c2d4b35d49 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch \
            file://0005-fix-the-FPE-in-tiffcrop-393.patch \
            file://0006-fix-heap-buffer-overflow-in-tiffcp-278.patch \
+           file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


