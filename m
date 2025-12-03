Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90369D1BDD6
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 19:39:29 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24723.1764790758759638889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 11:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NBoG/TNJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251203193915e6751282dd000207b8-x7_ocn@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251203193915e6751282dd000207b8
        for <openembedded-core@lists.openembedded.org>;
        Wed, 03 Dec 2025 20:39:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9aV2iY36P2ljQHqn0TT9igWVpmkBa26RIGJZ9uciDDo=;
 b=NBoG/TNJNRB5jsbZWTNk36OXYzONDMgyqVYlCx6TX7gI3FwEPTGLlceGrJV7PfgXL5GoqZ
 wTFAfTPlQU0AP/wm/qkcbrcPxcKDLXCIxFR1n3TUmeDcqTjJ0g7PAkg7zA3tRl/VEqdtI0+C
 Py7HdCVJlVudVcqIVC9E7L/2dO61EfzXraAyLkQW+5GHmdo4v6dmC0JB2K3gPAfyHje+91S+
 U4PQCYUf7+7YIRJyCGNSyt5guUfyEoDAlvv1Xn1QqnJpYtUvUzu7IwepCN5FekbJACyu725p
 8j3He6Ca6Vu3tnyfl7GUwvk+01uAd1IH5ecZRYzsNlMSsdI3XBrIN+fA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] gnutls: upgrade 3.8.10 -> 3.8.11
Date: Wed,  3 Dec 2025 20:39:09 +0100
Message-Id: <20251203193909.104039-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 19:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227237

From: Peter Marko <peter.marko@siemens.com>

Release information: [1]
Includes fix for CVE-2025-9820.

Refresh patches.

Backport commit to be able to build with gcc<11 (e.g. Debian 11).

[1] https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: Backport commit to be able to build with gcc<11 (e.g. Debian 11).

 ...ile-should-be-excuted-in-target-envi.patch |  2 +-
 ...dit-crau-fix-compilation-with-gcc-11.patch | 66 +++++++++++++++++++
 .../gnutls/gnutls/Add-ptest-support.patch     |  6 +-
 .../{gnutls_3.8.10.bb => gnutls_3.8.11.bb}    |  3 +-
 4 files changed, 72 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.10.bb => gnutls_3.8.11.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 2dccea7859..0847dde8a9 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -14,7 +14,7 @@ diff --git a/lib/Makefile.am b/lib/Makefile.am
 index a50d311..193ea19 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -272,8 +272,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
+@@ -275,8 +275,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
  
  all-local: $(hmac_file)
  
diff --git a/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
new file mode 100644
index 0000000000..60960dad6f
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
@@ -0,0 +1,66 @@
+From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 23 Nov 2025 18:17:19 +0100
+Subject: [PATCH] audit: crau: fix compilation with gcc < 11
+
+If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
+automatically detect an appropriate value for it.
+
+This autodetection is using the cpp special operator
+`__has_c_attribute` [1], introduced in gcc 11 [2].
+
+When compiling with a gcc older than version 11, the compilation fails
+with the error:
+
+    In file included from audit.h:22,
+                     from audit.c:26:
+    crau/crau.h:255:23: error: missing binary operator before token "("
+         __has_c_attribute (__maybe_unused__)
+                           ^
+
+This has been observed, for example, in Rocky Linux 8.10, which
+contains a gcc v8.5.0.
+
+The issue happens because the test for the `__has_c_attribute`
+availability and the test for the `__maybe_unused__` attribute
+are in the same directive. Those tests should be separated in
+two different directives, following the same logic described in
+the `__has_builtin` documentation [3].
+
+This issue was found in Buildroot, after updating gnutls to
+version 3.8.11 in [4].
+
+This commit fixes the issue by splitting the test in two.
+
+[1] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
+[2] https://gcc.gnu.org/gcc-11/changes.html#c
+[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
+[4] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
+
+Reported-by: Neal Frager <neal.frager@amd.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/2bbae7644a2292410b53f98fd0035c40bf8750a5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/crau/crau.h | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/crau/crau.h b/lib/crau/crau.h
+index 0d4f9f13e..53d33555b 100644
+--- a/lib/crau/crau.h
++++ b/lib/crau/crau.h
+@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *stack, ...)
+ # else
+ 
+ #  ifndef CRAU_MAYBE_UNUSED
+-#   if defined(__has_c_attribute) && \
+-    __has_c_attribute (__maybe_unused__)
+-#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
++#   if defined(__has_c_attribute)
++#    if __has_c_attribute (__maybe_unused__)
++#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
++#    endif
+ #   elif defined(__GNUC__)
+ #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
+ #   endif
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 339d3d2f9e..d8b5035b38 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -15,7 +15,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 843193f..816b09f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -194,6 +194,9 @@ dist-hook:
+@@ -197,6 +197,9 @@ dist-hook:
  distcheck-hook:
  	@test -d "$(top_srcdir)/po/.reference" || { echo "PO files are not downloaded; run ./bootstrap without --skip-po"; exit 1; }
  
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1491,6 +1491,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1447,6 +1447,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -678,6 +678,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -719,6 +719,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.8.10.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.11.bb
index 2ef71a1213..faeb1a4ede 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
@@ -21,11 +21,12 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
+           file://0001-audit-crau-fix-compilation-with-gcc-11.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
+SRC_URI[sha256sum] = "91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 

