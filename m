Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75984C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 11:26:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6100.1745407589839078734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 04:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6208ec4fe8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N5GHoD031149
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 11:26:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh60n37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 11:26:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9eWqO4FV0DqrCzShBB3M53jz4pSw+vad7IQXFVKDU68Wvfy+mHsrJp+ZaYqj46iVtXHJDkn1slbOeiKq6dk33ppbvlRtyNp3Dg6bHyqHFGI3OHK67DCqPVMVWcwIVOoYo23f9wJDcy6fpv3jt9mvIX7PcOwt3pWu0Mxx754cxFjK6FtWHRlNoiwNhxMDc0OXfIaAf6xXavSFEKQSgB0Wbju/I7240l2Gl6TMRKL0Ve877HdqNaN5RZqemR3phKTsRW+4TeAzsi/H1foSMML4A9LEyMtAXTQA5Dv4u28uEoXjYwjB9+mF0vtViFMt8SACFeMxNHd8CTUY/4xcHyDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUPCegDBN+mCN7hLVqNGX2/NS034Jg12HauF9a3pbng=;
 b=reAvPXHZyNfqTokjmxWhw8pyXx8KN3RZLNkgCF97dRrsGONiBDViK/4QCwXHnMGgp3lPZEVOXLYqSsNGvLBFBmoGcG0xgQANpzoAj3sIc/TJoftlzBLi0HB7HpjanQsmLqZ2n6etLjMdZdTkVqcfdVswrbHbiFPq1m/PdRtIarhfqzdADG1W0jjGuY4OsmpMTcG/z3VpGmHPu5fUv1vB7q7fa3RHgVl1hjwOxHwS59Op7FryD3A2UAHA3KDI2F6Y5AF2qCETvyAW+6eBUaFusv8e0hKIreOYeEo0tJrjZFwK7mVARyHkljiSe6XtzM6DEXVAUX9+ikTF4bxApZ9WNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 11:26:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 11:26:23 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: restore unit tests that were marked as ignored
Date: Wed, 23 Apr 2025 04:26:04 -0700
Message-ID: <20250423112604.3718426-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF000132F0.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::33) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: f706034b-fa06-4a9c-a211-08dd8259ad5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?da67RVKdlDjfGBCTzg8wyNHcFa+2rESHDvT9tSeVcuVJTN+9ZIHuxWYHTorD?=
 =?us-ascii?Q?MzMaei2wt+MvOYGySibk/tV0Tp+wmdBMaHaY29fuFYAqog2n3/AjEe33BlP+?=
 =?us-ascii?Q?qU0qT9Ocex7lSa0ahHuX9OhjsA1705pX/lWkGqIRYoV7tx0Wu6sabFW/Z7E5?=
 =?us-ascii?Q?PYGZeefoRawrTU7ts9AXQ9sqdENqn9skzPBztWtt+L/vUuxKu72fMJ18G39z?=
 =?us-ascii?Q?hrSIGMaSUqbGg6zU/PxdBWJJlViV8U4cNeOIOHuZYHgib6XcKMrPOmYD5YIS?=
 =?us-ascii?Q?n3Y+3crTYh1qsSdXzjXjVms/GX4twxYhwxNsNBeh93OTOahM+WvFa0nSIKH/?=
 =?us-ascii?Q?S9rCytopk3sEjccHBMsV5/fqKs03DNaJWQwftG0Jf1MBCZsxdttNQfIGyMVo?=
 =?us-ascii?Q?MkIT0PVkd6JXL5R+iEqtXYxh3pKewRtfXvBFC50xL/WPUTVN1Lu5PjO/vlTD?=
 =?us-ascii?Q?wza7DZHodCp4x7qkJl8SL3dRMscoaN01EQhcupslRQnWqHQb7qqjyd+k3CFJ?=
 =?us-ascii?Q?UhE8Inj1F9NNUA0BEmfQC1CRHFsZq0xyXl44a1Nhysvo3DII1SpsahwThA6t?=
 =?us-ascii?Q?7ACr/Qoqf5dfRMgOQ4DLzOV3uDLkEmPgJ3Ti8srqx+uEkK2MXwZFjnPKW/fH?=
 =?us-ascii?Q?pWAwkFx74XIg8TCbi3WQ7ezgEqbPhBR3waxIRnICPLeWN3Bs1OXw+a6dP7bF?=
 =?us-ascii?Q?A9UBpzRwC+jiQrBrOGdpTzBj81oaF6GC0nRwYHJyq2tdJliM3d9rrzJHlI3A?=
 =?us-ascii?Q?C8aA1JF9wzxu4u+/LllvgF3xX9pQiUya4CmHAUuB4I0pTQT0koNhLqdIWUdb?=
 =?us-ascii?Q?7caBWNe1/ZxkoPQi8+uC259RaJYI19VpOPspgVzO9yG4agNxSbXDP5gze/eE?=
 =?us-ascii?Q?dxjePq6ReIyzOYCO29/mmKiyg09HX/iMljWqPkQC6RDnMzzNSjNtm50YTQmp?=
 =?us-ascii?Q?PPhvnGy5+D7Z1onegZ81qCI9vS1Q0rj2t1n7BHNg5lBl/IclZbxQKqYw/4BW?=
 =?us-ascii?Q?NyA4alV7iXHSgri+hZW+xbmV7eMipJ0zka8jOSfanwBVxA8jz/ZFKsmOlsuo?=
 =?us-ascii?Q?DtnJCZ/mfhMbjqAYFiekS8zYhGfTqTA9IfILxx492Uu0PsY32i9uYWp2OIRt?=
 =?us-ascii?Q?dtyy9Qf53Y3ZsihNIKmjSg/u1GaH8PCMGs1n0cFl8S+s5hW4Bvv+nwXmrOST?=
 =?us-ascii?Q?HBd1xi9PBuRbzvh7Jov53BJ55Ye9tTkZQox7pRfIfSQc2XVLa59oldkf7jar?=
 =?us-ascii?Q?sIL8Qz+A1YPwyAaxvpPrKwfHwfRnKtxvkWqlhd/wRoSdzlBSISrnX/fPwlMv?=
 =?us-ascii?Q?ITOUthe+/eqxBK0G6Z50polFO7hVumtEHRqnPSDmLD+ibNiWCB5VqAgR8sYU?=
 =?us-ascii?Q?HH8VGrH+r/eR48dMSJtw7W21m+LNEP2v8P3giVqLoTpz5K5UvSXF3q+rugdR?=
 =?us-ascii?Q?K02SGSORyNqMPEwmI8ElS3RF+XC5VZOL2z3M8cYjP94s/+deu7mTrQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qdjID35aJFg2appN0COG5OiKAjE8rSjWA9lbNlRcshZ3jkrhVzQxBRO1C0UR?=
 =?us-ascii?Q?TqffIEjU/mxf3U9t3vvWvjJACXogjRkFtpAEzOsqnVnismgP/UEQXwMWa0r9?=
 =?us-ascii?Q?LLxM5bvMmGdVWlYhusmWcAd/9HKudN38xwMWKWdG62AtPDydsIgxaVtCSAOx?=
 =?us-ascii?Q?V7V/2O3Lu+BqKHpyGQd+Wr2jDQxpY/KDTh6T/Sk4sjpf7z3/tsjvLFyBkPAE?=
 =?us-ascii?Q?//OnJQTRuHihhw7eYMOCm8uisyitAI6c0vbBGDo9M4Q0Q0jUA1oZ3foNZGuq?=
 =?us-ascii?Q?dbXSeZKbsrRrVkpSdBA0KLrVP7jWiQ5dxEtmNjNgwdixQwyQaw06W3WmLxxs?=
 =?us-ascii?Q?DuxjQ4dssdpZ4g28RFPlui4KGT24LsvUDJHYPv8bGpxHsGX90rQECD3Jtn2f?=
 =?us-ascii?Q?FwSnu7Xar1A7LLYjVXcP9sYLT+ICNgLYfhLKjkSqPc1b9rK7Pwk96V/xMUn9?=
 =?us-ascii?Q?+j5DjkD8+EyfRSD5osu3FxFeERJ9RL5w8UMJEiHQ9uKIZDbjrOQjcodTDAF8?=
 =?us-ascii?Q?zbrChpTkHh1n5bFH6VFxu7g530uQRdILHLZ0l47smE/Yxj1xYBhwJAGo7V5n?=
 =?us-ascii?Q?11CTeGUwYFVafH+4k2Btk4IqIrL8bR5ukWTWq5h4/SI4MJbES3KLraOcwdxO?=
 =?us-ascii?Q?qi/37cHvXyUxq3U1XkjxC9U7Bfo/8qFCiz22dFuLqZY9uPLu6fM1YQoT3s5G?=
 =?us-ascii?Q?0JFV6I010BedToZ6x5YlJQMYMapZnmMAvvvdeoU8O+TH60qmtVOhorOD52j0?=
 =?us-ascii?Q?IoRsrABvRcspxEe7+M27zrTp9Jl3NBCAVvv4sEFSwQIwo5Ckwebiq+8Ms25W?=
 =?us-ascii?Q?vMZtmdXpPeUWrkM0kf027vPOQuy5x1EO5j0bu0W7nuGNnsDCR3nqm2h/VAwu?=
 =?us-ascii?Q?rjrTin1Ld8aTIgEfNoeRNHd+xPun4ATvVU/K+AzoGzsuLo3ki4UhcAuJhl0H?=
 =?us-ascii?Q?xRNFt6dANsTzYx9Y+xAkQ24N/ri62P6dtH0BBqIf5PoOxgu5DYYU8sL7d9Lf?=
 =?us-ascii?Q?qeU/CWg24OK1W3Feul5E3i9JXdLomigYQ9JwzdOVTplvw26dhVTXGH/y4gHm?=
 =?us-ascii?Q?Icl6iTs2S3oUcbl7A3LVzcbekn5zeM8fM9R/wzawrNa77TYKbnC5aMjGHpqC?=
 =?us-ascii?Q?TEmPGBu7XHfOVuDJTBGBnF2CXYg/fvgyO/zwZP4QylxDQGL8FWQY1aPvJHcf?=
 =?us-ascii?Q?BM+RSkXqWTPTyOkHoWC/Ic5Y7vt6YotylWivT8hl2+UjWSoRqv55aOiJbJls?=
 =?us-ascii?Q?2tbyFAHCtXAynNrc8OqikgewK6JMsCeWfrZn097SGv0B5JIC0raOjDA8LATG?=
 =?us-ascii?Q?gJAvsXbUdyBBhM1G0TlrGRUY3w2UqWJ+Te4FVzWroXd8y9QML4v7P7CBy3WQ?=
 =?us-ascii?Q?qxaSWR2ea+eCiypYBvQT6Oh3oWpm509KcqFzGm/rywdaH2Pmjs7ygmiVwdPb?=
 =?us-ascii?Q?MJeN5EHjywwoL2zOuYhLrTQNukuI+oTKyy++1ZnbRoWzQqgMF4rewuWuab/i?=
 =?us-ascii?Q?CstG3nGpVdBjBiOdVqKgMS7MPGE/yoD5crzQDCQcmjZdF9bA2wO4EwsiDQrl?=
 =?us-ascii?Q?DsGHhGCOTJjHZrublKUTzHpqmkX2M+X5EqPJlYHghSB27x8/+rl6YmswbwNa?=
 =?us-ascii?Q?gkiLt9udeqKO4ZCnxUiqGiw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f706034b-fa06-4a9c-a211-08dd8259ad5d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 11:26:23.0460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igv0YbFX8m0+NoRgYuDByWDeqwHGcP19NSl4EW93uioX1JpXTpVlXNG2CzLjyYtpo7hP+mDB+eh7G6aGbG3qizj/GcmPy3riaOmmKtHTUFOf69b3XnO1DlCymVS+ECw7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5112
X-Proofpoint-GUID: Tn5L8-EZtluQZfIhb_fdp73tRCUU0VN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3OSBTYWx0ZWRfXxPwb5mS9JyWU aivWY+A99cWdYAq2ie4wuH4PuFr9UpaREffBpB0Nt+SAK5yP6mhHTvTA53/y8Zo3Ur6X+dRV0Wq BynZXSZOqP5PT9Uwyks+TmOPZWZd5ewOxO/YDwSEJ2EyK5Ozghd6FdCzSRcyCDGxIood9RXb5Yy
 F7XAYCPomr3LAQuHasbNdrMgTNtVgEmQEw8evaP2/39vQxtslFH/bsJaYD5qvfEA2rpMfmwhy2I P/4QQhPn8+NFPOlOeSHgARFuItrING+3r1VS3O1zuL4rXGZuJV6/MjnwslufRUJzCT4UbM7o54A Y/k1didG0F/U5AI6R79PvP1ALmDrjUWOO56rl7Rcx3Lo6ABxMQ2ntAH74jtapMXunewtqBsi02w
 dJEQdBYv/XJBMFRe0TRAffdlf8pfZ2F0BnodZ/B3f3vK0t6zXxVRv5mWdCQt3UWXNjo5FC+m
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=6808ce64 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=icHrnxva139z8CSo6YgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Tn5L8-EZtluQZfIhb_fdp73tRCUU0VN8
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=704 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 11:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215281

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Some unit tests were previously marked as ignored due to failures
in earlier Rust versions. Following the upgrade to Rust 1.85.1,
these tests now pass reliably and have been re-enabled. They have
been verified to run successfully on the latest version.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/files/rust-oe-selftest.patch         | 93 -------------------
 1 file changed, 93 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 909bc971db..43a849dc8e 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -43,66 +43,6 @@ diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/sr
  fn test_can_print_warnings() {
      sess_and_cfg(&["-Awarnings"], |sess, _cfg| {
          assert!(!sess.dcx().can_emit_warnings());
-diff --git a/library/std/src/sync/poison/rwlock/tests.rs b/library/std/src/sync/poison/rwlock/tests.rs
-index 1a9d3d3f12f..0a9cfc48806 100644
---- a/library/std/src/sync/poison/rwlock/tests.rs
-+++ b/library/std/src/sync/poison/rwlock/tests.rs
-@@ -47,6 +47,7 @@ fn frob() {
- }
-
- #[test]
-+#[ignore]
- fn test_rw_arc_poison_wr() {
-     let arc = Arc::new(RwLock::new(1));
-     let arc2 = arc.clone();
-@@ -72,6 +73,7 @@ fn test_rw_arc_poison_mapped_w_r() {
- }
-
- #[test]
-+#[ignore]
- fn test_rw_arc_poison_ww() {
-     let arc = Arc::new(RwLock::new(1));
-     assert!(!arc.is_poisoned());
-@@ -100,6 +102,7 @@ fn test_rw_arc_poison_mapped_w_w() {
- }
-
- #[test]
-+#[ignore]
- fn test_rw_arc_no_poison_rr() {
-     let arc = Arc::new(RwLock::new(1));
-     let arc2 = arc.clone();
-@@ -127,6 +130,7 @@ fn test_rw_arc_no_poison_mapped_r_r() {
- }
-
- #[test]
-+#[ignore]
- fn test_rw_arc_no_poison_rw() {
-     let arc = Arc::new(RwLock::new(1));
-     let arc2 = arc.clone();
-@@ -192,6 +196,7 @@ fn test_rw_arc() {
- }
-
- #[test]
-+#[ignore]
- fn test_rw_arc_access_in_unwind() {
-     let arc = Arc::new(RwLock::new(1));
-     let arc2 = arc.clone();
-@@ -275,6 +280,7 @@ fn drop(&mut self) {
- }
-
- #[test]
-+#[ignore]
- fn test_into_inner_poison() {
-     let m = new_poisoned_rwlock(NonCopy(10));
-
-@@ -299,6 +305,7 @@ fn test_get_mut() {
- }
-
- #[test]
-+#[ignore]
- fn test_get_mut_poison() {
-     let mut m = new_poisoned_rwlock(NonCopy(10));
-
 diff --git a/library/std/src/thread/tests.rs b/library/std/src/thread/tests.rs
 index 5d6b9e94ee9..a5aacb2eb87 100644
 --- a/library/std/src/thread/tests.rs
@@ -147,39 +87,6 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_try_panic_any_message_unit_struct() {
      struct Juju;
 
-diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
---- a/library/test/src/tests.rs
-+++ b/library/test/src/tests.rs
-@@ -424,6 +424,7 @@
- }
-
- #[test]
-+#[ignore]
- fn test_time_options_threshold() {
-     let unit = TimeThreshold::new(Duration::from_millis(50), Duration::from_millis(100));
-     let integration = TimeThreshold::new(Duration::from_millis(500), Duration::from_millis(1000));
-diff --git a/library/std/src/sync/poison/mutex/tests.rs b/library/std/src/sync/poison/mutex/tests.rs
---- a/library/std/src/sync/poison/mutex/tests.rs
-+++ b/library/std/src/sync/poison/mutex/tests.rs
-@@ -193,6 +193,7 @@
- }
-
- #[test]
-+#[ignore]
- fn test_mutex_arc_poison_mapped() {
-     let arc = Arc::new(Mutex::new(1));
-     assert!(!arc.is_poisoned());
-diff --git a/library/std/src/sync/poison/mutex/tests.rs b/library/std/src/sync/poison/mutex/tests.rs
---- a/library/std/src/sync/poison/mutex/tests.rs
-+++ b/library/std/src/sync/poison/mutex/tests.rs
-@@ -272,6 +272,7 @@
- }
-
- #[test]
-+#[ignore]
- fn panic_while_mapping_unlocked_poison() {
-     let lock = Mutex::new(());
-
 diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/src/sync/poison/rwlock/tests.rs
 --- a/library/std/src/sync/poison/rwlock/tests.rs
 +++ b/library/std/src/sync/poison/rwlock/tests.rs
-- 
2.43.0


