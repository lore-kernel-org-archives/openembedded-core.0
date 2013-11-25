Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1F06DC3B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Nov 2013 05:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337265"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:20 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:51:04 +0200
Message-Id: <1411c93bd578eaf40828d1ca89d190f4215973f2.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
Subject: [PATCH 9/9] libxcb: upgrade to 1.9.3
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:21 -0000

Added 2 new extensions: dri3 and present. Moved libxcb and xcb-util
recipes to xorg-lib directory.

Removed the following patch(es):
 * automake_1.14_fix.patch (backport)

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xcb/libxcb/automake_1.14_fix.patch             |   27 --------------------
 .../{xcb => xorg-lib}/libpthread-stubs_0.3.bb      |    0
 meta/recipes-graphics/{xcb => xorg-lib}/libxcb.inc |    4 ++-
 .../{xcb => xorg-lib}/libxcb/xcbincludedir.patch   |    0
 .../libxcb_1.9.1.bb => xorg-lib/libxcb_1.9.3.bb}   |    5 ++--
 .../{xcb => xorg-lib}/libxcb_git.bb                |    0
 .../{xcb => xorg-lib}/xcb-util-image_0.3.9.bb      |    0
 .../{xcb => xorg-lib}/xcb-util-keysyms_0.3.9.bb    |    0
 .../{xcb => xorg-lib}/xcb-util-renderutil_0.3.8.bb |    0
 .../{xcb => xorg-lib}/xcb-util-wm_0.3.9.bb         |    0
 .../{xcb => xorg-lib}/xcb-util.inc                 |    0
 .../{xcb => xorg-lib}/xcb-util_0.3.9.bb            |    0
 12 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch
 rename meta/recipes-graphics/{xcb => xorg-lib}/libpthread-stubs_0.3.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/libxcb.inc (94%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/libxcb/xcbincludedir.patch (100%)
 rename meta/recipes-graphics/{xcb/libxcb_1.9.1.bb => xorg-lib/libxcb_1.9.3.bb} (47%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/libxcb_git.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util-image_0.3.9.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util-keysyms_0.3.9.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util-renderutil_0.3.8.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util-wm_0.3.9.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util.inc (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util_0.3.9.bb (100%)

diff --git a/meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch b/meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch
deleted file mode 100644
index 0f1fc54..0000000
--- a/meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libxcb-1.9.1/configure.ac libxcb-1.9.1/configure.ac
---- libxcb-1.9.1/configure.ac	2013-05-30 18:38:01.000000000 +0300
-+++ libxcb-1.9.1/configure.ac	2013-10-24 23:15:10.542507543 +0300
-@@ -7,15 +7,16 @@
-         1.9.1,
-         [xcb@lists.freedesktop.org])
- AC_CONFIG_SRCDIR([xcb.pc.in])
--# Set common system defines for POSIX extensions, such as _GNU_SOURCE
--# Must be called before any macros that run the compiler (like AC_PROG_LIBTOOL)
--# to avoid autoconf errors.
--AC_USE_SYSTEM_EXTENSIONS
-
- # Initialize Automake
- AM_INIT_AUTOMAKE([foreign dist-bzip2])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-
-+# Set common system defines for POSIX extensions, such as _GNU_SOURCE
-+# Must be called before any macros that run the compiler (like AC_PROG_LIBTOOL)
-+# to avoid autoconf errors.
-+AC_USE_SYSTEM_EXTENSIONS
-+
- AM_PATH_PYTHON([2.6])
-
- PKG_CHECK_MODULES(CHECK, [check >= 0.9.4], [HAVE_CHECK=yes], [HAVE_CHECK=no])
diff --git a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
similarity index 100%
rename from meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
rename to meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
similarity index 94%
rename from meta/recipes-graphics/xcb/libxcb.inc
rename to meta/recipes-graphics/xorg-lib/libxcb.inc
index 124fe3d..91df1be 100644
--- a/meta/recipes-graphics/xcb/libxcb.inc
+++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
@@ -22,11 +22,12 @@ PACKAGES =+ "libxcb-composite libxcb-damage libxcb-dpms libxcb-glx \
              libxcb-screensaver libxcb-shape libxcb-shm libxcb-sync \
              libxcb-xevie libxcb-xf86dri libxcb-xfixes libxcb-xlib \
              libxcb-xprint libxcb-xtest libxcb-xv libxcb-xvmc \
-             libxcb-dri2"
+             libxcb-dri2 libxcb-dri3 libxcb-present"
 
 FILES_${PN} = "${libdir}/libxcb.so.*"
 #FILES_${PN}-dev = "${libdir}/libxcb.* ${libdir}/pkgconfig/*.pc ${includedir}/xcb/*.h"
 FILES_libxcb-dri2 = "${libdir}/libxcb-dri2.so.*"
+FILES_libxcb-dri3 = "${libdir}/libxcb-dri3.so.*"
 FILES_libxcb-composite = "${libdir}/libxcb-composite.so.*"
 FILES_libxcb-damage = "${libdir}/libxcb-damage.so.*"
 FILES_libxcb-dpms = "${libdir}/libxcb-dpms.so.*"
@@ -48,6 +49,7 @@ FILES_libxcb-xprint = "${libdir}/libxcb-xprint.so.*"
 FILES_libxcb-xtest = "${libdir}/libxcb-xtest.so.*"
 FILES_libxcb-xv = "${libdir}/libxcb-xv.so.*"
 FILES_libxcb-xvmc = "${libdir}/libxcb-xvmc.so.*"
+FILES_libxcb-present = "${libdir}/libxcb-present.so.*"
 
 inherit autotools pkgconfig pythonnative
 
diff --git a/meta/recipes-graphics/xcb/libxcb/xcbincludedir.patch b/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
similarity index 100%
rename from meta/recipes-graphics/xcb/libxcb/xcbincludedir.patch
rename to meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
diff --git a/meta/recipes-graphics/xcb/libxcb_1.9.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.9.3.bb
similarity index 47%
rename from meta/recipes-graphics/xcb/libxcb_1.9.1.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.9.3.bb
index b654800..7374f10 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.9.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.9.3.bb
@@ -3,11 +3,10 @@ include libxcb.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-SRC_URI += "file://automake_1.14_fix.patch"
 
 DEPENDS += "libxdmcp"
 
 PACKAGES =+ "libxcb-xinerama"
 
-SRC_URI[md5sum] = "ed632cb0dc31b6fbd7ea5c0f931cf5a4"
-SRC_URI[sha256sum] = "d44a5ff4eb0b9569e6f7183b51fdaf6f58da90e7d6bfc36b612d7263f83e362f"
+SRC_URI[md5sum] = "1ca999ca94f760d917ef2d8466a88742"
+SRC_URI[sha256sum] = "aad09d223fcb5bd345ce4d1737f178a557b6f2e201128e1ee3c83af46028018b"
diff --git a/meta/recipes-graphics/xcb/libxcb_git.bb b/meta/recipes-graphics/xorg-lib/libxcb_git.bb
similarity index 100%
rename from meta/recipes-graphics/xcb/libxcb_git.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_git.bb
diff --git a/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb b/meta/recipes-graphics/xorg-lib/xcb-util-image_0.3.9.bb
similarity index 100%
rename from meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-image_0.3.9.bb
diff --git a/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb b/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.3.9.bb
similarity index 100%
rename from meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.3.9.bb
diff --git a/meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb b/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.8.bb
similarity index 100%
rename from meta/recipes-graphics/xcb/xcb-util-renderutil_0.3.8.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.8.bb
diff --git a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb b/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.3.9.bb
similarity index 100%
rename from meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-wm_0.3.9.bb
diff --git a/meta/recipes-graphics/xcb/xcb-util.inc b/meta/recipes-graphics/xorg-lib/xcb-util.inc
similarity index 100%
rename from meta/recipes-graphics/xcb/xcb-util.inc
rename to meta/recipes-graphics/xorg-lib/xcb-util.inc
diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.9.bb b/meta/recipes-graphics/xorg-lib/xcb-util_0.3.9.bb
similarity index 100%
rename from meta/recipes-graphics/xcb/xcb-util_0.3.9.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util_0.3.9.bb
-- 
1.7.9.5


