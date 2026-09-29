Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506BAC9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:08:48 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.534.1790654918109779263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R4sGxi5D;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1097; q=dns/txt;
  s=iport01; t=1790654918; x=1791864518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IBOnn93k8PHzfYalVQM9ejAGi1sRWY7+2unyA9AmNtc=;
  b=R4sGxi5DvJabfMB5brHZj3KoSlrTSMFuO4MUK0OJ5Ww/8QGXnyxKm5Fo
   QvMSZhIx7goEgWSWagABwORyLtNnTWaC5/1JPSK4P3FwBPRAUrIyVRuZo
   +V2uMUAvfPTkv13p85oWsvetyGD1d5dq0iatQLvpa7cwYRRrXu4aNsq0j
   35nzOYiLrVw/zvgnw+2cSAmlVr6axahldhqTAr1sziVByQit6gqZk72se
   DHmG62uGNZveX5l3KJsZCvdqjK2NjKUxvyhIZmG0aEQpe8RcP+pz3L1Wz
   GrJo8Uh/jA4GxGoxDKJWtBsS6nd7+kNTC7IvKZGsyVchq/+yYQVI/426T
   Q==;
X-CSE-ConnectionGUID: XMNUU/d0RJKPdvMzshRhNQ==
X-CSE-MsgGUID: JS7PoNgySnuuvDeXpiA4jA==
X-IPAS-Result: =?us-ascii?q?A0BDAgDUOLtq/43/Ja1aglmCV3VhQkmWTZ4agX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjggCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBMCAQMyAUYQIDErKxmDAgGCdAIBEcAKgiyBAYNpAkNQ2zIBBQYUA?=
 =?us-ascii?q?QWBM4VAiCN1AYR8JxsbgXKEfoEFgVwBgi6FeASCIoEMgXiTOEiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdgSCCGSMZNnqBCV6BKylgARAXg?=
 =?us-ascii?q?QeCBwKCVIIBAgFJQw4HRVMJJUUSRyYiCBIJARMaMAuBIThBCSg/GA1IESw3F?=
 =?us-ascii?q?RkEPm4HkD8egmWBDiyBbBg5pWWhDwoog3aMIpU6GjOqbwsjmFqOCpZQhGmBa?=
 =?us-ascii?q?DyBRwsHcBWDIlMZD445hWrKOiQ1PQEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:RahsdqyEdtEdjCyjGdh6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUFm
 moWWjyDPKmPYGD0f4t/PIS29U9TucSHztRmG1Nor1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWYlaDJMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHETG7AlveovO0Ntz
 fAGDSIWbiqDodvjldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW3YIeOJoPSFa25mG66n
 T3++EL2EyocKcGB5Te16nOF2u3myHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:l0IWsa85fqOfl48FOQ5uk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3AVFHsXGlDzNptmqzGcdkcHQxcGMrXOU346krtZEP?=
 =?us-ascii?q?gM0RKcLGLbE2L+JlktfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Awc2rVAwOueEU8LVHrNi06kjXjveaqIaVV3gKt5o?=
 =?us-ascii?q?XgM+ZKDJcNgeFjR3rQKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528534708"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:08:37 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 29ED91800018D;
	Tue, 29 Sep 2026 04:08:37 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id C5F36CC129C; Mon, 28 Sep 2026 21:08:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 2/2] vim: set CVE_STATUS for CVE-2026-51401
Date: Mon, 28 Sep 2026 21:08:36 -0700
Message-Id: <20260929040836.2207088-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929040836.2207088-1-hthakar@cisco.com>
References: <20260929040836.2207088-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246808

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:

- The vulnerable code for CVE-2026-51401 is in src/os_vms.c. [1]
- src/os_vms.c is VMS-specific and is not compiled for Linux builds.
- Record the not-applicable-platform status; no source patch is required.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-51401

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c10c2d3424..796f0782b7 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -62,6 +62,8 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 
 CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
 
+CVE_STATUS[CVE-2026-51401] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
+
 S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-- 
2.35.6


