Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F246B71985
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 10:20:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2017 02:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,398,1505804400"; 
   d="scan'208";a="2075176"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2017 02:20:47 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 12:20:58 +0200
Message-Id: <20171115102058.38801-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] lighttpd: update to 1.4.48
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
X-List-Received-Date: Wed, 15 Nov 2017 10:20:49 -0000

Refresh the pcre pkg-config patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...fig-for-pcre-dependency-instead-of-config.patch | 45 ++++++++++++----------
 .../{lighttpd_1.4.45.bb => lighttpd_1.4.48.bb}     |  4 +-
 2 files changed, 27 insertions(+), 22 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.45.bb => lighttpd_1.4.48.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
index b8c7f375147..f17bdce2c00 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
@@ -1,4 +1,4 @@
-From e7a8c925b9316a72bdc8f32789ffe56fda5c4788 Mon Sep 17 00:00:00 2001
+From 22afc5d9aaa215c3c87ba21c77d47da44ab3b113 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 26 Aug 2016 18:20:32 +0300
 Subject: [PATCH] Use pkg-config for pcre dependency instead of -config script.
@@ -7,31 +7,36 @@ RP 2014/5/22
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- configure.ac | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
+ configure.ac | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1d172a1..a9236da 100644
+index 5383cec..c29a902 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -380,11 +380,12 @@ if test "$WITH_PCRE" != "no"; then
- 			PCRE_LIB="-L$WITH_PCRE/lib -lpcre"
- 			CPPFLAGS="$CPPFLAGS -I$WITH_PCRE/include"
- 		else
--			AC_PATH_PROG(PCRECONFIG, pcre-config)
--			if test x"$PCRECONFIG" != x; then
--				PCRE_LIB=`$PCRECONFIG --libs`
--				CPPFLAGS="$CPPFLAGS `$PCRECONFIG --cflags`"
--			fi
-+			PKG_CHECK_MODULES(PCREPKG, [libpcre], [
+@@ -651,10 +651,18 @@ AC_ARG_WITH([pcre],
+ )
+ AC_MSG_RESULT([$WITH_PCRE])
+ 
+-if test "$WITH_PCRE" != no; then
+-  if test "$WITH_PCRE" != yes; then
+-    PCRE_LIB="-L$WITH_PCRE/lib -lpcre"
+-    CPPFLAGS="$CPPFLAGS -I$WITH_PCRE/include"
++if test "$WITH_PCRE" != "no"; then
++  PKG_CHECK_MODULES(PCREPKG, [libpcre], [
 +				PCRE_LIB=${PCREPKG_LIBS}
 +				CPPFLAGS="$CPPFLAGS ${PCREPKG_CFLAGS}"
-+			], [
++  ], [
 +				AC_MSG_ERROR([pcre pkgconfig not found, install the pcre-devel package or build with --without-pcre])
-+			])
- 		fi
- 
-   if test x"$PCRE_LIB" != x; then
++  ])
++
++  if test x"$PCRE_LIB" != x; then
++    AC_DEFINE([HAVE_LIBPCRE], [1], [libpcre])
++    AC_DEFINE([HAVE_PCRE_H], [1], [pcre.h])
++    AC_SUBST(PCRE_LIB)
+   else
+     AC_PATH_PROG([PCRECONFIG], [pcre-config])
+     if test -n "$PCRECONFIG"; then
 -- 
-2.9.3
+2.15.0
 
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
index 08dda33606c..3c4444cf423 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "a128e1eda76899ce3fd115efae5fe631"
-SRC_URI[sha256sum] = "1c97225deea33eefba6d4158c2cef27913d47553263516bbe9d2e2760fc43a3f"
+SRC_URI[md5sum] = "1e3a9eb5078f481e3a8a1d0aaac8c3c8"
+SRC_URI[sha256sum] = "0f8ad5aac7529d7b948b9d7e8cd0b4a9e177309d85d6bf6516e28e6e40d74f36"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.15.0


