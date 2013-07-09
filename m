Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF906A59E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 07:29:15 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 76009A6299;
	Tue,  9 Jul 2013 09:29:12 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 09:29:13 +0200
Message-Id: <1373354955-16500-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [danny][PATCH 1/3] gcc: add patch to disable texinfo when texinfo is 5.0 or newer
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
X-List-Received-Date: Tue, 09 Jul 2013 07:29:17 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* this is needed only for 4.7 series, newer works fine with texinfo-5*

[YOCTO #3947]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/disable-texinfo-5.patch            |  107 ++++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 1a3e09b..c28823d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -74,6 +74,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://ppc_no_crtsavres.patch \
 	   file://0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch \
 	   file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
+	   file://disable-texinfo-5.patch \
 	  "
 SRC_URI[md5sum] = "cc308a0891e778cfda7a151ab8a6e762"
 SRC_URI[sha256sum] = "8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch b/meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
new file mode 100644
index 0000000..d5c9165
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
@@ -0,0 +1,107 @@
+Upstream-Status: Pending
+
+gcc-4.8 is compatible with texinfo-5, so this is only temporary fix 
+(we don't need info files on target)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr gcc-4.7.2.orig/configure.ac gcc-4.7.2/configure.ac
+--- gcc-4.7.2.orig/configure.ac	2013-04-04 09:10:24.600848496 +0200
++++ gcc-4.7.2/configure.ac	2013-04-04 09:51:51.808031042 +0200
+@@ -3031,7 +3031,7 @@
+     # For an installed makeinfo, we require it to be from texinfo 4.7 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9]))' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"
+diff -uNr gcc-4.7.2.orig/gcc/configure.ac gcc-4.7.2/gcc/configure.ac
+--- gcc-4.7.2.orig/gcc/configure.ac	2013-04-04 09:10:30.523848931 +0200
++++ gcc-4.7.2/gcc/configure.ac	2013-04-04 09:52:16.111032826 +0200
+@@ -871,7 +871,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER(MAKEINFO, makeinfo, --version,
+   [GNU texinfo.* \([0-9][0-9.]*\)],
+-  [4.[7-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++  [4.[7-9]*|4.[1-9][0-9]*])
+ if test $gcc_cv_prog_makeinfo_modern = no; then
+   AC_MSG_WARN([
+ *** Makeinfo is missing or too old.
+diff -uNr gcc-4.7.2.orig/libgomp/configure.ac gcc-4.7.2/libgomp/configure.ac
+--- gcc-4.7.2.orig/libgomp/configure.ac	2010-12-06 01:50:04.000000000 +0100
++++ gcc-4.7.2/libgomp/configure.ac	2013-04-04 09:51:29.571029410 +0200
+@@ -129,7 +129,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
+                    [GNU texinfo.* \([0-9][0-9.]*\)],
+-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++                   [4.[4-9]*|4.[1-9][0-9]*])
+ AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern = "yes")
+ 
+ 
+diff -uNr gcc-4.7.2.orig/libiberty/configure.ac gcc-4.7.2/libiberty/configure.ac
+--- gcc-4.7.2.orig/libiberty/configure.ac	2011-08-22 18:54:02.000000000 +0200
++++ gcc-4.7.2/libiberty/configure.ac	2013-04-04 09:51:20.685028758 +0200
+@@ -84,6 +84,12 @@
+ 	    AC_MSG_WARN([
+ *** Makeinfo is too old. Info documentation will not be built.])
+ 	  ;;
++	  x*\ [[5-9]].* )
++	    MAKEINFO="@echo $MAKEINFO is too new, 5.0 or newer does not work; true"
++	    BUILD_INFO=
++	    AC_MSG_WARN([
++*** Makeinfo is too new. Info documentation will not be built.])
++	  ;;
+ 	esac
+ 	;;
+     esac
+diff -uNr gcc-4.7.2.orig/libitm/configure.ac gcc-4.7.2/libitm/configure.ac
+--- gcc-4.7.2.orig/libitm/configure.ac	2012-02-13 22:46:38.000000000 +0100
++++ gcc-4.7.2/libitm/configure.ac	2013-04-04 09:51:59.676031620 +0200
+@@ -140,7 +140,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
+                    [GNU texinfo.* \([0-9][0-9.]*\)],
+-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++                   [4.[4-9]*|4.[1-9][0-9]*])
+ AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern = "yes")
+ 
+ 
+diff -uNr gcc-4.7.2.orig/libquadmath/configure.ac gcc-4.7.2/libquadmath/configure.ac
+--- gcc-4.7.2.orig/libquadmath/configure.ac	2012-05-31 20:57:56.000000000 +0200
++++ gcc-4.7.2/libquadmath/configure.ac	2013-04-04 09:49:52.432022281 +0200
+@@ -48,7 +48,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
+                    [GNU texinfo.* \([0-9][0-9.]*\)],
+-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++                   [4.[4-9]*|4.[1-9][0-9]*])
+ AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern = "yes")
+ 
+ ACX_BUGURL([http://gcc.gnu.org/bugs.html])
+diff -uNr gcc-4.7.2.orig/libstdc++-v3/configure.ac gcc-4.7.2/libstdc++-v3/configure.ac
+--- gcc-4.7.2.orig/libstdc++-v3/configure.ac	2012-08-06 16:34:27.000000000 +0200
++++ gcc-4.7.2/libstdc++-v3/configure.ac	2013-04-04 09:49:57.483022652 +0200
+@@ -344,7 +344,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
+ 		   [GNU texinfo.* \([0-9][0-9.]*\)],
+-		   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++		   [4.[4-9]*|4.[1-9][0-9]*])
+ AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern = "yes")
+ 
+ # Check for doxygen
+diff -uNr gcc-4.7.2.orig/configure gcc-4.7.2/configure
+--- gcc-4.7.2.orig/configure	2013-04-04 10:23:58.009172414 +0200
++++ gcc-4.7.2/configure	2013-04-04 10:26:42.696184501 +0200
+@@ -7858,7 +7858,7 @@
+     # For an installed makeinfo, we require it to be from texinfo 4.7 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9]))' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"
-- 
1.7.10.4


