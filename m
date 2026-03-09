Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674F6FCA164
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20753.1773078258849708617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VMwomoyN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6296LbHB4160785
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=VgbmMwuC7wBNvp/BggXhnz1+Wr5595BQJQqS7issZO8=; b=
	VMwomoyNWzzSgs4zPEgGVbMhBHrIXrB1v+jk0qgEH+deLQn54ihsenNVfbvTY9PG
	2fTOx5Cw2aPMwRvOiVh90l/sPk1HBBHfPEjp+U6OQ4F21HxRr00Z14sVyXhn1Lrb
	iCjYljJTWXvAf88G3WNs2aVeHe6EKSV9khbyJzhh3fNo/HOJ83tvSqcq3uj6iHKQ
	axcY3ThM1aMD9gYF2t5NmqnwvkkOK0XVQ6cyNuc1I4gSELZa+alelERVmoAdZHfT
	piqCmHKAbRa0l8Av12Z/nGrFhorqnfbO7thj2AUujCPsldQwJAp1MUgMWUC2Jbgn
	Q6Oo83HpwGdrLStjT1Ed9Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08277s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQ26/y+XhRE5iGL13TnzI62TCHozA49mLPjTWnNs3KQcOsZOpMfAYsjDEx1brjPrLmo6rHln/usrLdnENKIOBcjJob4JzruL0W7syrNDIgNNT+Yk/IOfvk2sSdV7mil74MGK1TRZFNLfU4HkvoJ7lTKkF5Y9wglJiTcn2tiIz84pvOHTp/BOCDRA4K0wS9hqrAakHlJLOpA2HRhKTv4FmggEm531qTH1xdyu7P6GpEmF+mW41uiK7/AFBlTX/ETkjMf8T3FgtMUA2Ix5KPeoFpK5q3KhkLCzGUoxhBDVlYHszWfYw+vYyUVCkVHjzGs9F5oeCxH8sdPET5vFEHwCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgbmMwuC7wBNvp/BggXhnz1+Wr5595BQJQqS7issZO8=;
 b=V2ouy6ndbo8ncFj3APHi20GALXNA1e6/Aj23q6dJc7dTwTZ5ShTA/9JHQsavJSR/O5qrndOU5pElRCndW13IlOwD/0lH/WOlYnYpjv1tuPO3HgGezr7F52UDrsIZv/htt2oWRi8kRJd2nbP6tIktZ+ahrZBm17U4kCIW0VBk81mi3piOApLmGktFBm1zD34GuKCjNhtV0c2GW88CPT0oKSYAOKST0f8y7hH4XvbbjNmNQr1+UJxFuFNl+xOApWipQLWhfubVKaYEOtRdyqcl4RTt0k5PhPNokzQq+QMHVwcHE3EA0XOs7fLu0ujnTtCKPvLrCtb4PuLSzdPicEWKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:12 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:12 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 01/14] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Mon,  9 Mar 2026 10:43:33 -0700
Message-ID: <20260309174346.3384212-2-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c9c3c0e0-8d26-423d-6dd3-08de7e03796b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	gscp/B5BmPvx0V1NFxxpDGn5dFJNmRLuwD7IBE9Iu7Ddwwypdf1RR7sJ/wm69m6FQCtP8nxBoP1IF8lwU8XgJubqU9G0nXolqiRmvGtnpm/nO03Ipsft7I8bQwuKAG03P9M2thm+9IkQLrmQ1KxEdpvDt2Oeh9PVARb6+H8xPI70dy8/v936d5WJpT0AqBnf0qs3j6rASDuwYNew8JARyoBZ1vv+8Z3bLzKuGFtuu1Smo+aPkx5/q79zrMl5nOUN35qUQz4ogD8anwAeOs+JfyGJVwcbH8e1pXA/B1RUxsFmPLnOmfIzloVBfVGupCYbv2SKtiXmRmSW4Ph5WuTcjzKvkvwgDh6Wm1WHP9yc43Futkz9el5t7JH4V7tNUP8EULfgE8fBaEl4NPJ8qAt7uHAdaSI42So7YBHdJ215zEjEVXtFNzsXv17xI3NeknG/LxCUuOukArm0forb7883gU+K1AxZ8ckUHU6DsXbE5Xtr2zJQEKtlMxww3b1obMQ86ZcBk1aZ7vZgrWNkSKo6FlhYsN3nN7f+VlN5OE6kG9LuJ+PNAgg9HoK86+Kpa3VAyQbqVpFsXh5vri0Dx8VQTHvIRbE7iIF/OTk2/0/CJZVHzEglTAEN7Vo68ryIiWwR96KTHy6fEQUnNEwxbPX3VYjupiwVRBGgbEFQSPaCcRxTZnWX+rosVV/83RXfv8q3fbdaq1f6JMWgCErIPRlaKTu6kLpah3/ClIENhCzuQAeOP5hxlGwsGjatNT0iFHXn7pctPdQfPha1RzEedyIET2IHLUJKgeHiYc2ErEKvoBw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZKtFszpX+kut0W2DltmEeHv7f/BX6mL13hvW60pane7QxZAd0fdxF2AqRyZl?=
 =?us-ascii?Q?Ib+OC6FIHy2j9UFlcNYTL00ADhUcYZ6B5CE5LQvbOpy2+1SDbRBEOM/cwroD?=
 =?us-ascii?Q?s/mkUpXLy9BgE46SMIGeqiWBUvlNfzTQh1IdlLLD0Vrb8jVLm/BtpAh0ydQ4?=
 =?us-ascii?Q?4AmHo8NP7TrfmCQBH6bTqkwtN1QP5t3Xk9u0FiqayJSjylmH5e54DxF9TYMn?=
 =?us-ascii?Q?F5KNTtmYpDb/RMzh7aCJCixJXXJhC7liRZ8sD03ByTh/B4tnZuD+KvKS+7g8?=
 =?us-ascii?Q?FY2wfCtNVRHQulrJMoCI1VPjfQ2LlSXO2b/RJ2A+rzpykDnmLFkVQJ618xoX?=
 =?us-ascii?Q?TPsQBVYf1oTwty4Z3PFnwhWxNTVz0NQ7ogcZY3DzZm3i+I33ieLOAOj//8Cm?=
 =?us-ascii?Q?x8mUJXS3r6+rG3jVnqMf3q5ab+zz3TLghgX/+c+Fgl7eUEg1tSidg5WARels?=
 =?us-ascii?Q?ZGclKIjAadsbM+fLbsriPbOj7sTHM3ZS1G0LEi/Nm/EOBktza/guu+QnuuIv?=
 =?us-ascii?Q?WBpnr1VLKg9Wr1T7lyKGddCMNKhdDt6ePgMJCUjnH0HGF3v2QkvZRh+zksx9?=
 =?us-ascii?Q?sWNEpZx1tqthMvMuMR5m5ihz97k5Mrvhk2ijfZ6Cd+xv/XjSrCUhjKSjmsfV?=
 =?us-ascii?Q?wi8Btv4mM538vmxk2LPwy2SFDXxLyoxgezpp+igQtL2S8zta2StAy+e1W+S7?=
 =?us-ascii?Q?gRQ8utShwlyfbJlbL65VMQmx6U7NCTUY828zIkCwPhElBrJ55lX0/X3w6mxV?=
 =?us-ascii?Q?yWUeJmWCZlMlo5l91NaXcsMzt9S2JuAMVtRwnoSJrZIlthO2dYIPIbBlZ0IF?=
 =?us-ascii?Q?qscPY7mwIFTxvJDYDKUS+ML4AvSTGpTs0K+2Q+0eKmI9Orgc2JuwvIXQtCxF?=
 =?us-ascii?Q?pmU+a/pqA11I3dy6nlK5WE9oU5gRy/LZOvaNZlmfmrbzWqb0jJNTkuInzv9n?=
 =?us-ascii?Q?ZpsExIT47P3YQZQo32MYHvxQ24HqT7CIHIVEdnCYWGDzQbOla0nTY6Pq5rAJ?=
 =?us-ascii?Q?am9MT5Wr5HSZALOfnM1Atqb8vLiLB9weaJ5kf3DhH2vV7ttoVB4bwCdQGUIQ?=
 =?us-ascii?Q?4PK5Y0kGZN7APYsz31+tG9voOEILX8g97QMOCk6QLGi29Q0vuqpYYM+H1e1Z?=
 =?us-ascii?Q?mIGzKVptFg3rCz0JJXsQb6Q/k9iGl9/6DDu345P2ozT5hjMXKTuPOLf5CpUP?=
 =?us-ascii?Q?1LQ54GV5xM4EH6IL8enhg36okmCkvQnOxEkAEkqMcqyjqqd4t65kQD0nSw9K?=
 =?us-ascii?Q?7xMgoCe12+Jp5/ItXKPGBekXPaydGBNDG+W6khSQhkII1fYapZ20ExKArktT?=
 =?us-ascii?Q?vxvSPfCGyBBq2w9Hu9L82r2TMCrLj4jvSw2cNSoZ5GoqqEqdkOttqavIJGcb?=
 =?us-ascii?Q?0/j0Otv7bfv+qk+ZGW5QtVWNs2q32KHSfW6xmJIlaqfC6O3DmVOm5apPO1B6?=
 =?us-ascii?Q?ZSJ9DjVZ3L4/uVMAw72XIFYg3qyLn7f/2ylUd2RDEB0Rk+2ZDVytmPdauiba?=
 =?us-ascii?Q?5WdxBx5kDYkzvmYRgKPgPMeDdG4TB1f7epz8HOcoKSxe9r88XxnJ412qoTAE?=
 =?us-ascii?Q?XA3z3z9yVLBQPYwVrgBnXWLO9gJQiPdRYA5fWtVWNsvpDSLxWiGAeHaXmrAp?=
 =?us-ascii?Q?pp1PENdJfdVfq6UxXvYsTPGlBX+UdWnE8UNMrHmY4c7GpS4j8ag+pA3UDSzA?=
 =?us-ascii?Q?B7nyGWq8y0NGupz0nGyDnyn2nK1uc4sKAeQ6gkIQgUkAuNDrebDkWmncpobg?=
 =?us-ascii?Q?WQJNPlm14LZ+TKSoq+o0EK/xSpRxI8E=3D?=
X-Exchange-RoutingPolicyChecked: 
	rRbU0iJgsxsOpQrun/DO4E/4xBfMPbtrd8fzSBBYeOSRuZECGgftchBAjWMYg6CQZZxnN8ty3PtyQ716U6OMgT5CytxK/Yu3EPBxPHtacHKndxqtnJnrK3UahG4QUf375jQ/dbv6rnhFqVT4CPRwSg51xQMRA8navKf9j3Uw4C8vEpg7qnlj+vpDsS37z/IS8XCpdCfzRU31WWoNr3xZa1VO0SSGSu6isIia0AqrCbV0aezME8AeyL73OyWL/gtAA2TPOBgeMe26Kwu1YRba1mIWAbCVc1ZlucRTsWkn+fMSkF+WDwjz5ulg9e0JIgiEmhI9OLydHHYXh0ODKrDxlA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c3c0e0-8d26-423d-6dd3-08de7e03796b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:12.1478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEthYPrgRB8n8HcUsco78DUN4o7PIQicseyWE2qe3dO4VNOBrH8MeeuMJQvzzlxLmub3UOdjTv62fqBUgDCQajxu96hg0NkavBUNZVkiVfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 3MTTzEuYFCRoWU2irzFGtDatBYVAiU6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX4XIi7h5I8Zzq
 ibGabKVpEl98+DdL2R5bTs2QdO1ZqE3h+SrpSvfMXbUQol3k3idCCzF8j7gVWjYCubQgfRc9XXI
 yxEbv+9HeJbOW71HB1OpnX7NQEaN25+TrEy/+5yrDGQ2ur+AtuCTLey1KtOtenW9ml5HbzikTbb
 ESmFXPQQKUcBSORcXVXiH3n6bTkdGRtcwbpudmEid4ZFPKAqpQQ90jkpx+jSU2FU9lxEOAhfaNa
 OqQKOKAID0ZFfZwH6AKOjF/Fcf1oN3X92mnH8J6va68AosPE47pE3/MsGEnAF+WhL/m8yay8faf
 X0y69ki2vvT+ICTvFddy7IXSnP8uLX13Nr0ixYzvUBbxqHjEq9ECN2tHRFOOYloI06TDKh9rYBM
 6wUmYkI/g37zCf/rOteunL+L5pwfo80NSkfkqV9Q5kWyz6VMfhYwA231xqE0klzGDl/rMSmv+gm
 y0f0m4RLIw3SfprdBkw==
X-Proofpoint-ORIG-GUID: Qujk9USbCg6jrVFAVBrCdL7-F91immRj
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af06f1 cx=c_pps
 a=0nW3/h2Bs9e5w/EoXaYwaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=xDSppc4gPdY848Tsl7cA:9 a=FdTzh2GWekK77mhwV6Dw:22
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
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232737

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when Kernel Rust Support is enabled.

These tools are required for building Rust-enabled kernels and for
generating Rust FFI bindings via bindgen during the kernel build.

This ensures the additional dependencies are only pulled in when
Rust support is explicitly enabled, avoiding unnecessary native
dependencies for non-Rust kernel builds.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..80e1dc3d7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -76,11 +76,14 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall = " features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG ?= ""
+KERNEL_RUST_SUPPORT ?= "0"
 # These used to be version specific, but are now common dependencies.  New
 # tools / dependencies will continue to be added in version specific recipes.
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@'clang-native rust-native bindgen-cli-native' if bb.utils.to_boolean(d.getVar('KERNEL_RUST_SUPPORT')) else ''}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


