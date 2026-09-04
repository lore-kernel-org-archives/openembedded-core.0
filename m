Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12463C79F87
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:00:17 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9551.1788512409467513020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=V7U3ixKU;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3622; q=dns/txt;
  s=iport01; t=1788512409; x=1789722009;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=69MdxyJjjN0k6VBUdLblNXZY1MR4w6iIg03xtl74R2Y=;
  b=V7U3ixKUNLqmLx8oj2uEOL0G5r3r41laFceELmfteViELp1p3MNFYGa/
   9eeoxoWlreL9a+6bDRyAHxuwMi4VN4N4hGGg8WgsDuQ6mM3f4DClfWmG0
   pwe2R57mDkoblePcIsKvmaMigrZr5457m+37E7lTUittt/Rho6jib9MZX
   wFfR6bzkr4KGFJPlun/rXM2y+0faU6AAbiUaa6lADR5CdjldBM48Ubnkt
   cupRbk/tmLpE7ezO7t1Hvt+ip8ZtmWBo8nCB356giZZbV6hbu61PqFwcP
   cpukCCbAdVcOmduCRfScbg32oy4GJZctVjbtuEFzuiW1smlIhLO9++6IT
   g==;
X-CSE-ConnectionGUID: wQWPtZARTWq4O9xcdH/gvg==
X-CSE-MsgGUID: Ze0vwEDVQ9ebS00Et1D2kA==
X-IPAS-Result: =?us-ascii?q?A0BFAgBwh5pq/5EQJK1aglmCV3RgQ0mWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWOBAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDZAZAQIBKgsBGAEtLAMBAlojGAmDAgGCdAMRBsI4gXkzgQGDKAE/AgJAA?=
 =?us-ascii?q?VDbMQELFAEFgTOFP4giXRgBhHwnGxuBcoEVg2mBBYFcAgGBUIZUBIIigQyBW?=
 =?us-ascii?q?pINSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2e?=
 =?us-ascii?q?oEJXoErKWABEheBCYIIAoJUggMCAUlDDgdHUwknQQQLGA1IESw3FRkEPm4Hj?=
 =?us-ascii?q?l8fglABLDQtASkBAYIDOgeTIEKRfKEPCiiDdowilToaM6ptmQiOCpZQhGmBa?=
 =?us-ascii?q?DyBWXAVgyIJFjQZD445g2uGQMV5JzICCTIBAQcCBw4DC4FokAKBfAEB?=
IronPort-Data: A9a23:BvmW46AL0PJV5hVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApGhzgTNUz
 DZOCmiFOfyNMGqnf491OoTl9h5VsJDSzoM3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA79gGYoWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE3MxRNF0EFLckxf8rJjBe/
 vA4bz8TYUXW7w626OrTpuhEj8AnKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWcHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFYgi+GwaouIEjCMbfdYxliHi
 074xjX0CCpCbPGDkBbf8Vv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH69V5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:y9wSDa/zcmz0PAP7bcNuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:GfBOAmPWVIfHfu5DRxBYzFImM/oZTWSB6ybAKEOYTml3R+jA
X-Talos-MUID: 9a23:BTcZwglb4LCzs1dtFvjKdnpQOZ92/ImCNnlcnJ8945GpKXVcYTS02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="829315295"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 09:00:08 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 5CB4118000778;
	Fri,  4 Sep 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id E3BC2CC12A6; Fri,  4 Sep 2026 02:00:07 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 1/6] curl: Fix CVE-2026-8286
Date: Fri,  4 Sep 2026 02:00:02 -0700
Message-Id: <20260904090007.27374-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245075

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16
[2] https://curl.se/docs/CVE-2026-8286.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-8286.patch             | 60 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8286.patch b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
new file mode 100644
index 0000000000..ec2f6165c3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
@@ -0,0 +1,60 @@
+From 471592386ff977dfd3e2de107b8f81dfc1d3d030 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 7 May 2026 10:30:07 +0200
+Subject: [PATCH] url: fix connection reuse for starttls protocols
+
+When a connection is tested for reuse in a transfer that *may* upgrade
+to TLS (commonly via STARTTLS), the SSL configuration must match the
+existing connection.
+
+Reported-by: Andrew Nesbit
+Closes #21522
+
+CVE: CVE-2026-8286
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16]
+
+Backport Changes:
+- curl 8.7.1 predates the url_conn_match refactor. Carry the upstream may-TLS
+  and require-TLS distinction in ConnectionExists() and preserve the upstream
+  TLS configuration matching behavior.
+
+(cherry picked from commit a86efdd7ca5433de9231e650f18247de8319ad16)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/url.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index dfcd6f4841..9e1ca0336c 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -935,7 +935,8 @@ ConnectionExists(struct Curl_easy *data,
+   /* plain HTTP with upgrade */
+   bool h2upgrade = (data->state.httpwant == CURL_HTTP_VERSION_2_0) &&
+     (needle->handler->protocol & CURLPROTO_HTTP);
+-  bool req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
++  bool require_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
++  bool may_tls = data->set.use_ssl > CURLUSESSL_NONE;
+
+   *usethis = NULL;
+   *force_reuse = FALSE;
+@@ -1054,7 +1055,7 @@ ConnectionExists(struct Curl_easy *data,
+         continue;
+
+     if(!(needle->handler->flags & PROTOPT_SSL) &&
+-       req_tls && !Curl_conn_is_ssl(check, FIRSTSOCKET))
++       require_tls && !Curl_conn_is_ssl(check, FIRSTSOCKET))
+       continue;
+
+     if(needle->bits.conn_to_host != check->bits.conn_to_host)
+@@ -1202,8 +1203,8 @@ ConnectionExists(struct Curl_easy *data,
+          needle->remote_port != check->remote_port)
+         continue;
+
+-      /* If talking TLS, check needs to use the same SSL options. */
+-      if((needle->handler->flags & PROTOPT_SSL) &&
++      /* If talking/upgrading to TLS, check needs the same SSL options. */
++      if(((needle->handler->flags & PROTOPT_SSL) || may_tls) &&
+          !Curl_ssl_conn_config_match(data, check, FALSE)) {
+         DEBUGF(infof(data,
+                      "Connection #%" CURL_FORMAT_CURL_OFF_T
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 365f02ad59..c006649a1b 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -41,6 +41,7 @@ SRC_URI = " \
     file://CVE-2026-5545.patch \
     file://CVE-2026-6253.patch \
     file://CVE-2026-4873.patch \
+    file://CVE-2026-8286.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


