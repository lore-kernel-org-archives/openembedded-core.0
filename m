Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EF9C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 13:04:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.12413.1711112686344257350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 06:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aCqpMvjq;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e0878b76f3so6742815ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711112685; x=1711717485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y6HGgZ3I8YN8EO5m3JwXo8OM7gZ+u1PYkBHnYiZv/U=;
        b=aCqpMvjq0sGAQE3NtHbP/Wp46Jf/XqXc7235PALeVaOASXSjVcge6+ueQ8rfZbVL7y
         vX8fcNZdjSf+32nwEMSnuIGcvtoaJUFwmqIzjXUXFC0Qs3ZCU3VDXj48sKboeAVUEjfL
         O/b/RQrECvnRxpQLlrFRaIG+OxQhicJreCPBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711112685; x=1711717485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Y6HGgZ3I8YN8EO5m3JwXo8OM7gZ+u1PYkBHnYiZv/U=;
        b=d6fZxvjr5hjwMn2TAtS5F5fs2s2hsVEYpAdNI6tR/53C3OsBHrlvOUFyz0lWvQx59W
         TZEMvBv0F/KX+c4ubLjqqnGYvQJpuXs1VPQsSNLBVIJSKYnWrUJ0zn0Zk2YStjy4M0Rb
         QJjYMk312eQ8fBCvQNYTUeBA9T1WoSnFQLKTFV3FJWcBn6mjHpaipEYfljxRJtRGxiHR
         iLhKpiev38f+Hefb01d2FLNcrbPAS/oHSCAGxwFJ0iCbwdVb5gKIVSc/KHykoGqMYqeh
         16gSRAQkaar33/fCx6Km12JkYAqCmzUEvFnNOqPH6PFwPFgD7yBeJZXKc0QDWbXr3rxo
         U0Hw==
X-Gm-Message-State: AOJu0YxQfSqzejcn4wADVHvcCu0W6QkyZHa1zYz6gJNnYq99q4locccX
	//A1jzEq+4oleJ01flBtFYmYdzmYS2Tu5xK00LJukbQ8/i/BlGxpu8h5yWD143b1xlomhA2tUN7
	1
X-Google-Smtp-Source: AGHT+IGPEDsI1KPK5lG94a5TVSofUzeaTHUEqHamriWQkXRAdo4WIBOuWbtp1dNmJBP+nCPNuN9MFg==
X-Received: by 2002:a17:902:e751:b0:1dd:8daf:99d7 with SMTP id p17-20020a170902e75100b001dd8daf99d7mr2936502plf.32.1711112684350;
        Fri, 22 Mar 2024 06:04:44 -0700 (PDT)
Received: from localhost.localdomain ([49.207.197.57])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902e84300b001e005a58237sm1846172plg.93.2024.03.22.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 06:04:43 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] libtiff: backport Debian patch for CVE-2023-6277 & CVE-2023-52356
Date: Fri, 22 Mar 2024 18:34:35 +0530
Message-Id: <20240322130435.35278-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 13:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197444

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-6277
 CVE-2023-52356

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/tiff/tree/debian/patches/?h=ubuntu%2Ffocal-security
Upstream commit
https://gitlab.com/libtiff/libtiff/-/commit/5320c9d89c054fa805d037d84c57da874470b01a
&
https://gitlab.com/libtiff/libtiff/-/commit/0b025324711213a75e38b52f7e7ba60235f108aa
&
https://gitlab.com/libtiff/libtiff/-/commit/de7bfd7d4377c266f81849579f696fa1ad5ba6c3
&
https://gitlab.com/libtiff/libtiff/-/commit/dbb825a8312f30e63a06c272010967d51af5c35a
&
https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libtiff/files/CVE-2023-52356.patch        |  53 +++++
 .../libtiff/files/CVE-2023-6277-1.patch       | 191 ++++++++++++++++++
 .../libtiff/files/CVE-2023-6277-2.patch       | 152 ++++++++++++++
 .../libtiff/files/CVE-2023-6277-3.patch       |  46 +++++
 .../libtiff/files/CVE-2023-6277-4.patch       |  94 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   5 +
 6 files changed, 541 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-52356.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6277-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6277-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6277-3.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6277-4.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-52356.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-52356.patch
new file mode 100644
index 0000000000..1b651e6529
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-52356.patch
@@ -0,0 +1,53 @@
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/tiff/tree/debian/patches/CVE-2023-52356.patch?h=ubuntu/focal-security
+Upstream commit  https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a]
+CVE: CVE-2023-52356
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libtiff/tif_getimage.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+
+--- tiff-4.1.0+git191117.orig/libtiff/tif_getimage.c
++++ tiff-4.1.0+git191117/libtiff/tif_getimage.c
+@@ -2926,6 +2926,13 @@ TIFFReadRGBAStripExt(TIFF* tif, uint32 r
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
+@@ -3002,6 +3009,14 @@ TIFFReadRGBATileExt(TIFF* tif, uint32 co
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
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-1.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-1.patch
new file mode 100644
index 0000000000..e955b3f2e4
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-1.patch
@@ -0,0 +1,191 @@
+[Ubuntu note: Backport of the following patch from upstream, with a few changes
+to match the current version of the file in the present Ubuntu release:
+ . included inttypes.h header to support PRIu32 and PRIu64;
+ . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not exist yet);
+ . using uint64 instead of uint64_t to preserve the current code usage;
+ . calling _TIFFfree(data) instead of _TIFFfreeExt(tif, data) (the latter did not exist yet);
+ . calls to the check size, that is the idea of the patch, were added before
+   _TIFFCheckMalloc and may note match the original patch methods;
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
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/tiff/tree/debian/patches/CVE-2023-6277-1.patch?h=ubuntu/focal-security
+Upstream commit  https://gitlab.com/libtiff/libtiff/-/commit/5320c9d89c054fa805d037d84c57da874470b01a]
+CVE: CVE-2023-6277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libtiff/tif_dirread.c | 92 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 90 insertions(+), 2 deletions(-)
+
+--- tiff-4.1.0+git191117.orig/libtiff/tif_dirread.c
++++ tiff-4.1.0+git191117/libtiff/tif_dirread.c
+@@ -37,6 +37,7 @@
+ #include "tiffiop.h"
+ #include <float.h>
+ #include <stdlib.h>
++#include <inttypes.h>
+ 
+ #define FAILED_FII    ((uint32) -1)
+ 
+@@ -863,6 +864,21 @@ static enum TIFFReadDirEntryErr TIFFRead
+ 	datasize=(*count)*typesize;
+ 	assert((tmsize_t)datasize>0);
+ 
++	/* Before allocating a huge amount of memory for corrupted files, check if
++	 * size of requested memory is not greater than file size.
++	 */
++	uint64 filesize = TIFFGetFileSize(tif);
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
+ 	if( isMapped(tif) && datasize > (uint32)tif->tif_size )
+ 		return TIFFReadDirEntryErrIo;
+ 
+@@ -4534,6 +4550,20 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
+         if( !_TIFFFillStrilesInternal( tif, 0 ) )
+             return -1;
+ 
++	/* Before allocating a huge amount of memory for corrupted files, check if
++	 * size of requested memory is not greater than file size. */
++	uint64 filesize = TIFFGetFileSize(tif);
++	uint64 allocsize = (uint64)td->td_nstrips * sizeof(uint64);
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
+ 	td->td_stripbytecount_p = (uint64*)
+@@ -4544,9 +4574,7 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
+ 
+ 	if (td->td_compression != COMPRESSION_NONE) {
+ 		uint64 space;
+-		uint64 filesize;
+ 		uint16 n;
+-		filesize = TIFFGetFileSize(tif);
+ 		if (!(tif->tif_flags&TIFF_BIGTIFF))
+ 			space=sizeof(TIFFHeaderClassic)+2+dircount*12+4;
+ 		else
+@@ -4854,6 +4882,20 @@ TIFFFetchDirectory(TIFF* tif, uint64 dir
+ 			dircount16 = (uint16)dircount64;
+ 			dirsize = 20;
+ 		}
++		/* Before allocating a huge amount of memory for corrupted files, check
++		 * if size of requested memory is not greater than file size. */
++		uint64 filesize = TIFFGetFileSize(tif);
++		uint64 allocsize = (uint64)dircount16 * dirsize;
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
+@@ -4957,6 +4999,20 @@ TIFFFetchDirectory(TIFF* tif, uint64 dir
+ 			             "Sanity check on directory count failed, zero tag directories not supported");
+ 			return 0;
+ 		}
++		/* Before allocating a huge amount of memory for corrupted files, check
++		 * if size of requested memory is not greater than file size. */
++		uint64 filesize = TIFFGetFileSize(tif);
++		uint64 allocsize = (uint64)dircount16 * dirsize;
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
+@@ -5000,6 +5056,8 @@ TIFFFetchDirectory(TIFF* tif, uint64 dir
+ 			}
+ 		}
+ 	}
++	/* No check against filesize needed here because "dir" should have same size
++	 * than "origdir" checked above. */
+ 	dir = (TIFFDirEntry*)_TIFFCheckMalloc(tif, dircount16,
+ 						sizeof(TIFFDirEntry),
+ 						"to read TIFF directory");
+@@ -5769,7 +5827,20 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEn
+ 			_TIFFfree(data);
+ 			return(0);
+ 		}
+-
++		/* Before allocating a huge amount of memory for corrupted files, check
++		 * if size of requested memory is not greater than file size. */
++		uint64 filesize = TIFFGetFileSize(tif);
++		uint64 allocsize = (uint64)nstrips * sizeof(uint64);
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
+ 		resizeddata=(uint64*)_TIFFCheckMalloc(tif,nstrips,sizeof(uint64),"for strip array");
+ 		if (resizeddata==0) {
+ 			_TIFFfree(data);
+@@ -5865,6 +5936,23 @@ static void allocChoppedUpStripArrays(TI
+     }
+     bytecount = last_offset + last_bytecount - offset;
+ 
++	/* Before allocating a huge amount of memory for corrupted files, check if
++	 * size of StripByteCount and StripOffset tags is not greater than
++	 * file size.
++	 */
++	uint64 allocsize = (uint64)nstrips * sizeof(uint64) * 2;
++	uint64 filesize = TIFFGetFileSize(tif);
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
+     newcounts = (uint64*) _TIFFCheckMalloc(tif, nstrips, sizeof (uint64),
+                             "for chopped \"StripByteCounts\" array");
+     newoffsets = (uint64*) _TIFFCheckMalloc(tif, nstrips, sizeof (uint64),
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-2.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-2.patch
new file mode 100644
index 0000000000..644b3fdb3f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-2.patch
@@ -0,0 +1,152 @@
+[Ubuntu note: Backport of the following patch from upstream, with a few changes
+to match the current version of the file in the present Ubuntu release:
+ . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not exist yet);
+ . using uint64 instead of uint64_t to preserve the current code usage;
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
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/tiff/tree/debian/patches/CVE-2023-6277-2.patch?h=ubuntu/focal-security
+Upstream commit  https://gitlab.com/libtiff/libtiff/-/commit/0b025324711213a75e38b52f7e7ba60235f108aa]
+CVE: CVE-2023-6277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libtiff/tif_dirread.c | 83 +++++++++++++++++++++++++------------------
+ 1 file changed, 48 insertions(+), 35 deletions(-)
+
+--- tiff-4.1.0+git191117.orig/libtiff/tif_dirread.c
++++ tiff-4.1.0+git191117/libtiff/tif_dirread.c
+@@ -864,19 +864,22 @@ static enum TIFFReadDirEntryErr TIFFRead
+ 	datasize=(*count)*typesize;
+ 	assert((tmsize_t)datasize>0);
+ 
+-	/* Before allocating a huge amount of memory for corrupted files, check if
+-	 * size of requested memory is not greater than file size.
+-	 */
+-	uint64 filesize = TIFFGetFileSize(tif);
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
++		const uint64 filesize = TIFFGetFileSize(tif);
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
+ 	if( isMapped(tif) && datasize > (uint32)tif->tif_size )
+@@ -4550,18 +4553,22 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
+         if( !_TIFFFillStrilesInternal( tif, 0 ) )
+             return -1;
+ 
+-	/* Before allocating a huge amount of memory for corrupted files, check if
+-	 * size of requested memory is not greater than file size. */
+-	uint64 filesize = TIFFGetFileSize(tif);
+-	uint64 allocsize = (uint64)td->td_nstrips * sizeof(uint64);
+-	if (allocsize > filesize)
++	const uint64 allocsize = (uint64)td->td_nstrips * sizeof(uint64);
++	uint64 filesize = 0;
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
+@@ -4608,11 +4615,13 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
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
+@@ -4882,19 +4891,23 @@ TIFFFetchDirectory(TIFF* tif, uint64 dir
+ 			dircount16 = (uint16)dircount64;
+ 			dirsize = 20;
+ 		}
+-		/* Before allocating a huge amount of memory for corrupted files, check
+-		 * if size of requested memory is not greater than file size. */
+-		uint64 filesize = TIFFGetFileSize(tif);
+-		uint64 allocsize = (uint64)dircount16 * dirsize;
+-		if (allocsize > filesize)
++		const uint64 allocsize = (uint64)dircount16 * dirsize;
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
++			const uint64 filesize = TIFFGetFileSize(tif);
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
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-3.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-3.patch
new file mode 100644
index 0000000000..ed7d7e7b96
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-3.patch
@@ -0,0 +1,46 @@
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
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/tiff/tree/debian/patches/CVE-2023-6277-3.patch?h=ubuntu/focal-security
+Upstream commit  https://gitlab.com/libtiff/libtiff/-/commit/de7bfd7d4377c266f81849579f696fa1ad5ba6c3]
+CVE: CVE-2023-6277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libtiff/tif_dirread.c | 18 ------------------
+ 1 file changed, 18 deletions(-)
+
+--- tiff-4.1.0+git191117.orig/libtiff/tif_dirread.c
++++ tiff-4.1.0+git191117/libtiff/tif_dirread.c
+@@ -4891,24 +4891,6 @@ TIFFFetchDirectory(TIFF* tif, uint64 dir
+ 			dircount16 = (uint16)dircount64;
+ 			dirsize = 20;
+ 		}
+-		const uint64 allocsize = (uint64)dircount16 * dirsize;
+-		if (allocsize > 100 * 1024 * 1024)
+-		{
+-			/* Before allocating a huge amount of memory for corrupted files,
+-			 * check if size of requested memory is not greater than file size.
+-			 */
+-			const uint64 filesize = TIFFGetFileSize(tif);
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
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-4.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-4.patch
new file mode 100644
index 0000000000..1a43fd3230
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-6277-4.patch
@@ -0,0 +1,94 @@
+[Ubuntu note: Backport of the following patch from upstream, with a few changes
+to match the current version of the file in the present Ubuntu release:
+ . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not exist yet);
+ . using uint64 instead of uint64_t to preserve the current code usage;
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/tiff/tree/debian/patches/CVE-2023-6277-4.patch?h=ubuntu/focal-security
+Upstream commit  https://gitlab.com/libtiff/libtiff/-/commit/dbb825a8312f30e63a06c272010967d51af5c35a]
+CVE: CVE-2023-6277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libtiff/tif_dirread.c | 54 +++++++++++++++++++++++++------------------
+ 1 file changed, 31 insertions(+), 23 deletions(-)
+
+--- tiff-4.1.0+git191117.orig/libtiff/tif_dirread.c
++++ tiff-4.1.0+git191117/libtiff/tif_dirread.c
+@@ -5822,19 +5822,24 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEn
+ 			_TIFFfree(data);
+ 			return(0);
+ 		}
+-		/* Before allocating a huge amount of memory for corrupted files, check
+-		 * if size of requested memory is not greater than file size. */
+-		uint64 filesize = TIFFGetFileSize(tif);
+-		uint64 allocsize = (uint64)nstrips * sizeof(uint64);
+-		if (allocsize > filesize)
++		const uint64 allocsize = (uint64)nstrips * sizeof(uint64);
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
++				* check if size of requested memory is not greater than file size.
++				*/
++			const uint64 filesize = TIFFGetFileSize(tif);
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
+ 		resizeddata=(uint64*)_TIFFCheckMalloc(tif,nstrips,sizeof(uint64),"for strip array");
+ 		if (resizeddata==0) {
+@@ -5935,17 +5940,20 @@ static void allocChoppedUpStripArrays(TI
+ 	 * size of StripByteCount and StripOffset tags is not greater than
+ 	 * file size.
+ 	 */
+-	uint64 allocsize = (uint64)nstrips * sizeof(uint64) * 2;
+-	uint64 filesize = TIFFGetFileSize(tif);
+-	if (allocsize > filesize)
+-	{
+-		TIFFWarningExt(tif->tif_clientdata, "allocChoppedUpStripArrays",
+-						"Requested memory size for StripByteCount and "
+-						"StripOffsets %" PRIu64
+-						" is greather than filesize %" PRIu64
+-						". Memory not allocated",
+-						allocsize, filesize);
+-		return;
++    const uint64 allocsize = (uint64)nstrips * sizeof(uint64) * 2;
++    if (allocsize > 100 * 1024 * 1024)
++    {
++        const uint64 filesize = TIFFGetFileSize(tif);
++        if (allocsize > filesize)
++        {
++            TIFFWarningExt(tif->tif_clientdata, "allocChoppedUpStripArrays",
++                            "Requested memory size for StripByteCount and "
++                            "StripOffsets %" PRIu64
++                            " is greater than filesize %" PRIu64
++                            ". Memory not allocated",
++                            allocsize, filesize);
++            return;
++        }
+ 	}
+ 
+     newcounts = (uint64*) _TIFFCheckMalloc(tif, nstrips, sizeof (uint64),
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index c739f3a7fa..7efaba3a38 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -49,6 +49,11 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-41175.patch \
            file://CVE-2022-40090.patch \
            file://CVE-2023-6228.patch \
+           file://CVE-2023-6277-1.patch \
+           file://CVE-2023-6277-2.patch \
+           file://CVE-2023-6277-3.patch \
+           file://CVE-2023-6277-4.patch \
+           file://CVE-2023-52356.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


