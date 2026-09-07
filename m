Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CC9C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 12:37:41 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33727.1788784650709784953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 05:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GnE+29bU;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1742; q=dns/txt;
  s=iport01; t=1788784650; x=1789994250;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v0c2J8RN/fUBp1uF7W7G8qJR7Y15QCAtHVlTsczYjRs=;
  b=GnE+29bUYQY10mBQKs7Jmw4YcvmZTiLfIxVz/OgF2JPiSnELhUcqxQo/
   1G7XUWJjMadHjXXAHqCCyDXNxsTx4pTxmHxyAOJwrwu5hHV4D774PEf4I
   wKgCqGQa5UxbiHY9mBROGIghHjg3nGy3nzHs1k3b6fyozEksUORAcCRaP
   ZpAQtA7fc0QFrmBgVS/dteHJ3sUjoRggj++7jcslSIiI8KBInzX9aLOTb
   Zd2tFhmYg7R4I7LHRiMEbOeEPLb4Hp5S8wR2460JQWpZ0hAaFnTM/BqAJ
   wb//KLxyIXRjUx8idfL2Kd13lbW/+6cF/l+wpuRWYdD5dzi5mL8Tat2MX
   A==;
X-CSE-ConnectionGUID: FXo4OOMbSzC5/B4e41gw0Q==
X-CSE-MsgGUID: FvWA58LZQ+OFb6129CUAQQ==
X-IPAS-Result: =?us-ascii?q?A0DDAgCgrp5q/5UQJK1aglmCGD90YUJJlkqeHoF+DwEBA?=
 =?us-ascii?q?Q89FAQBAYUFjgUCJjUIDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkB82AUYwXB0BJoMCAYJ0AgERxQiCLIEBhH3bMQELFAEFgTOFP4gid?=
 =?us-ascii?q?QGEfCcbG4FyhH6BBYFcAQECGIIThXgEgiKBDIQNj2VIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQcbBgWBHYEngz8jGTZ6gQlegSspYAESF4EJgggCg?=
 =?us-ascii?q?lSCAQIBSUMOB0VTCSdBChIMCxgNSBEsNxUZBD5uB45tH4JXDoEALCACeVEZo?=
 =?us-ascii?q?3yCIaEPCiiDdowilToaM6ptCyOYWo4KllCEaYFpATqBKB8LB3AVgm4BATIJS?=
 =?us-ascii?q?hkPjjmBHwEHgkSBf2XJVSQ1AjsBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:P8XNGqNb1GA3HVrvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUon1DEGn
 TBMWDqHPP6NZGbwKt8iYYqypEsAusSEzdJrSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf0g2Esawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69teCx0RGqgSwfRcXCZkq
 fFEcT8SNinW0opawJrjIgVtrs0nKM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY+BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237nFcti+a8bIWJEjCMbetLoW/F9
 kb0xifeLBtEbYbO4gesy0v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:QnGVeK94onTHDCYhOtxuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:ehHqdW1VL3QKH3L8Vv9WX7xfNPAiLlr66X3rMWTlTkw1ReHMRkDIwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AR7eIqw/STDRn2gjsMWI0+KqQf+l23I3zWGQ/qNY?=
 =?us-ascii?q?hlcPabHYhEAq0tQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,267,1779148800"; 
   d="scan'208";a="834369474"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Sep 2026 12:37:29 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id BDEE318000175;
	Mon,  7 Sep 2026 12:37:29 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 56C72CC1292; Mon,  7 Sep 2026 05:37:29 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2] python3-pip: set CVE_STATUS for CVE-2018-20225
Date: Mon,  7 Sep 2026 05:37:20 -0700
Message-Id: <20260907123720.1669136-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 12:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245253

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD marks CVE-2018-20225 as disputed. [1]
- pip searches all configured package indexes without priority and selects
  the highest matching version. --extra-index-url adds an equal-priority
  package source. [2]
- Exploitation requires use of --extra-index-url and an attacker-published,
  higher-version package with the name of a private package. [1]
- Upstream closed the related report as not planned, and Red Hat classified
  the issue as WONTFIX because this behavior is intentional. [3][4]
- Record the disputed status; no source patch is available.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2018-20225
[2] https://pip.pypa.io/en/stable/cli/pip_install/
[3] https://github.com/pypa/pip/issues/12874
[4] https://bugzilla.redhat.com/show_bug.cgi?id=1835736

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- changed the commit message and made similar to wryose patch
---
 meta/recipes-devtools/python/python3-pip_24.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index 1b6281c81f..7107b1c8df 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -43,6 +43,7 @@ do_install:append() {
 }
 
 CVE_PRODUCT = "pypa:pip"
+CVE_STATUS[CVE-2018-20225] = "disputed: Exploitation requires use of --extra-index-url with a private package not present on the primary public index; pip intentionally selects the highest version across configured indexes"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
-- 
2.35.6


