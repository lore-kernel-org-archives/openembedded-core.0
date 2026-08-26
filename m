Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10516C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:37 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7698.1787732011952222668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ii1kXvQ6;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1599; q=dns/txt;
  s=iport01; t=1787732011; x=1788941611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O1vSNf442yNL5/8U/BEjIkoCqb70/Q7v/VHdcgyXPeQ=;
  b=ii1kXvQ6dJ2UebFxekNtCNHCvUEdYfWCTgeRCsPE19iaqS6KZc8rTaVC
   zTGMf0B0R0oxn0XPSqOHji9QxM7noy2vIEb6dMGctdjeOBgyjmh+rYKPV
   RSV6d9kGgWDXY7V57Ve3UgZCdzbVhpwvqMXnKqqGmfnsJSgoj+Fa2ZFrI
   jzLTGbzhBKuT/Q+HQFNHBKAmptEaoo0EWFn+sFWWgXnRRHBffbBTPiu4E
   6tdt/gRCTtLqKfjHd7ZwdnMFXbFxd5NPuGr/Ejkchcni4ySkQXWanLbSg
   4ITXDEqo4W+LMdMAxs6NLpvMOBSOyX6OsCldCVBgf7tg6hf8sMmaG8juH
   g==;
X-CSE-ConnectionGUID: IUuYBfQ0TgW7wqOvD6COkA==
X-CSE-MsgGUID: gJnolPXoQ/2F2KCreG6vgA==
X-IPAS-Result: =?us-ascii?q?A0BEAgC6n45q/5UQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWwIBAzIBRhAdAzErHQ4ZgwOCdAIBEb8GgiyBAYNoAkNQ2zABCxQBB?=
 =?us-ascii?q?YEzhT+IInUBhHwnGxuBcoFHgkF2gQWBXAEBgi2FeASCIoEMk2JIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF?=
 =?us-ascii?q?4EJggcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJgQ4sBEynUqEPC?=
 =?us-ascii?q?iiDdowilVQzqmwLmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/KOiQ1P?=
 =?us-ascii?q?QEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:lRVakaIh+1fZlrdKFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS0D0Gy
 GNMCmqOa/vZNGb0edAlaYi/8xwEu8TcmNJhSgod+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1PMVwHF4Mhotp4Pj5R7
 NsGBG4mSROq0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSAV7AtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzPXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5Fwoj+K9aIONJrRmQ+1avECfo
 lr2+F2+WD9AF/eFxBXb7H2F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:4NbYqqBplshycC/lHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AlVq122glGgWmcuQ7OF/wZgiEuzJuU0DA/V3eGhe?=
 =?us-ascii?q?EBlk2V6SyV3PO04Rnup87?=
X-Talos-MUID: 9a23:40g+Zgt/09us6lynrM2nixNkM8NQ06OXTxojy7YtocSrazJ/EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="817280104"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:31 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id F32BB1800020D;
	Wed, 26 Aug 2026 08:13:30 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 98A41CE1BBC; Wed, 26 Aug 2026 01:13:30 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
Date: Wed, 26 Aug 2026 01:12:56 -0700
Message-Id: <e950afdc7e3c1f2930192d1fcc6806039b35aa97.1787731424.git.hthakar@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244334

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2024-57258 affects U-Boot runtime allocation and target code [1].
- The tools-only build does not link that runtime code into its host
  tools [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-57258
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/tools/Makefile

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 5bf2ca0f91..4b836fc989 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -8,3 +8,4 @@ CVE_STATUS[CVE-2024-57254] = "not-applicable-config: SquashFS runtime code is no
 CVE_STATUS[CVE-2024-57255] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57256] = "not-applicable-config: Ext4 runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57257] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
+CVE_STATUS[CVE-2024-57258] = "not-applicable-config: The U-Boot runtime allocator and affected target architecture code are not linked into the host tools produced by tools-only_defconfig."
-- 
2.35.6


