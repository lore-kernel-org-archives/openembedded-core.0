Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD95C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 05:51:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4836.1718344257378808545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 22:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=689569ec74=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E4wnG0008946
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 05:50:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymcgwwsbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 05:50:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8LbrYADMdcA1BjwB48pwmmOFFo4+Lgxpav78/J1co6IOHWQEMsSN2uEOl/xlaPqSNOeiYKvMGVu1otS2ispudddLHhbNr5n47yGIlS1OI9mq2VsP5hXPTd+bIF55Ae+TPnnXRQ91BqL3fBTN8PTH14wAosXN/exT/tH7jSbbIpUXiXMuB/d7j/Cx0SOKIkgfWfVnhY43NkFi5AUhukW97nmpdmyhUam67RPOOjyJ//O8oHYiuXqoO1h9u9k8bfg5j/aDeoQkSEUqYbgqBL/UuCRzsnJTkfDJUy5kBpMg+Z2kk/J4ZZeWxT/zKRRbWV3nCogntMhMRyQZmxASxLwsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9qPwxe8B3W0CH7MhbW8i9j3+XQpLG0ZhxXoCZxvT6Q=;
 b=iYuictASWMjh1uLUtfy+nggE1fslAdaL4XZcB6wMidoOwkOwiywslCdzsslB1BLEgoEMw2lhKdQ95ivyLFQtSYy3rBWi24KXafA+wJv2fBf6nm6O83c0PPBLM+/trGAbkiSIirdeTeKxuslZzHOABJ1wlavr5Rewfh+K85ovGKJwZVi6J0gA8N1/VNmCKHmzSRh+1HwNPgShR/jrMcHaKsBABxpYiqY0w+IF0G8i2aYTRVDvYZApK23DbuGrqjXw0CEoWiWIJcLCkqi0rEJDEpzGUl2HharYx4z8K0ur2Jo02/sGkaETWDq4oAG0a1KHSKXkipMbq3KkyUvJvvMbdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 05:50:54 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 05:50:54 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 3/3] rust: reproducibility issue fix with v1.76
Date: Thu, 13 Jun 2024 22:49:59 -0700
Message-ID: <20240614054959.3184774-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614054959.3184774-1-Yash.Shinde@windriver.com>
References: <20240614054959.3184774-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c55db3-6c85-43c4-2f8d-08dc8c35f457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230035|376009|366011|1800799019|52116009|38350700009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WusUchBS/WBEpfnbfMwPGCurgw/a9XPizuiPBPCOCMNqCGQeSna8PSTWxFOj?=
 =?us-ascii?Q?PIfVCUMcYtha+cAxOhM0Cs/1jkHMnl1b3Lx3xfrFWM5BZ2aRr+P7zuKcjOy+?=
 =?us-ascii?Q?9rE7WhWBf8o8N34Tl4N+9hLeCAQvBOFV+EbPhTjmPsViwb+GlJ0pSLJh+IR2?=
 =?us-ascii?Q?Qppcbj/8TJNjhKaBfFO3pYNb8XbTsRpclnrf5TXU+rIZwX3Gx258/j0RUIz9?=
 =?us-ascii?Q?iamuL5zpXuKhBnxKdlHc/PWmqV+p0udWakzHlBp0v4PL1NSVrnMwWY8ZmS8B?=
 =?us-ascii?Q?2y8IBHqP2piP1Qf76ou+CFkrRJhYlZM3Wcq+8DPZaoOzXDCSMjLIwOTpYrxV?=
 =?us-ascii?Q?iLz8oqU1Fgd7PTq25Dt/BjxG9v5ekhFUrMxFnDwhEAikl+jbIZRJJKIYuHRy?=
 =?us-ascii?Q?hkjeyTGthSWS668zRcYFrXXJPuSOs895PUtj0ppEdq37AkhoW8rPO5x3Ljij?=
 =?us-ascii?Q?IyY0kEIZELH2gmHmjJzZGvzqaDhTnA1QaPyuMMH/yYJIJaE62n5kwQlPPbR9?=
 =?us-ascii?Q?J9jyQlUdeYLvl8qar42dTM1+UlZnnGX2hinl5+vZGDcA7cmUpsDZpggpd6BF?=
 =?us-ascii?Q?vdyXGLZq5bXqFsYYhwJaVOIN7E5ZdscSlbnjvq9If2tcKSVk0/5+Iey/tbyr?=
 =?us-ascii?Q?01HYN/x/mnO2ABX0siVFt3tiEJtQvJP4IoN0OWCD2ccglD7tKDT+fPbQPzse?=
 =?us-ascii?Q?jpPbtMUxWuKrSthCIhubvKiIZr5uGAPCVh5JKyVRyDLOrU8zU4XjFrs48kdJ?=
 =?us-ascii?Q?Jt7ZCW3mp6hT3jZVjh4cbgtNE+nZlD52orv0EAQnI85h1GCpTpOcJ6cHtTdK?=
 =?us-ascii?Q?FPbStzHZl/8Q5PA9zz+VXiO64tbSmvbo02O0NLvUyz481zh91dMNq1zfgrO1?=
 =?us-ascii?Q?Tn8KJ8gaTgQpYaV8janUCjcGXDegFpa0aedkCPoiMloAK0A6GfzzqV0wFmmL?=
 =?us-ascii?Q?iaSM0+oVajziHQlIwyKIJX6jtghX+pd1Xn0mOlb/Xlssa22H94ozWihjHvui?=
 =?us-ascii?Q?q0Dk4oLloPL7zGY0xHz8R6XPHWSDGGhkATFJpwya+o2cyRgHimieHngn3hP4?=
 =?us-ascii?Q?avfLBsT3pONkHWaBh32paxqPHXvOr2fUlyvSHqBLRBiaJ44f/u6v+xcGPBtq?=
 =?us-ascii?Q?fZYYOko2UH2co+tua7CGrH/aNG7Dd6PIATrmIHGg4hNaY7Ytl1OoU92FRvRM?=
 =?us-ascii?Q?DlBfd59YkEH80eMDPmcDhVoY0z9tue1QjR8JiNXH1MxlflJCoAHsxYvg9FlE?=
 =?us-ascii?Q?7ca+GK5+SjlBtHhPDpxUEoaQ3wCUyZ6Of5tvWFmqACHWxN9RS4oDjfgbVUPV?=
 =?us-ascii?Q?kZj5M6KOi+VxIySCiv8bnTCA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(366011)(1800799019)(52116009)(38350700009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P5dgsaVmoGS15sBzHGsBYYi4NrAAHw+GuXGSTwTxn/L0bCBcwUNYjgOcp7+k?=
 =?us-ascii?Q?m62umK4KQB/jdSrg7hiepPqR916zzGmiXPv5dwBe/xHkKDXPU3XQDIj5p9fQ?=
 =?us-ascii?Q?LTabiirW4QNefdmvzxPndUgg+viFyZctRD9yzYfHPXaDi9ky5lHMMG0Wqq1/?=
 =?us-ascii?Q?HbGF5QNLuGrlmfkZQbUdryACb7fEChYmyBwH4JiS4561tdOdga6m9/FNFvXV?=
 =?us-ascii?Q?1Rgbsns8CWdKboVP8n5ezErUdEHkxDIR894emaeDTwMAuMK/3RkE6NN3t4jo?=
 =?us-ascii?Q?4iuQnchrzE53qIpwtEOX39y3mFHPyU6ccDOu/djZ4leQD7Yy+cLp9cx9sZri?=
 =?us-ascii?Q?exo2Wkf4xSd/+/C0BePzgGZ/UbJ41Pr18+UUc3SmeajVTiNxjVcN3J3cVGvh?=
 =?us-ascii?Q?56PjswN9d2xvsZsZyefjCYlFm8epUa0EaG0a4i9vTqLIhhbTvi+uOrp49yPX?=
 =?us-ascii?Q?4ax9xKPatUry1d4Gnq4cUfcEgk/mVYGyg7MgImZDbWP6r1oFMtMBTrSYdion?=
 =?us-ascii?Q?uoUrmYFsVInTvuGFwI5HKrW++VEZkdjGwtrMDcMay1Gom2nuYO1cvLqFbkhV?=
 =?us-ascii?Q?Tfo/uv118nUv2c/WofKBpgE4UQj2ARYK7r6GABLwRWuvtrXuLAiOuDiVrV5I?=
 =?us-ascii?Q?Yr54XY2NuxO7WIZXX1fLzwCRdlcOv430ZVKPKM6qX332H4jtvLHEIzygPt9W?=
 =?us-ascii?Q?xOW9dnZQisZZAjdmTepdM3u6D9jOwPX1lW255NoXQJhV7OnZP+DsbRxcygwL?=
 =?us-ascii?Q?9wexf+8Rf1e5vyU3gVHEKJki4tBqT8CzsRsr/G97Lts0MMihu6qQkS9Xd1Zz?=
 =?us-ascii?Q?dUglFhmBgbM75NVBMYu2cdzslw+q4aOxhJgq1O+LuehE6OA++cfNnFTTueAk?=
 =?us-ascii?Q?6noszKtCrT4Sumarz2jzkoe58ltfC8mYT94r05DLYDTvp84L7LZ0HjNK90vi?=
 =?us-ascii?Q?+MEAlYPd27CmBApwjZAZGbpgN8PHsehc87i93Fh0M54cvKjfQZjttTuudccG?=
 =?us-ascii?Q?NeuRJJv0MiTzI0YIetKdPZ92oj950cRGaDunuW13E5dUjatNr/c4YQDurWQQ?=
 =?us-ascii?Q?IBO7SjkirpVhWIY0YNu8kz2dT6JXossEnhNzQoQQDjKXunQTAIdGDGSfgw9e?=
 =?us-ascii?Q?dlUkqbMGPbk+lU03ioe63HvLyKPx/3WFQYzdo07IDy9NCX1nQIP/jzDLucey?=
 =?us-ascii?Q?J3qXFM58iMs6SbgQakVXUUU7jyrNlimQJz43PCIUV1EksJY85PDhzB8lOPm3?=
 =?us-ascii?Q?RN74b7U1eC6GydD0kIdCZ+/XySOuC+vPxlqNVThZRgl9NnUglGH8WG6Rl2Qc?=
 =?us-ascii?Q?B4AKPCE0zAFnJhaAoABoIIHMKwXvz/trYhhlPoYgJAYObd30GrD5OgWkBr8K?=
 =?us-ascii?Q?HDds3GJsuCYALIzP6fTUOGoijLolp5wsvA4Q/4EJOtLEn4FKwQoAE6IFVWuN?=
 =?us-ascii?Q?Tv2evXXWONl7sp6csHu5SmZP9Qd9dC89sdGxXFcc1P2ll8ADlvZ6rIQu2ZvA?=
 =?us-ascii?Q?hKIDKFUuZMXlWcdITTVk7LvL9SpeIWS7NfkdrWlfgNid8M2+3kwNy2uuXfQ9?=
 =?us-ascii?Q?WA+xUXaBkVVyZs29Qp9wEhUJAS2z/00YACHcGVSyFiwV+OyJEfnl292U8uGZ?=
 =?us-ascii?Q?Kg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c55db3-6c85-43c4-2f8d-08dc8c35f457
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 05:50:54.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7yvsnTOhwcK1dbFbYOUGHJ+o082Z8Kj4h7yNnpMfl9/6j+IsuzJDjUfYa0k3L88jsbMOx7W3sSCA6hjNbP0lQFLEQBiYDQc6cL/w4bv0g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
X-Proofpoint-GUID: IAZUQlLfqT0cE1AESl3NUOW32pXKmQWh
X-Proofpoint-ORIG-GUID: IAZUQlLfqT0cE1AESl3NUOW32pXKmQWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406140037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 05:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200647

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


