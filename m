Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08377CDE002
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33399.1782253620310305610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mg9Hl43w;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b7866869so3291305e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253618; x=1782858418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7HTIT7KL14pv8dycKDzjC1yP/3zN1SOR+YQyVfkw4s=;
        b=mg9Hl43wF4Q6CDYP5kHFUPYke3J07j0zWwRBiPV8L7i70r9VgToeg8zR4pSuUjLj9o
         VN7ptLpPXFzx7K5KWCmnjNsHf5wPNlXe4ubhXvyoTuH0MRuitiBogd6D1zlZBsv0bqgE
         slHwzB07vyjEhSp3BWfXw8HlnHZHIHRUDhD/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253618; x=1782858418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7HTIT7KL14pv8dycKDzjC1yP/3zN1SOR+YQyVfkw4s=;
        b=WMqFlbIBSodcLG0E9lVwZsshc9pCpQag5bQZ3c6YNj3nJB5/p5vY5ZrUTP49HvAb91
         yx8Sl+8w3FIhqPs7BE2zCTYckG1LxjvxkQT2Yc+omL0PApvwwZadJBnzQbwap8gK+Vxh
         FC9KTq+OSNmGX0vI1iSvu3ccwxLnHBUJyEQ4pelsj9y7UeCYIQr7AqURNPKCx9rau9Jc
         Uax1cEYuXn5SM4UAQ2Dfbr9T2U6fc790uXMvFYj6X/WIqyRlWN0rUchoz6XkEh0S088p
         VGuvQmPA9oNWMik15S9h02BTwlQNaenJQoQ6PEsVhIF1+zm0PNlUTsrmxcnq7aXROUCe
         Zm1Q==
X-Gm-Message-State: AOJu0YwTOuQ+Fw7C061opLPpIBKIdflfTds5Fb/ft6GyhivBmCPLRZdO
	x33bSmXtCY7qdH4E4shfdHOD/xGhnPZAc92VKW4jIbuqVHVm4i1HI1J7M+kgKFxaYGxGvUE7VE+
	lExry
X-Gm-Gg: AfdE7clQusVzHMC7JCgHi8MMziBp/bGQf658/+C81v19/uY7OvPIZsUYPbwYYznjm5u
	r6a+T/Pp8zZva9nWpssZ3Px4T4RHfOSmtsufCktTcrSYTrSbDHicd2f7JwvMoTN+Ezp0GiabChf
	A1yfzMwpcWUkr47AinYZP6MhgRqywsN/YkRI1g58ux2zy5+LnnPlIO8+D0OiQSPvDuyxxrngo7y
	UXaqhLdBJMu1ZEdRCuqe71SJqEHvvUFpoQ+gB3b3H0UCegMUfhSCLJkJcCK9v+o8n+Wijd43Siu
	Eqy8/y95saQ6xSBG2/M12c6CxvXkukLY5WpitUVirAVT705xRXW+vEP3ZvJhHYFaUUtsiqI6u1k
	1qNEuEHJLpbFe19g/dcZn+OpyJtIaog74R12Q40r30lfhamDvrE9l7kG15xqeKDZeb9b6/bfDAJ
	/bzygObn4HgFT8loYRCoZkHUOThZUb/9A5XlSHZGIOToL0lLRJEephgO0DHYSfls4w4NdglPbKx
	fBvRiKi9mdjK/vt
X-Received: by 2002:a05:600c:c165:b0:490:b58b:a8ca with SMTP id 5b1f17b1804b1-4925b3864a2mr66216975e9.27.1782253618433;
        Tue, 23 Jun 2026 15:26:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.26.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:26:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 03/41] tiff: fix CVE-2026-4775
Date: Wed, 24 Jun 2026 00:26:02 +0200
Message-ID: <5a9bd4598fb446330c991fb51eaed372d96f39ff.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239425

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

