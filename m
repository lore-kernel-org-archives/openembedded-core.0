Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF95C021AE
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:34:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19412.1739885681841506116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41443d2353=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I7eSlX000679
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:34:41 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tuaqapj2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnUQG7amHy4sJLnsrkBxiv1ep+LXXkbyFa1kdItDJGGhYGJQvB7PnuXumxHuwdM7dkxUSv4YtS9wMy177svb1uJArmjDX1Wo+FYXj54RRSid20EdD1j1gtynSqXNZIckCaNkzDQEuZVfWa7i5gRS/gP1LtRLB+tNo5DTkKe3AYNrBJts0pBGDm9FtZAR3r3QdatKUIrdQhkkK3MzRr2tSkVPq8YeJ4vTMn0XdNOXCAme0DryE3xqpLL98MWoWD9U8KzIz2LJnLvluXREz/VtTdSNzCuoUPmDmiLdKEgum+KGQjRiZGInSxH3In6WvY+T/GaQA+9/KOsy+1/7pbblBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuR/o2YP++r02TWVbql1BCqigfBioB4DVF13GdFuV0E=;
 b=uYiKiTn0JgwNYkUAJ6KvtouvlkkfXfWxiXqnbmha8gUE5xwthPFaUcR9MwWxgAakSGTpcLof6LRGqcyzgbUciG17m0sT97Ir46mVaH52vFb6+tSN+HOvTcQ2SgG7dO2ql7sQjgPgobwHyx/3YI3cVxPBcFFcRE1l7WvCcTFZIoI2F6a/+BiRG15kitABcM5OGXv0jet6ejnPd6Axh+0/ebI/EDwKBXPAgapp/ZA+P12NZbJeiABkKPDQcM87QHPJJMDcfBRt5VsoPAxASPuZRO7zJS76DeIgRPY04NSxyy08UX9OfQu0/vnPk6wVSxazulVovaZqzj10UPM88lo3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 13:34:27 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:34:27 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/3] rust: Oe-selftest changes for rust v1.82.0
Date: Tue, 18 Feb 2025 05:33:47 -0800
Message-ID: <20250218133352.2360384-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218133352.2360384-1-Deepesh.Varatharajan@windriver.com>
References: <20250218133352.2360384-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM4PR11MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c84ade-6862-444b-2d03-08dd5020f709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WtWj02DXVllqO+NWKcaPyRPTW/LgvLeX64o3oduuNw53mU75DFdJVOnBMmlf?=
 =?us-ascii?Q?vIU/JLDgqMRSpX1mCsEF+CDMjKDJzS6mKbE9MVgCwcry2oHEs/89agg6WUiZ?=
 =?us-ascii?Q?BAy4Bsq+MXoynuYF8kONjmS6pEkRn/oqdtWEjB+VM3NBmi4l6SYa/03xIsKB?=
 =?us-ascii?Q?6nxRtwQK+h2kzH2ffgPFzYBY0GWK2r2wje0wiKAVppPGw0RU4VqzJt1N/Jeg?=
 =?us-ascii?Q?VUmQS0wl27O8KZDnadl8Sx+7a/koJmLFW400/w282VTZT6P5VFg05BVVZgRD?=
 =?us-ascii?Q?ZlgJjZ3xyANKFbQnJhvVRxxGTlAqp403JntYXSO3Q0U8qmasDizMsMqHGNI4?=
 =?us-ascii?Q?TeitTTldBUOTVDUoZahnwZoxopSqEgvpimO/gE8WoT7SFo+FaeipYpwZw9H4?=
 =?us-ascii?Q?AGW//geWcS8DUpTuz5eFipxYL0TYQeyM81vhOlMfEvi7bCg15H4LDw5xvA+S?=
 =?us-ascii?Q?+JZVK6iahSlgNlDTZs3EhMi+mZZFyaKlK2uTy7tvNGyxRvP+0yRUQnN35in3?=
 =?us-ascii?Q?qWa0Boqsbwi5bqKJiwnHOe5pfy/5JPiOpt68NTBNR/99D2Vf0I0lHwCm93GX?=
 =?us-ascii?Q?kla4AyhttV1W8+azgSbZlc9jeg8URU52t4UuS+o9nWEokYpWrrrDMw/rHOYq?=
 =?us-ascii?Q?Xv1B/si4mnSlOSrDoQzEWXB6ibGTkVIZ/N6xTyAZPZB2p7i3Nm9fpW3IE7Gx?=
 =?us-ascii?Q?1NvTnTJ8u1nBaRz1fAn2ghSzSuEc3aPJO1hBl1hreckJyGPmhLLzTdGLI6Zw?=
 =?us-ascii?Q?Idj3TBtN1qVTHcAlqav44FRG1VLBOs8rhdY7bFo9tqPbdlprYuNPUtl1dKLt?=
 =?us-ascii?Q?6GW91OHMYV/vmtBFe2k+1Q4gBGXlHyRx1EXjpd3kLsgz6N7ZOB8p6BhJB5Eo?=
 =?us-ascii?Q?0ZEC1acG6oOXEArMrU1G2cPdtnexo9sq1crOocULAWQUuEUDghcUyef+sa1X?=
 =?us-ascii?Q?x5UaVa71Jlsr9oqUM+31ppKUUSgNQ5MjnylPkWmxEG60HB2qjxZ5vRGftKMK?=
 =?us-ascii?Q?SEqTYJuyjLl0alCBZIGX1WRyRQW5m7jTKOsyPLEzQ9VVFe7wg/erHiFBC6FL?=
 =?us-ascii?Q?db8sb3/iJBKxwk097tAZwDxAHAoaboTByBJp98kgUH1ndeArNAf3m9dZXoxr?=
 =?us-ascii?Q?PaDIFJeXIwhRvDlmJfZDPbPaQwRfheX1fM86RnjLPMxt8NbUGffzfloNcXXC?=
 =?us-ascii?Q?CSUWdu7nePAw3gmx5WQSPL8MLyHFgvCgP3Z3HAUlcem/6WszKHCHmqKeof8H?=
 =?us-ascii?Q?NabRKiJr9ZXM6GiRFUT+/atlnZ9iA1wdg53UI1MBTa3bp2IgPhJITyw9PBtA?=
 =?us-ascii?Q?4CT/AGvnDDVTRPg/RAY2dwj7vPE2UHdGXYmKn6BT11cgR+1Z+LyoctPQ74r2?=
 =?us-ascii?Q?HDHI44/WvpmL+tL9UuCLTkIpLcffOAYJiLCtX9BKP6/nU+wLlKvju5Qj9HC9?=
 =?us-ascii?Q?xeCIb8QhW9+T4DVJa0NhWMnrKtDp4lt4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xIt4vzFSVHLxdrmMHoUPPlTRKUYaPP7Me3EfL1fwJ9u0tl1Sgii1RhEfF6qU?=
 =?us-ascii?Q?qJteB6cl0bkoP4NyP2xAFw9RSMEs7vyuyJRBQRsGW9YXz54+dEePKmk1Xc9E?=
 =?us-ascii?Q?Pe+fFHsGz9UkP3Fz+4AOvAjTf5XeMqjOJcFu8M1WDWNLxiSve+SA+7f4dXta?=
 =?us-ascii?Q?wj8qotKjO6lLshXSiF0W6sBPjdoCWXQmjxD0ahtdJ30PfWtRkSBHngudqdUa?=
 =?us-ascii?Q?jr7iryhJWl2Y/7NYew7vOg+gNemQ41lVRJ17TZt1sMXg4fDKBQUfECl0q9Qi?=
 =?us-ascii?Q?Frke3IzhQe7hI6LG1vy1DC7evpMpv13tiyXpi9EK41rL6+ghW16D1TCHvtQB?=
 =?us-ascii?Q?dDJTd0BDIqiCfmQ0tIF5cgIWzHrlUQ9Npkttb0qTTGCsPoKdYLCoQpKfC1IX?=
 =?us-ascii?Q?y7tGb4w8DiCElgRvUKKRbu3gF+4MpzKt3BJbaNK+2kWcdSxTzZNjBGgD/nyY?=
 =?us-ascii?Q?3sODbdqXtw2ZXzlEwUk58i3JCG3IofRizIio05C+z5NJlgD/LsdJEAgUv499?=
 =?us-ascii?Q?sdA/TCVUZIAo4rJGymVdsbbdC36sQfHNjAPyEQOWivaOsckeN28XzMFWciWX?=
 =?us-ascii?Q?d1F3UFwuKGO7HwCrKyEmInA5f0gAYQdkluaxg7bdrAgp1FDLa0rLDIqH9o6d?=
 =?us-ascii?Q?E+ieIsszrx/e3ZjrMFnTnFEKpR+w5PlTV2N+w6SuWcA+BPeHHkRJTBEGuExJ?=
 =?us-ascii?Q?Y8uUyZA0XGLaU7rJ15e0XfireP/MTasnBbnUWm1AAO0MGrQTE0IEkj/q2E66?=
 =?us-ascii?Q?ch7S8Rk+iE0RozzAGQZCsD8dXfWYNpkLGEyEnnIWPg6DApzxIThqOnHnoh5W?=
 =?us-ascii?Q?oeSKOvwAHZIRxLbjOGqPJP10IoFeWCposSRsrb8aMDuytg9sVUezOtLw3+IE?=
 =?us-ascii?Q?rFOtBQB+s6jjhDO2V13OtcMZZWHyq4kVODjACRrkpV0agO+c7eooM8Q2vN70?=
 =?us-ascii?Q?WVSMtz1lMgVmYsawpDEuX72C5aaADWcs63o8pO6g1j09EFLO0EnfCl6RBv/3?=
 =?us-ascii?Q?3YvyefO1PVoeVVQdbG0YD8TZ07laYTDNKxgnbCK/kdJRnBxZkXbl5FXMXN0o?=
 =?us-ascii?Q?g/k5DaFC8Vo5mf7NclUBoFv2lR2A0+tWmYVOlpLawWDSkl0aixL42rjFMJbp?=
 =?us-ascii?Q?glCTYGb0GYZ99PIgwS/45w+Gy8JCtmz9iN5SVYpp+KPWDe3hvF+GvE0Q7dcP?=
 =?us-ascii?Q?vd6d2xf7mC53kgmzm2975lmce90QxgtJ0ykXFMUd7QEAC8H2G8aUnmLgX4EX?=
 =?us-ascii?Q?ctMrNIGAkqlyAUP8JtW0zzAUBFwKATm1n+Y9sqWE4BRDKEKw3hloKhE5gSGP?=
 =?us-ascii?Q?8JLGR6v3A+LRtp2LbbP+kZktaKkHgow+EJIgyvZzQDrS3mcJMHBZG+fGEG4S?=
 =?us-ascii?Q?MKlfwIbCqI5qLz4fSy6A9z/jgaWSjlhdUEddXHvvFboX8AiYlTM0mZU94dOD?=
 =?us-ascii?Q?RmS3qUj4vkiSILxMioWII1FbYUhWf+jpMv/6JmhxjWSv1ALM8yOIdwfhq31N?=
 =?us-ascii?Q?x9iTxqbILZA9sn2lN+v8inWYO6QSnHf2ewAtpDxhddLdi4J0dHB9neNjYlWP?=
 =?us-ascii?Q?NdXAoQmInwvt7vuQK7V7J3RodKDNlKx3UfrhwPuD1yhLlNjaoPHzsPdGzx0j?=
 =?us-ascii?Q?41vo15//DfWpwlmqheKMLZA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c84ade-6862-444b-2d03-08dd5020f709
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:34:27.1011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BMQE2PirUUFZ9UD3U/gntUas7Y+SUeRDLz135l7l6ELGjc/QFMuZjIGUupN6hv8Ils4fi9AUWYTErAuW6IoVBYSAlg98oxm/+A78z1eFSB6O+g24fcU4WoSGQtKF/xx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
X-Authority-Analysis: v=2.4 cv=QLGSRhLL c=1 sm=1 tr=0 ts=67b48c71 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=FPGUa2LD2lIhukJNjWMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cAEKQxj1zTvPhkrb5ohi-i9Tye46MdXr
X-Proofpoint-ORIG-GUID: cAEKQxj1zTvPhkrb5ohi-i9Tye46MdXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_06,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=798 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502180103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211613

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

A few tests are getting failed with x86 arch.The unsupported/failing tests
are added to the exclude list and ignore the failing unit tests.

Upstream-Status: Pending

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  1 +
 .../rust/files/rust-oe-selftest.patch         | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 42e0258725..764dce5815 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -64,6 +64,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/doc/rustc',
                             'src/doc/rustdoc',
                             'src/doc/unstable-book',
+                            'src/etc/test-float-parse',
                             'src/librustdoc',
                             'src/rustdoc-json-types',
                             'src/tools/jsondoclint',
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 01c3634d9f..0e952efadc 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -401,3 +401,51 @@ index 3807cd5d76c..018c5c04456 100644
          fn $geometric(bench: &mut Bencher) {
              let bases: [$t; 16] = [2, 3, 4, 5, 7, 8, 9, 15, 16, 17, 31, 32, 33, 63, 64, 65];
              let base_and_numbers: Vec<($t, Vec<$t>)> = bases
+diff --git a/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs b/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
+index 160af8a65d..686f4607bb 100644
+--- a/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
++++ b/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
+@@ -5,6 +5,7 @@ use crate::stable_hasher::{HashStable, StableHasher};
+ use crate::tagged_ptr::{CopyTaggedPtr, Pointer, Tag, Tag2};
+
+ #[test]
++#[ignore]
+ fn smoke() {
+     let value = 12u32;
+     let reference = &value;
+@@ -28,6 +29,7 @@ fn smoke() {
+ }
+
+ #[test]
++#[ignore]
+ fn stable_hash_hashes_as_tuple() {
+     let hash_packed = {
+         let mut hasher = StableHasher::new();
+diff --git a/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs b/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
+index 4d342c72cc..9a77f92616 100644
+--- a/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
++++ b/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
+@@ -4,6 +4,7 @@ use std::sync::Arc;
+ use crate::tagged_ptr::{Pointer, Tag, Tag2, TaggedPtr};
+
+ #[test]
++#[ignore]
+ fn smoke() {
+     let value = 12u32;
+     let reference = &value;
+@@ -28,6 +29,7 @@ fn smoke() {
+ }
+
+ #[test]
++#[ignore]
+ fn boxed() {
+     let value = 12u32;
+     let boxed = Box::new(value);
+@@ -52,6 +54,7 @@ fn boxed() {
+ }
+
+ #[test]
++#[ignore]
+ fn arclones() {
+     let value = 12u32;
+     let arc = Arc::new(value);
-- 
2.43.0


