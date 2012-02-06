Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RuIeC-0005WE-0b
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 08:05:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q166vse7013925
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Feb 2012 22:57:54 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 5 Feb 2012 22:57:53 -0800
Message-ID: <1624cca695c5baf08d376297f7278732dbcbfba6.1328509284.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1328509284.git.xiaofeng.yan@windriver.com>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 6 Feb 2012 13:25:29 +0800
Date: Mon, 6 Feb 2012 14:41:12 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] glib-2.0: Don't check function qsort_r
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
X-List-Received-Date: Mon, 06 Feb 2012 07:05:56 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

function "g_qsort_with_data" has two kinds of realization. One calls qsort_r
from libglib, the other realize itself.
qsort_r from libglib cause sort error.
For fixing this problem no checking "qsort_r" in configure.ac.

[YOCTO #1959]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../glib-2.0/glib-2.0/no-check-qsort_r.patch       |   61 ++++++++++++++++++++
 1 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-check-qsort_r.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/no-check-qsort_r.patch b/meta/recipes-core/glib-2.0/glib-2.0/no-check-qsort_r.patch
new file mode 100644
index 0000000..99e229c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/no-check-qsort_r.patch
@@ -0,0 +1,61 @@
+Upstream-Status: Pending
+
+function "g_qsort_with_data" has two kinds of realization. One calls qsort_r
+from libglib, the other realize itself.
+qsort_r from libglib cause sort error. Don't check qsort_r for fixing this problem.
+
+Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+Index: glib-2.30.0/configure.ac
+===================================================================
+--- a/configure.ac	2012-02-06 11:15:37.885295264 +0800
++++ b/configure.ac.new	2012-02-06 11:16:04.239795382 +0800
+@@ -584,47 +584,7 @@
+ dnl don't use AC_CHECK_FUNCS here, otherwise HAVE_QSORT_R will
+ dnl be automatically defined, which we don't want to do
+ dnl until we have checked this function is actually usable
+-AC_CHECK_FUNC([qsort_r])
+-
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
++#AC_CHECK_FUNC([qsort_r])
+ 
+ AC_CHECK_SIZEOF(char)
+ AC_CHECK_SIZEOF(short)
-- 
1.7.0.4



