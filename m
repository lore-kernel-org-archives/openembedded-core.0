Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61239C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 17:54:01 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.409.1701798835473829177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 09:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aw6HLFWQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ce6b62746dso957741b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 09:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701798834; x=1702403634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8awq01ZbByv2X9SgK6tmlqyLLbhK2PDI/OEjzGCXz3A=;
        b=aw6HLFWQfNeLseaSO+3h68dDnmiqtzbK4bQMODEFeNoIKxz2c9pcE9zl7aMcx5WByT
         PmUycxuHzOqgKkMK6E5TYH+axbsRILL62e3gEokstLHF3lDxVePPkTwKtXpUF/PkDtTh
         RKErUyMrQ0llnt7WimUUFg2MEp2jQez2PFAnq42RJGBWSFD0qRYfmkEcjX5AX9uV4fyq
         NRjSPXjhS9qY7A9R5xHBkl2dhdu+pxLQD4z62jmy89UBG1HASZMkAz8/NaEsjXawh/Cg
         ZvtThZBKR/lmXhX7NRl854Jz8o7LJDm/nhUQHaBc5XGxdf6AAy5CuCIBi2yAxbhfeT7e
         1Yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701798834; x=1702403634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8awq01ZbByv2X9SgK6tmlqyLLbhK2PDI/OEjzGCXz3A=;
        b=RajMgyW8KvoACtjatbPGUpXwgmpBYmDz5eK1oUkLSNwt1YGCe3P/A4D+8hEiRCgVca
         9YnerOL+eBXFRvn1k7mInOQSOz9vTF1v3M+YyT+B7vlNtq0+lwkQ5N/2L+ZlBqqrZkBo
         8m7NoQRKE7U0/u3Dp+viMIR/vnQA/aq7NFLP/a5tA2jIsZqfQOUAWOGe7u9LHDkyiaBC
         QYUhqTPMmA+vju1BzJZUE5jbOjOov3dcOqFNzl0ZIUh7/j87s2qPSyCaKmy715JMk6dj
         7La7S8xQeglGydGhGdoyStgBIvRBE8E96do33ODMUyFfrFw+RyVB4Oqyonn7Q4YTgeCF
         22DQ==
X-Gm-Message-State: AOJu0Yx1/jA5UkOlk2SQ3sKnuxenZ8ze27JDhPG55mofiDGkV1RfH1z/
	uXDK4+dHID1dspleGx1S1iHc+YfsZB4=
X-Google-Smtp-Source: AGHT+IFUA+g1lzYp4Qgo0drwtQxW3Rt5GbyPXAeBWt8xcJkTJlODLiOLpj7Tm50lDlffZCUR6+anJQ==
X-Received: by 2002:a05:6a20:7350:b0:18d:4821:f754 with SMTP id v16-20020a056a20735000b0018d4821f754mr9686216pzc.55.1701798834249;
        Tue, 05 Dec 2023 09:53:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id o8-20020a056a001b4800b006ce61c9495bsm2829258pfv.10.2023.12.05.09.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 09:53:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] tiff: Backport fixes for CVE-2023-6277
Date: Tue,  5 Dec 2023 09:53:49 -0800
Message-ID: <20231205175351.2013236-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 17:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191851

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop ununsed patch

 ...277-Apply-1-suggestion-s-to-1-file-s.patch |  27 +++
 ...ompare-data-size-of-some-tags-data-2.patch |  36 ++++
 ...-compare-data-size-of-some-tags-data.patch | 162 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |   3 +
 4 files changed, 228 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch
new file mode 100644
index 00000000000..5d15dff1d9b
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch
@@ -0,0 +1,27 @@
+From e1640519208121f916da1772a5efb6ca28971b86 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 31 Oct 2023 15:04:37 +0000
+Subject: [PATCH 3/3] Apply 1 suggestion(s) to 1 file(s)
+
+CVE: CVE-2023-6277
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_requests/545]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libtiff/tif_dirread.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index fe8d6f8..58a4276 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -5306,7 +5306,6 @@ static int EstimateStripByteCounts(TIFF *tif, TIFFDirEntry *dir,
+     {
+         uint64_t space;
+         uint16_t n;
+-        filesize = TIFFGetFileSize(tif);
+         if (!(tif->tif_flags & TIFF_BIGTIFF))
+             space = sizeof(TIFFHeaderClassic) + 2 + dircount * 12 + 4;
+         else
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch
new file mode 100644
index 00000000000..9fc8182fef3
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch
@@ -0,0 +1,36 @@
+From f500facf7723f1cae725dd288b2daad15e45131c Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Mon, 30 Oct 2023 21:21:57 +0100
+Subject: [PATCH 2/3] At image reading, compare data size of some tags / data
+ structures (StripByteCounts, StripOffsets, StripArray, TIFF directory) with
+ file size to prevent provoked out-of-memory attacks.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+See issue #614.
+
+Correct declaration of ‘filesize’ shadows a previous local.
+
+CVE: CVE-2023-6277
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_requests/545]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libtiff/tif_dirread.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index c52d41f..fe8d6f8 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -5305,7 +5305,6 @@ static int EstimateStripByteCounts(TIFF *tif, TIFFDirEntry *dir,
+     if (td->td_compression != COMPRESSION_NONE)
+     {
+         uint64_t space;
+-        uint64_t filesize;
+         uint16_t n;
+         filesize = TIFFGetFileSize(tif);
+         if (!(tif->tif_flags & TIFF_BIGTIFF))
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch
new file mode 100644
index 00000000000..d5854a9059b
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch
@@ -0,0 +1,162 @@
+From b33baa5d9c6aac8ce49b5180dd48e39697ab7a11 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 27 Oct 2023 22:11:10 +0200
+Subject: [PATCH 1/3] At image reading, compare data size of some tags / data
+ structures (StripByteCounts, StripOffsets, StripArray, TIFF directory) with
+ file size to prevent provoked out-of-memory attacks.
+
+See issue #614.
+
+CVE: CVE-2023-6277
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_requests/545]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libtiff/tif_dirread.c | 90 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 90 insertions(+)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 2c49dc6..c52d41f 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -1308,6 +1308,21 @@ TIFFReadDirEntryArrayWithLimit(TIFF *tif, TIFFDirEntry *direntry,
+     datasize = (*count) * typesize;
+     assert((tmsize_t)datasize > 0);
+ 
++    /* Before allocating a huge amount of memory for corrupted files, check if
++     * size of requested memory is not greater than file size.
++     */
++    uint64_t filesize = TIFFGetFileSize(tif);
++    if (datasize > filesize)
++    {
++        TIFFWarningExtR(tif, "ReadDirEntryArray",
++                        "Requested memory size for tag %d (0x%x) %" PRIu32
++                        " is greather than filesize %" PRIu64
++                        ". Memory not allocated, tag not read",
++                        direntry->tdir_tag, direntry->tdir_tag, datasize,
++                        filesize);
++        return (TIFFReadDirEntryErrAlloc);
++    }
++
+     if (isMapped(tif) && datasize > (uint64_t)tif->tif_size)
+         return TIFFReadDirEntryErrIo;
+ 
+@@ -5266,6 +5281,20 @@ static int EstimateStripByteCounts(TIFF *tif, TIFFDirEntry *dir,
+     if (!_TIFFFillStrilesInternal(tif, 0))
+         return -1;
+ 
++    /* Before allocating a huge amount of memory for corrupted files, check if
++     * size of requested memory is not greater than file size. */
++    uint64_t filesize = TIFFGetFileSize(tif);
++    uint64_t allocsize = (uint64_t)td->td_nstrips * sizeof(uint64_t);
++    if (allocsize > filesize)
++    {
++        TIFFWarningExtR(tif, module,
++                        "Requested memory size for StripByteCounts of %" PRIu64
++                        " is greather than filesize %" PRIu64
++                        ". Memory not allocated",
++                        allocsize, filesize);
++        return -1;
++    }
++
+     if (td->td_stripbytecount_p)
+         _TIFFfreeExt(tif, td->td_stripbytecount_p);
+     td->td_stripbytecount_p = (uint64_t *)_TIFFCheckMalloc(
+@@ -5807,6 +5836,20 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uint64_t diroff,
+             dircount16 = (uint16_t)dircount64;
+             dirsize = 20;
+         }
++        /* Before allocating a huge amount of memory for corrupted files, check
++         * if size of requested memory is not greater than file size. */
++        uint64_t filesize = TIFFGetFileSize(tif);
++        uint64_t allocsize = (uint64_t)dircount16 * dirsize;
++        if (allocsize > filesize)
++        {
++            TIFFWarningExtR(
++                tif, module,
++                "Requested memory size for TIFF directory of %" PRIu64
++                " is greather than filesize %" PRIu64
++                ". Memory not allocated, TIFF directory not read",
++                allocsize, filesize);
++            return 0;
++        }
+         origdir = _TIFFCheckMalloc(tif, dircount16, dirsize,
+                                    "to read TIFF directory");
+         if (origdir == NULL)
+@@ -5921,6 +5964,20 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uint64_t diroff,
+                           "directories not supported");
+             return 0;
+         }
++        /* Before allocating a huge amount of memory for corrupted files, check
++         * if size of requested memory is not greater than file size. */
++        uint64_t filesize = TIFFGetFileSize(tif);
++        uint64_t allocsize = (uint64_t)dircount16 * dirsize;
++        if (allocsize > filesize)
++        {
++            TIFFWarningExtR(
++                tif, module,
++                "Requested memory size for TIFF directory of %" PRIu64
++                " is greather than filesize %" PRIu64
++                ". Memory not allocated, TIFF directory not read",
++                allocsize, filesize);
++            return 0;
++        }
+         origdir = _TIFFCheckMalloc(tif, dircount16, dirsize,
+                                    "to read TIFF directory");
+         if (origdir == NULL)
+@@ -5968,6 +6025,8 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uint64_t diroff,
+             }
+         }
+     }
++    /* No check against filesize needed here because "dir" should have same size
++     * than "origdir" checked above. */
+     dir = (TIFFDirEntry *)_TIFFCheckMalloc(
+         tif, dircount16, sizeof(TIFFDirEntry), "to read TIFF directory");
+     if (dir == 0)
+@@ -7164,6 +7223,20 @@ static int TIFFFetchStripThing(TIFF *tif, TIFFDirEntry *dir, uint32_t nstrips,
+             return (0);
+         }
+ 
++        /* Before allocating a huge amount of memory for corrupted files, check
++         * if size of requested memory is not greater than file size. */
++        uint64_t filesize = TIFFGetFileSize(tif);
++        uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t);
++        if (allocsize > filesize)
++        {
++            TIFFWarningExtR(tif, module,
++                            "Requested memory size for StripArray of %" PRIu64
++                            " is greather than filesize %" PRIu64
++                            ". Memory not allocated",
++                            allocsize, filesize);
++            _TIFFfreeExt(tif, data);
++            return (0);
++        }
+         resizeddata = (uint64_t *)_TIFFCheckMalloc(
+             tif, nstrips, sizeof(uint64_t), "for strip array");
+         if (resizeddata == 0)
+@@ -7263,6 +7336,23 @@ static void allocChoppedUpStripArrays(TIFF *tif, uint32_t nstrips,
+     }
+     bytecount = last_offset + last_bytecount - offset;
+ 
++    /* Before allocating a huge amount of memory for corrupted files, check if
++     * size of StripByteCount and StripOffset tags is not greater than
++     * file size.
++     */
++    uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t) * 2;
++    uint64_t filesize = TIFFGetFileSize(tif);
++    if (allocsize > filesize)
++    {
++        TIFFWarningExtR(tif, "allocChoppedUpStripArrays",
++                        "Requested memory size for StripByteCount and "
++                        "StripOffsets %" PRIu64
++                        " is greather than filesize %" PRIu64
++                        ". Memory not allocated",
++                        allocsize, filesize);
++        return;
++    }
++
+     newcounts =
+         (uint64_t *)_TIFFCheckMalloc(tif, nstrips, sizeof(uint64_t),
+                                      "for chopped \"StripByteCounts\" array");
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 49984f1125e..4c472f8ef6f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch \
+           file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch \
+           file://CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch \
            "
 
 SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
-- 
2.43.0


