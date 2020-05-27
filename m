Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.8436.1590593519191301978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 08:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,441,1583164800"; 
   d="scan'208";a="93220268"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 May 2020 23:32:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 14C094BCC89D
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 23:31:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 May 2020 23:31:58 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libksba: upgrade 1.3.5 -> 1.4.0
Date: Wed, 27 May 2020 23:31:51 +0800
Message-ID: <1590593511-63267-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 14C094BCC89D.A858E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

ksba-add-pkgconfig-support.patch
removed since it is not available in 1.4.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libksba/ksba-add-pkgconfig-support.patch  | 152 ------------------
 .../{libksba_1.3.5.bb => libksba_1.4.0.bb}    |   7 +-
 2 files changed, 3 insertions(+), 156 deletions(-)
 delete mode 100644 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
 rename meta/recipes-support/libksba/{libksba_1.3.5.bb => libksba_1.4.0.bb} (78%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
deleted file mode 100644
index 5afe6de923..0000000000
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-Upstream-Status: Denied
-
-Add pkgconfig support to libksba.
-This patch is rejected by upstream for the reason below:
-They think pkgconfig adds no portability and maintaining them is not worthwhile.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Index: libksba-1.3.5/Makefile.am
-===================================================================
---- libksba-1.3.5.orig/Makefile.am
-+++ libksba-1.3.5/Makefile.am
-@@ -20,6 +20,9 @@
- 
- ACLOCAL_AMFLAGS = -I m4 -I gl/m4
- 
-+pkgconfigdir = ${libdir}/pkgconfig
-+pkgconfig_DATA = ksba.pc
-+
- # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
- GITLOG_TO_CHANGELOG=gitlog-to-changelog
- 
-Index: libksba-1.3.5/configure.ac
-===================================================================
---- libksba-1.3.5.orig/configure.ac
-+++ libksba-1.3.5/configure.ac
-@@ -414,6 +414,7 @@ gl/Makefile
- src/Makefile
- src/ksba-config
- src/versioninfo.rc
-+ksba.pc
- tests/Makefile
- doc/Makefile
- ])
-Index: libksba-1.3.5/ksba.pc.in
-===================================================================
---- /dev/null
-+++ libksba-1.3.5/ksba.pc.in
-@@ -0,0 +1,17 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+# API info
-+api_version=@KSBA_CONFIG_API_VERSION@
-+host=@KSBA_CONFIG_HOST@
-+
-+Name: ksba
-+Description: Libksba provides an easy API to create and parse X.509 and CMS related objects
-+Requires:
-+Version: @VERSION@
-+Libs: -L${libdir} -lksba
-+Libs.private: -L${libdir} -lgpg-error
-+Cflags: -I${includedir}
-+
-Index: libksba-1.3.5/src/ksba.m4
-===================================================================
---- libksba-1.3.5.orig/src/ksba.m4
-+++ libksba-1.3.5/src/ksba.m4
-@@ -22,18 +22,7 @@ dnl with a changed API.
- dnl
- AC_DEFUN([AM_PATH_KSBA],
- [AC_REQUIRE([AC_CANONICAL_HOST])
-- AC_ARG_WITH(ksba-prefix,
--            AC_HELP_STRING([--with-ksba-prefix=PFX],
--                           [prefix where KSBA is installed (optional)]),
--     ksba_config_prefix="$withval", ksba_config_prefix="")
--  if test x$ksba_config_prefix != x ; then
--     ksba_config_args="$ksba_config_args --prefix=$ksba_config_prefix"
--     if test x${KSBA_CONFIG+set} != xset ; then
--        KSBA_CONFIG=$ksba_config_prefix/bin/ksba-config
--     fi
--  fi
- 
--  AC_PATH_PROG(KSBA_CONFIG, ksba-config, no)
-   tmp=ifelse([$1], ,1:1.0.0,$1)
-   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-      req_ksba_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -43,48 +32,13 @@ AC_DEFUN([AM_PATH_KSBA],
-      min_ksba_version="$tmp"
-   fi
- 
--  AC_MSG_CHECKING(for KSBA - version >= $min_ksba_version)
--  ok=no
--  if test "$KSBA_CONFIG" != "no" ; then
--    req_major=`echo $min_ksba_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
--    req_minor=`echo $min_ksba_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
--    req_micro=`echo $min_ksba_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
--    ksba_config_version=`$KSBA_CONFIG $ksba_config_args --version`
--    major=`echo $ksba_config_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
--    minor=`echo $ksba_config_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
--    micro=`echo $ksba_config_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/'`
--    if test "$major" -gt "$req_major"; then
--        ok=yes
--    else
--        if test "$major" -eq "$req_major"; then
--            if test "$minor" -gt "$req_minor"; then
--               ok=yes
--            else
--               if test "$minor" -eq "$req_minor"; then
--                   if test "$micro" -ge "$req_micro"; then
--                     ok=yes
--                   fi
--               fi
--            fi
--        fi
--    fi
--  fi
--  if test $ok = yes; then
--    AC_MSG_RESULT([yes ($ksba_config_version)])
--  else
--    AC_MSG_RESULT(no)
--  fi
-+  PKG_CHECK_MODULES(KSBA, [ksba >= $min_ksba_version], [ok=yes], [ok=no])
-+
-   if test $ok = yes; then
-      # Even if we have a recent libksba, we should check that the
-      # API is compatible.
-      if test "$req_ksba_api" -gt 0 ; then
--        tmp=`$KSBA_CONFIG --api-version 2>/dev/null || echo 0`
-+        tmp=`$PKG_CONFIG --variable=api_version ksba`
-         if test "$tmp" -gt 0 ; then
-            AC_MSG_CHECKING([KSBA API version])
-            if test "$req_ksba_api" -eq "$tmp" ; then
-@@ -97,10 +51,8 @@ AC_DEFUN([AM_PATH_KSBA],
-      fi
-   fi
-   if test $ok = yes; then
--    KSBA_CFLAGS=`$KSBA_CONFIG $ksba_config_args --cflags`
--    KSBA_LIBS=`$KSBA_CONFIG $ksba_config_args --libs`
-     ifelse([$2], , :, [$2])
--    libksba_config_host=`$LIBKSBA_CONFIG $ksba_config_args --host 2>/dev/null || echo none`
-+    libksba_config_host=`$PKG_CONFIG --variable=host ksba`
-     if test x"$libksba_config_host" != xnone ; then
-       if test x"$libksba_config_host" != x"$host" ; then
-   AC_MSG_WARN([[
-@@ -114,8 +66,6 @@ AC_DEFUN([AM_PATH_KSBA],
-       fi
-     fi
-   else
--    KSBA_CFLAGS=""
--    KSBA_LIBS=""
-     ifelse([$3], , :, [$3])
-   fi
-   AC_SUBST(KSBA_CFLAGS)
diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.4.0.bb
similarity index 78%
rename from meta/recipes-support/libksba/libksba_1.3.5.bb
rename to meta/recipes-support/libksba/libksba_1.4.0.bb
index 336d7f8177..f8ab472238 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.4.0.bb
@@ -16,11 +16,10 @@ BINCONFIG = "${bindir}/ksba-config"
 inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
-SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "8302a3e263a7c630aa7dea7d341f07a2"
-SRC_URI[sha256sum] = "41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340"
+SRC_URI[md5sum] = "4026f93b5589a00a4b59dbca3057cbb2"
+SRC_URI[sha256sum] = "bfe6a8e91ff0f54d8a329514db406667000cb207238eded49b599761bfca41b6"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.17.1



