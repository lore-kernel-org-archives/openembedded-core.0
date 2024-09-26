Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E549CCFA1D
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:51:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40803.1727351495139019872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 04:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9999e03b0d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q4enAt032239
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 04:51:34 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um553b1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 04:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6LlusBBoJ7esrqd9kJHJtqU0s3LV39aOG/VU2995G3pmdZ00abcZZXTq2bbAgaGMIJ1D7ckZBydMrf828n8G8b4l7rwqxhhzmZk+o+UbdGN083qtO+Qf6emFMafdIg4pcwek+VB83yeNaoRkFk0/L5JQmSqlh+7om7lNGhZxZ8C2cE7JBg8TOUCisWddODDSwu0ZOoMptHNKeqCyrMKWxXLnXr/1L6JvF0D/yZRDqvLSmZMjS2eowGPGlz7Fm/FFHfriCYLTgpsmQNnA/OiqdjSlzLHgtZuuR2DF+fZ57a/g5BkLUyKWd7MdTYxE92cRu+jr+yBZd9EYWThl3MJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePXOee85gGf41wd4WevPM1Cq4OdveZTR4OR1O6juvIc=;
 b=BeID4WpMoXYErshSEFciiZE2EqMmd99fb9P1HoaBquxzoYtu+MiXY0UpXIofzLcKKrg9OtvR7ldGGWiya8yce3v01aJ/nTsgMyPcmylp8QVRGFzassOP1cMAYPeDvUys/pP+hzv6kFhynV52rk5Ew+ofabN7nTQeUREfXdSmp0DUGbE53+UUGBerjl2xvK294SEXeksGY4RKp9XQVv/aol8N3DFZYWfwg/hFFrBZupLpice2jIw/0ySulxtdrcUCGYD85JF/Mvcu590TFjVp/ZG7qEm7She2e2tz+WnG+kWRPDDJtc0pYK2JA30Wee1mh0QYGKSs88bLnqrsmwh2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Thu, 26 Sep
 2024 11:51:31 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 11:51:30 +0000
From: yash.shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Naveen.Gowda@windriver.com
Subject: [PATCH] rust: Upgrade 1.79.0->1.80.0
Date: Thu, 26 Sep 2024 04:51:06 -0700
Message-ID: <20240926115107.2077995-1-yash.shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CP3P284CA0140.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6a::25) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 92804350-ac6c-4eb8-1be0-08dcde218f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TB5Zb31iWuqXK3j7vrl1LgmowY4FU815SHfbBsnDZ35777CIEolFQKoJScrm?=
 =?us-ascii?Q?OYX6hCl4KYQuhDLzPKyMeanbzCCFDTsa0pAHkP69ShCFABSjG0E/xWl7C21F?=
 =?us-ascii?Q?oH8CB4kN7Yf+uNrPmM/jcVDje4URUC8Vu5L3MTgeDvWmdOAvljMlflNZYfTS?=
 =?us-ascii?Q?JXANEBo7eUfODIulNiMrxy008j7HYpD6i9a+/GgyhVF4XP9ZreUI+2sSGE+/?=
 =?us-ascii?Q?laWZkHH2pjlwN8SQIxfO4xENTgbI1UZbYW6kNXsTv4izYytnGl9YuJVg0yhz?=
 =?us-ascii?Q?1oVPcvWBq0zPFjO+lgyl6dmgvDEjw/8A69/o1JGJIKT3XIaaKfEBbtN7tsSQ?=
 =?us-ascii?Q?XwCPXA6msw+sWHI3xfBdvy8QuNdtVfrFhMfmY2DnD7bSm+Tmccz6mmeRaju/?=
 =?us-ascii?Q?eV1VLpFaiP7ECIvWLV5EMNp497GPGdYy9j0B9pnKZFbiG+t9dspA8IXPyHkj?=
 =?us-ascii?Q?9s9/T1Q+uCkXhi6RVyVadbO+S3MIOIogcaA38MJlKaCyEYqwbNw7F/Bh4Z6m?=
 =?us-ascii?Q?qaJEPJJw/SI9Dvf8X+ny15KtueceHEAsxgDbOcOmM/79piyXVBhNT4geunk7?=
 =?us-ascii?Q?xvP2IQasml3JZu6l8ThyVJjAjPC/sduvppWxoCVycwiz5MFl9Eq08DGfYFkd?=
 =?us-ascii?Q?JYBKqxfQEWYnVdWnFv0gUtVhApF6RuehHuk3LUIU668e3Mn67wexc8cit3Vg?=
 =?us-ascii?Q?/Q74OEayExRP0bqsaDRLinNyyVaT6alLxENBFoBs+THUVcRxGHfLtpr9K4Zt?=
 =?us-ascii?Q?iruvxJ37qRk4mi4Nhhu+uS2qO4dFK+n/2Yep5M3Aq0/iPSP7mrc4WYuUXcZw?=
 =?us-ascii?Q?EzssEITFASooXjTt3HnS7wNjJBZia/xJUfwdH+c+1lpfuCEPTGAfRRC+mba1?=
 =?us-ascii?Q?m2Wy0l3M9h538S1N3PAskX9edWN0TFY2bD4fIpAmSEKQ13ZedkESHf1h1XaE?=
 =?us-ascii?Q?dfvcG/Uk0vP6L8dTMXjCmzQuD8k+TuEVgTknBuXqaaoj42UuAAdbjhDNImIx?=
 =?us-ascii?Q?V8iO0BpPM1sKsM5gvg8usBvOvMicVDeMrq6ZGyyjT9RBGYZWiG7I99I3YD4U?=
 =?us-ascii?Q?j3FrMSu4pDOVBAFXXt4kyxaNDJe2efgd+36mxG9NqJ7xpySWHkVbmL6Xkdmz?=
 =?us-ascii?Q?eG0QlOOgLX3RUlcfSjXW71qsdhYUcVxz6R1B6BjdFWhJnSHqSIob/IZazjht?=
 =?us-ascii?Q?b5aKx7Pu4zOWQgjotWwgS8Fqqre1vtr0oUPgfq24ApvlomGAj6pboD3fmG1H?=
 =?us-ascii?Q?gKtnDMXB4gFlH4pKVulidEwJlp8pR5PNx3j3/RBrqw/bRfb74ThYCQZBkuOj?=
 =?us-ascii?Q?ZrPRI10q0mWwyYEx+SIpTr/yaKpf2Ng4P7Aw6KJuRkBLECG0LFo37aoOGKOj?=
 =?us-ascii?Q?ZzYBIdI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?84X67oFWG4qfw82v0JB5cxFEKDLvhEL1OX7+L18WD3Gunw0sfak7hEDttWz6?=
 =?us-ascii?Q?j7bkLf62Xs1SHhWiu4MuNGPUoVnYbSzU8/oJ2wgzc0o20IPGbNFkUdhHBr8C?=
 =?us-ascii?Q?HRpEzQO58zC+r7Ofr42pyMqwzvZgObIQgwv9svveJxRIdgl93stGgB/CUXL+?=
 =?us-ascii?Q?LcUo3Ago+XoV0KLRWz7DHfsLqhUPqF/TTHSG+5lkCGMk3+P1oNI3i9yL/07q?=
 =?us-ascii?Q?2437kxWtxKVrqXG7ORuXIZXcCqShgQcVKEyKXShJNhDx68hknB5/uFiTth3O?=
 =?us-ascii?Q?akl/aohb7O/qVKmPNCobT8Dg0sECHE/MqVEC4oyzHRGxwHuE1Uc6GBNX446H?=
 =?us-ascii?Q?IWpBbH2ngeUXyQY7XwGFcHyMyDbtculCpo5JxOYIE1tRcW+6+qRc8ehQ/aCo?=
 =?us-ascii?Q?mQ/sPngIxmtqlJKKWnieIgkkc4P/QJwIJ4rzzJUTg5vJ8pn0hoQtIR2AmsIP?=
 =?us-ascii?Q?jurtbWrH5w6qnfHYHrjdoU9doXLqobJJCufZalAbu+8Hhpa36LDD8YJ9bSND?=
 =?us-ascii?Q?WpWpXtvwSxeMgydHPDN7kgwCIw5n/Vlqji+GwdmR67oTDvJIsxHGpAkhu/4P?=
 =?us-ascii?Q?TkiTc7stqVV7ROVzh9ShCv1VH3HGVNtz9prAqZ/6Y9ApqOpkuaZqJc4N/sPA?=
 =?us-ascii?Q?/TlB6XRw/LBAPTSw//cME4KkHbzrcZlaipmosEdEfOLdz/qqi03ZBVLdfBuH?=
 =?us-ascii?Q?1vLXga4xUWod8I+aJAuENcFeDWDnyD4mDQjs8l1qISLufzE1te7wrdEC7cHX?=
 =?us-ascii?Q?kcYItQYFdzp6MFBl8iU0537K/IdUtG/JS9cRd3MximOd7ZTwsxT8/AUoTOOq?=
 =?us-ascii?Q?M2bJuWL2HFoxO/8/3cMkLGkqscE6/lkHRvzsELycMd/Lbdix69H5tT/aJWLs?=
 =?us-ascii?Q?ncatr/EKvzmTiksc2kFcjAbNXswMeURf0EJvELOpzCtkzooWOtoF/LBg4NBv?=
 =?us-ascii?Q?YGkdMi9KhP47F3TzOI3W2MlXPrusG6aavGSUSrS+3Fc+KjbijJGAca14/XQd?=
 =?us-ascii?Q?0xcbSOTGag8ydjhq720xmIyYDZSEnZxzEzc9pARM9i8/jAfWak/51SxKRlD6?=
 =?us-ascii?Q?0jgQR5+t9GxPSkZIp+0GCkp97mlK0IIJifkj0U9ebjG16Z5ALECZlrQVB144?=
 =?us-ascii?Q?jHrJabHk6Uk0iN5TycXWwKZI6HF6EAjrjAYb+rFutZS3WqNSt0/C0n4CUQaM?=
 =?us-ascii?Q?ogj5NwpxXTmRjRDfGN16deWnNDElocWqIxz8L7Avjy1EnrAK20reViYVzn5M?=
 =?us-ascii?Q?ho3rabyPdpi4pW6JYHKRsJ5LKx2Lzb6hVByrSUalJu13KlxNmveFO3sbbIm/?=
 =?us-ascii?Q?YIB2ZsMJHinkCvBNsEJU4Qg4YWgqvaYXfeIMaSih8mCwBTKQBGCFsLdSKgc0?=
 =?us-ascii?Q?JJ18dHPg3ITUDt2CMnBvvaeXt0KsRABH5FZXBG2qHHc1GHJN7zu9w2nPxIwQ?=
 =?us-ascii?Q?OL9h1qK5wVy9RVHcUy/J8klLPGEV4NkgTR7XoH+942k2hWg00z/fZxmEK9fs?=
 =?us-ascii?Q?FuS4tq/9xgrp5t0qDZglQ0Qzmv/plDrTCzOjqZof1HORHvf90BmPOiwcRqVu?=
 =?us-ascii?Q?lEzayr3baDC24eRawudCtetlNQIJeOSTXJy6rh/VPwofJ+pAM/nPajNP4RpZ?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92804350-ac6c-4eb8-1be0-08dcde218f79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:51:30.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sv+OkBpCHKZvilJjGpq/06HdlhK/Y2td3YrrAGtBERVLzeZmwucPZxylVamEUSdbLNcm/CQTqBk1tAXtLREAJVMaIVIruJPNGp+lIu0FgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
X-Authority-Analysis: v=2.4 cv=Z/q+H2RA c=1 sm=1 tr=0 ts=66f54ac6 cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=ei4SEBeUAAAA:8 a=6kxRq5Nu6ERL56ps6fAA:9
 a=Ohuo-sdro4PwUcRb:21 a=ftWJbRMW6gsA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=8zIOOLb7Ym0NljyPXbuS:22
X-Proofpoint-ORIG-GUID: V_Orq4Cvm-reKlyUq59Q_nVy6MCf-wTV
X-Proofpoint-GUID: V_Orq4Cvm-reKlyUq59Q_nVy6MCf-wTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-26_04,2024-09-26_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409260080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 11:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204979

From: Sunil Dora <SunilKumar.Dora@windriver.com>

https://blog.rust-lang.org/2024/07/25/Rust-1.80.0.html

Signed-off-by: Sunil Dora <SunilKumar.Dora@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.79.0.bb =3D> cargo_1.80.0.bb} |  0
 ...epro-issue-fix-with-cc-crate-hashmap.patch | 12 +--
 ...ibstd-rs_1.79.0.bb =3D> libstd-rs_1.80.0.bb} |  0
 ....79.0.bb =3D> rust-cross-canadian_1.80.0.bb} |  0
 ...ust-llvm_1.79.0.bb =3D> rust-llvm_1.80.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.79.0.bb =3D> rust_1.80.0.bb}   |  0
 9 files changed, 47 insertions(+), 47 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.79.0.bb =3D> cargo_1.80.0.bb} (=
100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.79.0.bb =3D> libstd-rs_1.80=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.79.0.bb =3D> rust=
-cross-canadian_1.80.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.79.0.bb =3D> rust-llvm_1.80=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.79.0.bb =3D> rust_1.80.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 1d2771239e..b8f0ba2b5f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ GLIBCVERSION ?=3D "2.40%"
 LINUXLIBCVERSION ?=3D "6.10%"
 QEMUVERSION ?=3D "9.0%"
 GOVERSION ?=3D "1.22%"
-RUSTVERSION ?=3D "1.79%"
+RUSTVERSION ?=3D "1.80%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.79.0.bb b/meta/recipes-devt=
ools/rust/cargo_1.80.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.79.0.bb
rename to meta/recipes-devtools/rust/cargo_1.80.0.bb
diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-c=
rate-hashmap.patch
index 164f2eb87c..dedfbff497 100644
--- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
+++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
@@ -110,8 +110,8 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@windriv=
er.com>
 -{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e84dd98=
8ddb2b2e7dfedf6","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"3ef95bdcd79a4=
3406fdab275d8a8f45ba787876399b54df34068955ec0109e69","src/lib.rs":"71e55cf1=
8e32dab3b9feae2add4ff57932a10084cc5aad4680c12eb3a91ed124","src/parallel/asy=
nc_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85=
b45983","src/parallel/job_token.rs":"0676c3177b5be9d7ede483bf4bd45c5ca0f551=
1073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs":"aaffed5ad3dc0d28641533ab=
0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/parallel/stderr.rs":"a2d18ba=
3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src/tool.rs":"1=
72cfcbecd7c6a363ea841a48a10a75b0a01e83b83c0691107c601598b68dedf","src/windo=
ws/com.rs":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf953=
5","src/windows/find_tools.rs":"f6f391294511c376c3ce10ac2fd29967fe6f21d256d=
9575d8733c1c7cb1befde","src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d=
3d1940d47d2f531d626e9ae0c48ba49005","src/windows/registry.rs":"c521b72c825e=
8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_co=
nfig.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8"=
,"src/windows/vs_instances.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f=
9d064099840893eaa7587","src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f=
058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"f6b90b=
87f23e446284bde86749b53858c0d37b8a43515ed8d0e90b1ac8cf7771"},"package":"8cd=
6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"}
 \ No newline at end of file
 +{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e84dd98=
8ddb2b2e7dfedf6","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"0977a08e49a78=
e4065858e650a7e92151806e247b542b87cbbeee96a9177153c","src/lib.rs":"71e55cf1=
8e32dab3b9feae2add4ff57932a10084cc5aad4680c12eb3a91ed124","src/parallel/asy=
nc_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85=
b45983","src/parallel/job_token.rs":"0676c3177b5be9d7ede483bf4bd45c5ca0f551=
1073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs":"aaffed5ad3dc0d28641533ab=
0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/parallel/stderr.rs":"a2d18ba=
3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31597f34b","src/tool.rs":"1=
72cfcbecd7c6a363ea841a48a10a75b0a01e83b83c0691107c601598b68dedf","src/windo=
ws/com.rs":"be1564756c9f3ef1398eafeed7b54ba610caba28e8f6258d28a997737ebf953=
5","src/windows/find_tools.rs":"f6f391294511c376c3ce10ac2fd29967fe6f21d256d=
9575d8733c1c7cb1befde","src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d=
3d1940d47d2f531d626e9ae0c48ba49005","src/windows/registry.rs":"c521b72c825e=
8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_co=
nfig.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8"=
,"src/windows/vs_instances.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f=
9d064099840893eaa7587","src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f=
058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"f6b90b=
87f23e446284bde86749b53858c0d37b8a43515ed8d0e90b1ac8cf7771"},"package":"8cd=
6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"}
---- a/vendor/cc-1.0.92/src/command_helpers.rs
-+++ b/vendor/cc-1.0.92/src/command_helpers.rs
+--- a/vendor/cc-1.0.97/src/command_helpers.rs
++++ b/vendor/cc-1.0.97/src/command_helpers.rs
 @@ -1,11 +1,9 @@
  //! Miscellaneous helpers for running commands
=20=20
@@ -158,9 +158,9 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@windriv=
er.com>
=20=20
          match obj.parent() {
              Some(s) =3D> fs::create_dir_all(s)?,
---- a/vendor/cc-1.0.92/.cargo-checksum.json=20
-+++ b/vendor/cc-1.0.92/.cargo-checksum.json=20
+--- a/vendor/cc-1.0.97/.cargo-checksum.json=20
++++ b/vendor/cc-1.0.97/.cargo-checksum.json=20
 @@ -1 +1 @@
--{"files":{"Cargo.toml":"3874a391e743987dfdb8719b2fedf6ea9bfd83d13a465b0c1=
4cf25251f639799","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc35930a5=
a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_compiler_f=
amily.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29"=
,"src/lib.rs":"4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553160dec5=
975e","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4=
150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"0676c3177b5be9d=
7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs":"a=
affed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/paral=
lel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e3159=
7f34b","src/target_info.rs":"3e6cf011d4fe52065db2716277661342eb8ab9f2516fda=
4c551d0dc0fe0d9c87","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83250b=
253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb4326583ef=
074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3ef13=
98eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tools.rs=
":"dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6","src/w=
indows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba=
49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd44c=
9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.rs=
":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src/w=
indows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cd=
b5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e87531867977=
93bc5d7896292c408fb44c12dfed3"},"package":"2678b2e3449475e95b0aa6f9b506a28e=
61b3dc8996592b983695e8ebb58a8b41"}
+-{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf2a756cd=
a9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc35930a5=
a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_compiler_f=
amily.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29"=
,"src/lib.rs":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fdebcf=
dcda","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4=
150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c965c68=
4904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs":"b=
d9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/paral=
lel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e3159=
7f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f171648e15=
e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83250b=
253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb4326583ef=
074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3ef13=
98eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tools.rs=
":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a","src/w=
indows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba=
49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd44c=
9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.rs=
":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src/w=
indows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cd=
b5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e87531867977=
93bc5d7896292c408fb44c12dfed3"},"package":"099a5357d84c4c61eb35fc8eafa9a79a=
902c2f76911e5747ced4e032edd8d9b4"}
 \ No newline at end of file
-+{"files":{"Cargo.toml":"3874a391e743987dfdb8719b2fedf6ea9bfd83d13a465b0c1=
4cf25251f639799","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"edff7d8ad5d6f=
7064ea1ec9ec816f055f87cbe0cd8d505687a67fd544ad7eb11","src/detect_compiler_f=
amily.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29"=
,"src/lib.rs":"4b65bc0145f64942ed8f480ab93068e85620968d28de200f06553160dec5=
975e","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4=
150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"0676c3177b5be9d=
7ede483bf4bd45c5ca0f5511073e4d1c9f181a0bc83db05dc","src/parallel/mod.rs":"a=
affed5ad3dc0d28641533ab0d6f522bf34a059d4b1a239dc4d217cb5d58e232","src/paral=
lel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e3159=
7f34b","src/target_info.rs":"3e6cf011d4fe52065db2716277661342eb8ab9f2516fda=
4c551d0dc0fe0d9c87","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83250b=
253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb4326583ef=
074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3ef13=
98eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tools.rs=
":"dcaa6224a0b00298c1421ade505cec31268ee6c477d982a08ed0a3433681c3f6","src/w=
indows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba=
49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd44c=
9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.rs=
":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src/w=
indows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cd=
b5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e87531867977=
93bc5d7896292c408fb44c12dfed3"},"package":"2678b2e3449475e95b0aa6f9b506a28e=
61b3dc8996592b983695e8ebb58a8b41"}
++{"files":{"Cargo.toml":"5c15212a19ab7432d834b92cc7f6af9461c860fbaf2a756cd=
a9b6f40d7b0e845","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2ba9=
6f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a759=
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"edff7d8ad5d6f=
7064ea1ec9ec816f055f87cbe0cd8d505687a67fd544ad7eb11","src/detect_compiler_f=
amily.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a29"=
,"src/lib.rs":"d805931c886be881ed685c3f75b104e96068c4a7e51f48c9a304b3fdebcf=
dcda","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4=
150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c965c68=
4904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs":"b=
d9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/paral=
lel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e3159=
7f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f171648e15=
e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc83250b=
253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"b48a7a0efbeb24dc4ccdb4326583ef=
074e69c670330681a5be9d5c19492e5f96","src/windows/com.rs":"be1564756c9f3ef13=
98eafeed7b54ba610caba28e8f6258d28a997737ebf9535","src/windows/find_tools.rs=
":"06aaf9d6247f407cb6077c68d0c9469f64a098eda2222059e7400588e7e05f6a","src/w=
indows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48ba=
49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb=
9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd44c=
9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.rs=
":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src/w=
indows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cd=
b5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e87531867977=
93bc5d7896292c408fb44c12dfed3"},"package":"099a5357d84c4c61eb35fc8eafa9a79a=
902c2f76911e5747ced4e032edd8d9b4"}
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.80.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.79.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.80.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.79.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.79.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.79.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.80.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.79.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.80.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index e183303ed6..66d777f623 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,56 +4,56 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.78.0"
+SNAPSHOT_VERSION =3D "1.79.0"
=20
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "5173f84a07d4cc6b19f27eda746=
4999c5886232ce8e54bf61b06617635d43fb9"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "086367aa83ea8c30ce41fb6c09=
7ae6ebdc92363fb1ce8ee9f01d44cafa625f61"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "66cf114dcd8056a596bf169f=
824ff95ff1837bc065daaafdbcaa02ce92903304"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "e0450bef5537e6b0bb82872e9f8=
37c3b3f6397cc8eba6f53211481c82426e1ce"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "4ca5e9bd141b0111387ea1aa035=
5f87eb8d0da52fbc616cefa4ecde4997aa65b"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "77803cfff2ea0342f26b59eabe=
c353bc43a1791012aa70855ecfea0fb7ae76ac"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "519abf4757fbd8d7e3bb4e4c=
fdc362ded972c1d95f04675684df2d31e8c0899b"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "9c847b42b81325d25a9240e33bf=
03fa8652f5dd321ae90a9a7a58b46bf124b17"
=20
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "472230d0a04c6a2db80671549cb970=
176299817883dafbffb15c993f5aeaa909"
-SRC_URI[clippy-snapshot-i686.sha256sum] =3D "1abc63d39850194580c22f998ff14=
aade2601f7cfc2465cf68828dcfc9d5536d"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "9e5e02311853354c1540e1b4da6=
c1686616cea9d3a233c033023f36d950977c0"
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "8ba9c213e5daaf08a13c5787a4ea0d=
7ae8d1e7004126de2b8dc6a6dcd798becd"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "57bd43f363ebd399a38aa4ac3b137e=
9172706770f8b23479f9dd859c6ae779ab"
+SRC_URI[clippy-snapshot-i686.sha256sum] =3D "1d2612c829d946ca8ce32f2beacfd=
e2c5ebed1fcacb720a58fb8e7786e4c82f2"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "158294f7c424ef75d84046b573f=
225c15d531745cc79d416a18c11aa8253830e"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "4695a6eb66252d519510ca0a859803=
fff3a5041f71004404df0ccc9fbf0298d5"
=20
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "fabe8c461fb87eff8bdf784=
5fca7051c5dc6e46da4dc6b3023c90efc7d7bd918"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "d9366b69bd41673bccd761=
7c2f3fe6a1cdd478fda407c7d9fda0021e33deb825"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "9f5dc7bfd8602a594157=
d04c480fb74804a3cdd9b77f46202e289a546af7c846"
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "9f19f781cdfa51f5e8b5406=
02a6a07d45ab5f2e063a86af6177625ecf9d79358"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "354d498a8e36abe6ebd7bd8=
59c8c7e7f02b029aa1897b9b60a87e9902ebb1079"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "88eab562705d56a246a09f=
2897cbae9e37a66dc3cc2cab52c781cd78024f2b52"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "88730b1b0d9c5252e041=
ed1fc2375d7292dc45132bcc8b6214490c578de240d3"
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "f39a604e1a5a5ba1c7342c9=
d98c9952b5ba252cda4b55cc6ae7bd6fca72f3889"
=20
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "3d73d16f1b7c4aaf53e6d9ac6d0=
4586c60698b0c2c793c55585b0234f75d247d"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "f9b0d7ac6bdd26b678201d068f=
8777df5fdc7f524602f73eff54c7e8a5844892"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "4ac9958386c4225b14f8e628=
1dd64a2b00d5db32c5b336fac137c7c729df25a0"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "33bbd45416ce00f2e21073ebcef=
8668575a3955189c85a13172bf5f5750e00ef"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "2a55e97ce512c27a012720bb2a0=
cd86554c1d734b5cb91b98f58af167cc0fde1"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "1ae0bbe5835d9461a12f22d509=
787e6c11aac8335c677152a57a04f8d22cf755"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "6aa2f351bc7dccb544781f4f=
ecddb5ef67e05bb310c84e0106d968231384d9f4"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "3b9a8067e97dd269a27fe91be16=
3e046e85b47973f5d512c3368c49d332dacb1"
=20
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "271e121aa1324d37d2bd65021=
7256a792ed387af4b14df0b2757ba22dab50ee5"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "53294b52155bb320570dd125=
e58b07ee3a0cb35e47a33716b3561d1751ccc538"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "303e3533e72099d4f0a1d5=
c2f31c68ef93b3a3ef8af5d36773eac394f920fb22"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "338299628336aa97e6d2f30b5=
d3c4beaf78038f1e1347a378cbbf80d02a461ea"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "1e2ffcc41a2083be2f4733d53=
4d5ee0e05fc2ace1f21033792a4e2497cbbfbe4"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "0bceeb8dc5b48e5ea9cff67c=
dcf8488fe2afe44d7e75ca04669c7c0c2e02a0df"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "af95929af71494ee3e6988=
ead07204ea05b6f2b729cdb1ffcc26db75e47bf318"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "2295d50425ed5dfb028560ac0=
f9a611212d8deb43791a1d199419043157ab95e"
=20
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "b58d7e61fb36295ebd0a092=
42e292c7bc4fa24fc189aa285b6e266263f356316"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "5b2b621b79a7635d5670bc=
17d992f6a0bff0e153b6629fdd501a08cf0df7b126"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "117a01afab9d4c6e39bc=
32b57f8a4b9ad8d693869dde0c52fa51a6ec05eaab8b"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "45ba3091f9f17abfb01d0c0=
3c87e8de33f0a210aefbdb007905dbf6cfba8590d"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "bec32adad9f2cd1650ed24e=
e82fccf7329c68243cdef7cef1e720ccaea097dab"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "6bb12041b6171e80598c0c=
04eb7e9bd07ab4fb4d654a9289618e3288a4d2f6c8"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "3b5d53d70837d5ec942e=
c41a8da37ed932bbdc1e53f78dc54e218db458701588"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "3b144840f179114cde30789=
09370bfb6928153d0ae303ac9848622c57cee3578"
=20
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "fc3fda5412f2b1a53c6a3fe6c=
0a98864d50eac8c63e9b38383085abad6487e3b"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "44745c59092bc449b0338ab6=
788eb0b2a6d5ad382224fe1ba1017931ebb6e6dc"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "e5d0e1e532f4ca4656d971=
c4301e87cbcd571daeffd7830b1d02055f95bdaca6"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "6925c93e4b5b21e37b27aed77=
23cdd6da317eec3f06f86fb0e5be868f58ea052"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "83e28f3e02cce4a9d19841bcb=
40ec0c8ad4e9af9fb215c39876028e6e9e6baf1"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "fbc978db4be2e6fdb1dbcb3c=
a00ee54c44dafd08930738f1c6aa7ae249685a34"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "2b8af4060acb10f347c66a=
3477ae92151beba12192590ea40723dcf9b1f7f5b2"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "1b952b8cd597060ac07bbe99c=
ea382651ca6eee4ac2abe0a90303ccf2278e60e"
=20
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "59da021df10c62786d33bc6b186a7=
d1114f788bebcd09f0dd323032fad2f7f5d"
-SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "1a5542ac30cbcfb15512aba2d53b=
30dd8835058514085067bbcf7c938c05b79e"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "aee53a0a04fb44c95b9aa6217c=
5483113e1f67fa595dea6fdcbbbd72826e729b"
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "1f458a0b3b947d78d50c67b16bb68=
e8528cb71d52a7021c3b1652b5f9004c40b"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "5663e6ea018a13f1c87ac74de2678=
29952ea979fbe5f8ee5c1c3531e25d1749c"
+SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "c00bd892e0f29bbc2514f87c7521=
210ced8c175a41eee0a428e19a6ef157779f"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "d70e710a5138871e8d972f195c=
ed9f7aa639ccef23a87fa03cc527d2b9c3cd36"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "ef4b494fb7356b6e88a69b71378c0=
4ae0f4a3c264adae84c9d4f3a1314eaa2b4"
=20
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f8aacf7a101eb10dc000b8bf26de=
90a9d0ce678d02ccf70430ed20dd31ecec6b"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "b15184ba6078dd7976f06239a25=
8313a96de2677b37e4c560779cf7f261c3ee5"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "95aece42a336f237c5bac5c5d=
9aca051b7f0bd3e6a64fb3c5828e6d0d3af2e8c"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "3994971e5923716d54e4b574ce23=
8f04c4e20cda03990670f7cc3f87d36e5499"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "07fcadd27b645ad58ff4dae5ef16=
6fd730311bbae8f25f6640fe1bfd2a1f3c3c"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "3fb282ee97626e4f25c4f6faac3=
997859b89f13983dd6fa111e25182dfcb91fa"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "2c914483c0882d44af2e50a18=
1cbd2c953d672d50b31aa669ee2346cade1f108"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a04cf42022d0a5faf01c31082bfb=
1dde9c38409f0ca6da90a3e40faa03e797ae"
=20
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "c119866af24c91108d34267e248=
86ad90fd8784edfdfd0d36c64013b06974f71"
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "9c38f2cd4c19196fcf113166237=
ab03512bf19ce5a7f13c3bfe0e5cc3317eb44"
=20
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "7e158a16f733844975e65090=
b07706596401719bd3f5aca44da9f98fb3c11b04"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "f7c7a73a8e5640f9d5aca6b2=
6866b4da08cf3d3509ed1c4184309fb868acbff2"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index becaf2b8ac..a7d52d9405 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,7 +10,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "ab826e84b8d48ec6eda3370065034dea8c006f6a946d7=
8a9ba12bcb50e6d3c7a"
+SRC_URI[rust.sha256sum] =3D "0b9ca1e2e45b8a5f0b58db140af0dc92f8311faeb0ad8=
83c5b71a72c02dc6e80"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.79.0.bb b/meta/recipes-devto=
ols/rust/rust_1.80.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.79.0.bb
rename to meta/recipes-devtools/rust/rust_1.80.0.bb
--=20
2.43.0


