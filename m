Return-Path: <hans.beckerus@gmail.com>
Received: from mail-qe0-f44.google.com (mail-qe0-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1F92660F24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:12:07 +0000 (UTC)
Received: by mail-qe0-f44.google.com with SMTP id 3so2668760qeb.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=VfsQit4HtxBGUV2ePba/lvqk3OSSBVwPmyR5b3TnymQ=;
	b=anLCIukmOKdyJ0qQ84CgETAryNSnpxK4/Wq0EEAc3IWpIAv1WtPmBXQVh9B8akV97B
	xSKzi5Jkr2QJxG42ccDaus1rj5ahA2a0uO+zj5qUVEN0E+U7pac+BRnoUAoTPVlsevhR
	DSPR9S2PErW0xbk+nlxQah4iB3X1Q251CcLhojyMXpdz21xZdo+aHXyaIGkk5yl8IjWX
	9tzeClmqIIN2Bat1SEopJfYk9I/X1NUT1HjVykn1DZtPfhtul0GPdT39MvEVrcSvXnbc
	2U8Xj1YceTIQeXJY0urwtDzK+VwLqQvTnsNHp6ciTU7QOPji69il2r/pyA1JuOGB7Ma8
	jcRQ==
MIME-Version: 1.0
X-Received: by 10.49.0.234 with SMTP id 10mr17670463qeh.67.1378807928380; Tue,
	10 Sep 2013 03:12:08 -0700 (PDT)
Received: by 10.49.57.197 with HTTP; Tue, 10 Sep 2013 03:12:08 -0700 (PDT)
Date: Tue, 10 Sep 2013 12:12:08 +0200
Message-ID: <CAFyqS9qQR+YQj8tKWHJxOc=9Ti34gM4DFjxaoJi9cVbnDWzLAA@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libtool: fix resolve of variable lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 10:12:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

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
 create mode 100644
meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
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
diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
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
+diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
libtool-2.4.2/libltdl/m4/libtool.m4
+--- libtool-2.4.2.orig/libltdl/m4/libtool.m4   2013-09-05
10:37:24.690013000 +0200
++++ libtool-2.4.2/libltdl/m4/libtool.m4        2013-09-05
12:05:51.560281000 +0200
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

