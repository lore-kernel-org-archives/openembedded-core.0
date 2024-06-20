Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C0DC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 11:51:40 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.40])
 by mx.groups.io with SMTP id smtpd.web11.45426.1718884295574104372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 04:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=UaPbFw2P;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.40, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaYsQbHbVpqm/La/u3flc6hmsXIU6NeLQKUzO9BRP+FFBexdI0B5SuKBtYwhdhYk1/X2HTAf4Io2TR50lwKawjamd5fnvc0f8CDJpYiUBGEwTq+PjSobB/uli2NULPVcAgp9r3tL62OJjEsAoBi9awVOZm+R8ng00yG7V7vkEl4fcmrxyJlazHyKlEQSEZUSeLNr7pUJA0YV3YhFJvAd8azmDwnpQKBVG1GClSL9WVKl61Eb6d/CKQCKmnO2+dHgUzCGuYCBFmbfFkQIzq27J2lJWaTqQy6QP4vWyhGiuycSh8GPiIo1T2zLD0mMPJZFIcAQ43qdtIO1FNlqTqEoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WHUzmQ0URFNCU9fs7xNor2vrBf+Q2WaCt8Cvpm4vz0=;
 b=oYtA/2J55i87h5qwzBwN02AG3QduY9BUEAj3JG+NKEpSnjh7jqlk6IdihziFKcVeWQN3v9Bpx7tNE/6zULeKeo6GqsyBKajzqVP9gp6MKXlNkISSiULyz1eDyIIaypY1KAvjklY0FKhig7tuNvF+E1enOdbo34vpjvJk1V4mpsXxxAQeB3/ZJPhWx9Ah4TW8eQTXQwKaqxrHCSM4DyBqc5oMrk7iSrEj4hcSRJM6KNDvUIYPQTUdrDYJkC98uld5RxCxdvz+kX/Ag6bzuvDuGUbuViTJ8eY/rUgGg+fqV4Glj6p8Be3IzgG8Za/s3e/QzXpt0lvcf/EYc9+/wRPCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WHUzmQ0URFNCU9fs7xNor2vrBf+Q2WaCt8Cvpm4vz0=;
 b=UaPbFw2PRy+1XqVztcfyn59rfzL9Z4MTnnXPoQXNdAPOQ6LHHYc/TwekMivsm72zJetwCgOXX1rXI4NDQDLogQ7GiktgA0+fKHGo14U/v/F9NWMDbN1pKBvEnu1rf4awYqZCJGwgw85qJN9/HhQ4A1fjNzDvu+kk7b7GmsfUleA=
Received: from AS9PR05CA0080.eurprd05.prod.outlook.com (2603:10a6:20b:499::26)
 by AM8PR06MB6993.eurprd06.prod.outlook.com (2603:10a6:20b:1d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 11:51:32 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:499:cafe::10) by AS9PR05CA0080.outlook.office365.com
 (2603:10a6:20b:499::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Thu, 20 Jun 2024 11:51:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 11:51:32 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 20 Jun 2024 13:51:29 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	Ross.Burton@arm.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v2 3/3] systemd: bpf-framework: pass 'recipe-sysroot' to BPF compiler
Date: Thu, 20 Jun 2024 13:51:27 +0200
Message-ID: <20240620115127.36172-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620115127.36172-1-johannes.schneider@leica-geosystems.com>
References: <20240620115127.36172-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 20 Jun 2024 11:51:29.0511 (UTC) FILETIME=[301B6F70:01DAC308]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|AM8PR06MB6993:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bff51688-c7bb-4891-553b-08dc911f5453
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|82310400023|36860700010|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YMfTekEzgNeiHVp/2HU8py0lYFU9KbE4cCkb2LcscJgbm8dkYgTfXH1SAF9z?=
 =?us-ascii?Q?Bj9vZEMxdtrSRCHd31Q6kAaTJ86H98WXGpULo3BKlzN/5A92+MqJQAMXog90?=
 =?us-ascii?Q?bFBVpIz2Vx+LDmfk6lnZsCiibfFGqbYsst4W+tiasR/QZA/uBY/oiQOx/pl0?=
 =?us-ascii?Q?Fei5tH6GO+2NpLFcP33vJobVIEhfIEaqLR1FjK991aYqlI6CFqt6n3lMBU6m?=
 =?us-ascii?Q?BYtdkI6GUIVSVE/rGEnd7MVXEu11/sii++YeYPoZV8x3Ae9oL8BX7JzTt2ZN?=
 =?us-ascii?Q?DJJ/ZcN91ADoRSZO+csjMxZx8k3AdJIS7nFnCGPhQwAx7/nwPgqPOvMCOnIv?=
 =?us-ascii?Q?cua+lN4E1ruLJOwhWuf6nE4Jjo9+yWy7W7S/oWiZbkshXn6jTRSJMpZ+ia+I?=
 =?us-ascii?Q?x4mJPbESg7ddA4Yy3euup7uT2y96u9R1F6SdzW8YaBfcapi9wjA2UAV4anuy?=
 =?us-ascii?Q?aCBtQcE43HyFRQI76zXYZFaVfKDz+dsPaHLL7XAm5u4HiC7FEhS8L61BR4QG?=
 =?us-ascii?Q?2qNUjIDhzOLPULH7kDPjM9b5mtQTNOFs3YibE/A8uwbIMm9NwPCRhlqVCSZW?=
 =?us-ascii?Q?xfx75nKUZ4WZRj+uDglRGi6bFU2sn6nG+bBHg1xqHEIW5iu0a1HL2AVezOHi?=
 =?us-ascii?Q?xBHfwS5L9ZYKm2gpJYYXm2blfSp39HDl4SSthw/57fyerawDzb9O3ox6WrK9?=
 =?us-ascii?Q?/Sc9dZKjPRRvNbid4GNlWBX43rs+NjLLeFIqBQTDrSKKJ8rxfeFzEB1Q2/+J?=
 =?us-ascii?Q?Hj7knqzRQ+Xc4Phl6bdssG4GRl/c8Dbkj5OVbTKpNCdENPaA2B8Z/DnM4chN?=
 =?us-ascii?Q?/FndTvblxh3dyvdyVmjhsrfxV8jwjeD+5y7n0n/5fFXegCEOFNLH320M8EpX?=
 =?us-ascii?Q?SiS6lvteilH6mLJV/lxQtinVVCth5RMnY6/g2ak0sAHWrOft4AhTuu5ghdQf?=
 =?us-ascii?Q?MHxGcvIQ5nSfa9+tW8KNpiNB9LHXi7B4l4VF5BDCseHxhS3iVsk2afO09arh?=
 =?us-ascii?Q?4efSz9Ub3/DJsGBSAuqaj8obFU1/lFvrhbSjy1pXGhHRPg1xlDn0WADugvDz?=
 =?us-ascii?Q?F7x3YduwXSCt22dCi6NWn/62dZOfXI9LCJs2XO3/HBFKrX8kZuhKFKVAabLN?=
 =?us-ascii?Q?5bGjsjva//R7uPqIi36CPoqMOIh8aOfW09kbL6J1/eYRWKHfDWKmLLrpSYsN?=
 =?us-ascii?Q?YmzOfD92JZr2qc9M+oqOGm033wxDlNUdr0F9OGUcKCD9r1OO37t9dsklY9UV?=
 =?us-ascii?Q?t60/r9XeoahcqlrjfcWRUEXhU0fcNNPC2HVaj6QqG6bdKr7XDRvP4w1rcnTc?=
 =?us-ascii?Q?cNt1oMokLZzCbhKVmXOnwDw2njSIOGUc0esUBQKMNaNlwX7EwAJraOR7xwQp?=
 =?us-ascii?Q?0c1s7WTQl7ALp+VGrLnqbZZxV923avrLzG8EakJaJf48kVin/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 11:51:32.4216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bff51688-c7bb-4891-553b-08dc911f5453
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6993
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 11:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200950

Pass the "recipe-sysroot" path via the CFLAGS=3D--sysroot=3D to the
compiler used by systemd to build the BPF, so that it can find the
needed system includes.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/recipes-core/systemd/systemd_255.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core=
/systemd/systemd_255.6.bb
index d2c5e09697..0376412f61 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -234,6 +234,10 @@ PACKAGECONFIG[zstd] =3D "-Dzstd=3Dtrue,-Dzstd=3Dfalse,=
zstd"
=20
 RESOLV_CONF ??=3D ""
=20
+# bpf-framework: pass the recipe-sysroot to the compiler used to build
+# the eBPFs, so that it can find needed system includes in there.
+CFLAGS:append =3D " --sysroot=3D${STAGING_DIR_TARGET}"
+
 # Helper variables to clarify locations.  This mirrors the logic in system=
d's
 # build system.
 rootprefix ?=3D "${root_prefix}"
--=20
2.34.1


