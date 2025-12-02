Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B57BD116F9
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:09:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9661.1764688189116371553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JNIgQDkj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aace33b75bso5323880b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688188; x=1765292988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UySqQUCB/5HIusTG90fqWMIRWqJNCGams8IKJ2MpfNc=;
        b=JNIgQDkjJeHeHz7eH+O7BiEwOb8wYmd+V7ZXr8gGBO1/ZnHQWKDAye+PhhC0XhFApM
         DQNtjzj+W6slaIsUjRRkZATMj6wVTAqE/mnqTOYI7JvjQi7lM0BnrP2UFtn3B7VRTuCU
         WPPYjeahlFPldWSYoh5rd/bowkdNa80wnWsGBqmAUBHbXnKsBSsBEMK5GoPnmnmXuVaj
         XELxpKTMwnOHcI5S7vIJuTl945V9j0BqIIQ5Wh2PnbWcvSb8iHFEuZABkmqO7ZrslQKt
         wXn7SqHKFW2jGpJ/J5QOtanA3EtbL4TvBlqJxvor/xrAvbgcgf9x7Cp368IPPPQ67bNt
         OLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688188; x=1765292988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UySqQUCB/5HIusTG90fqWMIRWqJNCGams8IKJ2MpfNc=;
        b=XESavtdY22T/lOJx441umXsr+vwsdCphBRd/+B8Y4OJtLaliL2s9ePmBw2MgGqHZCA
         c3tibW+sCkeevXmSH/I4bo1dPQOQmnvy8CqfzsM22m5jw+yOGUPWD2YhZNQBNxeGBqNK
         /NS6Bg3IgcD0F29xPUD4LfUek3UahYrpRnNcftYVnJ1VmNYyvYFGtakNn72DyVJfjqVF
         gICLjHRKfMYrhEsJaRD2trxESWjGLyCuE8KLKN88lhTwzqjzzUwfIGEP0mY56P1Tj/yu
         28rJML1T3FUpt0tWVj0hZazEncarCbYlD3LyDnHtBoEaDwfBZebpWMbJ3CXzZA2mFFph
         63sA==
X-Gm-Message-State: AOJu0YxdZrSgKcXyFYzp5AjoHVLMsYlczwA7+3bPrJFpa3V6jCWLvblI
	uwgi8P2wHVrd3SvOK4PZteo+gQhykMNp4555x64r4bVH6eslJVgf962Y4FQ9YbL0421G3kNErSN
	2JXTq
X-Gm-Gg: ASbGncutSbxlUyNJN9meL0fmVQ7Jbio5woFGTsNgmIoZcmkVFazHR4VOsEQF1+I5pDY
	epmwMzRzzjzy5F4LWAqCEqmQAF0BPEwvrzhlwucL5vh55DjO02HIEpy3keik0MwouWsjITnROi9
	zdG6JyOGj2QEh93C1lRDmm9gETmrvPYYgAEZ+schezujFp0LUwcFn3MwMlKh+fuPlt0qI7n0rqM
	YVMYgvUy9EPAEK6m3d8Fja/hrKOd/E6E9KljPwAZwgZyj/1OEp/ViUv38Kh+7xy7mXMgbVDTDDC
	pe6wa8Pu6sxEQ2tmTktCmP7QdTn0Bc0jRrEIpIP6cVWfRCSff+QcxpK0Bg5DShpS6SK6BpPJAWD
	ordxodkclzhJDZInfJRXIayYgB6bwURO1mbMnnCE9Dku0wx/1Zi+Qr2c50CwRdyBOD9z9UR57vX
	DcRw==
X-Google-Smtp-Source: AGHT+IEDLhxB2RX3vR6cPUsGH0VmcuByjRsaVan1smFaR8l4u9amDHVe5WanUF+tAoA7UCjbjg9WJw==
X-Received: by 2002:a05:6a20:431e:b0:35f:6586:5df6 with SMTP id adf61e73a8af0-36150e27820mr45715225637.11.1764688188244;
        Tue, 02 Dec 2025 07:09:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] libpng: patch CVE-2025-64720
Date: Tue,  2 Dec 2025 07:09:27 -0800
Message-ID: <9694df176a13eeac174c7da2bcf8243969dbcda6.1764688053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227163

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/files/CVE-2025-64720.patch         | 103 ++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
new file mode 100644
index 0000000000..08df7c3210
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
@@ -0,0 +1,103 @@
+From 08da33b4c88cfcd36e5a706558a8d7e0e4773643 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Wed, 12 Nov 2025 13:46:23 +0200
+Subject: [PATCH] Fix a buffer overflow in `png_init_read_transformations`
+
+The palette compositing code in `png_init_read_transformations` was
+incorrectly applying background compositing when PNG_FLAG_OPTIMIZE_ALPHA
+was set. This violated the premultiplied alpha invariant
+`component <= alpha` expected by `png_image_read_composite`, causing
+values that exceeded the valid range for the PNG_sRGB_FROM_LINEAR lookup
+tables.
+
+When PNG_ALPHA_OPTIMIZED is active, palette entries should contain pure
+premultiplied RGB values without background compositing. The background
+compositing must happen later in `png_image_read_composite` where the
+actual background color from the PNG file is available.
+
+The fix consists in introducing conditional behavior based on
+PNG_FLAG_OPTIMIZE_ALPHA: when set, the code performs only
+premultiplication using the formula `component * alpha + 127) / 255`
+with proper gamma correction. When not set, the original background
+compositing calculation based on the `png_composite` macro is preserved.
+
+This prevents buffer overflows in `png_image_read_composite` where
+out-of-range premultiplied values would cause out-of-bounds array access
+in `png_sRGB_base[]` and `png_sRGB_delta[]`.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Analyzed-by: John Bowler <jbowler@acm.org>
+
+CVE: CVE-2025-64720
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/08da33b4c88cfcd36e5a706558a8d7e0e4773643]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngrtran.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 42 insertions(+), 10 deletions(-)
+
+diff --git a/pngrtran.c b/pngrtran.c
+index 548780030..2f5202255 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1698,19 +1698,51 @@ png_init_read_transformations(png_structrp png_ptr)
+                   }
+                   else /* if (png_ptr->trans_alpha[i] != 0xff) */
+                   {
+-                     png_byte v, w;
++                     if ((png_ptr->flags & PNG_FLAG_OPTIMIZE_ALPHA) != 0)
++                     {
++                        /* Premultiply only:
++                         * component = round((component * alpha) / 255)
++                         */
++                        png_uint_32 component;
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].red];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.red);
+-                     palette[i].red = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].red];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].red = png_ptr->gamma_from_1[component];
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].green];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.green);
+-                     palette[i].green = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].green];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].green = png_ptr->gamma_from_1[component];
+ 
+-                     v = png_ptr->gamma_to_1[palette[i].blue];
+-                     png_composite(w, v, png_ptr->trans_alpha[i], back_1.blue);
+-                     palette[i].blue = png_ptr->gamma_from_1[w];
++                        component = png_ptr->gamma_to_1[palette[i].blue];
++                        component =
++                            (component * png_ptr->trans_alpha[i] + 128) / 255;
++                        palette[i].blue = png_ptr->gamma_from_1[component];
++                     }
++                     else
++                     {
++                        /* Composite with background color:
++                         * component =
++                         *    alpha * component + (1 - alpha) * background
++                         */
++                        png_byte v, w;
++
++                        v = png_ptr->gamma_to_1[palette[i].red];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.red);
++                        palette[i].red = png_ptr->gamma_from_1[w];
++
++                        v = png_ptr->gamma_to_1[palette[i].green];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.green);
++                        palette[i].green = png_ptr->gamma_from_1[w];
++
++                        v = png_ptr->gamma_to_1[palette[i].blue];
++                        png_composite(w, v,
++                            png_ptr->trans_alpha[i], back_1.blue);
++                        palette[i].blue = png_ptr->gamma_from_1[w];
++                     }
+                   }
+                }
+                else
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index cc35e7a725..efb8eba372 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -17,6 +17,7 @@ SRC_URI = "\
            file://CVE-2025-64505-02.patch \
            file://CVE-2025-64505-03.patch \
            file://CVE-2025-64506.patch \
+           file://CVE-2025-64720.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
-- 
2.43.0


