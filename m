Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11241.1626097926011511161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 859126D
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15CAD3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:04 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] tcl: use AUTOTOOLS_SCRIPT_PATH
Date: Mon, 12 Jul 2021 14:51:55 +0100
Message-Id: <20210712135159.2131269-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712135159.2131269-1-ross.burton@arm.com>
References: <20210712135159.2131269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Inside tcl the configure.ac is inside a unix/ directory.  Instead of
setting S to BPNPV/unix and having to use ../ to reach files outside of
unix, simply set S as usual and use AUTOTOOLS_SCRIPT_PATH to run the
correct configure script.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tcltk/tcl/alter-includedir.patch          | 30 +++----------------
 .../tcl/fix_issue_with_old_distro_glibc.patch |  4 +--
 .../tcl/fix_non_native_build_issue.patch      |  4 +--
 .../tcltk/tcl/tcl-add-soname.patch            | 22 +++-----------
 .../tcl-remove-hardcoded-install-path.patch   | 17 ++---------
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb     | 24 +++++++--------
 6 files changed, 26 insertions(+), 75 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/met=
a/recipes-devtools/tcltk/tcl/alter-includedir.patch
index 66c395d401..5b25af2c0c 100644
--- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
@@ -18,8 +18,8 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
=20
 diff --git a/Makefile.in b/Makefile.in
 index 0370491..daa569a 100644
---- a/Makefile.in
-+++ b/Makefile.in
+--- a/unix/Makefile.in
++++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	=3D $(INSTALL_ROOT)$(TCL_LIBRARY)
  MODULE_INSTALL_DIR	=3D $(SCRIPT_INSTALL_DIR)/../tcl8
 =20
@@ -29,32 +29,10 @@ index 0370491..daa569a 100644
 =20
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	=3D @PRIVATE_INCLUDE_DIR@
-diff --git a/configure b/configure
-index 181b9b3..f4cc225 100755
---- a/configure
-+++ b/configure
-@@ -10166,7 +10166,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
- eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
-=20
- test -z "$TCL_LIBRARY" && TCL_LIBRARY=3D'$(libdir)/tcl$(VERSION)'
--PRIVATE_INCLUDE_DIR=3D'$(includedir)'
-+PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl$(VERSION)'
- HTML_DIR=3D'$(DISTDIR)/html'
-=20
- # Note:  in the following variable, it's important to use the absolute
-@@ -10323,7 +10323,7 @@ TCL_BUILD_STUB_LIB_PATH=3D"`pwd`/${TCL_STUB_LIB_=
FILE}"
- TCL_STUB_LIB_PATH=3D"${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
-=20
- # Install time header dir can be set via --includedir
--eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}\""
-+eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}/tcl${VERSION}\""
-=20
- #----------------------------------------------------------------------=
--
- # tclConfig.sh refers to this by a different name
 diff --git a/configure.in b/configure.in
 index 9f96e2b..e323e02 100644
---- a/configure.in
-+++ b/configure.in
+--- a/unix/configure.in
++++ b/unix/configure.in
 @@ -773,7 +773,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
 =20
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_gl=
ibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_gli=
bc.patch
index 72a0fa4520..2c31cec8e3 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.pat=
ch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.pat=
ch
@@ -17,8 +17,8 @@ Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com=
>
=20
 Index: unix/Makefile.in
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- unix.orig/Makefile.in	2013-11-10 23:38:01.787425628 -0800
-+++ unix/Makefile.in	2013-11-10 23:37:59.807425578 -0800
+--- a/unix.orig/Makefile.in	2013-11-10 23:38:01.787425628 -0800
++++ b/unix/Makefile.in	2013-11-10 23:37:59.807425578 -0800
 @@ -686,7 +686,7 @@
  # tcltest executable gets the build directory burned into its ld search=
 path.
  # This keeps tcltest from picking up an already installed version of th=
e Tcl
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.p=
atch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index c60eb75379..44b2ce0a30 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -2,8 +2,8 @@ Upstream-Status: Pending
=20
 Index: unix/Makefile.in
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- unix.orig/Makefile.in	2013-11-10 23:37:34.243424934 -0800
-+++ unix/Makefile.in	2013-11-10 23:37:34.243424934 -0800
+--- a/unix.orig/Makefile.in	2013-11-10 23:37:34.243424934 -0800
++++ b/unix/Makefile.in	2013-11-10 23:37:34.243424934 -0800
 @@ -709,23 +709,23 @@
  test: test-tcl test-packages
 =20
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/=
recipes-devtools/tcltk/tcl/tcl-add-soname.patch
index d1fc9b92e5..c4283c4f34 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
@@ -1,23 +1,9 @@
 Upstream-Status: Pending
=20
-Index: unix/configure
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- unix.orig/configure	2013-09-19 13:17:13.000000000 -0700
-+++ unix/configure	2013-11-11 00:20:51.519490342 -0800
-@@ -7599,6 +7599,9 @@
- 	    # get rid of the warnings.
- 	    #CFLAGS_OPTIMIZE=3D"${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__N=
O_MATH_INLINES"
-=20
-+	    # following line added by CW for Debian GNU/Linux
-+	    TCL_SHLIB_LD_EXTRAS=3D"-Wl,-soname,\${TCL_LIB_FILE}.0"
-+
- 	    SHLIB_LD=3D'${CC} ${CFLAGS} ${LDFLAGS} -shared'
- 	    DL_OBJS=3D"tclLoadDl.o"
- 	    DL_LIBS=3D"-ldl"
 Index: unix/tcl.m4
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- unix.orig/tcl.m4	2013-09-19 13:17:13.000000000 -0700
-+++ unix/tcl.m4	2013-11-11 00:17:24.263485123 -0800
+--- a/unix.orig/tcl.m4	2013-09-19 13:17:13.000000000 -0700
++++ b/unix/tcl.m4	2013-11-11 00:17:24.263485123 -0800
 @@ -1415,6 +1415,9 @@
  	    # get rid of the warnings.
  	    #CFLAGS_OPTIMIZE=3D"${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__N=
O_MATH_INLINES"
@@ -30,8 +16,8 @@ Index: unix/tcl.m4
  	    DL_LIBS=3D"-ldl"
 Index: unix/Makefile.in
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- unix.orig/Makefile.in	2013-09-19 13:17:13.000000000 -0700
-+++ unix/Makefile.in	2013-11-11 00:20:32.423489861 -0800
+--- a/unix.orig/Makefile.in	2013-09-19 13:17:13.000000000 -0700
++++ b/unix/Makefile.in	2013-11-11 00:20:32.423489861 -0800
 @@ -796,7 +796,10 @@
  	    done;
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install=
-path.patch b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-instal=
l-path.patch
index 386fbf83d0..99c5faf02c 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.p=
atch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.p=
atch
@@ -17,23 +17,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  configure.in | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
-Index: unix/configure
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- unix.orig/configure	2013-11-10 23:38:33.643426430 -0800
-+++ unix/configure	2013-11-10 23:39:51.347428387 -0800
-@@ -19134,7 +19134,7 @@
-=20
- eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
-=20
--test -z "$TCL_LIBRARY" && TCL_LIBRARY=3D'$(prefix)/lib/tcl$(VERSION)'
-+test -z "$TCL_LIBRARY" && TCL_LIBRARY=3D'$(libdir)/tcl$(VERSION)'
- PRIVATE_INCLUDE_DIR=3D'$(includedir)'
- HTML_DIR=3D'$(DISTDIR)/html'
-=20
 Index: unix/configure.in
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- unix.orig/configure.in	2013-11-10 23:20:50.000000000 -0800
-+++ unix/configure.in	2013-11-10 23:39:41.199428131 -0800
+--- a/unix.orig/configure.in	2013-11-10 23:20:50.000000000 -0800
++++ b/unix/configure.in	2013-11-10 23:39:41.199428131 -0800
 @@ -790,7 +790,7 @@
 =20
  eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-dev=
tools/tcltk/tcl_8.6.11.bb
index 722e4a0132..dce0fcd2c0 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -5,12 +5,12 @@ SECTION =3D "devel/tcltk"
=20
 # http://www.tcl.tk/software/tcltk/license.html
 LICENSE =3D "tcl & BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://../license.terms;md5=3D058f6229798281bbcac4=
239c788cfa38 \
-    file://../compat/license.terms;md5=3D058f6229798281bbcac4239c788cfa3=
8 \
-    file://../library/license.terms;md5=3D058f6229798281bbcac4239c788cfa=
38 \
-    file://../macosx/license.terms;md5=3D058f6229798281bbcac4239c788cfa3=
8 \
-    file://../tests/license.terms;md5=3D058f6229798281bbcac4239c788cfa38=
 \
-    file://../win/license.terms;md5=3D058f6229798281bbcac4239c788cfa38 \
+LIC_FILES_CHKSUM =3D "file://license.terms;md5=3D058f6229798281bbcac4239=
c788cfa38 \
+    file://compat/license.terms;md5=3D058f6229798281bbcac4239c788cfa38 \
+    file://library/license.terms;md5=3D058f6229798281bbcac4239c788cfa38 =
\
+    file://macosx/license.terms;md5=3D058f6229798281bbcac4239c788cfa38 \
+    file://tests/license.terms;md5=3D058f6229798281bbcac4239c788cfa38 \
+    file://win/license.terms;md5=3D058f6229798281bbcac4239c788cfa38 \
 "
=20
 DEPENDS =3D "tcl-native zlib"
@@ -28,17 +28,17 @@ SRC_URI[sha256sum] =3D "cfb49aab82bd179651e23eeeb6960=
6f51b0ddc575ca55c3d35e2457469
=20
 SRC_URI_class-native =3D "${BASE_SRC_URI}"
=20
-S =3D "${WORKDIR}/${BPN}${PV}/unix"
+S =3D "${WORKDIR}/${BPN}${PV}"
=20
-PSEUDO_IGNORE_PATHS .=3D ",${WORKDIR}/${BPN}${PV}"
 VER =3D "${PV}"
=20
 inherit autotools ptest binconfig
=20
+AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
 EXTRA_OECONF =3D "--enable-threads --disable-rpath --enable-man-suffix"
=20
 do_compile_prepend() {
-	echo > ${S}/../compat/fixstrtod.c
+	echo > ${S}/compat/fixstrtod.c
 }
=20
 do_install() {
@@ -53,7 +53,7 @@ do_install() {
 	install -m 0755 tclConfig.sh ${D}${libdir}
 	for dir in compat generic unix; do
 		install -d ${D}${includedir}/${BPN}${VER}/$dir
-		install -m 0644 ${S}/../$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
+		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
 	done
 }
=20
@@ -76,8 +76,8 @@ do_compile_ptest() {
=20
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
-	cp -r ${S}/../library ${D}${PTEST_PATH}
-	cp -r ${S}/../tests ${D}${PTEST_PATH}
+	cp -r ${S}/library ${D}${PTEST_PATH}
+	cp -r ${S}/tests ${D}${PTEST_PATH}
 }
=20
 # Fix some paths that might be used by Tcl extensions
--=20
2.25.1

