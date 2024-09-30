Return-Path: <purushottam27.kumar@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B60BCF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:31:58 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.49196.1727681515319225524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: purushottam27.kumar@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 30 Sep 2024 16:31:52 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: purushottam27.kumar@lge.com
Received: from unknown (HELO si-rd24bld77.lge.net) (10.221.31.77)
	by 156.147.1.125 with ESMTP; 30 Sep 2024 16:31:52 +0900
X-Original-SENDERIP: 10.221.31.77
X-Original-MAILFROM: purushottam27.kumar@lge.com
From: Purushottam Choudhary <purushottam27.kumar@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Purushottam Choudhary <purushottam27.kumar@lge.com>
Subject: [meta-oe][kirkstone][PATCHv2] kmscube: Add patch to fix -int-conversion build error
Date: Mon, 30 Sep 2024 13:01:49 +0530
Message-Id: <20240930073149.3209357-1-purushottam27.kumar@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 07:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205096

On some platforms, `EGLNativeDisplayType` is an int instead of
a pointer, in which case the void pointer will raise
a `-Wint-conversion`.

Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
---
 ...001-common-fix-cast-type-in-init_egl.patch | 34 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  6 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch b/meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch
new file mode 100644
index 0000000000..50df211d60
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch
@@ -0,0 +1,34 @@
+From b2f97f53e01e07a920761e5d3e3ba22898b794a4 Mon Sep 17 00:00:00 2001
+From: Eric Engestrom <eric@igalia.com>
+Date: Tue, 24 Sep 2024 17:57:45 +0200
+Subject: [PATCH] common: fix cast type in init_egl()
+
+On some platforms, `EGLNativeDisplayType` is an int instead of
+a pointer, in which case the void pointer will raise
+a `-Wint-conversion`.
+
+Let's cast it to the correct type directly.
+
+Closes: https://gitlab.freedesktop.org/mesa/kmscube/-/issues/16
+        https://gitlab.freedesktop.org/mesa/kmscube/-/merge_requests/57
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/kmscube/-/commit/b2f97f53e01e07a920761e5d3e3ba22898b794a4]
+
+Signed-off-by: Purushottam Choudhary <Purushottam27.kumar@lge.com>
+---
+ common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common.c b/common.c
+index e52d480..e1e2dcf 100644
+--- a/common.c
++++ b/common.c
+@@ -341,7 +341,7 @@ int init_egl(struct egl *egl, const struct gbm *gbm, int samples)
+ 		egl->display = egl->eglGetPlatformDisplayEXT(EGL_PLATFORM_GBM_KHR,
+ 				gbm->dev, NULL);
+ 	} else {
+-		egl->display = eglGetDisplay((void *)gbm->dev);
++		egl->display = eglGetDisplay((EGLNativeDisplayType)gbm->dev);
+ 	}
+ 
+ 	if (!eglInitialize(egl->display, &major, &minor)) {
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 98f110527e..40c5a14492 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -11,8 +11,10 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
 SRCREV = "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
-SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
-SRC_URI += "file://0001-texturator-Use-correct-GL-extension-header.patch"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
+           file://0001-texturator-Use-correct-GL-extension-header.patch \
+           file://0001-common-fix-cast-type-in-init_egl.patch \
+"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"

