Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21A2C5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 10:34:10 +0000 (UTC)
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13364.1785839645611966325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 03:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=itFXgLmy;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2868; q=dns/txt;
  s=iport01; t=1785839645; x=1787049245;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xSdb9kKlNXpe8B0ska/QX/MZsUFpiQmJAnObsKaPKOI=;
  b=itFXgLmyJxpDOFifCAjsiJHR4XS9nsYwqc97rQD7op6awTVkKcWX8KBf
   JN9pIYC/ww8E82OxjfOXsjuR0MORouLy13vlXKcyWJEGn75Gg2AA0MMtj
   NotbrBnenxRACn4r/IaRehU/3S2N2VoZ6zjeimpH2z9i3HxnYsGC9BZ+t
   bFV/atEnMfjcYlGIZ9+m1K3EUX2uunlSDUjPjqdc0zogK9Cf7tZZKbkdu
   F0/bEZ175y/hXIfcEXfaIU2L9AVDriPP0yrWGfNUURkNMsgjF5TpG/j6Q
   RZ97QdDKoCLko+2thNE0kFtkl6KHvnO6wX2ZSsYokFu+bNDn7NpymQAlg
   A==;
X-CSE-ConnectionGUID: dJ1oQoVxTSq+hxVyfv+v4w==
X-CSE-MsgGUID: DUurKn9uT0SLKiqUi8rbGw==
X-IPAS-Result: =?us-ascii?q?A0BIAgA4v3Fq/9NK/pBaglmCV3RfQkmUKYIhA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjWcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAT0cAwECLysjCBEIgwIBgnQDEQa+cYF5M4EBg?=
 =?us-ascii?q?ygBPwICQAFQ2y4BCxQBgTiFP4ghXRgBhHwnGxuBcoEVg2mBBYFcAgGBJipch?=
 =?us-ascii?q?XgEgiKBDIFakHlIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBwWBH?=
 =?us-ascii?q?YErLIRTIxk2fIEvdUp1LWoSF4EagxUCgnpDCxgNSBEsNxQZBD5uB44GIIJEA?=
 =?us-ascii?q?QUnNC0BKQKCPQWlXaESCiiDdYwhlToaM6psmQiOCpZQhGmBaDyBWXAVgyIJF?=
 =?us-ascii?q?jQZD444g2uGQMVhPDUCCTIBAQcCBw4DC4FokAACJoFWAQE?=
IronPort-Data: A9a23:p3ErMaIi2LXZ7b8RFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS0mBVm
 2YdWD+Ea/neYWrwfI1wPdvl/B5V75XWmoJiSVYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Yoajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1iLhgxBIom6tpMGCJO5
 cIJJi5OcEyc0rfeLLKTEoGAh+wqIdOuOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2NXwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsgeSzbYONKrRmQ+15o1uCh
 WSX4lihOTU5NcWiyGqf+F2z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIk/KS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:8C+x0a0FEXg++OcLNPQ82QqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:p46mRG8RCrYfbsd2O6GVv0I2Q8ccdUPN8EzJYE+oN3dnVv6LFUDFrQ==
X-Talos-MUID: 9a23:hV0V8QSE/wRoxzHKRXTAuSx4F8E5/pj2M2QukIw7upmePwNvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,204,1779148800"; 
   d="scan'208";a="59465108"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Aug 2026 10:34:03 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 170CC180001F0
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:34:03 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D1F02CC037D; Tue,  4 Aug 2026 16:04:01 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 2/5] curl: fix CVE-2026-5545
Date: Tue,  4 Aug 2026 16:03:02 +0530
Message-Id: <20260804103305.1180770-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260804103305.1180770-1-deeratho@cisco.com>
References: <20260629104801.972184-1-adongare@cisco.com>
 <20260804103305.1180770-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 10:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242711

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-5545.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd
[2] https://curl.se/docs/CVE-2026-5545.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Rebase the patches on top of scarthgap latest
fixes.
 .../curl/curl/CVE-2026-5545.patch             | 42 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5545.patch b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
new file mode 100644
index 0000000000..d012f39b07
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
@@ -0,0 +1,42 @@
+From ab96b09b1163659b83b0716abe42662d1e1630ea Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 5 Jun 2026 01:17:44 -0700
+Subject: [PATCH] url: improve connection reuse on negotiate
+
+Check state of negotiate to allow proper connection reuse.
+
+Closes #21203
+
+CVE: CVE-2026-5545
+Upstream-Status: Backport [https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd]
+
+Backport Changes:
+- curl-8.7.1 still performs the NTLM/Negotiate reuse logic inline in
+  ConnectionExists(), so the upstream guard was adapted there.
+
+(cherry picked from commit 33e43985b8f3b9e66691d06e70be0395849856cd)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 30f215fd48..1d6e3309f5 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1219,8 +1219,14 @@ ConnectionExists(struct Curl_easy *data,
+          Curl_timestrcmp(needle->passwd, check->passwd)) {
+
+         /* we prefer a credential match, but this is at least a connection
+-           that can be reused and "upgraded" to NTLM */
++           that can be reused and "upgraded" to NTLM if it does
++           not have any auth ongoing. */
++#ifdef USE_SPNEGO
++        if((check->http_ntlm_state == NTLMSTATE_NONE) &&
++           (check->http_negotiate_state == GSS_AUTHNONE))
++#else
+         if(check->http_ntlm_state == NTLMSTATE_NONE)
++#endif
+           chosen = check;
+         continue;
+       }
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 043143d30d..296507eef8 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -39,6 +39,7 @@ SRC_URI = " \
     file://CVE-2026-5773.patch \
     file://CVE-2026-6276.patch \
     file://CVE-2026-4873.patch \
+    file://CVE-2026-5545.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

