Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D666C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:12 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.44755.1669904590120506233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mHk67pAK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so2184403pjd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kwbjr68qIquHAn+BNCFhSPmN3UwqquuHxume7SXXhOw=;
        b=mHk67pAK22fceKMo7nWxeYy1YgDuEj02JtTrkbaub9mYDMSLZ/1s9sh27HHLbpJnx1
         tdFpg3Ku4+baJJ4cYs8NFk2MzA+64iJaAMaD2sGpzDPVb4a0damEYFQLskxIJr6/pE7/
         W1QJHOGSLimYIiCRTu626iqZYPnZI3qKDnUv+sZbrq18FTwJkf02ezsRGi3aaDfiQfWn
         JbtmAtyGyNtEtilV+t4cXDZceFxR8MxLHku6IAUlFW0z85BB/CWFIYMk1uI9/sobwHl+
         ae3IBiPamnOU6f4deU6BCH/ovEWbHFy4+N42RDFSH9rYG+O9k7o7mRqB0WXhaliAlr3z
         q3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kwbjr68qIquHAn+BNCFhSPmN3UwqquuHxume7SXXhOw=;
        b=iH/s4kqgaFucSAeByUXurMoDzZAaWC/QFyLLVKIRw0nDePRUOw/F9Wy1tg1JBAXyfg
         zo8R2QeivTInHbw9ZnVztdb6Tqn6OXgfCYWADtCwlrNquNFYXE0hUVujkY0NAUz5xdBZ
         g02rnymaFL9sFTFnhGj56t0e2mKK5DkGH4Orty04N5Hotslo+MX3eOwcMeYRgMjflTz6
         yewX9aHHR1oannkjPRfLTyW8MHJeyCdqfQGacJxuT34WkBwbrNsf3E5rwBxDWbuXV+su
         Ei5vF0+/UKtao2bQAgBDoLtJrZvCrlSXYC/0lDxt33p3OHEm9WVa2if54cGBJ2NB6x59
         2ZFw==
X-Gm-Message-State: ANoB5plJ6gvw97pQpUI997WwkByrShOPvwBJ2ntMaFNMsAqevt8JcYuv
	7AxKQGBp9vsgru5r38iBkD3augT+fkgaEAJD4Wg=
X-Google-Smtp-Source: AA0mqf74w8iv8KFCms+2UHyq3jgh7P96HGCQLpZF/HcLZszSEeRknpNdTuzLChP5Ni1KNz+f0UiFWg==
X-Received: by 2002:a17:902:cccd:b0:186:fd58:c706 with SMTP id z13-20020a170902cccd00b00186fd58c706mr48453585ple.4.1669904591011;
        Thu, 01 Dec 2022 06:23:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/22] tiff: Security fix for CVE-2022-3970
Date: Thu,  1 Dec 2022 04:22:34 -1000
Message-Id: <d066f7e8435491f53622d9d6b21f3650c22f8995.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174067

From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>

This patch contains a fix for CVE-2022-3970

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3970
https://security-tracker.debian.org/tracker/CVE-2022-3970

Patch generated from :
https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 668ff495ac44e5b6d9e1af15d3861b5c2b4dfcd1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2022-3970.patch         | 39 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
new file mode 100644
index 0000000000..b3352ba8ab
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
@@ -0,0 +1,39 @@
+From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+ strips/tiles > 2 GB
+
+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
+Upstream-Status: Accepted
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a4d0c1d6..60b94d8e 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
+         return( ok );
+ 
+     for( i_row = 0; i_row < read_ysize; i_row++ ) {
+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
+-                 raster + (read_ysize - i_row - 1) * read_xsize,
++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
+                  read_xsize * sizeof(uint32_t) );
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
+     }
+ 
+     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
+                      0, sizeof(uint32_t) * tile_xsize );
+     }
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 29cb4111d6..970aab5433 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2953.patch \
+           file://CVE-2022-3970.patch \
            file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch \
            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
-- 
2.25.1


