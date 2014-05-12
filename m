Return-Path: <drew@moseleynet.net>
Received: from relay1.mentorg.com (unknown [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E2BAE60167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 20:01:18 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1WjwPX-0007WU-Hl from drew@moseleynet.net 
	for openembedded-core@lists.openembedded.org;
	Mon, 12 May 2014 13:01:19 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 12 May 2014 13:01:19 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 12 May 2014 13:01:18 -0700
From: Drew Moseley <drew@moseleynet.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 16:00:58 -0400
Message-Id: <1399924858-26946-1-git-send-email-drew@moseleynet.net>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 12 May 2014 20:01:19.0002 (UTC)
	FILETIME=[F07EDFA0:01CF6E1C]
Subject: [PATCH] glib-2.0: Do not use readlink to set target paths.
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
X-List-Received-Date: Mon, 12 May 2014 20:01:22 -0000

From: Drew Moseley <drew_moseley@mentor.com>

Do not use readlink to set ABS_GLIB_RUNTIME_LIBDIR when cross
compiling.  Doing so causes host paths to potentially pollute the
target.  Unfortunately in this case we don't actually convert to
an absolute path.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 ...c-Do-not-use-readlink-when-cross-compilin.patch |   31 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb      |    1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
new file mode 100644
index 0000000..0be3631
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
@@ -0,0 +1,31 @@
+commit 9b38d507ec37b3d7d4df6095fa7ed16b47d399f7
+Author: Drew Moseley <drew_moseley@mentor.com>
+Date:   Sat Mar 29 21:10:43 2014 -0400
+
+    configure.ac: Do not use readlink when cross compiling.
+
+    Do not use readlink to set ABS_GLIB_RUNTIME_LIBDIR when cross
+    compiling.  Doing so causes host paths to potentially pollute
+    the target.
+
+    Note that in this case the path is not converted to absolute if
+    it contains any ".." references so it's not completely correct.
+
+    Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=727575]
+    Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
+
+diff -rub glib-2.38.2.orig/configure.ac glib-2.38.2/configure.ac
+--- glib-2.38.2.orig/configure.ac	2014-04-03 20:17:13.035567143 -0400
++++ glib-2.38.2/configure.ac	2014-04-03 20:19:07.071566057 -0400
+@@ -275,7 +275,11 @@
+            [],
+ 	   [with_runtime_libdir=""])
+ GLIB_RUNTIME_LIBDIR="$with_runtime_libdir"
++AS_IF([ test $cross_compiling = yes ], [
++ABS_GLIB_RUNTIME_LIBDIR="$libdir/$with_runtime_libdir"
++], [
+ ABS_GLIB_RUNTIME_LIBDIR="`readlink -m $libdir/$with_runtime_libdir`"
++])
+ AC_SUBST(GLIB_RUNTIME_LIBDIR)
+ AC_SUBST(ABS_GLIB_RUNTIME_LIBDIR)
+ AM_CONDITIONAL(HAVE_GLIB_RUNTIME_LIBDIR, [test "x$with_runtime_libdir" != "x"])
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
index 4052950..1138dae 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://gtest-skip-fixes.patch \
            file://gio-test-race.patch \
            file://uclibc.patch \
+           file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.7.9.5


