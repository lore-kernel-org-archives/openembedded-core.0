Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E41EC52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 10:01:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56316.1723111263607244901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 03:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89508821c1=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4789ENR5005042
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 03:01:03 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0c91est-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 03:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJgIR7Pfuvs/UXXC0LywRfpO19arLpFV71KwudbuDG0PQWf4Ph+ZSiVGf/2y4WxoVKAKZFXH38N+xzA0aywEKTGiRV1NvLJ++KPCvAqzrjiKRAIYsLG7yN84pXd8MYfjNWxnuzRNNDGSRRuUGz9WneUmqIO7GuMauEMYk8hvWxN8PxdNkIL8YTayryoxOORPn2msOpiex2Hcmz8ai60UGxVYIBA+MBc4Fuk+p3Bv71cNr1ar8l3PmMI07crIAJ9SD38KS/0Iurn8okDNi4Kyox1LmZGIdPvYXNqfnooS5qFEi+WYWpn7L1QcD0QLqJNzf5KdHhSdjXaEuMg2smClkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1paiuvCAj7eJ1SFhWRAWXpybU2jABojrGaLJyfWgsY=;
 b=UbgnAftU48IQI2Xorqq5N4HVdY1052lwQhLio/0Q7Zu9c3/ZueZO+pspsFRer3qSCdnJ8KVn5LiDhbRoDXRizS81Y07RNzBHbm/KM6l9Ks2X0KJwI72EQtNxGVyN9BN5WyBLHPg7n9uOCCKPhPHjxyXpJ6g5EeshbVJqaPLkjdBrfQUyUYJAacCGugyBymLb01cgq5C5J5fQIRUalvIqTHeKqNeYnRqQCQhRYUG2/0nXgSCXGoKXWQQYQW0G1i0i0WirjIpupo7mW+02dpDlbQjPKngZmGRyour/60a1B5ZnHJ/hrzmnA3J7m4VAdFk7oUJew32zlSFVYd6w35bWWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Thu, 8 Aug
 2024 10:01:01 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 10:01:00 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 3/7] rust: reproducibility issue fix with v1.76
Date: Thu,  8 Aug 2024 03:00:35 -0700
Message-ID: <20240808100039.2455895-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
References: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0f72c9-2c2d-4879-7169-08dcb79101d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TFl9qLWjrVqwaa5MqjQxJDoqmNEJ5qX0hDeMQqtm1QYZlsYcwuFOE8KB4WXS?=
 =?us-ascii?Q?HmDtcrMAD1agFdFfbwOWoSVaLcoTwGGRpNPO/9T6SVjMzfSjlN8DK3NApD1C?=
 =?us-ascii?Q?Jra3Zc21uC/TugnoNp8Ue5ZqJUw37mI+6ee/yEJcKIyYs6SoE/98SC5XulBM?=
 =?us-ascii?Q?wBsUPWm1wSPBB41O05X9iX8FnQK+0BEkWnBC9CX48FC4KZrRAK+yThj7TVX5?=
 =?us-ascii?Q?k7bGvZVVHnuyUn5sWAZmben41zxQTu5C/Axa0YkS4ntguNt8eJt10CfwvVeI?=
 =?us-ascii?Q?i9o5pZPl+cEyAxatyenDZMTwEqKf7/toTGuhnop0VOmGydHyzD+bPfhThHbB?=
 =?us-ascii?Q?w8VfUpYlnKVBVeAIobaonT76LEAg4ROGkXoGYjJ76BcFu3GjPvPKz8pgj8vW?=
 =?us-ascii?Q?nhgk6fT9bVIZgO/dzanBRnIZiBVgZ3l/DFnskXKa57J8b5fb2l76IBXX+SRE?=
 =?us-ascii?Q?NEpd8nUY41DTYA1WEHZiOOypXc3iVMj7xNt+xXZIYuxHrVDJ6CVo8KPJ6ItN?=
 =?us-ascii?Q?e6rMbQM+aRfrJSuLEh5skgKi30XK/LTZ9rk7dCkA7kgaNOXVTD7if7QQNMbY?=
 =?us-ascii?Q?sYqk3IH61o+X5RR5kkkwB34a7n1iPVDSMSbhYhsVVC1Hag0jMgb18wckXiYZ?=
 =?us-ascii?Q?m+42oilBgHWUwAPoSEr/uofGwQyllUz7VVFAWkspZerhwqFVd+6Q+Arg9iqE?=
 =?us-ascii?Q?xg31U80TGnfYhWF5/XodkeFNoTGnl1WaKMR311XW1YgV5Zj3iXsG8bCuLs5G?=
 =?us-ascii?Q?p6DmtBAnK7YHWXhhpuLDEvyK5dxEEcJGo1rviS+An/k+DqSDL5wBc2lsJAF1?=
 =?us-ascii?Q?8vBDjAr/v5mk0hcaF88Tj55eC8NvLp7gJ50pTXbzmEOUWMwmK6ycxAgCw92g?=
 =?us-ascii?Q?zXqL2UTIyiBCPizZQi3vpW6d9w9SwjSKOi78yuKUylioWC8HkgxngeW5Rs9l?=
 =?us-ascii?Q?7K7/bvn7cB9J+t8Q9JHwUNqr4RXvSk5EydStbp5U1fSAOUSnvKYu/+Tr3pE3?=
 =?us-ascii?Q?hKDrAxYw73l/uQbeSas+CqZvyIripMmHswc8ftYJkh7J9i6/DoqsXImwPfR8?=
 =?us-ascii?Q?KmWdqaAaPKFFJ3rkkZMF6fZDvyAl/Dq6kVH3Tsa6j9/1CwId1rdfMR7JsY4/?=
 =?us-ascii?Q?iiiXgiLL93FX62lysuKQQD3CIqRnC7IbxPVKDyKaTl0s1xPIUAJD4HvyWQ2E?=
 =?us-ascii?Q?g1mtafx5ItPvpGodOMoQtqs3PSTJbnEMaERFlzc6csK0+Z00UODrhFvs3wph?=
 =?us-ascii?Q?v0PSX4V65lnjhtgbQAn89JLG+NM5nXFyrzL3k4aGYNTaUDKaeYVGq9fbRaZW?=
 =?us-ascii?Q?r1iY7mlxUtBqX2MObQ3Ss9MjfdoHDmhhKkcPHYPBpQeGNI3nlSOjW/z7k6B0?=
 =?us-ascii?Q?/cVjKyo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JAeHP8Kg/wbGQMWIBokjCcr73GQPF+hX1k1sBxLBCBSUskSvYqBwaJPowCSN?=
 =?us-ascii?Q?auBg+qklP8uTzej0GotDEgIK/GhvmTfW/OuMKOfR0JUkIUNJHSFGOAqQEfHI?=
 =?us-ascii?Q?tCh1KoxVFIZHkvSDIyTxyZkmJ3wJBxY/M3aVlb9cYoMJuvlt6Mll6f/hgdEl?=
 =?us-ascii?Q?4yZCHRmG15qABG7LDypdI0B2MvbzgRd0UUvJ4pcSdKXf70GUjjWFHlXVukTF?=
 =?us-ascii?Q?rgMplWcUzJPFP6yOoz8QIsm8WMI6ntIyEWLIbXSZr4yn9aUDRj3GcCEbiHUp?=
 =?us-ascii?Q?Tx0oGqe5ts95kZKHSB2P2zVxh4mjTm3y+LcZPfvBR7n6DaK4FvBa2sGd50FK?=
 =?us-ascii?Q?4ud+Vw7x00wLCw7qry2JqPtOJ5WYAUN0Drsndk1Zi680Jb3z+vK3sh1IbEBf?=
 =?us-ascii?Q?MbF6W9kBEDfa/MewibhAtH8bQuM6D52d09TtjIOPLnfnTl36XVkNXgTCGZM0?=
 =?us-ascii?Q?fubS2OwHyoV/v5e7abRD4PvZM9fswCnudAqmzss+cGr+jXL2CuFq216P1o4A?=
 =?us-ascii?Q?15LudOeHwQZD7YGwwz1Yk0IXgrgcJ4gLPykGRIAAlEBbNix953LDg9+lNGan?=
 =?us-ascii?Q?bfhTFrYh1eZyoNkoZuCqo63GQgOhS53QbrJJPOty493sZ1tSwWl9Iz2tIIaJ?=
 =?us-ascii?Q?lvNh0Bhu2IQ75uwcNy6+fn+wCD88L7aPoadZ5Qs+T1uw2mdQWaqmAPHbCsxt?=
 =?us-ascii?Q?rdZ7eztBn0iJHda1eMjJQEl3L1U5Qi1olHNeEZQ1gn/S3b/dWbc2bVYw4HuF?=
 =?us-ascii?Q?Y69A8iIHj2jK+EqlqFmHbNMrMibYAmVId4u3rv3i9T4mNqJ+V7FEyocGjCwK?=
 =?us-ascii?Q?L1HtVMvm04fbmaytdwBMexu8Whjl5A4hog9HO1IU/NrrxXLamgL3LsoRoLUv?=
 =?us-ascii?Q?6QiIwRD6vf9JTVxz7ASYiMGAuoMoM9iygTqew0g8tMnPOJKHek38JjH0Sva6?=
 =?us-ascii?Q?Kh2+VfowZ3t81Pve+0ulBCD+WIwkZQ5Z95YVgtREuCHfNHb3xXnDcbNQ6zVF?=
 =?us-ascii?Q?DyvrXEk+PWLiQq/sB6tAxGgGwXYQs46Q5xMLC4ZkvXUXt3rGEfZ8RQSjtV0+?=
 =?us-ascii?Q?EMwGzhWKQcZsUtGcCYf4rLwinzYZpiTbJ2CweaQGmwSc4wRdzFP3o6SRvyJ/?=
 =?us-ascii?Q?LKhRsn2qaY6mu0qnzELPFWfOki8DTUX/T33NXeBl0KLs/bdt3CXHZQx+6pOI?=
 =?us-ascii?Q?DFG2n16xVdMYlfPa+HJcqCA2Hy+vb1Uu7lYBAIBYxTJGUi5v7Nl5S1udWbYM?=
 =?us-ascii?Q?DrwRIkbS1G+0UPngQUejAVIWf6O+g8m9W+IWt2UzhU8AUT5IX8xR8OCR0G69?=
 =?us-ascii?Q?gCpJRzq8tcDgOdghZAlJhAMZOWP2vEoRToKI0dP/safyOPdVn5o++8LtMshE?=
 =?us-ascii?Q?exLnG//k1+xzfmyvpgFTqiLh6r967f/C05n7xh2eQf1b58GvCWXH8Bjik9lJ?=
 =?us-ascii?Q?t8VrQaUT/qbjlXakiNyXsGcyD34GwNEayR5QdKnvyfIxFhxagWDWXkyyLK/H?=
 =?us-ascii?Q?aYTWXheR7EZDl+uQWlQAORlLHEZOYKI5fae7u4FKi9hPMPrV9Hejfly/Hdln?=
 =?us-ascii?Q?chxcejHcqJIssSKMS72oe/UgrUbcCn9H3U8dUaPBsadtTLDvh1a5DdquhWei?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0f72c9-2c2d-4879-7169-08dcb79101d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 10:01:00.9334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCj6LcqgmREw8ecSg2YIhKK72OOz+hfPnEleF3jsI44F6AAqy5ldLpzNEkxs9lQtI6jqBQIczv4EAy+srNrKaXEPe5sUMJPgFeTguxLdPv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
X-Proofpoint-ORIG-GUID: Vl_9TYDuYkKDHVf5gm-IffVqJmJ3mUrU
X-Proofpoint-GUID: Vl_9TYDuYkKDHVf5gm-IffVqJmJ3mUrU
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203123

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
index 0000000000..26775ef38a
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
+Upstream-Status: Inappropriate [https://github.com/rust-lang/cc-rs/issues/=
1117]
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
index ebe85a8ab1..6fe32db880 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,6 +11,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://0001-cargo-do-not-write-host-information-into-compilati=
on.patch;patchdir=3D${RUSTSRC} \
             file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.p=
atch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
+            file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "805482b436442a6786d270cacbab8f00529e06141b27b=
7fb01909b97ce4f3464"
=20
--=20
2.43.0


