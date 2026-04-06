Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415F5EF4EBC
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49557.1775456859976534405
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BLZzLacc;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso51480515e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456858; x=1776061658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCrRpjcSzw3cpfrKy1N2tyj/zldtSrQhQmfan6FM4XI=;
        b=BLZzLacc657EAF2ffRz4r3vwp42Tuu4+BW0dLCAMQIPfkIuSfrXz7RBVam70RvXCeh
         1mXVjmXg45JEgnIpBuGR59oZDQ0WFwaZQZ+ZDSG6B8vuuznUvDATkJs7uO5uCISY2FvA
         f4CD7VBya1doz3uJcKjHnpSzP5/P7mMKzsU+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456858; x=1776061658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCrRpjcSzw3cpfrKy1N2tyj/zldtSrQhQmfan6FM4XI=;
        b=gXwdSSsNufnxusAInPwJyk/yR2t0NAOcoGHtQUTWTpABdEbx3063davBUSsoizY4H4
         K2OfGYLFLgy0bGxGXlk20IYqvNt71h+eSm8SnFyQZMT9efhEH/UCWOLu4oj6zUIR1Rms
         zeL4dKErz60jf6WFMSYHDZZFHtiift7g/a+ie+h4+mlqriXPRUZpl+ussVi/PnPFMksO
         rvcGfvGh9rVna4jj3WQFVsMePI2G3NbUrB2DzqZWZ3TfRqsaSIdlJHqW0xzxwvK+D0R8
         LTZvpzQMwsfqeVDjXLUfmuoyMD7bT0RBkmDi+cQbGBm12CW0Oz750510s7gHzSPqPszq
         KXlw==
X-Gm-Message-State: AOJu0YwBQPFXf/oiyEj3hrsaTlQByaCBDkDlGDUSwCVuh8RxWh0xttrK
	rBT1RzVmk+jqb5ft4dwHcbIwMPoo258HF8YVllxZrn+tGB9D6tiiMRCzf4O/vbZ4K77fxCC5Xb0
	wkbwaSJI=
X-Gm-Gg: AeBDieu2SpTYobaZVrvWxB11QCjt7LGHZHTEUjt1N2kkN8sU+c5pu3TolHhYoHAkQz1
	1+hd462Ag3UIjBPMW4YruGOAJ3zm5tJc+XeVIJg0j7sBfVURiballjRLzVkzd001KtKW+8kfkkV
	f2pnexLLnhQNTBiTH5yqOuq5ZQSmMqRlIhKIXc9w8LKAYTNYFI3frL4W1sajWBpDbKf1L7n3DnH
	SWJ12gEKb3hqkg7E+dZDUb3yoF7w5FsqcbwkaeBijp8vr8cQMuHhJGHhPcBtHAk6ZZ2c4fYaqQo
	zpuwVxAhxHUmHvbDwy8cZinBISO+RIkv7nXTm5XUfz5NUJjJ8DC8we7UNFhboXAtgrPfOicLxuE
	GiwvQhplg+vBmtJfsDsHqJ9yyxpX7ajmIEBoSTJysgXchK80LGDJVY03WQOcm2nZ/LsQqlKSJdU
	FKEM8d1/bOX/rmetN1vlWMkHyQ9QMQ/LkdxkEmzlSOqaf20hzyGYuFjv8xiJfxnpD6rNq+PezvV
	tznYYTTHi0Vgf8oTupgQaBO08c=
X-Received: by 2002:a05:600c:3acb:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-4889972b76amr174079765e9.13.1775456857954;
        Sun, 05 Apr 2026 23:27:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/18] curl: patch CVE-2026-1965
Date: Mon,  6 Apr 2026 08:26:44 +0200
Message-ID: <d0e29c94ba9a0bbae429a533a76bda26900b7d4b.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234661

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
 

