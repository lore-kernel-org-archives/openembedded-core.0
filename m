Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 09A7378694
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:12:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 05:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="8439265"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 Jan 2018 05:12:43 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 15:12:33 +0200
Message-Id: <20180104131238.21452-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/9] libepoxy: convert to meson build
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
X-List-Received-Date: Thu, 04 Jan 2018 13:12:43 -0000

Add a patch to work around absence of dlvsym() on musl
(wasn't previously a problem as autotools weren't building tests by default)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...sible-to-disable-the-use-of-dlvsym-needed.patch | 55 ++++++++++++++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb   | 12 +++--
 2 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
new file mode 100644
index 00000000000..c2a2fa34535
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
@@ -0,0 +1,55 @@
+From 7bcefd311cd696955376fe2c5298ec85e8f954ce Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 15 Nov 2017 12:48:27 +0200
+Subject: [PATCH] Make it possible to disable the use of dlvsym() (needed for
+ musl)
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ meson_options.txt | 3 +++
+ test/meson.build  | 6 +++---
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 244476a..071f0b6 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,6 +1,9 @@
+ option('enable-docs',
+        type: 'boolean', value: false,
+        description: 'Enable generating the Epoxy API reference (depends on Doxygen)')
++option('has-dlvsym',
++       type: 'boolean', value: true,
++       description: 'Whether dlvsym() is available (it is not when using musl C library)')
+ option('enable-glx',
+        type: 'combo',
+        choices: [ 'auto', 'yes', 'no' ],
+diff --git a/test/meson.build b/test/meson.build
+index 2340fc6..bc4330b 100644
+--- a/test/meson.build
++++ b/test/meson.build
+@@ -86,8 +86,8 @@ if build_glx
+     [ 'glx_has_extension_nocontext', [ 'glx_has_extension_nocontext.c' ], [], [], true ],
+     [ 'glx_static', [ 'glx_static.c' ], [ '-DNEEDS_TO_BE_STATIC'], [ '-static' ], libtype == 'static' ],
+     [ 'glx_shared_znow', [ 'glx_static.c', ], [], [ '-Wl,-z,now' ], has_znow ],
+-    [ 'glx_alias_prefer_same_name', [ 'glx_alias_prefer_same_name.c', 'dlwrap.c', 'dlwrap.h' ], [], [ '-rdynamic' ], not build_apple ],
+-    [ 'glx_gles2', [ 'glx_gles2.c', 'dlwrap.c', 'dlwrap.h' ], [], [ '-rdynamic' ], not build_apple ],
++    [ 'glx_alias_prefer_same_name', [ 'glx_alias_prefer_same_name.c', 'dlwrap.c', 'dlwrap.h' ], [], [ '-rdynamic' ], not build_apple and get_option('has-dlvsym') == true ],
++    [ 'glx_gles2', [ 'glx_gles2.c', 'dlwrap.c', 'dlwrap.h' ], [], [ '-rdynamic' ], not build_apple and get_option('has-dlvsym') == true ],
+   ]
+ 
+   foreach test: glx_tests
+@@ -108,7 +108,7 @@ if build_glx
+     endif
+   endforeach
+ 
+-  if not build_apple
++  if not build_apple and get_option('has-dlvsym') == true
+     # GLX/EGL tests
+     if build_egl
+       glx_egl_sources = [
+-- 
+2.15.0
+
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
index 0172322b92d..72167a2fb8c 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
@@ -6,17 +6,21 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://Add-fallback-definition-for-EGL-CAST.patch"
+           file://Add-fallback-definition-for-EGL-CAST.patch \
+           file://0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch \
+           "
 SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
 SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
-inherit autotools pkgconfig distro_features_check
+inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "util-macros"
 
-PACKAGECONFIG[egl] = "--enable-egl, --disable-egl, virtual/egl"
-PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
+PACKAGECONFIG[egl] = "-Denable-egl=yes, -Denable-egl=no, virtual/egl"
+PACKAGECONFIG[x11] = "-Denable-glx=yes, -Denable-glx=no, virtual/libx11"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
+
+EXTRA_OEMESON_append_libc-musl = " -Dhas-dlvsym=false "
-- 
2.15.1


