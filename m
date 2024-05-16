Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9803C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 06:54:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.77])
 by mx.groups.io with SMTP id smtpd.web10.7028.1715842444488077396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 23:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=FBkhPJ4I;
 spf=pass (domain: de.bosch.com, ip: 40.107.7.77, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMRB1/vr0gsXXevBRiNXvG5w6Qxy0lMY2lXSbVLKZ+zhSf0sDARRxo8Xtz6rqMnGsUg8EPwmW4iDlXrYzV8fW3vYyaMzbMi8Qc88/NDVZgeOtbrTOuwuT/FUCni0RXXRqFwMGopLO0GXhR7Rc1l3AewM0WhLoukWVO7bI0riTFdqXVpopWys6KaPlFiXk+w8TPu7YMojpIxbRj3V57W1Pq3mllC4Ryx4cdMYlaPYPAPlNgx6yhLsjDLgyhUbKamnkmjxbDZVWvfTbG8TCMZX23sYqelPEbIZPqsMaFSPAJxvuzOBF/dWGyqSr1de6Q7w0atXp01nOgd6JGP/r54IjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej54q/DNF2xWfHMPEyabxTDMzDYkazyQmmRkj8/GFLU=;
 b=oTooJfB67cWKcuwjVCmvoVqTytZltdDrakfCPgpzeEBS9JtGbY9Wt2lmyfgJ6ogDWg++k84fbCTbEU6m/EjIq0d51a08ybhHM1oCgRNftGzRxkYYp/zOPLz6d4Tgse3UHUOm+ZxTUNXixPQfHPj5N4EwQEMYRIoaC4Jb0w20/fQWMQAsbMm1KpznCwyr6nb/juEzn7iqFdrlb1xZEYYe+jmqtI6aNFxLuZPGhS1Gb/Fiw/vnnv/rdVseonmJiA/Iju9a741WEAoTJJIrS/Y6l3h3f1J2CytZ9q4KuwXf7RK/qdFm8+TAyDyONguzmTHykKOv9Ot5uNMNPN1baOo30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej54q/DNF2xWfHMPEyabxTDMzDYkazyQmmRkj8/GFLU=;
 b=FBkhPJ4INxSHavVmyKXZpi3g4wgtn6ydoq+Otm+JAeKZnJ86jeNFGkGyrAfL++/0mo3CU6WMGwAx7saJyeDQzEJoiENm6LxIw3bCJdcSM1vRZCg4EPgFuvc4sfhYC/vQVrc8sVhgQnfItwJtY8fUFVhJvGJrkXwliB19TusneJ7+s61XX/zUkkqtnfzI8qUg4adCU5oVWmLUaNTQUiXzRdAvHdOL9B3OjEqvCNR2E3e3TNFGxJc2P8igoUwzi3qnHgKupmmiIWQ84Pj5DIGhkTBaXWHXnqkB3irBhkqRDBsQNj2jnlhEM/WpF58XskOrCfsOIoWvJmjW1VT31k1eGg==
Received: from AM0PR02CA0134.eurprd02.prod.outlook.com (2603:10a6:20b:28c::31)
 by PA4PR10MB5755.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:268::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 06:54:01 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::1e) by AM0PR02CA0134.outlook.office365.com
 (2603:10a6:20b:28c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 06:54:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 06:54:00 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 16 May
 2024 08:53:53 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 16 May 2024 08:53:53 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <anuj.mittal@intel.com>, <festevam@denx.de>,
	<alex.kanavin@gmail.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [PATCH] libusb1: Set CVE_PRODUCT
Date: Thu, 16 May 2024 08:53:26 +0200
Message-ID: <20240516065326.4389-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A794:EE_|PA4PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 485d89e2-3b2a-43a5-f119-08dc7574f78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cmG74TtiN2uqV6N6AmkGhbAd6lhuWBBF6zRZP1uab31t7WNstMQ0IE3rpdZF?=
 =?us-ascii?Q?UZRF62oiZoe58IHk2RFF3kV19f1g6Ll7hMM28MoxH6Y/57BJmaI2+KXGlLSq?=
 =?us-ascii?Q?lPINUrglVcEEXlwJtc6ImfTvN99g8dB8bjAP5IhFeyoiP5LeTV0EuWHub1Ep?=
 =?us-ascii?Q?iwc8YjrB49Nn2yuKQ8p2RWsuhTcyfPEpmQsajFspw6qxPd1MfrY5GUWRWi8d?=
 =?us-ascii?Q?f/OctPMkmk49G+/c7HbLKT6/Jp7L6N9KvnbU3mbpq/aSG7MYN148zDYWo3Il?=
 =?us-ascii?Q?vsN0zQZDKRNaCLuXX6hRotaW2sKCRW7BIiX/XkB17R2tXem9FQoPOER62GK3?=
 =?us-ascii?Q?9x1AFrXJ9+/aloWA9bHegrakUlcdgJlfDRoIMoq8kOftyzJlE9ai3bfodO3H?=
 =?us-ascii?Q?XOzRlriw0EC3znosIrlVUQehtQlsuNaYRWOS4hjQ1VhlcDho3BdWZs4HKNf/?=
 =?us-ascii?Q?SFYGaF4ZceSgMC4Hf/bHFZkHRCBxbM1BmxHSJFdZec2HNAwgP2bh3gQWHEJH?=
 =?us-ascii?Q?x0jlbWgNGc8uCpWe016+v8RtclDPBQLi/2AH66xjxq1mIxGtrxxF0qWvpMXM?=
 =?us-ascii?Q?SDA0vhd5BC/15ECTbz7IcsHObInbX0Swots2SS5RfEhJcjJQbZ8LsVYvBnVZ?=
 =?us-ascii?Q?EgsZz+07Y5piANJSPxlsyXF6nz6438PA5fXzve2PmZrM3l8Y6WKuEFb7gV0t?=
 =?us-ascii?Q?U47nF4YWrlextxA0aFY7OULYoXZyc7RCXdusND9a+/aaag57KZPx6wsx9HXR?=
 =?us-ascii?Q?uIwSJ7vSAen2oPlPKmobPaBjE4ierdz0PmDpl/4pGYLvuLh0IOFwvvdE8vOB?=
 =?us-ascii?Q?AeU5PJRowfHgF3pyx5KJW/B10HgoAEdTFx1ZG+C3rVWPoQPfAFFm3riK0ceb?=
 =?us-ascii?Q?AYtYoQOwij8udvyQGgO40SXp/HLGn742OFBkWfEFXXOGVP3gGrkowfU906Ml?=
 =?us-ascii?Q?74qkW+Y1fsnj7PwPSb3VPmJpM1XfCddvCY3NqkXwJmLXUE9olzN2j8dTQ0D9?=
 =?us-ascii?Q?4Ugh03hdFo3d8CnOc25C1nCYdZ179bmxHqIqVrHiQkoh6zPjCqqQHyjWK4rZ?=
 =?us-ascii?Q?wjUKNa2pm3o1k1UMpWI7xa7hmyCFprc0v3X6TMKKgZqzByl/jkXQMpQV77Ha?=
 =?us-ascii?Q?HJIx45PmLwaVm8aAJqG8/MbZ1TPbDU3ACkZDdrsyBPR0tQBUZxlyc3E3Bvrk?=
 =?us-ascii?Q?QmFwDrugxxFGulR91WQEjBmhFU2WE6R7awqccTUTaXFWpTafu3mxHbne8xnn?=
 =?us-ascii?Q?4V1jNRG0hsGknfqd+tRDZZquB+rKHWBnh1LBx968rS6yRLflQE8fxltyCWTZ?=
 =?us-ascii?Q?97JsasN8yQX77PGsy8ImLAze?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 06:54:00.9073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 485d89e2-3b2a-43a5-f119-08dc7574f78d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5755
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 06:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199438

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

This commit sets the CVE_PRODUCT variable to "libusb" to match the
product name used in the NIST CPE database [1].

[1]: https://nvd.nist.gov/products/cpe/search

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta/recipes-support/libusb/libusb1_1.0.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.27.bb b/meta/recipes-s=
upport/libusb/libusb1_1.0.27.bb
index f2431d75c8..5bf854f95d 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.27.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.27.bb
@@ -8,6 +8,8 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c2=
4"
=20
+CVE_PRODUCT =3D "libusb"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
--=20
2.34.1


