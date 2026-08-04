Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11E6C561F8
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14933.1785846226074517639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BAON54q6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso15704815e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846224; x=1786451024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wb3fWln3Z3GzD//RqSP7V0xGxUCuzURlzFUgEcj1FJw=;
        b=BAON54q6BRuFDz8hG8QPIlC3e/q+JCvqk0rblcyA/G5ZxJsycnO4QEUuM6WhE/jOZ6
         JaXEaL4GLRuG1JDbSzy466bCv+ktldoQnWtc0XZgj6SE/tk9R6p8/HZT7/58FYUNnhv+
         Kip30mlO7cpkQ3VnbdLpvjLL/9t2v6t/ojHgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846224; x=1786451024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wb3fWln3Z3GzD//RqSP7V0xGxUCuzURlzFUgEcj1FJw=;
        b=jXx+2OchPvtDQRKcs0oTI5+nxrzPxBhaGEv1rPxQ313CHB7hWfKf7kNS+RYSXDmZ19
         +29Y/VVu2JHoKD4zX6WuLuJ0r8KOMhGQSCGu89XVjYYN/W9SmqaqemcpLizlNus230EK
         xqUpvpQrgL3oO0FQ+MtD3YQbc1ZEdjk92IC6f3RZv1feCbKupvmQ+knpPD1b9JEyNq4Q
         aNDIGWXS8i92ogjtWEjA0D85qKKN6rrBpbpLuuDpyWNrxvUJqw0Qoo3/DRMcBqzbOsBV
         0Uyp9NnEZcKPxnGMJ3owNMWAweKRvfKzkxg8Rtr5dhSQxWPYuECNoGLCGiBbTrChHzAp
         MXpg==
X-Gm-Message-State: AOJu0YxbUpKwmAK0yRYJyAA4jlST6k5/rSc3Hr2v67neEGSoXCWbyUvr
	p8N07kRk8Wj0TY+NG2yHLfZ2iiSCy03IxVCUvMV5LInYkJJtidRnzjw0E7sHZs8BvAvDg+Y2q4j
	2wUadXFM=
X-Gm-Gg: AR+sD10toRAXaWsesvr8a8smGEX1i+yXFjcUrbFSXirPTJ6r/91g93AlNloQgN7yqx+
	Bkq//CWHxxm94DcvBWBhIaIRzW6bjo1hjp3R22Lk5b9sm6p/G2weZ8BL80jUktvlIgBtiFj2CJA
	7T0nnTjHIQ/jhbU2cRHnchfgJNmg90AQOwPToLjZfNDI0RnZ85Vx2VvNYm+j92dTWt2fxI4kd4c
	kpxiNewGtmhiHMOoUbrjI+1Ku3BH7ZtoHyEjhv2IXO8ImtfdcPoXg4q4pS6QLGWkKgk9QDgvM1E
	aw0TPGXBuHRBFfbh453mfnKNV3Qah1H7A8OItuEyJIkmVfIJkokZvdBD7+XMwdVjK652zy4tthV
	1AVU8brHeQKc34PSeI4+cfL2ImvN12soQD4D8tgkvSqCxwBfe0SKAsMjjiA2Zg8pmWpalvvjk7Q
	1meycLtDK80A9O+9YXbDUs48X4na38QIon8zSk4vJYVECHN24oR5vEHyaGXvMjqEIE1RJKQymNf
	PCVKm6gcOzrnj9Elw==
X-Received: by 2002:a05:600c:3549:b0:498:14d3:562f with SMTP id 5b1f17b1804b1-49814d35701mr238551545e9.15.1785846224307;
        Tue, 04 Aug 2026 05:23:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] ffmpeg: upgrade 8.1.2 -> 9.0
Date: Tue,  4 Aug 2026 13:23:32 +0100
Message-ID: <20260804122335.3094065-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242744

version 9.0:
- Extend AMF Color Converter (vf_vpp_amf) HDR capabilities
- LCEVC track muxing support in MP4 muxer
- Playdate video encoder and muxer
- Add v360_vulkan filter
- HE-AAC 960 decoding (DAB+)
- transpose_cuda filter
- Add AMF Frame Rate Converter (vf_frc_amf) filter
- SMPTE 2094-50 metadata support and passthrough
- ProRes RAW VideoToolbox hwaccel
- APV Vulkan hwaccel
- Animated WebP decoder
- Animated WebP demuxer
- Remove CELT decoding support (doesn't affect Opus CELT)
- Remove ogg/celt parsing
- Bitstream filter to split Dolby Vision multi-layer HEVC
- Add AMF hardware memory mapping support.
- ONNX Runtime DNN backend with GPU execution provider support
- Remove deprecated NVENC options and support for pre-11.1 SDK versions

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...build-common.mak-ensure-target-directories-are-cre.patch | 6 +++---
 .../ffmpeg/{ffmpeg_8.1.2.bb => ffmpeg_9.0.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_8.1.2.bb => ffmpeg_9.0.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
index 8874c2a48f8..3f523ddb014 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
@@ -1,4 +1,4 @@
-From 894c92ca133c5f1532a4ae155ae8f4d2c6da3c9a Mon Sep 17 00:00:00 2001
+From cb0f8bf74b53130ceedb97af317840f76ddfce31 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 11 Dec 2025 19:55:46 +0100
 Subject: [PATCH] ffbuild/common.mak: ensure target directories are created
@@ -29,10 +29,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ffbuild/common.mak b/ffbuild/common.mak
-index 06d6f39..52a9a20 100644
+index 059de5a..9ca7219 100644
 --- a/ffbuild/common.mak
 +++ b/ffbuild/common.mak
-@@ -126,8 +126,8 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
+@@ -114,8 +114,8 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
  	$(HOSTLD) $(HOSTLDFLAGS) $(HOSTLD_O) $^ $(HOSTEXTRALIBS)
  
  RUN_BIN2C = $(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(subst .,_,$(basename $(notdir $@)))
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.bb
index 26614762e5d..1cbcb2e764b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
-SRC_URI[sha256sum] = "464beb5e7bf0c311e68b45ae2f04e9cc2af88851abb4082231742a74d97b524c"
+SRC_URI[sha256sum] = "7f607a00dd0d28a729d5a4811205812eef01cf6ef6155025febb6f36a9062d52"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"

