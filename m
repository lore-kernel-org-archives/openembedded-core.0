Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FDCCD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 07:50:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.web10.10366.1711612249907302998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 00:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=F4MKi13h;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711612251; x=1743148251;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OcY80wePdfyHI8nXzZwFmHv9xUDF2O0m8182B5jZ7i4=;
  b=F4MKi13hLjWKe2pojLvT4ZT9yubVtmguhg/FNlgPzgL7PFKSqytgn6Lw
   bkC/861VBRoyAuficGF5/UJLqPQwcSTLRvIderQpA18AEX9u2mDSjgFR4
   bRlRNeo2LBWV7n7LMOdWhu1vvif36CcRd2g5OQL7Y3b5AptgPZa34GE+E
   sdnoukvVPs/bEceJGABw/ZkFZBvGSFEVIuTAB/DFwexnBZwGuo2XuHH4I
   nmziUd9LT4b1EYMhYsnsRce64npPci5M3hSZy1I0nMb9sSbZ/9pZJRxk7
   8tEhuiDzwMwIRduAuuwErqfxwIH6ABio5QJKX2u6f8FJfnZPeTTJWi4A/
   g==;
X-CSE-ConnectionGUID: D0x9l4u5Q3WjF1i1vpGp2A==
X-CSE-MsgGUID: vZ0kXx2ETliPJLpGocWvlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18185089"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="18185089"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 00:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="47547207"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2024 00:50:50 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 2/3] tiff: fix CVE-2023-52356 CVE-2023-6277
Date: Thu, 28 Mar 2024 15:50:32 +0800
Message-Id: <20240328075033.3800753-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240328075033.3800753-1-chee.yang.lee@intel.com>
References: <20240328075033.3800753-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 07:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197571

From: Lee Chee Yang <chee.yang.lee@intel.com>

import patch from ubuntu to fix CVE-2023-52356 CVE-2023-6277
import from
http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6ubuntu0.8.debian.tar.xz

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libtiff/tiff/CVE-2023-52356.patch         |  55 ++++++
 .../libtiff/tiff/CVE-2023-6277-1.patch        | 179 ++++++++++++++++++
 .../libtiff/tiff/CVE-2023-6277-2.patch        | 152 +++++++++++++++
 .../libtiff/tiff/CVE-2023-6277-3.patch        |  47 +++++
 .../libtiff/tiff/CVE-2023-6277-4.patch        |  94 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   5 +
 6 files changed, 532 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
new file mode 100644
index 0000000000..6c3c5adc52
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
@@ -0,0 +1,55 @@
+CVE: CVE-2023-52356
+Upstream-Status: Backport 
+[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a 
+ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6ubuntu0.8.debian.tar.xz ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+[Ubuntu note: Backport of the following patch from upstream, with a few changes
+to match the current version of the file in the present Ubuntu release:
+ . using TIFFErrorExt instead of TIFFErrorExtR (the latter did not exist yet);
+-- Rodrigo Figueiredo Zaiden]
+
+Backport of:
+
+From 51558511bdbbcffdce534db21dbaf5d54b31638a Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 31 Oct 2023 15:58:41 +0100
+Subject: [PATCH] TIFFReadRGBAStrip/TIFFReadRGBATile: add more validation of
+ col/row (fixes #622)
+
+---
+ libtiff/tif_getimage.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+
+--- tiff-4.3.0.orig/libtiff/tif_getimage.c
++++ tiff-4.3.0/libtiff/tif_getimage.c
+@@ -2942,6 +2942,13 @@ TIFFReadRGBAStripExt(TIFF* tif, uint32_t
+     }
+ 
+     if (TIFFRGBAImageOK(tif, emsg) && TIFFRGBAImageBegin(&img, tif, stop_on_error, emsg)) {
++        if (row >= img.height)
++        {
++            TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif),
++                          "Invalid row passed to TIFFReadRGBAStrip().");
++            TIFFRGBAImageEnd(&img);
++            return (0);
++        }
+ 
+         img.row_offset = row;
+         img.col_offset = 0;
+@@ -3018,6 +3025,14 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t
+ 	    return( 0 );
+     }
+ 
++    if (col >= img.width || row >= img.height)
++    {
++        TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif),
++                      "Invalid row/col passed to TIFFReadRGBATile().");
++        TIFFRGBAImageEnd(&img);
++        return (0);
++    }
++
+     /*
+      * The TIFFRGBAImageGet() function doesn't allow us to get off the
+      * edge of the image, even to fill an otherwise valid tile.  So we
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.patch
new file mode 100644
index 0000000000..6882529cfb
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.patch
@@ -0,0 +1,179 @@
+CVE: CVE-2023-6277
+Upstream-Status: Backport 
+[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/5320c9d89c054fa805d037d84c57da874470b01a 
+ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6ubuntu0.8.debian.tar.xz ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+[Ubuntu note: Backport of the following patch from upstream, with a few changes
+to match the current version of the file in the present Ubuntu release:
+ . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not exist yet);
+ . calling _TIFFfree(data) instead of _TIFFfreeExt(tif, data) (the latter did not exist yet);
+-- Rodrigo Figueiredo Zaiden]
+
+Backport of:
+
+From 5320c9d89c054fa805d037d84c57da874470b01a Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Tue, 31 Oct 2023 15:43:29 +0000
+Subject: [PATCH] Prevent some out-of-memory attacks
+
+Some small fuzzer files fake large amounts of data and provoke out-of-memory situations. For non-compressed data content / tags, out-of-memory can be prevented by comparing with the file size.
+
+At image reading, data size of some tags / data structures (StripByteCounts, StripOffsets, StripArray, TIFF directory) is compared with file size to prevent provoked out-of-memory attacks.
+
+See issue https://gitlab.com/libtiff/libtiff/-/issues/614#note_1602683857
+---
+ libtiff/tif_dirread.c | 92 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 90 insertions(+), 2 deletions(-)
+
+--- tiff-4.3.0.orig/libtiff/tif_dirread.c
++++ tiff-4.3.0/libtiff/tif_dirread.c
+@@ -866,6 +866,21 @@ static enum TIFFReadDirEntryErr TIFFRead
+ 	datasize=(*count)*typesize;
+ 	assert((tmsize_t)datasize>0);
+ 
++	/* Before allocating a huge amount of memory for corrupted files, check if
++	 * size of requested memory is not greater than file size.
++	 */
++	uint64_t filesize = TIFFGetFileSize(tif);
++	if (datasize > filesize)
++	{
++		TIFFWarningExt(tif->tif_clientdata, "ReadDirEntryArray",
++						"Requested memory size for tag %d (0x%x) %" PRIu32
++						" is greather than filesize %" PRIu64
++						". Memory not allocated, tag not read",
++						direntry->tdir_tag, direntry->tdir_tag, datasize,
++						filesize);
++		return (TIFFReadDirEntryErrAlloc);
++	}
++
+ 	if( isMapped(tif) && datasize > (uint64_t)tif->tif_size )
+ 		return TIFFReadDirEntryErrIo;
+ 
+@@ -4593,6 +4608,20 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
+         if( !_TIFFFillStrilesInternal( tif, 0 ) )
+             return -1;
+ 
++	/* Before allocating a huge amount of memory for corrupted files, check if
++	 * size of requested memory is not greater than file size. */
++	uint64_t filesize = TIFFGetFileSize(tif);
++	uint64_t allocsize = (uint64_t)td->td_nstrips * sizeof(uint64_t);
++	if (allocsize > filesize)
++	{
++		TIFFWarningExt(tif->tif_clientdata, module,
++						"Requested memory size for StripByteCounts of %" PRIu64
++						" is greather than filesize %" PRIu64
++						". Memory not allocated",
++						allocsize, filesize);
++		return -1;
++	}
++
+ 	if (td->td_stripbytecount_p)
+ 		_TIFFfree(td->td_stripbytecount_p);
+ 	td->td_stripbytecount_p = (uint64_t*)
+@@ -4603,9 +4632,7 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
+ 
+ 	if (td->td_compression != COMPRESSION_NONE) {
+ 		uint64_t space;
+-		uint64_t filesize;
+ 		uint16_t n;
+-		filesize = TIFFGetFileSize(tif);
+ 		if (!(tif->tif_flags&TIFF_BIGTIFF))
+ 			space=sizeof(TIFFHeaderClassic)+2+dircount*12+4;
+ 		else
+@@ -4913,6 +4940,20 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
+ 			dircount16 = (uint16_t)dircount64;
+ 			dirsize = 20;
+ 		}
++		/* Before allocating a huge amount of memory for corrupted files, check
++		 * if size of requested memory is not greater than file size. */
++		uint64_t filesize = TIFFGetFileSize(tif);
++		uint64_t allocsize = (uint64_t)dircount16 * dirsize;
++		if (allocsize > filesize)
++		{
++			TIFFWarningExt(
++				tif->tif_clientdata, module,
++				"Requested memory size for TIFF directory of %" PRIu64
++				" is greather than filesize %" PRIu64
++				". Memory not allocated, TIFF directory not read",
++				allocsize, filesize);
++			return 0;
++		}
+ 		origdir = _TIFFCheckMalloc(tif, dircount16,
+ 		    dirsize, "to read TIFF directory");
+ 		if (origdir == NULL)
+@@ -5016,6 +5057,20 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
+ 			             "Sanity check on directory count failed, zero tag directories not supported");
+ 			return 0;
+ 		}
++		/* Before allocating a huge amount of memory for corrupted files, check
++		 * if size of requested memory is not greater than file size. */
++		uint64_t filesize = TIFFGetFileSize(tif);
++		uint64_t allocsize = (uint64_t)dircount16 * dirsize;
++		if (allocsize > filesize)
++		{
++			TIFFWarningExt(
++				tif->tif_clientdata, module,
++				"Requested memory size for TIFF directory of %" PRIu64
++				" is greather than filesize %" PRIu64
++				". Memory not allocated, TIFF directory not read",
++				allocsize, filesize);
++			return 0;
++		}
+ 		origdir = _TIFFCheckMalloc(tif, dircount16,
+ 						dirsize,
+ 						"to read TIFF directory");
+@@ -5059,6 +5114,8 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
+ 			}
+ 		}
+ 	}
++	/* No check against filesize needed here because "dir" should have same size
++	 * than "origdir" checked above. */
+ 	dir = (TIFFDirEntry*)_TIFFCheckMalloc(tif, dircount16,
+ 						sizeof(TIFFDirEntry),
+ 						"to read TIFF directory");
+@@ -5853,6 +5910,20 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEn
+ 			return(0);
+ 		}
+ 
++		/* Before allocating a huge amount of memory for corrupted files, check
++		 * if size of requested memory is not greater than file size. */
++		uint64_t filesize = TIFFGetFileSize(tif);
++		uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t);
++		if (allocsize > filesize)
++		{
++			TIFFWarningExt(tif->tif_clientdata, module,
++							"Requested memory size for StripArray of %" PRIu64
++							" is greather than filesize %" PRIu64
++							". Memory not allocated",
++							allocsize, filesize);
++			_TIFFfree(data);
++			return (0);
++		}
+ 		resizeddata=(uint64_t*)_TIFFCheckMalloc(tif, nstrips, sizeof(uint64_t), "for strip array");
+ 		if (resizeddata==0) {
+ 			_TIFFfree(data);
+@@ -5948,6 +6019,23 @@ static void allocChoppedUpStripArrays(TI
+     }
+     bytecount = last_offset + last_bytecount - offset;
+ 
++	/* Before allocating a huge amount of memory for corrupted files, check if
++	 * size of StripByteCount and StripOffset tags is not greater than
++	 * file size.
++	 */
++	uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t) * 2;
++	uint64_t filesize = TIFFGetFileSize(tif);
++	if (allocsize > filesize)
++	{
++		TIFFWarningExt(tif->tif_clientdata, "allocChoppedUpStripArrays",
++						"Requested memory size for StripByteCount and "
++						"StripOffsets %" PRIu64
++						" is greather than filesize %" PRIu64
++						". Memory not allocated",
++						allocsize, filesize);
++		return;
++	}
++
+     newcounts = (uint64_t*) _TIFFCheckMalloc(tif, nstrips, sizeof (uint64_t),
+                                              "for chopped \"StripByteCounts\" array");
+     newoffsets = (uint64_t*) _TIFFCheckMalloc(tif, nstrips, sizeof (uint64_t),
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.patch
new file mode 100644
index 0000000000..fab43c0bc6
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.patch
@@ -0,0 +1,152 @@
+CVE: CVE-2023-6277
+Upstream-Status: Backport 
+[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/0b025324711213a75e38b52f7e7ba60235f108aa 
+ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6ubuntu0.8.debian.tar.xz ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+[Ubuntu note: Backport of the following patch from upstream, with a few changes
+to match the current version of the file in the present Ubuntu release:
+ . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not exist yet);
+-- Rodrigo Figueiredo Zaiden]
+
+Backport of:
+
+From 0b025324711213a75e38b52f7e7ba60235f108aa Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 31 Oct 2023 19:47:22 +0100
+Subject: [PATCH] tif_dirread.c: only issue TIFFGetFileSize() for large enough
+ RAM requests
+
+Ammends 5320c9d89c054fa805d037d84c57da874470b01a
+
+This fixes a performance regression caught by the GDAL regression test
+suite.
+---
+ libtiff/tif_dirread.c | 83 +++++++++++++++++++++++++------------------
+ 1 file changed, 48 insertions(+), 35 deletions(-)
+
+--- tiff-4.3.0.orig/libtiff/tif_dirread.c
++++ tiff-4.3.0/libtiff/tif_dirread.c
+@@ -866,19 +866,22 @@ static enum TIFFReadDirEntryErr TIFFRead
+ 	datasize=(*count)*typesize;
+ 	assert((tmsize_t)datasize>0);
+ 
+-	/* Before allocating a huge amount of memory for corrupted files, check if
+-	 * size of requested memory is not greater than file size.
+-	 */
+-	uint64_t filesize = TIFFGetFileSize(tif);
+-	if (datasize > filesize)
++	if (datasize > 100 * 1024 * 1024)
+ 	{
+-		TIFFWarningExt(tif->tif_clientdata, "ReadDirEntryArray",
+-						"Requested memory size for tag %d (0x%x) %" PRIu32
+-						" is greather than filesize %" PRIu64
+-						". Memory not allocated, tag not read",
+-						direntry->tdir_tag, direntry->tdir_tag, datasize,
+-						filesize);
+-		return (TIFFReadDirEntryErrAlloc);
++		/* Before allocating a huge amount of memory for corrupted files, check
++		 * if size of requested memory is not greater than file size.
++		 */
++		const uint64_t filesize = TIFFGetFileSize(tif);
++		if (datasize > filesize)
++		{
++			TIFFWarningExt(tif->tif_clientdata, "ReadDirEntryArray",
++							"Requested memory size for tag %d (0x%x) %" PRIu32
++							" is greater than filesize %" PRIu64
++							". Memory not allocated, tag not read",
++							direntry->tdir_tag, direntry->tdir_tag, datasize,
++							filesize);
++			return (TIFFReadDirEntryErrAlloc);
++		}
+ 	}
+ 
+ 	if( isMapped(tif) && datasize > (uint64_t)tif->tif_size )
+@@ -4608,18 +4611,22 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
+         if( !_TIFFFillStrilesInternal( tif, 0 ) )
+             return -1;
+ 
+-	/* Before allocating a huge amount of memory for corrupted files, check if
+-	 * size of requested memory is not greater than file size. */
+-	uint64_t filesize = TIFFGetFileSize(tif);
+-	uint64_t allocsize = (uint64_t)td->td_nstrips * sizeof(uint64_t);
+-	if (allocsize > filesize)
++	const uint64_t allocsize = (uint64_t)td->td_nstrips * sizeof(uint64_t);
++	uint64_t filesize = 0;
++	if (allocsize > 100 * 1024 * 1024)
+ 	{
+-		TIFFWarningExt(tif->tif_clientdata, module,
+-						"Requested memory size for StripByteCounts of %" PRIu64
+-						" is greather than filesize %" PRIu64
+-						". Memory not allocated",
+-						allocsize, filesize);
+-		return -1;
++		/* Before allocating a huge amount of memory for corrupted files, check
++		 * if size of requested memory is not greater than file size. */
++		filesize = TIFFGetFileSize(tif);
++		if (allocsize > filesize)
++		{
++			TIFFWarningExt(
++				tif->tif_clientdata, module,
++				"Requested memory size for StripByteCounts of %" PRIu64
++				" is greater than filesize %" PRIu64 ". Memory not allocated",
++				allocsize, filesize);
++			return -1;
++		}
+ 	}
+ 
+ 	if (td->td_stripbytecount_p)
+@@ -4666,11 +4673,13 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
+                             return -1;
+ 			space+=datasize;
+ 		}
++		if (filesize == 0)
++			filesize = TIFFGetFileSize(tif);
+ 		if( filesize < space )
+-                    /* we should perhaps return in error ? */
+-                    space = filesize;
+-                else
+-                    space = filesize - space;
++			/* we should perhaps return in error ? */
++			space = filesize;
++		else
++			space = filesize - space;
+ 		if (td->td_planarconfig == PLANARCONFIG_SEPARATE)
+ 			space /= td->td_samplesperpixel;
+ 		for (strip = 0; strip < td->td_nstrips; strip++)
+@@ -4940,19 +4949,23 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
+ 			dircount16 = (uint16_t)dircount64;
+ 			dirsize = 20;
+ 		}
+-		/* Before allocating a huge amount of memory for corrupted files, check
+-		 * if size of requested memory is not greater than file size. */
+-		uint64_t filesize = TIFFGetFileSize(tif);
+-		uint64_t allocsize = (uint64_t)dircount16 * dirsize;
+-		if (allocsize > filesize)
++		const uint64_t allocsize = (uint64_t)dircount16 * dirsize;
++		if (allocsize > 100 * 1024 * 1024)
+ 		{
+-			TIFFWarningExt(
+-				tif->tif_clientdata, module,
+-				"Requested memory size for TIFF directory of %" PRIu64
+-				" is greather than filesize %" PRIu64
+-				". Memory not allocated, TIFF directory not read",
+-				allocsize, filesize);
+-			return 0;
++			/* Before allocating a huge amount of memory for corrupted files,
++			 * check if size of requested memory is not greater than file size.
++			 */
++			const uint64_t filesize = TIFFGetFileSize(tif);
++			if (allocsize > filesize)
++			{
++				TIFFWarningExt(
++					tif->tif_clientdata, module,
++					"Requested memory size for TIFF directory of %" PRIu64
++					" is greater than filesize %" PRIu64
++					". Memory not allocated, TIFF directory not read",
++					allocsize, filesize);
++				return 0;
++			}
+ 		}
+ 		origdir = _TIFFCheckMalloc(tif, dircount16,
+ 		    dirsize, "to read TIFF directory");
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.patch
new file mode 100644
index 0000000000..e88fb278ef
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.patch
@@ -0,0 +1,47 @@
+CVE: CVE-2023-6277
+Upstream-Status: Backport 
+[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/de7bfd7d4377c266f81849579f696fa1ad5ba6c3 
+ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6ubuntu0.8.debian.tar.xz ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+Backport of:
+
+From de7bfd7d4377c266f81849579f696fa1ad5ba6c3 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 31 Oct 2023 20:13:45 +0100
+Subject: [PATCH] TIFFFetchDirectory(): remove useless allocsize vs filesize
+ check
+
+CoverityScan rightly points that the max value for dircount16 * dirsize
+is 4096 * 20. That's small enough not to do any check
+---
+ libtiff/tif_dirread.c | 18 ------------------
+ 1 file changed, 18 deletions(-)
+
+--- tiff-4.3.0.orig/libtiff/tif_dirread.c
++++ tiff-4.3.0/libtiff/tif_dirread.c
+@@ -4949,24 +4949,6 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
+ 			dircount16 = (uint16_t)dircount64;
+ 			dirsize = 20;
+ 		}
+-		const uint64_t allocsize = (uint64_t)dircount16 * dirsize;
+-		if (allocsize > 100 * 1024 * 1024)
+-		{
+-			/* Before allocating a huge amount of memory for corrupted files,
+-			 * check if size of requested memory is not greater than file size.
+-			 */
+-			const uint64_t filesize = TIFFGetFileSize(tif);
+-			if (allocsize > filesize)
+-			{
+-				TIFFWarningExt(
+-					tif->tif_clientdata, module,
+-					"Requested memory size for TIFF directory of %" PRIu64
+-					" is greater than filesize %" PRIu64
+-					". Memory not allocated, TIFF directory not read",
+-					allocsize, filesize);
+-				return 0;
+-			}
+-		}
+ 		origdir = _TIFFCheckMalloc(tif, dircount16,
+ 		    dirsize, "to read TIFF directory");
+ 		if (origdir == NULL)
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.patch
new file mode 100644
index 0000000000..2ab7e2e9da
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.patch
@@ -0,0 +1,94 @@
+CVE: CVE-2023-6277
+Upstream-Status: Backport 
+[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/dbb825a8312f30e63a06c272010967d51af5c35a
+ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6ubuntu0.8.debian.tar.xz ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+[Ubuntu note: Backport of the following patch from upstream, with a few changes
+to match the current version of the file in the present Ubuntu release:
+ . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not exist yet);
+ . calling _TIFFfree(data) instead of _TIFFfreeExt(tif, data) (the latter did not exist yet);
+-- Rodrigo Figueiredo Zaiden]
+
+Backport of:
+
+From dbb825a8312f30e63a06c272010967d51af5c35a Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 31 Oct 2023 21:30:58 +0100
+Subject: [PATCH] tif_dirread.c: only issue TIFFGetFileSize() for large enough
+ RAM requests
+
+---
+ libtiff/tif_dirread.c | 54 +++++++++++++++++++++++++------------------
+ 1 file changed, 31 insertions(+), 23 deletions(-)
+
+--- tiff-4.3.0.orig/libtiff/tif_dirread.c
++++ tiff-4.3.0/libtiff/tif_dirread.c
+@@ -5905,19 +5905,24 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEn
+ 			return(0);
+ 		}
+ 
+-		/* Before allocating a huge amount of memory for corrupted files, check
+-		 * if size of requested memory is not greater than file size. */
+-		uint64_t filesize = TIFFGetFileSize(tif);
+-		uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t);
+-		if (allocsize > filesize)
++		const uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t);
++		if (allocsize > 100 * 1024 * 1024)
+ 		{
+-			TIFFWarningExt(tif->tif_clientdata, module,
+-							"Requested memory size for StripArray of %" PRIu64
+-							" is greather than filesize %" PRIu64
+-							". Memory not allocated",
+-							allocsize, filesize);
+-			_TIFFfree(data);
+-			return (0);
++			/* Before allocating a huge amount of memory for corrupted files,
++			 * check if size of requested memory is not greater than file size.
++			 */
++			const uint64_t filesize = TIFFGetFileSize(tif);
++			if (allocsize > filesize)
++			{
++				TIFFWarningExt(
++					tif->tif_clientdata, module,
++					"Requested memory size for StripArray of %" PRIu64
++					" is greater than filesize %" PRIu64
++					". Memory not allocated",
++					allocsize, filesize);
++				_TIFFfree(data);
++				return (0);
++			}
+ 		}
+ 		resizeddata=(uint64_t*)_TIFFCheckMalloc(tif, nstrips, sizeof(uint64_t), "for strip array");
+ 		if (resizeddata==0) {
+@@ -6018,17 +6023,20 @@ static void allocChoppedUpStripArrays(TI
+ 	 * size of StripByteCount and StripOffset tags is not greater than
+ 	 * file size.
+ 	 */
+-	uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t) * 2;
+-	uint64_t filesize = TIFFGetFileSize(tif);
+-	if (allocsize > filesize)
++	const uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t) * 2;
++	if (allocsize > 100 * 1024 * 1024)
+ 	{
+-		TIFFWarningExt(tif->tif_clientdata, "allocChoppedUpStripArrays",
+-						"Requested memory size for StripByteCount and "
+-						"StripOffsets %" PRIu64
+-						" is greather than filesize %" PRIu64
+-						". Memory not allocated",
+-						allocsize, filesize);
+-		return;
++		const uint64_t filesize = TIFFGetFileSize(tif);
++		if (allocsize > filesize)
++		{
++			TIFFWarningExt(tif->tif_clientdata, "allocChoppedUpStripArrays",
++							"Requested memory size for StripByteCount and "
++							"StripOffsets %" PRIu64
++							" is greater than filesize %" PRIu64
++							". Memory not allocated",
++							allocsize, filesize);
++			return;
++		}
+ 	}
+ 
+     newcounts = (uint64_t*) _TIFFCheckMalloc(tif, nstrips, sizeof (uint64_t),
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index d284100ab2..b4af179e76 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -48,6 +48,11 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-40745.patch \
            file://CVE-2023-41175.patch \
            file://CVE-2023-6228.patch \
+           file://CVE-2023-52356.patch \
+           file://CVE-2023-6277-1.patch \
+           file://CVE-2023-6277-2.patch \
+           file://CVE-2023-6277-3.patch \
+           file://CVE-2023-6277-4.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.37.3


