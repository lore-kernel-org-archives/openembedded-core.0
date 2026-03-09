Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F851F3C27D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20754.1773078259580340665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gnwyzBbb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295JFuP4055645
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0zCuzDPVk
	P/Ncz9OIxwgSMEfb9ENp4OyQzKkgwcxpVA=; b=gnwyzBbbeuLMP01Ew8u96meyP
	goFShL8lY2JZ59kxcOPKLwMfZelU+mgoWXE3BEgJzmuViZ70EeHFEZgKfRCgHiNK
	6uC+B78RXy+flkxYj0JqsSxQInP5LSrzVu/I+Ag4WRdV9vnaw0kHJNjKNvl75d1c
	bdQ0NW4yBIUfpt3kybZkYSeUF2n/1ZGkepE223GpfVmPyZAF/egkL9glGbzjqjxM
	VDRgNQVb9AhLAql3XRYI9rd7a88eA14vg8OwBvfLXIl/khZ/2FVivqqLw/7LlR70
	yTqfKQnCfa1ddRO4MmkWHIs38iJENkTM27xMuRjIFXUC9f7Nfbne/BUyTd0pA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08277s-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjY4ObG685tWDcqs73jigFkJXpP4nsgDPY3Qtm7C/jTFuRTJiHFqQtvwPvP+0ox3Mu799XGWv3sYpEXJUgleLn5goDaMra0ZtB5WuX2o6rTuItUIJkHKL6hsxs69b90MBPjj7qosWp6bANHIpkXdZ/CS7HR7OHIAQETltbaslfvi+XR0O6ccmUc04AEwxdceC8ulVz/VN4Fc85BWj1hKZybdWWcboHiFecncKlN20BEU2X8oKS6ok8VcknFqIPJfqK+75Uj3sHwBMDr/5K++QVVTwJGhNPKW+3QmxQwAg8xeqhvJrhDWUm3pU/E0+f1U/no+Gy2s1yxG6k0KvQJcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zCuzDPVkP/Ncz9OIxwgSMEfb9ENp4OyQzKkgwcxpVA=;
 b=x5ujY16HBeNX49wf57OMCvnDLrKml1BIfoLhAEAbfsRiLntgC0N3227z/alGOEdA+5XJs0GgxYIPZJzrpV8j581/mlA4Mm7FKMNpd1IzZkUvFamM7TI7O+jQmnRAWo6U5KMUcSMwiIkkcEfmst9oUtk68o572tOeizGyduQA/cFFUCIVI96vXpwgUU54dwRozS49uKjkXaZUJmzLwyDLQJZxwpUlDo4gO59cd79k0fNbMafK8znwu+nDQYXTlpUjttNG/rcXMmlcKSeDllKif9VV2OHefvOnD/e8YqGMEOsNPA8vfwrolSyARBsDUGe+WOlTiGkRz/u9gRf1P1pBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:09 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 00/14] Enable rust support for linux kernel
Date: Mon,  9 Mar 2026 10:43:32 -0700
Message-ID: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 81995938-a9ab-45f6-1d6d-08de7e037794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	kqZCMbUyXpnjGJAh1UDhd7qvJTpwZKzFbu2RbIxh/ruzOGmuVcBIdX/CFxKtnvC3EXkEblic92yD79rEwRFd3b4yVSgkr54WQmt8gJeK5q0kb784GC1PirtxlVXiph+qf/NvjYzAH+3SS1Cy9LdiSfk+DLN4gNXLWCQEYKxt9jPYtvH/L6QeVNFJXoNfoyzxjTB12HxX8z9FFUdwDVxD/xqPM4/q0RVxFEy5iX7fZ9EuBgtIRMFP2y0n8rnyd4w8brGgG/pRxs0kChpC3ROxBylpjK22xyPH3hx5SCi2B08BlJbba01n4BU67HaDlF3oqGJ6nIp4NmQWM6l60v1UDB9TDmCzIhapTs0H5krykglqOyK4ZxtrLQDpsVhEUUiy+fNpn9zW6ED4hrRHk3aF+62VijgvhzpmcbOFhlOgaX/gzdwctX4gI7Gyh0brcG2X3sNGxoDoQ6p1UeyMPENDRJSVxaZW7gaEvDkBYLvtAcfWhbbhAITHyyAit6QlNB1OqqD4oKAk/wS6aEhcXo+9c0ZdjeGaz29kxQm38vi87ad8Gf6bhaIL/9VDrOdu3zACxNZamy8MGm+AKWQSdhUOxlk0IYjhDVycyjYmXj8OuFK9ojFYbxLgxBR/cdoAHlqydVv+3C7FwAeOxnnTSZ8QrvQzyQnqjuLoE957aemB0l0jfGTtJZ7QDCrbOiqLSJyDDVaAaACzeQ18nnInSJrmNtOoCH33nsv5KK1vnbfqDk7AFESSDlWyp+B/XGHhh+j4bTq2yFhHmji2IXsbXhrny70S1tYvHBEOIE3Ro9Owe+M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4FmsRlD3xf/4bIj3x3dCmcpkHuOnLusJBfDz4lAa567ckGybtQzu9vnhWYpG?=
 =?us-ascii?Q?Gm6QShdzNOJqM5kP/b10/b60dMRF1vuGk5SWWWPdB2vNPyPsg6JM03s+eUlb?=
 =?us-ascii?Q?34ltoBY5fF35F7KdHDr89fGFlViYrqkX/Iw82iJYn78yFnfwNioMlwmvxqiD?=
 =?us-ascii?Q?0baBnHFhi5t0qKTU33ZW7i1pHHVKgenABbNq0i8cm3ObwBKARqZR/tyYk2SH?=
 =?us-ascii?Q?4jlxc6mH+Eldgb1CUGp0J4WJeYo56wRzdE359zzNN6vV47Gv4duObe39zuBn?=
 =?us-ascii?Q?Dli9YcfDbj0g0EfQsWUW1wOsphoLRtbr35qi/wZLMu5+qvcn/x0Q+bB+nASV?=
 =?us-ascii?Q?71WR6Ayaytul1J0bmEiXnnaQQeLYYnyib7Kpx01B2INs0fDrnXR0mtOe1fn4?=
 =?us-ascii?Q?amxiAoN05jeMjJ7eE8JFtMhPonvQmXqdyfcqiunFCw2jpgTMmDg95t+l5WXV?=
 =?us-ascii?Q?TeFwM/F/qg3f3Yxlf3uhCkEAPppd6aNVz/HfB8gpmshdWvPzoMIA3LzbY6E2?=
 =?us-ascii?Q?T41AENwbVcNLEXFGIZL1PG2ckQcZtFlZlNP0YY5R5GCgY1yxo6hRZ2npWOzT?=
 =?us-ascii?Q?F/CcsX8uO2V6va7OgjRW81Y5HWRJszCZhwwjpKjrvMImSrU1K9u7fjn1AW6Y?=
 =?us-ascii?Q?/j54WfaYtQtnJB4eiiVwU/fXToJcV545M+3TIjSl/mPAnBELZGU990DIMT6v?=
 =?us-ascii?Q?KH8M4NYC5z+OA0NMXwZLvze3JFM8xiUoht1Uoklywj0vuKLZpLqsfAvndy8i?=
 =?us-ascii?Q?rAEGS74YCcYOQ2h3Hjq0VbEdDWqHN586vl3Uw3bCNn/aeCAvHXzTQTREtfe7?=
 =?us-ascii?Q?g938vE4bMbt+vMVJByxdzmfHdkXFHTpLwLVrbkC2CHQT2nSZ9MvymQ0+zbG5?=
 =?us-ascii?Q?NK2L/BeFi9Ucln6uZYOSomjyhaNAkr/wiEJmu8xEYKCH1lW0y5i4k9F/ZNuR?=
 =?us-ascii?Q?RYTfTiO5d+2x9Ng7AZjufx5xQ54RmCrdl3fi1ZG11JL/1Y8F4dfJP0amTGpc?=
 =?us-ascii?Q?4SeKOu+7wrnv8zB2PaNx9r1RP6JlM1d4x0sumsN+yztUNssp3pjEpbtiOkwh?=
 =?us-ascii?Q?SyMvpXjIno2UqMzfTdByxnf1URc1S2I7aVxHm45v1yf4Rw3LLrqtI2NOXucu?=
 =?us-ascii?Q?VztTYWhxyIj8m1G+L4DHeABKJoApi6qfHueLbqcjRETyz1xqnK+mYFpFrGqI?=
 =?us-ascii?Q?/Fo/5952EhJAFro3qu1FMFfC1gnrGPS6xtlasYAYihmlFvnWw57n+qsIcJIQ?=
 =?us-ascii?Q?HxuTtYohtaxZKgBflHdsPYrDXY/lW1X0X4iq1MMXvrV78iNumxhtK8wWLRWA?=
 =?us-ascii?Q?GydKR39mF3/L98UYHpUzb4Ht/EwebTKvHUJ99XShSAOjFNK3S6gvrksPZJvk?=
 =?us-ascii?Q?92wvfhGnRdQCpYZzOgMo1bc51wYFwEmI0i8Vn3jhaLlwXmknSTOKR/R/UoM8?=
 =?us-ascii?Q?PrpXHZ/k6hyD/HpwpsMcAWi/B2UNbcxXRUcNLRcVo6bIeISB577N/nmWExTi?=
 =?us-ascii?Q?SRvLNqJX+wahIBlnvFidHEXgNdIeekTpj1QOQwFmbgL8uu81J7yXQD5wYqnF?=
 =?us-ascii?Q?ySK2D3X+UiS5VuvtiUSgQWeIZrh7NLjvNOsZDsdqCXfpjZ35rNP6pLSGVTnG?=
 =?us-ascii?Q?wykE9VcRPh9UATZCogkokF3PFMqQu0cjslqsqbowcYSg3GYhZgEkelgkn9e2?=
 =?us-ascii?Q?cSRXxQ0LctSEZL5gmWtFSTrw31iGaEj5mZ5KGku+H/GC649m6yxzZdEZOb+r?=
 =?us-ascii?Q?jDTDn5VXL6fR2Ced+WkrLbyjU7w3mNs=3D?=
X-Exchange-RoutingPolicyChecked: 
	gLz/B/UGekzgWsIz+CSGp+BNvngMZGnYBb+nXw3YABwpM6Gw5IcduHQatr4qZun7CdOzdVpt7c/DTAxTykNGeTN+zzGg+qgYRMNZapvYCJGS9Y9Vn9npC1sOn9eh16s+YBIqQMSYye4hiPLJ7xKdIfukrqStxmHafscuGFxONGZfW7o0b/Vue2Tft4TYKT+GSn2WJHDy1xOQSaugZ5hxHsteYm0jcGc86F3ZARivNckglAbYqNxfjVJ02FFSNfdzRPEn8MbyqQhZrq9ORyfmNM2qpa4BayXjip2bLmFZ0VVFKXEA4JEoV5SxoZVVyyEkH2V0LrCLUAxmLiETHzSWmQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81995938-a9ab-45f6-1d6d-08de7e037794
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:09.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTQ9rJPD3hAPEG3qK+ORNjFUsAz2AFEvutAaMLQjczkOhTm20PzZsY7uEUCaxmlKmUwSjhzW7Ex4HwQCr0YB91EYVIfRByTkrjxfcomEqD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 4vyWhPzlkSUYTI2T1zQPt_kT-eo4CHmm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX30p3KsDBvtT2
 aMHQhd9GJ3BCPfVP2wsUsqnQSPX+h6xUxuJ/e1b6pd8Ti/Bd0pMZtVoJVBzvMhFEN40sVY8TYZR
 N52QR6ncmDPbb0kxNKvOMzDrVbHcAC/OcZPei/q4rcOCNCaSl9HOMegdLk4m584TzYgRlpBIzWy
 OVEHQyGYJ5FamxqkRAfXZjXEhWQB72hdXE/7BnyaKodRuEXdJqq/MTzH8U6MudO9HG6V5m3dtUA
 5FQGrpCXzfPZv0bAT7Z8Glvj0mAH9jfBt0rapUA4/aXrPU1yC3Dcz0DkfOK2LjK3R7BgX1z7p4T
 BbxTnC04+amHZW7c87EsEdJC/IUJZye/xEun0OyvopwEW3v1P/p/OfLGaYNP5xtj//jYNb3fMwY
 w4qVP8z3YnL+Q/p9/2PAYcIpU39g1PmI7V+19fPSU+AUICYf+MFHb14b1gyT4gPBFLhIxKs4X7F
 jiWNqPL/g7XaWtd7+8w==
X-Proofpoint-ORIG-GUID: fa3lioxQfMIKkcKdg_IEZlUcNNkVSGzn
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af06f2 cx=c_pps
 a=0nW3/h2Bs9e5w/EoXaYwaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=WeFqfoNDRtzSbyxFUP4A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232739

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v8:
- updated the code to use bb.utils.to_boolean() when checking KERNEL_RUST_SUPPORT.

v7:
- The rust support in kernel runtime selftest intermittently fails on autobuilder armhost/qemuarm64
  because qemu.run_serial(modprobe <module_name>) occasionally returns incorrect status even when the
  module loads successfully. Since the test already validates module loading via dmesg, Disabled
  status assertion check to avoid flakiness.
  Bug Report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189

v6:
- rust-kernel support is now can be managed with a dedicated KERNEL_RUST_SUPPORT variable instead
  of DISTRO_FEATURES. Kernel rust support changes are now moved to new classes kernel-yocto-rust.bbclass
  & module-rust.bbclass for ease of maintenance.
- Dropped patch "kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation"
- Extended disabling of cache to make-mod-scripts as well.

v5:
- Regression in autobuilder with v4 series is due to applying v4 series together with following patch
  "llvm: enable LLVMgold.so build by adding binutils dependency"(https://lists.openembedded.org/g/openembedded-core/message/229387)
  is fixed by droping Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091).
- Updated patch "rust: install Rust library sources for 'make rustavailable' support" to install
  rust standard library sources for rust-native.

v4:
- Resolved patchtest failures.

v3:
- Removed the DISTRO_FEATURES dependency for installing Rust library sources in the Rust recipe,
- Extended support for on target rust kernel module developmet by installing Rust library sources and
  introduced packaging of the Rust standard library sources in a dedicated ${PN}-src-lib package.
- Integrated Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091)
  that uses the Rust bootstrap tool to install Rust library sources for rust-native.
- Dropped the patch that added rust-kernel to native/nativesdk feature filters in bitbake.conf.
- Updated flags in the make-mod-scripts recipe to fix build failures when building Rust out-of-tree
  module recipes.
- Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
  nativesdk, as it has been merged into oe-core.

v2:
- Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- Updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files
 directory previously stored underrecipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample"
 by appending KERNEL_EXTRA_FEATURES:append = 'features/kernel-sample/kernel-rust-sample.scc'
 instead of adding this directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe and
related build infrastructure in the Yocto Project. The goal is to enable building
the Linux kernel with Rust components and provide support for building kernel module
which is written in rust and also provide support to build rust kernel modules in sdk.

And this series adds test for Linux Rust sample and also added support
for out-of-tree kernel module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Add required dependencies ('clang-native', 'rust-native','bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 02: Install the Rust standard library source ('library/') for  native,target and sdk.
- Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 04: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 05: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix build issue with make-mod-scripts recipe.
- Patch 07: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 08: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 09: Added oe-selftest case for the Linux Rust sample.
- patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 11: Add support for rust-out-of-tree module compilation
- patch 12: Added rust-out-of-tree-module recipe in meta-skeleton layer
- Patch 13: Fixed buildpaths errors for rust-out-of-tree-module recipe by appending --remap-path-prefix to RUST_DEBUG_REMAP
- patch 14: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Harish Sadineni (10):
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  kernel-yocto-rust: enable Rust kernel support via 'make
    rustavailable'.
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto-rust: Fix for buildpaths errors when rust is enabled for
    kernel
  make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
  kernel: Disable ccache when kernel rust support is enabled
  kernel-devsrc: copying rust-kernel source to $kerneldir/build
  module-rust.bbclass: Prepare out-of-tree rust module compilation
  make-mod-scripts: fix for buildpath issues with rust-out-of-tree
    compilation

Yoann Congal (4):
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 17 ++++++++
 meta/classes-recipe/kernel-yocto-rust.bbclass | 25 +++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      |  2 +
 meta/classes-recipe/kernel.bbclass            |  1 +
 meta/classes-recipe/module-rust.bbclass       | 18 ++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 41 +++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.93.0.bb     | 19 ++++++++-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 ++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  3 ++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 16 +++++++-
 11 files changed, 150 insertions(+), 2 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
 create mode 100644 meta/classes-recipe/kernel-yocto-rust.bbclass
 create mode 100644 meta/classes-recipe/module-rust.bbclass

-- 
2.49.0


