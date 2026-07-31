Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1DEC5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:56:52 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.658.1785477412448004825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IpVXRUCO;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3198; q=dns/txt;
  s=iport01; t=1785477412; x=1786687012;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=F5dmywGRALgiYZ4xuWt10MMX82RJGMslFlvvsrrb8Eg=;
  b=IpVXRUCOqmuHRRPNdX9cJ3seTtGYWog9LoQLjx/0IJChwWgImEWcI8Yr
   8/bq9PGIBNJJzelTsl6SP6WtfbN+GEutdxS3Yco+5ok6KO0l2NQp5qvZF
   rsDSQMIxDVHwBGF6BMQ4nrIHewL+ICgWTWiopwfEECiLidpFyZGq0S7Oo
   1eYNGFCclVD8dkNMKKqWA3vPhbqZKqOzuGTyl3ieMwF1zVuH2TE94St4L
   RfPxvI6ABM73VnKR1FxYVCzDMCyc4WMwTR+6wc/M0wHHHuM4drMB6aJGH
   NAjskaVUyL5XJwnE87vwRLypxzEt/kyjWLWMIryeZnZ2bnYGN0apUCkMp
   A==;
X-CSE-ConnectionGUID: ne8GYcVuRLWxrvOstid/2g==
X-CSE-MsgGUID: bynz+NCJSXmipRUDHC9S4g==
X-IPAS-Result: =?us-ascii?q?A0BJAgBvN2xq/5X/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8gCyMIEQiDAgGCO?=
 =?us-ascii?q?gM3AxG6Oho3gXkzgQGDKAE/AkNQ2EkNglgBCxQBgTiFP4J9hSNcGAGEfCcbG?=
 =?us-ascii?q?4FyhH6BBYEaQgEBgSeGfgSCIoEMgVoehCuMEkiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsHBYEdgSsvhFMjGTZ8gS91SnUtahIXgRqDMQKCXwMLG?=
 =?us-ascii?q?A1IESw3FBkEPm4HjWkggj4BPVEBK4FDEaZLoCFxCiiDdYwhjz6FfBozqmwLm?=
 =?us-ascii?q?H2OCoQJkkeEaYFoPIEoHwsHcBWCbgEzCUoZD444g2uBf8xDPDUCCTIBAQcCB?=
 =?us-ascii?q?w4DC4FokACBfgEB?=
IronPort-Data: A9a23:a+0Zka3QSbrm0i9dlfbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzYCy
 2pNWWHVOqmLNmf0Kdwla4Sw8U5QsJKAn4NhSVds3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EvajpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGCkxmErwTxPtNJV5e7
 +I/MywMYlfZiLfjqF67YrEEasULNsLnOsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiRC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW0b4KEIYHaGK25mG6St
 2TUvELSICoqMd2H8wep0ln9vbPAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:fAj8XaGrls3jPvr2pLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:tfikq2OL7wRQa+5DXiQ3238fJN0fVkLN1mn3OFO5BSEzR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A6/amsA81jOEraukgqgJi/BmQf8155bbtLmsvqqU?=
 =?us-ascii?q?DutG+CABQEGam0DviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="517093585"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:56:51 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 524C7180001C6
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:51 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 6B88ACC037D; Fri, 31 Jul 2026 11:26:49 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 03/10] expat: fix CVE-2026-56404
Date: Fri, 31 Jul 2026 11:26:18 +0530
Message-Id: <20260731055625.4187716-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242400

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56404

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- No change to the embedded upstream source patch.

 .../expat/expat/CVE-2026-56404.patch          | 45 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56404.patch b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
new file mode 100644
index 0000000000..bd5f99742b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
@@ -0,0 +1,45 @@
+From d8e09a54fa9214e64d8e73057ca6918d08857022 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Thu, 28 May 2026 12:44:11 +0530
+Subject: [PATCH 04/17] lib: protect function addBinding from signed integer
+ overflow
+
+CVE: CVE-2026-56404
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164]
+
+(cherry picked from commit babfc48090977cbf7be24b2c48f6053dca75c164)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 12bbe23e..9d21e136 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4456,6 +4456,10 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   }
+ 
+   for (len = 0; uri[len]; len++) {
++    /* Detect and prevent signed integer overflow */
++    if (len == INT_MAX) {
++      return XML_ERROR_NO_MEMORY;
++    }
+     if (isXML && (len > xmlLen || uri[len] != xmlNamespace[len]))
+       isXML = XML_FALSE;
+ 
+@@ -4496,8 +4500,13 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   if (isXMLNS)
+     return XML_ERROR_RESERVED_NAMESPACE_URI;
+ 
+-  if (parser->m_namespaceSeparator)
++  if (parser->m_namespaceSeparator) {
++    /* Detect and prevent signed integer overflow */
++    if (len == INT_MAX) {
++      return XML_ERROR_NO_MEMORY;
++    }
+     len++;
++  }
+   if (parser->m_freeBindingList) {
+     b = parser->m_freeBindingList;
+     if (len > b->uriAlloc) {
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 7fe8174909..5e3aef3b7e 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -64,6 +64,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
+           file://CVE-2026-56404.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


