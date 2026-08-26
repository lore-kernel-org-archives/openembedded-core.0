Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6748DC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:36 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7694.1787732006576801565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MnlN0ct+;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1233; q=dns/txt;
  s=iport01; t=1787732006; x=1788941606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2r4dEc3lR6dMsxYQ2VHgxyw9+ri2teN5gHuoCpugxHs=;
  b=MnlN0ct+MTQhwxjvNSmx+etWQwImGBn/EwYX4SlUWFn1Ky3TFPa4fXzP
   KccCzlyuUYiM0zXye0Bif5zAGnXcCrhDyM8sgada6T+4/bejT5a5MH7tw
   oUHYsHlbhV3g4DsUpM8zhO3bA+UO/k4FgX4NsqSf/ks3xZnzD8ql1P8xV
   0G2KCRcnCZJkh3B3H+p1vs1zmGcatF9tNZC3FTssihi3lwVYq0xeK4g/A
   VEnCRoxRl6N60nxO5nKJTuESrW760+QyGSdLklnBriwA/azbkbvEhdwgH
   qZWFPAF9ufen8pAWMeQT8hLdYKaYhbc/LNfq9fK86bdIEyEfPt/JtGzSO
   w==;
X-CSE-ConnectionGUID: Cz7cV6FLT5+uFVYjcQUtvA==
X-CSE-MsgGUID: H9FUlnw+S7u/O2jMQa5+pA==
X-IPAS-Result: =?us-ascii?q?A0BDAgDBno5q/4oQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhlsCAQMyAUYQIDErKxmDA4J0AgERvnSCLIEBg2gCQ1DbMAELFAEFg?=
 =?us-ascii?q?TOFP4gidQGEfCcbG4FygUeDN4EFgVwBAYIthXgEgiKBDJNiSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWABEheBC?=
 =?us-ascii?q?YIHAoJaggUCAUlDDgdHPgsYDUgRLDcUGQQ+bgeOax+CSYEOLARMgTOmH6EPC?=
 =?us-ascii?q?iiDdowilVQzqmwLmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/KOiQ1P?=
 =?us-ascii?q?QEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:Kg7leqoYsovwnyBLt6tRH8dn1gheBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmCOviKZTf3fowlaIjg8hgA7Z7QnN9qGgA6+3hkQSMQoOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jifHgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8k035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0s1lXmpwq
 9I8FG1Ocz69tuC9+Y+nVMA506zPLOGzVG8eknhkyTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwxHYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9KofUGJ0PxxbHz
 o7A10SoLCweMsPc8mWYtVX2hMr2lH64QKtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:RlkaeqEvF89pPgNUpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:4QyYb21QNuKHwUG14Y8msbxfMdJ6eUOD4lPsfgylJ1hYSrasdEOO0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AU/ZH4w5jfkgE0VYB5DqFyrpnxoxIsoqTDEYS0q5?=
 =?us-ascii?q?Zpo6jby5VAj7AzyyeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="836502187"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:25 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 8396D180008C9;
	Wed, 26 Aug 2026 08:13:25 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 20693CE1BBC; Wed, 26 Aug 2026 01:13:25 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
Date: Wed, 26 Aug 2026 01:12:52 -0700
Message-Id: <5378c262ed330809f6dbb9f81f3f8e4d2400de44.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244330

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2024-57254 affects U-Boot SquashFS runtime parsing [1].
- The tools-only build graph does not link fs/squashfs into its host
  tools [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-57254
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/tools/Makefile

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index b5711e1f97..2519dc521f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -4,3 +4,4 @@ require u-boot-tools.inc
 SRC_URI += "file://CVE-2026-46728.patch"
 
 CVE_STATUS[CVE-2024-42040] = "not-applicable-config: DHCP client code in net/bootp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
+CVE_STATUS[CVE-2024-57254] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
-- 
2.35.6


