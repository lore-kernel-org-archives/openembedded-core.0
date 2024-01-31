Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5B8C47DB3
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 18:53:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3383.1706727224974224150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 10:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gjPff7KP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=276024504f=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40V61DoB006054
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 18:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=uuJVh
	Aw7tNxmYe352b4zASBwauL9j2LymYgCffNTdGI=; b=gjPff7KPvB/QQOI0OwX7H
	Uz9RsfRNc9gG0Ifvy+vGlNkTWRLAQa1At3mCz9C2bi+XOu6v6qYd91RMYvqClft0
	N0xHfVbzNeRJLsoCnAYeBfb5ISM507emjKwg1NbNLnLfXdlLHii3Cdhcjbon9Vt9
	7Y6MdRpEUmksl1M2j4EUC/49W3Qs1ivu4vPDmkDe6IfpjwpAbYrbZgWKyi03ZemY
	zVI92hMRorBZOTeRarP7eDaWgHR7f8ZeMPUg5sUNA5cXhbc/p+iLOgdFJZDdFocK
	FwsVJWZlrQbsznAHmYBYE7P27fC+Z49pG2XCPt0SzH5ZYM7IMTnpuGSDrTf2IJa+
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vyatvgw56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 18:53:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 10:53:43 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 10:53:43 -0800
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] eudev: allow for predictable network interface names
Date: Wed, 31 Jan 2024 10:53:42 -0800
Message-ID: <20240131185342.3602428-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yKsuhQRiVzt1J9KTWskYReHIcETcy7hy
X-Proofpoint-GUID: yKsuhQRiVzt1J9KTWskYReHIcETcy7hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=841
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 18:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194533

From: Joe Slater <joe.slater@windriver.com>

Do not suppress renaming by eudev if 'pni-names' is
a distro feature.  The previous behavior was to always
suppress renaming.

eudev is used when sysvinit is the init manager.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-core/udev/eudev_3.2.14.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index ddb3c3340f..18696679c8 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -49,9 +49,10 @@ do_install:append() {
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
 
-	# Use classic network interface naming scheme
-	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
-
+	# Use classic network interface naming scheme if no 'pni-names' distro feature
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', 'false', 'true', d)}; then
+		touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
+	fi
 }
 
 do_install:prepend:class-target () {
-- 
2.25.1


