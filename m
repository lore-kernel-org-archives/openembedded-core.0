Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69C8F36B86
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:30 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145071.1775776289079247777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HePFsfap;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so9442095e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776287; x=1776381087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCrRpjcSzw3cpfrKy1N2tyj/zldtSrQhQmfan6FM4XI=;
        b=HePFsfapCLoh1NhM4H+XgJioqrsiKCAyufnQMqEcfowHMK6+vKKhK50uomA/Ux6lmR
         nJMcIbbgyzbkERylyzqYMiB19/R7HFAdQke+xA0Yp0Njz82xwAXPP9GrrnbCWT8sEqgP
         JECzl4WIPw1bfazF7gZYHPrWcbPskrMnx8WwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776287; x=1776381087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCrRpjcSzw3cpfrKy1N2tyj/zldtSrQhQmfan6FM4XI=;
        b=MHrM9Q9tFWzfj1TXsGHNPH/fl8tbQtnB9CJVTn+YlJoff9ww6BDbPL5nLfRUJlzOee
         4fTMQClygl96PuSCFaQI74Kvtb/B53/M92IF21LOeEYhmiO/VPWAB+KDX74UN+tYvavb
         yDZLpk2gHHs/s/YzOhzQmXWSC3qAqFga950p9q9exNDwky1KG2qUcAA07ijILBiF3ner
         r7UntL+h8IORPFPUpN5uuQcPPVw/QC5r7sGAH/RObnXNaiR7KjgwBR5YuDm58vTg6c/Y
         5spbZ/eynp47hREqcIQE8oXfWISW+Kf7jnU8AHoTZ0fPZKHGxMQ4ncBNS59nhW0I19tJ
         88Rw==
X-Gm-Message-State: AOJu0YxeX+XDQGwfHoCe5KAsMo9KoS4q++hRbOA52Y8NRZDGI4SvjsSS
	ltZOoCtgFp6b7VUVsfwqAZ/u0R0AWQKLxVftl/yKP+t0B1GQevfYUY+dzCfBfmSGh9SwFHzKv43
	BoFMKfg7MbXxx
X-Gm-Gg: AeBDieuIzON6FOlxwA+8R0agZ5viTo83nfa282ahEdz6OSIyKRmsPl4PodIM1cG9MGV
	JDZgs7LNODxaszZic47wrOck/RV2aXgQCK6FDgwnSEDDMFkcu2iFg9j7wtGmbXB44ql5ShwpD2b
	6YTMCGxsv+T9sPiIs9u5GohZEoNoKXSXCJA7Uj3nzIIcQkTgijdkSlmDYr8vhbRIkf2McB3vyEN
	QJXFElkBKpGIE6GeFPtZx5KbwRBkKnhHSshtoUn6JuXkFnZhRAhR1MXIlDoMbF3q0WGB7B9OA0d
	IOAd/0R3VUr9sV+CNPNHqbtjKv7vIj+5OA5zMSOl/kytTGbtpgDKEG3xb+mvtu+G677JKJoiBrW
	eRfv4CV1uy5h6AcczfVBy6iXkEjBQEemK4eW2ydl2CWs+UjKcXQxRLA459p5lZgIF0sZRWsb52x
	8QNyBbxUlxcbk64d26Vze7UMqFKAWs1IjqgSiX6cRjRbQbVI6mG01SFU9SBNGqFk8CvPN4O9nGM
	ZMHAqy3uUnjP5zbiMdqOJHPOTBZ
X-Received: by 2002:a05:600c:154d:b0:485:3989:b3e4 with SMTP id 5b1f17b1804b1-488d685b6ddmr7441365e9.6.1775776287247;
        Thu, 09 Apr 2026 16:11:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 15/30] curl: patch CVE-2026-1965
Date: Fri, 10 Apr 2026 01:10:15 +0200
Message-ID: <adb8a05ef19faf76c7c4a3ea68600aa443861a95.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234974

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
 

