Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F39E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:02:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.24283.1733342516748244604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bYIGS04S;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215bb7bb9f9so999005ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733342516; x=1733947316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jfDZtG/LfOHjiNrHVRJv1/hyZwURG9uFZoIvCBdSbI=;
        b=bYIGS04SMvP++a25O5vCxMwNPQ2jMz5P9/NoNenUlBppKnp57OT6TTLvMVhcbcH0jo
         BrLzeVBBU4vu57sJCZptqbbfaCSG0w0usjirJwU0PVwfUy10cvGU8A1ktIy5HzZEIIon
         i9CGPWQkrqfv83X2JzH+AV3pwEgUR0BWldHjC2RyCSVjXHd4Irk7yk7ApTprr+v1EJKp
         IYJ5NPrBCXhitf8T4WKByW0vx4nrNEQxzIU3uOo5sUjAI7aOecHGtFVGFWBTiYtloGo/
         JcgssdrnIO89/whCYi9y/0nNY1dfZ+9HIkWeULOkOcYZkZ4ICPcWdUAleO34mvetxLWt
         RuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733342516; x=1733947316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jfDZtG/LfOHjiNrHVRJv1/hyZwURG9uFZoIvCBdSbI=;
        b=jBxTTUqrgUHeDbZbtTBU0s6LSAUwu7Fh7bsqnHI1gIoxUPrzo0ol+xAEuPUOFgNd2v
         SJ1nhJv0RFt+dBkBtNdsw/Q46kv5/UlVQ08yx9uxigj8G3VckTAT3af2zAnqxMshsWq4
         3YNbJia9MG6QVCxCuQwmLCm6193Lg13ZXj2mxnRKbJNBOC8uJ4uxZNingEcW3cOKFQmy
         4itOi62TapPUimM3rgJ78DRFGT3e16S1eC25Uy2DfT2/z+2x2sm6z15UN9DqIolQ3SGx
         TptmohzH/f6rqeDXHAQOda5cD5v0jCz1AM9W+Hv/uPjlmX07gCIWJQziL9SFA+eBLiur
         X7zg==
X-Gm-Message-State: AOJu0YwTMqYiTevk15FAa5isb9g5/5xCG12p0uXbmxrnjr7PrT+5DQk9
	TDuABuvGuWPZcEqrdqr38NSbG7UeFuCpCeI1jX4EcCuy0UMz3M8LMy/jYnZ2
X-Gm-Gg: ASbGncv6DrBMpN5AgP2utdL7yfnVpKFhTADl4ngktwUuLF+W2TbvggTjIZt/4hI7yL2
	Ei+k9rnksjdung55h1GNcvtEwV+eYI2qXkjYFh+R9qJs9Tbt2zc1M/4IWXHU+Q3oOpCpCT+y5Mt
	2Rr+fKPkU0MgTphmk/2Sv/K2rqa9Iv8vYsKHN/55Gu4gQ28RgpJK5yaq3PaHhvCc9H5aOcqdYO1
	sPWyV4MOIjDboXiz4Pmo+IhoBtoDfeMykwbNV3LgPhqMGcGO/iA
X-Google-Smtp-Source: AGHT+IHhMQgVDSVUvEJYcDpxEpC+9UPDU2rYBLiC1sjI1JohTF2vVAJsXZq5K+qguNyQN9YIbuwDLA==
X-Received: by 2002:a17:903:41ca:b0:215:6cb2:7877 with SMTP id d9443c01a7336-215d002890bmr68539775ad.4.1733342515639;
        Wed, 04 Dec 2024 12:01:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::9a42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254184943csm12749803b3a.191.2024.12.04.12.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:01:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] ffmpeg: Fix RISCV build
Date: Wed,  4 Dec 2024 12:01:51 -0800
Message-ID: <20241204200153.2360387-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208325

Issue found with LLD linker

| riscv64-yoe-linux-ld.lld: error: relocation R_RISCV_64 cannot be used against symbol '
   ↪ ff_h264_weight_pixels16_8_rvv'; recompile with -fPIC
   | >>> defined in libavcodec/riscv/h264dsp_rvv.o
   | >>> referenced by libavcodec/riscv/h264dsp_rvv.o:(ff_h264_weight_funcs_8_rvv)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-RISC-V-fn-pointers-to-.data.rel.ro.patch | 26 +++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb  |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch
new file mode 100644
index 00000000000..9dc10f12198
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch
@@ -0,0 +1,26 @@
+From 93f277f05cc71f69930bd680ac6eae5457b963f3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Sat, 16 Nov 2024 08:57:54 +0200
+Subject: [PATCH] lavc/h264dsp: move RISC-V fn pointers to .data.rel.ro
+
+This should fix PIC builds.
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/c3051d94a7939de93acd647d3a1719ce56c0c4f5]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libavcodec/riscv/h264dsp_rvv.S | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/riscv/h264dsp_rvv.S b/libavcodec/riscv/h264dsp_rvv.S
+index 422ac02..97c6708 100644
+--- a/libavcodec/riscv/h264dsp_rvv.S
++++ b/libavcodec/riscv/h264dsp_rvv.S
+@@ -176,7 +176,7 @@ endfunc
+ 
+         .global ff_h264_weight_funcs_8_rvv
+         .hidden ff_h264_weight_funcs_8_rvv
+-const ff_h264_weight_funcs_8_rvv
++const ff_h264_weight_funcs_8_rvv, relocate=1
+         .irp    w, 16, 8, 4, 2
+ #if __riscv_xlen == 32
+         .word   ff_h264_weight_pixels\w\()_8_rvv
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
index 35dbda8c3d9..1c72d503d3c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
@@ -23,6 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch \
            "
 
 SRC_URI[sha256sum] = "40973d44970dbc83ef302b0609f2e74982be2d85916dd2ee7472d30678a7abe6"

