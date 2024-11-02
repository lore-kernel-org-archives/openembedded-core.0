Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A479DE67811
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 20:39:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web10.24590.1730579960204160571
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 13:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UsWyqjzs;
 spf=pass (domain: axis.com, ip: 40.107.20.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h22zEfvNYSuQ7XSdqE0wGSCbZ8eB1/AyL/SxNeLpgsPRnC9A5LyPh5Ou8xCnHt0KismM395FcAhkKpf3Rq6m1rxesCzqW7KFMS+qu3iKzVCRMPG9o/4UeUelVqCPprzNei/0bDAcE7XUZKFj15dBmJ6NfatTmo1nRPElhbNvi9muxCmtOaxVGv5l+ZP9yr1AuKKMgVQ5cAEE8PcJn+OVHAdmFqQ06uJ1513RloOSPIZ+II8ccKH05WKXzCy4fFGRDxbsRQ7DYFy2D8JekzwUT5TeyHSBE9hXwL7bCJDRmBhfgxpSTm0K5iGUg5hGdsgjHBn9MC+8n6nDAS3ReAX2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8gLkFSHE/EEYa962NqnP+9WBKMZ6RoHXD8CZlfnZss=;
 b=iyhpisHarFyq4AZ86o3iCUwSMupNbylPY7lHG1jdUwMgUgCFi00jqwhS9WtMkBEJHn8nWjSeh/6cB55PJUYteAk5d2AGCSMny7Psvjr1jIxxHz/R70+zlbQDfchTQ/ic06sCuhmgfQ/vCC7zG/i+gW++FPivlMBFsy9u/Usqm629YDahO6KM+2CHnzXcfuAGv5QPlNo68ucdQRy9WZyjaPz/c9dNhQX9LY9MXaohECNpKge/W8YcpIM0zzhOQtcRR0CsWVJUpoltzIAvqP9s5r6o7Ef4K3cbnqUEeHKgEzxXSPVhC/eYnuX6JbMp1ZHZHOv0djPfAs9mdCVToWye9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8gLkFSHE/EEYa962NqnP+9WBKMZ6RoHXD8CZlfnZss=;
 b=UsWyqjzsB5hB+ohxXxDWWeBUwZTNmuGVZWlB2YlE8Ms8xJPdrFIs4b5nwX+mln4AGhSr17+nEbxDB4BKW/PxmOf4MNbsU2brjeiKP+CQaMPjLOEo7tX+3va6kXs2g+w22ZuJVR2yozXHipRUJPgQr2CYQdCoCdFo1UAKNc3lH/s=
Received: from AM8P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::32)
 by DB4PR02MB9479.eurprd02.prod.outlook.com (2603:10a6:10:3f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Sat, 2 Nov
 2024 20:39:15 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::c3) by AM8P251CA0027.outlook.office365.com
 (2603:10a6:20b:21b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26 via Frontend
 Transport; Sat, 2 Nov 2024 20:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Sat, 2 Nov 2024 20:39:15 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 2 Nov
 2024 21:39:14 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 2 Nov 2024 21:39:14 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 973B52B4
	for <openembedded-core@lists.openembedded.org>; Sat,  2 Nov 2024 21:39:14 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4A2KdEkb1267176
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 2 Nov 2024 21:39:14 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4A2KdEWO1267175
	for openembedded-core@lists.openembedded.org; Sat, 2 Nov 2024 21:39:14 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] Revert "busybox: Make provisions to disable sha256/sha1 accelaration on x86"
Date: Sat, 2 Nov 2024 21:39:09 +0100
Message-ID: <20241102203910.1267120-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241102203910.1267120-1-pkj@axis.com>
References: <20241102203910.1267120-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|DB4PR02MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: 35656ac1-0037-4f36-94da-08dcfb7e6ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g5megxcWoBRM9jNKjY/kyaLF4wsjcojXtPYIQCTfRNGFIXzFsQbuXojRZUGw?=
 =?us-ascii?Q?PVXpG6aU7GxGytY2d3z+FKid4qaaQO7E8ukO//lK9hxPAE3WcdFRgmPtuepG?=
 =?us-ascii?Q?ujpyNNBp52FHc4Jucly16RfqxzeJW0OEshB2CK/K2tEaTIXGCn99DNMluMxu?=
 =?us-ascii?Q?7s43+2xajkSDNpa6j970QMVlu6S0wFrJzQAMq6hItLR/Y3FCD3aaDXoTXaMa?=
 =?us-ascii?Q?ilytulHubOUaNNubFawhyjs1/e91McUEs05fthjFUCN2aIhHBYhsKBmhPxZZ?=
 =?us-ascii?Q?JrttIwqIgvIhqmFUNifCwkxrmYeNLe+co7VuquDOlWMusa6owrHs0RZLYW21?=
 =?us-ascii?Q?lfq2TFBX4+rpdBt2ICgih3RBVQa6soQcJDDtW7PavyXBZBYM4OGteVw6gY+x?=
 =?us-ascii?Q?pp25jAxwzYd+cuExgoqehTZMfhMkSa+zIETqQ6gaMjUUAbEOQpqsmwk6Pmrt?=
 =?us-ascii?Q?JAAIO9yRU8t04ytFcH9dQDABdt18pACBlL/w7hd5uIRVP7AEk6Cr1zovbUjh?=
 =?us-ascii?Q?0gTt12g4EdL3xymHeRB4HGqtb7YOJ4VXIQstXZLOo1f3F10p4zyChCCIXO2W?=
 =?us-ascii?Q?wYJeMPd1QYIBWaMPacvnZQRVyX02S/Q1SbQUXK/+WEm4cnJffxQdZn6DWeCg?=
 =?us-ascii?Q?/tGLY2GM01Ld5MRfg6ssMBUJvdK/cLmPJEgtuYINftbX8M5d5yuVN8289SCH?=
 =?us-ascii?Q?2WNZeMGm/1OJ4ip7GFx1hqWmXgAzUHbMQ8KHbb40Y1QP+N5LkyhWNbnLVZYo?=
 =?us-ascii?Q?I8X2UEvlSjxsoOPhVyeSsaL4LerTyTgssXx2CT9ba0bQu3rwCQ/2kCo2dInN?=
 =?us-ascii?Q?JqzaQGU2IAk5FkN7TYleRX575F3P3HRaLv8H/eZeCRvg9aL5EmGAOurBL/Zq?=
 =?us-ascii?Q?q/YqBVHUGVGcRG8WYUHyDik0P2dkDiPjtacW4PgWbp+RRIRZBfghL6t53wIa?=
 =?us-ascii?Q?vLd6/sKMbv3E3reI2bDg1ps5IIt6eRmA00foSCyUFxgLSW2pvR6ih+huuOrv?=
 =?us-ascii?Q?sklyqymualovsgLK3/VPYG3CuY/rWfDWWeYRgMpBYKqjdR1YlIoq0r5nQjDG?=
 =?us-ascii?Q?6vtasamlGPKXhNj58ctjLd4jp4MDIFcFmUO1oRILefULBHU9L82O0XMksRYL?=
 =?us-ascii?Q?t4EaBBtV9hd3SHdH2vbX96jy33hFE5CfLaFmN4d3r+uy0SOzttx55NPnNoUX?=
 =?us-ascii?Q?PN40fY667m0CrgPZL0hZ283ai7E6/Z3u/mjb/iLLGortLAPBo8A0aC8nLhQb?=
 =?us-ascii?Q?ozhyFLyr77mvvNZ+ghtb5bHcFHA8Aqa4XU9eXN2HNAbzkZnYRGx14Hu5FRhq?=
 =?us-ascii?Q?o8xQCIORdGfpQ1kGuTKTVwq5we6ESmze4tgeBfkzMmcYNOvU3OZTdGOnq+eG?=
 =?us-ascii?Q?C/vlqt5+3FjiCtbmKMbKxRVKehCxcPBIopWDV8IPY2oN5i4W2A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 20:39:15.7180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35656ac1-0037-4f36-94da-08dcfb7e6ae5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9479
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 20:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206653

This reverts commit 22f639d61127f4b82a79008c5305e44e090a3680.

The underlying problem has now been corrected so that acceleration can
be enabled regardless of the architecture.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/busybox/busybox/sha1sum.cfg   | 2 +-
 meta/recipes-core/busybox/busybox/sha256sum.cfg | 2 +-
 meta/recipes-core/busybox/busybox/sha_accel.cfg | 2 --
 meta/recipes-core/busybox/busybox_1.37.0.bb     | 2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/sha_accel.cfg

diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-c=
ore/busybox/busybox/sha1sum.cfg
index 151c447658..01137a2486 100644
--- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha1sum.cfg
@@ -1,3 +1,3 @@
 CONFIG_SHA1SUM=3Dy
 CONFIG_SHA1_SMALL=3D3
-# CONFIG_SHA1_HWACCEL is not set
+CONFIG_SHA1_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes=
-core/busybox/busybox/sha256sum.cfg
index aa0b0b0b98..a5b0ab22d1 100644
--- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha256sum.cfg
@@ -1,2 +1,2 @@
 CONFIG_SHA256SUM=3Dy
-# CONFIG_SHA256_HWACCEL is not set
+CONFIG_SHA256_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox/sha_accel.cfg b/meta/recipes=
-core/busybox/busybox/sha_accel.cfg
deleted file mode 100644
index 70038a8509..0000000000
--- a/meta/recipes-core/busybox/busybox/sha_accel.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_SHA1_HWACCEL=3Dy
-CONFIG_SHA256_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-cor=
e/busybox/busybox_1.37.0.bb
index 3aae6eff4d..1051fd1920 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -56,5 +56,5 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://0001-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patc=
h \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg"
-SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"
+
 SRC_URI[tarball.sha256sum] =3D "3311dff32e746499f4df0d5df04d7eb396382d7e10=
8bb9250e7b519b837043a4"

