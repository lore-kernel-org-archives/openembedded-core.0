Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2337CD72369
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 23:08:31 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8636.1769209705186126783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 15:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WJxmKbJ4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.63, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcM7M/1VIoFSRvtI1IAveQKNNAZTGfCtik3oozD49vmu+L9nJXb/MyoMHPYglkbYfS+1B6sRD2rP+bzDeWXQDeQPS9gcY9JFj6JsWjFvIGmVmN3iOf/txXigzoyIt+Qh4357v3rKR8A/PTIcPGx807oEk+ryyICqJwssmno8JQEvP7fBmgtn4XpJVW0BImfdQaO0MpXY/N25XsCNL3kKMsIXuuOWC2Aa3s9g4r38yFIn7YuRLoXNol0Jryg4BYZUkyvmM89nbnVjaBRehNuHuox7Nwqabw/LfATtOGH/zxgy/bg7TtYiiHePcesjRa7yPQX9rFBcxUVB/X6zCz2SWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsEfQNtB140KOlgqr0pjKjLU8AgYlh/szCtzvldWKAw=;
 b=wkw8iYI4CxASuRYDTlJHA0SJn5HabkQNgZd+Sj1Xbgsno+XpUAvrjp8BC0vhJiRdfSLlQ1zwoIOVGu67sb4md/0jOIDDxVKaKCUJWY/529Nye0C0recLWfzNEZhliouEqDGIlW6E6CcQrCBdFqNDNFeBgInjJMRTeQoxaRRNW/liV5GDAHsyCNXhl0ppJdOW84+fCoorphkYL5nPEks5m3MNfBTDQ6i/20qK0mTUrdiulFabLOIKgYkJZvbRX8Bhw7Vtd4ZK6fNArqk67QqnSVrCPP5vPu1Oim8ar7TN3cVnMr2xU9wsXF8wh5FJXK3iRuwuKOKzLHwIE0WwS6KwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsEfQNtB140KOlgqr0pjKjLU8AgYlh/szCtzvldWKAw=;
 b=WJxmKbJ43BOsIx3mhQfxp+oHSkXUsAOYBltwIf0jKvzU4K+Pj/u9J88yBeWSX5OJ0o6bpQBe9ezrAFWw4J1GwOXMglHoJbiuk8Mrh+9TFQcovr/mAZvmioUWj9AeEQoMbP3mujNymTXzVlZU1SbEGkwMdrLiNLU5KSKcNy6dbag=
Received: from BL1P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::25)
 by IA3PR10MB8734.namprd10.prod.outlook.com (2603:10b6:208:57d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 23:08:22 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:2c5:cafe::c3) by BL1P221CA0029.outlook.office365.com
 (2603:10b6:208:2c5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 23:08:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Fri, 23 Jan 2026 23:08:20 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 17:08:20 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 17:08:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 17:08:20 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NN8Kde3074600
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 17:08:20 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vjQGK-00000001DKB-05V7
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Jan 2026 17:08:20 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] lttng-modules: Fix CONFIG_TRACEPOINTS patch
Date: Fri, 23 Jan 2026 17:08:19 -0600
Message-ID: <20260123230820.289540-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|IA3PR10MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 716179af-ac92-4f8a-ff19-08de5ad44d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZDQQnzJZTxpnb/ydDNFA5kBWiYPTavJ6WUlG4tReElN4esQ6b+F+Zqxi7EZ8?=
 =?us-ascii?Q?KyaLiEO27WaxXOWsF46RTNX30FAivr32hbHFdydFPWpYQDJ+fnnRXpTX7hV5?=
 =?us-ascii?Q?+hLtLMQ3/6oufNl52EbuW/v5snqu7TgBTuNmrhCcXsZ6T9CWhy8Dq9NVmTYY?=
 =?us-ascii?Q?5EUbhCplk72f7hTPdIe4PJX4t3kj1d4C+K4vGIenoHuQSzzoOt/yJi8Pr0EH?=
 =?us-ascii?Q?NLDsLyKo53psTv37pHWHAuK7+bW/hUQSeiygHtNmnTooYTPZ2QgMlg3qJ4vL?=
 =?us-ascii?Q?Qv1Bn1ZOJDaR4gKB1+sZYiiZl2889EVuRqhm3VAro2vnh/iTbAMICWVPu0dv?=
 =?us-ascii?Q?InzSSNv/UQkSTCXo+yUhA6bx0r+haqubK+rxHI43nkzhrKVsMdBVsrvOvcH8?=
 =?us-ascii?Q?yWie7QTMSHcbFlR5YMAwrdXqb72Go9mI9d4UhHuvnv3AJ0F5DY0yGl8LvzUL?=
 =?us-ascii?Q?Yeo0FxQTDxj86td4zbnUQFN5m4A5L67kuZeOT//rh9aH6YA4L94hblp5iRf/?=
 =?us-ascii?Q?LZG+UpTJeRtaiw6mRk4JdM7jFelBXGqOyEMY90fIoCz458bQ8+9CytMsNxw/?=
 =?us-ascii?Q?NNhWGqL0UTS7D/cFArH70+YXiVeZhB3IBfr3hzibm1ArB8bOlsYbU9oOgc/z?=
 =?us-ascii?Q?57yRvKN6A1WZ6QzIlRG1paaknDbk4PHkMJneten68ZbKi4H5hHJe6KTy4KDI?=
 =?us-ascii?Q?C9C8pVm0LdxCncBtYvQX9AMxHniIh7W7c2WF+rdZD+ABvXybqO6RvdFUztsU?=
 =?us-ascii?Q?k4y4Ws4+tdDYTThRKgJ6EG8VPX4vyg0n3wSSQrOhYS2NxshHkjKjjUX7WA0M?=
 =?us-ascii?Q?VqARZ4UI1XhtTLZwKkAGZV0Ir4PLfAaOnjqgBO6c9i7pmLSR2uHnXBoeX1Z9?=
 =?us-ascii?Q?wW82RLG61ycEAuzLW5TAE1+RcNOVoP+4vRfgU6uFBmXzVUZ+xwbEieXyrdd1?=
 =?us-ascii?Q?8WFf2vcBu0Cf3qUomLDnBCpJMwBWmtT3ZzR4upzqzAy0zu3suG1oc6qPSx53?=
 =?us-ascii?Q?3z+vTU5kBnh49a8oHQjqz1JEVSiafL1P8qypdjaH22KFATZIAMjtM28UCTcT?=
 =?us-ascii?Q?z0vKB8a/aLBA4CqGjr2XzBodFbjz6HQUfe66XepFM7aOT6xZyJIXIq+JCWp4?=
 =?us-ascii?Q?vqsmXM8J1UgpOnI7JHwkMfxttQVAIm3sFwqXgnxmbBPRhdoVETVQLexoE2Gg?=
 =?us-ascii?Q?R4Q6nnQRr6j+sA8ESCg3rusREM60T0cYgrgzjYzwRBR/lbHNheBqQxwJOrKR?=
 =?us-ascii?Q?MaczuwXVRsnMkNB+DJXD9SXOzd98/Y9NIsbFoInZruEv0AXKzmXmleiweK5M?=
 =?us-ascii?Q?Vh3UHMnKNifZI8MJfUe1kfgcCdpd04D2L8ivYwZClqZS1If7uekjY4l6zdQz?=
 =?us-ascii?Q?Z1P9+uDU/a6dZTdDpgyy3//ZqUFv/2lHu7YY43bAoS8tiZXAbB7V19rqrzGI?=
 =?us-ascii?Q?47pmkpWlHBpThVUY3yjJh9tlIge15n6UhLBxTOtkCW49oU4yx15mhYyq+qnY?=
 =?us-ascii?Q?e3pj/RrfHrkuaewdFuIwL/I/g+K4+lkBnXfY6kmYjExSW5yCd7apEJYcj0W6?=
 =?us-ascii?Q?wfpLRcTzcUX/frzs/QcLkKr0084BcMi6utGgZoIMeTE3LssSG9nt3Q1yAPBk?=
 =?us-ascii?Q?xYx86DX1slK/GSfiQvCnqeSdww/Vryt63Terf3RTIzyQYG2ax6mD/5XkkN9K?=
 =?us-ascii?Q?oPRdoA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 23:08:20.8189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 716179af-ac92-4f8a-ff19-08de5ad44d47
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8734
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 23:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229916

The check for CONFIG_TRACEPOINTS is guarded by a check for
CONFIG_LOCALVERSION.  But what happens if your .config has
CONFIG_LOCALVERSION=3D"" ?  Then the check never runs and you try and
build the module even though CONFIG_TRACEPOINTS is missing.

Update the guard to check for either CONFIG_LOCALVERSION or
CONFIG_LOCALVERSION_AUTO.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change=
-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng=
-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 1854d9a944..a47b5b9789 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missin=
g-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missin=
g-CONFIG_TRACEPOINTS-to-warn.patch
@@ -16,8 +16,8 @@ Upstream-Status: Inappropriate [embedded specific]
=20
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
- src/Kbuild | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ src/Kbuild | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
=20
 Index: lttng-modules-2.14.0/src/Kbuild
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -25,7 +25,8 @@ Index: lttng-modules-2.14.0/src/Kbuild
 +++ lttng-modules-2.14.0/src/Kbuild
 @@ -3,10 +3,13 @@
 =20
- ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
+-ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
++ifneq ($(CONFIG_LOCALVERSION)$(CONFIG_LOCALVERSION_AUTO),)	# Check if dot=
-config is included.
    ifeq ($(CONFIG_TRACEPOINTS),)
 -    $(error The option CONFIG_TRACEPOINTS needs to be enabled in your ker=
nel configuration)
 +    $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your k=
ernel configuration)
--=20
2.43.0


