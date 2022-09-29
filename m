Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0904EC07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 08:33:35 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.8007.1664440406631181905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 01:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kQkyj2+l;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664440406; x=1695976406;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9lQhqCKH3pLDT76ltsQbc6bQvGiPfChp2Tcg3Ei7Vd4=;
  b=kQkyj2+ljBDStdZ3TyJPLKitARfZ5vPpwLJzxNny6sAvWJUgYpvALt7D
   xGsVv6cAPCMz3iNhDUT4Ej12l3JgJh6B56J9WEyFFErU1No/MqQPbjfdN
   Sg94XNrJi4m1gfqZXUPoU0n08wjLR2I+rP6gwfUJrjhIPGoazr9sMm/D5
   zo7hg/9c3NWyA41WjowwBILFLvFMo8Fmo3KfqjrarQB4YL7UY5fmXzU7u
   LgSZWIb8bLcUhy32nAK9IQ+YduI0a/D16KRa7avuAYNIc0wqCx/FTEYrE
   EGtZ7jyYhloh9MiDHmts+cVmZiw2RDTfRKiATErnlD9NxRW3aghgQJ+7v
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="301806914"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200";
   d="scan'208";a="301806914"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 01:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="684747862"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200";
   d="scan'208";a="684747862"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2022 01:33:24 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 1/2] tiff: update 4.3.0 -> 4.4.0
Date: Thu, 29 Sep 2022 16:33:18 +0800
Message-Id: <20220929083319.2225406-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 08:33:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171174

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

-Drop all CVE backports for tiff_4.3.0
-Update include fixes for:
 CVE-2022-2867 [https://bugzilla.redhat.com/show_bug.cgi?id=2118847],
 CVE-2022-2868 [https://bugzilla.redhat.com/show_bug.cgi?id=2118863],
 CVE-2022-2869 [https://bugzilla.redhat.com/show_bug.cgi?id=2118869]

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 ...rash-when-reading-a-file-with-multip.patch |  38 ---
 ...al-buffer-overflow-for-ASCII-tags-wh.patch |  43 ----
 ...ue-380-and-382-heap-buffer-overflow-.patch | 219 ------------------
 ...-for-return-value-of-limitMalloc-392.patch |  93 --------
 ...ag-avoid-calling-memcpy-with-a-null-.patch |  33 ---
 .../0005-fix-the-FPE-in-tiffcrop-393.patch    |  36 ---
 ...x-heap-buffer-overflow-in-tiffcp-278.patch |  57 -----
 ...99c99f987dc32ae110370cfdd7df7975586b.patch |  30 ---
 .../libtiff/tiff/CVE-2022-1354.patch          | 212 -----------------
 .../libtiff/tiff/CVE-2022-1355.patch          |  62 -----
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch |  32 ---
 .../libtiff/{tiff_4.3.0.bb => tiff_4.4.0.bb}  |  13 +-
 12 files changed, 1 insertion(+), 867 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.3.0.bb => tiff_4.4.0.bb} (75%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
deleted file mode 100644
index f1a4ab4251..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-CVE: CVE-2022-0865
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 88da11ae3c4db527cb870fb1017456cc8fbac2e7 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 24 Feb 2022 22:26:02 +0100
-Subject: [PATCH 1/6] tif_jbig.c: fix crash when reading a file with multiple
- IFD in memory-mapped mode and when bit reversal is needed (fixes #385)
-
----
- libtiff/tif_jbig.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
-index 74086338..8bfa4cef 100644
---- a/libtiff/tif_jbig.c
-+++ b/libtiff/tif_jbig.c
-@@ -209,6 +209,16 @@ int TIFFInitJBIG(TIFF* tif, int scheme)
- 	 */
- 	tif->tif_flags |= TIFF_NOBITREV;
- 	tif->tif_flags &= ~TIFF_MAPPED;
-+	/* We may have read from a previous IFD and thus set TIFF_BUFFERMMAP and
-+	 * cleared TIFF_MYBUFFER. It is necessary to restore them to their initial
-+	 * value to be consistent with the state of a non-memory mapped file.
-+	 */
-+	if (tif->tif_flags&TIFF_BUFFERMMAP) {
-+		tif->tif_rawdata = NULL;
-+		tif->tif_rawdatasize = 0;
-+		tif->tif_flags &= ~TIFF_BUFFERMMAP;
-+		tif->tif_flags |= TIFF_MYBUFFER;
-+	}
- 
- 	/* Setup the function pointers for encode, decode, and cleanup. */
- 	tif->tif_setupdecode = JBIGSetupDecode;
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
deleted file mode 100644
index 72776f09ba..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-CVE: CVE-2022-22844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b12a0326e6064b6e0b051d1184a219877472f69b Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Tue, 25 Jan 2022 16:25:28 +0000
-Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
- count is required (fixes #355)
-
----
- tools/tiffset.c | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/tools/tiffset.c b/tools/tiffset.c
-index 8c9e23c5..e7a88c09 100644
---- a/tools/tiffset.c
-+++ b/tools/tiffset.c
-@@ -146,9 +146,19 @@ main(int argc, char* argv[])
- 
-             arg_index++;
-             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
--                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
--                    fprintf( stderr, "Failed to set %s=%s\n",
--                             TIFFFieldName(fip), argv[arg_index] );
-+                if(TIFFFieldPassCount( fip )) {
-+                    size_t len;
-+                    len = strlen(argv[arg_index]) + 1;
-+                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
-+                            (uint16_t)len, argv[arg_index]) != 1)
-+                        fprintf( stderr, "Failed to set %s=%s\n",
-+                            TIFFFieldName(fip), argv[arg_index] );
-+                } else {
-+                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
-+                            argv[arg_index]) != 1)
-+                        fprintf( stderr, "Failed to set %s=%s\n",
-+                            TIFFFieldName(fip), argv[arg_index] );
-+                }
-             } else if (TIFFFieldWriteCount(fip) > 0
- 		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
-                 int     ret = 1;
--- 
-2.25.1
diff --git a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
deleted file mode 100644
index 812ffb232d..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-CVE: CVE-2022-0891
-CVE: CVE-2022-1056
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From e46b49e60fddb2e924302fb1751f79eb9cfb2253 Mon Sep 17 00:00:00 2001
-From: Su Laus <sulau@freenet.de>
-Date: Tue, 8 Mar 2022 17:02:44 +0000
-Subject: [PATCH 2/6] tiffcrop: fix issue #380 and #382 heap buffer overflow in
- extractImageSection
-
----
- tools/tiffcrop.c | 92 +++++++++++++++++++-----------------------------
- 1 file changed, 36 insertions(+), 56 deletions(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index b85c2ce7..302a7e91 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -105,8 +105,8 @@
-  *                of messages to monitor progress without enabling dump logs.
-  */
- 
--static   char tiffcrop_version_id[] = "2.4";
--static   char tiffcrop_rev_date[] = "12-13-2010";
-+static   char tiffcrop_version_id[] = "2.4.1";
-+static   char tiffcrop_rev_date[] = "03-03-2010";
- 
- #include "tif_config.h"
- #include "libport.h"
-@@ -6710,10 +6710,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #ifdef DEVELMODE
-   uint32_t    img_length;
- #endif
--  uint32_t    j, shift1, shift2, trailing_bits;
-+  uint32_t    j, shift1, trailing_bits;
-   uint32_t    row, first_row, last_row, first_col, last_col;
-   uint32_t    src_offset, dst_offset, row_offset, col_offset;
--  uint32_t    offset1, offset2, full_bytes;
-+  uint32_t    offset1, full_bytes;
-   uint32_t    sect_width;
- #ifdef DEVELMODE
-   uint32_t    sect_length;
-@@ -6723,7 +6723,6 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #ifdef DEVELMODE
-   int      k;
-   unsigned char bitset;
--  static char *bitarray = NULL;
- #endif
- 
-   img_width = image->width;
-@@ -6741,17 +6740,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
-   dst_offset = 0;
- 
- #ifdef DEVELMODE
--  if (bitarray == NULL)
--    {
--    if ((bitarray = (char *)malloc(img_width)) == NULL)
--      {
--      TIFFError ("", "DEBUG: Unable to allocate debugging bitarray");
--      return (-1);
--      }
--    }
-+  char bitarray[39];
- #endif
- 
--  /* rows, columns, width, length are expressed in pixels */
-+  /* rows, columns, width, length are expressed in pixels
-+   * first_row, last_row, .. are index into image array starting at 0 to width-1,
-+   * last_col shall be also extracted.  */
-   first_row = section->y1;
-   last_row  = section->y2;
-   first_col = section->x1;
-@@ -6761,9 +6755,14 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #ifdef DEVELMODE
-   sect_length = last_row - first_row + 1;
- #endif
--  img_rowsize = ((img_width * bps + 7) / 8) * spp;
--  full_bytes = (sect_width * spp * bps) / 8;   /* number of COMPLETE bytes per row in section */
--  trailing_bits = (sect_width * bps) % 8;
-+    /* The read function loadImage() used copy separate plane data into a buffer as interleaved
-+     * samples rather than separate planes so the same logic works to extract regions
-+     * regardless of the way the data are organized in the input file.
-+     * Furthermore, bytes and bits are arranged in buffer according to COMPRESSION=1 and FILLORDER=1 
-+     */
-+    img_rowsize = (((img_width * spp * bps) + 7) / 8);    /* row size in full bytes of source image */
-+    full_bytes = (sect_width * spp * bps) / 8;            /* number of COMPLETE bytes per row in section */
-+    trailing_bits = (sect_width * spp * bps) % 8;         /* trailing bits within the last byte of destination buffer */
- 
- #ifdef DEVELMODE
-     TIFFError ("", "First row: %"PRIu32", last row: %"PRIu32", First col: %"PRIu32", last col: %"PRIu32"\n",
-@@ -6776,10 +6775,9 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- 
-   if ((bps % 8) == 0)
-     {
--    col_offset = first_col * spp * bps / 8;
-+    col_offset = (first_col * spp * bps) / 8;
-     for (row = first_row; row <= last_row; row++)
-       {
--      /* row_offset = row * img_width * spp * bps / 8; */
-       row_offset = row * img_rowsize;
-       src_offset = row_offset + col_offset;
- 
-@@ -6792,14 +6790,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
-     }
-   else
-     { /* bps != 8 */
--    shift1  = spp * ((first_col * bps) % 8);
--    shift2  = spp * ((last_col * bps) % 8);
-+    shift1 = ((first_col * spp * bps) % 8);           /* shift1 = bits to skip in the first byte of source buffer*/
-     for (row = first_row; row <= last_row; row++)
-       {
-       /* pull out the first byte */
-       row_offset = row * img_rowsize;
--      offset1 = row_offset + (first_col * bps / 8);
--      offset2 = row_offset + (last_col * bps / 8);
-+      offset1 = row_offset + ((first_col * spp * bps) / 8);   /* offset1 = offset into source of byte with first bits to be extracted */
- 
- #ifdef DEVELMODE
-       for (j = 0, k = 7; j < 8; j++, k--)
-@@ -6811,12 +6807,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
-       sprintf(&bitarray[9], " ");
-       for (j = 10, k = 7; j < 18; j++, k--)
-         {
--        bitset = *(src_buff + offset2) & (((unsigned char)1 << k)) ? 1 : 0;
-+        bitset = *(src_buff + offset1 + full_bytes) & (((unsigned char)1 << k)) ? 1 : 0;
-         sprintf(&bitarray[j], (bitset) ? "1" : "0");
-         }
-       bitarray[18] = '\0';
--      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Shift2:  %"PRIu32"\n", 
--                 row, offset1, shift1, offset2, shift2); 
-+      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Trailing_bits:  %"PRIu32"\n", 
-+                 row, offset1, shift1, offset1+full_bytes, trailing_bits); 
- #endif
- 
-       bytebuff1 = bytebuff2 = 0;
-@@ -6840,11 +6836,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- 
-         if (trailing_bits != 0)
-           {
--	  bytebuff2 = src_buff[offset2] & ((unsigned char)255 << (7 - shift2));
-+      /* Only copy higher bits of samples and mask lower bits of not wanted column samples to zero */
-+	  bytebuff2 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (8 - trailing_bits));
-           sect_buff[dst_offset] = bytebuff2;
- #ifdef DEVELMODE
- 	  TIFFError ("", "        Trailing bits src offset:  %8"PRIu32", Dst offset: %8"PRIu32"\n",
--                              offset2, dst_offset); 
-+          offset1 + full_bytes, dst_offset);
-           for (j = 30, k = 7; j < 38; j++, k--)
-             {
-             bitset = *(sect_buff + dst_offset) & (((unsigned char)1 << k)) ? 1 : 0;
-@@ -6863,8 +6860,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #endif
-         for (j = 0; j <= full_bytes; j++) 
-           {
--	  bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
--	  bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (7 - shift1));
-+          /* Skip the first shift1 bits and shift the source up by shift1 bits before save to destination.*/
-+          /* Attention: src_buff size needs to be some bytes larger than image size, because could read behind image here. */
-+          bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
-+          bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (8 - shift1));
-           sect_buff[dst_offset + j] = (bytebuff1 << shift1) | (bytebuff2 >> (8 - shift1));
-           }
- #ifdef DEVELMODE
-@@ -6880,36 +6879,17 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #endif
-         dst_offset += full_bytes;
- 
-+        /* Copy the trailing_bits for the last byte in the destination buffer. 
-+           Could come from one ore two bytes of the source buffer. */
-         if (trailing_bits != 0)
-           {
- #ifdef DEVELMODE
--	    TIFFError ("", "        Trailing bits   src offset: %8"PRIu32", Dst offset: %8"PRIu32"\n", offset1 + full_bytes, dst_offset);
--#endif
--	  if (shift2 > shift1)
--            {
--	    bytebuff1 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (7 - shift2));
--            bytebuff2 = bytebuff1 & ((unsigned char)255 << shift1);
--            sect_buff[dst_offset] = bytebuff2;
--#ifdef DEVELMODE
--	    TIFFError ("", "        Shift2 > Shift1\n"); 
-+          TIFFError("", "        Trailing bits %4"PRIu32"   src offset: %8"PRIu32", Dst offset: %8"PRIu32"\n", trailing_bits, offset1 + full_bytes, dst_offset);
- #endif
-+          /* More than necessary bits are already copied into last destination buffer, 
-+           * only masking of last byte in destination buffer is necessary.*/ 
-+          sect_buff[dst_offset] &= ((uint8_t)0xFF << (8 - trailing_bits));
-             }
--          else
--            {
--	    if (shift2 < shift1)
--              {
--              bytebuff2 = ((unsigned char)255 << (shift1 - shift2 - 1));
--	      sect_buff[dst_offset] &= bytebuff2;
--#ifdef DEVELMODE
--	      TIFFError ("", "        Shift2 < Shift1\n"); 
--#endif
--              }
--#ifdef DEVELMODE
--            else
--	      TIFFError ("", "        Shift2 == Shift1\n"); 
--#endif
--            }
--	  }
- #ifdef DEVELMODE
- 	  sprintf(&bitarray[28], " ");
- 	  sprintf(&bitarray[29], " ");
-@@ -7062,7 +7042,7 @@ writeImageSections(TIFF *in, TIFF *out, struct image_data *image,
-     width  = sections[i].x2 - sections[i].x1 + 1;
-     length = sections[i].y2 - sections[i].y1 + 1;
-     sectsize = (uint32_t)
--	    ceil((width * image->bps + 7) / (double)8) * image->spp * length;
-+	    ceil((width * image->bps * image->spp + 7) / (double)8) * length;
-     /* allocate a buffer if we don't have one already */
-     if (createImageSection(sectsize, sect_buff_ptr))
-       {
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch b/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
deleted file mode 100644
index a0b856b9e1..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-CVE: CVE-2022-0907
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From a139191cc86f4dc44c74a0f22928e0fb38ed2485 Mon Sep 17 00:00:00 2001
-From: Augustus <wangdw.augustus@qq.com>
-Date: Mon, 7 Mar 2022 18:21:49 +0800
-Subject: [PATCH 3/6] add checks for return value of limitMalloc (#392)
-
----
- tools/tiffcrop.c | 33 +++++++++++++++++++++------------
- 1 file changed, 21 insertions(+), 12 deletions(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 302a7e91..e407bf51 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -7357,7 +7357,11 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
-   if (!sect_buff)
-     {
-     sect_buff = (unsigned char *)limitMalloc(sectsize);
--    *sect_buff_ptr = sect_buff;
-+    if (!sect_buff)
-+    {
-+        TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
-+        return (-1);
-+    }
-     _TIFFmemset(sect_buff, 0, sectsize);
-     }
-   else
-@@ -7373,15 +7377,15 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
-       else
-         sect_buff = new_buff;
- 
-+      if (!sect_buff)
-+      {
-+          TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
-+          return (-1);
-+      }
-       _TIFFmemset(sect_buff, 0, sectsize);
-       }
-     }
- 
--  if (!sect_buff)
--    {
--    TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
--    return (-1);
--    }
-   prev_sectsize = sectsize;
-   *sect_buff_ptr = sect_buff;
- 
-@@ -7648,7 +7652,11 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
-   if (!crop_buff)
-     {
-     crop_buff = (unsigned char *)limitMalloc(cropsize);
--    *crop_buff_ptr = crop_buff;
-+    if (!crop_buff)
-+    {
-+        TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
-+        return (-1);
-+    }
-     _TIFFmemset(crop_buff, 0, cropsize);
-     prev_cropsize = cropsize;
-     }
-@@ -7664,15 +7672,15 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
-         }
-       else
-         crop_buff = new_buff;
-+      if (!crop_buff)
-+      {
-+          TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
-+          return (-1);
-+      }
-       _TIFFmemset(crop_buff, 0, cropsize);
-       }
-     }
- 
--  if (!crop_buff)
--    {
--    TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
--    return (-1);
--    }
-   *crop_buff_ptr = crop_buff;
- 
-   if (crop->crop_mode & CROP_INVERT)
-@@ -9231,3 +9239,4 @@ invertImage(uint16_t photometric, uint16_t spp, uint16_t bps, uint32_t width, ui
-  * fill-column: 78
-  * End:
-  */
-+
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch b/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
deleted file mode 100644
index 719dabaecc..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-CVE: CVE-2022-0908
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ef5a0bf271823df168642444d051528a68205cb0 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 17 Feb 2022 15:28:43 +0100
-Subject: [PATCH 4/6] TIFFFetchNormalTag(): avoid calling memcpy() with a null
- source pointer and size of zero (fixes #383)
-
----
- libtiff/tif_dirread.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index d84147a0..4e8ce729 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -5079,7 +5079,10 @@ TIFFFetchNormalTag(TIFF* tif, TIFFDirEntry* dp, int recover)
- 								_TIFFfree(data);
- 							return(0);
- 						}
--						_TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
-+						if (dp->tdir_count > 0 )
-+						{
-+							_TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
-+						}
- 						o[(uint32_t)dp->tdir_count]=0;
- 						if (data!=0)
- 							_TIFFfree(data);
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
deleted file mode 100644
index 64dbe9ef92..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-CVE: CVE-2022-0909
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 4768355a074d562177e0a8b551c561d1af7eb74a Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Tue, 8 Mar 2022 16:22:04 +0000
-Subject: [PATCH 5/6] fix the FPE in tiffcrop (#393)
-
----
- libtiff/tif_dir.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
-index a6c254fc..77da6ea4 100644
---- a/libtiff/tif_dir.c
-+++ b/libtiff/tif_dir.c
-@@ -335,13 +335,13 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap)
- 		break;
- 	case TIFFTAG_XRESOLUTION:
-         dblval = va_arg(ap, double);
--        if( dblval < 0 )
-+        if( dblval != dblval || dblval < 0 )
-             goto badvaluedouble;
- 		td->td_xresolution = _TIFFClampDoubleToFloat( dblval );
- 		break;
- 	case TIFFTAG_YRESOLUTION:
-         dblval = va_arg(ap, double);
--        if( dblval < 0 )
-+        if( dblval != dblval || dblval < 0 )
-             goto badvaluedouble;
- 		td->td_yresolution = _TIFFClampDoubleToFloat( dblval );
- 		break;
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch b/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
deleted file mode 100644
index afd5e59960..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-CVE: CVE-2022-0924
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 1074b9691322b1e3671cd8ea0b6b3509d08978fb Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Thu, 10 Mar 2022 08:48:00 +0000
-Subject: [PATCH 6/6] fix heap buffer overflow in tiffcp (#278)
-
----
- tools/tiffcp.c | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index 1f889516..552d8fad 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -1661,12 +1661,27 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
- 	tdata_t obuf;
- 	tstrip_t strip = 0;
- 	tsample_t s;
-+	uint16_t bps = 0, bytes_per_sample;
- 
- 	obuf = limitMalloc(stripsize);
- 	if (obuf == NULL)
- 		return (0);
- 	_TIFFmemset(obuf, 0, stripsize);
- 	(void) TIFFGetFieldDefaulted(out, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
-+	(void) TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps);
-+	if( bps == 0 )
-+        {
-+            TIFFError(TIFFFileName(out), "Error, cannot read BitsPerSample");
-+            _TIFFfree(obuf);
-+            return 0;
-+        }
-+        if( (bps % 8) != 0 )
-+        {
-+            TIFFError(TIFFFileName(out), "Error, cannot handle BitsPerSample that is not a multiple of 8");
-+            _TIFFfree(obuf);
-+            return 0;
-+        }
-+	bytes_per_sample = bps/8;
- 	for (s = 0; s < spp; s++) {
- 		uint32_t row;
- 		for (row = 0; row < imagelength; row += rowsperstrip) {
-@@ -1676,7 +1691,7 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
- 
- 			cpContigBufToSeparateBuf(
- 			    obuf, (uint8_t*) buf + row * rowsize + s,
--			    nrows, imagewidth, 0, 0, spp, 1);
-+			    nrows, imagewidth, 0, 0, spp, bytes_per_sample);
- 			if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0) {
- 				TIFFError(TIFFFileName(out),
- 				    "Error, can't write strip %"PRIu32,
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
deleted file mode 100644
index 0b41dde606..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 561599c99f987dc32ae110370cfdd7df7975586b Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 5 Feb 2022 20:36:41 +0100
-Subject: [PATCH] TIFFReadDirectory(): avoid calling memcpy() with a null
- source pointer and size of zero (fixes #362)
-
-Upstream-Status: Backport
-CVE: CVE-2022-0562
-
----
- libtiff/tif_dirread.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 2bbc4585..23194ced 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -4177,7 +4177,8 @@ TIFFReadDirectory(TIFF* tif)
-                     goto bad;
-                 }
- 
--                memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
-+                if (old_extrasamples > 0)
-+                    memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
-                 _TIFFsetShortArray(&tif->tif_dir.td_sampleinfo, new_sampleinfo, tif->tif_dir.td_extrasamples);
-                 _TIFFfree(new_sampleinfo);
-         }
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
deleted file mode 100644
index 71b85cac10..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
+++ /dev/null
@@ -1,212 +0,0 @@
-From 87881e093691a35c60b91cafed058ba2dd5d9807 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sun, 5 Dec 2021 14:37:46 +0100
-Subject: [PATCH] TIFFReadDirectory: fix OJPEG hack (fixes #319)
-
-to avoid having the size of the strip arrays inconsistent with the
-number of strips returned by TIFFNumberOfStrips(), which may cause
-out-ouf-bounds array read afterwards.
-
-One of the OJPEG hack that alters SamplesPerPixel may influence the
-number of strips. Hence compute tif_dir.td_nstrips only afterwards.
-
-CVE: CVE-2022-1354
-
-Upstream-Status: Backport
-[https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- libtiff/tif_dirread.c | 162 ++++++++++++++++++++++--------------------
- 1 file changed, 83 insertions(+), 79 deletions(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 8f434ef5..14c031d1 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -3794,50 +3794,7 @@ TIFFReadDirectory(TIFF* tif)
- 		MissingRequired(tif,"ImageLength");
- 		goto bad;
- 	}
--	/*
--	 * Setup appropriate structures (by strip or by tile)
--	 */
--	if (!TIFFFieldSet(tif, FIELD_TILEDIMENSIONS)) {
--		tif->tif_dir.td_nstrips = TIFFNumberOfStrips(tif);  
--		tif->tif_dir.td_tilewidth = tif->tif_dir.td_imagewidth;
--		tif->tif_dir.td_tilelength = tif->tif_dir.td_rowsperstrip;
--		tif->tif_dir.td_tiledepth = tif->tif_dir.td_imagedepth;
--		tif->tif_flags &= ~TIFF_ISTILED;
--	} else {
--		tif->tif_dir.td_nstrips = TIFFNumberOfTiles(tif);
--		tif->tif_flags |= TIFF_ISTILED;
--	}
--	if (!tif->tif_dir.td_nstrips) {
--		TIFFErrorExt(tif->tif_clientdata, module,
--		    "Cannot handle zero number of %s",
--		    isTiled(tif) ? "tiles" : "strips");
--		goto bad;
--	}
--	tif->tif_dir.td_stripsperimage = tif->tif_dir.td_nstrips;
--	if (tif->tif_dir.td_planarconfig == PLANARCONFIG_SEPARATE)
--		tif->tif_dir.td_stripsperimage /= tif->tif_dir.td_samplesperpixel;
--	if (!TIFFFieldSet(tif, FIELD_STRIPOFFSETS)) {
--#ifdef OJPEG_SUPPORT
--		if ((tif->tif_dir.td_compression==COMPRESSION_OJPEG) &&
--		    (isTiled(tif)==0) &&
--		    (tif->tif_dir.td_nstrips==1)) {
--			/*
--			 * XXX: OJPEG hack.
--			 * If a) compression is OJPEG, b) it's not a tiled TIFF,
--			 * and c) the number of strips is 1,
--			 * then we tolerate the absence of stripoffsets tag,
--			 * because, presumably, all required data is in the
--			 * JpegInterchangeFormat stream.
--			 */
--			TIFFSetFieldBit(tif, FIELD_STRIPOFFSETS);
--		} else
--#endif
--        {
--			MissingRequired(tif,
--				isTiled(tif) ? "TileOffsets" : "StripOffsets");
--			goto bad;
--		}
--	}
-+
- 	/*
- 	 * Second pass: extract other information.
- 	 */
-@@ -4042,41 +3999,6 @@ TIFFReadDirectory(TIFF* tif)
- 			} /* -- if (!dp->tdir_ignore) */
- 		} /* -- for-loop -- */
- 
--        if( tif->tif_mode == O_RDWR &&
--            tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 &&
--            tif->tif_dir.td_stripoffset_entry.tdir_count == 0 &&
--            tif->tif_dir.td_stripoffset_entry.tdir_type == 0 &&
--            tif->tif_dir.td_stripoffset_entry.tdir_offset.toff_long8 == 0 &&
--            tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 &&
--            tif->tif_dir.td_stripbytecount_entry.tdir_count == 0 &&
--            tif->tif_dir.td_stripbytecount_entry.tdir_type == 0 &&
--            tif->tif_dir.td_stripbytecount_entry.tdir_offset.toff_long8 == 0 )
--        {
--            /* Directory typically created with TIFFDeferStrileArrayWriting() */
--            TIFFSetupStrips(tif);
--        }
--        else if( !(tif->tif_flags&TIFF_DEFERSTRILELOAD) )
--        {
--            if( tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 )
--            {
--                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripoffset_entry),
--                                         tif->tif_dir.td_nstrips,
--                                         &tif->tif_dir.td_stripoffset_p))
--                {
--                    goto bad;
--                }
--            }
--            if( tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 )
--            {
--                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripbytecount_entry),
--                                         tif->tif_dir.td_nstrips,
--                                         &tif->tif_dir.td_stripbytecount_p))
--                {
--                    goto bad;
--                }
--            }
--        }
--
- 	/*
- 	 * OJPEG hack:
- 	 * - If a) compression is OJPEG, and b) photometric tag is missing,
-@@ -4147,6 +4069,88 @@ TIFFReadDirectory(TIFF* tif)
- 		}
- 	}
- 
-+	/*
-+	 * Setup appropriate structures (by strip or by tile)
-+	 * We do that only after the above OJPEG hack which alters SamplesPerPixel
-+	 * and thus influences the number of strips in the separate planarconfig.
-+	 */
-+	if (!TIFFFieldSet(tif, FIELD_TILEDIMENSIONS)) {
-+		tif->tif_dir.td_nstrips = TIFFNumberOfStrips(tif);  
-+		tif->tif_dir.td_tilewidth = tif->tif_dir.td_imagewidth;
-+		tif->tif_dir.td_tilelength = tif->tif_dir.td_rowsperstrip;
-+		tif->tif_dir.td_tiledepth = tif->tif_dir.td_imagedepth;
-+		tif->tif_flags &= ~TIFF_ISTILED;
-+	} else {
-+		tif->tif_dir.td_nstrips = TIFFNumberOfTiles(tif);
-+		tif->tif_flags |= TIFF_ISTILED;
-+	}
-+	if (!tif->tif_dir.td_nstrips) {
-+		TIFFErrorExt(tif->tif_clientdata, module,
-+		    "Cannot handle zero number of %s",
-+		    isTiled(tif) ? "tiles" : "strips");
-+		goto bad;
-+	}
-+	tif->tif_dir.td_stripsperimage = tif->tif_dir.td_nstrips;
-+	if (tif->tif_dir.td_planarconfig == PLANARCONFIG_SEPARATE)
-+		tif->tif_dir.td_stripsperimage /= tif->tif_dir.td_samplesperpixel;
-+	if (!TIFFFieldSet(tif, FIELD_STRIPOFFSETS)) {
-+#ifdef OJPEG_SUPPORT
-+		if ((tif->tif_dir.td_compression==COMPRESSION_OJPEG) &&
-+		    (isTiled(tif)==0) &&
-+		    (tif->tif_dir.td_nstrips==1)) {
-+			/*
-+			 * XXX: OJPEG hack.
-+			 * If a) compression is OJPEG, b) it's not a tiled TIFF,
-+			 * and c) the number of strips is 1,
-+			 * then we tolerate the absence of stripoffsets tag,
-+			 * because, presumably, all required data is in the
-+			 * JpegInterchangeFormat stream.
-+			 */
-+			TIFFSetFieldBit(tif, FIELD_STRIPOFFSETS);
-+		} else
-+#endif
-+        {
-+			MissingRequired(tif,
-+				isTiled(tif) ? "TileOffsets" : "StripOffsets");
-+			goto bad;
-+		}
-+	}
-+
-+        if( tif->tif_mode == O_RDWR &&
-+            tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 &&
-+            tif->tif_dir.td_stripoffset_entry.tdir_count == 0 &&
-+            tif->tif_dir.td_stripoffset_entry.tdir_type == 0 &&
-+            tif->tif_dir.td_stripoffset_entry.tdir_offset.toff_long8 == 0 &&
-+            tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 &&
-+            tif->tif_dir.td_stripbytecount_entry.tdir_count == 0 &&
-+            tif->tif_dir.td_stripbytecount_entry.tdir_type == 0 &&
-+            tif->tif_dir.td_stripbytecount_entry.tdir_offset.toff_long8 == 0 )
-+        {
-+            /* Directory typically created with TIFFDeferStrileArrayWriting() */
-+            TIFFSetupStrips(tif);
-+        }
-+        else if( !(tif->tif_flags&TIFF_DEFERSTRILELOAD) )
-+        {
-+            if( tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 )
-+            {
-+                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripoffset_entry),
-+                                         tif->tif_dir.td_nstrips,
-+                                         &tif->tif_dir.td_stripoffset_p))
-+                {
-+                    goto bad;
-+                }
-+            }
-+            if( tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 )
-+            {
-+                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripbytecount_entry),
-+                                         tif->tif_dir.td_nstrips,
-+                                         &tif->tif_dir.td_stripbytecount_p))
-+                {
-+                    goto bad;
-+                }
-+            }
-+        }
-+
- 	/*
- 	 * Make sure all non-color channels are extrasamples.
- 	 * If it's not the case, define them as such.
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
deleted file mode 100644
index e59f5aad55..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fb1db384959698edd6caeea84e28253d272a0f96 Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Sat, 2 Apr 2022 22:33:31 +0200
-Subject: [PATCH] tiffcp: avoid buffer overflow in "mode" string (fixes #400)
-
-CVE: CVE-2022-1355
-
-Upstream-Status: Backport
-[https://gitlab.com/libtiff/libtiff/-/commit/c1ae29f9ebacd29b7c3e0c7db671af7db3584bc2]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- tools/tiffcp.c | 25 ++++++++++++++++++++-----
- 1 file changed, 20 insertions(+), 5 deletions(-)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index fd129bb7..8d944ff6 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -274,19 +274,34 @@ main(int argc, char* argv[])
- 			deftilewidth = atoi(optarg);
- 			break;
- 		case 'B':
--			*mp++ = 'b'; *mp = '\0';
-+			if (strlen(mode) < (sizeof(mode) - 1))
-+			{
-+				*mp++ = 'b'; *mp = '\0';
-+			}
- 			break;
- 		case 'L':
--			*mp++ = 'l'; *mp = '\0';
-+			if (strlen(mode) < (sizeof(mode) - 1))
-+			{
-+				*mp++ = 'l'; *mp = '\0';
-+			}
- 			break;
- 		case 'M':
--			*mp++ = 'm'; *mp = '\0';
-+			if (strlen(mode) < (sizeof(mode) - 1))
-+			{
-+				*mp++ = 'm'; *mp = '\0';
-+			}
- 			break;
- 		case 'C':
--			*mp++ = 'c'; *mp = '\0';
-+			if (strlen(mode) < (sizeof(mode) - 1))
-+			{
-+				*mp++ = 'c'; *mp = '\0';
-+			}
- 			break;
- 		case '8':
--			*mp++ = '8'; *mp = '\0';
-+			if (strlen(mode) < (sizeof(mode)-1))
-+			{
-+				*mp++ = '8'; *mp = '\0';
-+			}
- 			break;
- 		case 'x':
- 			pageInSeq = 1;
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
deleted file mode 100644
index 74f9649fdf..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From eecb0712f4c3a5b449f70c57988260a667ddbdef Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sun, 6 Feb 2022 13:08:38 +0100
-Subject: [PATCH] TIFFFetchStripThing(): avoid calling memcpy() with a null
- source pointer and size of zero (fixes #362)
-
-Upstream-Status: Backport
-CVE: CVE-2022-0561
-
----
- libtiff/tif_dirread.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 23194ced..50ebf8ac 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -5777,8 +5777,9 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEntry* dir, uint32_t nstrips, uint64_t** l
- 			_TIFFfree(data);
- 			return(0);
- 		}
--                _TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
--                _TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
-+		if( dir->tdir_count )
-+			_TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
-+		_TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
- 		_TIFFfree(data);
- 		data=resizeddata;
- 	}
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
similarity index 75%
rename from meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index b5ccd859f3..e30df0b3e9 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -9,22 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
-           file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
-           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch \
-           file://0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch \
-           file://0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch \
-           file://0003-add-checks-for-return-value-of-limitMalloc-392.patch \
-           file://0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch \
-           file://0005-fix-the-FPE-in-tiffcrop-393.patch \
-           file://0006-fix-heap-buffer-overflow-in-tiffcp-278.patch \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
-           file://CVE-2022-1354.patch \
-           file://CVE-2022-1355.patch \
            file://CVE-2022-34526.patch \
            "
 
-SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
+SRC_URI[sha256sum] = "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.37.3


