Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fLc-0003th-OL
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:50:01 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3201846fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qiWgiHMa9Nsgev1QyHTMIyTAGE+dVKku49E97KYRYTI=;
	b=lfx0Vcotje/wLzbKsDRLhgKGgg3H4xGzYJEb8GTVPgPSPP5/TIbbqOUMYl9MoNayNE
	6lVanqksFJYDT0j4iRE/HIWuoPsJCduIzFmBjVX9qMKgpWAP4p3/GMIGcTljyWAs742D
	3ErapLViGtrChLlA3dK2tlLkZwTZDk6llucmA=
Received: by 10.223.35.15 with SMTP id n15mr314308fad.71.1317397473862;
	Fri, 30 Sep 2011 08:44:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c5sm7201595fai.2.2011.09.30.08.44.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:44:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:43:27 +0200
Message-Id: <e27a2c33117539c39c8c9961d0e16ca5c0bdff89.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
References: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397204.git.Martin.Jansa@gmail.com>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 8/9] glib: upgrade to 2.30.0
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
X-List-Received-Date: Fri, 30 Sep 2011 15:50:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 ----------
 .../0005-glib-mkenums-interpreter.patch.patch      |   25 ---------
 .../60_wait-longer-for-threads-to-die.patch        |   24 +++++-----
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |    2 -
 .../glib-2.0/remove.test.for.qsort_r.patch         |   53 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |   23 ---------
 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb      |   41 +++++++++++++++
 7 files changed, 106 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch b/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
deleted file mode 100644
index 5c0afbc..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3d371334d5668bcd02a38ff99884bd343c244d68 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 18 Jun 2011 23:51:35 +0200
-Subject: [PATCH 3/7] gatomic-proper-pointer-get-cast.patch
-
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- glib/gatomic.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/glib/gatomic.h b/glib/gatomic.h
-index ddd39b8..b758142 100644
---- a/glib/gatomic.h
-+++ b/glib/gatomic.h
-@@ -70,7 +70,7 @@ void     g_atomic_pointer_set                  (volatile gpointer G_GNUC_MAY_ALI
-   (g_atomic_int_set) ((volatile gint G_GNUC_MAY_ALIAS *) (volatile void *) (atomic), (newval)))
- # define g_atomic_pointer_get(atomic) \
-  ((void) sizeof (gchar [sizeof (*(atomic)) == sizeof (gpointer) ? 1 : -1]), \
--  (g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volatile void *) (atomic)))
-+  (g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volatile void G_GNUC_MAY_ALIAS *) (atomic)))
- # define g_atomic_pointer_set(atomic, newval) \
-  ((void) sizeof (gchar [sizeof (*(atomic)) == sizeof (gpointer) ? 1 : -1]), \
-   (g_atomic_pointer_set) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volatile void *) (atomic), (newval)))
--- 
-1.6.6.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch b/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
deleted file mode 100644
index db9a799..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a8e5c4a808e7f8572bd5023645a6cb4386b9aff8 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 18 Jun 2011 23:52:17 +0200
-Subject: [PATCH 5/7] don't leak buildpaths into perl hashbang
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- gobject/glib-mkenums.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index 6372245..b486fe9 100755
---- a/gobject/glib-mkenums.in
-+++ b/gobject/glib-mkenums.in
-@@ -1,4 +1,4 @@
--#! @PERL_PATH@
-+#! /usr/bin/env perl
- 
- use warnings;
- use File::Basename;
--- 
-1.6.6.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch b/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
index b65a474..4ff7b80 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
@@ -4,9 +4,9 @@ Rebased for glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>, 11/16/2010
 
 Upstream-Status: Inappropriate [patches for test code]
 
-diff -ruN glib-2.27.3-orig/tests/threadpool-test.c glib-2.27.3/tests/threadpool-test.c
---- glib-2.27.3-orig/tests/threadpool-test.c	2009-04-01 07:04:21.000000000 +0800
-+++ glib-2.27.3/tests/threadpool-test.c	2010-11-16 12:28:09.002172678 +0800
+diff -ruN glib-2.30.0-orig/tests/threadpool-test.c glib-2.30.0/tests/threadpool-test.c
+--- glib-2.30.0-orig/tests/threadpool-test.c	2009-04-01 07:04:21.000000000 +0800
++++ glib-2.30.0/tests/threadpool-test.c	2010-11-16 12:28:09.002172678 +0800
 @@ -5,8 +5,8 @@
  
  #include <glib.h>
@@ -18,16 +18,16 @@ diff -ruN glib-2.27.3-orig/tests/threadpool-test.c glib-2.27.3/tests/threadpool-
  
  #define WAIT                5    /* seconds */
  #define MAX_THREADS         10
-@@ -124,10 +124,10 @@
-    DEBUG_MSG (("[unused] stopping unused threads"));
-    g_thread_pool_stop_unused_threads ();
+@@ -130,10 +130,10 @@
+            test_count_threads () == 0)
+          break;
  
--   DEBUG_MSG (("[unused] waiting ONE second for threads to die"));
-+   DEBUG_MSG (("[unused] waiting FIVE second for threads to die"));
+-       DEBUG_MSG (("[unused] waiting ONE second for threads to die"));
++       DEBUG_MSG (("[unused] waiting FIVE second for threads to die"));
  
-    /* Some time for threads to die. */
--   g_usleep (G_USEC_PER_SEC);
-+   g_usleep (5 * G_USEC_PER_SEC);
+        /* Some time for threads to die. */
+-       g_usleep (G_USEC_PER_SEC);
++       g_usleep (5 * G_USEC_PER_SEC);
+      }
  
     DEBUG_MSG (("[unused] stopped idle threads, %d remain, %d threads still exist",
- 	       g_thread_pool_get_num_unused_threads (),
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch b/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
index a100192..cca57d4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
@@ -6,8 +6,6 @@ impact on case when they are available.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Inappropriate [embedded specific]
-
 
 Index: glib-2.26.1/glib/gconvert.c
 ===================================================================
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch b/meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
new file mode 100644
index 0000000..5c0a07a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
@@ -0,0 +1,53 @@
+while cross compiling we cannot execute run tests
+
+Upstream-Status: Inappropriate [configuration]
+
+--- glib-2.30.0.orig/configure.ac	2011-09-29 16:57:35.000000000 +0200
++++ glib-2.30.0/configure.ac	2011-09-29 17:00:19.931493488 +0200
+@@ -586,45 +586,7 @@
+ dnl until we have checked this function is actually usable
+ AC_CHECK_FUNC([qsort_r])
+ 
+-# BSD has a qsort_r with wrong argument order
+-if test x$ac_cv_func_qsort_r = xyes ; then
+-  AC_CACHE_CHECK([if qsort_r uses glibc compatible argument order], glib_cv_have_qsort_r, [
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-  #define _GNU_SOURCE
+-  #include <stdlib.h>
+-
+-  static int
+-  cmp (const void *a, const void *b, void *c)
+-  {
+-    const int *ia = a;
+-    const int *ib = b;
+-
+-    if (*ia < *ib)
+-      return -1;
+-    else if (*ia > *ib)
+-      return 1;
+-    else
+-      return 0;
+-  }
+-
+-  int
+-  main (int argc, char **argv)
+-  {
+-    int arr[3] = { 1, 2, 0 };
+-    int d = 3;
+-
+-    qsort_r (arr, 3, sizeof (int), cmp, &d);
+-
+-    if (arr[0] == 0 && arr[1] == 1 && arr[2] == 2)
+-      return 0;
+-    else
+-      return 1;
+-  }]])],[glib_cv_have_qsort_r=yes],[glib_cv_have_qsort_r=no])])
+-fi
+-
+-if test x$glib_cv_have_qsort_r = xyes ; then
+-  AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' function])
+-fi
++AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' function])
+ 
+ AC_CHECK_SIZEOF(char)
+ AC_CHECK_SIZEOF(short)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
deleted file mode 100644
index 7430d88..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require glib.inc
-
-PR = "r5"
-PE = "1"
-
-SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
-           file://configure-libtool.patch \
-           file://60_wait-longer-for-threads-to-die.patch \
-           file://g_once_init_enter.patch \
-           file://0003-gatomic-proper-pointer-get-cast.patch.patch \
-           file://0005-glib-mkenums-interpreter.patch.patch \
-          "
-# Only apply this patch for target recipe on uclibc
-SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-
-SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
-
-SRC_URI[md5sum] = "789e7520f71c6a4bf08bc683ec764d24"
-SRC_URI[sha256sum] = "222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
-
-BBCLASSEXTEND = "native"
-
-EXTRA_OECONF_append = " --enable-dtrace=no"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
new file mode 100644
index 0000000..3b44703
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
@@ -0,0 +1,41 @@
+require glib.inc
+
+PR = "r1"
+PE = "1"
+
+DEPENDS += "libffi python-argparse-native"
+DEPENDS_virtclass-native += "libffi-native python-argparse-native"
+
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+
+SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
+           file://configure-libtool.patch \
+           file://60_wait-longer-for-threads-to-die.patch \
+           file://g_once_init_enter.patch \
+           file://remove.test.for.qsort_r.patch \
+          "
+SRC_URI[md5sum] = "fee101d9d7daa8ddfbae00325f307f3b"
+SRC_URI[sha256sum] = "ca9c731017ab370859e847f8b70079bc6dcf389dc0ccb0d0419925aff81b9687"
+
+# Only apply this patch for target recipe on uclibc
+SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
+
+SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
+BBCLASSEXTEND = "native"
+
+do_configure_prepend() {
+  # missing ${topdir}/gtk-doc.make and --disable-gtk-doc* is not enough, because it calls gtkdocize (not provided by gtk-doc-native)
+  sed -i '/^docs/d' ${S}/configure.ac
+  sed -i 's/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po docs/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po/g' ${S}/Makefile.am
+  sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
+}
+
+do_install_append() {
+  # remove some unpackaged files
+  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
+  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
+}
+
+PACKAGES += "${PN}-codegen"
+FILES_${PN}-codegen = "${libdir}/gdbus-2.0/codegen/*.py"
+FILES_${PN} += "${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
-- 
1.7.6.1



