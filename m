Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE078E6ADC2
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.35756.1732310822522332373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QoU7nAS4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724e14b90cfso814732b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310821; x=1732915621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/f3Q97x8gT8TOdHNg37TpjmLIaBLBanCJwhaosC7mFc=;
        b=QoU7nAS4Gd784PT3rzFDB7SWa3DoFtuQXmD+UPLXYOLJK1XLgkx2A2DkqpbVcs/zp9
         GL38Guqb8DwnZTGr4E6YCPoiOgyscmZjlx3BUVlDctYT4AAXsrPoD5/c6id+PLdDw4Di
         1VxzCRL7nQKVKOBCIFACVuvBuagaVes6ZyzAUsNTVtEANGa/YBROwhXDkoItBQKBUMtY
         /b3vh0kYTU8jOXfZCpQzBbuCJsEHJX4c0mn74WM74qL0Y0/YvsHvEIBCW/eghiW5Tq4x
         huSYgwf+My1Iu1+wLpGfjS4mlNLmVRWfAmJHzSxaOcoWWAMiGxZJzs2bq5rAw10qKviv
         5Maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310821; x=1732915621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/f3Q97x8gT8TOdHNg37TpjmLIaBLBanCJwhaosC7mFc=;
        b=HPB3m0T03PEIbdnvJi9Hi1IX63KKDywe3AAYpCKxygCA4fg1nu5w6F9GEI8SOLacdM
         pV8XJMz0RcoL7CufstggFpzmBd3ZBnrZ7roqVy/Rk9qcyErSWI2zz5Lx0Fo6AYeJijyI
         vdzEvf864GfaXJcwG+VKGy3yjaFAW4xJ4SQPNx0/Z+h09sfk9OeGWisEzLyozMjQ2fjH
         5SuOZNAWwtpUlvffP4ih6Kcf1PkFMot3OE7qPAZO2Fmw2eWKwgCybo2YK8l34ECFeeQz
         jGAi6s7kXV+yP1WFM4jR9QAy88zRtRERpO7iLwizSTBAGbHTKCebQ54CMEzsHuz91Pne
         XFhw==
X-Gm-Message-State: AOJu0YzUYSiyzyP752Hpj8b7JPmkiCvtMC9P3MVePysz7nH8Yv/Tc799
	6oJjH8SBLe82uBSAzHnpUPQKTO+Cff+w4LXrzfBG3ak3c5vOlUzyqQ8WiB8J4jPQHopvYtretNn
	B
X-Gm-Gg: ASbGnctoNDQgMN1N28jrfB2b7bTK6SEeJ/2B2hWDqdWbvGJ3Pcr0fSaGhWSDdqjh8cA
	johrY7m8ghLmzYrwQUsAaBr3Fzhdre/URBPvZvaYKB6u34+G3ZCfk8eA8QceT+xmGexGH3GAUlS
	QqWH2j4PBcCg5OzInvVvKEPBkJCjTNQo2Tn3mfphR2c257dzzir/tC/lTb/prqFcEhjiMMzD5BT
	zLfxgXo+nM8oGckhA7nUaHNUlwR58JiwNrxyEw=
X-Google-Smtp-Source: AGHT+IFaTVn2KA7kFUrQSZoLBUBbcAcJ0I3pn+LYWZH8L6hkawLOuLHzq4ycnfb1L2cTGBvED6r/dA==
X-Received: by 2002:a17:902:f64c:b0:212:6981:7587 with SMTP id d9443c01a7336-2129fd0fc42mr66330425ad.24.1732310821627;
        Fri, 22 Nov 2024 13:27:01 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/19] ffmpeg: fix CVE-2024-31578
Date: Fri, 22 Nov 2024 13:26:28 -0800
Message-Id: <072a5454fa6610fd751433c518f9beb5496851a1.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207659

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg version n6.1.1 was discovered to contain a heap use-after-free via
the av_hwframe_ctx_init function.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-31578.patch        | 49 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
new file mode 100644
index 0000000000..e67f4777f7
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
@@ -0,0 +1,49 @@
+From 3bb00c0a420c3ce83c6fafee30270d69622ccad7 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/3bb00c0a420c3ce83c6fafee30270d69622ccad7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavutil/hwcontext.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/libavutil/hwcontext.c b/libavutil/hwcontext.c
+index 31c7840..2a4d9ed 100644
+--- a/libavutil/hwcontext.c
++++ b/libavutil/hwcontext.c
+@@ -362,7 +362,7 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
+     if (ctx->internal->hw_type->frames_init) {
+         ret = ctx->internal->hw_type->frames_init(ctx);
+         if (ret < 0)
+-            goto fail;
++            return ret;
+     }
+
+     if (ctx->internal->pool_internal && !ctx->pool)
+@@ -372,14 +372,10 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 4a743c6dd7..ae02310af8 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-51793.patch \
            file://CVE-2023-50008.patch \
            file://CVE-2024-31582.patch \
+           file://CVE-2024-31578.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


