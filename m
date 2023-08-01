Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF6EEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 06:12:37 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.6778.1690870350690104198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 23:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=H/isunQ8;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-563f8e8a53dso3250906a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690870350; x=1691475150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3+lI+O+anidrYoyc+NgG/z5IpiQxwBuF+SbVd/K9gc=;
        b=H/isunQ8wdURA1wTmhVM3SmV23MsRgqdQEVVLbFmtcEtEHA556Yr1LH9Ap6GGpaieR
         irnDswae9mY8QeTtgQtRmdbqhouHAbaBDRBK3n5ZBdJmJ695a5H55t/M6L5zBmr1ZLtg
         cCsKA9ZqOrgi1ZSp/E9oS0USxK7Q5Rky9nYis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690870350; x=1691475150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3+lI+O+anidrYoyc+NgG/z5IpiQxwBuF+SbVd/K9gc=;
        b=TzZiBwcxgxfBBQDAZVBI8eD5l6T1/RPDRgoxwdiBPpoARsYmaz6NsKf1j7+ppN/mZr
         bfS99YIcASoUV1ET6IF5uRbwfCR2DglvX3JeAJt+Bgo82LwxmgL+zPKnH79DHvTlhBXs
         y/+jcGmjN89DqIH6w4btUCP40LYvWX7nWnF7p5WAVfVekZUElmJWcii4rxn0D4HiKU3M
         X9kewp0Q9rBROzfBaQhRFiRtNxbDNioUycEZq3nKDW4TCMs3hjEt1OmkxzWH9UWeRftv
         m2c4ZSxq/H4HNc7b5UFLBIUtVkSAYoBDsF5FWsXCcUtUUkvTUqYNy4a4qRkt3h1QGz83
         30oQ==
X-Gm-Message-State: ABy/qLZdGHaSZAl3p9MAtIfXOSRl5LOAhxLQg2ULLw21M5WKh8bixo3l
	j0vH1ihUp9unZgjw5orkaWUN5EDyQFdRwkQlP3M=
X-Google-Smtp-Source: APBJJlEEa01ftPlNVFl42bJtZp9bSCa77P4n5xljLA8qSNtmNf+C2XZq47+DaTWjLo8IfCv+FTbZPA==
X-Received: by 2002:a17:90a:3e4e:b0:268:29cb:f93a with SMTP id t14-20020a17090a3e4e00b0026829cbf93amr11322399pjm.1.1690870349553;
        Mon, 31 Jul 2023 23:12:29 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.255])
        by smtp.gmail.com with ESMTPSA id fz3-20020a17090b024300b00263cca08d95sm8616078pjb.55.2023.07.31.23.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 23:12:29 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 01 Aug 2023 11:42:23 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] tiff: fix multiple CVEs
Date: Tue,  1 Aug 2023 11:42:22 +0530
Message-Id: <20230801061222.39481-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 06:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185192

Backport fixes for:
* CVE-2023-25433 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/9c22495e5eeeae9e00a1596720c969656bb8d678 && https://gitlab.com/libtiff/libtiff/-/commit/688012dca2c39033aa2dc7bcea9796787cfd1b44
* CVE-2023-25434 & CVE-2023-25435 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c3706b849c38

* CVE-2023-26965 & CVE-2023-26966 - Upstream-Status: Backport from import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u8.debian.tar.xz]

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libtiff/files/CVE-2023-25433.patch        | 173 ++++++++++++++++++
 .../files/CVE-2023-25434-CVE-2023-25435.patch |  94 ++++++++++
 .../libtiff/files/CVE-2023-26965.patch        |  90 +++++++++
 .../libtiff/files/CVE-2023-26966.patch        |  35 ++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   4 +
 5 files changed, 396 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-25433.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-25434-CVE-2023-25435.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26966.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-25433.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-25433.patch
new file mode 100644
index 0000000000..7d6d40f25a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-25433.patch
@@ -0,0 +1,173 @@
+From 9c22495e5eeeae9e00a1596720c969656bb8d678 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 3 Feb 2023 15:31:31 +0100
+Subject: [PATCH] tiffcrop correctly update buffersize after rotateImage()
+ fix#520 rotateImage() set up a new buffer and calculates its size
+ individually. Therefore, seg_buffs[] size needs to be updated accordingly.
+ Before this fix, the seg_buffs buffer size was calculated with a different
+ formula than within rotateImage().
+
+Closes #520.
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9c22495e5eeeae9e00a1596720c969656bb8d678 && https://gitlab.com/libtiff/libtiff/-/commit/688012dca2c39033aa2dc7bcea9796787cfd1b44]
+CVE: CVE-2023-25433
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 69 +++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 56 insertions(+), 13 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 742615a..aab0ec6 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -531,7 +531,7 @@ static int rotateContigSamples24bits(uint16, uint16, uint16, uint32,
+ static int rotateContigSamples32bits(uint16, uint16, uint16, uint32, 
+                                      uint32,   uint32, uint8 *, uint8 *);
+ static int rotateImage(uint16, struct image_data *, uint32 *, uint32 *,
+- 		       unsigned char **, int);
++		       unsigned char **, size_t *);
+ static int mirrorImage(uint16, uint16, uint16, uint32, uint32,
+ 		       unsigned char *);
+ static int invertImage(uint16, uint16, uint16, uint32, uint32,
+@@ -6384,7 +6384,7 @@ static int  correct_orientation(struct image_data *image, unsigned char **work_b
+        * but switch xres, yres there. */
+       uint32_t width = image->width;
+       uint32_t length = image->length;
+-      if (rotateImage(rotation, image, &width, &length, work_buff_ptr, TRUE))
++      if (rotateImage(rotation, image, &width, &length, work_buff_ptr, NULL))
+       {
+       TIFFError ("correct_orientation", "Unable to rotate image");
+       return (-1);
+@@ -7607,8 +7607,12 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+ 
+     if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+       {
++      /* rotateImage() set up a new buffer and calculates its size
++       * individually. Therefore, seg_buffs size  needs to be updated
++       * accordingly. */
++      size_t rot_buf_size = 0;
+       if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                      &crop->combined_length, &crop_buff, FALSE))
++                      &crop->combined_length, &crop_buff, &rot_buf_size))
+         {
+         TIFFError("processCropSelections", 
+                   "Failed to rotate composite regions by %d degrees", crop->rotation);
+@@ -7713,8 +7717,13 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+ 
+       if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+         {
+-	if (rotateImage(crop->rotation, image, &crop->regionlist[i].width, 
+-			&crop->regionlist[i].length, &crop_buff, FALSE))
++	  /* Furthermore, rotateImage() set up a new buffer and calculates
++           * its size individually. Therefore, seg_buffs size  needs to be
++           * updated accordingly. */
++           size_t rot_buf_size = 0;
++           if (rotateImage(
++                crop->rotation, image, &crop->regionlist[i].width,
++                &crop->regionlist[i].length, &crop_buff, &rot_buf_size))
+           {
+           TIFFError("processCropSelections", 
+                     "Failed to rotate crop region by %d degrees", crop->rotation);
+@@ -7725,8 +7734,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         crop->combined_width = total_width;
+         crop->combined_length = total_length;
+         seg_buffs[i].buffer = crop_buff;
+-        seg_buffs[i].size = (((crop->regionlist[i].width * image->bps + 7 ) / 8)
+-                               * image->spp) * crop->regionlist[i].length; 
++        seg_buffs[i].size = rot_buf_size;
+         }
+       }
+     }
+@@ -7735,7 +7743,6 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+ 
+ /* Copy the crop section of the data from the current image into a buffer
+  * and adjust the IFD values to reflect the new size. If no cropping is
+- * required, use the origial read buffer as the crop buffer.
+  *
+  * There is quite a bit of redundancy between this routine and the more
+  * specialized processCropSelections, but this provides
+@@ -7846,7 +7853,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+     {
+     if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                    &crop->combined_length, crop_buff_ptr, TRUE))
++                    &crop->combined_length, crop_buff_ptr, NULL))
+       {
+       TIFFError("createCroppedImage", 
+                 "Failed to rotate image or cropped selection by %d degrees", crop->rotation);
+@@ -8515,7 +8522,8 @@ rotateImage(uint16 rotation, struct image_data *image, uint32 *img_width,
+   uint32   bytes_per_pixel, bytes_per_sample;
+   uint32   row, rowsize, src_offset, dst_offset;
+   uint32   i, col, width, length;
+-  uint32   colsize, buffsize, col_offset, pix_offset;
++  uint32   colsize, col_offset, pix_offset;
++  tmsize_t buffsize;
+   unsigned char *ibuff;
+   unsigned char *src;
+   unsigned char *dst;
+@@ -8528,12 +8536,41 @@ rotateImage(uint16 rotation, struct image_data *image, uint32 *img_width,
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
+@@ -8556,11 +8593,17 @@ rotateImage(uint16 rotation, struct image_data *image, uint32 *img_width,
+   /* Add 3 padding bytes for extractContigSamplesShifted32bits */
+   if (!(rbuff = (unsigned char *)_TIFFmalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES)))
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
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-25434-CVE-2023-25435.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-25434-CVE-2023-25435.patch
new file mode 100644
index 0000000000..6a6596f092
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-25434-CVE-2023-25435.patch
@@ -0,0 +1,94 @@
+From 69818e2f2d246e6631ac2a2da692c3706b849c38 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 29 Jan 2023 11:09:26 +0100
+Subject: [PATCH] tiffcrop: Amend rotateImage() not to toggle the input (main)
+ image width and length parameters when only cropped image sections are
+ rotated. Remove buffptr from region structure because never used.
+
+Closes #492 #493 #494 #495 #499 #518 #519
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c3706b849c38]
+CVE: CVE-2023-25434 & CVE-2023-25435
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index aab0ec6..ce84414 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -531,7 +531,7 @@ static int rotateContigSamples24bits(uint16, uint16, uint16, uint32,
+ static int rotateContigSamples32bits(uint16, uint16, uint16, uint32, 
+                                      uint32,   uint32, uint8 *, uint8 *);
+ static int rotateImage(uint16, struct image_data *, uint32 *, uint32 *,
+-		       unsigned char **, size_t *);
++		       unsigned char **, size_t *, int);
+ static int mirrorImage(uint16, uint16, uint16, uint32, uint32,
+ 		       unsigned char *);
+ static int invertImage(uint16, uint16, uint16, uint32, uint32,
+@@ -6382,10 +6382,11 @@ static int  correct_orientation(struct image_data *image, unsigned char **work_b
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
+@@ -7612,7 +7613,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+        * accordingly. */
+       size_t rot_buf_size = 0;
+       if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                      &crop->combined_length, &crop_buff, &rot_buf_size))
++                      &crop->combined_length, &crop_buff, &rot_buf_size,
++                            FALSE))
+         {
+         TIFFError("processCropSelections", 
+                   "Failed to rotate composite regions by %d degrees", crop->rotation);
+@@ -7721,9 +7723,10 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+            * its size individually. Therefore, seg_buffs size  needs to be
+            * updated accordingly. */
+            size_t rot_buf_size = 0;
+-           if (rotateImage(
+-                crop->rotation, image, &crop->regionlist[i].width,
+-                &crop->regionlist[i].length, &crop_buff, &rot_buf_size))
++           if (rotateImage(crop->rotation, image,
++                                &crop->regionlist[i].width,
++                                &crop->regionlist[i].length, &crop_buff,
++                                &rot_buf_size, FALSE))
+           {
+           TIFFError("processCropSelections", 
+                     "Failed to rotate crop region by %d degrees", crop->rotation);
+@@ -7853,7 +7856,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+     {
+     if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                    &crop->combined_length, crop_buff_ptr, NULL))
++                    &crop->combined_length, crop_buff_ptr, NULL, TRUE))
+       {
+       TIFFError("createCroppedImage", 
+                 "Failed to rotate image or cropped selection by %d degrees", crop->rotation);
+@@ -8515,8 +8518,10 @@ rotateContigSamples32bits(uint16 rotation, uint16 spp, uint16 bps, uint32 width,
+ 
+ /* Rotate an image by a multiple of 90 degrees clockwise */
+ static int
+-rotateImage(uint16 rotation, struct image_data *image, uint32 *img_width, 
+-            uint32 *img_length, unsigned char **ibuff_ptr, int rot_image_params)
++rotateImage(uint16 rotation, struct image_data *image,
++            uint32 *img_width, uint32 *img_length,
++            unsigned char **ibuff_ptr, size_t *rot_buf_size,
++            int rot_image_params)
+   {
+   int      shift_width;
+   uint32   bytes_per_pixel, bytes_per_sample;
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
new file mode 100644
index 0000000000..b7a7e93764
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
@@ -0,0 +1,90 @@
+From ec8ef90c1f573c9eb1f17d6a056aa0015f184acf Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Tue, 14 Feb 2023 20:43:43 +0100
+Subject: [PATCH] tiffcrop: Do not reuse input buffer for subsequent images.
+ Fix issue 527
+
+Reuse of read_buff within loadImage() from previous image is quite unsafe, because other functions (like rotateImage() etc.) reallocate that buffer with different size without updating the local prev_readsize value.
+
+Closes #527
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u8.debian.tar.xz]
+CVE: CVE-2023-26965
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 40 ++++++++++------------------------------
+ 1 file changed, 10 insertions(+), 30 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index ce84414..a533089 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5935,9 +5935,7 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+   uint32   tw = 0, tl = 0;       /* Tile width and length */
+   tmsize_t   tile_rowsize = 0;
+   unsigned char *read_buff = NULL;
+-  unsigned char *new_buff  = NULL;
+   int      readunit = 0;
+-  static   tmsize_t  prev_readsize = 0;
+ 
+   TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
+   TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
+@@ -6232,37 +6230,20 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+   read_buff = *read_ptr;
+   /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit */
+   /* outside buffer */
+-  if (!read_buff)
++  if (read_buff)
+   {
+-    if( buffsize > 0xFFFFFFFFU - 3 )
+-    {
+-        TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+-        return (-1);
+-    }
+-    read_buff = (unsigned char *)_TIFFmalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
++    _TIFFfree(read_buff);
+   }
+-  else
+-    {
+-    if (prev_readsize < buffsize)
+-    {
+-      if( buffsize > 0xFFFFFFFFU - 3 )
+-      {
+-          TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+-          return (-1);
+-      }
+-      new_buff = _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-      if (!new_buff)
+-        {
+-	free (read_buff);
+-        read_buff = (unsigned char *)_TIFFmalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-        }
+-      else
+-        read_buff = new_buff;
+-      }
+-    }
++  if (buffsize > 0xFFFFFFFFU - 3)
++  {
++    TIFFError("loadImage", "Required read buffer size too large");
++    return (-1);
++  }
++  read_buff =
++    (unsigned char *)_TIFFmalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (!read_buff)
+     {
+-    TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
++    TIFFError("loadImage", "Unable to allocate read buffer");
+     return (-1);
+     }
+ 
+@@ -6270,7 +6251,6 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+   read_buff[buffsize+1] = 0;
+   read_buff[buffsize+2] = 0;
+ 
+-  prev_readsize = buffsize;
+   *read_ptr = read_buff;
+ 
+   /* N.B. The read functions used copy separate plane data into a buffer as interleaved
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-26966.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-26966.patch
new file mode 100644
index 0000000000..48657e6aa4
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-26966.patch
@@ -0,0 +1,35 @@
+From b0e1c25dd1d065200c8d8f59ad0afe014861a1b9 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Thu, 16 Feb 2023 12:03:16 +0100
+Subject: [PATCH] tif_luv: Check and correct for NaN data in uv_encode().
+
+Closes #530
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u8.debian.tar.xz]
+CVE: CVE-2023-26966
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtiff/tif_luv.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libtiff/tif_luv.c b/libtiff/tif_luv.c
+index 6fe4858..8b2c5f1 100644
+--- a/libtiff/tif_luv.c
++++ b/libtiff/tif_luv.c
+@@ -923,6 +923,13 @@ uv_encode(double u, double v, int em)	/* encode (u',v') coordinates */
+ {
+ 	register int	vi, ui;
+ 
++	/* check for NaN */
++	if (u != u || v != v)
++	{
++		u = U_NEU;
++		v = V_NEU;
++        }
++
+ 	if (v < UV_VSTART)
+ 		return oog_encode(u, v);
+ 	vi = itrunc((v - UV_VSTART)*(1./UV_SQSIZ), em);
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 4b48d81e2b..fcb2ce1ae4 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -36,6 +36,10 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-48281.patch \
            file://CVE-2023-0795_0796_0797_0798_0799.patch \
            file://CVE-2023-0800_0801_0802_0803_0804.patch \
+           file://CVE-2023-25433.patch \
+           file://CVE-2023-25434-CVE-2023-25435.patch \
+           file://CVE-2023-26965.patch \
+           file://CVE-2023-26966.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


