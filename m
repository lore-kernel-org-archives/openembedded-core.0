Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF05D1A63D
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:35 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12836.1768066647192394225
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FBCeK7Cm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202601101737257afd64e84300020717-9hbwjy@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202601101737257afd64e84300020717
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ZpJkyZXMq4oyyUlBtnk0zEeGXXh3ZyRK736rdSlqhL4=;
 b=FBCeK7CmaP8LrYiV+SdZmKSpNhrUG2kChzmnjLTq1GCcuIO+XNn/roSZjZC296Q2YPoYVy
 fajSV9BKPjciBecS4OBAp5qKc8SDCBEDdQA+CBeydc7tMTmZC5qw/VktHwS8Dl/qJOWm900+
 Lo3tNgtCulIU1a3hI4Ia8LoImO3JSBxu5YZwtpnAmHchfPPgSGJf4wbEnzwoDL7KAbunZzZD
 /R6KMvThQig7xMQ2qx1nvQpFrt58R9qHeIFewkm8uyuLTnbczPx0UnSLCrIYHqQuLyCFpnFi
 Uybqyt0WCXNClL++TGDCE0GN0fNrtt4YmwohsEeiicnNdUFTtAtiQK/Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/4] curl: patch CVE-2025-14819
Date: Sat, 10 Jan 2026 18:36:25 +0100
Message-Id: <20260110173627.1643290-2-peter.marko@siemens.com>
In-Reply-To: <20260110173627.1643290-1-peter.marko@siemens.com>
References: <20260110173627.1643290-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229159

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

Additionally pick commit with definition of CURL_UNCONST to make the
cherry-pick possible without build errors.
It will be probably needed also by further CVE patches.

[1] https://curl.se/docs/CVE-2025-14819.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...st-qual-fix-or-silence-compiler-warn.patch | 85 +++++++++++++++++++
 .../curl/curl/CVE-2025-14819.patch            | 73 ++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  2 +
 3 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch

diff --git a/meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch b/meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch
new file mode 100644
index 00000000000..f652456990e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch
@@ -0,0 +1,85 @@
+From 9989d5392e9e61c81fdd3e464511ddd8d73c2f87 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Fri, 31 Jan 2025 23:20:46 +0100
+Subject: [PATCH] build: enable `-Wcast-qual`, fix or silence compiler warnings
+
+The issues found fell into these categories, with the applied fixes:
+
+- const was accidentally stripped.
+  Adjust code to not cast or cast with const.
+
+- const/volatile missing from arguments, local variables.
+  Constify arguments or variables, adjust/delete casts. Small code
+  changes in a few places.
+
+- const must be stripped because an API dependency requires it.
+  Strip `const` with `CURL_UNCONST()` macro to silence the warning out
+  of our control. These happen at API boundaries. Sometimes they depend
+  on dependency version, which this patch handles as necessary. Also
+  enable const support for the zlib API, using `ZLIB_CONST`. Supported
+  by zlib 1.2.5.2 and newer.
+
+- const must be stripped because a curl API requires it.
+  Strip `const` with `CURL_UNCONST()` macro to silence the warning out
+  of our immediate control. For example we promise to send a non-const
+  argument to a callback, though the data is const internally.
+
+- other cases where we may avoid const stripping by code changes.
+  Also silenced with `CURL_UNCONST()`.
+
+- there are 3 places where `CURL_UNCONST()` is cast again to const.
+  To silence this type of warning:
+  ```
+  lib/vquic/curl_osslq.c:1015:29: error: to be safe all intermediate
+    pointers in cast from 'unsigned char **' to 'const unsigned char **'
+    must be 'const' qualified [-Werror=cast-qual]
+  lib/cf-socket.c:734:32: error: to be safe all intermediate pointers in
+    cast from 'char **' to 'const char **' must be 'const' qualified
+    [-Werror=cast-qual]
+  ```
+  There may be a better solution, but I couldn't find it.
+
+These cases are handled in separate subcommits, but without further
+markup.
+
+If you see a `-Wcast-qual` warning in curl, we appreciate your report
+about it.
+
+Closes #16142
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/9989d5392e9e61c81fdd3e464511ddd8d73c2f87]
+
+Picked only header file definition, not complete code refactoring.
+CURL_UNCONST will be probably needed also by further CVE patches due to this rework.
+
+Also later modified by removing VS2008 code per 2e1a045d8985e5daa4d9a4f908ed870a16d8e41e.
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/curl_setup_once.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/lib/curl_setup_once.h b/lib/curl_setup_once.h
+index bf0ee663d3..df5b44c478 100644
+--- a/lib/curl_setup_once.h
++++ b/lib/curl_setup_once.h
+@@ -69,10 +69,18 @@
+ #include <unistd.h>
+ #endif
+ 
+-#ifdef USE_WOLFSSL
++#if defined(HAVE_STDINT_H) || defined(USE_WOLFSSL)
+ #include <stdint.h>
+ #endif
+ 
++/* Macro to strip 'const' without triggering a compiler warning.
++ Use* it for APIs that do not or cannot support the const qualifier. */
++#ifdef HAVE_STDINT_H
++#  define CURL_UNCONST(p) ((void *)(uintptr_t)(const void *)(p))
++#else
++#  define CURL_UNCONST(p) ((void *)(p))  /* Fall back to simple cast */
++#endif
++
+ #ifdef USE_SCHANNEL
+ /* Must set this before <schannel.h> is included directly or indirectly by
+    another Windows header. */
diff --git a/meta/recipes-support/curl/curl/CVE-2025-14819.patch b/meta/recipes-support/curl/curl/CVE-2025-14819.patch
new file mode 100644
index 00000000000..7bed47e7b4d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14819.patch
@@ -0,0 +1,73 @@
+From cd046f6c93b39d673a58c18648d8906e954c4f5d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 17 Dec 2025 10:54:16 +0100
+Subject: [PATCH] openssl: toggling CURLSSLOPT_NO_PARTIALCHAIN makes a
+ different CA cache
+
+Reported-by: Stanislav Fort
+
+Closes #20009
+
+CVE: CVE-2025-14819
+Upstream-Status: Backport [https://github.com/curl/curl/commit/cd046f6c93b39d673a58c18648d8906e954c4f5d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/openssl.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index a7f169d641..7563d9a090 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -317,6 +317,7 @@ struct multi_ssl_backend_data {
+   char *CAfile;         /* CAfile path used to generate X509 store */
+   X509_STORE *store;    /* cached X509 store or NULL if none */
+   struct curltime time; /* when the cached store was created */
++  BIT(no_partialchain); /* keep partial chain state */
+ };
+ #endif /* HAVE_SSL_X509_STORE_SHARE */
+ 
+@@ -3378,12 +3379,16 @@ static bool cached_x509_store_expired(const struct Curl_easy *data,
+ 
+ static bool cached_x509_store_different(
+   struct Curl_cfilter *cf,
++                                             const struct Curl_easy *data,
+   const struct multi_ssl_backend_data *mb)
+ {
+   struct ssl_primary_config *conn_config = Curl_ssl_cf_get_primary_config(cf);
++  struct ssl_config_data *ssl_config =
++    Curl_ssl_cf_get_config(cf, CURL_UNCONST(data));
++  if(mb->no_partialchain != ssl_config->no_partialchain)
++    return TRUE;
+   if(!mb->CAfile || !conn_config->CAfile)
+     return mb->CAfile != conn_config->CAfile;
+-
+   return strcmp(mb->CAfile, conn_config->CAfile);
+ }
+ 
+@@ -3398,7 +3403,7 @@ static X509_STORE *get_cached_x509_store(struct Curl_cfilter *cf,
+      multi->ssl_backend_data &&
+      multi->ssl_backend_data->store &&
+      !cached_x509_store_expired(data, multi->ssl_backend_data) &&
+-     !cached_x509_store_different(cf, multi->ssl_backend_data)) {
++     !cached_x509_store_different(cf, data, multi->ssl_backend_data)) {
+     store = multi->ssl_backend_data->store;
+   }
+ 
+@@ -3427,6 +3432,8 @@ static void set_cached_x509_store(struct Curl_cfilter *cf,
+ 
+   if(X509_STORE_up_ref(store)) {
+     char *CAfile = NULL;
++    struct ssl_config_data *ssl_config =
++      Curl_ssl_cf_get_config(cf, CURL_UNCONST(data));
+ 
+     if(conn_config->CAfile) {
+       CAfile = strdup(conn_config->CAfile);
+@@ -3444,6 +3451,7 @@ static void set_cached_x509_store(struct Curl_cfilter *cf,
+     mbackend->time = Curl_now();
+     mbackend->store = store;
+     mbackend->CAfile = CAfile;
++    mbackend->no_partialchain = ssl_config->no_partialchain;
+   }
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index aa978f0346c..3134846e57c 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -26,6 +26,8 @@ SRC_URI = " \
     file://CVE-2025-0167.patch \
     file://CVE-2025-9086.patch \
     file://CVE-2025-14017.patch \
+    file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
+    file://CVE-2025-14819.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

