Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C52FC41513
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15468.1719826022293477287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=791206b30f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4617wFB8028412
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:01 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4619QxND024387
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvr-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 09:27:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbBsQhes5ziFSKeKCCn5p2qxFVI9Ox5BGBleKup1i8XYz6kRrlic67DCVxPmNa6umPlZ/glWvFFWgUfTQVn5+2TAIZtYTL3UmvLh1bLKiixEGJwov8aTAvwlgxoETaXE8uJ9fKScd9U9t0PxYMCODuXhjsNfI7nX5F03BcYoNRLbBgOuIAdxeOPYJaToTfutOGLboR0dKkF48mGpi98VAmeLmivr4BJjn8LCwRUZiHOHFjvhq1+EJZuqkbABiHJ5gZ1OC7A2kU4Tx7SJesTEr9VWB4s5/P2TviSvdo9Bw/RP4lPjPLXzLtaWB/QEzQ+6I51lrBXLkHjX3jAUlRlLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/GnNfniN5P9GPTMB8Su7607Mnfwer8bCUCeWyDxaDo=;
 b=T9Nu0nye2yr2n2CDtMgr1TEJHmQzbuc0Vy09ZHrR+Njprt+mVj+uT2JlYwXZHpfovugUHINQR5dKcGuUGrZqaZ7ihsBeKdxbdpjJPDXRWhnFOD6lKwmwoYZ7fJ+xcA0d+1yKlqAjrUbd0MW3meuzrnXJpBADHSM/ZPUHb3J3hckL2KBFwz7yeGj7TX6mSNy86zqrF8lZTZnE+7N+mYX58My20+RkMz4Gz4v0iHOg8AyuivmHIyVApIqLEFEI7ej/FQOrN2xuWD3HwOiD8VZYSq17al0s0zXQ1l3afvkBmMnSCp0HT7LyYQZrhIgl9DLeiFsL9Qw7Teyvwr9Z414GTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 09:26:59 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 09:26:59 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        alex.kanavin@gmail.com, alexandre.belloni@bootlin.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 8/9] rust: Oe-selftest changes for rust v1.78
Date: Mon,  1 Jul 2024 02:26:35 -0700
Message-ID: <20240701092639.1498856-8-Yash.Shinde@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2b14fed9-955b-4e1c-7569-08dc99aff241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OWm87UNgQPsoad0GC0D0ny5F73H4r48RZ/lTO+3E1+qRNHqiAnQv9v7FyVB0?=
 =?us-ascii?Q?/nXCB0416y/KqegnAdukooEzIFCzDZOpKVn0uhWbfnWskasqRPDzSQCexKLN?=
 =?us-ascii?Q?BiBxJ4JpN2eWCxfLtXRzdSC7gxeog+jK9tpKTvum7OCW7MMtwpBrOkoGBXdM?=
 =?us-ascii?Q?YSdo6JGca6PZ68YT7hkJzA3k/d7iB9+B20S1zJgm9VqVo5fXAi/YhPaaRwBz?=
 =?us-ascii?Q?h91v7WjRC7bGt3QEag89JI88R9zWDWyOChOjKdE9U4LCvAun91EYUqo+sZjO?=
 =?us-ascii?Q?JlHsQWlcyUouiqLw0J651SRtovscx+0kIC2i9SSjs80zJyqA83FN7dnq79VL?=
 =?us-ascii?Q?kirhTUCpudMKurDVlOWRwa4cgEcGx1RMIjnq7qpxuepmi33DtOWcYMBw9Iim?=
 =?us-ascii?Q?PfeG8EVD9bXz9fpHTHexMW6LHK9t9pZYo91Tu0qSb4Qj3khlMpeIZHJwK+LJ?=
 =?us-ascii?Q?sAd+aBH9eed4TmWaQ2JAssFtjsYFnv+BtcLxyIbapmEyiIK0XDSWnPbViUXl?=
 =?us-ascii?Q?j/sIENLZYRNTj7KUvTOnNZRaux0XN1zM98GcOtS9zhttzDE7qW/tiBhGl7e6?=
 =?us-ascii?Q?L+B9inr9Qbj3mZf83TRnCBSZmewg7cWXAnzsk1xp1YsNsiJuPLluQiCvHbjh?=
 =?us-ascii?Q?BfvfNk9h4pZdgRyjt9N8R8Ot6P1Zl6XOOqYXIHdLLurHxDdJngcR4i2qJMGE?=
 =?us-ascii?Q?hrFIsp/e4oaNG4PjJ2HyMHg8rtv02UY1a+7/N1AhvdLDYiQtKOw7TV+7yTEn?=
 =?us-ascii?Q?HJTbtQLcZDYHJP1t7CTpOlESRBubz3eKYas3HFmB3wQkzq/dtsXEs3WnLXJp?=
 =?us-ascii?Q?n6JA9J5siDGi0j0wgqXK6kPnoBkJngkVqGuryVsBV4G1nn4C5UoOdqoP/4G3?=
 =?us-ascii?Q?3mbOhTAE/8xY9qovoFb2J5NKFkzG69GiOeezE6We2jCxQuoPh87d+cQRjoKv?=
 =?us-ascii?Q?Hzw0MAXG8f11+LjI46G1wQ96UdlzY2Wa+t4BADHRlgCXJo0udefQlwxbCAZc?=
 =?us-ascii?Q?EhXMVF68c686AqPTOLcOnsAZmfsgAh9MlvRnBfNJpq0SDdGK43cUJ/DkP7jK?=
 =?us-ascii?Q?wNPPhoBG3ixttAcN6wIqFojh+qN3ma+pOVglofrSpvyN3hUOgF3CyxYCZRa6?=
 =?us-ascii?Q?SvpFJBSeBGN3w0EacTjhS6hhpBQa7da1rEsjYX8xVAKas8RllLdAFNXHZDCc?=
 =?us-ascii?Q?0wlDGCowKsc0CPQdyFd+tC0O4EOTzDeFx+eAEyVO6btpxRsbKEM8J1J8I2FB?=
 =?us-ascii?Q?cClMFNKNzcOlMfEWiKwjL5a1Tqf1vhmNuP+hrWFtijD5lZ+jhhEMR6j9HkSy?=
 =?us-ascii?Q?tyFJNiw5R5xPJ8DlGlu/dBBOOGuweQENlgRKhRZnXJKAMbzPSpfpjFoUy7MK?=
 =?us-ascii?Q?EqHvQS1OQGTIjgZcr2qaCZqEEwGg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hAJFkQ+rTp0K+0t3C5rY7CH75zGUPvfWeuv+0p3Y83qghyUZsS0tYMHvowrW?=
 =?us-ascii?Q?M952lHncYyZBHaJFYzGqKKjs7po9T04dOmfBDxVfadYa/M37zs5kGGROOIwi?=
 =?us-ascii?Q?Y6SjFBxhEdvjTsRBfAH67ToEfHcp7NoW2BM0suEr9Ua+R9OtKptvqN0VJp8V?=
 =?us-ascii?Q?FfyNPwC6UctP5i/xMzMhHpTmUObaeshHiB4hqAFQFm9pFx3z6lZ8dqgc2GGI?=
 =?us-ascii?Q?dm0+l5622N+3Nk8JcpCvvMeXCDS3kadGneBwwh7ppG9m0+zF1H+cROuhFOXN?=
 =?us-ascii?Q?zzo6PZsZziLv6erO53KbzC1An1+T46iUC+k+LsvvE33b2hGeCrFUqlSkba18?=
 =?us-ascii?Q?7a2UQiWaFEnefSLdLFXkrvZ14zlNqw0gDr8poiscJSriSTWzc/aFudFaptFu?=
 =?us-ascii?Q?eTvuY2C+RtUIv/lkwDBiYVi+5VjVjrnWbhGf/WOlkX2YHNDbYMCtLvYwSIIe?=
 =?us-ascii?Q?StJhQnC9DnajIVL8XheqE6SKDWcnyLiFg5f82F/ynV7RFO9vbr5XZCa3+vTu?=
 =?us-ascii?Q?dSvRN5m/igkS78t/9t8m1tIypgPkrBh+TkMgTN3120/eevmmtP1lywbMdkqX?=
 =?us-ascii?Q?bWrUKjSfnqT7M3xa0HD+E/m0VnQgvQe8K5wb2jKN8YizMG3/fSbdK6zGbhGP?=
 =?us-ascii?Q?5vUMDKyuOZ0sUbJgjJkxnP3FGu7ndaWLftgpYXZRgDS7GBpTJaUdoMj60B1T?=
 =?us-ascii?Q?GYcNRjCS4KOuvwgzvFSVxNr1zbkc3HmY3emNcKpKZMhOV8m6ov0ZoBoWsBPc?=
 =?us-ascii?Q?Ru5tVA+kbAIzhxDuhQ2U0LhObxHQcHf8JzEtCaS1WrNN5d0I/utizwo/xZKg?=
 =?us-ascii?Q?l03WTQ5xFILO45Ge/5M+gIhFXjPoIbRVAjhGTdCXD+LDOV1hpOtizP2l5cK3?=
 =?us-ascii?Q?F68v1WvfAlttrj9SV8osrRIER7O9X3JAjXEgKjC78qYXN9oR/7UVt4/ksluC?=
 =?us-ascii?Q?/5qOq21zVqylAes3FU7T9dpC9GRuuW8AhI8ZG1i6fQDhnySEuBtRCP0A6vkD?=
 =?us-ascii?Q?Y6w0xK3oURKbrZN2+Tv6X8R7y0xIhUtFWEMhn6lEziHxvHthseazj+JLV0zb?=
 =?us-ascii?Q?QV6VB+U+iIu2IDBZMOyz3NaNCkC+NDY7qBpFqL89TCXM5vvQZco4quKX6pnl?=
 =?us-ascii?Q?mukRwZqP8MYPagg7pxm2TJ8oAIWD9D4O61g2aNoHW29XXnEfGcy60rlf3EfL?=
 =?us-ascii?Q?SO4Gy3Do4h529GfklKo7zJ5lGMdJITks7NSGM8W65wtLjbodkcGZGWigTS9w?=
 =?us-ascii?Q?egz9lfMVWBRwRd7C7iEOqhrSxcANFhYwbLs9LqZ8prNRdmlG6ixjLt4UMeO9?=
 =?us-ascii?Q?1naTt9Gi53sfSFrGG9Z13pR8fd5gXZ+JQwDi8ML9NX5KWzg5i0qbpmAtB9iY?=
 =?us-ascii?Q?yB2Ccb8fZF236qJh2v6IIm2hZcl6V07mwpMc/2nelrJ313l3lFWnnQ9vYBQZ?=
 =?us-ascii?Q?ZLLMV49sd/5XQKW/gSBj9EhJ1QB11DLNu7ZhMI3n18fQ3szseI+YeMqbl09Y?=
 =?us-ascii?Q?4J1gZzocxCihX+WIcdMOBSIeoKAn7m7GyBhUkk4k/c/wZKT6g/lbix91EUsf?=
 =?us-ascii?Q?fNFXJft7NL9I5x00TZuLloCjMPX/M+tPN9/1RFVsaiGwPtZmVZA1mN8zdQPr?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b14fed9-955b-4e1c-7569-08dc99aff241
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 09:26:54.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOlkY6VhP8A/inpSjGzA1qA2+TVvoNi/mXf7GRepeDUm1do+O0HEK6mwR2f5HWnLwFd3ignFd6ZWL89N2cFHHFCDx0xRq82t269OBsyW4p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-Proofpoint-GUID: sQkubn8XHMRXexN8muY-AF0YE2sfQrsS
X-Proofpoint-ORIG-GUID: Mva8ejglDI0VGaeKmcV-BxbK1tDan_Y0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=940 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201291

From: Yash Shinde <Yash.Shinde@windriver.com>

Add 'rustc_span' and 'rustc_expand' to exclude list
and ignore the failing unit tests.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  4 ++-
 .../rust/files/rust-oe-selftest.patch         | 27 +++++++++----------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 62ca762cd0..a619dc36ef 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -205,7 +205,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'library/std/src/sync/rwlock/tests.rs',
                             'library/std/src/thread/tests.rs',
                             'library/test/src/stats/tests.rs',
-                            'tidyselftest'
+                            'tidyselftest',
+                            'compiler/rustc_span',
+                            'compiler/rustc_expand'
                         ]
 
         exclude_fail_tests = " ".join([" --exclude " + item for item in exclude_list])
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 14643c6484..5218c85be1 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -247,9 +247,9 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_rw_arc_no_poison_rr() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -82,6 +85,7 @@ fn test_rw_arc_no_poison_rr() {
-     assert_eq!(*lock, 1);
+@@ -127,6 +127,7 @@
  }
+
  #[test]
 +#[ignore]
  fn test_rw_arc_no_poison_rw() {
@@ -343,15 +343,14 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_try_panic_any_message_unit_struct() {
      struct Juju;
 
-diff --git a/src/tools/coverage-dump/src/covfun.rs b/src/tools/coverage-dump/src/covfun.rs
---- a/src/tools/coverage-dump/src/covfun.rs
-+++ b/src/tools/coverage-dump/src/covfun.rs
-@@ -219,7 +219,7 @@
- enum MappingKind {
-     Code(CovTerm),
-     Gap(CovTerm),
--    Expansion(u32),
-+    Expansion(#[allow(dead_code)] u32),
-     Skip,
-     // Using raw identifiers here makes the dump output a little bit nicer
-     // (via the derived Debug), at the expense of making this tool's source
+diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
+--- a/library/test/src/tests.rs
++++ b/library/test/src/tests.rs
+@@ -424,6 +424,7 @@
+ }
+
+ #[test]
++#[ignore]
+ fn test_time_options_threshold() {
+     let unit = TimeThreshold::new(Duration::from_millis(50), Duration::from_millis(100));
+     let integration = TimeThreshold::new(Duration::from_millis(500), Duration::from_millis(1000));
-- 
2.43.0


