Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0F372771A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917679"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:50:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:44 +0200
Message-Id: <3f64858239e0c5456317aedbd7a16acccc168c35.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/29] gstreamer: enable gobject introspection
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   2 +-
 .../gstreamer/gst-plugins-package.inc              |   1 +
 ...-don-t-hardcode-libtool-name-when-running.patch |  42 +++
 .../gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb    |   1 +
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   4 +
 ...-don-t-hardcode-libtool-name-when-running.patch | 168 ++++++++++++
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 298 +++++++++++++++++++++
 ...ssing-include-directories-when-calling-in.patch |  28 ++
 ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  27 ++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |   4 +
 .../gstreamer/gstreamer1.0-plugins.inc             |  10 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |   9 +-
 ...ode-libtool-name-when-using-introspection.patch |  27 ++
 .../gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb    |   2 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  12 +-
 15 files changed, 630 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch

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
index 0000000..10f0220
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -0,0 +1,42 @@
+From 2eb24d8cd90002c7c1bf202598fa9db29ca03450 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Oct 2015 14:36:58 +0200
+Subject: [PATCH] Makefile.am: don't hardcode libtool name when running
+ introspection tools
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gst-libs/gst/insertbin/Makefile.am | 2 +-
+ gst-libs/gst/mpegts/Makefile.am    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/gst/insertbin/Makefile.am b/gst-libs/gst/insertbin/Makefile.am
+index 6379a0b..315f034 100644
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
+index 0cee304..37caf0d 100644
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
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
index 6873669..bfa1377 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 SRC_URI += "file://0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch \
            file://0001-glimagesink-Downrank-to-marginal.patch \
+           file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
            "
 
 SRC_URI[md5sum] = "e0bb39412cf4a48fe0397bcf3a7cd451"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 47f3f40..13cd9d5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -37,3 +37,7 @@ EXTRA_OECONF += " \
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
 CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs"
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
new file mode 100644
index 0000000..ef602d1
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -0,0 +1,168 @@
+From 7e25c76b811b07a691b0eb90f5ad049087501d61 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 26 Oct 2015 16:34:07 +0200
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
+index c550ab0..f2b045e 100644
+--- a/gst-libs/gst/allocators/Makefile.am
++++ b/gst-libs/gst/allocators/Makefile.am
+@@ -35,7 +35,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
+ 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstallocators-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-allocators-@GST_API_VERSION@ \
+ 		--output $@ \
+diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
+index e89057a..512a1b8 100644
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
+index 0e67b9b..350f922 100644
+--- a/gst-libs/gst/audio/Makefile.am
++++ b/gst-libs/gst/audio/Makefile.am
+@@ -103,7 +103,7 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+ 		--include=GstTag-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-audio-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
+index 99c71ba..c1bdbda 100644
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
+index c0f0091..42ea274 100644
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
+index 974efd4..c7cb581 100644
+--- a/gst-libs/gst/riff/Makefile.am
++++ b/gst-libs/gst/riff/Makefile.am
+@@ -42,7 +42,7 @@ GstRiff-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstriff-@GST_API_VERS
+ 		--include=GstAudio-@GST_API_VERSION@ \
+ 		--include=GstTag-@GST_API_VERSION@ \
+ 		--include=Gst-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-tag-@GST_API_VERSION@ \
+ 		--pkg gstreamer-audio-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
+index 15126ff..24e77c8 100644
+--- a/gst-libs/gst/rtp/Makefile.am
++++ b/gst-libs/gst/rtp/Makefile.am
+@@ -44,7 +44,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
+ 		--library=libgstrtp-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-rtp-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
+index b6e1e9d..1120051 100644
+--- a/gst-libs/gst/rtsp/Makefile.am
++++ b/gst-libs/gst/rtsp/Makefile.am
+@@ -72,7 +72,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+ 		--include=Gio-2.0 \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstSdp-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gio-2.0 \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-sdp-@GST_API_VERSION@ \
+diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
+index e15fa93..53d1dbc 100644
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
+index 1883636..e6dd9ea 100644
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
+index 3932947..2fd5882 100644
+--- a/gst-libs/gst/video/Makefile.am
++++ b/gst-libs/gst/video/Makefile.am
+@@ -100,7 +100,7 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
+ 		--library=libgstvideo-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--include=GstBase-@GST_API_VERSION@ \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+ 		--pkg gstreamer-base-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-video-@GST_API_VERSION@ \
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
new file mode 100644
index 0000000..677c55a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
@@ -0,0 +1,298 @@
+From b616d1cad28e34dbcfa9ab43a5f7420ccf87b1bb Mon Sep 17 00:00:00 2001
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
+index f2b045e..24825d9 100644
+--- a/gst-libs/gst/allocators/Makefile.am
++++ b/gst-libs/gst/allocators/Makefile.am
+@@ -32,7 +32,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
+ 		--c-include "gst/allocators/allocators.h" \
+ 		-I$(top_srcdir)/gst-libs \
+ 		-I$(top_builddir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstallocators-@GST_API_VERSION@.la \
+ 		--include=Gst-@GST_API_VERSION@ \
+ 		--libtool="$(LIBTOOL)" \
+@@ -56,7 +56,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		$(INTROSPECTION_COMPILER) \
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
+index 512a1b8..91b2f0e 100644
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
+index 350f922..ac43b19 100644
+--- a/gst-libs/gst/audio/Makefile.am
++++ b/gst-libs/gst/audio/Makefile.am
+@@ -93,12 +93,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
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
+@@ -127,8 +127,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
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
+index c1bdbda..3527352 100644
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
+index 42ea274..54b3103 100644
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
+index c7cb581..009e86a 100644
+--- a/gst-libs/gst/riff/Makefile.am
++++ b/gst-libs/gst/riff/Makefile.am
+@@ -36,8 +36,8 @@ GstRiff-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstriff-@GST_API_VERS
+ 		--c-include "gst/riff/riff.h" \
+ 		--add-include-path=$(builddir)/../tag \
+ 		--add-include-path=$(builddir)/../audio \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library=libgstriff-@GST_API_VERSION@.la \
+ 		--include=GstAudio-@GST_API_VERSION@ \
+ 		--include=GstTag-@GST_API_VERSION@ \
+@@ -68,8 +68,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		--includedir=$(builddir) \
+ 		--includedir=$(builddir)/../tag \
+ 		--includedir=$(builddir)/../audio \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
+index 24e77c8..3c07a6f 100644
+--- a/gst-libs/gst/rtp/Makefile.am
++++ b/gst-libs/gst/rtp/Makefile.am
+@@ -39,8 +39,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
+ 		--warn-all \
+ 		--c-include "gst/rtp/rtp.h" \
+ 		-I$(top_srcdir)/gst-libs \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
+ 		--library=libgstrtp-@GST_API_VERSION@.la \
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
+diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
+index 1120051..274529a 100644
+--- a/gst-libs/gst/rtsp/Makefile.am
++++ b/gst-libs/gst/rtsp/Makefile.am
+@@ -67,7 +67,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+ 		-I$(top_builddir)/gst-libs \
+ 		-I$(top_srcdir)/gst-libs \
+ 		--add-include-path=$(builddir)/../sdp \
+-		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		--library=libgstrtsp-@GST_API_VERSION@.la \
+ 		--include=Gio-2.0 \
+ 		--include=Gst-@GST_API_VERSION@ \
+@@ -97,7 +97,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+ 		--includedir=$(srcdir) \
+ 		--includedir=$(builddir) \
+ 		--includedir=$(builddir)/../sdp \
+-		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
++		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+ 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
+ 
+ CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
+diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
+index 53d1dbc..31a7768 100644
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
+index e6dd9ea..e7fe84e 100644
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
+index 2fd5882..b7fb599 100644
+--- a/gst-libs/gst/video/Makefile.am
++++ b/gst-libs/gst/video/Makefile.am
+@@ -95,8 +95,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
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
+@@ -123,8 +123,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
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
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
new file mode 100644
index 0000000..cb4e688
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
@@ -0,0 +1,28 @@
+From 08871a79a46685fbf3555987330ff80ba74885b1 Mon Sep 17 00:00:00 2001
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
+index 009e86a..ba40f87 100644
+--- a/gst-libs/gst/riff/Makefile.am
++++ b/gst-libs/gst/riff/Makefile.am
+@@ -34,6 +34,8 @@ GstRiff-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstriff-@GST_API_VERS
+ 		--strip-prefix=Gst \
+ 		--warn-all \
+ 		--c-include "gst/riff/riff.h" \
++                -I$(top_srcdir)/gst-libs \
++                -I$(top_builddir)/gst-libs \
+ 		--add-include-path=$(builddir)/../tag \
+ 		--add-include-path=$(builddir)/../audio \
+ 		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
new file mode 100644
index 0000000..6cf280b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
@@ -0,0 +1,27 @@
+From 485294933e166c053903db524a03b3d1eed73e44 Mon Sep 17 00:00:00 2001
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
+index 274529a..e2fb948 100644
+--- a/gst-libs/gst/rtsp/Makefile.am
++++ b/gst-libs/gst/rtsp/Makefile.am
+@@ -75,7 +75,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+ 		--libtool="$(LIBTOOL)" \
+ 		--pkg gio-2.0 \
+ 		--pkg gstreamer-@GST_API_VERSION@ \
+-		--pkg gstreamer-sdp-@GST_API_VERSION@ \
+ 		--pkg-export gstreamer-rtsp-@GST_API_VERSION@ \
+ 		--add-init-section="gst_init(NULL,NULL);" \
+ 		--output $@ \
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index b09c2cb..e996123 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -22,6 +22,10 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
             file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
+            file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
+            file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
+            file://0003-riff-add-missing-include-directories-when-calling-in.patch \
+            file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index f1783b7..7f2a063 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -4,7 +4,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 DEPENDS = "gstreamer1.0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gobject-introspection
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
 GSTREAMER_1_0_GIT_BRANCH ?= "master"
@@ -55,5 +55,11 @@ delete_liblink_m4_file() {
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
index 28a9420..ebdfe20 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -10,5 +10,12 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
 
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
index bb9b42b..4af7075 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.4.5.bb
@@ -2,5 +2,7 @@ include gstreamer1.0-rtsp-server.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
+SRC_URI += "file://0001-Don-t-hardcode-libtool-name-when-using-introspection.patch"
+
 SRC_URI[md5sum] = "a9f9b8899ec7ab33663cda7627db40d3"
 SRC_URI[sha256sum] = "3089254bd31b7c1f1cf2c034a3b3551f92878f9e3cab65cef3a901a04c0f1d37"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index be8aa8f..d75cbde 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -7,7 +7,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext gobject-introspection
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[check] = "--enable-check,--disable-check"
@@ -27,3 +27,13 @@ FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a"
 FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/"
 
+delete_pkg_m4_file() {
+        # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
+        rm "${S}/common/m4/pkg.m4" || true
+}
+
+do_configure[prefuncs] += " delete_pkg_m4_file"
+
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs"
+}
-- 
2.1.4


