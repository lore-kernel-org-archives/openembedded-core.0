Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D04EC27C7B
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 16:05:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15639.1718467501476021179
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 09:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6896083802=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45FG22gq014762
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 16:05:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys05w0d45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 16:05:00 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45FG50cK018387
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 16:05:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys05w0d42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 16:05:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXSUvDY14FPQ1w1ZCpLORmnMriUhDbLAbHWfySBInHcPSFtuYlRLCkvbuVokC0CP+Hg10kJJDbfKMTeZYoV7QhTNmelTE739V17gtl2f3vQgkVoIzHACXKbIPWef2ABm5usaUCS/+eJblj0/d4Hm7uqjUzRxmxlFyHYvf3WeuD4ftwZK42l7yj5wMwOWhpodha0fZXB/ZszEhKGdAj0xFa2LcKyhHc9NKWiYzfDn72fOg1DBoYt7Y7OKXodnXTb9VrttLfLtP7Xfs0gI1FxrPhlKbZVQOzOs2UwMGGK0gWlpPK/ewitb12XkpCTgFH5+/N+7qaNd05U851fu9EYakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9qPwxe8B3W0CH7MhbW8i9j3+XQpLG0ZhxXoCZxvT6Q=;
 b=dJaEQQBrIguBYyHJhADsxyN9yGZDv8+OQf/vQ/JzHkpRxV+KXWqGCZx4ugBG5UPp9WX+hkn7MTxSsQAaAsFw6iIf101XJMF0t77Cr/ksTfO7toRjFFAcoketE9DT8+EG45HS7qvYSiHPxPEzTy0O8xpSCRlvCqZyMRWIlpEDF3goGk4bTN/UouLg/za6ftoysJERwMjQ8hrE6cnMeYwZhxtXq82zWL+fU/aDpTS9CUXrl7y22gzzOQ1OmCikrWN5ZXaOOZM7mtHR5neZY6qWKH8U2O4u5m/IIKe8YU1CO3WsSX9tJ0qQPwvgYts4nfiLAvoUCYuf9JVm7diZ8DsMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7948.namprd11.prod.outlook.com (2603:10b6:930:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Sat, 15 Jun
 2024 16:04:58 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7677.027; Sat, 15 Jun 2024
 16:04:58 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, alex.kanavin@gmail.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 3/3] rust: reproducibility issue fix with v1.76
Date: Sat, 15 Jun 2024 09:04:15 -0700
Message-ID: <20240615160415.3457966-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240615160415.3457966-1-Yash.Shinde@windriver.com>
References: <20240615160415.3457966-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d1a08c-c3a5-454f-bbf3-08dc8d54e792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|366013|52116011|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?We+YEHcCL+BNByoGLqhiPkPlXZVLAr7YmwGsh1YEGNJtpmDtN+N/ZRqC0gdm?=
 =?us-ascii?Q?+BgF41m9M6xFHg9ywK0VgtV+GlazCu2KMWTVc5mlniB/C85RcQ7hfWRdYgUg?=
 =?us-ascii?Q?aPzoWfnvBH6hJlw26LjOnVN5wmCMAwRnGr2l4ba2wWBKXTCSubLnFLLdbUEB?=
 =?us-ascii?Q?rpmZgiWcaCM/iCyZ6sakAfssUyMFyeR8A0FZpUWCsy5Co9NdItaJadiIaZm+?=
 =?us-ascii?Q?QMXuF/N6sNqXUtcZRlhnZoEa6ZNfpq+JYXXom0wnh+yluB6fOjoUuzFv5IKA?=
 =?us-ascii?Q?y55W0izTjfBDAIc+trlcHU9w/1ingtiulYzbheq11lyoYhZP4KP9j/6uqOXl?=
 =?us-ascii?Q?1M/btPtKYXZkkgMKTZxUy9zShd3X+xg/YRS7PcQhqwTrNoxQBr6qHXFRClPt?=
 =?us-ascii?Q?RNSvRgrKo5ojc9P6Mdoe5D2jsxiDEj3TOspcto8rwuX7cKB1cnEUpzEiNoX4?=
 =?us-ascii?Q?tAp65CuGcpD69aoC32FmlAPhrGxrJxn88zn7Iovyv/cOaDQBej5/e5pSB1gg?=
 =?us-ascii?Q?LKguaseRMdLLbXAS2wu+Ixk69zYtLbxaLLobvepnfQVyTvehQ12EkxUwrI8v?=
 =?us-ascii?Q?f+3YCkYL58MtmjiJ8A+tYwn0Eu9S9BHgcS08ZqNH9uQX8+wFqIdcxsM8xXdP?=
 =?us-ascii?Q?9n5xCyLmShBto0hL+2yvly3YIGteh+gKkXfJX7BE1sxoCJSrWImquUaQegDH?=
 =?us-ascii?Q?nEzLJP1CIDVEmglBC0cfHz5Mzt7WDI5vI2FKL2gpZvdQiCxCmB/9DYeKi7yI?=
 =?us-ascii?Q?44bpXuYF7Pu1wSrE01xUwMNFYt5jgXk0gho78ORHHsPVtleJ+4/UezwTcC1P?=
 =?us-ascii?Q?PbBg6S/kkC9x3ylG9ngGXxkxsebb/+fZlfcpXwZbxKIt577UxExvnNvEtDY2?=
 =?us-ascii?Q?icC2TWT0jJ7V84BVOpSwSoQIJt1PH9R2SDByzmsa8JvjvV+BGWk8nhSM6jAA?=
 =?us-ascii?Q?LoWY9fROw/j8uxP/a4hTLj8QWp15ZRxtQX24urKV+1oNeAIkzVHJmExGzBfO?=
 =?us-ascii?Q?z3VpDy/1hDAGAXNx6sOQzu/E2qVWR7kgKHZumr1yaW63swsQwn/qErXsPgbt?=
 =?us-ascii?Q?m75ybtRANqga8MgiCXMo6Rgw+uwULHtGUHWAu3LuuNMu82Or1lqfW/ZgOZvc?=
 =?us-ascii?Q?W1mTU+XeI9N4s5JWIHVltKelgk2msC5PC4E0nUwsR4Ppqvis7tWndke2xlbp?=
 =?us-ascii?Q?FgoFxtsCWJ3PRuQBZf9c6XpE2RD4AEBKRHrrLfciVLVRMez3W/QZnvht08KL?=
 =?us-ascii?Q?zOHR3v0kkK88bXmAsTMJ9dwFX8BHH3YAyd8DMnwKsagYaBQ7ZmMuPFd9AXyv?=
 =?us-ascii?Q?7n92wvPk8uFx4pZs2SV6F6iU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(376011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3dH0PolYoHYfQukM+Nw7DLr/UVffGu6fbVgXzN61gRmnPUoQNL/BBUFuHIr0?=
 =?us-ascii?Q?uZ6Sh+/WZrKqbfEXksJLlsTb7yXQOM6Lkyy1JAmikugVJNa76hHyou8Wx3I6?=
 =?us-ascii?Q?WX/iZdnYScjhYa/8JqsiKzOUNTUZeDNJ8Lqsn8K80IHid7bL5es+KCxqIfxF?=
 =?us-ascii?Q?u7QLNO/Zl9AqWSVMKtgmVD4zXqyXfSZzNe5mHI5lh0wvyQFMA0gTmlALO4qG?=
 =?us-ascii?Q?SsTKbA5BK0O+mNNaUzTZui0KHQ88ylDc/7BordtKMrvrOq4qidNqwiIa7Rqb?=
 =?us-ascii?Q?mGE3G93DhQGpL5LTXOGYebR3GHSOnrWGpFgv1vJge4x7jmHlf4D5hCNlMEjJ?=
 =?us-ascii?Q?z66nITf4BM6+38JqJEuBsN8lYYYnRoctVHTT10at5Wo3G5TKpYrl5epwJpE4?=
 =?us-ascii?Q?WGflcj5AjHNC6Yl5s7A9KcR2YfKBgDLozyUlXoxi3zqYo7+bERNqfW2uCj2x?=
 =?us-ascii?Q?D3IlG7uKBrzcQyjpikM3SpXLl55n4rwIlsaqgkvD5PZ4hMzLmuJE5QQYxfwQ?=
 =?us-ascii?Q?DvsTjSOEHIVqjSiZaKPNhcvIG5+WNmFtDQms2Q1OyWv1LixpYfPvtf3icLzP?=
 =?us-ascii?Q?ldSqouE45mz8NJCEJ8BI1ghTqUImOfBsel9BH89yVCRJkDOb89qqKY9x+TAQ?=
 =?us-ascii?Q?dtoU1hOIeSOP9RIg9xsZd8THaohM/vXihEhv6AYZozbjjBhWgUEJ1QsVZWpJ?=
 =?us-ascii?Q?7B5ueo8oVUnGidUcUjOp45XajHBNHBeoBeyDjQE5jp4SehA9lb+0FOWwcJLI?=
 =?us-ascii?Q?bD+tVw3GsyqeDSZDquGS0k9WIrz5r+iuamkcjmiTdL609IXa3nKn9slPdkE/?=
 =?us-ascii?Q?qig7PqYBCt6E5YaClg6rVZn7JCMgjbS8AnoHWh4OrCe/GgTErNX7Bxz/yU3j?=
 =?us-ascii?Q?Pj/9XG5Agjgaruf/pwSiUnpWYfZlYL1D3jH0Qs1o+RpKvvyUwxfDh55+DH0r?=
 =?us-ascii?Q?dYdpw3nbyn7BR8zipuwv4NgEGx+2mZkJO2TUWJTz151k+igJAK8UTBA0Etj6?=
 =?us-ascii?Q?fbBXbFct4dipv6++Ov90YPCAwdSKjJ6UiYFPxhb//wdxybCwPlLi6KuF2MG+?=
 =?us-ascii?Q?ceBXyrK1eytCpUlisaRaLq5ekgVcHbloSYOl23zBFiAGhQg+yiAVPtZrBUQw?=
 =?us-ascii?Q?xVXcWjP5rnkOWNpYsgCXt52r+b2vu2l75yTtL9CRqWxOxqupTP4wVSJt/eN/?=
 =?us-ascii?Q?fPzLeFQVLcvFxihgHvUf+FScLX9ZY2I8ePtOnFymDUdFZEBBrdeYQrwIbNkM?=
 =?us-ascii?Q?emrJECg5f3bgJ4C7PvJiqJ4jTNyKpTepM0RWlh/9c0qxgJwOzQLKdKf0PO1X?=
 =?us-ascii?Q?qj+qRbZ7oHP1jNoDTXiYig61udF6l+0Ikxn2zIIuGqLPi3eNLIUahzkDPE+X?=
 =?us-ascii?Q?r7aMSHJoKk39QVZyqDwJri3u2GBSRmzIucCbCfORJdthsAFz1a3RPpBvnhZH?=
 =?us-ascii?Q?L693NqmhbXXVF8+BBXji32Ij9uYUxQheXkJVzXLj+9eCwcvnGswwufGAQrZ9?=
 =?us-ascii?Q?xA9rOxrHSC9jzAASK50DkIZyNyoCT6D+v+/YRJkxS+TIKLNkkhu9dJ+t+k4h?=
 =?us-ascii?Q?ShTnfbdDAIi64YEX+IvhDxTaHKgf4nOls/25GI2ZHWllQd4bCOvnTha5vzyF?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d1a08c-c3a5-454f-bbf3-08dc8d54e792
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2024 16:04:58.2385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ht49wW0DieXk/FNIzHvAEAEjgtZtO46czJDhtmvgbdYYZWBV9EzXk2QNFipzSMUGYsBNwC5tKjTJf5xDYATtgKtne7HisBSnZLZEFSXaYTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7948
X-Proofpoint-ORIG-GUID: 4Y5OeemC3iUQulNIaIZhHyj7k4A0Ppuq
X-Proofpoint-GUID: rgRGId6mEiBRJggHPXKgL4UR0eEmyepV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-15_12,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406150122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 16:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200670

From: Yash Shinde <Yash.Shinde@windriver.com>

A few crates are using the updated version of the 'cc' crate and
this is causing the generated object file names containing a unique hashmap=
 id.
The hashmap addition to generated files is reverted here.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 ...epro-issue-fix-with-cc-crate-hashmap.patch | 59 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/repro-issue-fix-with-c=
c-crate-hashmap.patch

diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-c=
rate-hashmap.patch
new file mode 100644
index 0000000000..20d7e3fc15
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
@@ -0,0 +1,59 @@
+rust: reproducibility issue fix with v1.76
+
+A few crates are using the updated version of the 'cc' crate and this is c=
ausing the generated object file names containing a unique hashmap id.
+The hashmap addition to generated files is reverted here.
+
+
+Upstream-Status: Inappropriate [patches need rework]
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+---
+--- a/vendor/cc-1.0.79/src/lib.rs
++++ b/vendor/cc-1.0.79/src/lib.rs
+@@ -56,12 +56,11 @@
+ #![allow(deprecated)]
+ #![deny(missing_docs)]
+=20
+-use std::collections::{hash_map, HashMap};
++use std::collections::HashMap;
+ use std::env;
+ use std::ffi::{OsStr, OsString};
+ use std::fmt::{self, Display, Formatter};
+ use std::fs;
+-use std::hash::Hasher;
+ use std::io::{self, BufRead, BufReader, Read, Write};
+ use std::path::{Component, Path, PathBuf};
+ use std::process::{Child, Command, Stdio};
+@@ -1037,24 +1036,7 @@
+=20
+         let mut objects =3D Vec::new();
+         for file in self.files.iter() {
+-            let obj =3D if file.has_root() {
+-                // If `file` is an absolute path, prefix the `basename`
+-                // with the `dirname`'s hash to ensure name uniqueness.
+-                let basename =3D file
+-                    .file_name()
+-                    .ok_or_else(|| Error::new(ErrorKind::InvalidArgument,=
 "file_name() failure"))?
+-                    .to_string_lossy();
+-                let dirname =3D file
+-                    .parent()
+-                    .ok_or_else(|| Error::new(ErrorKind::InvalidArgument,=
 "parent() failure"))?
+-                    .to_string_lossy();
+-                let mut hasher =3D hash_map::DefaultHasher::new();
+-                hasher.write(dirname.to_string().as_bytes());
+-                dst.join(format!("{:016x}-{}", hasher.finish(), basename))
+-                    .with_extension("o")
+-            } else {
+-                dst.join(file).with_extension("o")
+-            };
++            let obj =3D dst.join(file).with_extension("o");
+             let obj =3D if !obj.starts_with(&dst) {
+                 dst.join(obj.file_name().ok_or_else(|| {
+                     Error::new(ErrorKind::IOError, "Getting object file d=
etails failed.")
+Index: rustc-1.77.0-src/vendor/cc-1.0.79/.cargo-checksum.json
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/vendor/cc-1.0.79/.cargo-checksum.json
++++ b/vendor/cc-1.0.79/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"Cargo.lock":"dddb9c49058d411a098e98dc1c06e3bc89f859a2080d96c11=
b11aec67394bb8c","Cargo.toml":"1953a8bc4b98e351fe75917c151b1e08a46531d562ae=
bba25a90add4aadecac2","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe1=
4d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7=
b2ba96f1c7917dd6be0713f88305dbda397","README.md":"58af5106352aafa62175a90f8=
a5f25fa114028bf909220dc0735d79745999ec1","src/bin/gcc-shim.rs":"36dc4e44742=
8e73c548cc7106ca1e8f282c098463b014e13a729a44445de4880","src/com.rs":"29d0de=
e08a656ab1a4cc3e5fe24542e0fab5c1373cbc9b05059f7572cf9b8313","src/lib.rs":"1=
7a4659710aa290c4ed9c23063c7b202c5bcf2a84de33aa1f01fc6fded69a1f8","src/regis=
try.rs":"98ae2b71781acc49297e5544fa0cf059f735636f8f1338edef8dbf7232443945",=
"src/setup_config.rs":"72deaf1927c0b713fd5c2b2d5b8f0ea3a303a00fda1579427895=
cac26a94122d","src/vs_instances.rs":"2d3f8278a803b0e7052f4eeb1979b29f963dd0=
143f4458e2cb5f33c4e5f0963b","src/winapi.rs":"e128e95b2d39ae7a02f54a7e25d33c=
488c14759b9f1a50a449e10545856950c3","src/windows_registry.rs":"1f973f804b4b=
451e48ff6d98ce660355772f164dfdf79a6ae514645c7c764005","tests/cc_env.rs":"e0=
2b3b0824ad039b47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cfla=
gs.rs":"57f06eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","=
tests/cxxflags.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593c=
ade5f3371","tests/support/mod.rs":"a3c8d116973bb16066bf6ec4de5143183f97de7a=
ad085d85f8118a2eaac3e1e0","tests/test.rs":"61fb35ae6dd5cf506ada000bdd82c92e=
9f8eac9cc053b63e83d3f897436fbf8f"},"package":"50d30906286121d95be3d479533b4=
58f87493b30a4b5f79a607db8f5d11aa91f"}
+\ No newline at end of file
++{"files":{"Cargo.lock":"dddb9c49058d411a098e98dc1c06e3bc89f859a2080d96c11=
b11aec67394bb8c","Cargo.toml":"1953a8bc4b98e351fe75917c151b1e08a46531d562ae=
bba25a90add4aadecac2","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe1=
4d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7=
b2ba96f1c7917dd6be0713f88305dbda397","README.md":"58af5106352aafa62175a90f8=
a5f25fa114028bf909220dc0735d79745999ec1","src/bin/gcc-shim.rs":"36dc4e44742=
8e73c548cc7106ca1e8f282c098463b014e13a729a44445de4880","src/com.rs":"29d0de=
e08a656ab1a4cc3e5fe24542e0fab5c1373cbc9b05059f7572cf9b8313","src/lib.rs":"d=
fb36b17362e9a5b266cb19a229d982e8c0bba784b1e99769f690692b0cd5c4e","src/regis=
try.rs":"98ae2b71781acc49297e5544fa0cf059f735636f8f1338edef8dbf7232443945",=
"src/setup_config.rs":"72deaf1927c0b713fd5c2b2d5b8f0ea3a303a00fda1579427895=
cac26a94122d","src/vs_instances.rs":"2d3f8278a803b0e7052f4eeb1979b29f963dd0=
143f4458e2cb5f33c4e5f0963b","src/winapi.rs":"e128e95b2d39ae7a02f54a7e25d33c=
488c14759b9f1a50a449e10545856950c3","src/windows_registry.rs":"1f973f804b4b=
451e48ff6d98ce660355772f164dfdf79a6ae514645c7c764005","tests/cc_env.rs":"e0=
2b3b0824ad039b47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cfla=
gs.rs":"57f06eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","=
tests/cxxflags.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593c=
ade5f3371","tests/support/mod.rs":"a3c8d116973bb16066bf6ec4de5143183f97de7a=
ad085d85f8118a2eaac3e1e0","tests/test.rs":"61fb35ae6dd5cf506ada000bdd82c92e=
9f8eac9cc053b63e83d3f897436fbf8f"},"package":"50d30906286121d95be3d479533b4=
58f87493b30a4b5f79a607db8f5d11aa91f"}
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 6b7414b5c1..e68bc18c9f 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-v175.patch;patchdir=3D${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilati=
on.patch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
+            file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "805482b436442a6786d270cacbab8f00529e06141b27b=
7fb01909b97ce4f3464"
=20
--=20
2.43.0


