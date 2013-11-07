Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id EF58F6D3E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:56:00 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id ex4so470425wid.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 03:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4IFyzBusanB9oUiOG/OA+C9okzjYUdin+mGxn1tvjx4=;
	b=MqaBT1Tnnp/7wf1ijufLcYoy14kTJ+oqVa8CRqlvep7hlnktvJ5qjNDSEVShzPu3Sa
	PC8xEpWc6hJ3+QHU/wL0hYm4iIeu5iCPZMaEa4Lqs5UbDbmSjPYlgpFU0nxBIV31vOq5
	sYKfYV+VnrbdneKcDEHjr2T6jJHGLSi0V4VHJMWCGE5kQE29E0Nxu/t7ma/Kdb+r87WR
	YBHvRB7L8Kkxf7JPWsQdsAZp4b5X6vCAsKcuLLBM+OWck6xlD/UMQU1E4eIkeZtuDp3f
	uVflsLPKbYmr6yiNbgm2BgfTqzDJhLlDEL+5yU/y/+VtMyC1B080PsetxmGFkvlO1tVs
	Ie4A==
X-Gm-Message-State: ALoCoQkigdJosW7cyEN9z8SgZB01UPoanOVeNqpgW1JMAVHelXmDTGVDIo6Z1LKyKWNCf26uh+KS
X-Received: by 10.180.73.109 with SMTP id k13mr2309717wiv.35.1383825361958;
	Thu, 07 Nov 2013 03:56:01 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id q3sm34492026wib.5.2013.11.07.03.56.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 03:56:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2013 11:55:32 +0000
Message-Id: <1383825335-2306-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1383825335-2306-1-git-send-email-ross.burton@intel.com>
References: <1383825335-2306-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] clutter: upgrade
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
X-List-Received-Date: Thu, 07 Nov 2013 11:56:06 -0000

Delete fix-wayland-deps.patch, it was a backport from upstream.

Delete enable_tests which installed the non-inuititive interactive test suite,
instead install the examples.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../clutter/clutter-1.0-1.14.4/enable_tests.patch  |   36 -------------
 .../clutter-1.0-1.14.4/fix-wayland-deps.patch      |   57 --------------------
 meta/recipes-graphics/clutter/clutter-1.0.inc      |    8 ++-
 .../clutter/clutter-1.0/install-examples.patch     |   28 ++++++++++
 .../recipes-graphics/clutter/clutter-1.0_1.14.4.bb |    7 ---
 .../recipes-graphics/clutter/clutter-1.0_1.16.0.bb |    8 +++
 6 files changed, 39 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0-1.14.4/enable_tests.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0-1.14.4/fix-wayland-deps.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.0-1.14.4/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-1.0-1.14.4/enable_tests.patch
deleted file mode 100644
index f97d598..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.0-1.14.4/enable_tests.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Make tests installable
-
-The test applications are useful for image testing.
-
-Imported from clutter 1.8 package, git://git.openembedded.org/openembedded,
-commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b, updated patch header.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
-
-Index: git/tests/interactive/Makefile.am
-===================================================================
---- git.orig/tests/interactive/Makefile.am	2009-11-30 17:39:46.000000000 +0000
-+++ git/tests/interactive/Makefile.am	2009-11-30 17:42:30.000000000 +0000
-@@ -88,7 +88,7 @@
- 
- common_ldadd = $(top_builddir)/clutter/libclutter-@CLUTTER_WINSYS@-@CLUTTER_API_VERSION@.la
- 
--noinst_PROGRAMS = test-interactive
-+bin_PROGRAMS = test-interactive
- 
- test_interactive_SOURCES = test-main.c $(UNIT_TESTS)
- test_interactive_CFLAGS = $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
-Index: git/tests/interactive/test-actors.c
-===================================================================
---- git.orig/tests/interactive/test-actors.c	2009-11-30 17:39:46.000000000 +0000
-+++ git/tests/interactive/test-actors.c	2009-11-30 17:43:03.000000000 +0000
-@@ -178,7 +178,7 @@
-   oh->scaler_1 = clutter_behaviour_scale_new (alpha, 0.5, 0.5, 1.0, 1.0);
-   oh->scaler_2 = clutter_behaviour_scale_new (alpha, 1.0, 1.0, 0.5, 0.5);
- 
--  file = g_build_filename (TESTS_DATADIR, "redhand.png", NULL);
-+  file = g_build_filename (TESTS_DATADIR, "/usr/share/clutter/redhand.png", NULL);
-   real_hand = clutter_texture_new_from_file (file, &error);
-   if (real_hand == NULL)
-     g_error ("image load failed: %s", error->message);
diff --git a/meta/recipes-graphics/clutter/clutter-1.0-1.14.4/fix-wayland-deps.patch b/meta/recipes-graphics/clutter/clutter-1.0-1.14.4/fix-wayland-deps.patch
deleted file mode 100644
index f5af73c..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.0-1.14.4/fix-wayland-deps.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 74f9d8a597acf0fd8458e3d6cb0475b8d9a0a6ba Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Thu, 27 Jun 2013 16:42:40 +0100
-Subject: [PATCH] build: Enable Cogl support with Wayland
-
-The Wayland backend is based on Cogl, so we need to turn on the
-SUPPORT_COGL flag to avoid breaking the build; this always went
-unnoticed because we usually build the Wayland client backend
-with the X11 backend.
-
-Reported-by: Ross Burton <ross.burton@intel.com>
-(cherry picked from commit 1fb0295ba162507fb798b2b7030f0f45ff252f27)
-
-Signed-off-by: Emmanuele Bassi <ebassi@gnome.org>
----
- configure.ac |    6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f5afe12..355c95b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -310,6 +310,7 @@ AS_IF([test "x$enable_wayland" = "xyes"],
-         experimental_backend="yes"
- 
-         SUPPORT_WAYLAND=1
-+        SUPPORT_COGL=1
- 
-         PKG_CHECK_EXISTS([wayland-client wayland-cursor xkbcommon gdk-pixbuf-2.0],
-                          [
-@@ -337,7 +338,10 @@ AS_IF([test "x$enable_wayland_compositor" = "xyes"],
-       [
-         PKG_CHECK_EXISTS([wayland-server],
- 			 [BACKEND_PC_FILES="$BACKEND_PC_FILES wayland-server"], [])
-+
-         SUPPORT_WAYLAND_COMPOSITOR=1
-+        SUPPORT_COGL=1
-+
- 	CLUTTER_CONFIG_DEFINES="$CLUTTER_CONFIG_DEFINES
- #define CLUTTER_HAS_WAYLAND_COMPOSITOR_SUPPORT 1"
-         AC_DEFINE([HAVE_CLUTTER_WAYLAND_COMPOSITOR], [1], [Have Wayland compositor support])
-@@ -359,8 +363,8 @@ AS_IF([test "x$enable_cex100" = "xyes"],
- 
-         experimental_backend="yes"
- 
--        SUPPORT_COGL=1
-         SUPPORT_CEX100=1
-+        SUPPORT_COGL=1
- 
-         have_gdl=no
-         AC_CHECK_HEADERS([libgdl.h], [have_gdl=yes])
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 1356586..d9311fe 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -4,11 +4,8 @@ LICENSE = "LGPLv2.1+"
 
 inherit clutter
 
-SRC_URI += "file://enable_tests.patch \
-            file://fix-wayland-deps.patch"
-
 DEPENDS = "pango glib-2.0 json-glib atk udev cogl-1.0"
-PACKAGES =+ "${PN}-examples"
+PACKAGE_BEFORE_PN += "${PN}-examples"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
 EDEPENDS_X11 = "virtual/libx11 libxi libxfixes"
@@ -39,7 +36,8 @@ PACKAGECONFIG[wayland-compositor] = "--enable-wayland-compositor,--disable-wayla
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'glx x11', '', d)}"
 
-FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
+FILES_${PN}-dbg += "${libdir}/clutter/examples/.debug"
+FILES_${PN}-examples = "${libdir}/clutter/examples"
 
 do_configure_prepend() {
 	# see https://bugzilla.gnome.org/show_bug.cgi?id=661128 for this
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch b/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
new file mode 100644
index 0000000..d96b038
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
@@ -0,0 +1,28 @@
+Install the examples to $libdir/clutter/.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Inappropriate
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index 4b9b449..232cd19 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -31,7 +31,7 @@ LDADD = \
+ AM_CFLAGS = $(CLUTTER_CFLAGS) $(GDK_PIXBUF_CFLAGS) $(MAINTAINER_CFLAGS)
+ 
+ AM_CPPFLAGS = \
+-	-DTESTS_DATADIR=\""$(abs_top_srcdir)/tests/data"\" \
++	-DTESTS_DATADIR=\""$(exampledir)"\" \
+ 	-DG_DISABLE_SINGLE_INCLUDES \
+ 	-DGLIB_DISABLE_DEPRECATION_WARNINGS \
+ 	-I$(top_srcdir)	\
+@@ -39,6 +39,8 @@ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/clutter \
+ 	-I$(top_builddir)/clutter
+ 
+-noinst_PROGRAMS = $(all_examples)
++exampledir = $(pkglibdir)/examples
++example_PROGRAMS = $(all_examples)
++example_DATA = $(top_srcdir)/tests/data/redhand.png
+ 
+ -include $(top_srcdir)/build/autotools/Makefile.am.gitignore
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb
deleted file mode 100644
index 35824c6..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-
-require clutter-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI[archive.md5sum] = "c072e4c27e69368f2b877ea4f6da2cdf"
-SRC_URI[archive.sha256sum] = "c996d91fff6fff24d9e23dcd545439ebc6b999fb1cf9ee44c28ca54c49c0ee1c"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb
new file mode 100644
index 0000000..d9dfa59
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb
@@ -0,0 +1,8 @@
+require clutter-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[archive.md5sum] = "873c97b825c366e13e1f281e8e1f549b"
+SRC_URI[archive.sha256sum] = "a213c7859051d6d19b5550c7e433757a35aa8e2b61a43d2eae83dd87912ea8ae"
+
+SRC_URI += "file://install-examples.patch"
-- 
1.7.10.4


