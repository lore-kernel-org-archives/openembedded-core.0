Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A97C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 10:57:08 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6348.1784545020773216981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 03:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Hyi4lTr2;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2814; q=dns/txt;
  s=iport01; t=1784545023; x=1785754623;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K6BgUpiPtEhUkEnr3RrzDnjohjyceF3IzTVOvVBzo3U=;
  b=Hyi4lTr2cyx0N6AFU4MUiOcS0VoPy9XACQNJ/FHgXoBT//qGlk1LO6H2
   3B0infff8etw9mVsZleUbC8WxXA4JKP/v2P4BJTdYQQlYJzI9DXTn6fQn
   zdvbuQPrp6TxAUocOaoCNWRXwZgb8japO6KXURCiblTOEWaaAh8tOGtQl
   1C0FKdTRIKjqshJ40/H8peN8SUpeSrlHHPbcwQhyMkmzA5Gdbp0tIvxXT
   ks2vyMcdlHoQKTB5CNWJQ2TkDGLf9TNPxthFCWCv3wHOUhMA6RHFDYCgU
   KDtbjQBPAmTF1wRvZD4m9NjdopEocAKkE6YKIepr0bdnoJiZtFojCe7OG
   A==;
X-CSE-ConnectionGUID: QBJq+rLFRiCNBgp4TujyxQ==
X-CSE-MsgGUID: QmThPRtoR9yWdHN88aSH1A==
X-IPAS-Result: =?us-ascii?q?A0BIAgCp/V1q/4z/Ja1aglmCV3RfQkmUKYIhA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAT0cAwECLysjCBEIgwIBgnQDEQa8PoF5M4EBg?=
 =?us-ascii?q?ygBMQUJAgJAAVDbLgELFAGBOIU/iCBcGAGEfCcbG4FygRWDaYEFgVwBAQGBU?=
 =?us-ascii?q?FyFeASCIoEMgVqQEkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgTqBAoR3Ix8DOX+BMHVKdy1qEheBJoNLAgcDCxgNSBEsNxQZBD5uB408I?=
 =?us-ascii?q?4I/AWAtASkCIIIdBQalV6ESCiiDdYwhlToaM6psmQiOCpZQhGmBaDyBRwsHc?=
 =?us-ascii?q?BWDIgkWNBkPjjiDa4F/hEHFVjw1AgkyAQEHAgcOAwuBaJACgXwBAQ?=
IronPort-Data: A9a23:UFQ+aquosq8+OwudEL39KFz/cefnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWiGOv6IazenfdkkbI3io0oGuZOAndM1HlA5+CE2Fi1BgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Z8Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIww8xVGCJU0
 dIiKRsrRB+b296rwqOrc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtPYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoDbFZkKwRrA+
 Aoq+UzABy0aDOaDzgDU402gpsmfzSrAeNs7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:RkH6YqoNLVSn+8UwEx/TY2AaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:Tszik28CyvDKx8ksSJ+Vv3c+ONlmaFnz9nb7BWW3ETpVVb+EWWbFrQ==
X-Talos-MUID: 9a23:oN98zgUrQsMKmGzq/AbpuDFaDttv2fW/N0wtt8VWsvKkbAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="498477406"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 10:57:03 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 06EC9180005AE
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:03 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 28DC6CC037D; Mon, 20 Jul 2026 16:27:01 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/5] curl: fix CVE-2026-5545
Date: Mon, 20 Jul 2026 16:26:44 +0530
Message-Id: <20260720105647.2451180-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720105647.2451180-1-deeratho@cisco.com>
References: <20260720105647.2451180-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241354

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix [1] for the Negotiate-authenticated connection
reuse issue described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd
[2] https://curl.se/docs/CVE-2026-5545.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-5545

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../curl/curl/CVE-2026-5545.patch             | 43 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5545.patch b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
new file mode 100644
index 0000000000..bb3b1407d4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
@@ -0,0 +1,43 @@
+From 33e43985b8f3b9e66691d06e70be0395849856cd Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 2 Apr 2026 11:33:39 +0200
+Subject: [PATCH] url: improve connection reuse on negotiate
+
+Check state of negotiate to allow proper connection reuse.
+
+Closes #21203
+
+CVE: CVE-2026-5545
+Upstream-Status: Backport [https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd]
+
+(cherry picked from commit 33e43985b8f3b9e66691d06e70be0395849856cd)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index b9e308a..7c24f1a 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1110,11 +1110,17 @@ static bool url_match_auth_ntlm(struct connectdata *conn,
+   if(m->want_ntlm_http) {
+     if(Curl_timestrcmp(m->needle->user, conn->user) ||
+        Curl_timestrcmp(m->needle->passwd, conn->passwd)) {
+-
+       /* we prefer a credential match, but this is at least a connection
+-         that can be reused and "upgraded" to NTLM */
+-      if(conn->http_ntlm_state == NTLMSTATE_NONE)
++         that can be reused and "upgraded" to NTLM if it does
++         not have any auth ongoing. */
++#ifdef USE_SPNEGO
++      if((conn->http_ntlm_state == NTLMSTATE_NONE)
++         && (conn->http_negotiate_state == GSS_AUTHNONE)) {
++#else
++      if(conn->http_ntlm_state == NTLMSTATE_NONE) {
++#endif
+         m->found = conn;
++      }
+       return FALSE;
+     }
+   }
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 1cda69401b..558a2d311e 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://CVE-2026-6276.patch \
     file://CVE-2026-5773.patch \
     file://mbedtls.patch \
+    file://CVE-2026-5545.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


