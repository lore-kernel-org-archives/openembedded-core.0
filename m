Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1113CC43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 18:03:58 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.118263.1783188231748810299
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2026 11:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bvkx+z0j;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381507c9380so837731a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 11:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1783188231; x=1783793031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7CVH4dUPT7F2r27FAu4lk/ptAOlQ9XLSK0mVLdGHZE=;
        b=bvkx+z0jh9abUL5ApSKFmbqT5bAtM5JFKLo1Zq6cs2UBt8nyVBVd5O4fksiRsC58uS
         ItrX3vobNaP5InqKhOWsno/7XjzHqKPqqsR2sxmUtp2K1GXpvKTjqJr/n/B2J2dIcSU2
         5Ad823vrfa6ED/c55vpKuwRn9dRXQ0IEVYfDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783188231; x=1783793031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7CVH4dUPT7F2r27FAu4lk/ptAOlQ9XLSK0mVLdGHZE=;
        b=Zg0L8+ScJDanu+AMDgvZPXCLSiBpwaHOkuqSFJUuOcJSuvJMwdPmh8aRYZ9ocZf4uD
         7ATWdxleSOirn7Vn6OEPLcZcqKLO16oLaEbb9mfATrmKIA2ku3ec0S2vL49Ewb7QSmJx
         46qPuy29aIfRcZhJI3b6meFSKRQRqMIbHGnpIN9SMkdXhcE7tOR0QAvfX9HK4s/tkWSM
         A52+IBI4mhJjUnD1AtZ+qS954grGqHIyLtMZ3oFxTkxjiI+zYdEXEXBClL52JuFAZRqU
         7paEY31qZIoBw0RuAlKNYKVpQg9QLr7iGLlemT08ACzMG7+Cu3u6WxUSlUopBLVJ0wth
         EWhw==
X-Gm-Message-State: AOJu0YwsarvOpSumSggdE+sW4bmi3s74krFINGw8FnJuYv83InQKaKJH
	4N5d/FypEZcmjdRCjjKC9Z9APlepq0kFstt1qZZ+g8irv3RT/EttJPS05fCiuAD8/rB9+cBFpol
	qXEHrQlg=
X-Gm-Gg: AfdE7cn87B9v3YWj4FMM+DDuoiUdfyV/OunkagL29d0+JJ3BkwaGlEEldTKXz9V8gNn
	BAlR+uRddU/kSglvPpYKofqmholmOwb/t5qb1KwjPss1AgzwRRcWL1Z3MkuYk/ya8kskV8cql49
	gr22+7JY9r6GLzmSIJZKXdih0oWUd4hC06QPnO2L9dQH82HjNqeRcD7vwvJcOPdKBJTq9A3IMFh
	HLWjEQgBjfRkKTtnjCpr0057Y5GoEmgOMYXiRqWRbQGTzawrmSWjWp5jRALvLcl5mjLePP/t/pS
	HhQumBSbNH9rBWO0iDI7L9W6eQvPOdC0uHDmT3llTGOYMw5IKqEorK1grxehFlwfPYNhrjKdVvb
	kO5Mrl7jCrAsyNWffdcz+4OHyPf0R93cNRWUeMB8GpFVXdfRdcbQ1PX9kEsKlxSY9/IOCHwB7Xv
	V3UZK0d4irYV8ygA7qn8NW
X-Received: by 2002:a17:90b:4ec5:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38280a9fefemr4013639a91.11.1783188231037;
        Sat, 04 Jul 2026 11:03:51 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb7fe46sm39749609eec.14.2026.07.04.11.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:03:50 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] tiff: upgrade 4.7.1 -> 4.7.2
Date: Sat,  4 Jul 2026 23:31:37 +0530
Message-Id: <20260704180137.17826-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 18:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240133

From: Siddharth Doshi <sdoshi@mvista.com>

Note:
Removed CVE-2026-4775 as it is already fixed in 4.7.2

Detailed Information:
https://libtiff.gitlab.io/libtiff/releases/v4.7.2.html

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libtiff/tiff/CVE-2026-4775.patch          | 55 -------------------
 .../libtiff/{tiff_4.7.1.bb => tiff_4.7.2.bb}  |  3 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.7.1.bb => tiff_4.7.2.bb} (95%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
deleted file mode 100644
index 1f3c026b28..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 782a11d6b5b61c6dc21e714950a4af5bf89f023c Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sun, 22 Feb 2026 23:32:47 +0100
-Subject: [PATCH] TIFFReadRGBAImage(): prevent integer overflow and later heap
- overflow on images with huge width in YCbCr tile decoding functions
-
-Fixes https://gitlab.com/libtiff/libtiff/-/issues/787
-
-CVE: CVE-2026-4775
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/782a11d6b5b61c6dc21e714950a4af5bf89f023c]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- libtiff/tif_getimage.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
-index 4543ddda..fa82d091 100644
---- a/libtiff/tif_getimage.c
-+++ b/libtiff/tif_getimage.c
-@@ -2216,7 +2216,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
-     uint32_t *cp1 = cp + w + toskew;
-     uint32_t *cp2 = cp1 + w + toskew;
-     uint32_t *cp3 = cp2 + w + toskew;
--    int32_t incr = 3 * w + 4 * toskew;
-+    const tmsize_t incr = 3 * (tmsize_t)w + 4 * (tmsize_t)toskew;
- 
-     (void)y;
-     /* adjust fromskew */
-@@ -2356,7 +2356,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
- DECLAREContigPutFunc(putcontig8bitYCbCr42tile)
- {
-     uint32_t *cp1 = cp + w + toskew;
--    int32_t incr = 2 * toskew + w;
-+    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
- 
-     (void)y;
-     fromskew = (fromskew / 4) * (4 * 2 + 2);
-@@ -2512,7 +2512,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr41tile)
- DECLAREContigPutFunc(putcontig8bitYCbCr22tile)
- {
-     uint32_t *cp2;
--    int32_t incr = 2 * toskew + w;
-+    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
-     (void)y;
-     fromskew = (fromskew / 2) * (2 * 2 + 2);
-     cp2 = cp + w + toskew;
-@@ -2615,7 +2615,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr21tile)
- DECLAREContigPutFunc(putcontig8bitYCbCr12tile)
- {
-     uint32_t *cp2;
--    int32_t incr = 2 * toskew + w;
-+    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
-     (void)y;
-     fromskew = (fromskew / 1) * (1 * 2 + 2);
-     cp2 = cp + w + toskew;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
similarity index 95%
rename from meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
index 750565e11c..3462803cb2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-        file://CVE-2026-4775.patch \
 	   "
 
-SRC_URI[sha256sum] = "f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c5bf7a9a3fabe9b69"
+SRC_URI[sha256sum] = "672bd7d10aee4606171afb864f3570b83340f6a33e2c186dc0512f7145ffdf6a"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


