Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89E5EFCE2B
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24349.1772646247618395506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HjkJPim7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624EHLfU2960433
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=HUzEbdSMMter1Mez12VfRaLBrCG4OiYZpTzGOiTNuCg=; b=
	HjkJPim7eYCoA3ckTRnNEFJc5ETzqxWebawft+0pcY7828a4IEhXSy0f6HOKkZ8t
	FfKczM5l2e54QRHfcUzsGQ5emK92vUcq0y4QX+ry4eHnZQgY/4PxU9aCh5aF9m4X
	38dbB6S5Tpv0/SSUiMJUgrKDRsErZ6jNJy8Gy6iAmKwFi9czL6DOlkFyR7qXERNd
	1E6quTZLPOHlNX8vJO9jQX4iPy2Y9ucYY3FLF9fMCa/JgKFYWBdE1V/zrzf9OA+L
	9qayrPItZrEkq2mSjHSpyjX17DT/93IDFt60CpTHO5T309acu2fjTvKyXH+wMBl8
	UV8RGI6Xah9M2lvXA+EtzA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvnj0v-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEmq2q/KPULSZSSnOoS2RDk1MBbpTuakgkzcUJSnNomCUfWmpqoJeKdyhbheQYy8Al6nCzmQyt1jaIBh8pdJsFY7mnLszT24Nv3ItP9Fzn82tUKLLzQ0IwHyeuUIK6ZyERnpCWSOKtFdX0RuGxsWo0c3RUpwKH+A3ddH6UVF3loQ9O6Swy3djgxcjVKW8tYziA3CbYodHOY/cHl/86Ts82CsW4iPK8sD0Xe9Pd1oP97fZI/QHU2/M5YwyywMR+pFp4e5q2EHUvwOsKbeldyYmIB1+Qe/f06yE7C/YeHB37YBc4zDDhtjseWFKjLmVD1On/KFCOnown8/vS/4PK5OuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUzEbdSMMter1Mez12VfRaLBrCG4OiYZpTzGOiTNuCg=;
 b=mCImiVUl0BnEZSi60dfiL0d333r05qv27z28EFYt7aH0Mf9MciiqIMkIQT3kFc0hQD3VUBrKR7iL8E6ia3gM9xCj78Tp7ZEilleiCJ7K1iA6bz6LIny3UB4VrHlfPhhu8n8FTw2S/4F/l16ABq10RwnQk9qNhkspI+Z2jletgiSGhemEamNVWyMEVJwjpadq/YOTyfjPqVU6cWF7SrwCXfApuv13CRl4tCpTZunLIIyss0k5Eb7ujOEeK/Cp5tj/GgbgGArQq6rVnd/61peMIlhovaLmY91BpO1BZDeQe+wY/J7Z4fcqHzYcsR5+WdKfovyg1ywyOQu2iMpclgK0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:01 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:01 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 01/14] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Wed,  4 Mar 2026 09:43:11 -0800
Message-ID: <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e56e43-07f5-4ad8-f165-08de7a159f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ekBka8hDctXPHUxK3OH+FQmY6fnC+hAeImHaS46o3VOIIr5WeGkaZ/7K3y+5GCEglipn+1ruVH/ze1hNJD/l6HrbxyeybCmmLK6pURpX46QzAnw6OXk5DwD+Rbdv+oJOvwbYsSZ11E5ntClbl8yJAxD8/S/cRmoAjZm8IADuXgdvGxghwkLgdF+tCZeNyCtaJb1ovGaUim7eYWxLnfdzV4Q/YYoYoc3PPoAhQn40cCbaViB3qcbHbaP6QI7lDdIQb4/+Ki8npsxT4OC0oDGojYJf4y59jEaQb3APSs4nmK4Wx4qznMarIvHxw3oensPoNXIfQRYWjV8Om25m6ZQ6NJYEZyJFT2X66XxMdY2Ew9CH0qiKy2fKD45k53V0MQWIvnWQTrwCONj82DQ34I7XIZju2Es0HV7GFvKsuNSjFzysrqLXgtm0EMRmV/sAwdunPxz+wzQvp//xreI+mdm//vThgxrNRMcRlFtNuG7VH1S2pd8OZzWBhHtTJEAPiFaf+b57jbIwpgNH21JSZG85GkuJ0txr4gkSnQO/bAwGu2m9G5qOk/qbeN5QvvJukXyHTJdBhPakAgcpkhhUjyOhBwdTopJmHgTFsuqtwPpwERp9I1H6x64YpDbO5ll2bwPJuobwbT/tmQmLRhDfczBWCPFiovVybGV8THzwdc41ofJrSVFcoE4fCsiK7d/kkTjeB0vkKuItVpsibE2YGNCZRXGodfy4a4R/1eVjOuB8uk3+aR3RLoJKH1Ap02S95rXOo3A/Ml8/gIvB4IeWfHq1LiO+LvoeQS+qLx/dNerlWPU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VJgZ/seI1SBcUOVu5opmAc/XIykX6qgJTWsI0y6ekki1IzYFWAcrgXHMTtoa?=
 =?us-ascii?Q?Mnw96Egju0edHapt9X0GsxPVJHM9HIGXZWwhPhEnydSvM83P0vFAtC6iyLMD?=
 =?us-ascii?Q?sgKxW9ZSql34w4tqOzf0iC6BQ/2LCi1PTnsHGtSpkNiDYGnHiFE3PLGEySz2?=
 =?us-ascii?Q?mOSQ8TR+IVTwyldNDT3dYySsHPk544y27JK5st/pl8bzsK1x6i2GncbscLZn?=
 =?us-ascii?Q?Tbp8GZFwQZHx7ZYuIcX3RGySvNu0rDaRHtPpko2K8CRh7Oyy0M4KG5mVe4hi?=
 =?us-ascii?Q?6gtiQeQsAa/7yHepedVa2MAZREb5Smpv8A6cbl4cQ4moAQA3d6Y1dL/hvKbt?=
 =?us-ascii?Q?WExMR6n131EP5uIx6ILWnrllM2E3WDyXMHb/I1HXRXEGwsXKf8U6wR2oOWdz?=
 =?us-ascii?Q?6FyGI0mKKxaIXwUOt2Z8b5cvEQoy/mgq5UvdDymVYgPcsdxQF2pRYXwgdDCx?=
 =?us-ascii?Q?FA090DrWLpUf2UqFwtCynpwzF/qg3LX6iNb9dmDxlj7gSjl8epIgGk4mRk3r?=
 =?us-ascii?Q?9R5FwmPcSVgNNP44TDRpJ/c12vLN/UiM4iTpu+LotT/EmpVbOKXSxFl8C5Sy?=
 =?us-ascii?Q?tVBPuq2S5HHRT7pbJ7JSP7XtWOcHU/gU3tyRrlGO1Ad/PhMWWdPwjxDqCL/8?=
 =?us-ascii?Q?bErqMpFXpBYl8tWCqYInBe5ErnhChDTjqCRTOAkKPvgcT5xnvtFhNhP2BpBT?=
 =?us-ascii?Q?7U9ftrZJNDsjRlP/B2DKRCEimBxachm3xL0NFFl2d8HGme246/YWtBDefeg7?=
 =?us-ascii?Q?UyzyhNDhLOGoIa7TmyDGj8jljO543KCvKj6SEh+Zl8mbH+dsNnblTWinvkAM?=
 =?us-ascii?Q?HNciSjrVF2zZ/Bat+P8L152DFyouBKyipC4jGvSSvg2/antQF7a09pGwEH9q?=
 =?us-ascii?Q?teojtaIOI+2wtW+zsmwDuEHi8deuSQi8cGiUv3cfMlk0deagMzngZUinrh+L?=
 =?us-ascii?Q?q+gtTpfQqWcIEJ+PFoW0PSWKwNBu3aHeaff6p8Kel3bfm42p34MbiG2XcLmN?=
 =?us-ascii?Q?I7VyLpvoYeOHvbJpdZ1n39oRrd3itfKtKWeW2Fs5DI4pbfP4JB1rZroy4Nhq?=
 =?us-ascii?Q?uIVJ9u/bevXovU7aHcWLP8IrhdOPX+oP6Am3rX6g63ImkaXwxZhaL5GjBtcg?=
 =?us-ascii?Q?IrKBCSt3/RDulWE1deL7XbvvCzCkEdVGQR1lR4Ha5SrTnsa02Kszkvlw5Xaa?=
 =?us-ascii?Q?97STsdkGE37ddEMvTJ8Nw0A9l7YkDYc0ntf8Rx6xBWepyodgLfEE7l1kKkEz?=
 =?us-ascii?Q?Wn8DNgMfjLSBuKIa1X3MT7Wdg75yWAL216yZ/svRna6px/j90mVijwTQ/yJU?=
 =?us-ascii?Q?dSAWYCNTqRqV6PMSK5TB+31nYoBVtS6blpoNC8hpUw7Wg6Jf2RI8IlmIFwlB?=
 =?us-ascii?Q?YQxVvGK8ST6YOTnIPWALM+xN4bglySY5+HGQLeXsZ1x6QvrlbQSc3U5hMT6p?=
 =?us-ascii?Q?jPm9Rw6aOSLrKC7LtChs8cdYxST/e4jZqaq5xIIoftz38lUj53uLEVgEuWS9?=
 =?us-ascii?Q?OK1pX+K+iG5k7H731ejm9ng4qSzZ4EW09IAFsl9OcxyoDC0GkSrN45C6csa5?=
 =?us-ascii?Q?3RRVKlWZAJ0aVA1s5iU4SeYSW5MNBhpR0E9dLbNRXc1FmZjaDm7LExNkTCKd?=
 =?us-ascii?Q?COaKhz8mJwQrkRb2NBXNUDAlpq5Biv01GlRCJJZ/9QYeXR2QvidVRopTZIoD?=
 =?us-ascii?Q?L+VsGKQ/4FuTXIxXNTdPLy1BfParB6xWf8YVr3OZHTq0v9UjQvy8PfQBFv4a?=
 =?us-ascii?Q?GdHt+gY2WTrdaT0hhs/YXViu96CuA7I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e56e43-07f5-4ad8-f165-08de7a159f2c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:01.7620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrdCkW37OOePMpK31Xb5znEmBRYeJIfvIGIxPSRRBEAQrcROKQiQzF6LwGPtowoPD2zaYTZ6fJygJz9Jei8KlCsdNog6SP4InZIGMn47/kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: xaMHlpiHTs33SC3ljbdkFFu_ztWOIOKo
X-Proofpoint-ORIG-GUID: gll0LHEiQ2-cEJEWpDUUTuv5mMJUGpy5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX4HfTxPkeJF5a
 26agrLN12Ly8BsHinxuxdCznycKF1mpwETHxRxjqsI16px6nf7l1dOUDyA4FU0ZydlPk71cqrro
 g+b5hUhSuU7ollbEDpQ9bXAJS0RPMFmfJ5x2mqHbVocCWtY6j2JGGRHkg6pJInn5vd0NtNDQyee
 mY10MUed3N5tptMMiw5TNedOTXVD6DwZ33mAY1YYZu5ckPXpxOMKMnCq8RhvteaBFS0CPqmkfx8
 O1GSfNdmHLTe7doaVCCApT7MxgYxO5tfXIw1nTv439TIAL2vo40XpCK9YKIc50AJVPbvFyNI4lH
 MsTuiBOOegJ3I501cJ+sEZeZcPIpLR1EJaKqY4N1UUdfKTVPfPzIjQfyAtpDIVxGfOOlfwSRWoK
 OWW2+E2Ny4phk2cCOakYR/w5XvbHgWaTBviSeGbVcL6g5zOd94VKHSzsSMFhtBjEywHouC5hie4
 Els56INRPIzHB4zg1RA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a86f66 cx=c_pps
 a=/NeaHkXls/iJsjBnUIdqww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=xDSppc4gPdY848Tsl7cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232417

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
index 4d0a726bb6..b7961bbcdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -76,11 +76,14 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall = " features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG ?= ""
+KERNEL_RUST_SUPPORT ?= ""
 # These used to be version specific, but are now common dependencies.  New
 # tools / dependencies will continue to be added in version specific recipes.
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


