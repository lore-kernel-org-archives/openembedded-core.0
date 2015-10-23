Return-Path: <psidhu@gateworks.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id DBBC6759D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 21:03:43 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so133468645pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 14:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2Sq+CZNSuJOd6M0H8W7Y0QQeCi70IrjyRO6Nss4gimU=;
	b=L4J99iRKuFGQ6cLvwlPHFj7NCwilpS0fAFyK0RYF11R2oFq2jG5B1onjGewgnij0pn
	6epNA5uCWRbIWPMpI1b5z8zWp9CJoX460iHI3Nk+e4XeDiD+a/2ZJ7rAd4svTeQQRGRQ
	GQNNepuG6vx6tIpMPxgQRbHbNQbrMO6bbTqSYid2d0Y2si/T9a7Nsew/yAKuyZUQqGA7
	fxkVd4IV1YXxwNBcwVrfV103TWx/3+yR8a7/N83NqCeBL4lwYgATp7XvrKRp5Jg1Fd9z
	q6EQdXHIsV1+Ix9ilarvjqKDXiZOpmDWjv5bZwuEfUAmxevETUAPgRgU1QTf31EnFEO/
	NnIw==
X-Gm-Message-State: ALoCoQmThAB6elGQF1nlWl5NwnL24KeugUxD32pNOUpGi2owvVBl6O5KVclBPuG985SBVx8bgLmR
X-Received: by 10.68.213.198 with SMTP id nu6mr7201879pbc.96.1445634223735;
	Fri, 23 Oct 2015 14:03:43 -0700 (PDT)
Received: from psidhu.gw (68-189-91-139.static.snlo.ca.charter.com.
	[68.189.91.139]) by smtp.gmail.com with ESMTPSA id
	xm9sm20582234pbc.32.2015.10.23.14.03.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Oct 2015 14:03:42 -0700 (PDT)
From: Pushpal Sidhu <psidhu@gateworks.com>
To: ross.burton@intel.com
Date: Fri, 23 Oct 2015 14:03:21 -0700
Message-Id: <1445634201-13944-1-git-send-email-psidhu@gateworks.com>
X-Mailer: git-send-email 2.6.2
Cc: alexander.kanavin@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH v2] webkitgtk: Add upstream patch to fix build problem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Oct 2015 21:03:45 -0000

From Upstream webkit: fd15a368fa73fe08d91cc1dd7ef05c0c5a3ae851

Webkit will fail to compile under certain circumstances. Please see
https://bugs.webkit.org/show_bug.cgi?id=149172 for more details.

Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
---
Changes in v2:
 * Added Upstream-Status line
 * Added self Signed-off-by
 * Added description to problem solved

 ...ailure-with-ACCELERATED_2D_CANVAS-when-ca.patch | 35 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch

diff --git a/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch b/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
new file mode 100644
index 0000000..e95c0e4
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
@@ -0,0 +1,35 @@
+From 6ea42d4fa6f3f6dd18c37cb7b6e1faea6afefba4 Mon Sep 17 00:00:00 2001
+From: "clopez@igalia.com" <clopez@igalia.com>
+Date: Tue, 15 Sep 2015 21:50:18 +0000
+Subject: [PATCH] [GTK] Build failure with ACCELERATED_2D_CANVAS when cairo-gl has
+ built with OpenGLESv2 support only.
+
+When cairo-gl is built with GLX and ACCELERATED_2D_CANVAS if cairo-gl was only
+built with OpenGLESv2, cairo-glx is not enabled causing
+Source/WebCore/platform/graphics/glx/GLContextGLX.cpp to reference an undeclared
+function and cause a compliation error. Adding an extra check resolves this
+build failure.
+
+Upstream-Status: Backport [webkit-2.10.0]
+
+Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
+---
+ Source/WebCore/platform/graphics/glx/GLContextGLX.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp b/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
+index 7890d8d..4ed3a43 100644
+--- a/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
++++ b/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
+@@ -266,7 +266,7 @@ cairo_device_t* GLContextGLX::cairoDevice()
+     if (m_cairoDevice)
+         return m_cairoDevice;
+ 
+-#if ENABLE(ACCELERATED_2D_CANVAS)
++#if ENABLE(ACCELERATED_2D_CANVAS) && CAIRO_HAS_GLX_FUNCTIONS
+     m_cairoDevice = cairo_glx_device_create(sharedX11Display(), m_context);
+ #endif
+ 
+-- 
+2.6.2
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index e29666a..68634a9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
   file://0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch \
+  file://0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch \
   file://gcc5.patch \
   "
 SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
-- 
2.6.2


