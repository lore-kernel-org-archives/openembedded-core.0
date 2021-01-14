Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4714.1610607663519487410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 23:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,346,1602518400"; 
   d="scan'208";a="103471064"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2021 15:01:01 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B7BA74CE602E
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 15:00:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 Jan 2021 15:00:56 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libgpg-error: upgrade 1.39 -> 1.41
Date: Thu, 14 Jan 2021 15:00:50 +0800
Message-ID: <1610607650-12741-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B7BA74CE602E.A844A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh pkgconfig.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libgpg-error/libgpg-error/pkgconfig.patch | 31 ++++++++++---------
 ...gpg-error_1.39.bb => libgpg-error_1.41.bb} |  2 +-
 2 files changed, 17 insertions(+), 16 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.39.bb => libgpg-error_1.41.bb} (93%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index ca5f6b5c25..8d0dc4e3e1 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -11,18 +11,16 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Refactored for 1.33
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
- configure.ac        |  1 +
- src/gpg-error.m4    | 71 +++--------------------------------------------------
- 4 files changed, 18 insertions(+), 69 deletions(-)
- create mode 100644 src/gpg-error.pc.in
+ src/gpg-error.m4 | 142 +----------------------------------------------
+ 1 file changed, 3 insertions(+), 139 deletions(-)
 
-Index: libgpg-error-1.33/src/gpg-error.m4
-===================================================================
---- libgpg-error-1.33.orig/src/gpg-error.m4
-+++ libgpg-error-1.33/src/gpg-error.m4
-@@ -26,139 +26,13 @@ dnl is added to the gpg_config_script_wa
+diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
+index c9b235f..176bd6a 100644
+--- a/src/gpg-error.m4
++++ b/src/gpg-error.m4
+@@ -26,139 +26,12 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -31,12 +29,10 @@ Index: libgpg-error-1.33/src/gpg-error.m4
 -  dnl since that is consistent with how our three siblings use the directory/
 -  dnl package name in --with-$dir_name-prefix=PFX.
 -  AC_ARG_WITH(libgpg-error-prefix,
--              AC_HELP_STRING([--with-libgpg-error-prefix=PFX],
+-              AS_HELP_STRING([--with-libgpg-error-prefix=PFX],
 -                             [prefix where GPG Error is installed (optional)]),
 -              [gpg_error_config_prefix="$withval"])
-+  min_gpg_error_version=ifelse([$1], ,0.0,$1)
-+  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version], [ok=yes], [ok=no])
- 
+-
 -  dnl Accept --with-gpg-error-prefix and make it work the same as
 -  dnl --with-libgpg-error-prefix above, for backwards compatibility,
 -  dnl but do not document this old, inconsistently-named option.
@@ -143,6 +139,8 @@ Index: libgpg-error-1.33/src/gpg-error.m4
 -    fi
 -  fi
 -  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
++  min_gpg_error_version=ifelse([$1], ,0.0,$1)
++  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version], [ok=yes], [ok=no])
    if test $ok = yes; then
 -    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG --cflags`
 -    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG --libs`
@@ -165,7 +163,7 @@ Index: libgpg-error-1.33/src/gpg-error.m4
      fi
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
-@@ -174,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -174,15 +47,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
@@ -181,3 +179,6 @@ Index: libgpg-error-1.33/src/gpg-error.m4
 -  AC_SUBST(GPG_ERROR_MT_CFLAGS)
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb
similarity index 93%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.39.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.41.bb
index f53056f5c9..8205cb4557 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
            "
 
-SRC_URI[sha256sum] = "4a836edcae592094ef1c5a4834908f44986ab2b82e0824a0344b49df8cdb298f"
+SRC_URI[sha256sum] = "64b078b45ac3c3003d7e352a5e05318880a5778c42331ce1ef33d1a0d9922742"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.25.1



