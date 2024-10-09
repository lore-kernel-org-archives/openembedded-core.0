Return-Path: <purushottam27.kumar@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE16CED254
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 09:23:49 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.12002.1728465821953723828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 02:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: purushottam27.kumar@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.53 with ESMTP; 9 Oct 2024 18:23:39 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: purushottam27.kumar@lge.com
Received: from unknown (HELO si-rd24bld77.lge.net) (10.221.31.77)
	by 156.147.1.125 with ESMTP; 9 Oct 2024 18:23:39 +0900
X-Original-SENDERIP: 10.221.31.77
X-Original-MAILFROM: purushottam27.kumar@lge.com
From: Purushottam Choudhary <purushottam27.kumar@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Purushottam Choudhary <purushottam27.kumar@lge.com>
Subject: [master][scarthgap][PATCH] virglrenderer: Add patch to fix -int-conversion build issue
Date: Wed,  9 Oct 2024 14:53:24 +0530
Message-Id: <20241009092324.14465-1-purushottam27.kumar@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 09:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205343

Fix int conversion related error during compilation
as some of the platforms where EGLNativeDisplayType
is an int instead of a pointer with GCC-14.

Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
---
 ...nversion-fatal-build-error-with-GCC-.patch | 41 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.0.1.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
new file mode 100644
index 0000000000..9c49ee512a
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
@@ -0,0 +1,41 @@
+From 464deabe4d1bfce6b8f414ab0945d9a62b66ddd4 Mon Sep 17 00:00:00 2001
+From: Purushottam Choudhary <purushottam27.kumar@lge.com>
+Date: Tue, 8 Oct 2024 11:47:21 +0530
+Subject: [PATCH] vrend: Fix int-conversion fatal build error with GCC-14
+
+Getting below error int conversion during compilation as one the
+platforms where EGLNativeDisplayType is an int instead of a pointer.
+
+| ../git/src/vrend_winsys_egl.c: In function 'virgl_egl_init':
+| ../git/src/vrend_winsys_egl.c:364:62: error: passing argument 2 of 'egl->funcs.epoxy_eglGetPlatformDisplay' makes pointer from
+|   364 |                                                              (EGLNativeDisplayType)egl->gbm->device, NULL);
+|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|       |                                                              |
+|       |                                                              int
+| ../git/src/vrend_winsys_egl.c:364:62: note: expected 'void *' but argument is of type 'int'
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/464deabe4d1bfce6b8f414ab0945d9a62b66ddd4]
+
+Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
+Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1440>
+---
+
+ src/vrend_winsys_egl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/vrend_winsys_egl.c b/src/vrend_winsys_egl.c
+index 9d9f410c..8750f6b2 100644
+--- a/src/vrend_winsys_egl.c
++++ b/src/vrend_winsys_egl.c
+@@ -361,7 +361,7 @@ struct virgl_egl *virgl_egl_init(EGLNativeDisplayType display_id, bool surfacele
+ #ifdef ENABLE_GBM
+       else
+          egl->egl_display = egl->funcs.eglGetPlatformDisplay(EGL_PLATFORM_GBM_KHR,
+-                                                             (EGLNativeDisplayType)egl->gbm->device, NULL);
++                                                             (EGLNativeDisplayType*)egl->gbm->device, NULL);
+ #endif
+    } else {
+ #ifdef ENABLE_GBM
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
index 0501b0c59c..87f25a3461 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
@@ -12,6 +12,7 @@ DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
 SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
            "
 
 S = "${WORKDIR}/git"

