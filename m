Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9243C77F86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 05:12:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19061991"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 May 2017 13:12:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9AA8147C7C67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 13:12:12 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 19 May 2017 13:12:12 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 May 2017 13:11:54 +0800
Message-ID: <1495170714-23503-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 9AA8147C7C67.A5AF3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gnutls: 3.5.9 -> 3.5.11
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
X-List-Received-Date: Fri, 19 May 2017 05:12:20 -0000
Content-Type: text/plain

1) Upgrade gnutls from 3.5.9 to 3.5.11.
2) Delete one patch "use-pkg-config-to-locate-zlib.patch", since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../gnutls/use-pkg-config-to-locate-zlib.patch     | 67 ----------------------
 .../gnutls/{gnutls_3.5.9.bb => gnutls_3.5.11.bb}   |  5 +-
 2 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
 rename meta/recipes-support/gnutls/{gnutls_3.5.9.bb => gnutls_3.5.11.bb} (53%)

diff --git a/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch b/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
deleted file mode 100644
index 0e1b7c8..0000000
--- a/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From cee80af1fe93f5b76765afeebfcc3b902768f5d6 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 26 May 2015 21:41:24 -0700
-Subject: [PATCH] use pkg-config to locate zlib
-
-AC_LIB_HAVE_LINKFLAGS can sometimes find host libs and is therefore not
-robust when cross-compiling. Remove it for zlib and use PKG_CHECK_MODULES
-instead.
-
-Removing AC_LIB_HAVE_LINKFLAGS for zlib also removes the --with-libz-prefix
-configure option. If zlib support is enabled, then failure to find zlib via
-pkg-config is now treated as a fatal error.
-
-Change based on ChromeOS gnutls 2.12.23 cross-compile fixes patch:
-
-  https://chromium-review.googlesource.com/#/c/271661/
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- configure.ac | 24 ++++++++++--------------
- 1 file changed, 10 insertions(+), 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1b561d5..0c787dc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -508,25 +508,21 @@ AC_ARG_WITH(zlib, AS_HELP_STRING([--without-zlib],
- AC_MSG_CHECKING([whether to include zlib compression support])
- if test x$ac_zlib != xno; then
-  AC_MSG_RESULT(yes)
-- AC_LIB_HAVE_LINKFLAGS(z,, [#include <zlib.h>], [compress (0, 0, 0, 0);])
-- if test x$ac_cv_libz != xyes; then
--   AC_MSG_WARN(
--*** 
--*** ZLIB was not found. You will not be able to use ZLIB compression.)
-- fi
- else
-  AC_MSG_RESULT(no)
- fi
- 
--PKG_CHECK_EXISTS(zlib, ZLIB_HAS_PKGCONFIG=y, ZLIB_HAS_PKGCONFIG=n)
--
- if test x$ac_zlib != xno; then
--  if test "$ZLIB_HAS_PKGCONFIG" = "y" ; then
--    if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
--      GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
--    else
--      GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
--    fi
-+  PKG_CHECK_MODULES(ZLIB, zlib)
-+  HAVE_LIBZ=yes
-+  AC_DEFINE([HAVE_LIBZ], [1], [zlib is enabled])
-+  AC_SUBST(HAVE_LIBZ)
-+  LTLIBZ=$ZLIB_LIBS
-+  AC_SUBST(LTLIBZ)
-+  if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
-+    GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
-+  else
-+    GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
-   fi
- fi
- AC_SUBST(GNUTLS_REQUIRES_PRIVATE)
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.9.bb b/meta/recipes-support/gnutls/gnutls_3.5.11.bb
similarity index 53%
rename from meta/recipes-support/gnutls/gnutls_3.5.9.bb
rename to meta/recipes-support/gnutls/gnutls_3.5.11.bb
index 92e58b1..5e92f79 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.11.bb
@@ -2,10 +2,9 @@ require gnutls.inc
 
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
-            file://use-pkg-config-to-locate-zlib.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "0ab25eb6a1509345dd085bc21a387951"
-SRC_URI[sha256sum] = "82b10f0c4ef18f4e64ad8cef5dbaf14be732f5095a41cf366b4ecb4050382951"
+SRC_URI[md5sum] = "a3ff8cf5ca7522e3ba14f487e6326e11"
+SRC_URI[sha256sum] = "51765cc5579e250da77fbd7871507c517d01b15353cc40af7b67e9ec7b6fe28f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4




