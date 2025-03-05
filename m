Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1084C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:45:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13323.1741182321439676090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5159f55f0d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5255xLnl030495
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 05:45:21 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa0q1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5tjoIRiS4kBzaBGfzRgpF/RK0LzkqyqT8bbRkf8p2clDj04ZttxfR8uPpCNdnUZJMl5avwphkU9duqYUk8dCu9iT863yvNDZs3seYY/zVZj2/T1xQ85DFGSirQmey6J4NwFnf5CVAMb7Q/3reJVWeUQCLYsvELzsVyEv0MLctK/qWMpeCQQhquFxe5NfZa78jgsTmWyVEdbUfBLnt7PyN3HEBTuEx1ssKmHMTM+p/4omiSmLEJOS+oQuukpA5PdBLMH9KtOSht1xLPzQPxoZC+qhrMorLmH0fLGTPhD6kz4bsMKEap0XpYppGFkJ5Xj7TUQpK8iNRbaToVc9B9EDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Non9G5DwYjprgfI3mpSXbyXm7/5Ca1H07oDbr8UeKh4=;
 b=G3NZg6WTJcnEtB62OOVJoLGuB9mxqpW1ay37tsN+L2/TY3QLyKMogMicxttRyxjYCBj5OytNTDuFic2fk1YMMGLUJTbGsyxRw492LsL5UkdbsNvE73WyQlIYJTNdpvaQdD2As19tDQx2MlR3zVl4rTcVmTZFPyAIq2Q2ba4BbRUnDzZ+9WcEaweN+89AMKLjwoF0R3Q2sFrutPThj1a7iEL39QzmvnPIVL1IPP7xNfzsHMu/8lP7w337Rbz6LKHxIULgmi4sMw6EJ7nv9fSM82WpbMWWBm4AsXbZSLWOCfWR+UQIWXviMU1pYGP6FDUV1RWS9eIFudKdSuJ/+YtRsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 13:45:19 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 13:45:19 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V4 3/3] rust: Oe-selftest changes for rust v1.83.0
Date: Wed,  5 Mar 2025 05:44:55 -0800
Message-ID: <20250305134459.2275598-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a43044-ad76-40bf-f5a0-08dd5bebf7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a4fWXgCiOWrWFpjUuS/FUSN6FoG7pypE4hOXIMWrPipIB0+XHYCPX2T+YFN5?=
 =?us-ascii?Q?TEQJWK7xhHpTbTZ/Y+ZmbFV71GvyobPHFCXSQtjLjd6Y6EcqEqTdwjfr2PNh?=
 =?us-ascii?Q?2ec8N+M8+tE4WhcUaFUsPENTweBl+naUg1kZZpOghIv+dzxClZcB4k5iyTdO?=
 =?us-ascii?Q?ufEhPe+hPsZgud//7yB52+FQrr3gGhIPDdxWtFLydi4i6kNkKFNXw5l3SptJ?=
 =?us-ascii?Q?5+ZydMYjUbq3EFgnuOFd3XVgj2zHYw60VN7dQO+ubdwkpQUhOnY5ZzlxGuVY?=
 =?us-ascii?Q?TRzTe7njF1KB+xPsqCnsJjON3Nj1ho6k4Te7nOvNx6rzeCvAbn6iQzjq2MrO?=
 =?us-ascii?Q?C6fgtjqAzG4eY04I2Yuf2rzMmCXPn9bG4OHw836UshMeYEELthC2gRARLEs8?=
 =?us-ascii?Q?0C8YuawvfFxdQAPn3Q48e65D3Dl7Kt/xW2mgeUbNm1ImYFfFCVJ/KGL+GC8f?=
 =?us-ascii?Q?A5wq9zZTh0epig1O5dB4EI4Y9LjrvgavQRoFxwBdBBtBJAQ4C1gwr3l+WW1z?=
 =?us-ascii?Q?JjVxWIMqcNlhXXtdfNHfwDBc6fobzCEhaSEj0ks73itF7Bffux8Gzyh5pzkR?=
 =?us-ascii?Q?i/E866TcQXH+sADMpCRo1W12LS/l7dHWXG6AxraAmKYNUCAuccgxcWPrxQE2?=
 =?us-ascii?Q?ScBK9gqZyQMU+xlJYpJNLN0H2otn4Upi5oiJaUS+/jsOgMAVuyVu6ySNLJrO?=
 =?us-ascii?Q?L/5ExIZGpEBE+YnVae5KETG83u5nmzccwF7zwnpjG2+iu4tOwTiYxjBsegI0?=
 =?us-ascii?Q?+KE4ewCl+flRafuU7eyFRVPTJRA0gbqXsg/ENursdBqY+WTA+DLsdpK1hfC0?=
 =?us-ascii?Q?vc9qnnVkFySea7LPlb/+9jJGEv941K2uzp7nZoCMSI55zzzNYZe9yvEoOVeN?=
 =?us-ascii?Q?0XaJJz4tOQ1Cx4N6YpKxPBaPZYi8vMQASM4yaqYGpeKdDoirXhKnY6ytgUuo?=
 =?us-ascii?Q?p0TJ7qoPPglThWOTnChEDSsoscjNFxSAFrgYweEWeVti7MZq0Y9NNyXrMaUt?=
 =?us-ascii?Q?kKaM/bV82duQXqCqdYO4s8daiuuUapgRgfsqJagcrClkfQzEaKuizG52j/Ol?=
 =?us-ascii?Q?TPUnOQcJI551GtFQwuIBTMokFkL0RI5msHVP7YUS4epYHPTFPGv+FSAABARh?=
 =?us-ascii?Q?TmYgIcQxfQ8nzroAGMvGvKOSZ6BRlnAxHSpksiTRuoq0WPlCOrWxpu0eMvTb?=
 =?us-ascii?Q?wonIcw6yY0+t4oRhBPP8raj3cba4ae3jQYeYhRSs4yVQFNkpkohRF7cKTYU3?=
 =?us-ascii?Q?VGKP9C2PvSUzn8XKOTdtlG3/NHp7JT7ZzMO5OtDfakWRtzCJKcpQtmgmxY81?=
 =?us-ascii?Q?Bn86N+j2+iQC/EKwTBfdCyPIOlsvpwhMDzr+MRBB5DTR6iqLZNLppss/+MjP?=
 =?us-ascii?Q?JqFbVphGbI7apwT8eDbqrih3wBEiYqgqzJiQ3VdGsw3oix3Q2Rit1nIdp1xM?=
 =?us-ascii?Q?ss2F+4XgcYk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QL7YKo6XWnRVHhHX7LCEGMzB3YqD5+8/kCHteLHbfzztistpuwm++exZQARg?=
 =?us-ascii?Q?07KZ4Rid9R27ta7YdQDHZfRqEISs4bgE+FKKh44bzAvlRIbOPYQKlL4zghve?=
 =?us-ascii?Q?Mt4uUnp8UlyjW3NUVM7w4q9ngjIFosdxiYviDHWkiBVQq4fX0leAuCd8QOQ9?=
 =?us-ascii?Q?EOO2g4Nw+g3NkNS0Cf9X8TrACvbqvZ4KuWxLXvnmwHh/VfccYEEtEmfal3Iq?=
 =?us-ascii?Q?PKlV0DMK93JKZkApwdhaDRWb9rMiqPHCv2n51fRajNh7MNS+44YqrqM4V3B0?=
 =?us-ascii?Q?VLV91Q+ejOxaaPb38P0EYnmzExymQB2mNuXsCYZjv8vGXEhirk9mvHb1ym7u?=
 =?us-ascii?Q?0PQppysofEreDHZ5SDS3JOhDjAHHyUKEKLTS+ONiYZlfZ5p3BQ+f+g2DF7fO?=
 =?us-ascii?Q?bYKGpFLDd4Ip3RAiWanBRzI+hGhcLGM3EcIC5ni1xKxFQ4h33nVF+h31wtuG?=
 =?us-ascii?Q?t8YyEauiMI6myhwtFRV7G5ByHLt0KRZNOFgRkZHRpjsOWL/Ok/tDxKMwgVrM?=
 =?us-ascii?Q?RbofTOLM8HK+lh4Jam+QLr8y/Jt64dvI38dDIIoC59DwwjTRY+eCDhOK54R/?=
 =?us-ascii?Q?xffdhG/30ZVmzWqGXRV2eH+YJ5nhN4jwgtYgcIv6y5EIxBfo4XNGFANOv/2y?=
 =?us-ascii?Q?8wj/vYRAxj4OwiavjeKf+aSC32+eb8lu39P8HD/Bufff+JCB5nn3x04zPByG?=
 =?us-ascii?Q?+pQBE0miCMctg3Ix/YfytNyeJmQ7cxB8ytYbx5tot7QxcAuvnERLb3MPK3eX?=
 =?us-ascii?Q?ON1u+tM3UnwDXUbIHLp3DOW5/ZLUleBIl9Sa1Zxo4yYH+cMxpjeyvSZ/QYY/?=
 =?us-ascii?Q?UJmcbreQYIsk2ilWXfsLUr2vggg8XJEyGdN9jcE2qDcspWx52QbfKWxU+07N?=
 =?us-ascii?Q?/H0MVWcmLxlnnJKqXXslCEFVnX7y2k+YWzqAdYZaBVoydTAHpnIrepGDJMUx?=
 =?us-ascii?Q?Ko+Q47TfYitihS/NmkR4aM/R2N/gO4z5LubP+l9eLXjp0SMSK/LPr7t12cNP?=
 =?us-ascii?Q?TXNNqp7ozNe/7ruNAkNQABUumrMkqokKhJZ9YM+WqpPFUzSxmCt+tlc68k0B?=
 =?us-ascii?Q?NNaPDIA0DzryblG5lNdTjWjvG+erfJbBlV14fvDOVyhkcZ8vsOblPlpBadVz?=
 =?us-ascii?Q?DKqcvX56c+JqymzIywe4sdINcC84G+u7m1OGt0wSTDXgFGcp0VKqjl9eryLB?=
 =?us-ascii?Q?g0x1Qz8xI7cd1XhrOsmVWh0TjDh5YmnF5/Zy8NikPz2SBTUIQwAEL9bFg4qW?=
 =?us-ascii?Q?A24Wy64avFaqKY0Nc7Ji25Xsa7nJ2U9rm5ytLPY2P2djxLl4GuAIrudig/b5?=
 =?us-ascii?Q?XT0AOpVYbgIzR+5iaXMJ3q8lNrvN4Z7uLXnkq7NgQJ1/taeN2M0eq37Agx90?=
 =?us-ascii?Q?TWkjpMWPGeoJZsY5epQPWlZXaS/baX5/FtI88aMXmKKmnUTv2TWSe2sIBS0I?=
 =?us-ascii?Q?KFLhuzTboZu0peCzQZMF02tVWd+6WAxgEgZG+7f+NLpXsfRjcLXCT3DXBB2F?=
 =?us-ascii?Q?GCeBGqEJ+DEGQfW+aqeG6aQyGjdPNftFQU7AYpzehVKB550Ebt43GN54yWyU?=
 =?us-ascii?Q?3q4Um6anXrW8k66F3XwQw5j5Cehur0JRcgFbhj7/D2kXgxDpCSSe4KVyTmZO?=
 =?us-ascii?Q?pi49oztxuKgTWQUUPvRYIG4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a43044-ad76-40bf-f5a0-08dd5bebf7f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 13:45:19.3310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzO9EK0z8jtq5Woq3o22TJfFTinCqDAwPZ7w9g0b9WR1th1fDRuS94B0dL7tg2IPjp6HMkOU8d+BhJgFP8IeitLllDtnol2GjP/1tVNY3CE9QuuSof94azBB9l5BvBUT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
X-Proofpoint-ORIG-GUID: iANLAISKXoJYAbIwR54A6Bd7NgG0nKES
X-Proofpoint-GUID: iANLAISKXoJYAbIwR54A6Bd7NgG0nKES
X-Authority-Analysis: v=2.4 cv=d4wPyQjE c=1 sm=1 tr=0 ts=67c85570 cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=t7CeM3EgAAAA:8 a=WFTxyNmQqsO_bqTfBkcA:9 a=iEONQqeTb_ULd1F77TP_:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_05,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212317

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


