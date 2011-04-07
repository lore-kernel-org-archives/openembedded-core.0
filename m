Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wvd-0008M4-VU
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:39:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2011 14:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="676541257"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2011 14:37:35 -0700
Message-Id: <0731e077767fa0755d2c5fb41e932e8016a43ca1.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 15:15:14 -0700
Date: Thu, 07 Apr 2011 14:37:35 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 02/11] directfb: Update to 1.4.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2011 21:39:50 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../directfb/directfb-1.4.6/mkdfiff.patch          |   24 --------------
 meta/recipes-graphics/directfb/directfb.inc        |   11 ++----
 meta/recipes-graphics/directfb/directfb_1.4.12.bb  |   22 +++++++++++++
 meta/recipes-graphics/directfb/directfb_1.4.6.bb   |   27 ----------------
 .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   33 +++++++++++---------
 .../directfb/files/dont-use-linux-config.patch     |   11 ++++++
 6 files changed, 55 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb-1.4.6/mkdfiff.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.4.12.bb
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.4.6.bb

diff --git a/meta/recipes-graphics/directfb/directfb-1.4.6/mkdfiff.patch b/meta/recipes-graphics/directfb/directfb-1.4.6/mkdfiff.patch
deleted file mode 100644
index 28bd534..0000000
--- a/meta/recipes-graphics/directfb/directfb-1.4.6/mkdfiff.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -uNr DirectFB-1.4.6.orig/tools/mkdfiff.c DirectFB-1.4.6/tools/mkdfiff.c
---- DirectFB-1.4.6.orig/tools/mkdfiff.c 2010-10-15 10:54:57.000000000 +0200
-+++ DirectFB-1.4.6/tools/mkdfiff.c      2010-10-15 10:54:15.000000000 +0200
-@@ -50,6 +50,8 @@
-
- #include <dfiff.h>
-
-+#include <unistd.h>
-+
- static DirectFBPixelFormatNames( format_names );
-
- static const char            *filename;
-diff -uNr DirectFB-1.4.6.orig/tools/mkdgifft.cpp DirectFB-1.4.6/tools/mkdgifft.cpp
---- DirectFB-1.4.6.orig/tools/mkdgifft.cpp      2010-10-08 14:02:57.000000000 +0200
-+++ DirectFB-1.4.6/tools/mkdgifft.cpp   2010-10-15 10:56:06.000000000 +0200
-@@ -40,6 +40,8 @@
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <sys/stat.h>
-+#include <sys/types.h>
- #include <unistd.h>
- #include <fcntl.h>
- #include <sys/mman.h>
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index e4cd006..d45159f 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -12,14 +12,11 @@ HOMEPAGE = "http://directfb.org"
 DEPENDS = "jpeg libpng freetype zlib tslib"
 
 SRC_URI = " \
-    http://www.directfb.org/downloads/Old/DirectFB-${PV}.tar.gz \
-    file://fix-pkgconfig-cflags.patch \
-    file://fix-font-missing-char.patch \
-    file://getpagesize.patch \
-    file://mkdfiff.patch \
+    http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.gz \
+    file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
     file://dont-use-linux-config.patch \
-    file://ts_lib_autotools.patch \
-"
+    "
+
 S = "${WORKDIR}/DirectFB-${PV}"
 
 LDFLAGS_append =" -lts -lm"
diff --git a/meta/recipes-graphics/directfb/directfb_1.4.12.bb b/meta/recipes-graphics/directfb/directfb_1.4.12.bb
new file mode 100644
index 0000000..4e8203b
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb_1.4.12.bb
@@ -0,0 +1,22 @@
+require directfb.inc
+
+RV = "1.4-5"
+PR = "r0"
+
+DEPENDS += "sysfsutils"
+
+EXTRA_OECONF = "\
+  --enable-freetype=yes \
+  --enable-zlib \
+  --with-gfxdrivers=none \
+  --disable-sdl \
+  --disable-vnc \
+  --disable-x11 \
+"
+
+LEAD_SONAME = "libdirectfb-1.4.so.5"
+
+SRC_URI[md5sum] = "2c779c9a8456790c6c29ad85459b2600"
+SRC_URI[sha256sum] = "b119ab9c5c0c505c23e32d41ae54bd04cb474c5e58900ec0f1cf9482f892f9b2"
+
+
diff --git a/meta/recipes-graphics/directfb/directfb_1.4.6.bb b/meta/recipes-graphics/directfb/directfb_1.4.6.bb
deleted file mode 100644
index 70c0225..0000000
--- a/meta/recipes-graphics/directfb/directfb_1.4.6.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require directfb.inc
-
-RV = "1.4-5"
-PR = "r2"
-
-DEPENDS += "sysfsutils"
-
-SRC_URI = " \
-    http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.gz \
-    file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
-    file://mkdfiff.patch \
-    file://dont-use-linux-config.patch \
-   "
-
-EXTRA_OECONF = "\
-  --enable-freetype=yes \
-  --enable-zlib \
-  --with-gfxdrivers=none \
-  --disable-sdl \
-  --disable-vnc \
-  --disable-x11 \
-"
-
-LEAD_SONAME = "libdirectfb-1.4.so.5"
-
-SRC_URI[md5sum] = "dbe1957932f81790742b58b94c1c7b84"
-SRC_URI[sha256sum] = "b18121e60e9a084ee347037a53a46cfaea1c09505bd99d673c2e65eca285e69b"
diff --git a/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cflags.patch b/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cflags.patch
index 745c561..274ad50 100644
--- a/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cflags.patch
+++ b/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cflags.patch
@@ -1,7 +1,9 @@
-Index: DirectFB-1.1.1/directfb-internal.pc.in
+Upstream-Status: Inappropriate [configuration]
+
+Index: DirectFB-1.4.11/directfb-internal.pc.in
 ===================================================================
---- DirectFB-1.1.1.orig/directfb-internal.pc.in	2007-08-07 21:43:00.000000000 +0200
-+++ DirectFB-1.1.1/directfb-internal.pc.in	2008-07-17 21:00:47.424654304 +0200
+--- DirectFB-1.4.11.orig/directfb-internal.pc.in	2010-10-08 05:43:46.000000000 -0700
++++ DirectFB-1.4.11/directfb-internal.pc.in	2011-04-06 13:48:23.120923997 -0700
 @@ -2,10 +2,10 @@
  exec_prefix=@exec_prefix@
  moduledir=@MODULEDIR@
@@ -15,30 +17,31 @@ Index: DirectFB-1.1.1/directfb-internal.pc.in
  Requires: directfb = @VERSION@
 -Cflags: @DFB_INTERNAL_CFLAGS@ -I@INTERNALINCLUDEDIR@
 +Cflags: @DFB_INTERNAL_CFLAGS@ -I${includedir}/directfb -I${includedir}
-Index: DirectFB-1.1.1/directfb.pc.in
+Index: DirectFB-1.4.11/directfb.pc.in
 ===================================================================
---- DirectFB-1.1.1.orig/directfb.pc.in	2007-12-15 16:23:16.000000000 +0100
-+++ DirectFB-1.1.1/directfb.pc.in	2008-07-17 20:59:58.044985193 +0200
-@@ -9,4 +9,4 @@
- Requires: fusion direct
+--- DirectFB-1.4.11.orig/directfb.pc.in	2010-11-15 13:13:59.000000000 -0800
++++ DirectFB-1.4.11/directfb.pc.in	2011-04-06 14:09:33.528923998 -0700
+@@ -9,4 +9,5 @@
+ Requires: @DEP_VOODOO@ fusion direct
  Libs: -L${libdir} -ldirectfb @THREADLIB@ @OSX_LIBS@
- Libs.private: -L${libdir} @DYNLIB@ @ZLIB_LIBS@
+ Libs.private: -L${libdir} @MEDIALIB@ @DYNLIB@ @ZLIB_LIBS@
 -Cflags: @THREADFLAGS@ -I@INCLUDEDIR@
 +Cflags: @THREADFLAGS@ -I${includedir}/directfb
-Index: DirectFB-1.1.1/lib/fusion/fusion.pc.in
++
+Index: DirectFB-1.4.11/lib/fusion/fusion.pc.in
 ===================================================================
---- DirectFB-1.1.1.orig/lib/fusion/fusion.pc.in	2007-08-07 21:43:00.000000000 +0200
-+++ DirectFB-1.1.1/lib/fusion/fusion.pc.in	2008-07-17 20:58:07.051338866 +0200
+--- DirectFB-1.4.11.orig/lib/fusion/fusion.pc.in	2010-10-08 05:43:46.000000000 -0700
++++ DirectFB-1.4.11/lib/fusion/fusion.pc.in	2011-04-06 13:48:23.120923997 -0700
 @@ -8,4 +8,4 @@
  Version: @VERSION@
  Requires: direct
  Libs: -L${libdir} -lfusion
 -Cflags: -I@INCLUDEDIR@
 +Cflags: -I${includedir}/directfb -I${includedir}
-Index: DirectFB-1.1.1/lib/voodoo/voodoo.pc.in
+Index: DirectFB-1.4.11/lib/voodoo/voodoo.pc.in
 ===================================================================
---- DirectFB-1.1.1.orig/lib/voodoo/voodoo.pc.in	2007-08-07 21:43:00.000000000 +0200
-+++ DirectFB-1.1.1/lib/voodoo/voodoo.pc.in	2008-07-17 20:58:07.054671842 +0200
+--- DirectFB-1.4.11.orig/lib/voodoo/voodoo.pc.in	2010-10-08 05:43:46.000000000 -0700
++++ DirectFB-1.4.11/lib/voodoo/voodoo.pc.in	2011-04-06 13:48:23.120923997 -0700
 @@ -8,4 +8,4 @@
  Version: @VERSION@
  Requires: direct
diff --git a/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch b/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch
index f971660..ba8ead8 100644
--- a/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch
+++ b/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch
@@ -1,3 +1,14 @@
+
+directfb: don't use linux/config.h in powerpc assembly
+
+Author: jeremy_laine at openembedded.org
+Branch: org.openembedded.dev
+Revision: 73964f8e6912f066c224fed54daeeb44836d9cdf
+ViewMTN: http://monotone.openembedded.org/revision/info/73964f8e6912f066c224fed54daeeb44836d9cdf
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
 diff -urN DirectFB-1.1.0.orig/lib/direct/ppcasm_memcpy_cachable.S DirectFB-1.1.0/lib/direct/ppcasm_memcpy_cachable.S
 --- DirectFB-1.1.0.orig/lib/direct/ppcasm_memcpy_cachable.S	2007-08-07 21:43:00.000000000 +0200
 +++ DirectFB-1.1.0/lib/direct/ppcasm_memcpy_cachable.S	2008-06-07 04:14:26.000000000 +0200
-- 
1.7.1



