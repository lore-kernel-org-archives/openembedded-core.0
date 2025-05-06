Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E51C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 11:04:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.73169.1746529444969564731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 04:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S7SRHFKW;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso30016335e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 04:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746529443; x=1747134243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5G44Kcal80ysE5TfRdmKPqMuUAoR+duPnn0Z5Zc+/Ho=;
        b=S7SRHFKWBEeiSSzA8tal7x8lZwXkRaOo+/ynBpjlqCDV3uv0xCNz4+4DY9MehML9fA
         hloUwiFr1RKLEXt5atlLi8QhoAeYV1qB4SwKfc0RxEFiXxtRNIRWQd3oKnkKoq2IzdfB
         nEPzdsUlxKYVUVwtzot8ghpEABZx5M0Vo6YLb13RGK1iq5U1TNknwPYtJU6QbKiIuHlw
         p8CCJy2clKvGJ6OFvq9kQQrC2lACqyovQFKd0KTVTPVfGozS0HZr0krfa995md+jMHiX
         3V4oJ35ev5CAMhlbjRxuYk5N8+Nnydr7fVb+jw9o1C6PObOI+GGG2//Tvn0MqlYNb8Lu
         JsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746529443; x=1747134243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5G44Kcal80ysE5TfRdmKPqMuUAoR+duPnn0Z5Zc+/Ho=;
        b=c6r+NGGPiEvXtY8SzRA1Qf5TrnRkIuXqpzAj47gYs1DXAMWs/uMZ774fp6mTPr8TH/
         fx2uDT5gjMEJoMl2gNHYi/zfFxW2no9yutqVlJqHIK2YIYV1zPJHyea4kiVbqoPlkO1w
         N9cEHd5Qyl6hl0gEhJYElAHMq58e+RvUIpN4IK3ZJz0zJMTzNVFhopyO1E3BRA1VXax5
         9EF+eRkxbspogvXNzYnZ3E7UK1WK/oAMPWnAY+WfA+45ycJhN8am5W/4Xi06Bc5Mul3U
         HbQ0PwzbPqXkg/8VwtddCqcCqtlCgpU77OXk5xjYlKOmUZpzueB1SuC7WKXrW98E1+2u
         r6Hw==
X-Gm-Message-State: AOJu0YxyPJFJTCOidJWnweMH3WqbEsJD46tVHQ9t9jpVVR5Vo5WjvJlw
	jhioW4zTOZUmCwqYBfG7TgE/5g47g8e4HxmIM4skUKz0kcw5HBLI/raVwA==
X-Gm-Gg: ASbGncsUBnxHBQfyODjNpgpoVYSGR08kxihybpi4q3pl13N1gi9qbpZ0RwoPCrNPKUE
	UBjfDbJICeRBiUpp/oxAmUJiLYI/db+CP6mEJdNmMRpnPSZ1eQzj4Oty7mK+67UqXMFxhSNoFUk
	hkqaRTgrcEAflnoJ6cmAa7kjWJvyFxnC8n6l6/yo9Fwwgdjf3qB92Ya7LiR12VRxTcza7oYmhUs
	jSx/H/f8KSE0SDTl86LbxWuRJk2/JGXiRiQua0RjsspaeSDOEQWnwyFvjh+H7caWYwn6l4dBokG
	8NB/4SuUYHHqXiuZL7+zfSCoZiIBSv/eF8bXQ33E5qNR1HJFUnKLCZ16brBhzaVdxFxVTcw=
X-Google-Smtp-Source: AGHT+IElXQlQMBBWVKv3F8bAlGy/UWuXJ5Y8itpS7eX4pMRXJbNcxWILWGhidZENGpCRcRdNy8bcyA==
X-Received: by 2002:a05:600c:b99:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-441d04f458emr21525275e9.1.1746529442793;
        Tue, 06 May 2025 04:04:02 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a2873csm164042635e9.30.2025.05.06.04.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:04:02 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa: Allow using semantic version suffix
Date: Tue,  6 May 2025 13:03:44 +0200
Message-ID: <20250506110344.2129531-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 11:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216039

This should allow testing release candidate versions easier.
For example:

  PV = "25.1.0"
  SEMVERSFX = "-rc3"

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 --
 meta/recipes-graphics/mesa/mesa.inc   | 5 ++++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index ca160f1bfc..c9aca52f8f 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -4,8 +4,6 @@ SUMMARY += " (OpenGL only, no EGL/GLES)"
 
 PROVIDES = "virtual/libgl virtual/mesa"
 
-S = "${WORKDIR}/mesa-${PV}"
-
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 66fb896676..a0c8f328fc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11
 
 PE = "2"
 
-SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
+SRC_URI = "https://archive.mesa3d.org/mesa-${PV}${SEMVERSFX}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch \
@@ -24,6 +24,9 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "c0d245dea0aa4b49f74b3d474b16542e4a8799791cd33d676c69f650ad4378d0"
 PV = "25.0.5"
+SEMVERSFX = ""
+
+S = "${WORKDIR}/mesa-${PV}${SEMVERSFX}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.49.0


