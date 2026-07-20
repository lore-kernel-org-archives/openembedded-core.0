Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89311C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:31:38 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6931.1784547088266642912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XR2YP7a9;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2898; q=dns/txt;
  s=iport01; t=1784547088; x=1785756688;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iJqIvwYDqHOr269zrLYDl0ZjhPFPqZc01NcmL3EfY3M=;
  b=XR2YP7a9FaZdXlTIvlnJdzyldUPAKBC2Mwj5DuFXf5K1EwZp6bqKJYwi
   qcj9t+kcWvwNmEE1Hw2ljmoIn1LgKRwcDyEZREn32kfzDb6bGpC0vvZ2A
   cyxSiXsNU00JpxEDtfeDiEw1Cc2G9zUOUAUFDJq5zEOFpunDeITQaKWPc
   p8VbCwa0zZfpcJHoScsOCf/WanjVv0kdNKXA6arSpsUVQdrvhFMS6QZel
   H3eZhdH3wSEWv5XZKS5MacBCldyMXG7gVIEUWKEIKqE7fKagMYWWfPjiP
   bu8n4h6Nyprq4AGCoZnKpD0Nef9xwMBoXvh53sjVIrtOUTjlo8WrvlW+m
   g==;
X-CSE-ConnectionGUID: w9tdc+AzTvyqwxfOUXcLVA==
X-CSE-MsgGUID: wqJVbXsFTYm47rBLFOk7xw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCCBV5q/5P/Ja1aglmCV3RfQkmUKYIhA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAT0cAwECLysjCBEIgwIBgnQDEQa8bIF5M4EBg?=
 =?us-ascii?q?ygBMQUJAgJAAVDbLgELFAGBOIU/iCBcGAGEfCcbG4FygRWDaYEFgVwBAQGBU?=
 =?us-ascii?q?FyFeASCIoEMgVqQDEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgTqBAoR0Ix8DOX+BL3VKdy1qEheBJoISAoE7AgcDCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?408I4I/AWAtASkCIIIdBQalV6ESCiiDdYwhlToaM6psmQiOCpZQhGmBaDyBR?=
 =?us-ascii?q?wsHcBWDIgkWNBkPjjiDa4F/hEHEBzw1AgkyAQEHAgcOAwuBaJACgXwBAQ?=
IronPort-Data: A9a23:QF8Dia3MtPhRDBSR0vbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2QGn
 DNKXm6EafaMMzGnLdEnb4Xn9R4F7MCGzN9kTgRk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuajpJg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGExAqMYZb0/RLH3BX6
 uwWDw09ZTS9rrfjqF67YrEEasULNsLnOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUifC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW0a4KPIoTbHa25mG6Hv
 0D49VTiLC0rMYDA0xCh3FWv2f/QyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:RvsoKqy9QmzW95AHglE8KrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:3+RtOGBgcULst1v6EzY26EIfWek3TmPM1WjALWiFOW1NdpTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AkLeb0Q5KKPHXHAgxEcZ9FVPbxox3+oaQAnAWv6k?=
 =?us-ascii?q?3vpXbLwZUFRCe0ySoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="513020090"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:31:27 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 3603A18000895
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:31:27 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 5929FCC037D; Mon, 20 Jul 2026 17:01:25 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 2/5] curl: fix CVE-2026-5545
Date: Mon, 20 Jul 2026 17:00:38 +0530
Message-Id: <20260720113041.2479444-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720113041.2479444-1-deeratho@cisco.com>
References: <20260720105647.2451180-1-deeratho@cisco.com>
 <20260720113041.2479444-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241365

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix [1] for the Negotiate-authenticated connection
reuse issue described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd
[2] https://curl.se/docs/CVE-2026-5545.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-5545

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patches on top of the latest
wrynose branch.
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


