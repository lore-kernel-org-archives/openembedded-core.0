Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E265C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:21:41 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30263.1788769295030624531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 01:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E278BTm8;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1486; q=dns/txt;
  s=iport01; t=1788769295; x=1789978895;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zSlJCq1cq55UITEiXKXQ0CSJAmVV2Lz4H4C3FdrWbFQ=;
  b=E278BTm83L553AvLLhcll3wvWFEN6GBc+lv2j29E8DSBgVOEIzFlQkxf
   /YT2ITOOO8B6irBrpQAdgdzb+K4fR+POERX5I29S95aRchiud4MiQPMFV
   rppau4P09rvTi0GYgyJ9mOwkuU5mPJnaD6jg+Jfu5z4sT0AuL2GA5FVq5
   FKB+zE8ukZEnzDA0jdqN9+ogj7HVRPhahI3jAWkSs5cRHfEx53VylC0dF
   vNvkEOyn21FNHOokYq1mCGYY9ACOL0MxrAA/LH0fMbtvUbdQ6u8dx0Bbb
   UQjv5AunP8UCkvRpvy+zNAyZa4qkJS+HUO0L+31UffgnAs4DG8NyHcIcv
   A==;
X-CSE-ConnectionGUID: M6XF7WNKRGC0GuAjKOLC6w==
X-CSE-MsgGUID: xwoh67YuQcaWq04oK9G3lw==
X-IPAS-Result: =?us-ascii?q?A0BCAgA9c55q/4sQJK1aglmCV3RhQkmWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWOBQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QHzYBRjBcHQEmgwIBgnQCARHELoIsgQGEfdsxAQsUAQWBM4U/iCJ1A?=
 =?us-ascii?q?YR8JxsbgXKEfoEFgVwBAYIthXgEgiKBDIQNj2VIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEngz8jGTZ6gQlegSspYAESF4EJgggCglSCA?=
 =?us-ascii?q?QIBSUMOB0VTCSdBChIMCxgNSBEsNxUZBD5uB45tH4JWAWQqLIEbUhimHaEPC?=
 =?us-ascii?q?iiDdowilToaM6ptC5h9jgqWUIRpgWg8gUcLB3AVgyIJShkPjjmDa4F/yjokN?=
 =?us-ascii?q?QsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:FaMHeKjwFtlpgRz0FJEmIc7YX161NxEKZh0ujC45NGQN5FlHY01je
 htvWjvTO/iIN2P8Kt9yPITko05VuJTWm981HVdlrSE3Q3ljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMuvrc8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU9pNZZXl5o1
 sY3A2giczmBpMWS6+ykH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQUaz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIqOIIXWH5QKwS50o
 ErW4GP5XE4rKeWUwAWcqi6rpb7gxifkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:KMROqasH4tBwkV+NflGU7MuA7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3ApLThYmvPPftneLmE8ct6Hpry6IsALE3zk0j2AHW?=
 =?us-ascii?q?XIj5GVZSXani00/17xp8=3D?=
X-Talos-MUID: 9a23:hPMkpAT60tMY/BWMRXT8mzZiaphZ/p2lAX8UyckBmJirbihvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,267,1779148800"; 
   d="scan'208";a="832142977"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Sep 2026 08:21:34 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id DD60C18000200;
	Mon,  7 Sep 2026 08:21:33 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 7D52ECC1292; Mon,  7 Sep 2026 01:21:33 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-pip: set status for CVE-2018-20225
Date: Mon,  7 Sep 2026 01:21:27 -0700
Message-Id: <20260907082127.471223-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 08:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245239

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2018-20225 describes pip selecting the highest-version candidate
across configured package indexes. Exploitation requires use of
--extra-index-url with a private package absent from the public index,
allowing an attacker to publish that package with an arbitrary version.

Commit [1] documents the dependency-confusion risk and recommends using
--index-url for private packages. It does not change pip's candidate-
selection behavior. This change records the CVE as disputed.

[1] https://github.com/pypa/pip/commit/fe2721893636aa15ef04d02e9beb52f7fe9a0d27
[2] https://nvd.nist.gov/vuln/detail/CVE-2018-20225

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
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


