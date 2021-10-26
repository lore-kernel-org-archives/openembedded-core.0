Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F48C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 06:37:48 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.8508.1635230267452054519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 23:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19Q6bkwu014855
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 23:37:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19Q6bj5N006771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 23:37:45 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 23:37:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 25 Oct 2021 23:37:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Oct 2021 23:37:44 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] curl: remove metalink
Date: Tue, 26 Oct 2021 14:36:36 +0800
Message-ID: <20211026063636.5481-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <16AF14C3714F85BD.30006@lists.openembedded.org>
References: <16AF14C3714F85BD.30006@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 06:37:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157373

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch to remove metalink [1] to fix below CVEs:
 - CVE-2021-22922 [2]
 - CVE-2021-22923 [3]

[1] https://github.com/curl/curl/commit/265b14d6b37c4298bd5556fabcbc37d36f911693
[2] https://curl.se/docs/CVE-2021-22922.html
[3] https://curl.se/docs/CVE-2021-22923.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../curl/curl/0001-metalink-remove.patch      | 194 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |   2 +-
 2 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-metalink-remove.patch

diff --git a/meta/recipes-support/curl/curl/0001-metalink-remove.patch b/meta/recipes-support/curl/curl/0001-metalink-remove.patch
new file mode 100644
index 0000000000..a76e720215
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-metalink-remove.patch
@@ -0,0 +1,194 @@
+From ef339d19b688e0d4c9b6ff2bd5b5cd54af9e1dbf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 26 Oct 2021 11:10:31 +0800
+Subject: [PATCH] metalink: remove
+
+Warning: this will make existing curl command lines that use metalink to
+stop working.
+
+Reasons for removal:
+
+1. We've found several security problems and issues involving the
+   metalink support in curl. The issues are not detailed here. When
+   working on those, it become apparent to the team that several of the
+   problems are due to the system design, metalink library API and what
+   the metalink RFC says. They are very hard to fix on the curl side
+   only.
+
+2. The metalink usage with curl was only very briefly documented and was
+   not following the "normal" curl usage pattern in several ways, making
+   it surprising and non-intuitive which could lead to further security
+   issues.
+
+3. The metalink library was last updated 6 years ago and wasn't so
+   active the years before that either. An unmaintained library means
+   there's a security problem waiting to happen. This is probably reason
+   enough.
+
+4. Metalink requires an XML parsing library, which is complex code (even
+   the smaller alternatives) and to this day often gets security
+   updates.
+
+5. Metalink is not a widely used curl feature. In the 2020 curl user
+   survey, only 1.4% of the responders said that they'd are using it. In
+   2021 that number was 1.2%. Searching the web also show very few
+   traces of it being used, even with other tools.
+
+6. The torrent format and associated technology clearly won for
+   downloading large files from multiple sources in parallel.
+
+Cloes #7176
+
+CVE: CVE-2021-22922 CVE-2021-22923
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/265b14d6b37c4298bd5556fabcbc37d36f911693]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.ac    | 96 ++-----------------------------------------------
+ src/Makefile.am |  9 ++---
+ 2 files changed, 5 insertions(+), 100 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 816f044..715fe26 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -162,7 +162,6 @@ curl_verbose_msg="enabled (--disable-verbose)"
+   curl_ldaps_msg="no      (--enable-ldaps)"
+    curl_rtsp_msg="no      (--enable-rtsp)"
+    curl_rtmp_msg="no      (--with-librtmp)"
+-  curl_mtlnk_msg="no      (--with-libmetalink)"
+     curl_psl_msg="no      (--with-libpsl)"
+  curl_altsvc_msg="enabled";
+     ssl_backends=
+@@ -2895,99 +2894,8 @@ if test $with_libpsl != "no"; then
+ fi
+ AM_CONDITIONAL([USE_LIBPSL], [test "$curl_psl_msg" = "enabled"])
+ 
+-dnl **********************************************************************
+-dnl Check for libmetalink
+-dnl **********************************************************************
+-
+-OPT_LIBMETALINK=no
+-
+-AC_ARG_WITH(libmetalink,dnl
+-AC_HELP_STRING([--with-libmetalink=PATH],[where to look for libmetalink, PATH points to the installation root])
+-AC_HELP_STRING([--without-libmetalink], [disable libmetalink detection]),
+-  OPT_LIBMETALINK=$withval)
+-
+-if test X"$OPT_LIBMETALINK" != Xno; then
+-
+-  addld=""
+-  addlib=""
+-  addcflags=""
+-  version=""
+-  libmetalinklib=""
+-
+-  PKGTEST="no"
+-  if test "x$OPT_LIBMETALINK" = "xyes"; then
+-    dnl this is with no partiular path given
+-    PKGTEST="yes"
+-    CURL_CHECK_PKGCONFIG(libmetalink)
+-  else
+-    dnl When particular path is given, set PKG_CONFIG_LIBDIR using the path.
+-    LIBMETALINK_PCDIR="$OPT_LIBMETALINK/lib/pkgconfig"
+-    AC_MSG_NOTICE([PKG_CONFIG_LIBDIR will be set to "$LIBMETALINK_PCDIR"])
+-    if test -f "$LIBMETALINK_PCDIR/libmetalink.pc"; then
+-      PKGTEST="yes"
+-    fi
+-    if test "$PKGTEST" = "yes"; then
+-      CURL_CHECK_PKGCONFIG(libmetalink, [$LIBMETALINK_PCDIR])
+-    fi
+-  fi
+-  if test "$PKGTEST" = "yes" && test "$PKGCONFIG" != "no"; then
+-    addlib=`CURL_EXPORT_PCDIR([$LIBMETALINK_PCDIR]) dnl
+-      $PKGCONFIG --libs-only-l libmetalink`
+-    addld=`CURL_EXPORT_PCDIR([$LIBMETALINK_PCDIR]) dnl
+-      $PKGCONFIG --libs-only-L libmetalink`
+-    addcflags=`CURL_EXPORT_PCDIR([$LIBMETALINK_PCDIR]) dnl
+-      $PKGCONFIG --cflags-only-I libmetalink`
+-    version=`CURL_EXPORT_PCDIR([$LIBMETALINK_PCDIR]) dnl
+-      $PKGCONFIG --modversion libmetalink`
+-    libmetalinklib=`echo $addld | $SED -e 's/^-L//'`
+-  fi
+-  if test -n "$addlib"; then
+-
+-    clean_CPPFLAGS="$CPPFLAGS"
+-    clean_LDFLAGS="$LDFLAGS"
+-    clean_LIBS="$LIBS"
+-    CPPFLAGS="$clean_CPPFLAGS $addcflags"
+-    LDFLAGS="$clean_LDFLAGS $addld"
+-    LIBS="$addlib $clean_LIBS"
+-    AC_MSG_CHECKING([if libmetalink is recent enough])
+-    AC_LINK_IFELSE([
+-      AC_LANG_PROGRAM([[
+-#       include <metalink/metalink.h>
+-      ]],[[
+-        if(0 != metalink_strerror(0)) /* added in 0.1.0 */
+-          return 1;
+-      ]])
+-    ],[
+-      AC_MSG_RESULT([yes ($version)])
+-      want_metalink="yes"
+-    ],[
+-      AC_MSG_RESULT([no ($version)])
+-      AC_MSG_NOTICE([libmetalink library defective or too old])
+-      want_metalink="no"
+-    ])
+-    if test "x$OPENSSL_ENABLED" != "x1" -a "x$USE_WINDOWS_SSPI" != "x1" \
+-        -a "x$GNUTLS_ENABLED" != "x1" -a "x$NSS_ENABLED" != "x1" \
+-        -a "x$SECURETRANSPORT_ENABLED" != "x1"; then
+-      AC_MSG_WARN([metalink support requires a compatible SSL/TLS backend])
+-      want_metalink="no"
+-    fi
+-    CPPFLAGS="$clean_CPPFLAGS"
+-    LDFLAGS="$clean_LDFLAGS"
+-    LIBS="$clean_LIBS"
+-    if test "$want_metalink" = "yes"; then
+-      dnl finally libmetalink will be used
+-      AC_DEFINE(USE_METALINK, 1, [Define to enable metalink support])
+-      LIBMETALINK_LIBS=$addlib
+-      LIBMETALINK_LDFLAGS=$addld
+-      LIBMETALINK_CPPFLAGS=$addcflags
+-      AC_SUBST([LIBMETALINK_LIBS])
+-      AC_SUBST([LIBMETALINK_LDFLAGS])
+-      AC_SUBST([LIBMETALINK_CPPFLAGS])
+-      curl_mtlnk_msg="enabled"
+-    fi
+-
+-  fi
+-fi
++AC_ARG_WITH(libmetalink,,
++  AC_MSG_ERROR([--with-libmetalink no longer works!]))
+ 
+ dnl **********************************************************************
+ dnl Check for the presence of LIBSSH2 libraries and headers
+diff --git a/src/Makefile.am b/src/Makefile.am
+index dff248f..6b7547f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -61,18 +61,15 @@ CFLAGS += @CURL_CFLAG_EXTRAS@
+ LIBS = $(BLANK_AT_MAKETIME)
+ 
+ if USE_EXPLICIT_LIB_DEPS
+-curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@ @LIBCURL_LIBS@
++curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBCURL_LIBS@
+ else
+-curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@ @NSS_LIBS@ @SSL_LIBS@ @ZLIB_LIBS@ @CURL_NETWORK_AND_TIME_LIBS@
++curl_LDADD = $(top_builddir)/lib/libcurl.la @NSS_LIBS@ @SSL_LIBS@ @ZLIB_LIBS@ @CURL_NETWORK_AND_TIME_LIBS@
+ endif
+ 
+-curl_LDFLAGS = @LIBMETALINK_LDFLAGS@
+-curl_CPPFLAGS = $(AM_CPPFLAGS) $(LIBMETALINK_CPPFLAGS)
+-
+ # if unit tests are enabled, build a static library to link them with
+ if BUILD_UNITTESTS
+ noinst_LTLIBRARIES = libcurltool.la
+-libcurltool_la_CPPFLAGS = $(LIBMETALINK_CPPFLAGS) $(AM_CPPFLAGS) \
++libcurltool_la_CPPFLAGS = $(AM_CPPFLAGS) \
+                           -DCURL_STATICLIB -DUNITTESTS
+ libcurltool_la_CFLAGS =
+ libcurltool_la_LDFLAGS = -static $(LINKFLAGS)
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index d9818b6f07..10e44f2709 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2021-22945.patch \
            file://CVE-2021-22946.patch \
            file://CVE-2021-22947.patch \
+           file://0001-metalink-remove.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
@@ -73,7 +74,6 @@ EXTRA_OECONF = " \
     --disable-ntlm-wb \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-    --without-libmetalink \
     --without-libpsl \
     --enable-debug \
     --enable-optimize \
-- 
2.17.1


