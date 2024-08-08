Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE523C52D71
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 10:01:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.56289.1723111265221342022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 03:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89508821c1=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4783OOSS002027
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 03:01:05 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0c91esv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 03:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWg428DkcqfWrHL7PSQUgjfRT5iOnlmzLFRikezPlYY0KFWUpKbZiwtlMJrhjDpHJcVd+o80zIUv779lL9FQjKG0sO9x1boMwWPIQFXArssKYuYh4nK9fiuVWq5QrXYHLdej8dTQXkjo46JjUPAy7h+XhWd85XMG2fe/MimziRyLDdT8g06Df9tigydSF8U2HB0vSbIiVU7D9GAAxwWqlF8ZPheIPpn72o7ekehyupALva6YuickDsx387gx4cwW2m0o98nagkcwCvfwaXU5xwzFWPKRTjU8mSBuv9Q3nSdgTihyaHOruyiiZESYCs90NXxTGQkT43W2/tmZcHC5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oUsZ58FU/SCjvA/K9V7OqPo9VmVZhHNaznwZm/R5kU=;
 b=Zk4II+LW3B9IBxfyuxAKankq8w9vSFNUinxEylofXbmV7AzSKOZ3EGGPxLZ4ei7CISLjlbv/Fi/Qy33+UPS3SlWIDv8N2K+c06GNjVopznHaH//HWleqztO2W6GfoS4F5pAILk408Sbw/2bpQug1SZS+BGHEx5xild9N2qExb4NN+qJvC2OKdCp1H5fZVEEC5D1U87BxLxjN7ALtq8m2UWApYBzuuLPl5c1CTpAzn+9pN6d6MXnxIAnIu69stnoTZtyGfB9YK7LDr1UOoqZNR5TU7wBgsdWKmln+MTO9KqQUxvzKIubqyokM8cxx8CWnatDDQjpFx5T9BHRd0aAxyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Thu, 8 Aug
 2024 10:01:03 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 10:01:03 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 4/7] rust: Oe-selftest changes for rust v1.77
Date: Thu,  8 Aug 2024 03:00:36 -0700
Message-ID: <20240808100039.2455895-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
References: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e29ab1b-5ac3-4a38-22c9-08dcb7910326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t28rtjjW1TdN2ENmPjQG4cpwFWp8E35Dd14wEkt4tkOunFQroI49df3hMy6A?=
 =?us-ascii?Q?keNGJYBsuvvv21o0LEJRGhCXrs1KsHnL3tmj3J2d014c9uMj8Z05A82yx4Rl?=
 =?us-ascii?Q?Gg40ZvLvF5u8FhXiKNSsqCF1BNe0upCO07yW05FYbBEXYi4asy5etoQ5Wd7M?=
 =?us-ascii?Q?YnQKOUnQsbxN0DstSC5qF8DXGAlUpbuNoRxsVgY1OhzjzVGaBnY0IJZmrXp9?=
 =?us-ascii?Q?5o+iljoajStubLra3M57kOLqyh5qRHZ8FeiqMfRCiZYOwWnELyEzHSZH0bRk?=
 =?us-ascii?Q?IBNFAFeiD+kEkkAtamIsUT0Zj8KyohyixJuthxD+B36qmSroWmBez3hynhTj?=
 =?us-ascii?Q?I/7rxrBNqAYF4J0HTIgWkti5iLKjJjm/P7sj3yv9Nzra4bNq5fM4uBNMURzj?=
 =?us-ascii?Q?O9nqFH879iqJGq2sZL4m4KCnT2oyoKv7OuNwjhIVCQ6R4n3COW1h5kitxJbD?=
 =?us-ascii?Q?HRd/6nOUHxTtEG2CJ9U0qCCd9ObTa6Ghf+y+OwRU5Fg/+CRNEyASa3+CndJ8?=
 =?us-ascii?Q?8ITaHnx6rDXzTDhu6I3PHBKWMeWXXRXPMKuIWRiNpSxO2ISUOG4kL6DAf4bE?=
 =?us-ascii?Q?mMXTfogWup5ha1HG6s9Xc6GjpL5IjhWLQY0UHGqs1TkMYA7RKohHBnqJZVIN?=
 =?us-ascii?Q?WC3dLyH07Vy7mp5F325A/O4VOZdCLlLnHMQ1LUxe78bgThQVFFr/IbDKo+H6?=
 =?us-ascii?Q?DeJT3gg+pAIUiW84V11m4l/R8cN+JaHt4IXcvpFOCZzZhQgLipLBwEZAWjYd?=
 =?us-ascii?Q?lh9Vj13Q8685hUnpva0p5URAjb7iiodAQcnFjKiZdp3sMZ5V0S+zVj+ZFOuC?=
 =?us-ascii?Q?/lI6IiezTlplINhbvqPxgRnrZ+ntfXCjmhOR6tqfPLfgliRqGi6gdIhkaMMF?=
 =?us-ascii?Q?xSM8p+OODWDQ7EAQWQ4Nd7A8nOm6KvR5lVqiXGopi6/tEjvp6aT0RZ3ZYZTq?=
 =?us-ascii?Q?W4Ncu1UpuZbGMwQJQuX2axQqFbAEiWoENU4YONRGIoloxLKq+QZ9/Q5TmJ4K?=
 =?us-ascii?Q?rAehJKrqpBC/DoOhE6pp/twTp5Lpfb1pzqHcrSEwmuW4L8maFWjhU23bw1S8?=
 =?us-ascii?Q?xst59AW0dOdYIMByanBnslRZ3nCIw/LMAhfUpvi2lBkgyVBkaJPBiMghEcXq?=
 =?us-ascii?Q?2CtzXa9m5S2k0zFvd4CeN6a3o6mAMEcmITpgio8dK0evW3mVGjuFBTWvDZ0g?=
 =?us-ascii?Q?S75EnENsA+gR8BMhehV7QuTCBP299e5SxO5nQrZnKGdnUE6vW98Il9wVRSiQ?=
 =?us-ascii?Q?b759p7ip+R/EI1v7wg0QaBJQDqG3lN5tRiP3pZwxOVUvLsr80fgVuzOKbKMp?=
 =?us-ascii?Q?bWh3yR+iQmZ8TNI09LXRirLn0MCanORRQakM0hM7PYXPdA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wHImn9BCoaCCaLowMspk7TSegNuUHx+NiZH1GPvS5h+sYyjHGTAuKOU960xV?=
 =?us-ascii?Q?e8CunUS1vEK86p2XE5bedSn+pwwEiE48mxD12Wn2R2bDbLC3Dx2EFBhmFC9+?=
 =?us-ascii?Q?ts0ADsOlo08EbaJ98fzvM9YIi5dAq4Ya84D4KsnD7deBKswj1FFcIGtlrG9K?=
 =?us-ascii?Q?q5meO/H5kd4SClk3iGUixHJofVXCI476EQfjaMZCBBuDdJdycy7ItrcdAne5?=
 =?us-ascii?Q?/8/zLjuEf+aWN3N/GfCkxGjyMglScYnTyyclVUpGsWvtxZndkVYYaWjbNd2p?=
 =?us-ascii?Q?UJppbd+K+ENpmeW8hRVoZA5n7BVbkPjLKKfNeLtOzoL8FnU3rgRAP9xh1R7d?=
 =?us-ascii?Q?dw3mgBMrGxH9lJW04qv7j6P9zqiOuEh2aIZEEmJJCKjoHMZLYfjLIuVriGT4?=
 =?us-ascii?Q?jmYAHdRdI7b9MZqpc3j1xRWfAFZZoyiga6JgifYLJbeTlL8j1oaurZVgz/ZO?=
 =?us-ascii?Q?4X8i2ap/kP7/lzTnC+Ip4kI+Yx4DoYDC75/Tj4W1Bh9HMkTkp4BoS7Rk3Z9X?=
 =?us-ascii?Q?BZKfPGbk30IEVlTWnhAUrYRLKutv9V5FvNbSHAaGG+2SeVUQpE2EndXaw5UB?=
 =?us-ascii?Q?LbM8oKZ7c4T3TweZIcfldw0Wnm6yISIYDBszh6LfYzi/6KiVlFUrj5864GE3?=
 =?us-ascii?Q?kOxk0dYw7NtIfi2sYXQKMmKmOonxK3V1OyUh1ybTopACCOyFS22nGYRd0qnh?=
 =?us-ascii?Q?nfn716qwUxCgiK8i4R0aD2F7QCUeipTO6mtNmO24DdbE2h9YZz1t3a9mYK3K?=
 =?us-ascii?Q?CAbIi20s8/dmAnh6MTOzhaWd8t7FcW4LORS2Th9J6V4B8d1H/ugMdqifkgRE?=
 =?us-ascii?Q?B4okBJMyg9FVZsS4E+QFsE++orD4suVcyMPrqlIY+Vgj5hBo1NKhFAp4KmeG?=
 =?us-ascii?Q?KXuk774qksqvesjx/AfFWyJJ6H5CqYo8JuHkIquRxW4k9G0EPOqNcRCk8mcB?=
 =?us-ascii?Q?PzCJMUH7A00HkRDhYmUXvkENjlQLMhX9RENs/wd0XSvYHnIbchXBft0dYobd?=
 =?us-ascii?Q?BAUnVi3Y3b+5iuxgopSqz2rL0Yab+1hvSXpTPBYODDHkIlf61LcLBNbis4Bl?=
 =?us-ascii?Q?dSkJb9XUanqlGZD2zs6IsqpvX/Hd9tihAkA1sJn4hj33XQxkd7qhjWgLbJRM?=
 =?us-ascii?Q?zblKq2LU8vJPeIfdrpDlnWQ4UxgxEwg6shjQ8JmaOWIbTpcG0fE7CwfvggX6?=
 =?us-ascii?Q?AFy1s2IdSixHiaRf19vGZsBUOAKXxGLu9ponDo9aYwK1VekxUFh48djuZhau?=
 =?us-ascii?Q?Jx9Y0LW+eCK05KWdjgJkK6RDcNVyjxTt5rIE9LWsIslpadMnhXmwvFhhBFxO?=
 =?us-ascii?Q?WjUp8fnf83zrirAfujmNnD+7sEthC7ly34kBFXO++TuwNZ/cw72DSVC0mZDT?=
 =?us-ascii?Q?liLpIgZnVrAmZUMgQczw5VUkyCfaByRfMaUcZ0Kr+zPyRTw9H/Hv5wHT6JoG?=
 =?us-ascii?Q?i15D4YGopmD/QBxkolThRY6rH4HDJddOrny9GPrtMGDJ5MOJ+3VyTi0IAMns?=
 =?us-ascii?Q?UYOY0Vw9qavFKPG5Dg59s5sThXZh7FH+o/h/cLfD4EqXgQ3ERWi4ogph92ZN?=
 =?us-ascii?Q?DOqrcILCj0r5R1CQ/MWQF2C/YzWZOu+4VwvGVVHw5qxz29oe35IPwEJzB7sH?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e29ab1b-5ac3-4a38-22c9-08dcb7910326
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 10:01:03.1460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiyZXWRFYXmcH0/kBzFlMIA0kDirpMxCEXYSdu+Doh9/JvNrJHIGsc5X85qJdv+fLOx2rTY6EguMd/bLiAdpX/4VvOLzoRvH65Vw5cV2pxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
X-Proofpoint-ORIG-GUID: IcZURjQBQnOgyvkEMFUQMi14OImDPJh0
X-Proofpoint-GUID: IcZURjQBQnOgyvkEMFUQMi14OImDPJh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_10,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 10:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203124

From: Yash Shinde <Yash.Shinde@windriver.com>

    Update the file paths for v1.77 and fix the dead code error as follows:

    Compiling coverage-dump v0.1.0 (/home/poky/build-st/tmp/work/core2-64-poky-linux/rust/1.77.0/rustc-1.77.0-src/src/tools/coverage-dump)
    error: field `0` is never read
       --> src/tools/coverage-dump/src/covfun.rs:222:15
        |
    222 |     Expansion(u32),
        |     --------- ^^^
        |     |
        |     field in this variant
        |
        = note: `-D dead-code` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(dead_code)]`
    help: consider changing the field to be of unit type to suppress this warning while preserving the field numbering, or remove the field
        |
    222 |     Expansion(()),
        |               ~~

    error: could not compile `coverage-dump` (bin "coverage-dump") due to 1 previous error

    Only the required change is backported here to run the build without any errors.
    Other changes are merged with the commit in v1.78.

    Reference: https://github.com/rust-lang/rust/commit/9a5034a20ed8b055dc615271f9d9cf27f9e494f0#diff-d4ecc6273352a2a8ebd02c45233d9bff7c6694f20b67ddad0614af7a89c06748

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/rust-oe-selftest.patch         | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 0280b1ef8c..dbdf39f9d3 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -279,10 +279,10 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_get_mut_poison() {
      let m = Arc::new(RwLock::new(NonCopy(10)));
      let m2 = m.clone();
-diff --git a/library/std/src/sys/unix/process/process_unix/tests.rs b/library/std/src/sys/unix/process/process_unix/tests.rs
+diff --git a/library/std/src/sys/pal/unix/process/process_unix/tests.rs b/library/std/src/sys/pal/unix/process/process_unix/tests.rs
 index 0a6c6ec19fc..bec257bc630 100644
---- a/library/std/src/sys/unix/process/process_unix/tests.rs
-+++ b/library/std/src/sys/unix/process/process_unix/tests.rs
+--- a/library/std/src/sys/pal/unix/process/process_unix/tests.rs
++++ b/library/std/src/sys/pal/unix/process/process_unix/tests.rs
 @@ -6,6 +6,7 @@
  // safety etc., are tested in tests/ui/process/process-panic-after-fork.rs
 
@@ -343,3 +343,26 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_try_panic_any_message_unit_struct() {
      struct Juju;
 
+diff --git a/library/alloc/src/slice/tests.rs b/library/alloc/src/slice/tests.rs
+--- a/library/alloc/src/slice/tests.rs
++++ b/library/alloc/src/slice/tests.rs
+@@ -186,6 +186,7 @@
+ std::thread_local!(static SILENCE_PANIC: Cell<bool> = Cell::new(false));
+
+ #[test]
++#[ignore]
+ #[cfg_attr(target_os = "emscripten", ignore)] // no threads
+ #[cfg_attr(not(panic = "unwind"), ignore = "test requires unwinding support")]
+ fn panic_safe() {
+diff --git a/src/tools/coverage-dump/src/covfun.rs b/src/tools/coverage-dump/src/covfun.rs
+--- a/src/tools/coverage-dump/src/covfun.rs
++++ b/src/tools/coverage-dump/src/covfun.rs
+@@ -219,7 +219,7 @@
+ enum MappingKind {
+     Code(CovTerm),
+     Gap(CovTerm),
+-    Expansion(u32),
++    Expansion(#[allow(dead_code)] u32),
+     Skip,
+     // Using raw identifiers here makes the dump output a little bit nicer
+     // (via the derived Debug), at the expense of making this tool's source
-- 
2.43.0


