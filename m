Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0781B71999
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945746"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:03 +0300
Message-Id: <4620b10fade4c3e211ec1ede465fd26818307e83.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/50] libxslt: update to 1.1.31
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstreamed patches, including pkg-config support patch,
as upstream now does use pkg-config.

configure.in is now configure.ac, adjust recipe accordingly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...for-integer-overflow-in-xsltAddTextString.patch |  80 -------------
 .../libxslt/0001-Link-libraries-with-libm.patch    |  48 --------
 ...Use-pkg-config-to-find-gcrypt-and-libxml2.patch | 130 ---------------------
 .../{libxslt_1.1.29.bb => libxslt_1.1.31.bb}       |   9 +-
 4 files changed, 3 insertions(+), 264 deletions(-)
 delete mode 100644 meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch
 delete mode 100644 meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch
 delete mode 100644 meta/recipes-support/libxslt/libxslt/0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch
 rename meta/recipes-support/libxslt/{libxslt_1.1.29.bb => libxslt_1.1.31.bb} (77%)

diff --git a/meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch b/meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch
deleted file mode 100644
index 57aaacc587b..00000000000
--- a/meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 08ab2774b870de1c7b5a48693df75e8154addae5 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Thu, 12 Jan 2017 15:39:52 +0100
-Subject: [PATCH] Check for integer overflow in xsltAddTextString
-
-Limit buffer size in xsltAddTextString to INT_MAX. The issue can be
-exploited to trigger an out of bounds write on 64-bit systems.
-
-Originally reported to Chromium:
-
-https://crbug.com/676623
-
-CVE: CVE-2017-5029
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitus.com>
-
----
- libxslt/transform.c     | 25 ++++++++++++++++++++++---
- libxslt/xsltInternals.h |  4 ++--
- 2 files changed, 24 insertions(+), 5 deletions(-)
-
-diff --git a/libxslt/transform.c b/libxslt/transform.c
-index 519133f..02bff34 100644
---- a/libxslt/transform.c
-+++ b/libxslt/transform.c
-@@ -813,13 +813,32 @@ xsltAddTextString(xsltTransformContextPtr ctxt, xmlNodePtr target,
-         return(target);
- 
-     if (ctxt->lasttext == target->content) {
-+        int minSize;
- 
--	if (ctxt->lasttuse + len >= ctxt->lasttsize) {
-+        /* Check for integer overflow accounting for NUL terminator. */
-+        if (len >= INT_MAX - ctxt->lasttuse) {
-+            xsltTransformError(ctxt, NULL, target,
-+                "xsltCopyText: text allocation failed\n");
-+            return(NULL);
-+        }
-+        minSize = ctxt->lasttuse + len + 1;
-+
-+        if (ctxt->lasttsize < minSize) {
- 	    xmlChar *newbuf;
- 	    int size;
-+            int extra;
-+
-+            /* Double buffer size but increase by at least 100 bytes. */
-+            extra = minSize < 100 ? 100 : minSize;
-+
-+            /* Check for integer overflow. */
-+            if (extra > INT_MAX - ctxt->lasttsize) {
-+                size = INT_MAX;
-+            }
-+            else {
-+                size = ctxt->lasttsize + extra;
-+            }
- 
--	    size = ctxt->lasttsize + len + 100;
--	    size *= 2;
- 	    newbuf = (xmlChar *) xmlRealloc(target->content,size);
- 	    if (newbuf == NULL) {
- 		xsltTransformError(ctxt, NULL, target,
-diff --git a/libxslt/xsltInternals.h b/libxslt/xsltInternals.h
-index 060b178..5ad1771 100644
---- a/libxslt/xsltInternals.h
-+++ b/libxslt/xsltInternals.h
-@@ -1754,8 +1754,8 @@ struct _xsltTransformContext {
-      * Speed optimization when coalescing text nodes
-      */
-     const xmlChar  *lasttext;		/* last text node content */
--    unsigned int    lasttsize;		/* last text node size */
--    unsigned int    lasttuse;		/* last text node use */
-+    int             lasttsize;		/* last text node size */
-+    int             lasttuse;		/* last text node use */
-     /*
-      * Per Context Debugging
-      */
--- 
-1.9.1
-
diff --git a/meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch b/meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch
deleted file mode 100644
index 16ffeba1063..00000000000
--- a/meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 487e2f7e35dad3deec7978ce4478a3d4ea5070e7 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 10 Feb 2017 14:26:59 +0200
-Subject: [PATCH] Link libraries with libm
-
-Otherwise linking the resulting libraries to a binary (e.g. xsltproc)
-fails when using gold linker:
-| ../libxslt/.libs/libxslt.so: error: undefined reference to 'fmod'
-| ../libxslt/.libs/libxslt.so: error: undefined reference to 'pow'
-| ../libexslt/.libs/libexslt.so: error: undefined reference to 'floor'
-| collect2: error: ld returned 1 exit status
-
-Upstream-Status: Submitted [mailing list, Feb 10 2017]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- libexslt/Makefile.am | 2 +-
- libxslt/Makefile.am  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libexslt/Makefile.am b/libexslt/Makefile.am
-index 1cf5138..5449524 100644
---- a/libexslt/Makefile.am
-+++ b/libexslt/Makefile.am
-@@ -27,7 +27,7 @@ libexslt_la_SOURCES =                   \
- 	libexslt.h			\
- 	dynamic.c
- 
--libexslt_la_LIBADD = $(top_builddir)/libxslt/libxslt.la $(EXTRA_LIBS) $(LIBGCRYPT_LIBS)
-+libexslt_la_LIBADD = $(top_builddir)/libxslt/libxslt.la $(EXTRA_LIBS) $(LIBGCRYPT_LIBS) $(M_LIBS)
- libexslt_la_LDFLAGS = $(WIN32_EXTRA_LDFLAGS) -version-info $(LIBEXSLT_VERSION_INFO)
- 
- man_MANS = libexslt.3
-diff --git a/libxslt/Makefile.am b/libxslt/Makefile.am
-index d9fed68..9d44c3d 100644
---- a/libxslt/Makefile.am
-+++ b/libxslt/Makefile.am
-@@ -62,7 +62,7 @@ else
- LIBXSLT_VERSION_SCRIPT =
- endif
- 
--libxslt_la_LIBADD = $(LIBXML_LIBS) $(EXTRA_LIBS)
-+libxslt_la_LIBADD = $(LIBXML_LIBS) $(M_LIBS) $(EXTRA_LIBS)
- libxslt_la_LDFLAGS =					\
- 		$(WIN32_EXTRA_LDFLAGS)			\
- 		$(LIBXSLT_VERSION_SCRIPT)		\
--- 
-2.1.4
-
diff --git a/meta/recipes-support/libxslt/libxslt/0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch b/meta/recipes-support/libxslt/libxslt/0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch
deleted file mode 100644
index 71867067b69..00000000000
--- a/meta/recipes-support/libxslt/libxslt/0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From ed71ac9548a2bb6ecd2dc5ad880c604975f872b0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 2 Jun 2016 14:20:04 +0300
-Subject: [PATCH] Use pkg-config to find gcrypt and libxml2.
-
-Upstream-Status: Pending [libxml2 is upstreamable]
-
-RP 2014/5/22
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.in | 70 +++++++++++-------------------------------------------------
- 1 file changed, 12 insertions(+), 58 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 8bdf45a..0b2b312 100644
---- a/configure.in
-+++ b/configure.in
-@@ -377,6 +377,8 @@ AC_SUBST(pythondir)
- AC_SUBST(PYTHON_SUBDIR)
- AC_SUBST(PYTHON_LIBS)
- 
-+PKG_PROG_PKG_CONFIG
-+
- AC_ARG_WITH(crypto, [  --with-crypto           Add crypto support to exslt (on)])
- WITH_CRYPTO=0
- CRYPTO_TESTDIR=
-@@ -394,27 +396,14 @@ case $host in
-     CRYPTO_TESTDIR=crypto
-     ;;
-   *)
--    AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, no)
--    if test "$LIBGCRYPT_CONFIG" != "no" ; then
--      LIBGCRYPT_VERSION=`$LIBGCRYPT_CONFIG --version`
--      if test VERSION_TO_NUMBER(echo $LIBGCRYPT_VERSION) -lt VERSION_TO_NUMBER(echo "1.1.42")
--      then
--        LIBGCRYPT_CFLAGS=""
--        LIBGCRYPT_LIBS=""
--        echo 'gcrypt library version < 1.1.42 - Crypto extensions will not be available.'
--      else
--        LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG $libgcrypt_config_args --cflags`
--        LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG $libgcrypt_config_args --libs`
--        AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is available.])
--        echo 'Crypto extensions will be available.'
-+    PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= 1.1.42], [
-+          AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is available.])
-+          echo 'Crypto extensions will be available.'
-         WITH_CRYPTO=1
-         CRYPTO_TESTDIR=crypto
--      fi
--    else
--      LIBGCRYPT_CFLAGS=""
--      LIBGCRYPT_LIBS=""
--      echo 'Crypto extensions will not be available. Install libgcrypt and reconfigure to make available.'
--    fi
-+       ], [
-+          echo 'Crypto extensions will not be available. Install libgcrypt >= 1.1.42 and reconfigure to make available.'
-+        ])
- esac
- fi
- AC_SUBST(WITH_CRYPTO)
-@@ -476,24 +465,8 @@ dnl original work - Mathieu Lacage 30/03/2000
- dnl some tweaking - David Härdeman 30/10/2001
- dnl
- 
--LIBXML_CONFIG_PREFIX=""
- LIBXML_SRC=""
- 
--AC_ARG_WITH(libxml-prefix,
--        [  --with-libxml-prefix=[PFX]		Specify location of libxml config],
--	LIBXML_CONFIG_PREFIX=$withval
--)
--        
--AC_ARG_WITH(libxml-include-prefix,
--        [  --with-libxml-include-prefix=[PFX]	Specify location of libxml headers],
--        LIBXML_CFLAGS="-I$withval"
--)
--
--AC_ARG_WITH(libxml-libs-prefix,
--        [  --with-libxml-libs-prefix=[PFX]	Specify location of libxml libs],
--        LIBXML_LIBS="-L$withval"
--)
--
- AC_ARG_WITH(libxml-src,
- 	[  --with-libxml-src=[DIR]              For libxml thats not installed yet (sets all three above)],
- 	LIBXML_SRC="$withval"
-@@ -556,28 +529,9 @@ then
- 	fi
- fi
- 
--dnl
--dnl make sure xml2-config is executable,
--dnl test version and init our variables
--dnl
--
--if ${XML_CONFIG} --libs print > /dev/null 2>&1
--then
--	XMLVERS=`$XML_CONFIG --version`
--	if test VERSION_TO_NUMBER(echo $XMLVERS) -ge VERSION_TO_NUMBER(echo $LIBXML_REQUIRED_VERSION)
--	then
--		AC_MSG_RESULT($XMLVERS found)
--	else
--		AC_MSG_ERROR(Version $XMLVERS found. You need at least libxml2 $LIBXML_REQUIRED_VERSION for this version of libxslt)
--	fi
--	LIBXML_LIBS="$LIBXML_LIBS `$XML_CONFIG --libs`"
--	if test "x$LIBXML_SRC" = "x"; then
--		LIBXML_CFLAGS="$LIBXML_CFLAGS `$XML_CONFIG --cflags`"
--	fi
--else
--	AC_MSG_ERROR([Could not find libxml2 anywhere, check ftp://xmlsoft.org/.])
--fi
--
-+PKG_CHECK_MODULES(LIBXML, [libxml-2.0 >= $LIBXML_REQUIRED_VERSION],,
-+    [AC_MSG_ERROR([Could not find libxml-2.0 >= $LIBXML_REQUIRED_VERSION anywhere, check ftp://xmlsoft.org/.])]
-+)
- 
- AC_SUBST(CFLAGS)
- AC_SUBST(CPPFLAGS)
-@@ -602,7 +556,7 @@ fi
- 
- if test "$with_plugins" = "yes" ; then
-   AC_MSG_CHECKING([libxml2 module support])
--  WITH_MODULES="`$XML_CONFIG --modules`"
-+  WITH_MODULES="`$PKG_CONFIG --variable=modules libxml-2.0`"
-   if test "${WITH_MODULES}" = "1"; then
-     AC_MSG_RESULT(yes)
-   else
--- 
-2.8.1
-
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb b/meta/recipes-support/libxslt/libxslt_1.1.31.bb
similarity index 77%
rename from meta/recipes-support/libxslt/libxslt_1.1.29.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.31.bb
index d27c7066027..77b8b768eb6 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.31.bb
@@ -10,13 +10,10 @@ DEPENDS = "libxml2"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt/libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
-           file://0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch \
-           file://0001-Link-libraries-with-libm.patch \
-           file://0001-Check-for-integer-overflow-in-xsltAddTextString.patch \
            "
 
-SRC_URI[md5sum] = "a129d3c44c022de3b9dcf6d6f288d72e"
-SRC_URI[sha256sum] = "b5976e3857837e7617b29f2249ebb5eeac34e249208d31f1fbf7a6ba7a4090ce"
+SRC_URI[md5sum] = "14e9842a70fda476065f2eefcbc29af0"
+SRC_URI[sha256sum] = "db25e96b6b801144277e67c05b10560ac09dfff82ccd53a154ce86e43622f3ab"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -28,7 +25,7 @@ inherit autotools pkgconfig binconfig-disabled lib_package
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
-	sed -i -e 's/ansidecl.h//' ${S}/configure.in
+	sed -i -e 's/ansidecl.h//' ${S}/configure.ac
 
 	# The timestamps in the 1.1.28 tarball are messed up causing this file to
 	# appear out of date.  Touch it so that we don't try to regenerate it.
-- 
2.14.1


