Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6D0CA5FB1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:18:40 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.655.1790655517558975401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LzsnkJtW;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2820; q=dns/txt;
  s=iport01; t=1790655518; x=1791865118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BuFT/WmAAqR6Sy5V8hk9PgwtZfyUoFMojJP7gs24x5k=;
  b=LzsnkJtWFApNaI5Gy4Ve6uX/GxOXVMLyCmX/SjypTO2il9/DfTfO4C1+
   EDSnGfEHlMX51NL8ntgJe2iHkRMVvPJUEM74VIg521MI9YAnz1W22WFUu
   3vxwbA+/TSBZVwnrQJYirR92NmSZnJXd7B/LtxTlz/giAGgAOCaqaS7I+
   UW1vzKryGKQCwn87xP0xW9eaomH1u6fU8VnMPXPglXAIOtPmrD3u6Ogt7
   2q6LqvhYvyfy3+D405IJp3VlSiaYLJwKOrTrCzC0oN90hJD3LTAlRhkoj
   Q7txpU2DcTnuZvruIEev0QcNuOk7murgKp3ARj8dPmjcjlK+fI3Kcbm3p
   A==;
X-CSE-ConnectionGUID: +N0TtB8oQ32EFvqIpakXWA==
X-CSE-MsgGUID: FnqEvNVxTDuUmR0I0C7rfQ==
X-IPAS-Result: =?us-ascii?q?A0BNAgBDO7tq/5D/Ja1aHgEBCxIMggULgld1YUJJlkoDm?=
 =?us-ascii?q?haEBIF+DwEBAQ9EDQQBAYQ/RgKOCAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQCA?=
 =?us-ascii?q?RHAAYF5M4EBgykBPwJDUNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FygRWDaYEFg?=
 =?us-ascii?q?VwBAQKCK4V4BIIigQyBWh6TOEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgSCCGSMZNnqBCV6BKylgARAXgQeCBwKCVIIBAgFJQw4HRVMJJ?=
 =?us-ascii?q?UUSRyYiCBIJARMaMAuBIThBCSg/GA1IESw3FRkEPm4HkD8eghhNAXoJCgEqA?=
 =?us-ascii?q?YFalAqQHYIhoQ8KKIN2jCKVOhozqm8LmH2KC4N/llCEaYFoPIFHCwdwFYMiC?=
 =?us-ascii?q?UoZD445g2uBf4MUxyYkNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:1Vn5IaKup3527wVFFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENShGYEy
 GBNX2yBb/3fYGP2f4wjaoq0pB4FvpKGztRiHgMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH9imQkajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0tKhkKIadI/d8sW0xg6
 +U5MDkOXi+q0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEiojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsiuiwa4WPIYPiqcN9sECBi
 3zgwXTFLgwnMebH6GKurWiiv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:rgX+I6FZka8wxkyUpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:NeXPAG7qjDfHK6lcONsst2hMJtwPInrkly39DVGhKH5gS42qYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AuAewTg4FXfmPZ0/NgF/6sqzXxoxG5b2DFmYzgak?=
 =?us-ascii?q?qpvSBD3RRYxzCljqOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528537237"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:18:37 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 11C93180003C9;
	Tue, 29 Sep 2026 04:18:37 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 5FB91CC127A; Mon, 28 Sep 2026 21:18:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 6/8] libxml2: Fix CVE-2026-86142
Date: Mon, 28 Sep 2026 21:18:34 -0700
Message-Id: <20260929041836.2217090-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
References: <20260929041836.2217090-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246815

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/6b3a736c0edc74ceec3d82f5252499d7911b3a58
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86142

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86142.patch       | 37 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
new file mode 100644
index 0000000000..d63d8cdceb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
@@ -0,0 +1,37 @@
+From 51f0e78349cbbc9081f14e02f440733e5880fb3d Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 09:32:43 +0200
+Subject: [PATCH] xpointer: Check overflow in xmlXPtrEvalXPtrPart
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1113
+
+CVE: CVE-2026-86142
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/6b3a736c0edc74ceec3d82f5252499d7911b3a58]
+
+Backport Changes:
+- Use xmlXPathErr(ctxt, XPATH_MEMORY_ERROR) because the Scarthgap xpointer implementation does not provide the newer xmlXPathPErrMemory() call shape. This preserves the XPath parser error state as well as reporting the allocation failure.
+
+(cherry picked from commit 6b3a736c0edc74ceec3d82f5252499d7911b3a58)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xpointer.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/xpointer.c b/xpointer.c
+index 6e1e5f46..f5457c9f 100644
+--- a/xpointer.c
++++ b/xpointer.c
+@@ -956,6 +956,13 @@ xmlXPtrEvalXPtrPart(xmlXPathParserContextPtr ctxt, xmlChar *name) {
+     level = 1;
+ 
+     len = xmlStrlen(ctxt->cur);
++    /* Overflow in xmlStrlen */
++    if (len == 0 && ctxt->cur != NULL && *ctxt->cur != 0) {
++        xmlXPathErr(ctxt, XPATH_MEMORY_ERROR);
++        xmlFree(name);
++        return;
++    }
++
+     len++;
+     buffer = (xmlChar *) xmlMallocAtomic(len);
+     if (buffer == NULL) {
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 49a1a8dbaa..881b60133d 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -36,6 +36,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86138.patch \
            file://CVE-2026-86140.patch \
            file://CVE-2026-86141.patch \
+           file://CVE-2026-86142.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


