Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C60BCA0EE6
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 21:29:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.7851.1755120538676975774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 14:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ez+MFJjz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-244582738b5so1909145ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755120538; x=1755725338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9Yt3hguSPP7jQ8GRX7aRt0KrzPSMbfY/CbkcDt5tNQ=;
        b=ez+MFJjzU5fStlPNN6aCoMfo7Y5Trsbxf7KANL9DKNI6kYlGPm9bWodKJVXKkl+rpd
         /6NQQxWmfLehrC1zI7Zl2G8IItPPYO8MbP35LBl2aJ8bl2pjoPtmXO4zonQumR8znGHJ
         tvulOHfpHSNhjfASWp33zYD/eRrVqrjFTelrmZm9VP3fp/raclK/XRXomFwLAjQLhtfS
         LjK0ARXqAZCKp4nFtxG6/M7CWqfIMKLXn9XW00QJ7QUrR80OW4Lh6nV12oO+v0lWnMii
         l29GjM8FwmJs/UKWgKdGjYBBqlwm9j9U9T53KPP6UoWCL4smHODS4WE1Fccv0HjVnbeI
         ql7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120538; x=1755725338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9Yt3hguSPP7jQ8GRX7aRt0KrzPSMbfY/CbkcDt5tNQ=;
        b=KeueVpwscPRLFV7AJ+g7bY5ppaMJ4Ca+AV+uQU7krnInByaD7VGxZFNrAZJN+Kl6c+
         RhjrS98c4fVtIp57QGQAwIY6znfRGq0vDJZh7WIW9ftFIjvtg0ZMFi3OlPj3NlCcTeae
         ExhreB0s6T9+S5Q3YBsPrvQQpoRt/PAgCqJ7WmAzscrfAx8iW9js1tlD4DXvE9cM+Znu
         sCcBBUmaGPXSaD48z+ouIBn9R6+CSWUn+R4Qsoqa6m5MzsD35OP/XmpHNBHfjBrvPoZ2
         /ORGNyIaPKfqXEcuUjY3c47qxZ6klsnajQluocnbgEvllzH5f4sjsPR2DSZyJS77LVEL
         UuVA==
X-Gm-Message-State: AOJu0Yx3BKKXCHHTA4gfiYIcNlyTBn3ZsrCVzhhLccExF/7vMTcKIho1
	MCnRZOSFpVMDyl6EjoBmk0FbL4aUL1HdWqZkWKNA/lF5V3I7q3mTwdbrvvlmJbUL4rUlSrRkZDW
	tr/Vo
X-Gm-Gg: ASbGnctW/1ec7Cyn6hz3JykB+jUHCLcQ1L9x/zreiOnFoyJdp1r7x0oyRWi/YhPiPFO
	JIxAFNhf48sRqY4ATQekgMHFLXNym9EfM5CXEWpxK3noiPv4ppRtV0rBexL8AVibUTCUCWyben+
	M879E5p2LasXewRGC4YRKDwnIAPnfiPtCpMFk22Q+t19RzFWn2OVGd2ys0aSX/C+eSX+cGiCxwU
	k0fqfp+hepPr/tBjshXgob8Ae3y3MbXpO9A5UjFQVmJdYoC12nJJmqZsBz31x5MleTSng8n+3L/
	yQ3AYFKKn6de0XCfWQ4tnE3w9dXe+iV0gQeDQBgvjJulhzB1JuJv89B7/05mMFwAuKjxQ5X4Zez
	ZEwMnR2at5eyaJA==
X-Google-Smtp-Source: AGHT+IG/b3HekclWWtHoawj5bb82GuXFNVu41gj/wiqDHbJEDgHrLaLDTB7eDQlYZlMm3SdoP+pHdw==
X-Received: by 2002:a17:902:ebc9:b0:240:71ad:a442 with SMTP id d9443c01a7336-244584af6bbmr9266555ad.9.1755120537790;
        Wed, 13 Aug 2025 14:28:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:38b9:9a51:8a43:9529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm336178545ad.114.2025.08.13.14.28.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:28:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] tiff: fix CVE-2025-8176
Date: Wed, 13 Aug 2025 14:28:42 -0700
Message-ID: <5dbc4ccce8676b016de8c1393c2f0d0f74eb9337.1755102550.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755102550.git.steve@sakoman.com>
References: <cover.1755102550.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221832

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was found in LibTIFF up to 4.7.0. It has
been declared as critical. This vulnerability affects the
function get_histogram of the file tools/tiffmedian.c. The
manipulation leads to use after free. The attack needs to
be approached locally. The exploit has been disclosed to
the public and may be used. The patch is identified as
fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended
to apply a patch to fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8176

Upstream patches:
https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa
https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda
https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2025-8176-0001.patch     | 61 +++++++++++++++++++
 .../libtiff/tiff/CVE-2025-8176-0002.patch     | 31 ++++++++++
 .../libtiff/tiff/CVE-2025-8176-0003.patch     | 28 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  3 +
 4 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch
new file mode 100644
index 0000000000..83dc695528
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch
@@ -0,0 +1,61 @@
+From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 19 May 2025 10:53:30 -0700
+Subject: [PATCH] Don't skip the first line of the input image.  Addresses
+ issue #703
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffdither.c | 4 ++--
+ tools/tiffmedian.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffdither.c b/tools/tiffdither.c
+index 062fd60..d352554 100644
+--- a/tools/tiffdither.c
++++ b/tools/tiffdither.c
+@@ -95,7 +95,7 @@ fsdither(TIFF* in, TIFF* out)
+	nextptr = nextline;
+	for (j = 0; j < imagewidth; ++j)
+		*nextptr++ = *inptr++;
+-	for (i = 1; i < imagelength; ++i) {
++	for (i = 0; i < imagelength; ++i) {
+		tmpptr = thisline;
+		thisline = nextline;
+		nextline = tmpptr;
+@@ -138,7 +138,7 @@ fsdither(TIFF* in, TIFF* out)
+					nextptr[0] += v / 16;
+			}
+		}
+-		if (TIFFWriteScanline(out, outline, i-1, 0) < 0)
++		if (TIFFWriteScanline(out, outline, i, 0) < 0)
+			goto skip_on_error;
+	}
+	goto exit_label;
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 93a1741..93e57cf 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -844,7 +844,7 @@ quant_fsdither(TIFF* in, TIFF* out)
+	outline = (unsigned char *) _TIFFmalloc(TIFFScanlineSize(out));
+
+	GetInputLine(in, 0, goto bad);		/* get first line */
+-	for (i = 1; i <= imagelength; ++i) {
++	for (i = 0; i <= imagelength; ++i) {
+		SWAP(short *, thisline, nextline);
+		lastline = (i >= imax);
+		if (i <= imax)
+@@ -915,7 +915,7 @@ quant_fsdither(TIFF* in, TIFF* out)
+				nextptr += 3;
+			}
+		}
+-		if (TIFFWriteScanline(out, outline, i-1, 0) < 0)
++		if (TIFFWriteScanline(out, outline, i, 0) < 0)
+			break;
+	}
+ bad:
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch
new file mode 100644
index 0000000000..c28969e1d8
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch
@@ -0,0 +1,31 @@
+From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:25:16 -0700
+Subject: [PATCH] Fix tiffmedian bug #707
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffmedian.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 93e57cf..a0b4b5d 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -385,7 +385,10 @@ get_histogram(TIFF* in, Colorbox* box)
+	}
+	for (i = 0; i < imagelength; i++) {
+		if (TIFFReadScanline(in, inputline, i, 0) <= 0)
+-			break;
++                {
++                    fprintf(stderr, "Error reading scanline\n");
++                    exit(EXIT_FAILURE);
++                }
+		inptr = inputline;
+		for (j = imagewidth; j-- > 0;) {
+			red = (*inptr++) & 0xff >> COLOR_SHIFT;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch
new file mode 100644
index 0000000000..b5ee36c5b8
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch
@@ -0,0 +1,28 @@
+From ecc4ddbf1f0fed7957d1e20361e37f01907898e0 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:38:09 -0700
+Subject: [PATCH] conflict resolution
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffmedian.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index a0b4b5d..ca1c51f 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -847,7 +847,7 @@ quant_fsdither(TIFF* in, TIFF* out)
+	outline = (unsigned char *) _TIFFmalloc(TIFFScanlineSize(out));
+
+	GetInputLine(in, 0, goto bad);		/* get first line */
+-	for (i = 0; i <= imagelength; ++i) {
++	for (i = 0; i < imagelength; ++i) {
+		SWAP(short *, thisline, nextline);
+		lastline = (i >= imax);
+		if (i <= imax)
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 5ec7b20e61..6ff31bd0bb 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -55,6 +55,9 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-6277-4.patch \
            file://CVE-2024-7006.patch \
            file://CVE-2023-3164.patch \
+           file://CVE-2025-8176-0001.patch \
+           file://CVE-2025-8176-0002.patch \
+           file://CVE-2025-8176-0003.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.43.0


