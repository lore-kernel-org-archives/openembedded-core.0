Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AD8C56201
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:31:34 +0000 (UTC)
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35946.1785918684558686818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Haz9fzzm;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9614; q=dns/txt;
  s=iport01; t=1785918684; x=1787128284;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UEpsFpHZo4TGgo6FmGtHUQvqse7sMUIe4BXcmLMdKo0=;
  b=Haz9fzzm/VSHkyp5PvuVvnujv/u61h/KlRqHexD5PWyEDSH2EhDEhM8i
   QgCIDNZSVY2pIlhO1/kDltz1pOQmdbXw45cSttKwIlujsVoIe7Af8nZ+u
   E1zNgcXiEg+fn+RHlpOzgvwhFMPqxqTqz5+4yzwQFB1AG0whKBbxBfySw
   Kwws9MdM0h+VmlmGngW8Y+HNGx13IQ53IXTqfy6i76Z00YH6Z3/Pl5VoT
   r6T67zaaRp4Its/XZE0w+ZgHI45Xe6bw3WB+zL+i8P/oQmtVPBysrx4W9
   piibEgVVUzlmS47UwwzeDlkDITkQBDRdsD4zHB0TkgAupiE2eP9uT584r
   w==;
X-CSE-ConnectionGUID: CxL9Quu5TbCLJ3sOKERHyA==
X-CSE-MsgGUID: 9ilXUFlwTnaLGybSeap/Hg==
X-IPAS-Result: =?us-ascii?q?A0BIAgCA83Jq/9BK/pBRCR4BAQsSDIIFC4JXdF9CSZQpg?=
 =?us-ascii?q?iEDnhuBfg8BAQEPRA0EAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLARgBPRwDAQIZFisjCBEIgwIBgnQDE?=
 =?us-ascii?q?Qa9WoF5M4EBgygBPwICQAFQ2y4BCxQBgTiFP4ghXRgBhHwnGxuBcoEVg2mBB?=
 =?us-ascii?q?YFcAgGBMxQJX4V1BIIigQyBWoJCjjVIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBwWBHYEohG0jGTZ8gQlegS0qZRIXgQmCewKCem8LGA1IESw3F?=
 =?us-ascii?q?BkEPm4HjWgggj8BYS0BKQEBLyGBXBEFBgGTLJAMgh6hEgoog3WMIZU6GjOqb?=
 =?us-ascii?q?JkIjgqVNoEahGmBaDyBWXAVgyIJFjQZD1aNVwsLg2CGQMVhPDUCCTIBAQcCB?=
 =?us-ascii?q?w4DC4FokAIkgVgBAQ?=
IronPort-Data: A9a23:tKgMsK+dJ+ROKB9pBNUWDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TNMWG+HafqPZGH3L9t0YIS+908H6pbVm9BgSAA6+3tEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjpJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kdLalJw/tqXF1E3
 tg6cysqTT25p/OflefTpulE3qzPLeHiMZlavjRryivUSK55B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YM3WjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwboqKJoLWH625mG7Jp
 2b2wkr9HS0cPfiw2DC+/3u0wc/AyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:l99znqqS9Sh2RoIqJYlojHAaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:Sdmr2m0q3/cIvYuJfZmS1LxfMdABI0TA0SrsKWScKz1yb564c3+B0fYx
X-Talos-MUID: 9a23:xIyzjAm5sS4WnWl0VfOBdnozNcNY3oqqF3wLmLEpqsO/OCVofBeS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="56874642"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:31:20 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 2C80D1800020D
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:31:20 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id E7E02CC037D; Wed,  5 Aug 2026 14:01:18 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 5/8] curl: fix CVE-2026-8458
Date: Wed,  5 Aug 2026 14:01:00 +0530
Message-Id: <20260805083103.2633995-6-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805083103.2633995-1-deeratho@cisco.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242843

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream curl security fix backport for
CVE-2026-8458. The upstream fix commit is referenced in [1],
and the public curl advisory is referenced in [2]. The backported
commit link is also recorded in the embedded patch header.

[1] https://github.com/curl/curl/commit/5e99b73cf441d9c369768b9cd48b5389b9a2503d
[2] https://curl.se/docs/CVE-2026-8458.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../curl/curl/CVE-2026-8458.patch             | 202 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 203 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8458.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8458.patch b/meta/recipes-support/curl/curl/CVE-2026-8458.patch
new file mode 100644
index 0000000000..6340f5305f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8458.patch
@@ -0,0 +1,202 @@
+From 01ce94b67888e6efa4196247302e59cf68e77b2d Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Mon, 13 Jul 2026 23:13:37 -0700
+Subject: [PATCH] creds: add sasl service name
+
+The SASL service name, used in authentication, is part of curl's credentials
+when authenticating to a server/proxy. Make it part of `struct Curl_creds`.
+
+Change code to use `creds` to obtain a service name. By tying creds used
+to the connection, connection reuse is also only allowed when the service
+name matches.
+
+Closes #21585
+
+CVE: CVE-2026-8458
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5e99b73cf441d9c369768b9cd48b5389b9a2503d]
+
+Backport Changes:
+- Wrynose curl 8.19.0 does not have upstream struct Curl_creds.
+  This backport stores the optional SASL service name on the existing
+  connectdata/proxy_info structures and compares it during connection
+  reuse for the same security behavior.
+- Omitted the upstream unit1304 Curl_creds_create() signature
+  adjustment because Wrynose 8.19.0 does not contain Curl_creds.
+
+(cherry picked from commit 5e99b73cf441d9c369768b9cd48b5389b9a2503d)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c     | 61 ++++++++++++++++++++++++++++++++++++++++++++++-----
+ lib/urldata.h |  2 ++
+ 2 files changed, 58 insertions(+), 5 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 6c1375f8e3..35f467daf2 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -535,12 +535,15 @@ void Curl_conn_free(struct Curl_easy *data, struct connectdata *conn)
+   Curl_safefree(conn->socks_proxy.user);
+   Curl_safefree(conn->http_proxy.passwd);
+   Curl_safefree(conn->socks_proxy.passwd);
++  Curl_safefree(conn->http_proxy.sasl_service_name);
++  Curl_safefree(conn->socks_proxy.sasl_service_name);
+   Curl_safefree(conn->http_proxy.host.rawalloc); /* http proxy name buffer */
+   Curl_safefree(conn->socks_proxy.host.rawalloc); /* socks proxy name buffer */
+ #endif
+   Curl_safefree(conn->user);
+   Curl_safefree(conn->passwd);
+   Curl_safefree(conn->sasl_authzid);
++  Curl_safefree(conn->sasl_service_name);
+   Curl_safefree(conn->options);
+   Curl_safefree(conn->oauth_bearer);
+   Curl_safefree(conn->host.rawalloc); /* hostname buffer */
+@@ -593,7 +596,9 @@ static bool proxy_info_matches(const struct proxy_info *data,
+      curl_strequal(data->host.name, needle->host.name)) {
+ 
+     if(Curl_timestrcmp(data->user, needle->user) ||
+-       Curl_timestrcmp(data->passwd, needle->passwd))
++       Curl_timestrcmp(data->passwd, needle->passwd) ||
++       Curl_timestrcmp(data->sasl_service_name,
++                       needle->sasl_service_name))
+       return FALSE;
+     return TRUE;
+   }
+@@ -1035,6 +1040,8 @@ static bool url_match_auth(struct connectdata *conn,
+     if(Curl_timestrcmp(m->needle->user, conn->user) ||
+        Curl_timestrcmp(m->needle->passwd, conn->passwd) ||
+        Curl_timestrcmp(m->needle->sasl_authzid, conn->sasl_authzid) ||
++       Curl_timestrcmp(m->needle->sasl_service_name,
++                       conn->sasl_service_name) ||
+        Curl_timestrcmp(m->needle->oauth_bearer, conn->oauth_bearer)) {
+       /* one of them was different */
+       return FALSE;
+@@ -1116,7 +1123,9 @@ static bool url_match_auth_ntlm(struct connectdata *conn,
+      partway through a handshake!) */
+   if(m->want_ntlm_http) {
+     if(Curl_timestrcmp(m->needle->user, conn->user) ||
+-       Curl_timestrcmp(m->needle->passwd, conn->passwd)) {
++       Curl_timestrcmp(m->needle->passwd, conn->passwd) ||
++       Curl_timestrcmp(m->needle->sasl_service_name,
++                       conn->sasl_service_name)) {
+       /* we prefer a credential match, but this is at least a connection
+          that can be reused and "upgraded" to NTLM if it does
+          not have any auth ongoing. */
+@@ -1147,7 +1156,9 @@ static bool url_match_auth_ntlm(struct connectdata *conn,
+     if(Curl_timestrcmp(m->needle->http_proxy.user,
+                        conn->http_proxy.user) ||
+        Curl_timestrcmp(m->needle->http_proxy.passwd,
+-                       conn->http_proxy.passwd))
++                       conn->http_proxy.passwd) ||
++       Curl_timestrcmp(m->needle->http_proxy.sasl_service_name,
++                       conn->http_proxy.sasl_service_name))
+       return FALSE;
+   }
+   else if(conn->proxy_ntlm_state != NTLMSTATE_NONE) {
+@@ -1188,7 +1199,9 @@ static bool url_match_auth_nego(struct connectdata *conn,
+      so that we can reuse Negotiate connections if possible. */
+   if(m->want_nego_http) {
+     if(Curl_timestrcmp(m->needle->user, conn->user) ||
+-       Curl_timestrcmp(m->needle->passwd, conn->passwd))
++       Curl_timestrcmp(m->needle->passwd, conn->passwd) ||
++       Curl_timestrcmp(m->needle->sasl_service_name,
++                       conn->sasl_service_name))
+       return FALSE;
+   }
+   else if(conn->http_negotiate_state != GSS_AUTHNONE) {
+@@ -1207,7 +1220,9 @@ static bool url_match_auth_nego(struct connectdata *conn,
+     if(Curl_timestrcmp(m->needle->http_proxy.user,
+                        conn->http_proxy.user) ||
+        Curl_timestrcmp(m->needle->http_proxy.passwd,
+-                       conn->http_proxy.passwd))
++                       conn->http_proxy.passwd) ||
++       Curl_timestrcmp(m->needle->http_proxy.sasl_service_name,
++                       conn->http_proxy.sasl_service_name))
+       return FALSE;
+   }
+   else if(conn->proxy_negotiate_state != GSS_AUTHNONE) {
+@@ -3196,6 +3211,11 @@ static void url_conn_reuse_adjust(struct Curl_easy *data,
+     needle->user = NULL;
+     needle->passwd = NULL;
+   }
++  if(needle->sasl_service_name) {
++    curlx_free(conn->sasl_service_name);
++    conn->sasl_service_name = needle->sasl_service_name;
++    needle->sasl_service_name = NULL;
++  }
+ 
+ #ifndef CURL_DISABLE_PROXY
+   conn->bits.proxy_user_passwd = needle->bits.proxy_user_passwd;
+@@ -3214,6 +3234,17 @@ static void url_conn_reuse_adjust(struct Curl_easy *data,
+     needle->http_proxy.passwd = NULL;
+     needle->socks_proxy.passwd = NULL;
+   }
++  if(needle->http_proxy.sasl_service_name ||
++     needle->socks_proxy.sasl_service_name) {
++    curlx_free(conn->http_proxy.sasl_service_name);
++    curlx_free(conn->socks_proxy.sasl_service_name);
++    conn->http_proxy.sasl_service_name =
++      needle->http_proxy.sasl_service_name;
++    conn->socks_proxy.sasl_service_name =
++      needle->socks_proxy.sasl_service_name;
++    needle->http_proxy.sasl_service_name = NULL;
++    needle->socks_proxy.sasl_service_name = NULL;
++  }
+ #endif
+ 
+   /* Finding a connection for reuse in the cpool matches, among other
+@@ -3283,6 +3314,15 @@ static CURLcode url_create_needle(struct Curl_easy *data,
+     }
+   }
+ 
++  if(data->set.str[STRING_SERVICE_NAME]) {
++    needle->sasl_service_name =
++      curlx_strdup(data->set.str[STRING_SERVICE_NAME]);
++    if(!needle->sasl_service_name) {
++      result = CURLE_OUT_OF_MEMORY;
++      goto out;
++    }
++  }
++
+   if(data->set.str[STRING_BEARER]) {
+     needle->oauth_bearer = curlx_strdup(data->set.str[STRING_BEARER]);
+     if(!needle->oauth_bearer) {
+@@ -3310,6 +3350,17 @@ static CURLcode url_create_needle(struct Curl_easy *data,
+   if(result)
+     goto out;
+ 
++  if(data->set.str[STRING_PROXY_SERVICE_NAME]) {
++    result = Curl_setstropt(&needle->http_proxy.sasl_service_name,
++                            data->set.str[STRING_PROXY_SERVICE_NAME]);
++    if(result)
++      goto out;
++    result = Curl_setstropt(&needle->socks_proxy.sasl_service_name,
++                            data->set.str[STRING_PROXY_SERVICE_NAME]);
++    if(result)
++      goto out;
++  }
++
+   /*************************************************************
+    * If the protocol is using SSL and HTTP proxy is used, we set
+    * the tunnel_proxy bit.
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 6c6c83969c..1c369a54f2 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -586,6 +586,7 @@ struct proxy_info {
+   uint8_t proxytype; /* what kind of proxy that is in use */
+   char *user;    /* proxy username string, allocated */
+   char *passwd;  /* proxy password string, allocated */
++  char *sasl_service_name; /* SASL service name, allocated */
+ };
+ 
+ /*
+@@ -628,6 +629,7 @@ struct connectdata {
+   char *passwd;  /* password string, allocated */
+   char *options; /* options string, allocated */
+   char *sasl_authzid;     /* authorization identity string, allocated */
++  char *sasl_service_name; /* SASL service name, allocated */
+   char *oauth_bearer; /* OAUTH2 bearer, allocated */
+   struct curltime created; /* creation time */
+   struct curltime lastused; /* when returned to the connection poolas idle */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 994b1cff28..33ccb73eb3 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2026-8927.patch \
     file://CVE-2026-8932-dependent.patch \
     file://CVE-2026-8932.patch \
+    file://CVE-2026-8458.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


