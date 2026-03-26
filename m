Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F7F106F317
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:05:00 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43939.1774519492865706590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SMH61FDR;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6678; q=dns/txt;
  s=iport01; t=1774519492; x=1775729092;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=w2/VV6ihW8IQY6p8HAhYFYT1BPeJ5Bbryz3ID2NwdyQ=;
  b=SMH61FDRT0E4QCnluU64M5dFhcgaN2u5Pvj66wTLiG5OEeUGGDwoQszp
   B7vDwZdy0injGF3B5VVJtsPUSRNiXbAAUP3rQFyEK14i2C6uX+O/Lq0AY
   lWMTgunPIf8c4t35HXHDiGiwoKr/Y6x5sqpb4zf2b51ed48JDzE0S9btp
   thqq5oooW97+Kqev9AaMlnwT01h6ZFDb67gH1rgRW14plgHSwEQAQhlSt
   RtLYmggwt1W7/ThjExWqlUKhjlBeBGOBMRxw3Jifk05QPj/Wbf/PIhg70
   BQvKjbeTV3cUOe7EcJw1vVY6CehBxvPjYwh7xzuEXPHOS18BrqekT1z1m
   g==;
X-CSE-ConnectionGUID: g/yzNQ3aTc2n0lWkopFx3A==
X-CSE-MsgGUID: 3rboH2NqSr6JfzeGIyj3uQ==
X-IPAS-Result: =?us-ascii?q?A0AzCQBPBMVp/4v/Ja1aglmCSA9xXkNJA5QngiEDnhqBf?=
 =?us-ascii?q?w8BAQEPRA0EAQGFBwKNIwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECLysjCBmDAgGCcwMRBrJzg?=
 =?us-ascii?q?XkzgQGDKAExBQkCAkABT9smAQsUAYE4hTyIG1sYAYR6JxsbgXKBFYNogQWBX?=
 =?us-ascii?q?AEBAYEmhn0EgiKBDoEST4NXBowdSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgWAPiG10bYEThBEoAwsYDUgRLDcUGwQ+bgeMSTGBZ00BBScEM?=
 =?us-ascii?q?C0BByIBAYIDKRELkxxCkXqhDgoog3SMHpU6GjOFW6UQmQaOCZU2MmiEaIFoP?=
 =?us-ascii?q?IFHCwdwFYMiCRYzGQ+OOINpgX+EQcJOJjICAQEBBgMvAQEHAgcNAwuBaJAAg?=
 =?us-ascii?q?X0BAQ?=
IronPort-Data: A9a23:KVBMGajvpNBFeAJyszV+o9oKX161MREKZh0ujC45NGQN5FlHY01je
 htvWD3VM/eJZ2CjfN1+PYuy8UxT68SDnYVmTQNk/io8QyhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMsPje8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUXvfdlJ1gV/
 MATcjZVai+AgPqY0OmSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglHkbjFFrViVrII84nPYy0p6172F3N/9JYTSG5UMxxvGz
 o7A1z/jCBY6bvqG8iDb0Hy+i8DujCGgRbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:UeD1dK0Ppc09U3GEC3UNQwqjBLMkLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80l6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddm2wUMqyXMbC85vyKhzWFLw==
X-Talos-CUID: 9a23:uTx8kmG+Q7j242w0qmJos18GPPl+e0HWlnGIJ3C7Dn5HWOa8HAo=
X-Talos-MUID: 9a23:Qkos0AiEHuxJAPPu3W5KfcMpb91i5IT0Llk2i8sktduJGg1hOWyAtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,141,1770595200"; 
   d="scan'208";a="700681156"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Mar 2026 10:04:51 +0000
Received: from sjc-ads-7443.cisco.com (sjc-ads-7443.cisco.com [10.30.220.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id C02021800036D
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:04:51 +0000 (GMT)
Received: by sjc-ads-7443.cisco.com (Postfix, from userid 1840713)
	id 66508CCD9B4; Thu, 26 Mar 2026 03:04:51 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 1/3] curl: fix CVE-2026-1965
Date: Thu, 26 Mar 2026 03:00:00 -0700
Message-ID: <20260326100000.2619253-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260326044647.2001828-3-sudumbha@cisco.com>
References: <20260326044647.2001828-3-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.228, sjc-ads-7443.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233960

From: Sudhir Dumbhare <sudumbha@cisco.com>

Applying the fixes from upstream commit [3] and [4] cause merge conflicts
and require other dependent commits to be backported. Instead, backport
the Ubuntu-provided patches [1], which fixes the vulnerability as mentioned
in changelog [2].

[1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
    debian/patches/CVE-2026-1965-1.patch
    debian/patches/CVE-2026-1965-2.patch
[2] https://changelogs.ubuntu.com/changelogs/pool/main/c/curl/curl_8.5.0-2ubuntu10.8/changelog
[3] https://github.com/curl/curl/commit/34fa034d9a390c4bd65e2d05262755ec8646ac12
[4] https://github.com/curl/curl/commit/f1a39f221d57354990e3eeeddc3404aede2aff70

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-1965
https://curl.se/docs/CVE-2026-1965.html
https://ubuntu.com/security/CVE-2026-1965

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
Changes from v1 -> v2:
- Updated with the correct patch series numbering

 .../curl/curl/CVE-2026-1965_p1.patch          | 98 +++++++++++++++++++
 .../curl/curl/CVE-2026-1965_p2.patch          | 30 ++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  2 +
 3 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch
new file mode 100644
index 0000000000..8079b453eb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch
@@ -0,0 +1,98 @@
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
+CVE: CVE-2026-1965
+Upstream-Status: Backport [https://github.com/curl/curl/commit/34fa034d9a390c4bd65e2d05262755ec8646ac12]
+
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ lib/url.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 82 insertions(+), 5 deletions(-)
+
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -935,6 +935,18 @@ ConnectionExists(struct Curl_easy *data,
+   bool wantProxyNTLMhttp = FALSE;
+ #endif
+ #endif
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
++#endif
+   /* plain HTTP with upgrade */
+   bool h2upgrade = (data->state.httpwant == CURL_HTTP_VERSION_2_0) &&
+     (needle->handler->protocol & CURLPROTO_HTTP);
+@@ -1272,6 +1284,56 @@ ConnectionExists(struct Curl_easy *data,
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
+     if(CONN_INUSE(check)) {
+       DEBUGASSERT(canmultiplex);
+       DEBUGASSERT(check->bits.multiplex);
diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch
new file mode 100644
index 0000000000..1fdb658f23
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch
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
+CVE: CVE-2026-1965
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f1a39f221d57354990e3eeeddc3404aede2aff70]
+
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1317,7 +1317,7 @@ ConnectionExists(struct Curl_easy *data,
+     continue;
+   }
+ #endif
+-  if(wantNTLMhttp || wantProxyNTLMhttp) {
++  if(wantNegohttp || wantProxyNegohttp) {
+     /* Credentials are already checked, we may use this connection. We MUST
+      * use a connection where it has already been fully negotiated. If it has
+      * not, we keep on looking for a better one. */
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 9e37684b2c..e2f6f8472f 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -32,6 +32,8 @@ SRC_URI = " \
     file://CVE-2025-14819.patch \
     file://CVE-2025-15079.patch \
     file://CVE-2025-15224.patch \
+    file://CVE-2026-1965_p1.patch \
+    file://CVE-2026-1965_p2.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.44.4


