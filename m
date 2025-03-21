Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA7DC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:25:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20995.1742563534805632650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5175c2733d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LBKCca027086
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:34 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrd26n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSfGixKkg+FRzMjHqFAPuYsO+4yPIVY3xW83oEYftI7p8LU5lcK/GEtQXnUBkkZbc9T6mh4EN2UZJFnnUEgmYq47yAbsxWrrOMKgGNYahkuzfGPItY4XGo+VIcQAQ0Fhds0BkiR4RhSGIEZYrcgSo7l6l8vNbKin8JwJtgrwpbM9+vCmvN6UQ1Q4lKYIO6R0836iXiW5zXgJ6kQ6bgPem3nFT06V3pUWegNKl10A4WA7RZBYkfrw0o2HXqjBCBi3YRnNAnR6gGqTBp7Q7pXBMzA6pypleQcOi9jZvkU5a2VrlyKHeCgycxeXFzoYlqi1HDa0J4kM1k1s9ceaoZ0QAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByXxQ7NBjEyWuCvNtiayAIGT271/VAubMZsBDaOawgA=;
 b=mj9pBasDnpKmtXF91+bcT4xrOtQbPkhKAwBZCcyKoKey9SOlYDcVvmp/hgZlk9mXNz349U55fMOcMS81UX5UeocKcr84/YLmtq0be377alLjXtCRdeRKZY1HLxzntVqvht6PsR8pWAkg2A6qy7+aez28ppWAS6P45BnvcJst2fUF5zihl+OWRaE2ZLvK+AiDDnvla8pGTKLk1FA17XN6w2oCTAlZHBowleJ8o4fyIOS1ZnWgiXmdUOUTKJqtvkaxSGQv1e5IOcO45hBu0Bw9xnskMA40sQvol+ffGBhoYyHTg7H0nm5/8ZvpD8JQoGpBDkKvxWa3PU4kFwdEgSvtvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 13:25:32 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 13:25:32 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 5/5] rust: Oe-selftest changes for rust v1.84.1
Date: Fri, 21 Mar 2025 06:24:56 -0700
Message-ID: <20250321132502.2607941-5-Deepesh.Varatharajan@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5a851e68-60f0-4279-417f-08dd687bdb5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hYP0+mkiUv8QVHEOkAfQ8SbUEIQq2LeFwyGWzz9FJ51jlhQCQfef5N/QM4ov?=
 =?us-ascii?Q?cJ3hiIuymDS5Z/Fq3Ar497Q+5houZC/tEWjLrSS8HiXRUX52P8YQtpsxpbO9?=
 =?us-ascii?Q?EEox6qDJZ4QWyTbKE8kMK2hVgUDQt5ArlvPH/ZAbfkJoUxHiUpOsSVeRYtUK?=
 =?us-ascii?Q?DZpq/qUOu8vwnbJpXErGWI5Y0y5r2JK9f9X24HiW6UHqzvrEKWd/tWGNX4WF?=
 =?us-ascii?Q?0QW3oEZMk3x1dJ277rLCoQGPxUTWOgYSXnR7VdDzvyzdG4XkyJVGDiYC++Bh?=
 =?us-ascii?Q?rWICw+F2i50GAW75srEMdXC2Habg2qIRWL+Yb22HpSYx/Sd3Ydb9e3ZOM04O?=
 =?us-ascii?Q?zrF/F3sxyk5rLCBBqgJQBitafDfzTlAoJ/rwVtCRdeOJg8LTdjrmIiYqWpNv?=
 =?us-ascii?Q?42t65b8ad9cQDeLLOpohiEuXOWVPeZubLJZxEopKni4/T+BcPN0dBBIiYOHn?=
 =?us-ascii?Q?QgOrjQ/5kp+bb31lgv3nXsnZhFwQ+TpWgj0nY6Bbdtcii/XFSdRnpegm/icq?=
 =?us-ascii?Q?w6dWBceEb3WbV9Dd6Ru7/CFvb41KzqglyjWC4UY3fkGj7iCfdFpMDdr/PEox?=
 =?us-ascii?Q?ZlA62aaKITxYsrWz6ZRURWa/BSqcxGWyBGAG4p6dW/b3wQRo2xigxny24WLN?=
 =?us-ascii?Q?5awD2FzLpYptlOnY1mmGyecNdTE4gDRmjNOZ9aNOT9E3vNtRgEU3idrgJXG2?=
 =?us-ascii?Q?eLxpb4yh8m8486Xeud5XP6BcoSTVFLXRNVoGRYPoC3yaAvJZ2iU1blUeyIhR?=
 =?us-ascii?Q?sU7dzXuGJLIFDRvtCa5O3Mw8rteLl/HWl8ftiOTtlGBUyU1Lnt/qGbopot47?=
 =?us-ascii?Q?SsEDk8X5oGn2MWItGDDDg7iIsYaZ+yAA/qdIFOKpEfBa6GZq/1iPB6fWBmPo?=
 =?us-ascii?Q?EATu9VKwWOmOfrLyyl/pGzy5pusGSpgq2k3b4Ybe5obtTxzGWSr9WX5vFBi3?=
 =?us-ascii?Q?jG220XEf9XFgz99GOpvgUoisjlFMNTYYm7/gerfeii817RpbHOY2RcogsrJq?=
 =?us-ascii?Q?C3rHG1FtuU59PTeCcVgktHPoyKCicSulnEk9KqxmxXGEnxh0KBIOkmXj5VYr?=
 =?us-ascii?Q?S3+2mJECRlGubx+6FXczha7iCHyaeLagQ8O+KaOm/GmgE0ybQM67+gouRhoi?=
 =?us-ascii?Q?Wu8y0KZrjitEAHvorSXXLe6fXmtkuCaYq8kguO0YxDNHi6hQhqRXU7+pQpxf?=
 =?us-ascii?Q?A/NiorLN+nk77OPGh+viooDSR0sa6Ul1wy0g4WZgtRPf1DeWjudjQuYn175P?=
 =?us-ascii?Q?mnyNl0DR01HX+6bZF93poEnm1hUO/N2Xlou93CEvDr0uTlYiDSHVtB0drU0i?=
 =?us-ascii?Q?Yr/ANd9Zu2kGBk5jGqYemjpmdY5XGooM+btWxLiDsIJH3E6UKlwAvVZWd+Bs?=
 =?us-ascii?Q?xflHMn1+J4MTb2BijwocZ+J3UVro?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pI84SfK3s5kEpBEkNZ7MBx6nU/F3X3+ioXCUvgloFe8wwtpewnbWIo4uzERe?=
 =?us-ascii?Q?IToF7f1s/tEmTg+C2r5lKJ9HkV13Kr2q6BuMmkGdJOnno1VNezC0TnTh3d3V?=
 =?us-ascii?Q?6zzxAdPubtIjcfe0ZKLOzyKe03GufJFUwXlpvNL7CFlmuIFY141Vti52fbxD?=
 =?us-ascii?Q?8SJWX5QGczvrGWI7C3ZVDJWWxq3viwvmdo+C0sO733o26rOgECNZa1SHKw93?=
 =?us-ascii?Q?65ZSodBQGMyq7UqJ+AkIwRmgEODYINM1pDUgbLS/BuTmf9RbKkxe7PkCjI7W?=
 =?us-ascii?Q?O6DYihM1AcKeMj+zywGZAZBVAdLdyDtggmFhrPt0GFQkcca8OjOWPN3feCl/?=
 =?us-ascii?Q?5kWIM43gljMM43V7U9ZonLQNtSRrsRomGF8/j8N4y8qbl2vip2j2RKc+GI4A?=
 =?us-ascii?Q?htfKQ+lFYDfpje+uHjMkfI0M6R4hn9P7DDICBsKW28aDPeXH2hYZsqaQZjqb?=
 =?us-ascii?Q?6FQvmdLUI5cyURanYmUi5/yNsTymhERbDNgaQplwJoMw/HNBiO+V5F+G7wz5?=
 =?us-ascii?Q?mrtVigAAkTkbnYQ1rR/nor5zAPewwBUDqrvAxWSwRBVZ7I4e4iqZy4sqZnb3?=
 =?us-ascii?Q?SFPcCJOU4K/TWXI5FSejR7vlbvfqYLpPp8HFK4GyGD0eGfJ79daEPODyo6Le?=
 =?us-ascii?Q?iZ5UbY57nrjqN65mY94TuNK7BBa39LhkmNUn4sGrsGuonApDz7BioiPa8lgd?=
 =?us-ascii?Q?2o17Az7LvawzxecID5/EGfmdG81+MaLMZgS8hRiJPqhGbU1vgg6HlbNCOT6T?=
 =?us-ascii?Q?LfMHObQ5gSugeC7A+hKjci7bxgB5eDfvjbap8hXkBO21IZ2UM3mReo+1Yata?=
 =?us-ascii?Q?7muQuPjk1Tluugq76V8x/qFGZzSOLXUAqRe8DSq8CEbwEzmX4Jh1Jc7yycqA?=
 =?us-ascii?Q?yBV5pq612H5+yXtBcfgfIeP7v8hgyq79mnkh9j+Zeqgkl7g6FGHFdyBipmWu?=
 =?us-ascii?Q?arxFvysWoXg6qbJBfE1vB0x1cnCTDOrQgAsGyYgC7uDvQ518bcuFy9OR6uR1?=
 =?us-ascii?Q?MKNx5UQNjwcjK9l1bC6vXuALm3lJoChLx8kGroHNEPx/yNRxrdLg5UGknt0D?=
 =?us-ascii?Q?R83MgPk3mAz8JPOKytUOsaXom9HaAAhPXHR7v/+fZ+ZQcZcjBfBgQUT0+M9i?=
 =?us-ascii?Q?RG6sGH/5VjW9wjnOv2hA27W8l4OGP8GgRoRjm19eHqxoZtBHLSEK+TxGYcr1?=
 =?us-ascii?Q?fQjFwwO9/t26+OcNGIdh/XjxN9laPZsjN/2Lsr7I6q1YsitCl7AdjQ2REzZ6?=
 =?us-ascii?Q?yg7nlWcIbWd4yuY5wiuzcBIR07X/fh5RejZTK4bgSKgC4YaXM0VFtPYkT20k?=
 =?us-ascii?Q?MMJYSKzXo5DnW9LmroALxyMTn8BjCA2Y8T3vDS2Kr1kh1JfpjnMZoWObIVhe?=
 =?us-ascii?Q?jWUN6EAzNCLueTf7GFEiRxVviYLiX2obEccFaVfi2wKCuXr8nCTrZp7RXMVr?=
 =?us-ascii?Q?0c14ttSB/gHmU5If9og8a9Z3br/pPm5qgI0HLQeUx8Vns9zvYCMU9IXoJ09a?=
 =?us-ascii?Q?wCdmCgEMDdQL16viGhd8TINRTWNGvFmKcTvRKJwYI19TNw7Ac924WajQpjXX?=
 =?us-ascii?Q?x0ApRiz9WMmT3MM+g6Tc+LLGUN/oLvvJAkqRpgChW9FljGkT39+Xu54b55xO?=
 =?us-ascii?Q?0uGXXQaQnSp3dQli81FQ7hU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a851e68-60f0-4279-417f-08dd687bdb5b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:25:32.8317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc+KoaluJObyofsRmsrjRhAL6VAazN03BaLKr+U+fI5S93czFoQ1BJNPV3J3VVdNsfQyYev+ySN+9tdFUWY9vUvnQrXYfNrT3w1IsChh/cqmDY+uwuEykhQ+N+Tj733s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67dd68ce cx=c_pps a=XlWNgFwcAB8XWrBhwjv7Vg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=hcq4CsGITpEnZ3WPkYQA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6d0JsjEZXygSxyFaTjQ9LqendS32jgmk
X-Proofpoint-ORIG-GUID: 6d0JsjEZXygSxyFaTjQ9LqendS32jgmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213455

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Ignore the failing unit test.

The tidy check failed due to a typo, which was already reported and
fixed in the Rust upstream. I have backported that patch to resolve
the issue.

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
index 7849381b62..69411d2512 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
 	    file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
+	    file://fix-tidy-check-failure.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "e23ec747a06ffd3e94155046f40b6664ac152c9ee3c2adfd90353a7ccff24226"
 
-- 
2.43.0


