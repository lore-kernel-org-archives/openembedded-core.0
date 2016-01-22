Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5736FF5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MCwGhl019747 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:58:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e_Kvi1t7PorS
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:58:16 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MCwBHO019743
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:58:13 GMT
Message-ID: <1453467491.27999.197.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 12:58:11 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH v2] pixz: Add 1.0.6
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
X-List-Received-Date: Fri, 22 Jan 2016 12:58:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

xz gives better compression results than bzip/gz but is often slower.
Using parallel compression mitigates this somewhat and is particularly
useful for the SDK.

Whilst xz does have some parallel support, pixz appears to perform better 
and supports parallel decompression as well as a simpler command line.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

---
[v2: Add patch to fix asciidoc issues]

diff --git a/meta/recipes-extended/pixz/pixz/936d8068ae19d95260d3058f41dd6cf718101cd6.patch b/meta/recipes-extended/pixz/pixz/936d8068ae19d95260d3058f41dd6cf718101cd6.patch
new file mode 100644
index 0000000..e3489db
--- /dev/null
+++ b/meta/recipes-extended/pixz/pixz/936d8068ae19d95260d3058f41dd6cf718101cd6.patch
@@ -0,0 +1,68 @@
+From 936d8068ae19d95260d3058f41dd6cf718101cd6 Mon Sep 17 00:00:00 2001
+From: Christian Krause <kizkizzbangbang@googlemail.com>
+Date: Sat, 26 Dec 2015 14:36:17 +0100
+Subject: [PATCH] option to not build man page
+
+fixes #56
+---
+ configure.ac    | 23 +++++++++++++++++++----
+ src/Makefile.am |  2 ++
+ 2 files changed, 21 insertions(+), 4 deletions(-)
+
+Upstream-Status: Backport
+RP 2016/01/22
+
+diff --git a/configure.ac b/configure.ac
+index b437e56..4cb56bc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -20,13 +20,28 @@ AC_CHECK_FILE(
+   [src/pixz.1],
+   [],
+   [
+-    AC_CHECK_PROG(A2X, a2x, a2x, [])
+-    if test "x$A2X" = x ; then
+-      AC_MSG_ERROR([AsciiDoc not found, not able to generate the man page.])
+-    fi
++    AC_ARG_WITH(
++      [manpage],
++      [  --without-manpage       don't build man page],
++      [case ${withval} in
++        yes) manpage=true ;;
++        no)  manpage=false ;;
++        *)   AC_MSG_ERROR([bad value ${withval} for --with-manpage]) ;;
++      esac],
++      [manpage=true]
++    )
+   ]
+ )
+ 
++AM_CONDITIONAL([MANPAGE], [test x$manpage = xtrue])
++
++if test x$manpage = xtrue ; then
++  AC_CHECK_PROG(A2X, a2x, a2x, [])
++  if test "x$A2X" = x ; then
++    AC_MSG_ERROR([AsciiDoc not found, not able to generate the man page.])
++  fi
++fi
++
+ # Checks for libraries.
+ AC_CHECK_LIB([m], [ceil])
+ AX_PTHREAD
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 600ec90..b98f450 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -15,6 +15,7 @@ pixz_SOURCES = \
+ 	read.c \
+ 	write.c
+ 
++if MANPAGE
+ # TODO remove when possible: This is a hack because a2x is not able to output the man pages to a
+ # specific directory, only to where the source is.
+ pixz.1: pixz.1.asciidoc
+@@ -26,3 +27,4 @@ man_MANS = pixz.1
+ CLEANFILES = pixz.1
+ 
+ EXTRA_DIST = $(man_MANS) pixz.1.asciidoc
++endif
diff --git a/meta/recipes-extended/pixz/pixz_1.0.6.bb b/meta/recipes-extended/pixz/pixz_1.0.6.bb
new file mode 100644
index 0000000..0dbac7d
--- /dev/null
+++ b/meta/recipes-extended/pixz/pixz_1.0.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Parallel, indexed xz compressor"
+
+DEPENDS = "xz libarchive"
+DEEPNDS_class-native = "xz-replacement-native libarchive-native"
+
+SRC_URI = "https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "f6dc5909c9a31b192f69aa397ae8df48"
+SRC_URI[sha256sum] = "02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5cf6d164086105f1512ccb81bfff1926"
+
+SRC_URI += "file://936d8068ae19d95260d3058f41dd6cf718101cd6.patch"
+
+EXTRA_OECONF += "--without-manpage"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"



