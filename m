Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF22C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 06:53:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2868.1744872809494686683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 23:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=62029e0c8d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H69seN001361
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 23:53:29 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3nsdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 23:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ya3wwI6RwQMZyxe05wgnSXYHKGikryqtMpn9C9jyXba1E4Z6ITmy2uL75vnwPIMbWNUwi1C1Br3PISXe9DdxuSkm/LiDfibOoFjL5OaorzeoXs5TwtVyDP8rWWHwKHgp+oILnZhy2gSQkY2ozSMtBPmKo5ZM/MQVVrcHULNOOE97AQLm23M+eStlmrVd7CSh6efLHsIpP0UEMAnDjap/pMUrOho+DYYcCnMb5GRDsdnpAsdFg+lkdiA0lSWaDx012S2EjEzKunqxNjkEZAY8VMpyt8ezRw9yyu9H8HE+fuFaKjAznjun3qOY1YFI1mZ2+AgMYFdq+Mxd5n/8fLvhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MMjXwlK8GnxvNLD2Rt3y/BetGXbrP4+iM7e0i8AGrM=;
 b=O9VIE1hhOhqw6B1wZSzIwvIZ1oPyNLXgyKg9vGh/BOJ2neU6Fb37o4XE2SK5FyGBQI7DHj+3H+ZQN7dJmhPIsvNdJQrjKHMqO+3xDxIJt2jke+v8EWgwCoFeh3yrrwkCVPrX/W2ci/SDyLUjTs+K7hbHYBzMjGDhG0zawKQfOkgzx6xae3bjkRpuBNB6YO9Bs5A0UE5ZQVtdozJ5P6OmVKFK2XgEpOFJuyffo2JSb9gSYjiX3mlD1DIQru1do2vibrnamJcxTzTPMFJ3rBozFnwaEi2CUXxrg2oQG4rKB1phke8Dkys2rrmFfRSlvzFQNXuFgQO6LI14DkUmHLFLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 06:53:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 06:53:23 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: re-enable the unit tests that are ignored
Date: Wed, 16 Apr 2025 23:53:01 -0700
Message-ID: <20250417065302.4126981-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d10d9a-7fba-49b1-f79b-08dd7d7c8c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Bj0ZocoWkEI20j4Inb/LiWw1zJmlb7ZRWdlMj+ohFlieKQIaUVrlFR574Unw?=
 =?us-ascii?Q?uN0t6o0RlXI6BBjtHtjAua6rfN0NH5HblmZKW7lI3E/K9if4atOgXVsvo1ZS?=
 =?us-ascii?Q?8LC1R9CDlsnLBp2tkLrERF9GWS9wigc+J+qFy9iAJfkbcTLG1/30gauv2YZR?=
 =?us-ascii?Q?VsF7Lz7ay4o8o+5MiD9+w8ggYHfWN0sIiNZoxq6SZOYQvRpv231PCGe1oqDX?=
 =?us-ascii?Q?vU1BZXJONROSatvQw59mMpHYiz98zpCmNUr1aUKMwTvGnv7WHhY6GnHM18Uf?=
 =?us-ascii?Q?mjFzvZbNLgTs/7Crq7zz1O2WCzxHcHEPX6vHZ8ouHny+lP2Ev23h3QG8hj8/?=
 =?us-ascii?Q?yK69NbdyX5EH3zoWBhPDMGIUpRCg0CapOTfMlyEIQn7Bf5F0SMwUyIAzQSCe?=
 =?us-ascii?Q?F0BI2ZoGQ42FD/Bz5oTHWj360NfnKyKq4NUnz9KlCh55bCb3qT2Rs2Q1eoyu?=
 =?us-ascii?Q?iiVqOlq1RXRP1GxMbAKSZbBNleBrdW+oUH6io6xKSJAQsVOZizGLTg5hrgNi?=
 =?us-ascii?Q?cBzlLT9gyGNrZxDYUVc82Xm1pXunsw30sTj8GIhDU97/9BMbtQHwGpSnUzm1?=
 =?us-ascii?Q?sew4Lj1Qx8e0B2FQHF/IPzhKdgk/V1ZampOYGIikinSkKppGmaeBHwnD7/Ew?=
 =?us-ascii?Q?5a0en5tgRQZ+kf9zocOQrq0cyjXISIm7K86a3zgye4d9HnRJMTscjGP533sJ?=
 =?us-ascii?Q?urNkK5l/gyqNbJhxfMMzl74s/ukp24QwBMUwy6Cx5fZbzPskn7UK5uwyrCRh?=
 =?us-ascii?Q?S5WOt8hW7RmqHaZ4bbMPwNcqrw5BnrCUUHm6BLFzd9S2xdki9xYJdnnhVpaV?=
 =?us-ascii?Q?2rLxjVOqAHS8inntl7PyP6U0YWGcUiIJVfjF3FSsfkcI8/S8Zl3toi7eJ2Sv?=
 =?us-ascii?Q?DI3Vr3Jr4bIrT/TF38sATMBoiZ57gZ+M6LxLkpQ44X/7ObwIGmuG/fv/CQGm?=
 =?us-ascii?Q?FhRdq1B1uyjyaU22tkmKiS0He10d+1uKAQExuKo8iR2Yr9hsqKEBDgQXUoFg?=
 =?us-ascii?Q?Kv92M/mN5IxWg0+yyCx9Xgz3cGfjaHY7kb+wpEKa8U6SoxCnBKxcFf+KCROb?=
 =?us-ascii?Q?ER2cYwrjPCSSSw0GeAlCNf7qIgd5DjrN7wvX83wN5GcLPc84ynSYnxJ0HG+C?=
 =?us-ascii?Q?7SO3MqLX+FzYySrB42WxdPwN0UL+ZDxsSZL9jIsOz7Tcziider2/MI8tk1HG?=
 =?us-ascii?Q?InoNRVuGcI+5GXB5tO/qIQZ559VtiEH0Yq52p/djR1Vo00rSqCXfnPwRc5pi?=
 =?us-ascii?Q?nMcyp1n3r1CrnuDD2beHVWyMobCu9qliMjsC+yAcxwiz8pFuyOHp7b6m9QMV?=
 =?us-ascii?Q?GLh00vdS+cQZKqFc6AMLBNghyR2BsZjPDevN5eb4bd5+YpkVS0rB6kFE0tiF?=
 =?us-ascii?Q?2iKr/JqjI1SwmBpgeWquRpL0eHTegLzf1hkJ9S6dSv5akYRR7an16SYfGsxw?=
 =?us-ascii?Q?fWY5WdksxofmIpX2l0X3RV6MWZuZcbqGBnnlJPrj2ay8ca6Kdih3hw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hqG+DiWv0ru/ALQXDkewGoQ+PnW8mXEnJJYgFhWjeNIo24+I0qYTdLNtBKB9?=
 =?us-ascii?Q?hijHaQPP3/D0B2G0t0RBkfbLpc/9r2ZbMxZffYJ97b5mAJQSPgiO/d91CC2S?=
 =?us-ascii?Q?g7wif623YcjIzARWIq0iE9TEBiDsX6mXHj5ddUnA3Jq4kIUur81ZgjpPPj7Q?=
 =?us-ascii?Q?RvkD+yiaKKRwntsV5xrUZC+EA/d0QwxTJtI8imwdG6iAs7QEFIwRc1tJsZKl?=
 =?us-ascii?Q?NoTtxILXpxOmaRXjrX5fail67PuF+ZLwNZrYztXY1Kt61itSEtV29axsoTC5?=
 =?us-ascii?Q?jY5aq5/TwVI/a+j9p+WJDeM86Ux5kru1z532WXlj+gGRj53wM1D0GlF5Q8ND?=
 =?us-ascii?Q?sEotPLqRphlf7rfDD7HKp/JxE7rdyc3GkVBiXvcNQerr6mba5fbPf0rASQsP?=
 =?us-ascii?Q?wlfd/hEu48LXtUkRUZ87tGneG1FPCQT0NqxS7rp9W+9UKep/dtSnYbW70Z7E?=
 =?us-ascii?Q?BUBKEAXSROh+gKg+nGHrWjhazv7Od7D65v9KaFwq3V0/KB6YZywMcDhFGxSQ?=
 =?us-ascii?Q?DvVNOd5TPAQTgIKXKeNpmvZGq31kWiXs6Ta0UsYg6UQ27rRwzjgVTQxhQnC1?=
 =?us-ascii?Q?zkDCnDWt83gGRN0Q8eugvu1iJMUfb+A7ohkw/hEdk02QV6y5W1uYvGAZa5ZH?=
 =?us-ascii?Q?D3SNoYtO5o7pE4Q2LpuANS/OSIJNKMysi9v0Z7nyBVJuEg7h+YXbW6qubJKp?=
 =?us-ascii?Q?nWbee81AIU9dVVkKwnzoqFLbpDDKFapeToFyQbHKw+t0skxfvb+/nO8mN/NI?=
 =?us-ascii?Q?1pfLaKooSaiinx8HRXh5sQ7lZTdnC0tNh9SuycZvHwrs+SzgxuiJUR78qZof?=
 =?us-ascii?Q?14KpIiwrdJn+shb2rsWTAgHKMtbEep3+XQvOVahFPOPyMFGwiY+wG18aEZ6i?=
 =?us-ascii?Q?eWVYegYmRNzMrqpWE5TNUMX+jt3LFBzuflfMs5oxTAt144xczGtmr7Ejr3T1?=
 =?us-ascii?Q?v6P5Wmz0Ly0DS6O5HaspnoNx323UcM62vCrwTz9eWuobKkydQ0ot4k0BQ250?=
 =?us-ascii?Q?6wSZWRi375otaM+g+2t+hous1bzoZd3dHn8+30B3hyfxbGf4Vop6pvy16OmL?=
 =?us-ascii?Q?e08v4yjaqUPn3O93p1/TRoCJIoCRWGaaBacGE+iiApOoWfdy1lueJm0Kze3o?=
 =?us-ascii?Q?vr+EYS5OBF0APMl73tNQXVdGuPQD86a/dcr7ZZgiKVwQaBnMcU/tci0qCxWR?=
 =?us-ascii?Q?OT3ScepLSpy6Xt07eZ0TBR0K7wDmcM9WC8qdR6b7n3VcHeHol+R3L63mdZkJ?=
 =?us-ascii?Q?vLNTW1GdicG6PKnHfYr5hDRXCjLOetMdxJCM71LjDBtrClZw5rFnud3DlWEG?=
 =?us-ascii?Q?jV4Do9BJTtFFjYVjalsNSDmIHBa390P3UNFTTj7ip2xMykvRsU1+vihnISNo?=
 =?us-ascii?Q?R+LSMvtwaGlbdRNUKGcBefvB5ZIesncvkqQben3hjRk0MbC27xrwHiQpU33E?=
 =?us-ascii?Q?Ilido4KdkfiRnkUX0+BVzyAqmDtB//iBUWckcoV/1VbX0JYiJOcnS4cvSuI7?=
 =?us-ascii?Q?J26g+/ZGzYzrBUlGtwe0yyojhcXCbxR0oi7Y+qH+s37/AUvsjVRK5xSS5KxD?=
 =?us-ascii?Q?1jkJVcq7VAUX0fq34X7hh3tGF3WZcGe1Wo03oI1xqY79n5ZaEvfBGpimH7iR?=
 =?us-ascii?Q?UqzV1oOD5iae1RUP+OypbsI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d10d9a-7fba-49b1-f79b-08dd7d7c8c14
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 06:53:23.7899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAuTtkaxlOPzmFVwEbMJsQbVZf7Aj5z7flXi+BzkRRHsRKODRm3cwbrylJLwFLYy/V05E1oiAIxnuAE9/zWxwULzl4DhxVDtsFnxYdDQW0AIpF0pzhIRZaD9S7cCzZ3a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
X-Proofpoint-ORIG-GUID: GLepeRzSTp7HOn74uIpYIEiVGAnRHn8U
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=6800a568 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=AZj-4l_lRVTIUhEvj0kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GLepeRzSTp7HOn74uIpYIEiVGAnRHn8U
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=878 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 06:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215040

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Some unit tests were previously marked as ignored due to failures in earlier
versions of Rust. With the upgrade to Rust 1.85.1, these tests are now passing
consistently. They've been re-enabled and verified to run successfully on the
latest version.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/files/rust-oe-selftest.patch         | 95 -------------------
 1 file changed, 95 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 2cca85019c..4a8760a6d4 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -43,77 +43,6 @@ diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/sr
  fn test_can_print_warnings() {
      sess_and_cfg(&["-Awarnings"], |sess, _cfg| {
          assert!(!sess.dcx().can_emit_warnings());
-diff --git a/library/test/src/stats/tests.rs b/library/test/src/stats/tests.rs
---- a/library/test/src/stats/tests.rs
-+++ b/library/test/src/stats/tests.rs
-@@ -40,6 +40,7 @@
- }
-
- #[test]
-+#[ignore]
- fn test_min_max_nan() {
-     let xs = &[1.0, 2.0, f64::NAN, 3.0, 4.0];
-     let summary = Summary::new(xs);
-diff --git a/library/std/src/io/buffered/tests.rs b/library/std/src/io/buffered/tests.rs
-index 35a5291a347..5f2858d2505 100644
---- a/library/std/src/io/buffered/tests.rs
-+++ b/library/std/src/io/buffered/tests.rs
-@@ -488,6 +488,7 @@ fn flush(&mut self) -> io::Result<()> {
- }
-
- #[test]
-+#[ignore]
- #[cfg_attr(any(target_os = "emscripten", target_os = "wasi"), ignore)] // no threads
- fn panic_in_write_doesnt_flush_in_drop() {
-     static WRITES: AtomicUsize = AtomicUsize::new(0);
-diff --git a/library/std/src/io/stdio/tests.rs b/library/std/src/io/stdio/tests.rs
-index f89fd27ce6c..79737f5b127 100644
---- a/library/std/src/io/stdio/tests.rs
-+++ b/library/std/src/io/stdio/tests.rs
-@@ -25,6 +25,7 @@ fn stderrlock_unwind_safe() {
- fn assert_unwind_safe<T: UnwindSafe + RefUnwindSafe>() {}
-
- #[test]
-+#[ignore]
- #[cfg_attr(any(target_os = "emscripten", target_os = "wasi"), ignore)] // no threads
- fn panic_doesnt_poison() {
-     thread::spawn(|| {
-diff --git a/library/std/src/sync/mpsc/sync_tests.rs b/library/std/src/sync/mpsc/sync_tests.rs
-index 945de280f40..1ac7eeabc5c 100644
---- a/library/std/src/sync/mpsc/sync_tests.rs
-+++ b/library/std/src/sync/mpsc/sync_tests.rs
-@@ -252,6 +252,7 @@ fn oneshot_single_thread_send_port_close() {
- }
-
- #[test]
-+#[ignore]
- fn oneshot_single_thread_recv_chan_close() {
-     // Receiving on a closed chan will panic
-     let res = thread::spawn(move || {
-@@ -347,6 +348,7 @@ fn oneshot_multi_task_recv_then_send() {
- }
-
- #[test]
-+#[ignore]
- fn oneshot_multi_task_recv_then_close() {
-     let (tx, rx) = sync_channel::<Box<i32>>(0);
-     let _t = thread::spawn(move || {
-@@ -371,6 +373,7 @@ fn oneshot_multi_thread_close_stress() {
- }
-
- #[test]
-+#[ignore]
- fn oneshot_multi_thread_send_close_stress() {
-     for _ in 0..stress_factor() {
-         let (tx, rx) = sync_channel::<i32>(0);
-@@ -385,6 +388,7 @@ fn oneshot_multi_thread_send_close_stress() {
- }
-
- #[test]
-+#[ignore]
- fn oneshot_multi_thread_recv_close_stress() {
-     for _ in 0..stress_factor() {
-         let (tx, rx) = sync_channel::<i32>(0);
 diff --git a/library/std/src/sync/mpsc/tests.rs b/library/std/src/sync/mpsc/tests.rs
 index ac1a804cf9c..7c687982324 100644
 --- a/library/std/src/sync/mpsc/tests.rs
@@ -402,14 +331,6 @@ index 160af8a65d..686f4607bb 100644
  fn smoke() {
      let value = 12u32;
      let reference = &value;
-@@ -28,6 +29,7 @@ fn smoke() {
- }
-
- #[test]
-+#[ignore]
- fn stable_hash_hashes_as_tuple() {
-     let hash_packed = {
-         let mut hasher = StableHasher::new();
 diff --git a/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs b/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
 index 4d342c72cc..9a77f92616 100644
 --- a/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
@@ -422,22 +343,6 @@ index 4d342c72cc..9a77f92616 100644
  fn smoke() {
      let value = 12u32;
      let reference = &value;
-@@ -28,6 +29,7 @@ fn smoke() {
- }
-
- #[test]
-+#[ignore]
- fn boxed() {
-     let value = 12u32;
-     let boxed = Box::new(value);
-@@ -52,6 +54,7 @@ fn boxed() {
- }
-
- #[test]
-+#[ignore]
- fn arclones() {
-     let value = 12u32;
-     let arc = Arc::new(value);
 diff --git a/library/std/src/thread/local/tests.rs b/library/std/src/thread/local/tests.rs
 index 9d4f52a092..d425e5f7b7 100644
 --- a/library/std/src/thread/local/tests.rs
-- 
2.43.0


