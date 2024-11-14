Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FCAD65C76
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 11:13:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35253.1731582806753981678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 03:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1048fc9241=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6E0QI002314
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:13:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwv4bpqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:13:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6b8SdMwxP9lcAcl12UxZ8sXC/bxNp5KcHxSPi88xpxg25oozjIXv2JNA5JPgfRz0RVqiUFSIJeWyamvNITg/XwF0AcfLu16r9QT5mjPk+NpT6JdA+02q27iWUfECiG8DLGOAfRnwyiSQp+t7rAd5IB/m6CoskWASt8FAQtWhPdvz9EDnrEaMzBNgb57JnuYtdeYRAp/iWNrq/VSC8HjhswsOrorRwsA6SdF0NRESVWF4ITwkSzQJMhH5s0zWVFvOH3QZIQK/2A1E9VIyygRFX5r0YIVV62F4m6BtHHrTijw94b3Y3lhNgS+MEnJYa+gQ+lxPgx122pqMomQdptw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/GWD8D19S/ZL9PDIi+Targi2bn8K7ddvujORbpzcNY=;
 b=jjbds/DhoFEG8IDbzB5zAsp/zNexk/3EMXxYjVGfwfGMHoKPWEDk+lGLMLpEXzUL9tYQqwCkVpxwgVfxuDmiXoVhqzZDm/RZtnXghdq672PblT/A7AT/tLRRAqCSGVwOiTVX0DSdilbxEbPuM1cwpJRTQO+ehkmTGK/ij8FoPEGJKFYzx0VLYuyeGDE0xQd9rRnT1kQiBjqMbxroeAfo2qVEBEFQMAIzq/7mXnmP/VmJE8JaB2ifONDdfDGwxUdBd+vj7HnyxM7eBwDAbHS59+yMOqL4WNe30xKRBzgdTWMkvvv94rn5h4FIjv5XY79yzuQwAox6Nw/hA373VRW2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 11:13:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 11:13:19 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust: Upgrade 1.79.0->1.80.0
Date: Thu, 14 Nov 2024 03:13:02 -0800
Message-ID: <20241114111302.2634200-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0101.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::42) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 8652f408-9077-49fa-1198-08dd049d5810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ylaCr8Jd9HqhWOig4KS25NoMQ2FGzyUmsrnXeqFRQ7ksYdkrmLlP1iTlCgCZ?=
 =?us-ascii?Q?TjDwdvD0e2L9z1EkodN9cET3TH0nZhbLm6RXfWiDgMF2lQFFZUCE436XDLxT?=
 =?us-ascii?Q?oV16UcgJNXAdiLQh12FeWTbEwZkKi/4MqnMdnjsEB+H4WPP7hTnfapaZ9B8f?=
 =?us-ascii?Q?+t1NsEPy0CK5eJCMDkvmbrmSHir65FlG7Fk2acNTDiEwY7eX/XuUR1koxo0G?=
 =?us-ascii?Q?o4U1xoq3fulRBYJkR8n+v8X7lFZJG9swaeh2LGkdZGq+e2TOR3Zvno/k7ku7?=
 =?us-ascii?Q?QwWqPDV2kgYMZ2UkrzdKhKZQlgPdmCcGoUiXESFhE39woq+qFtCtejfux9Ij?=
 =?us-ascii?Q?XfUlVQuNARuvEWTt6hfMrUQdx1Z2kd5p9eAGz4+Sr5pT699r6gJvMM/EQS7F?=
 =?us-ascii?Q?G8BOZjKlIgYHwxwxUE5jqx+NOaLdRLinZ/NqS/qt+rfYHkSUHM47dEhqkAbC?=
 =?us-ascii?Q?Tk4cK3Tv9Zgl7lA73t3FQfk+e1QFuy/T3+BETo8wwn50NoU4HUWFjdiUWcsK?=
 =?us-ascii?Q?hVy9i2kpvsF2xnjN+lVKDDVlhSgt3IHE1TgEb/3XD8F5chgCSMdNN0DQzi9o?=
 =?us-ascii?Q?zTojOOAR/LP1cQdsfCfwbPlwLDt80qvR+36F52VgCrx2HtYeoBLqjDFk8RZL?=
 =?us-ascii?Q?e6kD+EAbXDMnZD38iiAEKC7VC4az52/SfbAylF9Buxnw0cfPtkjPDVR1NiJ9?=
 =?us-ascii?Q?sfYA6navERLba6gi7MGiWAvIp3MJwaOy8OJsAYNYyrkQuRfpbPSwDTet5zYc?=
 =?us-ascii?Q?vNaGs/6MFychyeqt8fwrauLn1yn6prFYQdHirG9YFTUakSqtIswkBHcmow8N?=
 =?us-ascii?Q?CCMu7/eI9SMkI4ijlJsxZfMiABqRw60KB7Md3aY8Fz4mwoc1BUlDcYfXzFro?=
 =?us-ascii?Q?u0y+IXdrVWicDtU93Zud19VmYI6W+NwO2MLxDqcd75333O7GZeOsTNousYzN?=
 =?us-ascii?Q?tTJS10qj/hrb2Tzk2ibw94S56TbSdNwaLcgxnVh1L2QRfhOB41yTb5DCsZwS?=
 =?us-ascii?Q?k8jDd5STJ0gEJs5daXUGcfHVb2Q6ezWY3z7muN6zO92om65IdEAbeezCiSU8?=
 =?us-ascii?Q?A/6VNi/mt1VUOymji7DHWOKQKaCvGMoVckc1YcnuiHodjPwTRQM+6Us6rLZx?=
 =?us-ascii?Q?PJFoeC8kpHrbkCD04oJGmspkEpzvhHwL+cCDmZcx4Xe+4Ojq/vPXIVwYnD6b?=
 =?us-ascii?Q?YWZ8CM0cHiK0MsCToNfVVnDhtY9ear/ZEv8pHfid+qvUH7PhL4tW1xITGYXx?=
 =?us-ascii?Q?ylQGD3K2o9C/v+IncV3nE2g5g3IigdYZTuObE7n7mM3G1qhtA0/aSGtmUt/U?=
 =?us-ascii?Q?CBA19F3PkGYSScS+Qf+B7PdBrjBKpR3N0fC52Ab0kC3KZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CteyKWEYXEhiodQ+uDz+EIR3x1mmRqEmGdhk67XQMtO1RDmBOARpgNmbIIvh?=
 =?us-ascii?Q?ao+2DitN2QhQD/PolxzaBhLSF1Xq7rl4+yoZSKjFs+ebTcTdC/csi+lKt2Zm?=
 =?us-ascii?Q?Cr8qwlkQo4OaHNHgllK6ijCUdCoAmVf9EzjNASRfCQnFPYuMezVjjh99v5l6?=
 =?us-ascii?Q?w8apilT8OZzhUGXoG6mJDEsEBh1aOSKSB9ErjfbTuDjWfINeSvPRqWiVoMxj?=
 =?us-ascii?Q?pwFwsXjA/QihD8yvmMrUk5gnrNEkinnzP6QTQw5dNyg/fnsVAAgyrt0TqA7P?=
 =?us-ascii?Q?zpGHHMq2Xn3zFTt8eklJA5JTjxLfjBntknqwH+hP9bpc7A0xn715JVZmPouc?=
 =?us-ascii?Q?htUWeEhb4H0dhgRkUa9eRAn2wOLmuRFzTLoiMv/4NGCQyx2+vOFVXj5DR2Ss?=
 =?us-ascii?Q?BQBdmisO1LNQ13qb4o88YkKNMrHUp59s8/g8xWP7+njb2GZ9dcri0RAcmQW3?=
 =?us-ascii?Q?rcKFF/kY/ogz7VZs3/V1myfwXKO4jJgyp7b0mGfxvM1yFQgjcxyGg07kqGSQ?=
 =?us-ascii?Q?4oJRAxACMqdfx5NvDNyCsky5lo/hPXPNlMvUm4MMKrfIb3AFskGDuXrm8C1B?=
 =?us-ascii?Q?oot5pcqAw7Xgf4heYfucYmREa3zKIFQ8UonYjCB3vyXdxeu1vxbEcs5UrxTq?=
 =?us-ascii?Q?hnGSrgXQxr820sdV6Kgms/pPU4t/gNEYnP81Wt3U7i8FaDMYx+fAY6lYmYrw?=
 =?us-ascii?Q?H69LhwsyXJXlGoCIB/aUqxju1d+zCityoq1Y/dI9EeUp/iydqXnmEteTODuo?=
 =?us-ascii?Q?U/+1lxwNFaU6rkYnk0GaCn6Wi3Wi2pf6ux/rsJDQQFOf8vPMa1hdvdlme0vS?=
 =?us-ascii?Q?x8sHuA4IHi/Sf0UWQBGDKNAsVNLri8UUd+TaXpfQrrJnB1aATkdSGYA0hMXE?=
 =?us-ascii?Q?qJbXFL6dbSnuwBg3g5h9rozawrS7ZxElq5qZ5nbHdfC4K7pnfFjMDlpDthEo?=
 =?us-ascii?Q?CI/Ba6DSWKsHYe0y4vhRZapc87dwJ/frNt+jtbCVi9u1g9j8hlUZcQ9wl7E9?=
 =?us-ascii?Q?TsC7hj92ZCOolKbKo0hLYHItEpWz+ixNCQIJQfCS0DAfZUr58c5r/8ObWZFL?=
 =?us-ascii?Q?mmXWG9A1n407C9qwigz24rNKdU/bZ0Ro8BrMrxW//zbFLTVZcvaKYSQqUTgX?=
 =?us-ascii?Q?x57ePEmBoRIPzxgD2Wkk1fzm2OnfIZA+5lxqHwQ3BtZOFaCwDt/tuq1DzUn4?=
 =?us-ascii?Q?cV10h0vpaYirkSlCbLZropq+Qf5ij97V6JXYMD7y3Sj+kvMXGbvyfkyZQ++O?=
 =?us-ascii?Q?NkIpxIOejy5bsBnBHFKyvbJiJgPp4qMLhUMT//hEbKauxw3Tuk7hfNy3+UN7?=
 =?us-ascii?Q?oUSyakGI/yJ/QU4fPSTAykl9GgSpCrriXJR0vq7VkxDtw/+2rJJrOKy4GrQs?=
 =?us-ascii?Q?sBJIzOCPw+FxUgjCxOoW9jJWqocr3EAnMI2+2bJQ52dlYMlgF7lIimyn7v1P?=
 =?us-ascii?Q?MlLoq00s22A8+Bm1tEbQRi7WipD4xly1wte6VotPRKM+646tfTOHsCYRRXTu?=
 =?us-ascii?Q?C2q1d0vXxQpWrQN2EgdiFidWaEDIYgKqHqguu1fm8wtQzWLyjpUu6O6c0k7M?=
 =?us-ascii?Q?fhsEYc/N6tc5xKK+SWALeFFlq4hd1OB6VMKXBWj7j/NkXE+comrpQGSEkPes?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8652f408-9077-49fa-1198-08dd049d5810
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:13:19.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wRBWncbDDQABMixQkoEIZNsit0W9IVGqIESE2Z2QIoOVYriWlq93TyMoXFvFNMTLayrj6650Q6OYg+bcNzmk7JDWl/3qbxLkz8KBLZKtAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
X-Proofpoint-GUID: SmZOWfOlN0spfCAj0kTsbuldsMlQx1x5
X-Authority-Analysis: v=2.4 cv=Ke6AshYD c=1 sm=1 tr=0 ts=6735db55 cx=c_pps a=uuboLt+qr3MZZMeqEnD08g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=0eIlBT5a2oq5B04KJoYA:9 a=7wc2lIw3FX9ZhHQt:21 a=ftWJbRMW6gsA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=8zIOOLb7Ym0NljyPXbuS:22
X-Proofpoint-ORIG-GUID: SmZOWfOlN0spfCAj0kTsbuldsMlQx1x5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_03,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411140087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207150

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Update the patch files with rust v1.80.0.

The patch repro-issue-fix-with-cc-crate-hashmap.patch addresses the rust
 reprouciblity issue by correcting the way hash values are generated for
 different build paths.

https://blog.rust-lang.org/2024/07/25/Rust-1.80.0.html

Signed-off-by: Sunil Dora <SunilKumar.Dora@windriver.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../rust/{cargo_1.79.0.bb =3D> cargo_1.80.0.bb} |   0
 ...epro-issue-fix-with-cc-crate-hashmap.patch | 199 ++++--------------
 ...ibstd-rs_1.79.0.bb =3D> libstd-rs_1.80.0.bb} |   0
 ....79.0.bb =3D> rust-cross-canadian_1.80.0.bb} |   0
 ...ust-llvm_1.79.0.bb =3D> rust-llvm_1.80.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  |  78 +++----
 meta/recipes-devtools/rust/rust-source.inc    |   2 +-
 .../rust/{rust_1.79.0.bb =3D> rust_1.80.0.bb}   |   0
 9 files changed, 86 insertions(+), 195 deletions(-)
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
index b1cc8b1285..a8e2a3b6bd 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ GLIBCVERSION ?=3D "2.40%"
 LINUXLIBCVERSION ?=3D "6.10%"
 QEMUVERSION ?=3D "9.1%"
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
index 164f2eb87c..e3f57e764c 100644
--- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
+++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
@@ -1,166 +1,57 @@
-rust: reproducibility issue fix with v1.79
+rust: reproducibility issue fix with v1.80
=20
 A few crates are using the updated version of the 'cc' crate and this is c=
ausing the generated object file names containing a unique hashmap id.
-The hashmap addition to generated files is reverted here.
+By the following changes same hash values will be genarted even for diffre=
nt build paths.
=20
 Below are the links for detailed bug description & discusssion with upstre=
am rust.
-https://github.com/rust-lang/cc-rs/issues/1117
+https://github.com/rust-lang/cc-rs/pull/1277
=20
-Upstream-Status: Inappropriate [https://github.com/rust-lang/cc-rs/issues/=
1117]
+Upstream-Status: Submitted [https://github.com/rust-lang/cc-rs/pull/1277]
 Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---- a/vendor/cc-1.0.79/src/lib.rs
-+++ b/vendor/cc-1.0.79/src/lib.rs
-@@ -56,12 +56,11 @@
- #![allow(deprecated)]
- #![deny(missing_docs)]
-=20
--use std::collections::{hash_map, HashMap};
-+use std::collections::HashMap;
- use std::env;
- use std::ffi::{OsStr, OsString};
- use std::fmt::{self, Display, Formatter};
- use std::fs;
--use std::hash::Hasher;
- use std::io::{self, BufRead, BufReader, Read, Write};
- use std::path::{Component, Path, PathBuf};
- use std::process::{Child, Command, Stdio};
-@@ -1037,24 +1036,7 @@
-=20
-         let mut objects =3D Vec::new();
-         for file in self.files.iter() {
--            let obj =3D if file.has_root() {
--                // If `file` is an absolute path, prefix the `basename`
--                // with the `dirname`'s hash to ensure name uniqueness.
--                let basename =3D file
--                    .file_name()
--                    .ok_or_else(|| Error::new(ErrorKind::InvalidArgument,=
 "file_name() failure"))?
--                    .to_string_lossy();
--                let dirname =3D file
--                    .parent()
--                    .ok_or_else(|| Error::new(ErrorKind::InvalidArgument,=
 "parent() failure"))?
--                    .to_string_lossy();
--                let mut hasher =3D hash_map::DefaultHasher::new();
--                hasher.write(dirname.to_string().as_bytes());
--                dst.join(format!("{:016x}-{}", hasher.finish(), basename))
--                    .with_extension("o")
--            } else {
--                dst.join(file).with_extension("o")
--            };
-+            let obj =3D dst.join(file).with_extension("o");
-             let obj =3D if !obj.starts_with(&dst) {
-                 dst.join(obj.file_name().ok_or_else(|| {
-                     Error::new(ErrorKind::IOError, "Getting object file d=
etails failed.")
---- a/vendor/cc-1.0.79/.cargo-checksum.json
-+++ b/vendor/cc-1.0.79/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"Cargo.lock":"dddb9c49058d411a098e98dc1c06e3bc89f859a2080d96c11=
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
-\ No newline at end of file
-+{"files":{"Cargo.lock":"dddb9c49058d411a098e98dc1c06e3bc89f859a2080d96c11=
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
---- a/vendor/cc-1.0.90/src/command_helpers.rs
-+++ b/vendor/cc-1.0.90/src/command_helpers.rs
-@@ -1,11 +1,9 @@
- //! Miscellaneous helpers for running commands
-=20
- use std::{
--    collections::hash_map,
-     ffi::OsString,
-     fmt::Display,
-     fs,
--    hash::Hasher,
-     io::{self, Read, Write},
-     path::Path,
-     process::{Child, ChildStderr, Command, Stdio},
-@@ -254,32 +252,7 @@
+--- a/vendor/cc-1.0.97/src/command_helpers.rs
++++ b/vendor/cc-1.0.97/src/command_helpers.rs
+@@ -257,6 +257,7 @@
+ /// and store them in the output Object.
  pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Resu=
lt<Vec<Object>, Error> {
      let mut objects =3D Vec::with_capacity(files.len());
++    let target_substring =3D ["rustc"];
      for file in files {
--        let basename =3D file
--            .file_name()
--            .ok_or_else(|| {
--                Error::new(
--                    ErrorKind::InvalidArgument,
--                    "No file_name for object file path!",
--                )
--            })?
--            .to_string_lossy();
--        let dirname =3D file
--            .parent()
--            .ok_or_else(|| {
--                Error::new(
--                    ErrorKind::InvalidArgument,
--                    "No parent for object file path!",
--                )
--            })?
--            .to_string_lossy();
--
--        // Hash the dirname. This should prevent conflicts if we have mul=
tiple
--        // object files with the same filename in different subfolders.
--        let mut hasher =3D hash_map::DefaultHasher::new();
--        hasher.write(dirname.to_string().as_bytes());
--        let obj =3D dst
--            .join(format!("{:016x}-{}", hasher.finish(), basename))
--            .with_extension("o");
-+        let obj =3D dst.join(file).with_extension("o");
-=20
-         match obj.parent() {
-             Some(s) =3D> fs::create_dir_all(s)?,
---- a/vendor/cc-1.0.90/.cargo-checksum.json=20
-+++ b/vendor/cc-1.0.90/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e84dd98=
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
-\ No newline at end of file
-+{"files":{"Cargo.toml":"ad60f12609a272a3d052258f9521807fd627181125e84dd98=
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
-@@ -1,11 +1,9 @@
- //! Miscellaneous helpers for running commands
-=20
- use std::{
--    collections::hash_map,
-     ffi::OsString,
-     fmt::Display,
-     fs,
--    hash::Hasher,
-     io::{self, Read, Write},
-     path::Path,
-     process::{Child, ChildStderr, Command, Stdio},
-@@ -258,32 +256,7 @@
- pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Resu=
lt<Vec<Object>, Error> {
-     let mut objects =3D Vec::with_capacity(files.len());
-     for file in files {
--        let basename =3D file
--            .file_name()
--            .ok_or_else(|| {
--                Error::new(
--                    ErrorKind::InvalidArgument,
--                    "No file_name for object file path!",
--                )
--            })?
--            .to_string_lossy();
--        let dirname =3D file
--            .parent()
--            .ok_or_else(|| {
--                Error::new(
--                    ErrorKind::InvalidArgument,
--                    "No parent for object file path!",
--                )
--            })?
--            .to_string_lossy();
--
--        // Hash the dirname. This should prevent conflicts if we have mul=
tiple
--        // object files with the same filename in different subfolders.
--        let mut hasher =3D hash_map::DefaultHasher::new();
+         let basename =3D file
+             .file_name()
+@@ -277,10 +278,29 @@
+             })?
+             .to_string_lossy();
+
++        // Function to find the position of the first occurrence of the t=
arget substring
++        fn find_target_position(s: &str, targets: &[&str]) -> Option<usiz=
e> {
++            let mut pos =3D None;
++            for target in targets {
++                if let Some(index) =3D s.rfind(target) {
++                     //If a target is found and pos is None, set it
++                         if pos.is_none() || index < pos.unwrap() {
++                             pos =3D Some(index);
++                         }
++                }
++            }
++            pos
++        }
++
++        let filtered_dirname =3D if let Some(pos) =3D find_target_positio=
n(&dirname, &target_substring) {
++            dirname[pos..].to_string()  //Keep everything from the target=
 substring onwards
++        }  else {
++            dirname.to_string()  //If target substring is not found, keep=
 the original dirname
++        };
+         // Hash the dirname. This should prevent conflicts if we have mul=
tiple
+         // object files with the same filename in different subfolders.
+         let mut hasher =3D hash_map::DefaultHasher::new();
 -        hasher.write(dirname.to_string().as_bytes());
--        let obj =3D dst
--            .join(format!("{:016x}-{}", hasher.finish(), basename))
--            .with_extension("o");
-+        let obj =3D dst.join(file).with_extension("o");
-=20
-         match obj.parent() {
-             Some(s) =3D> fs::create_dir_all(s)?,
---- a/vendor/cc-1.0.92/.cargo-checksum.json=20
-+++ b/vendor/cc-1.0.92/.cargo-checksum.json=20
++        hasher.write(filtered_dirname.as_bytes());
+         let obj =3D dst
+             .join(format!("{:016x}-{}", hasher.finish(), basename))
+             .with_extension("o");
+--- a/vendor/cc-1.0.97/.cargo-checksum.json
++++ b/vendor/cc-1.0.97/.cargo-checksum.json
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
8e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"c2a9981b1c9f5=
430ac2a41f2953064f2383e4064feb281dc76915e4972d52226","src/detect_compiler_f=
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
index f0681c8776..0cd329fb49 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,7 +11,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.pa=
tch;patchdir=3D${RUSTSRC} \
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


