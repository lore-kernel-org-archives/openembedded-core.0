Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB264FCA16F
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20769.1773078281035707610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YErT72NC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629GfOof1025889
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=y8zsI2iZSwJJEcCUnpw9ayEb2vW0JniWCGf0GDZ3JH0=; b=
	YErT72NCO5zf83YrmsP9W3SzgmPPlA5NdyaETKmc8bkjl4C72PiCIUbf8etue5fa
	kVKx0a+5O7nj2hlwgxk8wkb29y0++8eVHJw8hlctP49KfYY5TwHmvTDD7iRVJBdM
	L3E3JW7wrCaKMcvplTMFAUdLUmvkncKuzYbpQNxk2EY2Spyi1ZXIZbkWYRkXoN4C
	ylDT4i1SfTOnGiNQq/EWP/Qnr/Uv9/L+JdGxJIKj6ZvffWVdacuZcJSB2j51laKb
	r42E0xDw2NWyBY6PGUtCBg5A3H60hsrze6mf8PSeu8HGsXkkvgNep/1S0VVZEP3l
	PpD6XmRkCz92yzuRkfi+3A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08278r-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISSMUL0ICYIMfOMMCkqi5MGWPege/RQxMvJ3hJuMYBCZM/e6Ay9qVUsyw5WmsGDsyqpFbknaXBBMnc2NZcSpSO8tBNfcLMQIKMi3QMTdGZmfUSxywa/i2Gsp7JUO+v4OOxfh7ZrAvGOa/pE0v+wtKevfc7yw/MshXeqpdeBeU+kDXFe/XBwgXmpqqiPln6fAmvmoGcT+xMZtyFbdmrG6qSY0X5ve/0y203hWrXmezTk6zh838iGYDi/8Grmaycobg7PbPpwVOOi2jBlWsZNjHpJUnVtF0IZNC3DicsZaLCyWI4Lezb+PJdiOIQzZjv/g8gyoaEvgN/wi9NYy6MlJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8zsI2iZSwJJEcCUnpw9ayEb2vW0JniWCGf0GDZ3JH0=;
 b=up095GPADr4JEUScaGI3rWUtz2NIcgmZAO3hqny6QoOG5RS+yjJeYN2SOwtJIV1DnqKBTUHVhbHRUMMjfjbztRCt9cljQVdedFyRPNyKIk1chmSwIc42jFrA5ZoR9BAn78CMwIOwuEWQ1TWk15h4F8c0yAD5WSJPvMMe3G8hqCptcajgOHRYrrDIx5GEkdwRWs89s0hn4Mgq4PfnvhvJNI6qYvcoqSD0OyIfu3zpYgsZ71bf2QgH5+3HftdTXoWdCYXH51phH1VDA4gGSelEsvAPnlOunUOB8w3p/askDaihAQJSkYghHyP4qabGJXg3n8/4OIclx7AQbmzov+ccuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 11/14] module-rust.bbclass: Prepare out-of-tree rust module compilation
Date: Mon,  9 Mar 2026 10:43:43 -0700
Message-ID: <20260309174346.3384212-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: e61c8366-3bee-44e7-05d9-08de7e038311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	MGOl6BNK3K8yiWPWW1vMychI/KsGSfYfL4AYqhd5pImKW+fYv9uOTUsdhhwzzYEaA9+V+alT8YNecYhuoIHRYp4o+trBJDKQeaz1Ib2PyN3io8DglHSBnZMJ1/8UWPg3EcrVjugVOGaYQMN3xF8P0kXynwOmZHwhtzOBhuUTGuX5To0QHrolMQZX64nM4TblAE+6Rt6NOCkqnRvhCRYRRP7ObjIqZf4vhkZuUPOl0nsT7iB2U8pE3kTfLkFOsKQWv3EVEGATZWJJo2TMj5pfgQ5Jzvx3v9FV4uIhdOIaWmQOYHMgt+SemRQ+dDKaV3mEpVEy2k3TUqqUCKomuiTFbtrL1nR5qoXmM6UEs7By6odG/ecnAnUU9Dq79SdC9u/XXObsXwioQ8s3/7B5q3BXxWiiSvZF/kOBPGQUCmxjAcRpwDcxtYPzYUsFH42DBqhmu/STUPAjxWTcqOomtZYms9Wa04+WnedrpW6OR3uFPq8LY/AY8vpXsoTBWPODoMolLwPU5b+iVh9L6SknP4/decWVKrtTwl6xQw4TsfRlznMxQu/Id2Q2rnelc8AZOUlSBl4L2rWnWlDBw9mn8bMBMxd/6gRltWrO5jXtUk94jw7iunZyjU1NbBvo8uXZV9etavp79XJnHqyIIKgNF9nfxgd5sWyCR8hjZma+N6Ne32vE7YdwC/oyR23GOm/Cn3gR+2llw3zdSfU4P0aqP4hAtUB0RzJzBTDDI0W2XXH9+rX+rhdWoYInRjI+v8+PZYjgEL4cEvvdP3lDAJJ71NYagsr9SG3sMLgL8yAUySaTmog=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LPhqmKiqVLlPVULmtHglCp/k5qsvQVkBEb0GxO0+YbgQC21JHLsjyS51scpq?=
 =?us-ascii?Q?U9tZoGccgRbYEEOytCS8q4jMT65l55pU9f/Xodb75C8QFilP8K4DbNpgLuQk?=
 =?us-ascii?Q?FdrjRDIM+VG4Mri709GLxAa9ZoATShwXmBxa+mEVIYJNRe26t8a19Y9dCgV3?=
 =?us-ascii?Q?TzBUlwJZKTcKCfOfxWpfxPOqBEgyenY8v8EmeCy2XjYqFskKbq2Bh+9cIRpy?=
 =?us-ascii?Q?uDG++6jF+sY28iFd5PPOjt7SDPQ0sMLgoXOhliQDlHLtLv2R0ldhqQjKiar3?=
 =?us-ascii?Q?QVmRJrVLQ14RAjKpLB/6/YB5AqSFvkHtaE4yrb0i47zQogfCpFzx/lh1guux?=
 =?us-ascii?Q?Smw7AhkRn7M4Kfo2r8qxEycb45InDdfcS8XWU7uEoDgKW7x524gjZOT1yP3N?=
 =?us-ascii?Q?bn4lM+GOnT+Wgxh3AVdfBl41h0VyWryHIHoMjIjs6AP5JOJ9lJOMytt8DN12?=
 =?us-ascii?Q?KLXYLPcPsC1znnCxt1YcTErd29stw9pgSkU+cbsPx6rSPVwcAG4ZnngE0qIN?=
 =?us-ascii?Q?Ga3lXezCcfmGxmQJCRjI+t6N7L3s23S0Xv+gZ0ngYQzjTWEEIy2u4cETTVG4?=
 =?us-ascii?Q?wt9nu2747u6uOUXkLVqeEYAU9n6w4GP6K9hNZquYG0Lqm0DD0VOsQCZX/qUh?=
 =?us-ascii?Q?BpMc7dQlnEqJWgy8QUPVQkvRBoM1Q+moR9j9lkA5Frb6jueOAOpz0UaJU/3u?=
 =?us-ascii?Q?4PnFuFBGYeKPtdwUnPwTwDut8utZxussGcn7cbaptUt/Pc30OyCJnMpZ+exZ?=
 =?us-ascii?Q?RmengAIFEKbsIg5GsHj9pT4pYYwg324r2hSORMOju87HMN0aHeLGNzuesYHR?=
 =?us-ascii?Q?OWaTh5Xl2/SqiPXZXdMf3MXUDFHI1YGVvX1FIFPSHV590a66ujkCBFrMfzO4?=
 =?us-ascii?Q?vR03e5/5tfQPkTV7p57WO0dAmzg7RUcXX4i6WSzhL097FoQfJYqEibybbcPN?=
 =?us-ascii?Q?TT9JBmoke5ShuKXywMk1HT9qBgtEnYX7FKLYgQy7hkbnD+885gBBFjxrUMNa?=
 =?us-ascii?Q?YG+DHLlkSa1qA3N8xKKuHf8gs6TAP0OSJd3KTeCkZpUuS+cP7o+92Y96bE8P?=
 =?us-ascii?Q?A/wzXhX4Dc8Zr1LERG9m+7ZsG91KhqGCWIokHBhh9fZ7fmS9v3KeQKnfXLPj?=
 =?us-ascii?Q?17RonputYPaMathZlkC9T2BQJaBVET4zusfBW4OtoRGmX/75uuy7v5QVkhsy?=
 =?us-ascii?Q?61m0rfFYh4beV1vbs72DlrnsGbvNBPW7UrRYAuuFt1wvwdMb8mLwREuLGUeR?=
 =?us-ascii?Q?UiiJLzcH2j0BN3FnHU2NHJlvjgzME1YSzcLXY77RqJ01LmzKAbS/42LYylWl?=
 =?us-ascii?Q?UXuVuURbVl03uuMph/ZUAuvU6LW/m4NflrAbDcoex2W8GYgo+6lwzbbR4wCs?=
 =?us-ascii?Q?x+1qop2nvoKKcXk6fFp/eN0pD0tyKAW8hRQj58sQwwAEVKlccoYdWHNr5jMI?=
 =?us-ascii?Q?9a9OlL1p8jPeLko+yinMXddr5u7g8WOq4O6Zy+yGzhATim/4iqWKl+X87b2g?=
 =?us-ascii?Q?e/Sye8UeMOSSwME42hIrhTGRL1TnjTI01u3u2p/m7Y4SGUlcbAf09badUlrr?=
 =?us-ascii?Q?Q3cOp6ZF1+CoJfVEMYidxfhI/ol9VZwdTu+umpUE42vFmcvvXTQIMC3Vq/jA?=
 =?us-ascii?Q?EcNX4QpfK85kK3X/w5creGTDMla+VTcKQq98xY5fTIZTARc7h4ZJwKjNJQhh?=
 =?us-ascii?Q?RUupmMbCzwj7bFdpGqvMSkAOC+zeMkOVC4RM6q9LUmNtVUvAIvDFoE1stAyj?=
 =?us-ascii?Q?l7G2oU8YbNDTldJA9DbNjpgeyfW6ADo=3D?=
X-Exchange-RoutingPolicyChecked: 
	pDgiLq85dWLfOiJw75IihTI0niEp3tTX3FAIqZFWzJvsvD8SvRp7dgSJ8G9A6pY1gprLy/PmjjVOu5F+YwCBF52VTBp/sC8E+C85vo/HqHV4TqN8r0Yio7d/0uczhu47Sq9pW2psqS64XGEC6YE42uTyGYy5R6sw7MykSDI4s6nES4toyMyIm+JB4ApmHeW3FEmm22Jd4f5jndBU7wESvkJXe0EUzixe0aB3FCYJfoh/OjFJUpH+E4kh/4s3/u3BhrOv1QUZs8Yv617Lz+IqQkbNqCu3NCrxvuMYgeBFwqbCYU9QYpVv513EMtjPIi/9TlecMdFSSkpjJxlluzCF6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61c8366-3bee-44e7-05d9-08de7e038311
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:28.3486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsgxug9+5Ao7bCEyYfw0w3vLGsQYMvqZGdMZDzh1J+1dJXOZkA8gLnhWLG65nrAt76ZjuCuo7KjVEK/Udj4f98e8USrapIUWAwFrWCiA75w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: nbQd7xRu4_8we2M9_cxpF9zhPZX3S6lq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX5wKRA7NRVTFA
 +QQPiEevWz87iGb2a3dS7yCt8zXzX4z6hsolMV1r4lHltXdBy1etH9GnHS4R5a1EkQzwGHfg/Xu
 sdsfqeu1shDD8/VP3p4kpMbLrUKNtr+Gm+QgrgiRuDT6XoCWCRjN1jfEofNxyRw+yUDuEXHtSZw
 wdROmmILz/n82L7NFtKycEvqq276s7t+2ppamdi5qY8oKH6GRVh8lALWLY/2R2zIw1PoBLIxdEF
 NqH1lC0N+8W/8MrVdsoh/oIdmrWlEQJUFzGGvk0abGitsg4kQikPn3p1cnCSMnTnyxazCPjM0kH
 QR5U6jqLT8RC0aSOvibD2xNdRgnxcbPbLrzYmxzropMzKfzr4g6YC97CAdCVpnfUPUULYzDQ05t
 SKDEfGhY4J4sRv95xgdSfhxSKCN6oHq6SesSQFYCqP+Rz98AWKYFwWgB/bBYZwW/EGV3wrZYd3q
 3tdY+8kPbUQkLynbEzg==
X-Proofpoint-ORIG-GUID: kcshK2NAfLAr1FDhhv0IhMNYokcLYLfm
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af0707 cx=c_pps
 a=gS8+cbQEeirDoRw2OPG9zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=7sZwceKTbfY-ewGMKEwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232748

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add support for rust-out-of-tree module compilation:
- Add dependency to rust-native
- Remap ${S} in compiled output to avoid buildpath errors
- Added check to skip rust out-of-ree-module compilation,
  if rust kernel support is not enabled

Co-developed-by:Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/module-rust.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes-recipe/module-rust.bbclass

diff --git a/meta/classes-recipe/module-rust.bbclass b/meta/classes-recipe/module-rust.bbclass
new file mode 100644
index 0000000000..1801e72196
--- /dev/null
+++ b/meta/classes-recipe/module-rust.bbclass
@@ -0,0 +1,18 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit module
+
+DEPENDS += " rust-native"
+
+RUST_DEBUG_REMAP = "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR} "
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
+
+python __anonymous() {
+    if not bb.utils.to_boolean(d.getVar('KERNEL_RUST_SUPPORT')):
+       raise bb.parse.SkipRecipe("Skipping rust-out-of-tree-module: KERNEL_RUST_SUPPORT is not enabled")
+}
-- 
2.49.0


