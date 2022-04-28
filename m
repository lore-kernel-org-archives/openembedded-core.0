Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E69AC433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 21:47:21 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.2996.1651182434300789118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1BjfsS0b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id n18so5499452plg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=um4bSmZRomlxzWEvQK94NHv2rSO4nhVf67uZxVO1g3s=;
        b=1BjfsS0bSSoutXo4LmxUzM6UoXDpl5iomKxkOoTvtbyTmu7UFkKmDFRHfW/aIpGD9y
         0hyZ5xTWwezu/aN8x8iGKGjxBbGtwCrHqlH58NjO8p5a2rgLezwbgp3OOz4RxlSPm/Nv
         gpH6lSSuTXpZKuTHShy+fbRUhrJcptIhgVDy+ruaILShlGktHsxWFowVRolKD39BGeKg
         DcBOCR7d0IC5XI4/Meeb7qcCBH77rKulfQTDFxEXn6CpiEy6dgDOx8zBZrYQRu82p3ui
         YVFS4T7iDnE9sbd4symClLm8n1p4XoYHBYy5PeK67Vs7InAhh5W9VZMFLFURKCNZOJdk
         7p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=um4bSmZRomlxzWEvQK94NHv2rSO4nhVf67uZxVO1g3s=;
        b=dcagxjmu0vpgAYy6J1Qa6MJIt3DYN8Sb+0laWVdP8jYcwH6WXcea+UsojMJxIg6aKj
         hJ0DGyOHx2myrXUdtfi97ZdpPhUx62lWN4hDfj5noBFvuM7I7CScOYJze4owg9sRsu3U
         FHMNsavcnJ5Q8J8zY/9ZQC2000iawgbGA915SqHZppWb6k+rfURpayZ/bTeqlbWtbhMv
         /psHQ6w9waS+YPOUPqA1J3PwQU8BkIbhFHqLG7j5tA/F2BNaDXb5PUDHyNMzCHAmfNfg
         KrK+pWd5rGc+Spw9EqJqW0p8rs9Hx9QKHKxzjhDzKF2AfsBS0MdqvU6e4sDRIABE3Kqm
         H3PA==
X-Gm-Message-State: AOAM5301V6o8N7tz57/uwEhWaoxwhe1kL9ky+jiCSZrfwLGtLq2ZZW7+
	LaEwSDw+kH+zRr+zOggqdVVNbkHkl1jDFVhWUNE=
X-Google-Smtp-Source: 
 ABdhPJy4M7DKcaNFOXVg8yXBsuV6Cuab7NJ6HvMB7nw4aw60wNBo3upPQeZdP21t8Ud7tqEPyfEcmw==
X-Received: by 2002:a17:903:1205:b0:151:8ae9:93ea with SMTP id
 l5-20020a170903120500b001518ae993eamr35540408plh.37.1651182432906;
        Thu, 28 Apr 2022 14:47:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 c138-20020a624e90000000b005081f92826dsm749742pfb.99.2022.04.28.14.47.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:47:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] tiff: Fix CVE-2022-0891
Date: Thu, 28 Apr 2022 11:46:31 -1000
Message-Id: 
 <512a8b30c816d2c9d85af7d7a1850b0450f1b6f4.1651182153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651182153.git.steve@sakoman.com>
References: <cover.1651182153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 21:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164979

From: sana kazi <sanakazisk19@gmail.com>

Fix CVE-2022-0891 for tiff

Link: https://sources.debian.org/src/tiff/4.1.0+git191117-2%7Edeb10u4/debian/patches/CVE-2022-0891.patch/

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2022-0891.patch         | 217 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0891.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-0891.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-0891.patch
new file mode 100644
index 0000000000..e2f1bd3056
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-0891.patch
@@ -0,0 +1,217 @@
+From 232282fd8f9c21eefe8d2d2b96cdbbb172fe7b7c Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Tue, 8 Mar 2022 17:02:44 +0000
+Subject: [PATCH] tiffcrop: fix issue #380 and #382 heap buffer overflow in
+ extractImageSection
+
+CVE: CVE-2022-0891
+Upstream-Status: Backport [https://sources.debian.org/src/tiff/4.1.0+git191117-2%7Edeb10u4/debian/patches/CVE-2022-0891.patch/]
+Comment: No change in any hunk
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ tools/tiffcrop.c | 92 +++++++++++++++++++-----------------------------
+ 1 file changed, 36 insertions(+), 56 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index f2e5474a..e62bcc71 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -105,8 +105,8 @@
+  *                of messages to monitor progess without enabling dump logs.
+  */
+ 
+-static   char tiffcrop_version_id[] = "2.4";
+-static   char tiffcrop_rev_date[] = "12-13-2010";
++static   char tiffcrop_version_id[] = "2.4.1";
++static   char tiffcrop_rev_date[] = "03-03-2010";
+ 
+ #include "tif_config.h"
+ #include "tiffiop.h"
+@@ -6670,10 +6670,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #ifdef DEVELMODE
+   uint32    img_length;
+ #endif
+-  uint32    j, shift1, shift2, trailing_bits;
++  uint32    j, shift1, trailing_bits;
+   uint32    row, first_row, last_row, first_col, last_col;
+   uint32    src_offset, dst_offset, row_offset, col_offset;
+-  uint32    offset1, offset2, full_bytes;
++  uint32    offset1, full_bytes;
+   uint32    sect_width;
+ #ifdef DEVELMODE
+   uint32    sect_length;
+@@ -6683,7 +6683,6 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #ifdef DEVELMODE
+   int      k;
+   unsigned char bitset;
+-  static char *bitarray = NULL;
+ #endif
+ 
+   img_width = image->width;
+@@ -6701,17 +6700,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+   dst_offset = 0;
+ 
+ #ifdef DEVELMODE
+-  if (bitarray == NULL)
+-    {
+-    if ((bitarray = (char *)malloc(img_width)) == NULL)
+-      {
+-      TIFFError ("", "DEBUG: Unable to allocate debugging bitarray");
+-      return (-1);
+-      }
+-    }
++  char bitarray[39];
+ #endif
+ 
+-  /* rows, columns, width, length are expressed in pixels */
++  /* rows, columns, width, length are expressed in pixels
++   * first_row, last_row, .. are index into image array starting at 0 to width-1,
++   * last_col shall be also extracted.  */
+   first_row = section->y1;
+   last_row  = section->y2;
+   first_col = section->x1;
+@@ -6721,9 +6715,14 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #ifdef DEVELMODE
+   sect_length = last_row - first_row + 1;
+ #endif
+-  img_rowsize = ((img_width * bps + 7) / 8) * spp;
+-  full_bytes = (sect_width * spp * bps) / 8;   /* number of COMPLETE bytes per row in section */
+-  trailing_bits = (sect_width * bps) % 8;
++    /* The read function loadImage() used copy separate plane data into a buffer as interleaved
++     * samples rather than separate planes so the same logic works to extract regions
++     * regardless of the way the data are organized in the input file.
++     * Furthermore, bytes and bits are arranged in buffer according to COMPRESSION=1 and FILLORDER=1 
++     */
++    img_rowsize = (((img_width * spp * bps) + 7) / 8);    /* row size in full bytes of source image */
++    full_bytes = (sect_width * spp * bps) / 8;            /* number of COMPLETE bytes per row in section */
++    trailing_bits = (sect_width * spp * bps) % 8;         /* trailing bits within the last byte of destination buffer */
+ 
+ #ifdef DEVELMODE
+     TIFFError ("", "First row: %d, last row: %d, First col: %d, last col: %d\n",
+@@ -6736,10 +6735,9 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ 
+   if ((bps % 8) == 0)
+     {
+-    col_offset = first_col * spp * bps / 8;
++    col_offset = (first_col * spp * bps) / 8;
+     for (row = first_row; row <= last_row; row++)
+       {
+-      /* row_offset = row * img_width * spp * bps / 8; */
+       row_offset = row * img_rowsize;
+       src_offset = row_offset + col_offset;
+ 
+@@ -6752,14 +6750,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+     }
+   else
+     { /* bps != 8 */
+-    shift1  = spp * ((first_col * bps) % 8);
+-    shift2  = spp * ((last_col * bps) % 8);
++    shift1 = ((first_col * spp * bps) % 8);           /* shift1 = bits to skip in the first byte of source buffer*/
+     for (row = first_row; row <= last_row; row++)
+       {
+       /* pull out the first byte */
+       row_offset = row * img_rowsize;
+-      offset1 = row_offset + (first_col * bps / 8);
+-      offset2 = row_offset + (last_col * bps / 8);
++      offset1 = row_offset + ((first_col * spp * bps) / 8);   /* offset1 = offset into source of byte with first bits to be extracted */
+ 
+ #ifdef DEVELMODE
+       for (j = 0, k = 7; j < 8; j++, k--)
+@@ -6771,12 +6767,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+       sprintf(&bitarray[9], " ");
+       for (j = 10, k = 7; j < 18; j++, k--)
+         {
+-        bitset = *(src_buff + offset2) & (((unsigned char)1 << k)) ? 1 : 0;
++        bitset = *(src_buff + offset1 + full_bytes) & (((unsigned char)1 << k)) ? 1 : 0;
+         sprintf(&bitarray[j], (bitset) ? "1" : "0");
+         }
+       bitarray[18] = '\0';
+-      TIFFError ("", "Row: %3d Offset1: %d,  Shift1: %d,    Offset2: %d,  Shift2:  %d\n", 
+-                 row, offset1, shift1, offset2, shift2); 
++      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Trailing_bits:  %"PRIu32"\n", 
++                 row, offset1, shift1, offset1+full_bytes, trailing_bits); 
+ #endif
+ 
+       bytebuff1 = bytebuff2 = 0;
+@@ -6800,11 +6796,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ 
+         if (trailing_bits != 0)
+           {
+-	  bytebuff2 = src_buff[offset2] & ((unsigned char)255 << (7 - shift2));
++      /* Only copy higher bits of samples and mask lower bits of not wanted column samples to zero */
++	  bytebuff2 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (8 - trailing_bits));
+           sect_buff[dst_offset] = bytebuff2;
+ #ifdef DEVELMODE
+ 	  TIFFError ("", "        Trailing bits src offset:  %8d, Dst offset: %8d\n", 
+-                              offset2, dst_offset); 
++          offset1 + full_bytes, dst_offset);
+           for (j = 30, k = 7; j < 38; j++, k--)
+             {
+             bitset = *(sect_buff + dst_offset) & (((unsigned char)1 << k)) ? 1 : 0;
+@@ -6823,8 +6820,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #endif
+         for (j = 0; j <= full_bytes; j++) 
+           {
+-	  bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
+-	  bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (7 - shift1));
++          /* Skip the first shift1 bits and shift the source up by shift1 bits before save to destination.*/
++          /* Attention: src_buff size needs to be some bytes larger than image size, because could read behind image here. */
++          bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
++          bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (8 - shift1));
+           sect_buff[dst_offset + j] = (bytebuff1 << shift1) | (bytebuff2 >> (8 - shift1));
+           }
+ #ifdef DEVELMODE
+@@ -6840,36 +6839,17 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #endif
+         dst_offset += full_bytes;
+ 
++        /* Copy the trailing_bits for the last byte in the destination buffer. 
++           Could come from one ore two bytes of the source buffer. */
+         if (trailing_bits != 0)
+           {
+ #ifdef DEVELMODE
+-	    TIFFError ("", "        Trailing bits   src offset: %8d, Dst offset: %8d\n", offset1 + full_bytes, dst_offset); 
+-#endif
+-	  if (shift2 > shift1)
+-            {
+-	    bytebuff1 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (7 - shift2));
+-            bytebuff2 = bytebuff1 & ((unsigned char)255 << shift1);
+-            sect_buff[dst_offset] = bytebuff2;
+-#ifdef DEVELMODE
+-	    TIFFError ("", "        Shift2 > Shift1\n"); 
++          TIFFError("", "        Trailing bits %4"PRIu32"   src offset: %8"PRIu32", Dst offset: %8"PRIu32"\n", trailing_bits, offset1 + full_bytes, dst_offset);
+ #endif
++          /* More than necessary bits are already copied into last destination buffer, 
++           * only masking of last byte in destination buffer is necessary.*/ 
++          sect_buff[dst_offset] &= ((uint8_t)0xFF << (8 - trailing_bits));
+             }
+-          else
+-            {
+-	    if (shift2 < shift1)
+-              {
+-              bytebuff2 = ((unsigned char)255 << (shift1 - shift2 - 1));
+-	      sect_buff[dst_offset] &= bytebuff2;
+-#ifdef DEVELMODE
+-	      TIFFError ("", "        Shift2 < Shift1\n"); 
+-#endif
+-              }
+-#ifdef DEVELMODE
+-            else
+-	      TIFFError ("", "        Shift2 == Shift1\n"); 
+-#endif
+-            }
+-	  }
+ #ifdef DEVELMODE
+ 	  sprintf(&bitarray[28], " ");
+ 	  sprintf(&bitarray[29], " ");
+@@ -7022,7 +7002,7 @@ writeImageSections(TIFF *in, TIFF *out, struct image_data *image,
+     width  = sections[i].x2 - sections[i].x1 + 1;
+     length = sections[i].y2 - sections[i].y1 + 1;
+     sectsize = (uint32)
+-	    ceil((width * image->bps + 7) / (double)8) * image->spp * length;
++	    ceil((width * image->bps * image->spp + 7) / (double)8) * length;
+     /* allocate a buffer if we don't have one already */
+     if (createImageSection(sectsize, sect_buff_ptr))
+       {
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 9db247ecc7..e3ffb12f9e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
            file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
            file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch \
+           file://CVE-2022-0891.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


