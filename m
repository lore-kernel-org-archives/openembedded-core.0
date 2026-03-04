Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1458BEFCE2F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24353.1772646251531894945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WvCIL9x/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245NOo82255808
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 09:44:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=e05fLn8qSubFk8zSL7N7dIOFw3OiNszAYgQB8AUMzfQ=; b=
	WvCIL9x/kLsOjP6/AJRs5KGVz91NZF2nJ/GJK40SGIoZR87tlE0QUU5wESRObtdM
	C4jQxy7GXqAIXVClqnzKEOOdciGPsnRfA4Wsh59NVjQ/V5uLdBo7gOIVZkUQSKzO
	A1vlZJe+hP1zBsfpma9+LXJfLDyG8Zs5k9uSjnq0dC0+Qhr2H4LOQaC39JIUkvcQ
	QDp1ww5awhcGVJ4zHafOsMNiGxXFKhMjbQ71D4Q4rHrw/0QR+Wl07FiZTKHuHja/
	YizOS9dNWll7OeYvfj9rwdelCKOmXI4+WOGfemFCXfLSPA/klJXk7RkM61mhFupt
	4QA8cxiHpuV4sJXt8n5eYA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgmxvb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 09:44:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+gxNgYzkP1RX6r0AfsaaQv3fjXIeLZA+aSTWOvN2Yc7qIq4did7DU5Z0RyHYANrgxB8pTmNKj98WcO1ogcVYJ3oA31flvAzovr+XayZ1RWw+VCwaRYtmXuAUwd1x6mRMmThFngtarW06XgL4L602AahFraUiLiA6PqTe1oT0i8UTX+dprrt5iouIYKvoOWoR5kI9gdcfyh7/plOUWvdsKF4u/BdQlTwr6HRBIKWDmgavAclQLtA1OfCSrZvE8N+JLLJMhUVSR91LNKjgQh7tHHuB7CIEgFrgeNcnGm1RYwIitvLpiSAtqK8JLgUDloRowEaW1XQMuLDbodKqj72MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e05fLn8qSubFk8zSL7N7dIOFw3OiNszAYgQB8AUMzfQ=;
 b=pmL/GMF5OaQrzIA3sGgm61R6/vEoCVOyWPciZcsGv1T42K3i+Nf2mRNfSWPHEdz5BbaajdePcXApeDfpZfFWYMwCrdNRwFa9OoKbDB1Iuw3XoNi0g0iqGSX7+cnnnlc7FMVzWYBY9R6aXPjWtElN12IgOFO24ckUEIYFVrjUJAQZj2FBGtxnVWyTah2cQ7p5q5CQfPUJJEdlQkj0P05uh/dFyQTQP/5Sre+rWaWTPzb5fwHrndKQFJI0oPPij/A36qowe8Kq2LlGZ9vk1az6jZX2nssciqxvaA9dQADNTTHxpLapXN9vCQDZJ4DzUpsCkxjfcSQeTaB5Nk2ksAxYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:07 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 03/14] kernel-yocto-rust: enable Rust kernel support via 'make rustavailable'.
Date: Wed,  4 Mar 2026 09:43:13 -0800
Message-ID: <20260304174324.1186644-4-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 847ac629-7c6c-4fa6-6514-08de7a15a2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19052099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	KYVWuSk3RsA3h6gZorduAlLvvtJOwCPZ/FVI0g/42u0mIHaQa7Ksgt/rOCSuP5QtbA3JidFG+tqlMZgoQ5yaHgkXlX0wxQ/NoMisCpeO7dSdiYxALTunr1wewWrTwy07ZlL0dxnND7HnAihTkx7IbSWBnF5PBS5MxUiVyMzDIJ405sPtergJDEwqbA5CwMeE9KngGvTz0y8mGAVxKgd2wzYu+gElpmbGEdo+jf1WKfOjW0FXVbmxcS0xE1I/YohFh9npt1vsAr9WkQ8aSHankxTyse/Hd7Wyvf52YPmeGgnREajri+8t0SRdRxvjbPv1bW1Fbs1wLuh0ukfO9X1Ntg3EISgBZ0E4xMjY4McGHsLUnvwEL1T0a6kmEXoXQm9MhGTqmXse6cGUIzgTPJsrqWIrwNndJmAxECoLUNqffSmsznDxiKvNnPoilclWvxeuGTMjD85KQEiObi9xBXviu88IMDqeRYgUOKRG462hkLRmoBPOX93bXKWhnvH3hoBAKIPjAaNowMQaISVd4xZ1ZpGoa/x3DveIB48L67Zws0tjdRvpZyKB+bQ94yKdKGwGZKXtBMFGIAlsC+68SPZQbpa0CfnEFVo/tcrCIutEcWidgUuVtXlpCBD1tzz4fYp/4avxYT+DzoMFh/9QK/Buoqe7tt8YW/lCi8qWNAtrmhhMYGfwa1I5+hiVMv0eiSZXonDclw8usToee0kfPU/XmRKH2strwIHIrSt6XlerP5e0gd+SoukI06HoPDAuQpOyQBARVsnpQ/pIkAS2t3XpUkvQrRutaVATK8dJUTMQcLA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19052099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TIwPKcRPrHtL9zoY0Ql9d+qIPhIG4cMKndfCmf/cWVRW+/hFxOv2hfi3ygVr?=
 =?us-ascii?Q?BPtMibOqTQ0yK8XjL5tWsum+XpDy868TZ6Kzg8XiFGjPd7ubeYnnbVvLIZ1s?=
 =?us-ascii?Q?CqqIucseMIdOPtarZdHgxO4V1sXH8SQLbBnLBRQyJVzypVrUi6lf5o/hOlFX?=
 =?us-ascii?Q?mijkA2HvFMLKra1n4dm1pbtzBkJc0FSlipM1OloA9Iig53i9dAUPOdPqM9Je?=
 =?us-ascii?Q?TAVWLwXX6dhfZm8HY1FFjLIB7fISt86EqyxfXibOgDVvmSVWIh+R4Fw35gaT?=
 =?us-ascii?Q?HHCgSw/J2DJ3UHRLlyI6Uhhacb2UyoCOzMQPL38KP6QiOIc1igoPJ5OmR0DC?=
 =?us-ascii?Q?i7DuGWhe0qEofxvYrMjCCB9ZqIzggS1OgwgzQ3vp17J0JOEvrpiu32F3A2g1?=
 =?us-ascii?Q?EHtok30IXA0cgx2s+d0poWFsfXPc2ZpYZeDZa0YMbg6eKk5LRqJObs7VoyPv?=
 =?us-ascii?Q?9c+hUdbf579wllHEqY+gIlVl8MMzyP65aPBmRQemyaunFnDrP2dWEr7rVWAc?=
 =?us-ascii?Q?pvlssLl0S7qb+zoZInCx1Cpugvm92ErMmqMu/wpQwxzIY7mzS2lWgEjDRqXt?=
 =?us-ascii?Q?FtihoeAbrOjHCd4Hk4pU4ZuMJZzTMoldKLlgTrXRJ3rKHhK6GoBUjYh0utc/?=
 =?us-ascii?Q?jd3H0w097Hz8rIgBzafH/Oc1LHGh3MhgfWE67buoV0/UoxQBpUEX8dqXL1oO?=
 =?us-ascii?Q?Q55mwpju8kvLcs9nkhCLomade0gXqr4wzT7fQnDhqBWlcCarcJJBE9akwNpW?=
 =?us-ascii?Q?3h1BB18Lfaed3BH2NWP5XmyZvfIaJqRyNGfjIOquXnt4Z786+QAdquy4Lzyi?=
 =?us-ascii?Q?2Pnda33IqYiR77IxyRV3ZFm37wspoJ1A3b7HPgcTnxcCNOpnyJRBhL+qph/5?=
 =?us-ascii?Q?PiBPZEP7ZGmrXmS/v/XryHHU0KEinJh/Bvgnxzqjk44V+vdHEhFZxZNLdC7V?=
 =?us-ascii?Q?qYjhbgktTJ0HTyp4p0S+Eo1MMUjeJMY/Gjyk48/AQNzpJtDR2w8QIAjG2bNP?=
 =?us-ascii?Q?4rwH2C+gXjqxkzna3SO2VygvWkGNHTUepTpDNNsXfUeoduSA/MmGeKk9XA7c?=
 =?us-ascii?Q?znV+3rwXJf132ZQnz+dAiRZQEQCDo+YpwNS4XviRSp30gXLOvT8LoHYn0bYq?=
 =?us-ascii?Q?H0ekUSlzAeqXNe8WpZYEdRII+bMjhbu5UNLbqZLH97UFvADZTpC1XzoewSxp?=
 =?us-ascii?Q?D1bHDwwOT+g4qZtIXFbl4LWE4w8s0izUav70t5cApuSQUh9wKxhws2oSDI8S?=
 =?us-ascii?Q?KP0AO7z1sNn8mGJPCjIKiMftqCCz9DNriMjXkCzE+cSNlWunvNHmg91Upccn?=
 =?us-ascii?Q?RyFVYA8zf1IZSjFMZd0TCmhk61OHthQ4YjNdyGF4XafwVzeu3mPxMBGkwZrY?=
 =?us-ascii?Q?SdwgPAUcQBp35fhS/Kc0wIl9fKtIjkT8K553uCoSVpGrCBd91DNzUMDBPWYJ?=
 =?us-ascii?Q?TOYd3+4KN7rksK0wPtkISl2GqiDDQdB/pxRQf/JIvcUNvrVxAcbDPmoIXlUG?=
 =?us-ascii?Q?32m33Aioa+ZDb9U/eXWyBKB6dn961Do+O9GcY8npi0wKkxa4rjGK5lQpBP6A?=
 =?us-ascii?Q?AIqVChhsu/G9ucZVTY1VC6VutZjU7SG6oTQXwyURZygLD8qR4D62uaovx7n0?=
 =?us-ascii?Q?koGjM7Z7yNerO8KkZicQXKDUZR0KExCPkfTPbxsvQsa+FYfHwny34mW6v5rW?=
 =?us-ascii?Q?NVxO5cQJvO3KFY3jMLYjfOlRhfuviBFuXsU85rvRR2efVejo8CL0Ap+pRKn6?=
 =?us-ascii?Q?YCMo2KpcN1zGoaTV++eN4a+kZD5LsIE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847ac629-7c6c-4fa6-6514-08de7a15a2bf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:07.7280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKzBPo0k02qtIbVUfQW9QbtkMJjJG+8+Ww5Znb+8CRV0WGMkAxEo9XfWn/qrtwL0kuOiQd/dkTsrNE+cgJhfH8HyLjWy8cq8mXq/s+Si50A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: dmi8m2WnpQ1JazQKsGAarH9JwdMmczvc
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a86f6a cx=c_pps
 a=awRqKgK+okXhs1gjjWqUCg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=-yn6Wxg1_zSQloxVRBgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Pr7sSHlZdAM8tRYt55M2T7ReB2-q0BUN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX19DwkGZlSWOo
 EWkYRwXWDE4lDz27pZllzDaseWzDLSRAo0s01seLdb08kyyrpReiZang+GHdi57FnMISPchaLJZ
 2Pj4OMaXe2gYCdgQ0uJGanEgwUGBI8MviZtNVj/vZfGxr8jplZ1r0YsXHY59T6Qgii4sd3RA2VU
 tx6OAEjojkO8u/ChdFvYraIGCeEnwfQnq3XfWt7CY/BPdvIxTVnBICAikLh2OzEbSOsoygxUo2w
 4hec1OqTbQDis/7n0nUXBJ+M0qjCWCImeG+yynQ9zY099UnUtrSP5IeEeD1BwbWUndNWFCp5CmA
 aWXlaG6J3z28ygKb6vHyZItft46Ig2O2aSrBdu9GL16Xq1Z6S5wq4U/y5aOBOUkt6LWnHhDwqtX
 SRTxgKrKy47uv0Tp3zKZurCedKrUDHvrpFjKghlWOtg9s9Mm4m0F3cxszLQLwFj3VCePwsy+uWE
 ommOA9lIzPk5rcV5oEw==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232419

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This change adds support for Rust-enabled kernel builds by:

-Extending do_kernel_configme dependencies to include rust-native,
 clang-native, and bindgen-cli-native.

-Invoking make rustavailable during do_kernel_configme() to prepare the
 kernel build environment for Rust.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 12 ++++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      |  2 ++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/classes-recipe/kernel-yocto-rust.bbclass

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
new file mode 100644
index 0000000000..7acc81764f
--- /dev/null
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -0,0 +1,12 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
+
+do_kernel_configme:append () {
+        oe_runmake -C ${S} O=${B} rustavailable
+}
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..5939318101 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit_defer ${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', ' kernel-yocto-rust', '', d)}
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
-- 
2.49.0


