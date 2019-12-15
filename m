Return-Path: <crg7475@mailbox.org>
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	by mail.openembedded.org (Postfix) with ESMTP id B73707F815
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 12:54:37 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47bPP557X6zQlBW
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1576414165; bh=VBTk2UfKQqMOUso
	8TERiJ60KRthWWXnjigA/ajFrZ6k=; b=c4d2K3ihAM+MWVryIrqKYsYjoPJK1Wd
	EB9Hb1mJ9l2+mqT9cLdAs2GQ7LQHcM6Nv04K5+6E7FyN3Upk3hROckEd0jNDBXrn
	VwiV0R10i2UtYGnMQf+3uJ1w9eohqf6OnGO+pFlWlronYW/+yil0exe8clXWewKo
	PO+zSwNtPk1cojVsHchYOtfUsiPIyd++iJDonmjIHUPviR5OK/QNClioUcWzfv+7
	J8U8JMvcp3JK6P4x5MuBQBawr+4tff+lGO0fKtARbuc2Kuj+ZfVl4eX+1CFXKPpF
	Sk4lDMCvj0spW6nK40M/r41bH0Bw24O/3ivz7aXz2DarlHYGXSE/3Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1576414169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=sa4UfQf0xAHQavGlM8gPGu/kLFA54+sHyETM22BlVbg=;
	b=kVofuYRhxybKCMUWlfy7bdGW3S++tIPwqvFuGbBvAXvsf2fBw3bE6JFuNG3CCWkLA+aIGp
	JLz60J8E1f+W14nEtk+OW/qXl4Ma8aeMC2UF+woeQcspLmGy41RBDzW9iDcMU2NI/5UlRd
	E+6fWYIdPocNSh9/7j8fNf/ZvtYv1NX/ErXGUpRbRi4o5ih12FIx3RCHcJDOiD0qCLYkU8
	U1ZdgSg/zHIk5+kbQVc7byH5Cqi2X3ByGeK8fI/jk3uut07dyIcxRAUMSQRb2xW2qqufH9
	wPswfADB6f0Je+wSQfXO4Lf9c3/ffMkcGAa6QbVbYSO5pMF0fSQHY1zJzsTJ+A==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id K-xV9tAucITT
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:25 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 13:49:01 +0100
Message-Id: <20191215124910.24946-3-crg7475@mailbox.org>
In-Reply-To: <20191215124910.24946-1-crg7475@mailbox.org>
References: <20191215124910.24946-1-crg7475@mailbox.org>
Subject: [WIP][PATCH 03/12] gstreamer1.0-plugins-base: Transition to meson based builds
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
X-List-Received-Date: Sun, 15 Dec 2019 12:54:39 -0000

* OpenGL packageconfigs now work differently. There are separate ones for
  OpenGL API/platform/window system selection. The meson.build script
  expects the selected ones as comma separated lists. For example, like
  "-Dgl_api=opengl,gles2". The variables OPENGL_APIS / OPENGL_PLATFORMS /
  OPENGL_WINSYS are whitespace-separated lists (which is the OE norm) of
  the respective packageconfigs. .bbappend files can then extend these
  lists with additional possible configs.
  "Possible" means that the target can support those packageconfigs. This
  does not immediately add them to the PACKAGECONFIG variable - this still
  has to be done manually. The get_opengl_cmdline_list() goes through these
  lists, and for each entry, checks if it is contained in the PACKAGECONFIG
  variable. If so, they get added to the comma separated lists that are
  passed to meson.
  For example, a Raspberry Pi layer could add "dispmanx" to OPENGL_WINSYS.

* The "ivorbis" packageconfig got renamed to "tremor", since that is the
  name of the OE recipe, and now also the name of the meson option.

* 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch and
  0002-meson-Add-variables-for-gir-files.patch are backported fixes for
  GIR support in the meson.build files.

* make-gio_unix_2_0-dependency-configurable.patch removed because it is
  no longer useful to have.

* link-with-libvchostif.patch removed because the flags it changed are
  no longer present in the meson.build scripts. If the related issue
  reappears, a similar patch can be applied again.

* 0003-riff-add-missing-include-directories-when-calling-in.patch removed
  since the entire gst riff library has been excluded from GObject
  introspection due to naming convention issues.

* Removed a number of autotool/M4 related patches and recipe lines.

* gtk-doc support is handled here, not in gstreamer1.0-plugins-common.inc,
  since unlike with autotools, only some plugin set packages use gtk-doc.

* zlib is no longer optional, and glib anyway depends on zlib, therefore
  it gets added to the DEPENDS list.

* gettext handling now part of gstreamer1.0-plugins-common.inc.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ....in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  29 --
 ...even-when-cross-compiling-if-introsp.patch |  36 +++
 ...ix-calls-to-pkg-config-with-PKG_CONF.patch | 295 ------------------
 ...02-meson-Add-variables-for-gir-files.patch | 235 ++++++++++++++
 ...-include-directories-when-calling-in.patch |  26 --
 ...ect-reference-to-gstreamer-sdp-in-Ma.patch |  25 --
 .../link-with-libvchostif.patch               |  45 ---
 ...gio_unix_2_0-dependency-configurable.patch |  45 ---
 .../gstreamer1.0-plugins-base_1.16.1.bb       |  95 +++---
 9 files changed, 329 insertions(+), 502 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
deleted file mode 100644
index 251dc172cb..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 61a672e79c8cb1aeeeda4c968997c577ac73a8f3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 12 May 2017 16:47:12 +0300
-Subject: [PATCH] gstreamer-gl.pc.in: don't append GL_CFLAGS to CFLAGS
-
-Dependencies' include directories should not be added in this way;
-it causes problems when cross-compiling in sysroot environments.
-
-Upstream-Status: Pending
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- pkgconfig/gstreamer-gl.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pkgconfig/gstreamer-gl.pc.in b/pkgconfig/gstreamer-gl.pc.in
-index dc672a9..8c290ba 100644
---- a/pkgconfig/gstreamer-gl.pc.in
-+++ b/pkgconfig/gstreamer-gl.pc.in
-@@ -13,4 +13,4 @@ Version: @VERSION@
- Requires: gstreamer-video-@GST_API_VERSION@ gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
- 
- Libs: -L${libdir} -lgstgl-@GST_API_VERSION@
--Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include @GL_CFLAGS@
-+Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
new file mode 100644
index 0000000000..49ab471414
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
@@ -0,0 +1,36 @@
+From 30672ba7d134553e59935ddc875104adba26f25c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
+Date: Thu, 17 Oct 2019 20:06:24 +0100
+Subject: [PATCH] meson: build gir even when cross-compiling if introspection
+ was enabled explicitly
+
+This can be made to work in certain circumstances when
+cross-compiling, so default to not building g-i stuff
+when cross-compiling, but allow it if introspection was
+enabled explicitly via -Dintrospection=enabled.
+
+See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
+
+Upstream-Status: Backport [30672ba7d134553e59935ddc875104adba26f25c]
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 264d84c9e..c8147c224 100644
+--- a/meson.build
++++ b/meson.build
+@@ -372,7 +372,7 @@ endif
+ 
+ gir = find_program('g-ir-scanner', required : get_option('introspection'))
+ gnome = import('gnome')
+-build_gir = gir.found() and not meson.is_cross_build()
++build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
+ gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
+     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
+     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
deleted file mode 100644
index 08cbfb7c2a..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
+++ /dev/null
@@ -1,295 +0,0 @@
-From 9601fc0cd6751a1affdc8717217b95931db31d7f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 5 Apr 2018 10:26:25 +0800
-Subject: [PATCH] Makefile.am: prefix calls to pkg-config with
- PKG_CONFIG_SYSROOT_DIR
-
-Upstream-Status: Pending [review on oe-core maillist]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- gst-libs/gst/allocators/Makefile.am |  4 ++--
- gst-libs/gst/app/Makefile.am        |  4 ++--
- gst-libs/gst/audio/Makefile.am      | 12 ++++++------
- gst-libs/gst/gl/Makefile.am         |  8 ++++----
- gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
- gst-libs/gst/riff/Makefile.am       |  8 ++++----
- gst-libs/gst/rtp/Makefile.am        |  8 ++++----
- gst-libs/gst/rtsp/Makefile.am       |  4 ++--
- gst-libs/gst/sdp/Makefile.am        |  4 ++--
- gst-libs/gst/tag/Makefile.am        |  8 ++++----
- gst-libs/gst/video/Makefile.am      |  8 ++++----
- 11 files changed, 40 insertions(+), 40 deletions(-)
-
-diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
-index 1ecc950..d6417ac 100644
---- a/gst-libs/gst/allocators/Makefile.am
-+++ b/gst-libs/gst/allocators/Makefile.am
-@@ -39,7 +39,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
- 		--c-include "gst/allocators/allocators.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstallocators-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--libtool="${LIBTOOL}" \
-@@ -63,7 +63,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
-index 5bfd606..6441674 100644
---- a/gst-libs/gst/app/Makefile.am
-+++ b/gst-libs/gst/app/Makefile.am
-@@ -51,8 +51,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
- 		--c-include "gst/app/app.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgstapp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
-index 7fb65f2..5379f79 100644
---- a/gst-libs/gst/audio/Makefile.am
-+++ b/gst-libs/gst/audio/Makefile.am
-@@ -176,12 +176,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
- 		--c-include "gst/audio/audio.h" \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/tag/" \
- 		--library=libgstaudio-@GST_API_VERSION@.la \
--		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
--		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
-+		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
-+		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
- 		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -210,8 +210,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
- 		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
-index 3276d7f..0cdfe26 100644
---- a/gst-libs/gst/gl/Makefile.am
-+++ b/gst-libs/gst/gl/Makefile.am
-@@ -209,9 +209,9 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
- 		$(GST_PLUGINS_BASE_CFLAGS) \
- 		$(GL_CFLAGS) \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library-path="$(top_builddir)/gst-libs/gst/video/" \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgstgl-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -241,8 +241,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
- 		--includedir="$(top_builddir)/gst-libs/gst/video/" \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
-index 35a6e44..49d6894 100644
---- a/gst-libs/gst/pbutils/Makefile.am
-+++ b/gst-libs/gst/pbutils/Makefile.am
-@@ -88,14 +88,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
- 		--c-include "gst/pbutils/pbutils.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/tag/" \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/video/" \
- 		--add-include-path="$(top_builddir)/gst-libs/gst/audio/" \
- 		--library=libgstpbutils-@GST_API_VERSION@.la \
--		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
--		--library-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
-+		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-@GST_API_VERSION@` \
-+		--library-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=libdir gstreamer-base-@GST_API_VERSION@` \
- 		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
- 		--library-path="$(top_builddir)/gst-libs/gst/video/" \
- 		--library-path="$(top_builddir)/gst-libs/gst/audio/" \
-@@ -128,8 +128,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
- 		--includedir="$(top_builddir)/gst-libs/gst/video/" \
- 		--includedir="$(top_builddir)/gst-libs/gst/audio/" \
-diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.am
-index e66ef4f..c8c588a 100644
---- a/gst-libs/gst/riff/Makefile.am
-+++ b/gst-libs/gst/riff/Makefile.am
-@@ -43,8 +43,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
- #		--c-include "gst/riff/riff.h" \
- #		--add-include-path=$(builddir)/../tag \
- #		--add-include-path=$(builddir)/../audio \
--#		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--#		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+#		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+#		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- #		--library=libgstriff-@GST_API_VERSION@.la \
- #		--include=GstAudio-@GST_API_VERSION@ \
- #		--include=GstTag-@GST_API_VERSION@ \
-@@ -75,8 +75,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
- #		--includedir=$(builddir) \
- #		--includedir=$(builddir)/../tag \
- #		--includedir=$(builddir)/../audio \
--#		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--#		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+#		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+#		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- #		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- #
- #CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
-index 77ebeeb..9aee788 100644
---- a/gst-libs/gst/rtp/Makefile.am
-+++ b/gst-libs/gst/rtp/Makefile.am
-@@ -66,8 +66,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
- 		--c-include "gst/rtp/rtp.h" \
- 		-I$(top_builddir)/gst-libs \
- 		-I$(top_srcdir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgstrtp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -94,8 +94,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
-index db9d0fd..79027cb 100644
---- a/gst-libs/gst/rtsp/Makefile.am
-+++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -71,8 +71,8 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
- 		-I$(top_builddir)/gst-libs \
- 		-I$(top_srcdir)/gst-libs \
- 		--add-include-path=$(builddir)/../sdp \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgstrtsp-@GST_API_VERSION@.la \
- 		--include=Gio-2.0 \
- 		--include=Gst-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
-index 6e05cc7..c7cf514 100644
---- a/gst-libs/gst/sdp/Makefile.am
-+++ b/gst-libs/gst/sdp/Makefile.am
-@@ -31,7 +31,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
- 		--warn-all \
- 		--c-include "gst/sdp/sdp.h" \
- 		-I$(top_srcdir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstsdp-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--libtool="${LIBTOOL}" \
-@@ -55,7 +55,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
-index c86515b..363e6d2 100644
---- a/gst-libs/gst/tag/Makefile.am
-+++ b/gst-libs/gst/tag/Makefile.am
-@@ -61,8 +61,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
- 		--c-include "gst/tag/tag.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgsttag-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -89,8 +89,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
-index 0f8455f..8c9955c 100644
---- a/gst-libs/gst/video/Makefile.am
-+++ b/gst-libs/gst/video/Makefile.am
-@@ -124,8 +124,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
- 		--c-include "gst/video/video.h" \
- 		-I$(top_srcdir)/gst-libs \
- 		-I$(top_builddir)/gst-libs \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		--library=libgstvideo-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
-@@ -152,8 +152,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
- 		$(INTROSPECTION_COMPILER) \
- 		--includedir=$(srcdir) \
- 		--includedir=$(builddir) \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
--		--includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
-+		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
- 		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
- 
- CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch
new file mode 100644
index 0000000000..ca85744c19
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch
@@ -0,0 +1,235 @@
+From 685731e989dc074a4b0d48b6c8062e2738f09719 Mon Sep 17 00:00:00 2001
+From: Thibault Saunier <tsaunier@igalia.com>
+Date: Mon, 22 Oct 2018 11:44:37 +0200
+Subject: [PATCH] meson: Add variables for gir files
+
+And flatten list of sources for dependencies
+
+Upstream-Status: Backport [685731e989dc074a4b0d48b6c8062e2738f09719]
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ gst-libs/gst/allocators/meson.build | 5 +++--
+ gst-libs/gst/app/meson.build        | 6 ++++--
+ gst-libs/gst/audio/meson.build      | 5 +++--
+ gst-libs/gst/pbutils/meson.build    | 5 +++--
+ gst-libs/gst/rtp/meson.build        | 6 ++++--
+ gst-libs/gst/rtsp/meson.build       | 5 +++--
+ gst-libs/gst/sdp/meson.build        | 6 ++++--
+ gst-libs/gst/tag/meson.build        | 5 +++--
+ gst-libs/gst/video/meson.build      | 5 +++--
+ 9 files changed, 30 insertions(+), 18 deletions(-)
+
+diff --git a/gst-libs/gst/allocators/meson.build b/gst-libs/gst/allocators/meson.build
+index 364baeebf..56f156dc3 100644
+--- a/gst-libs/gst/allocators/meson.build
++++ b/gst-libs/gst/allocators/meson.build
+@@ -22,7 +22,7 @@ gstallocators = library('gstallocators-@0@'.format(api_version),
+ allocators_gen_sources  = []
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/allocators/allocators.h' ]
+-  allocators_gen_sources += [gnome.generate_gir(gstallocators,
++  allocators_gir = gnome.generate_gir(gstallocators,
+     sources : gst_allocators_sources + gst_allocators_headers,
+     namespace : 'GstAllocators',
+     nsversion : api_version,
+@@ -33,7 +33,8 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : [gst_dep]
+-  )]
++  )
++  allocators_gen_sources += allocators_gir
+ endif
+ 
+ allocators_dep = declare_dependency(link_with: gstallocators,
+diff --git a/gst-libs/gst/app/meson.build b/gst-libs/gst/app/meson.build
+index 81dd0f42c..7a90f5e10 100644
+--- a/gst-libs/gst/app/meson.build
++++ b/gst-libs/gst/app/meson.build
+@@ -32,7 +32,7 @@ gstapp = library('gstapp-@0@'.format(api_version),
+ 
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/app/app.h' ]
+-  app_gen_sources += [gnome.generate_gir(gstapp,
++  app_gir = gnome.generate_gir(gstapp,
+     sources : app_sources + app_headers + [gstapp_c] + [gstapp_h],
+     namespace : 'GstApp',
+     nsversion : api_version,
+@@ -43,7 +43,9 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : [gst_dep, gst_base_dep]
+-  )]
++  )
++
++  app_gen_sources += app_gir
+ endif
+ 
+ app_dep = declare_dependency(link_with: gstapp,
+diff --git a/gst-libs/gst/audio/meson.build b/gst-libs/gst/audio/meson.build
+index 0e4efab2e..2a449d4bf 100644
+--- a/gst-libs/gst/audio/meson.build
++++ b/gst-libs/gst/audio/meson.build
+@@ -153,7 +153,7 @@ gstaudio = library('gstaudio-@0@'.format(api_version),
+ 
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/audio/audio.h' ]
+-  audio_gen_sources += [gnome.generate_gir(gstaudio,
++  audio_gir = gnome.generate_gir(gstaudio,
+     sources : audio_src + audio_headers + [gstaudio_c] + [gstaudio_h],
+     namespace : 'GstAudio',
+     nsversion : api_version,
+@@ -164,7 +164,8 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : gstaudio_deps
+-  )]
++  )
++  audio_gen_sources += [audio_gir]
+ endif
+ 
+ audio_dep = declare_dependency(link_with : gstaudio,
+diff --git a/gst-libs/gst/pbutils/meson.build b/gst-libs/gst/pbutils/meson.build
+index 2faf62622..0e96722fd 100644
+--- a/gst-libs/gst/pbutils/meson.build
++++ b/gst-libs/gst/pbutils/meson.build
+@@ -63,7 +63,7 @@ pbutils = library('gstpbutils-@0@'.format(api_version),
+ pbutils_gen_sources = [gstpbutils_h, gst_pbutils_version_h]
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/pbutils/pbutils.h' ]
+-  pbutils_gen_sources += [gnome.generate_gir(pbutils,
++  pbutils_gir = gnome.generate_gir(pbutils,
+     sources : pbutils_sources + pbutils_headers + [gstpbutils_h, gst_pbutils_version_h],
+     namespace : 'GstPbutils',
+     nsversion : api_version,
+@@ -74,7 +74,8 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : gstpbutils_deps
+-  )]
++  )
++  pbutils_gen_sources += [pbutils_gir]
+ endif
+ 
+ pbutils_dep = declare_dependency(link_with : pbutils,
+diff --git a/gst-libs/gst/rtp/meson.build b/gst-libs/gst/rtp/meson.build
+index f47ec6592..7ea6658d5 100644
+--- a/gst-libs/gst/rtp/meson.build
++++ b/gst-libs/gst/rtp/meson.build
+@@ -49,7 +49,7 @@ gst_rtp = library('gstrtp-@0@'.format(api_version),
+ rtp_gen_sources = [gstrtp_enum_h]
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/rtp/rtp.h' ]
+-  rtp_gen_sources += [gnome.generate_gir(gst_rtp,
++  rtp_gir = gnome.generate_gir(gst_rtp,
+     sources : rtp_sources + rtp_headers + [gstrtp_enum_c] + [gstrtp_enum_h],
+     namespace : 'GstRtp',
+     nsversion : api_version,
+@@ -60,7 +60,9 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : gstrtp_deps
+-  )]
++  )
++
++  rtp_gen_sources += [rtp_gir]
+ endif
+ 
+ 
+diff --git a/gst-libs/gst/rtsp/meson.build b/gst-libs/gst/rtsp/meson.build
+index 27e309d5a..3632adceb 100644
+--- a/gst-libs/gst/rtsp/meson.build
++++ b/gst-libs/gst/rtsp/meson.build
+@@ -54,7 +54,7 @@ gst_rtsp = library('gstrtsp-@0@'.format(api_version),
+ rtsp_gen_sources = [gstrtsp_h]
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/rtsp/rtsp.h' ]
+-  rtsp_gen_sources += [gnome.generate_gir(gst_rtsp,
++  rtsp_gir = gnome.generate_gir(gst_rtsp,
+     sources : rtsp_sources + rtsp_headers + [gstrtsp_c] + [gstrtsp_h],
+     namespace : 'GstRtsp',
+     nsversion : api_version,
+@@ -65,7 +65,8 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : gstrtsp_deps + [sdp_dep]
+-  )]
++  )
++  rtsp_gen_sources += [rtsp_gir]
+ endif
+ 
+ rtsp_dep = declare_dependency(link_with : gst_rtsp,
+diff --git a/gst-libs/gst/sdp/meson.build b/gst-libs/gst/sdp/meson.build
+index 62c18b732..24cdb5293 100644
+--- a/gst-libs/gst/sdp/meson.build
++++ b/gst-libs/gst/sdp/meson.build
+@@ -23,7 +23,7 @@ gstsdp = library('gstsdp-@0@'.format(api_version),
+ sdp_gen_sources  = []
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/sdp/sdp.h' ]
+-  sdp_gen_sources += [gnome.generate_gir(gstsdp,
++  sdp_gir = gnome.generate_gir(gstsdp,
+     sources : gst_sdp_sources + gst_sdp_headers,
+     namespace : 'GstSdp',
+     nsversion : api_version,
+@@ -34,7 +34,9 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : rtsp_deps
+-  )]
++  )
++
++  sdp_gen_sources += [sdp_gir]
+ endif
+ 
+ sdp_dep = declare_dependency(link_with: gstsdp,
+diff --git a/gst-libs/gst/tag/meson.build b/gst-libs/gst/tag/meson.build
+index 27e66fd63..5ec37392a 100644
+--- a/gst-libs/gst/tag/meson.build
++++ b/gst-libs/gst/tag/meson.build
+@@ -93,7 +93,7 @@ gsttag = library('gsttag-@0@'.format(api_version),
+ 
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/tag/tag.h' ]
+-  tag_gen_sources += [gnome.generate_gir(gsttag,
++  tag_gir = gnome.generate_gir(gsttag,
+     sources : tag_sources + tag_headers + [gsttag_h] + [gsttag_c],
+     namespace : 'GstTag',
+     nsversion : api_version,
+@@ -104,7 +104,8 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : tag_deps
+-  )]
++  )
++  tag_gen_sources += [tag_gir]
+ endif
+ 
+ tag_dep = declare_dependency(link_with: gsttag,
+diff --git a/gst-libs/gst/video/meson.build b/gst-libs/gst/video/meson.build
+index 5b35e1943..bf77aa157 100644
+--- a/gst-libs/gst/video/meson.build
++++ b/gst-libs/gst/video/meson.build
+@@ -138,7 +138,7 @@ gstvideo = library('gstvideo-@0@'.format(api_version),
+ 
+ if build_gir
+   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/video/video.h' ]
+-  video_gen_sources += [gnome.generate_gir(gstvideo,
++  video_gir = gnome.generate_gir(gstvideo,
+     sources : video_sources + video_headers + [gstvideo_c] + [gstvideo_h],
+     namespace : 'GstVideo',
+     nsversion : api_version,
+@@ -149,7 +149,8 @@ if build_gir
+     install : true,
+     extra_args : gst_gir_extra_args,
+     dependencies : gstvideo_deps
+-  )]
++  )
++  video_gen_sources += [video_gir]
+ endif
+ 
+ video_dep = declare_dependency(link_with : gstvideo,
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
deleted file mode 100644
index 98ffdb1c10..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b9765efb1696e3e2e79f2955f759be199fe34882 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 26 Oct 2015 17:29:37 +0200
-Subject: [PATCH] riff: add missing include directories when calling
- introspection scanner
-
-Upstream-Status: Pending [review on oe-core maillist]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gst-libs/gst/riff/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.am
-index c8c588a..c096453 100644
---- a/gst-libs/gst/riff/Makefile.am
-+++ b/gst-libs/gst/riff/Makefile.am
-@@ -41,6 +41,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
- #		--strip-prefix=Gst \
- #		--warn-all \
- #		--c-include "gst/riff/riff.h" \
-+#               -I$(top_srcdir)/gst-libs \
-+#               -I$(top_builddir)/gst-libs \
- #		--add-include-path=$(builddir)/../tag \
- #		--add-include-path=$(builddir)/../audio \
- #		--add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
deleted file mode 100644
index 97a0d68cfb..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 53b5868491cf99ee797192395dbfeb69df23edd2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 26 Oct 2015 17:30:14 +0200
-Subject: [PATCH] rtsp: drop incorrect reference to gstreamer-sdp in
- Makefile.am
-
-Upstream-Status: Pending [review on oe-core maillist]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gst-libs/gst/rtsp/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
-index 79027cb..2987e23 100644
---- a/gst-libs/gst/rtsp/Makefile.am
-+++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -82,7 +82,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
- 		--pkg gio-2.0 \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
--		--pkg gstreamer-sdp-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-rtsp-@GST_API_VERSION@ \
- 		--add-init-section="$(INTROSPECTION_INIT)" \
- 		--output $@ \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
deleted file mode 100644
index 34f7c2284f..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9866f51e5e0913f1e453eb574618bf7432f38cb6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 11 Apr 2018 10:46:33 +0800
-Subject: [PATCH] Add -lvchostif to link when using -lEGL on rpi
-
-This is required because libEGL from userland uses sybols
-from this library.
-
-lib/libEGL.so.1.0.0                                                                                                                                                                                                                              121: 00000000     0 FUNC    GLOBAL DEFAULT  UND vc_dispmanx_element_add
-  1552: 00000000     0 FUNC    GLOBAL DEFAULT  UND vc_dispmanx_element_add
-
-These symbols are provided by libvchostif as seen below
-
-lib/libvchostif.so
-   252: 0000b161   192 FUNC    GLOBAL DEFAULT    9 vc_dispmanx_element_add
-   809: 0000b161   192 FUNC    GLOBAL DEFAULT    9 vc_dispmanx_element_add
-
-With this explicit link, plugins fail during runtime
-
-(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstomx.so': Error relocating /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
-(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstopengl.so': Error relocating /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- m4/gst-gl.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
-index 1e97240..ab7774c 100644
---- a/m4/gst-gl.m4
-+++ b/m4/gst-gl.m4
-@@ -275,7 +275,7 @@ case $host in
-                             HAVE_EGL=yes
-                             HAVE_GLES2=yes
-                             HAVE_EGL_RPI=yes
--                            EGL_LIBS="-lbcm_host -lvcos -lvchiq_arm"
-+                            EGL_LIBS="-lbcm_host -lvchostif -lvcos -lvchiq_arm"
-                             EGL_CFLAGS=""
-                             AC_DEFINE(USE_EGL_RPI, [1], [Use RPi platform])
-                           ])
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
deleted file mode 100644
index 23950b67f2..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7ffa6e3d00e1d8a060f3f4c2bb9a72691af05d79 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Wed, 20 Jan 2016 13:00:00 -0800
-Subject: [PATCH] make gio_unix_2_0 dependency configurable
-
-Prior to 1.7.1, gst-plugins-base accepted a configure option to
-disable gio_unix_2_0, however it was implemented incorrectly using
-AG_GST_CHECK_FEATURE. That was fixed in 1.7.1 by making the
-dependency unconditional.
-
-  http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=aadefefba88afe4acbe64454650f24e7ce7c8d70
-
-To make builds deterministic, re-instate support for
---disable-gio_unix_2_0, but implement it using the AC_ARG_ENABLE
-instead of AG_GST_CHECK_FEATURE.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
----
- configure.ac | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 12807bc..35a0bf3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -806,9 +806,16 @@ AM_CONDITIONAL(HAVE_PNG, test "x$HAVE_PNG" = "xyes")
- AM_CONDITIONAL(HAVE_JPEG, test "x$HAVE_JPEG" = "xyes")
- 
- dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***
-+AC_ARG_ENABLE([gio_unix_2_0],
-+  [AS_HELP_STRING([--disable-gio_unix_2_0],[disable use of gio_unix_2_0])],
-+  [],
-+  [enable_gio_unix_2_0=yes])
-+
-+if test "x${enable_gio_unix_2_0}" != "xno"; then
- PKG_CHECK_MODULES(GIO_UNIX_2_0, gio-unix-2.0 >= 2.24,
-     HAVE_GIO_UNIX_2_0="yes",
-     HAVE_GIO_UNIX_2_0="no")
-+fi
- AM_CONDITIONAL(USE_GIO_UNIX_2_0, test "x$HAVE_GIO_UNIX_2_0" = "xyes")
- 
- dnl *** finalize CFLAGS, LDFLAGS, LIBS
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
index cb99fba5ff..7ce9238c4a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
@@ -1,4 +1,4 @@
-require gstreamer1.0-plugins.inc
+require gstreamer1.0-plugins-common.inc
 
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
@@ -7,67 +7,88 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
             file://get-caps-from-src-pad-when-query-caps.patch \
+            file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
+            file://0002-meson-Add-variables-for-gir-files.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
-            file://make-gio_unix_2_0-dependency-configurable.patch \
-            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-            file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
-            file://0003-riff-add-missing-include-directories-when-calling-in.patch \
-            file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
             file://0005-viv-fb-Make-sure-config.h-is-included.patch \
             file://0009-glimagesink-Downrank-to-marginal.patch \
-            file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
-            file://link-with-libvchostif.patch \
             "
 SRC_URI[md5sum] = "b5eb0651bab70bf1714f103bdd66ce47"
 SRC_URI[sha256sum] = "5c3cc489933d0597087c9bc6ba251c93693d64554bcc563539a084fa2d5fcb2b"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-DEPENDS += "iso-codes util-linux"
+DEPENDS += "iso-codes util-linux zlib"
 
-inherit gettext gobject-introspection
+inherit gobject-introspection gtk-doc
 
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
 # opengl packageconfig factored out to make it easy for distros
-# and BSP layers to pick either (desktop) opengl, gles2, or no GL
+# and BSP layers to choose OpenGL APIs/platforms/window systems
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
-    gio-unix-2.0 jpeg ogg pango png theora vorbis zlib \
+    jpeg ogg pango png theora vorbis \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
 "
 
+OPENGL_APIS = 'opengl gles2'
+OPENGL_PLATFORMS = 'egl'
+OPENGL_WINSYS = 'x11 wayland gbm'
+
 X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
-X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
-X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
-
-PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
-PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
-PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,virtual/egl"
-PACKAGECONFIG[gbm]          = "--enable-gbm,--disable-gbm,virtual/libgbm libgudev libdrm"
-PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
-PACKAGECONFIG[gles2]        = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
-PACKAGECONFIG[jpeg]         = "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
-PACKAGECONFIG[opengl]       = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
-PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
-PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
-PACKAGECONFIG[png]          = "--enable-png,--disable-png,libpng"
-PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
-PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-libvisual,libvisual"
-PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-vorbis,libvorbis"
+X11ENABLEOPTS = "-Dx11=enabled -Dxvideo=enabled -Dxshm=enabled"
+X11DISABLEOPTS = "-Dx11=disabled -Dxvideo=disabled -Dxshm=disabled"
+
+PACKAGECONFIG[alsa]         = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
+PACKAGECONFIG[cdparanoia]   = "-Dcdparanoia=enabled,-Dcdparanoia=disabled,cdparanoia"
+PACKAGECONFIG[jpeg]         = "-Dgl-jpeg=enabled,-Dgl-jpeg=disabled,jpeg"
+PACKAGECONFIG[ogg]          = "-Dogg=enabled,-Dogg=disabled,libogg"
+PACKAGECONFIG[opus]         = "-Dopus=enabled,-Dopus=disabled,libopus"
+PACKAGECONFIG[pango]        = "-Dpango=enabled,-Dpango=disabled,pango"
+PACKAGECONFIG[png]          = "-Dgl-png=enabled,-Dgl-png=disabled,libpng"
+PACKAGECONFIG[theora]       = "-Dtheora=enabled,-Dtheora=disabled,libtheora"
+PACKAGECONFIG[tremor]       = "-Dtremor=enabled,-Dtremor=disabled,tremor"
+PACKAGECONFIG[visual]       = "-Dlibvisual=enabled,-Dlibvisual=disabled,libvisual"
+PACKAGECONFIG[vorbis]       = "-Dvorbis=enabled,-Dvorbis=disabled,libvorbis"
 PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
-PACKAGECONFIG[wayland]      = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
-PACKAGECONFIG[zlib]         = "--enable-zlib,--disable-zlib,zlib"
 
-FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
+# OpenGL API packageconfigs
+PACKAGECONFIG[opengl]       = ",,virtual/libgl libglu"
+PACKAGECONFIG[gles2]        = ",,virtual/libgles2"
+
+# OpenGL platform packageconfigs
+PACKAGECONFIG[egl]          = ",,virtual/egl"
+
+# OpenGL window systems (except for X11)
+PACKAGECONFIG[gbm]          = ",,virtual/libgbm libgudev libdrm"
+PACKAGECONFIG[wayland]      = ",,wayland-native wayland wayland-protocols libdrm"
+
+EXTRA_OEMESON += " \
+    -Dgl-graphene=disabled \
+    ${@get_opengl_cmdline_list('gl_api', d.getVar('OPENGL_APIS'), d)} \
+    ${@get_opengl_cmdline_list('gl_platform', d.getVar('OPENGL_PLATFORMS'), d)} \
+    ${@get_opengl_cmdline_list('gl_winsys', d.getVar('OPENGL_WINSYS'), d)} \
+"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+GTKDOC_MESON_ENABLE_FLAG = "enabled"
+GTKDOC_MESON_DISABLE_FLAG = "disabled"
+
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/include/gst/gl/gstglconfig.h"
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
-do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp/.libs:${B}/gst-libs/gst/allocators/.libs"
-}
+def get_opengl_cmdline_list(switch_name, options, d):
+    selected_options = []
+    if bb.utils.contains('DISTRO_FEATURES', 'opengl', True, False, d):
+        for option in options.split():
+            if bb.utils.contains('PACKAGECONFIG', option, True, False, d):
+                selected_options += [option]
+    if selected_options:
+        return '-D' + switch_name + '=' + ','.join(selected_options)
+    else:
+        return ''
-- 
2.17.1


