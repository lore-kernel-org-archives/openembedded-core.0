Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF3379BBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 05:22:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9N5MJYP006315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 22:22:20 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 22 Oct 2018 22:22:19 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2018 13:22:18 +0800
Message-ID: <1540272138-339071-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python/python3: use cc_basename to replace CC for checking compiler
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
X-List-Received-Date: Tue, 23 Oct 2018 05:22:19 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

When working path contains "clang"/"gcc"/"icc", it might be part of $CC
because of the "--sysroot" parameter. That could cause judgement error
about clang/gcc/icc compilers.

eg: if build under /yocto/builds/xicc/,  bitbake python,  $CC will contains
xicc, will make $CC match *icc, but actuall xicc just folder name.

When "*icc" is matched, below errors are reported when
compiling python/python3:
x86_64-wrs-linux-gcc: error: strict: No such file or directory
x86_64-wrs-linux-gcc: error: unrecognized command line option '-fp-model'

Here use cc_basename to replace CC for checking compiler to avoid such
kind of issue.

Signed-off-by: Li Zhou <li.zhou@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-cc_basename-to-replace-CC-for-checking-c.patch | 114 +++++++++++++++++
 ...-cc_basename-to-replace-CC-for-checking-c.patch | 140 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb      |   1 +
 meta/recipes-devtools/python/python_2.7.15.bb      |   1 +
 4 files changed, 256 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch

diff --git a/meta/recipes-devtools/python/python/0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python/0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch
new file mode 100644
index 0000000..6e4f820
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -0,0 +1,114 @@
+From 3f49be81e31c164654aeb10b65ebade982ca2ed8 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 22 Oct 2018 15:24:48 +0800
+Subject: [PATCH] python2: use cc_basename to replace CC for checking compiler
+
+When working path contains "clang"/"gcc"/"icc", it might be part of $CC
+because of the "--sysroot" parameter. That could cause judgement error
+about clang/gcc/icc compilers. e.g.
+When "icc" is containded in working path, below errors are reported when
+compiling python:
+x86_64-wrs-linux-gcc: error: strict: No such file or directory
+x86_64-wrs-linux-gcc: error: unrecognized command line option '-fp-model'
+
+Here use cc_basename to replace CC for checking compiler to avoid such
+kind of issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+
+Patch orignally from Li Zhou, I just rework it to new version
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index db1c940..dfcd89a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -684,7 +684,7 @@ AC_MSG_RESULT($with_cxx_main)
+ preset_cxx="$CXX"
+ if test -z "$CXX"
+ then
+-        case "$CC" in
++        case "$cc_basename" in
+         gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
+         cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
+         esac
+@@ -757,14 +757,14 @@ rmdir CaseSensitiveTestDir
+ 
+ case $MACHDEP in
+ bsdos*)
+-    case $CC in
++    case $cc_basename in
+     gcc) CC="$CC -D_HAVE_BSDI";;
+     esac;;
+ esac
+ 
+ case $ac_sys_system in
+ hp*|HP*)
+-    case $CC in
++    case $cc_basename in
+     cc|*/cc) CC="$CC -Ae";;
+     esac;;
+ SunOS*)
+@@ -1084,7 +1084,7 @@ then
+         fi
+ 
+         # Clang also needs -fwrapv
+-        case $CC in
++        case $cc_basename in
+             *clang*) WRAP="-fwrapv"
+             ;;
+         esac
+@@ -1304,7 +1304,7 @@ yes)
+ esac
+ 
+ # ICC needs -fp-model strict or floats behave badly
+-case "$CC" in
++case "$cc_basename" in
+ *icc*)
+     BASECFLAGS="$BASECFLAGS -fp-model strict"
+     ;;
+@@ -1443,7 +1443,7 @@ else
+ fi],
+ [AC_MSG_RESULT(no)])
+ if test "$Py_LTO" = 'true' ; then
+-  case $CC in
++  case $cc_basename in
+     *clang*)
+       # Any changes made here should be reflected in the GCC+Darwin case below
+       LTOFLAGS="-flto"
+@@ -1508,7 +1508,7 @@ then
+   fi
+ fi
+ LLVM_PROF_ERR=no
+-case $CC in
++case $cc_basename in
+   *clang*)
+     # Any changes made here should be reflected in the GCC+Darwin case below
+     PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
+@@ -2322,7 +2322,7 @@ then
+ 		then CCSHARED="-fPIC"
+ 		else CCSHARED="-Kpic -belf"
+ 		fi;;
+-	IRIX*/6*)  case $CC in
++	IRIX*/6*)  case $cc_basename in
+ 		   *gcc*) CCSHARED="-shared";;
+ 		   *) CCSHARED="";;
+ 		   esac;;
+@@ -2366,7 +2366,7 @@ then
+ 		then
+ 			LINKFORSHARED="-Wl,--export-dynamic"
+ 		fi;;
+-	SunOS/5*) case $CC in
++	SunOS/5*) case $cc_basename in
+ 		  *gcc*)
+ 		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
+ 		    then
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
new file mode 100644
index 0000000..ae47366
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -0,0 +1,140 @@
+From 564a5cc634028970dc2f9d8ecc0e464a4fb1dcb6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 22 Oct 2018 15:19:51 +0800
+Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
+
+When working path contains "clang"/"gcc"/"icc", it might be part of $CC
+because of the "--sysroot" parameter. That could cause judgement error
+about clang/gcc/icc compilers. e.g.
+When "icc" is containded in working path, below errors are reported when
+compiling python3:
+x86_64-wrs-linux-gcc: error: strict: No such file or directory
+x86_64-wrs-linux-gcc: error: unrecognized command line option '-fp-model'
+
+Here use cc_basename to replace CC for checking compiler to avoid such
+kind of issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+
+patch originally from Li Zhou, I just rework it to new version
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 95c98d1..1b9589e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)
+ AC_CANONICAL_HOST
+ AC_SUBST(build)
+ AC_SUBST(host)
++LT_INIT
+ 
+ # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
+ rm -f pybuilddir.txt
+@@ -716,7 +717,7 @@ AC_MSG_RESULT($with_cxx_main)
+ preset_cxx="$CXX"
+ if test -z "$CXX"
+ then
+-        case "$CC" in
++        case "$cc_basename" in
+         gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
+         cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
+         clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
+@@ -978,14 +979,14 @@ rmdir CaseSensitiveTestDir
+ 
+ case $MACHDEP in
+ bsdos*)
+-    case $CC in
++    case $cc_basename in
+     gcc) CC="$CC -D_HAVE_BSDI";;
+     esac;;
+ esac
+ 
+ case $ac_sys_system in
+ hp*|HP*)
+-    case $CC in
++    case $cc_basename in
+     cc|*/cc) CC="$CC -Ae";;
+     esac;;
+ esac
+@@ -1310,7 +1311,7 @@ else
+ fi],
+ [AC_MSG_RESULT(no)])
+ if test "$Py_LTO" = 'true' ; then
+-  case $CC in
++  case $cc_basename in
+     *clang*)
+       # Any changes made here should be reflected in the GCC+Darwin case below
+       LTOFLAGS="-flto"
+@@ -1374,7 +1375,7 @@ then
+   fi
+ fi
+ LLVM_PROF_ERR=no
+-case $CC in
++case $cc_basename in
+   *clang*)
+     # Any changes made here should be reflected in the GCC+Darwin case below
+     PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
+@@ -1451,7 +1452,7 @@ then
+            WRAP="-fwrapv"
+         fi
+ 
+-        case $CC in
++        case $cc_basename in
+             *clang*)
+                 cc_is_clang=1
+                 ;;
+@@ -1553,7 +1554,7 @@ yes)
+ 
+     # ICC doesn't recognize the option, but only emits a warning
+     ## XXX does it emit an unused result warning and can it be disabled?
+-    case "$CC" in
++    case "$cc_basename" in
+     *icc*)
+     ac_cv_disable_unused_result_warning=no
+     ;;
+@@ -1808,7 +1809,7 @@ yes)
+ esac
+ 
+ # ICC needs -fp-model strict or floats behave badly
+-case "$CC" in
++case "$cc_basename" in
+ *icc*)
+     CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
+     ;;
+@@ -2574,7 +2575,7 @@ then
+ 		then CCSHARED="-fPIC"
+ 		else CCSHARED="-Kpic -belf"
+ 		fi;;
+-	IRIX*/6*)  case $CC in
++	IRIX*/6*)  case $cc_basename in
+ 		   *gcc*) CCSHARED="-shared";;
+ 		   *) CCSHARED="";;
+ 		   esac;;
+@@ -2615,7 +2616,7 @@ then
+ 		then
+ 			LINKFORSHARED="-Wl,--export-dynamic"
+ 		fi;;
+-	SunOS/5*) case $CC in
++	SunOS/5*) case $cc_basename in
+ 		  *gcc*)
+ 		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
+ 		    then
+@@ -5187,7 +5188,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
+     # Some versions of gcc miscompile inline asm:
+     # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
+     # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
+-    case $CC in
++    case $cc_basename in
+         *gcc*)
+             AC_MSG_CHECKING(for gcc ipa-pure-const bug)
+             saved_cflags="$CFLAGS"
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 2a45476..944d6f3 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -45,6 +45,7 @@ SRC_URI += "\
             file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
             file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
             file://run-ptest \
+            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            "
 
 inherit multilib_header python3native update-alternatives qemu ptest
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index dd969d8..f50b43a 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -33,6 +33,7 @@ SRC_URI += "\
   file://float-endian.patch \
   file://0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch \
   file://0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch \
+  file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


