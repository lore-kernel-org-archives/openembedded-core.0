Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B50EFCE33
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24440.1772646255672736020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GUit39eP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244htXm2188631
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 09:44:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=siQyC0UwkaQjRSw4a786w80d5C5GzzdzVmulZ1gM61Q=; b=
	GUit39eP3G1Ld+aULz7/WQ6NUiBCjB1z7fc0y39pLt5kkWcJZGSk5a/mn/2Gteye
	R1xtWJzODZ2fofKhuIHUqbKTV/VlDVJ4vxSvKMiJNscRE5w3VTQ5yaDQFeqqKBuV
	WsxrFQ7DWyVIpX1QKT7NV9Su/xoK1NMnDeqqeE1PMPeferVmDkksUlYLdgFO51NW
	4MFaY/zgL8OFRFxZ9uqCB+t4QX+1OKpCZvJUSf+XpPtsNMpjXfnTpVNHgaXclsMb
	2GYh7O+KCsSNkcjq1LZr5Bfzy27+wCv9isa5V4iiEGWGs7yT6km00vQTOjsotRz1
	hCJAzgH4C8alff0p5J4x0g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgmxvh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 09:44:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsdWTRNlYTXTZO2hBIqCjrGL2AY8hJJXD0PTLQs4mXymIcwma9ABbYWhaD+K8XQWwTw3yemY1vxmg3W7V9QZv5Y8Qbxu7RW1T+ho0lJw224+5jTcCQZAj/EgFjBkLYN1INTjN+iWC+xe6zY7qklrX8/NLrH1UF+cPeCHLPS29IBhb8tBT2k9oZUBF3ZKL2jBVRbm5md8fSK4m237NKJ3+/4hkKNjKfXhKeFGFGAW2t2BjSlU1JUPfdTNz9SZ4WeJiHmp4NMnRZsRYjs2mUUTk8eLpR0F8KGp8AcbkITPKooJKkIraSW2GIMBoWT/Lzu9wmt25TluUMthwEJ1U8YdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siQyC0UwkaQjRSw4a786w80d5C5GzzdzVmulZ1gM61Q=;
 b=gi1zo2c/IX1rJRkXfuEF+k5j731+NhyDhs+RbQowgwOzBc+EY4kWqEjBRdZafe7UKf491tPTCJgZ6YFiiuZWwCOuLl1yY739KBp2G+VDLodOsbHFuddN52fVhxSEx1RycTOv6OokepTZtSja4eHxRFAeGfb4mGapPrNaVYrdoQo5SzcuqH2SCkoGj7qRlRdpK5apHENTTOs2jnGTO+rjhp13sx/CGfg4D4z/ZwO69hMIuzPorQhgD2BPixyJ6aDr7x+aqc28WGXi32s136F1kpKNHkruJKFO9+VkLdf0NGNgpVdLkBZeDO31N1wYZgZULksjcguirNj0UwvP+O2HzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 05/14] kernel-yocto-rust: Fix for buildpaths errors when rust is enabled for kernel
Date: Wed,  4 Mar 2026 09:43:15 -0800
Message-ID: <20260304174324.1186644-6-Harish.Sadineni@windriver.com>
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 6660165c-2794-45af-68eb-08de7a15a4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	AncHu4wuZb9TZm3UUh4Zl+oUapav9iuStrXLpY7qF8guB67duZGVAVQojn80gLavOwupYksVa5rsRsZOTRJJripB28LfDogpP7U0gXRzpXV1re/gPjUcF84X12WZOuadAaHXtmBWntN06OTnFSLd5fGYSvb7eyCmnaTuJxzqhOH1jO69v6BD++uXuIqGKq8CUE/mkpT6+Wa44G413/mtees8wb9pnePnkbLFnVS0IU0ue2SADJblQAN9Ej1tCHJ2T71ck3/AZyj+/9N7pVh6kqDU+WgVg5t1wjiXMG3WBpW7aJLhbf8oHN1TZq1qvSU5a7MmUu0hoAXYPM+QU5/ehxUQGhvPuSpdFEJNFirUREtcctQecBbJF/g0WaXP1LLcgXdMrYxVpF4YesWlqhQkG2q8uQD2BE3738ewbC+XlrLNb0LK47a8v7pyY+3YxHLgZdoXN9y+HuieXDJVeYSc/kG3GPb/GBt4GmlSBaNvwzt1NHV0YqAcPUU45HijnejpCJMK65TJU0c/HuB0riGu8J0D8idSXDME9NDSWAQC1ZoTFvEX8M+1xwgMcEPBi1+rHOvoaSxn7WYP3pTodWRKLV2/M4J7EbizC9oCzTNDkfUmlkq1YLD+5mwXyzodD9QoW0uB17EJaeb5j/2zHViyZAmXk+fcInp5hA437c5FGWv3nzteD3G+z62K7x6OASQE5Gn+Gnk2jlodNdIiP/h0yIPwmDYxya4C8zEt8OWTm59Nd1+t/+iMsEbNOtbJOR2El5u1YMsoZu6ivd+0VtQ0ARkG2BG0IFwMmj2400fkqQ4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EF5EiaQw1rNiCRkwpsn+M5ZM23yS1SOWjj0aZY2ZYcHLX2o83P30a/lUzV34?=
 =?us-ascii?Q?4SVJr5sgP8Td8yG649dY9oet5llZv3BNpq3DO99lMEgMFoHpMcLooaeBMYWP?=
 =?us-ascii?Q?JdVyigekJK1o6tRJ4+2mUWVZH7EhOAZd0R44Dc2WhrH7AQlk02FDo/SDyYNS?=
 =?us-ascii?Q?tERj3oCK3lrmgp+tXV2/oTsY5r4VSNNhPvaiJEph1KBmVsSZ5Yy4Fs6OWCzD?=
 =?us-ascii?Q?dJRnW7+pBY5qvlsIhVDlLBMhGpWh4IMFQAcx7UbhYFeRT1qyDZqexlOwBOtM?=
 =?us-ascii?Q?aWJ6sd61ekLc2GN6N/vT7r8yfp7IheYN1wY76MrSchHFuuSN5mg7VZC7hHY8?=
 =?us-ascii?Q?b83MRX2AvllOai43+GaR33gE4xfAq5vmrc8wWjxrBTfZWm3lieGXu1ny4v6Q?=
 =?us-ascii?Q?ApCK5awfO8XUvg+jkU6LMYPBKCraTT1boOXaJFsB/rHEqwt3INHKEvgQHSOk?=
 =?us-ascii?Q?Jh1TxWBuYwn6Bz1B2g543SgthQCQhVBLN7PSNZ9Tj57e1+Id8c5SWnVeaPRi?=
 =?us-ascii?Q?r04+Hm8l/ky0XPHYjcQDemaXnYDjJaGIPqzkzs9E3VVti6OeQvtI4BltH6R7?=
 =?us-ascii?Q?XxMlsCvWZsGQfk03oDB7cBtAZuu8Xudi9qNbkDWtvvET1GOM1SI1jyAaFC4n?=
 =?us-ascii?Q?IhYfcjRuNVFz8xekIK/Mo5J52WvQBkwpH/2NShdriNE1V+o6W+N6WoSnW1wi?=
 =?us-ascii?Q?lVG4oELKIur/Bd1WI6Xjr49ixL8hwnojODYiTGULDx8LmroNqyFR1CBcSgD9?=
 =?us-ascii?Q?tkiur4UIXgDsxZM2oyQAzYudouC/J6xW+n+ji1Ut2ST2QkSsXdC/cOnKVDgX?=
 =?us-ascii?Q?MSvf+L4el0UtVh9rXBeeCSfIyPivBeAFidbUSRPrBoImSCGuC42v+OGyI3JV?=
 =?us-ascii?Q?d3PFfhr2ghaL9paOqmxRfC0V2gr27ksCyDBukwE33moR09qszbd/UoLj9rjJ?=
 =?us-ascii?Q?/E1BX6DO1BzFegygTYotJ86Pgvf3bJoBOhUbOg0kgoJoKYNgvRje2/qO5fHA?=
 =?us-ascii?Q?9Y9haS25Kw3KKZAhQKSN2IXsyJtCjwPLVvA/XkyhrO9UcEhp3fZyroQEc9qJ?=
 =?us-ascii?Q?UeAEexqy4hChbWnXGlUVK/28+y+DAVcc8j/57kp4i+idPg45p/ipDid/hSvj?=
 =?us-ascii?Q?8PeUywpypkxMF7agpQDqWhM8i+Umb3x6a74RZv7KRd6Q8NQvJbvYbbROKQWH?=
 =?us-ascii?Q?wgHwOavRS9Lf1zS8mjwveV11dyrwV3OWP0uT+8TGcJ9cCmq9b7cg8aAqGXrd?=
 =?us-ascii?Q?VuocdNqSGCnYUaqUO8Y6wKRQsM3TcgNJfK801kNcvTMAjrtKJfr03kGrSZp3?=
 =?us-ascii?Q?LfCAsjdpfvsECIElphews+uknGsaH02to3nFFCDsTI4CCfKIjzI8CoK/TGCh?=
 =?us-ascii?Q?CaoyV35YLV56WUKBTW067SZFvEzksABOjKHnLGFK51cWhlu4hG4g8dFLgzyW?=
 =?us-ascii?Q?H91ECQZvyVmLAFEJHGLC1yAsjqkEiN/fO4V3GyGAlIFznjB8p1PMMLIwZUrS?=
 =?us-ascii?Q?+CtMcLT64JO19HaQ3zMeG3bJsV5HxLkzZT95fKcaWWQc5tK03Fp/lspL11pq?=
 =?us-ascii?Q?lDETV6E4l2skT4tnGCURbZRgimJFXpf+qeUC2bqZCYOAyfB+4BzcC9F8FWhO?=
 =?us-ascii?Q?zmnNrTiV1We4xKIuHIHElG+3xa0QyFij1MetQ1BrOztwsDf5Ym6MShvWt4FO?=
 =?us-ascii?Q?7pNboQoKCEaf2rRa4Xjensop/UODP50WIDtVr63aJfxGEmVKG3anUQfG35V3?=
 =?us-ascii?Q?cm6DsHL6IX9sH6zJQTYhe4l9url0y2M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6660165c-2794-45af-68eb-08de7a15a4d5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:11.2944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lv/FlY+Q+sbkamxDTnqA6+MX53jaFYI/XwSeod9we+zKiFQ3qbKxH4UYvOY2Iy2SNwClJD4womywLlQ02CFoFxeyZbsuRceRAik107v6Zqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: sIhGtTPEAZgDgMbmWi8Z5Y3TqlPtao5e
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a86f6f cx=c_pps
 a=56tib/hgGBcemyuyLZC9AQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=JTVBbxAFR3XZCbc8QrEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4Bjqw72XZ-3AcGd55TzEnQtna7p_GJ5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXxHxseLK3x6IQ
 brPYjYMsB9yu4MsziuFF5jb5JwEvacR09KQ/vrKuHL1AvrmtVoMkjwcsEgnLB63MeJm55eoQDIl
 dJW6kHnFX3onrL+dgV3V4oze4qks3F8aCwgm8HL2QFHaRX8BckbGs1Rav3Ep/VpO3rRLsbqONf5
 myod1GJkrl4LMdUrYvwwGzREifwxZ0vACajHJQkATPyefSvX8/biBchTIgkU1xbob+qp80Hl2GU
 G/Lz1y7D4ixG6Jr/t+mkmRNPtUiFFOlsDDkZhZ6vechtCasT/0CT2Pwt8PGy4B7qblBJjKTdZ5V
 Ga0jAxmIfmY9BXjcdPnLb6/f3x6yOP+f+DCzV73oZOwwo1+li5w9/d/HwGQ2lPIJgeo/uKt9YrF
 GWmzZWpB7129NBUULxq/6wskQmiUxYhdpyVQK/Cxlk5MaIdR9x1xfROcmSBdqK+2ocMEwMRzoQd
 iS+Cm6tv5rVd+sEz+vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232421

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after enabling rust for linux-kernel

-Introduced KRUSTFLAGS to pass `--remap-path-prefix` to rustc while
 building kernel with rust support.

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 7acc81764f..fd9ee91c79 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -4,6 +4,12 @@
 # SPDX-License-Identifier: MIT
 #
 
+RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                    --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
+
 RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
 do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 
-- 
2.49.0


