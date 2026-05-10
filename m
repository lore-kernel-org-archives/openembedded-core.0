Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5FBCD37B2
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 16:25:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32681.1778430316346981204
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 09:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=IgCGfN4+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202605101625122394203d6f000207ae-d8jc4f@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202605101625122394203d6f000207ae
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 May 2026 18:25:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JBaHUh6Js7FMNAFZPM4j14w2TOjdeYV7JyCqynVHwEw=;
 b=IgCGfN4+FKWax6V0uvJsFqwt5YFPvGx8HjV+emzqjC5Mp5awEaopbYwDPE3/Ff58D1EGEt
 JmCSZFdqjBfJvsqidPaTe6Os2gYRSHnGeYhnxdvbGoyghNAlGjqgMBtvfrP8nezT++Gys3J4
 BagHOBX6yBcxzCLzo/LPm1j5sUcMIta06y9thxjlvM12eAZLFidNxPeWsrM8NdKa2If02iwu
 uEP/rFHBmGJ+rDVYuS2Wt08UU4Y3ZwUreLlFbuNAcIr1+NXhHB6QYiQj/DyyFKZuAO4ZDrS7
 KIyBPar7Lnrco5AKHwqJo95XHSO9lBnYtn0CE8/tvb/fPxdv+m/4qcZQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] gnutls: upgrade 3.8.12 -> 3.8.13
Date: Sun, 10 May 2026 18:24:50 +0200
Message-ID: <20260510162450.1988369-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 May 2026 16:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236771

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
CVE-2026-5419.

Release notes: [1]

Rebase patches and drop patch included in this release.

[1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
 meta/recipes-support/gnutls/gnutls/c99.patch  | 41 -------------------
 .../{gnutls_3.8.12.bb => gnutls_3.8.13.bb}    |  3 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb => gnutls_3.8.13.bb} (97%)

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
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 8554ab943d..8fadbdc738 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -23,10 +23,9 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
-           file://c99.patch \
            "
 
-SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
+SRC_URI[sha256sum] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 

