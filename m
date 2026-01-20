Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5273D2ED13
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:24 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5027.1768910963212877849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tyupW+U5;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2876552f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910961; x=1769515761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McgWnosgCoWTpmUV0hgBTmL2Ns6M0LNmMsJ59blKGcU=;
        b=tyupW+U5nR1RuAEMprg3ftFu/HNEEHvZ++xBzWAizFMXCEUA6PrlifVl+c0mGMmFoN
         ReDjxE3TtExJEva0RqVjpoOfzqlFDb0WugGMHWLwTyhHipt7rjlcGf0OjefBg5Nqts5f
         UdlVYPwaBSb4s4Yn2se1GH/3zhdzzgvv0UEn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910961; x=1769515761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=McgWnosgCoWTpmUV0hgBTmL2Ns6M0LNmMsJ59blKGcU=;
        b=AGZShVqZN1t9FcIBe5olC9fTUBSoSHepObyEps4XW7V7xMxiPYVErhX4mxF2u6HwSb
         TQFNM5r6nKHm6LvPdCd6rmzLTnbrzgUGGrHb6f5Ggbn3itPrRT0RVpe1GF07cYEPuk4t
         epAWzv4+gM5xj2l1YytWu9kTBvItITeHtcpqdxH6RAW6pYykgIJ+APKAuT/LhA6IOA/F
         1+okgShSLbsB6dgZ7ChfAMeLxiRrySNSYP9gxQ88VkFY9hf9V/3VicIXLsvJo+I8Yysr
         ZLcLpZUXQfLyqFrc0QuAzjzIFVudZJuNIWVDSJSKPfU2fDa5rpQjC3as89huOg8lWvB1
         HI0g==
X-Gm-Message-State: AOJu0YyB7ztWHn6PPiCCLP84AMq03grcSlgKU0Vg4kQPbgT55bLDKgsc
	pWh7fDrLo4bD7qybyapzIIwjQ2+iAJCImjLE22p6ieIGC1f6w9pknooAQFDYtfurBy09UgO9ejn
	joBbA
X-Gm-Gg: AZuq6aJtmvQZZAG00iviQPRUndq75GfB4LFOli4GejsnXjRp3a22pJ8MErE8NcIm1hJ
	HH/Djdod2mNh6OEB97ykT51PcUv/FRB4QA7DstKSooS9/ARl/MqF9+ZsQYnvwJAM+SmYwMwmtiw
	5PPxuJ7X+9rjFNAhP/yar5JJNHmDZSrPoYygTfPZmIOaCPI5Sesi4P+3RdP/1WOJgmdtLpitUFD
	qtgCnkl2KfaJW+ox8eoM3wJTi+e/eoKhFK5JkByyiTIN8/mfYXVuWWh8qnTXb2seef7pt5eDuzn
	Uh76EaPIv3xOwEzZ0+Gn21DiYBnIUij/xnHE6Uyl9S4azLMc8y4Z5XGN0a9cUwbjLkiv1m07fAA
	9L5EL71MxkJTKcLG5L7gv0xmXkL2bKXYPLFBCJCU19nI/vwhcohX7v1XblneEpVrsmrCXhEj2j/
	IoIh8L6Ri6GFvbJScvdcchlbiw5ICJ26gTdQ4ysSQpektUO4JroaHTHbMwyQnx+aCxnC2tCTi0+
	p1OR34rby/QSbJ8hXB3aA==
X-Received: by 2002:a05:6000:1acd:b0:431:8f8:7f1e with SMTP id ffacd0b85a97d-435901751cdmr2247325f8f.48.1768910961373;
        Tue, 20 Jan 2026 04:09:21 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/22] curl: patch CVE-2025-14017
Date: Tue, 20 Jan 2026 13:08:27 +0100
Message-ID: <da0bc3bad74216b3a8b94664a55f6b97d56e8a57.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229691

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14017.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-14017.patch            | 115 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14017.patch b/meta/recipes-support/curl/curl/CVE-2025-14017.patch
new file mode 100644
index 0000000000..887ff2f97c
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
+@@ -362,16 +362,29 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+     passwd = conn->passwd;
+   }
+ 
++#ifdef USE_WIN32_LDAP
++  if(ldap_ssl)
++    server = ldap_sslinit(host, conn->primary.remote_port, 1);
++  else
++#else
++    server = ldap_init(host, conn->primary.remote_port);
++#endif
++  if(!server) {
++    failf(data, "LDAP: cannot setup connect to %s:%u",
++          conn->host.dispname, conn->primary.remote_port);
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
+-    server = ldap_sslinit(host, conn->primary.remote_port, 1);
+     ldap_set_option(server, LDAP_OPT_SSL, LDAP_OPT_ON);
+ #else
+     int ldap_option;
+@@ -439,7 +452,7 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+         goto quit;
+       }
+       infof(data, "LDAP local: using PEM CA cert: %s", ldap_ca);
+-      rc = ldap_set_option(NULL, LDAP_OPT_X_TLS_CACERTFILE, ldap_ca);
++      rc = ldap_set_option(server, LDAP_OPT_X_TLS_CACERTFILE, ldap_ca);
+       if(rc != LDAP_SUCCESS) {
+         failf(data, "LDAP local: ERROR setting PEM CA cert: %s",
+                 ldap_err2string(rc));
+@@ -451,20 +464,13 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
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
+-    server = ldap_init(host, conn->primary.remote_port);
+-    if(!server) {
+-      failf(data, "LDAP local: Cannot connect to %s:%u",
+-            conn->host.dispname, conn->primary.remote_port);
+-      result = CURLE_COULDNT_CONNECT;
+-      goto quit;
+-    }
+     ldap_option = LDAP_OPT_X_TLS_HARD;
+     rc = ldap_set_option(server, LDAP_OPT_X_TLS, &ldap_option);
+     if(rc != LDAP_SUCCESS) {
+@@ -473,15 +479,6 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
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
+@@ -498,15 +495,7 @@ static CURLcode ldap_do(struct Curl_easy *data, bool *done)
+     result = CURLE_NOT_BUILT_IN;
+     goto quit;
+   }
+-  else {
+-    server = ldap_init(host, conn->primary.remote_port);
+-    if(!server) {
+-      failf(data, "LDAP local: Cannot connect to %s:%u",
+-            conn->host.dispname, conn->primary.remote_port);
+-      result = CURLE_COULDNT_CONNECT;
+-      goto quit;
+-    }
+-  }
++
+ #ifdef USE_WIN32_LDAP
+   ldap_set_option(server, LDAP_OPT_PROTOCOL_VERSION, &ldap_proto);
+   rc = ldap_win_bind(data, server, user, passwd);
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 0af6a41399..aa978f0346 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
     file://CVE-2025-9086.patch \
+    file://CVE-2025-14017.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

