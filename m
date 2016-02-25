Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 738AF773C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220201"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:30 +0200
Message-Id: <d7664ceda46bbefd429af28158d562be1b2ed5a6.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/19] libdrm: update to 2.4.67
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop 0001-tests-kms-steal-crtc-Include-sys-select.h.patch and detect.patch
(merged upstream).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...tests-kms-steal-crtc-Include-sys-select.h.patch | 96 ----------------------
 meta/recipes-graphics/drm/libdrm/detect.patch      | 59 -------------
 .../drm/{libdrm_2.4.66.bb => libdrm_2.4.67.bb}     |  6 +-
 3 files changed, 2 insertions(+), 159 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
 delete mode 100644 meta/recipes-graphics/drm/libdrm/detect.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.66.bb => libdrm_2.4.67.bb} (87%)

diff --git a/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch b/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
deleted file mode 100644
index e4ecbac..0000000
--- a/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From fb53d7a1be116a172b56625f290fcf88b6d158ca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Jan 2016 05:23:00 +0000
-Subject: [PATCH] tests: Include sys/select.h
-
-Used in compliance with POSIX 2001/2008
-
-Fixes errors e.g.
-error: implicit declaration of function 'select'
-
-and helps with missing definitions of FD_* defines
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Thierry Reding <thierry.reding@gmail.com>
----
-Upstream-Status: Submitted
-
- configure.ac                     | 2 +-
- tests/kms/kms-steal-crtc.c       | 3 +++
- tests/kms/kms-universal-planes.c | 3 +++
- tests/modetest/modetest.c        | 3 +++
- tests/vbltest/vbltest.c          | 3 +++
- 5 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 057a846..258e2f6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -53,7 +53,7 @@ AC_USE_SYSTEM_EXTENSIONS
- AC_SYS_LARGEFILE
- AC_FUNC_ALLOCA
- 
--AC_CHECK_HEADERS([sys/mkdev.h sys/sysctl.h])
-+AC_CHECK_HEADERS([sys/mkdev.h sys/sysctl.h sys/select.h])
- 
- # Initialize libtool
- LT_PREREQ([2.2])
-diff --git a/tests/kms/kms-steal-crtc.c b/tests/kms/kms-steal-crtc.c
-index 2f7f327..497772e 100644
---- a/tests/kms/kms-steal-crtc.c
-+++ b/tests/kms/kms-steal-crtc.c
-@@ -31,6 +31,9 @@
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
-+#ifdef HAVE_SYS_SELECT_H
-+#include <sys/select.h>
-+#endif
- 
- #include <drm_fourcc.h>
- 
-diff --git a/tests/kms/kms-universal-planes.c b/tests/kms/kms-universal-planes.c
-index 9151231..d8e5fc4 100644
---- a/tests/kms/kms-universal-planes.c
-+++ b/tests/kms/kms-universal-planes.c
-@@ -32,6 +32,9 @@
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
-+#ifdef HAVE_SYS_SELECT_H
-+#include <sys/select.h>
-+#endif
- 
- #include <drm_fourcc.h>
- #include "xf86drm.h"
-diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index 22e3e81..d5a4062 100644
---- a/tests/modetest/modetest.c
-+++ b/tests/modetest/modetest.c
-@@ -55,6 +55,9 @@
- #include <errno.h>
- #include <sys/poll.h>
- #include <sys/time.h>
-+#ifdef HAVE_SYS_SELECT_H
-+#include <sys/select.h>
-+#endif
- 
- #include "xf86drm.h"
- #include "xf86drmMode.h"
-diff --git a/tests/vbltest/vbltest.c b/tests/vbltest/vbltest.c
-index 1833321..086407e 100644
---- a/tests/vbltest/vbltest.c
-+++ b/tests/vbltest/vbltest.c
-@@ -37,6 +37,9 @@
- #include <errno.h>
- #include <sys/poll.h>
- #include <sys/time.h>
-+#ifdef HAVE_SYS_SELECT_H
-+#include <sys/select.h>
-+#endif
- 
- #include "xf86drm.h"
- #include "xf86drmMode.h"
--- 
-2.7.0
-
diff --git a/meta/recipes-graphics/drm/libdrm/detect.patch b/meta/recipes-graphics/drm/libdrm/detect.patch
deleted file mode 100644
index 6397a59..0000000
--- a/meta/recipes-graphics/drm/libdrm/detect.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-commit 798022b61c58d945f9027c823a188dcedecd3d06
-Author: Marcin Ślusarz <marcin.slusarz@gmail.com>
-Date:   Sun Jan 24 13:17:34 2016 +0100
-
-    configure.ac: don't detect disabled options dependencies
-    
-    Currently with --disable-amdgpu --disable-valgrind --disable-cairo-tests
-    cunit, valgrind and cairo are still detected.
-    
-    Signed-off-by: Marcin Ślusarz <marcin.slusarz@gmail.com>
-    Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
-
-diff --git a/configure.ac b/configure.ac
-index 057a846..a09be61 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -363,12 +363,14 @@ fi
--# Detect cunit library
--PKG_CHECK_MODULES([CUNIT], [cunit >= 2.1], [have_cunit=yes], [have_cunit=no])
--# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
--# do this because Debian (Ubuntu) lacks pkg-config file for cunit.
--# fixed in 2.1-2.dfsg-3: http://anonscm.debian.org/cgit/collab-maint/cunit.git/commit/?h=debian
--if test "x${have_cunit}" = "xno"; then
--	AC_CHECK_LIB([cunit], [CU_initialize_registry], [have_cunit=yes], [have_cunit=no])
--	if test "x${have_cunit}" = "xyes"; then
--		CUNIT_LIBS="-lcunit"
--		CUNIT_CFLAGS=""
--		AC_SUBST([CUNIT_LIBS])
--		AC_SUBST([CUNIT_CFLAGS])
-+if test "x$AMDGPU" != xno; then
-+	# Detect cunit library
-+	PKG_CHECK_MODULES([CUNIT], [cunit >= 2.1], [have_cunit=yes], [have_cunit=no])
-+	# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
-+	# do this because Debian (Ubuntu) lacks pkg-config file for cunit.
-+	# fixed in 2.1-2.dfsg-3: http://anonscm.debian.org/cgit/collab-maint/cunit.git/commit/?h=debian
-+	if test "x${have_cunit}" = "xno"; then
-+		AC_CHECK_LIB([cunit], [CU_initialize_registry], [have_cunit=yes], [have_cunit=no])
-+		if test "x${have_cunit}" = "xyes"; then
-+			CUNIT_LIBS="-lcunit"
-+			CUNIT_CFLAGS=""
-+			AC_SUBST([CUNIT_LIBS])
-+			AC_SUBST([CUNIT_CFLAGS])
-+		fi
-@@ -375,0 +378,2 @@ if test "x${have_cunit}" = "xno"; then
-+else
-+	have_cunit=no
-@@ -404 +408,3 @@ AC_ARG_ENABLE([cairo-tests],
--PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
-+if test "x$CAIRO" != xno; then
-+	PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
-+fi
-@@ -449 +455,3 @@ AC_ARG_ENABLE(valgrind,
--PKG_CHECK_MODULES(VALGRIND, [valgrind], [have_valgrind=yes], [have_valgrind=no])
-+if test "x$VALGRIND" != xno; then
-+	PKG_CHECK_MODULES(VALGRIND, [valgrind], [have_valgrind=yes], [have_valgrind=no])
-+fi
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.66.bb b/meta/recipes-graphics/drm/libdrm_2.4.67.bb
similarity index 87%
rename from meta/recipes-graphics/drm/libdrm_2.4.66.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.67.bb
index 3280920..86cfbe7 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.66.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.67.bb
@@ -12,12 +12,10 @@ DEPENDS = "libpthread-stubs udev libpciaccess"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://installtests.patch \
-           file://0001-tests-kms-steal-crtc-Include-sys-select.h.patch \
-           file://detect.patch \
           "
 
-SRC_URI[md5sum] = "c6809c48538d6e5999588832045ff014"
-SRC_URI[sha256sum] = "79cb8e988749794edfb2d777b298d5292eff353bbbb71ed813589e61d2bc2d76"
+SRC_URI[md5sum] = "b844c6af34e613ebf52f80b3cd8d7055"
+SRC_URI[sha256sum] = "ee5b71e1113be37544d0752681c12f040c01f782e2933df7d7bc21fd0d10cebe"
 
 inherit autotools pkgconfig
 
-- 
2.7.0


