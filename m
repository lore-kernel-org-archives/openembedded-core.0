Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2971093187
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:56:31 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7578.1773993381830809207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VLBCzKXN;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35a211df8e3so1217842a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773993381; x=1774598181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fK47ibW46gnCtyDixxnDeE27OZIxhASjMqjTlDFihc=;
        b=VLBCzKXN0h2VOfLWl92TCJ1Ti2i9sAGg0se8geH6vrfPJGkOvKR1rgXMHsnHd/IYbK
         Bjxypnl48hgcNwzcCVaPoZC3CrfBRAuHDsuBdXKxkXZjAVk8qULBKskYB9iwFuZ4/Luj
         7Pa92DzCno9n5dR6uiN3qbs8cdyt54paG0EBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773993381; x=1774598181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fK47ibW46gnCtyDixxnDeE27OZIxhASjMqjTlDFihc=;
        b=J9FGzeI0ii0MT/iSvW2OCQ4YXQc5mxNhV9G8UyAkEfvFzdVB3qWZ/QOUIj15iGkRly
         tBpqGGUceIv8IFURDHyIWuRoEBizNIAJ4e/Kr6gvlIxCPQlBcilDRikGEztCGebMMZGn
         9am14Jo7ATnwDs8MxQXbB57BEhfAnoYiVWFsxcbrGSms1bJ84/slk7LAuu6HzqH8Wp8j
         A3M0fWnxWU89AZwzJQSM+D0BKnMKqNZDogtvmD3EJ/5mEbva+ccLlI/1krMNOQW1Jo8e
         6vbe9p78sI/dwyyFdczRFjpW1OCUml/+nSWgIJnBv3QBG5Yk8YMSzNO+vSv808ISpLBX
         2KVQ==
X-Gm-Message-State: AOJu0Yy7Zwel7kH9wJg4trs0LNzxMYFpVXW217HcXSlV6IkiXuMscu15
	BK1/xXaBuSD7enP5XCAl3wcIvA5RnnUdb73Wah3ixK59pHI/P9C4qkpsQig1HrA1LKl0pTlAd6x
	DINwHn3s=
X-Gm-Gg: ATEYQzwrUXffX4DqywFJUzrVzUG0ntyImw/4l+Mh8fFZ6vtv19SB66WMmLdjVrXNxpF
	qy3+VjB7V6+Nv6elgVB9PuUs91RIaK3hAnnIhbnFTsQKxzfzfDSTYUEkdqkJOIqXkO6hNnfs4ao
	ByPAKeoKQYoZDB+ZS5VJkZL5arEU5m43scoyoaqCHM9BRAJaJUqVBtrMwF03zhYLwd1MK+UloPP
	c/1aSBxhcc/eLwOOcX+p27syv4720CCNRmd3MLVvK3BbPET47jy2rBjMAac9Yg0Pycff0nzf6GN
	PJypIZwffFg2bUfQBQEnPXUfqnCStPDNBi0CYZ99lx07xUSjXl3YTdIpXxHEbrjnCO4lBUln3ck
	rCsMgksbOREMV6NZoXv1W4wYnuFQhrE3vn8+wjv87SJ/UDkHzJdIMg7aNQgGUoH46NfHoI+WcMZ
	krrvdxku+BCW1bbCJY2JE8P1YoaPOdB2SLBH/l
X-Received: by 2002:a17:902:ce08:b0:2ae:8077:b1c7 with SMTP id d9443c01a7336-2b0827b7c6fmr17850885ad.37.1773993380790;
        Fri, 20 Mar 2026 00:56:20 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:8f5f:34a4:6ab0:7770])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm14770965ad.23.2026.03.20.00.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:56:20 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/4] curl: Fix for CVE-2026-1965
Date: Fri, 20 Mar 2026 13:26:02 +0530
Message-Id: <20260320075604.551251-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260320075604.551251-1-vanusuri@mvista.com>
References: <20260320075604.551251-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233585

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2026-1965

Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
Upstream commit https://github.com/curl/curl/commit/34fa034d9a390c4bd6 &
https://github.com/curl/curl/commit/f1a39f221d57354990]

Reference: https://curl.se/docs/CVE-2026-1965.html
           https://ubuntu.com/security/CVE-2026-1965

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-1965-1.patch           | 99 +++++++++++++++++++
 .../curl/curl/CVE-2026-1965-2.patch           | 30 ++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  2 +
 3 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
new file mode 100644
index 0000000000..72bf1bca7f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
@@ -0,0 +1,99 @@
+Backport of:
+
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
+Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
+Upstream commit https://github.com/curl/curl/commit/34fa034d9a390c4bd6]
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
index 0000000000..25f419eea4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
@@ -0,0 +1,30 @@
+Backport of:
+
+From f1a39f221d57354990e3eeeddc3404aede2aff70 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 21 Feb 2026 18:11:41 +0100
+Subject: [PATCH] url: fix copy and paste url_match_auth_nego mistake
+
+Follow-up to 34fa034
+Reported-by: dahmono on github
+Closes #20662
+
+Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
+Upstream commit https://github.com/curl/curl/commit/f1a39f221d57354990]
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


