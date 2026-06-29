Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C37BC44501
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:15:05 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37292.1782738901088951273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ePl3HQOv;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2813; q=dns/txt;
  s=iport01; t=1782738901; x=1783948501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oPHSvCw2p1tIzQLbE6ek1wVv4wm0wwLhWRBbvbMZank=;
  b=ePl3HQOvVi+z673txQNwjB8TcCQJbU74EUCT3fMXW8FUt7z/AZuj10bD
   lXx1FeUAVOJEZOGM/S1q/faqsq6vSQYfH+Nju4iwlSiKQQT0HI0HsWlg7
   0MUFq6mFz047glR3SvsSuQe998nkb8Y3LrnYcbxoUQ2cAXVq+TVsRV/OM
   PPjbSV91GiCidUcveiEiV8oJCJTnqT5EpCN6+i5rk1d87t5S16MKCfZh/
   h6tT0P89/PqOgBs8Co88MQ540D205/FqDVIOiuJ2aJA6c0eL1MqnsUnoh
   v3zbmcWNiryIzoGiZpMoo6Iy6kw8z53d0xwa3JcXC9MNkh4a0jMxtpSqO
   Q==;
X-CSE-ConnectionGUID: i8TLXh5STL6Y9KOfsRbgXw==
X-CSE-MsgGUID: cQzFH/ZLQQSOBI5IwwGimQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgCnbkJq/5P/Ja1aHgEBCxIMggULgld0X0JJlksDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGFBgKNSwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCcwIBEQa2d?=
 =?us-ascii?q?IF5M4EBgygBMQUJAgJAAVDbLAELFAEFgTOFP4gfWxgBhHwnGxuBcoEVg2mBB?=
 =?us-ascii?q?YFcAQEBgVBchXgEgiJ6EoFajy9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBHYFpgQSEfSMfAzl/gTB1WGYVMDWBAgERHgqBUicDCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB4xeFw+CPQFYCC0BKQIggh0FBqVaoQ8KKIN1jCGVOhozqmyZCI4Kl?=
 =?us-ascii?q?lCEaIFoPIFHCwdwFYMiCRY0GQ+OOINrgX+EQcFNJDUCCTIBAQcCBw4DC4Fok?=
 =?us-ascii?q?AKBewEB?=
IronPort-Data: A9a23:B6NdCKnj4sWLXBGwO9hvGtzo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOC2GFP/uLZDamf91zPd61p0kAsMWBx9NnTQNkrXhmFVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKsfPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYxIxsJHATx1y
 dhGGWEuSR6Yvei58K3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZT/7C7pm9AusrnDzdDtXoUiYjaE2+GPUigd21dABNfKJK4fUGpUOxRbwS
 mTu9F3rLDFdBvim8AGi2FPxp/DQsiL+YddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:D/0jyq69wr4tzo1d/APXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcW2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:IYo1pG0R5iFAuKxMRV0bFbxfG5AZVk3dkUzsBxGJWEVORqavQ1Cg5/Yx
X-Talos-MUID: 9a23:Gu088AkJYdsBE9wXLgVcdnppDdVGw+OcLHk0qrIsmpSlKjNfOjKk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,232,1774310400"; 
   d="scan'208";a="493678338"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 13:15:00 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 0F9581800088F;
	Mon, 29 Jun 2026 13:15:00 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id ACC07CC12A7; Mon, 29 Jun 2026 06:14:59 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 2/6] curl: fix CVE-2026-5545
Date: Mon, 29 Jun 2026 06:14:46 -0700
Message-ID: <20260629131453.1077612-2-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629131453.1077612-1-adongare@cisco.com>
References: <20260629131453.1077612-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239778

From: Anil Dongare <adongare@cisco.com>

Backport the upstream fix [1] for the Negotiate-authenticated connection
reuse issue described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd
[2] https://curl.se/docs/CVE-2026-5545.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-5545

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../curl/curl/CVE-2026-5545.patch             | 46 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5545.patch b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
new file mode 100644
index 0000000000..86a63c6738
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
@@ -0,0 +1,46 @@
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
+Signed-off-by: Anil Dongare <adongare@cisco.com>
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
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 41e6888977..2b1bc40e37 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2026-6276.patch \
+    file://CVE-2026-5545.patch \
     file://mbedtls.patch \
 "
 
-- 
2.51.0


