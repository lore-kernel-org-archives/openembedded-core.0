Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1099C43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.7183.1667530892267218729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=68tU7nj5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id io19so3709234plb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lK2wWhVafIP+jKKzktVO+iSt/Qx/vH13/5mUFvSJS74=;
        b=68tU7nj5+1TMCZfthSZIT1fyRO4ENkVbcdDkSsf+hx86iNdkt39v491vRa9nQgywqt
         PGc0L85smaziACIXrLZhbD2AvYyG29BlkD7hjV4bjln8a1LmoicKIVB6LRYswgNz8AkP
         AT0o5I3O7VN3RrecARHVz7PyJ3kO2PjgByhjSyTCx08jknmzhnQIz8Uw5qrVHDNlLr/y
         orB1R0XeMyxvSO9oTCak3JVdEx5X43wc2Xkl3aJKzRzirG94EGfNp5MOjaBqzDap7Zyy
         nDZre38ewwqRLCf11ZvndWRsbZ0m9XQPPgmYZTdHbOpVsxMJ9KhPJvY644aplA41+eDc
         w6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lK2wWhVafIP+jKKzktVO+iSt/Qx/vH13/5mUFvSJS74=;
        b=A+3EYBLbnmn1lDqLW7YesUllcr+gAgOjloCt63qcHMiium8uLXG+CAanSVCpz356re
         R369ZXGzeVuGNPwDEUVSiO2MLVoYcO61gdTPBUlj+xCTe9YynnoeG5QzhMu4ZPNDg8SD
         tWo9zLYogqySXV2iNABvuO0EjiyZCyM3IC97IxpZ18GFzKQIRIDWtVvqLk2tWgn1xy93
         LqJUMDaoHkOeVD0uwzGqYNOV2ZiU2+LYZMjCs6kTszMeqDof+WyW4vHbs/HWpqWcLjQ6
         p3MgzMP/8dGkCrb2osu68PCw2B0CLtH8KPpQbYJtGPdfZ17m8+dH4A8W7fBar7pDa7y7
         mZng==
X-Gm-Message-State: ACrzQf0+01AKSfOOPXuKVLSasmyxiao7EVhQ3zykxazg+wIHoaRpi3ph
	h9u7IYCnxjLc1HlvJeKpi0it/J+6sql4QID8
X-Google-Smtp-Source: AMsMyM5xAwOdtUQvvK3z3t23O3k7d2hB3JKpoyjZMiyEorGN2LHneWdyJM5sJJG4R4XUCJ1pk/e1Yw==
X-Received: by 2002:a17:90b:264e:b0:212:d06f:35ad with SMTP id pa14-20020a17090b264e00b00212d06f35admr35457685pjb.2.1667530890705;
        Thu, 03 Nov 2022 20:01:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/31] tiff: fix CVE-2022-2953
Date: Thu,  3 Nov 2022 17:00:41 -1000
Message-Id: <469ac1fc6f18f0db72a13bde2268ba54ae37da75.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172667

From: Zheng Qiu <zheng.qiu@windriver.com>

While this does not happen with the tiff 4.3.0 release, it does happen with
the series of patches we have, so backport the two simple changes that
restrict the tiffcrop options to avoid the vulnerability.

CVE-2022-2953.patch was taken from upstream, and a small typo was fixed
for the CVE number. The other patch is included in tiff 4.4.0 but not
4.3.0, so add it as well.

Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ue-330-and-some-more-from-320-to-349.patch | 609 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-2953.patch          |  87 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 3 files changed, 698 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
new file mode 100644
index 0000000000..07acf5eb90
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
@@ -0,0 +1,609 @@
+From e319508023580e2f70e6e626f745b5b2a1707313 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Tue, 10 May 2022 20:03:17 +0000
+Subject: [PATCH] tiffcrop: Fix issue #330 and some more from 320 to 349
+Upstream-Status: Backport
+Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
+---
+ tools/tiffcrop.c | 282 +++++++++++++++++++++++++++++++++++------------
+ 1 file changed, 210 insertions(+), 72 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 77cf6ed1..791ec5e7 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -63,20 +63,24 @@
+  *                units when sectioning image into columns x rows
+  *                using the -S cols:rows option.
+  * -X #           Horizontal dimension of region to extract expressed in current
+- *                units
++ *                units, relative to the specified origin reference 'edge' left (default for X) or right.
+  * -Y #           Vertical dimension of region to extract expressed in current
+- *                units
++ *                units, relative to the specified origin reference 'edge' top (default for Y) or bottom.
+  * -O orient      Orientation for output image, portrait, landscape, auto
+  * -P page        Page size for output image segments, eg letter, legal, tabloid,
+  *                etc.
+  * -S cols:rows   Divide the image into equal sized segments using cols across
+  *                and rows down
+- * -E t|l|r|b     Edge to use as origin
++ * -E t|l|r|b     Edge to use as origin (i.e. 'side' of the image not 'corner')
++ *                  top    = width from left, zones from top to bottom (default)
++ *                  bottom = width from left, zones from bottom to top
++ *                  left   = zones from left to right, length from top
++ *                  right  = zones from right to left, length from top
+  * -m #,#,#,#     Margins from edges for selection: top, left, bottom, right
+  *                (commas separated)
+  * -Z #:#,#:#     Zones of the image designated as zone X of Y, 
+  *                eg 1:3 would be first of three equal portions measured
+- *                from reference edge
++ *                from reference edge (i.e. 'side' not corner)
+  * -N odd|even|#,#-#,#|last 
+  *                Select sequences and/or ranges of images within file
+  *                to process. The words odd or even may be used to specify
+@@ -103,10 +107,13 @@
+  *                selects which functions dump data, with higher numbers selecting
+  *                lower level, scanline level routines. Debug reports a limited set
+  *                of messages to monitor progress without enabling dump logs.
++ * 
++ * Note:    The (-X|-Y), -Z and -z options are mutually exclusive.
++ *          In no case should the options be applied to a given selection successively.
+  */
+ 
+-static   char tiffcrop_version_id[] = "2.4.1";
+-static   char tiffcrop_rev_date[] = "03-03-2010";
++static   char tiffcrop_version_id[] = "2.5";
++static   char tiffcrop_rev_date[] = "02-09-2022";
+ 
+ #include "tif_config.h"
+ #include "libport.h"
+@@ -774,6 +781,9 @@ static const char usage_info[] =
+ "             The four debug/dump options are independent, though it makes little sense to\n"
+ "             specify a dump file without specifying a detail level.\n"
+ "\n"
++"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n"
++"             In no case should the options be applied to a given selection successively.\n"
++"\n"
+ ;
+ 
+ /* This function could be modified to pass starting sample offset 
+@@ -2121,6 +2131,15 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+ 		/*NOTREACHED*/
+       }
+     }
++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z are mutually exclusive) --*/
++    char XY, Z, R;
++    XY = ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mode & CROP_LENGTH));
++    Z = (crop_data->crop_mode & CROP_ZONES);
++    R = (crop_data->crop_mode & CROP_REGIONS);
++    if ((XY && Z) || (XY && R) || (Z && R)) {
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z and -z are mutually exclusive.->Exit");
++        exit(EXIT_FAILURE);
++    }
+   }  /* end process_command_opts */
+ 
+ /* Start a new output file if one has not been previously opened or
+@@ -2746,7 +2765,7 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+                            tsample_t count, uint32_t start, uint32_t end)
+   {
+   int i, bytes_per_sample, sindex;
+-  uint32_t col, dst_rowsize, bit_offset;
++  uint32_t col, dst_rowsize, bit_offset, numcols;
+   uint32_t src_byte /*, src_bit */;
+   uint8_t *src = in;
+   uint8_t *dst = out;
+@@ -2757,6 +2776,10 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesBytes", 
+@@ -2769,6 +2792,9 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   dst_rowsize = (bps * (end - start) * count) / 8;
+ 
+@@ -2812,7 +2838,7 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                            tsample_t count, uint32_t start, uint32_t end)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint8_t  maskbits = 0, matchbits = 0;
+   uint8_t  buff1 = 0, buff2 = 0;
+   uint8_t *src = in;
+@@ -2824,6 +2850,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamples8bits", 
+@@ -2836,7 +2866,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
+-  
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
++
+   ready_bits = 0;
+   maskbits =  (uint8_t)-1 >> (8 - bps);
+   buff1 = buff2 = 0;
+@@ -2889,7 +2922,7 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                             tsample_t count, uint32_t start, uint32_t end)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint16_t maskbits = 0, matchbits = 0;
+   uint16_t buff1 = 0, buff2 = 0;
+   uint8_t  bytebuff = 0;
+@@ -2902,6 +2935,10 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamples16bits", 
+@@ -2914,6 +2951,9 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = 0;
+   maskbits = (uint16_t)-1 >> (16 - bps);
+@@ -2978,7 +3018,7 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                             tsample_t count, uint32_t start, uint32_t end)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint32_t maskbits = 0, matchbits = 0;
+   uint32_t buff1 = 0, buff2 = 0;
+   uint8_t  bytebuff1 = 0, bytebuff2 = 0;
+@@ -2991,6 +3031,10 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamples24bits", 
+@@ -3003,6 +3047,9 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = 0;
+   maskbits =  (uint32_t)-1 >> (32 - bps);
+@@ -3087,7 +3134,7 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                             tsample_t count, uint32_t start, uint32_t end)
+   {
+   int    ready_bits = 0, sindex = 0 /*, shift_width = 0 */;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint32_t longbuff1 = 0, longbuff2 = 0;
+   uint64_t maskbits = 0, matchbits = 0;
+   uint64_t buff1 = 0, buff2 = 0, buff3 = 0;
+@@ -3102,6 +3149,10 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     }
+ 
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamples32bits", 
+@@ -3114,6 +3165,9 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   /* shift_width = ((bps + 7) / 8) + 1; */ 
+   ready_bits = 0;
+@@ -3193,7 +3247,7 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                                   int shift)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint8_t  maskbits = 0, matchbits = 0;
+   uint8_t  buff1 = 0, buff2 = 0;
+   uint8_t *src = in;
+@@ -3205,6 +3259,10 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesShifted8bits", 
+@@ -3217,6 +3275,9 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = shift;
+   maskbits =  (uint8_t)-1 >> (8 - bps);
+@@ -3273,7 +3334,7 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                                    int shift)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint16_t maskbits = 0, matchbits = 0;
+   uint16_t buff1 = 0, buff2 = 0;
+   uint8_t  bytebuff = 0;
+@@ -3286,6 +3347,10 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesShifted16bits", 
+@@ -3298,6 +3363,9 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = shift;
+   maskbits = (uint16_t)-1 >> (16 - bps);
+@@ -3363,7 +3431,7 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                                    int shift)
+   {
+   int    ready_bits = 0, sindex = 0;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint32_t maskbits = 0, matchbits = 0;
+   uint32_t buff1 = 0, buff2 = 0;
+   uint8_t  bytebuff1 = 0, bytebuff2 = 0;
+@@ -3376,6 +3444,16 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     return (1);
+     }
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  /*--- Remark, which is true for all those functions extractCongigSamplesXXX() --
++  *  The mitigation of the start/end test does not allways make sense, because the function is often called with e.g.:
++  *  start = 31; end = 32; cols = 32  to extract the last column in a 32x32 sample image. 
++  *  If then, a worng parameter (e.g. cols = 10) is provided, the mitigated settings would be start=0; end=1. 
++  *  Therefore, an error message and no copy action might be the better reaction to wrong parameter configurations.
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesShifted24bits", 
+@@ -3388,6 +3466,9 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   ready_bits = shift;
+   maskbits =  (uint32_t)-1 >> (32 - bps);
+@@ -3449,7 +3530,7 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     buff2 = (buff2 << 8);
+     bytebuff2 = bytebuff1;
+     ready_bits -= 8;
+-    }
++  }
+    
+   return (0);
+   } /* end extractContigSamplesShifted24bits */
+@@ -3461,7 +3542,7 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                                    int shift)
+   {
+   int    ready_bits = 0, sindex = 0 /*, shift_width = 0 */;
+-  uint32_t col, src_byte, src_bit, bit_offset;
++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
+   uint32_t longbuff1 = 0, longbuff2 = 0;
+   uint64_t maskbits = 0, matchbits = 0;
+   uint64_t buff1 = 0, buff2 = 0, buff3 = 0;
+@@ -3476,6 +3557,10 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+     }
+ 
+ 
++  /* Number of extracted columns shall be kept as (end-start + 1). Otherwise buffer-overflow might occur.
++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be set one after the index of the last column to be copied!
++   */
++  numcols = abs(end - start);
+   if ((start > end) || (start > cols))
+     {
+     TIFFError ("extractContigSamplesShifted32bits", 
+@@ -3488,6 +3573,9 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+                "Invalid end column value %"PRIu32" ignored", end);
+     end = cols;
+     }
++  if (abs(end - start) > numcols) {
++      end = start + numcols;
++  }
+ 
+   /* shift_width = ((bps + 7) / 8) + 1; */ 
+   ready_bits = shift;
+@@ -5429,7 +5517,7 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+   {
+   struct offset offsets;
+   int    i;
+-  int32_t  test;
++  uint32_t uaux;
+   uint32_t seg, total, need_buff = 0;
+   uint32_t buffsize;
+   uint32_t zwidth, zlength;
+@@ -5510,8 +5598,13 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+     seg = crop->zonelist[j].position;
+     total = crop->zonelist[j].total;
+ 
+-    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip that input */
++    /* check for not allowed zone cases like 0:0; 4:3; or negative ones etc. and skip that input */
++    if (crop->zonelist[j].position < 0 || crop->zonelist[j].total < 0) {
++        TIFFError("getCropOffsets", "Negative crop zone values %d:%d are not allowed, thus skipped.", crop->zonelist[j].position, crop->zonelist[j].total);
++        continue;
++    }
+     if (seg == 0 || total == 0 || seg > total) {
++        TIFFError("getCropOffsets", "Crop zone %d:%d is out of specification, thus skipped.", seg, total);
+         continue;
+     }
+ 
+@@ -5524,17 +5617,23 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+ 
+            crop->regionlist[i].x1 = offsets.startx + 
+                                   (uint32_t)(offsets.crop_width * 1.0 * (seg - 1) / total);
+-           test = (int32_t)offsets.startx +
+-                  (int32_t)(offsets.crop_width * 1.0 * seg / total);
+-           if (test < 1 )
+-             crop->regionlist[i].x2 = 0;
+-           else
+-	     {
+-	     if (test > (int32_t)(image->width - 1))
++           /* FAULT: IMHO in the old code here, the calculation of x2 was based on wrong assumtions. The whole image was assumed and 'endy' and 'starty' are not respected anymore!*/
++           /* NEW PROPOSED Code: Assumption: offsets are within image with top left corner as origin (0,0) and 'start' <= 'end'. */
++           if (crop->regionlist[i].x1 > offsets.endx) {
++                crop->regionlist[i].x1 = offsets.endx;
++           } else if (crop->regionlist[i].x1 >= image->width) {
++               crop->regionlist[i].x1 = image->width - 1;
++           }
++
++           crop->regionlist[i].x2 = offsets.startx + (uint32_t)(offsets.crop_width * 1.0 * seg / total);
++           if (crop->regionlist[i].x2 > 0) crop->regionlist[i].x2 = crop->regionlist[i].x2 - 1;
++           if (crop->regionlist[i].x2 < crop->regionlist[i].x1) {
++               crop->regionlist[i].x2 = crop->regionlist[i].x1;
++           } else if (crop->regionlist[i].x2 > offsets.endx) {
++               crop->regionlist[i].x2 = offsets.endx;
++           } else if (crop->regionlist[i].x2 >= image->width) {
+                crop->regionlist[i].x2 = image->width - 1;
+-             else
+-	       crop->regionlist[i].x2 = test - 1;
+-             }
++           }
+            zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1  + 1;
+ 
+ 	   /* This is passed to extractCropZone or extractCompositeZones */
+@@ -5549,22 +5648,27 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+ 	   crop->regionlist[i].x1 = offsets.startx;
+            crop->regionlist[i].x2 = offsets.endx;
+ 
+-           test = offsets.endy - (uint32_t)(offsets.crop_length * 1.0 * seg / total);
+-           if (test < 1 )
+-	     crop->regionlist[i].y1 = 0;
+-           else
+-	     crop->regionlist[i].y1 = test + 1;
++           /* FAULT: IMHO in the old code here, the calculation of y1/y2 was based on wrong assumtions. The whole image was assumed and 'endy' and 'starty' are not respected anymore!*/
++           /* NEW PROPOSED Code: Assumption: offsets are within image with top left corner as origin (0,0) and 'start' <= 'end'. */
++           uaux = (uint32_t)(offsets.crop_length * 1.0 * seg / total);
++           if (uaux <= offsets.endy + 1) {
++               crop->regionlist[i].y1 = offsets.endy - uaux + 1;
++           } else {
++               crop->regionlist[i].y1 = 0;
++           }
++           if (crop->regionlist[i].y1 < offsets.starty) {
++               crop->regionlist[i].y1 = offsets.starty;
++           }
+ 
+-           test = offsets.endy - (offsets.crop_length * 1.0 * (seg - 1) / total);
+-           if (test < 1 )
+-             crop->regionlist[i].y2 = 0;
+-           else
+-	     {
+-             if (test > (int32_t)(image->length - 1))
+-               crop->regionlist[i].y2 = image->length - 1;
+-             else 
+-               crop->regionlist[i].y2 = test;
+-	     }
++           uaux = (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) / total);
++           if (uaux <= offsets.endy) {
++               crop->regionlist[i].y2 = offsets.endy - uaux;
++           } else {
++               crop->regionlist[i].y2 = 0;
++           }
++           if (crop->regionlist[i].y2 < offsets.starty) {
++               crop->regionlist[i].y2 = offsets.starty;
++           }
+            zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
+ 
+ 	   /* This is passed to extractCropZone or extractCompositeZones */
+@@ -5575,32 +5679,42 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+            crop->combined_width = (uint32_t)zwidth;
+            break;
+       case EDGE_RIGHT: /* zones from right to left, length from top */
+-           zlength = offsets.crop_length;
+-	   crop->regionlist[i].y1 = offsets.starty;
+-           crop->regionlist[i].y2 = offsets.endy;
+-
+-           crop->regionlist[i].x1 = offsets.startx +
+-                                  (uint32_t)(offsets.crop_width * (total - seg) * 1.0 / total);
+-           test = offsets.startx + 
+-	          (offsets.crop_width * (total - seg + 1) * 1.0 / total);
+-           if (test < 1 )
+-             crop->regionlist[i].x2 = 0;
+-           else
+-	     {
+-	     if (test > (int32_t)(image->width - 1))
+-               crop->regionlist[i].x2 = image->width - 1;
+-             else
+-               crop->regionlist[i].x2 = test - 1;
+-             }
+-           zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1  + 1;
++		  zlength = offsets.crop_length;
++		  crop->regionlist[i].y1 = offsets.starty;
++		  crop->regionlist[i].y2 = offsets.endy;
++
++		  crop->regionlist[i].x1 = offsets.startx +
++			  (uint32_t)(offsets.crop_width * (total - seg) * 1.0 / total);
++          /* FAULT: IMHO from here on, the calculation of y2 are based on wrong assumtions. The whole image is assumed and 'endy' and 'starty' are not respected anymore!*/
++          /* NEW PROPOSED Code: Assumption: offsets are within image with top left corner as origin (0,0) and 'start' <= 'end'. */
++          uaux = (uint32_t)(offsets.crop_width * 1.0 * seg / total);
++          if (uaux <= offsets.endx + 1) {
++              crop->regionlist[i].x1 = offsets.endx - uaux + 1;
++          } else {
++              crop->regionlist[i].x1 = 0;
++          }
++          if (crop->regionlist[i].x1 < offsets.startx) {
++              crop->regionlist[i].x1 = offsets.startx;
++          }
+ 
+-	   /* This is passed to extractCropZone or extractCompositeZones */
+-           crop->combined_length = (uint32_t)zlength;
+-           if (crop->exp_mode == COMPOSITE_IMAGES)
+-             crop->combined_width += (uint32_t)zwidth;
+-           else
+-             crop->combined_width = (uint32_t)zwidth;
+-           break;
++          uaux = (uint32_t)(offsets.crop_width * 1.0 * (seg - 1) / total);
++          if (uaux <= offsets.endx) {
++              crop->regionlist[i].x2 = offsets.endx - uaux;
++          } else {
++              crop->regionlist[i].x2 = 0;
++          }
++          if (crop->regionlist[i].x2 < offsets.startx) {
++              crop->regionlist[i].x2 = offsets.startx;
++          }
++          zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
++
++		  /* This is passed to extractCropZone or extractCompositeZones */
++		  crop->combined_length = (uint32_t)zlength;
++		  if (crop->exp_mode == COMPOSITE_IMAGES)
++			  crop->combined_width += (uint32_t)zwidth;
++		  else
++			  crop->combined_width = (uint32_t)zwidth;
++		  break;
+       case EDGE_TOP: /* width from left, zones from top to bottom */
+       default:
+            zwidth = offsets.crop_width;
+@@ -5608,6 +5722,14 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+            crop->regionlist[i].x2 = offsets.endx;
+ 
+            crop->regionlist[i].y1 = offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) / total);
++           if (crop->regionlist[i].y1 > offsets.endy) {
++               crop->regionlist[i].y1 = offsets.endy;
++           } else if (crop->regionlist[i].y1 >= image->length) {
++               crop->regionlist[i].y1 = image->length - 1;
++           }
++
++           /* FAULT: IMHO from here on, the calculation of y2 are based on wrong assumtions. The whole image is assumed and 'endy' and 'starty' are not respected anymore!*/
++           /* OLD Code: 
+            test = offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * seg / total);
+            if (test < 1 )
+              crop->regionlist[i].y2 = 0;
+@@ -5618,6 +5740,18 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+              else
+ 	       crop->regionlist[i].y2 = test - 1;
+ 	     }
++           */
++		   /* NEW PROPOSED Code: Assumption: offsets are within image with top left corner as origin (0,0) and 'start' <= 'end'. */
++		   crop->regionlist[i].y2 = offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * seg / total);
++           if (crop->regionlist[i].y2 > 0)crop->regionlist[i].y2 = crop->regionlist[i].y2 - 1;
++		   if (crop->regionlist[i].y2 < crop->regionlist[i].y1) {
++			   crop->regionlist[i].y2 = crop->regionlist[i].y1;
++		   } else if (crop->regionlist[i].y2 > offsets.endy) {
++			   crop->regionlist[i].y2 = offsets.endy;
++		   } else if (crop->regionlist[i].y2 >= image->length) {
++			   crop->regionlist[i].y2 = image->length - 1;
++		   }
++
+            zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
+ 
+ 	   /* This is passed to extractCropZone or extractCompositeZones */
+@@ -7551,7 +7685,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+     total_width = total_length = 0;
+     for (i = 0; i < crop->selections; i++)
+       {
+-      cropsize = crop->bufftotal;
++
++        cropsize = crop->bufftotal;
+       crop_buff = seg_buffs[i].buffer; 
+       if (!crop_buff)
+         crop_buff = (unsigned char *)limitMalloc(cropsize);
+@@ -7640,6 +7775,9 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+ 
+       if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+         {
++          /* rotateImage() changes image->width, ->length, ->xres and ->yres, what it schouldn't do here, when more than one section is processed. 
++           * ToDo: Therefore rotateImage() and its usage has to be reworked (e.g. like mirrorImage()) !!
++           */
+ 	if (rotateImage(crop->rotation, image, &crop->regionlist[i].width, 
+ 			&crop->regionlist[i].length, &crop_buff))
+           {
+@@ -7655,8 +7793,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         seg_buffs[i].size = (((crop->regionlist[i].width * image->bps + 7 ) / 8)
+                                * image->spp) * crop->regionlist[i].length; 
+         }
+-      }
+-    }
++      }  /* for crop->selections loop */
++    }  /* Separated Images (else case) */
+   return (0);
+   } /* end processCropSelections */
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
new file mode 100644
index 0000000000..3a3a915688
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
@@ -0,0 +1,87 @@
+CVE: CVE-2022-2953
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
+
+From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Mon, 15 Aug 2022 22:11:03 +0200
+Subject: [PATCH] =?UTF-8?q?According=20to=20Richard=20Nolde=20https://gitl?=
+ =?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=5F877637400=20the=20ti?=
+ =?UTF-8?q?ffcrop=20option=20=E2=80=9E-S=E2=80=9C=20is=20also=20mutually?=
+ =?UTF-8?q?=20exclusive=20to=20the=20other=20crop=20options=20(-X|-Y),=20-?=
+ =?UTF-8?q?Z=20and=20-z.?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is now checked and ends tiffcrop if those arguments are not mutually exclusive.
+
+This MR will fix the following tiffcrop issues: #349, #414, #422, #423, #424
+---
+ tools/tiffcrop.c | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 90286a5e..c3b758ec 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] = "02-09-2022";
+ #define ROTATECW_270 32
+ #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
+ 
+-#define CROP_NONE     0
+-#define CROP_MARGINS  1
+-#define CROP_WIDTH    2
+-#define CROP_LENGTH   4
+-#define CROP_ZONES    8
+-#define CROP_REGIONS 16
++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page->rows/->cols != 0 */
++#define CROP_MARGINS  1     /* "-m" */
++#define CROP_WIDTH    2     /* "-X" */
++#define CROP_LENGTH   4     /* "-Y" */
++#define CROP_ZONES    8     /* "-Z" */
++#define CROP_REGIONS 16     /* "-z" */
+ #define CROP_ROTATE  32
+ #define CROP_MIRROR  64
+ #define CROP_INVERT 128
+@@ -316,7 +316,7 @@ struct crop_mask {
+ #define PAGE_MODE_RESOLUTION   1
+ #define PAGE_MODE_PAPERSIZE    2
+ #define PAGE_MODE_MARGINS      4
+-#define PAGE_MODE_ROWSCOLS     8
++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
+ 
+ #define INVERT_DATA_ONLY      10
+ #define INVERT_DATA_AND_TAG   11
+@@ -781,7 +781,7 @@ static const char usage_info[] =
+ "             The four debug/dump options are independent, though it makes little sense to\n"
+ "             specify a dump file without specifying a detail level.\n"
+ "\n"
+-"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n"
++"Note:        The (-X|-Y), -Z, -z and -S options are mutually exclusive.\n"
+ "             In no case should the options be applied to a given selection successively.\n"
+ "\n"
+ ;
+@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+ 		/*NOTREACHED*/
+       }
+     }
+-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z are mutually exclusive) --*/
+-    char XY, Z, R;
++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z and -S are mutually exclusive) --*/
++    char XY, Z, R, S;
+     XY = ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mode & CROP_LENGTH));
+     Z = (crop_data->crop_mode & CROP_ZONES);
+     R = (crop_data->crop_mode & CROP_REGIONS);
+-    if ((XY && Z) || (XY && R) || (Z && R)) {
+-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z and -z are mutually exclusive.->Exit");
++    S = (page->mode & PAGE_MODE_ROWSCOLS);
++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) || (R && S)) {
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z, -z and -S are mutually exclusive.->Exit");
+         exit(EXIT_FAILURE);
+     }
+   }  /* end process_command_opts */
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index f84057c46b..29a2c38d8e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-2869.patch \
            file://CVE-2022-2867.patch \
            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
+           file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
+           file://CVE-2022-2953.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


