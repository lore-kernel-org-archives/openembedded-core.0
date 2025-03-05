Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DCEC282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:45:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13322.1741182320226171276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5159f55f0d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5254vTgs025604
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 05:45:19 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cs7rqav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:45:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KO1HlvjMEQC0bUvitMzlia0ZwVUnh1uarE1aPPD22CBv92o09QI3tBa8TuLoTYjshrCvVODhhBKP0UPAU7DU18fYpeTKK8M8L3b+xDrK5pac4NQlmydYY9mV/spuGsABadqVwH/+MzOAR7nsLNJsGP4CnIpIWq4Bgi3SQbz/EGtU1EdVdkhx7Vv9TGKa+aQaviSiYn5+T2TEbVtC1XRARL3on/s0TQdM5bwhb6LF16soULeD0lJlrp9qDDViDiaXaxGp8s1o3YWppsauspjHda4Pr59Y5rkfA0G5Ipz9adhNLm7a4l7KKdRAUfRNMMGw1u+lN752sg9KZA2tWr9Q2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sosZZ7XX38jynW4L4fcAhGeobmbFxLbOykK7IHLu4/A=;
 b=o5KaH06afxc6odiJRJDrPrF5PuE8AEBL71q7E6tJEC3boHQqey41ub8oLlGQGCMHARyPHNEAGA6RUN/JqZDfgjAecYs9+RG0l4KzAs9oJYxxCKsWY++PSYWdW0IOUWQEURlpw9BAKqBLSajMGxRpU7sQ4Xw8h8q+Wrg8APHMZQJZxSkchcWB4z3wzO+PbAUE8w7SpYFjf6HrCc+e/aBLIQc8v7fkF2g66uNjnVNml8iUYFqokpToFeyWptcW3+TlcCGhFaJbvi2f90ExEY/tLcmyVP+4d9jGVBMIhWylyf7FIJv9jXGTBn8CxOZxHfh+cghY9QdVHClKa29mkiwg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 13:45:14 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 13:45:14 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V4 1/3] rust: Fix build break because of download-ci-llvm
Date: Wed,  5 Mar 2025 05:44:53 -0800
Message-ID: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eddbfc1-1f41-49f8-5ee6-08dd5bebf518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B5K7nJ7G6aEYg/CLcdq+DOFAaYLlUk4iLcT/J2B0V+TiKhKVLiWR2WGb+L2P?=
 =?us-ascii?Q?k4fKM4nau7mRPDe+dhztqYg+UWQ50hngLNhRnraCv6puwgE8pAAXhEHPaPE4?=
 =?us-ascii?Q?B23LKrUJ8yef8IXgtE52l4M5C7JsYG9EpCmGDJD+XQ1IJRUbGGZLPwobP0Aq?=
 =?us-ascii?Q?lshIa0gNk8hQRYvnYH8HxhQEcmQsbhigUz3EQ4mY35u8NEKPEpmum7PfMndk?=
 =?us-ascii?Q?YsNfHZ335r3kGqOw3+Ol4yYO9y2yAj0tIGzNJ3a2x9CTE2J/DXa6RxyUw716?=
 =?us-ascii?Q?n7xLhFkv4ndzaDeEo6dv+7vVEwvqJXtEcYVFClK6Qh21FyFwIXqnSncAc6SH?=
 =?us-ascii?Q?K3diqM8EIvSGnzs7C3Y99L0bv4hb05uUeRg3K6yMiWBUmJjzoluXbQM6eGVo?=
 =?us-ascii?Q?ukqfxh0qFYrKqHiFyvvr18ABT2WNBaOTKs91WXVAquWEnmkdGxRbmwxrbgLc?=
 =?us-ascii?Q?gDV+roOQZn8ABqv4ALPbyzSbwo7R+Xti22PejteK14uJW01atJgcFXL9Czw7?=
 =?us-ascii?Q?v+DsbiT1AuPWHlU7VZNPYHH2Q2thJXRkAatjI0AOa5xIqEPeTG9yNU4l/MNY?=
 =?us-ascii?Q?KCqNuYMvVEg1hmttEV8+u5kSM41l6Vi6D5XK8o0MYfHkuOvMZ9c4RvUKE3SR?=
 =?us-ascii?Q?GdF8bmX0yc0/m/rcMDMjWSFlcjdKKQOCqoXWMuZAQZ8h1gd/ELplNIbcq3cV?=
 =?us-ascii?Q?DvVO+/lixGFY6uu3P2DBfya9u35MaQY9lhZGraYDgSlTe0TWdr/GhHpUzaxT?=
 =?us-ascii?Q?yFGT2kkMywRFdkQjZNRuSHvB7ZGTMBgFBaiHRtrYtIbczD0Jbw4MZHt0gpMe?=
 =?us-ascii?Q?qNnkQSR6vvuvX+gVU/pRs/xZgAJ62hG2P7E0+geIN6WDi1g+z5Qwd1WWWWXc?=
 =?us-ascii?Q?ROpVCucQUNL+v/Eqj4QpOtSby8SdNTHvv1lHEt/0Ds9IpyZjj/2l8gZTx478?=
 =?us-ascii?Q?Nacj0j8qy2bDuKAmYIMSVExUhIoay3VWyxiRiriF7bDDtzFahG9aZW8Uh9O8?=
 =?us-ascii?Q?0TRnHJvHDSi43Gv1+yj0jDavcdZwwtARoch92T1Ul6MuGr2unEd7Tck8LP7l?=
 =?us-ascii?Q?FcAXsUxoVE1e9zldFGzNQUwAsZjp0XfaLlld7jV3bNfjbtmAt/iZB5CyzSiM?=
 =?us-ascii?Q?0H5j2FXH0eeFZBbqNE8/dpXDkfNu6yOs+YUdtem6hgh9xkY81xIYOHLqaA9I?=
 =?us-ascii?Q?c+SlepczLQyqgRsJTa7i8x/r3Ns+VuUK5BhEYpYVD2p8UVTPktCxpbaNJHir?=
 =?us-ascii?Q?nNX8/U8YlHE3jsx1uKmo0WC6cVnt4su1p5QtR0qJG8MNGWipKHymzKCIlJE6?=
 =?us-ascii?Q?9al2j4+OorKWHJ+7aHwoseL90B5rb/bHdtbMz3NxilULCuGNLDGxM1DTC5tQ?=
 =?us-ascii?Q?MD/FwxMl/BjfF8MGfbkNJtshgThDbfOSMyLCqS/NKVBH2KM3v3aEgqK+nXdt?=
 =?us-ascii?Q?dfFwhYXCmwJmx/6tGYvpTLCFDoXrIuqS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8z6lbLXoY2ItsBDg3CaiU1vBLSmnUz3QkKZ3H2v2svGb0YidUG5lH0qPh1/R?=
 =?us-ascii?Q?Yy7Sipueu5m36shvBSxOjx58X5/AeOr/WFY/XZ2VBJWRQIG4OTuG9i0oGYpb?=
 =?us-ascii?Q?gwKA2zbp+o4AHQr9rxYHOdeTZUGsaNQ+1RGxYOOL7C3s94eDh9BqN/F7y7sM?=
 =?us-ascii?Q?0De7108HlqcJcZyDRHFeFrp2GpPqOk15Shk3ML91IAofWdURdqmqdKXog9ts?=
 =?us-ascii?Q?evkb2/f+gTcO4TgPmNq3Ihb6Moqbd/ttU+e6XJpUtJMNO2qenQswIqdZlykR?=
 =?us-ascii?Q?oLU2qcuvjfNmU/l4Z4BqjaWga6gP2yMp4AwGAI7XG4QBojZFVwRFlh+7+Oz0?=
 =?us-ascii?Q?LpJ0sh4xcjaYM6u32xuaQlu+te07ac+c3WsAElMNXKMw0TrAwpBZU7alEoCY?=
 =?us-ascii?Q?Es3tzU+HLBY24C9ek9hPIL2OKz+VXOUZrCx44z4vyTBxy93TZ0en6/tmbzl+?=
 =?us-ascii?Q?dCk+0QkbzFBJpK5fKqYqjyQltCnG8xX5nEWDKqIvduzIjGkMo/RTAhMqwQyG?=
 =?us-ascii?Q?l5Ldi5bxSQEjH/3EaaZZRWaE1f+qxxzWwg+FMd05fmOj7jD3Tzd6iKb8BatA?=
 =?us-ascii?Q?fu71+NpY6u6eHbzsyU19Ql8G/vzQLI3PLgKLrxnf2Z1yr26GwcWfNr9KNJ/g?=
 =?us-ascii?Q?KxsZRtkvlhx3QYy6uYJGam4BFy1fF47OaCtkdkvVxJQbGiKs+vy2munBuBCj?=
 =?us-ascii?Q?TBLoQn/HLXS1h5BJLZGjLmu9oKLkEvnRvTGpwg8mnYZ734j/e0MmWbC2aU12?=
 =?us-ascii?Q?ehsPuh7z/DWgLrWuRDPq5cIh9wtXd3ux3BRAaFraE2CsZVJ+nLTZLIhTodoe?=
 =?us-ascii?Q?aOxPkqeacFhSQTvzvDK2vh0p4HieRUnblhjaH+WFEAhybZOhTcu7y1Lke1Qz?=
 =?us-ascii?Q?tmG0DV9I7JsVPswpEz7C1a28ukOZ8H5PPKzkduYRaVkShKLPNRL0OQE8GlPe?=
 =?us-ascii?Q?bJBg3AQtt+4E/iJ13ujT8k87T9JLQCxyW70j4isBJQCLSn9OhUxG/7ITE+MD?=
 =?us-ascii?Q?3ARJtxG1OLOa71dKimxYH0MaahaBUbWXkQCMuQN1htJjkpQJqfYuBk3TkZhT?=
 =?us-ascii?Q?1zvhttEfBOoottcMlAZqRxbqffwkDaNTrMqAqR79iXzKzBVcAVPlD8ULoHI8?=
 =?us-ascii?Q?3h3fMLXRZVtsEXKS87fIC55rz8JFYxNdYomgPzQX1q91wRCHPRYfT2Q/8aur?=
 =?us-ascii?Q?ZjOQBLq1UAU1GfiHs/SSIdkG0jiYaXG+DRFJm9A7GBBrn3NoRFP1yiHi3RGR?=
 =?us-ascii?Q?FktvCrroNwMocZ7505Jn0zQ44lTaauOuztuKCZXOdXaDvNqpygUDc1SKGnDw?=
 =?us-ascii?Q?fc4BnY526QqxjrmIk2QGO5EFVAKCsRrXPDjuKyPPOCP9poeyQmdxBVfHFM6+?=
 =?us-ascii?Q?zsDQrRD3EfqMgROECcMZ7jtl/2sEhRBYUiUXXPixzkNjZuJE4/MQ2C+asFso?=
 =?us-ascii?Q?CZJ91ar8NCoYg0/LJHOMHdYCB8RXBF+Me/XZpZ0JJbbLhFw5Et5N9352JI4g?=
 =?us-ascii?Q?enD7hkRbEEAUClfCyMwRqcSNs3oUIULrCCa4S+P1mKh6BazyEA1SW0cNg9vA?=
 =?us-ascii?Q?asAkkxL6mn42kU4rxzqynjS9X1BSrz+ZC2ymY/xN1yEyqESECcwp/9xqw6dt?=
 =?us-ascii?Q?t2lEQOmGwVifBAPPC2pJlsM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eddbfc1-1f41-49f8-5ee6-08dd5bebf518
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 13:45:14.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxZ2M/87OHoSc+tdHerrp0AGd6JxMsJyOPv1hUGWoAfDXAcJNxVqYl06l896cJbl7QlWDLSESQ31UiE8wwheGF5CwyPiGxZgHLE7ptc/ezgNDQf0NymKVpz2SX9yJgy1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
X-Authority-Analysis: v=2.4 cv=DfbtqutW c=1 sm=1 tr=0 ts=67c8556f cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=-ana87LsvZTJyGyMcDsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: iEa-2UN2kymtDeg3O_YxMzgmi9tigjUJ
X-Proofpoint-ORIG-GUID: iEa-2UN2kymtDeg3O_YxMzgmi9tigjUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_05,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=876 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212316

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Previously, download-ci-llvm was set to false. However, with the following commit:
https://github.com/rust-lang/rust/commit/7d579046c80d3de3143dcb8b2db5640f95b5383c ,
which has been present from rust_1.83, it was changed to true. As a result, after
updating to rust_1.83, we encountered the following error during the build:

-------------------------------------------------------------------------------
| thread 'main' panicked at src/core/config/config.rs:2047:13:
| setting build-target.llvm-config is incompatible with download-ci-llvm.
| note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
-------------------------------------------------------------------------------

To resolve this issue, we are setting download-ci-llvm back to false.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.82.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust_1.82.0.bb b/meta/recipes-devtools/rust/rust_1.82.0.bb
index c4f8ee7108..cd470b1883 100644
--- a/meta/recipes-devtools/rust/rust_1.82.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.82.0.bb
@@ -129,6 +129,7 @@ python do_configure() {
     # [llvm]
     config.add_section("llvm")
     config.set("llvm", "static-libstdcpp", e(False))
+    config.set("llvm", "download-ci-llvm", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))
 
-- 
2.43.0


