Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6C2D6EBED
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 08:08:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.111215.1732867731584015398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 00:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20636204d6=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT7MEaw013053
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 00:08:51 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671c9u1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 00:08:51 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AT88oQO019463
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 00:08:50 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671c9u1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 00:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bn+Thzikbn4xwA2YqrdAcV437ixpDx8o0kUwCYyp0ODtU7RsJEAWQVtitG7Jsac9CduJkR6kvqwhX7BtEvgqBo6YqYkIsnHvxssH/o8begDq0v4Z6SrJRNnEAKESxd6c74x4BW9kcL3tVx3ITQPaRDgCy7rxmlZlWqF2/aZ/WGOoSH/W96+SzqupCW7BC/HC84mkR1uttblBTLr0Sl2wgfWLrcjUYiY8AnWdJesyguFIylOaNtbhNAmXAikelc2NiKnmggXXpcTV6H7Lw5x06PipPwObBAS+VLqf3Rq4xRdc/OOX1CAKYUoOdw0vPtk/mhRpvZtmFjrAR8yLsKqoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H2RtuxlraJ4O3YwO7PU/hPTNmdpWNWXAPwjNmtd0T8=;
 b=f/ajLLqTRo+GQSgWwLUMLjGcDXiu9DsCK1pwBZVrtgh3gXuAPPPS43A/qMrN77Ub6oks6/+vjqRXSg0zLRwYgj7NWG+fSSwfm0KESB9W1svBjQDJIJzw1Vbt4TlyHrpk8xJzRbgXZvGPNI9SRkOGa9iJtJ1SkKRoajnANBPHTvSnukckiajJhmsDMOY54SuQty2K2PjA6352t69k+ab6GFfs30Hcjoxr47jH7aCAdRprmEsk04FFMUBFBsIZcxhAEuC9vOtt6SGo1FzHxsMcwW9MrfAME1v/4vT4ZQDKc9Q6soN5aYAGbR/OGUajEHiEa5+MW7d6ekvVf5ars43Omw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 08:08:49 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%4]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 08:08:49 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH V3 2/2] rust-cross-canadian: Fix environment setup script conflicts for multilibs
Date: Fri, 29 Nov 2024 00:08:20 -0800
Message-ID: <20241129080820.330411-2-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241129080820.330411-1-Deepthi.Hemraj@windriver.com>
References: <20241129080820.330411-1-Deepthi.Hemraj@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|IA1PR11MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd1b9be-5eb0-4e46-c897-08dd104d0df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CsHLF6z4Xu2vPxJW3XX5CplDDFw7mhP25ye7tHuE2M9ogSlF0UeFzmyjLbJ1?=
 =?us-ascii?Q?xvn8qKGLyvhVkwEwOuxn5jY55N5sXTK0565vbz4NinwydHezUUc4gMwFjeWX?=
 =?us-ascii?Q?AFXzhubr06y7sZeaIkdT4zeoJuNYfPe+/YiQnt0RD8pVkySG1dwp2DgNCpoO?=
 =?us-ascii?Q?xVUID5xi+R17THGrrhak2MBZ9R45mrjno/J+RnrGFK0LDpyfulkr4xT8dBgI?=
 =?us-ascii?Q?nn9beLjIyNKg8kdcOMfKWpillvBrewOhQH5uZOmqScxqce5yH7PrZs4zRsvp?=
 =?us-ascii?Q?Jisu4Ky6zd6N+XepMe2XJSX2fi8LrtnqkRkKV4kVRjqY4K6PS/i72Igzkvr5?=
 =?us-ascii?Q?hVvX2YuvaPpQhXUWEaajVpcyWTAvqaED/EmGwparb0293kHQUAv3dKQqGUEX?=
 =?us-ascii?Q?eehZacHpnd2CxHddsy2Lo1GRAGG+mtWLQu3HrSC+L23rRegE1jTCoBLgEbPy?=
 =?us-ascii?Q?Gk+/7QLeQnYgPVuFHRPNN5I8PmuYFpn+g9Tp9p37rDFR2WAuBRlHzs4anzlP?=
 =?us-ascii?Q?Sz1mYZTARaiwjKSANVtAmr9wcH/bsE1g7RGMm6eVV/z3oAEPYzHii5Pqj00t?=
 =?us-ascii?Q?dLe/vnFc0tsvNL9kDT5Tr6IpYmQdZ65R3wcYxH4dVKn/dVX5AH60mHPiwR+X?=
 =?us-ascii?Q?1bbUwLLOsFgYMhRhqHkTixyAn23W7jQTfCGUXqxQgOOdSpguZxSoe6Nov/UB?=
 =?us-ascii?Q?brs3ZlCIQrh0KIro3mBdKvrY8snPLYoGPo+pPFH4INQq4ErIOePSe3Ko+7qU?=
 =?us-ascii?Q?h/gWtPUS24n+06iXhKDMGyClmMua/qlVnhGSdBQFe2ofxp1hgSbitPGzkyU8?=
 =?us-ascii?Q?zf2hyIF0VK4BNF+uru6tpWBs2tyE8Soxz/2fPZjjSEbygO9CmtF055bZpoWx?=
 =?us-ascii?Q?XFwSZjaQMTkU79/Nm0uRNdWIhwXiT0hkveUMRp5VauPbHyGgAliQ/Gb23/Zp?=
 =?us-ascii?Q?xiv7L4/Yr36x5iwoc2QBM3ALa1HsvXfq2Y/NxCyA12PRGyKHPqHjP9g83Foi?=
 =?us-ascii?Q?xQ3tIkh2zG5LNEIrhdV0YE/b9dBwcOp0eJo/YGleOlbvP7IXdE+/X+3D7N++?=
 =?us-ascii?Q?aDFN/qfac3t36oFAxU68Urk8L5Gcc8knsUS3qN1hya4JKST+O7qCAk6OZU55?=
 =?us-ascii?Q?/Gmjn9RCU8olir9q++//yUC4A3ZXWe79FyOp3rMUEPo065JRjwotAhXVgQGi?=
 =?us-ascii?Q?wQ1mn9y9FNgHeNtTJ2QObXtaytBIZpYfg5OV1bekvtJobGIJv2JH+Wx07BJu?=
 =?us-ascii?Q?sj54gHgXyl8ngwlwoWhZSO8ync+T9Mv6dUajxHwuMQbZ9aVpcbk11BaMw+ym?=
 =?us-ascii?Q?VeLRFXVybOjTH/9uBsZsHq9JPy5/sYefWK9KafcBDiDLc2W23U8tWMNuNX/N?=
 =?us-ascii?Q?q2SLSN5boS2/N6UIsehZqgElPnt9jf6V+rWznn3xI2A+Bkwtfw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EwmdYVqzsJ/d41/7/3SiMDjP+BZ3SX+vF/G7qIFvbPrD3KBltyLy1Rcq27P8?=
 =?us-ascii?Q?saHJItsxc/KOffJ5qE1ajgWocxSm25jwK+fjNnJNufH5VmD8roWjMi1r6EJ1?=
 =?us-ascii?Q?SyN/KKCWWrG1XSLthsPSjLcIuiIVw1WTDaABH7NQV8clfOvA5EX9LeK+TBBL?=
 =?us-ascii?Q?Ago81ShYGd9gqYVAEYUIj2AyHVm64pmZ/D45ZMbj7aqJyEto1ur8pu2jfivD?=
 =?us-ascii?Q?ZxDCSLRnkfYfJkSP1X2sqAWJAUdjYZTE6EMFyKQ2dbK73EgWsKiUiDYgqlRS?=
 =?us-ascii?Q?+DQie0ouTRyO0aRfHYlUfw7z09PMD4SJWjXN9v7SOz/mylk2YIbA6pwRHrnO?=
 =?us-ascii?Q?JL4BHreuJvxPSyZgyBp9uDTsM2l5myhajlJydMxG+l6ReBzSq8wQDZnhXA2X?=
 =?us-ascii?Q?I3CpWDaOurzTxKYTAu69ha5o4NVULEna+TQsLNMVYXk7sWtDIxDEc3sZaUSc?=
 =?us-ascii?Q?DJx8o3vjkYeY26tOi9jimOIrkoYabOfXf56kPUTV9oC6zUhlne6kCTTPo3iQ?=
 =?us-ascii?Q?F70HTHdOMbjGcXZ2V6iB/9Kx1XmqjM6qsIcREZ04j/wluVKyZs9TIrXgAgmb?=
 =?us-ascii?Q?gLN4m9JlUpseekrRnK6MXzC7hcdWNky/JI+4XLhTdCPhpo54ZQpxQk4cGypT?=
 =?us-ascii?Q?uK9VT1RJBMsKlhfubDcn5TCCRk1/oVWOVx9flmW5Tr4YRcZNtZoae4T2biax?=
 =?us-ascii?Q?QEieCmA6a8YKlLoydBJXAcHNRe3NH4hcIt3bKTrDSc5duelX2Kr8UaoMmn3O?=
 =?us-ascii?Q?2NlOsJsvdcWr703Fo2Hpo8s1yMpZQRWZSVyeC5eIf73toSp2nu+zBIlVcWPm?=
 =?us-ascii?Q?HX9XWvnSGXi/LwU1P6u3hFK6qZRCKvYUs51Q9ZyRDn8Am42lBhOHmuWyQFgb?=
 =?us-ascii?Q?3cef/G9xHQbouL9+G+VOrHhRC38vzr6h6yUw3nnVC+ZkJTAGd4WP486X57EO?=
 =?us-ascii?Q?TE27tq8ZSRQ7Tz8ovDquSJC/Aas2u0YApvg82RhpJW+uMYeBz0GSl45IKPrf?=
 =?us-ascii?Q?vm0MC4VW5idIPg3iaop944YtWgJa9EsMRbKHBrdK7Ws5HyxNZibN86YwHpdD?=
 =?us-ascii?Q?zVbBK+zScqLHsDunmj2BMVgPilhQ2J34u+VmtE4+h/ZOD2Hgza8Mb02Kb1Iv?=
 =?us-ascii?Q?D9DnoM57ETB72Ohc69f0YxEo2IjfXlsfL6g+suA+HhYReA73f18MDJ/B/b8Y?=
 =?us-ascii?Q?9GGzGq4LitXoFjOYlrLWdjDxSo8gKsUd3sffxXxQLh03Km84LELx2AWcXVqd?=
 =?us-ascii?Q?mvqpIKEuK4HycyCgk7SjFN9iY8eX9Ix0G+iDkO5zmwc31H/RI93Mkt2VdNA6?=
 =?us-ascii?Q?BvO1DAJYBVUM1CBy0ShTXj6R8/RqOTf5+IwrOgwKmIOXwWumXevcQ96Y7gix?=
 =?us-ascii?Q?BFyM1F62E2PytCMH6wnnk1Oia/1jEnc21H/siaChxGlWO9IhEv0hRaNN+hyK?=
 =?us-ascii?Q?ZHaxj8dzUafk7reT/eVOt6lFsPkmUz7TjGyQWUhvE5e3YG8zxNuss7fMafVC?=
 =?us-ascii?Q?FN3hEVNOOyowKjLAEC2FN4YFjXNk/KF4N/PIXtUHMFu4kbvzqSlq1jKjRo9U?=
 =?us-ascii?Q?smqtkLTCcMQn3MJyidneStMmvjdRDKzfKFugoC+tZsg4/ocqEvCkeLUnBPGP?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd1b9be-5eb0-4e46-c897-08dd104d0df3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 08:08:48.9837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/FanB59rxAa1tr5f5GOBFOKtjpYU5IW0LJ0kqX//ygJs6vkjKpLGM96xBm3XAYdEW2p8kyUmWboISUNP74wty47RGq+1wAQLLUxYjx9TG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
X-Proofpoint-GUID: f1SOP6fy7oxOzcNSKpCsLkxukiQt0GJO
X-Proofpoint-ORIG-GUID: c7aTpBodQRNvKjcJWTZgcVbDRgwTMJGq
X-Authority-Analysis: v=2.4 cv=QYicvtbv c=1 sm=1 tr=0 ts=67497693 cx=c_pps a=7lEIVCGJCL/qymYIH7Lzhw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=3hnehoe8rIjwMn6jgKYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_06,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411290065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208006

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

YOCTO [#15061]
Rust multilib sdks broken because of the conflicts between attempted
installs of rust-cross-canadian for multilibs

Multilibs trying to install cargo.sh and rust.sh in the same path
which resulted in the issue

The target dependent variables are retained on the rust-cross-canadian and
others are moved to the nativesdk-cargo recipe.
By appending ${RUST_TARGET_SYS} to environment script filenames,
conflicts between architectures are resolved.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.80.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust-cross-canadian.inc |  6 ++----
 meta/recipes-devtools/rust/rust_1.80.1.bb          | 13 +++++++++++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.80.1.bb b/meta/recipes-devtools/rust/cargo_1.80.1.bb
index 623cda0471..e67e7e9254 100644
--- a/meta/recipes-devtools/rust/cargo_1.80.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.80.1.bb
@@ -61,7 +61,7 @@ do_install:append:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-	if [ ! -f "\$CARGO_HOME/config" ]; then
+	if ! grep -q '^\[build\]' "\$CARGO_HOME/config"; then
 		touch "\$CARGO_HOME/config"
 		echo "[build]" >> "\$CARGO_HOME/config"
 		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index b2a212df40..4941914b74 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,18 +54,16 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
+	if ! grep -q '^\[target.${RUST_TARGET_SYS}]' "\$CARGO_HOME/config"; then
 		touch "\$CARGO_HOME/config"
 		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
 		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
index eae1f28bb8..544f2ac8a0 100644
--- a/meta/recipes-devtools/rust/rust_1.80.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
@@ -271,8 +271,21 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export RUST_TARGET_PATH="\$RUST_TARGET_PATH:\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	EOF
+
+    chown -R root.root ${D}
+
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
-- 
2.43.0


