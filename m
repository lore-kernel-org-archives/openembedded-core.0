Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579EBEF5850
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 18:44:45 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11506.1771094681001471210
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Feb 2026 10:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JvId+4YQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026021418443726f0dbc7ca00020723-0ak_pu@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026021418443726f0dbc7ca00020723
        for <openembedded-core@lists.openembedded.org>;
        Sat, 14 Feb 2026 19:44:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JZ8/hkkzz0RepkDSuAfFb4naIcbSUJgslFR9bNKUC6I=;
 b=JvId+4YQ7bQrkqUMCkutoCjuUlEouCWSWIhxOJ8386b4xEmch7soNew0IuP8rf2oBcpd/j
 7IVTlqjHTruBKKCSIMLQdMoziYuFnq33ud9104FUsIr+FvHNHWpFhp8f2ORMDfbRLmfsKH8I
 jDd++QkZqYb159l3YVrAO0JtOidrVBkhhqA0zPj8N+NA9EOELJrUqRP+FtefrdppUAWy/Xv9
 xMu8PlHCgWaRx6f3JAMJL/m9v8KcqYIbtVnkyMJYxKqNFt1WtRFOJjoLYce/kHc4uxh815gK
 bMsI36CDKySdM6wjraRfJxLwYSZogC7lyliqBBalbKz5qKtSXsQb82ag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] gnutls: upgrade 3.8.11 -> 3.8.12
Date: Sat, 14 Feb 2026 19:44:35 +0100
Message-Id: <20260214184435.1042437-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 18:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231153

From: Peter Marko <peter.marko@siemens.com>

Release information: [1]

Solves CVE-2025-14831 and CVE-2026-1584.
Remove patch included in this release.
Add workaround for cross-compilation bug in release tarball.

[1] https://lists.gnutls.org/pipermail/gnutls-help/2026-February/004914.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...dit-crau-fix-compilation-with-gcc-11.patch | 66 -------------------
 .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
 .../{gnutls_3.8.11.bb => gnutls_3.8.12.bb}    |  7 +-
 3 files changed, 7 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.11.bb => gnutls_3.8.12.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
deleted file mode 100644
index 60960dad6f..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Sun, 23 Nov 2025 18:17:19 +0100
-Subject: [PATCH] audit: crau: fix compilation with gcc < 11
-
-If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
-automatically detect an appropriate value for it.
-
-This autodetection is using the cpp special operator
-`__has_c_attribute` [1], introduced in gcc 11 [2].
-
-When compiling with a gcc older than version 11, the compilation fails
-with the error:
-
-    In file included from audit.h:22,
-                     from audit.c:26:
-    crau/crau.h:255:23: error: missing binary operator before token "("
-         __has_c_attribute (__maybe_unused__)
-                           ^
-
-This has been observed, for example, in Rocky Linux 8.10, which
-contains a gcc v8.5.0.
-
-The issue happens because the test for the `__has_c_attribute`
-availability and the test for the `__maybe_unused__` attribute
-are in the same directive. Those tests should be separated in
-two different directives, following the same logic described in
-the `__has_builtin` documentation [3].
-
-This issue was found in Buildroot, after updating gnutls to
-version 3.8.11 in [4].
-
-This commit fixes the issue by splitting the test in two.
-
-[1] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
-[2] https://gcc.gnu.org/gcc-11/changes.html#c
-[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
-[4] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
-
-Reported-by: Neal Frager <neal.frager@amd.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
-
-Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/2bbae7644a2292410b53f98fd0035c40bf8750a5]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- lib/crau/crau.h | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/lib/crau/crau.h b/lib/crau/crau.h
-index 0d4f9f13e..53d33555b 100644
---- a/lib/crau/crau.h
-+++ b/lib/crau/crau.h
-@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *stack, ...)
- # else
- 
- #  ifndef CRAU_MAYBE_UNUSED
--#   if defined(__has_c_attribute) && \
--    __has_c_attribute (__maybe_unused__)
--#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
-+#   if defined(__has_c_attribute)
-+#    if __has_c_attribute (__maybe_unused__)
-+#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
-+#    endif
- #   elif defined(__GNUC__)
- #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
- #   endif
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index d8b5035b38..398c0464e0 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1447,6 +1447,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -719,6 +719,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -721,6 +721,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.11.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.8.11.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 5b44c66dfc..dc61971d45 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.11.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -21,12 +21,11 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
-           file://0001-audit-crau-fix-compilation-with-gcc-11.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20"
+SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
@@ -62,6 +61,10 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
+
+	# remove on next upgrade when release tarball gets fixed
+	# https://gitlab.com/gnutls/gnutls/-/issues/1797 is fixed
+	cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
 }
 
 do_compile_ptest() {

