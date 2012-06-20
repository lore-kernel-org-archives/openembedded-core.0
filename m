Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShMrt-0001Gg-4i
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:30:53 +0200
Received: by dalh21 with SMTP id h21so9610351dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EvJAu2aoOH0I/SNcLBjs6U1BzwcxNUvqxSQlrwvJUNQ=;
	b=Vc+4FNRYgKitbMwZJGK/KAH0aLbFlVF0juEVKBmPBuPN9TErZ2xwEpcxR7m9MWRUl4
	ueJx4JB7Dnx6om4YpPBDLVMtyAWLqpuwJbV2CGMlhKFcRNtu4esx+HWyfivPN55ZPKlp
	Obo15zQPmt0tq4QIw8yKWkf/ohv08S6EL4DREDymySC54Z7NRwG6HK9buZ700PmTSwCT
	jU7wbj71vrj6B98bo9ZlXdJ11JdaqpJg5cmeZARsDOcmTaLnGjdgeUKgNUFQkLaOBRMG
	9I3rWoSiWe/CyvRga5AJMGe6ZyN5gizaNs+JRcXORGNwj6JjAmoDGPohOiHR/Mt8Pnh/
	BnAQ==
Received: by 10.68.195.198 with SMTP id ig6mr78737832pbc.92.1340205604740;
	Wed, 20 Jun 2012 08:20:04 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id jw3sm32227422pbc.65.2012.06.20.08.20.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 08:20:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 08:18:39 -0700
Message-Id: <4a661287ddef3d6b47e2005c9a10bfa28a6d6fb2.1340205164.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
References: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340205163.git.raj.khem@gmail.com>
References: <cover.1340205163.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] gcc: Fix a case of sysroot with trailing / and gxx-include-dir leading slash
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
X-List-Received-Date: Wed, 20 Jun 2012 15:30:53 -0000

when using --with-sysroot=/ and --with-gxx-headers=/usr/include/c++
configure eats up one leading / from gxx include dir
fixed thusly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/fix-g++-sysroot.patch              |  428 ++++++++++++++++++++
 2 files changed, 429 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 25a1088..65153b3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -67,6 +67,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://mips64-default-n64.patch \
 	   file://arm-hard-float-loader.patch \
 	   file://gcc-argument-list-too-long.patch \
+	   file://fix-g++-sysroot.patch \
 	  "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
new file mode 100644
index 0000000..116f137
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
@@ -0,0 +1,428 @@
+backport
+
+http://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg26013.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4_7-branch/gcc/configure.ac
+===================================================================
+--- gcc-4_7-branch.orig/gcc/configure.ac	2012-06-20 00:21:52.182955919 -0700
++++ gcc-4_7-branch/gcc/configure.ac	2012-06-20 00:28:01.386973785 -0700
+@@ -118,6 +118,72 @@
+ 	local_prefix=/usr/local
+ fi
+ 
++AC_ARG_WITH([native-system-header-dir],
++  [  --with-native-system-header-dir=dir
++                          use dir as the directory to look for standard
++                          system header files in.  Defaults to /usr/include.],
++[
++ case ${with_native_system_header_dir} in
++ yes|no) AC_MSG_ERROR([bad value ${withval} given for --with-native-system-header-dir]) ;;
++ /* | [[A-Za-z]]:[[\\/]]*) ;;
++ *) AC_MSG_ERROR([--with-native-system-header-dir argument ${withval} must be an absolute directory]) ;;
++ esac
++ configured_native_system_header_dir="${withval}"
++], [configured_native_system_header_dir=])
++
++AC_ARG_WITH(build-sysroot,
++  [AS_HELP_STRING([--with-build-sysroot=sysroot],
++                  [use sysroot as the system root during the build])],
++  [if test x"$withval" != x ; then
++     SYSROOT_CFLAGS_FOR_TARGET="--sysroot=$withval"
++   fi],
++  [SYSROOT_CFLAGS_FOR_TARGET=])
++AC_SUBST(SYSROOT_CFLAGS_FOR_TARGET)
++
++AC_ARG_WITH(sysroot,
++[AS_HELP_STRING([[--with-sysroot[=DIR]]],
++ [search for usr/lib, usr/include, et al, within DIR])],
++[
++ case ${with_sysroot} in
++ /) ;;
++ */) with_sysroot=`echo $with_sysroot | sed 's,/$,,'` ;;
++ esac
++ case ${with_sysroot} in
++ yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
++ *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
++ esac
++
++ TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
++ CROSS_SYSTEM_HEADER_DIR='$(TARGET_SYSTEM_ROOT)$${sysroot_headers_suffix}$(NATIVE_SYSTEM_HEADER_DIR)'
++
++ if test "x$prefix" = xNONE; then
++  test_prefix=/usr/local
++ else
++  test_prefix=$prefix
++ fi
++ if test "x$exec_prefix" = xNONE; then
++  test_exec_prefix=$test_prefix
++ else
++  test_exec_prefix=$exec_prefix
++ fi
++ case ${TARGET_SYSTEM_ROOT} in
++ "${test_prefix}"|"${test_prefix}/"*|\
++ "${test_exec_prefix}"|"${test_exec_prefix}/"*|\
++ '${prefix}'|'${prefix}/'*|\
++ '${exec_prefix}'|'${exec_prefix}/'*)
++   t="$TARGET_SYSTEM_ROOT_DEFINE -DTARGET_SYSTEM_ROOT_RELOCATABLE"
++   TARGET_SYSTEM_ROOT_DEFINE="$t"
++   ;;
++ esac
++], [
++ TARGET_SYSTEM_ROOT=
++ TARGET_SYSTEM_ROOT_DEFINE=
++ CROSS_SYSTEM_HEADER_DIR='$(gcc_tooldir)/sys-include'
++])
++AC_SUBST(TARGET_SYSTEM_ROOT)
++AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
++AC_SUBST(CROSS_SYSTEM_HEADER_DIR)
++
+ # Don't set gcc_gxx_include_dir to gxx_include_dir since that's only
+ # passed in by the toplevel make and thus we'd get different behavior
+ # depending on where we built the sources.
+@@ -149,7 +215,9 @@
+ if test "${with_sysroot+set}" = set; then
+   gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
+   if test "${gcc_gxx_without_sysroot}"; then
+-    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    if test x${with_sysroot} != x/; then
++      gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    fi
+     gcc_gxx_include_dir_add_sysroot=1
+   fi
+ fi
+@@ -733,68 +801,6 @@
+ ], [enable_shared=yes])
+ AC_SUBST(enable_shared)
+ 
+-AC_ARG_WITH([native-system-header-dir],
+-  [  --with-native-system-header-dir=dir
+-                          use dir as the directory to look for standard
+-                          system header files in.  Defaults to /usr/include.],
+-[
+- case ${with_native_system_header_dir} in
+- yes|no) AC_MSG_ERROR([bad value ${withval} given for --with-native-system-header-dir]) ;;
+- /* | [[A-Za-z]]:[[\\/]]*) ;;
+- *) AC_MSG_ERROR([--with-native-system-header-dir argument ${withval} must be an absolute directory]) ;;
+- esac
+- configured_native_system_header_dir="${withval}"
+-], [configured_native_system_header_dir=])
+-
+-AC_ARG_WITH(build-sysroot, 
+-  [AS_HELP_STRING([--with-build-sysroot=sysroot],
+-                  [use sysroot as the system root during the build])],
+-  [if test x"$withval" != x ; then
+-     SYSROOT_CFLAGS_FOR_TARGET="--sysroot=$withval"
+-   fi],
+-  [SYSROOT_CFLAGS_FOR_TARGET=])
+-AC_SUBST(SYSROOT_CFLAGS_FOR_TARGET)
+-
+-AC_ARG_WITH(sysroot,
+-[AS_HELP_STRING([[--with-sysroot[=DIR]]],
+-		[search for usr/lib, usr/include, et al, within DIR])],
+-[
+- case ${with_sysroot} in
+- yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
+- *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
+- esac
+-   
+- TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
+- CROSS_SYSTEM_HEADER_DIR='$(TARGET_SYSTEM_ROOT)$${sysroot_headers_suffix}$(NATIVE_SYSTEM_HEADER_DIR)'
+-	
+- if test "x$prefix" = xNONE; then
+-  test_prefix=/usr/local
+- else
+-  test_prefix=$prefix
+- fi
+- if test "x$exec_prefix" = xNONE; then
+-  test_exec_prefix=$test_prefix
+- else
+-  test_exec_prefix=$exec_prefix
+- fi
+- case ${TARGET_SYSTEM_ROOT} in
+- "${test_prefix}"|"${test_prefix}/"*|\
+- "${test_exec_prefix}"|"${test_exec_prefix}/"*|\
+- '${prefix}'|'${prefix}/'*|\
+- '${exec_prefix}'|'${exec_prefix}/'*)
+-   t="$TARGET_SYSTEM_ROOT_DEFINE -DTARGET_SYSTEM_ROOT_RELOCATABLE"
+-   TARGET_SYSTEM_ROOT_DEFINE="$t"
+-   ;;
+- esac
+-], [
+- TARGET_SYSTEM_ROOT=
+- TARGET_SYSTEM_ROOT_DEFINE=
+- CROSS_SYSTEM_HEADER_DIR='$(gcc_tooldir)/sys-include'
+-])
+-AC_SUBST(TARGET_SYSTEM_ROOT)
+-AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+-AC_SUBST(CROSS_SYSTEM_HEADER_DIR)
+-
+ AC_ARG_WITH(specs,
+   [AS_HELP_STRING([--with-specs=SPECS],
+                   [add SPECS to driver command-line processing])],
+Index: gcc-4_7-branch/gcc/configure
+===================================================================
+--- gcc-4_7-branch.orig/gcc/configure	2012-06-20 00:27:18.778971725 -0700
++++ gcc-4_7-branch/gcc/configure	2012-06-20 00:28:06.634974041 -0700
+@@ -757,10 +757,6 @@
+ REPORT_BUGS_TO
+ PKGVERSION
+ CONFIGURE_SPECS
+-CROSS_SYSTEM_HEADER_DIR
+-TARGET_SYSTEM_ROOT_DEFINE
+-TARGET_SYSTEM_ROOT
+-SYSROOT_CFLAGS_FOR_TARGET
+ enable_shared
+ enable_fixed_point
+ enable_decimal_float
+@@ -798,6 +794,10 @@
+ CFLAGS
+ CC
+ GENINSRC
++CROSS_SYSTEM_HEADER_DIR
++TARGET_SYSTEM_ROOT_DEFINE
++TARGET_SYSTEM_ROOT
++SYSROOT_CFLAGS_FOR_TARGET
+ target_subdir
+ host_subdir
+ build_subdir
+@@ -859,6 +859,9 @@
+ enable_option_checking
+ with_build_libsubdir
+ with_local_prefix
++with_native_system_header_dir
++with_build_sysroot
++with_sysroot
+ with_gxx_include_dir
+ with_cpp_install_dir
+ enable_generated_files_in_srcdir
+@@ -883,9 +886,6 @@
+ enable_objc_gc
+ with_dwarf2
+ enable_shared
+-with_native_system_header_dir
+-with_build_sysroot
+-with_sysroot
+ with_specs
+ with_pkgversion
+ with_bugurl
+@@ -1639,6 +1639,12 @@
+   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
+   --with-build-libsubdir=DIR  Directory where to find libraries for build system
+   --with-local-prefix=DIR specifies directory to put local include
++  --with-native-system-header-dir=dir
++                          use dir as the directory to look for standard
++                          system header files in.  Defaults to /usr/include.
++  --with-build-sysroot=sysroot
++                          use sysroot as the system root during the build
++  --with-sysroot[=DIR]    search for usr/lib, usr/include, et al, within DIR
+   --with-gxx-include-dir=DIR
+                           specifies directory to put g++ header files
+   --with-cpp-install-dir=DIR
+@@ -1651,12 +1657,6 @@
+   --with-as               arrange to use the specified as (full pathname)
+   --with-stabs            arrange to use stabs instead of host debug format
+   --with-dwarf2           force the default debug format to be DWARF 2
+-  --with-native-system-header-dir=dir
+-                          use dir as the directory to look for standard
+-                          system header files in.  Defaults to /usr/include.
+-  --with-build-sysroot=sysroot
+-                          use sysroot as the system root during the build
+-  --with-sysroot[=DIR]    search for usr/lib, usr/include, et al, within DIR
+   --with-specs=SPECS      add SPECS to driver command-line processing
+   --with-pkgversion=PKG   Use PKG in the version string in place of "GCC"
+   --with-bugurl=URL       Direct users to URL to report a bug
+@@ -3288,6 +3288,82 @@
+ 	local_prefix=/usr/local
+ fi
+ 
++
++# Check whether --with-native-system-header-dir was given.
++if test "${with_native_system_header_dir+set}" = set; then :
++  withval=$with_native_system_header_dir;
++ case ${with_native_system_header_dir} in
++ yes|no) as_fn_error "bad value ${withval} given for --with-native-system-header-dir" "$LINENO" 5 ;;
++ /* | [A-Za-z]:[\\/]*) ;;
++ *) as_fn_error "--with-native-system-header-dir argument ${withval} must be an absolute directory" "$LINENO" 5 ;;
++ esac
++ configured_native_system_header_dir="${withval}"
++
++else
++  configured_native_system_header_dir=
++fi
++
++
++
++# Check whether --with-build-sysroot was given.
++if test "${with_build_sysroot+set}" = set; then :
++  withval=$with_build_sysroot; if test x"$withval" != x ; then
++     SYSROOT_CFLAGS_FOR_TARGET="--sysroot=$withval"
++   fi
++else
++  SYSROOT_CFLAGS_FOR_TARGET=
++fi
++
++
++
++
++# Check whether --with-sysroot was given.
++if test "${with_sysroot+set}" = set; then :
++  withval=$with_sysroot;
++ case ${with_sysroot} in
++ /) ;;
++ */) with_sysroot=`echo $with_sysroot | sed 's,/$,,'` ;;
++ esac
++ case ${with_sysroot} in
++ yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
++ *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
++ esac
++
++ TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
++ CROSS_SYSTEM_HEADER_DIR='$(TARGET_SYSTEM_ROOT)$${sysroot_headers_suffix}$(NATIVE_SYSTEM_HEADER_DIR)'
++
++ if test "x$prefix" = xNONE; then
++  test_prefix=/usr/local
++ else
++  test_prefix=$prefix
++ fi
++ if test "x$exec_prefix" = xNONE; then
++  test_exec_prefix=$test_prefix
++ else
++  test_exec_prefix=$exec_prefix
++ fi
++ case ${TARGET_SYSTEM_ROOT} in
++ "${test_prefix}"|"${test_prefix}/"*|\
++ "${test_exec_prefix}"|"${test_exec_prefix}/"*|\
++ '${prefix}'|'${prefix}/'*|\
++ '${exec_prefix}'|'${exec_prefix}/'*)
++   t="$TARGET_SYSTEM_ROOT_DEFINE -DTARGET_SYSTEM_ROOT_RELOCATABLE"
++   TARGET_SYSTEM_ROOT_DEFINE="$t"
++   ;;
++ esac
++
++else
++
++ TARGET_SYSTEM_ROOT=
++ TARGET_SYSTEM_ROOT_DEFINE=
++ CROSS_SYSTEM_HEADER_DIR='$(gcc_tooldir)/sys-include'
++
++fi
++
++
++
++
++
+ # Don't set gcc_gxx_include_dir to gxx_include_dir since that's only
+ # passed in by the toplevel make and thus we'd get different behavior
+ # depending on where we built the sources.
+@@ -3321,7 +3397,9 @@
+ if test "${with_sysroot+set}" = set; then
+   gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
+   if test "${gcc_gxx_without_sysroot}"; then
+-    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    if test x${with_sysroot} != x/; then
++      gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    fi
+     gcc_gxx_include_dir_add_sysroot=1
+   fi
+ fi
+@@ -7220,78 +7298,6 @@
+ 
+ 
+ 
+-# Check whether --with-native-system-header-dir was given.
+-if test "${with_native_system_header_dir+set}" = set; then :
+-  withval=$with_native_system_header_dir;
+- case ${with_native_system_header_dir} in
+- yes|no) as_fn_error "bad value ${withval} given for --with-native-system-header-dir" "$LINENO" 5 ;;
+- /* | [A-Za-z]:[\\/]*) ;;
+- *) as_fn_error "--with-native-system-header-dir argument ${withval} must be an absolute directory" "$LINENO" 5 ;;
+- esac
+- configured_native_system_header_dir="${withval}"
+-
+-else
+-  configured_native_system_header_dir=
+-fi
+-
+-
+-
+-# Check whether --with-build-sysroot was given.
+-if test "${with_build_sysroot+set}" = set; then :
+-  withval=$with_build_sysroot; if test x"$withval" != x ; then
+-     SYSROOT_CFLAGS_FOR_TARGET="--sysroot=$withval"
+-   fi
+-else
+-  SYSROOT_CFLAGS_FOR_TARGET=
+-fi
+-
+-
+-
+-
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
+- case ${with_sysroot} in
+- yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
+- *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
+- esac
+-
+- TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
+- CROSS_SYSTEM_HEADER_DIR='$(TARGET_SYSTEM_ROOT)$${sysroot_headers_suffix}$(NATIVE_SYSTEM_HEADER_DIR)'
+-
+- if test "x$prefix" = xNONE; then
+-  test_prefix=/usr/local
+- else
+-  test_prefix=$prefix
+- fi
+- if test "x$exec_prefix" = xNONE; then
+-  test_exec_prefix=$test_prefix
+- else
+-  test_exec_prefix=$exec_prefix
+- fi
+- case ${TARGET_SYSTEM_ROOT} in
+- "${test_prefix}"|"${test_prefix}/"*|\
+- "${test_exec_prefix}"|"${test_exec_prefix}/"*|\
+- '${prefix}'|'${prefix}/'*|\
+- '${exec_prefix}'|'${exec_prefix}/'*)
+-   t="$TARGET_SYSTEM_ROOT_DEFINE -DTARGET_SYSTEM_ROOT_RELOCATABLE"
+-   TARGET_SYSTEM_ROOT_DEFINE="$t"
+-   ;;
+- esac
+-
+-else
+-
+- TARGET_SYSTEM_ROOT=
+- TARGET_SYSTEM_ROOT_DEFINE=
+- CROSS_SYSTEM_HEADER_DIR='$(gcc_tooldir)/sys-include'
+-
+-fi
+-
+-
+-
+-
+-
+-
+ # Check whether --with-specs was given.
+ if test "${with_specs+set}" = set; then :
+   withval=$with_specs; CONFIGURE_SPECS=$withval
+@@ -17973,7 +17979,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17976 "configure"
++#line 17982 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -18079,7 +18085,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 18082 "configure"
++#line 18088 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
-- 
1.7.5.4



