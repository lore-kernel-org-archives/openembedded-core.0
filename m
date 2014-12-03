Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 83EED7025A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 12:41:08 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so11513451wgh.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 04:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=tai+RSGHMJkwAJ5cK6psrwSDV9Fir5gC2ep4lZr7lwA=;
	b=cFUYtBmFM2s3c4Zq1kPLs8XAsWpVQkivg7N8eNFBq38v842xWilRCg+B2WPjPRPtRi
	4gdY6E3TPlFJYNgYas8yBvCTY96rT0wft+4lLlMXLcQk/UABbgIKVa3xK+Z0I0n+P4Ux
	AyP2j8VcFw6rdO+Bpjt0HadFIgmEBFF9oV1Hy2rTYxGA3qrO8Rlcw4d8Xd77VO873U6e
	9WVbz4wbuqIhYnvgFffiQ3cgWKZyPSiUYSppDt9Lr9BFdizH/D4MGtI6MSUWgJfe/QFG
	C6QdJQlwHBN6ZFLVcQRHpPKwYxuyJcwp5kNfszeLSci0TY2zjEWnxgbNCfXAlwRAANZ+
	c1uw==
X-Received: by 10.180.94.230 with SMTP id df6mr13499664wib.25.1417610468613;
	Wed, 03 Dec 2014 04:41:08 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id ce1sm36130063wjc.2.2014.12.03.04.41.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 04:41:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed,  3 Dec 2014 13:40:56 +0100
Message-Id: <1417610456-788-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
References: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 3/3] fix cross-localedef build with gettext-native in sysroot
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
X-List-Received-Date: Wed, 03 Dec 2014 12:41:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

with previous patch applied and gettext build before cross-localedef,
cross-localedef failed with.

/usr/bin/ld: cannot find -lintl

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...d-dragging-in-gettext-s-libintl.h-libintl.patch | 104 +++++++++++++++++++++
 .../glibc/cross-localedef-native_2.20.bb           |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-core/glibc/cross-localedef-native/avoid-dragging-in-gettext-s-libintl.h-libintl.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native/avoid-dragging-in-gettext-s-libintl.h-libintl.patch b/meta/recipes-core/glibc/cross-localedef-native/avoid-dragging-in-gettext-s-libintl.h-libintl.patch
new file mode 100644
index 0000000..e19be03
--- /dev/null
+++ b/meta/recipes-core/glibc/cross-localedef-native/avoid-dragging-in-gettext-s-libintl.h-libintl.patch
@@ -0,0 +1,104 @@
+From d90df9d5f818df18ddccaf5405ffa65a63ea70a7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 3 Dec 2014 12:57:14 +0100
+Subject: [PATCH] avoid dragging in gettext's libintl.h / libintl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+modify configure.ac and configure to make sure that we don't need to revisit in
+case autoconf is run in localedef subdirectory
+
+Upstream-Status: submitted [1]
+
+[1] https://github.com/kraj/localedef/pull/1
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ localedef/configure         | 45 ---------------------------------------------
+ localedef/configure.ac      |  1 -
+ include/libintl.h |  2 +-
+ 3 files changed, 1 insertion(+), 47 deletions(-)
+
+diff --git a/localedef/configure b/localedef/configure
+index 10f5f77..e4bb869 100755
+--- a/localedef/configure
++++ b/localedef/configure
+@@ -3893,51 +3893,6 @@ $as_echo "#define HAVE_PROGRAM_INVOCATION_SHORT_NAME 1" >>confdefs.h
+ 
+ fi
+ 
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for gettext in -lintl" >&5
+-$as_echo_n "checking for gettext in -lintl... " >&6; }
+-if ${ac_cv_lib_intl_gettext+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-  ac_check_lib_save_LIBS=$LIBS
+-LIBS="-lintl  $LIBS"
+-cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-/* Override any GCC internal prototype to avoid an error.
+-   Use char because int might match the return type of a GCC
+-   builtin and then its argument prototype would still apply.  */
+-#ifdef __cplusplus
+-extern "C"
+-#endif
+-char gettext ();
+-int
+-main ()
+-{
+-return gettext ();
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_link "$LINENO"; then :
+-  ac_cv_lib_intl_gettext=yes
+-else
+-  ac_cv_lib_intl_gettext=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext \
+-    conftest$ac_exeext conftest.$ac_ext
+-LIBS=$ac_check_lib_save_LIBS
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_intl_gettext" >&5
+-$as_echo "$ac_cv_lib_intl_gettext" >&6; }
+-if test "x$ac_cv_lib_intl_gettext" = xyes; then :
+-  cat >>confdefs.h <<_ACEOF
+-#define HAVE_LIBINTL 1
+-_ACEOF
+-
+-  LIBS="-lintl $LIBS"
+-
+-fi
+-
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for nanosleep in -lposix4" >&5
+ $as_echo_n "checking for nanosleep in -lposix4... " >&6; }
+ if ${ac_cv_lib_posix4_nanosleep+:} false; then :
+diff --git a/configure.ac b/configure.ac
+index 33c8ff9..0004168 100644
+--- a/localedef/configure.ac
++++ b/localedef/configure.ac
+@@ -58,7 +58,6 @@ LOCAL_CHECK_FUNC([stpcpy], [#include <string.h>])
+ LOCAL_CHECK_FUNC([strsep], [#include <string.h>])
+ LOCAL_CHECK_VAR([program_invocation_name], [#include <errno.h>])
+ LOCAL_CHECK_VAR([program_invocation_short_name], [#include <errno.h>])
+-AC_CHECK_LIB([intl], [gettext])
+ AC_CHECK_LIB([posix4], [nanosleep])
+ 
+ # These two macros are taken from GCC's config/acx.m4.
+diff --git a/include/libintl.h b/include/libintl.h
+index 096aa8c..86143b6 100644
+--- a/localedef/include/libintl.h
++++ b/localedef/include/libintl.h
+@@ -1,5 +1,5 @@
+ #ifdef HAVE_LIBINTL_H
+-#include_next <libintl.h>
++#include "../intl/libintl.h"
+ #endif
+ 
+ #ifndef _
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
index ccf56a9..50a280b 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
@@ -19,6 +19,7 @@ PV = "2.20"
 SRC_URI = "git://sourceware.org/git/glibc.git;branch=release/${PV}/master;name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
 	   file://fix_for_centos_5.8.patch \
+           file://avoid-dragging-in-gettext-s-libintl.h-libintl.patch \
            ${EGLIBCPATCHES} \
           "
 EGLIBCPATCHES = "\
-- 
1.8.3.1


