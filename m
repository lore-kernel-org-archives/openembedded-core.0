Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC990C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:11 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.78383.1690740070059140643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yz6V9lPw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so2197573b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740069; x=1691344869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3jZ0edb1tjTbLYl7+tlDHgwnn+2pEUsF0yYivBULuY=;
        b=yz6V9lPw1PZOrGw/o4ew7GeJSCFs8iR5xER1UBBVy4wNjHOXJmpKpOnSmrTXewfNAn
         kPzE7tTcRxaIuWCk/Wu29H7o/IXIznVVP0GKDXD2zEY5l2jpNJUg6bXuP0MvD5KQa3iR
         gihrJ/LJuAFst9wtVv4l3tHrYJnC4pn5b6+AP1AuDGXZrj81QjdHWngcbwv1Bm33qmSI
         broDcsXfSv82P2tzPiSYfeu4esUJAWZDS2AC05WD+tIlyxgIJvTcIzqkTSCensxcwItr
         Jjp1ty3Oc56UqJGyI68OK/1Uzr/VrlnrKYNXW+hBfkr9Xkkuf07sp0gvAtc8hslGLu1t
         LmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740069; x=1691344869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3jZ0edb1tjTbLYl7+tlDHgwnn+2pEUsF0yYivBULuY=;
        b=edA57qWt7UBCPBXstN/PwvMN2C+KQdcBqljH76JDAACm27iTifstOQ4nmRL3u+WvDT
         C5n4J+nq0W4HHPCwPw6GSecZofXAMR8jMo51mH54X/1pM9P6z0MF99pUI30N2hIJzckE
         47SzAIeuC9BlF4fGBOr7A4zARLaYQ5gRrRquAm+WX16r2LoKzvwPyROTf+C+xgwI4WkG
         tTh+yLmRKOa2ijXUvPZMenwMZSsC8QKs+d+u1f/qPeOv2d75W5OLrAVTJ944rAqz7E5J
         Z8NWMmth7JZ4Y/dIBVjgp8r4g3t+LS//NKWSbbG8DJRUT4G+xsT8Uk1ZEWlLEby5Pguo
         wINw==
X-Gm-Message-State: ABy/qLbOMuZVzUlSnginfAo9v7oXDLbomThpeL+yhakXqSnm6OTN9k45
	ZQ1tM1fVNwg0lmDgvwFm/SsyC0xFXubeXhXLWLxDFg==
X-Google-Smtp-Source: APBJJlEMnYAONIBZDgKq9CXkIh7W8TwY1Zs7E86sKlIVH4foA5QX+JGswVubqJp26VqtUH6+6JXRug==
X-Received: by 2002:a05:6a20:9151:b0:13b:9cf1:a779 with SMTP id x17-20020a056a20915100b0013b9cf1a779mr9630277pzc.37.1690740068832;
        Sun, 30 Jul 2023 11:01:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/30] tiff: fix multiple CVEs
Date: Sun, 30 Jul 2023 08:00:28 -1000
Message-Id: <01b9f7f7bb3eaecd6aa757fa090fcc4424788ce1.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185083

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:
* CVE-2023-25433 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/9c22495e5eeeae9e00a1596720c969656bb8d678 && https://gitlab.com/libtiff/libtiff/-/commit/688012dca2c39033aa2dc7bcea9796787cfd1b44
* CVE-2023-25434 & CVE-2023-25435 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c3706b849c38

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2023-25433.patch         | 195 ++++++++++++++++++
 .../tiff/CVE-2023-25434-CVE-2023-25435.patch  |  94 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 3 files changed, 291 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch
new file mode 100644
index 0000000000..285aa3d1c4
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch
@@ -0,0 +1,195 @@
+From 9c22495e5eeeae9e00a1596720c969656bb8d678 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 3 Feb 2023 15:31:31 +0100
+Subject: [PATCH] CVE-2023-25433
+
+tiffcrop correctly update buffersize after rotateImage()
+fix#520 rotateImage() set up a new buffer and calculates its size
+individually. Therefore, seg_buffs[] size needs to be updated accordingly.
+Before this fix, the seg_buffs buffer size was calculated with a different
+formula than within rotateImage().
+
+Closes #520.
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9c22495e5eeeae9e00a1596720c969656bb8d678 && https://gitlab.com/libtiff/libtiff/-/commit/688012dca2c39033aa2dc7bcea9796787cfd1b44]
+CVE: CVE-2023-25433
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 78 +++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 60 insertions(+), 18 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index eee26bf..cbd24cc 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -523,7 +523,7 @@ static int rotateContigSamples24bits(uint16_t, uint16_t, uint16_t, uint32_t,
+ static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t, uint32_t,
+                                      uint32_t, uint32_t, uint8_t *, uint8_t *);
+ static int rotateImage(uint16_t, struct image_data *, uint32_t *, uint32_t *,
+-                       unsigned char **, int);
++                       unsigned char **, size_t *);
+ static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
+                        unsigned char *);
+ static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
+@@ -6515,7 +6515,7 @@ static int  correct_orientation(struct image_data *image, unsigned char **work_b
+        * but switch xres, yres there. */
+       uint32_t width = image->width;
+       uint32_t length = image->length;
+-      if (rotateImage(rotation, image, &width, &length, work_buff_ptr, TRUE))
++      if (rotateImage(rotation, image, &width, &length, work_buff_ptr, NULL))
+       {
+       TIFFError ("correct_orientation", "Unable to rotate image");
+       return (-1);
+@@ -7695,16 +7695,19 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+ 
+     if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+       {
++        /* rotateImage() set up a new buffer and calculates its size
++         * individually. Therefore, seg_buffs size  needs to be updated
++         * accordingly. */
++      size_t rot_buf_size = 0;
+       if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                      &crop->combined_length, &crop_buff, FALSE))
++                      &crop->combined_length, &crop_buff, &rot_buf_size))
+         {
+         TIFFError("processCropSelections", 
+                   "Failed to rotate composite regions by %"PRIu32" degrees", crop->rotation);
+         return (-1);
+         }
+       seg_buffs[0].buffer = crop_buff;
+-      seg_buffs[0].size = (((crop->combined_width * image->bps + 7 ) / 8)
+-                            * image->spp) * crop->combined_length; 
++      seg_buffs[0].size = rot_buf_size;
+       }
+     }
+   else  /* Separated Images */
+@@ -7804,9 +7807,13 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         {
+           /* rotateImage() changes image->width, ->length, ->xres and ->yres, what it schouldn't do here, when more than one section is processed. 
+            * ToDo: Therefore rotateImage() and its usage has to be reworked (e.g. like mirrorImage()) !!
+-           */
+-	if (rotateImage(crop->rotation, image, &crop->regionlist[i].width, 
+-			&crop->regionlist[i].length, &crop_buff, FALSE))
++           * Furthermore, rotateImage() set up a new buffer and calculates
++           * its size individually. Therefore, seg_buffs size  needs to be
++           * updated accordingly. */
++	   size_t rot_buf_size = 0;
++           if (rotateImage(
++                crop->rotation, image, &crop->regionlist[i].width,
++                &crop->regionlist[i].length, &crop_buff, &rot_buf_size))
+           {
+           TIFFError("processCropSelections", 
+                     "Failed to rotate crop region by %"PRIu16" degrees", crop->rotation);
+@@ -7817,8 +7824,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         crop->combined_width = total_width;
+         crop->combined_length = total_length;
+         seg_buffs[i].buffer = crop_buff;
+-        seg_buffs[i].size = (((crop->regionlist[i].width * image->bps + 7 ) / 8)
+-                               * image->spp) * crop->regionlist[i].length; 
++        seg_buffs[i].size = rot_buf_size;
+         }
+       }  /* for crop->selections loop */
+     }  /* Separated Images (else case) */
+@@ -7827,7 +7833,6 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+ 
+ /* Copy the crop section of the data from the current image into a buffer
+  * and adjust the IFD values to reflect the new size. If no cropping is
+- * required, use the original read buffer as the crop buffer.
+  *
+  * There is quite a bit of redundancy between this routine and the more
+  * specialized processCropSelections, but this provides
+@@ -7938,7 +7943,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+     {
+     if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                    &crop->combined_length, crop_buff_ptr, TRUE))
++                    &crop->combined_length, crop_buff_ptr, NULL))
+       {
+       TIFFError("createCroppedImage", 
+                 "Failed to rotate image or cropped selection by %"PRIu16" degrees", crop->rotation);
+@@ -8600,14 +8605,16 @@ rotateContigSamples32bits(uint16_t rotation, uint16_t spp, uint16_t bps, uint32_
+ 
+ /* Rotate an image by a multiple of 90 degrees clockwise */
+ static int
+-rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_width,
+-            uint32_t *img_length, unsigned char **ibuff_ptr, int rot_image_params)
++rotateImage(uint16_t rotation, struct image_data *image,
++            uint32_t *img_width,uint32_t *img_length,
++            unsigned char **ibuff_ptr, size_t *rot_buf_size)
+   {
+   int      shift_width;
+   uint32_t   bytes_per_pixel, bytes_per_sample;
+   uint32_t   row, rowsize, src_offset, dst_offset;
+   uint32_t   i, col, width, length;
+-  uint32_t   colsize, buffsize, col_offset, pix_offset;
++  uint32_t colsize, col_offset, pix_offset;
++  tmsize_t buffsize;
+   unsigned char *ibuff;
+   unsigned char *src;
+   unsigned char *dst;
+@@ -8620,12 +8627,41 @@ rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_width,
+   spp = image->spp;
+   bps = image->bps;
+ 
++  if ((spp != 0 && bps != 0 &&
++         width > (uint32_t)((UINT32_MAX - 7) / spp / bps)) ||
++        (spp != 0 && bps != 0 &&
++         length > (uint32_t)((UINT32_MAX - 7) / spp / bps)))
++    {
++        TIFFError("rotateImage", "Integer overflow detected.");
++        return (-1);
++    }
++
+   rowsize = ((bps * spp * width) + 7) / 8;
+   colsize = ((bps * spp * length) + 7) / 8;
+   if ((colsize * width) > (rowsize * length))
+-    buffsize = (colsize + 1) * width;
++{
++        if (((tmsize_t)colsize + 1) != 0 &&
++            (tmsize_t)width > ((TIFF_TMSIZE_T_MAX - NUM_BUFF_OVERSIZE_BYTES) /
++                               ((tmsize_t)colsize + 1)))
++        {
++            TIFFError("rotateImage",
++                      "Integer overflow when calculating buffer size.");
++            return (-1);
++        }
++        buffsize = ((tmsize_t)colsize + 1) * width;
++    }
+   else
+-    buffsize = (rowsize + 1) * length;
++    {
++        if (((tmsize_t)rowsize + 1) != 0 &&
++            (tmsize_t)length > ((TIFF_TMSIZE_T_MAX - NUM_BUFF_OVERSIZE_BYTES) /
++                                ((tmsize_t)rowsize + 1)))
++        {
++            TIFFError("rotateImage",
++                      "Integer overflow when calculating buffer size.");
++            return (-1);
++        }
++        buffsize = (rowsize + 1) * length;
++    }
+ 
+   bytes_per_sample = (bps + 7) / 8;
+   bytes_per_pixel  = ((bps * spp) + 7) / 8;
+@@ -8648,11 +8684,17 @@ rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_width,
+   /* Add 3 padding bytes for extractContigSamplesShifted32bits */
+   if (!(rbuff = (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES)))
+     {
+-    TIFFError("rotateImage", "Unable to allocate rotation buffer of %1u bytes", buffsize + NUM_BUFF_OVERSIZE_BYTES);
++    TIFFError("rotateImage",
++              "Unable to allocate rotation buffer of %" TIFF_SSIZE_FORMAT
++              " bytes ",
++              buffsize + NUM_BUFF_OVERSIZE_BYTES);
+     return (-1);
+     }
+   _TIFFmemset(rbuff, '\0', buffsize + NUM_BUFF_OVERSIZE_BYTES);
+ 
++  if (rot_buf_size != NULL)
++	*rot_buf_size = buffsize;
++
+   ibuff = *ibuff_ptr;
+   switch (rotation)
+     {
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patch
new file mode 100644
index 0000000000..e214277504
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patch
@@ -0,0 +1,94 @@
+From 69818e2f2d246e6631ac2a2da692c3706b849c38 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 29 Jan 2023 11:09:26 +0100
+Subject: [PATCH] CVE-2023-25434 & CVE-2023-25435
+
+tiffcrop: Amend rotateImage() not to toggle the input (main)
+image width and length parameters when only cropped image sections are
+rotated. Remove buffptr from region structure because never used.
+
+Closes #492 #493 #494 #495 #499 #518 #519
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c3706b849c38]
+CVE: CVE-2023-25434 & CVE-2023-25435
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 27 ++++++++++++++++-----------
+ 1 file changed, 16 insertions(+), 11 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index cbd24cc..b811fbb 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -523,7 +523,7 @@ static int rotateContigSamples24bits(uint16_t, uint16_t, uint16_t, uint32_t,
+ static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t, uint32_t,
+                                      uint32_t, uint32_t, uint8_t *, uint8_t *);
+ static int rotateImage(uint16_t, struct image_data *, uint32_t *, uint32_t *,
+-                       unsigned char **, size_t *);
++                       unsigned char **, size_t *, int);
+ static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
+                        unsigned char *);
+ static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
+@@ -6513,10 +6513,11 @@ static int  correct_orientation(struct image_data *image, unsigned char **work_b
+       /* Dummy variable in order not to switch two times the
+        * image->width,->length within rotateImage(),
+        * but switch xres, yres there. */
+-      uint32_t width = image->width;
+-      uint32_t length = image->length;
+-      if (rotateImage(rotation, image, &width, &length, work_buff_ptr, NULL))
+-      {
++        uint32_t width = image->width;
++        uint32_t length = image->length;
++        if (rotateImage(rotation, image, &width, &length, work_buff_ptr, NULL,
++                        TRUE))
++        {
+       TIFFError ("correct_orientation", "Unable to rotate image");
+       return (-1);
+       }
+@@ -7700,7 +7701,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+          * accordingly. */
+       size_t rot_buf_size = 0;
+       if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                      &crop->combined_length, &crop_buff, &rot_buf_size))
++                      &crop->combined_length, &crop_buff, &rot_buf_size,
++                            FALSE))
+         {
+         TIFFError("processCropSelections", 
+                   "Failed to rotate composite regions by %"PRIu32" degrees", crop->rotation);
+@@ -7811,9 +7813,10 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+            * its size individually. Therefore, seg_buffs size  needs to be
+            * updated accordingly. */
+ 	   size_t rot_buf_size = 0;
+-           if (rotateImage(
+-                crop->rotation, image, &crop->regionlist[i].width,
+-                &crop->regionlist[i].length, &crop_buff, &rot_buf_size))
++           if (rotateImage(crop->rotation, image,
++                                &crop->regionlist[i].width,
++                                &crop->regionlist[i].length, &crop_buff,
++                                &rot_buf_size, FALSE))
+           {
+           TIFFError("processCropSelections", 
+                     "Failed to rotate crop region by %"PRIu16" degrees", crop->rotation);
+@@ -7943,7 +7946,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+     {
+     if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                    &crop->combined_length, crop_buff_ptr, NULL))
++                    &crop->combined_length, crop_buff_ptr, NULL, TRUE))
+       {
+       TIFFError("createCroppedImage", 
+                 "Failed to rotate image or cropped selection by %"PRIu16" degrees", crop->rotation);
+@@ -8607,7 +8610,9 @@ rotateContigSamples32bits(uint16_t rotation, uint16_t spp, uint16_t bps, uint32_
+ static int
+ rotateImage(uint16_t rotation, struct image_data *image,
+             uint32_t *img_width,uint32_t *img_length,
+-            unsigned char **ibuff_ptr, size_t *rot_buf_size)
++            unsigned char **ibuff_ptr, size_t *rot_buf_size,
++            int rot_image_params)
++
+   {
+   int      shift_width;
+   uint32_t   bytes_per_pixel, bytes_per_sample;
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 2be25756bc..2ee10fca72 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -35,6 +35,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-48281.patch \
            file://CVE-2023-0800_0801_0802_0803_0804.patch \
            file://CVE-2023-0795_0796_0797_0798_0799.patch \
+           file://CVE-2023-25433.patch \
+           file://CVE-2023-25434-CVE-2023-25435.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


