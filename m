Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2384ACD5BAD
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1006.1779233434569047929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LZdQbIsb;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso25203015e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233433; x=1779838233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bhh3wYuHy0dml8Kp9xevSY22vaxc7QO8G5S5+Co4g2Q=;
        b=LZdQbIsbendh9INpALRo0IEMMArF/cb0YsZW2DJtsbmkRVGR622AccsygEo/qi/qco
         KSITWGWkzY1AypLDk1Ec81tYBaIvUpZ9vGu+1f3j4P2JPsp5TjveXU+Ror00V8Px0nm7
         Gfjuk9EjW8YcdTz7K7jDJ+oC1dyaY+UZ+e/PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233433; x=1779838233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bhh3wYuHy0dml8Kp9xevSY22vaxc7QO8G5S5+Co4g2Q=;
        b=NXGpvnttqeeiMXPrDO8eXODwhab5wSWukI9+Jj3H1iLPvmi5HWx4H2WSCYX4zh1p7I
         rrW12tcHUgkHCLdT0S7QCDMhGEof7IoJeqCX2P4gqXvv8XNth4OgBnv+DTyq6REjYHj+
         BVtqlIOwFW483PuTNTpSF302roWO0fcYgAZ6TgrDlevCaJ8v8fqdfTGoTHoFxWrW204e
         HLdHdFl7U0tIim26oXBpzfGkA2LTkqj/4fe/yrX91SB9fljynE5W3TOuwgcqCSlzvI5D
         Mk7T2K0iC4l4L5Gkc/cv9w2qq+0cq87ix39bjq7I00cIJuaPaqjRKfCJfP9arWVx0GR9
         NqwQ==
X-Gm-Message-State: AOJu0YzYIOXIh228QuarEgqnq5mcQ+MKA0q/EWknN0tdUS0jiOY9wy9o
	dLBLBSfaQoyR+BZYDDV3SVEcbMfwBT/FZi9gVmXlnPVA5sRCN5rXIJp+saf254gayyRzkelcg3V
	yi++2
X-Gm-Gg: Acq92OFSUy8tBLXfyQ8kVRX/BbJciG0/g6uDOhcBXmmlc4bWkfZrBfq1fp29OlhdXlj
	uF5EWS+9hqiuF3FPzE4tY6H+c45Th9M4gOQ43YfFRtUbj7BslakRW72wAljz8TrJjVf0N42/LGZ
	p9Q8/+tseLqYJQlEtn2qVKxdR1oI0lwPkWb+zghvGLSlkxq2+LO7e/92/jpZwj1T7OG+sDIQMyE
	dZRE52Z7AhCFsyL0emEDA2emlnoT5ptaupqlp0EG13OmsTFysnIq4lQBxf9LvpBH2bbXzXZhmyQ
	qPDZ9dP1Gn8fpTFDSoyQ1FcUEJ+HlOjy1Aox3zzp7OcFy1Fl752JhS5KlJ1maaus6ySODPZrcBh
	yB2DtzcXNPcqEbkWn6LDHNp9E8n0em7yAodHiXvrsIB0jXG6xpjwKr6Gisiu5weGhiO5kYpqYH/
	mVUJXCuqXaajDXzQRSxrkT/O8yK+RWM7qGygaPXpn41O8pyq4H2f8tcLFkEyv6i+MWSl+Bc7rO6
	lZ1SuVOfYKFF93DG9ln6JtJ33I=
X-Received: by 2002:a05:600c:2d09:b0:48f:e1ac:c96d with SMTP id 5b1f17b1804b1-48fe61f2bcemr189734665e9.20.1779233432762;
        Tue, 19 May 2026 16:30:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/28] tiff: patch CVE-2026-4775
Date: Wed, 20 May 2026 01:29:49 +0200
Message-ID: <1a9df49cbc022e3531c60927d41456b73eb9f26a.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237359

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

