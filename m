Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B0CCD5BAE
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7379.1779265267659396509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zSyRzb9z;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso4253224f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265266; x=1779870066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bhh3wYuHy0dml8Kp9xevSY22vaxc7QO8G5S5+Co4g2Q=;
        b=zSyRzb9zKI2oqJq2NVLpzVn+TL9gNMyqlFdIAg3pFMDkyauYi9wDxKNX3ov/c42jIR
         Ng68uii38nPZVQ7NZUvCmIWWpFAwbrZ0y2nBdMDXljwXv10XZSp8erbsccGlI1RrWxvZ
         3QWXvSz8rgEw8dsUY8LN0Pd7m2InnMgKmlKVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265266; x=1779870066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bhh3wYuHy0dml8Kp9xevSY22vaxc7QO8G5S5+Co4g2Q=;
        b=ac57PXSbhKqjyfGWZzLS4RlgCN/T5c9tAndhCEddAZiIjKRWK/1V96Vw7JKDfXrhdk
         iVQwlxVtKSwqw9K/0G1O/fQjAB2Zf8bnkWUUUj0KLumKvVfmr+O3yM3G0EnVsYth1gw/
         bG9BhnldO2GqeBiZrUY82DdtfO0YVxgCBiqjutHuOFrDyqRfGL3YA33NEVdA01ySKrWq
         q+YnCCiTRblKPgZXbc9EVcy0eq642+0sXtUtXgcFR6Bvx235M5p8XKyxeg3CyDJ7pEYl
         XBrUpAH+20E4IzIHfdiAXIa8ZbHqlVtnzkCU4mZ2ZwgGNLUdX30A7IMdV0oimI7x7Bib
         TLcw==
X-Gm-Message-State: AOJu0Yz7uwQ3mMyGBEdaIwejDCjOPDpppmUP8UNhoRQjn44JM+M6DfCM
	T0cxoLjG4HcsQ3t1Jc37k/leV40suA0Ku+pQeJGGk8Wsvfq/I7y5TS9oTxBKFlr7Kq7DI9DrdwX
	CLG54
X-Gm-Gg: Acq92OHTXS+9Pzq2rYJIcUaRkH6KPwJTi5SojLZm0yZSRvbkRlEAV0LqUBM0xdgXfPc
	EOAj6byjF8Z2hQ61aQXLa34s567svjo6+VMJ3t3YXDsuPparejqnT3cn1c6c99I9evLvCApVJRh
	Vq3k/iTgwpT9GCWyjPd2o7U0NBApUfsS3cSpcYANjXPq8QI2eCaHMwEuG3ML1BVGTutSraTNDce
	7LeDlCWALEyR9GaPF3ljzuFfR68KOLYa/dS1U0epflm91L8jMNiwTq1QmUyIdOexHN2h1OsDgyT
	XTl8C1IUQom5r95pdr9MbP/ybwWLtyv8222Hzc1auHfscxSBK0ZV+8hH0cV7vjpmOVL/ff+6dbr
	OwptbTe5yn2c/ZHnj/KQ3zb3wy6udJd4JYhsxTEZALU/1aCf43XCZXhB9WvZN3GvHlgLrPXGuMO
	GhnendWrKGdv4Dey6DJiErSXz26Q3QJM2TwA82no/b20RHFc3QjGX1x52z4Eg29J+zrTm5F+pPt
	gHMlha902KQXCvqvOheuSprOrSuFFs3gT9GbhI=
X-Received: by 2002:a05:6000:25c4:b0:449:e8c0:fd58 with SMTP id ffacd0b85a97d-45e5c58d95dmr36900272f8f.27.1779265265784;
        Wed, 20 May 2026 01:21:05 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 12/28] tiff: patch CVE-2026-4775
Date: Wed, 20 May 2026 10:20:13 +0200
Message-ID: <5a0d5350f62c1267995f736d9a90b9951a3718da.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237411

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-4775

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 091df084505273f5b93595b84eb30e52f4208ff3)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libtiff/tiff/CVE-2026-4775.patch          | 55 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.1.bb |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
new file mode 100644
index 00000000000..1f3c026b281
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
@@ -0,0 +1,55 @@
+From 782a11d6b5b61c6dc21e714950a4af5bf89f023c Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 22 Feb 2026 23:32:47 +0100
+Subject: [PATCH] TIFFReadRGBAImage(): prevent integer overflow and later heap
+ overflow on images with huge width in YCbCr tile decoding functions
+
+Fixes https://gitlab.com/libtiff/libtiff/-/issues/787
+
+CVE: CVE-2026-4775
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/782a11d6b5b61c6dc21e714950a4af5bf89f023c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 4543ddda..fa82d091 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -2216,7 +2216,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
+     uint32_t *cp1 = cp + w + toskew;
+     uint32_t *cp2 = cp1 + w + toskew;
+     uint32_t *cp3 = cp2 + w + toskew;
+-    int32_t incr = 3 * w + 4 * toskew;
++    const tmsize_t incr = 3 * (tmsize_t)w + 4 * (tmsize_t)toskew;
+ 
+     (void)y;
+     /* adjust fromskew */
+@@ -2356,7 +2356,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr42tile)
+ {
+     uint32_t *cp1 = cp + w + toskew;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+ 
+     (void)y;
+     fromskew = (fromskew / 4) * (4 * 2 + 2);
+@@ -2512,7 +2512,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr41tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr22tile)
+ {
+     uint32_t *cp2;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+     (void)y;
+     fromskew = (fromskew / 2) * (2 * 2 + 2);
+     cp2 = cp + w + toskew;
+@@ -2615,7 +2615,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr21tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr12tile)
+ {
+     uint32_t *cp2;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+     (void)y;
+     fromskew = (fromskew / 1) * (1 * 2 + 2);
+     cp2 = cp + w + toskew;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
index 0d4b3a4abd3..750565e11c1 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+        file://CVE-2026-4775.patch \
 	   "
 
 SRC_URI[sha256sum] = "f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c5bf7a9a3fabe9b69"

