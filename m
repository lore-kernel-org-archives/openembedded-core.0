Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7BEC61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:26 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7652.1787732005343016241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hcVOLj32;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1127; q=dns/txt;
  s=iport01; t=1787732005; x=1788941605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sgct+espJd6WR7B/eAdWWsFk1nX91ZWA0leKexFjvxk=;
  b=hcVOLj32b1N5vMtpjIKPH8/9IUHU/gqWyeGRuqSIQ40D3vCGJu3Rb8kw
   Gzg/Udx45qD/D4FhEO5IB2hTPy/mbkdi50kJ9MatD7lsHGUS+d7aErZmi
   HAExqwMEwt3Hng463k9VqmrlbkNzKfFMFz9MCa/7G5VtYgaXwrJp4Fds0
   XxICWpozv4JCQnrm0jtcFb7gD+rzVapN4Jfw56SGHrdT6EtWjhmrYfSLM
   a5OnskotYO/i5O4GWpbewaiOmZuoAKKPOMpdAwpZwYwXNYKCDOTmSHTbJ
   FN4qQgpHCwBsM6jmn0NDZw4RKGQdBz8aafLi5cR7MvLx74dAOKjS0RlgQ
   A==;
X-CSE-ConnectionGUID: H2L+P6m0RVC6i5gBZ9an9g==
X-CSE-MsgGUID: ZyYMhgU5QqauaJBcPajY+Q==
X-IPAS-Result: =?us-ascii?q?A0BDAgC6n45q/4wQJK1aHgEBCxIMggULgld0X0JJlk2eG?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAYUFAo1sAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhlsCAQMyAUYQIDErKxmDA4J0AgERvwaCLIEBg2gCQ1DbM?=
 =?us-ascii?q?AELFAEFgTOFP4gidQGEfCcbG4FygUeDN4EFgVwBAYIthXgEgiKBDJNiSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErK?=
 =?us-ascii?q?WABEheBCYIHAoJaggUCAUlDDgdHPgsYDUgRLDcUGQQ+bgeOax+CSVo0LASBf?=
 =?us-ascii?q?6YfoQ8KKIN2jCKVVDOqbAuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD444g2uBf?=
 =?us-ascii?q?8o6JDU9AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:5m+XXqILxprsFo5OFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS12EAm
 2oXCz2GOv3ZZmqjct1ybIzipEkE75SHyt9gSAUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1OVmV1BdMdotxJKj9Pq
 PMyGmEEaEGM0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNHwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5Fwoj+K9aIKPI7RmQ+1nj3e9p
 m37ol3gCwwTFvaU8TOHwzGV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:UwvUGK+F8KTam9S2PPduk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:X9doIG4cc+8sj8NXS9ss1BQwWfh7dyXn8lyOIhK3I1Q4QbvERgrF
X-Talos-MUID: 9a23:EaFPpgYdpMcF9eBThS7doTFtCZpR+q2zAWInmq0PufjHDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="817280021"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:24 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 19E91180001EF;
	Wed, 26 Aug 2026 08:13:24 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id AD644CE1BBC; Wed, 26 Aug 2026 01:13:23 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
Date: Wed, 26 Aug 2026 01:12:51 -0700
Message-Id: <240b02378283bcfe760e1902a29fad5361fda380.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244329

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2024-42040 affects the U-Boot DHCP client in net/bootp.c [1].
- u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disabled
  [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-42040
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 4b6d89ed4e..b5711e1f97 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -2,3 +2,5 @@ require u-boot-common.inc
 require u-boot-tools.inc
 
 SRC_URI += "file://CVE-2026-46728.patch"
+
+CVE_STATUS[CVE-2024-42040] = "not-applicable-config: DHCP client code in net/bootp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
-- 
2.35.6


