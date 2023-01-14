Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1660FC3DA78
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 22:14:25 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.127865.1673734460285073046
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 14:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=jj397bot;
 spf=pass (domain: underview.tech, ip: 209.85.167.171, mailfrom: vince@underview.tech)
Received: by mail-oi1-f171.google.com with SMTP id h185so20415005oif.5
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 14:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EoPJ/zq8ANbYMnTHrtfp3hHdcvvBb1rNqR++fE+5PoA=;
        b=jj397botnoua+a5IKTHFEfyVnN+g+qDJEayJ0FWKm8Xryt3nP2YXU1TKpfwhSpIrsm
         KEwavFBjNuZCrLGJbw5U75g2LkQjQdATR27ARJjvwJGDHSs62Sa6VEvPU9nzAm06M7VT
         mGQAe0gYJ73Yq/mwbzaArITd0sT+kQU9mIn1bIyj7yRMzY5yrG0TH1s+LQEMPJwI9MXv
         1loGKPfpzHlnQKrRBzZKP+ZEJQLiMA7nlRvtyfPO2YKAxD+PBiv6Mr/BU1sBXqWvme1D
         MSUdBgGifeWxPRnOtqalnxerKu/Ugn55kaG8xsyioXLVXrmbnAjWC4Oh/ddv5GsYcD83
         /+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoPJ/zq8ANbYMnTHrtfp3hHdcvvBb1rNqR++fE+5PoA=;
        b=0rS3OIMFeB/RpTPXSSVyQNqlR/0qJicXlNWbnKhNGvMS4nMwIKmhjpa7FXfnohfNrC
         Cyxtz75Hsdv4xgcgspQwU6hp8jvcXkw/nIcPvdejWmfVYYC4uVVH/7flI+za+rVY9URs
         YhHJzv/pca76ij11xsK5zhrFo7epYlkII83uNJM4kfQ4u1QxJREmVYiT5gPayFWmk8Ll
         cCCfyjPq9MbAqedoKRr0LifHiLxedQUlppXO5eUWceweEz5jnJX1NAC5snIkbEH1yXmP
         ns5yiTgJoR2+IzB3IPBAwvQIelBDbkHGUxNLhWxFdElm9U5B7SCms40VltV+TexMJM1u
         d9dw==
X-Gm-Message-State: AFqh2konbUpvnL6M/nn1+z5LtYTfVcswKUzkDg5u8kNgzMjCsuxo0fRN
	ZSMMTcT+63Pjd08zlOW3B4BUZm8+e22H4q9p9mw=
X-Google-Smtp-Source: AMrXdXucID2ndn4i4K4WmpzbitpjqDyUuSWgpZBB6euy8tpKLMXWRIBPfPmgbxJWU0PKQut1pfxX0Q==
X-Received: by 2002:a54:4419:0:b0:364:cc75:26e2 with SMTP id k25-20020a544419000000b00364cc7526e2mr1738912oiw.42.1673734459090;
        Sat, 14 Jan 2023 14:14:19 -0800 (PST)
Received: from localhost.localdomain (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.googlemail.com with ESMTPSA id a7-20020a056808098700b0034d9042758fsm10859055oic.24.2023.01.14.14.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 14:14:18 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCHv3] mesa: allow mesa (gbm) to compile without backend
Date: Sat, 14 Jan 2023 16:13:56 -0600
Message-Id: <20230114221356.248922-1-vince@underview.tech>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 22:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175858

Commit introduces a patch that allows for gbm to
be built with an empty backend. There are situation
where mesa-gl is the preferred provider for virtual/libgbm,
virtual/libgl, virtual/mesa, etc... But the x11 DISTRO_FEATURE
isn't included this leads to build errors such as

| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function
`find_backend':
| backend.c:(.text.find_backend+0xa4): undefined reference to
`gbm_dri_backend'
| /../../../ld:
src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
undefined reference to `gbm_dri_backend'
| collect2: error: ld returned 1 exit status

Add patch to bypass compilation issue by excluding gbm dri backend.

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e58706741a7d22d67b5088e60

Commit also includes the use of TARGET_CFLAGS variable in mesa-gl recipe
to fix bellow compilation bug.

/../recipe-sysroot/usr/include/xf86drm.h:40:10: fatal error: drm.h: No such file or directory
|    40 | #include <drm.h>

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 ...-backend-fix-gbm-compile-without-dri.patch | 65 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb  |  2 +
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 3 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch b/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
new file mode 100644
index 0000000000..6541671b7a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
@@ -0,0 +1,65 @@
+From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 2001
+From: Vincent Davis Jr <vince@underview.tech>
+Date: Wed, 28 Dec 2022 16:28:01 -0600
+Subject: [PATCH] gbm/backend: fix gbm compile without dri
+
+Upstream-Status: Backport
+
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
+https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e58706741a7d22d67b5088e60
+
+At mesa version 22.2.3 patch wasn't introduced until after.
+
+Commit introduces a fix that allows for gbm to be built with an empty
+backend. There are situation especially in a Yocto/OE cross compilation
+environment where you want to build with an empty backend. The particular
+situation is as such:
+
+The mesa-gl recipe is the preferred provider for virtual/libgbm, virtual/libgl,
+virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this leads to build
+errors such as:
+
+| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function `find_backend':
+| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_backend'
+| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
+                undefined reference to `gbm_dri_backend'
+| collect2: error: ld returned 1 exit status
+
+Issue should be replicable by setting -Ddri3=disabled and -Dgbm=enabled
+
+Add fix to bypasses compilation issue by excluding gbm dri backend. If
+HAVE_DRI || HAVE_DRIX not specified.
+
+Acked-by: David Heidelberg <david.heidelberg@collabora.com>
+Signed-off-by: Vincent Davis Jr <vince@underview.tech>
+---
+ src/gbm/main/backend.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
+index 974d0a76a4e..feee0703495 100644
+--- a/src/gbm/main/backend.c
++++ b/src/gbm/main/backend.c
+@@ -42,7 +42,9 @@
+ #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
+ #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
+ 
++#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
+ extern const struct gbm_backend gbm_dri_backend;
++#endif
+ 
+ struct gbm_backend_desc {
+    const char *name;
+@@ -51,7 +53,9 @@ struct gbm_backend_desc {
+ };
+ 
+ static const struct gbm_backend_desc builtin_backends[] = {
++#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
+    { "dri", &gbm_dri_backend },
++#endif
+ };
+ 
+ #define BACKEND_LIB_SUFFIX "_gbm"
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
index c7c7aa7ac3..ca160f1bfc 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
@@ -6,6 +6,8 @@ PROVIDES = "virtual/libgl virtual/mesa"
 
 S = "${WORKDIR}/mesa-${PV}"
 
+TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
+
 # At least one DRI rendering engine is required to build mesa.
 # When no X11 is available, use osmesa for the rendering engine.
 PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 77aa97069a..a36dc8fad8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
            ${NATIVE_PATCHES} \
            "
 NATIVE_PATCHES ?= ""
-- 
2.38.1


