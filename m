Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D84A26FEF3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 26 Nov 2015 06:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574791"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:24 +0200
Message-Id: <ca32a85785afd83fad29c2a4bf61aa98f44ffb27.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/29] gstreamer: enable gobject introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:20 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...on.m4-prefix-pkgconfig-paths-with-PKG_CON.patch |  44 +++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   2 +-
 .../gstreamer/gst-plugins-package.inc              |   1 +
 ...-don-t-hardcode-libtool-name-when-running.patch |  57 ++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb    |   4 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   4 +
 ...-don-t-hardcode-libtool-name-when-running.patch | 168 ++++++++++++
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 298 +++++++++++++++++++++
 ...ssing-include-directories-when-calling-in.patch |  28 ++
 ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  27 ++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.1.bb   |  12 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |  12 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  13 +-
 ...ode-libtool-name-when-using-introspection.patch |  27 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  12 +-
 .../gstreamer/gstreamer1.0_1.6.1.bb                |  10 +-
 16 files changed, 703 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
new file mode 100644
index 0000000..94b5bf6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
@@ -0,0 +1,44 @@
+From 90916f96262fa7b27a0a99788c69f9fd6df11000 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 24 Nov 2015 16:46:27 +0200
+Subject: [PATCH] introspection.m4: prefix pkgconfig paths with
+ PKG_CONFIG_SYSROOT_DIR
+
+We can't use our tweaked introspection.m4 from gobject-introspection tarball
+because gstreamer also defines INTROSPECTION_INIT in its introspection.m4, which
+is later supplied to g-ir-scanner.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ common/m4/introspection.m4 | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/common/m4/introspection.m4 b/common/m4/introspection.m4
+index 162be57..217a6ae 100644
+--- a/common/m4/introspection.m4
++++ b/common/m4/introspection.m4
+@@ -54,14 +54,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
+     INTROSPECTION_GIRDIR=
+     INTROSPECTION_TYPELIBDIR=
+     if test "x$found_introspection" = "xyes"; then
+-       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+-       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+-       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
++       INTROSPECTION_GIRDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
++       INTROSPECTION_TYPELIBDIR=$PKG_CONFIG_SYSROOT_DIR"$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
+        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+        INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
++       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+        INTROSPECTION_INIT="extern void gst_init(gint*,gchar**); gst_init(NULL,NULL);"
+     fi
+     AC_SUBST(INTROSPECTION_SCANNER)
+-- 
+2.6.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 9850242..418324a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -16,7 +16,7 @@ SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gtk-doc lib_package pkgconfig distro_features_check
+inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobject-introspection
 
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index cb1be06..cabf56f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -8,6 +8,7 @@ python split_gstreamer10_packages () {
 
     do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
     do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
+    do_split_packages(d, glibdir+'/girepository-1.0', 'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'), 'GStreamer typelib file for %s', postinst=postinst, extra_depends='')
     do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
     do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
 }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
new file mode 100644
index 0000000..154d340
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -0,0 +1,57 @@
+From cff6fbf555a072408c21da1e818209c9d3814dd3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Oct 2015 14:36:58 +0200
+Subject: [PATCH] Makefile.am: don't hardcode libtool name when running
+ introspection tools
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ gst-libs/gst/gl/Makefile.am        | 2 +-
+ gst-libs/gst/insertbin/Makefile.am | 2 +-
+ gst-libs/gst/mpegts/Makefile.am    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
+index f968357..7cc2c7a 100644
+--- a/gst-libs/gst/gl/Makefile.am
++++ b/gst-libs/gst/gl/Makefile.am
+@@ -149,7 +149,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
+ 		--library=libgstgl-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg gstreamer-video-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/insertbin/Makefile.am b/gst-libs/gst/insertbin/Makefile.am
+index 09eb97c..b746885 100644
+--- a/gst-libs/gst/insertbin/Makefile.am
++++ b/gst-libs/gst/insertbin/Makefile.am
+@@ -43,7 +43,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstinsertbin-@GS
+ 		--library=libgstinsertbin-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-insertbin-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/mpegts/Makefile.am b/gst-libs/gst/mpegts/Makefile.am
+index 2511d49..c1cbce6 100644
+--- a/gst-libs/gst/mpegts/Makefile.am
++++ b/gst-libs/gst/mpegts/Makefile.am
+@@ -78,7 +78,7 @@ GstMpegts-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstmpegts-@GST_API_
+ 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
+ 		--library=libgstmpegts-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-video-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-mpegts-@GST_API_VERSION@ \
+-- 
+2.6.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb
index eeb4771..e5df5a5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.1.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
 
-SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch"
+SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
+           file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
+           "
 
 SRC_URI[md5sum] = "c92d7d32de68e7293712bf9b6c99dc77"
 SRC_URI[sha256sum] = "e176a9af125f6874b3d6724aa7566a198fa225d3ece0a7ac2f2b51c57e525466"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 2135ae1..3e903d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -39,3 +39,7 @@ EXTRA_OECONF += " \
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
 CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs"
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
new file mode 100644
index 0000000..781e4d8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -0,0 +1,168 @@
+From f1d9652351e7754c63003104eceb526af424c7e0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Nov 2015 16:53:04 +0200
+Subject: [PATCH 1/4] Makefile.am: don't hardcode libtool name when running
+ introspection tools
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gst-libs/gst/allocators/Makefile.am | 2 +-
+ gst-libs/gst/app/Makefile.am        | 2 +-
+ gst-libs/gst/audio/Makefile.am      | 2 +-
+ gst-libs/gst/fft/Makefile.am        | 2 +-
+ gst-libs/gst/pbutils/Makefile.am    | 2 +-
+ gst-libs/gst/riff/Makefile.am       | 2 +-
+ gst-libs/gst/rtp/Makefile.am        | 2 +-
+ gst-libs/gst/rtsp/Makefile.am       | 2 +-
+ gst-libs/gst/sdp/Makefile.am        | 2 +-
+ gst-libs/gst/tag/Makefile.am        | 2 +-
+ gst-libs/gst/video/Makefile.am      | 2 +-
+ 11 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
+index 9361bf9..bc7f53a 100644
+--- a/gst-libs/gst/allocators/Makefile.am
++++ b/gst-libs/gst/allocators/Makefile.am
+@@ -37,7 +37,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
+ 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstallocators-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-allocators-@GST_API_VERSION@ \
+ 		--output $@ \
+diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
+index 6d6de8d..dcc2fe0 100644
+--- a/gst-libs/gst/app/Makefile.am
++++ b/gst-libs/gst/app/Makefile.am
+@@ -52,7 +52,7 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
+ 		--library=libgstapp-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-app-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
+index 275d222..2374196 100644
+--- a/gst-libs/gst/audio/Makefile.am
++++ b/gst-libs/gst/audio/Makefile.am
+@@ -106,7 +106,7 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+ 		--include=GstTag-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-audio-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
+index 09b3d68..f545354 100644
+--- a/gst-libs/gst/fft/Makefile.am
++++ b/gst-libs/gst/fft/Makefile.am
+@@ -64,7 +64,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
+ 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstfft-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-fft-@GST_API_VERSION@ \
+ 		--output $@ \
+diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
+index 64d5eb0..91dc214 100644
+--- a/gst-libs/gst/pbutils/Makefile.am
++++ b/gst-libs/gst/pbutils/Makefile.am
+@@ -94,7 +94,7 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
+ 		--include=GstTag-@GST_API_VERSION@ \
+ 		--include=GstVideo-@GST_API_VERSION@ \
+ 		--include=GstAudio-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-tag-@GST_API_VERSION@ \
+ 		--pkg gstreamer-video-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.am
+index 83d83cb..3bd8fc0 100644
+--- a/gst-libs/gst/riff/Makefile.am
++++ b/gst-libs/gst/riff/Makefile.am
+@@ -47,7 +47,7 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
+ #		--include=GstAudio-@GST_API_VERSION@ \
+ #		--include=GstTag-@GST_API_VERSION@ \
+ #		--include=Gst-@GST_API_VERSION@ \
+-#		--libtool="$(top_builddir)/libtool" \
++#		--libtool="$(LIBTOOL)" \
+ #		--pkg gstreamer-@GST_API_VERSION@ \
+ #		--pkg gstreamer-tag-@GST_API_VERSION@ \
+ #		--pkg gstreamer-audio-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
+index fdd01c1..f5445c1 100644
+--- a/gst-libs/gst/rtp/Makefile.am
++++ b/gst-libs/gst/rtp/Makefile.am
+@@ -64,7 +64,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
+ 		--library=libgstrtp-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-rtp-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
+index ede5706..9b0b258 100644
+--- a/gst-libs/gst/rtsp/Makefile.am
++++ b/gst-libs/gst/rtsp/Makefile.am
+@@ -71,7 +71,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+ 		--include=Gio-2.0 \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstSdp-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gio-2.0 \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-sdp-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
+index a90f30b..0e149b8 100644
+--- a/gst-libs/gst/sdp/Makefile.am
++++ b/gst-libs/gst/sdp/Makefile.am
+@@ -31,7 +31,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
+ 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstsdp-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-sdp-@GST_API_VERSION@ \
+ 		--output $@ \
+diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
+index c534a4d..cafafd3 100644
+--- a/gst-libs/gst/tag/Makefile.am
++++ b/gst-libs/gst/tag/Makefile.am
+@@ -44,7 +44,7 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
+ 		--library=libgsttag-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-tag-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
+index 5d31fa1..ac64eb3 100644
+--- a/gst-libs/gst/video/Makefile.am
++++ b/gst-libs/gst/video/Makefile.am
+@@ -113,7 +113,7 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
+ 		--library=libgstvideo-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-video-@GST_API_VERSION@ \
+-- 
+2.6.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
new file mode 100644
index 0000000..85fcacb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
@@ -0,0 +1,298 @@
+From 990b653c7b6de1937ec759019982d6c5f15770f7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 26 Oct 2015 16:38:18 +0200
+Subject: [PATCH 2/4] Makefile.am: prefix calls to pkg-config with
+ PKG_CONFIG_SYSROOT_DIR
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gst-libs/gst/allocators/Makefile.am |  4 ++--
+ gst-libs/gst/app/Makefile.am        |  4 ++--
+ gst-libs/gst/audio/Makefile.am      | 12 ++++++------
+ gst-libs/gst/fft/Makefile.am        |  4 ++--
+ gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
+ gst-libs/gst/riff/Makefile.am       |  8 ++++----
+ gst-libs/gst/rtp/Makefile.am        |  8 ++++----
+ gst-libs/gst/rtsp/Makefile.am       |  4 ++--
+ gst-libs/gst/sdp/Makefile.am        |  4 ++--
+ gst-libs/gst/tag/Makefile.am        |  8 ++++----
+ gst-libs/gst/video/Makefile.am      |  8 ++++----
+ 11 files changed, 38 insertions(+), 38 deletions(-)
+
+diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
+index bc7f53a..0ef5f86 100644
+--- a/gst-libs/gst/allocators/Makefile.am
++++ b/gst-libs/gst/allocators/Makefile.am
+@@ -34,7 +34,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
+ 		--c-include "gst/allocators/allocators.h" \
+ 		-I$(top_srcdir)/gst-libs \
+ 		-I$(top_builddir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstallocators-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--libtool="$(LIBTOOL)" \
+@@ -58,7 +58,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
+index dcc2fe0..dc076cb 100644
+--- a/gst-libs/gst/app/Makefile.am
++++ b/gst-libs/gst/app/Makefile.am
+@@ -47,8 +47,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
+ 		--c-include "gst/app/app.h" \
+ 		-I$(top_srcdir)/gst-libs \
+ 		-I$(top_builddir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library=libgstapp-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
+index 2374196..295eb42 100644
+--- a/gst-libs/gst/audio/Makefile.am
++++ b/gst-libs/gst/audio/Makefile.am
+@@ -96,12 +96,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
+ 		-I$(top_srcdir)/gst-libs \
+ 		-I$(top_builddir)/gst-libs \
+ 		--c-include "gst/audio/audio.h" \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--add-include-path="$(top_builddir)/gst-libs/gst/tag/" \
+ 		--library=libgstaudio-@GST_API_VERSION@.la \
+-		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
+-		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
++		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
++		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+@@ -130,8 +130,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+ 		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
+index f545354..1bb6243 100644
+--- a/gst-libs/gst/fft/Makefile.am
++++ b/gst-libs/gst/fft/Makefile.am
+@@ -61,7 +61,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
+ 		--c-include "gst/fft/fft.h" \
+ 		-I$(top_srcdir)/gst-libs \
+ 		-I$(top_builddir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstfft-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--libtool="$(LIBTOOL)" \
+@@ -85,7 +85,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
+index 91dc214..dc8e1d3 100644
+--- a/gst-libs/gst/pbutils/Makefile.am
++++ b/gst-libs/gst/pbutils/Makefile.am
+@@ -79,14 +79,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
+ 		--c-include "gst/pbutils/pbutils.h" \
+ 		-I$(top_srcdir)/gst-libs \
+ 		-I$(top_builddir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--add-include-path="$(top_builddir)/gst-libs/gst/tag/" \
+ 		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
+ 		--add-include-path="$(top_builddir)/gst-libs/gst/audio/" \
+ 		--library=libgstpbutils-@GST_API_VERSION@.la \
+-		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
+-		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
++		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
++		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
+ 		--library-path="$(top_builddir)/gst-libs/gst/video/" \
+ 		--library-path="$(top_builddir)/gst-libs/gst/audio/" \
+@@ -119,8 +119,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
+ 		--includedir="$(top_builddir)/gst-libs/gst/video/" \
+ 		--includedir="$(top_builddir)/gst-libs/gst/audio/" \
+diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.am
+index 3bd8fc0..0a115cc 100644
+--- a/gst-libs/gst/riff/Makefile.am
++++ b/gst-libs/gst/riff/Makefile.am
+@@ -41,8 +41,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
+ #		--c-include "gst/riff/riff.h" \
+ #		--add-include-path=$(builddir)/../tag \
+ #		--add-include-path=$(builddir)/../audio \
+-#		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-#		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++#		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++#		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ #		--library=libgstriff-@GST_API_VERSION@.la \
+ #		--include=GstAudio-@GST_API_VERSION@ \
+ #		--include=GstTag-@GST_API_VERSION@ \
+@@ -73,8 +73,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
+ #		--includedir=$(builddir) \
+ #		--includedir=$(builddir)/../tag \
+ #		--includedir=$(builddir)/../audio \
+-#		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-#		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++#		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++#		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ #		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ #
+ #CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
+index f5445c1..527c0b4 100644
+--- a/gst-libs/gst/rtp/Makefile.am
++++ b/gst-libs/gst/rtp/Makefile.am
+@@ -59,8 +59,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
+ 		--c-include "gst/rtp/rtp.h" \
+ 		-I$(top_builddir)/gst-libs \
+ 		-I$(top_srcdir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library=libgstrtp-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+@@ -87,8 +87,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
+index 9b0b258..4f6d9f8 100644
+--- a/gst-libs/gst/rtsp/Makefile.am
++++ b/gst-libs/gst/rtsp/Makefile.am
+@@ -66,7 +66,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+ 		-I$(top_builddir)/gst-libs \
+ 		-I$(top_srcdir)/gst-libs \
+ 		--add-include-path=$(builddir)/../sdp \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstrtsp-@GST_API_VERSION@.la \
+ 		--include=Gio-2.0 \
+ 		--include=Gst-@GST_API_VERSION@ \
+@@ -96,7 +96,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+ 		--includedir=$(builddir)/../sdp \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
+index 0e149b8..9aa0512 100644
+--- a/gst-libs/gst/sdp/Makefile.am
++++ b/gst-libs/gst/sdp/Makefile.am
+@@ -28,7 +28,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
+ 		--warn-all \
+ 		--c-include "gst/sdp/sdp.h" \
+ 		-I$(top_srcdir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstsdp-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--libtool="$(LIBTOOL)" \
+@@ -52,7 +52,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
+index cafafd3..ba99279 100644
+--- a/gst-libs/gst/tag/Makefile.am
++++ b/gst-libs/gst/tag/Makefile.am
+@@ -39,8 +39,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
+ 		--c-include "gst/tag/tag.h" \
+ 		-I$(top_srcdir)/gst-libs \
+ 		-I$(top_builddir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library=libgsttag-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+@@ -67,8 +67,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
+index ac64eb3..342c8c6 100644
+--- a/gst-libs/gst/video/Makefile.am
++++ b/gst-libs/gst/video/Makefile.am
+@@ -108,8 +108,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
+ 		--c-include "gst/video/video.h" \
+ 		-I$(top_srcdir)/gst-libs \
+ 		-I$(top_builddir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library=libgstvideo-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+@@ -136,8 +136,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
+-- 
+2.6.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
new file mode 100644
index 0000000..9b66f7f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
@@ -0,0 +1,28 @@
+From 3c2c2d5dd08aa30ed0e8acd8566ec99412bb8209 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 26 Oct 2015 17:29:37 +0200
+Subject: [PATCH 3/4] riff: add missing include directories when calling
+ introspection scanner
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gst-libs/gst/riff/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.am
+index 0a115cc..5057a58 100644
+--- a/gst-libs/gst/riff/Makefile.am
++++ b/gst-libs/gst/riff/Makefile.am
+@@ -39,6 +39,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
+ #		--strip-prefix=Gst \
+ #		--warn-all \
+ #		--c-include "gst/riff/riff.h" \
++#               -I$(top_srcdir)/gst-libs \
++#               -I$(top_builddir)/gst-libs \
+ #		--add-include-path=$(builddir)/../tag \
+ #		--add-include-path=$(builddir)/../audio \
+ #		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-- 
+2.6.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
new file mode 100644
index 0000000..42d99c1
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
@@ -0,0 +1,27 @@
+From 4330915d88dc4dd46eb4c28d756482b767c2747f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 26 Oct 2015 17:30:14 +0200
+Subject: [PATCH 4/4] rtsp: drop incorrect reference to gstreamer-sdp in
+ Makefile.am
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gst-libs/gst/rtsp/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
+index 4f6d9f8..0afa370 100644
+--- a/gst-libs/gst/rtsp/Makefile.am
++++ b/gst-libs/gst/rtsp/Makefile.am
+@@ -74,7 +74,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+ 		--libtool="$(LIBTOOL)" \
+ 		--pkg gio-2.0 \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+-		--pkg gstreamer-sdp-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-rtsp-@GST_API_VERSION@ \
+ 		--add-init-section="$(INTROSPECTION_INIT)" \
+ 		--output $@ \
+-- 
+2.6.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb
index d4f5d50..37a3af0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb
@@ -6,10 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                    "
 
 SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
-            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
-            file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
-            file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
-"
+           file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
+           file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
+           file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
+           file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
+           file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
+           file://0003-riff-add-missing-include-directories-when-calling-in.patch \
+           file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
+           "
 
 SRC_URI[md5sum] = "a89933afbe45d8f8c92d89c2f1199ecb"
 SRC_URI[sha256sum] = "9533dcfaa4ee32d435483d9fa88c06b1eba6e9bb234aacd7583f207199f44ba3"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index f1783b7..69315c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -4,7 +4,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 DEPENDS = "gstreamer1.0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gobject-introspection
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
 GSTREAMER_1_0_GIT_BRANCH ?= "master"
@@ -32,6 +32,8 @@ oe_runconf_prepend() {
 
 SRC_URI = "${@get_gst_srcuri(d)}"
 
+SRC_URI += " file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"
+
 def get_gst_srcuri(d):
     # check if expected prefix is present
     prefix = "gstreamer1.0-"
@@ -55,5 +57,11 @@ delete_liblink_m4_file() {
 	rm "${S}/m4/lib-link.m4" || true
 }
 
-do_configure[prefuncs] += " delete_liblink_m4_file "
+delete_pkg_m4_file() {
+	# This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
+	rm "${S}/common/m4/pkg.m4" || true
+}
+
+do_configure[prefuncs] += " delete_liblink_m4_file delete_pkg_m4_file"
+
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 28a9420..4423f40 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -6,9 +6,18 @@ DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+           file://0001-Don-t-hardcode-libtool-name-when-using-introspection.patch \
+           file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-inherit autotools pkgconfig 
+inherit autotools pkgconfig gobject-introspection
+
+delete_pkg_m4_file() {
+        # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
+        rm "${S}/common/m4/pkg.m4" || true
+}
+
+do_configure[prefuncs] += " delete_pkg_m4_file"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch
new file mode 100644
index 0000000..89d6384
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch
@@ -0,0 +1,27 @@
+From 4a12569e5ae5be63cd92a9b178860026a99746b1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Oct 2015 16:55:45 +0200
+Subject: [PATCH] Don't hardcode libtool name when using introspection
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gst/rtsp-server/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/rtsp-server/Makefile.am b/gst/rtsp-server/Makefile.am
+index 4fcd366..c67f5ab 100644
+--- a/gst/rtsp-server/Makefile.am
++++ b/gst/rtsp-server/Makefile.am
+@@ -87,7 +87,7 @@ GstRtspServer-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtspserver-@
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstRtsp-@GST_API_VERSION@ \
+ 		--include=GstNet-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-rtsp-@GST_API_VERSION@ \
+ 		--pkg gstreamer-net-@GST_API_VERSION@ \
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index aa95d57..98e44d3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -7,7 +7,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native libcap"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext gobject-introspection
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[check] = "--enable-check,--disable-check"
@@ -27,3 +27,13 @@ FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so ${datadir}/bash-completion/complet
 FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
 FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/ ${datadir}/bash-completion/helpers/.debug/"
 
+delete_pkg_m4_file() {
+        # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
+        rm "${S}/common/m4/pkg.m4" || true
+}
+
+do_configure[prefuncs] += " delete_pkg_m4_file"
+
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
index 9618eaf..f04a8e4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
@@ -3,11 +3,11 @@ include gstreamer1.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://0001-Fix-crash-with-gst-inspect.patch \
-    file://fix-install-hook.patch \
-"
+SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+           file://0001-Fix-crash-with-gst-inspect.patch \
+           file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+           file://fix-install-hook.patch \
+           "
 SRC_URI[md5sum] = "e72e2dc2ee06bfc045bb6010c89de520"
 SRC_URI[sha256sum] = "973a3f213c8d41d6dd0e4e7e38fd6cccacd5ae1ac09e1179a8d5d869ef0a5c9c"
 
-- 
2.6.2


