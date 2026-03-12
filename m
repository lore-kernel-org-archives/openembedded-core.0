Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1006106ACF4
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 23:05:37 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3874.1773356734491661289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 16:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=G0JuGnDr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260312230532a04b1fb0e800020760-wv4jwl@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260312230532a04b1fb0e800020760
        for <openembedded-core@lists.openembedded.org>;
        Fri, 13 Mar 2026 00:05:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JY2e3+W1GyI802T42BMmmOeMnureB1EjQX94hoKinj0=;
 b=G0JuGnDrKkW3BEIGLTZK05twnwBbMMDiWamCaluRXiSKHoNPGnrsAlmdH8WJaLToqWsmUq
 yvropBSGjFB6GqvXaYY9KN0ZTDVlU9tGdZ4wkVcw95c6Le91G3FA86jmw1RUmLkXaiVw3I+0
 GM/H+VaUSXpeJzAF5l2IAwQu4mbOZDaTX8AKg20OyeVzbUI9rwd2GiaqYSbDiyixe9d4+cEB
 tng3CUyhuJ+z2sweZf73Bk5Yor/2i+MkMYxaCxVOyJSqgX9AqdEIPe2LrsYzrPJe/bo6MQEE
 lKnJCCEeic68ZZZDtNn4DYAo/X5j67Ds7zYeAnLTQaTo3ydlZpuwDakg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 1/4] curl: patch CVE-2026-1965
Date: Fri, 13 Mar 2026 00:05:01 +0100
Message-Id: <20260312230504.76461-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 23:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233007

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1].

[1] https://curl.se/docs/CVE-2026-1965.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-1965-01.patch          | 138 ++++++++++++++++++
 .../curl/curl/CVE-2026-1965-02.patch          |  29 ++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   2 +
 3 files changed, 169 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-01.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-02.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-01.patch b/meta/recipes-support/curl/curl/CVE-2026-1965-01.patch
new file mode 100644
index 0000000000..dbfbfd7e63
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
index 0000000000..e945b83b24
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
index 739838c3e8..06f4353134 100644
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

