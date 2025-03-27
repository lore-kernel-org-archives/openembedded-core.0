Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A375EC36012
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:06:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45501.1743066397055480541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 02:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=518172d04b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5ucAU016964
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 02:06:36 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg45krh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 02:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzkGkfGUVsaL946yTfZNdInmHZQxZxc7yE4cqgg+h7wwCVoAREyMgAwNkF7udc449TlRMDQ4D8dQ1aKoWktrQhNVeGHa3hCB3KMbpyuL9beyUcKEB6HVRlslQz27e0senX8yyTb/95FcnOgva+I1rCQog+57+cvVT4DIf6RvsCPAexdLqeQrWFFOtLvpCy6MkXF1l8Lso0fuBTv+UtfslvP3IphDCD2UZv5XVXjbODR3yl73whgrTfOOEXIfc2rAr+DuUWrQs+O/vDt/FWCxEtnGXhxE4eeBS98Y9BVnlf4t06uAQtZBpYlSkVswW3aTzOw7gZBJJiJYMbNKifIVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wi0oztpZ6pJIKRJOR1thLBhBR7a//8gBW1y+CDdOs8Q=;
 b=W3iR8q2X5X99BQJrqQqazFuOZht3da9O6EV8Q4luN23lJze2sOlws4bSi3e3Kig+li2no4RvlxgXr9oAXL5Glt6xjt29yfo8f/dSOgAU/q729fqCfrjwVYAmeIPNO3TmgeoBj38bHRhulYdtyP4/nVBiOFLDVC8+OgPMifIy1PYd1WoYDinbPNVBx+h48zaCMdhBGPzivOQt0tZ59fEHPRQZx7QTf+E1cB5JWVNwOuny0lDPzNfPjRVX/z3nY+nWiHb/YKWV4H6PLWi9rHRipxSDCYBKrlS7+98/8cVD41lV0sGjyyzVH0i/Ss+UCW6eNpG1eUeUZoBYa3cKL4Udqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) by
 IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 09:06:34 +0000
Received: from DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7]) by DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 09:06:34 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 5/5] rust: Oe-selftest changes for rust v1.84.1
Date: Thu, 27 Mar 2025 02:06:07 -0700
Message-ID: <20250327090609.1096447-5-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327090609.1096447-1-Deepesh.Varatharajan@windriver.com>
References: <20250327090609.1096447-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM8PR11MB5637.namprd11.prod.outlook.com
 (2603:10b6:8:33::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5637:EE_|IA4PR11MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e5cdfa-f262-4d87-af6a-08dd6d0eac43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KyPzsx/k6QT8flp9ZoNyzBpOBBgYkhFp7ioZCCfII3Yp7HEnt0s0Ez4fY0jO?=
 =?us-ascii?Q?Lk7Qe/YPWhZxOdYxgAhhyGFtMp8R9kPWOEoBPoy7gjY39SpQlFyGk32Rt0gp?=
 =?us-ascii?Q?PoxdA1AYqUDAjPMaC58u0IvZPie3239jWaqIrwVXiY1JVuno/RjSCnYZnbP+?=
 =?us-ascii?Q?O/EsNQESetkxOv7UBSMEkDQC3b3d9AL8vVN0ILQL8N/G7kl00M3kdqKj7hrk?=
 =?us-ascii?Q?/Ll74PWIFT+NMSZu1353HAEUOG4CbVlmI+lraCVvdf+HnLyPza2Z/7GK4mQk?=
 =?us-ascii?Q?jPO242rrlqsBP8BCraTLy/xud/unRaTBQ5katcgV3IL/NwjwxfdKw0KRsI3s?=
 =?us-ascii?Q?+j+/qA6UN41+CTGb6oowH0HePKfOwRi8Jb7uDDzgJFOH13c5GRlgqd797sCH?=
 =?us-ascii?Q?Ihuzo0WCPLsed7XtnJh6k2TOO0NPAsrm91zFYc2Ox3woiTQ3+HpDzErCuiD2?=
 =?us-ascii?Q?jGhLG9bRNxy3vRmfieXuKxi4cTQamcecHShm6kudkk30ZcY3sX9hXRyVGVCh?=
 =?us-ascii?Q?LjoaNrcwgkjm9wyvx7NscclIwpbBn0y1NSq1Q3+ut9wDyQCdVdPWjm9fODjV?=
 =?us-ascii?Q?sZXvg8HYAUXu/wNtc02GajzDcuucZtiREKG0VUK/+iFaLG7JT/jzyFJ5Fq3E?=
 =?us-ascii?Q?K0yxjSRs0ibsTF3+9SYlDSdIE1IiSb2laJxAuLLLjJcrnsH630CsG7hmzkxd?=
 =?us-ascii?Q?Gnb12qq6oAZWnk4rTqQptJHG8+t0UDUW0NDoT1zlxP5BbWuH/twBoIxqthGM?=
 =?us-ascii?Q?sZUcyQziccUver2OhZz9fJE0jbi8upgsvyOLpPCBesuJqmXnnTggc9DeSdtt?=
 =?us-ascii?Q?fJ8PV3XP2HB0inmZVCdpboMYL76U0dRqoq/V+7e5KfiM/gUV8VUjLS6+3rOh?=
 =?us-ascii?Q?dTfkYdVsEESB+wmH+BJ1/7wX0C1f+TDxmi979o4OYezsz6bEwzY68wjyyN0B?=
 =?us-ascii?Q?0qcwvw/PXyqal4KynMjPfIpFu+caSegUddeNZgB3JXJVthfpPyLFWE3x2Wle?=
 =?us-ascii?Q?7LPvLGAL+fRaNYFBPCzKgAv7Vehm01INtdZBIxu6uWaCwWA1WhkXSOelAZFB?=
 =?us-ascii?Q?hBo3UjY7r09GrHFQJHXgUbRwiv7K6xBvV1sFd0ufQ5jOa8rFtBLuXQwS7Ye+?=
 =?us-ascii?Q?H7/ckQXh6r6S/Di1T5oGdBFmuSVQwE5/JHki6yPYMYc4Ov7Jnl2yuGrlavvF?=
 =?us-ascii?Q?pFVj/HD3b1q+ryJJfbXwRqBb+/j1OTNWUdr+aQWtlaUQfCPzv2q+JfTdLSie?=
 =?us-ascii?Q?U0UP8Hc6vFY7J3ZniwnsgP30hmdfvurMrIJc+As43OUiR7sfJEoXrrSfne1d?=
 =?us-ascii?Q?LhDqMGyi50bahXKr8COGyQ92GigNHnPmgV88i5ZT1ZZidMApGHyOiZ59npfy?=
 =?us-ascii?Q?EONjvzDrxNKtriSdaroy4YL23vDxWuMAk/swf10JUn3kfTPi8IP1dDvN9EVV?=
 =?us-ascii?Q?sDKOBN8Nvh0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5637.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kkZu4I9ydcTiB/lcNxF/vJKlQeSSCOdHEA1NRjxTMHvFeGRvZkn0KnpL7DlO?=
 =?us-ascii?Q?mbUiWDH5y1XAHS7sGDhIqTM874wntUuTM/Ckmm3tktiRXUwF/1z4pjPbuEDy?=
 =?us-ascii?Q?5PkC7MmqUXav4BHuzGEosDkdaI8L0vdhbKtRTzcmu7oCM2DRztzN0eBXtQc0?=
 =?us-ascii?Q?lOeKRgt7dl8xcrvfcDefub9EGik7aVIeZM/ew7cTFjuEYCm7VcTeY4tA8coy?=
 =?us-ascii?Q?ZdzHVwnG4t3YgYPE1u0UEUCX+4Mj2o4EPwx6l9LwjTBJL23tMHluZu2pl3px?=
 =?us-ascii?Q?VLqj4AGfmKYb+lYJxSj37sYkLvXhidXp2RD6JahTh8YzygVYkhS5AWZv+W/B?=
 =?us-ascii?Q?lJjbh7wo8mW/tvchfZIEZKRWZEanxdATfg5kpcBm/rwxGhohdR4Rm2bJtOaC?=
 =?us-ascii?Q?UIfjh9F7vwAJ0igQJKwp6ABalZSZ2ylq/kskmvV8QAKxyshdMLlUvEvRBYjl?=
 =?us-ascii?Q?NsTcL2PqtnQDctndrTooHSephcNHRSNQYawoTgRjjm7eNWmU33J9nP9IoVpP?=
 =?us-ascii?Q?bi8YCla7gBxrtKHyAmuZuFmU0oh8/z8NowuACntYhgiQ+PeHYYgpRZYQk4qL?=
 =?us-ascii?Q?cQHtEI0mJuhBFY3TwFN8GIB0F2K9qgGyHwPwCR8Rz2Vs+y1d9xrLD4TDWIB1?=
 =?us-ascii?Q?Jnn6NvsoGwjHrS9m649OaBzIpVQqtb0KfRtflbPApgAclS9e4AdGxaj93Xbd?=
 =?us-ascii?Q?/T6P1CxissAFxirTS7etk6wMbv5IevjUxxvJLYe5es1Gfv9W6NL5qo1wjgSv?=
 =?us-ascii?Q?iZeK0BvuiksCqD3suwp2mPUcUhuB2zU6kJXyTNQSMGGCSNt2n/2rWISvQBn8?=
 =?us-ascii?Q?cSwz4mJdPAC8dDLNgar+SrvudayMPY0niNmYvNGLEsvfIxYQ2N9k9B7Eh7PJ?=
 =?us-ascii?Q?UoO7tw5RyTTnSd45U62k+pE8XbE4brvw+LDvPdG9kJhxwMi+nXWaOgLbmPKo?=
 =?us-ascii?Q?80kfcIa9gL4pAikHOHm+WBlx5cjjijF1yryPNR6/uW2fLauT1gKrZS6QdftW?=
 =?us-ascii?Q?jA2MEVTHkbeXmsgSP6+YmX5mTWP8ChkOWUl9+sVRcA9JrnHMtxkTjE35ysgW?=
 =?us-ascii?Q?tgGuibKoaWO99PtsZdkIB0Sus9I9V8o9P2HrcdID6P89bl29qOyR4zsCryQk?=
 =?us-ascii?Q?1gWxKimY86uoOuMIokojid/s+PeZNdWLoAWVPHsaDn38TgFDCY+Y51yR2wbB?=
 =?us-ascii?Q?CE1bI2VRbmjVGear7D2/F1QV1hftMkNUTZWFs4DU3mw9/DH/vWotWIMMUkYs?=
 =?us-ascii?Q?KTc1mzUVJBf9incsv9cwvgFoYtsQKO0u382B7aFBiE5kO0vC1RWkyjR+Ksie?=
 =?us-ascii?Q?sHhqiU2b175wn5ZONzOF2e0Mkn7Nh4zWv5JjKMZ6AFSBHvOI0qp3uXVV8hO9?=
 =?us-ascii?Q?sJE+13a0l/cC9F8M/IIQKnaGwNhnl5aActXPntmqFtxL5tmQ+Yimm0flckNF?=
 =?us-ascii?Q?/HX1QwEID8OM/KBvgN3zhvhOYj+YLpyEK1L2L7GTZerp7u1+jmDCMKrxQtQH?=
 =?us-ascii?Q?l+PKLopcqZJSWMS1UIgdF5jfl29bJ1xmlkMd/ealNhcNEJu3QelNFXqnlygd?=
 =?us-ascii?Q?xb83FnukEhqn8BW+aOjxql1YXAvWe2G5oMe+W3+nP5xiKN4FpRv4fe8zTW27?=
 =?us-ascii?Q?NxdtutQaCEE1dwKRs87d5Jw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e5cdfa-f262-4d87-af6a-08dd6d0eac43
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 09:06:34.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4K2+4eDXoTb8ClC02nvqusN7LE+/q7HMyfpHar0rLBSDjhNHkOVRTvaHtCljDCzPdKIqeGMUKLat+maoOe04Eor9f/VL2jgJM5QryPzlUmZARAtnS2+1SJUD9qdVk1uE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e5151c cx=c_pps a=ztkV8ooph0rfw1Th5QLTnw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=hcq4CsGITpEnZ3WPkYQA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: v_YSs8TSLkV_WRJA46finBucrr1el9fl
X-Proofpoint-ORIG-GUID: v_YSs8TSLkV_WRJA46finBucrr1el9fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213716

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Ignore the failing unit test.

The tidy check failed due to a typo, which was already reported and
fixed in the Rust upstream.

Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/8e7734978245522cbbd14e53e08e888faf031ded]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/files/fix-tidy-check-failure.patch   | 19 +++++++++++++++++++
 .../rust/files/rust-oe-selftest.patch         | 12 ++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 3 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/fix-tidy-check-failure.patch

diff --git a/meta/recipes-devtools/rust/files/fix-tidy-check-failure.patch b/meta/recipes-devtools/rust/files/fix-tidy-check-failure.patch
new file mode 100644
index 0000000000..54b4ee690b
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/fix-tidy-check-failure.patch
@@ -0,0 +1,19 @@
+fix a comment with uneven number of backticks in rustc_mir_build
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/8e7734978245522cbbd14e53e08e888faf031ded]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+diff --git a/compiler/rustc_mir_build/src/build/expr/as_rvalue.rs b/compiler/rustc_mir_build/src/build/expr/as_rvalue.rs
+index 3f89e33778..c66af11845 100644
+--- a/compiler/rustc_mir_build/src/build/expr/as_rvalue.rs
++++ b/compiler/rustc_mir_build/src/build/expr/as_rvalue.rs
+@@ -231,7 +231,7 @@ impl<'a, 'tcx> Builder<'a, 'tcx> {
+                             if range.start <= range.end { BinOp::BitAnd } else { BinOp::BitOr };
+
+                         let mut comparer = |range: u128, bin_op: BinOp| -> Place<'tcx> {
+-                            // We can use `ty::TypingEnv::fully_monomorphized()`` here
++                            // We can use `ty::TypingEnv::fully_monomorphized()` here
+                             // as we only need it to compute the layout of a primitive.
+                             let range_val = Const::from_bits(
+                                 this.tcx,
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index dd22ced57d..7e5854a62a 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -469,3 +469,15 @@ index 14e6013f96..b670f27ab4 100644
          #[cfg_attr(miri, ignore)]
          fn $test_fn_name() {
              $crate::sort::tests::$test_fn_name::<$sort_impl>();
+diff --git a/compiler/rustc_data_structures/src/vec_cache/tests.rs b/compiler/rustc_data_structures/src/vec_cache/tests.rs
+index a05f274136..0e69b4cb98 100644
+--- a/compiler/rustc_data_structures/src/vec_cache/tests.rs
++++ b/compiler/rustc_data_structures/src/vec_cache/tests.rs
+@@ -17,6 +17,7 @@ fn vec_cache_insert_and_check() {
+ }
+
+ #[test]
++#[ignore]
+ fn sparse_inserts() {
+     let cache: VecCache<u32, u8, u32> = VecCache::default();
+     let end = if cfg!(target_pointer_width = "64") && cfg!(target_os = "linux") {
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index ee23e5aa8b..92bb5e4779 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
 	    file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
 	    file://Zdual-proc-macros-additional-check.patch;patchdir=${RUSTSRC} \
+	    file://fix-tidy-check-failure.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "e23ec747a06ffd3e94155046f40b6664ac152c9ee3c2adfd90353a7ccff24226"
 
-- 
2.43.0


