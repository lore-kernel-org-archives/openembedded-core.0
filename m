Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11BDE9D830
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 13:21:46 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54737.1775481704448655003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 06:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CoiykY6U;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35c206f0481so3780771a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775481703; x=1776086503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnkNKIoHGVvqy4PbXX78NKdkhVtU7F3WIy47iJXNI9I=;
        b=CoiykY6UKrkR/kY0iFDvHgC+VDu/Rxfxyhfqz8i/mj6PUleJZ0NIPEOs9oX2T6wFBY
         xbo1cIaTgJxFf+Uw1CetLOOlWL5kbiyb8Nck9UC1gY/EM/X2Q0qnJkl8yV0sx4evqx4Q
         UPW0AMcTCLS1wnrUmHhyrR4kMcSDEYHUlEjjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481703; x=1776086503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnkNKIoHGVvqy4PbXX78NKdkhVtU7F3WIy47iJXNI9I=;
        b=RjrX1cwltsJKPZXLhnanMF5Ps7sx1/oBIV2ojvgadA997tdti0d97iOtM/lwl5XcKx
         h1/5JWRdJCHgQ+hTKylw44q8BmdylCsC3w8OE07jubQndk9fSTh615CSNy0e/nbBzNyf
         tJpp0iLwKeZyQqd+0DKDm3ZI/29O2BrC6Wmr0BHNCaqz4lhJ0RG1TPX8IyIHMmwuIopw
         vkMWjJuTzF834xDtmGYOVgKL51lxyUeLKbnj5IyyqwUes5J24S1ryJUQujk1fBnmhR49
         3sJMZfB//2rOMCmJaAqy+wrkItuskfOR4v08n9GVg9PuL6PdC7cYkEO6cpJwdXeeYkgS
         1pSQ==
X-Gm-Message-State: AOJu0YxUUlHVgwwqYlbtpkAd4XwNnYHIs/bnE7IfA/kdKCcO1Nm/K3Bh
	PQGyCM1MLDYYG5av/smlYVyEykU809EcQhgPoL3sCXLRgcv6gLEofj3QzmnHMhAgk92ei/BF/2W
	7yShJQ4o=
X-Gm-Gg: AeBDieu8P+vgAg/O0Nk0LLyG9zmJe8Hry1VMejLdNA1/Tx8jR5yntdPkTBsSNa2UiU+
	lU7Eoe3ea2cm+nnuApvPEnLKT3XGH0Q5P4o/019Onub1lwrXhNVqR4oD8qjq2oa8tWT+kgGQ/ep
	BVP9XkcLB0dEMnCUm7gLMu1DxiqP037J7Vx4RiOzyFvHkTCIubMOQq1UwHftQ00bPsCBRMVrf5a
	svEuc6zfwa1yy9/HphXDl3DVIx13zlVaWhOxk/PygMSo1ivXYBwMpeFdG1gGTmGKaNnC3dCjkyb
	quWtxLBgPT/aFfCDKWuKhIWnVd+rTXV5Gqx9BajAfRrrKcDSAoNXlcpT7Ww6IdydTqln3kRyUFi
	AoIkvnMUitA3lrfzU3MDdsRuitEgZLo2w5dRrihPsFnOOabIghZaG7mmD/EaCIvQK4ymDmSxcGs
	YKGFA01aly89F6ZP/2dTDPhn1KaOXQQrP+NCF/poE=
X-Received: by 2002:a17:90b:2885:b0:35d:974d:8f7 with SMTP id 98e67ed59e1d1-35de679c8ecmr11213151a91.1.1775481703313;
        Mon, 06 Apr 2026 06:21:43 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f28:2171:fb10:85f3:b262:eebf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f50e9sm13848829a91.6.2026.04.06.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 06:21:42 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 1/3] curl: patch CVE-2026-1965
Date: Mon,  6 Apr 2026 18:51:27 +0530
Message-ID: <20260406132129.440817-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 13:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234679

pick patches from ubuntu per [1]

[1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-1965
[3] https://curl.se/docs/CVE-2026-1965.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-1965-1.patch           | 102 ++++++++++++++++++
 .../curl/curl/CVE-2026-1965-2.patch           |  34 ++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
new file mode 100644
index 0000000000..acc8bfe044
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
@@ -0,0 +1,102 @@
+From 34fa034d9a390c4bd65e2d05262755ec8646ac12 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 5 Feb 2026 08:34:21 +0100
+Subject: [PATCH] url: fix reuse of connections using HTTP Negotiate
+
+Assume Negotiate means connection-based
+
+Reported-by: Zhicheng Chen
+Closes #20534
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/34fa034d9a390c4bd6]
+Backported by Ubuntu team http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
+
+CVE: CVE-2026-1965
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 62 insertions(+)
+
+diff --git a/lib/url.c b/lib/url.c
+index 1439c9e..792c422 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -936,6 +936,18 @@ ConnectionExists(struct Curl_easy *data,
+ #else
+   bool wantProxyNTLMhttp = FALSE;
+ #endif
++#endif
++
++#if !defined(CURL_DISABLE_HTTP) && defined(USE_SPNEGO)
++  bool wantNegohttp =
++    (data->state.authhost.want & CURLAUTH_NEGOTIATE) &&
++    (needle->handler->protocol & PROTO_FAMILY_HTTP);
++#ifndef CURL_DISABLE_PROXY
++  bool wantProxyNegohttp =
++    needle->bits.proxy_user_passwd &&
++    (data->state.authproxy.want & CURLAUTH_NEGOTIATE) &&
++    (needle->handler->protocol & PROTO_FAMILY_HTTP);
++#endif
+ #endif
+   /* plain HTTP with upgrade */
+   bool h2upgrade = (data->state.httpwant == CURL_HTTP_VERSION_2_0) &&
+@@ -1274,6 +1286,56 @@ ConnectionExists(struct Curl_easy *data,
+     }
+ #endif
+ 
++#ifdef USE_SPNEGO
++  /* If we are looking for an HTTP+Negotiate connection, check if this is
++     already authenticating with the right credentials. If not, keep looking
++     so that we can reuse Negotiate connections if possible. */
++  if(wantNegohttp) {
++    if(Curl_timestrcmp(needle->user, check->user) ||
++       Curl_timestrcmp(needle->passwd, check->passwd))
++      continue;
++  }
++  else if(check->http_negotiate_state != GSS_AUTHNONE) {
++    /* Connection is using Negotiate auth but we do not want Negotiate */
++    continue;
++  }
++
++#ifndef CURL_DISABLE_PROXY
++  /* Same for Proxy Negotiate authentication */
++  if(wantProxyNegohttp) {
++    /* Both check->http_proxy.user and check->http_proxy.passwd can be
++     * NULL */
++    if(!check->http_proxy.user || !check->http_proxy.passwd)
++      continue;
++
++    if(Curl_timestrcmp(needle->http_proxy.user,
++		       check->http_proxy.user) ||
++       Curl_timestrcmp(needle->http_proxy.passwd,
++	               check->http_proxy.passwd))
++      continue;
++  }
++  else if(check->proxy_negotiate_state != GSS_AUTHNONE) {
++    /* Proxy connection is using Negotiate auth but we do not want Negotiate */
++    continue;
++  }
++#endif
++  if(wantNTLMhttp || wantProxyNTLMhttp) {
++    /* Credentials are already checked, we may use this connection. We MUST
++     * use a connection where it has already been fully negotiated. If it has
++     * not, we keep on looking for a better one. */
++    chosen = check;
++    if((wantNegohttp &&
++	(check->http_negotiate_state != GSS_AUTHNONE)) ||
++       (wantProxyNegohttp &&
++	(check->proxy_negotiate_state != GSS_AUTHNONE))) {
++      /* We must use this connection, no other */
++      *force_reuse = TRUE;
++      break;
++    }
++    continue; /* get another */
++  }
++#endif
++
+     if(CONN_INUSE(check)) {
+       DEBUGASSERT(canmultiplex);
+       DEBUGASSERT(check->bits.multiplex);
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
new file mode 100644
index 0000000000..07dbf4e973
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
@@ -0,0 +1,34 @@
+From f1a39f221d57354990e3eeeddc3404aede2aff70 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 21 Feb 2026 18:11:41 +0100
+Subject: [PATCH] url: fix copy and paste url_match_auth_nego mistake
+
+Follow-up to 34fa034
+Reported-by: dahmono on github
+Closes #20662
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f1a39f221d57354990]
+Backported by Ubuntu team http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
+
+CVE: CVE-2026-1965
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 792c422..22ed0be 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1319,7 +1319,7 @@ ConnectionExists(struct Curl_easy *data,
+     continue;
+   }
+ #endif
+-  if(wantNTLMhttp || wantProxyNTLMhttp) {
++  if(wantNegohttp || wantProxyNegohttp) {
+     /* Credentials are already checked, we may use this connection. We MUST
+      * use a connection where it has already been fully negotiated. If it has
+      * not, we keep on looking for a better one. */
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 9e37684b2c..0b4c93ec66 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -32,6 +32,8 @@ SRC_URI = " \
     file://CVE-2025-14819.patch \
     file://CVE-2025-15079.patch \
     file://CVE-2025-15224.patch \
+    file://CVE-2026-1965-1.patch \
+    file://CVE-2026-1965-2.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


