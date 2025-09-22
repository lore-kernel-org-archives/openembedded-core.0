Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5094CAC5B6
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.web11.46845.1758529010711049177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=JL7hxb62;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.83.69, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAUfqcYX6icCkhX5nPuWKbjyLCEIa8xmGxr5JkpHwwiTM69ZaRAUfEsIRvMo9gWz0Tx3sP2hYHwZu0/pU6oqPms0wuiiE5O2vsNanF4ZYCfNh36UNKJGyVMrpByAEBXhuYoADhpMOhTOSnCuxwx4e5ZlC9HDCzgRUqgUxxoGp67mTP+HGVNRYgyrSsVpFSc+1FZD+rGqZOGRUeOn5Q2ClyGgXR16WfhcEWkSbxbz2amXvwmpxCGs0ykR8MQyM/mUDwW+/Mg/gmbev6Ah1OzulExgSteL5ae4+dM96foOIfc2Z5+dA6Kg14MNyr+PqIpiZ2kuTAWTP+LLGdEk1G44mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ2+IUZ5c0MDYB0/zM7nHmhoBHRoz031XG+UHTEOPRc=;
 b=dWBeouaeEqC3uAK+nQP/Ght9sZSUmZyJ6lMtgZj0lnj/EdMxhIZs3rC/Xrqj8oAZfHyI0YSb/iZj5VcDzlRc9hcG1I6/aLnWvkESk5jzcJn51ReAQEK1SQEZpDyMDgI7gYeXP6dCqduHymBge+BIz1R8AAXRrABK1rYZ3Vv2SiquqP0/JrBM/06aGoQugJhjSC2YgorV8YyXUl5FiTkGG/wvs86ZQ/5qhowwpF8ftIPfIIZlcWSQhbXaEjqyFadCmBiNIGatc/5N5QT1CjZ3kx+i5fyM9r8XcuNxR2PmmZeEuVMvdN+CDMIMQFB91J6Ov+skAh62fW2ft4tPxHvQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ2+IUZ5c0MDYB0/zM7nHmhoBHRoz031XG+UHTEOPRc=;
 b=JL7hxb625gL1tqnv/+bDjpKN6OkhU8INeD2zet6HYb431vVm2qZPgm2Y20w6q45/IYSL01Wv6jCjmYVkSWUGTm7s+sdJ0aw4xAGENLqFzrtrzyfyOqYxJ+ZcOTaHl3ka8ab4I85IBJICYFNKZH36Tn3GanyhlJd2FnvgZ4Nw3+w=
Received: from AM0PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:208:3e::14)
 by DB9PR06MB8203.eurprd06.prod.outlook.com (2603:10a6:10:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:01:59 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::e4) by AM0PR02CA0001.outlook.office365.com
 (2603:10a6:208:3e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 08:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:01:59 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 10:01:58 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	jiegu <jie.gu@leica-geosystems.com>
Subject: [PATCH 0/8] Backport systemd user presets support
Date: Mon, 22 Sep 2025 08:01:43 +0000
Message-ID: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0574 (UTC) FILETIME=[2B9874E0:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|DB9PR06MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fe6203-f52f-4425-fe67-08ddf9ae4e6a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027|43062017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MCm2RX+/MiVYe0jl6mslt3auNDGqR28HBsbOHi665kanM07awjfKfJqOGFL0?=
 =?us-ascii?Q?t8k1NpC6rYo4HJVPebS+67mg/sZ/2gPgrlWj/GdvXhvDx0Wsd1Rvmyxy1lqS?=
 =?us-ascii?Q?4cKINkUxqyf/Ptck+ucGsfnCs0dBTUjSvLy5ZEX9c+kOWlMwAW+Yz0WZdo+3?=
 =?us-ascii?Q?cBbtPprigTGJuzIGc+09Qu2CrWT2YpGnYQdD6n2T3TIk6DyajzmS0rPe1pov?=
 =?us-ascii?Q?QUswbH8raPP987f2SzkaJfBkstzqIHCO76+tTEr1p5gSSqGRrPmyGzLVWumX?=
 =?us-ascii?Q?VUVYP1ghwwXQafsypsleRRNDiOZsY4Pu1ZsB0qWyzTbCZ6HSgqZznwmWhfD8?=
 =?us-ascii?Q?JcQn3yhBDjWoi44iuzQEwTPr8RFSuURicgMxBlVcKSefp5oj2aXbsIiUtAMk?=
 =?us-ascii?Q?M6ahXaVeVa+8KhK+NHXb8Vxmb8C0EEp+ds56H0p7+KHcddyfAg5qN0pwDRXU?=
 =?us-ascii?Q?VRylbRUMBvDJeMCQs6Oii2P08nvDp0t0lz/PFr9Auzmn96DD8R55zEZLx2yx?=
 =?us-ascii?Q?ARmT4k0FbfTqV1MU/4UXcs6qCVAXtOcxBgKdwmp5W9qj/VqUaUWz6s4P7K5P?=
 =?us-ascii?Q?HzWzh3iQ0AT0a+sqACT5q8Am3jy47VCgWLeXQ5mOjI0BGBZpp6RdWLR8xKm5?=
 =?us-ascii?Q?QLqQq78BidAsPXEqZDAKnGtto0JVKB9XZPnQaAYtY/xewsRqdVQaX2CHAl71?=
 =?us-ascii?Q?atKoPRH2OCMJ47HXKapEqlleMQRRp0prIL0eg5lDnDrb4iE4aPFVZFJ1Jo43?=
 =?us-ascii?Q?vX4hdRCzQIfGo/t3UzvwTVpu0cJYPZZYPpnW5yW96N2UWXAJT9uB3EPh45Or?=
 =?us-ascii?Q?IlfJochDi4PsChpRQzQWCGecbxCLw8wxs5GeFk9F3LIglCLCJMhE50oiLa2W?=
 =?us-ascii?Q?OawxLDfQiR7IlhsE/QAcx2ukG1awRaJzq6BBq6Yr/Y0pZmg+g1x8Vu324Baq?=
 =?us-ascii?Q?ddPNiGGEu3PWkYRwF+wUGT7O2yP2e64uj6V5oo3EWlOW2J/azLdWHVPZHjHv?=
 =?us-ascii?Q?2P1pTL16KoOZmU/xPhdkJxVuBlth98ywKqCKRKEuYQPFQASrFIrISdauHCZG?=
 =?us-ascii?Q?r0EDK2i9gEbgZBmeJHhMAxlntbVtifXGuQcT/ztdI2FLy7WjHkPmeS5g1cs8?=
 =?us-ascii?Q?qQZAKrhXbq02nDPs7br3d8jUOnstf6LYdJfQNLS+cQdHHO5SQ5S0mi4tWBWX?=
 =?us-ascii?Q?Q5li0WgEQwCL2677k54H0Namo7b7o4Lal5vc0FcR3PBs6fXzEv+RILlPWyJP?=
 =?us-ascii?Q?uqE5H8nQnHDGh/94z/Hq9oLw5tYP1Dz0GT7Srty7Nz5sBIweESNYH+wjxwMo?=
 =?us-ascii?Q?uf5W6tc4vqxhH1ghBlG/Pga5GwyRWxaiqvw/Z2u8dYWD9CQibxX1Z6KZJpKA?=
 =?us-ascii?Q?vGzaCDIze71GLrvT8OPdl6dCDN89w403A/r+KlBrHzYylp13KaFpryVXFIxG?=
 =?us-ascii?Q?XpDiPs5wi7hf98gSjnDc3wbI2ECKDYQRJ5PPN+rJxaLqCp78YceiAkXlK2Vi?=
 =?us-ascii?Q?bRbkbUSC2raEX2HUd8gjEKx9a8AXqZj+0NzTH3R2+W5Aq/9QzHMozMMFsncD?=
 =?us-ascii?Q?kNMkXaPFYsYM72e2a18=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:01:59.1366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fe6203-f52f-4425-fe67-08ddf9ae4e6a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8203
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223839

Since we want to support user services in Scarthgap, we consider this a
common function and want to backport it from the 5.2 branch.

Artur Kowalski (8):
  systemd-systemctl: add support for --global flag
  systemd.bbclass: add ${sysconfdir}/systemd/user to search path
  systemd.bbclass: factor out service lookup logic into separate
    function
  systemd.bbclass: introduce systemd_service_searchpaths()
  systemd.bbclass: properly handle user units in systemd_create_presets
  systemd.bbclass: update postinst and prerm hooks
  systemd.bbclass: support user units in postinst and prerm hooks
  image.bbclass: enable systemd user services

 meta/classes-recipe/image.bbclass             |   1 +
 meta/classes-recipe/systemd.bbclass           | 118 +++++++++++++-----
 .../systemd/systemd-systemctl/systemctl       |  42 ++++---
 3 files changed, 112 insertions(+), 49 deletions(-)

--=20
2.43.0


