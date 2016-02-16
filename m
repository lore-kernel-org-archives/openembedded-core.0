Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3216E665
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 03:07:38 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id g62so172518656wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 19:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=q1jELCR+JAsRbUOu2643QxVUCASyUFlEdYoDGFuyQdo=;
	b=s18MuhJvXHR5UpkQq40F1jMBcy3BONthVFXsEZilu112gi+1d87eLp/aYMyjYBTIRv
	+0PPb7nTg2VM5QYlnq/lluWK3MleDGLTrOV2Xjo1QDqNjUrwdOL+Z4YXnqBz8sMH+DSa
	O4msecdjYzh0zNVHMrHUTR83Ljol4jfWA+vtSlC/iAjdRcta+3DT88wp3Xj4miNlfTZD
	1lA5rkdfQlgygjfytXlhfHLGLaxhKCgwAVmTYojCR/ThQ3sedNSG8kRIhFdzmNOhosuQ
	9A5YPEH69rqbwtztUoMQdfYFP8Mz68XV6MQsjvaDQmYwOriiqxTrXn3+rGljBKrcleAm
	hRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q1jELCR+JAsRbUOu2643QxVUCASyUFlEdYoDGFuyQdo=;
	b=BBtQ/bbaRLB7/boz6VYWTKLfkfUePUwwJ+cN8ENUvL7VlTg8cJPeHiut6zV7b/90j/
	VH50P2pNSSN0ukcZI/QrLXWoaIPSFXHy+kYEFi+zYkg8oBLuRe0kuwV9TbAHnk6iY6FV
	XEqhgbRJBpDdhaSEssSqoiEb0Std5DCMVq1IVu0oup7cZGxbrR7E5N/Lj+dg3ULwLfa0
	9WSZwprdidPfwpnbnfHxVlTC11gMKwlmcR7HzXxIVdM/UwJatKgywfKE/FBaJc/Xv9Vk
	yz9eoXgFsR7VLpcRLyaM97FcwpQkx7D1G1rQoddA6QfqDlePiKsqoZEQGqZqp2RhRnio
	8qMg==
X-Gm-Message-State: AG10YOTQcjQRbELQ/wUw0XtQDBNY0oQFr/8pVGuWfh6L9+MEtIKcLh0BkInktgmaDzVXMA==
X-Received: by 10.28.146.145 with SMTP id u139mr15437575wmd.81.1455592058406; 
	Mon, 15 Feb 2016 19:07:38 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	198sm18411892wml.22.2016.02.15.19.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Feb 2016 19:07:36 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 20:07:26 -0700
Message-Id: <1455592046-7926-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] rng-tools: fix the build with musl
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
X-List-Received-Date: Tue, 16 Feb 2016 03:07:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

musl doesn't provide argp, so we need argp-standalone, as we do for uclibc.
Rather than passing in -largp via the recipe, patch the configure script to
provide an argument for the libargp usage and check for it when needed, and
use PACKAGECONFIG. The initial patch to check for libargp and use it if
available came from Gentoo. The patches are kept separate despite the second
modifying what the first does, in order to keep the history/origin clear.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 ...1-If-the-libc-is-lacking-argp-use-libargp.patch | 60 ++++++++++++++
 ...rgument-to-control-the-libargp-dependency.patch | 92 ++++++++++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb      |  8 +-
 3 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch b/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
new file mode 100644
index 0000000..4bd9d31
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-If-the-libc-is-lacking-argp-use-libargp.patch
@@ -0,0 +1,60 @@
+From 99679fda405e535a282f04a4decc2381154a749f Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Mon, 15 Feb 2016 15:59:58 -0700
+Subject: [PATCH 1/2] If the libc is lacking argp, use libargp
+
+Patch pulled from Gentoo:
+
+    On glibc systems, argp is provided by libc.  However, on
+    uclibc and other systems which lack argp in their C library,
+    argp might be provided by a stand alone library, libargp.
+    This patch adds tests to the build system to find who provides
+    argp.
+
+    X-Gentoo-Bug: 292191
+    X-Gentoo-Bug-URL: https://bugs.gentoo.org/show_bug.cgi?id=292191
+    Reported-by: Ed Wildgoose <gentoo@wildgooses.com>
+    Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ configure.ac | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 27a2dba..04fcd25 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -82,6 +82,28 @@ AS_IF(
+ 	]
+ )
+ 
++dnl First check if we have argp available from libc
++AC_LINK_IFELSE(
++	[AC_LANG_PROGRAM(
++		[#include <argp.h>],
++		[int argc=1; char *argv[]={"test"}; argp_parse(0,argc,argv,0,0,0); return 0;]
++		)],
++	[libc_has_argp="true"],
++	[libc_has_argp="false"]
++)
++
++dnl If libc doesn't provide argp, then test for libargp
++if test "$libc_has_argp" = "false" ; then
++	AC_MSG_WARN("libc does not have argp")
++	AC_CHECK_LIB([argp], [argp_parse], [have_argp="true"], [have_argp="false"])
++
++	if test "$have_argp" = "false"; then
++		AC_MSG_ERROR("no libargp found")
++	else
++		LIBS+=" -largp"
++	fi
++fi
++
+ dnl -----------------
+ dnl Configure options
+ dnl -----------------
+-- 
+2.2.1
+
diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch b/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
new file mode 100644
index 0000000..1c8a79c
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0002-Add-argument-to-control-the-libargp-dependency.patch
@@ -0,0 +1,92 @@
+From afc8712a9e6c72fbd03c36f84ecf8703e5d22a8c Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Mon, 15 Feb 2016 16:11:32 -0700
+Subject: [PATCH 2/2] Add argument to control the libargp dependency
+
+This ensures that the builds are always deterministic. If the argument isn't
+passed, the default behavior is to use libargp if the libc doesn't have argp.
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ configure.ac | 55 ++++++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 36 insertions(+), 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 04fcd25..11a5321 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,6 +32,13 @@ AC_ARG_WITH([libgcrypt],
+ 	[with_libgcrypt=check]
+ )
+ 
++AC_ARG_WITH([libargp],
++	AS_HELP_STRING([--without-libargp],
++		[Disable libargp support. Systems whose libc lacks argp can use libargp instead. (Default: check if libc lacks argp)]),
++	[with_libargp=$withval],
++	[with_libargp=check]
++)
++
+ dnl Make sure anyone changing configure.ac/Makefile.am has a clue
+ AM_MAINTAINER_MODE
+ 
+@@ -82,27 +89,37 @@ AS_IF(
+ 	]
+ )
+ 
+-dnl First check if we have argp available from libc
+-AC_LINK_IFELSE(
+-	[AC_LANG_PROGRAM(
+-		[#include <argp.h>],
+-		[int argc=1; char *argv[]={"test"}; argp_parse(0,argc,argv,0,0,0); return 0;]
+-		)],
+-	[libc_has_argp="true"],
+-	[libc_has_argp="false"]
++dnl Determine if we need libargp: either user requested, or libc has no argp
++AS_IF(
++	[test "x$with_libargp" != "xyes"],
++	[
++		AC_LINK_IFELSE(
++			[AC_LANG_PROGRAM(
++				[#include <argp.h>],
++				[int argc=1; char *argv[]={"test"}; argp_parse(0,argc,argv,0,0,0); return 0;]
++				)],
++			[need_libargp=no],
++			[need_libargp=yes
++			 if test "x$with_libargp" = "xno"; then
++				AC_MSG_FAILURE([libargp disabled and libc does not have argp])
++			 fi]
++		)
++	],
++	[need_libargp=yes],
+ )
+ 
+-dnl If libc doesn't provide argp, then test for libargp
+-if test "$libc_has_argp" = "false" ; then
+-	AC_MSG_WARN("libc does not have argp")
+-	AC_CHECK_LIB([argp], [argp_parse], [have_argp="true"], [have_argp="false"])
+-
+-	if test "$have_argp" = "false"; then
+-		AC_MSG_ERROR("no libargp found")
+-	else
+-		LIBS+=" -largp"
+-	fi
+-fi
++dnl Check for libargp
++AS_IF(
++	[test "x$need_libargp" = "xyes"],
++	[
++		AC_CHECK_LIB(
++			[argp],
++			[argp_parse],
++			[LIBS="$LIBS -largp"],
++			[AC_MSG_FAILURE([libargp not found])]
++		)
++	]
++)
+ 
+ dnl -----------------
+ dnl Configure options
+-- 
+2.2.1
+
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index 67f53f2..9a19d1c 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -1,9 +1,10 @@
 SUMMARY = "Random number generator daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0b6f033afe6db235e559456585dc8cdc"
-DEPENDS_append_libc-uclibc = " argp-standalone"
 
 SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
+           file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
+           file://0002-Add-argument-to-control-the-libargp-dependency.patch \
            file://init \
            file://default"
 
@@ -19,6 +20,11 @@ python () {
 
 inherit autotools update-rc.d
 
+PACKAGECONFIG = ""
+PACKAGECONFIG_libc-musl = "libargp"
+PACKAGECONFIG_libc-uclibc = "libargp"
+PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
+
 RDEPENDS_${PN} = "libgcrypt"
 
 do_install_append() {
-- 
2.2.1


