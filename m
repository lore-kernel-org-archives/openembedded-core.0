Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492EEC3DA70
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 13:36:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.60905.1722000985715824579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 06:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7937a08148=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QBDdvR002715
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 06:36:25 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kcbthn0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 06:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCSywTEi2r6OSDPWbQsthzCom5E7w+gtYrLax2R29JvMrkhRykXBH1bYCFpAAOzZWTXFeJLepdhatr39lEjBIdEITvP8MGj4YA4YupuQUZwRN7iAEmGSFvUROUoqYNh6qFO2sLtnELKGIZLWJFSg9EHlZFPaNDkLUs2yELqVojnyIU5ZMb7+nYBPOcR3zmZx4ZEqNCwW4VX6iFNc4H4D+p9Zzx5I3C8ceEhs6Bb90Xx7qxcfSwnwW1+rOvIh6Im1Yd0AupAMOhFrRKJTpq5Q+Y8Rzw6Cm5fg/fcdS5WVYHpV2oWG3SJM14SnGIamkQGaAmSQT9VRtnygdrbKS9HcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE4SNxOb3JFNWmioFNEAw+n5FOVLWEyNrY35tVqH8ZI=;
 b=aPqoeP+nVwcZDP1EU7G8pxAyQ/NBsstmv5KW4Lz6fxiys6cuJlltEMIw1RoY3xahnBtwy9bB+Ns/Kut1ONNcYIVJ69dFfGF8Z6jzrs2PijQGF17izxZ48Hbeuj0uDvz330Acemu1+pbWnVi5e7CYBE+aeac6OrEFoRkXdgQg9rdDDZ4RAuKZ3tSVaN8RL8cVVBr9OOPJ9M652US37A2n7b3S6VQyVk+OqCsA3vDsqxKGCuJyCBPZWlKZRZ9mrBNInoBp6AKjSQRTIen90pwlrOvzX4Mm5yGGToTjFpwSTuvLFrTeaLJQoxR2N+gkKEEXx4QIGQ+52+MARv3tD1umvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 13:36:23 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 13:36:22 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com
Subject: [PATCH] rust: rustdoc reproducibility issue fix
Date: Fri, 26 Jul 2024 06:35:59 -0700
Message-ID: <20240726133559.1124668-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d9843d-5aa9-45ec-3348-08dcad77f06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4ZR8rfSzx1ZK/xTOChjF9ObozQfaVQEjgUcqqg2aU7mxCmrkLmlHvLM5ttHw?=
 =?us-ascii?Q?hgQ7TrrRX+UX8O61zysq0tURYpRUPUhvH5HErL5oqgxvR/XvL3bTyH8/n+f8?=
 =?us-ascii?Q?gHyg86mG6O2brJJ76kyHYj38974Zbj/oU/vfz5u2gJ3lK7N7Jpev2KaahYhE?=
 =?us-ascii?Q?afmBfa/U0tJ314GdPj72YMkjwNclvIkSToxyd0muoJYt+Qt+A20Mb8OZ62EQ?=
 =?us-ascii?Q?7yAiNMBaeIjvEYnlrB4/6dxyOYAyoJNzusdS87W6+bCF7LOLbGC3b6hYZOo6?=
 =?us-ascii?Q?oCMKbf3oahpiLXsZbAUdMaiW3RCe4m7yFPdkr7YyLXB90uIMSKI2fuL5r8AP?=
 =?us-ascii?Q?11iZzqhPv0/Qm/zsN/Ro1jIDkvygM9TtlUojKYNmWrV9uj8O4KxoMf/eUw2j?=
 =?us-ascii?Q?g+Z4/w7/V5raUINGDVjVt1OBPcy/e0k/UjT1YFkhjItDdRJNtF3duklEQyis?=
 =?us-ascii?Q?h5ralfLg6uzYACrvO4TNh33YN0V/Mh6jnuDOz7id2hoC8LtfJzGzCyDOk2HG?=
 =?us-ascii?Q?EuEXZKK3EzSepL4FLjKr/ps8DIEd7gRsj91jWF7xP7d8FGlNTSKRDy2Jot2A?=
 =?us-ascii?Q?hfAbKwRvg1/4hEUjZnhf8oeh98zHYzanz2N4poNexlwpUvAQLUvj9ZQXThJg?=
 =?us-ascii?Q?YPbFeY+xUrwzBoRUTcKLihQmGFjmfFBfFkzsXD126BJXZFmR9OtcsjTu2evy?=
 =?us-ascii?Q?PpHT7IFYGmRQTkxFY+5aeVZBvF2ayIvqXeWICY2kruhRg8cwrFWyOppc3tIC?=
 =?us-ascii?Q?DgTvRHd/k8nW8AChOMRyvYacTCKWLLEqZ6EzPt8wZsJKOMfrSERuTjv83tTU?=
 =?us-ascii?Q?Deqb2V8m/zs8lupRsDEgpcuh4neHZxXRcoLld7I2eVcu8803P2vlQYCbph7y?=
 =?us-ascii?Q?1P90RRzoeGfP4oUtoAPoJGsYHXGwfjoBMHID92p/cQBcHLYSJtvxx9y0zXQ+?=
 =?us-ascii?Q?5VJVyokZn0ARzL0qSy+PyXarZSAHhLvF8f+3fZ3/VLn0igB/7fsJ4EojDQrP?=
 =?us-ascii?Q?pyCxw7n2lmdF0gx2wlGWL/YjFcaAiEStnOPpTIIb9jdF0Mx5esb71RJxvKQr?=
 =?us-ascii?Q?guQaDDT21HpZqjCbS4cYMt7g08f2zVc3WP7kye3OyPx5v7Qt4Bn8YoIhTXyc?=
 =?us-ascii?Q?lB8wJSyUsc2RG3zKCiemIHrJcFNNswm+4nPCb8qgfKkyE/BbMMporCvx9xyf?=
 =?us-ascii?Q?koV6lG6NRMBr6QrBNccVmFPBEkEL97pYVI6PtIiORb82Mqf3+bQrKwo+wOey?=
 =?us-ascii?Q?7w7gXrnMu80y8CJ9MhIIx4bIn2ok/ecy+Lz3y9HZnL69QOTLIu0QaXA+Fp0J?=
 =?us-ascii?Q?ctmCiTVUUalVxVPiCpeqmj8BXBu3nbcIM+bhUlvOql1yFUjl+4TrWGyX1kjk?=
 =?us-ascii?Q?e1OsklA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR11MB8683.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/mNKmXTfOYrKQbJ8JbqpbZ8iUSX3Cn1MVOLs/uNCbz+sRm2hHjryYftCk+Fq?=
 =?us-ascii?Q?8EHhweMwzIvq8H82G83hZRg6fQrEkOqHzlKKnVg612o8IRx+ci8MWwL+VxkU?=
 =?us-ascii?Q?0Qf6+r4G0ldx+3Z/U6nUVGb7WcZz+sWyuYubyVPTpCqh1uACKmH4v1BtvYRe?=
 =?us-ascii?Q?/fMOgbUQqKeAO1+1aJvUzDE+dqz6+a1ZDEIb0t2wZLZr/oVxTEmzkU7AzHmF?=
 =?us-ascii?Q?XIv5jjvRBql3TSrG5FUGxGqCV57I+sl7ltKfRnBqh+aSMoemplP9Bcr9dFpp?=
 =?us-ascii?Q?2sOFQQB3sqFNswVbIDiUpH6MP9wq0lZ4p2hfcXY/kuXc3qK6iq3jxk93WJ8f?=
 =?us-ascii?Q?ceKFPwG5Sh4F0hYw5f5L9EOXGQvTokwsFVNexji9mmso9o29+i/6/x57+obu?=
 =?us-ascii?Q?Goz7dt6Lnje89bWeN4qChxftaZIk2yqhTw5Yj68+yBcYfly1rH85mbM4zQwP?=
 =?us-ascii?Q?117oa/RSDSajXVwS+89S3Cp8RsScvMcoNeC5/qe4por9/NZFt+/ks+fOK6s4?=
 =?us-ascii?Q?8oYFAvA6Pes8IrKqCqRSi7nCu7atqTVhIvT6o0DpJB2gx3kv68mJ9ARp+gu0?=
 =?us-ascii?Q?LhTHKfGKOV88/p8ep86ar629m8mRvO5gsULRIoMcfWWTjCwAWTE6BTd5qEP0?=
 =?us-ascii?Q?fmD7lZvh7kXklY/cuwe37Y4mbFOt8ayT3KQA61GqPj4XYpHjYM2AxjDe+F1z?=
 =?us-ascii?Q?0PU6SuEOEbzKdKy/Tqjn1DuBsyGRnQgQLwGcrUx0bUbuR45jiJqoW5mV7Pem?=
 =?us-ascii?Q?jk6uEDIUtIRG4BZfezYEBedkge1pZZNFUGF0sfRX1+tITRLnDK4C/ty4wrfl?=
 =?us-ascii?Q?tMQY/o+VCgWAKDr6C0/wSQFiCnakq9sNNyvIeXBx45/lZfl76aLSySEOA63C?=
 =?us-ascii?Q?YzrMwGeJOo79YRxyqmSASiGqw1ITxlBFxRM1ehY++TnKKOZ/yvehxw9tbf9k?=
 =?us-ascii?Q?XdY3UK91J3aa/Vdr7dTFjYu6XrqGMq8OXwWSz3NMPNula1+OOvvQ3owa4jxq?=
 =?us-ascii?Q?r808EiIIy+ym7ALdauLfkI9QwDNlRON4HiLDEEWBr46CLyfEHHe7XuBz4ExM?=
 =?us-ascii?Q?pgYCtPsK6Jf+ef7FVSzrzZ9onCzcBgzE5zXx3Lyib6w1veDak9QIbaIOiiEe?=
 =?us-ascii?Q?oSh3oUSUqH2YqWrJkO8Tdpypsm6KGiBDd7uwbsglGlL/qZPd2gfATFg0ssRs?=
 =?us-ascii?Q?Wg5gWaPWL5rFgO0dzJTJLJxHOIW7YSr1+oefOBfc/hCYZMTiKeEciV93XFbQ?=
 =?us-ascii?Q?/En93S5q9kYDqeJVt7Ndizdcin5epQYq2lV6gTUGRAG8dokfddjh5xWHqEUR?=
 =?us-ascii?Q?jRn9neGshbHzjh6FV7OCLDu4EmzI6wdjBZQ3Trjx3dcUqscnICbb5sRZ5f30?=
 =?us-ascii?Q?cW5XkegxIyEnoh8vBgzvCfM0iAVq1tx6UTa/3vj7UfNDPXt6b/qQGddIKKuy?=
 =?us-ascii?Q?AjfAOj0uUFTDvC8oRg6h/QCjtiPfrWm1FwwRpxC2z8kCH022VlfYqtqtbEAB?=
 =?us-ascii?Q?9iYlaaz5wmQZBWEUrwPCkSzGuD4vyqxflwQ985a8jw8mvzFUQYj7Q+Cj5eFG?=
 =?us-ascii?Q?vHqvJcaR+Q1EGdlo3vb6M9jLKOldrVgIzHPN+Tg9lVISLy4UXu9cU4zLBANB?=
 =?us-ascii?Q?vJylBploaSZm9GLvf476Wxc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d9843d-5aa9-45ec-3348-08dcad77f06f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 13:36:22.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVlImInjLw74EwtZM8tt8iZ9HTBBvKFwAcUWZnasVM/Agb4aZZSYgFi3irmuzG0xjELjWB/A7yRZgHbwxs4mkG1SYCH/TKyRGGIQHo/sf3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-Proofpoint-ORIG-GUID: HCAq_1W2jFc2hlnasKIdfCPXB0V3Ifkc
X-Proofpoint-GUID: HCAq_1W2jFc2hlnasKIdfCPXB0V3Ifkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_11,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=653 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2407260092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 13:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202540

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

The 'codegen-units' option split the crate into multiple compilation units for parallel compilation. Currently, this split is causing the rustdoc to generate differnt binary between the builds.
To fix this the codegen-units & the lto options are disabled.

More info about options:
https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
https://doc.rust-lang.org/rustc/codegen-options/index.html#lto

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  2 --
 ...ue-fix-cargo-config-for-codegenunits.patch | 26 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.75.0.bb     |  1 +
 4 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 5460f158e5..3d3f30eebc 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -16,8 +16,6 @@ import os
 import datetime
 
 exclude_packages = [
-       'rust-rustdoc',
-       'rust-dbg'
 	]
 
 def is_excluded(package):
diff --git a/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
new file mode 100644
index 0000000000..0aab8772eb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
@@ -0,0 +1,26 @@
+rust: rustdoc reproducibility issue fix
+
+rust: rustdoc reproducibility issue fix
+
+The 'codegen-units' option split the crate into multiple compilation units for parallel compilation. Currently, this split is causing the rustdoc to generate differnt binary between the builds.
+To fix this the codegen-units & the lto options are disabled.
+
+More info about options:
+https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
+https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+---
+--- a/.cargo/config.toml
++++ b/.cargo/config.toml
+@@ -3,3 +3,7 @@
+
+ [source.vendored-sources]
+ directory = "vendor"
++
++[profile.release]
++codegen-units = 1
++
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 20ef5e82bc..facf6eb346 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,6 +13,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
+            file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index bb10c852b4..eae1f28bb8 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -136,6 +136,7 @@ python do_configure() {
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
     config.set("rust", "remap-debuginfo", e(True))
+    config.set("rust", "lto", "\"off\"")
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
 
     # Whether or not to optimize the compiler and standard library
-- 
2.43.0


