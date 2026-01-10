Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9705D277F7
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:05 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12763.1768066622601355990
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AAix6YOW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026011017370086ee1212f30002074b-2b6o00@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026011017370086ee1212f30002074b
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/YToywlh8S5+kw4fX6d/CP7YNx6noMM/Ug7etZwLzH0=;
 b=AAix6YOWm2UihvisX6b5KY6P8Q/vWoDkpI9HHCdx3TrNa/ZbJ25olKnjLMPcKw3XuRdpzG
 YF3PHBxrDe7ryouzZ9s9nvBuULhYBbxYlwi0ItkpQbCIG+SeebvrHKDskoZ1xIIm+sHQORzH
 iTxxnmTGRV1yMJuA+2Q08lHcbZTTpAzFQH4FS419pYmOoss+gIZ4pZRQA0zOHmkAZQCXaudP
 lNhmI9H/vVYKIMlNMlOatbiFeE/K1G9hwpM9nkhMFrN+m9tAlAf3JpWzZMu/ko5aJpFiy4Qo
 ULULEBNRumZC+0m5thJKpKN13CNrq0uQc5cf9Un/IJ/p23orvo9jdhzw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 2/6] curl: patch CVE-2025-14017
Date: Sat, 10 Jan 2026 18:36:35 +0100
Message-Id: <20260110173639.1643322-2-peter.marko@siemens.com>
In-Reply-To: <20260110173639.1643322-1-peter.marko@siemens.com>
References: <20260110173639.1643322-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229153

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14017.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-14017.patch            | 116 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14017.patch b/meta/recipes-support/curl/curl/CVE-2025-14017.patch
new file mode 100644
index 0000000000..79be357ded
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14017.patch
@@ -0,0 +1,116 @@
+From 39d1976b7f709a516e3243338ebc0443bdd8d56d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 4 Dec 2025 00:14:20 +0100
+Subject: [PATCH] ldap: call ldap_init() before setting the options
+
+Closes #19830
+
+CVE: CVE-2025-14017
+Upstream-Status: Backport [https://github.com/curl/curl/commit/39d1976b7f709a516e3243338ebc0443bdd8d56d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/ldap.c | 50 +++++++++++++++++++-------------------------------
+ 1 file changed, 19 insertions(+), 31 deletions(-)
+
+diff --git a/lib/ldap.c b/lib/ldap.c
+index 63b2cbc414..0911a9239a 100644
+--- a/lib/ldap.c
++++ b/lib/ldap.c
+@@ -382,16 +382,29 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+     passwd = conn->passwd;
+   }
+ 
++#ifdef USE_WIN32_LDAP
++  if(ldap_ssl)
++    server = ldap_sslinit(host, (curl_ldap_num_t)ipquad.remote_port, 1);
++  else
++#else
++    server = ldap_init(host, (curl_ldap_num_t)ipquad.remote_port);
++#endif
++  if(!server) {
++    failf(data, "LDAP: cannot setup connect to %s:%u",
++          conn->host.dispname, ipquad.remote_port);
++    result = CURLE_COULDNT_CONNECT;
++    goto quit;
++  }
++
+ #ifdef LDAP_OPT_NETWORK_TIMEOUT
+-  ldap_set_option(NULL, LDAP_OPT_NETWORK_TIMEOUT, &ldap_timeout);
++  ldap_set_option(server, LDAP_OPT_NETWORK_TIMEOUT, &ldap_timeout);
+ #endif
+-  ldap_set_option(NULL, LDAP_OPT_PROTOCOL_VERSION, &ldap_proto);
++  ldap_set_option(server, LDAP_OPT_PROTOCOL_VERSION, &ldap_proto);
+ 
+   if(ldap_ssl) {
+ #ifdef HAVE_LDAP_SSL
+ #ifdef USE_WIN32_LDAP
+     /* Win32 LDAP SDK does not support insecure mode without CA! */
+-    server = ldap_sslinit(host, (curl_ldap_num_t)ipquad.remote_port, 1);
+     ldap_set_option(server, LDAP_OPT_SSL, LDAP_OPT_ON);
+ #else /* !USE_WIN32_LDAP */
+     int ldap_option;
+@@ -411,7 +424,7 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+         goto quit;
+       }
+       infof(data, "LDAP local: using PEM CA cert: %s", ldap_ca);
+-      rc = ldap_set_option(NULL, LDAP_OPT_X_TLS_CACERTFILE, ldap_ca);
++      rc = ldap_set_option(server, LDAP_OPT_X_TLS_CACERTFILE, ldap_ca);
+       if(rc != LDAP_SUCCESS) {
+         failf(data, "LDAP local: ERROR setting PEM CA cert: %s",
+               ldap_err2string(rc));
+@@ -423,20 +436,13 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+     else
+       ldap_option = LDAP_OPT_X_TLS_NEVER;
+ 
+-    rc = ldap_set_option(NULL, LDAP_OPT_X_TLS_REQUIRE_CERT, &ldap_option);
++    rc = ldap_set_option(server, LDAP_OPT_X_TLS_REQUIRE_CERT, &ldap_option);
+     if(rc != LDAP_SUCCESS) {
+       failf(data, "LDAP local: ERROR setting cert verify mode: %s",
+             ldap_err2string(rc));
+       result = CURLE_SSL_CERTPROBLEM;
+       goto quit;
+     }
+-    server = ldap_init(host, ipquad.remote_port);
+-    if(!server) {
+-      failf(data, "LDAP local: Cannot connect to %s:%u",
+-            conn->host.dispname, ipquad.remote_port);
+-      result = CURLE_COULDNT_CONNECT;
+-      goto quit;
+-    }
+     ldap_option = LDAP_OPT_X_TLS_HARD;
+     rc = ldap_set_option(server, LDAP_OPT_X_TLS, &ldap_option);
+     if(rc != LDAP_SUCCESS) {
+@@ -445,16 +451,6 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+       result = CURLE_SSL_CERTPROBLEM;
+       goto quit;
+     }
+-#if 0
+-    rc = ldap_start_tls_s(server, NULL, NULL);
+-    if(rc != LDAP_SUCCESS) {
+-      failf(data, "LDAP local: ERROR starting SSL/TLS mode: %s",
+-            ldap_err2string(rc));
+-      result = CURLE_SSL_CERTPROBLEM;
+-      goto quit;
+-    }
+-#endif
+-
+ #else /* !LDAP_OPT_X_TLS */
+     (void)ldap_option;
+     (void)ldap_ca;
+@@ -473,15 +469,7 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+     result = CURLE_NOT_BUILT_IN;
+     goto quit;
+   }
+-  else {
+-    server = ldap_init(host, (curl_ldap_num_t)ipquad.remote_port);
+-    if(!server) {
+-      failf(data, "LDAP local: Cannot connect to %s:%u",
+-            conn->host.dispname, ipquad.remote_port);
+-      result = CURLE_COULDNT_CONNECT;
+-      goto quit;
+-    }
+-  }
++
+ #ifdef USE_WIN32_LDAP
+   ldap_set_option(server, LDAP_OPT_PROTOCOL_VERSION, &ldap_proto);
+   rc = ldap_win_bind(data, server, user, passwd);
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index edae6ebb95..e0a9bae23d 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2025-13034.patch \
+    file://CVE-2025-14017.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

