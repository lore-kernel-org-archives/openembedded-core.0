Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CE7CA6005
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:57 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16132.1791192228644084262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ILPdHNrB;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1832; q=dns/txt;
  s=iport01; t=1791192229; x=1792401829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m9Pqos+t6ZOR/C3Ii3yRNMmAvAj50oWo21YSbDPxMWk=;
  b=ILPdHNrBmcfC1C1m8ffSeqlFWqSg+2sMxL8A05I347sRkZLon9MRCDUE
   Ais2Sz9YgqPDSJiqRwE+wbQQnQZmNkOwMkwBknZRkQZAh2X0A+az1O62a
   ydKWE+HgW0mseAjrq26eZ1oX8SeZG7oZ6wbm7fh/KyvmBTZY5EH7dlVzb
   +VORFb2HF4E8n1oF0/Vn9segpJKk0wHozNeLuDt54Bw2YpW8WJd8qxvow
   ruN9oAEuHlE/MIRqHVQWgFikjsdnzIFY0/A0+tw+IdvkbslJr/3V98Oh7
   n8SUmuasi+MtxjbluE9IbjWdGZGt2IulxF6x2duoqMbEqpuFEWEZXns7o
   g==;
X-CSE-ConnectionGUID: 46gdK/D3Q+2jDlyGJnkbrQ==
X-CSE-MsgGUID: mrjPRWcFTVO6EnJ2pAUlVg==
X-IPAS-Result: =?us-ascii?q?A0BGAgC3a8Nq/5L/Ja1aglmCV3VhQkmWSgOBE50HgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4JAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZATAgEDMgEYAS0QIDErKxmDAgGCdAIBEQa1K4IsgQGDKQE/A?=
 =?us-ascii?q?kNQ2zIBCxQBBYEzhUCII3aEfCcbG4FygRWCc3aBBYFcAQECgiuFeASCIoEMg?=
 =?us-ascii?q?XiTTkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZN?=
 =?us-ascii?q?nqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUUSRyYiCBIJARMaMAuBG?=
 =?us-ascii?q?zg8CShEFwwQGA1IESw3FRkEPm4HkFAegW1zgQ4sFwkCgWIBk1+DIo8coQ8KK?=
 =?us-ascii?q?IN2jCKVOhozqm+ZCI4KllCEaYFoPIFHCwdwFYMiCUoZD445g2uBf4MUxyYkN?=
 =?us-ascii?q?QIBCDIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:qsVjra2xAMX+mQc2OvbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2dSn
 GUYWzuHPP2DZWujfYt+O9jl9hhVvMPQzdUyGgFp3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUB85Ma5f1r1OQjtM2
 fgJBxILbRqZvrfjqF67YrEEasULNsLnOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUieC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeO0aoqJKoHbLSlTtkOCp
 Fr8wG/XPi89avGZ62Cd20+ouOCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1ffDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:qbEYGqFAa6libM0+pLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3Aaw+eX2sS43C4BSqZC+aQacA86It5LHLR7zD8eHb?=
 =?us-ascii?q?7U2RFTKy6a1mT8rldxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ARlRLFQ2Qz+uZnVtWj65ky5rgCzUj5r6sMHoymrs?=
 =?us-ascii?q?6he7aGCpSYS+0sTCJTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="531284859"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Oct 2026 09:23:48 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id DAE7A18000211;
	Mon,  5 Oct 2026 09:23:47 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 49AD1CC12B5; Mon,  5 Oct 2026 02:23:47 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2 3/8] libxml2: mark CVE-2026-86139 fixed
Date: Mon,  5 Oct 2026 02:23:41 -0700
Message-Id: <20261005092346.1670265-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261005092346.1670265-1-hthakar@cisco.com>
References: <20261005092346.1670265-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247228

From: Hetvi Thakar <hthakar@cisco.com>

The fix for CVE-2026-86139 adds a zero-length guard in
xmlURIEscapeStr, as shown in the upstream commit [1].

The libxml2 2.12.10 source already contains the equivalent guard [3],
so no additional patch is required. Mark the CVE as fixed in the
recipe.

[1] https://github.com/GNOME/libxml2/commit/8edbbdb09f24d26a2f900141fddc2b9d014f53b0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86139
[3] https://github.com/GNOME/libxml2/blob/v2.12.10/uri.c#L1689-L1700

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- added xmlURIEscapeStr function url
---
 meta/recipes-core/libxml/libxml2_2.12.10.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 28ae601118..53e8660366 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -46,6 +46,11 @@ CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail
 # https://gitlab.gnome.org/GNOME/libxml2/-/issues/958
 CVE_STATUS[CVE-2025-8732] = "disputed: the code maintainer explains, that the issue can only be triggered with untrusted SGML catalogs and it makes absolutely no sense to use untrusted catalogs. The issue triggers a crash if an invalid file is provided.  https://gitlab.gnome.org/GNOME/libxml2/-/issues/958"
 
+# The Scarthgap 2.12.10 source already contains the equivalent zero-length
+# guard required for the xmlURIEscapeStr integer-overflow issue.
+# https://github.com/GNOME/libxml2/blob/v2.12.10/uri.c#L1689-L1700
+CVE_STATUS[CVE-2026-86139] = "fixed-version: xmlURIEscapeStr returns NULL when xmlStrlen returns zero"
+
 BINCONFIG = "${bindir}/xml2-config"
 
 PACKAGECONFIG ??= "python \
-- 
2.35.6


