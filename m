Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B37EFE5215
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31960.1777064202091204057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Fdy6uN/R;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so42144315e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064200; x=1777669000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heXD1Inzkdy31u/ZFQfa039CDirI/gzWSWIknMZUfiA=;
        b=Fdy6uN/Rz6EbXe3eLANLW6yNaRDYOAv9j3S6N/Fypg3KenkACg0AykCvMfJgVTwyim
         /GYJrLUFA37Cw1H8r1acp6HzkFq6P0XlfjJCDDSrlAfggHzgcRwonLouCVmdebHUGRs4
         ZcO374fNp9nwAmqkUY37Hdxt7baBkOHqEwMOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064200; x=1777669000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heXD1Inzkdy31u/ZFQfa039CDirI/gzWSWIknMZUfiA=;
        b=cDhpjt6Z0DPKpoUZCcQiUVM3+SJaC7rLR8dJHzRY820ts66NkXH3Pk7WYTZy4ATtZy
         Q9wZoBqO2+6fkBwcg3u74TMcVeQ1VjKYpDC7oNEGb1UjD+Es0UcGWLm2rJvgXrJlr1DX
         0f5kuqFnWflLU1yooop28SO2UdbonDYO7XAdTyC78PHlt2boTB4szW/CmyhQXC6VQkVy
         ZbbXgsxv1IJbJLZDPjFeaoqYN8tJ3YbvcaN+HnL9gIRylnSl3VQpjHCtKdsM948170uq
         keU+sIubh+SZcji7q3tFVw8UqcYTQk/PVOET/GwyRrTFzr5seeU96KExH1q95mw9dScG
         WX8A==
X-Gm-Message-State: AOJu0YwyhG6cspYmtZ6mJoivqeitHa7zKM/UMrDv7+GPWeaL7cK60/tH
	+wXCrqUUjDfqUpKqSa9AI6Ij6Tjs2wKDFG3tuZnzY/2Iix801W/IzrxE7ib4LpqvHKGmHVKnJYG
	/RMUmSS0gTt85
X-Gm-Gg: AeBDievT2WOIy0RAYmt8r4aETEcFD7CLRqDYCMccVrpD3jkgZQwNOU6Qs0NmWVc72Ek
	8kwoZ61ZWJV3wp0hqlrAtLRvw1twgg5pIXdXSeoUHUv7bfBgX0qNYUbmAFw++TvJGJu6A8ySfll
	Og1SElz0JqJRE1ZMiMWt+NGho1febm9w5XsrxHYXvsGGMlKOm3m3EWMF8jLJ/Qv4/RygZgRYU7Z
	7DgoqKo12U0P0kGikGXuCqUbI5QmMIAounO5eXgbysw1N5vmTmFh/xLoEcFSFy1pzHJLglCkAWO
	J/DrBVMNof5jArc+8lzJZ73yPZ45a+rUPxPM/JOMqrOsKw364fKrLAeilv+eTHUXfzVaWXFfEe0
	KLkxyUJi7ZUKSj1bhsTwZD2Ajs8JRzz5wkMivZasQDtzbmLLax017aHbMyaOPoT4sdPFZDbxuPy
	qMrzHLJWS2h9vGKJz4T7nSMUHGi1z/BSz8TnQSQCJNVPsgyu/x2Md440jqclI5j7SzAiDg8zhMf
	FmSyXPXfsVCBv4/7eL1jbrD6ROMImmtIF9mFQ==
X-Received: by 2002:a05:600c:870e:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-488fb84ffb8mr449607205e9.0.1777064200167;
        Fri, 24 Apr 2026 13:56:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/66] curl: patch CVE-2026-1965
Date: Fri, 24 Apr 2026 22:55:03 +0200
Message-ID: <0fc5d35a56900701b5ec8b53646448dd5fac537a.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235877

From: Vijay Anusuri <vanusuri@mvista.com>

pick patches from ubuntu per [1]

[1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-1965
[3] https://curl.se/docs/CVE-2026-1965.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-1965-1.patch           | 102 ++++++++++++++++++
 .../curl/curl/CVE-2026-1965-2.patch           |  34 ++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
new file mode 100644
index 00000000000..acc8bfe0442
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
index 00000000000..07dbf4e973b
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
index 9e37684b2cc..0b4c93ec66c 100644
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

