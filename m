Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C96C001DE
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:19 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.11713.1690052237578607369
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ABj4ohDw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666ed230c81so2841265b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052237; x=1690657037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEBwLAjXr5rUfhQxZOQLvyO423Cxjjl2eYxqC+BZG1o=;
        b=ABj4ohDwhLRSnZQIhDZTitt11oTxnPl1+N2uu/OsqVyBoAS/05rjHo5nEUa9V83HrV
         pLzkCRPVA57894yzIIlhfczXUzz8GRfOHyh9k3+PCmjwR4dHA2TTN+b5/BESuARXhUmx
         d5EIhunhLWZzK3Qt/N+6zkvHfJZC/b2W9ahTiMUMCp6ta5OJqZTGY79jCjfFD+e0zEfH
         VZG9Cd+RQ0uoM9j98Tk8PN+janLaNEP+9gfZIeQLFBbA7WDsSzvMRAryh8X0cOBAgEkR
         ECmrQaDnqPAfyD/ge2sw9y8lOIr4BiWwbdkF3cr/WiyLBbJK7lQ9CioytuJQrXuC+GkA
         sGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052237; x=1690657037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEBwLAjXr5rUfhQxZOQLvyO423Cxjjl2eYxqC+BZG1o=;
        b=f+/Yx3SbQdZ72fve3BmDRRD7Cml0gElj7nn5LryDIt9e9I8gpQDj7m6kMh1u/JhGyc
         kyRdZRAyXmrsCtJao2oGZlaiC4SJhQpfESm62J2+VCYzL/NaCKppUEdue9DwLxB4qnl+
         aDTJPE9sKroa5XW4NxgxWgeW21j/Ci6aNPIj2uvC4cg7PH8pauodaT+uw9lrnJ5oGQei
         diTG8gODW9kcUsdyzVkDZYNtRbbwrvoe0pq6p6JsVEWUwfnC39ITF/ZzYPRdrvK8V8kd
         S/l4FOY5HK18FWf280vuIrtNt8PvjsG3PkmB8VGlQ32hu3Tb3TCgrkTREGIQZWUFuktZ
         fxIQ==
X-Gm-Message-State: ABy/qLYnGL5rNyN8JTHkOTv3HQJNhIERxPPEOe/kSU0U/lnoZLkh1QHj
	1J33ti2KqL3QCBPZ7WoE17zulustW/TepuOB+lU=
X-Google-Smtp-Source: APBJJlFHBlvppFe2WpJBvEeDeVbL2hoY2wD3OgcQs4XDN08NsbFTFdJGX3e9FfXn27Qrtullek54KA==
X-Received: by 2002:a05:6a20:100d:b0:137:30db:bc35 with SMTP id gs13-20020a056a20100d00b0013730dbbc35mr5549236pzc.27.1690052236595;
        Sat, 22 Jul 2023 11:57:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/11] tiff: upgrade to 4.5.1
Date: Sat, 22 Jul 2023 08:56:51 -1000
Message-Id: <309b58071d14406ccdf90342f0a33285dc83c87c.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184730

From: Ross Burton <ross.burton@arm.com>

Also remove old CVE_CHECK_IGNOREs which are no longer needed due to CPE
updates.

This is a backport from master. Mickledore had one extra CVE patch that
was not on master at the time of upgrade, so it had to be manually
removed here.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2022-48281.patch        |  29 ----
 .../libtiff/files/CVE-2023-25434.patch        | 159 ------------------
 .../libtiff/files/CVE-2023-26965.patch        |  99 -----------
 .../libtiff/files/CVE-2023-2731.patch         |  39 -----
 .../libtiff/{tiff_4.5.0.bb => tiff_4.5.1.bb}  |  14 +-
 5 files changed, 2 insertions(+), 338 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.5.0.bb => tiff_4.5.1.bb} (81%)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
deleted file mode 100644
index e356d377ea..0000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-CVE: CVE-2022-48281
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
-From: Su Laus <sulau@freenet.de>
-Date: Sat, 21 Jan 2023 15:58:10 +0000
-Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
-
----
- tools/tiffcrop.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 14fa18da..7db69883 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data *image,
-                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
-             else
-             {
--                prev_cropsize = seg_buffs[0].size;
-+                prev_cropsize = seg_buffs[i].size;
-                 if (prev_cropsize < cropsize)
-                 {
-                     next_buff = _TIFFrealloc(
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch
deleted file mode 100644
index a78c9709f9..0000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch
+++ /dev/null
@@ -1,159 +0,0 @@
-From 69818e2f2d246e6631ac2a2da692c3706b849c38 Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Sun, 29 Jan 2023 11:09:26 +0100
-Subject: [PATCH] tiffcrop: Amend rotateImage() not to toggle the input (main)
- image width and length parameters when only cropped image sections are
- rotated. Remove buffptr from region structure because never used.
-
-Closes #492 #493 #494 #495 #499 #518 #519
-
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c3706b849c38]
-CVE: CVE-2023-25434
-
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- tools/tiffcrop.c | 51 ++++++++++++++++++++++++++++--------------------
- 1 file changed, 30 insertions(+), 21 deletions(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index fc5b34b..6e1acc4 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -296,7 +296,6 @@ struct region
-     uint32_t width;    /* width in pixels */
-     uint32_t length;   /* length in pixels */
-     uint32_t buffsize; /* size of buffer needed to hold the cropped region */
--    unsigned char *buffptr; /* address of start of the region */
- };
- 
- /* Cropping parameters from command line and image data
-@@ -577,7 +576,7 @@ static int rotateContigSamples24bits(uint16_t, uint16_t, uint16_t, uint32_t,
- static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t, uint32_t,
-                                      uint32_t, uint32_t, uint8_t *, uint8_t *);
- static int rotateImage(uint16_t, struct image_data *, uint32_t *, uint32_t *,
--                       unsigned char **);
-+                       unsigned char **, int);
- static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
-                        unsigned char *);
- static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
-@@ -5779,7 +5778,6 @@ static void initCropMasks(struct crop_mask *cps)
-         cps->regionlist[i].width = 0;
-         cps->regionlist[i].length = 0;
-         cps->regionlist[i].buffsize = 0;
--        cps->regionlist[i].buffptr = NULL;
-         cps->zonelist[i].position = 0;
-         cps->zonelist[i].total = 0;
-     }
-@@ -7221,8 +7219,13 @@ static int correct_orientation(struct image_data *image,
-             return (-1);
-         }
- 
--        if (rotateImage(rotation, image, &image->width, &image->length,
--                        work_buff_ptr))
-+        /* Dummy variable in order not to switch two times the
-+         * image->width,->length within rotateImage(),
-+         * but switch xres, yres there. */
-+        uint32_t width = image->width;
-+        uint32_t length = image->length;
-+        if (rotateImage(rotation, image, &width, &length, work_buff_ptr,
-+                        TRUE))
-         {
-             TIFFError("correct_orientation", "Unable to rotate image");
-             return (-1);
-@@ -7291,7 +7294,6 @@ static int extractCompositeRegions(struct image_data *image,
-         /* These should not be needed for composite images */
-         crop->regionlist[i].width = crop_width;
-         crop->regionlist[i].length = crop_length;
--        crop->regionlist[i].buffptr = crop_buff;
- 
-         src_rowsize = ((img_width * bps * spp) + 7) / 8;
-         dst_rowsize = (((crop_width * bps * count) + 7) / 8);
-@@ -7552,7 +7554,6 @@ static int extractSeparateRegion(struct image_data *image,
- 
-     crop->regionlist[region].width = crop_width;
-     crop->regionlist[region].length = crop_length;
--    crop->regionlist[region].buffptr = crop_buff;
- 
-     src = read_buff;
-     dst = crop_buff;
-@@ -8543,7 +8544,7 @@ static int processCropSelections(struct image_data *image,
-                                               reallocate the buffer */
-         {
-             if (rotateImage(crop->rotation, image, &crop->combined_width,
--                            &crop->combined_length, &crop_buff))
-+                            &crop->combined_length, &crop_buff, FALSE))
-             {
-                 TIFFError("processCropSelections",
-                           "Failed to rotate composite regions by %" PRIu32
-@@ -8668,7 +8669,7 @@ static int processCropSelections(struct image_data *image,
-                  */
-                 if (rotateImage(crop->rotation, image,
-                                 &crop->regionlist[i].width,
--                                &crop->regionlist[i].length, &crop_buff))
-+                                &crop->regionlist[i].length, &crop_buff, FALSE))
-                 {
-                     TIFFError("processCropSelections",
-                               "Failed to rotate crop region by %" PRIu16
-@@ -8815,7 +8816,7 @@ static int createCroppedImage(struct image_data *image, struct crop_mask *crop,
-         CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
-     {
-         if (rotateImage(crop->rotation, image, &crop->combined_width,
--                        &crop->combined_length, crop_buff_ptr))
-+                        &crop->combined_length, crop_buff_ptr, TRUE))
-         {
-             TIFFError("createCroppedImage",
-                       "Failed to rotate image or cropped selection by %" PRIu16
-@@ -9531,7 +9532,7 @@ static int rotateContigSamples32bits(uint16_t rotation, uint16_t spp,
- /* Rotate an image by a multiple of 90 degrees clockwise */
- static int rotateImage(uint16_t rotation, struct image_data *image,
-                        uint32_t *img_width, uint32_t *img_length,
--                       unsigned char **ibuff_ptr)
-+                       unsigned char **ibuff_ptr, int rot_image_params)
- {
-     int shift_width;
-     uint32_t bytes_per_pixel, bytes_per_sample;
-@@ -9747,11 +9748,15 @@ static int rotateImage(uint16_t rotation, struct image_data *image,
- 
-             *img_width = length;
-             *img_length = width;
--            image->width = length;
--            image->length = width;
--            res_temp = image->xres;
--            image->xres = image->yres;
--            image->yres = res_temp;
-+            /* Only toggle image parameters if whole input image is rotated. */
-+            if (rot_image_params)
-+            {
-+                image->width = length;
-+                image->length = width;
-+                res_temp = image->xres;
-+                image->xres = image->yres;
-+                image->yres = res_temp;
-+            }
-             break;
- 
-         case 270:
-@@ -9834,11 +9839,15 @@ static int rotateImage(uint16_t rotation, struct image_data *image,
- 
-             *img_width = length;
-             *img_length = width;
--            image->width = length;
--            image->length = width;
--            res_temp = image->xres;
--            image->xres = image->yres;
--            image->yres = res_temp;
-+            /* Only toggle image parameters if whole input image is rotated. */
-+            if (rot_image_params)
-+            {
-+                image->width = length;
-+                image->length = width;
-+                res_temp = image->xres;
-+                image->xres = image->yres;
-+                image->yres = res_temp;
-+            }
-             break;
-         default:
-             break;
--- 
-2.35.7
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
deleted file mode 100644
index 09161c9165..0000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From ec8ef90c1f573c9eb1f17d6a056aa0015f184acf Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Tue, 14 Feb 2023 20:43:43 +0100
-Subject: [PATCH] tiffcrop: Do not reuse input buffer for subsequent images.
- Fix issue 527
-
-Reuse of read_buff within loadImage() from previous image is quite unsafe, because other functions (like rotateImage() etc.) reallocate that buffer with different size without updating the local prev_readsize value.
-
-Closes #527
-
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/ec8ef90c1f573c9eb1f17d6a056aa0015f184acf]
-CVE: CVE-2023-26965
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- tools/tiffcrop.c | 47 +++++++++++++----------------------------------
- 1 file changed, 13 insertions(+), 34 deletions(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index fb0fbb2..58ed3ab 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -6746,9 +6746,7 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
-     uint32_t tw = 0, tl = 0; /* Tile width and length */
-     tmsize_t tile_rowsize = 0;
-     unsigned char *read_buff = NULL;
--    unsigned char *new_buff = NULL;
-     int readunit = 0;
--    static tmsize_t prev_readsize = 0;
- 
-     TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
-     TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
-@@ -7072,43 +7070,25 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
-     }
- 
-     read_buff = *read_ptr;
--    /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit */
--    /* outside buffer */
--    if (!read_buff)
-+    /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit
-+     * outside buffer */
-+    /* Reuse of read_buff from previous image is quite unsafe, because other
-+     * functions (like rotateImage() etc.) reallocate that buffer with different
-+     * size without updating the local prev_readsize value. */
-+    if (read_buff)
-     {
--        if (buffsize > 0xFFFFFFFFU - 3)
--        {
--            TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
--            return (-1);
--        }
--        read_buff =
--            (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
-+        _TIFFfree(read_buff);
-     }
--    else
-+    if (buffsize > 0xFFFFFFFFU - 3)
-     {
--        if (prev_readsize < buffsize)
--        {
--            if (buffsize > 0xFFFFFFFFU - 3)
--            {
--                TIFFError("loadImage",
--                          "Unable to allocate/reallocate read buffer");
--                return (-1);
--            }
--            new_buff =
--                _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE_BYTES);
--            if (!new_buff)
--            {
--                free(read_buff);
--                read_buff = (unsigned char *)limitMalloc(
--                    buffsize + NUM_BUFF_OVERSIZE_BYTES);
--            }
--            else
--                read_buff = new_buff;
--        }
-+        TIFFError("loadImage", "Required read buffer size too large");
-+        return (-1);
-     }
-+    read_buff =
-+        (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
-     if (!read_buff)
-     {
--        TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
-+        TIFFError("loadImage", "Unable to allocate read buffer");
-         return (-1);
-     }
- 
-@@ -7116,7 +7096,6 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
-     read_buff[buffsize + 1] = 0;
-     read_buff[buffsize + 2] = 0;
- 
--    prev_readsize = buffsize;
-     *read_ptr = read_buff;
- 
-     /* N.B. The read functions used copy separate plane data into a buffer as
--- 
-2.35.7
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
deleted file mode 100644
index 7db0a35f72..0000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9be22b639ea69e102d3847dca4c53ef025e9527b Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 29 Apr 2023 12:20:46 +0200
-Subject: [PATCH] LZWDecode(): avoid crash when trying to read again from a
- strip whith a missing end-of-information marker (fixes #548)
-
-CVE: CVE-2023-2731
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9be22b639ea69e102d3847dca4c53ef025e9527b]
-
----
- libtiff/tif_lzw.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
-index ba75a07e..d631fa10 100644
---- a/libtiff/tif_lzw.c
-+++ b/libtiff/tif_lzw.c
-@@ -423,6 +423,10 @@ static int LZWDecode(TIFF *tif, uint8_t *op0, tmsize_t occ0, uint16_t s)
- 
-     if (sp->read_error)
-     {
-+        TIFFErrorExtR(tif, module,
-+                      "LZWDecode: Scanline %" PRIu32 " cannot be read due to "
-+                      "previous error",
-+                      tif->tif_row);
-         return 0;
-     }
- 
-@@ -742,6 +746,7 @@ after_loop:
-     return (1);
- 
- no_eoi:
-+    sp->read_error = 1;
-     TIFFErrorExtR(tif, module,
-                   "LZWDecode: Strip %" PRIu32 " not terminated with EOI code",
-                   tif->tif_curstrip);
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
similarity index 81%
rename from meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
index 220f7e2816..5af3f84265 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
@@ -8,14 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2022-48281.patch \
-           file://CVE-2023-2731.patch \
-           file://CVE-2023-25434.patch \
-           file://CVE-2023-26965.patch \
-"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464"
+SRC_URI[sha256sum] = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
@@ -23,11 +18,6 @@ UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 # Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313
 # and 4.3.0 doesn't have the issue
 CVE_CHECK_IGNORE += "CVE-2015-7313"
-# These issues only affect libtiff post-4.3.0 but before 4.4.0,
-# caused by 3079627e and fixed by b4e79bfa.
-CVE_CHECK_IGNORE += "CVE-2022-1622 CVE-2022-1623"
-# Issue is in jbig which we don't enable
-CVE_CHECK_IGNORE += "CVE-2022-1210"
 
 inherit autotools multilib_header
 
-- 
2.34.1


