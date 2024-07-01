Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62205C30659
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15466.1719826021536529939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=791206b30f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4617wFB7028412
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:00 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4619QxN7024387
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 09:27:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKaPUPVI1/Jp0uiGwYFO3NW6ytvTDv20mIbl+IiNim27dCaA54F+NeDuA2qr1KZhSdgxr/xhxnKZYlQjuHuw3fsNp3RtRhAAzo76XyiNC2DIjLl04TlomQR8KcrWgYWTyuKP/XuzAKu5GokD5A1bek2vmt8FE1AcaXUr6CtAXY+lG1Fcaosv+uZZ6Gjn+P5zIFpatuOO6FrPpyLdvRdZKwzE7g0RKorB44KH3/50qqFXKUayX7pi8YWym1Gnjyeky78E85ongJ2kYUmoBcaJRc9OrcYdpb6Ttb7ZOYWA2OsX2WDYECLU0SwJyspsAPaFXdUyv1tolQ/8E+thMQJqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9mIcrabw41VnHeCdSLuAwFT/gw61imR+N/LnUftU3k=;
 b=ImaBajG8FOE/dx+WX0S5J0DqMd3XV+7HTgCI5xaS5L71KjwKSxArCf34qzPKffb8UoNqTtxEmBMG507awMprV4ibDt24D+nTDW4JwrkoEmviLvTksVhmSqZRyHdHnvIf0PLUM4w1hKK5ptNuwkv3AIw2PFjYkOVy6XzAcctHvrPEEYTZwVAc3+TdQqmZFXho01FWYzJdirekCtYMr6RDkCdIsNPUT/S2YbBL4+edZvB7LlA0aXOyBWueN6Y0jcx1FFjs+wPct3H+9uG8wy2DQW7JSXStwW6hQzoYzI7VqmgLiQE8oT9Fs2cr2ZPwLMRvgCR4roqm+WoykzRx/eWMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 09:26:56 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 09:26:56 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        alex.kanavin@gmail.com, alexandre.belloni@bootlin.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 4/9] rust: Oe-selftest changes for rust v1.77
Date: Mon,  1 Jul 2024 02:26:31 -0700
Message-ID: <20240701092639.1498856-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
References: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a9f89b-3a41-439b-4864-08dc99aff1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f6f2kOFhoQ2cb1NdmKdjfVengN5s31XdJtTZpaKD11jmI4bkBrkjBT4yy+df?=
 =?us-ascii?Q?U+msPydyxJxdyuwoXwQRCeTroYpBTj1uB/54dsdMi9LRzKNszaq7kfHwjdFm?=
 =?us-ascii?Q?BZ0wCv3EOtwbMJRDNz7z+h0hsNxzTyyCt9527PGYafZ3PrBCRdv7aeJ2W/4z?=
 =?us-ascii?Q?SUMtB7Jhec3+nSAV2xIB3jX5gYha7qJBRPSQuPWh22+VNre/OBi6RBDmkcfw?=
 =?us-ascii?Q?raxRKCPYtarXUz7buBT+78MqEuUOtUwKsstOBhWgPyuGuw7HZqPz5SeqK0ia?=
 =?us-ascii?Q?pGZSc/ELlVnN0LeRle0Fvesje85AN/6dpk9pzzafPpDkUIRPhJgiVZsLEw0p?=
 =?us-ascii?Q?LN0atb1/sMiI99TB5D+7rjWYAM4pa11DwaHNZf9pY+LS7fjDYOW6EfSxUFjS?=
 =?us-ascii?Q?2rGmAAOXEASGGSLLYgjTc4rpts0wCGgjqtwChdVNrcpXioV42rz95EWPnfsk?=
 =?us-ascii?Q?zfQL/xICfquL54j+XU5bAKjfWk/KVnWQPhlhsZFKcuhV56dlgJmWYp7kcyGE?=
 =?us-ascii?Q?Tccw2HK+vCYibkYzSFhHLs9tCgFbQepUTryV0y+jp+ZzPLm2XyT7fMchfrdD?=
 =?us-ascii?Q?ziy10tBbgjb/X8BSX5No1cUcMAe74/tYgP/3VL06e1fpWiOJkUvoiL7aoIx8?=
 =?us-ascii?Q?T6RsCzOi2/BFbvl+jgEeaQaMaOgVY+s4FMxZ6BSU3LCWt28TAAx2dNWgzscF?=
 =?us-ascii?Q?mGvEADlYMCgCruRDdRAj+GITdJ0kvFUWBmkSQ68vT7n9GoaK3VKaSE6Mv+c5?=
 =?us-ascii?Q?/zWJbbVNlijaFoazJXfY8kYfVEhe/0EIQvgVhb1hPA/MsHh0YnfaWpg1C5LL?=
 =?us-ascii?Q?7EmAWeuOR7HGay4vs6nFkE/yqmtBgVNGzIltWNUzTWnARU0kryoCa4cXT2Cy?=
 =?us-ascii?Q?tgxTnk3jDViPQhiHSf8xEsw/xnLO16tE1xiwCYn/x9Tj/KxFKo31vIpT7jiM?=
 =?us-ascii?Q?8R2s+p3wWVFoRkO8vYFP23k792r0I2Gncgam+UcL2eKKG+4o4x13eVSwh1Q0?=
 =?us-ascii?Q?g0ysX07wSssovLdIucrvQ0R5sS46ZzG3jSvSMYiU5GNAt3mjH3z5ux08Miom?=
 =?us-ascii?Q?Ncf6PBVeGhu95p24Hp/E7wApHI2/RS+UmAsgksKF6pr2cyTpqnZoNZNxRdvY?=
 =?us-ascii?Q?jtL4OwlzQIjLrxgdXAeExhuhQsNyhtBvCnK+ah2lAcnkgc0anzKCw9P4lMQF?=
 =?us-ascii?Q?sECHKmCJy1+o01n/NoBalYnd2oNXCs3EdL7XbO/HG2et5dU7QLtdhx2jwJWQ?=
 =?us-ascii?Q?F8lhFSu9K7eOLag8L7ye0mBU1FuZvrCskdF0j+9sKrYf8UUt8tGNXxvxjhbb?=
 =?us-ascii?Q?FHWW8b4NjZvab3TxcA2yrcmLR5RxQhrNFWiO3SwQS6fEyw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BWPexZ4o1dJ22PmWvLJDK0eNeQvozqPhs0jZemqnoFUc2RFIk+wjmF+KsvTb?=
 =?us-ascii?Q?nJgS9zlWhv2NYyqU5vSiYJQGVT5OANnWxa+l9WF4XvFvVoOQKnCJENrwJgmG?=
 =?us-ascii?Q?0k50C5+BCMZqZlHgLfrEeh3QNmRJXuok3kq4Glyczsl2SBjiVXDETsR5hWR3?=
 =?us-ascii?Q?Hpx5IAIcSwtFnWbA6OyGnSwKNvsG/lM60Kj2BtQmYKryBlmqvgZYmLgYM9I/?=
 =?us-ascii?Q?Wyw23IapBvF5dWTSY9Epb2q9V0CynbWRbv1U5lRhI0GNT+71My1pZULMqOGZ?=
 =?us-ascii?Q?woAc917Usvatp0wPr7jL6DHfO6WdUXMVxk+Y2bNJ09MguyBViu9LuXoszVJx?=
 =?us-ascii?Q?NmOCTkW03c3GU4xM+l8tTqjBYvFWY9EwrNZ5dDa88vM/fs3e6bb67Y49EAF1?=
 =?us-ascii?Q?4YfTKaIWWN7gDY9wTsa9gWyAGT9soOBwzP4USdtaZOG1HwQE1Nwf5wZbyHrE?=
 =?us-ascii?Q?bQkp1e/akG7ZOwqYlb4mQlqdK6Q9RZIvz5e4kCr9I3Q8rXPC7miSC39SDMUA?=
 =?us-ascii?Q?Wz2uXcNn4PT6pfCvV8HDLWUl8WyCjK2aIhmDTqpf3MYHcmcU3ONpFG6zXsny?=
 =?us-ascii?Q?EF08cNccH7LqZpbQIRQNowsgAhg8oj4Xnq4w4xBRsXGLyOUSpuy6HUIe75fU?=
 =?us-ascii?Q?KmClatwp7zBS26nZBxj9AHHk6I+wOx3YuriucTOgynbRKVcRkXsm643Nw0Ld?=
 =?us-ascii?Q?BfVdPHe6EX6jTzsOgq47dPFw1np1NYeWoAid8kbQCAKEpEqGTat7vY4EiUkz?=
 =?us-ascii?Q?Idx1N2QOT9jM3XlEpQzHa6cOy5ZYsgFdKDHVieOQ7nYnxbOdHTXzM+hOke/3?=
 =?us-ascii?Q?EQ42c16TcoQux9BrMr089NSpvpn+JXDD7mzvKHSVznzu/gdAKpFyk1fqUqzw?=
 =?us-ascii?Q?ko6qPfCl9b4pxePjWamNOQ+DBmo5aQ0o5OtpjRcF9jEb+8geHqkrDE9fHki1?=
 =?us-ascii?Q?HxheQKrWVJPCRPKS17ZaYyA/rGw8I5ODPuzxIZEbodHFj1IYqTBoORj8SL4u?=
 =?us-ascii?Q?MPn+hOsgXzJmtAbOHOylf8X+rEpNEOV0bqM3mIiZchS9l5Z0tPFyoIV45xuJ?=
 =?us-ascii?Q?KhpsqvMRP3sm52USUF8VcLeYbEl2HLFWw1rqt+X1b5NxO1aJu8rayTwWkMri?=
 =?us-ascii?Q?T7k2snn8hSHroImvH8uDvL9UFvXkoA0JC5fgkkfwgrZzuEih6vkn72JsrrXd?=
 =?us-ascii?Q?qtv42Ma8OjDd2IboLQq+xpiUenEiM0+txi8dFzrwYOIZAc8EZdU/EUA2oU0T?=
 =?us-ascii?Q?IChzonsmfXB9wp9MEhuXVOmV0xvDSHTPBclY0uhOwQj6zuilif+oxGVVW7M/?=
 =?us-ascii?Q?+vLVWcTjFYEU/rBYPwQ32FMtmrpPUQgtUsMtw99b/5t/XF+9n3Lc6bbOHwuw?=
 =?us-ascii?Q?80kk9/HvJ3x8yaOaP5/rR9nuqD0PMm2u43j6DzV20ZRiW1hERVKYfkKAgCVS?=
 =?us-ascii?Q?UVNVi+MKs0OYRoX8BWI1jTeOVI3S7kA9vGNF1ZLG+QhNVJnOBYBN5k1NynY1?=
 =?us-ascii?Q?pdDWKsRhQs/7wEVtUg8KHgrhZGSDlthCDmf/zRETaFvBEwJdqw6M6MK3+5lZ?=
 =?us-ascii?Q?3BfEtEconGrD0ukAaoTBa3kQ/uUiiKHlG1f1V8YKExVzqemivUNvXqVQta0o?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a9f89b-3a41-439b-4864-08dc99aff1b2
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 09:26:53.3869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ku9WwvEY2lnM/rZVkzAka0VSAmnEiktgcQ2jPvnBj3tw+sgxlUe3oEIFJhhVDKbCSi/jFZCwDc74PW8ML2MFVGq2iTbHZTiua5lt12GVDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-Proofpoint-GUID: jTxMG8ho4Bn1tjAA26ODhYsg4iXWA_cC
X-Proofpoint-ORIG-GUID: x8aw-RWTaUixxHwXjb_MojC1L4zuFZld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=836 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201288

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
 .../rust/files/rust-oe-selftest.patch          | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 0280b1ef8c..14643c6484 100644
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
 
@@ -343,3 +343,15 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_try_panic_any_message_unit_struct() {
      struct Juju;
 
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


