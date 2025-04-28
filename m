Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B10C3ABA4
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:42:39 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.42])
 by mx.groups.io with SMTP id smtpd.web11.48601.1745847756699557488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=yIoSgbY2;
 spf=pass (domain: ericsson.com, ip: 40.107.103.42, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzDVVRX6aQDno1A16m4j5/lT2/r4gFY5vGefSFHmidzdP5bbcjt04qjRLHBnE8/w2fiCzlucEUJG2KGVo0N3l5Hm9JqTATLv9RXmuhWpGNo2eJWRD/48MI9VOIcRcRGg4c8EpUDMAOMvdebJ49E50XXpArr+83GvqnQbD4VJy05lE1eg6JV3ZOwAo4X0BnK1Ld69E13kKOtQi2CO5PHHAC0z/mMqM2iiH0vrkPoJUAAfZ7XvJvP6gQCAEhVTApiQ5qMTN0ozhF6VJr+zIGWdRvQd831uO6o83LGXkXyuKgHeoEucH6O81y16RTLgO6KNvxLbuhLSnHllm4VISFilUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icrRFtrH7MLxNRaDavOKGqmeWuhc3H138jtoGsL88D8=;
 b=IiU0R4bDaT+duclaPYH1E+bbQjBFT7vxsiTQ6C0297hizIBCwnN4zEVWLG5EfWIVWtrkSx3yLaW1YIoyJFlD8nfgH/fLZucG0ihVcIqyPB92M0yFA0Ve4j1QT4iTaJS5Qw0035FP2Vx/DDocOYR0FzQxDydoaFI4u/pQ9bvH2QSUoRsa/gf4/YSD3m5/VWmX9pPDjPZkiDaTHYOLGa3L+zf7zm9qWUOXsJDb5iE73bN7oCtHFY1I8yzzSHLFhRaCZYhNR1T4GZf0RGsAJ8mVw3rARLtdnU6AaYYVDIKgyF8ff7YubFXrXZGPT31i7BUkdSSDJQL6GO3/ZFFBtPgGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icrRFtrH7MLxNRaDavOKGqmeWuhc3H138jtoGsL88D8=;
 b=yIoSgbY2dxoyu2HPDvwBm6NL0DFZ9AkRKpkvYXiN+WDOCrVMQ3XLw7qsKyBn0Drkhm8M9H0jSNrXUq1sCy9fJCN5YsaNhsLdnaUxNB1Cas2Ticb6z9dk4lcdutYYg9kQFOMTvhJ9qS5wHT0DCkd07ys1GOw9d92l5EyQKD0r9Vd0gNVpcz5yCz15Ctj5xoDA4mEusMHWE3+pNWW6G2zeeG3fUiOqzH5I7cBYDRMJvvox9u0mj+jKFnCOWYECG1rl2+ntTThFyodkVa4ONNpwYjn3DkWbp36zxX+beJCrepXcz9oamCgxY6QrJ4rHAhRVwnd0YdvD1JGDj/iPx+LAFw==
Received: from DU2P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::14)
 by DU4PR07MB10183.eurprd07.prod.outlook.com (2603:10a6:10:584::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 13:42:33 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::8a) by DU2P251CA0004.outlook.office365.com
 (2603:10a6:10:230::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Mon,
 28 Apr 2025 13:42:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 13:42:32 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 15:42:27 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id A596C950A9;
	Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 8FEA6700022B; Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<ross.burton@arm.com>, <skandigraun@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2 3/6] kernel: add support to extract compiled files
Date: Mon, 28 Apr 2025 15:42:02 +0200
Message-ID: <20250428134205.900354-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428134205.900354-1-daniel.turull@ericsson.com>
References: <20250428134205.900354-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9BF:EE_|DU4PR07MB10183:EE_
X-MS-Office365-Filtering-Correlation-Id: 57da1f26-2d78-44fe-5c66-08dd865a870e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XS/ZNzG1UMfCSKgjl0bbv9WasIc5HIcL0teQ6p1x4Swgb39H+itrdsjpgxm5?=
 =?us-ascii?Q?2GZpZcaLdORnROU8cWP86wZumpbp4ScOlf2kaHQhH2Ws15XLnHQ1PaHmr7U4?=
 =?us-ascii?Q?yCDCm9R/1ccl+or9kF8KkuWUq49bTG2mfexCfDpLDBzMiS9qvPSv12kZQ9Oo?=
 =?us-ascii?Q?cF4pDn5X07S7EhTy6FGZPYWlpY7O+XkwyenVz9IAK8dv5L8UlZxLztqcZ7ar?=
 =?us-ascii?Q?6M3ixVWl7wIhh1UcuankBCVAw5UIvnJGbVGhbJKLY4zu+OHNb4LZEvpSFoof?=
 =?us-ascii?Q?haQm4eVXeY8eNBWt5gJeFuX8kFNjZevi8LrzS2TAMp98rM5mb8Pk+J+bQsRc?=
 =?us-ascii?Q?axRJDEZFWbZmO8DoIPSRDtzcIwYM7GRVg8Pu8lPfoAZBB4LUk7wnnUms9/hT?=
 =?us-ascii?Q?/wj0G7i86sTXJbpRCAHETzabJYV93gl51s6kr5TEMUCCJsgYCreji20lUXP3?=
 =?us-ascii?Q?ksopNoDrx3IAsRFIRB7/rDpG9bpv1vkOaIoodLUutmWSt4yXOc75mppiXVOw?=
 =?us-ascii?Q?u/3b1mCnnzGF6+OaaItl83WBkMRkQ0wF2RoPY3qvnn1VMwf3oeMIvnLtWzS3?=
 =?us-ascii?Q?Rzxq289v20EcA342YEl4xhL+cSKoKdAd6ro6xFUPQ+dyuVV0nHgwRJEzUENb?=
 =?us-ascii?Q?U6Jv1fHPUp6CcYPqhu2AxghQ7JduUZnjTIohZuJ8O6sIba5DpZUEXLCSzr6/?=
 =?us-ascii?Q?6//cIf7oxdIvJxhzzIIuW25J7yUEdH1AK2qEKJ9N/dCwd2coKfrH9pG8rYGh?=
 =?us-ascii?Q?iwPfBVj+AwO4N2+mbwTEP4c3IolKh11aspNCKl0d93CBFxTmoYNkRnWSy8F+?=
 =?us-ascii?Q?1XjGCWaLMnNYv0lxUdTIlI2+M3bhCjN5wpiH5plg4plABw1EXNJnGPHJamif?=
 =?us-ascii?Q?WlgBf3b/ym7dQJTSfJoHEXYudcaVJTURLWs8uzsEuELVIIHjw2aeUK0OGVco?=
 =?us-ascii?Q?i/XqLJb6tDGY6QsCmA9xlIZ9flf7/Yq+Jbb71UFq4mkbEViBuI47GAnBu/+i?=
 =?us-ascii?Q?VYhfXi8wxSLWtOQ1LsNW+kwgImcZ6H7di+DltTm/YME8p5TmsQPKEBs/6v4W?=
 =?us-ascii?Q?mYSxZxqMr1S+6mUKbS8PT1gprcJ1bnuZkWhASydBjKPovojWjiliEY+pPOXY?=
 =?us-ascii?Q?uTSOBpiIclFIgocOlFC0Omr/QzX+d9o+lXYaI4JyTjFyWpSjSFXZTrEWjsw6?=
 =?us-ascii?Q?GG551795iSg1JPhwZzVJOE5l8KVuP3ixiVPvk2XxMq5DbB/PGdnJWRaPoyAx?=
 =?us-ascii?Q?dee0SrALjSCA9xybqFnfb4Dwtno69appAM6Ik0sT+ywPoreeZZ4cpUZcZiyK?=
 =?us-ascii?Q?W6u0HcjW+7Pxl8y8o7oSOLuoXk/gzjXQf+9KjQ9BkAli3F7FZkBNCBUzHI3i?=
 =?us-ascii?Q?e9QZ6TEHwDO3kxYVzs4gGM4kmdnfQ1j5RabVyGiZww0tI/fuzc+FjqMAcx2v?=
 =?us-ascii?Q?EE6NjvOBfYB6/1W4PzJuXfpXnoe22TtJPIssqPD3UIhVosev+mrVUX+ouSmM?=
 =?us-ascii?Q?mFTT420zRTOVvOrAVEUPlaTLBgVBhWNca4bl?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:42:32.6653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57da1f26-2d78-44fe-5c66-08dd865a870e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR07MB10183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215604

From: Daniel Turull <daniel.turull@ericsson.com>

Use gen_compile_commands.py to extract files used during compilation
for the used kernel configuration.

CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes-recipe/kernel.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index 36ce659762..56060f2c91 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -867,3 +867,14 @@ EXPORT_FUNCTIONS do_deploy
=20
 # Add using Device Tree support
 inherit kernel-devicetree
+
+KERNEL_FILES_DIR ?=3D "${LOG_DIR}/cve/kernel_files"
+KERNEL_SRC_FILES ?=3D "${KERNEL_FILES_DIR}/compile_commands.json"
+
+do_save_compiled_files() {
+    bbdebug 1 "Saving compiled files in ${KERNEL_SRC_FILES}"
+    mkdir -p ${KERNEL_FILES_DIR}
+    ${S}/scripts/clang-tools/gen_compile_commands.py -o ${KERNEL_SRC_FILES=
} -d ${B}
+}
+
+addtask do_save_compiled_files after do_compile do_compile_kernelmodules

