Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E48C27C4F
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 11:55:16 +0000 (UTC)
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
 by mx.groups.io with SMTP id smtpd.web11.9664.1717156513961747532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 04:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.171, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VrM4c3fbRz2n6;
	Fri, 31 May 2024 13:55:12 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4VrM4c0n37zsFc;
	Fri, 31 May 2024 13:55:12 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 31 May 2024 13:53:57 +0200
Subject: [PATCH 2/3] mesa: upgrade 24.0.7 -> 24.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-panthor-v1-2-1a76fd752c1b@cherry.de>
References: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
In-Reply-To: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, 
 openembedded-core@lists.openembedded.org
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 11:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200066

From: Quentin Schulz <quentin.schulz@cherry.de>

Changelog:
 https://docs.mesa3d.org/relnotes/24.1.0.html

0001-drisw-fix-build-without-dri3.patch was merged in
https://gitlab.freedesktop.org/mesa/mesa/-/commit/bdb59a3941c9dadfcbe1b9b6569f5c8a994e139f

0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch was merged in
https://gitlab.freedesktop.org/mesa/mesa/-/commit/d7b877598f1838c58c6367817e83832c230f7e0b

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../files/0001-drisw-fix-build-without-dri3.patch  | 58 ----------------------
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch | 42 ----------------
 .../mesa/{mesa-gl_24.0.7.bb => mesa-gl_24.1.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  4 +-
 .../mesa/{mesa_24.0.7.bb => mesa_24.1.0.bb}        |  0
 5 files changed, 1 insertion(+), 103 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
deleted file mode 100644
index ab16152090..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
-
-commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
-added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
-can be build without dri3.
-
-  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
-  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
-  collect2: error: ld returned 1 exit status
-
-Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
-dri3_check_multibuffer().
-
-Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/drisw_glx.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
---- a/src/glx/drisw_glx.c
-+++ b/src/glx/drisw_glx.c
-@@ -32,7 +32,9 @@
- #include <dlfcn.h>
- #include "dri_common.h"
- #include "drisw_priv.h"
-+#ifdef HAVE_DRI3
- #include "dri3_priv.h"
-+#endif
- #include <X11/extensions/shmproto.h>
- #include <assert.h>
- #include <vulkan/vulkan_core.h>
-@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-        goto handle_error;
-    }
- 
-+#ifdef HAVE_DRI3
-    if (pdpyp->zink) {
-       bool err;
-       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-          goto handle_error;
-       }
-    }
-+#endif
- 
-    glx_config_destroy_list(psc->base.configs);
-    psc->base.configs = configs;
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
deleted file mode 100644
index 036a0b4945..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
-
-Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
-added an automatic zink fallback even when the zink gallium is not
-enabled at build time.
-
-It leads to unexpected error log while loading drisw driver and
-zink is not installed on the rootfs:
-
-  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
-
-Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/glxext.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
---- a/src/glx/glxext.c
-+++ b/src/glx/glxext.c
-@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
- #endif /* HAVE_DRI3 */
-       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
-          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
-+#if defined(HAVE_ZINK)
-       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
-          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
-                     !getenv("GALLIUM_DRIVER");
-+#endif /* HAVE_ZINK */
-    }
- #endif /* GLX_USE_DRM */
-    if (glx_direct)
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb b/meta/recipes-graphics/mesa/mesa-gl_24.1.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.1.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2581ccb120..cb1c9b7b34 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -16,12 +16,10 @@ PE = "2"
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-drisw-fix-build-without-dri3.patch \
-           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
+SRC_URI[sha256sum] = "b7eac8c79244806b1c276eeeacc329e4a5b31a370804c4b0c7cd16837783f78b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.7.bb b/meta/recipes-graphics/mesa/mesa_24.1.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.7.bb
rename to meta/recipes-graphics/mesa/mesa_24.1.0.bb

-- 
2.45.1


