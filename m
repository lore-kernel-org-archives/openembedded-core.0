Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6F6C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 07:17:11 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86924.1782717421415089267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 00:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QaNSm8TU;
 spf=pass (domain: mvista.com, ip: 74.125.82.53, mailfrom: vanusuri@mvista.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139b914bab6so4042568c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 00:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782717421; x=1783322221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLipXZpLCj/21Lgnx5U48p1UYMq04H9ta3+Hmj0HgYo=;
        b=QaNSm8TUytgABReGPam/SZDZDpYdcXytlsZZd7xO535Jf+pEOsIet5W76cKh4BIJFX
         DTxu/SZEPdNQ34eKPIsEMTjaY1vrVNxMjTVnvCUXqgrOZ1IudgPQP1inVJ9icRdEoY0U
         RGy7AHa6t9jbOCy2/lvUT1ApWJLdpNBEHUr8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717421; x=1783322221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLipXZpLCj/21Lgnx5U48p1UYMq04H9ta3+Hmj0HgYo=;
        b=aR60R0nEPNVx6LjQhl3iND24r7qriwGFionJ8HHQlAuw9stpYaWbFx1RYBGXed4j+a
         A5WrjlIpRaxhDOn446cKDDlUWmkSZsUgYykW2OiCkU+6yn14uj17V3cMjZeHoIBQIVyT
         ohGir+ilCbyosL6Gtd7CJHAiVHKyBgGge+T2gvHEKkkAg9KAaCy9m/RPj1+bJOCWHb9a
         5GofgTEZ0F7dBeOePcrjxSh42lJ85QePb+50lNscghE71oxVzh9bodbhZldt2XyhpDgV
         ixAz9c5DtDp1MjnkrKMVEA1eqfJDeBBGAD3gHyIDTAInjTbTjxqygY08iE1yRV/ukYuw
         AcQw==
X-Gm-Message-State: AOJu0YwCVRtOTEcanCxScq0cWZtQYigx8bQwqYWOZTF5eF/aPsuvp+Iu
	oJl36ifn2Qqo8M4T7K3tbOm+w4Bi8hJl9MjECX66drfYLJHNWXGdShHEQ+R0hv+Jij4NyZP4E4X
	4slapEsU=
X-Gm-Gg: AfdE7cns7orvX9RA5RpEf3XpZmYjEJBEUGrYMYN4TP5FVJTq+mKKC3fZVpcUkXhyIix
	rzb3YD2YFJBi1UzAB2rOxL87nu50MVKmQBFZmQe4rFUPWlMRU5jCByXsWgktLuvcFafGNUj+Cvh
	4nGmarpgsgymcr7L15AUyFwHQSJZLDIq3/jjxvfUplvAsICr14qeGxYAKOiJ5DmrrXmHxMUbzzM
	5ysmUdYsXIGmY03K+vbk+KILuvHjeWzXzbPlfVhy+RV8hgPd9+tsRoMi+ZCqqc+4Ht/CHkMTk7o
	8xJY0lJv24w8SBjJjN14BZeAjwkzs5RgAH8BKxe0TkrLn5AkS8ZYybJbXT+oRjKt1y3I2H8Q/D1
	G1fJHHvwCz8JF7ME9uq+g2Sd8cM/fDVhvuQkjA+OXkLloVl/QMFb5+vQFpO5ibosKz0p19khulb
	jxGXtGOKv7KdyDdKLd32zGYd32elfuefWKsQQXQA==
X-Received: by 2002:a05:7022:e12:b0:139:ed5a:eef1 with SMTP id a92af1059eb24-139ed5b0566mr6977371c88.48.1782717420482;
        Mon, 29 Jun 2026 00:17:00 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f28:5dd:9bfe:f931:c732:fcef])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm9674234c88.0.2026.06.29.00.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:16:59 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch] gnutls: upgrade 3.8.12 -> 3.8.13
Date: Mon, 29 Jun 2026 12:46:48 +0530
Message-ID: <20260629071648.1471849-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239730

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index c08561296f..008b5770a8 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -39,6 +39,7 @@ QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
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
-- 
2.43.0


