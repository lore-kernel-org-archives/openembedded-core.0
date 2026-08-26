Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A74C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:36 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7699.1787732013337054212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b0Oh7eNw;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1589; q=dns/txt;
  s=iport01; t=1787732013; x=1788941613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KVDQiPQEUdc+Ntafgh1M4DTHoChxLJidrgmAa9c3k0I=;
  b=b0Oh7eNw1EbMQDPX+TQgd/CITRqpWcx4JUSqtsznLIlfMZ+eT0izgrOl
   cTNfo2/PjCHjnfGB9g0rVRzGBdvFKx/jC3C+CDnC4xjI365xxXK65cQfW
   tIltUqGy9FOpIdDXmnBsHANoGSnzeNwd38dpeew5Zafv6TN0J3+P2ItXS
   E2fUl7tpEwYyXgqLxwASOme4lvJJicIKNS2HtOptpToKqNuiaqc9Iv9MC
   QV4HqKiAMr3Dnvpr7WSfMlzD3dW2PJCdh2+nIslZwrmn6SwUO2e1UT+21
   4C5OpUlyJu+3gnjCMQ1FKAuyWGkskl33V2wmOokCfLcIFHyvb85XvfcKp
   A==;
X-CSE-ConnectionGUID: BwvjvABfQMWe6iUGNlB7hw==
X-CSE-MsgGUID: w4uFLM1kRZS19npRHWiBQQ==
X-IPAS-Result: =?us-ascii?q?A0BEAgC6n45q/5UQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWwIBAzIBRhAdAzErHQ4ZgwOCdAIBEb8GgiyBAYNoAkNQ2zABCxQBB?=
 =?us-ascii?q?YEzhT+IInUBhHwnGxuBcoFHgkF2gQWBXAEBgi2FeASCIoEMk2JIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF?=
 =?us-ascii?q?4EJggcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJgQ4sBEynUqEPC?=
 =?us-ascii?q?iiDdowilVQzqmwLmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/KOiQ1P?=
 =?us-ascii?q?QEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:cvDkRaNxDTByhVLvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUom1TRWz
 zceWm/UO/mJYTTyLdt2btyxpEJTvZXVy4MxTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gWAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj699xEkMoFKcWw8NIDD9Py
 NM+LBpSbg/W0opawJrjIgVtrs0nKM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY+BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237nFUgi+GyYIeNEjCMbdoJg2i8g
 zvFxVbCW0AcLOa/9juvy0v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:gEY+aaAuvnXT2fflHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:5aVYJWORbYwTSO5DcjZ59lA9MM4cV0LQknbtDGm8IzlpV+jA
X-Talos-MUID: 9a23:P6kBtQncWg/7NED4XTXqdnp9aNpGx4H3C3o/qsxXvdG+FRNxEQ6k2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819317850"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:32 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 730841800085D;
	Wed, 26 Aug 2026 08:13:32 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 1749BCE1BBC; Wed, 26 Aug 2026 01:13:32 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 08/11] u-boot-tools: Ignore CVE-2024-57259
Date: Wed, 26 Aug 2026 01:12:57 -0700
Message-Id: <06c1bea59c9793ee9e9418663819551578148b27.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244335

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2024-57259 affects U-Boot SquashFS runtime parsing [1].
- The tools-only build graph does not link fs/squashfs into its host
  tools [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-57259
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/tools/Makefile

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 4b836fc989..898b808063 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -9,3 +9,4 @@ CVE_STATUS[CVE-2024-57255] = "not-applicable-config: SquashFS runtime code is no
 CVE_STATUS[CVE-2024-57256] = "not-applicable-config: Ext4 runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57257] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57258] = "not-applicable-config: The U-Boot runtime allocator and affected target architecture code are not linked into the host tools produced by tools-only_defconfig."
+CVE_STATUS[CVE-2024-57259] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
-- 
2.35.6


