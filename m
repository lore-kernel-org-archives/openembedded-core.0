Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB8DC021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:34:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19469.1739885681391517297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41443d2353=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I7eSlW000679
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:34:41 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tuaqapj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkDBfXqAggRSVdlfotNlO6gzZHA/UbRJspgC3qJkl2XEzdQUr4vasvWho2Crcu7dPzxitIhaalF8CTSlpfVmyui2UrPkeMbq9Q+pdcQw8MxSeP6kDWs4vgFWDOlDdhemJMO69QCoXTsU1WtKTFg310MXGm79GG5YSjQ4wF4DiqxjLcPJKAKiOUeJgDMgQRkuwDspcvCfGs35lEFmbyuM7T6svXKmhaqF6+n8OU1/eOcZ4cOml1eV9K3msylzUC7S370Pc/a03Nc6anK8NRKNwendD8B87VaZJhJ8z8kDNXLxTkci7L0Krl8JD1ya1Z7t1ZWe2hu7i7rZ+/fNRTAeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbgU57/tJVD4tlrTZ3rKg8w8055NeXA2CIZrOpZ6XIY=;
 b=rby+32xQHGVWS+rEaB0LKYtdTbgg+4HnGLiUFURwwRstEHaVJONKmL0BTawCI0rPmzvBTOI2FPG4pBFHJ7Sl4aZvEMhd1Mn4wQfVFtobvmQsQvwcsC5aZIRbctyCesmoA7VB9uZxqeYTKi6BjXHJAuI4r4PWZmOP5hxFl0s9H9mD/k12WO1FHd684b4YW+unlouCl61ebuxVqRF8THpFwWf76NgF3iv7QKfZE2aaJmeDhsC8+BmzLu7vId56Ct0V+O1SJjeMvEllRAwRZKlch1NFUe16II0DAGVDKvK/8STcgibZydWALJlXSaIq9hIhJ2PCAuOY3aeZNHfmBlZKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 13:34:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:34:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/3] rust: oe-selftest issue fix with v1.82
Date: Tue, 18 Feb 2025 05:33:46 -0800
Message-ID: <20250218133352.2360384-2-Deepesh.Varatharajan@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e5ed6fb-8f09-4cf2-fde6-08dd5020f538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aHQN52la37SOcRdGIaWiSi07cOPhVYoBhMaUM8Z0an6FOMHhMYUbKGhF6GFH?=
 =?us-ascii?Q?dZhwGzvQjh3hGSuPfGtsnNxYSKFcu76UuhM14atrrOcSN47NuRbGrDwrrIPK?=
 =?us-ascii?Q?FM08HNWwgAf3p+pBnAU4/dTUTsgnTcqiLrr90ikiL8DarnZUZBA7BBZHtT6c?=
 =?us-ascii?Q?mPe5Ugb01mOwp+o8ureoTzSNdW33ek+fP3pERJ4Lh1cBEXxzY+BdRuFBv7K6?=
 =?us-ascii?Q?Wn0bHNevn9VmMEN8LZvQf1SuaCQY1wpOj5OQVpVGI0qPNQgW3D1cZI2SBucp?=
 =?us-ascii?Q?phoTet3gXaUJlcTXMj7lx00j4U2KqzGLrPWAWoLrVRH+FIrFGM2nM9ku+ACt?=
 =?us-ascii?Q?iQmLXMfLdeLhortvAcI3Jj+2mtl0ShrNaKs3jOohXmeui5zmW4CG8vID+gOM?=
 =?us-ascii?Q?TNLA0pNtIof3OeUyN/qriUWq80bq3sdyySKuLnpW9eSAAxyUFnfiHqtZf2zu?=
 =?us-ascii?Q?RQOG32bQw/faRUDWOkBq4JSPkupKzaHMNFty1yPVfDHkrlBsqX5gYsjxUT4i?=
 =?us-ascii?Q?w+o3HS7pbODReknyH4h8kwav4gXYZwnrcLt+q56Pmysjmxt1rFTFOut76Z1U?=
 =?us-ascii?Q?4Y6fKVzQhv2F1BYv3i1/AxhzYUzmu2MNe4FGxR8s35+Uhn1bm3TENum2Ay1Q?=
 =?us-ascii?Q?8FFCOgBEErLv9fWDbQchQQmeN/NqVLZZwN6N5ppFK2+24j0Y2+GT6n3yeQoK?=
 =?us-ascii?Q?BGFjL6wOAftuwrybZF37KD6h40pKhTQR3cSc/4Vc56zbhxUgLHCpS7facjOf?=
 =?us-ascii?Q?CYnp6HsibPY2L/Y8LBGOv9AK8hcy8MuvfXWBBNP8mmHrncVPE+li78xGItO2?=
 =?us-ascii?Q?tSPbWBv75pdYdTvisohXXvk6YM3vexHur2acUWppvzrLLXIoeq+Vqi6C0O4D?=
 =?us-ascii?Q?eUhDbhnyF53yYM1iUAiU0Kz1JGeeq/gX4KFjWni4Iv+7cZ9YxG0KcynhT9wz?=
 =?us-ascii?Q?jZcjsQDXuGZZ+bbDXnd0XcF2VeclF6rreMVaP3kr8V5TQWadnBIXSLfq7pou?=
 =?us-ascii?Q?WWqU2176RokX8eIPbUe5UmKLXE0Gh/Y31KehWTxSAnPQi2MBaMVe+cXQNe+m?=
 =?us-ascii?Q?Lyvy9hn6HoTCpAz4mH8vpK3BGl7+vCUF5RDdWCmUcUSVQNxezAQWAhtA7Qa7?=
 =?us-ascii?Q?xV469B5pcEFyFfknkAfbCnfnsSh7GIsNGZSdhyR5mivOkpxrmXkVy6R+vuMm?=
 =?us-ascii?Q?NGoYZzXQjCOnNx0TrxV1xSANbdI51rmjtJm4eIp1j7DzV/F6NY7KTlPfFis9?=
 =?us-ascii?Q?33nGb6dbHOGJDdMbGN84GGZPHyegr9+0/jiQdE6VZvyWrf/GT5XvMwpwM0cI?=
 =?us-ascii?Q?LqOfieIku1zMAxBwQFCasgsgK+WskxXylWYrHfTF6Lj7rF3SoBHtMWUutrYO?=
 =?us-ascii?Q?+Fnk7wdO59lLqxRqR1SrmoC9TUmQP1UtGBwKGkCsRylPmfI4xg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/jLCGk9b9AR1eea61fHRmnY6dmr3tGnK2ClQzJPqrHrKg/Ll5MmmRGNSfNFe?=
 =?us-ascii?Q?+yZD5+ZAONWTq+uBlNd/PEEygLh314rNP5oe9hkLXwwdoZNNNIJ4aZqNcn6c?=
 =?us-ascii?Q?nUy4UPw6rt6uHWKuwRCRo6MAtEzH/uv88Rljg096tFzxUA3txi5K79B0sP0Y?=
 =?us-ascii?Q?Qc3SpV2RFNg9bZ84qOQ1NfPbN8TjPzjVbzC/R69CWCU4f9pOFY41taKxtvX5?=
 =?us-ascii?Q?fkGwJhxPZQ8SYJwnQO6ElqZfQcsFIq3heIIxlukcWoyI7bamy2jje4STrZ9B?=
 =?us-ascii?Q?AA5makPB2cv9KhCTcFZAaX/McblyVCA2jA9mXLq6hwKeG0tDnaG2QcfIUkUs?=
 =?us-ascii?Q?udispTbTp9LAl3DsR3KXN2VfXjJBZFMRNWDrTDQy9XnQ85H9cLdG9+mv0GeR?=
 =?us-ascii?Q?M2T/Grm/pLW9nroMlihm0jJ08D//gLoNdso0TOxvEo0vn2NopmplVuV4WxpX?=
 =?us-ascii?Q?ILqYUmrpDxrT114s7WYtRqG5nY+/1xW7TinB7OEK97c685BT4H+Mwdvwy5xb?=
 =?us-ascii?Q?dCK8xFWOYemm+wQ3M7qn76otECJsrGZv1+dYp0eHDnvTRHpVsQcNMOJ3oPXk?=
 =?us-ascii?Q?ukjU/HSKhlfZnEU7/va1wvSkgGK7F1y/HecKTqn0JHmjkYQG/7FkewNDWP+W?=
 =?us-ascii?Q?D2Suea4QMIiEVjJsril9oELaAh2TWdV/v7wQa/0hgh7offEzSa41PPxBpeB7?=
 =?us-ascii?Q?yySoLo7q0v9jMZ93vDs5N8yn8mEQ00hQkiz4S7nlQyX7dd7apDlzhnnsNjZC?=
 =?us-ascii?Q?UC/UGeWP27LkiQjqkB9j6AsIWvL5jJkGsEFvSPvGV8Ah0uS7MHvCSO578X9g?=
 =?us-ascii?Q?UMgn0OG3zuJ17XICzsJDk8gpqT/72cwI9Bs1tPYUfSejuXcoXRYNNeqGv4Ni?=
 =?us-ascii?Q?UG9A9sOcTVtBBTijzmuxmzfbuiZmac1SIyvvIxNkkqrBDXoLOfaaBElOWjZ3?=
 =?us-ascii?Q?7oLQUOq75FijKWolVAM4Lwg4fi3/qKPpEYBVvL51AwlIR7GEl59zdp1aaeda?=
 =?us-ascii?Q?tTy83zP8sbUHHSMWe3g0W8QbZh5iHw04M2UzM0ImihDHYe/Ka3P4V+ZI8zFm?=
 =?us-ascii?Q?SAYXMUUpOXqNSed0HvhhxbOmu6jaHK6VhrqMo4uPmXuJBs0jP9N1ijVfq0eD?=
 =?us-ascii?Q?IHRcpXbSCzOMjuaeNOcYPS3KeyfAYfT7Rhbi2PUe1REs7EHkNE2VxKVY7Mfe?=
 =?us-ascii?Q?UDRLjCCv75eCG6gLquK2QfkW3c904qi7L1Ydy1raCQ70hC8Mu+PBDZgYcpIm?=
 =?us-ascii?Q?zy0jhQ066C/49u1PSv9fd8vJIXTfX7DBhTruA+JqmFXSkQJxSCV4EPOeuIDT?=
 =?us-ascii?Q?udpry37kT/2nOz9/8CuLpKDplFNDGcBN5baIaAhycfJaUNjMG2dGPoNbdy1f?=
 =?us-ascii?Q?ImRbM9TxVosM/WyhSLyr+ZhOzTktkQePx5WWsoZhN9JZase8i2O/My77xhZ0?=
 =?us-ascii?Q?E61Xi6noDvPHG4kQcuGZPjvpmVvYMNcWl01bV9aQUllEg2tzrfJKZyOT8CUl?=
 =?us-ascii?Q?QGynHETJL+Wc0a4tb9ZRXL61B5T1rYjQeYzRT4FeXLU96NQ51V3W2RzcRQF5?=
 =?us-ascii?Q?ihGWN9CRiY2PDqhQGZZgt/y7GT5gHRGrtaCjPX6Umd71AjQvkcfgEJ/N5Pbf?=
 =?us-ascii?Q?sXRc5Gr5N3Cr5W/aMmKm2JU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5ed6fb-8f09-4cf2-fde6-08dd5020f538
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:34:24.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8ILxtDdRwzIDVFgDwcr9a6yvel9BTohRaZ7Z1Sd6g6//tNZr/to7T6RB8tYSehm8oghvK8imEG1byjfwpnxgINNdSWs2rK8YnDNubPZpjqZlHU1Qf6/PN9mJsml615T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
X-Authority-Analysis: v=2.4 cv=QLGSRhLL c=1 sm=1 tr=0 ts=67b48c70 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=u02PoEkyPoAnoWPh7dwA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5TqKpYVoCnBPAwCzWpODnA3yyyr9th9W
X-Proofpoint-ORIG-GUID: 5TqKpYVoCnBPAwCzWpODnA3yyyr9th9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_06,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502180103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211612

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

A new feature "Link std statically in rustc_driver" was introduced
in rust_1.82 [https://github.com/rust-lang/rust/pull/122362],and
which is causing the below failure in oe-selftest.

Running unittests src/main.rs (build/x86_64-unknown-linux-gnu/stage1-rustc/
x86_64-poky-linux-gnu/release/deps/rustc_main-92223b15c9f2d827)
uploaded ".../build/x86_64-unknown-linux-gnu/stage1-rustc/x86_64-poky-linux-gnu/
release/deps/rustc_main-92223b15c9f2d827", waiting for result
/tmp/work/test4056/rustc_main-92223b15c9f2d827: error while loading shared
libraries: librustc_driver-fb0866b1cd913c20.so: cannot open shared object file: No
such file or directory

The rustc_main binary depends on the librustc_driver-*.so file. However,
this file has not been copied to QEMU. If we manually copy the file into
QEMU and export the LD_LIBRARY_PATH, the issue does not occur. Issue
reprorted to upstream and reverted the buggy code as a workaround.

Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/rust/issues/136237]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...d-statically-in-rustc_driver-feature.patch | 199 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch

diff --git a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
new file mode 100644
index 0000000000..257883ef60
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
@@ -0,0 +1,199 @@
+rust: oe-selftest issue fix with v1.82
+
+A new feature "Link std statically in rustc_driver" was introduced 
+in rust_1.82 [https://github.com/rust-lang/rust/pull/122362],and 
+which is causing the below failure in oe-selftest.
+
+Running unittests src/main.rs (build/x86_64-unknown-linux-gnu/stage1-rustc/
+x86_64-poky-linux-gnu/release/deps/rustc_main-92223b15c9f2d827)
+uploaded ".../build/x86_64-unknown-linux-gnu/stage1-rustc/x86_64-poky-linux-gnu/
+release/deps/rustc_main-92223b15c9f2d827", waiting for result
+/tmp/work/test4056/rustc_main-92223b15c9f2d827: error while loading shared 
+libraries: librustc_driver-fb0866b1cd913c20.so: cannot open shared object file: No 
+such file or directory
+
+The rustc_main binary depends on the librustc_driver-*.so file. However, 
+this file has not been copied to QEMU. If we manually copy the file into 
+QEMU and export the LD_LIBRARY_PATH, the issue does not occur. Issue 
+reprorted to upstream and reverted the buggy code as a workaround.
+
+Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/rust/issues/136237]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+diff --git a/compiler/rustc/src/main.rs b/compiler/rustc/src/main.rs
+index e9a7397557..29766fc9d8 100644
+--- a/compiler/rustc/src/main.rs
++++ b/compiler/rustc/src/main.rs
+@@ -1,6 +1,3 @@
+-// We need this feature as it changes `dylib` linking behavior and allows us to link to `rustc_driver`.
+-#![feature(rustc_private)]
+-
+ // A note about jemalloc: rustc uses jemalloc when built for CI and
+ // distribution. The obvious way to do this is with the `#[global_allocator]`
+ // mechanism. However, for complicated reasons (see
+diff --git a/compiler/rustc_metadata/src/dependency_format.rs b/compiler/rustc_metadata/src/dependency_format.rs
+index 39fa23766b..51d86b4009 100644
+--- a/compiler/rustc_metadata/src/dependency_format.rs
++++ b/compiler/rustc_metadata/src/dependency_format.rs
+@@ -51,7 +51,7 @@
+ //! Additionally, the algorithm is geared towards finding *any* solution rather
+ //! than finding a number of solutions (there are normally quite a few).
+
+-use rustc_data_structures::fx::{FxHashMap, FxHashSet};
++use rustc_data_structures::fx::FxHashMap;
+ use rustc_hir::def_id::CrateNum;
+ use rustc_middle::bug;
+ use rustc_middle::middle::dependency_format::{Dependencies, DependencyList, Linkage};
+@@ -162,43 +162,18 @@ fn calculate_type(tcx: TyCtxt<'_>, ty: CrateType) -> DependencyList {
+         Linkage::Dynamic | Linkage::IncludedFromDylib => {}
+     }
+
+-    let all_dylibs = || {
+-        tcx.crates(()).iter().filter(|&&cnum| {
+-            !tcx.dep_kind(cnum).macros_only() && tcx.used_crate_source(cnum).dylib.is_some()
+-        })
+-    };
+-
+-    let mut upstream_in_dylibs = FxHashSet::default();
+-
+-    if tcx.features().rustc_private {
+-        // We need this to prevent users of `rustc_driver` from linking dynamically to `std`
+-        // which does not work as `std` is also statically linked into `rustc_driver`.
+-
+-        // Find all libraries statically linked to upstream dylibs.
+-        for &cnum in all_dylibs() {
+-            let deps = tcx.dylib_dependency_formats(cnum);
+-            for &(depnum, style) in deps.iter() {
+-                if let RequireStatic = style {
+-                    upstream_in_dylibs.insert(depnum);
+-                }
+-            }
+-        }
+-    }
+-
+     let mut formats = FxHashMap::default();
+
+     // Sweep all crates for found dylibs. Add all dylibs, as well as their
+     // dependencies, ensuring there are no conflicts. The only valid case for a
+     // dependency to be relied upon twice is for both cases to rely on a dylib.
+-    for &cnum in all_dylibs() {
+-        if upstream_in_dylibs.contains(&cnum) {
+-            info!("skipping dylib: {}", tcx.crate_name(cnum));
+-            // If this dylib is also available statically linked to another dylib
+-            // we try to use that instead.
++    for &cnum in tcx.crates(()).iter() {
++        if tcx.dep_kind(cnum).macros_only() {
+             continue;
+         }
+-
+         let name = tcx.crate_name(cnum);
++        let src = tcx.used_crate_source(cnum);
++        if src.dylib.is_some() {
+         info!("adding dylib: {}", name);
+         add_library(tcx, cnum, RequireDynamic, &mut formats, &mut unavailable_as_static);
+         let deps = tcx.dylib_dependency_formats(cnum);
+@@ -207,6 +182,7 @@ fn calculate_type(tcx: TyCtxt<'_>, ty: CrateType) -> DependencyList {
+             add_library(tcx, depnum, style, &mut formats, &mut unavailable_as_static);
+         }
+     }
++    }
+
+     // Collect what we've got so far in the return vector.
+     let last_crate = tcx.crates(()).len();
+diff --git a/src/bootstrap/src/bin/rustc.rs b/src/bootstrap/src/bin/rustc.rs
+index d04e2fbeb7..011c289d93 100644
+--- a/src/bootstrap/src/bin/rustc.rs
++++ b/src/bootstrap/src/bin/rustc.rs
+@@ -89,25 +89,6 @@ fn main() {
+         rustc_real
+     };
+
+-    // Get the name of the crate we're compiling, if any.
+-    let crate_name = parse_value_from_args(&orig_args, "--crate-name");
+-
+-    // When statically linking `std` into `rustc_driver`, remove `-C prefer-dynamic`
+-    if env::var("RUSTC_LINK_STD_INTO_RUSTC_DRIVER").unwrap() == "1"
+-        && crate_name == Some("rustc_driver")
+-        && stage != "0"
+-    {
+-        if let Some(pos) = args.iter().enumerate().position(|(i, a)| {
+-            a == "-C" && args.get(i + 1).map(|a| a == "prefer-dynamic").unwrap_or(false)
+-        }) {
+-            args.remove(pos);
+-            args.remove(pos);
+-        }
+-        if let Some(pos) = args.iter().position(|a| a == "-Cprefer-dynamic") {
+-            args.remove(pos);
+-        }
+-    }
+-
+     let mut cmd = match env::var_os("RUSTC_WRAPPER_REAL") {
+         Some(wrapper) if !wrapper.is_empty() => {
+             let mut cmd = Command::new(wrapper);
+@@ -118,6 +99,9 @@ fn main() {
+     };
+     cmd.args(&args).env(dylib_path_var(), env::join_paths(&dylib_path).unwrap());
+
++    // Get the name of the crate we're compiling, if any.
++    let crate_name = parse_value_from_args(&orig_args, "--crate-name");
++
+     if let Some(crate_name) = crate_name {
+         if let Some(target) = env::var_os("RUSTC_TIME") {
+             if target == "all"
+diff --git a/src/bootstrap/src/core/builder.rs b/src/bootstrap/src/core/builder.rs
+index ff0d1f3a72..b2c9602e57 100644
+--- a/src/bootstrap/src/core/builder.rs
++++ b/src/bootstrap/src/core/builder.rs
+@@ -2153,7 +2153,7 @@ impl<'a> Builder<'a> {
+         // When we build Rust dylibs they're all intended for intermediate
+         // usage, so make sure we pass the -Cprefer-dynamic flag instead of
+         // linking all deps statically into the dylib.
+-        if matches!(mode, Mode::Std) {
++        if matches!(mode, Mode::Std | Mode::Rustc) {
+             rustflags.arg("-Cprefer-dynamic");
+         }
+         if matches!(mode, Mode::Rustc) && !self.link_std_into_rustc_driver(target) {
+diff --git a/src/tools/clippy/src/main.rs b/src/tools/clippy/src/main.rs
+index c9853e53f3..c9af2138a7 100644
+--- a/src/tools/clippy/src/main.rs
++++ b/src/tools/clippy/src/main.rs
+@@ -1,6 +1,3 @@
+-// We need this feature as it changes `dylib` linking behavior and allows us to link to
+-// `rustc_driver`.
+-#![feature(rustc_private)]
+ // warn on lints, that are included in `rust-lang/rust`s bootstrap
+ #![warn(rust_2018_idioms, unused_lifetimes)]
+
+diff --git a/src/tools/clippy/tests/compile-test.rs b/src/tools/clippy/tests/compile-test.rs
+index 9754254cdd..dd95cc71cd 100644
+--- a/src/tools/clippy/tests/compile-test.rs
++++ b/src/tools/clippy/tests/compile-test.rs
+@@ -1,4 +1,4 @@
+-#![feature(rustc_private, let_chains)]
++#![feature(let_chains)]
+ #![warn(rust_2018_idioms, unused_lifetimes)]
+ #![allow(unused_extern_crates)]
+
+diff --git a/src/tools/rustdoc/main.rs b/src/tools/rustdoc/main.rs
+index d4099cafe5..5b499a1fa1 100644
+--- a/src/tools/rustdoc/main.rs
++++ b/src/tools/rustdoc/main.rs
+@@ -1,6 +1,3 @@
+-// We need this feature as it changes `dylib` linking behavior and allows us to link to `rustc_driver`.
+-#![feature(rustc_private)]
+-
+ fn main() {
+     rustdoc::main()
+ }
+diff --git a/src/tools/rustfmt/src/git-rustfmt/main.rs b/src/tools/rustfmt/src/git-rustfmt/main.rs
+index b8b0432aa9..b5bd71e015 100644
+--- a/src/tools/rustfmt/src/git-rustfmt/main.rs
++++ b/src/tools/rustfmt/src/git-rustfmt/main.rs
+@@ -1,7 +1,3 @@
+-// We need this feature as it changes `dylib` linking behavior and allows us to link to
+-// `rustc_driver`.
+-#![feature(rustc_private)]
+-
+ use std::env;
+ use std::io::stdout;
+ use std::path::{Path, PathBuf};
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index dc716618f7..0c0c9dcaa0 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
+	    file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210"
 
-- 
2.43.0


