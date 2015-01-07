Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45FF77284C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 15:02:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t07F2AYM027098
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 07:02:10 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 07:02:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 07:02:07 -0800
Message-ID: <a4b53d0ddc7976a58e0bc5c094dab61886f84e20.1420642796.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420642796.git.liezhi.yang@windriver.com>
References: <cover.1420642796.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libtool: upgrade to 2.4.4
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
X-List-Received-Date: Wed, 07 Jan 2015 15:02:10 -0000
Content-Type: text/plain

* Upgrade:
  - libtool-native
  - libtool-cross
  - nativesdk-libtool
  - libtool

* Remove 2 patches:
  - respect-fstack-protector.patch: already in the new source.
  - avoid_absolute_paths_for_general_utils.patch: no general.m4sh any
    more.

* Update other patches

* The LIC_FILES_CHKSUM is changed because of the indent, the contents
  are the same.

* The libtool config files are put in libtool/build-aux now, it was
  libtool/config in the past.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{libtool-2.4.2.inc => libtool-2.4.4.inc}       |   16 +--
 ...btool-cross_2.4.2.bb => libtool-cross_2.4.4.bb} |   19 ++-
 ...ool-native_2.4.2.bb => libtool-native_2.4.4.bb} |    1 -
 .../avoid_absolute_paths_for_general_utils.patch   |   39 -------
 .../libtool/libtool/dont-depend-on-help2man.patch  |   32 +++---
 .../libtool/libtool/fix-final-rpath.patch          |   22 ++--
 .../libtool/libtool/fix-resolve-lt-sysroot.patch   |   15 +--
 .../libtool/libtool/fix-rpath.patch                |    8 +-
 .../libtool/libtool/fixinstall.patch               |   35 +++---
 .../libtool/libtool/norm-rpath.patch               |    8 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |  121 +++++++++-----------
 .../libtool/libtool/rename-with-sysroot.patch      |   68 +++++------
 .../libtool/libtool/respect-fstack-protector.patch |   53 ---------
 .../libtool/libtool/trailingslash.patch            |   11 +-
 .../libtool/libtool/use-sysroot-in-libpath.patch   |   12 +-
 .../libtool/{libtool_2.4.2.bb => libtool_2.4.4.bb} |    4 +-
 ...libtool_2.4.2.bb => nativesdk-libtool_2.4.4.bb} |    2 -
 17 files changed, 182 insertions(+), 284 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool-2.4.2.inc => libtool-2.4.4.inc} (77%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.2.bb => libtool-cross_2.4.4.bb} (57%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.2.bb => libtool-native_2.4.4.bb} (96%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.2.bb => libtool_2.4.4.bb} (91%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.4.2.bb => nativesdk-libtool_2.4.4.bb} (97%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.4.inc
similarity index 77%
rename from meta/recipes-devtools/libtool/libtool-2.4.2.inc
rename to meta/recipes-devtools/libtool/libtool-2.4.4.inc
index 0f1964b..643fd52 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.4.inc
@@ -5,31 +5,27 @@ Libtool hides the complexity of generating special library types \
 HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
 SECTION = "devel"
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-    file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
-
-INC_PR = "r6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://libltdl/COPYING.LIB;md5=4fbd65380cdd255951079008b364516c "
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
            file://rename-with-sysroot.patch \
            file://use-sysroot-in-libpath.patch \
            file://fix-final-rpath.patch \
-           file://avoid_absolute_paths_for_general_utils.patch \
            file://fix-rpath.patch \
-	   file://respect-fstack-protector.patch \
            file://norm-rpath.patch \
            file://dont-depend-on-help2man.patch \
            file://fix-resolve-lt-sysroot.patch \
           "
 
-SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
-SRC_URI[sha256sum] = "b38de44862a987293cd3d8dfae1c409d514b6c4e794ebc93648febf9afc38918"
+SRC_URI[md5sum] = "353ed373fd3c6d7e47a1f4a8728d966b"
+SRC_URI[sha256sum] = "159d4e20c201f929e3562536d3ae6b5e605403fa4bb4e72ef197a4e162c3fedf"
 
 do_compile_prepend () {
 	# Sometimes this file doesn't get rebuilt, force the issue
-	rm -f ${S}/libltdl/config/ltmain.sh
-	make libltdl/config/ltmain.sh
+	rm -f ${S}/build-aux/ltmain.sh
+	make build-aux/ltmain.sh
 	./config.status
 }
 
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.4.bb
similarity index 57%
rename from meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.4.4.bb
index 34aae0b..72426e4 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.4.bb
@@ -1,6 +1,5 @@
 require libtool-${PV}.inc
 
-PR = "${INC_PR}.1"
 PACKAGES = ""
 SRC_URI += "file://prefix.patch"
 SRC_URI += "file://fixinstall.patch"
@@ -19,16 +18,16 @@ do_install () {
 	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
 	install -d ${D}${bindir_crossscripts}/
 	install -m 0755 libtoolize ${D}${bindir_crossscripts}/
-	install -d ${D}${target_datadir}/libtool/config/
+	install -d ${D}${target_datadir}/libtool/build-aux/
 	install -d ${D}${target_datadir}/aclocal/
-	install -c ${S}/libltdl/config/compile ${D}${target_datadir}/libtool/config/
-	install -c ${S}/libltdl/config/config.guess ${D}${target_datadir}/libtool/config/
-	install -c ${S}/libltdl/config/config.sub ${D}${target_datadir}/libtool/config/
-	install -c ${S}/libltdl/config/depcomp ${D}${target_datadir}/libtool/config/
-	install -c ${S}/libltdl/config/install-sh ${D}${target_datadir}/libtool/config/
-	install -c ${S}/libltdl/config/missing ${D}${target_datadir}/libtool/config/
-	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${target_datadir}/libtool/config/
-	install -c -m 0644 ${S}/libltdl/m4/*.m4 ${D}${target_datadir}/aclocal/
+	install -c ${S}/build-aux/compile ${D}${target_datadir}/libtool/build-aux/
+	install -c ${S}/build-aux/config.guess ${D}${target_datadir}/libtool/build-aux/
+	install -c ${S}/build-aux/config.sub ${D}${target_datadir}/libtool/build-aux/
+	install -c ${S}/build-aux/depcomp ${D}${target_datadir}/libtool/build-aux/
+	install -c ${S}/build-aux/install-sh ${D}${target_datadir}/libtool/build-aux/
+	install -c ${S}/build-aux/missing ${D}${target_datadir}/libtool/build-aux/
+	install -c -m 0644 ${S}/build-aux/ltmain.sh ${D}${target_datadir}/libtool/build-aux/
+	install -c -m 0644 ${S}/m4/*.m4 ${D}${target_datadir}/aclocal/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "libtoolcross_sysroot_preprocess"
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.4.bb
similarity index 96%
rename from meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.4.4.bb
index f03859e..4c5218a 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.4.bb
@@ -2,7 +2,6 @@ require libtool-${PV}.inc
 
 DEPENDS = ""
 
-PR = "${INC_PR}.1"
 SRC_URI += "file://prefix.patch"
 
 inherit native
diff --git a/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch b/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch
deleted file mode 100644
index 3c751ed..0000000
--- a/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Pending
-
-On some distro the path of utils like sed, grep etc are different than the
-buildhost system.
- This was causing runtime issue while running libtoolize from the 
-libtool-nativesdk package.
-  This patch takes out the absolute paths of these utils, and put 
-responsibility on the end-user to set correct paths for these utilities to be 
-found out.
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/02/18
-
-
-Index: libtool-2.4.2/libltdl/config/general.m4sh
-===================================================================
---- libtool-2.4.2.orig/libltdl/config/general.m4sh
-+++ libtool-2.4.2/libltdl/config/general.m4sh
-@@ -45,15 +45,15 @@ progpath="$0"
- M4SH_VERBATIM([[
- : ${CP="cp -f"}
- test "${ECHO+set}" = set || ECHO=${as_echo-'printf %s\n'}
--: ${EGREP="@EGREP@"}
--: ${FGREP="@FGREP@"}
--: ${GREP="@GREP@"}
--: ${LN_S="@LN_S@"}
-+: ${EGREP="egrep"}
-+: ${FGREP="fgrep"}
-+: ${GREP="grep"}
-+: ${LN_S="ln -s"}
- : ${MAKE="make"}
- : ${MKDIR="mkdir"}
- : ${MV="mv -f"}
- : ${RM="rm -f"}
--: ${SED="@SED@"}
-+: ${SED="sed"}
- : ${SHELL="${CONFIG_SHELL-/bin/sh}"}
- : ${Xsed="$SED -e 1s/^X//"}
- 
diff --git a/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch b/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
index 67552b0..fd4084c 100644
--- a/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
+++ b/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
@@ -1,24 +1,30 @@
 Upstream-Status: Inappropriate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libtool-2.4.2/Makefile.am libtool-2.4.2/Makefile.am
---- libtool-2.4.2/Makefile.am	2011-10-17 13:17:04.000000000 +0300
-+++ libtool-2.4.2/Makefile.am	2013-01-01 22:03:36.865586811 +0200
-@@ -327,17 +327,6 @@
-	cd $(srcdir)/doc && \
-	  $(MAKEINFO) --no-headers $(MAKEINFOFLAGS) -o notes.txt notes.texi
+Updated by: Robert Yang <liezhi.yang@windriver.com>
 
--dist_man1_MANS		= $(srcdir)/doc/libtool.1 $(srcdir)/doc/libtoolize.1
+diff --git a/Makefile.am b/Makefile.am
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -404,21 +404,6 @@ $(notes_txt): $(notes_texi)
+ 	$(AM_V_GEN)$(MAKEINFO) -P '$(srcdir)/doc' --no-headers \
+ 	    $(MAKEINFOFLAGS) -o '$@' '$(notes_texi)'
+ 
+-dist_man1_MANS		= $(libtool_1) $(libtoolize_1)
 -MAINTAINERCLEANFILES	+= $(dist_man1_MANS)
 -update_mans = \
 -  PATH=".$(PATH_SEPARATOR)$$PATH"; export PATH; \
--  $(HELP2MAN) --output=$@
--$(srcdir)/doc/libtool.1: $(srcdir)/$(auxdir)/ltmain.sh
--	$(update_mans) --help-option=--help-all libtool
--$(srcdir)/doc/libtoolize.1: $(srcdir)/libtoolize.in
--	$(update_mans) libtoolize
+-  $(HELP2MAN) --output='$@'
 -
+-# It's wrong to make distributed files (e.g. $(libtool_1)) rely on
+-# files created in the build tree, so instead we regenerate the
+-# manual pages if the sources for the build-tree files we want to
+-# run have changed.
+-$(libtool_1): $(ltmain_sh)
+-	$(AM_V_GEN)$(update_mans) --help-option=--help-all libtool
+-$(libtoolize_1): $(libtoolize_in)
+-	$(AM_V_GEN)$(update_mans) libtoolize
 -
+ 
  ## ------------- ##
  ## Installation. ##
- ## ------------- ##
diff --git a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
index 6f9d321..5c9f8cc 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
@@ -7,13 +7,13 @@ This works around the issue until it gets sorted out upstream.
 Fix suggested by Richard Purdie <richard.purdie@intel.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
+Updated by: Robert Yang <liezhi.yang@windriver.com>
 
-Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
-===================================================================
---- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
-+++ libtool-2.4.2/libltdl/config/ltmain.m4sh
-@@ -7268,9 +7268,11 @@
- 	  test "$opt_mode" != relink && rpath="$compile_rpath$rpath"
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -7569,9 +7569,11 @@ EOF
+ 	  test relink = "$opt_mode" || rpath=$compile_rpath$rpath
  	  for libdir in $rpath; do
  	    if test -n "$hardcode_libdir_flag_spec"; then
 +		  func_replace_sysroot "$libdir"
@@ -24,9 +24,9 @@ Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 -		func_replace_sysroot "$libdir"
 -		libdir=$func_replace_sysroot_result
  		if test -z "$hardcode_libdirs"; then
- 		  hardcode_libdirs="$libdir"
+ 		  hardcode_libdirs=$libdir
  		else
-@@ -7999,6 +8001,10 @@
+@@ -8301,6 +8303,10 @@ EOF
        hardcode_libdirs=
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
@@ -36,8 +36,8 @@ Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 +	  libdir=$func_stripname_result
  	  if test -n "$hardcode_libdir_separator"; then
  	    if test -z "$hardcode_libdirs"; then
- 	      hardcode_libdirs="$libdir"
-@@ -8050,6 +8056,10 @@
+ 	      hardcode_libdirs=$libdir
+@@ -8352,6 +8358,10 @@ EOF
        hardcode_libdirs=
        for libdir in $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
@@ -47,4 +47,4 @@ Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 +	  libdir=$func_stripname_result
  	  if test -n "$hardcode_libdir_separator"; then
  	    if test -z "$hardcode_libdirs"; then
- 	      hardcode_libdirs="$libdir"
+ 	      hardcode_libdirs=$libdir
diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
index 44e9fe1..1bd9598 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
+++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
@@ -10,17 +10,18 @@ I have also reported the problem to libtool here
 http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
 
 Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
+Updated by: Robert Yang <liezhi.yang@windriver.com>
 ---
-diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/libtool.m4
---- libtool-2.4.2.orig/libltdl/m4/libtool.m4	2013-09-13 22:37:43.647282945 +0200
-+++ libtool-2.4.2/libltdl/m4/libtool.m4	2013-09-14 10:27:37.168178605 +0200
-@@ -1234,16 +1234,21 @@
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -1225,16 +1225,21 @@ dnl lt_sysroot will always be passed unquoted.  We quote it here
  dnl in case the user passed a directory name.
  lt_sysroot=
- case ${with_libtool_sysroot} in #(
+ case $with_libtool_sysroot in #(
 - yes)
 + no)
-    if test "$GCC" = yes; then
+    if test yes = "$GCC"; then
       lt_sysroot=`$CC --print-sysroot 2>/dev/null`
 +     # Treat "/" the same a an unset sysroot. It seems to be more
 +     # compatible across host platforms that way!?
@@ -37,5 +38,5 @@ diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/libto
 - no|'')
 -   ;; #(
   *)
-    AC_MSG_RESULT([${with_libtool_sysroot}])
+    AC_MSG_RESULT([$with_libtool_sysroot])
     AC_MSG_ERROR([The sysroot must be an absolute path.])
diff --git a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
index 1571178..a2ec947 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
@@ -6,10 +6,12 @@ RP 23/9/2011
 
 Upstream-Status: Pending
 
-Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
+Updated by: Robert Yang <liezhi.yang@windriver.com>
+
+Index: libtool-2.4.2/build-aux/ltmain.in
 ===================================================================
---- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
-+++ libtool-2.4.2/libltdl/config/ltmain.m4sh
+--- libtool-2.4.2.orig/build-aux/ltmain.in
++++ libtool-2.4.2/build-aux/ltmain.in
 @@ -7286,8 +7286,14 @@ EOF
  		  esac
  		fi
diff --git a/meta/recipes-devtools/libtool/libtool/fixinstall.patch b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
index 279c07b..8f343bf 100644
--- a/meta/recipes-devtools/libtool/libtool/fixinstall.patch
+++ b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
@@ -16,12 +16,13 @@ Upstream-Status: Inappropriate [upstream are unlikely to take a patch like this]
 
 RP 2011/11/16
 
-Index: libtool-2.4/libltdl/config/ltmain.m4sh
-===================================================================
---- libtool-2.4.orig/libltdl/config/ltmain.m4sh	2011-11-16 14:50:01.070383779 +0000
-+++ libtool-2.4/libltdl/config/ltmain.m4sh	2011-11-16 15:27:13.582310413 +0000
-@@ -2163,7 +2163,7 @@
- 	dir="$func_dirname_result"
+Updated by: Robert Yang <liezhi.yang@windriver.com>
+
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -2355,7 +2355,7 @@ func_mode_install ()
+ 	dir=$func_dirname_result
  	func_append dir "$objdir"
  
 -	if test -n "$relink_command"; then
@@ -29,16 +30,16 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
        # Strip any trailing slash from the destination.
        func_stripname '' '/' "$libdir"
        destlibdir=$func_stripname_result
-@@ -2202,7 +2202,7 @@
+@@ -2394,7 +2394,7 @@ func_mode_install ()
  	  shift
  
- 	  srcname="$realname"
--	  test -n "$relink_command" && srcname="$realname"T
+ 	  srcname=$realname
+-	  test -n "$relink_command" && srcname=${realname}T
 +	  test "$fast_install" = no && test -n "$relink_command" && srcname="$realname"T
  
  	  # Install the shared library and build the symlinks.
  	  func_show_eval "$install_shared_prog $dir/$srcname $destdir/$realname" \
-@@ -5856,15 +5856,15 @@
+@@ -6162,15 +6162,15 @@ func_mode_link ()
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
@@ -63,7 +64,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
  	    case " $sys_lib_dlsearch_path " in
  	    *" $libdir "*) ;;
  	    *)
-@@ -5930,15 +5930,15 @@
+@@ -6236,15 +6236,15 @@ func_mode_link ()
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
@@ -88,14 +89,14 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
  	    case " $sys_lib_dlsearch_path " in
  	    *" $libdir "*) ;;
  	    *)
-@@ -6284,8 +6284,8 @@
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+@@ -6590,8 +6590,8 @@ func_mode_link ()
+ 		  eval libdir=`$SED -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
  		  test -z "$libdir" && \
- 		    func_fatal_error "\`$deplib' is not a valid libtool archive"
+ 		    func_fatal_error "'$deplib' is not a valid libtool archive"
 -		  test "$absdir" != "$libdir" && \
--		    func_warning "\`$deplib' seems to be moved"
+-		    func_warning "'$deplib' seems to be moved"
 +		  #test "$absdir" != "$libdir" && \
-+		  #  func_warning "\`$deplib' seems to be moved"
++		  #  func_warning "'$deplib' seems to be moved"
  
- 		  path="-L$absdir"
+ 		  path=-L$absdir
  		fi
diff --git a/meta/recipes-devtools/libtool/libtool/norm-rpath.patch b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
index dce1576..1e4c65e 100644
--- a/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
@@ -7,9 +7,11 @@ RPATH in the generated binary.  Normalize before comparision.
 Signed-off-by: Andy Ross <andy.ross@windriver.com>
 Upstream-Status: Pending
 
-diff -ur a/libltdl/config/ltmain.m4sh b/libltdl/config/ltmain.m4sh
---- a/libltdl/config/ltmain.m4sh	2012-08-16 13:58:55.058900363 -0700
-+++ b/libltdl/config/ltmain.m4sh	2012-08-22 11:01:34.191345989 -0700
+Updated by: Robert Yang <liezhi.yang@windriver.com>
+
+diff -ur a/build-aux/ltmain.in b/build-aux/ltmain.in
+--- a/build-aux/ltmain.in	2012-08-16 13:58:55.058900363 -0700
++++ b/build-aux/ltmain.in	2012-08-22 11:01:34.191345989 -0700
 @@ -7288,8 +7288,10 @@
  	      else
                  # We only want to hardcode in an rpath if it isn't in the
diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/recipes-devtools/libtool/libtool/prefix.patch
index 5e46e68..a73df2e 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix.patch
@@ -18,35 +18,13 @@ the simplest fix is just to remove $SHELL.
 Updated: Date: 2011/11/09
 RP
 
-Index: libtool-2.4.2/libltdl/m4/libtool.m4
-===================================================================
---- libtool-2.4.2.orig/libltdl/m4/libtool.m4
-+++ libtool-2.4.2/libltdl/m4/libtool.m4
-@@ -94,7 +94,8 @@ _LT_SET_OPTIONS([$0], [$1])
- LIBTOOL_DEPS="$ltmain"
- 
- # Always use our own libtool.
--LIBTOOL='$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL='$(top_builddir)'
-+LIBTOOL="$LIBTOOL/${host_alias}-libtool"
- AC_SUBST(LIBTOOL)dnl
- 
- _LT_SETUP
-@@ -206,7 +207,7 @@ aix3*)
- esac
- 
- # Global variables:
--ofile=libtool
-+ofile=${host_alias}-libtool
- can_build_shared=yes
- 
- # All known linkers require a `.a' archive for static linking (except MSVC,
-Index: libtool-2.4.2/Makefile.am
-===================================================================
---- libtool-2.4.2.orig/Makefile.am
-+++ libtool-2.4.2/Makefile.am
-@@ -31,7 +31,7 @@ AM_LDFLAGS		=
- DIST_SUBDIRS		= .
+Updated by: Robert Yang <liezhi.yang@windriver.com>
+
+diff --git a/Makefile.am b/Makefile.am
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -31,7 +31,7 @@ SUBDIRS			= .
+ DIST_SUBDIRS		= $(SUBDIRS)
  EXTRA_DIST		=
  
 -BUILT_SOURCES		= libtool libtoolize
@@ -54,58 +32,67 @@ Index: libtool-2.4.2/Makefile.am
  
  CLEANFILES		=
  MOSTLYCLEANFILES	=
-@@ -72,7 +72,7 @@ EXTRA_DIST     += bootstrap $(srcdir)/li
- 		  ChangeLog.2002 ChangeLog.2003 ChangeLog.2004 \
- 		  ChangeLog.2005 ChangeLog.2006 ChangeLog.2007 \
- 		  ChangeLog.2008 ChangeLog.2009 ChangeLog.2010
--CLEANFILES     += libtool libtoolize libtoolize.tmp \
-+CLEANFILES     += $(host_alias)-libtool libtoolize libtoolize.tmp \
- 		  $(auxdir)/ltmain.tmp $(m4dir)/ltversion.tmp
+@@ -67,7 +67,7 @@ build_scripts	= $(srcdir)/$(aux_dir)/announce-gen \
+ 
+ EXTRA_DIST     += bootstrap bootstrap.conf $(build_scripts) cfg.mk maint.mk \
+ 		  GNUmakefile
+-CLEANFILES     += libtool libtoolize
++CLEANFILES     += $(host_alias)-libtool libtoolize
  
- ## These are the replacements that need to be made at bootstrap time,
-@@ -231,7 +231,7 @@ configure_edit = sed \
- 	-e 's,@SED\@,$(SED),g'
+ ## If a file is named several times below, and especially if it
+ ## is a distributed file created during Libtool bootstrap, we
+@@ -276,7 +276,7 @@ configure_edit = $(bootstrap_edit) \
+ 	-e 's|@srcdir\@|$(srcdir)|g'
  
  # The libtool distributor and the standalone libtool script.
--bin_SCRIPTS = libtoolize libtool
-+bin_SCRIPTS = libtoolize $(host_alias)-libtool
+-bin_SCRIPTS = libtool
++bin_SCRIPTS = $(host_alias)-libtool
  
- libtoolize: $(srcdir)/libtoolize.in $(top_builddir)/config.status
- 	rm -f libtoolize.tmp libtoolize
-@@ -244,8 +244,8 @@ libtoolize: $(srcdir)/libtoolize.in $(to
+ libtoolize: $(libtoolize_in) $(config_status)
+ 	$(AM_V_at)rm -f '$@'
+@@ -287,7 +287,7 @@ libtoolize: $(libtoolize_in) $(config_status)
  # We used to do this with a 'stamp-vcl' file, but non-gmake builds
  # would rerun configure on every invocation, so now we manually
  # check the version numbers from the build rule when necessary.
--libtool: $(top_builddir)/config.status $(srcdir)/$(auxdir)/ltmain.sh ChangeLog
--	@target=libtool; $(rebuild); \
-+$(host_alias)-libtool: $(top_builddir)/config.status $(srcdir)/$(auxdir)/ltmain.sh ChangeLog
-+	@target=$(host_alias)-libtool; $(rebuild); \
- 	if test -f "$$target"; then \
- 	  set dummy `./$$target --version | sed 1q`; actualver="$$5"; \
- 	  test "$$actualver" = "$$correctver" && rebuild=false; \
-@@ -254,8 +254,8 @@ libtool: $(top_builddir)/config.status $
- 	  case $$prereq in *ChangeLog);; *) rebuild=:;; esac; \
- 	done; \
- 	if $$rebuild; then \
--	  echo $(SHELL) ./config.status $$target; \
--	  cd $(top_builddir) && $(SHELL) ./config.status $$target; \
-+	  echo $(SHELL) ./config.status libtool; \
-+	  cd $(top_builddir) && $(SHELL) ./config.status libtool; \
- 	fi
- 
- .PHONY: configure-subdirs
-@@ -535,12 +535,12 @@ TESTS_ENVIRONMENT = MAKE="$(MAKE)" CC="$
+-libtool: $(ltmain_sh) $(config_status) $(dotversion)
++$(host_alias)-libtool: $(ltmain_sh) $(config_status) $(dotversion)
+ 	@$(rebuild); \
+ 	if test -f '$@'; then \
+ 	  eval `'$(SED)' -n '/^package_revision=/p' '$@'`; \
+@@ -731,12 +731,12 @@ TESTS_ENVIRONMENT = MAKE="$(MAKE)" CC="$(CC)" CFLAGS="$(CFLAGS)" \
  
  BUILDCHECK_ENVIRONMENT = _lt_pkgdatadir="$(abs_top_srcdir)" \
  	LIBTOOLIZE="$(abs_top_builddir)/libtoolize" \
 -	LIBTOOL="$(abs_top_builddir)/libtool" \
 +	LIBTOOL="$(abs_top_builddir)/$(host_alias)-libtool" \
- 	tst_aclocaldir="$(abs_top_srcdir)/libltdl/m4"
+ 	tst_aclocaldir="$(abs_top_srcdir)/m4"
  
  INSTALLCHECK_ENVIRONMENT = \
- 	LIBTOOLIZE="$(bindir)/`echo libtoolize | sed '$(program_transform_name)'`" \
--	LIBTOOL="$(bindir)/`echo libtool | sed '$(program_transform_name)'`" \
-+	LIBTOOL="$(bindir)/`echo $(host_alias)-libtool | sed '$(program_transform_name)'`" \
+ 	LIBTOOLIZE="$(bindir)/`echo libtoolize |$(SED) '$(program_transform_name)'`" \
+-	LIBTOOL="$(bindir)/`echo libtool |$(SED) '$(program_transform_name)'`" \
++	LIBTOOL="$(bindir)/`echo $(host_alias)-libtool |$(SED) '$(program_transform_name)'`" \
  	LTDLINCL="-I$(includedir)" \
  	LIBLTDL="$(libdir)/libltdl.la" \
  	tst_aclocaldir="$(aclocaldir)"
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -86,7 +86,8 @@ _LT_SET_OPTIONS([$0], [$1])
+ LIBTOOL_DEPS=$ltmain
+ 
+ # Always use our own libtool.
+-LIBTOOL='$(SHELL) $(top_builddir)/libtool'
++LIBTOOL='$(top_builddir)'
++LIBTOOL="$LIBTOOL/${host_alias}-libtool"
+ AC_SUBST(LIBTOOL)dnl
+ 
+ _LT_SETUP
+@@ -199,7 +200,7 @@ aix3*)
+ esac
+ 
+ # Global variables:
+-ofile=libtool
++ofile=${host_alias}-libtool
+ can_build_shared=yes
+ 
+ # All known linkers require a '.a' archive for static linking (except MSVC,
diff --git a/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch b/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
index c3e3e86..ad2b110 100644
--- a/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
+++ b/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
@@ -10,29 +10,31 @@ http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html
 
 -Khem Raj <raj.khem@gmail.com>
 
-Index: libtool-2.4.2/libltdl/m4/libtool.m4
-===================================================================
---- libtool-2.4.2.orig/libltdl/m4/libtool.m4
-+++ libtool-2.4.2/libltdl/m4/libtool.m4
-@@ -1224,27 +1224,27 @@ _LT_DECL([], [ECHO], [1], [An echo progr
+Updated by: Robert Yang <liezhi.yang@windriver.com>
+
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -1215,28 +1215,28 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
  # ----------------
  AC_DEFUN([_LT_WITH_SYSROOT],
  [AC_MSG_CHECKING([for sysroot])
 -AC_ARG_WITH([sysroot],
--[  --with-sysroot[=DIR] Search for dependent libraries within DIR
+-[AS_HELP_STRING([--with-sysroot@<:@=DIR@:>@],
 +AC_ARG_WITH([libtool-sysroot],
-+[  --with-libtool-sysroot[=DIR] Search for dependent libraries within DIR
-                         (or the compiler's sysroot if not specified).],
++[AS_HELP_STRING([--with-libtool-sysroot@<:@=DIR@:>@],
+   [Search for dependent libraries within DIR (or the compiler's sysroot
+    if not specified).])],
 -[], [with_sysroot=no])
 +[], [with_libtool_sysroot=no])
  
  dnl lt_sysroot will always be passed unquoted.  We quote it here
  dnl in case the user passed a directory name.
  lt_sysroot=
--case ${with_sysroot} in #(
-+case ${with_libtool_sysroot} in #(
+-case $with_sysroot in #(
++case $with_libtool_sysroot in #(
   yes)
-    if test "$GCC" = yes; then
+    if test yes = "$GCC"; then
       lt_sysroot=`$CC --print-sysroot 2>/dev/null`
     fi
     ;; #(
@@ -43,15 +45,14 @@ Index: libtool-2.4.2/libltdl/m4/libtool.m4
   no|'')
     ;; #(
   *)
--   AC_MSG_RESULT([${with_sysroot}])
-+   AC_MSG_RESULT([${with_libtool_sysroot}])
+-   AC_MSG_RESULT([$with_sysroot])
++   AC_MSG_RESULT([$with_libtool_sysroot])
     AC_MSG_ERROR([The sysroot must be an absolute path.])
     ;;
  esac
-Index: libtool-2.4.2/tests/sysroot.at
-===================================================================
---- libtool-2.4.2.orig/tests/sysroot.at
-+++ libtool-2.4.2/tests/sysroot.at
+diff --git a/tests/sysroot.at b/tests/sysroot.at
+--- a/tests/sysroot.at
++++ b/tests/sysroot.at
 @@ -64,7 +64,7 @@ while read file; do
  done])
  
@@ -60,7 +61,7 @@ Index: libtool-2.4.2/tests/sysroot.at
 +configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
  
  #???
- if test "$shlibpath_var" = PATH; then
+ if test PATH = "$shlibpath_var"; then
 @@ -114,7 +114,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
@@ -79,11 +80,10 @@ Index: libtool-2.4.2/tests/sysroot.at
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  ]])
-Index: libtool-2.4.2/tests/testsuite
-===================================================================
---- libtool-2.4.2.orig/tests/testsuite
-+++ libtool-2.4.2/tests/testsuite
-@@ -26676,7 +26676,7 @@ $at_traceon; }
+diff --git a/tests/testsuite b/tests/testsuite
+--- a/tests/testsuite
++++ b/tests/testsuite
+@@ -48945,7 +48945,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -91,8 +91,8 @@ Index: libtool-2.4.2/tests/testsuite
 +configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
  
  #???
- if test "$shlibpath_var" = PATH; then
-@@ -26874,7 +26874,7 @@ AM_INIT_AUTOMAKE([foreign])
+ if test PATH = "$shlibpath_var"; then
+@@ -49154,7 +49154,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -101,7 +101,7 @@ Index: libtool-2.4.2/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -27051,7 +27051,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -49342,7 +49342,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
@@ -110,7 +110,7 @@ Index: libtool-2.4.2/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -27392,7 +27392,7 @@ $at_traceon; }
+@@ -49694,7 +49694,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -118,8 +118,8 @@ Index: libtool-2.4.2/tests/testsuite
 +configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
  
  #???
- if test "$shlibpath_var" = PATH; then
-@@ -27590,7 +27590,7 @@ AM_INIT_AUTOMAKE([foreign])
+ if test PATH = "$shlibpath_var"; then
+@@ -49903,7 +49903,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -128,7 +128,7 @@ Index: libtool-2.4.2/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -27767,7 +27767,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50091,7 +50091,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
@@ -137,7 +137,7 @@ Index: libtool-2.4.2/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -28108,7 +28108,7 @@ $at_traceon; }
+@@ -50443,7 +50443,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -145,8 +145,8 @@ Index: libtool-2.4.2/tests/testsuite
 +configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
  
  #???
- if test "$shlibpath_var" = PATH; then
-@@ -28306,7 +28306,7 @@ AM_INIT_AUTOMAKE([foreign])
+ if test PATH = "$shlibpath_var"; then
+@@ -50652,7 +50652,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -155,7 +155,7 @@ Index: libtool-2.4.2/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -28483,7 +28483,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50840,7 +50840,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
diff --git a/meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch b/meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
deleted file mode 100644
index a82b2ec..0000000
--- a/meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Source: http://permalink.gmane.org/gmane.comp.gnu.libtool.bugs/7341
-
-Bug confirmed.  When code is compiled with -fstack-protector{,-all},
-GCC "emits extra code to check for buffer overflows, such as stack
-smashing attacks".  This extra code uses symbols from libssp, and
-therefore (at least) Cygwin's GCC specs contain:
-
-*link_ssp:
-%{fstack-protector|fstack-protector-all:-lssp_nonshared -lssp}
-
-Therefore, when libtool fails to pass -fstack-protector{,-all} at link
-stage, the link fails.
-
-Patch attached.  (Yes, I have a copyright assignment on file.)
-
-Yaakov
-Cygwin/X
-
-From b79f4e117b6f73cc461a2e232063e08481d33300 Mon Sep 17 00:00:00 2001
-From: Yaakov Selkowitz <yselkowitz <at> users.sourceforge.net>
-Date: Tue, 1 Jun 2010 22:18:51 -0500
-Subject: [PATCH] Fix linking with -fstack-protector
-
-* libltdl/config/ltmain.m4sh (func_mode_link): Pass -fstack-protector*
-to the linker as it is required at link time to resolve libssp symbols.
-
-Signed-off-by: Yaakov Selkowitz <yselkowitz <at> users.sourceforge.net>
----
- libltdl/config/ltmain.m4sh |    4 +++-
- 1 files changed, 3 insertions(+), 1 deletions(-)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
-===================================================================
---- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh	2012-06-01 12:35:44.089638130 -0700
-+++ libtool-2.4.2/libltdl/config/ltmain.m4sh	2012-06-01 12:37:25.789643055 -0700
-@@ -5067,13 +5067,14 @@
-       # -m*, -t[45]*, -txscale* architecture-specific flags for GCC
-       # -F/path              path to uninstalled frameworks, gcc on darwin
-       # -p, -pg, --coverage, -fprofile-*  profiling flags for GCC
-+      # -fstack-protector*   stack protector flags for GCC
-       # @file                GCC response files
-       # -tp=*                Portland pgcc target processor selection
-       # --sysroot=*          for sysroot support
-       # -O*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
-       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
-       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
--      -O*|-flto*|-fwhopr*|-fuse-linker-plugin)
-+      -O*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*)
-         func_quote_for_eval "$arg"
- 	arg="$func_quote_for_eval_result"
-         func_append compile_command " $arg"
diff --git a/meta/recipes-devtools/libtool/libtool/trailingslash.patch b/meta/recipes-devtools/libtool/libtool/trailingslash.patch
index bb7a761..e8824d7 100644
--- a/meta/recipes-devtools/libtool/libtool/trailingslash.patch
+++ b/meta/recipes-devtools/libtool/libtool/trailingslash.patch
@@ -11,11 +11,12 @@ Merged a patch received from Gary Thomas <gary@mlbassoc.com>
 Date: 2010/07/12
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
-===================================================================
---- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
-+++ libtool-2.4.2/libltdl/config/ltmain.m4sh
-@@ -2167,8 +2167,15 @@ func_mode_install ()
+Updated by: Robert Yang <liezhi.yang@windriver.com>
+
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -2356,8 +2356,15 @@ func_mode_install ()
  	func_append dir "$objdir"
  
  	if test -n "$relink_command"; then
diff --git a/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch b/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
index 0cd66ad..6af99f3 100644
--- a/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
@@ -6,16 +6,16 @@ i.e. when lt_sysroot is not set, it will still behave the same and add
 -L/usr/lib to the relink command.
 
 -Khem Raj <raj.khem@gmail.com>
+Updated by: Robert Yang <liezhi.yang@windriver.com>
 
-Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
-===================================================================
---- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
-+++ libtool-2.4.2/libltdl/config/ltmain.m4sh
-@@ -6138,7 +6138,7 @@ func_mode_link ()
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -6421,7 +6421,7 @@ func_mode_link ()
  	      fi
  	    else
  	      # We cannot seem to hardcode it, guess we'll fake it.
--	      add_dir="-L$libdir"
+-	      add_dir=-L$libdir
 +	      add_dir="-L$lt_sysroot$libdir"
  	      # Try looking first in the location we're being installed to.
  	      if test -n "$inst_prefix_dir"; then
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.2.bb b/meta/recipes-devtools/libtool/libtool_2.4.4.bb
similarity index 91%
rename from meta/recipes-devtools/libtool/libtool_2.4.2.bb
rename to meta/recipes-devtools/libtool/libtool_2.4.4.bb
index 6064312..45f1b2f 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.4.bb
@@ -1,7 +1,5 @@
 require libtool-${PV}.inc
 
-PR = "${INC_PR}.0"
-
 RDEPENDS_${PN} += "bash"
 
 #
@@ -23,6 +21,6 @@ do_install_append () {
 libtool_sysroot_preprocess () {
 	rm -rf ${SYSROOT_DESTDIR}${bindir}/*
 	rm -rf ${SYSROOT_DESTDIR}${datadir}/aclocal/*
-	rm -rf ${SYSROOT_DESTDIR}${datadir}/libtool/config/*
+	rm -rf ${SYSROOT_DESTDIR}${datadir}/libtool/build-aux/*
 }
 
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.4.bb
similarity index 97%
rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.4.4.bb
index 7b5c97a..508eade 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.4.bb
@@ -1,7 +1,5 @@
 require libtool-${PV}.inc
 
-PR = "${INC_PR}.0"
-
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
 
 SRC_URI += "file://prefix.patch"
-- 
1.7.9.5


