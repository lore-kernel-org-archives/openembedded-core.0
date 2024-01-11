Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AF5C47DA6
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:42 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.15553.1704990456204515170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lTaQQE0D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d3ea5cc137so46323795ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990455; x=1705595255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig48DaP0oc4CAgvSBuMOYTTmvUaqwimaA+xyOkmlxsc=;
        b=lTaQQE0D4BvnHA5f8q+JlAhsGMMeeUu+tGE4u4aYq66seAh1zRmKrwDk4NWsKvZcxZ
         mHeme2ZIaupiV15aBIQBwg20rWta6dZrG8aEgGrYLtMnFVMuZNlJ3xxKQ1eLswvnDkZu
         BAqqBSygexsSl+D57ENGRSf+sy6Qc+WBCXoRbsIvMKUiufXg58jMPuE3XFQHr+YMjylE
         h7eD+pZfP5eRdQH3UlMttxGGcv/imxb6O/9jwY/Ma/vnfs4bhJrT7dF8W72CgeDPKP2T
         dMaTi7sYxrJEFOQwPcdkznPZxiaIrdiRoQrBL6QVvId0lLTnMwl3CE5z5AIsJQGfxia6
         ZS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990455; x=1705595255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig48DaP0oc4CAgvSBuMOYTTmvUaqwimaA+xyOkmlxsc=;
        b=AX3nl/umG2G4uDkzAxMvTf0lv9AD8GGNMPg/56vPjLkwbqHsAkg0rQ0NYT6ec6htvn
         yd3ApQJDd6uqIDlJcKNkhfFZaCWqQkdC9ZMOpzlFLYm+gS/dKVTcOFMdVD4JoGId3sIt
         EaxNScx6tQ5s9DH6TBZsK+aUdYZCK3wG2XIHzxnkzw67P+LzRziaFUlbZtqrVg7wYEi/
         gKLp+KC6aux87yKRkkr+f0UuFnJKegO7OYEUXG1QtKlibs93fry4gh1eLLF6TUxMDA0V
         A0FBn+nen7jJ9T9ETgIVYF7SjAXucgn6AhLvYu382GloDpSccl2lBFTrnsNnvgxKaZWj
         56tQ==
X-Gm-Message-State: AOJu0YwpoDrprAiJc8GOOt6ikA9GVTMZ4OJod1RzgkJan53AiKSuqWrD
	WuK+7jf2Kn39/0SG/TlYR1NLsoyxQ6bJ8F97cPOKrNeUMudC3A==
X-Google-Smtp-Source: AGHT+IEd0DsS2D83qscic8TajQNFlfYrm6iyyeoem0bCSZxFDozg6j+Hn72Xke6NFYWIbrFisUWYSA==
X-Received: by 2002:a17:902:eb8e:b0:1d5:d00:c197 with SMTP id q14-20020a170902eb8e00b001d50d00c197mr1940560plg.19.1704990454815;
        Thu, 11 Jan 2024 08:27:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/12] tiff: Backport fixes for CVE-2023-6277
Date: Thu, 11 Jan 2024 06:27:15 -1000
Message-Id: <a2d0f36a89ba7414cb5aade202c0367097f6308b.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193550

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d115e17ad7775cf5bbfd402e98e61f362ac96efa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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
index 0000000000..5d15dff1d9
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
index 0000000000..9fc8182fef
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
index 0000000000..d5854a9059
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
index 49984f1125..4c472f8ef6 100644
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
2.34.1


