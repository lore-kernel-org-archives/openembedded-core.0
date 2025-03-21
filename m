Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9860C36007
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:25:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21050.1742563526096097754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5175c2733d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L4oP0e001000
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0yb16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlPVLhC47tDGqp1PELhXG4nWqjDp9ibpW5Kd49cW018u61+MpGeVkauA/aN+8DsGMdiwKC5E+0eq4ho/tdUAX0NR2rjmTNvmj/x8bfyPXLI0nSGgQRTv08QWZ+9n5G54PbaaCuuH+oCS8z6+EuH9gJrvFPxj4/hq25lQV4rVwE45UKgBX5IsyWJ1s8CS5RAX+qtQr3fFdpw9sw35esBcgYrh7fOBFgMfvvIZjt/fXyuPiUOPs8KWSTqvllusgn5uwo8ileICkd9bagg255NCbUpSe7+vEtH8Xnl9/zIiUaECnMYDIu/DnWZdsJhZDPJP9vPG5bMJV0p2Ob7nTwZM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK27NY7/Vhh3/k9AFrytK9rm2q0qH8P317OP4k2aHHY=;
 b=uX0VlQD0WUMGiF0pK6GlCwCOF/o9L9u7hMoINaYsaBhEc3uu/u0DEMKEfkDRVKLdZo4/3Gw8n/Kcdnj2AHwcs8YLUZhQDgRbEhaM3cF/ggaJW8wNss8LS5eunoW70ZZ1Js1/n6+xR9JHsi+sWrbmHt9MKIN0m44dlQfZzwTkIvBs7xDbbgpbgyQPavMf3krImZNMrZYZMADpyimQUwYKvv1dOe+4UqkkP/APUwXQCXLqDma9PbdXtfzbVRx+X2xncB1Nth+hJMMe4kGsKAC9nLdcEfWCPifHZiquJfpeOtE2U58d0yV0ZPkaX8JhZGsJvfZZcn4yqXSiVGNUdQ+dOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 13:25:23 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 13:25:23 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/5] rust: Fix build failure when multilibs are enabled
Date: Fri, 21 Mar 2025 06:24:53 -0700
Message-ID: <20250321132502.2607941-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:8:56::29) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 3408ce21-187b-4ece-429c-08dd687bd5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3PZOlzj1pSdQIshPlEXydfsp+tKXHCweKEpDET9qhTF+Y8iFwUUlgcTSyHiV?=
 =?us-ascii?Q?D5lcdyz//8GKXZ4rLPZNJahHfw0YWMg2/ujCRJTVfllK2osAdRZvldPtK9dX?=
 =?us-ascii?Q?VUbT8+VDz2NKE6FrbcXxCm2RGW9Ljs0cy9KZLOqZ0crhmj/OLqvBqV+s8J95?=
 =?us-ascii?Q?Je24bY93JxkT8qQ1vuS1Qoo9yRwDG4D2LhFedJnO8s6bus2TiGOZDbw09til?=
 =?us-ascii?Q?SsdsAs9Igum8kpDlMHbsLtBdybJD/NhS5BfElo31KyuYzXTugpKDx7KKiaUC?=
 =?us-ascii?Q?wVf/g9/OTfi1yUxO45H2WChRMumipurVIb3dq3L2OLYGn1TmRsY50A+YMBMa?=
 =?us-ascii?Q?WNVpOX8kEm2/F82kcovtx2yI9mkRPwoBccbyp2il59+AdY8p2iQc54dnd/lP?=
 =?us-ascii?Q?D6NquWJGt60lmZPRU4oJUqtGnJxvt46eEyZpeHnlwz16fFCzSf3OwVwH0yja?=
 =?us-ascii?Q?oJLc9M8bpCdGKqu6LyZkoeucSEwcRkUtiLwR9l1LwmlG5UylTogIVRQBcB7A?=
 =?us-ascii?Q?X7ROewiu2b4gjSyii32yjXBRQhhV3xzbScRAmtial+EofoRK/FK7Bl9N8Xv9?=
 =?us-ascii?Q?VicdCVu56gN1R98AN34XGT+Gf/sKN1FOseq/VYPmfI4au46o1AtJxkQOOPzi?=
 =?us-ascii?Q?I8cKeqOEPl0FH5T+bBHHhzHTDGLEaUdow+WRqTxitO3f9jnBq73q484hp3pg?=
 =?us-ascii?Q?KK7bjZpqpwA849XNYGQ2qDEZ22wMGB8V4azYbRm+JD253QUnZmU4RVn4dRrt?=
 =?us-ascii?Q?tcdJRqMkDZR5L3rUFUWtUxWq4GWH8N/IWVSgdbmt6VtdYyD4vTUuNtiaTk0D?=
 =?us-ascii?Q?BwHfzrALz3jpro3oEtHxk4EQNKKN/5BGGXqmVhib2p27mZnozXofRLGg76FU?=
 =?us-ascii?Q?gM7uq25sUPI3yZSSnRuRb2Ey7V8EX1y/Umi8tX/u201UbrS0wyrmsTr9HNuM?=
 =?us-ascii?Q?3tS4wUPBvylaPzvJ3Op1VoEemDyANPeZKx7rqLGgJiN5hIh+ZMIyk19Rsuwy?=
 =?us-ascii?Q?2NWznRTtBIdl7Hm62mO3ptGIzoXl2tbI+zK4r5XdNyddnWdkq53QsqIGkJmT?=
 =?us-ascii?Q?a0agYralzQPpK0yKJ2D/CgI6vGlcYSK3/e2iZNUTh73feFUtJ13Bm3o9xNrE?=
 =?us-ascii?Q?OTKkaVbpizP4TCguxsDZvQh5Szu7i+OBX5sXCf+nVA/C9bwDXXHAUrQQ5FmW?=
 =?us-ascii?Q?Q4QV1A7nWQ6A5OVizpl3fKiG9VZnUil1fnJGWIhtCvprCNz7mtt8Ni/T1IBo?=
 =?us-ascii?Q?elr4Yfx4O69n9MG52PMrW3bVo8j/aQKHTUlCqZF33Q5GaCkmhznjMXEeffaC?=
 =?us-ascii?Q?aX3Oo6oLPdggfoKKyGm4hB2+EEJ7mQgNsEhYCbTd8Pv5taqyTIjMneXDf6Wt?=
 =?us-ascii?Q?vqpPKeY1wbYNUjFN/idjD2hubkNLQS9S2OecN5p/6vDyt41uoA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rcqWXLRlycWSx5bMyeZnuhQc1gWWLbql+JzpZzl5UB1MgnwkeuMQ4zD9iipT?=
 =?us-ascii?Q?1seKcLGskVHCiS05TF8tSvr7UdmvaSPrkR1JBMokTp8OKRh2Vpv20EZFgd5O?=
 =?us-ascii?Q?9hbulw4QwG7nv5DFi1SVRUbTycU6+7cUYFbI5Fsto6oqwvarP3jF8o0Nxrct?=
 =?us-ascii?Q?nSkl7ByRDugaRI7O0pCb+miIAPEx0U2ho57H6OUyOIeVmMaFdooK0kQ6IFp4?=
 =?us-ascii?Q?UJHDz0Ep1ceuU0i08lJ1FXCUTGQRVDkXnaLILyxopgtQwUo61AqhR5kBGaID?=
 =?us-ascii?Q?XMm+VZ3P1BQNjd6XxOhWqVl6ehAb0XyiwVPLpSuMj7IrDzRLLkpNgO81O2lx?=
 =?us-ascii?Q?CillCtNzTP/Bu3o6y54SU2HpuNu1Hh3YFyAW/q8W6vzdDhCjEKOty0aq1GOU?=
 =?us-ascii?Q?/CTGufy91GnABU7DjTXDZrbnYQ7RJ6fpdTBrJBLoSuq+EBt6tt8O761H8mON?=
 =?us-ascii?Q?GzzqTpV4Ut6tTbeS0f2uBSFEuRPQ22MG3IfNszg3hbwmIyoiDtiO/BVC3fUL?=
 =?us-ascii?Q?UcasiH9KXBNnxloCsJL7wVapx2jsJuk/6NIjJ6X+TVDJOWH1wdZWZPXOFiPL?=
 =?us-ascii?Q?wC4Dv8SM+C0AyMdtx2GCbz4ecFq/0e8R2w7/fNyfeY/GTMNVywX0NyHNomUt?=
 =?us-ascii?Q?GjiEthfeCtmqy51FF7Y3cXapHONF3zGpSwpB5+OhOCnVsuFonXQOR0ZxOIcl?=
 =?us-ascii?Q?6Kto3HGjPdUr/UJFCfm9Wb9AP+13aS78ZkfTWXn6MRq6YAY0M2a/tDeYkiwS?=
 =?us-ascii?Q?K/s4XgZItiFOdJboytTp9KpkZuJ0H3e32ZYZgv8DhIv9Omi63Uqk0lZ94OsU?=
 =?us-ascii?Q?UkV+kuoVuLdBeYChDg7hsptAgDRAz0DLjG8egHc4F7DBZ2CbWuFCpZZUJpvt?=
 =?us-ascii?Q?aCBQVfXqTyj8exIcFbMd+XsMv1VtNh59YoSF0em598CdT1uE3BKXL3hvHP8s?=
 =?us-ascii?Q?HajhLffaX9LweZoyecAbVwigidv+doiRAqQffwXd0EqRSEmC5UeUOdEdzmTl?=
 =?us-ascii?Q?bKAGCitQp+MekOniLyU6/ysKU+frLOLuGIfDoeEBWyQgQ3po4g2i+yLlBdEM?=
 =?us-ascii?Q?E3ImUbRe2GoSVpI4GmiC9Nf6k01XnSv/NTsteVJg5zXT1QvSGkp0NsYqzuA/?=
 =?us-ascii?Q?zvcYY3i6EFYqvPuUKj6bRoo/IZAWFgqnT/spRxOZbvL9NNNOF3smzWRDTvBO?=
 =?us-ascii?Q?wUfJaLNq2ZzoVF77D5E/XSJCS8aYtM74BQa0dPhNDloWiXqmXCRztTIWxJDS?=
 =?us-ascii?Q?QW7O7tYuVFy1E3g7vrg1HqwETj72Ui1h6GW0YNtivF6PuHIiswBPPe507v4B?=
 =?us-ascii?Q?6J7yvBM4Q+jltDNfC7nrPgsSkIyR/w08c2/CZCmoammMFYHM/q8kei94Q1zv?=
 =?us-ascii?Q?HAS/JrQAsN7asYUlk82YUpaZyV39iU3ry+rs/DzoGoC5gAAtSs/GXGv/GHAt?=
 =?us-ascii?Q?/46bd36KKfL1j0IeXw/jwU7E5D1Glpls0wI3ESzC2EBiDmeO5glrx/ht7T56?=
 =?us-ascii?Q?4OgwaOV1/SsKUJhW1RiAQPipMMIQfRmsDCiELc9IZipqOqLXTWh0EkT7n82x?=
 =?us-ascii?Q?fQBiPhAsC1a3yr8UaEZqNxa0A2UQn3TvOFAg3CAevjCF8CxPzodQA3SrvuGY?=
 =?us-ascii?Q?6d5RyEI56VGHuol0VHcSEMg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3408ce21-187b-4ece-429c-08dd687bd5b9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:25:23.3879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4wxO1qYsyLHeMBCxfghMGQo+gJS6/DKZm/Sl9Jkfe1LMzzMfa1bjgZgDbEcqu3v/amRlYBVdK76gS197gd+prysHm1TkYugaSNHEb4rNwwdEGgGVFDJF4FjyPwe1oAe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
X-Proofpoint-ORIG-GUID: LmvyozwxDOjtRB7ELvlnLHaizvvN-FVu
X-Proofpoint-GUID: LmvyozwxDOjtRB7ELvlnLHaizvvN-FVu
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67dd68c5 cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=_UMIQwpqP0SK6GvDsTAA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=870 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213452

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

When multilibs are enabled, rustc could not find dynamic libraries in the
lib64 directory due to the bootstrapping process searching in the lib
directory. This commit exports both lib and lib64 paths to ensure
correct library detection.

dropped:
revert-Zdual-proc-macros-additional-check.patch

We reverted the previous commit to prevent errors when rustc cannot find
dynamic libraries. Since the issue has been resolved by exporting the
lib paths, this revert is no longer necessary, as it won't cause any
errors moving forward.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...t-Zdual-proc-macros-additional-check.patch | 43 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 meta/recipes-devtools/rust/rust_1.83.0.bb     |  3 ++
 3 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/revert-Zdual-proc-macros-additional-check.patch

diff --git a/meta/recipes-devtools/rust/files/revert-Zdual-proc-macros-additional-check.patch b/meta/recipes-devtools/rust/files/revert-Zdual-proc-macros-additional-check.patch
deleted file mode 100644
index 58e77e4e6e..0000000000
--- a/meta/recipes-devtools/rust/files/revert-Zdual-proc-macros-additional-check.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-rust: Fix build failure for v1.83 when lib32 enabled
-
-Because of the following commit ,
-https://github.com/rust-lang/rust/commit/68034f837a39387e49fc7d7c5b088f5372a1127e
-when we enable lib32, getting build failure because there is a check for target
-support for "-Zdual-proc-macros" flag not functioning properly when lib32 is
-enabled in the build environment. So for now reverting this commit and bring
-back the previous behavior, where the "-Zdual-proc-macros" flag is always
-added for building proc macros, regardless of the target architecture's support.
-This would bypass the check introduced in the patch, allowing the build to
-proceed without error, even when building for a 64-bit architecture with lib32 enabled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-diff --git a/src/bootstrap/src/core/builder.rs b/src/bootstrap/src/core/builder.rs
-index 9ac0b0a01f..b1374042fb 100644
---- a/src/bootstrap/src/core/builder.rs
-+++ b/src/bootstrap/src/core/builder.rs
-@@ -1701,21 +1701,8 @@ impl<'a> Builder<'a> {
-                 // Build proc macros both for the host and the target unless proc-macros are not
-                 // supported by the target.
-                 if target != compiler.host && cmd_kind != Kind::Check {
--                    let error = command(self.rustc(compiler))
--                        .arg("--target")
--                        .arg(target.rustc_target_arg())
--                        .arg("--print=file-names")
--                        .arg("--crate-type=proc-macro")
--                        .arg("-")
--                        .run_capture(self)
--                        .stderr();
--                    let not_supported = error
--                        .lines()
--                        .any(|line| line.contains("unsupported crate type `proc-macro`"));
--                    if !not_supported {
--                        cargo.arg("-Zdual-proc-macros");
--                        rustflags.arg("-Zdual-proc-macros");
--                    }
-+                    cargo.arg("-Zdual-proc-macros");
-+                    rustflags.arg("-Zdual-proc-macros");
-                 }
-             }
-         }
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 838544e089..59774e4794 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
 	    file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
-	    file://revert-Zdual-proc-macros-additional-check.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "7b11d4242dab0921a7d54758ad3fe805153c979c144625fecde11735760f97df"
 
diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
index aaf35692ab..ec1e7a683d 100644
--- a/meta/recipes-devtools/rust/rust_1.83.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
@@ -223,6 +223,9 @@ rust_runx () {
 
     oe_cargo_fix_env
 
+    # When multilibs are enabled, rustc can't find dynamic libraries in "lib64" because the bootstrapping process looks in "lib". To fix this, export both paths:
+    export LD_LIBRARY_PATH=${S}/build/${RUST_BUILD_SYS}/stage1/lib:${S}/build/${RUST_BUILD_SYS}/stage1/lib64:$LD_LIBRARY_PATH
+
     python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
 }
 rust_runx[vardepsexclude] += "PARALLEL_MAKE"
-- 
2.43.0


