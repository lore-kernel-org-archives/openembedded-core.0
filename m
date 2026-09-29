Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E804BCA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:08:47 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.535.1790654918157520476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ji0FJNod;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1081; q=dns/txt;
  s=iport01; t=1790654918; x=1791864518;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1J+8MWfykBCYUg5kXKJGNRyo1aNTe7GjKm23BZepYMA=;
  b=ji0FJNodQI810H3Qu9VTXlAkotozNB340cxqDGKar3RKDh9usLeIc5ub
   YKWYtQcCnnFFN8iSr7wTpaId42MY+Jr/Gb+Nj8VZuXEIipSpi2h3+4xUw
   ovNwnV/xPZYzApklxRnRr0Ksn0QLjMMJVd2au6MYo0SNELVwdG8k0GNGH
   6vMjX6iH49QU1FlA+34W4vALJQ5GsgGZgEBygowG8DCic7fd3F694gPfk
   VZoU+MwkxbAyaLjxxsATUe11VqHZbKBbG7xMAdhdjAFsCFRV6KB2R+0cY
   9cX62fHvqSPrFMPZEXFZVITM473rtdH+dR7cgE3rHDgy3g/i1Vb9bQg0o
   A==;
X-CSE-ConnectionGUID: pjIkOtlJR72yNZGL1+hNAA==
X-CSE-MsgGUID: frs8+N2OQnSH72eWh+QG4A==
X-IPAS-Result: =?us-ascii?q?A0BAAgBdOLtq/47/Ja1aglmCV3VhQkmWSp4dgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQWOCgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QFTYBRjBcRIMCAYJ0AgERwAmCLIEBg2kCQ1DbMgEFBhQBBYEzhUCII?=
 =?us-ascii?q?3UBhHwnGxuBcoR+gQWBXAGCLoV4BIIigQyBeJM4SIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EHGwYFgR2BIIIZIxk2eoEJXoErKWABEBeBB4IHAoJUg?=
 =?us-ascii?q?gECAUlDDgdFUwklRRJHJiIIEgkBExowC4EhOEEJKD8YDUgRLDcVGQQ+bgeQP?=
 =?us-ascii?q?x6CZYEOLASBaBg5pWWhDwoog3aMIpU6GjOqbwsjmFqOCpZQhGmBaDyBRwsHc?=
 =?us-ascii?q?BWDIlMZD445hWrKOiQ1PQEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:CPePwKg3WEag4FNYck1RXPk9X161NhEKZh0ujC45NGQN5FlHY01je
 htvXWzTO/+MNmT3KtB1PNjipxgAu8LXyYRmSQNrrHwzEipjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxMuvjT8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUA+Md0Jn1K1
 8ZHciErXD+n3qG25puSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIITUHJ4IzxjwS
 mTu8X7iUlI8bvumzwGlrSihue+MpAyncddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cE3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:27aG9qwSzG2C+Po4bBjnKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:LtFw+G8uc1Uw5nqLZUSVv1YWO8MCbnn/9iiKMmmKJkIwC72zYHbFrQ==
X-Talos-MUID: 9a23:sHWDrggsid7dE4hNFHujusMpOt1zs+eIUmc0l64m5JOJCiwzAhjBpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="520613596"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:08:37 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 27EDB1800021A;
	Tue, 29 Sep 2026 04:08:37 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id C366DCC1292; Mon, 28 Sep 2026 21:08:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 1/2] vim: set CVE_STATUS for CVE-2026-51400
Date: Mon, 28 Sep 2026 21:08:35 -0700
Message-Id: <20260929040836.2207088-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246809

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:

- The vulnerable code for CVE-2026-51400 is in src/os_vms.c. [1]
- src/os_vms.c is VMS-specific and is not compiled for Linux builds.
- Record the not-applicable-platform status; no source patch is required.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-51400

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a4f8162d31..c10c2d3424 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -60,6 +60,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 # Ignore that the upstream version .z in x.y.z is always newer
 UPSTREAM_VERSION_UNKNOWN = "1"
 
+CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
+
 S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-- 
2.35.6


