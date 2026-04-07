Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A400AEDB7D4
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75571.1775546034084707086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ebn3bBau;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so46926285e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546032; x=1776150832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCrRpjcSzw3cpfrKy1N2tyj/zldtSrQhQmfan6FM4XI=;
        b=Ebn3bBauhOtRGFM+sSUcT+uAzzjYF3P2CCfwj/vK/j0e1HlKgCTsU0j9zdeNKL6cAH
         Df/98SXZgvW4XzHCSzGDv/EuvswsJ42p9TxxzKeDTX5htGZ81eE83jAKUBksowz9svgo
         5RCV+YuNTCRghcH9cZckhrGPENxnwtdBjrR/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546032; x=1776150832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCrRpjcSzw3cpfrKy1N2tyj/zldtSrQhQmfan6FM4XI=;
        b=TPdjpyGXiMnJZ/Vc+eR7NvhWNsYTrIxCjWbyVuMgH+qLp36J/YD/ouFe7+FtLkgHP+
         oKaZSBZyml+9u/eL3x8rI1LVQeZx+R0XeKmTgjJLnHGatyskGJ6vierV66bCJv9jJF68
         5L5NlAUXfDjimIXtIlg9Dk1t6fuWfeNWN92mNYY1drmZLXy3AkOdcUzpcDGY0COZ4D5A
         KzFSP7EihhKUO0gvUEaY/BJBeeu35agvmbx5vaDe2+qoh8x9ZWZKYU6AfRk5+BDfGHCU
         VnC3/8YbBdf+WWIlwIrbxaaGU9v92SmyLML47FolseavzIFxQKgIQkd7JHHdceYuJw/q
         k5iQ==
X-Gm-Message-State: AOJu0Yy8l0lqreSgFdiRy+TgOpm+O6RgAtJm1LPHZCmEM9kdu0SZ8HjG
	mTEEPtpXh4hlrlDpl1bDLE5VEOlV6hDVSm2pU7Jm9PuSK0InakkuwkciJAKinHQ9gTie46aJ1Py
	Jw5qchLI=
X-Gm-Gg: AeBDieuaOYO9UQ4WARX9Hb4LhO3Q5isj+ycsXxDu2J1g/jHgUEcB6ubJ3+wkBBQz9E7
	P2QElfBoiWH7Li4f3L+J+ZogAdd+8FlBQmKKE0yghz9YJ2PMyDC5BVUwOzCg7y5PNXNyXFGXnC4
	8XX6vRskoYG1GN9GZmYg4ZnNc0PwkzdqA7VgMIEt7woUEUSYjxSkrPyb0U6+18PsV5jzpuxOCwL
	cYIY3jo6Z+zpkVSLGPF2+0uoZv5MkZ9Iu7P4C/Ix+JWawmTBGRCn+elJNyIB7gJcKW32tCHhSpo
	K2N80tIkFoslVC3/56ttd+YmIq+2KApFSly9YNNCF8gtx8nzt3wny556MRi1JqnyyYoBx7wRwwi
	v6YltKFYmeIKmcO/GuKK9QQziyfjaRq4Mwnn/dnREbnxCC5UoYodXotPWAW+Z6CnmHobJ4U6YEJ
	KV8HQdIT+8Ou8YedLWnX8d0XkfO5WrhFXQw+ihgOwEe8/P7AnbmS0+poMvCbyW9toEc+PYlS3Qz
	754cWs/2L3TyOVlAr4sSBecE1qklgfdPgKpxg==
X-Received: by 2002:a05:600c:1f96:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488996e142bmr217450915e9.6.1775546032126;
        Tue, 07 Apr 2026 00:13:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 15/18] curl: patch CVE-2026-1965
Date: Tue,  7 Apr 2026 09:13:23 +0200
Message-ID: <adb8a05ef19faf76c7c4a3ea68600aa443861a95.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234719

From: Vijay Anusuri <vanusuri@mvista.com>

pick patches from ubuntu per [1]

[1] https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-1965
[3] https://curl.se/docs/CVE-2026-1965.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-1965-1.patch           | 98 +++++++++++++++++++
 .../curl/curl/CVE-2026-1965-2.patch           | 29 ++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  2 +
 3 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
new file mode 100644
index 00000000000..1d0f5c59e8d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
@@ -0,0 +1,98 @@
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
+Backported by Ubuntu team https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
+
+CVE: CVE-2026-1965
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 82 insertions(+), 5 deletions(-)
+
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1145,6 +1145,18 @@ ConnectionExists(struct Curl_easy *data,
+ #endif
+ #endif
+ 
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
++#endif
++
+   *force_reuse = FALSE;
+   *waitpipe = FALSE;
+ 
+@@ -1496,6 +1508,57 @@ ConnectionExists(struct Curl_easy *data,
+           continue;
+         }
+ #endif
++
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
++                       check->http_proxy.user) ||
++       Curl_timestrcmp(needle->http_proxy.passwd,
++                       check->http_proxy.passwd))
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
++        (check->http_negotiate_state != GSS_AUTHNONE)) ||
++       (wantProxyNegohttp &&
++        (check->proxy_negotiate_state != GSS_AUTHNONE))) {
++      /* We must use this connection, no other */
++      *force_reuse = TRUE;
++      break;
++    }
++    continue; /* get another */
++  }
++#endif
++
+         if(canmultiplex) {
+           /* We can multiplex if we want to. Let's continue looking for
+              the optimal connection to use. */
diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
new file mode 100644
index 00000000000..fa5fefd2517
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
@@ -0,0 +1,29 @@
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
+Backported by Ubuntu team https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
+
+CVE: CVE-2026-1965
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1542,7 +1542,7 @@ ConnectionExists(struct Curl_easy *data,
+     continue;
+   }
+ #endif
+-  if(wantNTLMhttp || wantProxyNTLMhttp) {
++  if(wantNegohttp || wantProxyNegohttp) {
+     /* Credentials are already checked, we may use this connection. We MUST
+      * use a connection where it has already been fully negotiated. If it has
+      * not, we keep on looking for a better one. */
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index b8fa8b5266a..0e107f1e753 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -71,6 +71,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-15079.patch \
            file://CVE-2025-15224.patch \
            file://CVE-2025-14524.patch \
+           file://CVE-2026-1965-1.patch \
+           file://CVE-2026-1965-2.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

