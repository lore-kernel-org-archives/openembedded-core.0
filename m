Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 50A14605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:11:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 05:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,349,1496127600"; d="scan'208";a="1171568148"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2017 05:11:48 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 11208580566;
	Wed, 12 Jul 2017 05:11:46 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, gizero@gmail.com,
	otavio@ossystems.com.br
Date: Wed, 12 Jul 2017 15:11:43 +0300
Message-Id: <4cddc1cd5182c742c1c6ceafcf122928b21a1a02.1499860838.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499860838.git.jussi.kukkonen@intel.com>
References: <cover.1499860838.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] mesa: Avoid installing khrplatfrom.h when not needed
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
X-List-Received-Date: Wed, 12 Jul 2017 12:11:55 -0000

Fix the conflict between mesa and userland (when former is used to
provide GL and letter used to provide EGL+GLES) by not installing
khrplatform.h header when its not needed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ly-install-khrplatform.h-with-EGL-or-GLES.patch | 52 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.1.4.bb          |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch b/meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
new file mode 100644
index 0000000..be61e2e
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
@@ -0,0 +1,52 @@
+From 922cb47a5b950ee5545a7a3cb4cd9a88a8b15054 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 12 Jul 2017 12:21:29 +0300
+Subject: [PATCH] mapi: Only install khrplatform.h with EGL or GLES
+
+When mesa is built with "--disable-egl --disable-gles1
+--disable-gles2" the KHR platform headers are not needed.
+
+Not installing the header when not needed allows using mesa for GL
+and another implementation for GLES+EGL (as is done in practice with
+userland on raspberrypi).
+
+Upstream-Status: Pending [waiting for test results before sending]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/mapi/Makefile.am | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/mapi/Makefile.am b/src/mapi/Makefile.am
+index 9ff70a14fd..94c77fb82c 100644
+--- a/src/mapi/Makefile.am
++++ b/src/mapi/Makefile.am
+@@ -188,6 +188,8 @@ es1api_libGLESv1_CM_la_LDFLAGS = \
+ 	$(LD_NO_UNDEFINED)
+ 
+ es1api_libGLESv1_CM_la_LIBADD += shared-glapi/libglapi.la
++
++khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
+ endif
+ 
+ es1api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $(glapi_gen_mapi_deps)
+@@ -233,6 +235,12 @@ es2api_libGLESv2_la_LDFLAGS = \
+ 	$(LD_NO_UNDEFINED)
+ 
+ es2api_libGLESv2_la_LIBADD += shared-glapi/libglapi.la
++
++khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
++endif
++
++if HAVE_EGL
++khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
+ endif
+ 
+ es2api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $(glapi_gen_mapi_deps)
+@@ -243,4 +251,3 @@ es2api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $(glapi_gen_mapi_deps)
+ include $(top_srcdir)/install-lib-links.mk
+ 
+ khrdir = $(includedir)/KHR
+-khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
+-- 
+2.13.2
+
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.4.bb b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
index 3289cd6..2257045 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
@@ -6,6 +6,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://etnaviv_fix-shader-miscompilation.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
            file://0002-hardware-gloat.patch \
+           file://0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch \
 "
 
 SRC_URI[md5sum] = "be2ef7c9edec23b07f74f6512a6a6fa5"
-- 
2.1.4


