Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40634E7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 12:08:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15312.1736770110870253433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 04:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3108bd75fe=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D6xTEs007658
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 04:08:30 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt71jje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 04:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDsT2QxHxHsIcywTxas33bva7u23hKfxdnk+28dpz6xOdR3p0BHrvWzgODpEivBeqx0Orc36swQPXfl4QxFduM7OXI7Xn9wRmm9YWdap5m+HRKN1MyCtjfdxKFiRSiY2ujti0acKKUXuaTlT9XTzf9G6QE1e2+H7muCGLI43GvyF4mu5VpoTROGuzRdPeAL+9Gcf47u1xyTRpzEGoYge7DbH2cu6tbpnI5rvlTNyXH8KALXGLKkkyM3F0Oncmy458jjGBXR5Z431OKGZAuFv1OFu+/cZevCaiYu8JUeHSHuZW19V8DCvqyu+ve4hQeQmAnfV/fdG+SHQtZul+Jrinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfnLipf+XABMmg8FdItQ4/LYGFOMgn+/rMWPYUPsg4E=;
 b=N5HeVR49bifwj7xtc7UUs8Xf5Wd00qG453O2xDZxBAtvHz3U10QS7ItMbbH9n0n3yigjiBXDv+hYi4hxM2pIod1KRbFlayT8LHby3zqUfVC4rqDyoNWLn8xLiR1JSohSmLTwrepFgkAa6z7uc0QKBRxBrLS0Xj8C3kVPPLwOjRm078WMMldMAjI+H/AQMeVVhMj19GJn1HyasKDXs/+pgVnT/J6Ud2cfFWxdWW4jsrqHd2OrIpNxbgAp1+2SJRgMnfFsdErCEuKsE+DzE2wFxinMpubM1IPjpxO6blakncZQQA4Is57bSCrGkv4AimvSdaa2trbkKMqeyS3GLiYSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7785.namprd11.prod.outlook.com (2603:10b6:8:f1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.17; Mon, 13 Jan 2025 12:08:26 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 12:08:25 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 1/3] rust-target-config: Update the data layout for x86 , ppc , riscv64 , aarch64 and loongaarch64 targets.
Date: Mon, 13 Jan 2025 04:08:06 -0800
Message-ID: <20250113120809.2847446-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 812136c4-662e-4e49-2a18-08dd33cafbb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Be0878vvnjAkoabMLMCGgECIEv2KItCYq1YInCG15V9USBGHk+7q3o7KuQlM?=
 =?us-ascii?Q?lDwh9FugELAj7vGL0T4yLgqcsEnmUtoRfzRCCqafYjnqEArC5rsGpPsY+m+d?=
 =?us-ascii?Q?nKUzPsR3+bVQant9/FCiYng6mjtsVWd9vGmeAqnWe0HYseGGvW+NmMe9C58Z?=
 =?us-ascii?Q?2DL7iogZQza4tDicCISz5bNQunLuPrnGlNOQ2aYNgnCD0iSEfbtjPyGuS4cQ?=
 =?us-ascii?Q?0x3oUciy//KrSttsV6kUG9VZxh3GZkDVsxZhlbK1+O4eXtNEa8qrV0s7S5+t?=
 =?us-ascii?Q?zvc/jE7OT8Z9AOhs6c4sgiBXOmWvZPra/Qk3Ub3DCZIuqaM6psKOXECFg6o1?=
 =?us-ascii?Q?+D0w/6fnEMZhY5eB/vpNLqBg/Jnbyf68apB9Xie5oRghCP2ej406TyU2hLja?=
 =?us-ascii?Q?b0Ea6GnTGog7mNznngQZsWYB2QEI3/Mv88z6y92C8eNNHh7zrFTpP2F4EEpB?=
 =?us-ascii?Q?pFlmaoZjj9g602+BgFV8DQZ7O7qK+ZvTuFxGq3GrFRhYyS5MG9sjurjrn2Ih?=
 =?us-ascii?Q?d5RBjhbtIn/NgGzKbIkX+cIY9zl29aCW6uy+XMPZBOaIqKj2sxmGSbmo+D5L?=
 =?us-ascii?Q?Z9aujZ3EA16Noks+YcA5Z0hk4iE3PeL21dn5ge6xpPP2fJJLjRlRYpnug9tv?=
 =?us-ascii?Q?+9Yl+v3S6o5f7dis7ejEGWY0z57Gvl47+itgqRrIHN1LCQxiQOREeZVK87Xh?=
 =?us-ascii?Q?BOv69fXfojzaglPFn/DrrEVTKuIuKJINv2ZU182/s2iS2ov9zCEAvWHzbTP2?=
 =?us-ascii?Q?dtuwfpLOhHRqtvXdrFiNJjteYN2y7hsXNdVtu8bq5j+pC1MD6VyoVEM+rj8f?=
 =?us-ascii?Q?A6pOXhwL5mkpK3TAW5P8o33E7iA4Ynk4CusqRcQTQmfm7+ZQGsiACwWTb9RG?=
 =?us-ascii?Q?b7qYx29wR1jfy5KmcxTW85jXX9G7mdYSRzjRhqGxIPoEqsKlFan+2MkB+Eri?=
 =?us-ascii?Q?x+wiLGozU873HvZupF2xgszomvtMJH87Occ0ysEAXyiaAn9XS1FQJdFnb2yC?=
 =?us-ascii?Q?QLoj3hZ2Gm110gsf2mNu0HRbQJiPdjV+O9fShLNCPyZWbjrTGIzIFXATpETm?=
 =?us-ascii?Q?NQ3KXuj9D/ubKYgj1yaTqT2HeWAlWgiYsf3F1+OnvKc8evWD3lvyHwyjFO0o?=
 =?us-ascii?Q?se31nEs7coX1XJdBagKtE4cTfAjyp9waPu1iMvWWHMxGIaz2oBbd64/Eqh5X?=
 =?us-ascii?Q?mQQMcStvTQt3QyZAaSTPK+HkaVhEOLl5LGcoMVuCe7owj4Qa5/7KgNH2Y379?=
 =?us-ascii?Q?Aj5QvcM3K+wmPi3d/C6bwm/hPh7P3Pr/Pq3GmZDMTilqMB6M2d/YTj9X6mle?=
 =?us-ascii?Q?0CO4IhdvdPKoRcAugvHcmp1ugIFtEOPXatpJUA5u4GHftGRsBDnD8omtcMar?=
 =?us-ascii?Q?+gIpd2vgwB2tayL6RAzFzplvHgbJRk/Lt5PEygqkSaxC7PZMvidDxnXqrikB?=
 =?us-ascii?Q?NBNPuTxm/HADVqhBvVlg7yylwobbyl9c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GzEPoLp/+fGCQGnZjAzKRSeUu6atAfqvTGZ2rYWlaOFZDQ7OtEnODln9Etry?=
 =?us-ascii?Q?YwZDWZHLS/f4/cJB7lGiLRGIdxXq5Sos8tyWQkXPGiFf7bN08WuMMBkHRwp4?=
 =?us-ascii?Q?E7pImd0vSDvz1aPAoNzVlHLGJ8Kaf64mHWWRU2Ec0AO9fz6Yt50WuGKEcrlB?=
 =?us-ascii?Q?A/dAiQtJoyAuakW/5u/OakMt1YK4YWEaZ4KrDLIlv9fm6g+Gk28iCplqR34i?=
 =?us-ascii?Q?sqRXgjvTmkI4rR6kLbAYfleyn8PJoq4UAmLbsh+Y0SwmEF2vsMB4DWQZAvhP?=
 =?us-ascii?Q?xAUtjCMeH6AwoXBJmQ8VqufzM4UuoX2g8UQcv4xkiXMHKeD9wEE/AbIySjJg?=
 =?us-ascii?Q?oCThJXzBzwLrwirUDr4rfwUMvm5uy5dN9cQsJ4oE6ZSqmfdGrvXY3gD/tHVI?=
 =?us-ascii?Q?uC4iC1GUo2ytsMsNbaMw0nR93U5XDfyAmhZNAYU92yWD84lsD6iI/dYxHI0p?=
 =?us-ascii?Q?I0NYssmMGp2zWvUWAy/vEO4sH1ahKAq5QSimK07I7kjWOW2RrwTjBzGhhFL/?=
 =?us-ascii?Q?/xqe9/ryQhrguoZHHXaZ03oklF8xgBpZQMMyJDS9omatgqTRzoHqlBx9HOsH?=
 =?us-ascii?Q?/hHc3xQe+jotFEOM/4ypeoOt7LnyFLGzs5fPNA3VFGKxryHUWhxlrGtgVRS3?=
 =?us-ascii?Q?iQEtj/k/+LtuE0oh0qyZ17TYNLwtlGJ3cc6BvPKIAL9Z6fMpKcU20qKW85X5?=
 =?us-ascii?Q?4AzgC1tzf9txuv4NPjne2LPbiQTJdqA03iGEq3Lc1EYX5FkVUawsuO5lym/M?=
 =?us-ascii?Q?JwpuN4frSHTUQYj4sMifVuVoENWpei1kkaR6SwhSVwKyBhYD5V0B2H1kayNM?=
 =?us-ascii?Q?TYwVAcDzq3MvZnX+XoNlDSyqqX60G9jbwuFsozffM7PbqtawzWuamWup0DRf?=
 =?us-ascii?Q?ZFpxNScN8wQe29U5t5GUHNUxzTCLXdQInqKdh3zqVXMtdiz2m1EMKL/HT2iE?=
 =?us-ascii?Q?AaZGHswVsJKvNudQw1JB2QdkQm24BJAf0iZNXKMbkMr7msiOly3lSFxVi2iC?=
 =?us-ascii?Q?VdNmQ8j/VHY2h7k3Vl91v2tv5A128heN6UlEzBq7mSeeLdQcnx0H34kul6xU?=
 =?us-ascii?Q?rKEw2g1cfZ54MOGLdwPcz5glwpw6HyECsG7A5IPoJf4Vc7jbR1t9x8ou1XrF?=
 =?us-ascii?Q?9KfMCC6TzLcwbiBZG4AIiWWA+TeuYDqR3CV3+mmpEk9V/cJobvIVk+rpC+Cw?=
 =?us-ascii?Q?TbVtElEMV3vhbP3xAdx/L2i0ZPCnZX7Cc41qt+k+F60+wNvxVR5Zx9ohUnlh?=
 =?us-ascii?Q?F43GJleab5zHn8kODDLcUO+lY+suMNqEhTKpgqFTIDQ47mv8We3I+llRkVZK?=
 =?us-ascii?Q?JxhOHIzDdjfScm/C9g+iiMmRvaMT3Tw2Nu4Lf19AEpP4zFX7KqV69UiHw2Lp?=
 =?us-ascii?Q?poK0nVsVyDInKLW7u/X71Ot210oW+zb/d+5as0R3BF7mgP3tL00D2o8F45fm?=
 =?us-ascii?Q?1aIRdzOPhU1f1uI5eHhcAL/6Exuj1PVHQ/uIbih0NsecNl2cGagbcLJEYXD8?=
 =?us-ascii?Q?UnhoIXqKYW51oiKEcOyIapfmcu1DzL7sBOhcgKmTVI8CMv28WAsgH1HWhN+q?=
 =?us-ascii?Q?hL1ql++NbnyfvCG5LE2jwfGFhlaWqNZy78lzJoG7Y4x8Rwk599NTmEScSjA3?=
 =?us-ascii?Q?31vjCkgV41XbFn/T+kJueVU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812136c4-662e-4e49-2a18-08dd33cafbb6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 12:08:25.7093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD0xDPwBSMNWVyMeehLjXkRoyDA1GQJ4+y15+ukGv1McXEW1cB0Ia6u5g3dR4M6x1kH46aOD9mu5YT/em3wJndXyidWaXuKORpg831wba1QhQgUN+Z9Mds/7T9pYZ03C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7785
X-Proofpoint-ORIG-GUID: qyOhOtyipNUl2CfoWrrCZ7l83YnjpiZ6
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=6785023e cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Vxcp6TsG9gSaDC-ermoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qyOhOtyipNUl2CfoWrrCZ7l83YnjpiZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_04,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=713 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501130102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209713

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

-----------------------------------------------------------------------------------------
error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128`,
differs from LLVM target's `i686-unknown-linux-gnu` default layout,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128`

error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`,
differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
`E-m:e-p:32:32-Fn32-i64:64-n32`

error: data-layout for target `x86_64-poky-linux-gnux32`,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128`,
differs from LLVM target's `x86_64-poky-linux-gnux32` default layout,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128`
-------------------------------------------------------------------------------------------
Rust commits for updating the data layouts:

x86: https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d
x86_64-x32: https://github.com/rust-lang/rust/commit/ec55a05374d89d206be5140a4759af92f1b42f15
aarch64: https://github.com/rust-lang/rust/commit/4d397d33da8aff64419a03694d152c8250916f19
ppc: https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019
riscv64gc: https://github.com/rust-lang/rust/commit/f414715ebfda201f91f80ef9f28d9923d614d1c4
loongaarch64: https://github.com/rust-lang/rust/commit/4a06a5bc7ad259023e4373e794687adfce252dac

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 399c13db26..67aaa56bac 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -146,7 +146,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] = "64"
 FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
 
 ## aarch64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
+DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
 TARGET_ENDIAN[aarch64] = "little"
 TARGET_POINTER_WIDTH[aarch64] = "64"
 TARGET_C_INT_WIDTH[aarch64] = "32"
@@ -160,21 +160,21 @@ TARGET_C_INT_WIDTH[x86_64] = "32"
 MAX_ATOMIC_WIDTH[x86_64] = "64"
 
 ## x86_64-unknown-linux-gnux32
-DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
+DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
 TARGET_ENDIAN[x86_64-x32] = "little"
 TARGET_POINTER_WIDTH[x86_64-x32] = "32"
 TARGET_C_INT_WIDTH[x86_64-x32] = "32"
 MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
 
 ## i686-unknown-linux-{gnu, musl}
-DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
+DATA_LAYOUT[i686] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
 TARGET_ENDIAN[i686] = "little"
 TARGET_POINTER_WIDTH[i686] = "32"
 TARGET_C_INT_WIDTH[i686] = "32"
 MAX_ATOMIC_WIDTH[i686] = "64"
 
 ## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{gnu, musl} above
-DATA_LAYOUT[i586] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
+DATA_LAYOUT[i586] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
 TARGET_ENDIAN[i586] = "little"
 TARGET_POINTER_WIDTH[i586] = "32"
 TARGET_C_INT_WIDTH[i586] = "32"
@@ -216,21 +216,21 @@ TARGET_C_INT_WIDTH[mips64el] = "32"
 MAX_ATOMIC_WIDTH[mips64el] = "64"
 
 ## powerpc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
+DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-Fn32-i64:64-n32"
 TARGET_ENDIAN[powerpc] = "big"
 TARGET_POINTER_WIDTH[powerpc] = "32"
 TARGET_C_INT_WIDTH[powerpc] = "32"
 MAX_ATOMIC_WIDTH[powerpc] = "32"
 
 ## powerpc64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc64] = "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+DATA_LAYOUT[powerpc64] = "E-m:e-Fi64-i64:64-n32:64-S128-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64] = "big"
 TARGET_POINTER_WIDTH[powerpc64] = "64"
 TARGET_C_INT_WIDTH[powerpc64] = "32"
 MAX_ATOMIC_WIDTH[powerpc64] = "64"
 
 ## powerpc64le-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc64le] = "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512"
+DATA_LAYOUT[powerpc64le] = "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64le] = "little"
 TARGET_POINTER_WIDTH[powerpc64le] = "64"
 TARGET_C_INT_WIDTH[powerpc64le] = "32"
@@ -244,14 +244,14 @@ TARGET_C_INT_WIDTH[riscv32gc] = "32"
 MAX_ATOMIC_WIDTH[riscv32gc] = "32"
 
 ## riscv64gc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
+DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
 TARGET_ENDIAN[riscv64gc] = "little"
 TARGET_POINTER_WIDTH[riscv64gc] = "64"
 TARGET_C_INT_WIDTH[riscv64gc] = "32"
 MAX_ATOMIC_WIDTH[riscv64gc] = "64"
 
 ## loongarch64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[loongarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
+DATA_LAYOUT[loongarch64] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
 TARGET_ENDIAN[loongarch64] = "little"
 TARGET_POINTER_WIDTH[loongarch64] = "64"
 TARGET_C_INT_WIDTH[loongarch64] = "32"
-- 
2.43.0


