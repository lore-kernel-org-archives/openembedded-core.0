Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B4EC55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 06:16:23 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.844.1785478580195823213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 23:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gu2se97s;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3168; q=dns/txt;
  s=iport01; t=1785478580; x=1786688180;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=v7h8V05+2yJiLPPj7qbwG2zwM2yiWbO+YoLo2hTU+Wo=;
  b=gu2se97siv284QL4PzYfoBPo5sTpAeZzQupwhJyX0TdJGT0IwibD5T/+
   1jVu2cXC7yIy4VpobZazTYkUpAGwLzNAZhcOJpspBZ3kBpX7Q2w0nGSmH
   A7bNucodLUwgm1E4g6xY13GGKTS+QpxkE/gUH08sw0sGyBmklDQTWnnX6
   wAvdEGExiMLBTlvZ1X/Ep0p29DkaWaPSrHKb/W4zb7LsC9cYULszFXeWk
   Z6gw02eNQG23jWFoyeTmf7j+46dJImvsijaMLtKQI+9Z9Yywk7JN9+F4B
   ZWBwtq+7xHcNHXeaEv2dWROndJ/sQp7juqmh4IfBIX+vFaqvjod22Gbwk
   A==;
X-CSE-ConnectionGUID: YwGDK3FER027sr2BqPk+Vw==
X-CSE-MsgGUID: Hgon9H4iQ4m1HuKz/gutVA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDZPGxq/5X/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeG4F+DwEBAQ9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgRCIMCAYJ0AxEGu?=
 =?us-ascii?q?zCBeTOBAYMoAT8CAkABUNsuAQsUAYE4hT+IIFwYAYR8JxsbgXKEfoEFgVwCA?=
 =?us-ascii?q?YEmhn4EgiKBDIFakFtIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bB?=
 =?us-ascii?q?wWBHYErL4RTIxk2fIEvdUp1LWoSF4EagzECgl8DCxgNSBEsNxQZBD5uB41pI?=
 =?us-ascii?q?IF6RWEtASkCggMBAQ4qkyaSPKESCiiDdYwhlToaM6psmQiOCpZQhGmBaDyBW?=
 =?us-ascii?q?XAVgyIJFjQZD444g2uGQMgCPDUCCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:AE5wYak4H52fiwE+vgt2u+/o5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNX22HP/iDNzH9KYh3OoW28kJVvJTdzt9lTlQ6/nw9EVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsPrb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbwH1cpUWk9jz
 6RCdysXNDqav+H1/q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKII4LRGJoLwh7wS
 mTu32v+BEA6aN2mlT/c0m+PlKjAgD/FcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Fxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:Ni+7fKHmrlnukKfjpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AEGpf7Wt6CNiM4N3N+QRjNe5Y6IsUbVLx7yz+DnX?=
 =?us-ascii?q?gUzlyUue/UGeTu517xp8=3D?=
X-Talos-MUID: 9a23:5XoUzgYVjB05WeBTlzDrgmBCaMZRv6H3KF0ug9IJptW6HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="516357640"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 06:16:09 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 0D6AF180001D0
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 06:16:09 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 1CB44CC037D; Fri, 31 Jul 2026 11:46:07 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v4] curl: fix CVE-2026-4873
Date: Fri, 31 Jul 2026 11:44:27 +0530
Message-Id: <20260731061427.14543-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260727120136.3147887-1-deeratho@cisco.com>
References: <20260727120136.3147887-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 06:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242409

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-4873.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865
[2] https://curl.se/docs/CVE-2026-4873.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v3 to v4: Addressed the review comments and make sure
that patch is having context lines and rebased on top of latest wrynose commits
 .../curl/curl/CVE-2026-4873.patch             | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
new file mode 100644
index 0000000000..b288de9306
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
@@ -0,0 +1,52 @@
+From 4d13e431d26c3097e6dff49ba069061b588461af Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 24 Mar 2026 08:35:08 +0100
+Subject: [PATCH] url: do not reuse a non-tls starttls connection if new
+ requires TLS
+
+Reported-by: Arkadi Vainbrand
+
+Closes #21082
+
+CVE: CVE-2026-4873
+Upstream-Status: Backport [https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865]
+
+(cherry picked from commit 507e7be573b0a76fca597b75ff7cb27a66e7d865)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 7c24f1a002..4ebff50ef1 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -745,7 +745,7 @@ struct url_conn_match {
+   BIT(want_proxy_ntlm_http);
+   BIT(want_nego_http);
+   BIT(want_proxy_nego_http);
+-
++  BIT(req_tls); /* require TLS use from a clear-text start */
+   BIT(wait_pipe);
+   BIT(force_reuse);
+   BIT(seen_pending_conn);
+@@ -897,6 +897,9 @@ static bool url_match_ssl_use(struct connectdata *conn,
+        (get_protocol_family(conn->scheme) != m->needle->scheme->protocol))
+       return FALSE;
+   }
++  else if(m->req_tls)
++    /* a clear-text STARTTLS protocol with required TLS */
++    return FALSE;
+   return TRUE;
+ }
+ 
+@@ -1361,6 +1364,7 @@ static bool url_attach_existing(struct Curl_easy *data,
+     (needle->scheme->protocol & PROTO_FAMILY_HTTP);
+ #endif
+ #endif
++  match.req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
+ 
+   /* Find a connection in the pool that matches what "data + needle"
+    * requires. If a suitable candidate is found, it is attached to "data". */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 097b3056d8..5ba881bd76 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://CVE-2026-6429-dependent.patch \
     file://CVE-2026-6429.patch \
     file://CVE-2026-7168.patch \
+    file://CVE-2026-4873.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


