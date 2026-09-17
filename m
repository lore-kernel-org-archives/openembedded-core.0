Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B71AC982DC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1608.1789682911754695352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RXyZ72u0;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso875715e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682910; x=1790287710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4J1GC0Jmj9KVlGGucPQRAUoRKGCFPdiHm4ukC2wf1h4=;
        b=RXyZ72u0DWUcmG/QDa956k5KMhsNMsXTeltUVZ8x+6ZG4a2LWtKh1nldlarSZgwPTH
         6tBXy5uiUJCYnU/QEJQlDKiwUFu+q173SRDNa+scnME5PwZC+/P8PoptDoQZfr5A3/aL
         zS46OIfWQHHO5RkxbzwccMTNxX0lqUeYkpZG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682910; x=1790287710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4J1GC0Jmj9KVlGGucPQRAUoRKGCFPdiHm4ukC2wf1h4=;
        b=YRd1CRf2FB67/CSWugN0tiuJ4WGqjdwOHI5r50AxR2i8YYizp2sJWr9JU12OoVActS
         OcW7HFyTHwybixgICmlJSouJ7fdaAufrnRgHw5g1bc0BCQ/HXPuEkDumZHIAEZNkWBeq
         dIx7B0DPF7++RkcODxh27lrDMUMeQJx2J81zQn/GPqONFcBDZU3pfTcWDQImTOKF2LDw
         +IDEXPGC2bA4a+Nydj91WAEjD+kPEkhzzWQh9ex/1YPgp+JNmJatePWC0k/yyur/5eUZ
         JBV0t8jY7pu2wcEEDlIa7aKDrUiEb5CjX7cJWV5KFAgLRkrz9GkiisK4VEF/Hw1SkyMM
         t/iQ==
X-Gm-Message-State: AFuF++kVmheDntd8mWSL/ZtMpbXf3um4foKGDI2q20ZfEH+w7G7t9w0d
	mJZgtLM+AK/rOPmGB3Xm8nQ7P5VyC9ffpKa/fMTySfl3j7ITLteRG8vzLuNSimwQzCgjiCc+f2W
	ONRYV8bs=
X-Gm-Gg: AYBFou0eLSfKqj06R8KOucxvvJJIthLglRyt7oc3QbcmVJHKRNzUcdzGdIZa+sys5hl
	QFcMK8tlXFAdZHgDypFs5cm08z1WTBfGOad9JVqOJcfRLhDZ3KyOIW+y3J3CRfWUeCeBN0U7g8F
	Imr5OhOEcc6NalvVKKGR6I1m/Vxub7zlBzxnldaPXvL3WoKcpp9mjviL3ih2MkAT3P6C7zMc975
	IqKGVEgEXXPyW3C7Y/+3KgefLtciFjgrqlJIzq38gFU7tJzMaYXFFBWPEyCr9E5jVN9sI6Ig2Fm
	2koy2SudU7FKdBkU7hui4CWXYzoUQQsslqPSWxkSwVQlo91+EEaj0MgWNg+xmkcKoCFL4wyTpug
	iBcPJlZ3K9V9beusOq7sfQeaDu2wyv6W6WO1lzowaCpqB55VZQyU7A8ahifhDy3bu4FYkgANaFO
	sjQ9O7cnKCcYlANetA35zYMfSmZcysgQKcNQhZHeoAal2N/TFdy4dehtIS+ZgYh4wTjTh6eQrPd
	Mo02GGTCvYyGHW7/nFYkj/VLz/O1XAL7Qmjk6OtQp4q0+VddwGHIiIXVQfw3ZCesogJxeJnTog=
X-Received: by 2002:a05:600c:6309:b0:49e:6b55:22b8 with SMTP id 5b1f17b1804b1-49fc5669353mr3496705e9.4.1789682909986;
        Thu, 17 Sep 2026 15:08:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 75/79] ffmpeg: Fix for CVE-2026-65703
Date: Fri, 18 Sep 2026 00:07:00 +0200
Message-ID: <b5eb17fb9a179a420c7d401e1919d61f0632b4e0.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246170

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/fd3ee52fab34d98a95b787d0b5ff45685766200c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-65703

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-65703.patch        | 47 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch
new file mode 100644
index 00000000000..67c319f17e7
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch
@@ -0,0 +1,47 @@
+From d15f021e27bd2eb4b7aaeb4cc4f2f49ec3435f48 Mon Sep 17 00:00:00 2001
+From: Cloud-LHY <security@clouditera.com>
+Date: Fri, 10 Jul 2026 04:07:04 +0200
+Subject: [PATCH 5/9] avcodec/tdsc: unref the reference frame before
+ reallocating on size change
+
+Fixes: out of array access
+Fixes: tdsc_poc/ffmpeg-tdsc-linesize-report/poc.avi / gen_poc.py
+Fixes: tdsc_resize_jpeg_oob.avi / tdsc-resize-stale-linesize-jpeg-oob-generate-poc.py
+Fixes: p9xG4xGf9P7H
+Fixes: HQL7a1WgTdHZ
+Found-by: Cloud-LHY / Clouditera Security, Z.ai Security, NSFOCUS
+Found-by: Adrian Junge (vurlo)
+
+CVE: CVE-2026-65703
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/fd3ee52fab34d98a95b787d0b5ff45685766200c]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/tdsc.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/tdsc.c b/libavcodec/tdsc.c
+index 8baf8e9..ecd67da 100644
+--- a/libavcodec/tdsc.c
++++ b/libavcodec/tdsc.c
+@@ -482,11 +482,15 @@ static int tdsc_parse_tdsf(AVCodecContext *avctx, int number_tiles)
+             return ret;
+         init_refframe = 1;
+     }
+-    ctx->refframe->width  = ctx->width  = w;
+-    ctx->refframe->height = ctx->height = h;
++    ctx->width  = w;
++    ctx->height = h;
+ 
+     /* Allocate the reference frame if not already done or on size change */
+     if (init_refframe) {
++        av_frame_unref(ctx->refframe);
++        ctx->refframe->format = avctx->pix_fmt;
++        ctx->refframe->width  = w;
++        ctx->refframe->height = h;
+         ret = av_frame_get_buffer(ctx->refframe, 0);
+         if (ret < 0)
+             return ret;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 8d3b0dd79e0..8be6b423f75 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64833.patch \
            file://CVE-2026-64834.patch \
            file://CVE-2026-64835.patch \
+           file://CVE-2026-65703.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

