Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71594C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:04:50 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.41557.1751292285338025937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=Rdgn3Rhj;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=Cce/HPqp;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=02763b3a64=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UC2DFY016088
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=an4EWI4rndGa5sZw9AiTnEC4MiB
	mTVg16IJ/UG7tzWA=; b=Rdgn3RhjQuXXMGbTG99bBvRW3zEZkYlzo0NIS3GTWTX
	O1gRlS9l0JpRdoJLxqdVXZE0AXDvvO8gEJI3+4C1WBCfB9L9oXGVWrfsJaAJ8dLT
	urBwFweyQV0sYJteGCUkBnQ+fDjeGGjwubDKPQYRxTgvvjtRCTOKA+JDh6tozMSX
	yuN3XjJH+7RXu0t9uLEnkptkCRijr9yozD3va+wUO5elc/Pd6m6sXlH1LfV5+9fD
	Y7Al/zvnAb1DIctsbOPJ1re2YgVIwuM5eexTUWpGfPlckRvrVLQXZ9DZ8WEXvxQ/
	Lu3vDORWXg5ZqhTr7+ADEeA365CO8+iTqjudrDp6m0Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2094.outbound.protection.outlook.com [40.107.220.94])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47kt7qgama-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:04:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzujJTBHLvy/sLEnmqbSc7fbGkVJyD4s47MrfHmK+9ZPmlB/G18SUgYp8dC+L0QJiHWiGangjTHA1///mWRNF885l4CUCm7YZowKTmsGprVrkT11eAAXwGNN2GWlNVq7uVSmnhVt0GXK93bGJe53Uc8+ltyQF4gmeU6+imtN8snS2TlU2CeR79M4/CdX809nQL8x7z+BYZOcUCqvZkGW9Z+meAakbvfzgs67Sv4in9Vp4ESmh2ffV+Bz8rHCEINUmg36Wmo7BVG12HpKV+cmLyKE7DDQ2dCTN+LWcZbAYOCI7BncYZrBtAJ/8Lbp2InT1QK21xYBgothDnf9jL6utA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=an4EWI4rndGa5sZw9AiTnEC4MiBmTVg16IJ/UG7tzWA=;
 b=hLfgtsVxgR0eXG5+iKORrIZ4Bg/wjI5VEmlSJsoFaP/cFiMA3fxWX5kCJn+r9qctf6DbSITzcocpJ9dDgCHE+9RyzFq8EzllXM5rSVngZRcE6U3Bp0y3L2JBtQ+V+URux0iWTgWrm/cPJzJ7/LOL7IuSAXeimnvTddB0A4dm1uVbdD2Ku+Kp+eAh6qosB9BjeIcdtBuwLvN3NsLxrN8l7vsWoofQEXrZ9THGir0oq/2BPBl3vsgnAWjoFtIFWkx6fQv4AkpH7ucg8SiRllj38u1i8ZS8AagrhHInx/HKnFedE3AP3QsXLMbqRTM2Mb2lHXgefLCGMYojkenPqdRgqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=an4EWI4rndGa5sZw9AiTnEC4MiBmTVg16IJ/UG7tzWA=;
 b=Cce/HPqp34jgr3thEuk1nYEEbUCQqOUn7JzyKjOYwllrxPcTTvPl2lUz16mXQBhbSCB1tMRf9QOqiVFzBE7S1Rz+Pek6a5qZT2WMSi4OBwu99ZFrll4hq420+LROVWJbu6imip1Hmz+yGlcVFr5grpFTKVkuIMDmTATmHQQne3oNpf0WHjilJU9Fg3IAN8Ab1NX6GIHM4YXcaawToOHBZFiv9ZNW1UwGM5SocnLWCIdpNTbg00K5wm1j9bSWADHHqVSTAgnzi+2R4An0qOVk7G+usZTviP87spXBBbrMwMiZq0TMg1mTxYEzk4vQ+lazW/FJMEQcREVVgEmNzscazQ==
Received: from BN0PR04CA0004.namprd04.prod.outlook.com (2603:10b6:408:ee::9)
 by PH0PR04MB8402.namprd04.prod.outlook.com (2603:10b6:510:f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 30 Jun
 2025 14:04:42 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::7c) by BN0PR04CA0004.outlook.office365.com
 (2603:10b6:408:ee::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 14:04:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 14:04:41 +0000
Received: from cv1wpa-exmb7.ad.garmin.com (10.5.144.77) by cv1wpa-edge1
 (10.60.4.252) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 30 Jun
 2025 09:04:23 -0500
Received: from cv1wpa-exmb4.ad.garmin.com (10.5.144.74) by
 cv1wpa-exmb7.ad.garmin.com (10.5.144.77) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.34; Mon, 30 Jun 2025 09:04:23 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB4.ad.garmin.com (10.5.144.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Jun 2025 09:04:23 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Jun 2025 09:04:23 -0500
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [kirkstone][PATCH] libarchive: Fix CVE-2025-5914
Date: Mon, 30 Jun 2025 09:04:21 -0500
Message-ID: <20250630140421.1322056-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|PH0PR04MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 835a334e-c44b-4a02-f710-08ddb7df0f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J4TT4EEOKdrphyrnv2ADvD+kKKqzFsz/geQZS1MTMsrJXOx/t/DKUJdCXQLZ?=
 =?us-ascii?Q?RuRy+hAqUrQ7dOef8Yf3kCbnmXmyDv0x8j7EYxr5xZ6C92dQdILEY+WyMRxq?=
 =?us-ascii?Q?5unDnD4HmfbVnMUQ1B3dn2I9DsOgSStLfj1rBq0e9etuk6W00TqWclseEfDS?=
 =?us-ascii?Q?+2szbXCih19/jKskBnLE0st+eRE8hVlCayWqT8mWWahhbih9/YHDP3eCatOH?=
 =?us-ascii?Q?NCmgallEYWmVpfxvaLuDDv14kgl2i0SlVjhOTCpdoZ4yhB9OVUu66DbVIdU+?=
 =?us-ascii?Q?jkv44EwZumKkwN5b0VnTN63CWR4jYwav0Lkv2b56HNM5UVAnpoHDpXzCB8EX?=
 =?us-ascii?Q?ACtwgXEpCFZwejE63pcfGaG3LYSNVu/kmYhvdJt39yhuc5Majy5svi573W8P?=
 =?us-ascii?Q?ScRjm6fElE1/6W+OSwaCR7gQ7Ws96XWAk7mZ/rDX8h6zwZM9erjGNBvCf5Sq?=
 =?us-ascii?Q?mDq9WhC07Bqfe2avwtxHsIhtSDnanNtYx+F2owkEz81K/rOXIT0WTqucD1C2?=
 =?us-ascii?Q?5NXaUD0fgBF80hf6VZJV7s5R3RNmc+xbiSZbIqS0FENx8ltcHCH5iqsaEw/p?=
 =?us-ascii?Q?qa84i1FXgWDdUnupXtTSMeLH3YLb6dysdr+q1IwT7XbZ3KOCE4UyceOJgVzv?=
 =?us-ascii?Q?OR8Y1BZOVh+Xbcr2nlTjASDPMFahS4OYsR0tghLkMKH7SbLfCISvBMD7UFQK?=
 =?us-ascii?Q?7aS+am3tVWiWgLxVrzQWnr4dIhI6pCbb2gyBJgRaJDTVfu1RTmOXqOpG1CMN?=
 =?us-ascii?Q?J6k1hkUfmpoQwmF4cm4klWe48+YYZR71FQsmJhlnSEb6VR3bUeL2/qCW1hXg?=
 =?us-ascii?Q?1zwEZDUSYKMC8hKNyT1UeHxh5C4yPNRInjoNRKt6/LRZqGL93SAFq2GHcLj9?=
 =?us-ascii?Q?bxHQJGqUg0mcYV+Vwonu9muGZ7tBo6EboAx+Of+jkoxQRWtrLWfs7SWMFre/?=
 =?us-ascii?Q?LTSg7zMyhx9kJUx7roID9xIlCkOb3lZ+7Od1L5DSx7IGVhhNnxVF3jH2/n9k?=
 =?us-ascii?Q?L7wZKIh+iJG5fde60hYH+OJt0dVb6t2EAzkMXDQM0tmtIW/jv/sX3SCZal9t?=
 =?us-ascii?Q?TIWyqZYyCwGJHcZAIE7X4qL7IplV223Jp1fi3bWc/c5NiCBt4B/A1yAW1GlX?=
 =?us-ascii?Q?o7WnAnF46OJfD98aq1QApuPOSF3ClWAzuAZX+qmYAFvAY8HliRlfDAUHPOqv?=
 =?us-ascii?Q?e++PTpuBsWMoFN/mqIc48LxbK6f6sKBSK3zbvAWsLB9Yteizlf3MgFQ8LGYj?=
 =?us-ascii?Q?KsuAHTiun7FYjPlQLkUFZZkQcnmkGP3s1mXQ5qJXO5MmlTE8IttP4y+z9Kbe?=
 =?us-ascii?Q?3qV2HOfjoIx7tJOqKarANoKho6hwNzp9D9PTJizwQAEa+i0n49Ooz27JiI2D?=
 =?us-ascii?Q?LC/HD6kRpsDFA0uaHHVbn/ORl7UKZMiOvtP6oajA3DKKIBrwkOqqjZl50RZ5?=
 =?us-ascii?Q?kPue0c1rHYvSeYWfMt9nOWlzdCqrm2F9YfuGlUgs5bB3O9QokOiFeQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:04:41.7446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 835a334e-c44b-4a02-f710-08ddb7df0f4d
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB8402
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExNSBTYWx0ZWRfX5Ib9ajaIInwL fPaLF2G9cF0l02IMtlC3pkIfs7Qlt6PWsfMJO4NkBSk1zGYDmaT7a0MLnoeq6TfrNMmTVCGCylQ O740ubEOm0v2ZtbehDBbIBLhgMZzOMhUQtaThDlhpvW09ny3N2tK8nbFS8KYSEm9KFNe6F1KUDO
 qxXhz4cCjjez+MwS4cQkobJuh9qh0tkzgjcsSWPuHolgvNFWf00ys+Gi4f57rqmltt+nFnyDili E+PLx9ccxoKgzd+qLs4YKBX7ZasSPvJEo2PcGCd50LKVBFa+RVxf+VZYezRl8uTIMe5rIWWxrqN rZRzDN+ieKG4tM4X1Nycm8J0uvl/cHwjJa92JB+FjVnla3KubA5hLu3e/OLq7L5Ih4QPEu3jZBF
 Gsp/d0aeDUBN6qRVF8j9psMvOehEG9cqKTSTweZA3fIkDYxpKuBvE0lNjF/IxyDtALLh4B7D
X-Proofpoint-GUID: zyZiubV75rt_j55OYm16wHOILguEtZWc
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=6862997c cx=c_pps a=66nRxDIErMJmNYYA54FM+Q==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10 a=qm69fr9Wx_0A:10 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=tyuvAb6jAAAA:8 a=NbHB2C0EAAAA:8 a=SnXriI-UYGMo4s_O1pwA:9 a=fYNom5PXsM5enKJDCoVv:22 a=vMd6T1JfvD_20K6YSfI9:22 cc=ntf
X-Proofpoint-ORIG-GUID: zyZiubV75rt_j55OYm16wHOILguEtZWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=887 clxscore=1015 priorityscore=1501
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc=notification route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506300115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219519

Adds patch to backport fix for CVE-2025-5914.
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


