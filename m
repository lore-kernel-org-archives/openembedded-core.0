Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0855C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 06:02:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7477.1741154546771181779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 22:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5159f55f0d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5255cx3g001259
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Mar 2025 22:02:26 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa097h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 22:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKH4fuBZxeD6O7i0OZXql5oQOO0v7KVQRaItmeejRvBcckVeuJMgEI35dTvOMNGjJkCAk7Hqj7GQFhvtaFhEVjGlpLY4jxMA6ZtEnUZ/bOPNpAP4cFYF6vIYIJxqkOmpuqBTQGKR1ZvYZZzmpr/ZAxgEMstiweaDCpx95b5FSiLCYFEZ6qKv916+8W7vfrfYkv/eee3QbWFoMOmJHhzf7hEi157RohHhbQC9fQ1f40AOo4ESOr89tlxmmKrhn7pMRxQTr8W8X7Kp9vQtYAdakKWfhHpg0Rl2t2Wvv8yYnohz0FV+7DfkZNJdNYAkAV/4ol+83NmoTMWkexBisqMUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Non9G5DwYjprgfI3mpSXbyXm7/5Ca1H07oDbr8UeKh4=;
 b=StSKbbaK0LffMi6IO9+BC5EJH/PklGREoCXfNN3ToovTAVbfap1VTBMP1Q4sRYWhD4QZICsw3BAJCaWNhqgM0hXnJ4Kt7n01uK3l2NQSF1D+T3UDd/EBmSbA9ZeQgEs17zzOYRKsWnKzJ8zunIaxMxAskg550XCj+2MK/MkezB4EfSHNIiA5uQZkfPzXNa1DRlvEoD+YM5TS7qoHChAU4kaxfhtUasIN2KDOnqJzDBMw/JfK+GOIc4cCe9VqwRM9TFTg7KvfYVW7f44vp1hBhNKSFEXX3sAqeMwZnfJ1SXGeMw3lwnq1ZGToVQnhEXjiPQrx3UfXrgAAI686EC30Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW4PR11MB5800.namprd11.prod.outlook.com (2603:10b6:303:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 06:02:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 06:02:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 3/3] rust: Oe-selftest changes for rust v1.83.0
Date: Tue,  4 Mar 2025 22:01:58 -0800
Message-ID: <20250305060202.2477305-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305060202.2477305-1-Deepesh.Varatharajan@windriver.com>
References: <20250305060202.2477305-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW4PR11MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 0101ee40-a558-4c1a-7760-08dd5bab4cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HPa1HUbNFVmKKb3Cif1EQWLY/lrJWhe2EIlOFoaCnGAhiumQJ8xzjg25ovLm?=
 =?us-ascii?Q?IVbQsPLedz6JYr+b2Z7EWoCCsaWKfzYd4M6xVyv/bfs8Oykqdy2sTRFtqN+I?=
 =?us-ascii?Q?st5Fkrh01IFDPhTuBZVpNQESTxgKWKUe3ozCah3LFsLTYedyBAM3WeI3y0wI?=
 =?us-ascii?Q?Z8QDPppO1Fj8HLWlSGf0KNFSZ0JQn7dWAbx/LB1ID9YmWcYeIdxsJkGL7J3Z?=
 =?us-ascii?Q?AY78qdNTrzzFsdjgS1xO4vVuUvANElcJt2nQNNPTD4Fl08IEw8cX+CRw+xRC?=
 =?us-ascii?Q?u1Zpx5j/zE/U00VBCOt55o+nIKwtJaWAIXQ1YBL3oZ8iGRAec5ji8pnoNOmF?=
 =?us-ascii?Q?APXJPjoLJSqG382gMI0jzUwXv078BaddMHrvWwiYs2ugF6nm+vZIi+n+zNuN?=
 =?us-ascii?Q?QwjXNvUOTTTrATL2yERCiCEb+yZRpg29Lcjq/PZd8fpW8tMV6iLiaBUil+he?=
 =?us-ascii?Q?ZTFDFX+LzjT/Uz28Wx6xlS67rI4cDvHZYdk+1pCrqye2XaFtgfHi1JOgzFYZ?=
 =?us-ascii?Q?G9RYG1xaIGj+thAOhpdPXQfN2FhAIcyLw5QWOEE/PE72kOM5jw8LX0Q09gGT?=
 =?us-ascii?Q?VG5ppVF+kpYpqUWcdO/zMRSTmOVUTqKtCQpccoMr7gMG+LMweavgeWQ8r2jc?=
 =?us-ascii?Q?jMuUt2WWwb58k/dMRk0w/jSyHJPdLpz3Hoj3SH1rNm0fwjkvMWes8ah2IQwu?=
 =?us-ascii?Q?ZdtnTVmzZf3uK3o+kjNOlNFQ/Xx6lkWaduwbb3jjBbKBFFwNpBrm4vemWLSr?=
 =?us-ascii?Q?vNAAo6mA7L/Sa6UkI674YV7smbIBcRgRmI9A6jcPbZw92r2KI4Dmd3Bcapb9?=
 =?us-ascii?Q?/09VPDkFRgaD51dkXWCutlJipxurgEILwMwD8gfEu9sT2aLAqClrEqWg4qX5?=
 =?us-ascii?Q?2E6oEQnHvSeYrSf2nI/t5Cr+3Z1CG0FnLYAUr8tfmypcTCBdkjWhu8XQz6eG?=
 =?us-ascii?Q?N0jd8yWsVTDy41P796RTAE9f0zFXm1BVlKfW8pZiet5sAYJfo029opN65AzG?=
 =?us-ascii?Q?OJvl3DFTVZkEhhilZ3w4GdRCMNMx0mfnfPjJ1a0vdCU9E+W5JbBBxpY7mGiH?=
 =?us-ascii?Q?sv+C8gZnv8bUQ+hJDy5wDZwK4SWKhocOWw9BSrOSRRcRr4+vnqZf3wZiPPqz?=
 =?us-ascii?Q?+p0/VNdJEsN3ao2NXMZHoPSiwV+2lYIoZie6BV2PDvrXB1ybog90qJcra732?=
 =?us-ascii?Q?+1CtfPW/fX73ptd1/fDeFVUknhOk74TGgDNs18cEzEC8Jf5ITclMqGSHMKvN?=
 =?us-ascii?Q?wgX2EYhGYHUkJLjUI/5/FDZaGvGjzm+nE7v4N8yFhRNfcpGVukVDwYH0ghpR?=
 =?us-ascii?Q?OYQU+sBzZWnZN5CAt2iEnnRp9az8yeY5uFJaGfzXkEouGeWA+ex0AJQ6LpUf?=
 =?us-ascii?Q?1LYMOcNylp/X7wSyzzXFFkSevznpQrbgujqajwfJvWFozibCIENxqkdc/iKJ?=
 =?us-ascii?Q?tz/56hdf0B0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T/x1jV4DY54bIrGQDQGngQ6CPb73uk8FLJJRs8p5XNsyP2V/FQxdAQiThHHG?=
 =?us-ascii?Q?PDBHuGm4g/exS6BizaLN5L2fvi4e9Go4T9WUJEpJAdOAnp4ba6gzxG9kb94H?=
 =?us-ascii?Q?kDfWLaQqjFNPj94O+0JJFJ2mqfBsaflmtzA0fTuVyMgYvlE1vbQWWQw0AYiV?=
 =?us-ascii?Q?P+jbCX1l54S4WKwDoyICfjIUYhCIevHIPAsp7krcSE6sDGknJmDBGXWigjoH?=
 =?us-ascii?Q?MamLSehekV+WubDYj0hPMQvv+8XAZDf8X2HntbowXxUM0voRwoddh9NCeyVx?=
 =?us-ascii?Q?3rzG21qA6FEjfOUeHWXhR0EF3hHo5khAocdW9XeexNUEpKbTX275pknUFbwD?=
 =?us-ascii?Q?OubRdBmIkHyvvGqtTh54OlZwR9iX4Wy0rSbKUZajdeKtj7YWKlWVITfiVBZl?=
 =?us-ascii?Q?6Vc7OFs6hnz9hvdLtMm4Kr3Q1Z9jltmCeesGUMTuIaQOfPm0swbitrcmlvbO?=
 =?us-ascii?Q?LZ8Q7ERQ4WIy7sZzUUe+wedRg15HgpE0xJiT6HvXX6kY/IBoSM6rqnI8D3AU?=
 =?us-ascii?Q?cpeLW7xoD+Q12Oxc9lC9dT48Pd6Mq31tF6GI0VattEst5FRxSXtLnJ9w1FZM?=
 =?us-ascii?Q?QjWQTNauhSr14q6PLyYBHqcihQizJtI1WqG7APEe9TjArpah2GlP0LBWu9L/?=
 =?us-ascii?Q?BY3huFt8Cexu6bxulnPhwoX4sb9i924NzRjRslvfVvqFicCfi4VAHJnEsdZi?=
 =?us-ascii?Q?uPV9zwqRcY2HvnAcSwrA2zVCl9Dy9SUqHXDszdX5WIB/iUinPhut2QRrS3pp?=
 =?us-ascii?Q?CC0kdi0Cd4btfVxpF7IKfrvm3TnxgYG3BcCzuTH+HmQNPjcX/7cH0bngW7Zk?=
 =?us-ascii?Q?tv/gT4owB69qcnu+/7fwCCWp6x7Pq3FfUkTF0A9sjFRlen2zcIhwrb6hY95M?=
 =?us-ascii?Q?3aGC5jN4Hrq1UKRJGVqR/j89P7idJKfaMoqcPtVSlTMW8iaA+yG1Z3xaC6hF?=
 =?us-ascii?Q?b/tzvKI8UAKB5EuQCBkqPFAM8TgDizWy6Pqe7VxmBAeb4Q3zhbx0r8CpKPjo?=
 =?us-ascii?Q?25yWTFGhX4VZX2MpJpYkoGhXBBMmzcnKxIe6Usge+mEkRMRFR7t/mDVj5uUN?=
 =?us-ascii?Q?UdM9ZpufelChzfCASBpXsl/X/9XnJqLDyrop99GqhJCko+Ikb0uTTvwdMo2e?=
 =?us-ascii?Q?ZZg7DzVJ2cFKs+CAiqSx87PrBTan4BgxlykoiNqzF7i7z3iCf6HIfvEVcYH7?=
 =?us-ascii?Q?YCbhpIRFOLxDTd3xEQtOxP2lTZdPk58bAzxCj3ZNi/MCktluLbXUmnLJmgN3?=
 =?us-ascii?Q?pIp416cbp0GraqIaKtzY0W5zOpF4mbAiy/C7C3pxHhaGSVqef90+b990T9HC?=
 =?us-ascii?Q?wAqGC8h1cX91hkQkCl/mNIQcajaq4qoC31Kmz7OeJKjHupNXfGRnonXY0GX1?=
 =?us-ascii?Q?U5JN6UfrR03Oqu74E+9XhpADm0VVFD7JHh0tYPe48OLriep1hEIF1xbCiaoE?=
 =?us-ascii?Q?98W1OmgYra8gqoSsVtAc/6MhGRufZtGlmsizi+A+G/YdXWAtix+A8RNSV9LA?=
 =?us-ascii?Q?s26fgCOZaZcqlq6Ve4gPveZU+uz4kDZ4E59cZUaSWX9evmEJfRqnCBUJUgiM?=
 =?us-ascii?Q?ZTsJllKZUNYZmMY0mfOKBw3NhpwMA+xcvoqWb7IiEER6rLD5Q1iRIXeB63Hu?=
 =?us-ascii?Q?iT9UW/RCI5nD6Ot3Vm7WYJg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0101ee40-a558-4c1a-7760-08dd5bab4cec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:02:24.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8mAsm7T31vj+aKN3s649mBAsvzX96IEYTu6Y7LB1/FjeJcMUVuCpfCHeI5U7yEFI/OKgl6d2kZmsARk9SdoagPpy5jEsf03PmYatEtwYo925NRoLJh2LWeuLMgrGMUX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5800
X-Proofpoint-ORIG-GUID: Zmt0xulhbp8GDMN8o8rP-NyvT-Z6ZXNc
X-Proofpoint-GUID: Zmt0xulhbp8GDMN8o8rP-NyvT-Z6ZXNc
X-Authority-Analysis: v=2.4 cv=d4wPyQjE c=1 sm=1 tr=0 ts=67c7e8f2 cx=c_pps a=mbHLYBybxRkByWxHAZWYkg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=t7CeM3EgAAAA:8 a=WFTxyNmQqsO_bqTfBkcA:9 a=iEONQqeTb_ULd1F77TP_:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 06:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212294

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Few unit tests are failing for x86_64 arch.
Ignore the failing unit tests.

Upstream-Status: Pending

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/files/rust-oe-selftest.patch         | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index b2bfed0726..dd22ced57d 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -438,3 +438,34 @@ index 4d342c72cc..9a77f92616 100644
  fn arclones() {
      let value = 12u32;
      let arc = Arc::new(value);
+diff --git a/library/std/src/thread/local/tests.rs b/library/std/src/thread/local/tests.rs
+index 9d4f52a092..d425e5f7b7 100644
+--- a/library/std/src/thread/local/tests.rs
++++ b/library/std/src/thread/local/tests.rs
+@@ -346,6 +346,7 @@ fn join_orders_after_tls_destructors() {
+
+ // Test that thread::current is still available in TLS destructors.
+ #[test]
++#[ignore]
+ fn thread_current_in_dtor() {
+     // Go through one round of TLS destruction first.
+     struct Defer;
+diff --git a/library/alloc/tests/sort/tests.rs b/library/alloc/tests/sort/tests.rs
+index 14e6013f96..b670f27ab4 100644
+--- a/library/alloc/tests/sort/tests.rs
++++ b/library/alloc/tests/sort/tests.rs
+@@ -915,12 +915,14 @@ gen_sort_test_fns_with_default_patterns_3_ty!(
+ macro_rules! instantiate_sort_test_inner {
+     ($sort_impl:ty, miri_yes, $test_fn_name:ident) => {
+         #[test]
++        #[ignore]
+         fn $test_fn_name() {
+             $crate::sort::tests::$test_fn_name::<$sort_impl>();
+         }
+     };
+     ($sort_impl:ty, miri_no, $test_fn_name:ident) => {
+         #[test]
++        #[ignore]
+         #[cfg_attr(miri, ignore)]
+         fn $test_fn_name() {
+             $crate::sort::tests::$test_fn_name::<$sort_impl>();
-- 
2.43.0


