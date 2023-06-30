Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BF7EB64DD
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:24 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.3831.1688092156235511380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Z2c2ALCI;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.175, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7656652da3cso121935085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092155; x=1690684155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Flv0X6kwn/rPHt6N5Y+0/1SjDudAyz5A5ckt1FU5YU=;
        b=Z2c2ALCINy4WI3fUMWPyV5PYnOv7GG8l2XWtvpZ0zjQGtEwP/7/VWM2dkQEgIHC+HU
         Ev2FmlXHdNIRH5QlA19HAv3sOjbc/F6E744r+9eIHP1eaxdrmmakzSTOYU7FQzroR7iH
         2oYko4IOQzN/PLjlTZgfk7OXrILWVL7KKGISm7hYq93/zzaV8JzCVP0PMGL+GhdNGmR3
         i7PhvMBtGz+hHUmPJ7NfhlE99BV5+pQ9vQLnaB2HN8GTC0XMHZDAbAkFQIAVbgkly/PZ
         kH56CK7To0v5NOlQ3qRQh5HgVrQcknLC7xBpK4hS2fKEhrC6tD3euKjFa1S670y2bWKg
         pIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092155; x=1690684155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Flv0X6kwn/rPHt6N5Y+0/1SjDudAyz5A5ckt1FU5YU=;
        b=LarLcUbS8ttG+A7vJ6unwCdQke4nSlM0a33slCzV5Gb+u5G2bwyuuCBrEMkN9KxkoF
         O0Zo59EUQUSETrhpkFO4U3yenw+MvtUUSzuuAhQV7fEjanoH/xCr9tj5juzryZoBesPN
         vcax0wG4eMf9s0kaa+8rCr7Yvmy41MXeiKX71fopblBB1DPZVGv1x94CrHO3xMXx0z3Q
         tHoO8ybxw9+iBHRdfFn/lmBKFl/19/5OSNeBPK5LROuUq8XiuJQf+CJIM8fNboGugZIF
         CXy8qI8N8C86mTvgYa0T/gsd2dTKKUKipumZdhCc4GwuvAkp+ihOQgHyGmvmOtK70ge8
         qJQQ==
X-Gm-Message-State: ABy/qLap7k2DK80gh7OFEyJsCjP902Q8kgxNerth4w7Nrk7VdtaaJzbU
	5hiU2TslDyfXOFUYfFTVb4DaUJjyHyW3o4yMPZn+/A==
X-Google-Smtp-Source: APBJJlELLZEUVqYg8VLj73MYU79RBzArB/B9uPK2a/1bQ/It7xF6S+501elydRgCyIhIDXx5JBC2Ow==
X-Received: by 2002:a05:620a:4308:b0:75b:23a1:834f with SMTP id u8-20020a05620a430800b0075b23a1834fmr1030535qko.74.1688092154686;
        Thu, 29 Jun 2023 19:29:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/30] tiff: Security fix for CVE-2023-25434 and CVE-2023-26965
Date: Thu, 29 Jun 2023 16:28:37 -1000
Message-Id: <7db6039b809a11dc9b0b51a31a763bec87016568.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183641

From: Siddharth <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c3706b849c38, https://gitlab.com/libtiff/libtiff/-/commit/ec8ef90c1f573c9eb1f17d6a056aa0015f184acf]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-25434.patch        | 159 ++++++++++++++++++
 .../libtiff/files/CVE-2023-26965.patch        |  99 +++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |   2 +
 3 files changed, 260 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch
new file mode 100644
index 0000000000..a78c9709f9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch
@@ -0,0 +1,159 @@
+From 69818e2f2d246e6631ac2a2da692c3706b849c38 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 29 Jan 2023 11:09:26 +0100
+Subject: [PATCH] tiffcrop: Amend rotateImage() not to toggle the input (main)
+ image width and length parameters when only cropped image sections are
+ rotated. Remove buffptr from region structure because never used.
+
+Closes #492 #493 #494 #495 #499 #518 #519
+
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c3706b849c38]
+CVE: CVE-2023-25434
+
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffcrop.c | 51 ++++++++++++++++++++++++++++--------------------
+ 1 file changed, 30 insertions(+), 21 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index fc5b34b..6e1acc4 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -296,7 +296,6 @@ struct region
+     uint32_t width;    /* width in pixels */
+     uint32_t length;   /* length in pixels */
+     uint32_t buffsize; /* size of buffer needed to hold the cropped region */
+-    unsigned char *buffptr; /* address of start of the region */
+ };
+ 
+ /* Cropping parameters from command line and image data
+@@ -577,7 +576,7 @@ static int rotateContigSamples24bits(uint16_t, uint16_t, uint16_t, uint32_t,
+ static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t, uint32_t,
+                                      uint32_t, uint32_t, uint8_t *, uint8_t *);
+ static int rotateImage(uint16_t, struct image_data *, uint32_t *, uint32_t *,
+-                       unsigned char **);
++                       unsigned char **, int);
+ static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
+                        unsigned char *);
+ static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,
+@@ -5779,7 +5778,6 @@ static void initCropMasks(struct crop_mask *cps)
+         cps->regionlist[i].width = 0;
+         cps->regionlist[i].length = 0;
+         cps->regionlist[i].buffsize = 0;
+-        cps->regionlist[i].buffptr = NULL;
+         cps->zonelist[i].position = 0;
+         cps->zonelist[i].total = 0;
+     }
+@@ -7221,8 +7219,13 @@ static int correct_orientation(struct image_data *image,
+             return (-1);
+         }
+ 
+-        if (rotateImage(rotation, image, &image->width, &image->length,
+-                        work_buff_ptr))
++        /* Dummy variable in order not to switch two times the
++         * image->width,->length within rotateImage(),
++         * but switch xres, yres there. */
++        uint32_t width = image->width;
++        uint32_t length = image->length;
++        if (rotateImage(rotation, image, &width, &length, work_buff_ptr,
++                        TRUE))
+         {
+             TIFFError("correct_orientation", "Unable to rotate image");
+             return (-1);
+@@ -7291,7 +7294,6 @@ static int extractCompositeRegions(struct image_data *image,
+         /* These should not be needed for composite images */
+         crop->regionlist[i].width = crop_width;
+         crop->regionlist[i].length = crop_length;
+-        crop->regionlist[i].buffptr = crop_buff;
+ 
+         src_rowsize = ((img_width * bps * spp) + 7) / 8;
+         dst_rowsize = (((crop_width * bps * count) + 7) / 8);
+@@ -7552,7 +7554,6 @@ static int extractSeparateRegion(struct image_data *image,
+ 
+     crop->regionlist[region].width = crop_width;
+     crop->regionlist[region].length = crop_length;
+-    crop->regionlist[region].buffptr = crop_buff;
+ 
+     src = read_buff;
+     dst = crop_buff;
+@@ -8543,7 +8544,7 @@ static int processCropSelections(struct image_data *image,
+                                               reallocate the buffer */
+         {
+             if (rotateImage(crop->rotation, image, &crop->combined_width,
+-                            &crop->combined_length, &crop_buff))
++                            &crop->combined_length, &crop_buff, FALSE))
+             {
+                 TIFFError("processCropSelections",
+                           "Failed to rotate composite regions by %" PRIu32
+@@ -8668,7 +8669,7 @@ static int processCropSelections(struct image_data *image,
+                  */
+                 if (rotateImage(crop->rotation, image,
+                                 &crop->regionlist[i].width,
+-                                &crop->regionlist[i].length, &crop_buff))
++                                &crop->regionlist[i].length, &crop_buff, FALSE))
+                 {
+                     TIFFError("processCropSelections",
+                               "Failed to rotate crop region by %" PRIu16
+@@ -8815,7 +8816,7 @@ static int createCroppedImage(struct image_data *image, struct crop_mask *crop,
+         CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+     {
+         if (rotateImage(crop->rotation, image, &crop->combined_width,
+-                        &crop->combined_length, crop_buff_ptr))
++                        &crop->combined_length, crop_buff_ptr, TRUE))
+         {
+             TIFFError("createCroppedImage",
+                       "Failed to rotate image or cropped selection by %" PRIu16
+@@ -9531,7 +9532,7 @@ static int rotateContigSamples32bits(uint16_t rotation, uint16_t spp,
+ /* Rotate an image by a multiple of 90 degrees clockwise */
+ static int rotateImage(uint16_t rotation, struct image_data *image,
+                        uint32_t *img_width, uint32_t *img_length,
+-                       unsigned char **ibuff_ptr)
++                       unsigned char **ibuff_ptr, int rot_image_params)
+ {
+     int shift_width;
+     uint32_t bytes_per_pixel, bytes_per_sample;
+@@ -9747,11 +9748,15 @@ static int rotateImage(uint16_t rotation, struct image_data *image,
+ 
+             *img_width = length;
+             *img_length = width;
+-            image->width = length;
+-            image->length = width;
+-            res_temp = image->xres;
+-            image->xres = image->yres;
+-            image->yres = res_temp;
++            /* Only toggle image parameters if whole input image is rotated. */
++            if (rot_image_params)
++            {
++                image->width = length;
++                image->length = width;
++                res_temp = image->xres;
++                image->xres = image->yres;
++                image->yres = res_temp;
++            }
+             break;
+ 
+         case 270:
+@@ -9834,11 +9839,15 @@ static int rotateImage(uint16_t rotation, struct image_data *image,
+ 
+             *img_width = length;
+             *img_length = width;
+-            image->width = length;
+-            image->length = width;
+-            res_temp = image->xres;
+-            image->xres = image->yres;
+-            image->yres = res_temp;
++            /* Only toggle image parameters if whole input image is rotated. */
++            if (rot_image_params)
++            {
++                image->width = length;
++                image->length = width;
++                res_temp = image->xres;
++                image->xres = image->yres;
++                image->yres = res_temp;
++            }
+             break;
+         default:
+             break;
+-- 
+2.35.7
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
new file mode 100644
index 0000000000..09161c9165
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
@@ -0,0 +1,99 @@
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
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/ec8ef90c1f573c9eb1f17d6a056aa0015f184acf]
+CVE: CVE-2023-26965
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffcrop.c | 47 +++++++++++++----------------------------------
+ 1 file changed, 13 insertions(+), 34 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index fb0fbb2..58ed3ab 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -6746,9 +6746,7 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
+     uint32_t tw = 0, tl = 0; /* Tile width and length */
+     tmsize_t tile_rowsize = 0;
+     unsigned char *read_buff = NULL;
+-    unsigned char *new_buff = NULL;
+     int readunit = 0;
+-    static tmsize_t prev_readsize = 0;
+ 
+     TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
+     TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
+@@ -7072,43 +7070,25 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
+     }
+ 
+     read_buff = *read_ptr;
+-    /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit */
+-    /* outside buffer */
+-    if (!read_buff)
++    /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit
++     * outside buffer */
++    /* Reuse of read_buff from previous image is quite unsafe, because other
++     * functions (like rotateImage() etc.) reallocate that buffer with different
++     * size without updating the local prev_readsize value. */
++    if (read_buff)
+     {
+-        if (buffsize > 0xFFFFFFFFU - 3)
+-        {
+-            TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+-            return (-1);
+-        }
+-        read_buff =
+-            (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
++        _TIFFfree(read_buff);
+     }
+-    else
++    if (buffsize > 0xFFFFFFFFU - 3)
+     {
+-        if (prev_readsize < buffsize)
+-        {
+-            if (buffsize > 0xFFFFFFFFU - 3)
+-            {
+-                TIFFError("loadImage",
+-                          "Unable to allocate/reallocate read buffer");
+-                return (-1);
+-            }
+-            new_buff =
+-                _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-            if (!new_buff)
+-            {
+-                free(read_buff);
+-                read_buff = (unsigned char *)limitMalloc(
+-                    buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-            }
+-            else
+-                read_buff = new_buff;
+-        }
++        TIFFError("loadImage", "Required read buffer size too large");
++        return (-1);
+     }
++    read_buff =
++        (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!read_buff)
+     {
+-        TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
++        TIFFError("loadImage", "Unable to allocate read buffer");
+         return (-1);
+     }
+ 
+@@ -7116,7 +7096,6 @@ static int loadImage(TIFF *in, struct image_data *image, struct dump_opts *dump,
+     read_buff[buffsize + 1] = 0;
+     read_buff[buffsize + 2] = 0;
+ 
+-    prev_readsize = buffsize;
+     *read_ptr = read_buff;
+ 
+     /* N.B. The read functions used copy separate plane data into a buffer as
+-- 
+2.35.7
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
index ca4a3eff91..220f7e2816 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
@@ -11,6 +11,8 @@ CVE_PRODUCT = "libtiff"
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-48281.patch \
            file://CVE-2023-2731.patch \
+           file://CVE-2023-25434.patch \
+           file://CVE-2023-26965.patch \
 "
 
 SRC_URI[sha256sum] = "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464"
-- 
2.34.1


