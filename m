Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A8C6F7310C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302174"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:04 +0200
Message-Id: <73bd00392c81ac3cfaf9e013052071b1ee6b66ff.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/24] boost: update to 1.63.0
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backported 0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch
Rebase consider-hardfp.patch to 0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...bjam-native_1.62.0.bb => bjam-native_1.63.0.bb} |   0
 .../boost/{boost-1.62.0.inc => boost-1.63.0.inc}   |   4 +-
 ...soft-float-on-ARM-we-should-not-expect-th.patch |  29 +++++
 ...execution_monitor.hpp-fix-mips-soft-float.patch | 145 ---------------------
 .../boost/boost/consider-hardfp.patch              |  19 ---
 .../boost/{boost_1.62.0.bb => boost_1.63.0.bb}     |   3 +-
 6 files changed, 32 insertions(+), 168 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.62.0.bb => bjam-native_1.63.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.62.0.inc => boost-1.63.0.inc} (84%)
 create mode 100644 meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch
 delete mode 100644 meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch
 delete mode 100644 meta/recipes-support/boost/boost/consider-hardfp.patch
 rename meta/recipes-support/boost/{boost_1.62.0.bb => boost_1.63.0.bb} (82%)

diff --git a/meta/recipes-support/boost/bjam-native_1.62.0.bb b/meta/recipes-support/boost/bjam-native_1.63.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.62.0.bb
rename to meta/recipes-support/boost/bjam-native_1.63.0.bb
diff --git a/meta/recipes-support/boost/boost-1.62.0.inc b/meta/recipes-support/boost/boost-1.63.0.inc
similarity index 84%
rename from meta/recipes-support/boost/boost-1.62.0.inc
rename to meta/recipes-support/boost/boost-1.63.0.inc
index 1138de61f13..1c1563050c3 100644
--- a/meta/recipes-support/boost/boost-1.62.0.inc
+++ b/meta/recipes-support/boost/boost-1.63.0.inc
@@ -13,8 +13,8 @@ BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "5fb94629535c19e48703bdb2b2e9490f"
-SRC_URI[sha256sum] = "36c96b0f6155c98404091d8ceb48319a28279ca0333fba1ad8611eb90afb2ca0"
+SRC_URI[md5sum] = "1c837ecd990bb022d07e7aab32b09847"
+SRC_URI[sha256sum] = "beae2529f759f6b3bf3f4969a19c2e9d6f0c503edcb2de4a61d1428519fcb3b0"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/boost/files/"
 
diff --git a/meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch b/meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch
new file mode 100644
index 00000000000..bafd5ce001e
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch
@@ -0,0 +1,29 @@
+From 9ab0914207e6d0e6b75ce12147c54b96478feb64 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 21 Feb 2017 12:50:35 +0200
+Subject: [PATCH] When using soft-float, on ARM we should not expect the FE_*
+ symbols
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ boost/test/execution_monitor.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boost/test/execution_monitor.hpp b/boost/test/execution_monitor.hpp
+index f53348a..86252d7 100644
+--- a/boost/test/execution_monitor.hpp
++++ b/boost/test/execution_monitor.hpp
+@@ -498,7 +498,7 @@ enum masks {
+ 
+     BOOST_FPE_ALL       = MCW_EM,
+ 
+-#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) /* *** */
++#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) || defined(__ARM_PCS) /* *** */
+     BOOST_FPE_ALL       = BOOST_FPE_OFF,
+ 
+ #else /* *** */
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch b/meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch
deleted file mode 100644
index 569c987336f..00000000000
--- a/meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 5c349a1c391c9ce171a1c80f5164fae764f27dba Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
-Date: Wed, 24 Aug 2016 20:58:59 +0100
-Subject: [PATCH 2/4] boost/test/execution_monitor.hpp: fix mips soft float
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gcc.compile.c++ <builddir>/boost/bin.v2/libs/test/build/gcc-4.3.1/release/threading-multi/execution_monitor.o
-
-    "mipsel-poky-linux-musl-g++" "-mel" "-mabi=32" "-msoft-float" "-march=mips32r2" "-mips16" "-minterlink-compressed" "-mtune=24kec" "-mdsp" "-Wl,-O1" "-Wl,--as-needed" "-fstack-protector-strong" "-Wl,-z,relro,-z,now" "--sysroot=<sysroot>"  -ftemplate-depth-128 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=<srcdir>=/usr/src/debug/boost/1.61.0-r0 -fdebug-prefix-map=<sysroot_host>= -fdebug-prefix-map=<sysroot>= -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -fvisibility-inlines-hidden -O3 -finline-functions -Wno-inline -Wall -pedantic -pthread -fPIC -Wno-variadic-macros -DBOOST_ALL_NO_LIB=1 -DBOOST_CHRONO_DYN_LINK=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_TEST_DYN_LINK=1 -DBOOST_TIMER_DYN_LINK=1 -DNDEBUG  -I"." -c -o "<builddir>/boost/bin.v2/libs/test/build/gcc-4.3.1/release/threading-multi/execution_monitor.o" "libs/test/src/execution_monitor.cpp"
-
-In file included from ./boost/test/impl/execution_monitor.ipp:31:0,
-                 from libs/test/src/execution_monitor.cpp:16:
-./boost/test/execution_monitor.hpp:491:27: error: 'FE_DIVBYZERO' was not declared in this scope
-     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,
-                           ^~~~~~~~~~~~
-./boost/test/execution_monitor.hpp:492:27: error: 'FE_INEXACT' was not declared in this scope
-     BOOST_FPE_INEXACT   = FE_INEXACT,
-                           ^~~~~~~~~~
-./boost/test/execution_monitor.hpp:493:27: error: 'FE_INVALID' was not declared in this scope
-     BOOST_FPE_INVALID   = FE_INVALID,
-                           ^~~~~~~~~~
-./boost/test/execution_monitor.hpp:494:27: error: 'FE_OVERFLOW' was not declared in this scope
-     BOOST_FPE_OVERFLOW  = FE_OVERFLOW,
-                           ^~~~~~~~~~~
-./boost/test/execution_monitor.hpp:495:27: error: 'FE_UNDERFLOW' was not declared in this scope
-     BOOST_FPE_UNDERFLOW = FE_UNDERFLOW,
-                           ^~~~~~~~~~~~
-
-The reason is that some (notably FPU-less) architectures,
-including mips*-nf, don't define/implement some of the
-floating point constants, even though fenv.h is
-available.
-
-The key point is:
-  A fully standards conforming fenv.h does not have to
-  define any FE_* macros, and if it does define them,
-  then it defines macros only for the FP exceptions it
-  actually supports.
-
-So correct usage requires a triple check:
-1) Check BOOST_NO_FENV_H to see if the header is supported.
-2) Include the header and then check FE_ALL_EXCEPT to see
-   if any FP exceptions are supported.
-3) Before using the individual FE_* macros, you need to
-   check for their existence too as not all may be
-   supported.
-
-https://svn.boost.org/trac/boost/ticket/11756
-
-Other projects have similar issues, e.g. pixman, and
-apply similar work-arounds:
-  https://lists.freedesktop.org/archives/pixman/2014-February/003172.html
-
-Architectures are notably also allowed to define FE_ALL_EXCEPT to 0!
-Keeping this in mind, and knowing that the compiler will eliminate
-code that can't be executed, we can change BOOST_FPE_ALL to be 0 for
-the case of compiling using Clang and/or fenv.h being unavailable
-as well, which allows simplification of the #ifdef's in
-execution_monitor.ipp a bit.
-
-Signed-off-by: André Draszik <adraszik@tycoint.com>
----
-Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/11756
- boost/test/execution_monitor.hpp      | 26 +++++++++++++++++++++++++-
- boost/test/impl/execution_monitor.ipp | 10 ++++++++--
- 2 files changed, 33 insertions(+), 3 deletions(-)
-
-diff --git a/boost/test/execution_monitor.hpp b/boost/test/execution_monitor.hpp
-index 0eee497..44fe59d 100644
---- a/boost/test/execution_monitor.hpp
-+++ b/boost/test/execution_monitor.hpp
-@@ -486,15 +486,39 @@ enum masks {
-     BOOST_FPE_ALL       = MCW_EM,
- #elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) \
-     || defined(__ARM_PCS)
--    BOOST_FPE_ALL       = 1,
-+    BOOST_FPE_ALL       = 0,
- #else
-+#if defined(FE_DIVBYZERO)
-     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,
-+#else
-+    BOOST_FPE_DIVBYZERO = 0,
-+#endif
-+#if defined(FE_INEXACT)
-     BOOST_FPE_INEXACT   = FE_INEXACT,
-+#else
-+    BOOST_FPE_INEXACT   = 0,
-+#endif
-+#if defined(FE_INVALID)
-     BOOST_FPE_INVALID   = FE_INVALID,
-+#else
-+    BOOST_FPE_INVALID   = 0,
-+#endif
-+#if defined(FE_OVERFLOW)
-     BOOST_FPE_OVERFLOW  = FE_OVERFLOW,
-+#else
-+    BOOST_FPE_OVERFLOW  = 0,
-+#endif
-+#if defined(FE_UNDERFLOW)
-     BOOST_FPE_UNDERFLOW = FE_UNDERFLOW,
-+#else
-+    BOOST_FPE_UNDERFLOW = 0,
-+#endif
- 
-+#if defined(FE_ALL_EXCEPT)
-     BOOST_FPE_ALL       = FE_ALL_EXCEPT,
-+#else
-+    BOOST_FPE_ALL       = 0,
-+#endif
- #endif
-     BOOST_FPE_INV       = BOOST_FPE_ALL+1
- };
-diff --git a/boost/test/impl/execution_monitor.ipp b/boost/test/impl/execution_monitor.ipp
-index f7fc8ea..d1088b9 100644
---- a/boost/test/impl/execution_monitor.ipp
-+++ b/boost/test/impl/execution_monitor.ipp
-@@ -1381,7 +1381,10 @@ enable( unsigned mask )
- #endif
- 
-     return ~old_cw & BOOST_FPE_ALL;
--#elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
-+#elif defined(__GLIBC__) && defined(__USE_GNU)
-+    if (BOOST_FPE_ALL == 0)
-+        /* Not Implemented */
-+        return 0;
-     feclearexcept(BOOST_FPE_ALL);
-     int res = feenableexcept( mask );
-     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
-@@ -1418,7 +1421,10 @@ disable( unsigned mask )
- #endif
- 
-     return ~old_cw & BOOST_FPE_ALL;
--#elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
-+#elif defined(__GLIBC__) && defined(__USE_GNU)
-+    if (BOOST_FPE_ALL == 0)
-+        /* Not Implemented */
-+        return BOOST_FPE_INV;
-     feclearexcept(BOOST_FPE_ALL);
-     int res = fedisableexcept( mask );
-     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
--- 
-2.9.3
-
diff --git a/meta/recipes-support/boost/boost/consider-hardfp.patch b/meta/recipes-support/boost/boost/consider-hardfp.patch
deleted file mode 100644
index 66808a69ddf..00000000000
--- a/meta/recipes-support/boost/boost/consider-hardfp.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-When using soft-float, on ARM we should not expect the FE_* symbols
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: boost_1_60_0/boost/test/execution_monitor.hpp
-===================================================================
---- boost_1_60_0.orig/boost/test/execution_monitor.hpp
-+++ boost_1_60_0/boost/test/execution_monitor.hpp
-@@ -484,7 +484,8 @@ enum masks {
-     BOOST_FPE_UNDERFLOW = EM_UNDERFLOW|EM_DENORMAL,
- 
-     BOOST_FPE_ALL       = MCW_EM,
--#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG)
-+#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) \
-+    || defined(__ARM_PCS)
-     BOOST_FPE_ALL       = 1,
- #else
-     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,
diff --git a/meta/recipes-support/boost/boost_1.62.0.bb b/meta/recipes-support/boost/boost_1.63.0.bb
similarity index 82%
rename from meta/recipes-support/boost/boost_1.62.0.bb
rename to meta/recipes-support/boost/boost_1.63.0.bb
index de4932a6e1b..dd309340910 100644
--- a/meta/recipes-support/boost/boost_1.62.0.bb
+++ b/meta/recipes-support/boost/boost_1.63.0.bb
@@ -3,10 +3,9 @@ require boost.inc
 
 SRC_URI += "\
     file://arm-intrinsics.patch \
-    file://consider-hardfp.patch \
+    file://0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch \
     file://boost-CVE-2012-2677.patch \
     file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
-    file://0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch \
     file://0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch \
     file://boost-math-disable-pch-for-gcc.patch \
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
-- 
2.11.0


