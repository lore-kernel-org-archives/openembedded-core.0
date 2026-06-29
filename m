Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F011C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:19:55 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91945.1782739190975536028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=dNNEQOC4;
 spf=pass (domain: ericsson.com, ip: 52.101.65.48, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yy1utCtk1eSxgJtMMO6/VSOiDBkFG3Cp44TKk5xX4B9KYFybGdo2EqupKEWwCT900H8FSJ8QX5ouaUcOoFbxgSqE8QKV3KLwFfRxmDP+zf4aq3CBfRN5C2lAme6aFitsL5sLKFpvqb1LASSi7lG3hTTCVcVdf0TsN1gOVRZwkVwzzMmVU3w4LmpDXVj0T3HQrhWIGXkn88tZBOrcRWG1QTfjsZNNjOcbjQVJgz9Wg8aKpTLHZlwP83aytGw1vuJkETskgJOxJkEm605Pr+LDYTBm4hB4GUvVxpo5sVNlFnnWnqphD2ug1P+ngDtabH6tSnVINDrb7pvOvS3PMdAzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Admpofs3miEQwO8COWTLpGqCr/+0BlvNaJ4XzFyGSc=;
 b=bsWOVOmN29UkuLnsNefK0UO7uAdX80XetqijtpwR7bG4o8CHLTY/mOkUSK0jwXX5axP01nH98zCEJ7jZIyOf7kcMFe2nyr7fMEIQhPoiaiSvqY7qrfhGzWntSZzEMdpdwDMR292spQzFT68RWqQv9R/N3o8v7zdsdmJCH04VJFR9g0gH5AgF3QDpXfAghIsmbKDMqa0I/DglyRjQFbkp+DbNb9RRTP0rm8u0l735LOu3s6tng+Kw2uN72N5en3A73Ipe9s/cspfR23EKsdaZqOB9AJIm6r5UdphjmgStZilSHXY/tI6hza2sZE0YF30Og8gWRHHNAOTR0Cke/d+0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Admpofs3miEQwO8COWTLpGqCr/+0BlvNaJ4XzFyGSc=;
 b=dNNEQOC4m0L7lGXGrqQTpNz26qw2ul1CZ9P9BWa8764DO2nxYTD6bii7AVsNc2Br/0b/HrdyKK2yPgN/RQBuuJN+qRX867mPlRYYUlP1vO5nIGa0bH3FqFJzjN1kSUwI1LQoVE8PtxXhnl33wd5p5+JDcAW4pZ3xmdBt+sj6ZbLaHGdRMhEf5nBm5siNXVA5J3459tc7GQwYnu0Y/fUhJC092snN/kIswwtiIBpDLQRgg0bplloFLbmtgICLEXcU85CJ4ANLM19GW6la02/RRobuBmhcHQpFApHoplcoXRbrdJgSJYUCbTbB05nDHRsXhTdjDIdOCKZZVJt8AxyqgA==
Received: from DU2PR04CA0243.eurprd04.prod.outlook.com (2603:10a6:10:28e::8)
 by PA4PR07MB7455.eurprd07.prod.outlook.com (2603:10a6:102:b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 13:19:45 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::25) by DU2PR04CA0243.outlook.office365.com
 (2603:10a6:10:28e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 13:19:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 13:19:45 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 29 Jun 2026 15:19:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 7200E95800;
	Mon, 29 Jun 2026 15:19:44 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4579A700DBB0; Mon, 29 Jun 2026 15:19:44 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] bc: set CVE_PRODUCT
Date: Mon, 29 Jun 2026 15:19:35 +0200
Message-ID: <20260629131935.437083-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|PA4PR07MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 43246da9-9f03-469a-ad1b-08ded5e11659
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Hm7hzuAw99UK2cuqL7QXEsFiAuvN48LdWmMKfxzDRNgJE4HyAgRDti3sh4FyYZKAjXK2BDOg9APtPDk5sgUCWdaRDJL1GUlgPkFkXlFWN9aS+dXGmKunYPRE5sp8oEB7ZYu13KNXxm4mwqcmQNyyegLhuWgoS5eutYHZVrYcz1CPnwW3wM6DR/SLa+oAPU6YQGl9g2sqAbIrCvEcTfFKhhu/pnrgMbVGdXUtOK4UhBpcxbWQ8pe5uXyuEROB6MqMCQIM15sX4hbjPTdtFmlxlDcj22WWbIs82mFsnAyduSB1hkTvE1nE6hZ200QGM6R8iDIhXTwnpBAqpJvhMVHf8nKuwROfgwWKtljF1RCiBZqLqh1JsfXjmqvW8HI6xGAqpW+LHhfo/ZvntaZVr7bD1PUlQgt6YgcIxz+1gtoY3z+NKREKDq/w4ze7HbDRAw4KL832Di7C09nsNm8NWaw9m+7tB6+Y0pPyE3c3TC0es+YAB6DO2NGmHr4ejFYxBfeoKroK/V4mQhJWo8ihk4sgYhmx5MS0q1o/9H+kbLi5SoPGlVfPDcqHePZjcjM9FfKOSQ5FaHnY20S+ixkUlIIhNTu6Mhisdu8oA0PhAJ/kadygQzW2XFTjXN3dXLOWW9glDRp16v06smyiOJbXaG3UbPc+P1a+BoJOZ0afbZr8aFO1yCI8NXcWaQJbPy+JByyWBVQPjPb2J57JSWkBPlsbYQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	681tEPC1il4QIGBATBzxZChebcQsQzCmgSx35/OJBqfw/mw7Im3RA/NtBCxTQ98N4p3JoR4mB4NRMAYSaGO/A6XSpmxW4G/DIass7BSPWsLXPko5l49jrNO80rvQ2nqX34ftorhQ7Cj3asZB6K35xYU5tdrJsOILGqWxINTEhJ0PZP7M+S7YM5zjUffy9VmHv6zlKl+vHe9QI5rb493Tbus6yr2B6NPhtw31JyZXlF9mFvzL3NBmwppfyZroAOBsHsjUCRMbhREC8zBdBvCPKEzZ3cJro0OLulkxx+WpBCnQm5R81eldvDBII4AFx1RI+pDisrZLQOHzuMOFOJPWuXQntGdaCOkHyPgh8pjOd627ZeSRmCVTcgHl9Lz++7LalxyKwpDIjgRnaNqLoucioneWtAgJnBSuiWp6cKCNLoBtuJedaCBB/IYRHtkPFS+z
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:19:45.1701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43246da9-9f03-469a-ad1b-08ded5e11659
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7455
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239782

From: Daniel Turull <daniel.turull@ericsson.com>

Set vendor to gnu similar as other tools from gnu
to have clear naming for registering into vulnerability management tools

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-extended/bc/bc_1.08.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bc/bc_1.08.2.bb b/meta/recipes-extended/=
bc/bc_1.08.2.bb
index cebfed9642..933329caa6 100644
--- a/meta/recipes-extended/bc/bc_1.08.2.bb
+++ b/meta/recipes-extended/bc/bc_1.08.2.bb
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504 \
                     file://lib/number.c;endline=3D20;md5=3Dcf43068cc88f837=
731dc53240456cfaf"
=20
 SECTION =3D "base"
+
+CVE_PRODUCT =3D "gnu:bc"
+
 DEPENDS =3D "flex-native"
=20
 SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \

