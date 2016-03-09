Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE706E681
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 09 Mar 2016 07:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083756"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:02:02 +0200
Message-Id: <4750da150cc62a70985b61b9b64169c4886a182d.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/24] gstreamer: enable gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:36 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...on.m4-prefix-pkgconfig-paths-with-PKG_CON.patch |  42 +++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   2 +-
 .../gstreamer/gst-plugins-package.inc              |   1 +
 ...-don-t-hardcode-libtool-name-when-running.patch |  57 ++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    |   1 +
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   4 +
 ...-don-t-hardcode-libtool-name-when-running.patch | 168 ++++++++++++
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 298 +++++++++++++++++++++
 ...ssing-include-directories-when-calling-in.patch |  28 ++
 ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  27 ++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.3.bb   |   4 +
 .../gstreamer/gstreamer1.0-plugins.inc             |  11 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  14 +-
 ...ode-libtool-name-when-using-introspection.patch |  27 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  13 +-
 .../gstreamer/gstreamer1.0_1.6.3.bb                |   1 +
 16 files changed, 693 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
new file mode 100644
index 0000000..2cab87f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
@@ -0,0 +1,42 @@
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
++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+        INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+        INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
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
index c6c8f36..8129169 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -15,7 +15,7 @@ SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gtk-doc lib_package pkgconfig distro_features_check
+inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobject-introspection
 
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 9ffbe7c..3cef1d3 100644
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
index 8eb47c2..323177b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://configure-allow-to-disable-libssh2.patch \
     file://0001-glimagesink-Downrank-to-marginal.patch \
     file://0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
+    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
 "
 
 SRC_URI[md5sum] = "4857adcafe41e4b9b8805cf88303bd55"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index f75efea..240ee5f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -35,3 +35,7 @@ EXTRA_OECONF += " \
 CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
 
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
index 429dc93..287d287 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
@@ -17,6 +17,10 @@ SRC_URI = " \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
     file://0005-convertframe-Support-video-crop-when-convert-frame.patch \
+    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
+    file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
+    file://0003-riff-add-missing-include-directories-when-calling-in.patch \
+    file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
 "
 
 SRC_URI[md5sum] = "3ddde0ad598ef69f58d6a2e87f8b460f"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 18ed6cf..128a1fe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 
 DEPENDS = "gstreamer1.0 glib-2.0-native"
 
-inherit autotools pkgconfig gettext upstream-version-is-even
+inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
@@ -28,4 +28,13 @@ EXTRA_OECONF = " \
     --disable-examples \
 "
 
+SRC_URI_append = " file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"
+
+delete_pkg_m4_file() {
+	# This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
+	rm "${S}/common/m4/pkg.m4" || true
+}
+
+do_configure[prefuncs] += " delete_pkg_m4_file"
+
 PACKAGES_DYNAMIC = "^${PN}-.*"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 608842a..ae6d364 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -7,8 +7,18 @@ DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+           file://0001-Don-t-hardcode-libtool-name-when-using-introspection.patch \
+           file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-inherit autotools pkgconfig upstream-version-is-even
+inherit autotools pkgconfig upstream-version-is-even gobject-introspection
+
+delete_pkg_m4_file() {
+        # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
+        rm "${S}/common/m4/pkg.m4" || true
+}
+
+do_configure[prefuncs] += " delete_pkg_m4_file"
+
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
index 5c212e6..e8f29ca 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2+"
 
 DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
 
-inherit autotools pkgconfig gettext upstream-version-is-even
+inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection
 
 PACKAGECONFIG ??= ""
 
@@ -37,3 +37,14 @@ FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadi
 
 RRECOMMENDS_${PN}_qemux86 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
 RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
index ba1b83b..a79f449 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
+    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
 
 SRC_URI[md5sum] = "b4cdeb2b9cb20dd6ac022a4f417eae0d"
-- 
2.7.0


