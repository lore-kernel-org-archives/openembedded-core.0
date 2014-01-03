Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CF60F615BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 07:58:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 02 Jan 2014 23:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,596,1384329600"; d="scan'208";a="453139569"
Received: from cvoicu-vostro-460.rb.intel.com (HELO google.com.com)
	([10.237.105.151])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2014 23:58:52 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 10:05:40 +0200
Message-Id: <05cec0c2a25dedaced68d3da08fb8a43b07ff368.1388735980.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1388735980.git.cristiana.voicu@intel.com>
References: <cover.1388735980.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1388735980.git.cristiana.voicu@intel.com>
References: <cover.1388735980.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/1] kmod: Update to Rev 16 via git
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
X-List-Received-Date: Fri, 03 Jan 2014 07:58:52 -0000

Two patches are not needed anymore, because the changes are
already upstream.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb        |    3 +-
 meta/recipes-kernel/kmod/kmod.inc                  |    5 +--
 .../kmod/0001-Fix-build-with-older-gcc-4.6.patch   |   44 --------------------
 .../kmod/kmod/fix-seperatebuilddir.patch           |   34 ---------------
 4 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Fix-build-with-older-gcc-4.6.patch
 delete mode 100644 meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index fccc39b..d442bcb 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -4,8 +4,7 @@
 require kmod.inc
 inherit native
 
-SRC_URI += "file://0001-Fix-build-with-older-gcc-4.6.patch \
-            file://Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch \
+SRC_URI += "file://Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch \
            "
 
 do_install_append (){
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index f8d5bac..b4609dd 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -15,16 +15,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                    "
 inherit autotools gtk-doc ptest
 
-SRCREV = "18811d22e9923893555b88a482aa967db0e7892a"
+SRCREV = "36c4bb928a6a7962dd0ad3aa64c0b18120ca5b46"
 # Lookout for PV bump too when SRCREV is changed
-PV = "15+git${SRCPV}"
+PV = "16+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://run-ptest \
            file://ptest.patch \
            file://avoid_parallel_tests.patch \
-           file://fix-seperatebuilddir.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/kmod/kmod/0001-Fix-build-with-older-gcc-4.6.patch b/meta/recipes-kernel/kmod/kmod/0001-Fix-build-with-older-gcc-4.6.patch
deleted file mode 100644
index f8ff103..0000000
--- a/meta/recipes-kernel/kmod/kmod/0001-Fix-build-with-older-gcc-4.6.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Inappropriate [kmod is new]
-
-From 30e1839a46b0b9449f272765193a0da61bf85997 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 26 Aug 2013 15:32:36 -0700
-Subject: [PATCH] Fix build with older gcc < 4.6
-
-Static_assert is new feature in C11 standards and older than gcc 4.6
-does not support it. So define it to make the old gcc happy
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libkmod/macro.h | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/libkmod/macro.h b/libkmod/macro.h
-index c6ba855..5032f54 100644
---- a/libkmod/macro.h
-+++ b/libkmod/macro.h
-@@ -20,9 +20,19 @@
- #pragma once
- 
- #include <stddef.h>
--
--#define assert_cc(expr) \
-+#if defined(__GNUC__)
-+/* Determine which version of GNU C we're using */
-+#define GCC_VERSION (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)
-+#endif
-+#if (GCC_VERSION >= 40600)
-+# define assert_cc(expr) \
- 	_Static_assert((expr), #expr)
-+#else
-+# define STATIC_ASSERT_GLUE1(x, y) x##y
-+# define STATIC_ASSERT_GLUE(x, y)  STATIC_ASSERT_GLUE1(x, y)
-+# define assert_cc(expr) \
-+extern void STATIC_ASSERT_GLUE(static_assert, __LINE__)(int arg[(expr) ? 1 : -1]) __attribute__((unused))
-+#endif
- 
- #if HAVE_TYPEOF
- #define check_types_match(expr1, expr2)		\
--- 
-1.8.3.4
-
diff --git a/meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch b/meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
deleted file mode 100644
index b090eb5..0000000
--- a/meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-
-If we are not building in the existing source tree, the testsuite
-directory will not exist so the cp of the stamp-rootfs would fail.
-
-Also added buildtest-TESTS so they could be build in the cross env,
-without running the tests.
-
-Upstream-Status: Accepted
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -131,7 +131,7 @@ endif
- 
- ROOTFS = testsuite/rootfs
- ROOTFS_PRISTINE = $(top_srcdir)/testsuite/rootfs-pristine
--CREATE_ROOTFS = $(AM_V_GEN) ( $(RM) -rf $(ROOTFS) && \
-+CREATE_ROOTFS = $(AM_V_GEN) ( $(RM) -rf $(ROOTFS) && mkdir -p $(dir $(ROOTFS)) && \
- 				cp -r $(ROOTFS_PRISTINE) $(ROOTFS) && \
- 				touch testsuite/stamp-rootfs && \
- 				find $(ROOTFS) -type d -exec chmod +w {} \; )
-@@ -217,6 +217,9 @@ DISTCHECK_CONFIGURE_FLAGS=--enable-gtk-d
- 
- distclean-local: $(DISTCLEAN_LOCAL_HOOKS)
- 
-+buildtest-TESTS:
-+	$(MAKE) $(AM_MAKEFLAGS) $(check_LTLIBRARIES) $(check_PROGRAMS)
-+
- install-ptest:
- 	@$(MKDIR_P) $(DESTDIR)/testsuite
- 	@for file in $(TESTSUITE); do \
-- 
1.7.9.5


