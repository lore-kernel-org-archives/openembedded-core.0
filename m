Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4847EC30653
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15464.1719826019984021822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=791206b30f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4616Bjiv009792
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:26:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:26:59 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4619Qwv5024370
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:26:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 09:26:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KF5mRTpx6Cm0lSq1lGsR4x66m/j5WQjch0NaTGc3akMqv5TNoqGWvCcI7Y/SGC0IGaix8G48tLA7km95cSEvzoFmCqCsKORZAt1OMUaMtZRJqjYO5Tu/C3SUQcFMCJiQycYynxHP0ZRuOKSN8fcvV3a6ErhppYdzN6I0vyEIWzOH9hxqlioxgWYO2wbR/R0v94bjio8TzmYXsG/o2KxK/G2aFT7rwOHCMY3kjxAwSzh3lXur7/w4igZhGB+hfyeXoX/4EpKURfOuB/sCUjNxfddOyPdqRn/929xyfzzhXxnjU32ohAZ08N3vQ1RzJxj8panKfJuOxzuwhtt8dS165A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yf+7P8u4sSf50MsP3wFBNj7w6J4siIrw+lGlJ/pE61E=;
 b=LWa3iYYeE0jyuJXuh02Q55ukSLHKJMgA7+FYHQtPz5scyBFL0y05zL4O7iVKTPyzDUlhAzpCLU4mtdQ2fXuQ6QijGY9CJHhD2WFslgtgoOMyU9CUJBFWnRSECMOfSoiljF9at2x1mjQFm/c91uCVTGJhe89l8AOwAeY2c8J6s36S39wEB/I+mtvVW15R6nVN0SYzhr1LHzTOIuCNA53uv8fLsEvCwYDBD7VJk0t8I3wyacJ5G3W0ZVOjuIQ37FuzxhM53kWfCiyKTJPsdl4edmg5jAhsHtCUiKejjetpv40yUeRQq4kKpfHhIZvPfFWI8VPLpi59eLxamooTb0LoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 09:26:55 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 09:26:55 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        alex.kanavin@gmail.com, alexandre.belloni@bootlin.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 3/9] rust: reproducibility issue fix with v1.76
Date: Mon,  1 Jul 2024 02:26:30 -0700
Message-ID: <20240701092639.1498856-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
References: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2362eb-f394-4a50-0c6a-08dc99aff196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h2WXQgQboyjRDn1maF42CdFIQFiwT0Wk4WnOqudvDHNqScKhSagm7A2NnyO+?=
 =?us-ascii?Q?0qNC5i5VStwAvEasYqSjvbjjGSld+qnu5h2t+rJLXdUvacGgfJV87erA6i4i?=
 =?us-ascii?Q?SYkyGcFOhrbkkC1XFATVuezzQCw9jmRaG/NTKUZmRdRPRS1arg7EYvuSkUpS?=
 =?us-ascii?Q?sHOlpjvp7/zItyiAYqeAuieLkr1H+CWwDaFuIEMyd5plzNX+Y4gkQB4q36Sr?=
 =?us-ascii?Q?veynThd2Ej8wOIfufZBKZTbSzKhVKR4KTEje0z/Edqh9ewR0/BNrfotWVIff?=
 =?us-ascii?Q?Om+6eJkBrHA+R/W8BzJdyRYTx48fsvDHobxA0TOi4nF+bp+PejWm3ma8aUX1?=
 =?us-ascii?Q?HHnBQ0PWH1IYVcpoMprNjo03Irue60D84xpH5ZKnFOfLN0DNjhOJVxEb22Xm?=
 =?us-ascii?Q?lcEFHQBwlZtlOYolZr8CPSLBFazuhCfNoWn6U/8u85/FKDD3iY7ximYV+hwT?=
 =?us-ascii?Q?qNrqQI/+1vhKrHjnoMdwY+oEXlCcs5L6z1yj2MNRHNFKsw3fw+BcMWtXQFqH?=
 =?us-ascii?Q?W/isnP0C+vll27wPANTNmSbKGZg6siogkjO6bycMTqmT9nbWU0yeYeKdwZdn?=
 =?us-ascii?Q?w9bQSdOFcGNi7fU7eW7vzVTFe+f376g1JEOg1q5y/QETUerxQCCCiBz8iMe+?=
 =?us-ascii?Q?cRf7YoVlSDvWK+mqouqn9LpkOGRjILhpnKvTPDKEk97pY50Q9humRie1n+bO?=
 =?us-ascii?Q?q+PWOxd70MqvjKnRSeRchu60vwjrSdiTPfx7o1m/Emj+Ff2672S3JJ30DGkH?=
 =?us-ascii?Q?XOTFCsVF+MjstgxE9uhyfkYmfZr7X5E8injYkPpiZ+cK2iPWTWBvOZ9WK4JM?=
 =?us-ascii?Q?Rc/Lz1y1+M+R0aroaqHc0RRlugFrup2olzhbTVUm8VwLjMpbSG3XewNCcMEg?=
 =?us-ascii?Q?zHLhjZpVBZ+UlSDFDgnIVBT25ae9o8wYRtdHL1nsEyJbwaRZUW6SlEjIMbff?=
 =?us-ascii?Q?d4A7QGK316HogNzjaKncFNzpILbHWMboJfubzcbxJhLT0JPjLwOJ1G08Ag2D?=
 =?us-ascii?Q?7DpoZfAWZ/DeOBBDl1r1Ol756bV39NcT7dW8OBahMf8PGE0b+UA0Oq7zfZn4?=
 =?us-ascii?Q?hvLhozCqtlmCPRR5h5qAZrgni5p5GsFnnkJzjXjgWpyvz0uP3HZ7Q7JBPSjl?=
 =?us-ascii?Q?MS65elWGg1ppBmnpzT59aoXB7OaTyJ7dmvrtmpcvHGLd9EuULQd5jbQv3SNq?=
 =?us-ascii?Q?Yxkrhj6wDT0i8qRJj+3DVOk0h06fSLBkRKa88vuTdt582fvOz6NZ8DkjvxEN?=
 =?us-ascii?Q?geS9L6qI1AwD3BoH3NTGrf+CMrzoLsBlr6Z4454u9OkFXo6ldykcHTLwJUQZ?=
 =?us-ascii?Q?OhqbrA49jaHJQ4Z0lbLpFNQiOKK/Qydh6YPpXHgsOAlolgBnAL4T6EbvNhQd?=
 =?us-ascii?Q?f8H00Vs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rNswyhxY7b97goaOf8l98sZqf6ujtuTQFE1x+J4fW1q6qoXu5/rkcv9n+kaw?=
 =?us-ascii?Q?Cxr6CskN+3M+RZlLXSyhDL/gm7penf1/1ZENG2DW6bEA4vqDz1BQl1/9n+IV?=
 =?us-ascii?Q?fDdf9uS/aQtC9luvKeTTxpfbxYTJahhdJTN3mlQhHmbvRlZUWCmrB0ztHwEx?=
 =?us-ascii?Q?FPDjhtwnwuE2YZpdNdO1zzpNBUexIphSYxwWNrUG3hmwpRjRDe4wsZkvrUvv?=
 =?us-ascii?Q?ciDhc58VG5oNySYluI9WJ86kUVMRrMVPbmkKbXoONnsuyioYi4/luCBQ8Rk9?=
 =?us-ascii?Q?vsVzAi3lA7LvX7gZO0haPla3t5lu5p4ifyCBMkMfPjxKlHDOOVNfW+XRcgpV?=
 =?us-ascii?Q?U9xeiX/CAPjCrE3m0voXRIf6bj14Y6vfz5le+kqaLNSvdzoO7eaE20sLnqCF?=
 =?us-ascii?Q?U7qk85b7m2AZW8fL23VL0d/VBhlrR5TaUpHjx2FEDIZTN14tvm0iMvGAEh39?=
 =?us-ascii?Q?UZfo4F40TOuopvTRQezK3it25fvBfwLuBltJHyQydglagSj/GM5MIgnZ061k?=
 =?us-ascii?Q?VUkjh/XjerBWrYdWOXo6oXskAIyByayBa+bmi1+XQlYZO75zMeSlmMZO6xpq?=
 =?us-ascii?Q?RFUT7DTtYSBDHMudeqb2YvVwMaCeEwKWqV9DcZt5lgIrEAHv8BPS+AAUl5Yj?=
 =?us-ascii?Q?5W4SGOOAzL2UaW/PAljLBVoJkFDaLp6y6Wfbri3YJuTxdjSk7re8dpwtaZFP?=
 =?us-ascii?Q?mF3qf1+db+vhP5FRai7qlsioc7kn4fjQJgpdgVMlh83oTbusQlrgbKBxYou6?=
 =?us-ascii?Q?2YfquBZ46XkJNsWjHyJ1SfZPXzvEkg86C5XoDg/1f8uDoAQ8kSOgoKbegez+?=
 =?us-ascii?Q?5+BkBABTRQoUXZ0UpZ3SaeL/sNHYy5IwMlNcQxONxRZ/ThGezNV6G4KBOtzW?=
 =?us-ascii?Q?c8c9mbpF8+7ZEFQXAcgdesBXuX1BRwHkMfruQ37tVwGiiN36gU0upqjHgUqF?=
 =?us-ascii?Q?smEM0z4adkvXDYHH8q5B2Zb2WWQt6SC/KcPCclS2dNNcgGBHp3SlkcK+QGNr?=
 =?us-ascii?Q?5ZiY0UmSM4PmKnUfUC5vctJVYHzDQh/Ev1CMt+k+nO8EpJf3DeW76XjDVG+f?=
 =?us-ascii?Q?BLAJwr5h5t5rohptmMnMcGvR2VYQM0IvwptOX4G1WHxMr6rXOEWU91s5/Umw?=
 =?us-ascii?Q?0mi5hv0k9qVOtrk/U5yaskM4uBuZEvlfQCQLhKxl43Cv620suAundLdE1JRm?=
 =?us-ascii?Q?S6qcIUO7oJt4LXofXm6WaQYHu6pSF6Da3ed6KMrKyHhhnGa0gKW/z/fu684K?=
 =?us-ascii?Q?kXXT8WjZ62EXyEzWrV0MWHIl4XLjiugzn/DT8vs/Qi9Uq7k9eKy6c2ytylwB?=
 =?us-ascii?Q?DdYM25j200a0zm/phzO/afkZ6k8DGv7DqiQRdPqMdgI/J6vXiv7VUeBRe/nZ?=
 =?us-ascii?Q?dx6NK+bikB6+W2gIpPbsVbVOuPt88HBrnHXaqC6kvzqEXgNG6Dz82ErcwSrW?=
 =?us-ascii?Q?8M5Mjd/2jCCpv9EOiEuOjG5a+ftSWGpU7bgOndbXdD/jzOq9YWIC2B7OoSBp?=
 =?us-ascii?Q?oMy/dsOVbha2VcOIEs8ZTs8xXdam5/wpO7vJdqA0t65p6Qr0fBIj5JGvGxAT?=
 =?us-ascii?Q?KUNwUAz3qcK9nmHEXlTf9NzKHbvwAQrjuCaf4TFTxQD1MoTUYwmbAPz6XDyy?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2362eb-f394-4a50-0c6a-08dc99aff196
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 09:26:53.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uL1iHRSsrTUhqvlMxXkHnwsQ3qsOI3bTuUEFe6l/bbVgYY/JtKQ8n7MWOPCE6W7PJoQX+EM4ZG50iUKLZkvJ29lRerpqHX4+iEF9ji8PUb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-Proofpoint-GUID: or8HnwRopWD7ZqMH_nOZyw3pgfoXhGd8
X-Proofpoint-ORIG-GUID: jSCy0f4vE4Fq1MR6OCDhbPxPC0cnJyPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201286

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


