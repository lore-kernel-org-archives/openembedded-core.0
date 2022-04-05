Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E865C352A7
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IwPFON1z;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169717; x=1680705717;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oX0BrId7XiX0z2G+BHPAu9+FRNFTt772viQkOH4RFOI=;
  b=IwPFON1z822bdJO5SpALwMZli+olj2PuF3PeavKUKhT9tgJUpr1Ne1bt
   xCxq2LPnUTFRHWjVe+cCFIr+bh0Oi8QtxlDSmTTY3a+kJ4Vxprc+qxHzX
   VK5PjWD6pdv+NMEl5X6zG+bdpMR/sZ/ys5rEKzCqj7jwO6wC2zWsKXiir
   y9da49k5cj82L0KUatg/kvycDUp70IkXl965trQQiEJBnaxj5UtXBYR3X
   0oopJLpboNzHuNDgfK3/FciRCIh3/t43m/qh6ffHZ4hLmeIcNNO2QXFkv
   otD7Kj5Z6zoK08hpUAjOd7rVf46EHTXIFixUXp1tZ73GsiNM5FsPWKTr/
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348702"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348702"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953561"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:55 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/22] tiff: backport CVE fixes:
Date: Tue,  5 Apr 2022 22:41:26 +0800
Message-Id: 
 <867ed9f5601250940cbddb618847b6ef2cc1b49d.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164025

From: Ross Burton <ross@burtonini.com>

Backport fixes for the following CVEs:

- CVE-2022-0865
- CVE-2022-0891
- CVE-2022-0907
- CVE-2022-0908
- CVE-2022-0909
- CVE-2022-0924

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2fe35de73cfa8de444d7ffb24246e8f87c36ee8d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...rash-when-reading-a-file-with-multip.patch |  38 +++
 ...ue-380-and-382-heap-buffer-overflow-.patch | 218 ++++++++++++++++++
 ...-for-return-value-of-limitMalloc-392.patch |  93 ++++++++
 ...ag-avoid-calling-memcpy-with-a-null-.patch |  33 +++
 .../0005-fix-the-FPE-in-tiffcrop-393.patch    |  36 +++
 ...x-heap-buffer-overflow-in-tiffcp-278.patch |  57 +++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   9 +-
 7 files changed, 483 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
new file mode 100644
index 0000000000..f1a4ab4251
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
@@ -0,0 +1,38 @@
+CVE: CVE-2022-0865
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 88da11ae3c4db527cb870fb1017456cc8fbac2e7 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 24 Feb 2022 22:26:02 +0100
+Subject: [PATCH 1/6] tif_jbig.c: fix crash when reading a file with multiple
+ IFD in memory-mapped mode and when bit reversal is needed (fixes #385)
+
+---
+ libtiff/tif_jbig.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
+index 74086338..8bfa4cef 100644
+--- a/libtiff/tif_jbig.c
++++ b/libtiff/tif_jbig.c
+@@ -209,6 +209,16 @@ int TIFFInitJBIG(TIFF* tif, int scheme)
+ 	 */
+ 	tif->tif_flags |= TIFF_NOBITREV;
+ 	tif->tif_flags &= ~TIFF_MAPPED;
++	/* We may have read from a previous IFD and thus set TIFF_BUFFERMMAP and
++	 * cleared TIFF_MYBUFFER. It is necessary to restore them to their initial
++	 * value to be consistent with the state of a non-memory mapped file.
++	 */
++	if (tif->tif_flags&TIFF_BUFFERMMAP) {
++		tif->tif_rawdata = NULL;
++		tif->tif_rawdatasize = 0;
++		tif->tif_flags &= ~TIFF_BUFFERMMAP;
++		tif->tif_flags |= TIFF_MYBUFFER;
++	}
+ 
+ 	/* Setup the function pointers for encode, decode, and cleanup. */
+ 	tif->tif_setupdecode = JBIGSetupDecode;
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
new file mode 100644
index 0000000000..d31e9650d1
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
@@ -0,0 +1,218 @@
+CVE: CVE-2022-0891
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From e46b49e60fddb2e924302fb1751f79eb9cfb2253 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Tue, 8 Mar 2022 17:02:44 +0000
+Subject: [PATCH 2/6] tiffcrop: fix issue #380 and #382 heap buffer overflow in
+ extractImageSection
+
+---
+ tools/tiffcrop.c | 92 +++++++++++++++++++-----------------------------
+ 1 file changed, 36 insertions(+), 56 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index b85c2ce7..302a7e91 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -105,8 +105,8 @@
+  *                of messages to monitor progress without enabling dump logs.
+  */
+ 
+-static   char tiffcrop_version_id[] = "2.4";
+-static   char tiffcrop_rev_date[] = "12-13-2010";
++static   char tiffcrop_version_id[] = "2.4.1";
++static   char tiffcrop_rev_date[] = "03-03-2010";
+ 
+ #include "tif_config.h"
+ #include "libport.h"
+@@ -6710,10 +6710,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #ifdef DEVELMODE
+   uint32_t    img_length;
+ #endif
+-  uint32_t    j, shift1, shift2, trailing_bits;
++  uint32_t    j, shift1, trailing_bits;
+   uint32_t    row, first_row, last_row, first_col, last_col;
+   uint32_t    src_offset, dst_offset, row_offset, col_offset;
+-  uint32_t    offset1, offset2, full_bytes;
++  uint32_t    offset1, full_bytes;
+   uint32_t    sect_width;
+ #ifdef DEVELMODE
+   uint32_t    sect_length;
+@@ -6723,7 +6723,6 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #ifdef DEVELMODE
+   int      k;
+   unsigned char bitset;
+-  static char *bitarray = NULL;
+ #endif
+ 
+   img_width = image->width;
+@@ -6741,17 +6740,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
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
+@@ -6761,9 +6755,14 @@ extractImageSection(struct image_data *image, struct pageseg *section,
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
+     TIFFError ("", "First row: %"PRIu32", last row: %"PRIu32", First col: %"PRIu32", last col: %"PRIu32"\n",
+@@ -6776,10 +6775,9 @@ extractImageSection(struct image_data *image, struct pageseg *section,
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
+@@ -6792,14 +6790,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
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
+@@ -6811,12 +6807,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+       sprintf(&bitarray[9], " ");
+       for (j = 10, k = 7; j < 18; j++, k--)
+         {
+-        bitset = *(src_buff + offset2) & (((unsigned char)1 << k)) ? 1 : 0;
++        bitset = *(src_buff + offset1 + full_bytes) & (((unsigned char)1 << k)) ? 1 : 0;
+         sprintf(&bitarray[j], (bitset) ? "1" : "0");
+         }
+       bitarray[18] = '\0';
+-      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Shift2:  %"PRIu32"\n", 
+-                 row, offset1, shift1, offset2, shift2); 
++      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Trailing_bits:  %"PRIu32"\n", 
++                 row, offset1, shift1, offset1+full_bytes, trailing_bits); 
+ #endif
+ 
+       bytebuff1 = bytebuff2 = 0;
+@@ -6840,11 +6836,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ 
+         if (trailing_bits != 0)
+           {
+-	  bytebuff2 = src_buff[offset2] & ((unsigned char)255 << (7 - shift2));
++      /* Only copy higher bits of samples and mask lower bits of not wanted column samples to zero */
++	  bytebuff2 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (8 - trailing_bits));
+           sect_buff[dst_offset] = bytebuff2;
+ #ifdef DEVELMODE
+ 	  TIFFError ("", "        Trailing bits src offset:  %8"PRIu32", Dst offset: %8"PRIu32"\n",
+-                              offset2, dst_offset); 
++          offset1 + full_bytes, dst_offset);
+           for (j = 30, k = 7; j < 38; j++, k--)
+             {
+             bitset = *(sect_buff + dst_offset) & (((unsigned char)1 << k)) ? 1 : 0;
+@@ -6863,8 +6860,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
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
+@@ -6880,36 +6879,17 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #endif
+         dst_offset += full_bytes;
+ 
++        /* Copy the trailing_bits for the last byte in the destination buffer. 
++           Could come from one ore two bytes of the source buffer. */
+         if (trailing_bits != 0)
+           {
+ #ifdef DEVELMODE
+-	    TIFFError ("", "        Trailing bits   src offset: %8"PRIu32", Dst offset: %8"PRIu32"\n", offset1 + full_bytes, dst_offset);
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
+@@ -7062,7 +7042,7 @@ writeImageSections(TIFF *in, TIFF *out, struct image_data *image,
+     width  = sections[i].x2 - sections[i].x1 + 1;
+     length = sections[i].y2 - sections[i].y1 + 1;
+     sectsize = (uint32_t)
+-	    ceil((width * image->bps + 7) / (double)8) * image->spp * length;
++	    ceil((width * image->bps * image->spp + 7) / (double)8) * length;
+     /* allocate a buffer if we don't have one already */
+     if (createImageSection(sectsize, sect_buff_ptr))
+       {
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch b/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
new file mode 100644
index 0000000000..a0b856b9e1
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
@@ -0,0 +1,93 @@
+CVE: CVE-2022-0907
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a139191cc86f4dc44c74a0f22928e0fb38ed2485 Mon Sep 17 00:00:00 2001
+From: Augustus <wangdw.augustus@qq.com>
+Date: Mon, 7 Mar 2022 18:21:49 +0800
+Subject: [PATCH 3/6] add checks for return value of limitMalloc (#392)
+
+---
+ tools/tiffcrop.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 302a7e91..e407bf51 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -7357,7 +7357,11 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
+   if (!sect_buff)
+     {
+     sect_buff = (unsigned char *)limitMalloc(sectsize);
+-    *sect_buff_ptr = sect_buff;
++    if (!sect_buff)
++    {
++        TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
++        return (-1);
++    }
+     _TIFFmemset(sect_buff, 0, sectsize);
+     }
+   else
+@@ -7373,15 +7377,15 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
+       else
+         sect_buff = new_buff;
+ 
++      if (!sect_buff)
++      {
++          TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
++          return (-1);
++      }
+       _TIFFmemset(sect_buff, 0, sectsize);
+       }
+     }
+ 
+-  if (!sect_buff)
+-    {
+-    TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
+-    return (-1);
+-    }
+   prev_sectsize = sectsize;
+   *sect_buff_ptr = sect_buff;
+ 
+@@ -7648,7 +7652,11 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   if (!crop_buff)
+     {
+     crop_buff = (unsigned char *)limitMalloc(cropsize);
+-    *crop_buff_ptr = crop_buff;
++    if (!crop_buff)
++    {
++        TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
++        return (-1);
++    }
+     _TIFFmemset(crop_buff, 0, cropsize);
+     prev_cropsize = cropsize;
+     }
+@@ -7664,15 +7672,15 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+         }
+       else
+         crop_buff = new_buff;
++      if (!crop_buff)
++      {
++          TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
++          return (-1);
++      }
+       _TIFFmemset(crop_buff, 0, cropsize);
+       }
+     }
+ 
+-  if (!crop_buff)
+-    {
+-    TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
+-    return (-1);
+-    }
+   *crop_buff_ptr = crop_buff;
+ 
+   if (crop->crop_mode & CROP_INVERT)
+@@ -9231,3 +9239,4 @@ invertImage(uint16_t photometric, uint16_t spp, uint16_t bps, uint32_t width, ui
+  * fill-column: 78
+  * End:
+  */
++
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch b/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
new file mode 100644
index 0000000000..719dabaecc
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2022-0908
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ef5a0bf271823df168642444d051528a68205cb0 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 17 Feb 2022 15:28:43 +0100
+Subject: [PATCH 4/6] TIFFFetchNormalTag(): avoid calling memcpy() with a null
+ source pointer and size of zero (fixes #383)
+
+---
+ libtiff/tif_dirread.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index d84147a0..4e8ce729 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -5079,7 +5079,10 @@ TIFFFetchNormalTag(TIFF* tif, TIFFDirEntry* dp, int recover)
+ 								_TIFFfree(data);
+ 							return(0);
+ 						}
+-						_TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
++						if (dp->tdir_count > 0 )
++						{
++							_TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
++						}
+ 						o[(uint32_t)dp->tdir_count]=0;
+ 						if (data!=0)
+ 							_TIFFfree(data);
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
new file mode 100644
index 0000000000..64dbe9ef92
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
@@ -0,0 +1,36 @@
+CVE: CVE-2022-0909
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 4768355a074d562177e0a8b551c561d1af7eb74a Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 8 Mar 2022 16:22:04 +0000
+Subject: [PATCH 5/6] fix the FPE in tiffcrop (#393)
+
+---
+ libtiff/tif_dir.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
+index a6c254fc..77da6ea4 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -335,13 +335,13 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap)
+ 		break;
+ 	case TIFFTAG_XRESOLUTION:
+         dblval = va_arg(ap, double);
+-        if( dblval < 0 )
++        if( dblval != dblval || dblval < 0 )
+             goto badvaluedouble;
+ 		td->td_xresolution = _TIFFClampDoubleToFloat( dblval );
+ 		break;
+ 	case TIFFTAG_YRESOLUTION:
+         dblval = va_arg(ap, double);
+-        if( dblval < 0 )
++        if( dblval != dblval || dblval < 0 )
+             goto badvaluedouble;
+ 		td->td_yresolution = _TIFFClampDoubleToFloat( dblval );
+ 		break;
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch b/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
new file mode 100644
index 0000000000..afd5e59960
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
@@ -0,0 +1,57 @@
+CVE: CVE-2022-0924
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 1074b9691322b1e3671cd8ea0b6b3509d08978fb Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Thu, 10 Mar 2022 08:48:00 +0000
+Subject: [PATCH 6/6] fix heap buffer overflow in tiffcp (#278)
+
+---
+ tools/tiffcp.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 1f889516..552d8fad 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1661,12 +1661,27 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
+ 	tdata_t obuf;
+ 	tstrip_t strip = 0;
+ 	tsample_t s;
++	uint16_t bps = 0, bytes_per_sample;
+ 
+ 	obuf = limitMalloc(stripsize);
+ 	if (obuf == NULL)
+ 		return (0);
+ 	_TIFFmemset(obuf, 0, stripsize);
+ 	(void) TIFFGetFieldDefaulted(out, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
++	(void) TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps);
++	if( bps == 0 )
++        {
++            TIFFError(TIFFFileName(out), "Error, cannot read BitsPerSample");
++            _TIFFfree(obuf);
++            return 0;
++        }
++        if( (bps % 8) != 0 )
++        {
++            TIFFError(TIFFFileName(out), "Error, cannot handle BitsPerSample that is not a multiple of 8");
++            _TIFFfree(obuf);
++            return 0;
++        }
++	bytes_per_sample = bps/8;
+ 	for (s = 0; s < spp; s++) {
+ 		uint32_t row;
+ 		for (row = 0; row < imagelength; row += rowsperstrip) {
+@@ -1676,7 +1691,7 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
+ 
+ 			cpContigBufToSeparateBuf(
+ 			    obuf, (uint8_t*) buf + row * rowsize + s,
+-			    nrows, imagewidth, 0, 0, spp, 1);
++			    nrows, imagewidth, 0, 0, spp, bytes_per_sample);
+ 			if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0) {
+ 				TIFFError(TIFFFileName(out),
+ 				    "Error, can't write strip %"PRIu32,
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 86b55ad284..0a82f0d780 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -11,7 +11,14 @@ CVE_PRODUCT = "libtiff"
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
            file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
-           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch"
+           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch \
+           file://0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch \
+           file://0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch \
+           file://0003-add-checks-for-return-value-of-limitMalloc-392.patch \
+           file://0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch \
+           file://0005-fix-the-FPE-in-tiffcrop-393.patch \
+           file://0006-fix-heap-buffer-overflow-in-tiffcp-278.patch \
+           "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
 
-- 
2.35.1


