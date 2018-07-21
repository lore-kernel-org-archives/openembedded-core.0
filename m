Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id F32BE78BC5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:24:07 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id ADF4916B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 11:24:08 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 11:24:01 +0200
Message-Id: <20180721092402.20271-5-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180721092402.20271-1-dv@pseudoterminal.org>
References: <20180721092402.20271-1-dv@pseudoterminal.org>
Subject: [PATCH v4 5/6] gstreamer1.0-vaapi: Add patch for EGL CFLAGS for proper EGL support
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
X-List-Received-Date: Sat, 21 Jul 2018 09:24:08 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...le.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch | 33 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.14.1.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch
new file mode 100644
index 0000000000..d7b8984953
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch
@@ -0,0 +1,33 @@
+From 5403a89e6a7ac72a23e0221075c0c19b5f85a021 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Wed, 13 Jun 2018 09:09:25 -0300
+Subject: [PATCH] gst/vaapi/Makefile.am: Add EGL_CFLAGS to libgstvaapi CFLAGS
+Organization: O.S. Systems Software LTDA.
+
+We need this to pass correctly EGL CFLAGS when building with EGL support.
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ gst/vaapi/Makefile.am | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gst/vaapi/Makefile.am b/gst/vaapi/Makefile.am
+index b299ac98..d6cab71f 100644
+--- a/gst/vaapi/Makefile.am
++++ b/gst/vaapi/Makefile.am
+@@ -24,6 +24,10 @@ libgstvaapi_LIBS += $(top_builddir)/gst-libs/gst/vaapi/libgstvaapi-glx.la
+ endif
+ 
+ if USE_EGL
++libgstvaapi_CFLAGS += \
++	$(EGL_CFLAGS)	\
++	$(NULL)
++
+ libgstvaapi_LIBS += $(top_builddir)/gst-libs/gst/vaapi/libgstvaapi-egl.la
+ endif
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
index e647458fab..63290326a5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.1.bb
@@ -9,6 +9,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
+           file://0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch \
           "
 
 SRC_URI[md5sum] = "38c5b2390797b7a0a269a5ab6c8cbe8f"
-- 
2.17.1


