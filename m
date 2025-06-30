Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7953DC83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:15:30 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web11.41626.1751292927637312894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 07:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=zTBoyUID;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=K0wOjdv0;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=02763b3a64=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UBArp0008513
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=HZA6hUicTFnTqw8/PPCwZU7GOkp
	9U5+t6MtZtT6TTlY=; b=zTBoyUIDYxRNW1DbvypPR76Hs90w+i9KhLUTQVZUkQa
	nGn/HHMXOgJFrIsbfFjUHPIZolqqnOUFLWYuwafFPtROt1wa8Me7/qU5jmwnVVdF
	Nd3CRuxri7KOCjB/M0h4g0BGl/ZvRlTwhCzszc563rD+boPOOqZhkMzZxcb4PHj8
	GwgcCkef2lOcLZ4yK5jlZ9PpNEeuzjVd1VF6QRLBHTxOC0wdnjH6viYak6+crhu1
	98AS2j1COHWjgQ7JKAVygf5NlFbPvNVFGV2e1zCQQQT4z2YuQaCHvFqF2YCmBBz5
	vmD9xCifb7qKkSJ3wxBawd8T0Rbh7zbHbbdCMqs7pgw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2113.outbound.protection.outlook.com [40.107.93.113])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47ks5xgexr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:15:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1GjeSojnzvQg/KFX9ku1Fh7KmjYo4HMQeiBuVicll3gBoOgtOgGTMNXJ3Tih1vIQTwafrKb3GaP8W3RuLS7QbIHK4AdTdtXRSmsbmXlbX9nI8j6I+rpZSPozs67/BqWuITRLuY8a2y51ZH2a6GGrQsRka9o6V0v/lLJ11GAbd3v7BuAwtsHF2lAcri1NHHU8QJ70RCPEK4jeOdHpQrdJxceuwI/wrlvhPwsz7E98LtaFShoHq2CmwtEWkiGm0n54+fi/BagMDpo9KJCFe2kEIOb31uWunZsv/JXmFRPp2d2De6F/D8mZQ7nodHxIoGe8D0bfemgsaMA7fjFhWT60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZA6hUicTFnTqw8/PPCwZU7GOkp9U5+t6MtZtT6TTlY=;
 b=NBZvGw09h78KxWnKDnyb8fvuf0cotJ9Ea7D0RJVk8eBs1d3qrTkqbe6CP2q3DJxwu27+0y7pn+RZNjbGtyKAXipPF3s1qL1e3Sm5tcpIZ8nonqKS4HjZW6Bsj8CsVnJmTvcElNG9BGQzh7/GMbiSfgcSkfgATtqDlBvZAO23ZOEREBd8xIMhGaxUjH+Iu+QjJc8BOzuHkJEvBeaISrGydOptLrNX0sT8wSyf58YsUGbMzudKgSrVQ7X9vB3+cUpP06Oci1yn6b6z93qWA55BwyF5rXTQdPnwf3uY5IY7nGpsI3bGvwjAjp3Jj1HTSmfusSY+SDEkY3dG0SY6rTcycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZA6hUicTFnTqw8/PPCwZU7GOkp9U5+t6MtZtT6TTlY=;
 b=K0wOjdv0B1J60V2p7YjJczFKMt5E64S0/ZsSleK1zdqsssqbXkLxNhQSjFcGRb/eQEwlc3/GhrSORpcKw2X9GFpv3XkXLjzG3w2Cw3dIOwV1dHoBQBoctilen2dwBnxZgSn5wu5H2VYf9CT9UHCOOUjWZPaUJXGhCWw6hfJi6Q/or2ZeMt9WKFh58kKAICVfbDXqHyXxo3Li5dZqyNoNzKqD/4vPY+2LTLlPJ6xXvLMJ/S+/MZcaCgUDDCoSBNW4ShEEJOH8tiifE0I3TaAiccSdrYVeSGUlttB05FHTD0rkQBL0dbS6Svpd8uhKWMEaPQzqRHrdaU9FynXuEuzfZA==
Received: from BLAPR03CA0177.namprd03.prod.outlook.com (2603:10b6:208:32f::30)
 by LV8PR04MB9243.namprd04.prod.outlook.com (2603:10b6:408:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 14:15:23 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::8c) by BLAPR03CA0177.outlook.office365.com
 (2603:10b6:208:32f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 14:15:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 14:15:22 +0000
Received: from cv1wpa-exmb5.ad.garmin.com (10.5.144.75) by cv1wpa-edge1
 (10.60.4.254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 30 Jun
 2025 09:15:17 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 cv1wpa-exmb5.ad.garmin.com (10.5.144.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 30 Jun 2025 09:15:18 -0500
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Jun 2025 09:15:16 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.73) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Jun 2025 09:15:16 -0500
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [walnascar][PATCH] libarchive: fix CVE-2025-5914
Date: Mon, 30 Jun 2025 09:15:15 -0500
Message-ID: <20250630141515.1330011-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|LV8PR04MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2683e7-9b6b-4fc0-2ce5-08ddb7e08d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oNkJOLz6fPGTqJMYfpoN0QieyOPcMIlVXnS7rwJuD9Oq3v50TVUIJsIVty3H?=
 =?us-ascii?Q?K88W2Dr/6elMgGOq6Hx+0W2OrLYaaYvjnMGEGYQ0torIV6lH9WsPGT7r4fZt?=
 =?us-ascii?Q?jsWGrtgoOkVdBGNAUDNk1YHt894qh7oxZnrZrQStuWLb/AMeWKewgMU4CoeR?=
 =?us-ascii?Q?PZfbiQ7YK/YEqrhjz+pyYYD/jcPi3XoBifAhFLg3ZPByGgmKeIjNK7TDWw/e?=
 =?us-ascii?Q?uUoBdx4fcvYzp9PokaatAx6znJGR0TirlLIcVjJl39s+C4HiXlthY1BpYxjM?=
 =?us-ascii?Q?MD/AP+nxZ+kNivkWWglHMzAt2PtW6LGqKy4PoQGtXrsOJRd+gl5jwl55cOie?=
 =?us-ascii?Q?nZHF5iB53A7FGbHUI6/gZCgpREW9Ai/y3zqTtv/TlgTPvEqnKW56Qon52FAF?=
 =?us-ascii?Q?SdIIazKYAoC6ZGOgu1ywFVv27v4ecyPiTonojZ3Fe5O7L3DR/l9gVolBZtLg?=
 =?us-ascii?Q?yodPSr/rftb8XGsYzUFe+pJlBAigfv8YIwBVcu5a3k/xUU/I9FPGByy+oKtq?=
 =?us-ascii?Q?FbYZWdFIpTHTQq40bAEhnavGcUklNDukNb8dmV0L5KTxxpIRVLayo27V8vKS?=
 =?us-ascii?Q?dkdyht6VgCf9SozpvRVtq3xEcpifoWpjaIoZRII0uiJfQ+awwErnGiG5Hvtf?=
 =?us-ascii?Q?jtF3N0o6hekv9yp8lATgV5j8oGOPnnidgvwpkQhzJf2Mg7fNKWro9lhqeSAL?=
 =?us-ascii?Q?7b9opH339abxal5gdOoX9kfTiRvL9osUI+hgPBn7V4qVNARjuvqjGAVJLdV8?=
 =?us-ascii?Q?Mv0JSoRGE9biy4LAkpiexgj7qmJh9MIdhzhd92lBuc4+4kJdq8lrP8/licZx?=
 =?us-ascii?Q?BKU+hhoJlSwXK67tW68DmPWZpnj1EXa77aS2Hzz7JqiHWCFkdBWO39oLGIJb?=
 =?us-ascii?Q?HuK5nuCmBED1gqATbfcvjcTbiF5jjjMtyQCyI7gMBWShRZomWWTVQv7zi0Pw?=
 =?us-ascii?Q?AVxRs1911ub4o5nLkSxwwibqxUf++z7GQsRrHrORQEM23cucqC9kGAfLjdaK?=
 =?us-ascii?Q?ERI8hgiW+bBQvSROrqwTNxndwbxQ/q3aGdwF2GtnsY9mNAukhkMwOFqdxBzz?=
 =?us-ascii?Q?Xd431/16rHNgyqjxBYMOUrUawXjFDq8U/UHf5RlwV7b2imW+OXLLKT6hvD14?=
 =?us-ascii?Q?N8MMxRBc85fb8PBL/JjEPXXF4kURA8Fc0ezKZUYnEVI8LLNYSTuA/ZiNNrKV?=
 =?us-ascii?Q?kHadoV94583U4ihN/gJQwWFE8VAM2TvYTn+w5noU3uM+eESDbOMCrotmcN6b?=
 =?us-ascii?Q?6VXZ44Zg4tHGmeIy51/Do85U2lEJJOffNUdvLUyl4DMRA34L+7SXSBzz4ucW?=
 =?us-ascii?Q?bRf2sC8chipxATcC/JmF6gCfEzinrMg//gDgASFDb+u3aAl2zIyUFN/L9/FG?=
 =?us-ascii?Q?Ubz0AUm5pWjRzX6hcXfMEpbKu6YPk0Gs8qDV+aVZorXJAf30MkXhrOsAxRwT?=
 =?us-ascii?Q?Z0J+qqnmXz3WITbOKRrAkZWxHw3ULmzG864qkrw11gIXktOHIXvioA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:15:22.3171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2683e7-9b6b-4fc0-2ce5-08ddb7e08d19
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR04MB9243
X-Proofpoint-GUID: rw1rbvyKoob3bKdIdFlDRtRhaBk9pi4N
X-Authority-Analysis: v=2.4 cv=FNwbx/os c=1 sm=1 tr=0 ts=68629bfe cx=c_pps a=geP91i+ePdFUAuWOa/V+BA==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10 a=qm69fr9Wx_0A:10 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=NbHB2C0EAAAA:8 a=tyuvAb6jAAAA:8 a=IFXIVXtIK6IkTHrz_voA:9 a=fYNom5PXsM5enKJDCoVv:22 a=vMd6T1JfvD_20K6YSfI9:22 cc=ntf
X-Proofpoint-ORIG-GUID: rw1rbvyKoob3bKdIdFlDRtRhaBk9pi4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExNyBTYWx0ZWRfXwRgsDlDkCjt1 bJrtHO4+urYPqKNA3k7pFDyUPjl9fE9ocu3seElJgs2kQiwhz736x1Kiy0x381t+08/A5Z5JyJk scmJLUiyiEY8hOBuLLl/SuXqM+Kq1UgnKEdo/fOKILXu07Z06Bm7c4us83QehlKNLgwRkBBHdQh
 fV1mAShIvZPaJVGO5/73u6/YWxdlNykMVMVWU1Hjr7Trk33J1GWveCIwetqRyuBeBP68cUEcRJd e3lCr1sI792nPcL2sDBs56vV/gHrYCIhVA6MccbAy/gmSXiH4dokBQJB9c4oizQdS8JUOocrzs4 km4r8jH1+XDsGWT1NT1hnn3nJpX4KfTfHPtzZwdKCk6PlUaRkO7FjS3QReTChFGblQ47AhnGo5X
 /a+oKXf77Z1D9KonYzOWzeaaoGD/uVgN8Txq0HQ9LE4G9oSwon9pV7JbjFe2Kv1l60wKLWRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 mlxlogscore=794 mlxscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506300117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219521

Adds patch to backport fix for CVE-2025-5914.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 .../libarchive/libarchive/CVE-2025-5914.patch | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
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
index 9d134f7d38..1fa61c3218 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -29,7 +29,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+		   file://CVE-2025-5914.patch \
+		   "
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.49.0


