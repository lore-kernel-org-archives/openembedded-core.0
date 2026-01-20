Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768BCCCF2DD
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6475.1768916295446131228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ux99ccDv;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso38227905e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916294; x=1769521094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpXrPLagsO1Gm2P9neCLNl+ucO0IwNjwE459Blz7BLY=;
        b=Ux99ccDv6vSogY8zrhwmJgsbBuX5pRM+v4gOn7YIfqAMO76DGrBm87BYEvaLF5I3sO
         h9c2OU2oYl15BimFDbj4hyZtQ1IHLEVy0GsdpjKs8KQWzTePm9yJWoSDhofitZWP+V94
         R+/dTi7Qn+ifB20iZqaOpuCv+n4ivzsRdVH3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916294; x=1769521094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HpXrPLagsO1Gm2P9neCLNl+ucO0IwNjwE459Blz7BLY=;
        b=VhUF58Weeez45bBMngREwBOo48MWI43Nkb+oXcXRwDqZBAw3V+QcXtUg5IxdDN5SKG
         yQRwRE06oV7KPnzKBr9nJBWzwoxQwLah5yyqla+1t3wSsWnWWhU+/jnUcXt7zMGkfUjF
         1LSmYN4jF4YHL2cBDpG098gmBwFzQ2BqIk7DJT2bv71ukVsiysm8q8Vi8ZZnxZ96Tfbl
         aTBZOFldOdhJW0oQulT/OKPgVfmiok80ehcT8ZTBK7bfIwoBK0PlACbReyM5M/4Js7Ne
         BYxlkgSeiMCOhai9VKw5Mjo58ktA/VJhz03Q1D2jRYsJP/3Too/SlmfzkKu0htzQnQc7
         +jtw==
X-Gm-Message-State: AOJu0YyFlQ93fdbqweOrqokTu9P90wsG698Uy3NBf0woGZabucB8EbJA
	4vAM7Z5ai9vct6EhYtRBTMxqRMN2RvADbi7euOKpIpjW4vqnvVLJTTtVVOtAEqym+dab18tBQCU
	WwGCP
X-Gm-Gg: AY/fxX6Zm3u22GWooiSPd908DDK16U09G3iREUKec1T6S8oDY0IOKzaEG6Ky3FJFj8/
	SrcZJgZiqUwZgyFQRcYq+heKbccFwXUcIu/6zb3CMtgeRBvjBLBrO/WT6dPwfzb5dDZY7Y9/TQg
	I+LvZ7z7H82Q6CNznFlZ6WfQg0378UO/kvrDknD4jnfWI5Ht58sMQ5iqA1PE8E/NonF0ohRH7MG
	2Mdh658LLzuOYwBIDKCEtXDBeSxu1CXpWeQDpwHAniIC5tO5iVNaQq1oFWN2XVzekOrGtK1TaQU
	nhnVr3ee8vbj2W3AbO+dd6ZcodXrlxW70vXuxebP+sYWZd2Pm5c80Gu/xaknubCXekjy5erGav8
	RSMCokSjBSBarsz4QWhhOhs2v06MC3AGXs+7GkA7T7KHNFnDDU6CIILLNieWmY3Ogrm/f6nCZpJ
	mH8+eAJualHuuEwoUQp7stzb0J9CGiUXFLySHG5esIqMCM0Gj0vXf6/eW9gckysAR+N5Eljd0+E
	iiT8XoIm8xrm1/Ybjxu5Q==
X-Received: by 2002:a05:600c:8b21:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-4801e30b946mr202534595e9.13.1768916293585;
        Tue, 20 Jan 2026 05:38:13 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:13 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/26] curl: patch CVE-2025-14017
Date: Tue, 20 Jan 2026 14:37:37 +0100
Message-ID: <11e04ebbc7556e04020b1f7c04f09dafe3ecbc49.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229721

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14017.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-14017.patch            | 115 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14017.patch b/meta/recipes-support/curl/curl/CVE-2025-14017.patch
new file mode 100644
index 0000000000..a18e1d74dd
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
index 2326392a4f..db3dc01929 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -67,6 +67,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-11053-0002.patch \
            file://CVE-2025-0167.patch \
            file://CVE-2025-9086.patch \
+           file://CVE-2025-14017.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

