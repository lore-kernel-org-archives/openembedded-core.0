Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ED2CD484E
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 21:19:19 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61209.1778534350272677378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 14:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ld371z7H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260511211906b20f158a26000207b4-kcostk@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260511211906b20f158a26000207b4
        for <openembedded-core@lists.openembedded.org>;
        Mon, 11 May 2026 23:19:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1eMjh+0SmYgMpPDyBTu4bfKRsvlqyaae4/wUkwGx0G8=;
 b=ld371z7HfHJB+G/MP6gBisj8qHxC7i31OcrR7pVJ/YPgwtGMPKG1orGkIK+AGnSo4TM8Te
 D5zZte4lTHH/6Wx4vRXQ1rf9zzWQLOP8k9Qc3Rggg7BVwwdTp7gjSex8XOzaNQHnz0SqHzvj
 VDgBW6uDNsbwVED1W8xYBYN9o1TAwpBHnhSfQWo78iZajkzWsgqZRnTxLlQDtbdD/UA0mOAh
 qSeFArum5sfZRgLRRf8dRtC55XZwpm1A3QC3hjznH5Uu03wHTcdHaK05e51QWTFfR/pQkCUy
 PnXVqNapZeQj3BMiwCBr96V9ZP0zVXJXZvJ3281D4nXGsGHBk4018FdA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] gnutls: upgrade 3.8.12 -> 3.8.13
Date: Mon, 11 May 2026 23:18:39 +0200
Message-ID: <20260511211839.173868-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 21:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236839

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
CVE-2026-5419.

Release notes: [1]

Rebase patches and drop patch included in this release.
Add patches to fix linking with musl libc.
Increase memory needed to successfully run test key-openssl.
Drop code for previous release tarball problem.

[1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++
 ...ust-list-fault-fix-issues-in-linking.patch | 31 ++++++++++++++
 .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
 meta/recipes-support/gnutls/gnutls/c99.patch  | 41 -------------------
 .../{gnutls_3.8.12.bb => gnutls_3.8.13.bb}    |  9 ++--
 6 files changed, 62 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb => gnutls_3.8.13.bb} (93%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 166b4ded63..b20e8ca76d 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -44,6 +44,7 @@ QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
 QB_MEM:virtclass-mcextend-go = "-m 4096"
+QB_MEM:virtclass-mcextend-gnutls = "-m 1536"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
new file mode 100644
index 0000000000..7f999c4b22
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
@@ -0,0 +1,25 @@
+From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 30 Apr 2026 13:08:01 +0200
+Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f4910c01]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f8797964d..1b27df751 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
+ 	-I$(top_srcdir)/gl	\
+ 	-I$(top_builddir)/gl
++mini_dtls_fragments_LDADD = $(LDADD) ../gl/libgnu.la
+ 
+ if ENABLE_PKCS11
+ if !WINDOWS
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
new file mode 100644
index 0000000000..b15a05d5b6
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
@@ -0,0 +1,31 @@
+From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Thu, 7 May 2026 09:42:09 +0900
+Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking
+
+This fixes the use of automake variables and also adds the linked mock
+library in .gitignore.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1b27df751..f6a60a32b 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_os_locking_ok_LDADD = $(LDADD) $(LIBDL)
+ pkcs11_long_label_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_long_label_LDADD = $(LDADD) $(LIBDL)
+-pkcs11_trust_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
+-pkcs11_trust_fault_LDADD = $(LDADD) $(LIBDL)
++pkcs11_trust_list_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
++pkcs11_trust_list_fault_LDADD = $(LDADD) $(LIBDL)
+ endif
+ endif
+ 
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 398c0464e0..8c867a5a40 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -721,6 +721,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -745,6 +745,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-support/gnutls/gnutls/c99.patch
deleted file mode 100644
index 3f41241deb..0000000000
--- a/meta/recipes-support/gnutls/gnutls/c99.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 5 Mar 2026 11:33:57 +0000
-Subject: [PATCH] configure: make the C99 detection more resiliant
-
-autoconf 2.73 will default to C23 by default, which means that the >C99
-detection logic in configure.ac will fail because it only handles c11
-and c99.
-
-Instead of adding c23 to the list and then breaking again in the future,
-flip the logic around (as suggested by Zack Weinberg) and check
-explicitly for just c89.
-
-Closes #1806.
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requests/2081]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 740fb6339..c708d8f5e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS
- # Require C99 support
- #
- AS_CASE([$ac_prog_cc_stdc],
--  [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])],
--  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])]
--)
-+  [c89],
-+  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])],
-+  [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])
- 
- AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = yes)
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.8.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 8554ab943d..943864d4ba 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -23,10 +23,11 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
-           file://c99.patch \
+           file://0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch \
+           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
 
-SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
+SRC_URI[sha256sum] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
@@ -63,10 +64,6 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
-
-	# remove on next upgrade when release tarball gets fixed
-	# https://gitlab.com/gnutls/gnutls/-/issues/1797
-	cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
 }
 
 do_compile_ptest() {

