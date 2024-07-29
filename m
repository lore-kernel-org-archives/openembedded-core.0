Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D87FC49EA1
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:06 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.55640.1722258780635222239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JkkrsEs6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so988296a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258780; x=1722863580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjZmvCad9NJzrUv33mxcohx9ni2SPHvVJqvanWO6K70=;
        b=JkkrsEs6cSp+LI6OInDrDk7Rr51CsG4dmc7C+fKoYqYf1SYVKBwLxItTBUx46Z0bnk
         nn4iDs4HYydhcAEX24xskFkr+ozAs2MyQZR1zSfF96HROdG/u63n52tivI+PD4EkdR5U
         4y1iZGVvthjFAvpip2+dYReINQtnm1bv4RQ/454td4us/Fl0BMP7ISD9+R37r+36Y8lV
         mo0IEQohE7Pb5wtAcZ9h9kE3bOwmF9DK+af4de6RwM++vCvgUD+Ccm+iso/0XKcNrxRh
         3H2qRdpFmCoFI7mUeG39KNsOBCsHbvNu+awdQkcFZCdtk/ePW4MoUKQvtvHV+5Fa498m
         B/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258780; x=1722863580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjZmvCad9NJzrUv33mxcohx9ni2SPHvVJqvanWO6K70=;
        b=CRdqG48Ecuqov7m6+bWbsdtQx1yJ05bUnxLc0SZIcWaqrI5PK306/VU6aP6y1pjxjj
         UVaikGIiQVhz+azK7bdeGrWle5iIWpn6W3Eb4fOzMiUbe/MJJxkdgpf+qgGIdHtMCdo9
         ikTJv/oaeWMRcXgsyLxnOb/kgwHMMDdl2YAsmWt0NbvMF7+6E40db/hlN3Qc0GmLoHMV
         i4757UGSLs16D2ZuAajcRMu0GZboFselbM+dc8TWaXfg5hhX/AOLHQ/pDtvLPBqEzY2L
         WJrYgnZd0vVryMKqUzsm/8ERdpwHbPiNhR4RgMFg0HfXJvK4OOxVvN71num+1L8GCpfu
         9YCg==
X-Gm-Message-State: AOJu0YwFHhntzRRXTGryI378FAoKgnP/L+rvLDn89xr8EAMvn50CQD7l
	VWHLbo0L7ddKA37VJAamJYJdHhBIXIVEWGZ5Z+CUHnFgY9ZZSay6MPTCG6aF2JVbXZw5gp7nRuE
	mqSgf+w==
X-Google-Smtp-Source: AGHT+IHBm/v6ZgRi3eR3kcwMT0cHpjc868LP+LmAjgNJY2tbo22nq9YcQ/dO/nVVDAGBp703go/f8A==
X-Received: by 2002:a05:6a20:840e:b0:1c2:a0b2:e69 with SMTP id adf61e73a8af0-1c4a14c75e0mr9895340637.33.1722258779868;
        Mon, 29 Jul 2024 06:12:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.12.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:12:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/37] ffmpeg: fix CVE-2024-31578
Date: Mon, 29 Jul 2024 06:12:13 -0700
Message-Id: <bd9fe64c40f7f4e1d18b5d33a9a366e95c2ddd2d.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202617

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg version n6.1.1 was discovered to contain a heap use-after-free via the av_hwframe_ctx_init function.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-31578.patch        | 49 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
new file mode 100644
index 0000000000..f8e7e1283b
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
@@ -0,0 +1,49 @@
+From edeeb35cecb5bc0d433b14dd0e544ae826b7ece5 Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Tue, 20 Feb 2024 20:08:55 +0800
+Subject: [PATCH] avutil/hwcontext: Don't assume frames_uninit is reentrant
+
+Fix heap use after free when vulkan_frames_init failed.
+
+Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
+
+CVE: CVE-2024-31578
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/3bb00c0a420c3ce83]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavutil/hwcontext.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/libavutil/hwcontext.c b/libavutil/hwcontext.c
+index 3650d46..0ef3479 100644
+--- a/libavutil/hwcontext.c
++++ b/libavutil/hwcontext.c
+@@ -363,7 +363,7 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
+     if (ctx->internal->hw_type->frames_init) {
+         ret = ctx->internal->hw_type->frames_init(ctx);
+         if (ret < 0)
+-            goto fail;
++            return ret;
+     }
+
+     if (ctx->internal->pool_internal && !ctx->pool)
+@@ -373,14 +373,10 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
+     if (ctx->initial_pool_size > 0) {
+         ret = hwframe_pool_prealloc(ref);
+         if (ret < 0)
+-            goto fail;
++            return ret;
+     }
+
+     return 0;
+-fail:
+-    if (ctx->internal->hw_type->frames_uninit)
+-        ctx->internal->hw_type->frames_uninit(ctx);
+-    return ret;
+ }
+
+ int av_hwframe_transfer_get_formats(AVBufferRef *hwframe_ref,
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 90c15782d1..06bd36e2e2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://vulkan_av1_stable_API.patch \
     file://vulkan_fix_gcc14.patch \
     file://CVE-2023-49502.patch \
+    file://CVE-2024-31578.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


