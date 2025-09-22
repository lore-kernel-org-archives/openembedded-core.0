Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA0ACAC5AD
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:51 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.6])
 by mx.groups.io with SMTP id smtpd.web11.47560.1758531651070120252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=qCRZIPO/;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.6, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIT4oVKCTigAbNfvVZlPD2E07V3dUC+glNGkPXJbrC1AjUU2tdnPWQHFIPeEuzP7+lnA5jXWGNA1DKdvD2fixddsa+f6v3Erh2xG9vgLj4I6m8TKVXR46plUOotjfTXA+YGfymreKa/ZoTZ2eP+4oxb3kyFzHm6r+RGT1yH2/+QZAeRNFA5uTOix6gIurZ/gVKfIkzA95jCBgyt0jWvbrkguISDTAGZxulQBv0JVr1Zqs82LcdJ6zVqLo88Y2tsQlVfeQWWwgvTM4uHXnrjDAC8C7aFFdx92n5dKrld4V6/wxvnpGKA+TKe1hNkdERYayQRLLw9erqFlDoIWz2yImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRW5DW+tbxxer+0sIp8DPfucml4mgpurM5SKxkbS3VM=;
 b=eto2gZBRyrP3IFlx5gmTtUxBgxxBvsSyZIu8g/ddpoWEMP/GBmaxmESVUA583lsS8GAMBfjrRxc3X4WJE72suQisTZ0m3KDAaURcJtQcy/wWGc3QYQD/62si8SQFjXdlWDC8PeFPOBp16e7Zl+ru5fK+7yMycar4C1JjUkBXMTzOKS/QtRRHlvybvz0zgAY8QUWKGA7+67bmsQnHCukm/0vvgUEWg2TLwHDib8xwupKTLr+jWSEhYk/XWAKXRfzmzB1Tmtw14VtpANYfg3hvEBtlMG2wHnfTmZDTRqs3tU95/nKFjS2mQU5GKSBok/TaIJk5yeTovy1z9NXBxl+GNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRW5DW+tbxxer+0sIp8DPfucml4mgpurM5SKxkbS3VM=;
 b=qCRZIPO/H2NnlRXWXdwTinUjqVgnXMiGbWpGV3W7BrzXAaF+0dv5fDw8aMDrRgv+aYG6xK0cah6mHi0Ev8IzgqRmsFwXGKhAZCZ4xQcyZ+FKXObHcAw7P83cA5UFjxezYw2/LPuozpxsNX5ZlxsXGa9qT/P6/QcEttjEFeQdfyA=
Received: from DUZPR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::15) by AM9PR06MB7218.eurprd06.prod.outlook.com
 (2603:10a6:20b:2cd::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:00:48 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::39) by DUZPR01CA0003.outlook.office365.com
 (2603:10a6:10:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 09:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 09:00:47 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 11:00:43 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: jie.gu@leica-geosystems.com.cn,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 8/8] image.bbclass: enable systemd user services
Date: Mon, 22 Sep 2025 09:00:40 +0000
Message-ID: <20250922090040.2859103-9-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
References: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:43.0056 (UTC) FILETIME=[6059BB00:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AM9PR06MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 03dbf9fc-bc0a-4e53-3fbb-08ddf9b685c1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LbEVJEnTVZm7x/ZEAWdHhy0KxFqDtZV4VEuypH2fsjq5g9+0kwBFV/ItNOGD?=
 =?us-ascii?Q?Ei7HL/xzDosRRAFBx/WJjipvMasnDUsSvD2BZUceIaGllAH6zZrSwY9/jdnb?=
 =?us-ascii?Q?DgvqK73TmWJ2ux+ayFKIux2dqFw59Y4EtKQMbR4K4tDqMDOsD7OhAecSQHhn?=
 =?us-ascii?Q?xwSfHJEj8urtV+VK00azHn3CpKJhUCJSrqbxKyFML/cNRlW+PQjvdQfD98W4?=
 =?us-ascii?Q?N9y/IVrrTWgKwlVm8jtGnawrSYwHMSNFjQbbmWYPMP4JVu7mk3DjrHohN+rr?=
 =?us-ascii?Q?zU+8uNLPZCH9SlC31gu2u6cN2iJgDO74gbKd/BWQNWjprQpqkFWA5TpYX8kG?=
 =?us-ascii?Q?H+Ji91Co+YmS7YIpw8WQ1o5U0BtVCFeyKdyoq+X71H8f5HJN7S/DAfZRMfkJ?=
 =?us-ascii?Q?+RQbjfLBBG0mJhxcjYqjJ66e7rBKzSZNXjirw20ttOBZQRqWJjc0No4ekAUb?=
 =?us-ascii?Q?GkBuV5/LUjkQGJ6uqHPUUmoSfLTPPayt1rzubCXWRQk6YLGsphMgYp6cdq10?=
 =?us-ascii?Q?KiDJgMKUkjE3s9nGmQZqLP6+62pfRLLSmZcdCnK6MbjiCMETbp6p8b08lgdW?=
 =?us-ascii?Q?qUbzyfKh1vdkTeB5zsgpZG1k3/BqhQ2Z+gIIMO1AJBI6NHv9wzVJTp2h8rKf?=
 =?us-ascii?Q?IGdrA96RchJJtrPQ7lC5OUAV5/a1T4CCi9IntDkKzRdXdvWeNR0oClInoDx8?=
 =?us-ascii?Q?gGGHySdprjSds+DlsvLjzcdAYBXlQ2/R9YQI7LwK9UrWOLqUoO03tU1jWRfT?=
 =?us-ascii?Q?EiRVUTQUK8oqjHxUAfl5/zjaITclutF0MzAt8FcgAi7E7M1RRGEdMgMzrSjg?=
 =?us-ascii?Q?f5iBg4yvh3yByI25zlViiJGJXZCGKx3/mJsXumy+1eYa1XMqKJwAG/kd1BgP?=
 =?us-ascii?Q?CTZKQq9RGJUqWHJKi8WNrHxYCr/oQWu1h21QWRnMmt3Jk0fQr/vAXu62+nuA?=
 =?us-ascii?Q?8HwopEmV91AJBzEeQudMMeubnIf2rsyTm6RESn6KLJaH8Ik4azPD/957aFA8?=
 =?us-ascii?Q?FNI6UWd2/RhYJEw0WRz+ycm4KNt0uT8HSu5Rq7/U7k4f3oPDTxEkr/+BzJPC?=
 =?us-ascii?Q?T6KgLoPDXJCmEerOwe8Cd/Q35oTG9mC4B8cMflwWmFcSt4rt37hL6LTDTGbU?=
 =?us-ascii?Q?/YFrLjyFeBowjdcvlR35wNDDSutN+dgqP/VDk2negWhpdzH5rcpjZvr+pum6?=
 =?us-ascii?Q?LC32IWJSf/Va8fya8KUGF+q0C0ElPv2XlwlFx/VHOol6FRz4yH2oRBMyTP1j?=
 =?us-ascii?Q?c6Pc2/2agSEV4KeN/rIWDCWZVdbcBIHnqOJPBT2HN/jL0BGScoZDABkvhmDj?=
 =?us-ascii?Q?5YWQo3AKQF82WENgXRY6EUAvQu2HEfA/wUJHFEHTCtSIhhfpcrglTouAse6F?=
 =?us-ascii?Q?4odqKWbyvve6KQAAD5dP+IVydz5OkSlmbwgpwN89YBJHtVxuo6cIr/ig0w+g?=
 =?us-ascii?Q?2qyNrx/DNtv7cTJIoClCQ61Hwc1tajsWw0P0qhYvcDh/TRcwNC2OIw5CZLng?=
 =?us-ascii?Q?4ygSFT9kG7s+oxHIQHGe6c4SsruUD6YdGNld9M0QshIpgmzbM1WRA1+Md8bg?=
 =?us-ascii?Q?fH4CB6INidTDukoQPCs=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:47.9237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dbf9fc-bc0a-4e53-3fbb-08ddf9b685c1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7218
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223853

From: Artur Kowalski <arturkow2000@gmail.com>

Run systemctl preset-all with --global flag so user unit's are enabled
the same way system units are.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cdc3b3028f6d71788b5fdd99436f69fbf18f613e)
---
 meta/classes-recipe/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 1f0ee1861e..0c3b396857 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -670,6 +670,7 @@ reproducible_final_image_task () {
 systemd_preset_all () {
     if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
 	systemctl --root=3D"${IMAGE_ROOTFS}" --preset-mode=3Denable-only preset-a=
ll
+	systemctl --root=3D"${IMAGE_ROOTFS}" --global --preset-mode=3Denable-only=
 preset-all
     fi
 }
=20
--=20
2.43.0


