Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RRND8-00074B-3d
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 13:06:28 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 005A2110018B;
	Fri, 18 Nov 2011 12:59:53 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3D156110017F;
	Fri, 18 Nov 2011 12:59:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (f052065229.adsl.alicedsl.de
	[78.52.65.229]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Fri, 18 Nov 2011 12:59:51 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 5ED323C49D; Fri, 18 Nov 2011 12:59:50 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2011 12:59:48 +0100
Message-Id: <1321617588-18376-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.7.3
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] glib-2.0: fix qsort_t testing for uclibc
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
X-List-Received-Date: Fri, 18 Nov 2011 12:06:28 -0000

* instead of disabling the configure test and set it always true
  use the site files to set it true for glibc/eglibc and false
  for uclibc
* remove the patch
' tested only for uclibc
* bump PR

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 .../glib-2.0/remove.test.for.qsort_r.patch         |   53 --------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb      |    6 +--
 meta/site/common-glibc                             |    1 +
 meta/site/common-uclibc                            |    1 +
 4 files changed, 3 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch b/meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
deleted file mode 100644
index 5c0a07a..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-while cross compiling we cannot execute run tests
-
-Upstream-Status: Inappropriate [configuration]
-
---- glib-2.30.0.orig/configure.ac	2011-09-29 16:57:35.000000000 +0200
-+++ glib-2.30.0/configure.ac	2011-09-29 17:00:19.931493488 +0200
-@@ -586,45 +586,7 @@
- dnl until we have checked this function is actually usable
- AC_CHECK_FUNC([qsort_r])
- 
--# BSD has a qsort_r with wrong argument order
--if test x$ac_cv_func_qsort_r = xyes ; then
--  AC_CACHE_CHECK([if qsort_r uses glibc compatible argument order], glib_cv_have_qsort_r, [
--  AC_RUN_IFELSE([AC_LANG_SOURCE([[
--  #define _GNU_SOURCE
--  #include <stdlib.h>
--
--  static int
--  cmp (const void *a, const void *b, void *c)
--  {
--    const int *ia = a;
--    const int *ib = b;
--
--    if (*ia < *ib)
--      return -1;
--    else if (*ia > *ib)
--      return 1;
--    else
--      return 0;
--  }
--
--  int
--  main (int argc, char **argv)
--  {
--    int arr[3] = { 1, 2, 0 };
--    int d = 3;
--
--    qsort_r (arr, 3, sizeof (int), cmp, &d);
--
--    if (arr[0] == 0 && arr[1] == 1 && arr[2] == 2)
--      return 0;
--    else
--      return 1;
--  }]])],[glib_cv_have_qsort_r=yes],[glib_cv_have_qsort_r=no])])
--fi
--
--if test x$glib_cv_have_qsort_r = xyes ; then
--  AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' function])
--fi
-+AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' function])
- 
- AC_CHECK_SIZEOF(char)
- AC_CHECK_SIZEOF(short)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
index 634a4e4..50e174e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r3"
+PR = "r4"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native"
@@ -9,14 +9,10 @@ DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nat
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-QSORT_PATCH = "file://remove.test.for.qsort_r.patch"
-QSORT_PATCH_virtclass-native = ""
-
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
-           ${QSORT_PATCH} \
           "
 SRC_URI[md5sum] = "fee101d9d7daa8ddfbae00325f307f3b"
 SRC_URI[sha256sum] = "ca9c731017ab370859e847f8b70079bc6dcf389dc0ccb0d0419925aff81b9687"
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 364ab67..dc69703 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -39,6 +39,7 @@ glib_cv_long_long_format=${glib_cv_long_long_format=ll}
 # that to avoid a dependency loop.
 glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_have_qsort_r=${glib_cv_have_qsort_r=yes}
 
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index a264765..331c2a2 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -20,6 +20,7 @@ ac_cv_func_snprintf_c99=${ac_cv_func_snprintf_c99=yes}
 ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
 glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
 glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
 
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
-- 
1.7.7.3


