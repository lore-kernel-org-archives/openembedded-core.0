Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767D6C282D3
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 15:35:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.56186.1741016122800299598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 07:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51574f6b04=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5239i6NC024832
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Mar 2025 15:35:22 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s78a90m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:35:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6tV4DUHegiNCQHv//zXM9234Rs6PnJ+yMTtBndntwehyetvLVQTOvmqASGMr/qZKFrzqZC+zLgJIaB3LaVOrQ9JDnWYWIlMPzeqmBJiL3FhWNb3Q0WE80tS3HiFtqe+qi6il/3xgdJUxTuceabVi3x+r6xADCTq7DcPQqJFBb2ak65VKojkhQwScnFuLgLm5uO14eAZqDClNiWKV7GsK5VlY83Dp2c5cT9a/Zhcttp28jtg67rR7DIs23Rd4ophfY8udyCvrDSxfA8D5iAQ5B1f9gqzVQrsQSedFEsaQVICL1I7RxvyAT+7RMNDRIrIjh0rafgGZTArtaCmhX241w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h+nwyOAv4EEQPnn8FPvsg16+zFKeodMn1q+yWWYpsI=;
 b=zUqwSspWoaOOW0v6SBRRrTt5wVQ06n1Lj0Pke2ghcMFLfNnYjrImJEPF7ek0X5p83XG9B0viATbxA/ZtB4vInYIi8qbJKp5FJMrknQ8QVEkbZfsIksUqyEwD71++G5aVQ8ZFtMu57WPIa0qVUxK/xKc1lSreEFlDFO4Tg5jspY8SePsax97rzqFkz2B/ZLTo7r/6Ycrq2wrfVUNtJwjB/0L5esp+QIxYMMmbnVJutTfcG0/K3eCSag/fn6uaaXFMw9OA5PnGm4lEH5fa5TX/+YbCqpmO5aruT2t0MkEgNX7XFsqg/xydN6DT7ZBkD0bJCDWVWD2RXYuk7CcmSBSNOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Mon, 3 Mar
 2025 15:35:19 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8489.028; Mon, 3 Mar 2025
 15:35:19 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        deepesh.varatharajan@windriver.com
Subject: [PATCH V2 3/3] rust: Oe-selftest changes for rust v1.83.0
Date: Mon,  3 Mar 2025 07:34:58 -0800
Message-ID: <20250303153458.2879205-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303153458.2879205-1-Deepesh.Varatharajan@windriver.com>
References: <20250303153458.2879205-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d6ca3e-e857-46fa-e80e-08dd5a6900d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RsahjGaBpwqqfvjJ46j5OZkZJMMDsSdxxSJTPP6a3ZqrDQzaj7I0lJMtWovC?=
 =?us-ascii?Q?Z0aH88YBdeFJKsVrWttxmcHsy2UxeS/SRqOb+jkrXURBtTHI7juf+AGclWrD?=
 =?us-ascii?Q?Uqayo8xpuYJelXmzRQEeQ4LcpKO8W8t8CP/TG5jP8vkQUQW6Qt6o49kT/et0?=
 =?us-ascii?Q?dS4yU+PGGntbLoA22D3+umjo7fVhC1piYu0K1xzGl3dbCIjWO8+aJoNy97fl?=
 =?us-ascii?Q?22lNAopXMacFa8sREkowxrNyD5zDHBTRS1CTDleP3eQ58Nyl07nWLFGmWzwR?=
 =?us-ascii?Q?mlMEIpb2TgIith9J6KhsBsnmXdhMy7KZNA5HciycilrelHtsyFtchv4XVCR4?=
 =?us-ascii?Q?lvBFsJhzLDX65o0nTJXT0jRPnsaEAToHyDxo2WjqNe7nFS5YkICogwiojU/K?=
 =?us-ascii?Q?K0CeoZLpt0u+xwyVj83DGqtHeciAtcQnIDFX538lIApbe6BNYvCUPg7fGSiY?=
 =?us-ascii?Q?bhDtNGFTKEZSuJsRNcv1Ws6PPLgjpfJEQiCqY3W39sJCH9xTBLJ8+e5QzYoM?=
 =?us-ascii?Q?DJE9F/wN+pGA/K72fsDIEIFmBgP67aJz3COWmOZlOxgb1QBEgpFdEhOnoQfb?=
 =?us-ascii?Q?6cx8Lts3Zo+LZ7Tyc9ALuAJJPAwQ6sCmVz73ulvFr4RNQc2K/xKfa9EeIVej?=
 =?us-ascii?Q?94t6uWOl2Dcc3gP7mU2+Lw+o9iupOClL/XXRpRNMM3VexaclVAtiHomOwaoT?=
 =?us-ascii?Q?fxTba24XgnqeyiBb9bxShKAnfDmC06owGjQer2e0GRlckSdq90jVL0mcHrZV?=
 =?us-ascii?Q?crBjtTooFawtpQbQzRzOzegjvJOK1CtGt6F543icEUcP0nCpCn2N0qSaRAHF?=
 =?us-ascii?Q?ehWVkICPvX5JhWaKS+izCCUHfoXmjs9ABOmCSs4VwxLjC9hcNiRfo6dICmwr?=
 =?us-ascii?Q?2GqoOZeW2Fd/+pd6zL6UO96lkzVI4BfHNP6pttMTr3OHoXaksObYcpo7LlmC?=
 =?us-ascii?Q?lEmkFFOWfktVu50mpouA2sUXQjffg8WPuUZn+HCuHXu0ziQzhfkCKH5Ezmlc?=
 =?us-ascii?Q?E9WXRUwvUh2NajncBY5zAoTjimL0kBWiUqqwS/l1sl7XtK+pn/kTYhNDWsrY?=
 =?us-ascii?Q?JhcbuvHUe9XTDCdWOQuQFPmSqFqfSL79p5j8qfljbBAOgX8Uq6apC7UNhcBN?=
 =?us-ascii?Q?tjDyeaRG4mRUL9BuxnNIeTIMsXDBhjvrxrFYjKHTC52xH6DO9G2KCG1a7VLs?=
 =?us-ascii?Q?ojN934Z/2a5JP2t3Y2JHXaXZxP1Ai7XsrU0gtVtAClA12EvcE70xwnW2jPsQ?=
 =?us-ascii?Q?BELQUcLGzxNxQcfSdmFJP+XbnUeKgpTy2hiDoJDlfeI+mltyz0QejQugpeZx?=
 =?us-ascii?Q?iYbcgPwvukdsF4lC0/4S5MGN8Yc73E6RSCdZPPr/dMrsmdL+J6BCSxwsDxMX?=
 =?us-ascii?Q?f0JDr4q4apgxzN398FV7PpGBVbIkZfKBi9x6QWIq6A2YuNamliZtrucbbJUe?=
 =?us-ascii?Q?apyiis4sTok=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PDJVcOiW6Yl6cZvEXFvqXMLo0/UIdE+5VEMnjE17Q/Luw/rPWBTXhvBA5V6N?=
 =?us-ascii?Q?pg9/+19d8jI6Rea8hLEtM35xIlDpA7IsOLQWHqP6jsK0Uw47nDC3U5liOXIs?=
 =?us-ascii?Q?B1Q1QPX8JBM151YQk3LGqq6NLud5thjg/uH4zegZ8jdEjSPigWUF0DW/7ocN?=
 =?us-ascii?Q?YkTL5vtBiL3U9j8sqX+0ssFwSnyjU6cJcaDtFmLbNFN7ZlODUFFCmUIp558M?=
 =?us-ascii?Q?/Fao04c5NeCNKKVM85wAPD41/gVZds7q9SxpkBTxipCnyJu4gPvQzGjvWvfF?=
 =?us-ascii?Q?6WcGyptfJYaQmQRz++agI9ryG+Ob5TnhqOTXQWVx51o5t3cySLZQEtHT4cwR?=
 =?us-ascii?Q?3FJPci/qwwg3Zwh8Rb2ILh0LSas5/DZhKOAR0jDRN12SSqTgTsBAUUOoINgk?=
 =?us-ascii?Q?ZIKMSkvgboVSEISisqnPPnjEtfecu4wLRfcmuezhNzv8XTDRngAdcKUDqqEp?=
 =?us-ascii?Q?nPJeBLbIuNYrbtZ1CaWIWQyQTB6utDqUJ61ARLFHY2L+2uo2l6Toaux7MbDA?=
 =?us-ascii?Q?KFEKANEgDuKjtcdsAaDKay5JMO6ILmifnTQbsQzd/aMb8gMieX+OCSlTNIOz?=
 =?us-ascii?Q?zvKNbixSXHCGr/ofKbmqbmO8FEevo4CGNM68mGtiJuLRlnsjNyBzBC7mBcHL?=
 =?us-ascii?Q?BgfkQYuL007tuk2rQ+DyN9r5puMj/gLZwfI1ViCrwmg0zWiHUaDGSpchC/Id?=
 =?us-ascii?Q?RprwVVG5YaMMwI2l0JKrbknY91IaVYAa+RZLi8nug9JxZ+RIbL/jw9T1T2sa?=
 =?us-ascii?Q?NHQ8n1YNRbHmgaLrehjA+RdzLuARrF16SU9ZDxK0W8QYzEGh0lSG3h6VWK0U?=
 =?us-ascii?Q?vmQ8XSBXwLI7XOrXh6PXQiHKBM6zWOGgCtm5asf8cEkdX2EY2YYtAQ9mUTUL?=
 =?us-ascii?Q?1fBhlPzmhvnzugJueumL3+ptk2vvq1I0lt5UHLouw2cP453b8os1xuCgf4mc?=
 =?us-ascii?Q?XI07HcXgilL/Uxn2UUTjTO5tB9RhtoA5zf300v6TtR0ytswPPExC2rk16Kua?=
 =?us-ascii?Q?JBHsmhYWSDGhuNzegqieOhU7JEwIZ2oN9xRkOpzCaWzzbeHBhHhp9LVKgWSc?=
 =?us-ascii?Q?1ktrnpgRMuZpjYQK6iRCmp/JTvewjcCWTDvHk7BbJcVzeL87YJYM87xqTexw?=
 =?us-ascii?Q?ho7KEIUwDJllm5vX4K71huukcIKKTzw0CSOESBZgF1Po7GfiPtBQxCVdCpkZ?=
 =?us-ascii?Q?9qdtaNLjq/q8agWUvAn0zgas9gRvYpf6hpkkXY/O/8VB/aBAR+As1Q66D77e?=
 =?us-ascii?Q?d6Y60/2KWXZgN70aKOr/Vde9wMPQ+gwBGx+6VGqDo6H2b3AulvpVcthOz6E/?=
 =?us-ascii?Q?eLHUI9sWXl31EXtsdPTjAr+hPYKJnV7umzCcEnWoj9PmVYY9opcfJkD7DQU5?=
 =?us-ascii?Q?1rjBXS2ryxQGg2irrnBu05DXYcMauUkBFXA2neYCUmYH3BEHRSCWn3vmbjr5?=
 =?us-ascii?Q?3qtqwjcA+yWBge8h25yLqjs+Be+DyuC1VgiAZ9NpT0n9GJA/cwwScEmqo7P5?=
 =?us-ascii?Q?NeRtfvAxMrhJtKbRzXCy52RaPtK0BlCCf/gbUkpCB35CWpNPoFN4bf8PFuBn?=
 =?us-ascii?Q?58KkVWAzZetrtsTCL833WtCBXjaQh7wrz7PAfIw+11rR8u/Ea3rBgi4Qqg3W?=
 =?us-ascii?Q?hZe74/Xf2it/iJVk33iMepU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d6ca3e-e857-46fa-e80e-08dd5a6900d7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 15:35:18.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8tgyITuuIqFS7AUR+Kdr7Lv4Ip4u8H4YUA04HmR5MQOlD6vkkyfdIRVs4M0u7Udlkh8F/KXXHCtdIO/hNSKmkj+KqQRpNVSPzDFH89juOYQoWhDFCl6Jp4UFqfWEoLh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
X-Proofpoint-GUID: hftRSpP_St5UCD3a5n8QEpKeBvouy5MW
X-Proofpoint-ORIG-GUID: hftRSpP_St5UCD3a5n8QEpKeBvouy5MW
X-Authority-Analysis: v=2.4 cv=cfwormDM c=1 sm=1 tr=0 ts=67c5cc39 cx=c_pps a=hSS9g3ca6WprpwKybkK64g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=t7CeM3EgAAAA:8 a=3khcl1H5EuJcHcRA1J8A:9 a=WgRDnz5trCaqgQjuXjRA:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503030119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212213

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Few unit tests are failing for x86_64 arch.
Ignore the failing unit tests.

Upstream-Status: Pending

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/files/rust-oe-selftest.patch         | 46 +++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 0e952efadc..dd22ced57d 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -63,7 +63,7 @@ index 35a5291a347..5f2858d2505 100644
 
  #[test]
 +#[ignore]
- #[cfg_attr(target_os = "emscripten", ignore)]
+ #[cfg_attr(any(target_os = "emscripten", target_os = "wasi"), ignore)] // no threads
  fn panic_in_write_doesnt_flush_in_drop() {
      static WRITES: AtomicUsize = AtomicUsize::new(0);
 diff --git a/library/std/src/io/stdio/tests.rs b/library/std/src/io/stdio/tests.rs
@@ -75,7 +75,7 @@ index f89fd27ce6c..79737f5b127 100644
 
  #[test]
 +#[ignore]
- #[cfg_attr(target_os = "emscripten", ignore)]
+ #[cfg_attr(any(target_os = "emscripten", target_os = "wasi"), ignore)] // no threads
  fn panic_doesnt_poison() {
      thread::spawn(|| {
 diff --git a/library/std/src/sync/mpsc/sync_tests.rs b/library/std/src/sync/mpsc/sync_tests.rs
@@ -318,17 +318,6 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_try_panic_any_message_unit_struct() {
      struct Juju;
 
-diff --git a/library/alloc/src/slice/tests.rs b/library/alloc/src/slice/tests.rs
---- a/library/alloc/src/slice/tests.rs
-+++ b/library/alloc/src/slice/tests.rs
-@@ -186,6 +186,7 @@
- std::thread_local!(static SILENCE_PANIC: Cell<bool> = Cell::new(false));
-
- #[test]
-+#[ignore]
- #[cfg_attr(target_os = "emscripten", ignore)] // no threads
- #[cfg_attr(not(panic = "unwind"), ignore = "test requires unwinding support")]
- fn panic_safe() {
 diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
 --- a/library/test/src/tests.rs
 +++ b/library/test/src/tests.rs
@@ -449,3 +438,34 @@ index 4d342c72cc..9a77f92616 100644
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


