Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16DBC7618A
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 11:59:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.4889.1679140750075052873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 04:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=W/f819Oi;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679140750; x=1710676750;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1JzPKVFhlYv+k9GdYQ/rMJ1IKpConyMAxdtvA9PajRI=;
  b=W/f819OiUgQX5kyWChEmpfqiLghFuJYNoX2rxUIPqvV/CEsjjLHFWv2y
   zjeTt3SS7rlx1k2c5P2pfynT9cGa/jTZ5Opwe6Ib6bjTSVuX+BYa9sFHn
   cwNZ8FHj79e4TL73VArP5gE1g39exPeCnxQ54NZ1eWXtKCA3R5NP5ApPi
   ski3ZQTrUP5PoxHAOC85rGtXdtAOTeU+OZUrA1wvOv8S5SStbmh8JKNy8
   H/PyRmcp4o5nQi8gA/UsUOk+nhbCl0kkb5soVifFcq2i5NvJMCNuNcF8P
   Ly8Ln9wyxKUlXGccfcT/XtFOqFeSur+tMoh78VDFOXuSvEjnQc/60Lt0m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339964106"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="339964106"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 04:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="1009965055"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="1009965055"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2023 04:59:09 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [langdale][patch 2/3] tiff: Fix CVE-2023-0795 CVE-2023-0796 CVE-2023-0797 CVE-2023-0798 CVE-2023-0799
Date: Sat, 18 Mar 2023 19:58:58 +0800
Message-Id: <20230318115859.3071237-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230318115859.3071237-1-chee.yang.lee@intel.com>
References: <20230318115859.3071237-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 11:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178786

From: Chee Yang Lee <chee.yang.lee@intel.com>

import patch from ubuntu to fix multiple CVEs
http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.4.0-4ubuntu3.3.debian.tar.xz

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
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
2.37.3


