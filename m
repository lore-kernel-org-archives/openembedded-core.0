Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A65FC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 20:03:42 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web11.5969.1750795418890404580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 13:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=vzofvs1c;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=Qxh3CALj;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=927078bb0b=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220297.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OE3Ep4015475
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 15:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=Vhi/ABJhEF9bp8PWg31XLP1XJ/Y
	2xnJh42aOYRkeeJs=; b=vzofvs1czcqaoRkbrG0MPr+MHqkBcIDgYH+Sgw136Nd
	q3vIrJE9X5wXc0xlLgNVGsQF8PuUt9pVUVzpS0nOG0k4vPcXGezk/a3oqofsCp2H
	TukkeDJ0pspbQjuq9Xr5emG3AiqedUlF1TULyBFZnZXN3BjwcH18wCboivIqsgB+
	OatmVTO++zCGX35GGWctp2fbKKXj3y8ef84Qr4dWloEJoCKKjbq7vmWSNs/LHrK+
	gqZClsVw8BD3fyXRU7I1Dd6gQgavu6rXk9XCyShwfuBAd/Gl36KMrIkOnjMttcJN
	EvbkeXrYrgd8+vrHB/49etzruBnHhByRCG6i5DKypMw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2116.outbound.protection.outlook.com [40.107.244.116])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47fubch1v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 15:03:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InUWuGe0eKyhDxAJAqqwOLWGg2Tin96gYHioUfIfeS2CmR8E+sCTMQ1HhvAOVCM0kJZ0NgKdDpRmq92IyVxDVETEuaqxJwfqBwAOzGAaeQonPDv8kK6ij+6fr/CGP9YU1jrudsZ3WF+vZ0SBs3NuLGxQvml3QIhOjMMuyu0t992t6PlR2xa4plHm0MkATlsWwge6fTXFQpikyWyA76pfqPfdVMDDPzCUAeHZA/Of+vkerqVE9/3oGvyzg0ZNi+UeCMkzUIf8bKaaZP7CA/Qs0QtjkEIwYJF2Ik6AG5j5bBrC97R3f0KKZNc9KrE0Bx678tQYDLQ/ngFUU/PB/+nQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhi/ABJhEF9bp8PWg31XLP1XJ/Y2xnJh42aOYRkeeJs=;
 b=oVGShZCS/YTz4QGF2Rc+krZWVFgTBA32PZ25Gfk3vyAuAKKV3yO7eSeoEqTWQ/pjPZrabYQm7OlvHdjDLmcdqaKZkHokL3DS8ptG3MyFAFtWNRfoUW/uXMrVMn+CmoqXGFVqniczRAX4tYF5cGevgPMSYMen+AqDYYnklycjkNghhOgpxFfKeh4v2DwPbWBvI8n4BeNmYeP34fu8sGGOIJtcCaye+wqTVU4Hu+EQjCCoU4cOHfh+OLLg7gzZiz8VEyUQAeZC7QWP87JfrZS+VZQFDrQTOLBVbFVeS+aKhr9GdNQse2TCeg9iRBpKF8NribYJ6i+Qymj/q8dbGcKEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vhi/ABJhEF9bp8PWg31XLP1XJ/Y2xnJh42aOYRkeeJs=;
 b=Qxh3CALjBDFSzqNq/FVxPuswleWOBmxI4+VKheg0SlN/+8SSb153CcleM608WEpsdXbfcZuyCbOlhDUKB1UScAmPwjsnPp7elM77GcImTr6ujbiwQJ57IRH2dv1Yss6EHVVB0UX1WMIlKQ19O9Z8CQR0JmgZZv6qYoXjIgb1VzT/0FKjleE3uwFYXWoaGQjiuSgHV2AsJvE0Dwd1s+0uYzL53Bm1Sxxa+bkjy7i516EQc4s1hHychDsoF8+YmZdHiaXaDalgfyFkhhyKKZEPthm/5cL+L8mswmXw2Rja/cgkftvz93IJ4M9h8DVW7hsFH2Xs/nP0Qm7OnXvUaz95Hg==
Received: from BN0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:408:e6::26)
 by PH8PR04MB8686.namprd04.prod.outlook.com (2603:10b6:510:253::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 20:03:35 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::72) by BN0PR03CA0021.outlook.office365.com
 (2603:10b6:408:e6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.28 via Frontend Transport; Tue,
 24 Jun 2025 20:03:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 20:03:35 +0000
Received: from cv1wpa-exmb5.ad.garmin.com (10.5.144.75) by cv1wpa-edge1
 (10.60.4.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 24 Jun
 2025 15:03:29 -0500
Received: from cv1wpa-exmb4.ad.garmin.com (10.5.144.74) by
 cv1wpa-exmb5.ad.garmin.com (10.5.144.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.34; Tue, 24 Jun 2025 15:03:30 -0500
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 CV1WPA-EXMB4.ad.garmin.com (10.5.144.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Jun 2025 15:03:30 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.72) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Jun 2025 15:03:30 -0500
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [kirkstone][PATCH] ffmpeg: fix CVE-2022-48434
Date: Tue, 24 Jun 2025 15:03:03 -0500
Message-ID: <20250624200303.2306422-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|PH8PR04MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: dc83bbef-0561-4f9e-003e-08ddb35a33c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g3WkXefnl6AeP/aR1p030PCShvK8ZWTf0qwWBJgj17IYh1cSjHuye2l2/LRq?=
 =?us-ascii?Q?zm+irjNYK0fVvsumIUZ+T+nHHiF/rJigRNcfC5Djy/0A5dNtbUBdzOGd6n3T?=
 =?us-ascii?Q?ViYwiu3fzjwG4otrrIaL+7gytEPr5HYNEAA/0/+yB5aXKCQ16qP9Qxt4NREr?=
 =?us-ascii?Q?zRppE1bMACckARp4Yc+UwHgCzJNEZ/My/Yibu5Mhc6r306MBu5HwTwBtyfT6?=
 =?us-ascii?Q?OuzxgZ1FrjeaX5yJCzqki9qYaKFt2rFGm7QMhUXRSNVgXGaFEOUsRaM6m4jT?=
 =?us-ascii?Q?dvTP6fdCk3Uz74hsIsYE4/qbjk236e29T5ElYTLi11drKH7N/jl5axIlfSE2?=
 =?us-ascii?Q?ryK/I/HvkL/S1G1NfOCEFlE71eQ4cq5YHNnkBMPCqR4RB0FXYMLZ+wtnt1FY?=
 =?us-ascii?Q?kYoG+mJ9WYw7H9trdDoomFtoN1xlmmzOuSAW8k6ZMoQux338N1Mhqc7Th5HQ?=
 =?us-ascii?Q?LURak0QpZL9MnJt1C43imsiQT6cStvhpsGt0M/M01VxmtBgvxYnBcNHt75/U?=
 =?us-ascii?Q?lAbrnrDGRz36dZw2d4oFVAsM/JN52MlNsEOPyMcqbR3AAInxQTlMV/IXEQSb?=
 =?us-ascii?Q?2jWbkcQUdMPs92RpINOLbfHgFLMRzv9MlGzdij7Ouu2cZGRNcK3fDtLd+oKp?=
 =?us-ascii?Q?R6vbeo7xAwcbS/AVPFeepX3QuvB1+BVnRyIMszpqqCTjeikOUzUvrhM+4Pn3?=
 =?us-ascii?Q?SOYQ2h72Q4FVyPp66PoTR/LEZwbI26IL+PC0hdGTnXchAQbPmwhjDQ/t8Dli?=
 =?us-ascii?Q?wetOqejp0Od5djcJojf8MAwsZtYWZeVrQHBcUb9KxqqZ2ilWdQdlYZJp0SCm?=
 =?us-ascii?Q?WmlrFM4IyoVwW0S1OfTJeNeHgebiI6qTMh0TKvfiwi5OO525orazRs9/ns3O?=
 =?us-ascii?Q?D8o16w3+ycPXlvAQsMf/vMIDdN/xXlDB7ukl+d0dZOiV6BCzLGzCHngjsT51?=
 =?us-ascii?Q?DbvV2A3owMtTMgoVBSBvfW8XWoEy56RM81E8Ok++z41hqdAhU765PboJgnku?=
 =?us-ascii?Q?h3/51AjnNrfqI6QXkEUhUlgIsMKewZxcysfb3BefW8zwdzpPjThvypu/eJCg?=
 =?us-ascii?Q?cfk0WpduQElUGBrSoEiL5QMS5fSIU3v/ros2FjIpEcuZlSg8i3oRWwvrklr+?=
 =?us-ascii?Q?Ppj+H+v9ToQD88v9hUSPdOERCXaRyvLbH7k7TVV9+TP9j2xOJlESluBrrIjf?=
 =?us-ascii?Q?HcGb6kq6RRRtMbRd+7DyrkZ86ZhFU4ayp8XW2mZDTdC55/y/3EHmvm+FtENK?=
 =?us-ascii?Q?/R/ceB6y0a+b68ofyH2xOkk9UghKkmj+MipACSXOb6eTcqXRb64UuuF9ECCj?=
 =?us-ascii?Q?7EXi5PndG482OHgZn6djoy7Bw7y9W5FdnbfOk/+23LFKudyEp8cndKZVpVbe?=
 =?us-ascii?Q?BLecxiDYi9M5mGHH0M34HSw/d9BvE2g9h00XbiSCEs4jjPQD+hvGMsb9NwlW?=
 =?us-ascii?Q?1EF2s8aSIgSdg3S1azHVUWAiyWT3G5mSgBVmpSLcSP2qqeUqm5Gf5g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:03:35.1692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc83bbef-0561-4f9e-003e-08ddb35a33c1
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR04MB8686
X-Proofpoint-GUID: BXQcPxef4Rkj-K9eEJx5kxZgvEeWnyTD
X-Authority-Analysis: v=2.4 cv=OMsn3TaB c=1 sm=1 tr=0 ts=685b0499 cx=c_pps a=QxEc4wFvC0dhPryvSPYUew==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10 a=qm69fr9Wx_0A:10 a=emhf11hzAAAA:8 a=iGHA9ds3AAAA:8 a=NbHB2C0EAAAA:8 a=bKTH-c1hz6oR1aL6MFsA:9 a=HLUCug_QN4oeKp6PugZw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 cc=ntf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE2MiBTYWx0ZWRfX+ltS3xaREX/Z 8o7o3MDRMyBYb1pygJCrEmMABD4PYACk4v08OLvsYh1d/0r86FZYUXLSDdxahAKdbjAzVv2fzAY uUYKBtdqvWBY0NTZ5yMXjHQ7ZwmcILA9xyUvhh0WoubecU5xp+TsdvyFn/eGqS7vHUBcvqfpPNa
 gEnaRz6hOAhwWvwUyAvD94290ST/r2uh0d4yTsgju3USdYZkZVUrg9XGi4RZt+dUUlOFolNXIFf nmlhCeAJcLoQ0VVgYYMtgidlRlf5QWByEt0nvFsPr/ZzrcPic1JZcoAdEH51H5Gtud5GKen4NS/ Nr5L2DISSikIYqoWA4gz2lVbXuceTkisMwjBxbNCkFUj2N8vQIBMoF0qhc7+/Yq/bW0ugwcK4Lk
 18+Sgw6YF/fJv59S3ptEuCiEHpILhuHckTqNGMnDW9/ZJEx1JKTFjnyXIJZ4a4MmgRHoRkWH
X-Proofpoint-ORIG-GUID: BXQcPxef4Rkj-K9eEJx5kxZgvEeWnyTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 mlxlogscore=842 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 20:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219280

The patch for CVE-2022-48434 was removed when ffmpeg was updated to
5.0.3. The CVE was fixed in 5.0.2, but NVD has not updated the affected
versions yet. Added an ignore for this CVE to mark as fixed.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index dcdb65d2eb..57bd4c5442 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -86,6 +86,10 @@ CVE_CHECK_IGNORE += "CVE-2024-7272"
 # bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/43be8d07281caca2e88bfd8ee2333633e1fb1a13
 CVE_CHECK_IGNORE += "CVE-2025-1373"
 
+# This vulnerability was fixed in 5.0.2
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/3bc28e9d1ab33627cea3c632dd6b0c33e22e93ba
+CVE_CHECK_IGNORE += "CVE-2022-48434"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.49.0


