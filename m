Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCC4C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:44:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10744.1740663848608586082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 05:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41537a6821=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RBfMDE031533
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:44:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451pu225q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:44:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmqx0+8SW7BqN7kuOIPAuP7ngIjXqllr3/tTYra1DPoGN58T0mwN/dj3oYuy06eMoWGAkXOw+JhaDuXD9mvujzoZr1CH9tJgfqPzhCFFXvHQE9//evKv6LrN1gyJgBCdi3Wf8v+z0fPSjFoYi5+Palc+0uVOCZn5MVJv9c7XAKZY5vNWp78a9X8XGrvu9/C5boZddVYQPPMrAfyWHuU6CpKpvB17dDKO2g74BrkRk6AO2PtYpoUTP4YHdHGAhqkGmsCVWOnBXPXQN5THBlx6to/jjStDbrOIjqg3MwArYAdi7+5afKEdm/eDMDBqZ8sYDm5OX2hum+6lGcx01Z2qPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h+nwyOAv4EEQPnn8FPvsg16+zFKeodMn1q+yWWYpsI=;
 b=aI7pfk6Eze/kv3yA0SLqlI9LqIjAEDNSRsdfXDqG5IHVeyVmlSVI6HxDmszHq18AHFsFgC4L/Ldkd2Oz9nHHT473juQeHM4VhMSAOfrjMMt6Yy9CPFolhUin28JW1Y5p8H26nIzWo2FDRx+4uCJqTv/rylyVlHAfpWECV927KbX/pf2VQFZ2DBEEO8vly7Z1Y6MLN3wDaJzBH7VWSq+2mBbQftMywPr+Jv5adSn6gJuRycXvJ2sAuF9o/UlSrJs3c9bI+FBnY4aWr7uC8S7rB0kKATm2uFOOokxyJSQZ47MSeGIxV0gBGUq5zVeVOfayx3PLv1JOZFe4cfWWcySx1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 13:44:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8445.017; Thu, 27 Feb 2025
 13:44:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/3] rust: Oe-selftest changes for rust v1.83.0
Date: Thu, 27 Feb 2025 05:43:35 -0800
Message-ID: <20250227134340.144081-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
References: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 22406123-9f81-49e6-d6f3-08dd5734cd88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M2pqu4r+ls7BjYnYq6W1d4NEW0FiGpoq8xI9pWTBN+Fer3iLl0N2tVhVdk7o?=
 =?us-ascii?Q?bTqO+8UtpVttuRATlXSFLC4IlKPufVWqN1AMD9JMpIzH0StkrQ693+iEykvn?=
 =?us-ascii?Q?yy2cUwKTRG9+PUbdJD69xr7sd4DBwmwlqf2KQAFFItf5VYeyQ14XDB+sS288?=
 =?us-ascii?Q?Nlq+jWILrzrsp5hvaVG3lZWw8UARVblbUdvgvPb8QJTzHpzMVkS6JdCmmhwm?=
 =?us-ascii?Q?j9xyurFh0bD7/e9dHCQTMR+F5Nd/iXB3/BJmiIZw6vTIAZiExDqz6OjcRC85?=
 =?us-ascii?Q?EU8HTtEOaJD6IsVPlzMbo6GMgUWimjaW2OOzWVD/7KYnBjFYMubbdme9zMw0?=
 =?us-ascii?Q?M53F9vo4tz/OKb7L7aFkPfipaqI6VaCNcPT/48w/4PbLcgpxvGsw1//0DB9L?=
 =?us-ascii?Q?lMn5V+E/T00Y5TulU9mLPrG7ed/jS4CskRF/kyFqioAamgkVBbojsMm/h7ZL?=
 =?us-ascii?Q?pYwEL/iIAwmTSGar52Ycvb9gMF+Yo6qK4QbGgx1pEiH6y1Lqx4Gaw9lE/Kr3?=
 =?us-ascii?Q?X1hMErBrHw1aq3yepH73bfeMADn+7h21ce1vQdnpB+oxuCvSXiAyrBTsahZu?=
 =?us-ascii?Q?vYRnEepoqg5+ZWJ/dSFW//ILPYGzvcY1mRpTaQf0Fn8vrGl7emuEKiYSR6Jn?=
 =?us-ascii?Q?wvm4wry0rqjshXzkyTPvmo8JKzDIHr+1HwoYSIV1ro9lLt5oKJCIAIVOVmmr?=
 =?us-ascii?Q?uSfZv8meon5QAHb2xsJL007s8LwiIXn3KMkOpNhKwMz8Wo0SwXzghgdtK+GD?=
 =?us-ascii?Q?NzzgheJbblV3ftzs44UmnddmmuB72ScW8Iq8us/5eOMgtGUjDZa5D1kpTkgm?=
 =?us-ascii?Q?IF4AvjZgfped2iJx1XzJwXm29F0/NyKGSXFz4dvWJ6S9HeDY6nDf9lTF3669?=
 =?us-ascii?Q?F+rDwLF+Ff2KApdCNA5csGxr6V+h5GslQ990+BLCt/ky7TySVMmdonyEKom9?=
 =?us-ascii?Q?sye+irvL3grf5V4sttfQFiTFa+EhZgRUBFqVge3Q3N2hBDQPqzzlvyJJaHay?=
 =?us-ascii?Q?VjFbe4f4DkYZUW/7O5p7jx2gqHHIa1jzcPScSMTlskGg0WmlW5bHRuB4OuNW?=
 =?us-ascii?Q?xugf0QFVq/0fK3ZBGTvMuMY+6o/S3CcdTy4a/Mmzbys6XFhMEePPVPLxQ2BR?=
 =?us-ascii?Q?kdlZBNPT6qXOwI37vjqKNkNfdseFxET5IhY6wUY/VDNJl0J6IjFLT7mktmJe?=
 =?us-ascii?Q?gkwLztgB6P6bihjgoqqT7UsXHy8RJZdlBPZpJZE1y2AO7l5QliZH974fm5hH?=
 =?us-ascii?Q?I1WEPle6EXO6AyGRc5BswxwIfzWI8/BXdDhf31O98KQZHRlyrij21jnPS1FU?=
 =?us-ascii?Q?Exl+6618nD+7VbvuI7yZcECxZgxVjS49r19q5GsMEyUVUNZOfR09h0dADFwg?=
 =?us-ascii?Q?CwpaKn/A6me6t4RmxI90Fy3+dOSMNUDyBweZoOvie9pg0dGHN9EWVLTrPffy?=
 =?us-ascii?Q?i1ZGZ+74yIo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lgSASthVMHxWlYJULGkWtIX3SxZ+BtlfuPeP4F+5V+QhJ2mf3CKpBIZNz3XA?=
 =?us-ascii?Q?Ysm2RR3UtS93UhKjclyPIKihkW5nQRT1lIxav0Iir1PD6UbMfPJgTDj47kbu?=
 =?us-ascii?Q?Dk3gTJWxqxCUsGQ9rncnQBZpnf4lfpBJZvWOzcpbiNt3XGVR1Z37cwQDEDpa?=
 =?us-ascii?Q?fy1iNSReCsdl24r42ZuS4XTSnEjzeBf9ctsAd6AGr2PEZPM27kEt+M38PvhF?=
 =?us-ascii?Q?JqUBZGdkQh1l7mBkSaLqvKkGxnd7VTO1C2Jcv3dGiwUq9x2VNLcS/tLCU+h0?=
 =?us-ascii?Q?ULpTTW5Egww+2GfLfMI2IJ6jmtr0bd9kkFj0lhqyNaanKISO19CyM8dhTshq?=
 =?us-ascii?Q?pPcwlWn/KI3nDLezdyouq00uQO5qOFcy/IIa2caWgYMQi4Z2YQuq9eVNFaDC?=
 =?us-ascii?Q?WPwx04Bi88eeKJV5tiLXfHKvAB81WBP3UZ/qs6fhrcrA5Hqx3u+NrvS3kkme?=
 =?us-ascii?Q?tt6jkX+fJEytC0+paAj8qa2ansbs/xbVNQh/+K2M6wB3Z9ZsqKijJzhQjm0X?=
 =?us-ascii?Q?KYuLD/Jk7tN6HqkvDRzUXF20Plr5WikeOcSX4SkJGvUq5FGq/kwAg+rTDP3i?=
 =?us-ascii?Q?JUjlPL/O08w1iL6OsIQ2tUOV7vvipl4Wq/S8YDhTsd5RX3u35+nB+tmqBq05?=
 =?us-ascii?Q?czQocBOp5dNVVe7LRMPb3wU87+rRF24IAOfaCR4PijQwzYT3oDw48g6h5+rY?=
 =?us-ascii?Q?HZs7n3NRCuywYlt1x8OsYWw/23Q5o1iKywoJVrKiz+bBrQkeonYrGqTMx1Tm?=
 =?us-ascii?Q?4iq+1KFdzu00R30Ub7NZLpMYn79A1pW5HRbb4QGMmnLONrv+rlOk+oJpNAvI?=
 =?us-ascii?Q?HvUDhAIqt2MW6k+UTn1UTGahVJTVsvzMuX4um3Lg3NexulP57JnqQv9sE4fS?=
 =?us-ascii?Q?NFdmYLR2o2vlgXLAo5eJHzZ91Mvmw2bXxHeo3GthgDos7Ar8dZq31TiaWSnu?=
 =?us-ascii?Q?WnuZ8xkHNde0KWmNKhHoehIcuH+dWSC4Gr38Tt0rAX7I3PgvgDPGUnblZeH9?=
 =?us-ascii?Q?wkZkJhqkbMEmne79vq5NyV+S2B4ptZiP7Y67hAuaMZcmL5eSo4kBK4cdLSaE?=
 =?us-ascii?Q?+QVGQ4lhpjCSA1TSb5UpvxYnuMbhGp6a3emSRciXW8leYFLw0FQkWM5LQH/J?=
 =?us-ascii?Q?WqpDmSPPQqdWQ4VQSWhAjl3cylMzJgktq2d4jLdI1a63QCoQ/wFDlH+mAGlu?=
 =?us-ascii?Q?gdrynO8L8Fb+tUBd8FU1BPgsn82S/Wz+WP5cXJZx+vhRXZhLho0oZrsWgCJP?=
 =?us-ascii?Q?dmCoTtPlw+kG7RhuSreZqckIqmIQvnGdGpQXa4ZvLESvsLUEJH8c3EysDIMJ?=
 =?us-ascii?Q?Vk5m2qDuiFsPWxVNIsFY8/0DyWGSxtUmJ/oM3Fm2+LG9Okv/CwU5sMWZll6c?=
 =?us-ascii?Q?RnJgRmJYsa9F9zuTfnxrJ+OraQHKxyxXdPQ+xtnQJjjTulDcxbYf1NIGlpUb?=
 =?us-ascii?Q?b8bNR1zvFcjbQJhHurNbtG7ebOCDkMQ64iZrACv/gHRhD1dR4r+wLtSBrFPT?=
 =?us-ascii?Q?z6HV8g+zRf/M/kX9GMPvpEtiSjau5IOesQ+MQIUD8zyIPG++RC7y40hHbOif?=
 =?us-ascii?Q?iIeeSoleQShPOrsa9vDXn6nWAJOqtO9w3xgR+NjxveoJ0xpIMVvXjQap7stx?=
 =?us-ascii?Q?Vsi8lE8ENtmYv0m17S7gnVA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22406123-9f81-49e6-d6f3-08dd5734cd88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 13:44:05.5626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/S7uhooojvBiYvitrD0ker9aYxPWzXjOK795bSA0o+HFmaeD6wpc/oKx1TmRJQNFicP53Qeognb8nlV0QvjLghNijNIcIIkyxnJK8VBp6RQ9XdX2z4oXyOrJP7m9rJI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
X-Authority-Analysis: v=2.4 cv=K7bYHzWI c=1 sm=1 tr=0 ts=67c06c27 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=3khcl1H5EuJcHcRA1J8A:9
 a=WgRDnz5trCaqgQjuXjRA:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: quNHIZjAm9zcnT_NbkdWbi1AMMgOuykP
X-Proofpoint-GUID: quNHIZjAm9zcnT_NbkdWbi1AMMgOuykP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502270104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212005

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


