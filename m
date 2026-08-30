Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A5CC61DE8
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8124.1788094773786246617
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O9s4w5af;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCWvtk1340729
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:59:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=spu6LgBl+7cLTjQkydjwH6qEmS1cLOeAWqqOgnYyPgg=; b=
	O9s4w5afm3VrVrKH0QrqMOgRgDCdM3WnDuO1hAVh3lDZaNHCQCnLqk6MD6Y4dJum
	gr76am7Dofub+aIDElqJ/QooX8dzyJDXKwkvmzUKLZ+gk6eI3DX8pMJNfDn+civo
	duW8PVDdN9Y4C4i5Wh8Gf6Bxy1GtLxtRib/wYE9gfco3PSYkO+oioCE+g5zeg+WM
	s50LvEm+rgzKZaFOO2rNzf2zMMyTVy7V+1iZMXTv+fMPE1VyzXMD0gGffencuYKf
	eGMSEk/zW9VHBXu62+5cRSZfGZgzddvSCm6BJpq3Ebe1fBLKv+91SsNdpo8GXipp
	58qCQvO2qfsxGqqz7dtykA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021133.outbound.protection.outlook.com [52.101.57.133])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe8wc4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 05:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFTn4r8zu/V/xFfb70mYc2BxqfegxQGose0w4fcPRLH3g04amFPNXT36njF/XrmTtfmG4ppoq0SaNqI2eGdUjBOF3+LTbH0qHeJaIwV/EfZhdyFmIg+7yTWndI+BRSTL9PUtcDk3R1Sji8NxQGootj+hm7bMQkB2OoDUMI2QTA3kERx9OobQvhKXqN5RkB319ZQhJbpbLYGxrrvOM5B9ALWbzRVCavGYvEPaSJKiQnsm4HR7QgoyEI52KOnsLvGA3V3d7+lKUuGegZIqbxt35nP+JojWG1mEQ+EEzXCvlygK+F++Gk3SKy8rXX0LqA50GfebE3h+GHciRGgntPYsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spu6LgBl+7cLTjQkydjwH6qEmS1cLOeAWqqOgnYyPgg=;
 b=uR1+afK665zOYoj3+ua7vyTlqtQAX+Ztgy7hMalqzHs1IYteLfA2ewp78+/lDisttktPr4uTEXnlKXjiw++TEfMscU893W4hA1+6hk/eTWsr7rri7plJz37SPkL74piFamYUpIIsFGBEQbF5Ach4kL2Bu7dcLnypyhV38LLJ0UqnvoyCxI0qo8fE3eqVScZms1KrrOMtP8XHZJfULgI31GZBxw2iUCBCWRYZPUP2ITgOQmIAK1VOBtKK1qb4r80xZN9NwW7YSCSy96eT8EbBURgR1gzgBTa4X9CwgjpDcDBq72aMzdb9R1tZUaFwAEDWxSLil0i/PJ2ZEn+YBmjQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:29 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:29 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 05/11] rust: Do not pass the removed x86 amx-tf32 feature to LLVM 23
Date: Sun, 30 Aug 2026 18:28:45 +0530
Message-ID: <20260830125853.1139807-6-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a8aa9a-ec1d-4312-97d8-08df069686fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|12006099003|56012099006|11063799006|13003099007|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	xDPC2z8yRe5+/uz10eWnDYOgwfvL0xZ2jnzvPtaijcKVGcobVzSMDVuCh53mhc8nDkS03rHqhXUp+U1o5M7j1GMl0zwrwVE4COSVEVzELk/XarSUxzvHA7TgF9jog6Dmji8UlyR64BfAWUQsQi2TnWVFFDx3MaGiKZLNhq+lV/cu072D+MYk2o3nhyWQqlLOXh3+XJ0Sqj0WP1dOFHAPXl3aYa3pZ3awuCN0MZhp+a53O5fcUF5L+VP/8wn32uC5d3pRyABURfts6kmIGRqGnjAoFo8iPdp7QuxGPAYyVUoCROz58+1me6cNLs2LqtuBvVuUgRG6MhHCnnXbjKreC5qtUf+aQpxd+elv9Rw5Vut6YvCoz6NBwxpj7oe6h9NEPpKLFQVZrH/BDCIALGaO6c2cE6UVw+ulfjEvqClGxBEMwX0F9bjtESXTfHP2JKR0hGP6zA5XETmKlnOnH+1aq6dGb4kE3+qmdbXEHcuiSA4i3f7CO3/fN4XlfSda67OiAkrIUR5ZYNQZxRfzjpGWXHQXdkKRmL9ak8nx8jDBWylcTUN+iDVxVcz/Xk/ct+qar29UrGmU15MV1yFN6opkS2Ak2SFB19mShMjsK7KwKS+GmK7xcYp/U8sNSebYww37RxDK4BLR8cf087WPpsF7G9DNpkfntGs0RJ4xDeT3arA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(12006099003)(56012099006)(11063799006)(13003099007)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LAj2Q+hClcBg5LBnA/xGZdCCbruCD9y3XUolZ+UUrnKoQ1v8p4L4DHC9rJ4d?=
 =?us-ascii?Q?d1JZxuHab+eR0G9Spf1Gi/tcYrH+nla5TwuQrarCK3GaQYln+eYvqK396sMA?=
 =?us-ascii?Q?weS+3R/3pAVc3yfcZb+HO0uE76EzP759weC6Z+VHgRDFKFMIt6knL9bSVqDu?=
 =?us-ascii?Q?3G3bb7lLyeF+QBMkz9caZETX1Ih7LvWfo91SM6wwjzLmZRnOSCTx3hLfgLk7?=
 =?us-ascii?Q?TQMdhHJymL4JxFj20tfLLjzZbcFxh/gN9cxwRKGbUd2eORFAqnbENOANHpx9?=
 =?us-ascii?Q?miFF/59nvVJUnRGT7AUrTCZ17uATIQYOP9IOw6pc8xYTSYfiPCXS03gFIM0v?=
 =?us-ascii?Q?Crokjm4pbxOSHn+3z0G1VW0OUn04Z13r1Lnm+J2+nhTQDsLmWQ6DDE7+Dk1I?=
 =?us-ascii?Q?wuT1tJjwSvimzYncEpLRUlrrLSxaumcH3MmkngDduxDyLASTBkO4koUFDRSp?=
 =?us-ascii?Q?WPR9KuLXb8PVPwZudtyQMJZBHiZjHLbae2VXqL7kwkUgYnZ9aMGUSz6XehYn?=
 =?us-ascii?Q?6RrSTAuM6WGPOj2blqswcfTcbr/Ew+ByNOY9f2EyMYIcs2zicUEtwvdcrAWJ?=
 =?us-ascii?Q?HRMud55MDC3jQTZZ9xYPMQhbXPPZ46ZUp5vcQgkVMxc39TvMBvklQUyLlREw?=
 =?us-ascii?Q?yozY/S/pfhi+++95yqmLkBodEzFfkyVPKcddOcyrdENrwXIXzFYnH626JoBx?=
 =?us-ascii?Q?DH5Hwc+sG6xxKoCXnZfPIAXXLi2IJCz8YWh8cLF4hBEKodNATrrXqGk+kz8d?=
 =?us-ascii?Q?EEhHRpAJe16DC3P5UnhX7yUhuE75x2RwT8k0oUx/uE0vhh0NIF68fRfUCwuq?=
 =?us-ascii?Q?QOQvGuMLcY4hr21kfFktZRTXy+2fjJYFB8DpXvvZP+akX/mW3Tm2T8/fjop6?=
 =?us-ascii?Q?pKMGmgR/XYy8rb7uGCEqeAe9qZBtEGXtXsuFBK+iQgzQsjN75fk8Rj8QszeT?=
 =?us-ascii?Q?hCSMM0kRQ/ScjQHaeqLilm+mpGbfGTUgjhu6xaLPpTBODwSsQtvuK56vVqVO?=
 =?us-ascii?Q?Y0hQpwyZiUagsEJNCL3DdvwYiDqATnYDYa0lmFVLRonx9AJTKMX2jvzPt7qM?=
 =?us-ascii?Q?yPaPuZ8nAg+kKn9ucx0+edIYNvLeNi3fIPdkU12CkNxdc5qH6tlkEEsd31Tv?=
 =?us-ascii?Q?iiKQXNuPuPfz9rLCJuMsJihG5Bv4giZqxsekYpp/hkalmxqKSYJPGNPjM1QV?=
 =?us-ascii?Q?19mRM0z5ogcGIFN7v9rUqsWyf3uZ3OxoWqmUGsGAkcMCrUAow7uTfLsQOsnl?=
 =?us-ascii?Q?COysWPPBb3UskgjfxPKxDeYUStlKSo8yWz5OOq1UDQwdjK3lVAjWIex4nDwO?=
 =?us-ascii?Q?m8cTLBaYscKvsTcXyZaLTFROvF72HGRR+/2W2hX3QmH7WFJcM8CfQ4W1R6qu?=
 =?us-ascii?Q?4PhkaeL9S7nseX6/PdhbjkdwOgX7KyqrnvIorIoM5cO0dJRsvgWz1JkaSi9m?=
 =?us-ascii?Q?4U2TmUct3yxmbLVz9vNRAt8uK6YKObvuIHn7c2VO8C2HyNR1YThFsP4hVyMo?=
 =?us-ascii?Q?n2szKktoBqnQQvBZBuONEBrV21EOzfhI9TVHnqzz3Q6pa61LjuPwtCHP8+eg?=
 =?us-ascii?Q?Ur1Ii0xWiH9fGsJQzwNlW3GpS4g2QvGNoklzIN/y8pM/wm2MHx4Qj9EaOPNA?=
 =?us-ascii?Q?RFOvAwC1wzFPBkh8+Ho4ZH3EjjLScNisZuKdMnUItrlqFJnUSIuiMkEaMajw?=
 =?us-ascii?Q?4N3VHkz+kTY/g67myyROCCfrNGrZCZQKkZEJH6yBV9I95oNpq656mkDZmiHq?=
 =?us-ascii?Q?A0utKAfbWS0lwAoRnYv5GWNcyfiIyPg=3D?=
X-Exchange-RoutingPolicyChecked: 
	jEJaC4Ohv4BSD5+qmrUZM6B4pllgYxcBvCke9ofoI24iBqK8Cz0J//FWao1Tj84vcdp5rx6/SF3XGpIsjgYJJByGejBJ4odMR3E+Tp8unjdIuhwmmHi08x17pYMnqxNPTk+xSBFedH9hEwxgIseTzfj09uy2kyDgG9YqHXI29xgHkhJz9ZjOsOLiLgsQrFTFDMaS2ylBbX3Suxa8vMdSyAcP3/TkuJTydOBl6zdWjYLlBfEOME+jVZ/YezMlcwgzGAYxWmlH+z3bM5eNgKYFHuvAOFK3vfs1KFqsGQq8OODcoG/8bsoXa/iIbsSC8cklhICzOmCbu6W0K6NptO++lg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a8aa9a-ec1d-4312-97d8-08df069686fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:29.0438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5+8u6/S40Y1BrJdTAXcwPmbhXacUV47duiQWS7vtDZ9f2dPMft/70RA++wWR9ejs/uy8rpGKMpqGgLDBjEefNonK/6C2WP156YOVfZyW2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX/AtvYm6Y4m4n
 RyxkEIz4p9/Eb71RxSXvhcIY1Hn3drBvS0qyny34h4mvPV7p2ulw+HRCRypyXB4HjFa6bY5ExoJ
 t5n3HqRCb9w0Rs5K5w39Zlld5efFbb87gVi1hfh2Z8SLEvh+bkBfmIdAw/uKY8btVYgXlFx1SNM
 o3iijG9At3b4RKPtclIJ0rNSR1BMqHGKkYbcKyUxWycJP+uKui86/a3CVY0RMI/jMGhzUwNmYuU
 qH7JCTQ/gqJhHeB92MR/blfbprIkoA14Qd5NA5FRzMie+ip83GFWbwlfn94ES/eKC002LkZqFz2
 bylvfBNR+eEdrZHrOArfm9EaP7aQ6iTbNyOWBAe3BIerLJo89wwh9D4AZruIdlur92fLtibk/r7
 ZgaGIZwUtjwpnc0pjZpe/VF54mMXAJLgKDNLS1kYgLw8rlRThTNpfqn74hszDxEX6lCnwacQM+m
 PyfN0cAlLcyYZpf194g==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a942935 cx=c_pps
 a=EJv/EIs7sVlNY2qgxPh4EQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=VeraR0jozFGurjmNoBoA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfXyDx3NciC4SdV
 DpgzK9WeabBPTxiE+IHe82dantHDZV2WBMhJOYENOI7Is4yw/Lw3fD8CFCg5Cwe1ykf2XTdcIuU
 nC8d+KbUGA0+u5G3lp5UsmKVyh14QOYAvwPEQn0oSEym9Kxwlwzh
X-Proofpoint-ORIG-GUID: nnHx6Y_4OoRDeW6jx3JpczPQatBJxdJb
X-Proofpoint-GUID: Nm0DYhV-p_RYYdPn-JDkgiq_xS4kF7_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244644

From: Sunil Dora <sunilkumar.dora@windriver.com>

LLVM 23 removed the x86 amx-tf32 subtarget feature, so a rustc built
against LLVM 23 aborts at startup with

  "+amx-tf32" is not a recognized feature for this target

Gate the feature out of to_llvm_features for LLVM >= 23. rust dropped
the feature entirely after 1.98
(https://github.com/rust-lang/rust/pull/159310), but backporting that
would change stable rust behaviour, while a version guard keeps this
rust working against older LLVM majors too.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch | 38 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch

diff --git a/meta/recipes-devtools/rust/files/0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch b/meta/recipes-devtools/rust/files/0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch
new file mode 100644
index 0000000000..99fcd334c7
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch
@@ -0,0 +1,38 @@
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 26 Aug 2026 16:30:00 +0530
+Subject: [PATCH] rustc_codegen_llvm: do not pass amx-tf32 to LLVM 23
+
+LLVM 23 removed the x86 amx-tf32 subtarget feature
+(https://github.com/llvm/llvm-project/pull/207673). rust 1.98 still
+lists it in the x86 table in rustc_target, so a rustc built against
+LLVM 23 aborts at startup with
+
+  '+amx-tf32' is not a recognized feature for this target
+
+Skip the feature in to_llvm_features when the LLVM in use is 23 or
+newer, in the same style the surrounding code already uses for
+avx10.1/avx10.2 on older LLVM majors. amx-tf32 is the only x86
+feature LLVM 23 removed; the rest of the table still matches X86.td.
+
+rust dropped the feature outright after 1.98
+(https://github.com/rust-lang/rust/pull/159310), which requires
+LLVM 23 or newer unconditionally. This recipe builds against whatever
+LLVM major the layer provides, so the version guard is kept instead.
+
+Upstream-Status: Inappropriate [rust dropped the feature after 1.98 via https://github.com/rust-lang/rust/pull/159310; this guard only exists to build 1.98 against more than one LLVM major]
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ compiler/rustc_codegen_llvm/src/llvm_util.rs | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/compiler/rustc_codegen_llvm/src/llvm_util.rs
++++ b/compiler/rustc_codegen_llvm/src/llvm_util.rs
+@@ -286,6 +286,8 @@
+                     s,
+                     smallvec![TargetFeatureFoldStrength::EnableOnly("evex512")],
+                 )),
++                // AMX-TF32 was removed from LLVM 23
++                "amx-tf32" if major >= 23 => None,
+                 "avx10.1" if major < 22 => Some(LLVMFeature::new("avx10.1-512")),
+                 "avx10.2" if major < 22 => Some(LLVMFeature::new("avx10.2-512")),
+                 "apxf" => Some(LLVMFeature::with_dependencies(
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d87271b29c..f40f1652b2 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch;patchdir=${RUSTSRC} \
             file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC} \
+            file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "271fa73d8174f53d713c46a8310da7bf7cfdcfb8b7cfd1c2b74b84a83ae9fb1e"
 
-- 
2.43.0


