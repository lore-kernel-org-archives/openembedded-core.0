Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6246EF4642E
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46890.1773653406670551568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FFtv6dV7;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48534237460so48096705e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653405; x=1774258205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgDj4GsYwW1svVHTakXHoT8o1nrjyimtmjEavzLF0WA=;
        b=FFtv6dV74Y1ssf2JYYJSHJsP1rDovfVYEOC6xaUVhJKgcVhEwZjisghCS4vHNV/tz4
         qPlPBvqk6/xtaBL+ey9TudM/fFdDxXpM8jzBt0EG18R6yQFYvVdvlNMvfEvfB+Jewk/q
         YD/DwC9B1CNBuzzv6uIBhqS56bwnXxXvKbMH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653405; x=1774258205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgDj4GsYwW1svVHTakXHoT8o1nrjyimtmjEavzLF0WA=;
        b=gxwLZj64bq+wqLFd5KWY+p9bsXHjQUY1UDD5WTwXl6pD4mYM1F9xSGKIrzjVniTY+s
         LvEVk82xN3I1M3WpAab+SfFPKyPf/n0/Z0qzUFRZaRXqwEXyQTydb2UthjcdyX64N1Gm
         vObrwUjKvIVWIURqY/Asx01cDPv/bmxBZpsjhVY2XJCFB6vA+i9If2X/oplFc4plqXsx
         bLVcB3UOhZX86N6bkSorD80AHiX92eGYk78CAekLZQQPgB0uWO/w2q9tdQ3xlBTB8YmM
         iuBDi8WFn+d2qpeWMkoE//RSm/FftJsajry+WDbDVHHn6kTqEbAJDDgd6im4iCP/da/O
         u6yw==
X-Gm-Message-State: AOJu0YxKiQ4Wv9/8GcyTU+ncMZGp3496YvYMKwtzP8o14nzP1/3ciMpL
	TUCAN69dtZwJ1wYM9OAiYmVHEvvi0ua3aSplqOWvfA8POxXCNjUjb0t6J/mO9RWKJ7qM8mB2vai
	VvJqU
X-Gm-Gg: ATEYQzyGz5T/bY1ZOXA8EyNC504uAA+330RdzyUwhA098b1Vr+422zumm44p9epV7DH
	XXbQ+D2hYc6s944osQs18k/3Likwy/MJVCrf1hTbTIXQezUrLkCT9Cj7Icni0re5YBm0by16Du9
	1yT5xoQsuV811lSfHrFofClF6ZQkz8QcPN1jO7opPWycvCOIVPw58DVpjNUi0zhzbnV1GBfY/SG
	J10YkLgbf8DMGOrDPKhtRozDjrhB2nCGU33RuYearDcJaCfFfgW84yX6UlmqaYgBZbiJfXiBGsJ
	N3/kWACxflqH34+fvRMsVQLcWuTfN5015XtexH0UhSR2vKi60CuaYbXrfmCeGDIxkXeWJXX+/WM
	LDwOwFMRmmXEFXhY0Ga2OosQDFYH+Aoq9+Or3pVpwIsXhhtTlyFadgwoepXxJQBd3mbEvxnIM5W
	7tQYYnkC2J+cV5hGcoegf+38VvZrV7S8/RKWgSr6ITBAnwaH2b6L1tog/Ttm0pr+R7RWSfWjRvD
	S0qRusTdWrj6TbsjzWX66UR3D1yqx5N7A==
X-Received: by 2002:a05:600c:a4a:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-485566f7bd0mr199474985e9.16.1773653404575;
        Mon, 16 Mar 2026 02:30:04 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/17] ffmpeg: patch CVE-2025-10256
Date: Mon, 16 Mar 2026 10:28:23 +0100
Message-ID: <2fbcad701a42773e8643abb69b0d3e64a74049d5.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233226

From: Peter Marko <peter.marko@siemens.com>

Pick patch metioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2025-10256.patch        | 31 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch
new file mode 100644
index 00000000000..6c5f98efe2f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch
@@ -0,0 +1,31 @@
+From a25462482c02c004d685a8fcf2fa63955aaa0931 Mon Sep 17 00:00:00 2001
+From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
+Date: Wed, 6 Aug 2025 16:39:47 +0000
+Subject: [PATCH] libavfilter/af_firequalizer: Add check for av_malloc_array()
+
+Add check for the return value of av_malloc_array() to avoid potential NULL pointer dereference.
+
+Fixes: d3be186ed1 ("avfilter/firequalizer: add dumpfile and dumpscale option")
+Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2025-10256
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/a25462482c02c004d685a8fcf2fa63955aaa0931]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libavfilter/af_firequalizer.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavfilter/af_firequalizer.c b/libavfilter/af_firequalizer.c
+index 38663200eb..f14983b431 100644
+--- a/libavfilter/af_firequalizer.c
++++ b/libavfilter/af_firequalizer.c
+@@ -793,6 +793,8 @@ static int config_input(AVFilterLink *inlink)
+     if (s->dumpfile) {
+         s->analysis_rdft = av_rdft_init(rdft_bits, DFT_R2C);
+         s->dump_buf = av_malloc_array(s->analysis_rdft_len, sizeof(*s->dump_buf));
++        if (!s->dump_buf)
++            return AVERROR(ENOMEM);
+     }
+ 
+     s->analysis_buf = av_malloc_array(s->analysis_rdft_len, sizeof(*s->analysis_buf));
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 4793035eb72..f89fb2d0d78 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch \
            file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch \
            file://CVE-2025-1594.patch \
+           file://CVE-2025-10256.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"

