Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5321777282
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 10:26:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 25 Feb 2016 02:26:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="910953390"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2016 02:26:51 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id AD50F6A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 03:14:39 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 12:30:26 +0200
Message-Id: <1456396226-14410-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] uclibc support for rng-tools
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
X-List-Received-Date: Thu, 25 Feb 2016 10:26:51 -0000

Uclibc has its own argp implemented as libuargp. So, we add a new
option --enable-uclibc to select it.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../rng-tools/uclibc-libuargp-configure.patch      | 63 ++++++++++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb      |  4 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch b/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch
new file mode 100644
index 0000000..e691315
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch
@@ -0,0 +1,63 @@
+In case of uclibc, use libuargp
+
+If we use uclibc for system libraries, select libuargp
+
+Upstream-Status: Pending
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur rng-tools-5-orig/configure.ac rng-tools-5/configure.ac
+--- rng-tools-5-orig/configure.ac	2016-02-24 18:11:24.023690235 +0200
++++ rng-tools-5/configure.ac	2016-02-24 18:14:49.763118138 +0200
+@@ -39,6 +39,13 @@
+ 	[with_libargp=check]
+ )
+ 
++AC_ARG_ENABLE([uclibc],
++    AS_HELP_STRING([--enable-uclibc], [Use uclibc for system libraries]),
++        use_uclibc=yes, use_uclibc=no)
++AM_CONDITIONAL(USE_UCLIBC, test "x$use_uclibc" = "xyes")
++AS_IF([test "x$use_uclibc" = "xyes"], [AC_DEFINE(USE_UCLIBC)])
++AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
++
+ dnl Make sure anyone changing configure.ac/Makefile.am has a clue
+ AM_MAINTAINER_MODE
+ 
+@@ -101,7 +108,7 @@
+ 			[need_libargp=no],
+ 			[need_libargp=yes
+ 			 if test "x$with_libargp" = "xno"; then
+-				AC_MSG_FAILURE([libargp disabled and libc does not have argp])
++				AC_MSG_WARN([libargp disabled and libc does not have argp])
+ 			 fi]
+ 		)
+ 	],
+@@ -110,7 +117,7 @@
+ 
+ dnl Check for libargp
+ AS_IF(
+-	[test "x$need_libargp" = "xyes"],
++	[test "x$need_libargp" = "xyes" -a "x$use_uclibc" = "xno"],
+ 	[
+ 		AC_CHECK_LIB(
+ 			[argp],
+@@ -120,6 +127,19 @@
+ 		)
+ 	]
+ )
++
++dnl Check for libuargp
++AS_IF(
++	[test "x$use_uclibc" = "xyes"],
++	[
++		AC_CHECK_LIB(
++			[uargp],
++			[argp_parse],
++			[LIBS="$LIBS -luargp"],
++			[AC_MSG_FAILURE([libuargp not found])]
++		)
++	]
++)
+ 
+ dnl -----------------
+ dnl Configure options
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index bc67990..53d2d61 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
            file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
            file://0002-Add-argument-to-control-the-libargp-dependency.patch \
            file://underquote.patch \
+           file://uclibc-libuargp-configure.patch \
            file://init \
            file://default"
 
@@ -23,8 +24,9 @@ inherit autotools update-rc.d
 
 PACKAGECONFIG = "libgcrypt"
 PACKAGECONFIG_libc-musl = "libargp"
-PACKAGECONFIG_libc-uclibc = "libargp"
+PACKAGECONFIG_libc-uclibc = "libuargp"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
+PACKAGECONFIG[libuargp] = "--enable-uclibc,,,"
 PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
 
 do_install_append() {
-- 
2.4.0


