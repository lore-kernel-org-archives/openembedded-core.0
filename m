Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8B107751D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440271"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:59 +0300
Message-Id: <d3ee2656d8303c61578e4bb900c94f2c1d3f36e0.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/25] libxslt: update to 1.1.29
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstreamed CVE-2015-7995.patch
Rebase pkgconfig.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...se-pkg-config-to-find-gcrypt-and-libxml2.patch} | 42 ++++++++++++++--------
 .../libxslt/libxslt/CVE-2015-7995.patch            | 34 ------------------
 .../{libxslt_1.1.28.bb => libxslt_1.1.29.bb}       |  8 ++---
 3 files changed, 31 insertions(+), 53 deletions(-)
 rename meta/recipes-support/libxslt/libxslt/{pkgconfig.patch => 0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch} (78%)
 delete mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
 rename meta/recipes-support/libxslt/{libxslt_1.1.28.bb => libxslt_1.1.29.bb} (85%)

diff --git a/meta/recipes-support/libxslt/libxslt/pkgconfig.patch b/meta/recipes-support/libxslt/libxslt/0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch
similarity index 78%
rename from meta/recipes-support/libxslt/libxslt/pkgconfig.patch
rename to meta/recipes-support/libxslt/libxslt/0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch
index 89d14c9..7186706 100644
--- a/meta/recipes-support/libxslt/libxslt/pkgconfig.patch
+++ b/meta/recipes-support/libxslt/libxslt/0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch
@@ -1,14 +1,22 @@
-Use pkg-config to find gcrypt and libxml2.
+From ed71ac9548a2bb6ecd2dc5ad880c604975f872b0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 2 Jun 2016 14:20:04 +0300
+Subject: [PATCH] Use pkg-config to find gcrypt and libxml2.
 
 Upstream-Status: Pending [libxml2 is upstreamable]
 
 RP 2014/5/22
 
-Index: libxslt-1.1.28/configure.in
-===================================================================
---- libxslt-1.1.28.orig/configure.in	2014-05-13 16:46:02.278474967 +0000
-+++ libxslt-1.1.28/configure.in	2014-05-13 16:53:56.510472561 +0000
-@@ -376,6 +376,8 @@
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.in | 70 +++++++++++-------------------------------------------------
+ 1 file changed, 12 insertions(+), 58 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 8bdf45a..0b2b312 100644
+--- a/configure.in
++++ b/configure.in
+@@ -377,6 +377,8 @@ AC_SUBST(pythondir)
  AC_SUBST(PYTHON_SUBDIR)
  AC_SUBST(PYTHON_LIBS)
  
@@ -16,12 +24,12 @@ Index: libxslt-1.1.28/configure.in
 +
  AC_ARG_WITH(crypto, [  --with-crypto           Add crypto support to exslt (on)])
  WITH_CRYPTO=0
- if test "$with_crypto" = "no" ; then
-@@ -391,26 +393,13 @@
-     WITH_CRYPTO=1
+ CRYPTO_TESTDIR=
+@@ -394,27 +396,14 @@ case $host in
+     CRYPTO_TESTDIR=crypto
      ;;
    *)
--    AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
+-    AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, no)
 -    if test "$LIBGCRYPT_CONFIG" != "no" ; then
 -      LIBGCRYPT_VERSION=`$LIBGCRYPT_CONFIG --version`
 -      if test VERSION_TO_NUMBER(echo $LIBGCRYPT_VERSION) -lt VERSION_TO_NUMBER(echo "1.1.42")
@@ -37,20 +45,21 @@ Index: libxslt-1.1.28/configure.in
 +    PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= 1.1.42], [
 +          AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is available.])
 +          echo 'Crypto extensions will be available.'
- 		WITH_CRYPTO=1
+         WITH_CRYPTO=1
+         CRYPTO_TESTDIR=crypto
 -      fi
 -    else
 -      LIBGCRYPT_CFLAGS=""
 -      LIBGCRYPT_LIBS=""
 -      echo 'Crypto extensions will not be available. Install libgcrypt and reconfigure to make available.'
 -    fi
-+	], [
++       ], [
 +          echo 'Crypto extensions will not be available. Install libgcrypt >= 1.1.42 and reconfigure to make available.'
 +        ])
  esac
  fi
  AC_SUBST(WITH_CRYPTO)
-@@ -471,24 +460,8 @@
+@@ -476,24 +465,8 @@ dnl original work - Mathieu Lacage 30/03/2000
  dnl some tweaking - David Härdeman 30/10/2001
  dnl
  
@@ -75,7 +84,7 @@ Index: libxslt-1.1.28/configure.in
  AC_ARG_WITH(libxml-src,
  	[  --with-libxml-src=[DIR]              For libxml thats not installed yet (sets all three above)],
  	LIBXML_SRC="$withval"
-@@ -551,28 +524,9 @@
+@@ -556,28 +529,9 @@ then
  	fi
  fi
  
@@ -107,7 +116,7 @@ Index: libxslt-1.1.28/configure.in
  
  AC_SUBST(CFLAGS)
  AC_SUBST(CPPFLAGS)
-@@ -597,7 +551,7 @@
+@@ -602,7 +556,7 @@ fi
  
  if test "$with_plugins" = "yes" ; then
    AC_MSG_CHECKING([libxml2 module support])
@@ -116,3 +125,6 @@ Index: libxslt-1.1.28/configure.in
    if test "${WITH_MODULES}" = "1"; then
      AC_MSG_RESULT(yes)
    else
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
deleted file mode 100644
index f4113ef..0000000
--- a/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7ca19df892ca22d9314e95d59ce2abdeff46b617 Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Thu, 29 Oct 2015 19:33:23 +0800
-Subject: Fix for type confusion in preprocessing attributes
-
-CVE-2015-7995 http://www.openwall.com/lists/oss-security/2015/10/27/10
-We need to check that the parent node is an element before dereferencing
-its namespace
-
-Upstream-Status: Backport
-CVE: CVE-2015-7995
-
-https://git.gnome.org/browse/libxslt/commit/?id=7ca19df892ca22d9314e95d59ce2abdeff46b617
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- libxslt/preproc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: libxslt-1.1.28/libxslt/preproc.c
-===================================================================
---- libxslt-1.1.28.orig/libxslt/preproc.c
-+++ libxslt-1.1.28/libxslt/preproc.c
-@@ -2245,7 +2245,8 @@ xsltStylePreCompute(xsltStylesheetPtr st
- 	} else if (IS_XSLT_NAME(inst, "attribute")) {
- 	    xmlNodePtr parent = inst->parent;
- 
--	    if ((parent == NULL) || (parent->ns == NULL) ||
-+	    if ((parent == NULL) ||
-+	        (parent->type != XML_ELEMENT_NODE) || (parent->ns == NULL) ||
- 		((parent->ns != inst->ns) &&
- 		 (!xmlStrEqual(parent->ns->href, inst->ns->href))) ||
- 		(!xmlStrEqual(parent->name, BAD_CAST "attribute-set"))) {
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
similarity index 85%
rename from meta/recipes-support/libxslt/libxslt_1.1.28.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.29.bb
index 23ac599..be747e6 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
@@ -10,11 +10,11 @@ DEPENDS = "libxml2"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt/libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
-           file://pkgconfig.patch \
-           file://CVE-2015-7995.patch"
+           file://0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch \
+           "
 
-SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
-SRC_URI[sha256sum] = "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"
+SRC_URI[md5sum] = "a129d3c44c022de3b9dcf6d6f288d72e"
+SRC_URI[sha256sum] = "b5976e3857837e7617b29f2249ebb5eeac34e249208d31f1fbf7a6ba7a4090ce"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.8.1


