Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00B5C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 12:00:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52838.1786449592800207329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 05:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jrwDJUj0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26837d46ec=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAMwY54069273
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 04:59:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=n6hC9i7xl
	biYl3lLyVpRyVrZEF7RWjnFTUtczKidYqE=; b=jrwDJUj0WagLTqIXYzub6HJDW
	KDqqhlHqIz9B0iyLYBaFkCfOXkfqLqqxkQ++yrRmglaMniAOl82dPp9ltIaq7Ctx
	ight9M5+uXEmkk4FFZ3nOxHEd5CbUyiIxmQU7Kfymp/hevJtqd/RC95Rwdw2NlhB
	hygdAyxlbPSexYtbAS0bx6JMFVHfS+hxDRrSmnPlI2A5Aos2WjPcV6AgDmm1CX/3
	7fUzU9qCw+80A0P2kwF+I3o9ac4cc/rz4Zagp7/qJ9uE0weeqICtnDL/o1k2dSTR
	Z+bIWS96Ealux3ZNcajxvgQ1wS+7cLFL4rJQmxQP6hIQLNQfhYKt/4dUUEWwg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022134.outbound.protection.outlook.com [52.101.48.134])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyspugp1f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 04:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2v/icoweD//9itcFZCiOO9/aAXXI3C6KUJoMExB/v8md1hKR6E9r4RfEaffx1WWNDxYwYuq7i3gM+pJM44FgLZvLxbTpSeSjYbW/HRrATk0RHpHOLVkTEkS/Qph/+hoT1d1zzSk5l0b08CVqJIOVIH0vZmBndQBLsBIUYaVON6S1Rb8SzpUBBnNgnoZ6ginC7PulpqysBEBgW6J4M8QpFW+cRLtTNBuRlUsIKI8c9TW+5rcblf0/j5S6jfYiR3fZ9FWFSUt8n9pWrArOnSH0XvGVjLPEBDsTDO1LRFE1UG+Z9U42MjKmT1rtsCF9YEff3xw4DpUXoWLAVy3iwTp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6hC9i7xlbiYl3lLyVpRyVrZEF7RWjnFTUtczKidYqE=;
 b=afLSffyJT9WqT0ZMjLHLsuYf1vuiNIn/+VogCqej09dXIMmOQOmABVpwjLu8ZbqMgvfQ4zO+CE7R7a4R23mi+6J4OfPo6vBrJiBz6FWP+8fbclbIWJosSRXNzonrBBdJR+qrHc/Mf+RIMu1licyPR/jQ73tVQxCfTBWctLwjNXKQSdUoi187J5PMEFUNz82PtOavUdoX5rr3BzXRAj4cZQrUJFOjJqP1nFRFHIq29p9UeZa+/+/j4m9rd/C619c2ayNBzllXdXTUfc0R/od0NY9xYEgGW8i+wt/Xx9jbmibbUfE8Wb/eQEFox7iw/31lfz1/9lsiGeDSVWTsv8lzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:59:45 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 11:59:45 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH] kernel-yocto-rust: skip recipe for riscv64 when Rust support is enabled
Date: Tue, 11 Aug 2026 04:58:55 -0700
Message-ID: <20260811115855.4033577-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN0PR11MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cfc1da-1339-4306-49eb-08def7a00900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	89UUY6Tpiip7zMIYBI4vN9gLhfmn/Z30oV9uRosGybKqlRz+PNQX3FaYMc+lge3V48/77lxe+fbhbjbWcjNhQnlNbL/JgWYTNqvF0S0sC9yP8QHEy0tHhrynEYRTzd/r4NcoANgxxBK2yM5kKDtSPmjm8vouWntvP+6g1usmHXYlRuX5UYCrOicOhDnQ9HtG8e4yP7EbUIwSUfxxOpPX+zF03w7I+qowvZZRhw5g4AlX4xOjFmwt5IHGD8uVbP8sOzqKSJNbqEl4HCeeSuwuB0XL1sDaUfj932MDTz+c+OLClULUE72jRfMN+Hjw1ibWj9iUbDUYWmaJ/vVlUdXbdXFqNox6GQhTiq2O1bxDBM0vVo+yHdwBH83/Uhj60FeXVN+ZNRBUFyBZAZ3I2iQ6bwXvrtCpEoN8nBHpM+qLOV1ZwkGxG/A90JN+ME3T6W5n1TkTUD5+n0Nk3cLPLhVI51AYn8lZCy/q6OhoF9Xxlot1cIPfmJMOW7mCuW1HeObyun8Z04DyKdntdE2vHQEvVxIotlwOy8dnlXOFdfT2lu1+mhguwTG3RDEat2iH8Hjz+DBJrxHa9WkOSAhhpS0FPk48lRC0EhaSiCxksHcVcZm/VdXf3zpAAagJX9KMrYEjZlCkF/Dm8tAGIP47r/oBmIMluQuzK7ZeMHlLa3eS+pV5mFS8HXOQk5YuDqXwUKQfHnsC6oKqA7bLhTgNk1V3tcGL/vAbYSNFbpFek+FR10Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/fAF1lH8tWkAc17RM6YKI0MG6Jm340k02XIUN6+UdQrUeXk6vDXP60i6yzjD?=
 =?us-ascii?Q?j7v/1SnwPsy6JYuvv0wNk8RU6j3y+eZxUaC147X3C5IpF1uO6YzlXiCChd2Z?=
 =?us-ascii?Q?wca7qT91G+GKsf38LA/PwS+IS9wNcrOkqS2uEc8N2nHmKTG1roPJeg7OQmLL?=
 =?us-ascii?Q?gTVJjAR/BWH2MSNho5yFb4UfqqRJGsw4D0GlK9Zh3amdePKLoZy+m3oCSJAt?=
 =?us-ascii?Q?10jkfU7zwgMdgqs74pDRnGA+fqy10QAFFsN6AHw7WOhiW3Dhn9HVNTJZirje?=
 =?us-ascii?Q?gVwff812eimSkKmn8pEeCUxMrEwHG4LE30ga3V38rNo/mSJmwyBPkbbOq5VX?=
 =?us-ascii?Q?j0WiR9hnjb1rJjHwM0/cPlme55GrWeFi6GAC9AshhBJDJkiPPpeWYCkxVHLY?=
 =?us-ascii?Q?Hks/akfh3WNNSt3TssfKljC/8NEllHlL7WtBMJGyZtcO51ICjjXsOoLye46V?=
 =?us-ascii?Q?XWLAiNnSeMtR3FQ3uHUgyxqIMoCfYWLVvJ4xUOU2uNDzpfRmE9ZKRp90KiaB?=
 =?us-ascii?Q?EilekiPba+O8ZRIGJAZhmLL20GnvsjAhqy9s0UjPLu4dTaFXSzTeiA0jfm95?=
 =?us-ascii?Q?GqHcXoIsgWkEvSZtfqUA2wgThHrIJhKmAO/H30WQRTbd3lDCGEVJ1TWE5g9w?=
 =?us-ascii?Q?ShQGxsKohL979v7YRAVPXwWJxqOvieirpmBWJfvpGB5ymstWPaIja45ZzxIQ?=
 =?us-ascii?Q?mc0l3VrhX81dZ0Zjs9nnjbdC7dnDrS45Jr64QAirqz18fZ9FdgpanMtu+seZ?=
 =?us-ascii?Q?YPLWbIJprp7Ep5YvN8LYpzsfKExSEBearFO3jqKvcJLJqsnS/YvabLLAFs6q?=
 =?us-ascii?Q?5iGU3VJ7cAPcqdRkCwb6Go7dRLBa+oyHeN76vdNaoKqerxM2E3UsG0vCMb46?=
 =?us-ascii?Q?7Tp64yNMv/Q5OtE5j2kpVw+RNafbijdvtHO20EZLHevFdTQBTw9p6Orslw//?=
 =?us-ascii?Q?1zFTk2YtCVHng0kHGWDfSMCo6JI5YvrrL9rry6DMW3Rf8g7T3LQb+eTGUKQN?=
 =?us-ascii?Q?mU+p9TzCq4sIU5uquLGZiEbX98CZU9iHhkoMOav1yZYPIQwh8mk+TQm9OSZJ?=
 =?us-ascii?Q?VgGdVNe7TiiqoXgbuRd2imy9buNU8/tEUvolVgONcIVe2ub7O3KAYyLgiVql?=
 =?us-ascii?Q?B0raZK0a3zcwbH9tVZ51qmaIHZQcvGX/UFj8Z5kylHAf0pdleDwD2hBXvikF?=
 =?us-ascii?Q?USUEbTc0BCAs35UDzY5U4eC1vNj7ge9JccU+vyuXLHLbxlhiAIp6CZUg1Pjd?=
 =?us-ascii?Q?MmCXXNSz6PQq1i2JsTAU0OYIf+ukcCSbfIq/+ZBREO0QznmK4YtQjoBdh5+V?=
 =?us-ascii?Q?fERsp9aUngjW0lJOK309GhevCAxLl7OgbH0bVXH2WtHHXxl4OzCid86uAsso?=
 =?us-ascii?Q?S4kIQBHnUo+0+4TK/BMBBjkFRLaesRp4a3qkvLwtbfHAIbJarnXKK7ykR3aP?=
 =?us-ascii?Q?zJlZ1E60weYgG93FIlDqzvMImAclPuo0hrxRklD72wjKFuTcLpjTj7ygy/8+?=
 =?us-ascii?Q?S7DI+vwu2UaamLTY755ao8rg/An7PGRLOwIAt8MFtarmIL6kWZhSuXT4gt+S?=
 =?us-ascii?Q?Oo93LLeF5vEcmew7TdCeK1tGW4WH76Vgnm9tTTZg0Mnhy8B7RpHW4hMn81Xj?=
 =?us-ascii?Q?1JjUbdeQD34LYPK8G4HHNFu6pZeEts43ix+gr2MVgaGZZ9Oxj0ioTqnD9HeF?=
 =?us-ascii?Q?4MOlTn9Okq98gc3a0hbygURycfENqUmYDQNKoFrygUsZo5z7+smHQjULun2l?=
 =?us-ascii?Q?Y1ssGjJOOMEMc1hc5wA7nJYUkAlD1j8=3D?=
X-Exchange-RoutingPolicyChecked: 
	NWqBNkCO+kniLwbcO+CGjz5s9xd+L6xCAXeRR7SwUPvkXvpQU1cug2wjeGw85c582lpwhYJNOmL068gtPKc7qn91lfnIlEPRbgsydT70s/AspwEeQmNeN4cI3iQPKgPssWKM3pu0GQAd5KRAJPV+2EH31uKcYLlDWMDsZYPU1Vr3qlqRiwTFdg3TSqnq6hRhHAcqfz8/5vrNjW/0haJDZLUZAWkTRPlnMx91lFvKr1i8xYCK30Yuz35Zir8NkuFsSjhZQcglyizMBB6RFydeD0vavExniMiZiWsqe0HSotMi1xrUrn5v/gYGFoLblzKbUE9bMBrMY3sbmis4A7umQA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cfc1da-1339-4306-49eb-08def7a00900
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:59:45.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvoRHx6MJG1hVp/L6WCebat/Zh9YDLjkojPDbY8wqAMu08XBpTvOV1FtiZWY01OWvOXr/2i8i5FRTcZ33kel78yD1nHb010NAP7Zebo+e9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6059
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA5OSBTYWx0ZWRfX4q+zTtL9ABsa
 9WcTcV6BpyUwRGTzfTt7qpmqLNV6uEtAXbs6sHK9C4syeyl80vMTPaKRwB/bYIGRNWDKMyD4BNs
 MXqHfkJn+z+d1p5y07m2qmU35jEA20ddH8Rt/Uj7hFBDaDzAr/7ds4BFHwZTmCFkOp0A0Wnx3Bc
 S1WfdUTMc+efB3ux9vF2igNL3puD8BzcLsc/vv60+gs/GiuV9YD8T6cs1oCYMGzSNbsP7cwQwNj
 MOe5kvpboPPh7oNo0qtMM5QMYlCYuthEdz8pw5ilPUV+qkOiErT3GJJqc+t2r1bB2jUtDt5rywd
 krVC5WA5Gf3KwUxJQ/kpFPnD1C4tcHMZr2zce6+iSMGFvvfGyHTf8Zcrdwz9YXv6U+Hr2E5sxqN
 a9wpHGiJhZ370HvDt7BPrV9IX4vYe1aXf2Qun6ruRwIFqvlN+Jtx+75SRC1/ErMXWR74U5XPQ1X
 jyXUgnh3bynG6yf8ipw==
X-Authority-Analysis: v=2.4 cv=K8US2SWI c=1 sm=1 tr=0 ts=6a7b0eb8 cx=c_pps
 a=xo3zWrN9qLO3Lphhql2lSw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=ix9RSEJc0yqSKBuBtuQA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: b1qFutXdcM1U_2-O_g5YPSJlJZiuBeX6
X-Proofpoint-ORIG-GUID: b1qFutXdcM1U_2-O_g5YPSJlJZiuBeX6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA5OSBTYWx0ZWRfX2VnysWP9YLQ9
 scP7HHVua8f+q7+yqDbKyQyLDBE9/kRaM51TRMtdqr9MSf6XR8ehVKIfDULqiZgmZ+9YpPp0NJz
 8zimk6IvfDoU0mgRJLnw28K2WJn8IqjfC1HgWEafr9iCYCKQr8pc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 12:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243194

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Kernel Rust support on riscv64 requires building the kernel with Clang.
Since Wrynose does not provide Clang toolchian support for kernel
builds, skip the recipe when TARGET_ARCH is riscv64.

This avoids attempting an unsupported kernel Rust build and provides a
clear parse-time error explaining the limitation.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..6be97c2db8 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,12 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+python () {
+    if d.getVar('TARGET_ARCH') == 'riscv64' :
+        raise bb.parse.SkipRecipe(
+            "Rust support in the kernel on riscv64 requires kernel to build with clang, "
+            "Wrynose doesn't have clang toolchain support for kernel. See "
+            "https://docs.kernel.org/rust/arch-support.html for details."
+        )
+}
-- 
2.53.0


