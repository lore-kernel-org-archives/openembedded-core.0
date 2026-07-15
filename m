Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76C1C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:03:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6547.1784124198802475910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EvrXFYH8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16566a739c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdAJo370259
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=rH1vdr28K
	xmBM2fjfcJoRFWqY91UgdOXYMRZRxhBBSA=; b=EvrXFYH8yBuJjT6qlCllDH5Js
	rGL0okw9Z2EkPInUFMKlt1kcBkzu19G/eRMl2pwpmHydJsge8YTZ85z6DEMNYx8y
	VJm+hpCllo9TPWqGn3tUFEb1rBBSSq0+VgkpJuthnYwU1rnQS5n6Yxuwz3ghX6OT
	/L2EjLIxYX8btcLnQKamsSx/GzV0d8iJVHSXirdgPV0oQJKJRsCNYvBziVWQkSf0
	RoWP8aFxgK9fZVBrzoOIsGcc0ISmtyypIgwTFBl3UscFSSggICPo5LDVIbLYMjk1
	43QkG4mXAtDc3NJhMnLaUSS835Li9tc1Cc+VbjJe0iad5TSxw+MI1A21JODrA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbcpn67mr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:03:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zG7VsKKYtATm7t8IxTmX1FeAoYLThv2dvwuZlL81pf7DbgfNI2s8G2FV5zGk44FBzzc0sL/OwWWCIBL4814Psq5kwNGw74gL1tksepJsthezr8vUFdgzufJ/6NDCh5jRRaf7euft970Bo8yD4XC3FeTYPuTXO6fwUR3Giqkq3qAfZpbZKsitiwHpU2or6hDqb/tXyCmRNLn4ogXoHU106MRSMOvHlIYleqgKS936Tq6atYaeJefwDz/ikTqm+lkMoNFPqgVQfMOnJWivYRPIF/FzHkbFh++t5kesfqhWnOJmLsAIrig2GPiHL10mQLnS7UtLydDbOjclNt5WFOSnLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rH1vdr28KxmBM2fjfcJoRFWqY91UgdOXYMRZRxhBBSA=;
 b=t3igtJgUMTzSWMJKuLgW6T+s8yrMFiJxI23gFY1Ecmst3vxUKas/WFYtx6ipzoIHOZSAb9p6Mk9nSxJUH1jJZAApiNJj7PH9P6z6GCsAgdUylKDbB3Br3rQ6H+oc3dzjKO14T6GSx+0PjGCJYEcJDTzGemJ6P4/NpQkuUNxbY5VLN3H/mg6V/7NG3B3TuHBKqHboKzv7WpgihX5WXTCbLc8E+ku36/WUwT0hD6XWwTsUreLfeOGPLf160FaEvfOfAcpbIcLT5i9czMc2DUVTdWyVhXRlhnAjwFbq2++53M68er0mDdhifOzecaLW51+udL5gtwgHHj2hjI5ilzRDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS3PR11MB9820.namprd11.prod.outlook.com (2603:10b6:8:366::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 14:03:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 14:03:15 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] kernel-yocto-rust: add clang toolchain check and lld dependency for riscv64
Date: Wed, 15 Jul 2026 07:02:51 -0700
Message-ID: <20260715140251.209123-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS3PR11MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: c3415326-b1fa-4756-4772-08dee279d0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|13003099007|18002099003|10067099003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	pkwewQFGwzVo8yrAKhL4rWM19uq/hwNJNMP7HUt4RuJkBR1LiRBonsFn+0BI0RBvEbVPiGwOu3BMEU4roIsrRazk0ImFiIlIy8PhQpR3G8Q+6WBNxWjqmmNjIekflfPB6Wmq+VJya3N4ikQZ0RnvqoPAiV0jz4KoPm5iMNVaE+amKbifQqS75gBtZBvqqavmrNuoWZbR5lUL0IkptFt0yM3+eRcTc6pOzPjLW+bZHbnlZUNWn9PsVgITeVoPXq48wEamlbma3wDwnwdbZb42ycs4X1oV8hdJDN/sR53fUZ5qYmvwfDTp1n4wOWQmIvhQH9dBA9QUP9hEPwzV71Mg/UlNPlwbkOuUs+wb1X2hUe6XbrZh28sqJPrfhocAzNAsM1ZLGcV/ZTapnwF9tpw3yUu1I16M0cot57rzNaaB9EUS/yMLlBgh7Xyqfayez3j14Reo/IFZpnAy2xyV2TMr4glZ9IJO6pkVMmB8B/+lY8Cy/2JezT6WXbRHz4dWX977xMyCCQdjJlNNzIh98o3iH4aFpJiZ5I30WLhxCxm+udDu6CWgf0eiTAUPHxuyzf5Q2qIAH6VcC5yTgA/8k9hNIrmBgAmDH3BGbqREdab9YpOkhKVsahcoCjJdAQMR2PTf2I1pQoOeZS5RbwdkQAKtYrjxEkCbRRTbhE8iCtaxa6Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(13003099007)(18002099003)(10067099003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9wbUKOseCGG3X498gVwpr3cjYullDfgHpsjncfC/PPM0AkN44tB75D5/4ZrD?=
 =?us-ascii?Q?e8ShlNSQaVVf76rYth2Nd3SLSaCwxqKBOeYHNuYExXm697tZtRDleeBwgOFz?=
 =?us-ascii?Q?zR65QEOg82m/uhFJGVf73fonfeeNcJLRh8ruGvC0Z0NqTtyyzl7COHQnwgKa?=
 =?us-ascii?Q?AuFUZRJdOpIJ/zluMHmkTMUbCsRZd8HQ/J6L1C0v/cLecdipx2U6ZExcZDZ0?=
 =?us-ascii?Q?EevDdiiO1urATmcb43xLN3shhogLHwTG5DLTZFE8/9sypAc5EnYebjJQ7K0x?=
 =?us-ascii?Q?pEB387EvLj2yeZS9nKLH3fbPzFG4/P8I3F4XWCmFURQA852xdKhoSCCw69lD?=
 =?us-ascii?Q?XlXSDFYNgeBIas6xTNMiahXrBbhnbb+kx3wjj+9pvAKHlBWjQxHGxw/LEa8K?=
 =?us-ascii?Q?GGOjB2FNZ79WFWMmoztoOOQBNFoKoF4S/L2Ojw7UiFZAjAHMx1PqI3IpKzdD?=
 =?us-ascii?Q?TdYzUandErDsQQGV8gQmAwwVBhTdD0xcO6peYraXGUe/hgZh8hzifnZQv1Oa?=
 =?us-ascii?Q?la+lMfamB7JaH+t0ockxkK2TYS0AACuUi6TaIiyjChnpj6dOjEhuWsszRYJ1?=
 =?us-ascii?Q?ZE38c9JTSRX3gcNY+tCf7QQwWuwq3shBtVpQgKe+0IuAntqZR3oLH7TnTi/C?=
 =?us-ascii?Q?Jk1qGBua1Bu5lrtHsVD+e6SdTY/hbIZJ1tWanLEznbjQmKbSg8ZN5YDssXFB?=
 =?us-ascii?Q?HUeB7LtFmMc8fxvCLdQWJuLZzJVjPl7RsZm9Ew6IC7plP1tdm3PYFl0fhPpt?=
 =?us-ascii?Q?0/QCsRWOj0CqZLrRhg6atEYX8Ck5Qrj7styX4TIJOJz/9+ThL9xBoRDfZAys?=
 =?us-ascii?Q?QO5LsEEUL08zdp7rf7oYR0Sxu8s/9oQmms7IXalG3lJRdtmLlVLr3MAIFffk?=
 =?us-ascii?Q?b1YS2y+CPa/qpBx1F0llvYke0iwC2UfxgoWNgrPr+btbJoHJDOKggEULye+0?=
 =?us-ascii?Q?/Kynu8aYqsWGQl1IUOIXV+xbfg31uF07VZjSUFWh3NQzSiZhJvAzkwEDwhXZ?=
 =?us-ascii?Q?yP7UDS8H+ZFvgSqJ7Y871rIxmK/2GyqVj0KnMAXUHJIOfZNK0jk/PGT53pRd?=
 =?us-ascii?Q?hLbkEws4Aw0mLfs1fTpTxyXyjrs43EROyrXu3TB1W+R+yNVtFgb+0BOdf32Z?=
 =?us-ascii?Q?NidLUCyF3JwhAb8AYknCjZQoY78Ian++IVJA9XLwCgTupMV1W545V/YlasIf?=
 =?us-ascii?Q?rv51w4WH4M0q8kLwEY/qSC2AsdpbcsbigLiBDWx7Oputth8M09nYGneEEWrS?=
 =?us-ascii?Q?HCBlbOcCBmBruxAuuyYfV6jwRjxzdHA1beESCYlwwr3nsoSxNPdngM/ghTw1?=
 =?us-ascii?Q?qiZ+UyXI8kGaGdzG5JFKk8WalG8Z4UVgvZXismLOL/NpMV8I2FrPHQPCXw/n?=
 =?us-ascii?Q?54/Vi6nAz6UzrQ5YK94ws24S0h2wnPECz+mZ88vUfAM2lQtAPnjPh+orBfSS?=
 =?us-ascii?Q?AQKfMZPygbd8trdCsvoAZgb6w7UXXehzHf9Aox4Hht3JjdfzRlMopM2g34c8?=
 =?us-ascii?Q?akHxWcwfnoqjzRS2dA+3Hbhg4LPChhkqOeUfuXv+U1FqmBGh22MgiVglstSz?=
 =?us-ascii?Q?Kn+hExh47zyTaSZGl93JbTwTgGi+ej/BXwV2795cmhmN/ELVQNP2Y4NzTpgU?=
 =?us-ascii?Q?T1VuFv6b95uEVacNTodO9im/Lu4GPIB3TeIxDopciPVUiuMTLArHwA/nADnJ?=
 =?us-ascii?Q?cf5lk7s+MXWVIGarpa0b75Rvhuu+qf9ZlCDURMd5oCDD/03po0VPWEpB3ROy?=
 =?us-ascii?Q?rSvgtiedGMP7bYce9B/XqtmvdngpmdU=3D?=
X-Exchange-RoutingPolicyChecked: 
	JjBYeyBwwZ26msxdqwih1Kf+HcwuxSeBKcHE2SWbh7u+kqZfklbI5PoI2+Q7jCa/aCEWkVl9m/DRDBXvcT7CuqxPMzgdk4SXLIrJhDeRcLz04nrkdPoCz0Rs4rQxA62oK4FD3lOEvvH8sl0mBARLlLoF926xYL/oONu4TZE+VE0EwcgIVYnA+QOaNsb66Q+9iif3xIFCWAje28WYtHKKxboQNt1Y2KTDUH0J5Ex7WczHRp792ev7Z2TfmgQhfRzQovv6FJxFq2R/IL71RizgfYaodREqdMNu3kGSQfCxkZ4YB4TxiV2udox39zP0ZwcOZFGUa6IAI+NUV1P3V0CzaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3415326-b1fa-4756-4772-08dee279d0c6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:03:15.6160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2mBMmeA3RHW38WzKSq1kH2Sk0XOKq5u4S17CpSyY0aXedMXyo4F5mPy17nB3ib/HH7q1dhYSLSfGYP4Ac2wqjte+nmzJIoHtdvi5oStMt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9820
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MCBTYWx0ZWRfX5WTGPx0o7xat
 JwPXwHE1I6yk+grQUgG2vL5zlfBs8BP0yASsgonNYz8YXyceU8hxuhsmOFXprMUafrjddVK4cFq
 yh89qlC9IBbk8hpKI83YV2cvQLqBXRcn/3UrA7FzqRVxl9ak3m91F8yLEubzVmPKxQIm9p2lNoO
 2Xt+V8rXjNV0d4ixPW0nwSkRVmOQJ7ZWjrr19DYoJb+juJQKsp5FLqJQ7uDLqQecH0PyT7qIxG1
 lOoa+IWHTJozGv6GNVsiG4KrbBVkSgpiasQizR4lEVtVZbWf0bGTXEJ3bcljzbnmT4L3MazrR6V
 ddQFn8Rug30y7jQWmd7Zrh8hO8xHE7gGNlWk5I4gjnOzjsRnDYppdQ4QWu4oKDTCWtOC9VQX4Gk
 gQWPczDdTDKclbUVMd1ErgnrgnJwlVuoKkiI3CcYsCMZi5/WWcuivEG4RegYjD/4KHmZ23UqdGs
 qY8i1dVmAyhogt91gFA==
X-Proofpoint-GUID: lnwRdcLZC7jkWvl3yyOdL_o56nnRwP6b
X-Proofpoint-ORIG-GUID: lnwRdcLZC7jkWvl3yyOdL_o56nnRwP6b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MCBTYWx0ZWRfX67WnafK1JRY2
 k+P377fzVfbKmE+sRX2cbxjfghd0j51Btf35BrfwQ30SceMT6aLKQnWYzqvfGTiRHKNhSiD59tH
 uJMRcSqcctKQ9WBWoEyqK9/RPfiNRaY1cur/cf753xMBoz8yFBYF
X-Authority-Analysis: v=2.4 cv=JNsLdcKb c=1 sm=1 tr=0 ts=6a579325 cx=c_pps
 a=IhFJ2QRitvxj7yHj5jvJkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=fgaXjlHw1wGW8GctxtkA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240959

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Rust support in the upstream kernel on riscv64 currently only works
with the LLVM/Clang toolchain, not gcc [1]. Add a sanity check that
fails the build with a clear error message if TOOLCHAIN is not set
to "clang" when building a riscv64 kernel with rust support enabled,
pointing the user to the required local.conf/recipe override.

Also add lld-native as a dependency for riscv64, since
lld is required when linking the kernel with clang.

[1] https://docs.kernel.org/rust/arch-support.html

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..3f9b2ef6ee 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,19 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+# Rust support in the kernel on riscv64 only works with the LLVM/Clang
+# toolchain, not gcc:
+# https://docs.kernel.org/rust/arch-support.html
+#
+python () {
+    if d.getVar('TARGET_ARCH') == 'riscv64' and d.getVar('TOOLCHAIN') != 'clang':
+        bb.fatal("Rust support in the kernel on riscv64 requires the clang toolchain, " \
+                 "but TOOLCHAIN is set to '%s'. Set TOOLCHAIN:riscv64 = \"clang\" in kernel recipe (or)" \
+                 "set TOOLCHAIN:pn-linux-yocto = \"clang\" in local.conf to build a riscv64 kernel with rust enabled. "\
+                 "see https://docs.kernel.org/rust/arch-support.html for details." % d.getVar('TOOLCHAIN'))
+}
+
+# lld is required when building the kernel with clang.
+DEPENDS:append:riscv64 = " lld-native"
+RUST_KERNEL_TASK_DEPENDS:append:riscv64 = " lld-native:do_populate_sysroot"
-- 
2.51.0


