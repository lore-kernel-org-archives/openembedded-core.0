Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CC0C001CC
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 15:12:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20659.1712848324115734549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 08:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AtxgAOtC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48317d0765=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43B5vMQG014379
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 08:12:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=bSu/Ot8pcMM7MKOQFjOwkK72c5Td7ZiI2l9AiQlnevA=; b=
	AtxgAOtCec3qUVuOlvdu7lfvKduWJ/xMywxZh2OImObTmbrJaCMai/2eN91W4n4S
	kaQ2aExv8S6uFuSP9BRwvN6qr1XrCs19hupG5D6sjnDQNRrmr5lGj8xukcaX5t7m
	N+YCYTv8ep1ONOafCdbC9aF2F9/VfLBShSmJF0FHWrlDuAt4VjZN4kuIwpUrVkSg
	8Tf2VWhkAnd1yUjwbBdxSlX9NAYPbHEY50ysGhqVVJHbbT/1/91HjnwL2Dk2KCoV
	12hxvQqzJk/OOtL7pDuiFwYI112v6cMzHV3+gEwAbbQf7HXATaq9WW9cqfFkKP0B
	+FVwzl1EOsbkn8Be66q/sQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p0ej35-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 08:12:03 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 11 Apr 2024 08:11:53 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Thu, 11 Apr 2024 08:11:53 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Date: Thu, 11 Apr 2024 08:11:54 -0700
Message-ID: <20240411151154.1540948-2-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240411151154.1540948-1-joe.slater@windriver.com>
References: <20240411151154.1540948-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: S4QXfaG1cI_jmopWA82hrhUCzBYUbuNs
X-Proofpoint-GUID: S4QXfaG1cI_jmopWA82hrhUCzBYUbuNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=862 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 15:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198138

From: Joe Slater <joe.slater@windriver.com>

If the distro features sysvinit and pni-names are
enabled, RRECOMMENDS ifupdown because busybox ifupdown
will not initialize the renamed interfaces.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index d96d2f5fff..fecc3334ea 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -37,4 +37,6 @@ RDEPENDS:${PN} = "\
 RRECOMMENDS:${PN} = "\
     ${VIRTUAL-RUNTIME_base-utils-syslog} \
     ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "init-ifupdown", "", d)}"
+    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "init-ifupdown", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit pni-names", "ifupdown", "", d)} \
+    "
-- 
2.25.1


