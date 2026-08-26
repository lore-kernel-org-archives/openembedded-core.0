Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4752BC61DD2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:37 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7698.1787732011952222668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Zv2vJkoQ;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1617; q=dns/txt;
  s=iport01; t=1787732015; x=1788941615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=64F4gh28UrgzIyrWhay/+mz4dHE8Tx0zdqW/20uKBlA=;
  b=Zv2vJkoQ4oFcq3Mz+pLjxBWysW5I7s3VhqjjqFz4y2eiUQje8bxG8xgy
   sRaWze/pXos6wJ6kwS9boVB0yFPZZe766T4Cw1g8Sk1wPNkmKKHVY2pAt
   8CvmQqVx88kUEW1ohk8hMSnJQEaBWJ5umEgQmIAHWnWH4ySCD9TLi2XWz
   xbLN5MTSzxdPoVbO3EyYxCfUF6nZegR7VcW4IKQRDEBUQSeWhk1yceswq
   I6X8YuET7LjqirPfl8hLA93kydOPg63wJxLl+3uvexKu90eHZV3XPQ+JI
   qezU0rQrSKaKbPrmGRd0MTsROqpBVGD0+UVUvZEfIivDzS1pk+TtZLFji
   w==;
X-CSE-ConnectionGUID: aYwv86AdTSa+WSl2I09A7Q==
X-CSE-MsgGUID: XwTMTumnSsCn5er24+a8qw==
X-IPAS-Result: =?us-ascii?q?A0BEAgC6n45q/5QQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWwIBAzIBRhAdAzErHQ4ZgwOCdAIBEb8GgiyBAYNoAkNQ2zABCxQBB?=
 =?us-ascii?q?YEzhT+IInUBhHwnGxuBcoFHgkF2gQWBXAEBgi2FeASCIoEMk2JIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF?=
 =?us-ascii?q?4EJggcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJWjQsBIFkpjqhD?=
 =?us-ascii?q?woog3aMIpVUM6psC5h9jgqWUIRpgWg8gUcLB3AVgyIJShkPjjiDa4F/yjokN?=
 =?us-ascii?q?T0BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:VxlCGKxS6T1HUm/0nUB6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVWm
 zcWUWCOb6nZY2r1KNsjaY63p0gA65aBnNRlSgBq/lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEgHIpNIpM97PVpHt
 sMjLGosNkGq2NvjldpXSsE07igiBMDvOIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiQC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOGyaoqNI4HWLSlTtnaHm
 kf64mH/OQoxMoGS02DZsXv8n/CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:6/yRl6HBB6NrjuDRpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AXxN0H2vn5u7kFjYph+QGsk8T6IssQ2LDnCn5L3O?=
 =?us-ascii?q?DACVWc7nPaAfB0fxdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2HzFXQwNOnTDi6e4J3wZ6C2+4zOaqJSxNGUxjJA?=
 =?us-ascii?q?AgNKvM3F9IW3Bzz3nW5Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="817280154"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:35 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 4FF68180001F6;
	Wed, 26 Aug 2026 08:13:35 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id E7A29CE1BBC; Wed, 26 Aug 2026 01:13:34 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
Date: Wed, 26 Aug 2026 01:12:59 -0700
Message-Id: <8d311bbd764e6b47ab63d838639aa7aa48725bb9.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244337

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2026-29008 affects the U-Boot TCP receive state machine in
  net/tcp.c [1].
- u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disabled
  [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29008
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index b13135c4de..8579e18d7b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -11,3 +11,4 @@ CVE_STATUS[CVE-2024-57257] = "not-applicable-config: SquashFS runtime code is no
 CVE_STATUS[CVE-2024-57258] = "not-applicable-config: The U-Boot runtime allocator and affected target architecture code are not linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57259] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2026-29007] = "not-applicable-config: TCP runtime code in net/tcp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
+CVE_STATUS[CVE-2026-29008] = "not-applicable-config: TCP runtime code in net/tcp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
-- 
2.35.6


