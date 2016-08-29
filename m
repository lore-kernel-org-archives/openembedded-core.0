Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 557507316B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688735"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:06 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:17 +0300
Message-Id: <259a10f3dbe251342ffb30a01babf61d0eeabc55.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/15] lighttpd: update to 1.4.41
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:08 -0000

Rebase pkgconfig.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...fig-for-pcre-dependency-instead-of-config.patch | 37 ++++++++++++++++++++++
 .../lighttpd/lighttpd/pkgconfig.patch              | 33 -------------------
 .../{lighttpd_1.4.39.bb => lighttpd_1.4.41.bb}     |  6 ++--
 3 files changed, 40 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.39.bb => lighttpd_1.4.41.bb} (91%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
new file mode 100644
index 0000000..b8c7f37
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
@@ -0,0 +1,37 @@
+From e7a8c925b9316a72bdc8f32789ffe56fda5c4788 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 26 Aug 2016 18:20:32 +0300
+Subject: [PATCH] Use pkg-config for pcre dependency instead of -config script.
+
+RP 2014/5/22
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1d172a1..a9236da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -380,11 +380,12 @@ if test "$WITH_PCRE" != "no"; then
+ 			PCRE_LIB="-L$WITH_PCRE/lib -lpcre"
+ 			CPPFLAGS="$CPPFLAGS -I$WITH_PCRE/include"
+ 		else
+-			AC_PATH_PROG(PCRECONFIG, pcre-config)
+-			if test x"$PCRECONFIG" != x; then
+-				PCRE_LIB=`$PCRECONFIG --libs`
+-				CPPFLAGS="$CPPFLAGS `$PCRECONFIG --cflags`"
+-			fi
++			PKG_CHECK_MODULES(PCREPKG, [libpcre], [
++				PCRE_LIB=${PCREPKG_LIBS}
++				CPPFLAGS="$CPPFLAGS ${PCREPKG_CFLAGS}"
++			], [
++				AC_MSG_ERROR([pcre pkgconfig not found, install the pcre-devel package or build with --without-pcre])
++			])
+ 		fi
+ 
+   if test x"$PCRE_LIB" != x; then
+-- 
+2.9.3
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch b/meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch
deleted file mode 100644
index e395f92..0000000
--- a/meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Use pkg-config for pcre dependency instead of -config script.
-
-Upstream-Status: Pending
-
-RP 2014/5/22
-
-
-Index: lighttpd-1.4.35/configure.ac
-===================================================================
---- lighttpd-1.4.35.orig/configure.ac	2014-03-06 14:08:00.000000000 +0000
-+++ lighttpd-1.4.35/configure.ac	2014-05-13 16:58:30.758471169 +0000
-@@ -309,16 +309,14 @@
- AC_MSG_RESULT([$WITH_PCRE])
- 
- if test "$WITH_PCRE" != "no"; then
--  AC_PATH_PROG(PCRECONFIG, pcre-config)
--
--  if test x"$PCRECONFIG" != x; then
--    PCRE_LIB=`$PCRECONFIG --libs`
--    CPPFLAGS="$CPPFLAGS `$PCRECONFIG --cflags`"
-+  PKG_CHECK_MODULES(PCREPKG, [libpcre], [
-+    PCRE_LIB=${PCREPKG_LIBS}
-+    CPPFLAGS="$CPPFLAGS ${PCREPKG_CFLAGS}"
-     AC_DEFINE([HAVE_LIBPCRE], [1], [libpcre])
-     AC_DEFINE([HAVE_PCRE_H], [1], [pcre.h])
--  else
-+  ], [
-      AC_MSG_ERROR([pcre-config not found, install the pcre-devel package or build with --without-pcre])
--  fi
-+  ])
- fi
- 
- AC_SUBST(PCRE_LIB)
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
similarity index 91%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
index 378accb..a74d3a1 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
@@ -20,11 +20,11 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.conf \
         file://lighttpd \
         file://lighttpd.service \
-        file://pkgconfig.patch \
+        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "63c7563be1c7a7a9819a51f07f1af8b2"
-SRC_URI[sha256sum] = "7eb9a1853c3d6dd5851682b0733a729ba4158d6bdff80974d5ef5f1f6887365b"
+SRC_URI[md5sum] = "1df2e4dbc965cfe6f99f008ac3db4d8d"
+SRC_URI[sha256sum] = "4bcc383ef6d6dc7b284f68882d71a178e2986c83c4e85eeb3c8f3b882e346b6c"
 
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
-- 
2.9.3


