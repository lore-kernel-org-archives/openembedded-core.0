Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640C0C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 09:32:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.72443.1747128749238535890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 02:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=722888789e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D5WJmq029869
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 09:32:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hws8ath0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 09:32:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG0P5Meevumo/5K0IZyEJKVXr2DWIcycSgzy6xpRWk87SpIOCwUqKmjDw9OOYfqeb13t9nDCIl+PAewt4Uduv2L+3O76ggItYCqf74doWjg2YgOozANFAPw1NZqjTyGZMbYNTPsKZB2kgWMbCA2vtrV4wMZW1xOCMk3qEAwM0U6IQlfMrdgxq7axmMR+U/3q4zkzDz0s+gozOIRlyvRE9D9sHIt8HsY3Wsh7N3E8hYJvCul+6uBOUE5VHtDSXNFfyo9Nuel5oO5M6NKL9uOvY2T4Nf+ElkTvFQKzik1n+4MatFHxLG85R+Gz6nyEekoZBe38QgJptxeUbw11sgRpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R7HWzx0xc8vD1RY1zzlSmEUrkKDJXxVkl+2oMRl3h0=;
 b=e7l72I4OzXNmlw0FwmqikzcN3qvMfpF1yWWlP5bxizFXLiLzMSgMIHGdSo+bKZ4iyfRfbv+OgHL3xFMyv1i55jMGJCungCVtUnu+2kExg+PFqB3geT903WhH1HN5z0pFWwVHtQb7CJzKu98u+c2XKHA5xFEsvibMWbzR4Z7NSSaZ3h7RiO4mgiM9VFc6IBE7UCOupJt79ZA0/9uZ48RN48YfGf9ZGXPEDtWYMfiQ23m7iR8wz+WPrTpmX1QJeRS1QIh8uR+kHbdgIVr/+UgQyxQ7WBzIgu04ApRJSsOt7qP6kHk9w8tk7plRAi4j1liBK7HM9ka63Q149yinmQeFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ0PR11MB5789.namprd11.prod.outlook.com (2603:10b6:a03:424::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Tue, 13 May
 2025 09:32:23 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 09:32:23 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: re-enable the unit tests that are previously ignored
Date: Tue, 13 May 2025 02:32:08 -0700
Message-ID: <20250513093208.2326563-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ0PR11MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a026ac-74e3-43cb-2fb9-08dd9201109a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+VLNyPcNh+piE3/IgAmXwPZRA1cLxTdzEO0Twd6mTtwndDymKI360SkGIGj0?=
 =?us-ascii?Q?kv7DWQjM0e28Znar17zR5EYdnVnN60PMIpGQ8V+MFPDqN2VydHKSgUzIv4Tl?=
 =?us-ascii?Q?+LDH6X0HqCUGbYL67B5L89kWgGelcbTfo3DQOw26roAKN23hYcsLft84StdJ?=
 =?us-ascii?Q?sud+CzR6i2lBivv04pGBpd/DM1CDhl0MP6Mcr150E1SHoUyeew+mp9558yan?=
 =?us-ascii?Q?vPxUmYhI14gkheTZVPv3uLcqeLT2TtmnpsMiF8AHVJ5nUmwotXPwEcyaZyjl?=
 =?us-ascii?Q?mr+P9+NK3EPdqvtYc42tbE3hIyei2J9gAiPaNEhMPM2UgsHcEAg6S6GDJpzo?=
 =?us-ascii?Q?5zeNTRpCf9sSAsfAGOhY6LJOkCiiQhrU+drkH+Ie3h6LsKX1EkU+joB8muTh?=
 =?us-ascii?Q?0YWqIIAXbpkdTwoHzyWitnKF13DJFzWmuKsDzt9DBL3dWrMcKeGRZcVTeo9b?=
 =?us-ascii?Q?PTATsB8wk+MeM5zTTlIWWcQjutsAvbvN2kXKpu/KAS0M94u8p4gxW9pb2b3v?=
 =?us-ascii?Q?AXhwdpN9dEvuRvRLF84n0VWkN9gDS548tXY6UZLdFArsxGJOeei17UCa4zIP?=
 =?us-ascii?Q?p7p3SRQvcIg1tSLbTCZqU3mLSJQd4cJEBsv2gXPN84+T5O97hfrm/tL3eapb?=
 =?us-ascii?Q?YG4rQJIICssgc59CkaIael8FEl3Qxz0nF6qni5IYa4MVeHqggFpzyycUByZk?=
 =?us-ascii?Q?vt1s5h5gmntGxSk3d37opZA+z9y02FIpUd4AnJd4atpavAkGUX8MvAVagk1r?=
 =?us-ascii?Q?ALSSjjuo8cufAkr6yq74KlKGhC0bmIOlQGEB/t+4OIB9cbw5rarmU9udmLfN?=
 =?us-ascii?Q?8xzJtUZK8m2VXs8qop6WD/+5WzUQ7KVuV+PE4CtRpDCACMJvcsdTJ1Lz/ROv?=
 =?us-ascii?Q?txSpq+3bQ5c2gyeL8MOIPQlZT+06C3dpsgzM5C3TOU7xWlx27mkLOcb0/oTG?=
 =?us-ascii?Q?KPT0VPkBTs5kpxteq2lGK5VsxoCpXJFOyuX8keJvCovzSF57i0+PGdXc0dv/?=
 =?us-ascii?Q?glXJmia4pJ+C0S6PJ0DGwnCj8jiJnModErTcQAxhQcnqLikVAqQz5/6P8k/q?=
 =?us-ascii?Q?R1hNSGZ7oyJ+p2V6GiwRLAyzAM0ksIODLVOwBN0bkEnfKr3lxmwByBI/h4Xe?=
 =?us-ascii?Q?eaIv+s0yhWSQPtvNcE4V3u+eZ6oUfJu8c7Y4raE7DOF+bsNPdAr6KTTeOcow?=
 =?us-ascii?Q?YyVnhbGmcV0+VNwFVA5kzLiU46LsmAnWdUo3w0XVXP3lfEMiNctuZzOKYDCQ?=
 =?us-ascii?Q?VQlCtDiqg7vIGB0cwCk6tlVm5jcfNtq6EXuRtTn5S6ISoZm2wjMjklSBbpZU?=
 =?us-ascii?Q?UwiCIrS1oxWCvUR4jdILmBliy3oC5bO5QT828g7dVsyu246Qzv9kz2K6rsP+?=
 =?us-ascii?Q?WMG2lHdU5vkdcW2tfF1lmEgeStt1RBgVTzlLPC4od8904paLjn+BWS7I+dmP?=
 =?us-ascii?Q?TIGY/kWMJvxE9zTh+TTy1nOdWQtuFN3JucUJn0wmLFe5Pud5SKVFAQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VAHaQYxqecfHC39Z145JG4XEPp+vKddN7gCLldExkj1X499AzC5eO9/ZwDhM?=
 =?us-ascii?Q?Ni7LbcIQOQAHBmlbTkfJNuWVi+8QiRPWJr1V8FUdTnSgXTDvl+6RLBDjA4t+?=
 =?us-ascii?Q?2MYBzW/+bG9rd0RPjoOvDDHFfS7noQictIYDARm6vAUqf9JOfRzdLS9PaDou?=
 =?us-ascii?Q?XUFrXuou0fdBsMYp8d5wMoopa3mrT7E5G397QAC3xVrGyhzgtql6tDtiVM5j?=
 =?us-ascii?Q?UDi+qkyC/I5wiIA2NqP5qcDQJBqFi13FbMAjoywhPOBwDWlUcc360gPrFUU4?=
 =?us-ascii?Q?529CoEMEtMkeVUozy6MAXyjQY8w/pNB5EdgBiNsgXPswIHvSUjyEgcNPG7F6?=
 =?us-ascii?Q?Stu8n1ZC60RyFObLAT+e7Z14b4qJT8qjaQE6UahG+SN4QAGx8vNfm8/uZM0z?=
 =?us-ascii?Q?I2LIKCK8GZ7AusUdv9joiOmKuzIuzghHWVJktUUWTj14zBgt8RrKlaTsuxqe?=
 =?us-ascii?Q?PqrVrVr1EH8QoVvgz4xN3vL/sOc0FiZ+Yk05cG54TDETHwU3JUfYHl2QixIw?=
 =?us-ascii?Q?PHZ2Iop9gayUsj2m1b4uqBigKuOHMJ9eD4v+/+472vLo/Yzvt1XtCoE9/KXI?=
 =?us-ascii?Q?39BSdntoIpb+eDBswnrgauWbag+OQxi5ojClsFPpa8HB1WbDomwsj2VB4z5m?=
 =?us-ascii?Q?n6xP0UO7LrByM3VTT7XrUEp17NISAwVAk34J4lCWkwL1SOBjOVLajSKScH9d?=
 =?us-ascii?Q?1og1PT0a8IO7VsmdklQnLRWk2OJSGp10rDIx5snHRX6IZyo2jRu2tJGcHIHw?=
 =?us-ascii?Q?1cOo4HhVRQuBmNBdLiWP7F1jpQM0p74y3gyQsFzupMr7qcOM7g8hBfggICXz?=
 =?us-ascii?Q?LaOkrLQVo2NwBzwyeXJLckuHKE70D/P+WqXeC861WfdbHLvtDHEggGS/3FW6?=
 =?us-ascii?Q?L+41J8rFXCEO+2v4MiorQSXNuI3mT0OxFuim7/OduibJCC9BzF/FiXkvdTIw?=
 =?us-ascii?Q?14dsiCc5KS0tRmRiyl53B7ZNa+08hm+DsIMEICcrPHFf/63NeKrOTC8tT/rM?=
 =?us-ascii?Q?S/IjN1FMCoq9XoEK6lzMysbmLpu0CvldSQiSMaCGu/DEr2t5V+9ZlZJQWoNI?=
 =?us-ascii?Q?S1fBDB96cG6zcsjtmVBQQ2XrqKVreGJQNkZudizhMV7x02nwRb4zahy77MyM?=
 =?us-ascii?Q?9jCSaxVT2PAQcywIbyRyh9Fh6XvT47VodoES12fcQR3OZjN6OdBQSq0lfGiL?=
 =?us-ascii?Q?qMX6oj2IXNexBoEzkD2CLrdK4DYkye1JRJ0vxszsQOsFw0lF+6LPoztOUjqQ?=
 =?us-ascii?Q?Ydk/QYeF11hpAobmkhjj+PWjG453BQDR+GPDU8UXQSfeBtZty7jWDbw5iL4F?=
 =?us-ascii?Q?guMjmcn4JSzeAQuYExYyD3yNvWkhLqYLsDs0Cyi3EaOusgah0a4xj/smn+iI?=
 =?us-ascii?Q?wgRnrwgOALW2hNkRjxvnZ2zTmW4SxWhRN2BLHZKqYwGhJFC8+u0YA3A7xEf3?=
 =?us-ascii?Q?0BsRiK8QbDnaXsQDk049OsARZj81jEMzlNN2jbQqNtsPZiTfeq4Mg3Va/bGn?=
 =?us-ascii?Q?vKnTVz15guEA2Bg7/YaWF2lRSPecxflnK+CI2T3qetnVoqXwY2GkS77HgC8M?=
 =?us-ascii?Q?mVeZqPK44Yj9hq23+kE3YJZIq/InPtX2f7QPHJlSL+CTm5SRyVBy5tLi9ed5?=
 =?us-ascii?Q?iusia9DCZNEBCfbxX/7CENk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a026ac-74e3-43cb-2fb9-08dd9201109a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 09:32:22.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6Ql/NebTAnhJyRmMeCD/3LjtTIchCuyLFyFkKxKvVZfc4mTolTgXcrx99hyUhO+/hvlES/K01Go45+OlTrUniWxBtfajiPVuR9IwhPXCGHlz1xghx5q5/pbEVpJO2/q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5789
X-Proofpoint-ORIG-GUID: 4Wi_KU65P-x3hVZx3UHeoMoWlAOXUnZM
X-Proofpoint-GUID: 4Wi_KU65P-x3hVZx3UHeoMoWlAOXUnZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5MCBTYWx0ZWRfXzD214xtfjtg4 8ljJyFEc+tqV5YcXnU2Nguw7nvvQ9ZrgdUmH45FsjpTBmKMci5vG+XnNv3cFgk5+bMogcXrmT1T atZm4LTWeLOGL1PWDkcZUoHg1JC4dQln8dzt6kyxJVp+fHatFUhnTitgoO5MQf7k1uBqZxeP0hq
 0YRiYQTkuamKuv66yRkJsNn8njhWO2jnfeuc3bXyHHPPDjVkIG191lgWlIEOfcery1jJzGxytt8 i3UWfCSc0BJNizvDuiyDYAUrEFpcRbLEJz10p0ZVRDLgRWHQ93ejnZfxChlpI2i6YmSTTx3no8O MdU4Nz7lFNDy8EAA8hE6uqwSQnHnQDbNkPgu0YicVogUmLWbVWhpxCGPWOo/i78ayneVgssOKn3
 X8O+Ph22m3gQ2fbnDBHCt08B7ek4nznO1vjFyQ1X1K5w0YRHWqKWpI7PphOt8fux6U3qPnSq
X-Authority-Analysis: v=2.4 cv=Q+HS452a c=1 sm=1 tr=0 ts=682311ab cx=c_pps a=O5U4z+bWMBJw47+h9fOlNw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=d6cgL0oL8ZvOrpWNof8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505130090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 09:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216406

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Some unit tests were previously marked as ignored due to failures in earlier
versions of Rust. With the upgrade to Rust 1.85.1, these tests are now passing
consistently. They've been re-enabled and verified to run successfully on the
latest version.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/files/rust-oe-selftest.patch         | 44 -------------------
 1 file changed, 44 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 909bc971db..048fc3f10b 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -103,50 +103,6 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_get_mut_poison() {
      let mut m = new_poisoned_rwlock(NonCopy(10));
 
-diff --git a/library/std/src/thread/tests.rs b/library/std/src/thread/tests.rs
-index 5d6b9e94ee9..a5aacb2eb87 100644
---- a/library/std/src/thread/tests.rs
-+++ b/library/std/src/thread/tests.rs
-@@ -116,6 +116,7 @@ fn test_is_finished() {
- }
-
- #[test]
-+#[ignore]
- fn test_join_panic() {
-     match thread::spawn(move || panic!()).join() {
-         result::Result::Err(_) => (),
-@@ -218,6 +219,7 @@ fn test_simple_newsched_spawn() {
- }
-
- #[test]
-+#[ignore]
- fn test_try_panic_message_string_literal() {
-     match thread::spawn(move || {
-         panic!("static string");
-@@ -234,6 +236,7 @@ fn test_try_panic_message_string_literal() {
- }
-
- #[test]
-+#[ignore]
- fn test_try_panic_any_message_owned_str() {
-     match thread::spawn(move || {
-         panic_any("owned string".to_string());
-@@ -250,6 +253,7 @@ fn test_try_panic_any_message_owned_str() {
- }
-
- #[test]
-+#[ignore]
- fn test_try_panic_any_message_any() {
-     match thread::spawn(move || {
-         panic_any(Box::new(413u16) as Box<dyn Any + Send>);
-@@ -268,6 +272,7 @@ fn test_try_panic_any_message_any() {
- }
-
- #[test]
-+#[ignore]
- fn test_try_panic_any_message_unit_struct() {
-     struct Juju;
-
 diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
 --- a/library/test/src/tests.rs
 +++ b/library/test/src/tests.rs
-- 
2.43.0


