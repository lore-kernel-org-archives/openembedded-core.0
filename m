Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536B4CD4F33
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.16360.1695367498809389194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zl98K6Q4;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so235408866b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367497; x=1695972297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0hW/FsnM00pODFj0keYNZc9OXhrTOFbrcPdMB71wqM=;
        b=Zl98K6Q4LRsSp+SrWO2o/nzwoBcvBnl6xU6lMO7BMkNS7Be1rwYExy8DnVXpZW1IlW
         xu/KWbUCfLAWK8875ac8UvbZ5DGxcosmyHIhqPaPdhNBP33XPkSE/3fmj9YVVz3vYYtv
         E6FZOi1PdiK2oFXVsqtGFeHvbf29TutZwcB/j43ZsEuoFIdRURWLRw2nzvASL2iys1jk
         9Ty0V7XeS6sYCSidrXjgpbqACKwzOaVwDwo6zfuSd49lguoOc6Pdl8GJ6FobitLpvLK8
         7kJHUoXe29Y8s1GH/bZyitWBlTnQ3R9+EO1iMN6+fH/O151CawfUAymTcLiFYvYj2EVS
         Aw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367497; x=1695972297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0hW/FsnM00pODFj0keYNZc9OXhrTOFbrcPdMB71wqM=;
        b=X8MidgqfpJjtW99YA3zcbC1pVabkicAni18+5jBb0GRvKptzVpeuNWSjd4tBmmeo1W
         vGwWVTd9lRBFMenWNxxxDJ/6mTOYm1878lFaE9IHaosYDcl3MxwW9l/t2sO4hLuY9MJR
         DLxXDkWQtKcYHTmtXaEAUmVY4AVtGw5MiUaHcDI4IyLsAlCbCVG92hllPg3WQmXeG4IN
         H/st9QECsmAUly82tWf+LyVzt2B0bB/VlC96bx7P13ovU0m6AUO7Vr70d3s7x5YUcgC1
         0xSw3+6QHBUO2zfqBJzmfY+lvh/79wuFd9b6dERyI4GyI6z7pL4Oj+jIz22FNU/H+NSL
         S2xw==
X-Gm-Message-State: AOJu0YzLHzt9YS1DzTm1gYeI+IXab5WKKdxBzADRNBrWhfaKTFs0G2vN
	gpRDSy3KGu8EedWuvYQUQcEmXDg4ppM=
X-Google-Smtp-Source: AGHT+IHL6jJajtmN36PsCsxVTADC6xDXcy9lEJ4xHUhBS08lYRBJHj/LYkAyH/BvzLDNno8bSs5ujQ==
X-Received: by 2002:a17:906:cc4d:b0:9a9:e3a9:af02 with SMTP id mm13-20020a170906cc4d00b009a9e3a9af02mr6478794ejb.8.1695367497147;
        Fri, 22 Sep 2023 00:24:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/40] tiff: upgrade 4.5.1 -> 4.6.0
Date: Fri, 22 Sep 2023 09:24:27 +0200
Message-Id: <20230922072431.1481743-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188078

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libtiff/files/CVE-2023-40745.patch        | 35 -----------
 .../libtiff/files/CVE-2023-41175.patch        | 63 -------------------
 .../libtiff/{tiff_4.5.1.bb => tiff_4.6.0.bb}  |  4 +-
 3 files changed, 1 insertion(+), 101 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.5.1.bb => tiff_4.6.0.bb} (93%)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
deleted file mode 100644
index 73f1f37bab0..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4fc16f649fa2875d5c388cf2edc295510a247ee5 Mon Sep 17 00:00:00 2001
-From: Arie Haenel <arie.haenel@jct.ac.il>
-Date: Thu, 14 Sep 2023 04:31:35 +0000
-Subject: [PATCH] tiffcp: fix memory corruption (overflow) on hostile images
- (fixes #591)
-
-CVE: CVE-2023-40745
-
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- tools/tiffcp.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index 3b2d1dd..57fa6e8 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -1754,6 +1754,13 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
-                   "Width * Samples/Pixel)");
-         return 0;
-     }
-+
-+    if ( (imagew - tilew * spp) > INT_MAX ){
-+        TIFFError(TIFFFileName(in),
-+                  "Error, image raster scan line size is too large");
-+        return 0;
-+    }
-+
-     iskew = imagew - tilew * spp;
-     tilebuf = limitMalloc(tilesize);
-     if (tilebuf == 0)
---
-2.35.5
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
deleted file mode 100644
index cca30b21968..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 6e2dac5f904496d127c92ddc4e56eccfca25c2ee Mon Sep 17 00:00:00 2001
-From: Arie Haenel <arie.haenel@jct.ac.il>
-Date: Thu, 14 Sep 2023 04:36:58 +0000
-Subject: [PATCH] raw2tiff: fix integer overflow and bypass of the check (fixes
-   #592)
-
-CVE: CVE-2023-41175
-
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- tools/raw2tiff.c | 28 ++++++++++++++++++++++++++++
- 1 file changed, 28 insertions(+)
-
-diff --git a/tools/raw2tiff.c b/tools/raw2tiff.c
-index 4ee59e5..a811077 100644
---- a/tools/raw2tiff.c
-+++ b/tools/raw2tiff.c
-@@ -101,6 +101,7 @@ int main(int argc, char *argv[])
-     int fd;
-     char *outfilename = NULL;
-     TIFF *out;
-+    uint32_t temp_limit_check = 0;     /* temp for integer overflow checking*/
-
-     uint32_t row, col, band;
-     int c;
-@@ -221,6 +222,33 @@ int main(int argc, char *argv[])
-     if (guessSize(fd, dtype, hdr_size, nbands, swab, &width, &length) < 0)
-         return EXIT_FAILURE;
-
-+    /* check for integer overflow in */
-+    /* hdr_size + (*width) * (*length) * nbands * depth */
-+
-+    if ((width == 0) || (length == 0) ){
-+        fprintf(stderr, "Too large nbands value specified.\n");
-+        return (EXIT_FAILURE);
-+    }
-+
-+    temp_limit_check = nbands * depth;
-+
-+    if ( !temp_limit_check || length > ( UINT_MAX / temp_limit_check ) )  {
-+        fprintf(stderr, "Too large length size specified.\n");
-+        return (EXIT_FAILURE);
-+    }
-+    temp_limit_check = temp_limit_check * length;
-+
-+    if ( !temp_limit_check || width > ( UINT_MAX / temp_limit_check ) )  {
-+        fprintf(stderr, "Too large width size specified.\n");
-+        return (EXIT_FAILURE);
-+    }
-+    temp_limit_check = temp_limit_check * width;
-+
-+    if ( !temp_limit_check || hdr_size > ( UINT_MAX - temp_limit_check ) )  {
-+        fprintf(stderr, "Too large header size specified.\n");
-+        return (EXIT_FAILURE);
-+    }
-+
-     if (outfilename == NULL)
-         outfilename = argv[optind + 1];
-     out = TIFFOpen(outfilename, "w");
---
-2.35.5
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
similarity index 93%
rename from meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 2b5e66b8f35..49984f1125e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -9,11 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2023-40745.patch \
-           file://CVE-2023-41175.patch \
            "
 
-SRC_URI[sha256sum] = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b"
+SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


