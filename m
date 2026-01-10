Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9BDD232D3
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:45 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12780.1768066659378178788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KX6/utGF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202601101737379813d95e010002076e-l5rtw6@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202601101737379813d95e010002076e
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+JrkXe/PIVL5Ih38sYz9DS2Z8czffUW0adA+TZbxn9A=;
 b=KX6/utGFmecWmjCrzkF15E2f0iV1My0JiFixhT27sl7PqfYsV0YirHCBAqLgQudF/f4aJp
 lLxv3hozOwMEbFdw0gatwZWeteo9mBJAI2AczyC56D99IsrqDrLumfuzJz5ab00mQlpAZ4Kt
 1Lb4aagXgv/wgIJnnoqKz41fn1gifW7k4Dk+/IibkoGAHJSYY79Y76F4g3/Ainw+QZpUQfes
 M6dyKhhK3tcdgYNxOLTTeJETKTURQRytEFDenEtw9YaQnPUFuT9FsmzTHtNjYBy43fasCL2E
 OR6roOh9k8Xx1nMcLcshwCZxECnhtitKYTuBdkmHAg82Im0hvx9WGOAg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/3] curl: patch CVE-2025-14017
Date: Sat, 10 Jan 2026 18:36:33 +0100
Message-Id: <20260110173635.1643307-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229162

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14017.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-14017.patch            | 115 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14017.patch b/meta/recipes-support/curl/curl/CVE-2025-14017.patch
new file mode 100644
index 00000000000..a18e1d74dd5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14017.patch
@@ -0,0 +1,115 @@
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
+ lib/ldap.c | 49 +++++++++++++++++++------------------------------
+ 1 file changed, 19 insertions(+), 30 deletions(-)
+
+diff --git a/lib/ldap.c b/lib/ldap.c
+index 63b2cbc414..0911a9239a 100644
+--- a/lib/ldap.c
++++ b/lib/ldap.c
+@@ -333,16 +333,29 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+     passwd = conn->passwd;
+   }
+ 
++#ifdef USE_WIN32_LDAP
++  if(ldap_ssl)
++    server = ldap_sslinit(host, (int)conn->port, 1);
++  else
++#else
++    server = ldap_init(host, (int)conn->port);
++#endif
++  if(!server) {
++    failf(data, "LDAP local: Cannot connect to %s:%ld",
++          conn->host.dispname, conn->port);
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
+     /* Win32 LDAP SDK doesn't support insecure mode without CA! */
+-    server = ldap_sslinit(host, (int)conn->port, 1);
+     ldap_set_option(server, LDAP_OPT_SSL, LDAP_OPT_ON);
+ #else
+     int ldap_option;
+@@ -410,7 +423,7 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+         goto quit;
+       }
+       infof(data, "LDAP local: using PEM CA cert: %s", ldap_ca);
+-      rc = ldap_set_option(NULL, LDAP_OPT_X_TLS_CACERTFILE, ldap_ca);
++      rc = ldap_set_option(server, LDAP_OPT_X_TLS_CACERTFILE, ldap_ca);
+       if(rc != LDAP_SUCCESS) {
+         failf(data, "LDAP local: ERROR setting PEM CA cert: %s",
+                 ldap_err2string(rc));
+@@ -422,20 +435,13 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+     else
+       ldap_option = LDAP_OPT_X_TLS_NEVER;
+ 
+-    rc = ldap_set_option(NULL, LDAP_OPT_X_TLS_REQUIRE_CERT, &ldap_option);
++    rc = ldap_set_option(server, LDAP_OPT_X_TLS_REQUIRE_CERT, &ldap_option);
+     if(rc != LDAP_SUCCESS) {
+       failf(data, "LDAP local: ERROR setting cert verify mode: %s",
+               ldap_err2string(rc));
+       result = CURLE_SSL_CERTPROBLEM;
+       goto quit;
+     }
+-    server = ldap_init(host, (int)conn->port);
+-    if(!server) {
+-      failf(data, "LDAP local: Cannot connect to %s:%ld",
+-            conn->host.dispname, conn->port);
+-      result = CURLE_COULDNT_CONNECT;
+-      goto quit;
+-    }
+     ldap_option = LDAP_OPT_X_TLS_HARD;
+     rc = ldap_set_option(server, LDAP_OPT_X_TLS, &ldap_option);
+     if(rc != LDAP_SUCCESS) {
+@@ -444,15 +450,6 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+       result = CURLE_SSL_CERTPROBLEM;
+       goto quit;
+     }
+-/*
+-    rc = ldap_start_tls_s(server, NULL, NULL);
+-    if(rc != LDAP_SUCCESS) {
+-      failf(data, "LDAP local: ERROR starting SSL/TLS mode: %s",
+-              ldap_err2string(rc));
+-      result = CURLE_SSL_CERTPROBLEM;
+-      goto quit;
+-    }
+-*/
+ #else
+     /* we should probably never come up to here since configure
+        should check in first place if we can support LDAP SSL/TLS */
+@@ -469,15 +466,7 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+     result = CURLE_NOT_BUILT_IN;
+     goto quit;
+   }
+-  else {
+-    server = ldap_init(host, (int)conn->port);
+-    if(!server) {
+-      failf(data, "LDAP local: Cannot connect to %s:%ld",
+-            conn->host.dispname, conn->port);
+-      result = CURLE_COULDNT_CONNECT;
+-      goto quit;
+-    }
+-  }
++
+ #ifdef USE_WIN32_LDAP
+   ldap_set_option(server, LDAP_OPT_PROTOCOL_VERSION, &ldap_proto);
+   rc = ldap_win_bind(data, server, user, passwd);
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 2326392a4f5..db3dc019290 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -67,6 +67,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-11053-0002.patch \
            file://CVE-2025-0167.patch \
            file://CVE-2025-9086.patch \
+           file://CVE-2025-14017.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

