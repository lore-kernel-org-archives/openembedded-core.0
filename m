Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21254C5478C
	for <webhook@archiver.kernel.org>; Sat,  2 Mar 2024 20:20:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.58135.1709410832221026639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Mar 2024 12:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASgf330z;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso2868794b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Mar 2024 12:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709410831; x=1710015631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zObxomV6Q0vI34JmNmItrv+4z0umMKkxPFB7weqsLN0=;
        b=ASgf330zBuXfxVGTrgciJ84Yo2RXOIJzxKMAfhTu6gN+4sW9F0TB+/vIO0XcnuNNe3
         Z/1CV2xNdF7Ag7euvlShiJffHXnpSo3XYXf+CmSHW0k/pwLAApeO1U7Wx6kzTmNyn8Mh
         zMkWCFzN3T7VwaOB3VOtFHLQpzdwSLrV2J4sDpfwG4OP7PG2Np+9jo3VMEznxFjHOCES
         Ufe6Fz9KXjDnNiqLxjXFaA11oTcn82GgVt5yAtbr7OoRo8941zJWsBLOLI/9XsUUJFz8
         0xm3cVj4z4aD2XnlPpoeUZzDUiPbCIeaYzMEGxmlbcGspXI6TH4Ap/84eAoQ0PrGa8lv
         6WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709410831; x=1710015631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zObxomV6Q0vI34JmNmItrv+4z0umMKkxPFB7weqsLN0=;
        b=Eq+1ZjzdrT+UPX9PWfA0rhbyaG5jrX33uXnzRfPxFJIlwYRlfQydXodmLMg9Z7E7MQ
         RxPIeI89XQ3p+oZysqSjfLPQ0Gogbh3ehhv4qGFNYz5juHoU3tdC/2oyq5/pmsp5egfP
         i2/ZKCLTY2/0urHNhtkePTihOaApbsGUe0mr9qkQUhqdQ+jXEUaKWuOAEkfyfTatPsXh
         iwMPD7suAGANuvsqrVMLa+2nBGAhDDKLZnKcTEly/B4jc/+i0nsGyuyrMioVHTN9Dy7d
         hIRvuU/AJ9k3iDf+Es+5Z2z+dITg00Kp4CZkvthiiMO+buHM9op3rNe/ay/CRQYrjYVu
         AjRg==
X-Gm-Message-State: AOJu0YwSNSF1BLYWWvMwXKM+J1Lh64L5QBJoO4VgKDwjh0FXVUHgOIzN
	MG19gLZJEoOn5rqmdbXlD3H/aMSQJlnlnChx8DG68CxCheEkSbdBYiZIrkqd
X-Google-Smtp-Source: AGHT+IECB6gJ7ePfXL66Ca0eJlFsjgsVQ+Kv3Kk72VXzTQd18+8SHWr7/iABDuvrhkALEbNz0RqcsQ==
X-Received: by 2002:a05:6a00:4f8e:b0:6e5:7a4d:1849 with SMTP id ld14-20020a056a004f8e00b006e57a4d1849mr6377253pfb.3.1709410831088;
        Sat, 02 Mar 2024 12:20:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7032])
        by smtp.gmail.com with ESMTPSA id ka11-20020a056a00938b00b006e35c1aceeesm4840503pfb.197.2024.03.02.12.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 12:20:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mesa,mesa-gl: Fix build when dri3 is not enabled
Date: Sat,  2 Mar 2024 12:20:28 -0800
Message-ID: <20240302202028.3584342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Mar 2024 20:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196551

Some machines e.g. odroid-c4 disable dri3 and it now fails to build
mesa-gl e.g.

| aarch64-yoe-linux-ld.lld: error: undefined symbol: dri3_check_multibuffer [3/5]
    | >>> referenced by drisw_glx.c
    | >>>               libglx.a.p/drisw_glx.c.o:(driswCreateScreenDriver) in archive src/glx/libglx.a

Apply patches from a pull request which is already submitted upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-drisw-fix-build-without-dri3.patch   | 58 +++++++++++++++++++
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 ++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
new file mode 100644
index 00000000000..ab161520906
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
@@ -0,0 +1,58 @@
+From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 6 Feb 2024 09:47:09 +0100
+Subject: [PATCH 1/2] drisw: fix build without dri3
+
+commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
+added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
+can be build without dri3.
+
+  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
+  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
+  collect2: error: ld returned 1 exit status
+
+Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
+dri3_check_multibuffer().
+
+Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/glx/drisw_glx.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
+index 3d3f752..4b19e2d 100644
+--- a/src/glx/drisw_glx.c
++++ b/src/glx/drisw_glx.c
+@@ -32,7 +32,9 @@
+ #include <dlfcn.h>
+ #include "dri_common.h"
+ #include "drisw_priv.h"
++#ifdef HAVE_DRI3
+ #include "dri3_priv.h"
++#endif
+ #include <X11/extensions/shmproto.h>
+ #include <assert.h>
+ #include <vulkan/vulkan_core.h>
+@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+        goto handle_error;
+    }
+ 
++#ifdef HAVE_DRI3
+    if (pdpyp->zink) {
+       bool err;
+       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
+@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+          goto handle_error;
+       }
+    }
++#endif
+ 
+    glx_config_destroy_list(psc->base.configs);
+    psc->base.configs = configs;
+-- 
+2.44.0
+
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
new file mode 100644
index 00000000000..036a0b49453
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -0,0 +1,42 @@
+From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 6 Feb 2024 09:47:10 +0100
+Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
+
+Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
+added an automatic zink fallback even when the zink gallium is not
+enabled at build time.
+
+It leads to unexpected error log while loading drisw driver and
+zink is not installed on the rootfs:
+
+  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
+
+Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/glx/glxext.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/glx/glxext.c b/src/glx/glxext.c
+index 05c825a..7a06aa9 100644
+--- a/src/glx/glxext.c
++++ b/src/glx/glxext.c
+@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
+ #endif /* HAVE_DRI3 */
+       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
+          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
++#if defined(HAVE_ZINK)
+       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
+          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
+                     !getenv("GALLIUM_DRIVER");
++#endif /* HAVE_ZINK */
+    }
+ #endif /* GLX_USE_DRM */
+    if (glx_direct)
+-- 
+2.44.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cdac01d3aa6..e5fa0a76d2b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
+           file://0001-drisw-fix-build-without-dri3.patch \
+           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
 "
 
 SRC_URI[sha256sum] = "f387192b08c471c545590dd12230a2a343244804b5fe866fec6aea02eab57613"
-- 
2.44.0


