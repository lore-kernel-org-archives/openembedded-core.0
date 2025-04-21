Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D45DC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 04:03:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8970.1745208207975902790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 21:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=620684e33b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L3uHE8006013
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 04:03:27 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8se0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 04:03:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zsx5kxRc3Lveuss4nkvemFStPPj0n23DW9AVxoYwdBb+RMDR8iVunleyoBYQLx1mYRcZgWOwTTY+MOMUqGgqX89yOzeXziH8R/HzcFeXUifOx4/sY91QMcnIYL7xzfBRApr22Re7cz3CNEZ/RPt+qcir88GxJUFdssbSFYMKn8RUPaOoswaBQ1CFf4uOv02gNPtoP6wVZPG1odb7veezJBeCDAODaiemENktZBO/5ohQvfeLhD+JWvqSuv0nFlfw5abiviyAiSJPe3SyiiAmoQRhmiNnartB7jKx4cRay5mFtKmTVaiT5Sa5jBNbWHo8fp10UoEOdOfJQsxKMpqCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZX1E86B0W8AyOp+DsrWPCLhsppkrn6jKWNdG62kROg=;
 b=OyHZRU4DIVGOM5If3GRBXegWfP6T3y5S2X3ZpMjz2XvrNV4sqk6zU09WHfwls5XQcb80TsVuzX9xkyfiYiMVCkqgUlYeNWjl0zayGVJEQcI98CRQnSPzFNFTC7kySBU0Zstf2tUGiyWgiiyKO5LCM1v9sDZeCA/Hb2/U37rY2wPT+WjwKiPcDKTHpkRnJHU7WdOvTV/ijvSHYXw1RMXJJcPzxmfMz9Ct8ho2RJwbpb4rilkwizWemU9Ki0cd5k3zFD47pUG+NxVXMrvlkiOBpIsLRZpYtY/YOq+S44oC0txqtB/kAQyH8+BV56KP/4Hd4YVmVHix6LIVcshyjYdeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 04:03:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 04:03:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: re-enable the unit tests that are ignored
Date: Sun, 20 Apr 2025 21:03:07 -0700
Message-ID: <20250421040307.2073062-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH3PR11MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: 7442be11-4f90-475d-d99b-08dd80897631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y1dCtlEIzq/GICnDBSKzEJzHjP2c+CvF8OySLPaGcAGFyLlLMVkJmYXa+kYO?=
 =?us-ascii?Q?5Y1+oMyx2MlMPqJLM8Pw/iobybh7x6KCXoUgzjcqqPCIDf/XJrV3GPaloZ87?=
 =?us-ascii?Q?Y1iPWGG+yF3z81oYXybfkPJUGmepgaDO1uK4TTxMraSP5NGDBRLX45ogoq4z?=
 =?us-ascii?Q?x1PSR7uObQ5ssgounCC/cO9Y3t0hx42AbVBFc11OLVSF4QYNv90N7T03Bbp2?=
 =?us-ascii?Q?L1mJ339lGPFGuzVGxSokxvHHOtmdBudsiv1yw8TY4RF4+aNrtlF7GpC35rXm?=
 =?us-ascii?Q?13y5thsXfM6aCyhVXmphNZptxIXr/3VNNfH44BSQXiLVtD7d0pv1AuDea1f5?=
 =?us-ascii?Q?9kQbBGEwsY3gDBGl60Fbcg1XBT72H1A3N6RVt5WH41/VWpYg4Nw5zBejpFcH?=
 =?us-ascii?Q?1PA9P8RecoRh9mTmZtSbrbkRuwQQvb4MvMzBeEcJXsaxr5kSmVjKUkJY7LCD?=
 =?us-ascii?Q?N66IoycJ5Rf56GTU+aAyr4mBqrVqlqQXa+vbnfJJ8WjCUp0G3GqBeejx+/W/?=
 =?us-ascii?Q?AfY6f4rCH7ULv7gBGY7xbK+E1cW5sN3iz0KuU7nbiExblIuGBhoOfPlmOX8P?=
 =?us-ascii?Q?d59na5RvECUdVbyQHqIAb91aPvafL1B6Tkz3lEu4rHgARaBTHX/GUUYwYscF?=
 =?us-ascii?Q?PAZTLV/77lot3jhzfv8gA0aMobw211DSuO1tMn42xfjcfYwDHzcVM0yiHzW/?=
 =?us-ascii?Q?Q8BKAbL06GlJlFncq49T1T/YZ0WkPIt0P5jZpG7MdPAguaMvDbec0mjNIhfy?=
 =?us-ascii?Q?mLuPTEwiPag8bnc+aQ5MR0RNCOUd4kD3L9Lm514OzYjpWhCJc52niuujsh1N?=
 =?us-ascii?Q?+s79Py5f3oMdicZeBRUOBoQzxLX+Oj4dnCRQP4HNVNRsNHAMCI+urkfhWa7n?=
 =?us-ascii?Q?AqE4T8osl4jcPc7DfTiobplWK25ojmRNLGsB6Zk8YnlxWyEL2NhfeRQbpMbR?=
 =?us-ascii?Q?K5wQLpluJcBbG5b81wnwtOoUk5LLzTVUSSjEkCNI8yXh0+6UawiJncr8Vk1k?=
 =?us-ascii?Q?TLAYUolH1JkRSDdObQrm88ByxlAVeFV+g7vwCEVWmS1YppVqOai2rRK9kMnO?=
 =?us-ascii?Q?Y9wjQHZs+oluhneSkgUZZ33fX20GbF/3Am7GQS+WsfN8zxAk1RTHf6+l2A7b?=
 =?us-ascii?Q?l3gS/uAo6OYZuPGq9S4/Or0kOFAK8UZ4WcHw1s2eNvznOZ46hvEPDnornLry?=
 =?us-ascii?Q?5u0RVe927cGAWYSCoP3MS+aA2UOA9hjd8wYeS3xyZav38VjFPxwmcBwyncuH?=
 =?us-ascii?Q?SrOxA3xfiCLi8EuAQs+tu93dC9h2pHIL6Dqtxg07l86Jd89B5kPNPUeOXoyu?=
 =?us-ascii?Q?Itimq3nts9LwVna6+aFaTi63/Q9n1bVnJOXvWXCM7ah9rLw5igc+T9DO4WJK?=
 =?us-ascii?Q?1P+EzAS+5clu1wk2Csznl4OgCAVRpRjoBPxv+arYpzLcX0TLdBmX9xssPkxr?=
 =?us-ascii?Q?xutia0Pdz4PfzwC20rjew+RT57h/PYsISGz+z9Ct5uyOA6UHwaON8dahlsPC?=
 =?us-ascii?Q?1EfIyAp1/kfEeZQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e4zK11b4hsaFWTP3lDo2+ZpyLtvM0mbZpP1fZgLnQI5Q/ykvH7XIKp558XSM?=
 =?us-ascii?Q?WAFQsnT73iXe2ubudE7HD8lYAmphHAl+px+g/JW5YbWjrxn6t/37OJgLxQyi?=
 =?us-ascii?Q?0RX71MIY59uAq8AVi+kx9l6bzGXym04Mq0gtGx5QmXnfdgG5m+GcRGkTsMdI?=
 =?us-ascii?Q?zgiPGmduXlMe2LrLEeZAlbZmMxqOZyA2HFp+XWXG5Hu9Z+mk0UFdnenb92Tm?=
 =?us-ascii?Q?7In52xR97GrW7t733HSn/u9msHeRe4ETpqLIPH9IjN7rjKBOmcpCbS0xGaBo?=
 =?us-ascii?Q?i62f5HjqlUAp++EoLzfIpJUdBkV9G4Qi8Bs2bySrT5O2HCFSQZtat/BJnZXR?=
 =?us-ascii?Q?AMAHyg2rUzS8UbezOhc1gjz5LTPNOHFLjfQASKKUHNyhbJeF+VjRzMRLAmE1?=
 =?us-ascii?Q?SaMQoTG0v998HWLNsJHNnPfLETG/bdKeuDn3sV9gpfj+VzA2veWLUFXEk8iw?=
 =?us-ascii?Q?p9/bOEXgj4kWllLSsXi4QbuoqPEtuKPCtEFkGL4p5ToqNr+MBMPrnuPqp3fl?=
 =?us-ascii?Q?joMjq9oJSuD6xGUmh/lBR896BjiRoYjV+gct64bkK3K98RR9TzxQUL1UTqHE?=
 =?us-ascii?Q?/NpZxSbey98gdMTw0BCB4ibm17DqgAY1VohPCh7niia+udc0aCDJZD0ZpsyQ?=
 =?us-ascii?Q?eLePEG16FcpaR/gXEo1JAOGIXDqvrzNuzfqvITcHkHZENAMexGSQnnQrFsh1?=
 =?us-ascii?Q?0TtU1X9KNLphAmPYHTD83u5jXi/SXULyK14YwHWo+/FUvYQCBOrbkkoAvMSm?=
 =?us-ascii?Q?bzQFbOapqQueb8OXZQlYKDH1/4/Fvxi5Q9ZMKiyRdGjgiIHz9hW/+hTmodTv?=
 =?us-ascii?Q?LW391+2j9p+dpTR7FDfo0Lc0fJFvXYigsZ/qfmj8H7Yp6Uoz41C1VjUqs7IQ?=
 =?us-ascii?Q?OafKoWDjZ3rPU758o2IcCeez/n8qb9VjqusWe0ENzlU4kpGrkEFQPEIDs9Vp?=
 =?us-ascii?Q?+7uiyc2ql8PmqYm9izVTpa6/eFwuzsnvn5BVmU92nD069c7Em0ayfF1GPjeR?=
 =?us-ascii?Q?MrL9B9mdxtNsIjg6bVnFrXCgtx3CEWnbF5cuUMo3L2Y3LY1VQBaQxkNFKDzX?=
 =?us-ascii?Q?P2GEY8N+Rp2z5lFQg574A19daTUZTKwTE/S11oL73LKopNp13eGpI4ZJmmO+?=
 =?us-ascii?Q?9F01bQUMv2jlilPz1VtLsyJKxKuIoZsql9l2ZhljmVvEjLdv67qUzN755YTl?=
 =?us-ascii?Q?POvGoYmzyvcHnJ7+XaoH6fv/1cKyxUR/yJEHNdTdbpa4dwzarDe5hfg0+tVf?=
 =?us-ascii?Q?a/WPGedp3LLoYsiPD23gk9/fXBj0VxJNih8kpEhsKhwcCz+d+ztstrYD4EkL?=
 =?us-ascii?Q?epBbVz4FWw97UgykzIR7rhU6s5bZ1tQRI+vhF0KvwWd9wFKrXjVS13GT++HR?=
 =?us-ascii?Q?UmvWvjHAdFJQtSl8ilPXdL42kdVCjgGo9KWW+wHmyN07vtVahPDahCFRptnu?=
 =?us-ascii?Q?Dpg+gVKqyEzloCjRP5UBik/E2ydk+PaFD63ktMcgoR0gHc95Js4Paz13PIHD?=
 =?us-ascii?Q?LfOu7N3W/1e5obbyzcgCc7AEGxlG0tMltEt8Ka18yTBbDnFF0Z9o/Zappt9O?=
 =?us-ascii?Q?OO4w7sqSJIfYn/4P0k+nS1Qf23gwyKitukqJWRVzaHDeVE/yEoBE1KN//oE1?=
 =?us-ascii?Q?RfdrMttgiRdklm0xA0xT1eI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7442be11-4f90-475d-d99b-08dd80897631
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 04:03:23.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esBga04lWJK2E8EAcQRBBPcxnm77L0u95Iunl+jFQNjvFzyub9SYDHkp9qEF5blrKxPsOvPz8CIWb/Obxu19+akPoroybl6eGbxUyd6g2QuZHmGcwJojEMHpMjpdmDNP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
X-Proofpoint-ORIG-GUID: XsuH84Q3x5YZfDGJzON-t8cFqyk2rSSG
X-Proofpoint-GUID: XsuH84Q3x5YZfDGJzON-t8cFqyk2rSSG
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=6805c38f cx=c_pps a=6H1ifQWhBrriiShMtbI+RA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=1fAmFrTIo1pHYcKBz2kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=933
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504210029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 04:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215167

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Some unit tests were previously marked as ignored due to failures in earlier
versions of Rust. With the upgrade to Rust 1.85.1, these tests are now passing
consistently. They've been re-enabled and verified to run successfully on the
latest version.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/files/rust-oe-selftest.patch         | 100 ------------------
 1 file changed, 100 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 4a8760a6d4..909bc971db 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -43,86 +43,6 @@ diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/sr
  fn test_can_print_warnings() {
      sess_and_cfg(&["-Awarnings"], |sess, _cfg| {
          assert!(!sess.dcx().can_emit_warnings());
-diff --git a/library/std/src/sync/mpsc/tests.rs b/library/std/src/sync/mpsc/tests.rs
-index ac1a804cf9c..7c687982324 100644
---- a/library/std/src/sync/mpsc/tests.rs
-+++ b/library/std/src/sync/mpsc/tests.rs
-@@ -233,6 +233,7 @@ fn oneshot_single_thread_send_port_close() {
- }
-
- #[test]
-+#[ignore]
- fn oneshot_single_thread_recv_chan_close() {
-     // Receiving on a closed chan will panic
-     let res = thread::spawn(move || {
-@@ -313,6 +314,7 @@ fn oneshot_multi_task_recv_then_send() {
- }
-
- #[test]
-+#[ignore]
- fn oneshot_multi_task_recv_then_close() {
-     let (tx, rx) = channel::<Box<i32>>();
-     let _t = thread::spawn(move || {
-@@ -337,6 +339,7 @@ fn oneshot_multi_thread_close_stress() {
- }
-
- #[test]
-+#[ignore]
- fn oneshot_multi_thread_send_close_stress() {
-     for _ in 0..stress_factor() {
-         let (tx, rx) = channel::<i32>();
-@@ -351,6 +354,7 @@ fn oneshot_multi_thread_send_close_stress() {
- }
-
- #[test]
-+#[ignore]
- fn oneshot_multi_thread_recv_close_stress() {
-     for _ in 0..stress_factor() {
-         let (tx, rx) = channel::<i32>();
-diff --git a/library/std/src/sync/poison/mutex/tests.rs b/library/std/src/sync/poison/mutex/tests.rs
-index 1786a3c09ff..9dcead7092b 100644
---- a/library/std/src/sync/poison/mutex/tests.rs
-+++ b/library/std/src/sync/poison/mutex/tests.rs
-@@ -82,6 +82,7 @@ fn drop(&mut self) {
- }
-
- #[test]
-+#[ignore]
- fn test_into_inner_poison() {
-     let m = new_poisoned_mutex(NonCopy(10));
-
-@@ -106,6 +107,7 @@ fn test_get_mut() {
- }
-
- #[test]
-+#[ignore]
- fn test_get_mut_poison() {
-     let mut m = new_poisoned_mutex(NonCopy(10));
-
-@@ -146,6 +148,7 @@ fn test_mutex_arc_condvar() {
- }
-
- #[test]
-+#[ignore]
- fn test_arc_condvar_poison() {
-     let packet = Packet(Arc::new((Mutex::new(1), Condvar::new())));
-     let packet2 = Packet(packet.0.clone());
-@@ -175,6 +178,7 @@ fn test_arc_condvar_poison() {
- }
-
- #[test]
-+#[ignore]
- fn test_mutex_arc_poison() {
-     let arc = Arc::new(Mutex::new(1));
-     assert!(!arc.is_poisoned());
-@@ -220,6 +220,7 @@ fn test_mutex_arc_nested() {
- }
-
- #[test]
-+#[ignore]
- fn test_mutex_arc_access_in_unwind() {
-     let arc = Arc::new(Mutex::new(1));
-     let arc2 = arc.clone();
 diff --git a/library/std/src/sync/poison/rwlock/tests.rs b/library/std/src/sync/poison/rwlock/tests.rs
 index 1a9d3d3f12f..0a9cfc48806 100644
 --- a/library/std/src/sync/poison/rwlock/tests.rs
@@ -183,26 +103,6 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_get_mut_poison() {
      let mut m = new_poisoned_rwlock(NonCopy(10));
 
-diff --git a/library/std/src/sys/pal/unix/process/process_unix/tests.rs b/library/std/src/sys/pal/unix/process/process_unix/tests.rs
-index 0a6c6ec19fc..bec257bc630 100644
---- a/library/std/src/sys/pal/unix/process/process_unix/tests.rs
-+++ b/library/std/src/sys/pal/unix/process/process_unix/tests.rs
-@@ -6,6 +6,7 @@
- // safety etc., are tested in tests/ui/process/process-panic-after-fork.rs
-
- #[test]
-+#[ignore]
- fn exitstatus_display_tests() {
-     // In practice this is the same on every Unix.
-     // If some weird platform turns out to be different, and this test fails, use #[cfg].
-@@ -37,6 +38,7 @@
- }
-
- #[test]
-+#[ignore]
- #[cfg_attr(target_os = "emscripten", ignore)]
- fn test_command_fork_no_unwind() {
-     let got = catch_unwind(|| {
 diff --git a/library/std/src/thread/tests.rs b/library/std/src/thread/tests.rs
 index 5d6b9e94ee9..a5aacb2eb87 100644
 --- a/library/std/src/thread/tests.rs
-- 
2.43.0


