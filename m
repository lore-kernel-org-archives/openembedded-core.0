Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180ADC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.12404.1668951093813364598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VTk5WbJb;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so16308223wrh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8LSAc3RBukEjVz1T8VG4Cy7r53Q22vdDm5XzR/zG8w=;
        b=VTk5WbJbKwiiFDTwvkpWEHbC0Ylt/DdfC22tGyHEW6dNkja7FpycuJYw255ICla74Z
         e2b4YNv0AuBPhq1GogNEbwN9nhHjZf+dcs/4+duDa2w+IaSP7lw6B2lQt4LOtIjI/RiZ
         sYL3UXiWX+sUbksoOp4x4KBxgbhcCSIpQN0knN1pflwZ5WTcZRZS6Hh2HA7j1NgLuqca
         AZiUZx9Gwy2dI2y1MdRRJRdCTQI2x7T8jCg9NggK8xGR4Em09wfA0NBeE479yO+cEGeT
         7ItmH46QHx3vHpTSwyeTt7+GSAcsWanC8TmEO+LOUFkmdn4wgAcFGSHP5+PgW819Ze+X
         /FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8LSAc3RBukEjVz1T8VG4Cy7r53Q22vdDm5XzR/zG8w=;
        b=cMV0BbxTLtBf/QHu+OkE4jd+9APSSjZ9ITeA5DlYswX3mqbQnRAsXKlAy4kM37f430
         D/qHSewCzAFx/+Qmuoq+ShZFw9Tixk9mzNxVf8sSTQfDF6IF87jhyhqoTPEP2GHHPMkg
         DOLy1jhg9olZH6D+WUDyKd4ydROojtgYVLG01Yc+VHDz3fs6QHO1dvhnhO8V8RM2KgPu
         x9Fq0KRHsVg7hVx+hqpY1p5e95WeXuphk31apksfpMpGgSQ1niSz2posTmeWgNijaa1r
         Qn/IfJYWD5rTiqBDvztmLLSkndo3NljMWrUQ5mrR8mmT1jtHlBGLF+hWgUDaEk3zvD4x
         6U0A==
X-Gm-Message-State: ANoB5plmNxX6CI/s+X2/hyPWTht+yyUJHLpPB7YGrhhzLPoPtvLFsc1K
	a7xHfum7/cZboc8abtugDo+IQSfyKA4=
X-Google-Smtp-Source: AA0mqf6nI75iblweMQl9Fj2J64bWruUc/68NpNTMHmuZ5aJgeBY3ayEi0wTgSIHmgjf9h6NqVIhjwA==
X-Received: by 2002:adf:ebce:0:b0:22e:4acd:cc89 with SMTP id v14-20020adfebce000000b0022e4acdcc89mr9370395wrn.76.1668951097724;
        Sun, 20 Nov 2022 05:31:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/17] flac: update 1.4.0 -> 1.4.2
Date: Sun, 20 Nov 2022 14:31:17 +0100
Message-Id: <20221120133122.2464634-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173593

License-Update: removed file, URL fix

Remove options no longer supported upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../flac/{flac_1.4.0.bb => flac_1.4.2.bb}                 | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.4.0.bb => flac_1.4.2.bb} (80%)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.0.bb b/meta/recipes-multimedia/flac/flac_1.4.2.bb
similarity index 80%
rename from meta/recipes-multimedia/flac/flac_1.4.0.bb
rename to meta/recipes-multimedia/flac/flac_1.4.2.bb
index 360396380d..d3ece3f3cf 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.4.2.bb
@@ -9,29 +9,25 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/flac/main.c;beginline=1;endline=18;md5=893456854ce6bf14a1a7ea77266eebab \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=73c74192ce89ee6238d15a171e00c971 \
                     file://COPYING.Xiph;md5=3d6da238b5b57a0965d6730291119f65 \
-                    file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
+                    file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
-SRC_URI[sha256sum] = "af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d11e8cbf583c48c2506"
+SRC_URI[sha256sum] = "e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4"
 
 CVE_PRODUCT = "libflac flac"
 
 inherit autotools gettext
 
 EXTRA_OECONF = "--disable-oggtest \
-                --disable-xmms-plugin \
                 --without-libiconv-prefix \
                 ac_cv_prog_NASM="" \
                 "
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
-    ${@bb.utils.contains_any("TUNE_FEATURES", "core2 corei7", "sse", "", d)} \
     ogg \
 "
-PACKAGECONFIG[sse] = "--enable-sse,--disable-sse"
 PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec"
 PACKAGECONFIG[vsx] = "--enable-vsx,--disable-vsx"
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
-- 
2.30.2


