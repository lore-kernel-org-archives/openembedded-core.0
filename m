Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id E849E6E668
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 17:31:48 +0000 (UTC)
Received: from hsp.bmw-carit.intra (hsp.bmw-carit.intra [192.168.101.108])
	by linuxmail.bmw-carit.de (Postfix) with ESMTP id 2216253B1E;
	Wed,  6 Jan 2016 18:17:26 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 18:31:01 +0100
Message-Id: <1452101461-20892-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1451986361-10021-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1451986361-10021-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Subject: [PATCH v3] boost: update to 1.60.0
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
X-List-Received-Date: Wed, 06 Jan 2016 17:31:52 -0000

Due to the version update to 1.59.0, the two patches previously
backported in this recipe are now dropped. The actual status of
the arm-intrinsics.patch (reported with Upstream-Status: Backport)
is unknown to the committer, and hence, that patch is kept in the
recipe, even if it is possibly not required anymore. A deeper
analysis is required to determine need and status of that patch.
Second, boost 1.59.0 provides a new library, called timer,
which is packaged as further library in the boost recipe. The
update to boost 1.60.0 required no further changes beyond
changing the checksum hashes.
Third, on PPC architectures, qemuppc & mpc8315e-rdb [1] (tested
by Ross Burton), the boost test library with the vanilla
version 1.60.0 fails with:

| gcc.compile.c++ bin.v2/libs/test/build/aca09349fdb84d131321425f6c3a38ed/execution_monitor.o
| In file included from [...]/tmp/sysroots/mpc8315e-rdb/usr/include/fenv.h:114:0,
|                  from [...]/tmp/sysroots/mpc8315e-rdb/usr/include/c++/5.3.0/fenv.h:36,
|                  from ./boost/detail/fenv.hpp:97,
|                  from ./boost/test/execution_monitor.hpp:64,
|                  from ./boost/test/impl/execution_monitor.ipp:31,
|                  from libs/test/src/execution_monitor.cpp:16:
| ./boost/test/impl/execution_monitor.ipp: In function 'unsigned int boost::fpe::enable(unsigned int)':
| ./boost/test/impl/execution_monitor.ipp:1383:7: error: expected id-expression before '(' token
|      ::feclearexcept(BOOST_FPE_ALL);
|        ^
| ./boost/test/impl/execution_monitor.ipp: In function 'unsigned int boost::fpe::disable(unsigned int)':
| ./boost/test/impl/execution_monitor.ipp:1420:7: error: expected id-expression before '(' token
|      ::feclearexcept(BOOST_FPE_ALL);
|        ^

The commit f50e7bc9fed323c5705c0ed992c03e80eeec1dd6 from the
boostorg/test github repository (branch: develop) [2] addresses
that issue, but it was not merged in the 1.60.0 release. This
commit adds this upstream-accepted patch, which was created by:

  `git checkout f50e7bc9fed323c5705c0ed992c03e80eeec1dd6 && git format-patch -1`

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-January/114844.html
[2] https://github.com/boostorg/test/commit/f50e7bc9fed323c5705c0ed992c03e80eeec1dd6

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/boost/bjam-native_1.58.0.bb   | 18 ---------
 meta/recipes-support/boost/bjam-native_1.60.0.bb   | 18 +++++++++
 meta/recipes-support/boost/boost-1.58.0.inc        | 22 -----------
 meta/recipes-support/boost/boost-1.60.0.inc        | 19 +++++++++
 meta/recipes-support/boost/boost.inc               |  1 +
 ...qualify-fenv.h-names-that-might-be-macros.patch | 45 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.58.0.bb         |  6 ---
 meta/recipes-support/boost/boost_1.60.0.bb         |  7 ++++
 ...dded-gcc.jam-was-passing-the-options-m32-.patch | 33 ----------------
 ...n-t-pass-m32-m64-where-it-s-not-supported.patch | 40 -------------------
 10 files changed, 90 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-support/boost/bjam-native_1.58.0.bb
 create mode 100644 meta/recipes-support/boost/bjam-native_1.60.0.bb
 delete mode 100644 meta/recipes-support/boost/boost-1.58.0.inc
 create mode 100644 meta/recipes-support/boost/boost-1.60.0.inc
 create mode 100644 meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch
 delete mode 100644 meta/recipes-support/boost/boost_1.58.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.60.0.bb
 delete mode 100644 meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch
 delete mode 100644 meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch

diff --git a/meta/recipes-support/boost/bjam-native_1.58.0.bb b/meta/recipes-support/boost/bjam-native_1.58.0.bb
deleted file mode 100644
index 32646d7..0000000
--- a/meta/recipes-support/boost/bjam-native_1.58.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-include boost-${PV}.inc
-
-SUMMARY = "Portable Boost.Jam build tool for boost"
-SECTION = "devel"
-
-inherit native
-
-SRC_URI += "file://bjam-native-build-bjam.debug.patch"
-
-do_compile() {
-    ./bootstrap.sh --with-toolset=gcc
-}
-
-do_install() {
-    install -d ${D}${bindir}/
-    # install unstripped version for bjam
-    install -c -m 755 bjam.debug ${D}${bindir}/bjam
-}
diff --git a/meta/recipes-support/boost/bjam-native_1.60.0.bb b/meta/recipes-support/boost/bjam-native_1.60.0.bb
new file mode 100644
index 0000000..32646d7
--- /dev/null
+++ b/meta/recipes-support/boost/bjam-native_1.60.0.bb
@@ -0,0 +1,18 @@
+include boost-${PV}.inc
+
+SUMMARY = "Portable Boost.Jam build tool for boost"
+SECTION = "devel"
+
+inherit native
+
+SRC_URI += "file://bjam-native-build-bjam.debug.patch"
+
+do_compile() {
+    ./bootstrap.sh --with-toolset=gcc
+}
+
+do_install() {
+    install -d ${D}${bindir}/
+    # install unstripped version for bjam
+    install -c -m 755 bjam.debug ${D}${bindir}/bjam
+}
diff --git a/meta/recipes-support/boost/boost-1.58.0.inc b/meta/recipes-support/boost/boost-1.58.0.inc
deleted file mode 100644
index b47d091..0000000
--- a/meta/recipes-support/boost/boost-1.58.0.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-# The Boost web site provides free peer-reviewed portable
-# C++ source libraries. The emphasis is on libraries which
-# work well with the C++ Standard Library. The libraries are
-# intended to be widely useful, and are in regular use by
-# thousands of programmers across a broad spectrum of applications.
-HOMEPAGE = "http://www.boost.org/"
-LICENSE = "BSL-1.0 & MIT & Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-
-BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
-BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
-BOOST_P = "boost_${BOOST_VER}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2 \
-           file://0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch \
-           file://0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch \
-"
-
-SRC_URI[md5sum] = "b8839650e61e9c1c0a89f371dd475546"
-SRC_URI[sha256sum] = "fdfc204fc33ec79c99b9a74944c3e54bd78be4f7f15e260c0e2700a36dc7d3e5"
-
-S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost-1.60.0.inc b/meta/recipes-support/boost/boost-1.60.0.inc
new file mode 100644
index 0000000..a38693e
--- /dev/null
+++ b/meta/recipes-support/boost/boost-1.60.0.inc
@@ -0,0 +1,19 @@
+# The Boost web site provides free peer-reviewed portable
+# C++ source libraries. The emphasis is on libraries which
+# work well with the C++ Standard Library. The libraries are
+# intended to be widely useful, and are in regular use by
+# thousands of programmers across a broad spectrum of applications.
+HOMEPAGE = "http://www.boost.org/"
+LICENSE = "BSL-1.0 & MIT & Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
+BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
+BOOST_P = "boost_${BOOST_VER}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
+
+SRC_URI[md5sum] = "65a840e1a0b13a558ff19eeb2c4f0cbe"
+SRC_URI[sha256sum] = "686affff989ac2488f79a97b9479efb9f2abae035b5ed4d8226de6857933fd3b"
+
+S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 7167ac3..981e6ee 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -18,6 +18,7 @@ BOOST_LIBS = "\
 	serialization \
 	signals \
 	system \
+	timer \
 	test \
 	thread \
 	"
diff --git a/meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch b/meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch
new file mode 100644
index 0000000..df7e71f
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch
@@ -0,0 +1,45 @@
+From f50e7bc9fed323c5705c0ed992c03e80eeec1dd6 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Mon, 14 Sep 2015 15:05:24 +0100
+Subject: [PATCH] Do not qualify <fenv.h> names that might be macros.
+
+The patch was imported from the boost-test git repository
+(https://github.com/boostorg/test) as of commit id
+f50e7bc9fed323c5705c0ed992c03e80eeec1dd6.
+  
+Upstream-Status: Accepted [commit f50e7bc9fed in develop branch]
+
+Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
+---
+ include/boost/test/impl/execution_monitor.ipp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/boost/test/impl/execution_monitor.ipp b/include/boost/test/impl/execution_monitor.ipp
+index b3e873e..a7bdce2 100644
+--- a/include/boost/test/impl/execution_monitor.ipp
++++ b/include/boost/test/impl/execution_monitor.ipp
+@@ -1380,8 +1380,8 @@ enable( unsigned mask )
+ 
+     return ~old_cw & BOOST_FPE_ALL;
+ #elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
+-    ::feclearexcept(BOOST_FPE_ALL);
+-    int res = ::feenableexcept( mask );
++    feclearexcept(BOOST_FPE_ALL);
++    int res = feenableexcept( mask );
+     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
+ #else
+     /* Not Implemented  */
+@@ -1417,8 +1417,8 @@ disable( unsigned mask )
+ 
+     return ~old_cw & BOOST_FPE_ALL;
+ #elif defined(__GLIBC__) && defined(__USE_GNU) && !defined(BOOST_CLANG) && !defined(BOOST_NO_FENV_H)
+-    ::feclearexcept(BOOST_FPE_ALL);
+-    int res = ::fedisableexcept( mask );
++    feclearexcept(BOOST_FPE_ALL);
++    int res = fedisableexcept( mask );
+     return res == -1 ? (unsigned)BOOST_FPE_INV : (unsigned)res;
+ #else
+     /* Not Implemented */
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/boost/boost_1.58.0.bb b/meta/recipes-support/boost/boost_1.58.0.bb
deleted file mode 100644
index c09d5f4..0000000
--- a/meta/recipes-support/boost/boost_1.58.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include boost-${PV}.inc
-include boost.inc
-
-SRC_URI += "\
-    file://arm-intrinsics.patch \
-"
diff --git a/meta/recipes-support/boost/boost_1.60.0.bb b/meta/recipes-support/boost/boost_1.60.0.bb
new file mode 100644
index 0000000..e7b91dc
--- /dev/null
+++ b/meta/recipes-support/boost/boost_1.60.0.bb
@@ -0,0 +1,7 @@
+include boost-${PV}.inc
+include boost.inc
+
+SRC_URI += "\
+    file://arm-intrinsics.patch \
+    file://0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch;striplevel=2 \
+"
diff --git a/meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch b/meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch
deleted file mode 100644
index 329b4c3..0000000
--- a/meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 817aed0d755bf8c0ba4ef6a77d41538e50b571fd Mon Sep 17 00:00:00 2001
-From: claymore <carlosmf.pt@gmail.com>
-Date: Fri, 24 Apr 2015 02:28:47 +0100
-Subject: [PATCH 1/2] mips1 fix added gcc.jam was passing the options -m32 and
- -m64 to mips cross-compilers, when those do not use
- such options This modification solves it by adding mips
- as an exception
-
-Signed-off-by: Carlos M. Ferreira carlosmf.pt@gmail.com
-
-Upstream-Status: Backport
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- tools/build/src/tools/gcc.jam |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index db04534..eff95ae 100644
---- a/tools/build/src/tools/gcc.jam
-+++ b/tools/build/src/tools/gcc.jam
-@@ -451,7 +451,7 @@ rule setup-address-model ( targets * : sources * : properties * )
-         else
-         {
-             local arch = [ feature.get-values architecture : $(properties) ] ;
--            if $(arch) != arm
-+            if $(arch) != arm && $(arch) != mips1
-             {
-                 if $(model) = 32
-                 {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch b/meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch
deleted file mode 100644
index ecf7e55..0000000
--- a/meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f825634a56b119dfa9d712119a66279cc7635978 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sat, 2 May 2015 14:24:02 +0200
-Subject: [PATCH 2/2] Don't pass -m32/-m64 where it's not supported.
-
-Only PowerPC, SPARC, and x86 do support the -m32 and -m64 compiler options [1].
-
-Rather then excluding all architectures not supporting these options as it is
-done in commit c0634341d9ee2c02d3a55c91dafb988afc066c49 [2], include all
-architectures that do support them.
-
-This will fix building Boost for the SuperH architecture with Buildroot [3].
-
-[1] https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
-[2] https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
-[3] http://autobuild.buildroot.net/results/ccd/ccd5c83963032ba49b1627b1dff39e34a9486943/build-end.log
-
-Upstream-Status: Backport
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- tools/build/src/tools/gcc.jam |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index eff95ae..2f6af93 100644
---- a/tools/build/src/tools/gcc.jam
-+++ b/tools/build/src/tools/gcc.jam
-@@ -451,7 +451,7 @@ rule setup-address-model ( targets * : sources * : properties * )
-         else
-         {
-             local arch = [ feature.get-values architecture : $(properties) ] ;
--            if $(arch) != arm && $(arch) != mips1
-+            if $(arch) = power || $(arch) = sparc || $(arch) = x86
-             {
-                 if $(model) = 32
-                 {
--- 
-1.7.9.5
-
-- 
1.9.1


