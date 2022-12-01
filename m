Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6578DC47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:42 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.44769.1669904857198721119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KcQ6idCQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id jn7so1761799plb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgfqP2WR9s+5A9PUu+anUciwCIRAbh4BLWbCbQ9kp0U=;
        b=KcQ6idCQZcFFUvVkporGCOkg+1BEBlAEALGf4sidZ9OXnWWWwTp886M901fY9mK3SI
         GADUPvqIqb4+IyvRXWZ0V3/2h90mfAJy1ZtUf28aafYkza+ctAvPvJz0PZrPuw2BSfuB
         unLmvX+vY1cV36883/4rDYV0VLzGJzLeC97x41PQJ0C4TtroA+qvwyyyxZssTj9/cNJy
         RRUpniBGPSoVV//IipVvYAMc8ZhVoFNthYDIuVd6kJBMumCds06scRkeQ9Edrt5yzKmJ
         M4wla5VLAKimS7V108xLkt8L32JW1VMO2PsltmSYO4+fIyMwlA9Gpue+LtcQU9ba7Oas
         Pd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgfqP2WR9s+5A9PUu+anUciwCIRAbh4BLWbCbQ9kp0U=;
        b=J4bRpn3REO6gZ7z32gk4G3O/OvDtGEsBF7e8LyGQVgo4kR5LEACcs39mHfMABLSmN/
         9lOPIs9Se2GwOy86ke5HKpUvxV/daIu7ny8JmBKh0mEQOrcLIoW6w46psBj8bJe3ydOo
         NEyoquAL2QrZ9rpimPXlzOOfXuJGw/ufdjxwI+eWKtlIJqq2kj3GLkiJl1tnTu+mvM+V
         9pBAVCffRIoeNKtVv/ytvVJOKQ0UOCWS3qyryzfFDydnq3eTGX1ZiOZySet12/FwjQ6g
         bpWJHDrAM1O9ecSPsQJXrFCGTIomrF2TssB5RX4va4j9i+WuvpTBzb9nvzG0+cUDME0r
         POhA==
X-Gm-Message-State: ANoB5pk+dN3b7/SHDmqoHjzRn5Bb7oFDpDEHcqsqNR8iTAkyGeRPVQ+4
	/qBuMYnyJeTlpgYKSCmmddtBFb0c+WPGFRC1WV8=
X-Google-Smtp-Source: AA0mqf6/nRh0pujpRm5rAMpoL8m9+muLLS2TjxsUmhebGMZLqmjJTo3sZaKkxJh5dAyEIBQU2hH4mg==
X-Received: by 2002:a17:902:bd42:b0:188:ca57:8945 with SMTP id b2-20020a170902bd4200b00188ca578945mr48324888plx.116.1669904856190;
        Thu, 01 Dec 2022 06:27:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/23] tiff: Security fix for CVE-2022-3970
Date: Thu,  1 Dec 2022 04:26:58 -1000
Message-Id: <d4b231e1baa0c4c6fa8eaa2e25170eeb29cd1cdf.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174090

From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>

This patch contains a fix for CVE-2022-3970

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3970
https://security-tracker.debian.org/tracker/CVE-2022-3970

Patch generated from :
https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2022-3970.patch          | 38 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
new file mode 100644
index 0000000000..3779ebf646
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
@@ -0,0 +1,38 @@
+From 11c8026913e190b02266c1247e7a770e488d925e Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+ strips/tiles > 2 GB
+
+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
+Upstream-Status: Accepted
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a1b6570b..9a2e0c59 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3058,15 +3058,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index af9bdcfbde..b3737f962e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
            file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
            file://CVE-2022-2953.patch \
+           file://CVE-2022-3970.patch \
            file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch \
            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
-- 
2.25.1


