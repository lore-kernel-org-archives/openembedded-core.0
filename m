Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062F8C04E69
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:12 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.77620.1690740066305741909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=b/SSVWS9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-686f94328a4so2015582b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740065; x=1691344865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEYqR8Cxfh0E+sPBHwlP0qs772eIWv1h1bXip3dwbN8=;
        b=b/SSVWS9SXgLJzDvfHB82U2H6NOQ0+CW3BztkNfL1zmyPtkuBXrgRBDf9LXLnfI+pQ
         c8rtG/rxIPyrEkzbkP7F3gGL9yhYfQFxdAraW8OV8rSgSGUOG1VpBh6J9OJZ0ixv9OMj
         OFxN4nKe7uwqheCjLhVIh9TTTKJmWJGWihBT0e+9546114L/YsoLDM77DDBVABHWnAs4
         f6WwLXdamRghqofzT8wkCjT2gEH+qn7UlBxnWdHIVf8G/0zDUpTVe4tVEtuGgFdze8pL
         XGQpzTsY2GQ8MPzrw9OeXrNPR7JS3x++Q1Ebw02PkI94FQLai6AekZdDdMnd/ZppT2SH
         V3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740065; x=1691344865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEYqR8Cxfh0E+sPBHwlP0qs772eIWv1h1bXip3dwbN8=;
        b=EU1aBP5saU8ru4tmo4j7Orkjki2kHLQt5PSyNeOJDPx3VDaC3rGh0Z2K26vuI/JQBQ
         BZzoV5bonsIgdpHCtVlqeKgq0fsxhge0c9vgWCrINoMm77NtQIixwrpVRT3+hoh4UWbt
         OmnPGwacB2A8iMn9LiY2eM447ouEog4fwRmWnbUkjsWC7io2Pz/tCSNWVDYrkAruldQ4
         aJgxlrHzN3vwNrShDn/VBY6dcSG+Za72mLcd5cred1OOCgYcDRrhW1V9KmFcO8sInkFR
         jiQSBcwe4MBjSIW1CRwvLIAONlERzxadkqWOyNilmRBruobeobmWj1lw5LoGJ7jZ8pxj
         uXJw==
X-Gm-Message-State: ABy/qLbJvwVq1AplaIe5WRWeuNwxrZxoJOrjUeanXpYA7RVJ6ddWancP
	dzn3iJ6k5uyHnFbg3ZRAaS2lcQ9AYDxWG2UK2pxoPQ==
X-Google-Smtp-Source: APBJJlGjE3419Iu50PJL2iwgTIFsiAsj894wToMhcpLCKSCsSeqKvwDHZD8ovxkjE2Tubexr1wamHw==
X-Received: by 2002:a05:6a00:39a7:b0:666:c1ab:d6e5 with SMTP id fi39-20020a056a0039a700b00666c1abd6e5mr8081635pfb.16.1690740065308;
        Sun, 30 Jul 2023 11:01:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/30] tiff: fix multiple CVEs
Date: Sun, 30 Jul 2023 08:00:26 -1000
Message-Id: <1a4e54d5b7b4d26b9fcdc2be1b115600ca71c9ea.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185081

From: Hitendra Prajapati <hprajapati@mvista.com>

Bug-Debian: https://bugs.debian.org/1031632
Origin: https://gitlab.com/libtiff/libtiff/-/commit/afaabc3e50d4e5d80a94143f7e3c997e7e410f68

import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz

fix multiple CVEs:

CVE-2023-0795
CVE-2023-0796
CVE-2023-0797
CVE-2023-0798
CVE-2023-0799

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2023-0795_0796_0797_0798_0799.patch   | 162 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-0795_0796_0797_0798_0799.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-0795_0796_0797_0798_0799.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-0795_0796_0797_0798_0799.patch
new file mode 100644
index 0000000000..498d5ec8ab
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-0795_0796_0797_0798_0799.patch
@@ -0,0 +1,162 @@
+From 7808740e100ba30ffb791044f3b14dec3e85ed6f Mon Sep 17 00:00:00 2001
+From: Markus Koschany <apo@debian.org>
+Date: Tue, 21 Feb 2023 14:26:43 +0100
+Subject: [PATCH] CVE-2023-0795
+
+This is also the fix for CVE-2023-0796, CVE-2023-0797, CVE-2023-0798,
+CVE-2023-0799.
+
+Bug-Debian: https://bugs.debian.org/1031632
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/afaabc3e50d4e5d80a94143f7e3c997e7e410f68
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
+CVE: CVE-2023-0795 CVE-2023-0796 CVE-2023-0797 CVE-2023-0798 CVE-2023-0799
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 51 ++++++++++++++++++++++++++++--------------------
+ 1 file changed, 30 insertions(+), 21 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index adf0f84..deba170 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -269,7 +269,6 @@ struct  region {
+   uint32_t width;     /* width in pixels */
+   uint32_t length;    /* length in pixels */
+   uint32_t buffsize;  /* size of buffer needed to hold the cropped region */
+-  unsigned char *buffptr; /* address of start of the region */
+ };
+ 
+ /* Cropping parameters from command line and image data 
+@@ -524,7 +523,7 @@ static int rotateContigSamples24bits(uint16_t, uint16_t, uint16_t, uint32_t,
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
+@@ -6511,8 +6509,13 @@ static int  correct_orientation(struct image_data *image, unsigned char **work_b
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
+@@ -6580,7 +6583,6 @@ extractCompositeRegions(struct image_data *image,  struct crop_mask *crop,
+     /* These should not be needed for composite images */
+     crop->regionlist[i].width = crop_width;
+     crop->regionlist[i].length = crop_length;
+-    crop->regionlist[i].buffptr = crop_buff;
+ 
+     src_rowsize = ((img_width * bps * spp) + 7) / 8;
+     dst_rowsize = (((crop_width * bps * count) + 7) / 8);
+@@ -6817,7 +6819,6 @@ extractSeparateRegion(struct image_data *image,  struct crop_mask *crop,
+ 
+   crop->regionlist[region].width = crop_width;
+   crop->regionlist[region].length = crop_length;
+-  crop->regionlist[region].buffptr = crop_buff;
+ 
+   src = read_buff;
+   dst = crop_buff;
+@@ -7695,7 +7696,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+     if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+       {
+       if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                      &crop->combined_length, &crop_buff))
++                      &crop->combined_length, &crop_buff, FALSE))
+         {
+         TIFFError("processCropSelections", 
+                   "Failed to rotate composite regions by %"PRIu32" degrees", crop->rotation);
+@@ -7805,7 +7806,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+            * ToDo: Therefore rotateImage() and its usage has to be reworked (e.g. like mirrorImage()) !!
+            */
+ 	if (rotateImage(crop->rotation, image, &crop->regionlist[i].width, 
+-			&crop->regionlist[i].length, &crop_buff))
++			&crop->regionlist[i].length, &crop_buff, FALSE))
+           {
+           TIFFError("processCropSelections", 
+                     "Failed to rotate crop region by %"PRIu16" degrees", crop->rotation);
+@@ -7937,7 +7938,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+     {
+     if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                    &crop->combined_length, crop_buff_ptr))
++                    &crop->combined_length, crop_buff_ptr, TRUE))
+       {
+       TIFFError("createCroppedImage", 
+                 "Failed to rotate image or cropped selection by %"PRIu16" degrees", crop->rotation);
+@@ -8600,7 +8601,7 @@ rotateContigSamples32bits(uint16_t rotation, uint16_t spp, uint16_t bps, uint32_
+ /* Rotate an image by a multiple of 90 degrees clockwise */
+ static int
+ rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_width,
+-            uint32_t *img_length, unsigned char **ibuff_ptr)
++            uint32_t *img_length, unsigned char **ibuff_ptr, int rot_image_params)
+   {
+   int      shift_width;
+   uint32_t   bytes_per_pixel, bytes_per_sample;
+@@ -8791,11 +8792,15 @@ rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_width,
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
+@@ -8868,11 +8873,15 @@ rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_width,
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 4bd485a10a..2be25756bc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch \
            file://CVE-2022-48281.patch \
            file://CVE-2023-0800_0801_0802_0803_0804.patch \
+           file://CVE-2023-0795_0796_0797_0798_0799.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


