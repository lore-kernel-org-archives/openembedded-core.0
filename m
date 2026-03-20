Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2331099B53
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1902.1774048050132984349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 16:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qdw0URYN;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1598699f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774048048; x=1774652848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwSuRu/aokmURQEgNYaT6xC02QZlBOtl2GjX9NiMABs=;
        b=qdw0URYN7QZ3vt7HCizEb8Q4cq5SVXZldEk0sGOTA4Lww5kalcdNO3YSULWT9h5ob8
         16aDJ5qbMG99EKrog2edR+rx7C+UET4k7M0V7RP1f6AfMMsS3MeNc1hxQ27Abghn3zYw
         s+nDHaocN/a5mttQeA9VnRGWO0wcDe5e6E98M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048048; x=1774652848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HwSuRu/aokmURQEgNYaT6xC02QZlBOtl2GjX9NiMABs=;
        b=SqAloUTp1uZzkZIaWbLvlWz10CFnhCCrMhh5yv7C8OEAW3a/AvGk2ysDZ/9irXAySJ
         AdIqa8r+JhVbeVBl4dT+cBkAhfnALHH/2anm3cj2zoC/yOsL6DPPZe36J1FcxhB2thg1
         CalBgbR9LVjWq5M3zTUor0wblQE6qn6bWi5IQewSuxilYrrNuXfnaR9wSXOl7WTUW+DS
         sEEYZN/LE4Vm/92OzD7J7DBfD/HphDHNMku/vG1PCQHd4H/mgBTU4I8/u1gbzVooEJsm
         8DlVNkiVPTlD53LmgTRhQYyL90fa4ugNPuyuy/O7YzA421mTYzBop5SSD/eAOfJx7xdV
         PFKg==
X-Gm-Message-State: AOJu0YxF4BtIKjTZte+SYvPuVuwTe2j4rWYLfOwxZODCp+XOuqf6GQ7z
	urrpVT7Ples+SrzDICYYi4fHihyfXp2CVmQvGKN2eE6yUG7gNYXYMdSMjSi+akzn1Ui+jlNXhL0
	k8Nec
X-Gm-Gg: ATEYQzwhJGT1YrfHjVTfAtFm4tQbm5yUzXCwlBMZWhuFD3yQXAQxIxx8LmJQKHYTYFR
	/4QkWbqAX+tyxtSX/Q96Nfl6QN3Uj75TQljPY/mJod7l5UMXbaMjiYI5IKA2oPKsWwYbFfOotTE
	+kGQak4cukSdK/UAbi2gI0ofYJsg48zFP01lfCc+UvKaU/2r9PJNthHr/2s+6S7CvV0JM1lKUg8
	nAT7m+zTxZBewFmgfAy2g2XGtUALwbcTDXeOWDn7eS5vmHabYdsNASoaa91RxrYbkDVtfCykLlO
	RDKIV0iZ9+LcyJPweH4khhd6BHWiYQu1HHCo7pgSXcR+lciuQofWwrOB6wvIvmYYzCW01rb8jFe
	m4cpHEthbVPIb230fFIQ1jbcGZXrP/sIgW76nw87eLUaajiDZcL/ADvpISPzL4H18x9BzDq1qX+
	m7mGbwhIDlKtSZPIZCWDblA7xyH74qjGkiSIBv8k3XZ5LlPVJMisQcbvHMKMwdMEK5Q7J534Hbj
	tUE6y8Y1mKOb8QQFVWnNrQC0FgnC4YfB0Plrw==
X-Received: by 2002:a5d:588a:0:b0:43b:634a:8ee3 with SMTP id ffacd0b85a97d-43b642755cbmr8288803f8f.34.1774048048215;
        Fri, 20 Mar 2026 16:07:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm9238332f8f.0.2026.03.20.16.07.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:07:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 4/7] curl: patch CVE-2026-1965
Date: Sat, 21 Mar 2026 00:07:19 +0100
Message-ID: <9bccd0ef46868fc9b4b56dd885ac3a81208a8435.1774047909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774047909.git.yoann.congal@smile.fr>
References: <cover.1774047909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233640

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1].

[1] https://curl.se/docs/CVE-2026-1965.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-1965-01.patch          | 138 ++++++++++++++++++
 .../curl/curl/CVE-2026-1965-02.patch          |  29 ++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   2 +
 3 files changed, 169 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-02.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-01.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-01.patch
new file mode 100644
index 00000000000..dbfbfd7e633
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965-01.patch
@@ -0,0 +1,138 @@
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
+CVE: CVE-2026-1965
+Upstream-Status: Backport [https://github.com/curl/curl/commit/34fa034d9a390c4bd65e2d05262755ec8646ac12]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/url.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 82 insertions(+), 5 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index fac8cea732..cfe398de8b 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -792,6 +792,8 @@ struct url_conn_match {
+   BIT(may_multiplex);
+   BIT(want_ntlm_http);
+   BIT(want_proxy_ntlm_http);
++  BIT(want_nego_http);
++  BIT(want_proxy_nego_http);
+ 
+   BIT(wait_pipe);
+   BIT(force_reuse);
+@@ -1215,6 +1217,63 @@ static bool url_match_auth_ntlm(struct connectdata *conn,
+ #define url_match_auth_ntlm(c,m)    ((void)c, (void)m, TRUE)
+ #endif
+ 
++#ifdef USE_SPNEGO
++static bool url_match_auth_nego(struct connectdata *conn,
++                                struct url_conn_match *m)
++{
++  /* If we are looking for an HTTP+Negotiate connection, check if this is
++     already authenticating with the right credentials. If not, keep looking
++     so that we can reuse Negotiate connections if possible. */
++  if(m->want_nego_http) {
++    if(Curl_timestrcmp(m->needle->user, conn->user) ||
++       Curl_timestrcmp(m->needle->passwd, conn->passwd))
++      return FALSE;
++  }
++  else if(conn->http_negotiate_state != GSS_AUTHNONE) {
++    /* Connection is using Negotiate auth but we do not want Negotiate */
++    return FALSE;
++  }
++
++#ifndef CURL_DISABLE_PROXY
++  /* Same for Proxy Negotiate authentication */
++  if(m->want_proxy_nego_http) {
++    /* Both conn->http_proxy.user and conn->http_proxy.passwd can be
++     * NULL */
++    if(!conn->http_proxy.user || !conn->http_proxy.passwd)
++      return FALSE;
++
++    if(Curl_timestrcmp(m->needle->http_proxy.user,
++                       conn->http_proxy.user) ||
++       Curl_timestrcmp(m->needle->http_proxy.passwd,
++                       conn->http_proxy.passwd))
++      return FALSE;
++  }
++  else if(conn->proxy_negotiate_state != GSS_AUTHNONE) {
++    /* Proxy connection is using Negotiate auth but we do not want Negotiate */
++    return FALSE;
++  }
++#endif
++  if(m->want_ntlm_http || m->want_proxy_ntlm_http) {
++    /* Credentials are already checked, we may use this connection. We MUST
++     * use a connection where it has already been fully negotiated. If it has
++     * not, we keep on looking for a better one. */
++    m->found = conn;
++    if((m->want_nego_http &&
++        (conn->http_negotiate_state != GSS_AUTHNONE)) ||
++       (m->want_proxy_nego_http &&
++        (conn->proxy_negotiate_state != GSS_AUTHNONE))) {
++      /* We must use this connection, no other */
++      m->force_reuse = TRUE;
++      return TRUE;
++    }
++    return FALSE; /* get another */
++  }
++  return TRUE;
++}
++#else
++#define url_match_auth_nego(c, m) ((void)c, (void)m, TRUE)
++#endif
++
+ static bool url_match_conn(struct connectdata *conn, void *userdata)
+ {
+   struct url_conn_match *m = userdata;
+@@ -1258,6 +1317,11 @@ static bool url_match_conn(struct connectdata *conn, void *userdata)
+   else if(m->force_reuse)
+     return TRUE;
+ 
++  if(!url_match_auth_nego(conn, m))
++    return FALSE;
++  else if(m->force_reuse)
++    return TRUE;
++
+   if(!url_match_multiplex_limits(conn, m))
+     return FALSE;
+ 
+@@ -1324,13 +1388,26 @@ ConnectionExists(struct Curl_easy *data,
+   match.may_multiplex = xfer_may_multiplex(data, needle);
+ 
+ #ifdef USE_NTLM
+-  match.want_ntlm_http = ((data->state.authhost.want & CURLAUTH_NTLM) &&
+-                          (needle->handler->protocol & PROTO_FAMILY_HTTP));
++  match.want_ntlm_http =
++    (data->state.authhost.want & CURLAUTH_NTLM) &&
++    (needle->handler->protocol & PROTO_FAMILY_HTTP);
+ #ifndef CURL_DISABLE_PROXY
+   match.want_proxy_ntlm_http =
+-    (needle->bits.proxy_user_passwd &&
+-     (data->state.authproxy.want & CURLAUTH_NTLM) &&
+-     (needle->handler->protocol & PROTO_FAMILY_HTTP));
++    needle->bits.proxy_user_passwd &&
++    (data->state.authproxy.want & CURLAUTH_NTLM) &&
++    (needle->handler->protocol & PROTO_FAMILY_HTTP);
++#endif
++#endif
++
++#if !defined(CURL_DISABLE_HTTP) && defined(USE_SPNEGO)
++  match.want_nego_http =
++    (data->state.authhost.want & CURLAUTH_NEGOTIATE) &&
++    (needle->scheme->protocol & PROTO_FAMILY_HTTP);
++#ifndef CURL_DISABLE_PROXY
++  match.want_proxy_nego_http =
++    needle->bits.proxy_user_passwd &&
++    (data->state.authproxy.want & CURLAUTH_NEGOTIATE) &&
++    (needle->scheme->protocol & PROTO_FAMILY_HTTP);
+ #endif
+ #endif
+ 
diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-02.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-02.patch
new file mode 100644
index 00000000000..e945b83b244
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965-02.patch
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
+CVE: CVE-2026-1965
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f1a39f221d57354990e3eeeddc3404aede2aff70]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index c879a85e92..8b42aebade 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1253,7 +1253,7 @@ static bool url_match_auth_nego(struct connectdata *conn,
+     return FALSE;
+   }
+ #endif
+-  if(m->want_ntlm_http || m->want_proxy_ntlm_http) {
++  if(m->want_nego_http || m->want_proxy_nego_http) {
+     /* Credentials are already checked, we may use this connection. We MUST
+      * use a connection where it has already been fully negotiated. If it has
+      * not, we keep on looking for a better one. */
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 739838c3e88..06f4353134f 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -20,6 +20,8 @@ SRC_URI = " \
     file://CVE-2025-14819.patch \
     file://CVE-2025-15079.patch \
     file://CVE-2025-15224.patch \
+    file://CVE-2026-1965-01.patch \
+    file://CVE-2026-1965-02.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

