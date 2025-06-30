Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72043C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:11:10 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web11.41518.1751292667683051331
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 07:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=vxAS2Z2A;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=Yugh2auR;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=02763b3a64=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7o4wF006188
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=5cBnn5jCaB0RFNXaH830RUKzwgt
	kmYlUUwyS7VuHUps=; b=vxAS2Z2AwCQZNp5rrPuJy4eweBnIS11bfh3vhDvmhRg
	k+MivwsqGnZ4Etoh9pAcibV7T7gSVwpr2+Dyay/q2Hvbz+CR3Vhc1ilt2CFjXJpI
	uEFZX2LglkAwrgWrz0zSkKncWEbWi/0TlXfd953Ui8Y6aYyRuZdjVCMtT0RS6VpV
	H6HzcYUzZEBbU5Pv+OqVMJ/RFuPiv7nuiu0xRkJAc/f2SsZgAn3oufDniBs28cnJ
	DPseCA/tZSQ7pbwd4Xy2SBwTcudWZ9dDxbY/VU6fvdDSDnq2eNBBZHqXWLiduamC
	3Pod6E0655Wj6iVPdoH3yANRWTli6G0WUrQ7VncKzUA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2127.outbound.protection.outlook.com [40.107.100.127])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47kphtgrc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:11:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ted1PuIRHQxntG6I9CZuZQS2pKUQeF/u//v5Wrep7UPgRhuoP6nxYjFsqZ+H77FCcLqcA2VwKiHpOcAK0S3Ajjyvw4P23Uknw3+AQw7hUVlwMToUJMJLHOMX4gkjmrltvCHB/C9rabNPhOhBuELfA/M3pvm4eyt9E5Y9xzyyt3q99UZ+s2hfm/WKxRBoPjK8k/X9FgBOkCOqXFVgOtC7zh9jfS7CBAJgwLyLhKWNJfP7jdFjcchdKFhfl6OGxT8ZlWRnbkogDvAOvKytMabZjnMKPOc77fn15w/SpvBGdcF4ybDBTEiCikoCe7qKCmNosqWRLALglMYG+D20uWbd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cBnn5jCaB0RFNXaH830RUKzwgtkmYlUUwyS7VuHUps=;
 b=RKABdjo3fV8PNtwABrt44plH5byvRhOVhdkyac8MiziEIwJBR+JG7pXobJHkrJj8gBjHz5j1qLYsBy8XbPqEh8f2e8UwdHLrWz0FLspGkItN2P0K7Yy6GImrOAamonJZXKeMpykB6dIKaQCpscBNnaQkrYGO4buRMa9MHzOvEIn5D8iWXHYaLE+5JHExV8PkDydmlIRaxsuRxcS8/JT9rbrGjGUtOwwJJif2SBV26YA6nZAkGNh8vQXCotY0tHml8T9GsnMXP3XyAwQAQgEuUrxWrumK20EoaRCeRAPFnBDFY3oP9vB0ho5rKYvJw3AR9MQreMvNhb/WdeZN0vgF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cBnn5jCaB0RFNXaH830RUKzwgtkmYlUUwyS7VuHUps=;
 b=Yugh2auRl169TjaXxoJ02lzQaBPiwfkgpELRaU3uyCoBGAKp9PN8T2kkSFe42UnHFRzVALae+4wKIdQiVNjQgJZXrK2DNhPCsc4yI+Z2TefSehb6xP3cCBktX807yV9hMJSBrTikbS7M04CKQjauuRL318Dm1eTX8B2G6yxTLRmTQn2KKqyKdA+D5piZS+SVsaAV4+g0UM/RMxIl5p78pcGhRzKLc5sF18hv17o47iXmn3ryT3wJmrt3/QODmekUbr8QN1zpBB7Kz/iUTKrSY/UUj2S6eeZAbdVmTkUWEgRip7SIF+dpyxORF2T4XhndCSziT70h9IAObTkQ5TbFXA==
Received: from MW4PR04CA0050.namprd04.prod.outlook.com (2603:10b6:303:6a::25)
 by SN7PR04MB8604.namprd04.prod.outlook.com (2603:10b6:806:2e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Mon, 30 Jun
 2025 14:11:04 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::90) by MW4PR04CA0050.outlook.office365.com
 (2603:10b6:303:6a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 14:11:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 14:11:03 +0000
Received: from kc3wpa-exmb6.ad.garmin.com (10.65.32.86) by cv1wpa-edge3
 (10.60.4.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 30 Jun
 2025 09:10:47 -0500
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 kc3wpa-exmb6.ad.garmin.com (10.65.32.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 30 Jun 2025 09:10:48 -0500
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 cv1wpa-exmb3.ad.garmin.com (10.5.144.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Jun 2025 09:10:48 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.72) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Jun 2025 09:10:48 -0500
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [scarthgap][PATCH] libarchive: fix CVE-2025-5914
Date: Mon, 30 Jun 2025 09:10:41 -0500
Message-ID: <20250630141041.1326756-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SN7PR04MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f717e81-302b-4b5d-9add-08ddb7dff321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uwhbCk4r6G6lRncA1lM2Tgk8TBIR5kRGCOxN9Kf6PnHyNezOT0dmZkgPRdOm?=
 =?us-ascii?Q?eMVcmRszGdBXh2Jwtidi7KDby5EBzgsDdtLxaLHl1HJyac1e0gnI+033/4NJ?=
 =?us-ascii?Q?HUr2qcqFpu4k6GLo8/NK1XX2p7YLzmRGwIFHw47E9OZ6d/XvAZzVvHKWhCRe?=
 =?us-ascii?Q?WqmRn57pVvSLjF+rm62cxplBUW50zg4F17VhK2o0BI87NNDWkNMUO5RmDRTc?=
 =?us-ascii?Q?71YHpxUoK9ic4gzEAQc6bh96a35+gvGb28AwnnYZtbAl4SQk+fMXCla/cCHB?=
 =?us-ascii?Q?bheZvEx3cXdQ1tmXSuH04BIO4iu4vJr57sE3ZDPJkPe+PBRYg+cQ4wNvW9Tm?=
 =?us-ascii?Q?sVICMe8DjZWS+y+s+T9KbiB0AHESColrEABfxLlQEQqNR/+v9/HzonSzZb88?=
 =?us-ascii?Q?JhAKcEsytzpnVv7D3F3Q7BrY8mfAp7f7fLCl3tCRaQeXae6uiOc7WEtB60Qs?=
 =?us-ascii?Q?NJmoHBkJPKSC1cS6Wc5r/OLe6D/9QMXbDHQ7NdWuYrECcJLLt2TihQQuKTBm?=
 =?us-ascii?Q?lQ7HwYY9+eyGOxmvj4kBhBT+8XJFfQ7KlvQKBSZGksFNHi+UlNwOTUlMfY74?=
 =?us-ascii?Q?OWJgwJBDThAxphXvynLS5hhTkgoW+qvOnmlFRmcA3o7sMqNFi+nYaCdNp1Md?=
 =?us-ascii?Q?pHLd6g53jHTT/kHlGZwoIS7J+FIgmTn3S5ctPMcSTUwPkhHFyyhTsEj3ENSq?=
 =?us-ascii?Q?yxgeJyZcAgxsX0dJGe53N9CtZ3/+ZolyDO4ED9q1c/dhh8ZdE5x2VMk560Y2?=
 =?us-ascii?Q?aUES9vUNBNQEQyYIu0WxWB+DTGnFjE8U0O0zBMIXYWjcZVpI9yjm/PhohKmX?=
 =?us-ascii?Q?bM63dGFqi02dhv2meXWU9b+mgmkdrlTKKu2S6Fpqb6REl1N8+x1ARPhhvO1M?=
 =?us-ascii?Q?YLsLhlMrx7im1CluF4jzCHqDAc8+rVsl9FR/CS9TBWYjMy9qx1oZzroq/RtC?=
 =?us-ascii?Q?yoJJKS+jaM2xnD+7CSHCyrh7X9pF1BqYkHxT7aD5LwF2CWvMnDXVKtAHiqt1?=
 =?us-ascii?Q?kUcJvXf48VJe1jbjPk6GqJBuviNSqisW0mp7uOksZF+1HctOADHiWJZ4f325?=
 =?us-ascii?Q?KDGQmVgEXjadq9ISzQRptTDEn1hKy4zZsrn9pp3GoHU8NWyM67vsdn/846hy?=
 =?us-ascii?Q?NV2YwvKmWsZMrt4UDNfXirP04PkWUzu2yZr/xHnMCty+H+j6XUdlnmmR35qw?=
 =?us-ascii?Q?OCqjXSJ5WPggtTtD4EpIHTkNbqjY75gVstg1l9QBxXCcyuh+KBDTjeh+LPmM?=
 =?us-ascii?Q?HdsqPWEHVNZV5GOjphTW56F2BzMie1omiib3EmB5CcDw1QIcYr1UELkbUhvf?=
 =?us-ascii?Q?ucCyylL5FK1CUrLX7rfLAazKskUvj3+c+rWdBdVRq7w/uTGsoAHdopdl/g5P?=
 =?us-ascii?Q?G6pUZfVjQMEgRNXCIyS8avoPLIcSHfludt+DXoxXWfuYWvnk4dsuSXhi5iDf?=
 =?us-ascii?Q?J14wJN0S23nzvIaVm3DQM5xDrI5pQnzZriqqwf5EF5qKs6MS9+bRjw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:11:03.9448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f717e81-302b-4b5d-9add-08ddb7dff321
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR04MB8604
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=68629afb cx=c_pps a=RHCyCMrrLXgv8JsqJhyQhg==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10 a=qm69fr9Wx_0A:10 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=NbHB2C0EAAAA:8 a=tyuvAb6jAAAA:8 a=SnXriI-UYGMo4s_O1pwA:9 a=fYNom5PXsM5enKJDCoVv:22 a=vMd6T1JfvD_20K6YSfI9:22 cc=ntf
X-Proofpoint-GUID: sIDtKSEZNdNyO26LbYJsC9rSkIGXoH0s
X-Proofpoint-ORIG-GUID: sIDtKSEZNdNyO26LbYJsC9rSkIGXoH0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExNiBTYWx0ZWRfX1TfBboLUJ2JW qCwTWmMjBjF41Mw6W54PMiMjehreYpxO8+Uzy82nXvtOE8rf/LIPNvgfEQ5pdm0JBkehKRC6B2+ iehSJPcj5FLfd07fGcnzD1BumF0kJ23k25IhibLTTwASZIRWhx/KvdD2JdN76zmUv4rsYgERK/M
 PMwmxaiOCGeBDeR/ouNDurGYd1UwN14hRIcdDpZNj9rWv0xWkvr2sXaDn4X5EaCwah5uBwW0XKU FaN1hB/ISlObOj4KCMM/Bg8oodJe2ylklUXsdf6kpbBKFV5jzBW0tUPziGwiok4/iXBvm5UJDES 5Ev7T/6MjKAMJILRHPuXog7p20ylfFIscqC64s9xBsusggBXlqUAHr0kqTTDSKaoBjlCnhs7iv2
 PoTqNYPjNE8BUJnomTwo32uMcJMKn0TO7sZ2iosMaTvypfUmR5f8HmYNZ+OrMp6kvaAecYYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=831
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc=notification route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506300116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219520

Adds patch to backport fix for CVE-2025-5914.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 .../libarchive/libarchive/CVE-2025-5914.patch | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
new file mode 100644
index 0000000000..4d95dba209
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
@@ -0,0 +1,46 @@
+From 72a83b2885c31254687702e3a8429e3e0523221c Mon Sep 17 00:00:00 2001
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
+index 9d155c66..9eb3c848 100644
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 4dd6794bb1..5bbdb86e07 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://configurehack.patch \
+		   file://CVE-2025-5914.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.49.0


