Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D588EB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 06:23:52 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.14648.1690266227196141276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 23:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e7qrRLo0;
 spf=pass (domain: mvista.com, ip: 209.85.167.170, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a36b309524so3899139b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 23:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690266226; x=1690871026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1rxhj7UL9ldLxAPKK6Wjeqq4UgGizuGhaZHsCq9Af0=;
        b=e7qrRLo0FUGWkovwsfQrG1N50qqJtopt0TYxMltIbvOf/5XapGen1Xg/RXMBXY69UL
         IGbDm7ezY8hEicITfSwLA+jMXscH5SqL65M6pQI+Kr5zP4vIe3FhHNbSEyWzf8D6UlCf
         mD0y6vqubRhuBlM0cn0YgbBUyuVczzfCKdUQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690266226; x=1690871026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1rxhj7UL9ldLxAPKK6Wjeqq4UgGizuGhaZHsCq9Af0=;
        b=jGyA2c2im/YHIpYBYfBdHIeXS/Ij713K+kWnY3xoiF1xr9petXPU8kwblns/wXMQwa
         Ffli1jpIypiKnOL8mKvWzghkTTNwQNhC5SfCkZcqPybHSpPr+J+THIpBc/DdbwU4ShBm
         KDDpd5AjIOS6wLcNOgYFtISYyLZOILiaeeS2a6FpC4E2p4FLIxx7uAD7wlBRMxLRWMNz
         yfyrIK8H1rYlvnxo60JSwYOG2RUG2bhsAZ/Y1SLB+8DSbq8/2yWW5l35W70/1etsnFpY
         KPzuetBGwqDlljnQ0nsbB+q+10wlCMic7VakU+P3fFHQWs1GtzKzUil5wVHbPahKgOUi
         Ilng==
X-Gm-Message-State: ABy/qLZ9rPWkJVrg1cWGDVcoaOg4mtJPgoOhj3cgAn+nuKkvO5aW0rau
	6keyOUsU726t2Hd0jvBETm8c4RfgC/tPacR0FFi6sQ==
X-Google-Smtp-Source: APBJJlE+s1fgFp/ahgJ68D0hLzPQ3vUHac38lfN2ULHyjkCuMC1arAmbCp3fGaKW2ICsLOKuUNZsfw==
X-Received: by 2002:a05:6808:1292:b0:3a3:61df:da with SMTP id a18-20020a056808129200b003a361df00damr15072323oiw.53.1690266226201;
        Mon, 24 Jul 2023 23:23:46 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.172])
        by smtp.gmail.com with ESMTPSA id n1-20020a17090a670100b002630bfd35b0sm9005278pjj.7.2023.07.24.23.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 23:23:45 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 25 Jul 2023 11:53:40 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] tiff: fix multiple CVEs
Date: Tue, 25 Jul 2023 11:53:38 +0530
Message-Id: <20230725062338.41007-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 06:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184822

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
2.25.1


