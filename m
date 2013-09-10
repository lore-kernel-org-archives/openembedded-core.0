Return-Path: <qhanbec@rnd.ericsson.se>
Received: from sesbmg20.ericsson.net (sesbmg20.ericsson.net [193.180.251.56])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2B76B12F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:57:25 +0000 (UTC)
X-AuditID: c1b4fb38-b7fcf8e0000062b8-98-522f3356c42c
Received: from ESESSHC023.ericsson.se (Unknown_Domain [153.88.253.124])
	by sesbmg20.ericsson.net (Symantec Mail Security) with SMTP id
	9B.F6.25272.6533F225; Tue, 10 Sep 2013 16:57:26 +0200 (CEST)
Received: from esekilxxen355.rnd.ericsson.se (153.88.183.150) by
	smtp.internal.ericsson.com (153.88.183.89) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 10 Sep 2013 16:57:25 +0200
Received: from esekilxxen1299.rnd.ericsson.se (esekilxxen1299.rnd.ericsson.se
	[147.214.14.86])	by esekilxxen355.rnd.ericsson.se (Postfix) with
	ESMTP id C6B7EA013A	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 16:57:25 +0200 (CEST)
Received: by esekilxxen1299.rnd.ericsson.se (Postfix, from userid 9759)	id
	C4A06D1CB8; Tue, 10 Sep 2013 16:57:25 +0200 (CEST)
From: <hans.beckerus@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2013 16:56:28 +0200
Message-ID: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
X-Mailer: git-send-email 1.8.3.3
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGJMWRmVeSWpSXmKPExsUyM+JvjW6YsX6Qwc5/vBZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxrEFmxkL/ktU/F+yia2B8ZdIFyMnh4SAicShnomsELaYxIV7
	69m6GLk4hASOMko8ONrNBpIQEtjJKPHmTDlE4j+jxMm7P5i7GDmAnHqJljeZIDVsAvISz77u
	ZgMJiwjoSVz9JwoSFhYwk2j528kEYrMIqEpM/raeBcTmFXCXWDpxBhPEXgWJvTs2QcUFJU7O
	fAJmMwtISBx88YIZ4gQViePrF7NOYOSfhaRsFpKyBYxMqxg5ilOLk3LTjQw2MQLD5uCW3xY7
	GC//tTnEKM3BoiTOu0XvTKCQQHpiSWp2ampBalF8UWlOavEhRiYOTqkGxpZrZQXPhW6f2Lbi
	00nhB7oJoSwi29+mKZk3n6oykbVyUYg87X6iauFKlxtMVSuuq+tfUZyl1+f8hS0vdIaB6QpP
	82T5d8ULJSuK/19s847z7P6Tk759Z76UxpXPe5261p1glG65UcPpy2Sw9JqW8fN4ndt7TPi2
	+33s23N+7Svj9a+irj5XVmIpzkg01GIuKk4EANJqhIbpAQAA
Subject: [PATCH v4] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 14:57:26 -0000
Content-Type: text/plain

From: Hans Beckerus <hans.beckerus at gmail.com>

This patch updates libtool.m4 (and its output) to resolve a problem
with variable 'lt_sysroot' not being properly updated if the option
'--with[-libtool]-sysroot' is not provided when running the 'configure'
script for a package.
 
According to the help text ouput from 'configure':
--with-libtool-sysroot=DIR Search for dependent libraries within DIR
                       (or the compiler's sysrooot if not specified).
 
Due to swapped cases in a switch statement, when checking if the option
was specified or not, wrong actions were taken resulting in an
incorrect sysroot and failures to properly locate e.g. .la files.
 
For current upstream status see:
http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
 
Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
 .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index bb4ddf0..92e4949 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
 	   file://respect-fstack-protector.patch \
            file://norm-rpath.patch \
            file://dont-depend-on-help2man.patch \
+           file://fix-resolve-lt-sysroot.patch \
           "
 
 SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
new file mode 100644
index 0000000..5a6335b
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
@@ -0,0 +1,35 @@
+
+Upstream-Status: Pending
+
+This patch updates libtool.m4 (and its output) to resolve a problem
+with variable 'lt_sysroot' not being properly updated if the option
+'--with[-libtool]-sysroot' is not provided when running the 'configure'
+script for a package.
+
+I have also reported the problem to libtool here
+
+http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
+
+Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
+---
+diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/libtool.m4
+--- libtool-2.4.2.orig/libltdl/m4/libtool.m4	2013-09-05 10:37:24.690013000 +0200
++++ libtool-2.4.2/libltdl/m4/libtool.m4	2013-09-05 12:05:51.560281000 +0200
+@@ -1234,7 +1234,7 @@
+ dnl in case the user passed a directory name.
+ lt_sysroot=
+ case ${with_libtool_sysroot} in #(
+- yes)
++ no)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+@@ -1242,7 +1242,7 @@
+  /*)
+    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+- no|'')
++ yes|'')
+    ;; #(
+  *)
+    AC_MSG_RESULT([${with_libtool_sysroot}])
-- 
1.8.3.3


