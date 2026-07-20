Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDE7C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:28 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7668.1784550025135817828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lm84E7gZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3168; q=dns/txt;
  s=iport01; t=1784550027; x=1785759627;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bYxn6UDn4S8VQ3ZriWIkvfx6/yX/64B+Rpci3NcOc0g=;
  b=lm84E7gZpKIOf2ZfY/0fXSN3tC8555OMuPiyRV05nod3JjQH1gCVBDiW
   BKpQ/juPoctXJsaPsxVbEwquTkNMM2uvD1znhdIJSNwLDXOCnmee1TNE8
   ATtcM0qwJsBXGnJdcOsghlB/qS2w3kKsdbw5ZxyMKKfAbDDHbKij4UFHc
   /a/yBPFwruhZvpVmk/zlK402j+kai0x8tvP+KrKSM/AGHxtXDW9iksTXM
   rTEUnTmc9eSyGWqybPoFn7gFLzOc89g9ipFdu3jk5jq1g95UIZiJdWIVZ
   tIf+5i6T8+fq9bcM9qvBrbORTA50d3j7jl+QBojejZAcjWknvrKbOYuZa
   A==;
X-CSE-ConnectionGUID: mudhOH1gQce/K6d8okJNTg==
X-CSE-MsgGUID: zGTGzV5LTkaTOSqnj7NJ7g==
X-IPAS-Result: =?us-ascii?q?A0BIAgAfEl5q/5H/Ja1aHgEBCxIMggULgld0X0JJlCmCJ?=
 =?us-ascii?q?ItkkjeBfg8BAQEPRA0EAQGEP0YCjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECLyALIwgRCIMCAYI6A?=
 =?us-ascii?q?zcDEbxFGjeBeTOBAYMoAT8CQ1DYSQ2CWAELFAGBOIU/gn2FI1wYAYR8Jxsbg?=
 =?us-ascii?q?XKEfoEFgRpCAQGIJQSCIoEMgVoej25IgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQwbBwWBHYE6gQKEdCMfAzl/gS91SnctahIXgSaCEgKBOwIHAwsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeNPCOCP4EOASuBQ6ZcoCFxCiiDdYwhjz6FfBozqmwLmH2OC?=
 =?us-ascii?q?oQJkkeEaYFoPIEoHwsHcBWCbgEzCUoZD444g2uBf8ZGPDUCCTIBAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:zjJH4qJtXtm02E0BFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3jBVm
 GUZWzqHb6mOa2bwL4h2O9jl/RxQu8PSmtBlGgsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQsaj98B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1rEU02Gq1B9d98DCZtq
 /BILzMvSCyM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEmojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeG3aIWIJoTXLSlTtlS3m
 k3UwTndPhITCPuk0DyHrVSO2eCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:gt7vNqpiau6V57JP9VPZCDIaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:8qwKfWE4J5ito7F7qmJi6UIUPeB8fUTWwTDzfUPoDmVLboGaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AUjvR5Q1b6vynrH8OiKUDpobbKzUj8YuSJ1IzzLE?=
 =?us-ascii?q?6uMC4EhdpPTXCqhboTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="512075405"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:20:27 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 0DEB5180001D4
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:27 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2EA9CCC037D; Mon, 20 Jul 2026 17:50:25 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 09/10] expat: fix CVE-2026-56407
Date: Mon, 20 Jul 2026 17:46:14 +0530
Message-Id: <20260720121615.2520859-10-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241386

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56407

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patch on top of
latest wrynose branch merged commits.
 .../expat/expat/CVE-2026-56407.patch          | 44 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56407.patch b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
new file mode 100644
index 0000000000..5a2a22e017
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
@@ -0,0 +1,44 @@
+From 7216b3584bcfb2d415026d16b8902ee7eacad5ca Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 11:59:01 +0530
+Subject: [PATCH] cap entity textLen against signed integer overflow
+
+CVE: CVE-2026-56407
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13]
+
+(cherry picked from commit 30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 71fe2c79..8e90fea8 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5684,6 +5684,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             parser, enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar,
+             XML_ACCOUNT_NONE);
+         if (parser->m_declEntity) {
++          /* Detect and prevent signed integer overflow */
++          if ((size_t)poolLength(&dtd->entityValuePool) > (size_t)INT_MAX) {
++            return XML_ERROR_NO_MEMORY;
++          }
+           parser->m_declEntity->textPtr = poolStart(&dtd->entityValuePool);
+           parser->m_declEntity->textLen
+               = (int)(poolLength(&dtd->entityValuePool));
+@@ -7099,6 +7103,11 @@ storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
+     return XML_ERROR_NO_MEMORY;
+   }
+ 
++  /* Detect and prevent signed integer overflow */
++  if ((size_t)poolLength(pool) > (size_t)INT_MAX) {
++    poolDiscard(pool);
++    return XML_ERROR_NO_MEMORY;
++  }
+   entity->textPtr = poolStart(pool);
+   entity->textLen = (int)(poolLength(pool));
+   poolFinish(pool);
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index bd6656c6e0..9f519b482e 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
            file://CVE-2026-56411.patch;striplevel=2 \
+           file://CVE-2026-56407.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


