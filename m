Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB15FCAC5AA
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.18])
 by mx.groups.io with SMTP id smtpd.web11.46839.1758528986796945297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=S0U9vIcw;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.65.18, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rve1InA6eFOMPL5EMhmHc5/CymN8Q4J4WHxfSVCqO3X5lwSJ9QUxDAJT+zrHkLI87POKPg3l4uF7rEixyKBgpGmR7f/g6/fOjhZhJetw6/xi8lvcSuTNQfwHlHKDgR1kgpCjzUpWM8LaqbR01rRnHFuBfjqbRTXURNljuQPyUxyi6hH/k/k/Zckc48gSZQVR4GkuvNkPe2DNovcYaf7qwMpMG7cAyG7bmdNjGWSYobZaGsRoJTufn/PuN8QEVoiHaV/eZ9+zz1kDYTs6I9AWJ6zFfMWdEaPUTAvTAxwanEpVAQOZx5hsNbEmuiSzq3Atq7tjB2HDbPgcL0tKhddMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPXnUhRlOn8KfQ+fh6FMvp9DUIUzEfepMeilanDAfD8=;
 b=WV8u6UUEDc/Cx6hi6tH5djZGRfCdzXSCV6zC0NNXQLBhSx0bLUVzU1KCA6N6ASAVxuSf1an1mO+b98oJaOAFF3JMrm6FJvvHEmlw48tRtuRf5aNWSOQHQ7nGfgROjxMPtnWNKUcXZrkrFFnsxSnnaEqWVGLqPNmWpjK7k3qxTc4fca5kMgYjeGwEiEEV49aiIY5b9i9ChJK6PPOe6e2hktGdA4MKCBvVq3KwfV1tkZmXGgShLi67OJfZp2dDM/WLp3xFStNWk2Ny58OxvIYF8ERsEnT54gVNBWRpyfRQdPGthv3AmdBQ8zUAbo7wMkeR3aeKasymsOMRevT+ZZk+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPXnUhRlOn8KfQ+fh6FMvp9DUIUzEfepMeilanDAfD8=;
 b=S0U9vIcwB3Y6GSzKlFzeE9Qv0Puc8igH4X4zmgMv+4r3g1SVaeMeri610x1zvvDs2vqzi9h08zqMRPWmKfgnfx1PHgu26jN4yHj7Q2qpUzKkDQEfE4vslTKKFfCNXaOz5+HBaXeqWwfqGMrmjQ0wN+8WeoQRZnlI7i9UVTS3t94=
Received: from AM0PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:208:3e::32)
 by GV2PR06MB10156.eurprd06.prod.outlook.com (2603:10a6:150:2fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Mon, 22 Sep
 2025 08:02:01 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::83) by AM0PR02CA0019.outlook.office365.com
 (2603:10a6:208:3e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 08:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:02:01 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 10:01:58 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/8] systemd.bbclass: introduce systemd_service_searchpaths()
Date: Mon, 22 Sep 2025 08:01:47 +0000
Message-ID: <20250922080151.3483394-5-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
References: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0714 (UTC) FILETIME=[2BADD1A0:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|GV2PR06MB10156:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e29a63-9cc1-49a5-090d-08ddf9ae4fed
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S36EcpmMjqz7VWpfDbC+a/eSECRkxhf9wfeibDlZ4l55s+SIbndOYU/KNOdw?=
 =?us-ascii?Q?nbFjyqmAz//6nkKCc48f8Obji8rGUSckpADggyWyW2ksMkCA6UftSL8s8zOf?=
 =?us-ascii?Q?NjKh+dN69fasL33cRUcQ8jFJaFELpVLnQmsJpvTCqLrYQCjdFaenc4g/jC9Y?=
 =?us-ascii?Q?68wTQQb5ou3YKkxftxVPfRjbvY6Ak5xDvsxPNyIyWtyyesEC57GSyEBaUb8x?=
 =?us-ascii?Q?Tzx1aPqIGxfbsqibSflxu8aIBWsmneBS4OaySlshyHfMwdsQ9ZgoJKhSbBqA?=
 =?us-ascii?Q?S1udDGArZH8ouB9rAA/pDjwzaiimFWYzcuJZekIpqKM8ruA0rSG/5N78nxy9?=
 =?us-ascii?Q?zyZ07UvvTorYJ+iIpEn1ej6a6sX/X70iAP7zCYiaGf3CIbIcawmxCj0hWhQq?=
 =?us-ascii?Q?B/XfGsq7cXZm0dyRGW6UrUvOL5WqLA1yaIPGx/gxJ85ZGy478VDR80T3UxAD?=
 =?us-ascii?Q?9nckVpJlTBTet39mSCrgEw0QcUFGW7u33NG1cAYzXLv5AkaqhAX7EgOTikA/?=
 =?us-ascii?Q?KGnkBP4f4GjeW/u/AOcTD7zKn7uLZHA35Sv5gb/QPyVLyqiVaJFbPwHo1oDL?=
 =?us-ascii?Q?p/XuJuxLts2Vuyhxqz+nYrsFH18jd+teS2Ec6WQa4/1c7QKPv/qqMhZXL98J?=
 =?us-ascii?Q?VvG8alBku9gqJgezwtVjnGupR+mDD8/j6IbXDr7tUe+zMyDYVyAfy2OeqIGv?=
 =?us-ascii?Q?A55aYb3luQ7PhDydg9/8q5Uvz7ba1PtGEgx39h1fZQr0cC/q3fQzNdGr71Vd?=
 =?us-ascii?Q?V9DSObkAcvvtEaSZgM/8Q1KFLFJMGHLfHT3gZG9v0ozuqlMfAR9s/32u07sv?=
 =?us-ascii?Q?d9txwzPuSaclJ4xwYgXXdcD3Zv/yGKkF7djSoN9meXfR5LPquKGbnAK/mwNB?=
 =?us-ascii?Q?V6fWc9/BqNlpmUWXis1lYp5gntepHDZrsnntw0Naq3+vU9nODX+54eomios3?=
 =?us-ascii?Q?vETKM4pJV5W2V+LZMz3ycKNHkOnoyDeGZVPOikgayhsLdGsT5avUtBbT6zi/?=
 =?us-ascii?Q?hc1PEVL+PQ1ZgOsAd+Vje415X7WLLK8eqFVBaGuBabSUDkfeR84zhgPPPY1t?=
 =?us-ascii?Q?z769y5nXL2auITGas/LGaNK/P/03LIKTVYafFGzfGZQKieKoxgupW4tGbp3+?=
 =?us-ascii?Q?XxypotsssDqav0ry0K+mVyh3uFEybG6Mcn7yC/E+8WAO7hoORmrvzrwoicYJ?=
 =?us-ascii?Q?WJ5cyZcc+fQhao/9R4Mrbu+zK9cFtkC38su9BEswnQfDy3AI53Lm/2enU4/y?=
 =?us-ascii?Q?+w7cD3nbgXNrODyyftriH9gEihMJxHx5OJ0rQrT5SmeyvPdG9RrqFExD1AC+?=
 =?us-ascii?Q?cUuU4ATmcn6QcP9jQP5FYbeoI9Zfr3ALC/CsrpueXAruMj3qG0SnhsJ6J65o?=
 =?us-ascii?Q?3w7noO28QVSXMOUjkWrASkmuD2ywLS59y1XKOz3MOlyGBMFiJpqHQmAxyms7?=
 =?us-ascii?Q?3/a+Xdt0EhV9TxwDZZqhoJ85ZS8Xf2qK2dyrdOs6+TpZrAS/QZHR2JjaJ98K?=
 =?us-ascii?Q?kemp81CPzrU/SeuM4LtSnw1M/VzoXYsvyHZugImn6+0J21xUWnJPirC9ZbXy?=
 =?us-ascii?Q?bLtihOv+059MTRIFN48=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:02:01.6699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e29a63-9cc1-49a5-090d-08ddf9ae4fed
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB10156
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223836

From: Artur Kowalski <arturkow2000@gmail.com>

systemd_service_searchpaths accepts boolean value indicating whether we
are dealing with system or user units and returns search paths
accordingly.

Previously search path list was created in systemd_check_services() but
following commits will introduce additional places. The
systemd_service_searchpaths helper function is meant to reduce code
duplication.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a89d36932dda306b3c2cf10771647eabc267769)
---
 meta/classes-recipe/systemd.bbclass | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 3f6c8bc131..ccbfc36121 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -90,6 +90,18 @@ def systemd_service_path(service, searchpaths, d):
=20
     return path_found, base
=20
+def systemd_service_searchpaths(user, d):
+    if user:
+        return [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+            d.getVar("systemd_user_unitdir"),
+        ]
+    else:
+        return [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            d.getVar("systemd_system_unitdir"),
+        ]
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -172,12 +184,9 @@ python systemd_populate_packages() {
=20
     # Check service-files and call systemd_add_files_and_parse for each en=
try
     def systemd_check_services():
-        searchpaths =3D [
-            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
-            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
-        ]
-        searchpaths.append(d.getVar("systemd_system_unitdir"))
-        searchpaths.append(d.getVar("systemd_user_unitdir"))
+        searchpaths =3D systemd_service_searchpaths(False, d)
+        searchpaths.extend(systemd_service_searchpaths(True, d))
+
         systemd_packages =3D d.getVar('SYSTEMD_PACKAGES')
=20
         keys =3D 'Also'
--=20
2.43.0


