Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248A3C3ABA2
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:35:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.33])
 by mx.groups.io with SMTP id smtpd.web10.15151.1726554919688730147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Eo8WhYTV;
 spf=pass (domain: axis.com, ip: 52.101.67.33, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ml3Qeop12RqvRnNMGsI0FAqUNFK0lv1jipKslDSfX/+4jmdzGULaKRraygS5v82k9JOpowsoxUPisvcEd9wIXThP0Ikex84Xgrf7f8p2POmO4UhkK1c3c/10wjp5WaZpg3rbq0VPZDGA+gMF8BSwwX2ZJqMsgP9elqfNLwF/4T/UyIhPe6hF+LcwSMnizb97mUG//ES2mpZMHDxlJFgACrjQk2G8aEaqFHxATNytB1W7CrxrV0mHg16y84ClOKg1JW8SH+KcKrY7ddrmLTK04q47RZ7HZTGImTcEIa2zPsAS+j3kzyKrBApEVUBApgjCT3VBDiY8AEGrT+D05UTOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHzN7fMP7ykSubljXe0lKJpJ3E6tyNc+IpHcJ58OQOM=;
 b=cpTUhWJwVkMGZZlrB1tvV0uK+kgHbQMs7ArLCdmD6yfBbp3nz99izvj6NXf8OJTQpLZST233Z0YsgJIvcGmdLq4p4QfTbEQ3zfgfCQlsWYgLMhDT6REqJ0vzE1RDqz8LCi31aZGsTCygVgS/I2JqL5ZHg2doRG9awr/UDSLEMz5pMv1FXLT4XW51TFgK/WjwdmWjhYTPeW9Tq0xHzI3tyNAl8KYuwKB91jqukgDLQLhC5RR8KEgIWO+XqabmEG9gVYA8EvcL8Nq/C5VbSbHIMquVGp8ef9S3M8SS9fJDzMpY+unblEWj/W1m578w9K26znELxc3M7FQQt8oeBpST5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHzN7fMP7ykSubljXe0lKJpJ3E6tyNc+IpHcJ58OQOM=;
 b=Eo8WhYTV4Vn9zeCmE5q3gjHBdINeBCay5mWK9IHQ//prAKT3Qsmp5o74ZgpZ2S3O2crVausCz7zU9tH71ESVtAMjmQAtBMoQMGfNwAetJuzHV2UsPy7E33vbmoBEIKsXggJiUC1WCE6rp3eFtXF4LRdUXrn5shjU6taNK5/Za3g=
Received: from DU7PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::17) by PAXPR02MB7800.eurprd02.prod.outlook.com
 (2603:10a6:102:223::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.21; Tue, 17 Sep
 2024 06:35:14 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::59) by DU7PR01CA0048.outlook.office365.com
 (2603:10a6:10:50e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Tue, 17 Sep 2024 06:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 17 Sep 2024 06:35:14 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Sep
 2024 08:35:13 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Sep 2024 08:35:13 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 89648249
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 08:35:13 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 860DF26B985E; Tue, 17 Sep 2024 08:35:13 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go-mod.bbclass: Unpack module dependency license files
Date: Tue, 17 Sep 2024 08:35:13 +0200
Message-ID: <20240917063513.1036889-1-christli@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EB:EE_|PAXPR02MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: b5076ecb-7d58-422c-fb4b-08dcd6e2e31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eJl0Wd8UGmplqaYszpMu3WWXUBFvAF6z+cjL7grw5t8VD7T6sP38anJEgBhY?=
 =?us-ascii?Q?6fjzt2XbLiMVS6g1jcrFeze97uRkyYLRjGp9Ef9wIzKjEcVy43czz0c2zvsu?=
 =?us-ascii?Q?zAlh02CZLr3d+5+dbFTa6KE+zgOS772nlpi/qsttyJ1UwzLcc/q/GXLo974f?=
 =?us-ascii?Q?vptJqFfrDuRPk7PiR0dRxkh2rfRk4lrQ2VAXExGrOCaHvdzY601JSNz6YSNT?=
 =?us-ascii?Q?/p4TLP4nxZUNRaS1IXoB5aPn9+DxUSCqxkQb0ug7zSYkmYLuCFs/O0kfdH4+?=
 =?us-ascii?Q?EXj7KBf1aCu5KCXtRnn4c6m5At6LbuSwWXa/ZYjbkXOr9wFArl5J9gTTLgrr?=
 =?us-ascii?Q?TxTLshCF1qAKH3GMb09MAgg0yfthuQ85gepmWjE4OcjD+umxM8eMTjU17Khu?=
 =?us-ascii?Q?yHj0JzEoFgjixK0wmMrNBNEi/Yn+qMVcKg6+igrM1ihvJ5Y+TkcImgGV6eIY?=
 =?us-ascii?Q?7yLgDmLDklMSDL8rlMAxBLtLaJePptyPFjD19tHILoZHWw4BPmsLKmRiOO9h?=
 =?us-ascii?Q?s4fmJrHY9jwnMBpMtJr0yaWlGX1hu1GYygPTbKMAXrIZeh+32fzOQTJObECP?=
 =?us-ascii?Q?kiaJQNEXhQLdFVVrGf2EpHVcQ76svnvD5RrrXGjVsF2RyJ6UXMx8724bcCZ7?=
 =?us-ascii?Q?m2pQhBdNyJzuL5VkxtTfp8BIfovN5X4HdhyS/CdSBP0PnR6UxNtGEWS9L6ML?=
 =?us-ascii?Q?Gb+adY8H9apAhtUjGP+vpX/6xR+2WoB2jK+GtzEISGbsmyKkzHd+8JGMj7GS?=
 =?us-ascii?Q?yOweMKuZtSCHE/zTZp4r2MrRqKGpLmROWd3fsosYzV+yVvQjcLOQzXQDkBKF?=
 =?us-ascii?Q?iHnEmv/SRmR4YM3D3Hf4cJ2fbb3EJLNiucejOGDb8owmrgG3mz3SNr52hQ9l?=
 =?us-ascii?Q?oFZbiMAJ2GiK6Tijg2gaarJAo+XaxnmchdCNWI8fg/WaOPKdOqwCAcuuM30z?=
 =?us-ascii?Q?QN+1CmbnC6sPN7iphHEwDlE2XDdu+AAha8Tz9rRO0/EhntfHVNCotcdIKkqS?=
 =?us-ascii?Q?rNmTt2SUQYrKSc/CjWPS98a5azzQoQpjqTL0HhRQYOSmSyUtmedgvAvd+5Dq?=
 =?us-ascii?Q?hzsy3BjimyuN5rEzVhfUADxmqZ55Kk1M4HmHTtY2bKGamqINafLJZtbfZMII?=
 =?us-ascii?Q?8jmxGGElvw5/wb9nN0w9gRphU0aCO59uPpLhL/l3RgVYH2oAJYtoRzQRCLXE?=
 =?us-ascii?Q?XebDEAoCEMji2Mzj83EAxsW4gskUrRZrLwsSaDg5yIMbVg68Nmri2BblTcqd?=
 =?us-ascii?Q?yvbeGy/GirCWGkVfdJf0Y437rdKZH1Aw1mUGJb2eQFIO7AwgjqetYAguBlhU?=
 =?us-ascii?Q?2xoVx7QzlrCWPdA1jl7gURRlIw8/Aq4uJgO9o6YCQfBtw2LEufI9NgluFhiS?=
 =?us-ascii?Q?dfnbJqB5lwRPshkm9NxEKsK0zQ6fKn8+SngKJO4IovHsYWErdDLHIIX4Xk2p?=
 =?us-ascii?Q?Lg88qRFoCia9y6vqQ0SRSnbAG6O2EVNI?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 06:35:14.0488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5076ecb-7d58-422c-fb4b-08dcd6e2e31d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7800
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 06:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204614

From: Christian Lindeberg <christian.lindeberg@axis.com>

To keep the module cache logic in the go module fetchers simple, the
unpacking of the module zip files in the module cache directory is left
to the go install command in do_compile. So for do_populate_lic to find
the license files of module dependencies, do_compile needs to run before
do_populate_lic.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 meta/classes-recipe/go-mod.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mo=
d.bbclass
index 2083d7f2d1..93ae72235f 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -28,3 +28,7 @@ do_unpack[cleandirs] +=3D "${GOMODCACHE}"
=20
 GO_WORKDIR ?=3D "${GO_IMPORT}"
 do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
+
+# Make go install unpack the module zip files in the module cache director=
y
+# before the license directory is polulated with license files.
+addtask do_compile before do_populate_lic
--=20
2.39.2


