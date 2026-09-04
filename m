Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0038C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:42:15 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12950.1788525725729000211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ati6fN6W;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1337; q=dns/txt;
  s=iport01; t=1788525728; x=1789735328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LGdoNnr46nnq0oiMSw7OUUekkmUgs2aR09U5U/G2c2o=;
  b=Ati6fN6WpnTQqh6UJdOC78eIXjHIMAdSVPRdC4x7wH9MIR38xiRwXCeJ
   JWeAcAv9sIWQx3pF2rwUzdUGGhrxD+l410HlZNnDSTNfU/BQ0D1xllMxY
   0Qf6vP3cFo1jRnFUhUK4b7U0G6r1oASbbxNfA68aeY8bP0eFZSBh+vGXR
   vFdLWo8Q0l/BsreeZGmIo5T0FBYAz1WxGh7MDW08RRJt1DLc0avgortQZ
   FqeUNmqXkpsxYCRlECCC7KnEcKyIH66pHEDqXkcFYR2BLXCg7Iz/DHIXK
   FY2Bby1FqX3OTplMW4s+hHY74078HpfTFzXnOIDyiqulz1ftQnab/QQN7
   A==;
X-CSE-ConnectionGUID: 55Ixb3k8RR+IctudS5HCTw==
X-CSE-MsgGUID: gm/UUk+KTh+pygP4xeK92g==
X-IPAS-Result: =?us-ascii?q?A0DFAgBAu5pq/5AQJK1aglmCV3RgQ0mWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQUCjgICJjUIDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QHQIBAzIBRhAgMSsrGYMCAYJ0AxHDIoIsgQGDaAJDUNsxAQsUAQWBM?=
 =?us-ascii?q?4U/iCJ1AYR8JxsbgXKEfoEFgVwBAYIthXgEgiKBDJNnSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2eoEJXoErKWABEheBCYIIA?=
 =?us-ascii?q?oJUggMCAUlDDgdHUwknQQQLGA1IESw3FRkEPm4Hjl8fglCBDiwEgX+mH6EPC?=
 =?us-ascii?q?iiDdowilToaM6ptC5h9jgqWUIRpgWoDN4FHCwdwFYMiCUoZD445g2uBf8o6J?=
 =?us-ascii?q?zI9AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:o+19U6z0TDneqUFwKHl6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 jEZXm6HPPjeZDH9ettzPI6090gC6J7WnNUyTVNtq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYlaj5MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBxrHJ0SoeUnO1sN1
 PcENTw2MzCou/3jldpXSsE07igiBMDvOIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUicC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOKyb4aFIYbSLSlTtkmd4
 V/7/CfaPhFZLM2Q8WaV/1H93OCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:Qsi/9K5p/+4ktcYJawPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3A3vyu0WgT2WdGYBjlW/qucQXfqjJuLyD83H2LIB+?=
 =?us-ascii?q?CMyVIQ6GIRWTN2IhYjJ87?=
X-Talos-MUID: 9a23:oIRWzAUgsfAXXE3q/DDpwwxfN4RL36TtEFECqckWturVbyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,262,1779148800"; 
   d="scan'208";a="827748320"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 12:42:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 1FC71180001C1;
	Fri,  4 Sep 2026 12:42:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id B9A07CCD9B2; Fri,  4 Sep 2026 05:42:07 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/4] u-boot-tools: Ignore CVE-2026-29009
Date: Fri,  4 Sep 2026 05:41:56 -0700
Message-Id: <20260904124157.1723755-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260904124157.1723755-1-hthakar@cisco.com>
References: <20260904124157.1723755-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245100

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD identifies the vulnerable code as the NFS client implementation
  enabled by CONFIG_CMD_NFS [1].
- tools-only_defconfig disables networking, so net/nfs.c is not built
  into u-boot-tools [2].
- Hence ignoring the CVE for this recipe.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29009
[2] https://github.com/u-boot/u-boot/blob/v2026.01/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
index 6b28718c54a..5e2ed063868 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
@@ -3,3 +3,4 @@ require u-boot-tools.inc
 
 CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
 CVE_STATUS[CVE-2026-29008] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
+CVE_STATUS[CVE-2026-29009] = "not-applicable-config: tools-only_defconfig disables networking; net/nfs.c is not compiled into u-boot-tools."
-- 
2.35.6


