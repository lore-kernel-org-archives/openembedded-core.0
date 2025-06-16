Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D7EC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 15:42:41 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web11.305.1750088554666043739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 08:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=PPe1zRxu;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=FhR/Ws+x;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=92624bc129=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220298.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G5cmYL021992
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 10:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=RaRx9iE8eVcGYrPAXSWGzH/CElv
	Jp5i/Fi2ioKJCXd4=; b=PPe1zRxuTuVAfDy4NG2mguU/++MEkxRywOAWAtZsGq7
	xlBIHaV7ChPTsFzAwSiPiowVeaCskF50KDezzC8mejGpTlU4SGeO25jcOAqWxZOq
	0XSDu0j8gTouYhC2w+CbH/USywcCkI6I/IbXRIycFWil2KuaU7K+sNIxCXdYg3hQ
	z+DZg8NpLBqRbAAKk+jtd8KCv2nml9fyiy97ZGxqR6H4RxmAzs1kVLQh+Rn5CmeV
	Vhcyhv0Od84hh9J6hBmdq0i9sreoOzwknBn1y/PmhZHtO7wMDHnTl6EGJY1vQ3/n
	U4OOmM7EllDGuTsc5bdUqSsJWhRRDCaNxFVAriijsCQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2101.outbound.protection.outlook.com [40.107.220.101])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47aar4sd9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 10:42:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlsBMO5xe4GkjWXW5cYd6M4/3g5cGvZDAvVzIGkDHyz4obJqrtMR9jmFXYVpqwa7NI8UFzel0gLpuWZ90OWvHLitNRixyQt2xob5nrCvlxVUjcLJe0qLCwjY+L5Zds6tak+mdJxK/jdf7gQ8dSATKS0X3tFeoezWuKVQlT2v9LhqDnq86qxbZx4wiiWa8Bhb1/HWxD0SyyxOphmX+eHPfhevv3WdvEHi3HydsnJas1Ff4VJdrykWPuWItf0lEwmOsBTeF84/rx/V0/kR0pnG0AdW4lhEW0mG7POvYA4GQAl2o18zt0oo2+dy43AuhozMt3dG5fqKd5AvbQBSZplDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaRx9iE8eVcGYrPAXSWGzH/CElvJp5i/Fi2ioKJCXd4=;
 b=ZBm6mUDsHNax8HZQ+gchHX4KR/bNsh2EQazc3+NJ1/IOimaxqrZu5Wkxo8QfIHaZ7EudbBX2CImm0rIZ5gsTzQTvYV3g5HyttNJOuKp21Qqgen1dlo58dDd5nfOOed3U0qPYxg3BYzArjiedqvl2Bp6NHUH3sQ2pQQ4Nh7u+6JQYc9S2YDQEw5V6hx90/cuYyt3RQlM2M3DW4NOjUgRAZ60IJcke7VEb9EDGEdEAm0IXTQWxwC2OXRO7r+73oH/H2orqAUVmPw/Vih+SKRYXm8tFN7bSn9HdcjDmgNpdG6KFHIUdLdPxL2Q5+IgiKMt2sKTTdX7dfUvICFESBsJa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaRx9iE8eVcGYrPAXSWGzH/CElvJp5i/Fi2ioKJCXd4=;
 b=FhR/Ws+xE3my/2Brer10xk+ptCeP9g8d90Q8LsjxsuLgGBGH9fQGPRUeYwCkWHSQuycoVX/Ph0K7mCLGrTMsa+MC0RkYVHb+65nf9xYR7e4Xuv7jU8RVWJHFTeBepNjr3NcSGHERXdXSPg5UdFXMwpRz7p+QJbzTPjaPO+yq6IR6ti/hIP74onXGmCE9bkGOK4USxxB2/0rFldIfXoAtJOiY4zs5yjtO1Af9RSv1W/Obg//6fF7TsDhTEV41MNEW+PO0dWmBoeMGmdUgU0uieofJBuLfI+h7QklFpVDPr9EI/L8rvhI9ncYi3li63YHODwaBXwObkPsaQQMLN8XN3A==
Received: from DM6PR08CA0032.namprd08.prod.outlook.com (2603:10b6:5:80::45) by
 DM6PR04MB6377.namprd04.prod.outlook.com (2603:10b6:5:1e6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 15:42:30 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::bf) by DM6PR08CA0032.outlook.office365.com
 (2603:10b6:5:80::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Mon,
 16 Jun 2025 15:42:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 15:42:29 +0000
Received: from OLAWPA-EXMB13.ad.garmin.com (10.5.144.17) by cv1wpa-edge1
 (10.60.4.255) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 16 Jun
 2025 10:42:22 -0500
Received: from cv1wpa-exmb4.ad.garmin.com (10.5.144.74) by
 OLAWPA-EXMB13.ad.garmin.com (10.5.144.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.34; Mon, 16 Jun 2025 10:42:23 -0500
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 CV1WPA-EXMB4.ad.garmin.com (10.5.144.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 10:42:23 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.72) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Jun 2025 10:42:23 -0500
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [kirkstone][PATCH] ffmpeg: fix CVE-2025-1373
Date: Mon, 16 Jun 2025 10:42:02 -0500
Message-ID: <20250616154202.549434-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DM6PR04MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 456c4755-267b-445d-67a0-08ddacec6726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mStTICpsiYYvx9mrHDoxb2soSMBmkykGzay3zPTKcOtBn3EbZxXELq6UPcT2?=
 =?us-ascii?Q?uyMAM1EmdlTqhg+45Duy616ChiJYUajA3RzMc/Bz9r/29BUvq0bAexbQV08W?=
 =?us-ascii?Q?pXhXEBFsdeW7pYjlHbhg7OWkvzgP3elIJ3Xa2ERcYj5h0AXhxeXEaVH1yL3k?=
 =?us-ascii?Q?ZR+K5MFZ7Zpw2yU09yrtM5a9YJSOmvG8824kbUEfuuE05jj5rXkl0gzMHFb+?=
 =?us-ascii?Q?wnU6lx8Ilu1qcBGW9/9EMokjliyolIBIwWP4+gybOVcrTfwLbnwJp2G6L0dL?=
 =?us-ascii?Q?i4vRAsOrC0Ne/Qo8oUoa85FRixnVPl/2EJD8r6dZ5gg+A+f+xVKA7TpNqsUe?=
 =?us-ascii?Q?6u8lxwN70HruX27uZ1LxM98X6LZN8UXbmL3/dZf8IpkxZOQdILVf+jbzaOqg?=
 =?us-ascii?Q?R0kHVP6kiIb4FMt7JIXc/PqjVxBNYdRD6/mZTRvP6HpmTkPCN5qC0jWQkpiJ?=
 =?us-ascii?Q?/MEX8G7FlfFxLsIDSB+afFSA+w47ygvFD36oQkenBdwfZnzHTQCQoX8KedLY?=
 =?us-ascii?Q?CjsMduYLs/aqMbv+Iu8wxhOkOC/0rhWhigZHh/vKnY0D3TWcouNw1jxsbzZc?=
 =?us-ascii?Q?cvuRFllpNmlJbcOeQB/NvFSbfYa7Qi/tr+dsj43b/pIUdRC1sOSOzmE+iqXs?=
 =?us-ascii?Q?qCX0CyNTvTZjXvmGQ6LMRDkEXYxKZZ1XlgJAnYrgpWbYDh17ID1JrXhdn0za?=
 =?us-ascii?Q?YLwsm7fp40p93SqeBGGou1nCbJn4FMsM65B+a/5t9WMk+EB2DEq6HV033J/i?=
 =?us-ascii?Q?97o4lgTJtBP6e4TzrvaUMy5QfCuxoZXdBt89cVS8FyyA2iCJKzJTLuK+9wN5?=
 =?us-ascii?Q?ZtrZqONDYj20awEyrXhHAz3fBK9p51+wNmnuCSew+CjuLT9tugl7vqTzATRT?=
 =?us-ascii?Q?mNSn6iO96cxh9no+7GH+iDW3wTfXLg/bDVXZGZKwMYLoRuqMDmpCjrMv7mW1?=
 =?us-ascii?Q?AkQtsdbhopsXYqkPgISsDa6AoejZfEqkmodby1Veo3vODhRzS3wBKBthuTaL?=
 =?us-ascii?Q?YpzVkPmg0Q+lZ34IuSxzy5dwIoXE0MGORcKOSRx3B8jPI5aVykiakbW7YlaJ?=
 =?us-ascii?Q?Rm5S0RcHWMS7/42/zkk71H7ZWmpqJ4FWAD1JgJXOLU/UCYXISXRKtfAIfPjr?=
 =?us-ascii?Q?wuo8YriUJ+aBUnUM2wxBZUPhAXIiweCjlI9PjNNamVM94b0ugb3qYGsnyE5/?=
 =?us-ascii?Q?IBWtoVWKWD+vb/WcMQxM47s2sN8ZkR2EOAE+ObdtQZMILSoWLvcn4AfdhXAm?=
 =?us-ascii?Q?w3WFOhPk7NOdnBXPkDETrVhgtAa+/ug8k+Xsdh13SRbCQeZ1m1cw556NP6sR?=
 =?us-ascii?Q?ROfKqrH2GQq8BzVjVuRlq8upMRNUOkZWhDCj54dRLEIxvsVGoFGdcM/zE4hp?=
 =?us-ascii?Q?nQ1UxKjwgxszaEUCAwy6iEddww77IdwhTEwW500zcJWwqvgloKFlP2wI9Raw?=
 =?us-ascii?Q?lzDh/oczC9HhCVoOFHmM8K0f23TN7uyDDm8qCoR/Smjnkll7o9mf1A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:42:29.8019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 456c4755-267b-445d-67a0-08ddacec6726
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6377
X-Authority-Analysis: v=2.4 cv=MqBS63ae c=1 sm=1 tr=0 ts=68503b69 cx=c_pps a=M3CBBaPLUrfrJCQjo1amJA==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10 a=qm69fr9Wx_0A:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=iGHA9ds3AAAA:8 a=NbHB2C0EAAAA:8 a=4Duy6maE5LeUX5LqggYA:9 a=HLUCug_QN4oeKp6PugZw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 cc=ntf
X-Proofpoint-GUID: iQASrtErUVt7IsXcqv7QEjWyskwZQwpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwMSBTYWx0ZWRfXyiKzqfa0r6k1 nOR088/eAGxUs1eVfAxesy1+OdQpVuTxg4l1mhWHQd9Yt3XxcG7opv2wAiWCYdSRhgvwal57UH8 gUu7RZGtbklpF+5JgJ923wG8P+xqs4ro+bs0/jRhb2F7XGFk3iywArkSNbz7ZrPj9XVg+tEjkbA
 30LAg8SSUpe4Xj7MbCWpVIXCJ0ZPkhMYDeio04MhAzWP9hP0pWcdvDrG7z1nAShsJHv/AbI6GgT ogt0+AUuhGtQeqdnRVjD9NBzSivCgXrXR0OzTCNf2WbMVR2TqAfCl8YsQ+XbshkacV0SqaVnfDC N2pq3ID2fArxLyIs/ugNNs/6DLYgjQEHTlcBKNG8GWlEE1qb1S8RQNABVZaAE2KSJM3q/MtMIwl
 tREZOPKIeMNQbSH2w0IBppovApSRsihmw0DGuI89gcjojkYo485zCEDc/Y8+MURWeO62dvMo
X-Proofpoint-ORIG-GUID: iQASrtErUVt7IsXcqv7QEjWyskwZQwpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=982 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc=notification route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506160101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 15:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218831

CVE-2025-1373 does not appear to affect ffmpeg 5.0.3. The CVE has been
added to the ignore list.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 4ae444258f..ae257a3926 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -81,6 +81,11 @@ CVE_CHECK_IGNORE += "CVE-2024-22862"
 # bugfix: https://github.com/FFmpeg/FFmpeg/commit/9903ba28c28ab18dc7b7b6fb8571cc8b5caae1a6
 CVE_CHECK_IGNORE += "CVE-2024-7272"
 
+# Vulnerable code not present in any release
+# introduced: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/19f7dae81ab2c19643b97da7556383ee3f721e78
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/43be8d07281caca2e88bfd8ee2333633e1fb1a13
+CVE_CHECK_IGNORE += "CVE-2025-1373"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.49.0


