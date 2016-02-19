Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D976D770D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:54:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J5ssrZ027223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Feb 2016 21:54:54 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Feb 2016 21:54:54 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 19 Feb 2016 00:54:41 -0500
Message-ID: <4cae9c7c4031241975f9fae2ae1f7652eced5991.1455860789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455860789.git.hongxu.jia@windriver.com>
References: <cover.1455860789.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] bison/gettext: add --with-bisonlocaledir to assign BISON_LOCALEDIR
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
X-List-Received-Date: Fri, 19 Feb 2016 05:54:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This issue was triggered by buildpaths QA Warning.
...
|gettext-0.19.6: File work/core2-64-poky-linux/gettext/0.19.6-r0/
packages-split/gettext/usr/bin/msgcmp in package contained
reference to tmpdir
...

Previously, variable BISON_LOCALEDIR was assigned only by the
output of 'bison --print-localedir' which provided by native bison
that has buildpaths in it.

For target compile, we add option --with-bisonlocaledir to set
BISON_LOCALEDIR with "/usr/share/locale" to fix the QA issue.

The variable BISON_LOCALEDIR is used for internationalization of
the bison parser’s runtime output. Here is the introduction:
http://www.gnu.org/software/bison/manual/html_node/Internationalization.html

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../gettext-0.19.6/add-with-bisonlocaledir.patch   | 58 ++++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.6.bb        |  4 ++
 .../bison/bison/add-with-bisonlocaledir.patch      | 58 ++++++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb         |  1 +
 4 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.6/add-with-bisonlocaledir.patch
 create mode 100644 meta/recipes-devtools/bison/bison/add-with-bisonlocaledir.patch

diff --git a/meta/recipes-core/gettext/gettext-0.19.6/add-with-bisonlocaledir.patch b/meta/recipes-core/gettext/gettext-0.19.6/add-with-bisonlocaledir.patch
new file mode 100644
index 0000000..35a1310
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.19.6/add-with-bisonlocaledir.patch
@@ -0,0 +1,58 @@
+From 04bd40fe2c48c6e01ab418a04d27c4aff644ad96 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Feb 2016 23:54:02 -0500
+Subject: [PATCH] m4/bison-i18n.m4: add --with-bisonlocaledir to assign
+ BISON_LOCALEDIR
+
+The variable BISON_LOCALEDIR is assigned only by the output of
+'bison --print-localedir', we add option --with-bisonlocaledir
+to assign it explicitly. It is helpful for user to split the
+native compile and cross compile.
+
+For backward compatibility, if option not used, it still
+make use of the output of 'bison --print-localedir'.
+
+Upstream-Status: Submitted [bison-patches@gnu.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gettext-tools/gnulib-m4/bison-i18n.m4 | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/gettext-tools/gnulib-m4/bison-i18n.m4 b/gettext-tools/gnulib-m4/bison-i18n.m4
+index f5cfd3a..fb6ac4d 100644
+--- a/gettext-tools/gnulib-m4/bison-i18n.m4
++++ b/gettext-tools/gnulib-m4/bison-i18n.m4
+@@ -14,11 +14,16 @@ dnl sets BISON_LOCALEDIR to indicate where to find the bison-runtime.mo files
+ dnl and defines YYENABLE_NLS if there are bison-runtime.mo files at all.
+ AC_DEFUN([BISON_I18N],
+ [
++  dnl Default is not to set bisonlocaledir
++  AC_ARG_WITH([bisonlocaledir],
++    [  --with-bisonlocaledir   sets BISON_LOCALEDIR to indicate where to find the bison-runtime.mo files],
++    BISON_LOCALEDIR=$withval,
++    BISON_LOCALEDIR=)
++
+   if test -z "$USE_NLS"; then
+     echo "The BISON-I18N macro is used without being preceded by AM-GNU-GETTEXT." 1>&2
+     exit 1
+   fi
+-  BISON_LOCALEDIR=
+   BISON_USE_NLS=no
+   if test "$USE_NLS" = yes; then
+     dnl Determine bison's localedir.
+@@ -26,9 +31,10 @@ AC_DEFUN([BISON_I18N],
+     dnl But even is YACC is called "yacc", it may be a script that invokes bison
+     dnl and accepts the --print-localedir option.
+     dnl YACC's default value is empty; BISON's default value is :.
+-    if (${YACC-${BISON-:}} --print-localedir) >/dev/null 2>&1; then
++    if test -z "$BISON_LOCALEDIR" -a ${YACC-${BISON-:}} --print-localedir >/dev/null 2>&1; then
+       BISON_LOCALEDIR=`${YACC-${BISON-:}} --print-localedir`
+     fi
++    AC_MSG_RESULT([$BISON_LOCALEDIR])
+     AC_SUBST([BISON_LOCALEDIR])
+     if test -n "$BISON_LOCALEDIR"; then
+       dnl There is no need to enable internationalization if the user doesn't
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/gettext/gettext_0.19.6.bb b/meta/recipes-core/gettext/gettext_0.19.6.bb
index 737561d..fead06a 100644
--- a/meta/recipes-core/gettext/gettext_0.19.6.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.6.bb
@@ -12,6 +12,7 @@ PROVIDES_class-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
+	   file://add-with-bisonlocaledir.patch \
           "
 
 PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
@@ -38,6 +39,9 @@ EXTRA_OECONF += "--without-lispdir \
                  --with-included-libcroco \
                  --with-included-libunistring \
                 "
+EXTRA_OECONF_append_class-target = " \
+                 --with-bisonlocaledir=${datadir}/locale \
+"
 
 acpaths = '-I ${S}/gettext-runtime/m4 \
            -I ${S}/gettext-tools/m4'
diff --git a/meta/recipes-devtools/bison/bison/add-with-bisonlocaledir.patch b/meta/recipes-devtools/bison/bison/add-with-bisonlocaledir.patch
new file mode 100644
index 0000000..35c0f6f
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/add-with-bisonlocaledir.patch
@@ -0,0 +1,58 @@
+From 41fdca818cdc7bd686c31aff4088b89280d71a42 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Feb 2016 22:01:28 -0500
+Subject: [PATCH] m4/bison-i18n.m4: add --with-bisonlocaledir to assign
+ BISON_LOCALEDIR
+
+The variable BISON_LOCALEDIR is assigned only by the output of
+'bison --print-localedir', we add option --with-bisonlocaledir
+to assign it explicitly. It is helpful for user to split the
+native compile and cross compile.
+
+For backward compatibility, if option not used, it still
+make use of the output of 'bison --print-localedir'.
+
+Upstream-Status: Submitted [bison-patches@gnu.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ m4/bison-i18n.m4 | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/m4/bison-i18n.m4 b/m4/bison-i18n.m4
+index 8e57caf..c36f498 100644
+--- a/m4/bison-i18n.m4
++++ b/m4/bison-i18n.m4
+@@ -16,11 +16,16 @@ dnl sets BISON_LOCALEDIR to indicate where to find the bison-runtime.mo files
+ dnl and defines YYENABLE_NLS if there are bison-runtime.mo files at all.
+ AC_DEFUN([BISON_I18N],
+ [
++  dnl Default is not to set bisonlocaledir
++  AC_ARG_WITH([bisonlocaledir],
++    [  --with-bisonlocaledir   sets BISON_LOCALEDIR to indicate where to find the bison-runtime.mo files],
++    BISON_LOCALEDIR=$withval,
++    BISON_LOCALEDIR=)
++
+   if test -z "$USE_NLS"; then
+     echo "The BISON-I18N macro is used without being preceded by AM-GNU-GETTEXT." 1>&2
+     exit 1
+   fi
+-  BISON_LOCALEDIR=
+   BISON_USE_NLS=no
+   if test "$USE_NLS" = yes; then
+     dnl Determine bison's localedir.
+@@ -28,9 +33,10 @@ AC_DEFUN([BISON_I18N],
+     dnl But even is YACC is called "yacc", it may be a script that invokes bison
+     dnl and accepts the --print-localedir option.
+     dnl YACC's default value is empty; BISON's default value is :.
+-    if (${YACC-${BISON-:}} --print-localedir) >/dev/null 2>&1; then
++    if test -z "$BISON_LOCALEDIR" -a ${YACC-${BISON-:}} --print-localedir >/dev/null 2>&1; then
+       BISON_LOCALEDIR=`${YACC-${BISON-:}} --print-localedir`
+     fi
++    AC_MSG_RESULT([$BISON_LOCALEDIR])
+     AC_SUBST([BISON_LOCALEDIR])
+     if test -n "$BISON_LOCALEDIR"; then
+       dnl There is no need to enable internationalization if the user doesn't
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index 708e9a3..cffcd88 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://dont-depend-on-help2man.patch.patch \
            file://0001-src-local.mk-fix-parallel-issue.patch \
+           file://add-with-bisonlocaledir.patch \
 "
 
 # No point in hardcoding path to m4, just use PATH
-- 
1.9.1


