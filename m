Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE41E78635
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 05:43:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0G5hoDs019908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 21:43:50 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 15 Jan 2018 21:43:50 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jan 2018 13:42:52 +0800
Message-ID: <1516081372-173265-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
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
X-List-Received-Date: Tue, 16 Jan 2018 05:43:49 -0000
Content-Type: text/plain

When working path contains "clang"/"gcc"/"icc", it might be part of $CC
because of the "--sysroot" parameter. That could cause judgement error
about clang/gcc/icc compilers. e.g.
When "icc" is containded in working path, below errors are reported when
compiling python/python3:
x86_64-wrs-linux-gcc: error: strict: No such file or directory
x86_64-wrs-linux-gcc: error: unrecognized command line option '-fp-model'

Here use cc_basename to replace CC for checking compiler to avoid such
kind of issue.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...cc_basename-to-replace-CC-for-checking-co.patch | 118 ++++++++++++++++++
 ...-cc_basename-to-replace-CC-for-checking-c.patch | 136 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |   1 +
 meta/recipes-devtools/python/python_2.7.13.bb      |   1 +
 4 files changed, 256 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-python-use-cc_basename-to-replace-CC-for-checking-co.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch

diff --git a/meta/recipes-devtools/python/python/0001-python-use-cc_basename-to-replace-CC-for-checking-co.patch b/meta/recipes-devtools/python/python/0001-python-use-cc_basename-to-replace-CC-for-checking-co.patch
new file mode 100644
index 0000000..fae324f
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-python-use-cc_basename-to-replace-CC-for-checking-co.patch
@@ -0,0 +1,118 @@
+From b60dea18372dabbef0ec9abf06855e209af4f53d Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Tue, 16 Jan 2018 10:31:49 +0800
+Subject: [PATCH] python: use cc_basename to replace CC for checking compiler
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
+---
+ configure.ac | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dcf733f..f1e9a7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,6 +15,7 @@ AC_CONFIG_HEADER(pyconfig.h)
+ AC_CANONICAL_HOST
+ AC_SUBST(build)
+ AC_SUBST(host)
++LT_INIT
+ 
+ # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
+ rm -f pybuilddir.txt
+@@ -670,7 +671,7 @@ AC_MSG_RESULT($with_cxx_main)
+ preset_cxx="$CXX"
+ if test -z "$CXX"
+ then
+-        case "$CC" in
++        case "$cc_basename" in
+         gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
+         cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
+         esac
+@@ -743,14 +744,14 @@ rmdir CaseSensitiveTestDir
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
+@@ -1073,7 +1074,7 @@ then
+         fi
+ 
+         # Clang also needs -fwrapv
+-        case $CC in
++        case $cc_basename in
+             *clang*) WRAP="-fwrapv"
+             ;;
+         esac
+@@ -1277,7 +1278,7 @@ yes)
+ esac
+ 
+ # ICC needs -fp-model strict or floats behave badly
+-case "$CC" in
++case "$cc_basename" in
+ *icc*)
+     BASECFLAGS="$BASECFLAGS -fp-model strict"
+     ;;
+@@ -1417,7 +1418,7 @@ else
+ fi],
+ [AC_MSG_RESULT(no)])
+ if test "$Py_LTO" = 'true' ; then
+-  case $CC in
++  case $cc_basename in
+     *clang*)
+       # Any changes made here should be reflected in the GCC+Darwin case below
+       LTOFLAGS="-flto"
+@@ -1482,7 +1483,7 @@ then
+   fi
+ fi
+ LLVM_PROF_ERR=no
+-case $CC in
++case $cc_basename in
+   *clang*)
+     # Any changes made here should be reflected in the GCC+Darwin case below
+     PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
+@@ -2300,7 +2301,7 @@ then
+ 		then CCSHARED="-fPIC"
+ 		else CCSHARED="-Kpic -belf"
+ 		fi;;
+-	IRIX*/6*)  case $CC in
++	IRIX*/6*)  case $cc_basename in
+ 		   *gcc*) CCSHARED="-shared";;
+ 		   *) CCSHARED="";;
+ 		   esac;;
+@@ -2344,7 +2345,7 @@ then
+ 		then
+ 			LINKFORSHARED="-Wl,--export-dynamic"
+ 		fi;;
+-	SunOS/5*) case $CC in
++	SunOS/5*) case $cc_basename in
+ 		  *gcc*)
+ 		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
+ 		    then
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
new file mode 100644
index 0000000..39935ab
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -0,0 +1,136 @@
+From 654a20898d70e4a56313121051258582dcec1ab6 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Tue, 16 Jan 2018 10:39:34 +0800
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
+---
+ configure.ac | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d8c2847..e487954 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,6 +52,7 @@ AC_CONFIG_HEADER(pyconfig.h)
+ AC_CANONICAL_HOST
+ AC_SUBST(build)
+ AC_SUBST(host)
++LT_INIT
+ 
+ # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
+ rm -f pybuilddir.txt
+@@ -723,7 +724,7 @@ AC_MSG_RESULT($with_cxx_main)
+ preset_cxx="$CXX"
+ if test -z "$CXX"
+ then
+-        case "$CC" in
++        case "$cc_basename" in
+         gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
+         cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
+         clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
+@@ -985,14 +986,14 @@ rmdir CaseSensitiveTestDir
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
+@@ -1317,7 +1318,7 @@ else
+ fi],
+ [AC_MSG_RESULT(no)])
+ if test "$Py_LTO" = 'true' ; then
+-  case $CC in
++  case $cc_basename in
+     *clang*)
+       # Any changes made here should be reflected in the GCC+Darwin case below
+       LTOFLAGS="-flto"
+@@ -1381,7 +1382,7 @@ then
+   fi
+ fi
+ LLVM_PROF_ERR=no
+-case $CC in
++case $cc_basename in
+   *clang*)
+     # Any changes made here should be reflected in the GCC+Darwin case below
+     PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
+@@ -1458,7 +1459,7 @@ then
+         fi
+ 
+         # Clang also needs -fwrapv
+-        case $CC in
++        case $cc_basename in
+             *clang*) WRAP="-fwrapv"
+             ;;
+         esac
+@@ -1540,7 +1541,7 @@ yes)
+ 
+     # ICC doesn't recognize the option, but only emits a warning
+     ## XXX does it emit an unused result warning and can it be disabled?
+-    case "$CC" in
++    case "$cc_basename" in
+     *icc*)
+     ac_cv_disable_unused_result_warning=no
+     ;;
+@@ -1795,7 +1796,7 @@ yes)
+ esac
+ 
+ # ICC needs -fp-model strict or floats behave badly
+-case "$CC" in
++case "$cc_basename" in
+ *icc*)
+     CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
+     ;;
+@@ -2561,7 +2562,7 @@ then
+ 		then CCSHARED="-fPIC"
+ 		else CCSHARED="-Kpic -belf"
+ 		fi;;
+-	IRIX*/6*)  case $CC in
++	IRIX*/6*)  case $cc_basename in
+ 		   *gcc*) CCSHARED="-shared";;
+ 		   *) CCSHARED="";;
+ 		   esac;;
+@@ -2602,7 +2603,7 @@ then
+ 		then
+ 			LINKFORSHARED="-Wl,--export-dynamic"
+ 		fi;;
+-	SunOS/5*) case $CC in
++	SunOS/5*) case $cc_basename in
+ 		  *gcc*)
+ 		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
+ 		    then
+@@ -5232,7 +5233,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
+     # Some versions of gcc miscompile inline asm:
+     # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
+     # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
+-    case $CC in
++    case $cc_basename in
+         *gcc*)
+             AC_MSG_CHECKING(for gcc ipa-pure-const bug)
+             saved_cflags="$CFLAGS"
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 13df12f..593dc5b 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -40,6 +40,7 @@ SRC_URI += "\
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://Fix-29519-weakref-spewing-exceptions-during-interp-f.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
+            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            "
 SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
 SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 8770699..ea5f8c3 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -29,6 +29,7 @@ SRC_URI += "\
   file://Don-t-use-getentropy-on-Linux.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
+  file://0001-python-use-cc_basename-to-replace-CC-for-checking-co.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


