Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96859C83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:38:10 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.42400.1751294290309825207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 07:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=HnBfMsXl;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=rOBQe0DM;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=02763b3a64=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7oHlM006285
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=R8LjE
	0YBvTPzkwvWCeJEyP+fA04wA1pBYQlYsa+eLIE=; b=HnBfMsXllxYmFWiXHn9oE
	4Dt3QjZD6wt85r4DiDnS5Z9JoZLRgF+2zAHB6f2MKTbSHUpSq6G6KogBTGqwhS6c
	hSvKjTp8xpHiYZeCSzcyRsP8zW92EIA0DwjDGqJxSJtpF3D9b9EuoiC/jfYpjIQr
	hGw2ILtLmv36vAnUIZRj3qauNyJ+NFk5Im3JSx7hqckygW6C3KY7MNZLFl6gjAVj
	DqBD4BrR77V/M53xnI/q+nDIo2TC48BC3/AtHCoX6NQIVikVQsFdwtXA4fnyx+7C
	ePhnh0fgXBED1z3Ga/mtyFiqucHx+1eZ8vhfLyaRWJ7SQmywhIa4lkTORL0GTAnw
	w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2101.outbound.protection.outlook.com [40.107.244.101])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47kphtgt8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:38:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh+hcQWWdK3ruSNrasOf6neffp20+27sYJMUplYIJSJYyQC6qG0gxkAx+Nw17K5LOFMA/RbgV7IlGD/4p9Rit68FHwVR9dO64zZWxS6QQYG/3Y1sD0K9Qa9s0tDo1F8BC2Qcqxq0Wt2mvC32wasFWSvjD2ntFfusUYS2EOHAfqB3doG4onyoZxCpTIFBmvfjxDg8JrOMkQdJVz8AZje6LTcnHDQOfpZUjs5h+VXj39efIrJgBigJ0np59iOSd0yI1TqqTygsFcmWzptCVJ2DThDACG1qpgpqfRUkfiq0MihcGCVEsouMORM6vse/GSBS8PnPlNfaS+zi2iSXUlG74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8LjE0YBvTPzkwvWCeJEyP+fA04wA1pBYQlYsa+eLIE=;
 b=xoHDdwQX7MghoLdmMOvIEJkk4NyFi7wSsW/Ae9qPmrB6FV3k6ZwGaJSWFXaGZnlZJvwgltDSQFHivvfUvDNblNjXRH4CNMDae8C81a+irbpMbaruRym3V4YLRoJ0r1lKsaucvfSRYqUBGRuLL4McDFS0oZ7EA80IUINP54l2mPEDTgPkwhlkR7vFSNwBar6ScXPKdnFDhF3ivHcBVoeg7R5Q9f7Epq1H/OvBC2PNbxqGoOtnydGXsH7Krl8IIWtbABl9MXuI2nHdHWkBbCEupXyFq7Q4Eakukfeer/9OTYF3ohI71ej3LBYLsatT+nJ/23KUbMc3CHy395lYk7EXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8LjE0YBvTPzkwvWCeJEyP+fA04wA1pBYQlYsa+eLIE=;
 b=rOBQe0DMWtwMjGo59Z+MxRnJc0veANwVMRG00rA9bYUx4K1rkFF5oLkDdUAQFAEP/lWk+tkRDDRGicmfBloBAUHsaXxt9E0FZYPU2++Vxw4EZCjatQxutFZ7zoaSdjaZL+ezqjezAcuJAHOZSfK/6pe9IgaqOvO5831RvWPYG6eFofbVo3jnj1xbgUVqOCmvT+YnBJ4ynql+Kbe+As4pDywylZqwF0DiKZRQQSMDjt4iwg1t8BnRoD1LP7KnnVaMP4L+PJzb4BCHP+KIX4blYlkJN/uSCYmcHkCJQie/HUi9yl/xlPY7PDlJPvijJMJcwIJb3oBg+0QakMLSxM/BTw==
Received: from CH0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:b0::11)
 by IA3PR04MB9476.namprd04.prod.outlook.com (2603:10b6:208:502::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 14:38:07 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::99) by CH0PR03CA0006.outlook.office365.com
 (2603:10b6:610:b0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 14:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 14:38:07 +0000
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by cv1wpa-edge1
 (10.60.4.255) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 30 Jun
 2025 09:37:54 -0500
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 cv1wpa-exmb6.ad.garmin.com (10.5.144.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 30 Jun 2025 09:37:55 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 cv1wpa-exmb3.ad.garmin.com (10.5.144.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Jun 2025 09:37:55 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Jun 2025 09:37:55 -0500
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [kirkstone][PATCH v2] libarchive: Fix CVE-2025-5914
Date: Mon, 30 Jun 2025 09:37:53 -0500
Message-ID: <20250630143753.1342627-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630140421.1322056-1-colin.mcallister@garmin.com>
References: <20250630140421.1322056-1-colin.mcallister@garmin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|IA3PR04MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f61baf-83ea-4c92-35b0-08ddb7e3baca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tZqcwCSHuBTCW9RJmtsPABao9acLSi1zoriHCAetpQNCcxNhvyh9dmbgRdP0?=
 =?us-ascii?Q?7ZxtvqaLW08j2PIWmG7HUCQsmUdQfM7hJnY1Y69bK/JMrsFq5+9ek5b1pn+X?=
 =?us-ascii?Q?l79wrtsIs5XSqnUacNYnDKYIVATmIwktj9C7kfGibVswK4vo2qtZlBwTLpu8?=
 =?us-ascii?Q?0FnYMUBiHP5k6Sgy1CuD6R1K4zeJRz0VBhi+HTflaZBJ+cpidQiian2IPYwN?=
 =?us-ascii?Q?v9tMBc3YigM6QTpkMyFXUcACQN0U6QeU/wIWfWj01ijnCjF0ieX3QOLmvO6l?=
 =?us-ascii?Q?VvlpkBkvFA1Nttjx7g/voQ4fS1Ux8aFvwyy+jNjWWgtZHgRPI2MSlGrEngwo?=
 =?us-ascii?Q?KfG9beMxl13wQmTIv9E44Gnxev4tjmCs2s3ZeAZsUWXB7UTgS8k0mBh3XsL9?=
 =?us-ascii?Q?ZnvkPtY61g1DIvLUqHFmH23f0gR/QCQLRp3FljlC1qJwyw4jgRsb7BjqyUn4?=
 =?us-ascii?Q?Tt7YVxMYMGNFLiwqS3KioZYxHJTqd+uzYlXNHp1k4PcRq4ADLGe/mTMVvS2w?=
 =?us-ascii?Q?ldgjZPWLWuZVuULrxiliSHi9qhm5WlQEeGvEanDh1FVNdL52BgpYeC8YBnDB?=
 =?us-ascii?Q?QvJLHAR97UE/Q8yqfYhq8SqA9RSlAgIqcmYsKt2sXWGCK1nsmUvkxPF3yEqF?=
 =?us-ascii?Q?kvlKRPKk/DqrpsDXLfllBwFqUCU5arTLpSBEydzymey5qLaoyNpLAFBVTjYH?=
 =?us-ascii?Q?h0jl5Iv7N3g67D7dHbZKLxncKJqU0S61CoSHAQmCZZV2e0kSusedO+lwZrYi?=
 =?us-ascii?Q?BKWuKaHRXjN4fy4XMz6IKqM42G/be2GVo6qrHCKMjX7GISAdP6yDwiL2PQ7x?=
 =?us-ascii?Q?XU56JgG/o31L8/cauioSJMYlggydI2uLXPXwxNllGIiP5N0O1GwahFg2JmnX?=
 =?us-ascii?Q?MYL8006RP28rjDMO8MSbWYaM0nlRvPo2oyM88TYZ60LOvM0vT1ISgkyXoW0V?=
 =?us-ascii?Q?6avG0SVkKDaRmDFRuCz/hOtSE2q+Hg35UCJ/3OuS4W7SAykefVglnyzSRVQW?=
 =?us-ascii?Q?64rp7RtEi/S8kk8/Q20wdgbBvzJpEyRZOviu5qMazBCnBVMB/1i/T8Siv+eR?=
 =?us-ascii?Q?+FZEK4CQMIAeqiI0/FCrSJ3HIr6V9bPl2ViTaAtQxSz+b8uA3fJJAuaA36+F?=
 =?us-ascii?Q?LGL0Z6jZsilMaMK+aRNRVbiaQiLKRL0+oBCsXC26hYKo8cY+S58JIs5ECS4s?=
 =?us-ascii?Q?6FDRnt2R6TMAU241swn08+m62SGwgtDaGRJ1gNSwOLDnA4XSay47fVoVzr3Z?=
 =?us-ascii?Q?4Kh+RUXc1BSuGzxfgXrvM0nsBq7xyY7PIs7Q7EnCWaDzR2reQ0MUnK4G7yVa?=
 =?us-ascii?Q?jMyjaI3ebAcudIoSh9DSFJPESjvJVaVEd34/rCabLVovYzldf6RSN0aOU1cH?=
 =?us-ascii?Q?+TgGVo788xlqMeBp9aWg/LC1QX+tGkB25FV3t1kNbnJ0g7t1tdE51CxTdpFz?=
 =?us-ascii?Q?TBjUZzddJS0QMTRAggcGxNtnz80qFW7P72gVR2f3ZrE4NTyykp5fTw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:38:07.4660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f61baf-83ea-4c92-35b0-08ddb7e3baca
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR04MB9476
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=6862a151 cx=c_pps a=VQV0i9s3/jMECRWyVTU93Q==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10 a=qm69fr9Wx_0A:10 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=NbHB2C0EAAAA:8 a=tyuvAb6jAAAA:8 a=SnXriI-UYGMo4s_O1pwA:9 a=fYNom5PXsM5enKJDCoVv:22 a=vMd6T1JfvD_20K6YSfI9:22 cc=ntf
X-Proofpoint-GUID: B7gKECAWQY61aBa0soANP-jIJDDnDp7i
X-Proofpoint-ORIG-GUID: B7gKECAWQY61aBa0soANP-jIJDDnDp7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEyMCBTYWx0ZWRfX08TZUVFE9iIj udgU0y/ck0WbjknYmtN/AwN6eMUNOfSmhibmUcBG7EkYpmNOezCwJvx2hcvqDRMZ4hSPMXK5Hbl CI+cinyB/BCMuSEL7uqFCpaaIK20wyMj4fxWS6ZasLTG7cRolhXwkk1mu5Yq/QiaIrYptmyWOJa
 KrDhWrvMmoVJQ7wg3RCETb2vUYYrBNiF9KCoq4dfIHMd5nT8hHaFov1gjtc53L6qWUk0q15oQHP bzBdHKVKPFv1x7BeNe3/u9HxW6qG5TCn1bebjwrY+z2XMzwZLbfp3zJrys4PybGi27ur7cL0yab u8ycel8jL7ft7amfa9uqms1mI52Q1gQnn6K1I6i2TmFcn5zm1wldXum3hEoJMzF5ayNV9M1kgG2
 WjBkM5jhn27mgtuvZnLX7Wc8aALhvl/Gfp/EV4Z2E2jDclFWKmaTiY5oVC/TvXEOKGMILFcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=911
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc=notification route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506300120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219523

Adds patch to backport fix for CVE-2025-5914.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 .../libarchive/libarchive/CVE-2025-5914.patch | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
new file mode 100644
index 0000000000..5607420093
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
@@ -0,0 +1,46 @@
+From cb0d2b0c9a7f1672d4edaa4beacdd96e5b53ead1 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Sun, 11 May 2025 02:17:19 +0200
+Subject: [PATCH] rar: Fix double free with over 4 billion nodes (#2598)
+
+If a system is capable of handling 4 billion nodes in memory, a double
+free could occur because of an unsigned integer overflow leading to a
+realloc call with size argument of 0. Eventually, the client will
+release that memory again, triggering a double free.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5914
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/09685126fcec664e2b8ca595e1fc371bd494d209]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ libarchive/archive_read_support_format_rar.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 793e8e98..b9f5450d 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -335,8 +335,8 @@ struct rar
+   int found_first_header;
+   char has_endarc_header;
+   struct data_block_offsets *dbo;
+-  unsigned int cursor;
+-  unsigned int nodes;
++  size_t cursor;
++  size_t nodes;
+   char filename_must_match;
+ 
+   /* LZSS members */
+@@ -1186,7 +1186,7 @@ archive_read_format_rar_seek_data(struct archive_read *a, int64_t offset,
+     int whence)
+ {
+   int64_t client_offset, ret;
+-  unsigned int i;
++  size_t i;
+   struct rar *rar = (struct rar *)(a->format->data);
+ 
+   if (rar->compression_method == COMPRESS_METHOD_STORE)
+-- 
+2.49.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 87d3794ab7..4d0e3f7179 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2024-48958.patch \
            file://CVE-2024-20696.patch \
            file://CVE-2025-25724.patch \
+           file://CVE-2025-5914.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.49.0


