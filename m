Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAA2CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:09:51 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9660.1764688186913764279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dBh0/zko;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so5477401b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688186; x=1765292986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6qgE/dHvzs4tydVJtnkS2wYX8LmKQbGgh945PA4vXs=;
        b=dBh0/zko+p4r3hdzCYpu7kh1Ku18hQ7Dyk5L8n3pYyGTIQUZSfOLYG+zsSgRK+3IFo
         dIEXd2Rku7AST7GuuCYmcXdqeXXw2QaxMBKkq6cx5ue9lUoBATx543PCsxk8QFdJpPWy
         tEIhsneRKC9h+u68CPqJTFqTxE5p/RRnFaSOiz9e6oLeZ7IBiHl2LxzbkwArEPhfx6ya
         ofgcS2YsUeEmFs812Mduq8uF3/uUWWSXEFDGayXGebsRh2b/XWTu9vHYIVPYpPEhwDRR
         mZYmZtM7byKgm4DIFV7fGiGcjQZ60floTb9jc7Ype9mcMrG/C8sVPnJX/495ASQMcUu+
         21Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688186; x=1765292986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m6qgE/dHvzs4tydVJtnkS2wYX8LmKQbGgh945PA4vXs=;
        b=eNBnhguXRkEr2ljQlS9TL/NeMz9e1PvJo/dE4tAer1MwnlXOI62fQz3rU22NIld1ij
         ZKUBWNGfqfGGsAw9CgtP4vjk8kYlk9U+suuLETr7Kn9LlbDSR5Aa1hgn7xRzakv6oClw
         NgmbdJ1XfjJMZ0a4uUp+6PYDmqq5Cani2YJINtcqF5e08vF0cK1Jex+oyiY7luH4NMk/
         J1OviNb+3DwbaLc/i7wf64X1aEDrOMjv2rBJWw9U6Vv33aaA3cX7S8fUbtF3NVbcfCjL
         XLU6mPlX6FXFl5ZiPfMWPPGtZ8j9VeHJjkRUFBKgXflyhAlQOW+0OBW3+hWtzPDc0qza
         fpvw==
X-Gm-Message-State: AOJu0YyRTFL8btyD/35kcY8w8PXb6z6u63usa0wKr7wqoLAAQSenbtLb
	dXYYEEIcMvT8lb4Kg/ebg0OnhSAF4w/W9PmX9j2pH642jJijlxM7zeKKL1GKyi2bjddLAQvLTea
	jMaVg
X-Gm-Gg: ASbGncul52w4Syt8tEcZHp3uZ7/Mi3xpNz1lBgBTKQle2YWzp3xeA21vgh9ZnKHtJLp
	qSQF+cF717yzaiHABItXRGU4+Uxs7CHv1iepkEER3la6pzwbHqUoml6+IaicXPNwVYZSTwWjpC6
	XD4xD8AHPIPQ5SSvhf0zAMQquQbEuaI8azElY43HbovlYN4Fhvht/DxdoIdddcI0/kaDXifuKm9
	h4dXEEifqHXowAmW9vk2TA3u2WIvv6SA21ZUrLCuM/qU64Id+BMt1W1KzJlt1xekMK1UvZckgmr
	RIyf+uGEsYFabyBLwUQYlgzf4F41vaKrsteLoWASf3p2mwMU5s84HIKB8dZou7hPg6QFCLLOFBe
	GJkn4YXL8qBTVC41K0mGahIt6Ap7sxCrl1uP6FdgX5uSG0J5vI9IcouWXk+peIREhW3zZfwb5a7
	CN0A==
X-Google-Smtp-Source: AGHT+IHQaRPW5Z+82UY9pEzbYcDPyEGN8fKYO8CtOfId4rHQlnPo24EZfkjrwsD/rMj2IG5QI0tj9Q==
X-Received: by 2002:a05:6a21:999b:b0:35d:d477:a7d6 with SMTP id adf61e73a8af0-36150e6ddd2mr39141625637.13.1764688185916;
        Tue, 02 Dec 2025 07:09:45 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] libpng: patch CVE-2025-64506
Date: Tue,  2 Dec 2025 07:09:26 -0800
Message-ID: <eb4af9b4cea963b650be217d33bc12f560ed84a6.1764688053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227162

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-64506.patch         | 57 +++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
new file mode 100644
index 0000000000..696f459971
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
@@ -0,0 +1,57 @@
+From 2bd84c019c300b78e811743fbcddb67c9d9bf821 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 7 Nov 2025 22:40:05 +0200
+Subject: [PATCH] Fix a heap buffer overflow in `png_write_image_8bit`
+
+The condition guarding the pre-transform path incorrectly allowed 8-bit
+input data to enter `png_write_image_8bit` which expects 16-bit input.
+This caused out-of-bounds reads when processing 8-bit grayscale+alpha
+images (GitHub #688), or 8-bit RGB or RGB+alpha images (GitHub #746),
+with the `convert_to_8bit` flag set (an invalid combination that should
+bypass the pre-transform path).
+
+The second part of the condition, i.e.
+
+    colormap == 0 && convert_to_8bit != 0
+
+failed to verify that input was 16-bit, i.e.
+
+    linear != 0
+
+contradicting the comment "This only applies when the input is 16-bit".
+
+The fix consists in restructuring the condition to ensure both the
+`alpha` path and the `convert_to_8bit` path require linear (16-bit)
+input. The corrected condition, i.e.
+
+    linear != 0 && (alpha != 0 || display->convert_to_8bit != 0)
+
+matches the expectation of the `png_write_image_8bit` function and
+prevents treating 8-bit buffers as 16-bit data.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Reported-by: weijinjinnihao <weijinjinnihao@users.noreply.github.com>
+Analyzed-by: degrigis <degrigis@users.noreply.github.com>
+Reviewed-by: John Bowler <jbowler@acm.org>
+
+CVE: CVE-2025-64506
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/2bd84c019c300b78e811743fbcddb67c9d9bf821]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngwrite.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/pngwrite.c b/pngwrite.c
+index 35a5d17b6..83148960e 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -2129,8 +2129,7 @@ png_image_write_main(png_voidp argument)
+     * before it is written.  This only applies when the input is 16-bit and
+     * either there is an alpha channel or it is converted to 8-bit.
+     */
+-   if ((linear != 0 && alpha != 0 ) ||
+-       (colormap == 0 && display->convert_to_8bit != 0))
++   if (linear != 0 && (alpha != 0 || display->convert_to_8bit != 0))
+    {
+       png_bytep row = png_voidcast(png_bytep, png_malloc(png_ptr,
+           png_get_rowbytes(png_ptr, info_ptr)));
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index 62e3e81b4f..cc35e7a725 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -16,6 +16,7 @@ SRC_URI = "\
            file://CVE-2025-64505-01.patch \
            file://CVE-2025-64505-02.patch \
            file://CVE-2025-64505-03.patch \
+           file://CVE-2025-64506.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
-- 
2.43.0


