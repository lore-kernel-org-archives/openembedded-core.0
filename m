Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4751C61DDA
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:12 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7507.1787730849730597084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Vg6xbhlO;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1205; q=dns/txt;
  s=iport01; t=1787730850; x=1788940450;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hOwXtsZn+XnFXIufe6+Lenkk0peUocmugC8uLu3tIko=;
  b=Vg6xbhlObZ/VfsV1aXUKiKQc/Q/uJa/H7yFISpeWwkkVSPfxvpCcZQbd
   a9gDPlhufKSrcYtUG8Q+nCTgIHjz/8+x1tVOj6p80ct+XUR3GMuxxh3Pw
   wj+Lxx1xejbozX0GNh+aZvtjMGbhVPQHWVNBv7jXjh1Clq47EgzGVc8WR
   MsfATgO44xpkG7nxF8G+ZQmFb3kcuGJtB1jdr5WktPiFy1WaTF8F3MHYQ
   dkdst0SiD/ymEiQnnzJiKpZ8dDranFyJFYZ9mpgtQc3bF7yEdIi7VvWuK
   I+BC++hVV0Ux1gUKJZNxUYWHKBp0SwcpOlwshXth0XlNPVvfas/zOr+U1
   A==;
X-CSE-ConnectionGUID: FqnlwgQrQS+wE6q1gEvzZg==
X-CSE-MsgGUID: fveaGbCeQNGwUDC0W8QJfA==
X-IPAS-Result: =?us-ascii?q?A0BCAgDnmo5q/4wQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO+eYIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDIF4kWpIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0c+CxgNSBEsNxQZBD5uB45rH4JJATwdNBmCAD+TfJF6oQ8KKIN2jCKVO?=
 =?us-ascii?q?hozqmwumFqkWoRpgWg8RoETcBWDIglKGQ/eXCcyAj0HAgcPApNxAQE?=
IronPort-Data: A9a23:BdL3p60s4bZDyU+CJPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpz1Vz
 2UYCmiHMq6LMTGkL9snYYu2px5V68TWx9Y3SwFs3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGIlgwOZIXw/xOOiJR2
 KIBcT8gcAKxiLfjqF67YrEEasULJc3vOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEyojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOKwaoSLJ4HWLSlTtkiGq
 2vp9U/0Ozc1K+Gz4mK6okuOiMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ECn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:cMiG+aklSdq5o+BkauCdqwDPtWfpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:PCofNmDEExbdWJn6Ewd+8koLFfk/S0ae01qOOha3JHh7erLAHA==
X-Talos-MUID: 9a23:2si13wj01BCaXINoKDVuBMMpOtll6oukI000t7oZhuWvbRMgAhWTpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="825266554"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 15BF218000422;
	Wed, 26 Aug 2026 07:53:48 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id B095BCC12A7; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] libxml2: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63724-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244324

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
xmlsoft:libxml2 is the active NVD dictionary CPE and configuration identity,
while gnome:libxml2 covers authoritative CNA affected data for the same
GNOME source, including two records exclusive to that backend identity.

This changes the generated identities to two exact CPEs, but the frozen
sbom-cve-check database leaves the 112-entry CVE report unchanged, with
no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-core/libxml/libxml2_2.15.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.3.bb
index 8b0ba29412..7ddba7429c 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -31,6 +31,8 @@ BINCONFIG = "${bindir}/xml2-config"
 
 inherit autotools pkgconfig binconfig-disabled ptest
 
+CVE_PRODUCT = "xmlsoft:libxml2 gnome:libxml2"
+
 # libxml2 publishes bugfix/security-only micro releases on its per-minor
 # release branches.
 inherit upstream-stable-release-point
-- 
2.35.6

