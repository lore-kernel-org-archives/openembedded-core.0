Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFBAC021AD
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 04:31:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.42548.1740025899168565629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 20:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4146f1a53a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K2ZfZF014823
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 20:31:38 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00ksxg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 20:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrjXgeCmaEsVLlY3r04vTPIFPKzdZlurD34u2dEkZ6wkGapOVJduIJP3PEUVHffA4g/Y1hfcqvEP/PnOnBRUyk5XYf5h0+TgEh3mqHYoGrpEI6d0NP7kw90B9NghuFkNpvxygTIhfK6UE4FcSJiaz/+08yqLjA92nY3+k0t1E6IOsTxm7KfaDoARpKNTmVpqGQkjYZY8/lXj6K4jCd+20PqU8W/3BKDrWEUFx7BOo00X0PMLg0Nc9g8OLdUuOmTpecQjuYNd+DHq8AZUSIx8MSUm77ExRmVcXZt06aJfKXexeBmmiwE4st/+mreUV61opb5+/GmQxa6TZdzh5MPx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hH050p4zSlzdk5CE/2QK+4ziUiv8XvKdYYmyv9uSwJw=;
 b=J9FUYthqJKeGoXJT3w7sA0G11gKJCbeffCS1wctM0pE9d/6lqOpKdBE1X98WqySoW//PkfCHy+x7H2GrGR+cvpowjfsQasgcu/1+cF2VX9uI1KxWqADcaiK57JkqP4zJwARI95PtMKo3lPoNMRqR1eDe5mizAxLgBOqD67ZU539+auJDWGFXjKDDPv0136/G63I5T0LoLIuyTmgFOYPpgBfSCX8qRjdhil6S1YjU58MyckucRrtHOT21q1AWK2gt1ZnJMK9Ki0h6jbOCNedrAciH8U7MIGH1fkaY+74oauzH0jp20pasYTxHlN7MHJxKNuEMtNNHVcWt8qCzO90FUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 04:31:34 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 04:31:32 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] debugedit: fix build failure when enabling DEBUG_BUILD
Date: Wed, 19 Feb 2025 20:31:20 -0800
Message-Id: <20250220043120.2347746-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::15) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7f7a94-33c0-4001-741e-08dd516773ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nRHosl4BLwTohDHphHLF7z5ckgVrsS1p2p5B75oi6l4d+Q5kK0lhjdHR0vG+?=
 =?us-ascii?Q?XXQKxg+QdSDWT/DRcQuqCEdudf3myImX+MN4FA2dzV4fwXQHbNLxSI3XHAO6?=
 =?us-ascii?Q?S37V+regHVjQcvEoHRKYSCYlXhhUccYEvX/660Wti4ivB99ZN7dlAHUsgJe6?=
 =?us-ascii?Q?dWCDLQ1mGKvcdaa1wvRStbtFq6qE6mE0VKMRy1/jGSA2xeBJXYLJQyopMPcS?=
 =?us-ascii?Q?3SfFZOoUmZk3DCODf7VqQjeN5R0WyKlK9OsoD61XGMGvZcxbAqjNk/vvLy3p?=
 =?us-ascii?Q?41FWI6B08XxekvevSfpF9gVdbpKKrZpXTage6aU8cznHHp6SYbGME1yjek0+?=
 =?us-ascii?Q?Hh24hwGT2xLgJupBNXXa9Yf5IHGMTWGOq8Ytz/P3tbWyq+mWlOy2jy1jR+fI?=
 =?us-ascii?Q?KSYLNPvucXG/Yyj1O/dcbXFIAFRSOfrl3tcB9EZCYf01jhkeeBFsdsqiZEUW?=
 =?us-ascii?Q?EAKu+mOCx9zvls3/XWEDxu/reQ31hFLVu8MHTjY3VvgHZ8W4yY9GEOFZ7Kse?=
 =?us-ascii?Q?F0WtSFAaBivcfglcC+8VmIhINoo327ckFc6U9oYXnfxQx6uSo6Dz1UhiWviu?=
 =?us-ascii?Q?/BB2ZERTxIa8Yd1SVywxqHB4JA0qy7O9atVQ4gpyrAq0ACEU3CAZTvU42i9y?=
 =?us-ascii?Q?Q7Lo2z2il+G0ZY7Sv9Ku+4wa6L7MqyuI4K0c3U7fnok1VPSPt/qiTHLgNEwk?=
 =?us-ascii?Q?gPcRz46k6G8RJZidrX5i6ob4RM/N6nX7lSKaKKa/C10K/reFxGLnrxklwfsX?=
 =?us-ascii?Q?GJtYEDqvjdwtGNE4pQEESNPB0+F/ZjKPLoVEjhVPxpso4WTUxrel1ZdsU3RD?=
 =?us-ascii?Q?7LdV5U0BGA4CBQlAXaNYuSDAEsPNR3x0ylzPqgHHhUwD51B500Jx5Wk7EZ6h?=
 =?us-ascii?Q?z4jQyS6EzoIKC1C/JOkHTB+3nMcuxNioiPWkyt73u+r+KZ2ryQjbPU9EhU14?=
 =?us-ascii?Q?Wi0++CPPNy2MRkvPAzk8Wp2LH8GN5VWyt1N3dLpsgFjL5NBSZ09mc+c4ISR7?=
 =?us-ascii?Q?Jq5HznH0ST+6xNSEW8i3dCH/ZC63YJEReGXaVwja0NtELuPLhDE5BLkjUCd1?=
 =?us-ascii?Q?TkSuFLdiUmjxl3LrHMTVrcDTXa5MC1X0LzE9QZE0qEYOYLGstIHqYopqQj7r?=
 =?us-ascii?Q?djToZ/nlr2Z8KYOuQvMgbGcasjzPHSjOUxdYf0/KTGvBWfO4XNrmAf/QsPmf?=
 =?us-ascii?Q?jVahKohiO8UklTKv7nJF3f12phj2/cxrzoG5QudvwJMxgM1tIO/1aFfHuKhL?=
 =?us-ascii?Q?OUG9jeaHKp9wVwjVLDLUOF8AutiSrXxcRJ+yUV8PSAKO7ziaOns1EJ4OXrvd?=
 =?us-ascii?Q?g0PQ1LDuw/uVpFyXXc11UCDiC+0ygcZgxpi6ZWkbqA+m9tAIMfUtrVyiyZMa?=
 =?us-ascii?Q?Yyz3LCYRulDR8dWQobAHL7xdmYrQV8IdFXNaF4fUaLqnxG4zpQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kFTou71GSaxDaOOUAwiQ2IvYstwj3b/aEQ1ITtucCm+rZyxFg5cTtGPw9oKt?=
 =?us-ascii?Q?XWYqrzxiptyrHQtni9ZNO86Is+znyRvGfFpZptn5fJwfFcraRHULx6aiISsb?=
 =?us-ascii?Q?gInpbX/pBHgaGjuX3AUbit9cSFsHJy0nkQK4yWGVIC1i3vZlyosQzYR90YBM?=
 =?us-ascii?Q?C66fnZXBNzapGbse/zzR6GKIOn67TE6rU5AmhlIwdu4+t/v/b3/opci16ECe?=
 =?us-ascii?Q?2X0a4NpenRnglq2B/2aEDQAW33FpBwhiJPL4tIxnyjNTA8QuhkSygFFI3JxY?=
 =?us-ascii?Q?gG+3enpaM8xiOKKj2y2mfU62u4tktmuf22jIdVfRf1+x3JPgE8VLKD5Q5mQA?=
 =?us-ascii?Q?/YeLRBHpsgM2EHudUToeFT2ZrBMoeiVNbv8l4nvPgK9vvS5eKM5Myv4MEYo8?=
 =?us-ascii?Q?DrJHaNzjoK5jIpqh9DS9t+knFGq3GNO/TAdJfCC/Q+9OdNpDGlVEyD00v5GH?=
 =?us-ascii?Q?XD8YL62ScQEvNEYVcVdWsGJZdADjyGp/97oad3TA1FnbSkBTldVKurxXVRbP?=
 =?us-ascii?Q?KmCXv3RS/fe14a9s/UXV0UyY7dPEoPbnshWhzLbSr0Sgp3IrfYEMiT4XBZ/f?=
 =?us-ascii?Q?ITZHNT2D+yK9xg1cEaYDAlGJoaHDdiEWTjy57mTKEHXZ+j63StpW3MtojkPi?=
 =?us-ascii?Q?Xr7cl8y0wD00aJBSLw35OSd2123JBnaY3ZoqhJin5DjZB/r43+Pa9RBlpqGn?=
 =?us-ascii?Q?sJhrPqbm/EYcWsxkpGCV67A17NyGVY309HuxD+poxLhA7NL45JXIciYAc/ba?=
 =?us-ascii?Q?r4f0m/l24j8Hdk2n01IqRHL8u7V/hAH+ZMt3WoCOTySC+6zs+SYVlo81d6xm?=
 =?us-ascii?Q?UHMU7vrIj+x2iZ1PEY0v2KlrFAJfTMvs538hn+z8gvtLND0DYahA6P4qxJtH?=
 =?us-ascii?Q?y2KG0bfLg1Rp00TQsQ5FMesQEhwhZGzK6TDjxqsPIwi0/uPtnQW3GdroSvFT?=
 =?us-ascii?Q?Dd0QYhdwOIsWKb6/MNTX/H00zZHuCV5P+glfTzPyOb6lmZw2FlBx4ZKd2OVb?=
 =?us-ascii?Q?ymQByZ8KpYVuC5nZcXAZDhd66zGZxTZXeegObZGBRd7b6bNbPkEhIlZdsMZE?=
 =?us-ascii?Q?Cadk/xEqm1hccCf4nLoY+0xOtGQVVHtE3ikXysg9Q1sJ5uo0RJSkPa2DUgRc?=
 =?us-ascii?Q?InTBVhKZmDzwbEurWmS3yvzzudfnqsg6rts9exgm8qor71kf4i5scNKRbxD7?=
 =?us-ascii?Q?YF7KqH1fZ9vPs8Y5ISZ8+4Xwuvz4nwW/+qTCD+VLccNQ4u3kbNE6XblxMYJk?=
 =?us-ascii?Q?RsjpekublVW1H3Pqyxte3zVIs0ffefLmW19BqKr/0q7g3h423evK+C7M8t5q?=
 =?us-ascii?Q?FvKXYUzx36BxTch0r3XoF0KC/UsTby4rnegOzurX2R11dUUsQAOtkko2s/pj?=
 =?us-ascii?Q?LVJeoZoIBdKHPn3PqGJIlDCW2dJb9BOQlATqIdZZcLED7FVyS9cOnDb8ukse?=
 =?us-ascii?Q?UwZQwgdQSZrbjoFqbS13jsoI8Ucf+WupNSc9hlA9AmZKp6XzUtbhoHb92yLH?=
 =?us-ascii?Q?0niiKgsi64qOwcjun/aHFTgtWnLgw7N4loM72EX7+onUlU647Utjo2SnXt49?=
 =?us-ascii?Q?LJ7PrNYXbS9f2ZPyec5gUgSga5agDWdTKCqalpc4HyEyzePNFKk1xx0NNvw8?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7f7a94-33c0-4001-741e-08dd516773ff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 04:31:32.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1Z5xL4aP4vnB7KxZeWVSqtVSSyXnSmttll3gQCRjdOxn+tDMVFE1hCPbzSkjRcnjr4FM6FeFI5Ub56pIzHb7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
X-Proofpoint-GUID: tMqjLY3tih6ED-JJUQv9uTu09a1Exyd5
X-Proofpoint-ORIG-GUID: tMqjLY3tih6ED-JJUQv9uTu09a1Exyd5
X-Authority-Analysis: v=2.4 cv=Ao8U3P9P c=1 sm=1 tr=0 ts=67b6b02a cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=CCpqsmhAAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=mYDd1H_A-FZWCmvCkM0A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 04:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211739

From: Chen Qi <Qi.Chen@windriver.com>

When DEBUG_BUILD is enabled, we use "-Og" gcc options. In such
case, the xxhash functions are considered not inline, yet debugedit.c
defined XXH_INLINE_ALL to force inline, thus causing build failure.

Backport a patch which add "--disable-inlined-xxhash" option and
make debugedit use that option when DEBUG_BUILD is enabled.

The 0003-Makefile.am-do-not-update-manual.patch is moved from musl
specific patch to SRC_URI, because we now have a patch to modify debugedit.c
and this will cause manual to be generated again. This is unnecessary and
will report help2man missing.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../debugedit/debugedit_5.1.bb                |  6 +-
 ...on-to-allow-disabling-inlined-xxhash.patch | 81 +++++++++++++++++++
 2 files changed, 84 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.1.bb b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
index 00c40473c4..384909a36f 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.1.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
@@ -10,9 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
-           "
-
-SRC_URI:append:libc-musl = "\
+           file://0001-Add-option-to-allow-disabling-inlined-xxhash.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
 
@@ -25,6 +23,8 @@ inherit pkgconfig autotools multilib_script
 
 RDEPENDS:${PN} += "bash elfutils-binutils"
 
+EXTRA_OECONF = "${@oe.utils.vartrue('DEBUG_BUILD', '--disable-inlined-xxhash', '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/find-debuginfo"
diff --git a/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch b/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch
new file mode 100644
index 0000000000..bd03ea278f
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch
@@ -0,0 +1,81 @@
+From 820498e881401a6f4b1715dc6831da965f6e1d69 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 18 Feb 2025 18:50:46 -0800
+Subject: [PATCH] Add option to allow disabling inlined xxhash
+
+xxhash cannot always inline. For example, when using gcc14 and
+'-Og' option, xxhash cannot inline. See links below:
+https://github.com/Cyan4973/xxHash/commit/574aabad87b2ab9440403e92e1075ef48554eb87
+https://github.com/Cyan4973/xxHash/issues/943#issuecomment-2563205130
+
+To allow users successfully build debugedit with gcc14 and "-Og" option,
+add an option to allow disabling inlined xxhash.
+
+This patch refers to a similar patch for libabigail:
+https://sourceware.org/cgit/libabigail/commit/?id=50497911e2590c21270e0763d277457cf7752c3f
+
+Note that the default remains using inlined xxhash.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Upstream-Status: Backport [820498e881401a6f4b1715dc6831da965f6e1d69]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am       |  4 ++--
+ configure.ac      | 11 +++++++++++
+ tools/debugedit.c |  1 -
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c590edf..35fd947 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -42,8 +42,8 @@ find-debuginfo: $(top_srcdir)/scripts/find-debuginfo.in Makefile
+ 
+ debugedit_SOURCES = tools/debugedit.c \
+ 		    tools/hashtab.c 
+-debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ $(AM_CFLAGS)
+-debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@
++debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ @XXHASH_CFLAGS@ $(AM_CFLAGS)
++debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@ @XXHASH_LIBS@
+ 
+ sepdebugcrcfix_SOURCES = tools/sepdebugcrcfix.c
+ sepdebugcrcfix_CFLAGS = @LIBELF_CFLAGS@ $(AM_CFLAGS)
+diff --git a/configure.ac b/configure.ac
+index a5a6e28..32dd27d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -181,6 +181,17 @@ else
+ fi
+ AC_SUBST([READELF_VERSION_OK])
+ 
++ENABLE_INLINED_XXHASH=yes
++AC_ARG_ENABLE(inlined-xxhash,
++	AS_HELP_STRING([--disable-inlined-xxhash], [disable the inlined-only version of xxhash library]),
++	ENABLE_INLINED_XXHASH=$enableval,
++	ENABLE_INLINED_XXHASH=yes)
++
++if test x$ENABLE_INLINED_XXHASH = xyes; then
++	XXHASH_CFLAGS="$XXHASH_CFLAGS -DXXH_INLINE_ALL"
++	XXHASH_LIBS=""
++fi
++
+ # And generate the output files.
+ AC_CONFIG_FILES([Makefile])
+ AC_OUTPUT
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index beefd65..43f9cee 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -82,7 +82,6 @@ typedef struct Ebl_Strtab	Strtab;
+ 
+ #include "tools/hashtab.h"
+ 
+-#define XXH_INLINE_ALL
+ #include "xxhash.h"
+ 
+ #define DW_TAG_partial_unit 0x3c
+-- 
+2.25.1
+
-- 
2.25.1


