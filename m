Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A978477218
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:47:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2016 01:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,327,1470726000"; d="scan'208";a="1055231376"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2016 01:46:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 11:46:41 +0300
Message-Id: <3c3e6f1e189ccf6f954869af77a2037de08b13b9.1473755500.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c80aadf2f46f6339d8aa9f7b95a2ca40d84650e1.1473755500.git.jussi.kukkonen@intel.com>
References: <c80aadf2f46f6339d8aa9f7b95a2ca40d84650e1.1473755500.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1473755500.git.jussi.kukkonen@intel.com>
References: <cover.1473755500.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] libdrm: Explicitly disable cunit tests
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
X-List-Received-Date: Tue, 13 Sep 2016 08:47:27 -0000

Add patch to control building cunit-tests explicitly. Disable
them in the recipe.

Fixes [YOCTO #9849].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ac-Allow-explicit-enabling-of-cunit-tests.patch | 56 ++++++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.70.bb         |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch

diff --git a/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch b/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
new file mode 100644
index 0000000..bf52637
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
@@ -0,0 +1,56 @@
+From e6bd4205b0b546afe991ae6f72256645f4404ad4 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 5 Sep 2016 14:41:37 +0300
+Subject: [PATCH libdrm] configure.ac: Allow explicit enabling of cunit tests
+
+Add --with-cunit to make it easier to do reproducible builds. Default
+is still to probe cunit and build opportunistically.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [mailing list]
+---
+ configure.ac | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e3048c7..918d21d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -137,6 +137,12 @@ AC_ARG_ENABLE(install-test-programs,
+ 		  [Install test programs (default: no)]),
+ 		  [INSTALL_TESTS=$enableval], [INSTALL_TESTS=no])
+ 
++AC_ARG_WITH([cunit],
++            [AS_HELP_STRING([--with-cunit],
++                            [Build tests that use cunit (default: auto)])],
++            [],
++            [with_cunit=auto])
++
+ dnl ===========================================================================
+ dnl check compiler flags
+ AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
+@@ -372,7 +378,7 @@ if test "x$RADEON" = xyes; then
+ 	AC_DEFINE(HAVE_RADEON, 1, [Have radeon support])
+ fi
+ 
+-if test "x$AMDGPU" != xno; then
++if test "x$with_cunit" != xno -a "x$AMDGPU" != xno; then
+ 	# Detect cunit library
+ 	PKG_CHECK_MODULES([CUNIT], [cunit >= 2.1], [have_cunit=yes], [have_cunit=no])
+ 	# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
+@@ -399,7 +406,11 @@ if test "x$AMDGPU" = xyes; then
+ 	AC_DEFINE(HAVE_CUNIT, [test "x$have_cunit" != "xno"], [Enable CUNIT Have amdgpu support])
+ 
+ 	if test "x$have_cunit" = "xno"; then
+-		AC_MSG_WARN([Could not find cunit library. Disabling amdgpu tests])
++		if test "x$with_cunit" = "xyes"; then
++			AC_MSG_ERROR([Could not find cunit library but --with-cunit was given])
++		elif test "x$with_cunit" = "xauto"; then
++			AC_MSG_WARN([Could not find cunit library. Disabling amdgpu tests])
++		fi
+ 	fi
+ fi
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.70.bb b/meta/recipes-graphics/drm/libdrm_2.4.70.bb
index 632c30e..a2b5282 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.70.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.70.bb
@@ -13,6 +13,7 @@ DEPENDS = "libpthread-stubs udev libpciaccess"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://installtests.patch \
            file://fix_O_CLOEXEC_undeclared.patch \
+           file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
 SRC_URI[md5sum] = "920957cfe25a80efb02be9bd90bf3c1e"
@@ -21,6 +22,7 @@ SRC_URI[sha256sum] = "b17d4b39ed97ca0e4cffa0db06ff609e617bac94646ec38e8e0579d530
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-cairo-tests \
+                 --without-cunit \
                  --enable-omap-experimental-api \
                  --enable-install-test-programs \
                  --disable-manpages \
-- 
2.1.4


