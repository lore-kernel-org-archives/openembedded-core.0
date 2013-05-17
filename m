Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UdJ5B-0000YY-Rt
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:44:31 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 63CD69532
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 12:26:08 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 12:25:39 +0100
Message-Id: <1368789942-7476-5-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH 4/7] New clutter recipe (1.14.4)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

The package has been renamed to clutter-1.0 instead of clutter-vmajor.vminor,
keeping up with the upstream versioning policy (all 1.x packages install
clutter-1.0 pc file and headers and are backward compatible), and to simplify
dependency management (worth noting that since the 1.x development files are
not parall installable, it is not possible to use two versions of clutter 1.x
at the same time anyway).

Package configuration is provided via PACKAGECONFIG options as follows:

  'x11'  : enable X11 backend,
  'glx'  : enable GLX backend,
  'egl'  : enable EGL backend,
  'evdev': enable evdev input backend

Default configuration is 'glx'; typical configuration for embedded HW using
'native' EGL would be 'egl evdev'.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc      |   56 ++++++++++++++++++++
 .../recipes-graphics/clutter/clutter-1.0_1.14.4.bb |    7 +++
 .../clutter/clutter-1.14/enable_tests.patch        |   34 ++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0.inc
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.14/enable_tests.patch

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
new file mode 100644
index 0000000..6710776
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -0,0 +1,56 @@
+DESCRIPTION = "Clutter graphics library"
+HOMEPAGE = "http://www.clutter-project.org/"
+LICENSE = "LGPLv2.1+"
+
+inherit clutter
+
+SRC_URI += "file://enable_tests.patch"
+
+DEPENDS = "gtk-doc-native pango glib-2.0 json-glib atk udev cogl-1.0"
+PACKAGES =+ "${PN}-examples"
+AUTOTOOLS_AUXDIR = "${S}/build"
+
+EDEPENDS_X11 = "virtual/libx11 libxi libxfixes"
+EDEPENDS_GLX = "virtual/libgl"
+EDEPENDS_EGL = "virtual/egl"
+
+EDEPENDS_EVDEV = "libxkbcommon"
+ERDEPENDS_EVDEV = "xkeyboard-config"
+
+# Disable pretty much everything, override in platform specific set up
+EXTRA_OECONF += "--disable-gtk-doc		\
+	     	 ${@get_fpu_setting(bb, d)}	\
+             	 --disable-introspection	\
+	     	 --disable-egl-backend		\
+	     	 --disable-quartz-backend	\
+	     	 --disable-win32-backend	\
+	     	 --disable-x11-backend		\
+	     	 --disable-gdk-backend		\
+	     	 --disable-wayland-backend	\
+	     	 --disable-wayland-compositor	\
+	     	 --disable-cex100-backend	\
+	     	 --disable-tslib-input		\
+	     	 --disable-evdev-input		\
+	    	"
+
+PACKAGECONFIG[x11] = "--enable-x11-backend,,${EDEPENDS_X11}"
+PACKAGECONFIG[glx] = "--enable-x11-backend,,${EDEPENDS_X11} ${EDEPENDS_GLX}"
+PACKAGECONFIG[egl] = "--enable-egl-backend,,${EDEPENDS_EGL}"
+PACKAGECONFIG[evdev] = "--enable-evdev-input,,${EDEPENDS_EVDEV},${ERDEPENDS_EVDEV}"
+
+# Default configuration, distros might want to override
+PACKAGECONFIG ??= "glx"
+
+FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
+
+do_configure_prepend() {
+        # Fix up some weirdness in the docs
+        sed -i s:doc/reference/Makefile::g ${S}/configure.ac
+        sed -i s:doc::g ${S}/Makefile.am
+
+	# see https://bugzilla.gnome.org/show_bug.cgi?id=661128 for this
+	touch -t 200001010000 po/clutter-1.0.pot
+
+	# Disable DOLT
+	sed -i -e 's/^DOLT//' ${S}/configure.ac
+}
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb
new file mode 100644
index 0000000..35824c6
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb
@@ -0,0 +1,7 @@
+
+require clutter-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[archive.md5sum] = "c072e4c27e69368f2b877ea4f6da2cdf"
+SRC_URI[archive.sha256sum] = "c996d91fff6fff24d9e23dcd545439ebc6b999fb1cf9ee44c28ca54c49c0ee1c"
diff --git a/meta/recipes-graphics/clutter/clutter-1.14/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-1.14/enable_tests.patch
new file mode 100644
index 0000000..480b208
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.14/enable_tests.patch
@@ -0,0 +1,34 @@
+---
+ tests/Makefile.am   |    7 ++++++-
+ tests/test-actors.c |    2 +-
+ tests/test-text.c   |    2 +-
+ 3 files changed, 8 insertions(+), 3 deletions(-)
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: git/tests/interactive/Makefile.am
+===================================================================
+--- git.orig/tests/interactive/Makefile.am	2009-11-30 17:39:46.000000000 +0000
++++ git/tests/interactive/Makefile.am	2009-11-30 17:42:30.000000000 +0000
+@@ -88,7 +88,7 @@
+ 
+ common_ldadd = $(top_builddir)/clutter/libclutter-@CLUTTER_WINSYS@-@CLUTTER_API_VERSION@.la
+ 
+-noinst_PROGRAMS = test-interactive
++bin_PROGRAMS = test-interactive
+ 
+ test_interactive_SOURCES = test-main.c $(UNIT_TESTS)
+ test_interactive_CFLAGS = $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
+Index: git/tests/interactive/test-actors.c
+===================================================================
+--- git.orig/tests/interactive/test-actors.c	2009-11-30 17:39:46.000000000 +0000
++++ git/tests/interactive/test-actors.c	2009-11-30 17:43:03.000000000 +0000
+@@ -178,7 +178,7 @@
+   oh->scaler_1 = clutter_behaviour_scale_new (alpha, 0.5, 0.5, 1.0, 1.0);
+   oh->scaler_2 = clutter_behaviour_scale_new (alpha, 1.0, 1.0, 0.5, 0.5);
+ 
+-  file = g_build_filename (TESTS_DATADIR, "redhand.png", NULL);
++  file = g_build_filename (TESTS_DATADIR, "/usr/share/clutter/redhand.png", NULL);
+   real_hand = clutter_texture_new_from_file (file, &error);
+   if (real_hand == NULL)
+     g_error ("image load failed: %s", error->message);
-- 
1.7.10.4



