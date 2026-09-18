Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72236C982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 04:47:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4320.1789706842545634860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 21:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pC1i08p3;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hEvqNsPg;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-garg7@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2Uk7p2923690
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 23:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=fMITB4Ht/B8wN
	4YXH0V4fOIf6LiM+h2ZeZ/cuNR1o7k=; b=pC1i08p3vuBeI1j00+eYK2B/7O8wn
	3k7n18LNKp3CjVOsOgp2UU+bl+0tn9f1TD0yZHlXAD2TvwKPjruv5YeotyrIlPU0
	5C8c1D+U+UENklxmK2OS5pL1xlikQOxoeaCDSq+6Wnlml3ilRRiyEW3X23xOdi4I
	yus2pEIfSVo6hCx3vJoQeoG/MQ5b0jo9JNd9zrnc1yUMVZGBrq2ckD8ask/8Wxda
	p5iOgA7admEkWvuHvsurRq8SMETvn7ee8tThcyhyAVfl0Ncd9rU3ag2mJ+zwyZSV
	0x8odA65KVzuscomiG69IstIhuwm3JyZNDzs7kIas9t4uoZsYLC0EyFYw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4grutp8xkf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 23:47:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v184jXwfWs5RN6q0Kc4W3PNMcQpNG2D3Kmzpvymd+wF7J6r8gI1N+cQnMfGW++RVEovNMtotoh+jJDNVCMuxLXQud0RcDeQC03D38JWRceiQTOJn50JK5pkzRj5mtYh5VubqZ/4S1VBosizNeJxbnaTLixI7wRRt6lHmL3cafRy8qIKoiZPC9Jz/ae3xJ3JO/0KDoy2TCrANWAqDGNY1ULfp4gVzBvHz17ypo19AU8W2Dpnwp+8/tHOZpy446pgmKt67PGC7pJ19eCpoqmElR45ObJnF7710CnAJCmxclGonsVySWempFX3zXHVwLygbtttZ2piayH4ns9RRDTjjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMITB4Ht/B8wN4YXH0V4fOIf6LiM+h2ZeZ/cuNR1o7k=;
 b=ueVNRrCOUeyYqPnHHFmMCEo2RV0QB19b6aqfHsfkF78VkXdhZtTXlspkJS/F+mxs79CKM/9v7EQI4yaNSUg0d4kWM3A31jmJxDQTPMBgdEM6RN2NAqzS85AHQFLhcQc8nPSASJBu8bJOIx9aS8LSTjEH8kDON+SrBcobI6HobdYPdIYdmv3v2J9zLtqJ2vc6FiOw5aITCUjBXonRLh+ivSdBStmGUTwpeEb/5DTos6f6gP4yc+EWvP64YPzyeCp1mJC2etU28JJcehrdJKhmahh4UnN1HlMU8gJ0ZsvG5SlnZ2wU99pGevbE5RWDq/O2rg9F0gdDQhkPkY835JVsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMITB4Ht/B8wN4YXH0V4fOIf6LiM+h2ZeZ/cuNR1o7k=;
 b=hEvqNsPgXdGm8s8i0brt3OboCXauzt79Gbso/EG+5Bvfr1BQacpmPDaLsQWWz3w76wGh0W83Wc7RZPHTZCVYFa8xX8trX8/VW3SWwUMt2xZoE0JK7rL13ME1/xj1WWODSwFBqFU377uBnpDD3EzqmKT7VEAoem4DdU3lqgAiR8Y=
Received: from BY3PR05CA0050.namprd05.prod.outlook.com (2603:10b6:a03:39b::25)
 by CY8PR10MB7218.namprd10.prod.outlook.com (2603:10b6:930:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Fri, 18 Sep
 2026 04:47:17 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::4e) by BY3PR05CA0050.outlook.office365.com
 (2603:10b6:a03:39b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via Frontend Transport; Fri, 18
 Sep 2026 04:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 04:47:15 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 23:46:20 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 23:46:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 23:46:20 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68I4kI161044510;
	Thu, 17 Sep 2026 23:46:19 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <openembedded-core@lists.openembedded.org>
CC: <danishanwar@ti.com>, Aksh Garg <a-garg7@ti.com>
Subject: [OE-core][master][PATCH v2] linux-firmware: split out iwlwifi-ty firmware into separate package
Date: Fri, 18 Sep 2026 10:16:13 +0530
Message-ID: <20260918044613.172388-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|CY8PR10MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d64fb2b-1183-4ac1-f05f-08df153fe994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	BDtCI5ec0WAaTW0clZCiHo/j/rfA0hSSduUtqOVnbc1xNBq2OQBuI2KC+tGtmlB2DqlDB5UCN2r2Jc8ZUmp9zkgHuT8wXJiHeICSi99v8xZcY2ZvKG3cOhSOnzbV4btObYXP03xQo++/aTzVYD4q7eVW0wqjPrJlbqXomzBlgqMtIzUzZNK5XQq9sf2uYIMI2K+mp8ygDWbdAskOTPcjbCBOti7fz3KE1aAzXdORIT+BNg9KfjRZPNGkrbQzT8OutqXp9EttPdi5P3cR8EvfpFbZ/BzlbyvSW9uYc0etIO2Xe1smkMiDCiHdtnpvllrqoJq8FWvwcdzA7pF192Y4J5fq352/3kabcn8S01M1ZtTZ8OOVIILvzqK6WPwJghigCfdCUR+6gmUbMSRVhWxhsgqcW0R2QwG6K7GxW8DWe74S/N/w1h5QDxp+3QFbAQooNAYwD3s/sleG29Dv3qlONw8//PJGWh6NokEkzjfydCE9M2/lDDmW2tDjHch4oZZVGuniclbIObN00aFkoeSiKTTOAM9Ysswy0REME1PFrMhYHjyoBTubkF8R+0YBpE4Q3xs1S0TAUvNoucXeMtNbw6HfTwj88i7HQa/9XX3sPv6yGZ/kBpIbcSP4Bko/zuLISN+iokVARfbYEGLeppNiW6BPqvykQPP5hSXjQnPtMEDMOIymiwcoi8ptSxQCTvkEt00kx8c8F1JroYu7qC0PYw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VTO9CmlCi9ZT7nfxibIja/S4r2hLdxDG35hqsdmkQeZQfCZe3t+lheEQnY/pQ9hWZZOjwnbgFyet4iEKjQ2biqzvxtk6nlVIyCvOkhkp0Rj7vPkk3ywqslKaaYp5oBYs21CI7jmGQvOvSz5pPtamDGUHxGpv9huH4G6pT6FiXmWTL4Vqz7NDf8hGOn/vqL31/Gd01ROAvOTP4x//uiFqlcfxidHaiQXG5foCXWfvaX/qHMWsH6EiN9JrTwUkCLme+pG3VEQoztSRFLTZflpiQpPBlay3DJztUswaq2bbCRUw6Jis6ig3yl7r2CmHpT+dhhDT8ukElqA30FdOy0lat/RtF/mM28eUzxBLLqo70kHBLP4DMQJIQUNkySsmNhDptuRNoCkjNyrcjFAO+X7o5Qjv4UWu1kdCf41IlZyOr9gQOlrJogFIjoDoI1EyHIJJ
X-Exchange-RoutingPolicyChecked: 
	R4ZLP67Hza9Xq6OdMJJsGiRR+5qntua2hkWSZdjrhyO7PQe8bS8S67l25rxEqxCiBi50RIUcPkIaEOwFrJpeezyNoCyicjXULkS0TwexsdZfKdJIFqhSTBL7s7Ul3IJJVs9LYXtF2YUQ8rRNja8KHlijd18nVqlpkGS4WcoEKGbNGzX7Q00eLGKK4x8zRag6/qK4O263juoDKBkmwuqSvOVqyZQd0pi2sJGTkwTLF6a9MD39goP968jxWuruBzvkoq0gn4lx3LZHZp0Rq3N2T4c4aTqDianCglOPOW9gFCtL7hZXgHNrP/vyVj11bm4+7B0EWRz11546bMCE7XtJzA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 04:47:15.4554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d64fb2b-1183-4ac1-f05f-08df153fe994
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7218
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA2MCBTYWx0ZWRfX4EhuOc5RSIpi
 9TmCWb/zP1v8v7lvmg/8VHyD7aaGykOPgFoEa300jusFvev5GO4DkYcgq8WOU2T1nNi/50mWjLa
 1QpFkcDupna4Q9laexln7ct0jaf9n50=
X-Proofpoint-ORIG-GUID: RMEKU2gQORHpDFtltNCHgQhabG57ZW6u
X-Authority-Analysis: v=2.4 cv=BvAIUoX5 c=1 sm=1 tr=0 ts=6aacc259 cx=c_pps
 a=NuF0lfjhaYRYFIRzorixyA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=KXqEHgpBKud9h17YDC8A:9
X-Proofpoint-GUID: RMEKU2gQORHpDFtltNCHgQhabG57ZW6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA2MCBTYWx0ZWRfXztou+hz8ONHj
 qSEfI8Wj3ejdAytC9VtoZ8Ao9nobcoixzTEH4Z/GRzKFgI3SRaR9/G0Lz165YCt+Wkl/cx2qYQA
 5Fv9fcasNkdy4mdwvJifWkDX8QPRQvD0n5hqExZILrCetRMMYeYvDcbHvqh29c6LgvPOO2W8bMs
 BK79vzMm0pSIbuAVaVz8Vc+NLdRczm+C/AIormDHefUlHPoff+8xEJZ85ydA7QAc6Rf3fj+I2vI
 VWZKwZzijWIoqHLLLjYOx0rLzvR3U5JfEi+hqYaftHz0HnL5dHpoR55L5R8HQbnwUSGYN3Cg+Fi
 Z8B7tvMq1BKP4e0cc6CJnaG/fwjPpqYb3PaAGEQsEPkUWxRXEOJa66cuQ+k+TjYSF1gn9CaLgY/
 ZjjExHSwBNNxnV7rSFRnSFnGc+NNAYxBjkTracM8B/lBq1S4V6JcqGO5pwp9xoORsxlDhJ7HzS4
 etYmqJZDEriWIufaJyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 04:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246177

Add a dedicated iwlwifi-ty package to allow users to install this
specific firmware variant without pulling in the entire iwlwifi-misc
package.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---

Changes since v1:
- Updated the subject prefix from [meta-oe] to [OE-core]

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


