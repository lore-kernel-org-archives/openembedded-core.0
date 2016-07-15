Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DDD2873172
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:20:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 15 Jul 2016 05:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,368,1464678000"; d="scan'208";a="846866840"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2016 05:20:12 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:20:04 +0300
Message-Id: <bf4741f743e504bae5cd6e5018d175d666c6a201.1468584725.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
References: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468584725.git.jussi.kukkonen@intel.com>
References: <cover.1468584725.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/5] libmatchbox: Upgrade 1.11 -> 1.12
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
X-List-Received-Date: Fri, 15 Jul 2016 12:20:38 -0000

libmatchbox now has a in-tree xsettings-client.

* Use git SRC_URI like the other matchbox components.
* Remove upstreamed patch.
* Update license info (xsettings code is MIT).
* Stop depending on libxsettings-client

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libmatchbox/libmatchbox/libpng.patch           | 69 ----------------------
 .../{libmatchbox_1.11.bb => libmatchbox_1.12.bb}   | 16 ++---
 2 files changed, 8 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.11.bb => libmatchbox_1.12.bb} (57%)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch b/meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch
deleted file mode 100644
index 8cd507f..0000000
--- a/meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 19c3d242034748b3c60765683e1ff4e2df970205 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 10 Dec 2013 11:37:32 +0000
-Subject: [PATCH] configure: improve libpng detection
-
-Instead of looking for "libpng12" explicitly though pkg-config and then falling
-back to library hunting, just use pkg-config to find "libpng" which is provided
-by both libpng12 and libpng16.
-
-This also makes the libpng detection deterministic.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- configure.ac | 29 +++++------------------------
- 1 file changed, 5 insertions(+), 24 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8a28076..65d7c79 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -34,7 +34,7 @@ AC_ARG_ENABLE(jpeg,
-   enable_jpeg=$enableval, enable_jpeg=no)
- 
- AC_ARG_ENABLE(png,
--  [  --disable-png           disable png support [default=no]],
-+  [  --disable-png           disable PNG support [default=enabled]],
-      enable_png=$enableval, enable_png=yes )
- 
- AC_ARG_ENABLE(doxygen-docs,     
-@@ -156,29 +156,10 @@ fi
- dnl ------ Check for PNG ---------------------------------------------------
- 
- if test x$enable_png != xno; then
--  AC_MSG_CHECKING(for libpng12)
--  if test x$PKG_CONFIG != xno && $PKG_CONFIG --exists libpng12; then 
--        AC_MSG_RESULT(yes)
--        PNG_LIBS=`$PKG_CONFIG --libs libpng12`
--	PNG_CFLAGS=`$PKG_CONFIG --cflags libpng12`
--        AC_DEFINE(USE_PNG, [1], [Use Png])
--	SUPPORTS_PNG=1
--	PNG_REQUIRED="libpng12"
--  else
--	AC_MSG_RESULT(no)
--        # AC_CHECK_HEADERS(png.h, [ have_png_h="yes" ], [ have_png_h="no" ] )
--        AC_CHECK_LIB([png], [png_create_read_struct], [have_png="yes"], [have_png="no"])
--
--        if test x$have_png=xyes && test x$have_png_h=xyes; then 
--            AC_DEFINE(USE_PNG, [1], [Use Png])
--	    SUPPORTS_PNG=1
--            PNG_LIBS="-lpng -lz"
--            MB_EXTRA_LIBS="$MB_EXTRA_LIBS $PNG_LIBS"
--        else
--	    AC_MSG_WARN([*** Cannot find PNG, disabling support])
--            enable_png=no
--	fi
--  fi
-+  PKG_CHECK_MODULES(PNG, libpng)
-+  AC_DEFINE(USE_PNG, [1], [Use PNG])
-+  SUPPORTS_PNG=1
-+  PNG_REQUIRED="libpng"
- fi
- 
- 
--- 
-1.8.5
-
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
similarity index 57%
rename from meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
rename to meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index f2eb675..ce45e48 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -3,26 +3,26 @@ SECTION = "x11/libs"
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.com/"
 
-LICENSE = "LGPLv2+"
+LICENSE = "LGPLv2+ & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://COPYING.MIT;md5=f45ed9332b4f50a35adf2065adde4ca7 \
                     file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
-                    file://libmb/mbdotdesktop.c;endline=21;md5=5a287156b3207e851c1d68d09c439b51"
+                    file://libmb/xsettings-client.c;endline=20;md5=4b106a387602db8d91a50d5cdfd65031"
 
 DEPENDS = "virtual/libx11 libxext"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.bz2 \
-           file://libpng.patch"
+#SRCREV for 1.12
+SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
-SRC_URI[md5sum] = "fc6cc807f55a3e7c752d8013176875d7"
-SRC_URI[sha256sum] = "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7fe26b93534217b53"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-PACKAGECONFIG ??= "jpeg png xft xsettings"
+PACKAGECONFIG ??= "jpeg png xft"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[xft] = "--enable-xft,--disable-xft,libxft"
-PACKAGECONFIG[xsettings] = "--enable-xsettings,--disable-xsettings,libxsettings-client"
-- 
2.1.4


