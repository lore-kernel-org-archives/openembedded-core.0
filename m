Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038F5109E54B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 04:47:38 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41267.1774500453076487260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 21:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UovjuIhi;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6601; q=dns/txt;
  s=iport01; t=1774500453; x=1775710053;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L9G56wJ2nV4sFkrLEl13KDQtwGlXnFw7Yi1h53z+v+0=;
  b=UovjuIhi3x8G8oJTgzQsHMgqf2ssRYQXnYsUZ/rl1M/gzOCXTbLiBgoL
   J+VZMCBbJqqmya4ZswhNMbGLZcXrvinkjAyAG3NnMU4Pg6HdgTKA3TODs
   ia+YJwzmRfNqgFWI29uzec3ew0nAtHyytszbew7GW/mm3TgbWdWrISXP4
   tk8x6eLUAJ1IgcBdn/8l54tIbcnICzoevciCuOJA/h5PcmPgYqaR1r6KT
   wy4tN2AVIY+9RNQ36phJ1g8XUQYRPfhszTbqYYZaUYyM8rKAOr5W1bpni
   9FnzUOoYuLKpqr983fN16KyrZBh9eYNQS6RU83HBwSkiwt08AcC1IRJwu
   Q==;
X-CSE-ConnectionGUID: 1Q+kzXaYSRGTmdrU94ErLw==
X-CSE-MsgGUID: MIykGIQBTMOLq2LeCAziVQ==
X-IPAS-Result: =?us-ascii?q?A0BDCgBmucRp/5X/Ja1aglmCSA9xXkNJA5QngiGeHYF/D?=
 =?us-ascii?q?wEBAQ9EDQQBAZIsAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAS0LARgBWQMBAlojIYMCAYJzAxEGsR+BeTOBAYMoATEFC?=
 =?us-ascii?q?QICQAFP2yYBCxQBgTiFPIgbWxgBhHonGxuBcoEVg2iBBYFcAQEBgSaGfQSCI?=
 =?us-ascii?q?oEOgRJPg3sGjCBIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWCB?=
 =?us-ascii?q?A+IbXRtgROEFigDCxgNSBEsNxQbBD5uB4xeM4FnTQEFJwQwLQEHIgEBggMpE?=
 =?us-ascii?q?QuTHEKReqEOCiiDdIwelToaM4VbpRCZBo4JlTYyaIRogWg8gUcLB3AVgyIJF?=
 =?us-ascii?q?jMZD444g2mBf4RBwnwmMgIBAQEGAy8BAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:POi06Krd/WPNktKQGNYjYBssPxZeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmAaamIZWL0fd4nPYiy900Pv5PXndBnTQZs+H8yQitB8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrY8k435pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0r9OQmJcx
 fUpEwoiUhWPnd/nnJ+hbvY506zPLOGzVG8ekmtrwTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWfrSn8/w7pX7WyZFpE+Qr6o+y2PS1wd2lrPqNbI5f/TUFJoExh7J/
 TOuE2LRJzALN/O+8BC511WIn7XrkAjSSoMsLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:YNNfX6vPEF+7J3P8xjvUsSsh7skDY9V00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBEDjexLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowEJ30bFh4pgPW
 AKSdkaNOHN
X-Talos-CUID: 9a23:sqG5rW191DCLEebDT26/zbxfQ/lmcW/txUbrGWCEDGpzdezJZEW05/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AF/SyIw+DaKIGbZGv+9YelbiQf+JJ8qeBKXknrbA?=
 =?us-ascii?q?hn9DeESFbEiWcsg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,141,1770595200"; 
   d="scan'208";a="697900939"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Mar 2026 04:47:32 +0000
Received: from sjc-ads-7443.cisco.com (sjc-ads-7443.cisco.com [10.30.220.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id F06311800027C
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 04:47:31 +0000 (GMT)
Received: by sjc-ads-7443.cisco.com (Postfix, from userid 1840713)
	id 949A0CCD9B4; Wed, 25 Mar 2026 21:47:31 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/1] curl: fix CVE-2026-1965
Date: Wed, 25 Mar 2026 21:46:48 -0700
Message-ID: <20260326044647.2001828-3-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.228, sjc-ads-7443.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 04:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233948

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


