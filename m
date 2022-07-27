Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30471C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 08:16:39 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.17500.1658909789990793950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 01:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fNQuRmrw;
 spf=pass (domain: mvista.com, ip: 209.85.210.180,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id y9so15447417pff.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 01:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AyZSBXalUH0CH7nUy7B+/lVJkWN2y1xIS/1qrwQOGOQ=;
        b=fNQuRmrweOoVE8UTP8spfnT7Uo5jq3nFdCOEaGaAaWIgZMX8D1HzV5LBhqYH+cWbkj
         Aet9+QKAcVvgv0m999Qc+d8axghBYtaI3GxVNwLbXrojzpHquKJI5zlge2HavmVT0gHj
         C8bYt+z3KMpBi34fWxiHndtEG9lbw2kIDy/eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AyZSBXalUH0CH7nUy7B+/lVJkWN2y1xIS/1qrwQOGOQ=;
        b=2VSVJ6h3B4Ffnv29tQsEA93bGRIc1xMNRakFTobQfzrKnJVpPcolMe5rHOgTO29oQA
         pFo5q1iyJiR9inIq+cnTzOhQz+YWO74+7pX2ULCYZgYjuLyDlo/Q3W1jP7QVKOMuSxLL
         asXUJF/mcgkCqqZ1zb3SRtSeJ5L+YMFwq2kcwH926WgoEg2wsLqhauED9ABnzZ4ka0a4
         8pgnaiLdypB3ba/xDKZNCbPmrcrzyBHsNzUPOVd5TKAZ2XAl0hKZzO04Mr9BUzNvs/bD
         enXkpKIW8p6JzF0NKfEa5myk8XIV85WDkeJ1owf/oFnnNq4MyP339REIizaT6dBbEBxo
         JT2A==
X-Gm-Message-State: AJIora+PtlRR2cW9LGbkaZTJHGcLQwZLfUd8nJZx28nQSYbxX8XJTSs6
	h4tuoPN5DQrbb4ixMONQkfpndghbqFDzhA==
X-Google-Smtp-Source: 
 AGRyM1sJm9m9xFwIXmiEVUU6PMPrBStYJ7OBxi8kGllcgWHIev1YbRNmsPWTvLmUj2/gRFHe0vfhIg==
X-Received: by 2002:a63:5d0e:0:b0:41a:ea25:a479 with SMTP id
 r14-20020a635d0e000000b0041aea25a479mr12630632pgb.318.1658909788549;
        Wed, 27 Jul 2022 01:16:28 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.158])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a170902e88100b0016c433f7c12sm13178667plg.271.2022.07.27.01.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 01:16:28 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 13:46:03 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] libTiff: CVE-2022-2056 CVE-2022-2057 CVE-2022-2058
 DoS from Divide By Zero Error
Date: Wed, 27 Jul 2022 13:46:02 +0530
Message-Id: <20220727081602.273375-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 08:16:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168548

Source: https://gitlab.com/libtiff/libtiff
MR: 119341
Type: Security Fix
Disposition: Backport from https://gitlab.com/libtiff/libtiff/-/commit/dd1bcc7abb26094e93636e85520f0d8f81ab0fab
ChangeID: 6cea4937a34a618567a42cef8c41961ade2f3a07
Description:
        CVE-2022-2056 CVE-2022-2057 CVE-2022-2058 libTiff: DoS from Divide By Zero Error.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 ...022-2056-CVE-2022-2057-CVE-2022-2058.patch | 183 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch
new file mode 100644
index 0000000000..01e81349a2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch
@@ -0,0 +1,183 @@
+From 8261237113a53cd21029c4a8cbb62c47b4c19523 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 27 Jul 2022 11:30:18 +0530
+Subject: [PATCH] CVE-2022-2056 CVE-2022-2057 CVE-2022-2058
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/dd1bcc7abb26094e93636e85520f0d8f81ab0fab]
+CVE: CVE-2022-2056 CVE-2022-2057 CVE-2022-2058
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtiff/tif_aux.c |  9 +++++++
+ libtiff/tiffiop.h |  1 +
+ tools/tiffcrop.c  | 62 ++++++++++++++++++++++++++---------------------
+ 3 files changed, 44 insertions(+), 28 deletions(-)
+
+diff --git a/libtiff/tif_aux.c b/libtiff/tif_aux.c
+index 8188db5..3dac542 100644
+--- a/libtiff/tif_aux.c
++++ b/libtiff/tif_aux.c
+@@ -402,6 +402,15 @@ float _TIFFClampDoubleToFloat( double val )
+     return (float)val;
+ }
+ 
++uint32 _TIFFClampDoubleToUInt32(double val)
++{
++    if( val < 0 )
++        return 0;
++    if( val > 0xFFFFFFFFU || val != val )
++        return 0xFFFFFFFFU;
++    return (uint32)val;
++}
++
+ int _TIFFSeekOK(TIFF* tif, toff_t off)
+ {
+     /* Huge offsets, especially -1 / UINT64_MAX, can cause issues */
+diff --git a/libtiff/tiffiop.h b/libtiff/tiffiop.h
+index 45a7932..c6f6f93 100644
+--- a/libtiff/tiffiop.h
++++ b/libtiff/tiffiop.h
+@@ -393,6 +393,7 @@ extern double _TIFFUInt64ToDouble(uint64);
+ extern float _TIFFUInt64ToFloat(uint64);
+ 
+ extern float _TIFFClampDoubleToFloat(double);
++extern uint32 _TIFFClampDoubleToUInt32(double);
+ 
+ extern tmsize_t
+ _TIFFReadEncodedStripAndAllocBuffer(TIFF* tif, uint32 strip,
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index c2c2052..79dd0a0 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5141,17 +5141,17 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+       {
+       if ((crop->res_unit == RESUNIT_INCH) || (crop->res_unit == RESUNIT_CENTIMETER))
+         {
+-	x1 = (uint32) (crop->corners[i].X1 * scale * xres);
+-	x2 = (uint32) (crop->corners[i].X2 * scale * xres);
+-	y1 = (uint32) (crop->corners[i].Y1 * scale * yres);
+-	y2 = (uint32) (crop->corners[i].Y2 * scale * yres);
++	x1 = _TIFFClampDoubleToUInt32(crop->corners[i].X1 * scale * xres);
++	x2 = _TIFFClampDoubleToUInt32(crop->corners[i].X2 * scale * xres);
++	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1 * scale * yres);
++	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2 * scale * yres);
+         }
+       else
+         {
+-	x1 = (uint32) (crop->corners[i].X1);
+-	x2 = (uint32) (crop->corners[i].X2);
+-	y1 = (uint32) (crop->corners[i].Y1);
+-	y2 = (uint32) (crop->corners[i].Y2);       
++	x1 = _TIFFClampDoubleToUInt32(crop->corners[i].X1);
++	x2 = _TIFFClampDoubleToUInt32(crop->corners[i].X2);
++	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
++	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+ 	}
+       if (x1 < 1)
+         crop->regionlist[i].x1 = 0;
+@@ -5214,17 +5214,17 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+     {
+     if (crop->res_unit != RESUNIT_INCH && crop->res_unit != RESUNIT_CENTIMETER)
+       { /* User has specified pixels as reference unit */
+-      tmargin = (uint32)(crop->margins[0]);
+-      lmargin = (uint32)(crop->margins[1]);
+-      bmargin = (uint32)(crop->margins[2]);
+-      rmargin = (uint32)(crop->margins[3]);
++      tmargin = _TIFFClampDoubleToUInt32(crop->margins[0]);
++      lmargin = _TIFFClampDoubleToUInt32(crop->margins[1]);
++      bmargin = _TIFFClampDoubleToUInt32(crop->margins[2]);
++      rmargin = _TIFFClampDoubleToUInt32(crop->margins[3]);
+       }
+     else
+       { /* inches or centimeters specified */
+-      tmargin = (uint32)(crop->margins[0] * scale * yres);
+-      lmargin = (uint32)(crop->margins[1] * scale * xres);
+-      bmargin = (uint32)(crop->margins[2] * scale * yres);
+-      rmargin = (uint32)(crop->margins[3] * scale * xres);
++      tmargin = _TIFFClampDoubleToUInt32(crop->margins[0] * scale * yres);
++      lmargin = _TIFFClampDoubleToUInt32(crop->margins[1] * scale * xres);
++      bmargin = _TIFFClampDoubleToUInt32(crop->margins[2] * scale * yres);
++      rmargin = _TIFFClampDoubleToUInt32(crop->margins[3] * scale * xres);
+       }
+ 
+     if ((lmargin + rmargin) > image->width)
+@@ -5254,24 +5254,24 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+   if (crop->res_unit != RESUNIT_INCH && crop->res_unit != RESUNIT_CENTIMETER)
+     {
+     if (crop->crop_mode & CROP_WIDTH)
+-      width = (uint32)crop->width;
++      width = _TIFFClampDoubleToUInt32(crop->width);
+     else
+       width = image->width - lmargin - rmargin;
+ 
+     if (crop->crop_mode & CROP_LENGTH)
+-      length  = (uint32)crop->length;
++      length  = _TIFFClampDoubleToUInt32(crop->length);
+     else
+       length = image->length - tmargin - bmargin;
+     }
+   else
+     {
+     if (crop->crop_mode & CROP_WIDTH)
+-      width = (uint32)(crop->width * scale * image->xres);
++      width = _TIFFClampDoubleToUInt32(crop->width * scale * image->xres);
+     else
+       width = image->width - lmargin - rmargin;
+ 
+     if (crop->crop_mode & CROP_LENGTH)
+-      length  = (uint32)(crop->length * scale * image->yres);
++      length  = _TIFFClampDoubleToUInt32(crop->length * scale * image->yres);
+     else
+       length = image->length - tmargin - bmargin;
+     }
+@@ -5670,13 +5670,13 @@ computeOutputPixelOffsets (struct crop_mask *crop, struct image_data *image,
+     {
+     if (page->res_unit == RESUNIT_INCH || page->res_unit == RESUNIT_CENTIMETER)
+       { /* inches or centimeters specified */
+-      hmargin = (uint32)(page->hmargin * scale * page->hres * ((image->bps + 7)/ 8));
+-      vmargin = (uint32)(page->vmargin * scale * page->vres * ((image->bps + 7)/ 8));
++      hmargin = _TIFFClampDoubleToUInt32(page->hmargin * scale * page->hres * ((image->bps + 7) / 8));
++      vmargin = _TIFFClampDoubleToUInt32(page->vmargin * scale * page->vres * ((image->bps + 7) / 8));
+       }
+     else
+       { /* Otherwise user has specified pixels as reference unit */
+-      hmargin = (uint32)(page->hmargin * scale * ((image->bps + 7)/ 8));
+-      vmargin = (uint32)(page->vmargin * scale * ((image->bps + 7)/ 8));
++      hmargin = _TIFFClampDoubleToUInt32(page->hmargin * scale * ((image->bps + 7) / 8));
++      vmargin = _TIFFClampDoubleToUInt32(page->vmargin * scale * ((image->bps + 7) / 8));
+       }
+ 
+     if ((hmargin * 2.0) > (pwidth * page->hres))
+@@ -5714,13 +5714,13 @@ computeOutputPixelOffsets (struct crop_mask *crop, struct image_data *image,
+     {
+     if (page->mode & PAGE_MODE_PAPERSIZE )
+       {
+-      owidth  = (uint32)((pwidth * page->hres) - (hmargin * 2));
+-      olength = (uint32)((plength * page->vres) - (vmargin * 2));
++      owidth  = _TIFFClampDoubleToUInt32((pwidth * page->hres) - (hmargin * 2));
++      olength = _TIFFClampDoubleToUInt32((plength * page->vres) - (vmargin * 2));
+       }
+     else
+       {
+-      owidth = (uint32)(iwidth - (hmargin * 2 * page->hres));
+-      olength = (uint32)(ilength - (vmargin * 2 * page->vres));
++      owidth = _TIFFClampDoubleToUInt32(iwidth - (hmargin * 2 * page->hres));
++      olength = _TIFFClampDoubleToUInt32(ilength - (vmargin * 2 * page->vres));
+       }
+     }
+ 
+@@ -5729,6 +5729,12 @@ computeOutputPixelOffsets (struct crop_mask *crop, struct image_data *image,
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 75bc20de78..4383f7af8e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-0909.patch \
            file://CVE-2022-0891.patch \
            file://CVE-2022-0924.patch \
+           file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


