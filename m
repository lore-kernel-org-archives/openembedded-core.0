Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id EEA4275618
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 18:49:07 +0000 (UTC)
Received: by iepj10 with SMTP id j10so20720796iep.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 11:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=x3siw2wF+72MX994DmLgdblaI6IA67Xl81SIMDwXN68=;
	b=Ge6ij9s3Uxc82hNN039vfwVqNJso+zh8FMJ5zOK/I+5VC9v/fADmJbUOh99RzG7xAt
	SPD7J+nWFR3wVMRL7CA3CYP7AGHJ/RYHc9YMgd9maro9aKPQcWPnT03t6oizTA92s8mU
	0Jzjuw/rn7FEvf72W+kdzrcs2uktnirrCspTFav1yEqxBFpU3I8KRAE0BZDjGe+JnZ0s
	5vmalbQUMuLBNwllX7YaNPHQOImlZH2DSim6MohUBKPXcTPNVjts5BtS2PvvKBe6fG5A
	l9Urgns/y9sQHgfptF971MZpCSEUjKNzUZhvKSD4zmxk+ukWfyzjJJZ6jW9KEf7XBZ1M
	DXfA==
X-Received: by 10.107.30.10 with SMTP id e10mr44830018ioe.72.1432752548269;
	Wed, 27 May 2015 11:49:08 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id qs10sm211381igb.14.2015.05.27.11.49.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 May 2015 11:49:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 11:48:49 -0700
Message-Id: <1432752530-20335-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] gnutls: use pkg-config to locate zlib
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
X-List-Received-Date: Wed, 27 May 2015 18:49:08 -0000

AC_LIB_HAVE_LINKFLAGS can sometimes find host libs and is therefore not
robust when cross-compiling. Remove it for zlib and use PKG_CHECK_MODULES
instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gnutls/use-pkg-config-to-locate-zlib.patch     | 67 ++++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch

diff --git a/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch b/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
new file mode 100644
index 0000000..0e1b7c8
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
@@ -0,0 +1,67 @@
+From cee80af1fe93f5b76765afeebfcc3b902768f5d6 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 26 May 2015 21:41:24 -0700
+Subject: [PATCH] use pkg-config to locate zlib
+
+AC_LIB_HAVE_LINKFLAGS can sometimes find host libs and is therefore not
+robust when cross-compiling. Remove it for zlib and use PKG_CHECK_MODULES
+instead.
+
+Removing AC_LIB_HAVE_LINKFLAGS for zlib also removes the --with-libz-prefix
+configure option. If zlib support is enabled, then failure to find zlib via
+pkg-config is now treated as a fatal error.
+
+Change based on ChromeOS gnutls 2.12.23 cross-compile fixes patch:
+
+  https://chromium-review.googlesource.com/#/c/271661/
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ configure.ac | 24 ++++++++++--------------
+ 1 file changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1b561d5..0c787dc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -508,25 +508,21 @@ AC_ARG_WITH(zlib, AS_HELP_STRING([--without-zlib],
+ AC_MSG_CHECKING([whether to include zlib compression support])
+ if test x$ac_zlib != xno; then
+  AC_MSG_RESULT(yes)
+- AC_LIB_HAVE_LINKFLAGS(z,, [#include <zlib.h>], [compress (0, 0, 0, 0);])
+- if test x$ac_cv_libz != xyes; then
+-   AC_MSG_WARN(
+-*** 
+-*** ZLIB was not found. You will not be able to use ZLIB compression.)
+- fi
+ else
+  AC_MSG_RESULT(no)
+ fi
+ 
+-PKG_CHECK_EXISTS(zlib, ZLIB_HAS_PKGCONFIG=y, ZLIB_HAS_PKGCONFIG=n)
+-
+ if test x$ac_zlib != xno; then
+-  if test "$ZLIB_HAS_PKGCONFIG" = "y" ; then
+-    if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
+-      GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
+-    else
+-      GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
+-    fi
++  PKG_CHECK_MODULES(ZLIB, zlib)
++  HAVE_LIBZ=yes
++  AC_DEFINE([HAVE_LIBZ], [1], [zlib is enabled])
++  AC_SUBST(HAVE_LIBZ)
++  LTLIBZ=$ZLIB_LIBS
++  AC_SUBST(LTLIBZ)
++  if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
++    GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
++  else
++    GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
+   fi
+ fi
+ AC_SUBST(GNUTLS_REQUIRES_PRIVATE)
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.14.bb b/meta/recipes-support/gnutls/gnutls_3.3.14.bb
index 89057ba..f41d183 100644
--- a/meta/recipes-support/gnutls/gnutls_3.3.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.3.14.bb
@@ -2,6 +2,7 @@ require gnutls.inc
 
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://configure.ac-fix-sed-command.patch \
+            file://use-pkg-config-to-locate-zlib.patch \
            "
 SRC_URI[md5sum] = "7f4465f8c564cf9cb8f5cb38b909f7ca"
 SRC_URI[sha256sum] = "0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52"
-- 
1.9.1


