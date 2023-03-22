Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1086EC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:04 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.44000.1679494914130341136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fE2za4Qx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so19324296pjz.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LotRX52dD3jg+R7OeJHqocei05o0si0hkzxoLLF30wo=;
        b=fE2za4QxO4RuOB3Js7NGfPsqd4h/6F3MBGzZ0xhr9Oq1RxALhm5o6n+YmjacFgkRDu
         PUof9A9dbsZSB++ICfcMM4OJ01aXQkyvaV/LAi9/iAWhtKZs21HSMxIFL1O26kPHRt1s
         aorI0iN/LW/vwBC8Y5VDHsCk0K9mhvPqVP/DvDeOoFIhjFsec2Y42DKqKw69Z7Eoboij
         rA/Pq0lAvoA3uvJmpqNwGjOm84wPQSFBc/RU++CgzqiOO43QAGblj9enGjqr3YL6f4oL
         xgEXeBN+bnWQnee/6ggQw/kypTDeRQ40eKZo+qYzL3WsNQXS6XCYCBSML5WwaPCfvcv2
         67dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LotRX52dD3jg+R7OeJHqocei05o0si0hkzxoLLF30wo=;
        b=yWh5N6jd3ro7/FuWgWMmP8mqLt+BPdq8Ad/m6gaFXPQo9wPTsVEsz2BfFAm3tGrAig
         2P/8OCz8EnPgssqoz63GKCuTwTSGOkdwpBSuSy5ErkYlHD910WbQLaEwBXzYUrIIfcRw
         +BM3/HqOD5LMDANqvVTE6cpm2lD1COe0lDgbXLVsViMPTzOTR+Z40NkbTWQfbd+jMRh9
         V5Y6TLQqw4OFrJvQ8RBz1uNtpU0ZXNXGzXRAtNITdQ+v7O2CtU6RMMMzHvm4twhDvs10
         Kqu1U2ol/se4ZWzgIkSaWgKm5rWyoEnnRNowqk7EjkuB32BZZppxZJXntetFm3j1Y8Hc
         LnFA==
X-Gm-Message-State: AO0yUKW29Bw3ufKVz8EZqRmXgSXB7y5MVzHB/OLGRUj4QXH8uTgPl3G7
	AS03Hk5p4TrUc+X7FY7Q7yEFDgR/WoHiP7lIaZM=
X-Google-Smtp-Source: AK7set/A/JsF+YO259wlUepjkBd8hPMj6RNXratNKH3h2zSd3K14a1t69q8M19z9hNybmLpLxra8yw==
X-Received: by 2002:a05:6a20:4904:b0:d6:f3dd:5a88 with SMTP id ft4-20020a056a20490400b000d6f3dd5a88mr4859080pzb.5.1679494913026;
        Wed, 22 Mar 2023 07:21:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.21.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:21:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/21] tiff: Fix CVE-2023-0795 CVE-2023-0796 CVE-2023-0797 CVE-2023-0798 CVE-2023-0799
Date: Wed, 22 Mar 2023 04:21:21 -1000
Message-Id: <7634c800819f23f0cb1676bf46efca19e9176df1.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178927

From: Chee Yang Lee <chee.yang.lee@intel.com>

import patch from ubuntu to fix multiple CVEs
http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.4.0-4ubuntu3.3.debian.tar.xz

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2023-0795_0796_0797_0798_0799.patch   | 154 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   1 +
 2 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch
new file mode 100644
index 0000000000..926df680b3
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch
@@ -0,0 +1,154 @@
+From: Markus Koschany <apo@debian.org>
+Date: Tue, 21 Feb 2023 14:26:43 +0100
+Subject: CVE-2023-0795
+
+This is also the fix for CVE-2023-0796, CVE-2023-0797, CVE-2023-0798,
+CVE-2023-0799.
+
+Bug-Debian: https://bugs.debian.org/1031632
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/afaabc3e50d4e5d80a94143f7e3c997e7e410f68
+
+CVE: CVE-2023-0795 CVE-2023-0796 CVE-2023-0797 CVE-2023-0798 CVE-2023-0799
+Upstream-Status: Backport [import from ubuntu debian/patches/CVE-2023-0795.patch http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.4.0-4ubuntu3.3.debian.tar.xz ]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiffcrop.c | 51 ++++++++++++++++++++++++++++++---------------------
+ 1 file changed, 30 insertions(+), 21 deletions(-)
+
+--- tiff-4.4.0.orig/tools/tiffcrop.c
++++ tiff-4.4.0/tools/tiffcrop.c
+@@ -269,7 +269,6 @@ struct  region {
+   uint32_t width;     /* width in pixels */
+   uint32_t length;    /* length in pixels */
+   uint32_t buffsize;  /* size of buffer needed to hold the cropped region */
+-  unsigned char *buffptr; /* address of start of the region */
+ };
+ 
+ /* Cropping parameters from command line and image data 
+@@ -524,7 +523,7 @@ static int rotateContigSamples24bits(uin
+ static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t, uint32_t,
+                                      uint32_t, uint32_t, uint8_t *, uint8_t *);
+ static int rotateImage(uint16_t, struct image_data *, uint32_t *, uint32_t *,
+-                       unsigned char **);
++                       unsigned char **, int);
+ static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
+                        unsigned char *);
+ static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
+@@ -5219,7 +5218,6 @@ initCropMasks (struct crop_mask *cps)
+      cps->regionlist[i].width = 0;
+      cps->regionlist[i].length = 0;
+      cps->regionlist[i].buffsize = 0;
+-     cps->regionlist[i].buffptr = NULL;
+      cps->zonelist[i].position = 0;
+      cps->zonelist[i].total = 0;
+      }
+@@ -6551,8 +6549,13 @@ static int  correct_orientation(struct i
+                  (uint16_t) (image->adjustments & ROTATE_ANY));
+       return (-1);
+       }
+- 
+-    if (rotateImage(rotation, image, &image->width, &image->length, work_buff_ptr))
++
++      /* Dummy variable in order not to switch two times the
++       * image->width,->length within rotateImage(),
++       * but switch xres, yres there. */
++      uint32_t width = image->width;
++      uint32_t length = image->length;
++      if (rotateImage(rotation, image, &width, &length, work_buff_ptr, TRUE))
+       {
+       TIFFError ("correct_orientation", "Unable to rotate image");
+       return (-1);
+@@ -6661,7 +6664,6 @@ extractCompositeRegions(struct image_dat
+     /* These should not be needed for composite images */
+     crop->regionlist[i].width = crop_width;
+     crop->regionlist[i].length = crop_length;
+-    crop->regionlist[i].buffptr = crop_buff;
+ 
+     src_rowsize = ((img_width * bps * spp) + 7) / 8;
+     dst_rowsize = (((crop_width * bps * count) + 7) / 8);
+@@ -6900,7 +6902,6 @@ extractSeparateRegion(struct image_data
+ 
+   crop->regionlist[region].width = crop_width;
+   crop->regionlist[region].length = crop_length;
+-  crop->regionlist[region].buffptr = crop_buff;
+ 
+   src = read_buff;
+   dst = crop_buff;
+@@ -7778,7 +7779,7 @@ processCropSelections(struct image_data
+     if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+       {
+       if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                      &crop->combined_length, &crop_buff))
++                      &crop->combined_length, &crop_buff, FALSE))
+         {
+         TIFFError("processCropSelections", 
+                   "Failed to rotate composite regions by %"PRIu32" degrees", crop->rotation);
+@@ -7888,7 +7889,7 @@ processCropSelections(struct image_data
+            * ToDo: Therefore rotateImage() and its usage has to be reworked (e.g. like mirrorImage()) !!
+            */
+ 	if (rotateImage(crop->rotation, image, &crop->regionlist[i].width, 
+-			&crop->regionlist[i].length, &crop_buff))
++			&crop->regionlist[i].length, &crop_buff, FALSE))
+           {
+           TIFFError("processCropSelections", 
+                     "Failed to rotate crop region by %"PRIu16" degrees", crop->rotation);
+@@ -8020,7 +8021,7 @@ createCroppedImage(struct image_data *im
+   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+     {
+     if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                    &crop->combined_length, crop_buff_ptr))
++                    &crop->combined_length, crop_buff_ptr, TRUE))
+       {
+       TIFFError("createCroppedImage", 
+                 "Failed to rotate image or cropped selection by %"PRIu16" degrees", crop->rotation);
+@@ -8683,7 +8684,7 @@ rotateContigSamples32bits(uint16_t rotat
+ /* Rotate an image by a multiple of 90 degrees clockwise */
+ static int
+ rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_width,
+-            uint32_t *img_length, unsigned char **ibuff_ptr)
++            uint32_t *img_length, unsigned char **ibuff_ptr, int rot_image_params)
+   {
+   int      shift_width;
+   uint32_t   bytes_per_pixel, bytes_per_sample;
+@@ -8874,11 +8875,15 @@ rotateImage(uint16_t rotation, struct im
+ 
+               *img_width = length;
+               *img_length = width;
+-              image->width = length;
+-              image->length = width;
+-              res_temp = image->xres;
+-              image->xres = image->yres;
+-              image->yres = res_temp;
++            /* Only toggle image parameters if whole input image is rotated. */
++            if (rot_image_params)
++            {
++                image->width = length;
++                image->length = width;
++                res_temp = image->xres;
++                image->xres = image->yres;
++                image->yres = res_temp;
++            }
+ 	      break;
+ 
+     case 270: if ((bps % 8) == 0) /* byte aligned data */
+@@ -8951,11 +8956,15 @@ rotateImage(uint16_t rotation, struct im
+ 
+               *img_width = length;
+               *img_length = width;
+-              image->width = length;
+-              image->length = width;
+-              res_temp = image->xres;
+-              image->xres = image->yres;
+-              image->yres = res_temp;
++            /* Only toggle image parameters if whole input image is rotated. */
++            if (rot_image_params)
++            {
++                image->width = length;
++                image->length = width;
++                res_temp = image->xres;
++                image->xres = image->yres;
++                image->yres = res_temp;
++            }
+               break;
+     default:
+               break;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 3b42dbe4a5..9df3c5a015 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch \
            file://CVE-2022-48281.patch \
            file://CVE-2023-0800_0801_0802_0803_0804.patch \
+           file://CVE-2023-0795_0796_0797_0798_0799.patch \
            "
 
 SRC_URI[sha256sum] = "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed"
-- 
2.34.1


