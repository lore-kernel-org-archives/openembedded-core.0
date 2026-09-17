Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A747C982D6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 14:31:33 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38983.1789649763207820588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 05:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jNKKx6a0;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TZHyyGxS;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-garg7@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9alZo990774
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=6ekr6RYNvBK3K
	PiivdoajsCSfJ1IpVfRqqvTyjuQQ90=; b=jNKKx6a0OzjExJRK1h6W94/baSbhD
	K8MvXO6RR44ADk+w4oHdxOYYEE8bfUSU5gZb6qXzOvYS3NYFxrJKqFmpSr9NeO1H
	PU9fiDSgSBoI1cid5+ojKkZg/2ozsuI/JRmOBMXcoGaookmi/BWTo9lcJjPd59iz
	DeIHm3wwRhZFvIMIowsJnIB3Hubup2goDndFS1b9Xr91J36/xYxpm0xRDkU4fgT8
	+a4unEU2gXlT32ygkA4Eje5HKgYvmVDa6ozUCWIwGNClOUnttGoCq6XKN6h46jWq
	mxiVsmbdn0N05gsuRZl4Dw12iVcdHBziO/0ZGCglO3pVeUPv/GadtmObg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011031.outbound.protection.outlook.com [40.93.194.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gr8e92t7q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:40:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqsUVUCYfO6hTLoBFNNeFYHO8j+Rv7rKv85BArdN43FLvWjNEZWufBa2BbqjsROmQwmqaHdd3CzE9SKmeEh0exjv0rlVdVApp7/QOrisn9NQu61LGI9ggEsVLFKiFeUnPgypM1nW7L8WDUW0mXeDGRm0rQk5nRtcBWpOEQ0Qv9XOWVBihf/97LjMU/Kij0wUHIFl4Ou0ANAlMWReHhbHaOtxXtWMPCFrsOQfINDHsFAxTKAXBccR9zbyVD0/QtbXM+8l/zjAVao1r9Xnd81Oud8v1FWekcrcS+zKAjLW+Anf7apuzSjWhZ9JNTQpHz1fqlYSUFYxucIsxE58laG3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ekr6RYNvBK3KPiivdoajsCSfJ1IpVfRqqvTyjuQQ90=;
 b=Y/Ruw/D79ZEVoi8OT1xpi57m5qfTg3QiAyvzlL6fkKFm/1iyXr44T3LKYJwjNQc1ypl+rFMPSKD0dJtEV1ObqEmIOlslQBfB2webW/1Kl0lvYfnrp0bfdZzcrJIkEQEYLl0fRIyVNs2JsyqQ6W5stCO04J7ekNg9aRu5rmuKnkA/CmuZWK7+vQD9uOsGLQVI0WAPvR9Zc1uHVUDGSljWiO20lPJxf+tGPW2yseZPY5YWSnsqREn+czIwjkmHHS/E3/tQBo1lXRlZde4BZBNie7M8jS8EazZRLk0bZnhPBQLwWHYz0Ha66ME0G5A9Pa4Bo1iHCk5uTVt43x6tSr+o+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ekr6RYNvBK3KPiivdoajsCSfJ1IpVfRqqvTyjuQQ90=;
 b=TZHyyGxSn2VhmfkGdVolbCV3wGTEYy4/Gqf1+uTo/tiVw/BNnPBiIQWMEgiQJIIzdkEKMQIK4LrZRWW9wSStgXrvDKvfq4uIMpFyQJaCV2xInd6HGBCbymfQU7Sy7uoXP5z4iCPaok0+RXdXXjeS+f9TYHqcKrvPwNEEisctoMI=
Received: from CH0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:610:32::12)
 by LV8PR10MB7992.namprd10.prod.outlook.com (2603:10b6:408:1fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 12:40:43 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::93) by CH0PR07CA0007.outlook.office365.com
 (2603:10b6:610:32::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 12:40:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 12:40:43 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 07:40:26 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 07:40:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 07:40:26 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68HCeOqO2998987;
	Thu, 17 Sep 2026 07:40:25 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <openembedded-core@lists.openembedded.org>
CC: <danishanwar@ti.com>, <a-garg7@ti.com>
Subject: [meta-oe][master][PATCH] linux-firmware: split out iwlwifi-ty firmware into separate package
Date: Thu, 17 Sep 2026 18:09:31 +0530
Message-ID: <20260917123931.133179-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|LV8PR10MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f6470d-6d20-49c6-5bd2-08df14b8e3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	D5ZFzJOJz0b+Tg106lK9GeDmX4BjQZVQgOgTmm1eyPY+C1FKeKfQkdg1Z4yhcZhxt1tOgiyIxZI4x+B4osE+vigmQh8TyFpFC+4/X/Dl5bctf10NGijepCsjtgAHDiPcUNJ2a+nsPPAHdF0eilVoEMXw/a55/pP2LCvcZUKYV5Eep5q6n65Zvv2Jj36M1wbEBAf+piEs4bbCTfR/1/o/WBUJZj400A9SsZUU5Sald6OaimwEeFZGVmLcuKEaxrpE3eRtl2AwNE/+8/yXKIMHG9GOgYjX+JeZuB5fbgDC56fro4P0kP+cirzr4DKbzy7USNKlBbWqnQSaVDx8iSk5L8jvWd0jhKowk8lmgTfjuGijQ+z57NPFcom+55mg6ze18hrlcQe4GC+VnZY9UGL109xlkhkDXrJHoXVC45j8nV/+wjwRcnYyx+s+mZc1PlsOWl64OSDyZoamslcHti6mSp5lwBrLiQOww21+7Gt0DG8PGrVvZkrhf29+LMzSGdSPsyxxTEnhj6h5RlqeznrFUeQslgpJZQaIRijwdLkJmbvZVTwFbOg8i0Ix5Yx28IE+iZoAG4XIQ/6EnPn94YD/kYFdDFXwSUTVZn1TIwRGmD8CU4D/YhzBg7orsZiWQfcQxbYB58TFOh5hXUE69aXDYq2u4+BYeP0zeFgOybvNSnUcqvP8pntFOmE0JnqNScEq1Ny9Yv5w7Qf+BkevvLhLXQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9RnudiVVqs9x/Rr7JJcFsuQVucBFjPabNqNMQRZSBEhsUkjOeydZ8JLj17ex2dvjymvVl/cvQedp4KUF7BMwjnrFkI1L/XOmeIUYU/dr3//GVc5+lvaE6hPEzCyvXkKSyrkHGYpJ+Leau4BDVLT7WU2B0BFPEba++GkAYuGoagQtNj24eN3InUBmJbh7z0+Yd4n4+ySpDWqxF76yqwpzu5iaYXBef1wV45LkvvhWEhUqqQrEZhObHltXB4lceQ2TnshycrTzUuoX8eqeLiRZCkL/uBsH6M/fR024g2ZZiwHOlaGND9Pqie1VJfsSNG0MS7AUst5o9v2I2TYMf/FYSgN7fsnGu5/9FTJbwrOS+wIm4U/Ebx6rIoWDVDvVdCEXQ8vxN3IbfBINxOBsu53ahCuo+7EmfFKmDV+KwzqAgoZZsB5Mlnoy6nu3HURolema
X-Exchange-RoutingPolicyChecked: 
	ucNBELUlPWof5EVrdl5wyWk+MmEFh2R+1wADWkzVmsd/panOb3YB0exz1U38AijkD9JN/nQqzkcJdMMSpzhkl2z4uRibCAHQFRkK8nIxOeuwfRNOf2jB+04iAx86O+dEpFB6XeeJDl4Kjv7NQYdoXdp3BWYJuAPV1QJG8RBHAAm3vnXtrRoSzhPmu4K5HLttnnB/74Lgh0BWXfMKGjf3CYyuMa7IMZay4hYjoXZBJFF59ompy/4jRcMP2L9esEWE+weO5SlgTt0g+y7EFBPGKVmbsise9qm12EjGc+jvFjVa3s2Tfcvn/nB7EF0CCb00G8ZFyI/cr0L9qXDESdaf7A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 12:40:43.5693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f6470d-6d20-49c6-5bd2-08df14b8e3b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7992
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3OCBTYWx0ZWRfX9k3DtLVcaa/5
 RdpzlLzJYEcVZjr/IcgrBRclkR9jWz2WyzZWvmnD3OsZymx63clC+4X3wg6aXo2BVBSoT9BrCWP
 Lbn6GF2po9vKBiTqQj4W1CQVElwzw1E=
X-Authority-Analysis: v=2.4 cv=B9ssQ+tM c=1 sm=1 tr=0 ts=6aabdfd3 cx=c_pps
 a=Kwamffe9LshCGz4O85X6AQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=qGbu8v77Rim_swEcj9wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3OCBTYWx0ZWRfX92fS0SDeo63r
 0YOVxdQwl6z8DKuB73stOrgIgN62BDvXNh/PTEAE0I5VtvQZvZzTlrtdAfMOR9ZKxicZBvNTWPk
 QpOv+I2Mq6Uke+16crhCJEsTWcC32oHYLUPuCeqxTPoH5TBpbyxIXkSRgii7IHT1TmgGx3GEQ6c
 gu8NQqoW6nddWkGKLK5nhkK/+2WpedobamWhosp6ScBTaQ7MFe6sFBS6z/u0O/xckubifb1pSap
 Jdr29SyeR9hnrvd3T8Q2dq6GvYT4Hbt4uqD9dEDNxyWzmCMvhS1fLwQITrUaH2JuI2nxzoOeQzc
 IPvVZoMlai9XvmnvjxsdTacoLvVfx1DQhh8wPiDfNJMdHWqcEppXX7Owrfx96Hif9y9Pxrt7teK
 ge37CBKyM696sDWULG4OMPeZothEZW5KgUkaKCmGJpfMIdLq7EpY5pQJ0ojWR/3/hYDZd3YM/qj
 wLvqBph02z3+6fdpsnA==
X-Proofpoint-GUID: APo8Z1UvYdnDsZQ1q8arDtRmKxgpPie_
X-Proofpoint-ORIG-GUID: APo8Z1UvYdnDsZQ1q8arDtRmKxgpPie_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170178
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246069

Add a dedicated iwlwifi-ty package to allow users to install this
specific firmware variant without pulling in the entire iwlwifi-misc
package.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---
 .../linux-firmware/linux-firmware_20260910.bb              | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
index 3fc59a12a619..1b9215a09023 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
@@ -640,6 +640,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-9000 \
              ${PN}-iwlwifi-9260 \
+             ${PN}-iwlwifi-ty \
              ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
@@ -2191,6 +2192,7 @@ LICENSE:${PN}-iwlwifi-8000c     = "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-8265      = "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-9000      = "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-9260      = "LicenseRef-Firmware-iwlwifi-firmware"
+LICENSE:${PN}-iwlwifi-ty        = "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-misc      = "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-license   = "LicenseRef-Firmware-iwlwifi-firmware"
 
@@ -2219,6 +2221,10 @@ FILES:${PN}-iwlwifi-8000c   = "${firmwaredir}/iwlwifi-8000C-*.ucode* ${firmwared
 FILES:${PN}-iwlwifi-8265   = "${firmwaredir}/iwlwifi-8265-*.ucode* ${firmwaredir}/intel/iwlwifi/iwlwifi-8265-*.ucode*"
 FILES:${PN}-iwlwifi-9000   = "${firmwaredir}/iwlwifi-9000-*.ucode* ${firmwaredir}/intel/iwlwifi/iwlwifi-9000-*.ucode*"
 FILES:${PN}-iwlwifi-9260   = "${firmwaredir}/iwlwifi-9260-*.ucode* ${firmwaredir}/intel/iwlwifi/iwlwifi-9260-*.ucode*"
+FILES:${PN}-iwlwifi-ty     = " \
+    ${firmwaredir}/iwlwifi-ty-*.ucode* ${firmwaredir}/intel/iwlwifi/iwlwifi-ty-*.ucode* \
+    ${firmwaredir}/iwlwifi-ty-*.pnvm* ${firmwaredir}/intel/iwlwifi/iwlwifi-ty-*.pnvm* \
+"
 FILES:${PN}-iwlwifi-misc   = " \
     ${firmwaredir}/iwlwifi-*.ucode* ${firmwaredir}/intel/iwlwifi/iwlwifi-*.ucode* \
     ${firmwaredir}/iwlwifi-*.pnvm* ${firmwaredir}/intel/iwlwifi/iwlwifi-*.pnvm* \
@@ -2248,6 +2254,7 @@ RDEPENDS:${PN}-iwlwifi-8000c     = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-8265      = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-9000      = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-9260      = "${PN}-iwlwifi-license"
+RDEPENDS:${PN}-iwlwifi-ty        = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-misc      = "${PN}-iwlwifi-license"
 
 # -iwlwifi-misc is a "catch all" package that includes all the iwlwifi
-- 
2.34.1


