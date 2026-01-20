Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F53AD2ED12
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4164.1768908272911993506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SstLQTsA;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so27091105e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908271; x=1769513071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCkZXbOYUY+8jeD7PaJWMDhrICPXKTTbVmavTeFyM6k=;
        b=SstLQTsAvhaqDDUaNTvVCUmG/Tcpf6BHau60y7V5JPz8KIqJ6t0EWN++44LXJf48ET
         gmhz7Agd613B1uvnNk5n4i85pUmMGijkSxK9BJHbgcN+8mthnnKwK7LobozxHTESZHsY
         Fy/L5IgjMq3+7B3xismFeM4FNp39wohgj76n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908271; x=1769513071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iCkZXbOYUY+8jeD7PaJWMDhrICPXKTTbVmavTeFyM6k=;
        b=hTG4baPjvxOZrUGeVdyiLgJkSpy3eoaQzBu8BQIDHEYtTt+XCV8FZ60IPeTbERjv4R
         i4SBWbc+YZZbEoEym2k6X05AXevzwEQHsGjrpHXlB5h1wIFw/US0zDkosQavXTW1EUl3
         IoOpVxbJJWX4khGxZM8H6mXOguhC8aXgnl/O7QONjxSbblxnjYhAwCiAVahY3nCFxAAI
         /BO9ESc4WtkyqeUqBT75Q/Yztt9bK/UDtvDGArd0vD3bKchEcZGc6N/6ohtUXDX/f6Ze
         1AyxU73waTY/ueoRHit+PSfDw8xLRpXS833bemn8eZwH7+c+xiuFU/hKrzwflTu6wgbR
         aw6A==
X-Gm-Message-State: AOJu0YxNzdfAOr36Yf7G6rnJ8HPhFPzub9sv3HjGeXqtFicpHiW7ra+W
	jytkGTs+v6gNP0//Vd+T7aoVyWiYJ/gj82Fd1vgBDCLpKigHVPN2XFgaWoZ/GFH2Si7GIBGsOr5
	Xg5Ii
X-Gm-Gg: AY/fxX7hS6xwqqnO/jWdFbWrXVqjj0XLS6Yw7C+pZRgNdSCA3bie3bymtVBn9VB5xyP
	xL9iJvp7TZ0TVURcNobpiTuvonuKXeXhJT2xJEx0jziWmqKO4HAC6BWeaptThmsTfEySb9wb118
	9ViRlOr25GV66yipqCUAlBF95NGt1h9H1OQytoRDjdTlnsGtPGWgYfTU2C5eXo8eQxzntX+y23H
	+RdXiv0rxBBNeEq04RDA97n9f4uuoPWaa2buYWRDjWLMDc87PeDR+8TENwSrdD9AhPrI3WGmrZB
	6eZ2Sme5DWe+Lk2Oq/z5lb6ImzlKcXYhLIzT/gMbdKy02XnJN4ykLV9Dpc/fqfpNQlXlW6BVNWp
	wEjIduFmvxd+WTNCp33Bq8gWHh3koT4GUw7AihmW1GEIr+7RFe4ySLolmeDnwxaAuJ8M9Z3epbw
	z3zZzJPbdvXOvUJO5cTRAMNqM4snr7Q4e5GijQ87qbJcVNL1UfEMnJoR22XtegNAaX8/BN69dCi
	2Pr2H+Ut7vdBFKOxocKoA==
X-Received: by 2002:a05:600c:45d1:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-4801eab5602mr171787235e9.5.1768908270913;
        Tue, 20 Jan 2026 03:24:30 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:30 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 10/15] curl: patch CVE-2025-14017
Date: Tue, 20 Jan 2026 12:23:55 +0100
Message-ID: <f2b04c009267a57f97918787283b9a629cb50298.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229670

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14017.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

