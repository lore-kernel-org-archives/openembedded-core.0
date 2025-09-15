Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D508CAC599
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 10:28:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29398.1757932111868371239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 03:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eIGVzg/h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13533b6b07=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F7x5ZW3939639
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=eVHLlbfPSWS7Z1sIWuCHICmHk3Kq1dLNSOHyXGXNyOM=; b=
	eIGVzg/h8Op3EF4/Yfuv7TtDChEFn1UNmjjCzQRJby7q5lxPlu9SSYDoFYYUe1V2
	cS4Bo5brryUoFWX83zYknsZiFETMie1ztYCrh7b0XWEM0Sx5sAa5AIZt+6hcZXI0
	o6nx0Z5tFUzh5nDIQQLkCr9/faj2XBf/XLD2khy+2a0WDrK/ddeTMbA5JkdKTdxF
	U0kCCDKG6ZWsaKW5rCe+foXSqXbEl+1yErsKLbUUjnyKzOWB4Wc+3umMKGsyU/xs
	oYSik2Pmvjsbe0ob+G6sSYSiFHZmhmapOY60lyHuVXK1OtYdVGwo9waELdcXFT4A
	D5fCtnQGB3BUgxzrbAgn0Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu11yft-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8ZVT1EyTm3d8lmMWqOVQOBslTz7u+WlqTs6SKI7LW/CyCq9eq97b9eHxF7zxLX5or8E5j/tc75tkFeTu3M35O/89LMNR40U01m1iDELQlkFLakpfOza7949SB5nkOVOQ0xYr9FSzQRfRb6o8AODqh9MzsXdPkHLsrBuMbRWDLm8nhsa7iLtS+W9OOgAQVfqB2ox3v0Vpp4CShpGVShD/lypoMN/eyS+RXwmc6ciQjHDljSqhmet8hEL8OYkV9CG2hWkL27IhZJoTar+Xqkur9rn7CHDdGK+eB4wL21G9AKndkN3GUvxZ0XB0JCRxMUcu5Dcjqv/jzmFkALif9/ZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVHLlbfPSWS7Z1sIWuCHICmHk3Kq1dLNSOHyXGXNyOM=;
 b=GARb8LII++K74A/LLHzCnlUgRFuJtjhmVLftf9JnLwkzqdwou/vJaFVFgjWN9bh4wNBgLKP4KTJ+jr+E6H5WBvxrH9OUTJvScHZtJmO6n7/xeSUqQxQAgulsZGJ+q5RrmUYOcyiwV4+36AkA8sJsHIHhFFQLQBpPR8FlU9tUPpSK+iHjYbNQZ1trcJOr7BKinPRWQZW0xSWn7nDLiH34CTarlQ3lyLG0SrpP8gEkO+B1UucDW6xB6/Ah+1YqVI1shxn39M96GGGaDelyiopQ83Sqxtli+gkczvBixjSK6ysumQV4Q1wR+jhVM5l2fNt2Op7WU010fmH6wFOWpfEh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 10:28:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 10:28:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 4/5] oeqa/sdk/cases/rust.py: Add test to verify cargo build builds for target
Date: Mon, 15 Sep 2025 03:27:49 -0700
Message-ID: <20250915102750.3298492-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
References: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: de90e621-33b7-4614-eca1-08ddf4429c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l+z0qVblHMhhNma6qtGY6cfjMOXkAoamxE2OpbcssWKpVHI6Q/jryY7Sgyt7?=
 =?us-ascii?Q?ZurihIU28iOgEpvlj+/AQifEaZE1KEoPITVE20uHcqX5YE1Lu5UCOfXmmfP+?=
 =?us-ascii?Q?wCf7aXD6JyySQnKziazPxdQl2PN5R0o8pjzYJtedXZI4ReyNH8V/9bUXIZs/?=
 =?us-ascii?Q?jJRZgK3l+wpb07BkmbRB1gHIbIKve3tk9CQ0lHOR9/2vR/7GJvsBo7PTFTWf?=
 =?us-ascii?Q?8IaoaE+1zUnwnds+05LKK/t1l9yqU5PWYXJqHaO62NHJXATAxPNaIKOAu1K2?=
 =?us-ascii?Q?PDDmmCHRBm3zF1dEMeieFSVrHqK/eeKp3M2z2YUNdO66hJ8/QxaFH5YJKCKc?=
 =?us-ascii?Q?FqIlT76eoUVCjlNwqqSpOhbVieXkb1b9onPkYC06imyiJ1mheFKxRCPofjqu?=
 =?us-ascii?Q?YUBMVEfpZoOXp18U4N5fJhBCuBq79uGHZRe03drIg8sR9n6l/Q53E/7LvWwI?=
 =?us-ascii?Q?biLfLQ7lXROByCtXfhmblekj5jpanu1XF/kNGKXUMM5o6KMFvxyJSvpUEMME?=
 =?us-ascii?Q?6eLLZoAOdXBdlcFtH15nOJiCUInnQxlw5iqdxONO+sU1lQ0ZZ/HLwPZX+tVp?=
 =?us-ascii?Q?ULeOsWR/FGXQNo4dvU37/RRkC/bHtXfzkaYvbgJhCyyTsztYFpLobbU9OTjJ?=
 =?us-ascii?Q?LXh1erq2aamVTB+99bEzhoI5G9EAc9+mk2gocyoYSgf/6C/9pBQ92gaX+TgK?=
 =?us-ascii?Q?TVUHaEwbxOSl6f7r7HPyntQnFAi1RaTTjRFUl0kwsWVsWmq9v5vCKA5bwjQb?=
 =?us-ascii?Q?rhx7lbHhWwfQMWN09mq9+uULzDGNSlo0ZmEUB8ugoiZyvxQmAs2fWSq9VAjt?=
 =?us-ascii?Q?hw+d84BuR8iBTnCcDlWLD8yCugNXfSMtBulOGbLcAm3JBJmQa2zpvHZHQOVb?=
 =?us-ascii?Q?40ZAuJoltxh3lXx6Besg4J+/Vu+DpTh5ogRY+7Jy7cjxmhhL4QKgl8HayW9G?=
 =?us-ascii?Q?XUK6eVP3ljjbanCJfQiuhUPYSjdbyuMnaYqjGwiGoSUhNV19iVsx41Ph37kE?=
 =?us-ascii?Q?YkdSYCaeylqS/DGtU3q21oVK1fFx56st8i9X7PWjutezk2sie0iocZqgGYNp?=
 =?us-ascii?Q?kBi5/1ooiSYI5ZSq345URtXY+QnIu+2c1/OuIW06fgBoDNMPcARH+MLYkel0?=
 =?us-ascii?Q?5wnQ3y70R2zd3+SgGEwmTxETb/mHVPMFJiQMYm6v90OX2ry95JaIQO1rUxFo?=
 =?us-ascii?Q?YLerPx6HFnOYwZJZKf0Bp/t/j9Vwid9ShKeBFVuSbjRxsWYXd6eXNNcztFI6?=
 =?us-ascii?Q?vylBlOjBZbIqt0Ww8KNItNRoEiWCe6PzEu/tqUqnJb9OUoWhsfEjiNvXerkP?=
 =?us-ascii?Q?VT3RRS77XnCVZJ/BufysAxY+sHoOdRqscCONmnfK3kbhkq6UiO6MIcHgjQ99?=
 =?us-ascii?Q?GXi96LqjqjZ2TY8l+OVIsn0q36UCFRQXeVj2erVzReO5mRCaPKZ0NghRsjoD?=
 =?us-ascii?Q?ogDaQ4Fjn+0O44TcUiQ7DPTqXM/TQTJDx1+JnePlELdjWidJLAPGKw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l/LdBI9n7xD7CKMRVG/kMeJWJ4d7TPb8eee3VPLvCqak1AWm9IhS1YYFSULz?=
 =?us-ascii?Q?dNkQKLTXsmiF5erT8UBCOggxZHOKUrk4132jNW3fihOiKAvvXEElpSECD8SS?=
 =?us-ascii?Q?PB2np+ld88lKWHoM8tEX4BFfywsUzSiL5i2KeO9RU6u37vsfb9oDKqM0oVMk?=
 =?us-ascii?Q?OG/FmcS0FdSHUp3Qp0IY7avfG0eoEA5XvP+hPzcPAKSU286IkLVu8T4rTUIa?=
 =?us-ascii?Q?9LPv2WtOvAPdWDbNrohS0v2bfNXctcETrfet/RgUOm0Za3/dDH3A8Mag8acR?=
 =?us-ascii?Q?aGjSm9SAI1leoxwCMCe/UnySadvOaMT7W5k1NGC1ukOVi6vZKr2LCW+zG9Am?=
 =?us-ascii?Q?V3B6Gfu1OVOcoX05o3aklHFRxWI1YZdd7nMwr8xPb3o7AZXwmKDjBYGImvP5?=
 =?us-ascii?Q?9VvxzeUkUhVNXxKQHTwwExSntFgQMj08Htgisx4MJ7g6Uplelun1vAlnNqpj?=
 =?us-ascii?Q?PZuVY0nUrD6NO3FTlnjDSYbEvLVGeOGo+yHrPCsJ9kC5FZTlNRGDAdm+/Y6k?=
 =?us-ascii?Q?IRp0ItbGZT6mbnUCp3kqVhd9LFrthmeUYj7eOMLwUB21ifLlk3nr14dXfJC3?=
 =?us-ascii?Q?MXn6+lCjLuc+m/p2yGAQfTPUEI0M3BWEkRgDWzu/r/xbiEFTGiJ74tQ/T9gn?=
 =?us-ascii?Q?GtN0LAlQwP97EwUC/aZTPi5DfSrQa/ekV5tBOM5mgDo+VjSsD2W+n7KDdNlh?=
 =?us-ascii?Q?4KPeuuRQWxLtdd+gvqA+vUGxQxtgcm6XZEdBy5iI3oq/sdXI9woaMg8KSOOj?=
 =?us-ascii?Q?mHKSJk4SLwuw+xW1gJzwaVKLAZSDoBilPhOaYlS5HU8Waf3fJy1be9VyS7f4?=
 =?us-ascii?Q?87QbfE6phYI6lbtr/ZBVCFQ5OVEyS7w2opgEZuPu/dZY2iqCRyjOwrKwZ0aH?=
 =?us-ascii?Q?eQjAnPESiDxAcdg0zzrRiLSm65Vzdx8/fUVbixYZ3Sx92a+/bqcXAp7Sja0v?=
 =?us-ascii?Q?oky2qsUb3ZF/Vibz9kVk5W5FJLZVFDgH/gVQ4UO+wkp/SCY91EBxmWTEbPF4?=
 =?us-ascii?Q?7JPuZALKtyAdF44buRbTyG+vGCF+FpBkoYpWUwtXeX/mCKA8w4IGAg/2bBvV?=
 =?us-ascii?Q?Lvprb4BNuqiwkphtrP4i4zHOfW4wKYUk/Y1D/UxtnIzFY1xTO4w1bgBMbnOS?=
 =?us-ascii?Q?lFC1jcfQf7CvFwbq+DRqXOFOM951nSYw2l1CGufw+CK1Dzf6Occ4WxkNgnFR?=
 =?us-ascii?Q?vdF4r/+Iz+bG1pVUepnX+4tvav67g8VPRAAJr3tH75oQPyMLLg4+IGwtF6qw?=
 =?us-ascii?Q?TaS64cgirCS4PLp5P0L+0vA4B+LVrWXbufK1maMcGRsqNkpruCXem676JaYh?=
 =?us-ascii?Q?TqT1TWgkwaPe38BkvhAu6nu2S7SWRIpCkTZRrrWHTpoNpXci75hdlMWI+UMM?=
 =?us-ascii?Q?tGuekwBLF1uEKeVgiXYCp5GXd6rQPtzn/Q4evkeC57qAqxNASCG1Qvq+LbgY?=
 =?us-ascii?Q?OGW9PXbxjIJInYlKDkdb0+6AhgJ2OzBAHaPMoi5bkPhXvBrba+Yr2A7EmSbm?=
 =?us-ascii?Q?wO4lYyCyO2ftjiCmlB/IGfh4MHzVQVYN+tB8rwgrCruCiS2MOs3ZV7goYdHZ?=
 =?us-ascii?Q?XVdJAOLer1nYGlnO8f6epVq8NE0pat2/2SF9gMN/0mCJuKi2mMQUqH0G4Szn?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de90e621-33b7-4614-eca1-08ddf4429c07
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:28:28.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8NtKtOeD3g+G/4w4fgWAfNmKLOEKNmwIPYVPg2IDgb7Glp6AjCBV4TryxdrJSCU0u8rJJ2UsVoNh2BM8jzB7kRoVJuV13pOWCAo7ea5qC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-Proofpoint-ORIG-GUID: ocNAMdKxZHBTCsesJsGt1xgrkmiGIiy_
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c7ea4e cx=c_pps
 a=MTA8SzjkfSP6DqtUeP+PaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=QTTmFulF3CHqR0WvevEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ocNAMdKxZHBTCsesJsGt1xgrkmiGIiy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5NyBTYWx0ZWRfX0mi4UBrgfi+W
 4Ul9pwOgOvvlfgS5Cy7V9lMT9s1ZctcS84IavjxLWjbF8ep2XuFjKJRHDI/JanCKnZ346EcLcH/
 GvRACDmfO2YMrM5g8glrgVByvFCes226reMI3Lr/Uj9dcRcZ4r4xG8tqIexxk0oFZGEez6y68H1
 0VkYzSu+WjGU+9cVbvFA6jCjxAXDKWeDj4ajD3fg8OGc+s4sNwZ/qHOzmdPnpiCup3VpO6y6kmJ
 SrIidE3/LTOkr3nCtxYE3RZUYKfDfHPsNuU8Eh3WQBJ0bBmaqRsvnxXNgTvL3MIuyjjffvG6Bir
 azsJju4WQFYO5Z0owYTt61DVOs5MLL/Vy4I6Jsh+6nflLM+BX365GOclxBmuUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223401

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Ensure that cargo build successfully builds the binary for the target by default.
This test validates whether the default build process produces the expected output
for the specified target.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/sdk/cases/rust.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 4b115bebf5..17908f21f5 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+import json
 import os
 import shutil
 import unittest
@@ -33,6 +34,21 @@ class RustCompileTest(OESDKTestCase):
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
         self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+    def test_check_cargo_build_default_target(self):
+        result_env = self._run("echo $RUST_TARGET_SYS_VALUE")
+        rust_target_sys = result_env.strip()
+        result = self._run("cd %s/hello; cargo build --message-format=json | jq -rc 'select(.executable != null) | .executable'" % (self.tc.sdk_dir))
+        lines = result.strip().splitlines()
+        last_path = lines[-1]
+        parts = last_path.split(os.sep)
+        target_index = parts.index("target")
+        target_triple = parts[target_index + 1]
+
+        self.assertEqual(
+            rust_target_sys,
+            target_triple,
+            f"Target triple mismatch: env '{rust_target_sys}' != path '{target_triple}'"
+        )
 
 class RustHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS']
-- 
2.49.0


