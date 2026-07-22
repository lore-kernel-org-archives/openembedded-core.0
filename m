Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE66C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:52:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43526.1784710320434675030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Saf+fGIg;
 spf=pass (domain: ericsson.com, ip: 40.107.159.2, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTRhxOIRSAsC2VJKQaWTn5+BV/JkqiGK5udQJEjkr1MSQEJ3+pBLNTdjsQnowTMgtzqlRE5iXwSWW3vyX5jmOBAtOmLmdHeGEJr43TMtj7yCLagiN3g2m5Y1o6l7YHuaUwPjt1GI6EyIWBwwGaNJO73uR3L1xPyAoQ6tON10l+pZlBzmqUIT3SSZRb/BSMjdjM7psJiRoZbmDGm0SOis8PFAQ62QDa7pzmnpTeXTVdUEdypz/Kg8Xn3gOzWfCAh3QEiiJVi9dsGkDlO3btd/S3RH4xEdLrI7QtVtU7XPfDjYa7j1Q1NLmF3VKOB2WKsjiwvEsfUYceLow0BoQECAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvZsl39/IrYVhLyDSgHPup/xDRall/9vxiR+ooG/6h8=;
 b=uhNwxt3T/LJt4t7E+zgm/BBoeubiASa495FIh9Bv3vl7JnOjimDiu4EYSGqtg9CowM2W4UFz8a1UYa+cB0G+Vu0w0t2jSAEBMdD9BOGd14Tsqn9AsFGPHifJqW55Uw61dpn18NsxQIVhVOQczOTyBsrVTLNirS1lhRFbQeYerE/vR1zBuxz64UXpbUsRhokM/F9xZGEB0cOvSPRNif2A4/mR1yedn/iKQINnucTTiX8KFKWdC78g9/1eVQ10UJFek8EgYkyjUAwtqhuo8XYdCnMpFGEu4EhtctMG4KTKWfgKsLTeJpheyivFvo7vJxtfH02QzG5tgSjT70QERddXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvZsl39/IrYVhLyDSgHPup/xDRall/9vxiR+ooG/6h8=;
 b=Saf+fGIgqgCa/FzD4IQWybowr0WlVW4S6or2NmYgS88F/eNrmytv2vPDrrpLhG0GmZx6Z8/wqrbs8MJC3W1upAyCw3vGMeSCsZpsPGOZc9VlExMALJHfKC4B0i3MJya7vT2rHMN8J5mbz8gyFIYBWYFPsY5/WQwYrDr5dZWrAWZfptZ6HKKcpnBVJGV7uX+izXfM6xT5PlWMIw8aSwUjQUo4JO9DfthQlnx6RWdHScB5uR/Ti2HNGR1aCnmmZajh+ZWMAnN51GJ0v/9NKmWBXF9OgPcygSZyi82XAOmfB/37tYO90MXS8MVRLHZPtT2PsnuH4hFZsVQ0n6fAWD2CMw==
Received: from AS9PR06CA0691.eurprd06.prod.outlook.com (2603:10a6:20b:49f::8)
 by DUZPR07MB9936.eurprd07.prod.outlook.com (2603:10a6:10:4de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:51:55 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:49f:cafe::67) by AS9PR06CA0691.outlook.office365.com
 (2603:10a6:20b:49f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 08:51:55 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Jul 2026 10:51:55 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id A4E0695804;
	Wed, 22 Jul 2026 10:51:52 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 753E7700DBB0; Wed, 22 Jul 2026 10:51:52 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 4/4] xmlto: correct srcrev to point to released version
Date: Wed, 22 Jul 2026 10:51:38 +0200
Message-ID: <20260722085140.2355003-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722085140.2355003-1-daniel.turull@ericsson.com>
References: <20260722085140.2355003-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|DUZPR07MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 22412713-a7f4-428f-85d2-08dee7ce7b99
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|18002099003|22082099003|11063799006|56012099006|3023799007|10067099003|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	V3m07j4+prZbW4rB1XWnipFQmmuyYMIRY4vEw+5IXtC+4bHK07eMd7UXtUr9Xf+H0Vnduj+++zcYMdyMyLZmAsydAgPo5fsaohEXhTYeu4NZ+OmijogV8cJ4VYG/l7m9UMIerXiCN+hDz4uQIyl6bglwOlihYHDRziohyMsW3Ovs0qU1IC2LHO3bLq1oAFp/UUQco5O7RQ5XuZ7hXoSRLYQCaTe+FzTPYgDPeBZAOGKT+QaDmGKddFq1zeFRI4aJQQTSIYSxJ/dtSn69RgBwPrWtXgBF+B6wtbrfOiq4nzhcHB6PYAlFtDn7auKRP7x+AjwRpZ6iaLPf2S9PeOKJ6XB0bdKakcBw/XjNetqRhp/7g80cyI7nYgv9T10Lx5gfllljSfKyyVyErZi85B7/qGvhhLSVNGvT6pi5DlAyhRHjOAbOiVJzj7JmfvDOUoUeN80A6D7DCI5BZ2z/cB3+LNhPs20+M1UW3a9CrSYO247Wl7d+wQEU6FgHwtllJIddoUfF+xhtbRFfzrKh8NQGs9TnheYwkHaAFLZBiR3XHf9j3l/Rww0fL0d+PV/dgWGZizXAKjtizqnEhSOLnoQ3ht2CXNhF7joRfycXjQEvbmJp3Q9nzc1wK4NoGyFoUaIqaLZSPflglUEqd/lC/phuQQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(10067099003)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XBRjsgxeQh2MZDfooiPG7J5Qs+6HV7lV593mlOZWmRr8mNuBv+snXhQ29KWenmyhHKusxHRxmSCqipY1+WYzVHZ1rkHAH0IprSCjqHmdrm04qcWyAxuHh06AkvOBR2/6ko9ek5rOZ10WsSTwpZmV+dYzUFmAHfcACbNAU3vReYt6Ai/YVI1ye5LdIQa1HISmLQlHHbmwEkCBwKHKXFypZFl5aZ/6c1gpxueA+FQj169XQW0USECLTVh5LnfB8ijdJ2yC5nWIQlmS2bZH2AXxtIFDtzPQA3dKgAaN/HH38YhEtkBRKLH+irnI4VohG+SeA+ZTT1PC6y6CAMb9lVjM23XstHGNHEFrmz0mmDNnmL71bb2Mgp8TBnCHMysbe4SRrvqkYsyeV2bOSv3mUkiO9QzWeZ6Unr5yrkVKcS7j6eVqQzXPkVq97J+q8vq3L0G/
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:51:55.5496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22412713-a7f4-428f-85d2-08dee7ce7b99
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9936
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241633

From: Daniel Turull <daniel.turull@ericsson.com>

0.0.29 released has done Jun 11, 2024, 635dcd5bc8
https://codeberg.org/xmlto/xmlto/tags

current srcrev was 1 commit ahead
https://codeberg.org/xmlto/xmlto/commit/74862a684907ada3d4ed2ce0f8111adf626=
e1456

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb b/meta/recipes-dev=
tools/xmlto/xmlto_0.0.29.bb
index c26cd21dd0..29652bd7d6 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
@@ -6,8 +6,8 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f655=
2"
=20
-SRCREV =3D "74862a684907ada3d4ed2ce0f8111adf626e1456"
-SRC_URI =3D "git://codeberg.org/xmlto/xmlto.git;protocol=3Dhttps;branch=3D=
master"
+SRCREV =3D "635dcd5bc84a7b67a3a2050a179d96e1d3050b15"
+SRC_URI =3D "git://codeberg.org/xmlto/xmlto.git;protocol=3Dhttps;branch=3D=
master;tag=3D${PV}"
=20
 inherit autotools
=20

