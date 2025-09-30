Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED3CCCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:50:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.226.1759261823137070678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VSqZ9ZeE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7835321bc98so3548672b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759261822; x=1759866622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRLIFoXL5Iy3oUqTmphQEmsAsxNLiBaA+YsliYNLSA4=;
        b=VSqZ9ZeEhn1y+qO8iRUu29M5E8WXOmZuwEyRL776SVrf/+YDy5RblxCrhoY1IT3qxA
         jZcFcLsQZvYB3VyULCVCTVkOZSnUP6xicpNa1FmHW2oyGg8miYpUbgYcR4Ozcdzs5+mX
         XrwZbkoxVhz/zuR5KQ3vIWqHTwCcoVw4Z8N6G6lEteYcxuKxFElgpuqFBSVRaAh+fTuK
         YG6WjR69e8m1hvWqnycMHya95Z8r/8QZzKoxdN31NtBSEMreGy41/Plh7NHgbYIJd/+S
         HdMbRARu395r/2F5gs344zb3sEOFbT5F8vydbYwfAWl9yxiFcwPjy8Jcnyog+YHJ8ZZv
         P6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759261822; x=1759866622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRLIFoXL5Iy3oUqTmphQEmsAsxNLiBaA+YsliYNLSA4=;
        b=mWJSBi/Tf4HLFxiXdRrBgbwVk81P2G07N2o5hAG+q2//RwRf9iF3p2o2YE7+GYQJvA
         hZFxPpMIbqD56xQ72CbNuUrbS2TkfcbjIv0sA19mROI8Z3PCpGIB4mWyfN5XCecci3/w
         Kk/0jJmlj85H7IYpGOhcbrnbSP6URyJmr9gxuC7B3Z9CJrU3aiz3BgDHWKsVy7xy7QP4
         Ib9LkCziHqJHzzBaGNYoT/Z5LZuEPEL9OJgkqj09718ox8GvTJvNOvaBarsD1Q4MHf2F
         YWesMMeb0pyEHRoOTqFykJm6yMyTfcqQCc7aJGmi2x6q2F8tTooI2ojxQ/cr+iF+PPMV
         07CQ==
X-Gm-Message-State: AOJu0YxQ5nam7loM42oCmq3DCsqJV6OZgDPwvaeF3n+6irK35wymtaVQ
	TUjy/Lt+BwxABM+knioc7MWydtibBougGk59TgHyRfZ9408Mn5jNdcsruF9ePm+C3yjQix8PMcD
	hOUkH
X-Gm-Gg: ASbGncuKTxUZAARvNMMmItv/vwDBr/u7vkPVnq0bP/j60Okghv1fniWK5IYSW3S8yjt
	qcPq+m5pMJ4mNOnMBaPbS7TPZcUpTzkWXAgN9GfgKL6bpr3w491T6x63P11bsZDCgU6qAe4cNEM
	JcbaknUMnOXeA+ZihpViL4V0WtmjMY2FeMTdvMt9JC/oCDEOBH+50GnnMeGgKJ1GWKGTM1M4/cj
	FJgH/b7tJbDQG1YMTqM4NYA+Ror/6XNgjSmmUyfBBd5088RvyrLKj7/ZPBKJ5paS8USYrWJsMrr
	2Acej19YaB5srLxcs/ghIXwJJsAwh+NgmbrB6c4RoemZMhZLQgS+WSsYoGlDHYqqGnoBmAoOVjD
	ZeBWxiOp//tX8lxSsrT8wGmjAdYQSuxMRlVglLg==
X-Google-Smtp-Source: AGHT+IHn3umFEkND6RRP8ppu14HcnxWOSqAsfLZLlp3B8CW8xMt0NmAbLvnJuNoG//x8Lwd9/hqaNA==
X-Received: by 2002:a05:6a00:92a7:b0:781:15b0:bea9 with SMTP id d2e1a72fcca58-78af417bba8mr651476b3a.22.1759261822326;
        Tue, 30 Sep 2025 12:50:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm14411202b3a.8.2025.09.30.12.50.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:50:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] tiff: fix CVE-2025-9900
Date: Tue, 30 Sep 2025 12:50:06 -0700
Message-ID: <f4e5cdeccee02d3ea78db91d5dfdcfd017c40ee0.1759260542.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759260542.git.steve@sakoman.com>
References: <cover.1759260542.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 19:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224197

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in Libtiff. This vulnerability is a "write-what-where"
condition, triggered when the library processes a specially crafted TIFF
image file.[EOL][EOL]By providing an abnormally large image height value
in the file's metadata, an attacker can trick the library into writing
attacker-controlled color data to an arbitrary memory location. This
memory corruption can be exploited to cause a denial of service (application
crash) or to achieve arbitrary code execution with the permissions of the user.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9900

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/3e0dcf0ec651638b2bd849b2e6f3124b36890d99

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2025-9900.patch          | 57 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
new file mode 100644
index 0000000000..9199cc6090
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
@@ -0,0 +1,57 @@
+From 3e0dcf0ec651638b2bd849b2e6f3124b36890d99 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Wed, 11 Jun 2025 19:45:19 +0000
+Subject: [PATCH] tif_getimage.c: Fix buffer underflow crash for less raster
+ rows at TIFFReadRGBAImageOriented()
+
+CVE: CVE-2025-9900
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/3e0dcf0ec651638b2bd849b2e6f3124b36890d99]
+
+Changes-
+- Use old API TIFFWarningExt instead of TIFFWarningExtR.
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libtiff/tif_getimage.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a9cd48f..4c807ad 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -509,6 +509,22 @@ TIFFRGBAImageGet(TIFFRGBAImage* img, uint32_t* raster, uint32_t w, uint32_t h)
+		"No \"put\" routine setupl; probably can not handle image format");
+		return (0);
+     }
++    /* Verify raster width and height against image width and height. */
++    if (h > img->height)
++    {
++        /* Adapt parameters to read only available lines and put image at
++         * the bottom of the raster. */
++        raster += (size_t)(h - img->height) * w;
++        h = img->height;
++    }
++    if (w > img->width)
++    {
++        TIFFWarningExt(img->tif, TIFFFileName(img->tif),
++                        "Raster width of %d shall not be larger than image "
++                        "width of %d -> raster width adapted for reading",
++                        w, img->width);
++        w = img->width;
++    }
+     return (*img->get)(img, raster, w, h);
+ }
+
+@@ -527,9 +543,7 @@ TIFFReadRGBAImageOriented(TIFF* tif,
+
+	if (TIFFRGBAImageOK(tif, emsg) && TIFFRGBAImageBegin(&img, tif, stop, emsg)) {
+		img.req_orientation = (uint16_t)orientation;
+-		/* XXX verify rwidth and rheight against width and height */
+-		ok = TIFFRGBAImageGet(&img, raster+(rheight-img.height)*rwidth,
+-			rwidth, img.height);
++        ok = TIFFRGBAImageGet(&img, raster, rwidth, rheight);
+		TIFFRGBAImageEnd(&img);
+	} else {
+		TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "%s", emsg);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 6db4d80cdf..0b4bef4c41 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -62,6 +62,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2024-13978.patch \
            file://CVE-2025-8534.patch \
            file://CVE-2025-8851.patch \
+           file://CVE-2025-9900.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.43.0


