Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E46CDB480
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20830.1782220468810352355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OqlmW9+g;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49249072f03so17653325e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220467; x=1782825267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7HTIT7KL14pv8dycKDzjC1yP/3zN1SOR+YQyVfkw4s=;
        b=OqlmW9+g0lfwoNMmdvOCdyiTxJpuZUk8ZQk7OskuGEpKbaSTCE3AaPEi7ijBNNlumX
         svlAdWPD6LcBKk7RPxEfG9vssxLFJggB3IsfGtuNiZblqrdJk4IPWfFR3YkygtlgnYf/
         XYAkqcoRAVAWYWoqS5C1x1BMiPG09VdbtRn9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220467; x=1782825267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7HTIT7KL14pv8dycKDzjC1yP/3zN1SOR+YQyVfkw4s=;
        b=aovi9PdAPEdQlrSCS160cBP3SUVoBhrQNwLHHxg1xqYQq3TvzAsfa5sLAG0PuR8dPh
         +oXAuN0eCnYcu8Xc0OnH/SU4Ky1DJu2HGcc+e5FBPDsrkBrw5b1jZCQW0TwKufPBoiZe
         RPhAI4ST6CdbvKCFEeV4ZRb6mZxHGZxTIywzGZEESTn+gcfKV187h0KxFO4mTG9pBaeF
         w2ytG3eClE7McPyflimcpJiOPYl5jWd7KiNpv+XxdUZR0o+Ri8anU4iuR8j/hRlW03kv
         Syr38214fMyXTZOL79ravTjY3XxMtZtTUiYoEO2aItGRyGcvnpvsT4uMU4n98KNvygZu
         c2lg==
X-Gm-Message-State: AOJu0YzBw+Gjr4SGrvLUegB4n9zJw3W7d7S1FFVPge3whKyFk8SnfIk2
	pK3bzgbWu5XWPITpyKr6RuQoy5vxn95yZLS7aJbOelDCRqnTK7CoQXDO9qeQ5bKqecw/lWHgBEk
	uyw7t
X-Gm-Gg: AfdE7cm80CKL5MtHrIePW8zHDUaHMcsiTxPFsRPr0pxoFNZjEPzV3nME10DAOekl0rU
	hYcdMuOpu/P5thav0PcdtEQ5KQNmQWpXflYkCCmq88DGp0taFrlWtxL1dTeHnsyUC0yNHXBQVgQ
	gO1htyIgxupIqiFxO/ZxElyviUtCBNE101qw11T/o6P2xiYUzy272NqHIvSV0z4+slUGBEi7fy1
	d/Iq/F7oufL3jQAyQ1knha2znpHUF+wseV2hnyf5CEJ0wI0UDEiWRaohQN092zanU1D73ZIayan
	aD4KcfbV/MOUJYwppwQekhmFgdNG7cleXLpcDLFVklIbeo/czRnhW141CLU3iDcR9AbKa71A5QE
	rK1D72aSnkSxOOxaCH3UzIuTNpbFQJtY3fa/Bf1iwPKafIWhX0EczfeqCFk4tLsn4XHMj8Zog1J
	o9A1vT01lU0TSC33TgqiBPD6mF4m5CIeS3+JAm+tozBC0YoEWNO2G+u4/jqV7vh0lM6i2IONbDu
	KjpSNY5tRBAuX0IQQ==
X-Received: by 2002:a05:600c:4747:b0:492:1e36:85dc with SMTP id 5b1f17b1804b1-4925b3bea23mr45353905e9.36.1782220467032;
        Tue, 23 Jun 2026 06:14:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/26] tiff: fix CVE-2026-4775
Date: Tue, 23 Jun 2026 15:13:44 +0200
Message-ID: <5a9bd4598fb446330c991fb51eaed372d96f39ff.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239369

From: Naman Jain <nmjain23@gmail.com>

Fix CVE-2026-4775

Reference: https://gitlab.com/libtiff/libtiff/-/commit/782a11d6b5b61c6dc21e714950a4af5bf89f023c

Signed-off-by: Naman Jain <namanj1@kpit.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libtiff/tiff/CVE-2026-4775.patch          | 59 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
new file mode 100644
index 00000000000..ed5f0714a61
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
@@ -0,0 +1,59 @@
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
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 4543dddae..fa82d0910 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -2224,7 +2224,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
+     uint32_t *cp1 = cp + w + toskew;
+     uint32_t *cp2 = cp1 + w + toskew;
+     uint32_t *cp3 = cp2 + w + toskew;
+-    int32_t incr = 3 * w + 4 * toskew;
++    const tmsize_t incr = 3 * (tmsize_t)w + 4 * (tmsize_t)toskew;
+ 
+     (void)y;
+     /* adjust fromskew */
+@@ -2364,7 +2364,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr42tile)
+ {
+     uint32_t *cp1 = cp + w + toskew;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+ 
+     (void)y;
+     fromskew = (fromskew / 4) * (4 * 2 + 2);
+@@ -2522,7 +2522,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr41tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr22tile)
+ {
+     uint32_t *cp2;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+     (void)y;
+     fromskew = (fromskew / 2) * (2 * 2 + 2);
+     cp2 = cp + w + toskew;
+@@ -2625,7 +2625,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr21tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr12tile)
+ {
+     uint32_t *cp2;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+     (void)y;
+     fromskew = (fromskew / 1) * (1 * 2 + 2);
+     cp2 = cp + w + toskew;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 07540692fcf..fca846589fd 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-52356.patch \
            file://CVE-2024-7006.patch \
            file://CVE-2025-9900.patch \
+           file://CVE-2026-4775.patch \
            "
 
 SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"

