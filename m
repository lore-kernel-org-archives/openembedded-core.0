Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73751094468
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 09:47:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8228.1774086462654191186
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 02:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NpS9wGRN;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1812306a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774086461; x=1774691261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+sMXw8XsgDGJTlurirIlBQAERrLvr8jxFTvj1Pqr+Q=;
        b=NpS9wGRNoHWzJuSKSnKI9HXiouQpnKCjmn3j2U/Z35NKTYPKfZHFHSBA1/d8pI3GnX
         WnE4kXW31ZlJyf7LD3Hu7v2MFpNQtBvI7sVMeW24lvvNndCs4CHZHVXJ9QyvCuCNgvua
         aNMWBFABjtUUKnYV4g4SpR7txnXES+0Dm40L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774086461; x=1774691261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q+sMXw8XsgDGJTlurirIlBQAERrLvr8jxFTvj1Pqr+Q=;
        b=A6K19Q+OMlfUtnit/49u0bOmTLtuqTH2TOpAWuWlrmY1E3Vz8GaVfKAIwOlw/5856H
         KglqKr0omOYAFmy7Qqj5V9D1HudEl8I0HAEjOOaWfxWFhhex6vC87Q1Rz0ZFMmWykvrY
         Xrm/cskv1qtJgwJFghxKjweicfEQnfJU6BYCCaI4idXvTIQbY79gRRCKeLG5mwIPH7jk
         U+4dTLWSf4M2oimUIGqJgk5CE52plpP1DRBBcJh/uhvakBWtAImX/tzKYzLE4OOR2PD7
         kVb1scCcLmZjtZLqsxTDnIZ5h0E2UOvMkUM7xcPXsG7WH5Fn+v3qyl/4LQOp9ZKQthbc
         aqZg==
X-Gm-Message-State: AOJu0Yz94nMLswiXjCgyD1iLElJGcq0QD7NOaqLKLGMHXdIkzkeifJUi
	QTKuOxnE8WecVrPbFYMkoQJ1IpZAkICJFGHGgAblGRhahqWmMQOYmKJLR3pY0AmcFgg8GpXRDgJ
	r9B5/5CQ=
X-Gm-Gg: ATEYQzwnM89LqumZ+rDjgKlaHXG+L0Bplmmm8B9ubiezfk0A8KuJzLfKhDnaepeudw6
	6wU5HhhsbXTTgfbOcx1D88vGBA8qn3uKODNfkaJpmRatrttNQXB77vXyrvxnHGsIPGH6z09osac
	lDfpIEbc40htF7djoJXmc0pIiTmZwklq/ouWNo0LGAPrVozv+spVG/TciOBpPCCLH3RyIAPn+aF
	M5xQbaU7JQytX9D1eATsstANpgSQ5R6goWcEWFXpadtbqhNNf/LXIX8Z+5udEnCc9CLt8Xp2/q7
	jc5yQjdiOgx3uRumLjWaUxsh76yWwor4cEKRnOv5G2Z14FVJMzzvILgs4lTeNXtLEn4PSPs7+yq
	UoY7Ckij3YenmC3BnYFyBv36xoHn0D/YUq8mgwU09jcOyRFmHecftvuyYJdtqA8W4P19+sIoMQd
	abKcTnIvFixTC8U/2HqFquMTucSnqQp2vcu3Qt
X-Received: by 2002:a17:90a:15d7:b0:35b:e51a:85af with SMTP id 98e67ed59e1d1-35be51a85edmr47838a91.10.1774086461365;
        Sat, 21 Mar 2026 02:47:41 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:e896:2af1:2e77:522f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm7489501a91.2.2026.03.21.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:47:40 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 2/4] curl: patch CVE-2026-1965
Date: Sat, 21 Mar 2026 15:17:21 +0530
Message-Id: <20260321094723.273058-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260321094723.273058-1-vanusuri@mvista.com>
References: <20260321094723.273058-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 09:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233653

From: Vijay Anusuri <vanusuri@mvista.com>

pick patches from ubuntu per [1]

[1] https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-1965
[3] https://curl.se/docs/CVE-2026-1965.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-1965-1.patch           | 98 +++++++++++++++++++
 .../curl/curl/CVE-2026-1965-2.patch           | 29 ++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  2 +
 3 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
new file mode 100644
index 0000000000..1d0f5c59e8
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
index 0000000000..fa5fefd251
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
index b8fa8b5266..0e107f1e75 100644
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
 
-- 
2.25.1


