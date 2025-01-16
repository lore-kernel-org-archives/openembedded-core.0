Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1899C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 11:01:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.52])
 by mx.groups.io with SMTP id smtpd.web10.44920.1737022138323593589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 02:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=tjb+Yj8g;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.21.52, mailfrom: catalin.popescu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcaz/b+9g3eKUANXhcjEOzVoH6ccoadJBoW2B2muw2mPTT+yM5lAwt2/azNLsTzHEwxzklxwRz/cQJXMBoQUXmrjxQ4REMi1NFB6LzyL85knPbb5agYf4sb3Gqtu02v/7NMQTKTb7fqixjfiqm3lW5x5WFKJ3SuHCwxMca4AZOGCOBfrqwtMlmrHr9/K9E7FrcqyOoRSB5Q1NMujA3e04Ogc/IHWQ9ZE5gU3xcHDa6HAz1CZxwVa0PyWvCN+RhrsSt2so08u9k4ghlqEMM35yQabT2cY95CUgNWoLWQ87XQbK6cxMugYyDC+8N3CSmwzIHsXw30lWemNRjTtlBoi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xT5RG5CQHtRqEWlUqJvKehyirJtr6njc6F2jI8PLAyg=;
 b=NByqedjGT8AH/DXy2pReWjNfDHS8skpJfWsFb2Pz0IHAojRwkTxOh2UwN0qeREu6s1Nf5cX2iSHF1Vixm0K4TFtiOBRt93yIr+TvmaEEav2sp+r4cAh2dbqyu7rnRiSoJrXHQcpDo2PTRZxh9kE4XC2+T8OuvVhnfb4wTsQoxe0hOxxNalrpdIbkVRIbrQLwL8vFQ3A2r8YJaGVh6eQU9NuxrrwhUdyxs6g6m3Ls3vaSPW6pFtY4HmunyjT4Q/I8A3WA9uNaDMOIwpYHimHTfzqDdUU0PAopE1ObvPlQN7i6tV0w/GAeR3tQe3Fh9BaOxn94DjGtF9dzXLWw5q1UuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT5RG5CQHtRqEWlUqJvKehyirJtr6njc6F2jI8PLAyg=;
 b=tjb+Yj8gxufQ4vfIC1wonr/GpzZwppY8j2rNYZHKiHN5F3DNhH6uofUO744H/aZjbbMo9ah5AXfBTOcjZ70eycv6QcbW5VtddehQDAYLdiPHzz5LMD4cOB4VWXvzMSHeD1CdanCLH37TrlyiXZVdKFIlIj/8cmlxSOUaqrtYdug=
Received: from DU2PR04CA0296.eurprd04.prod.outlook.com (2603:10a6:10:28c::31)
 by AM9PR06MB7873.eurprd06.prod.outlook.com (2603:10a6:20b:3af::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 10:08:55 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::66) by DU2PR04CA0296.outlook.office365.com
 (2603:10a6:10:28c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.12 via Frontend Transport; Thu,
 16 Jan 2025 10:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 10:08:54 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 16 Jan 2025 11:08:54 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [scarthgap][PATCH] Revert "bluez5: remove configuration files from install task"
Date: Thu, 16 Jan 2025 11:08:52 +0100
Message-ID: <20250116100852.2058330-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Jan 2025 10:08:54.0433 (UTC) FILETIME=[A6249110:01DB67FE]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AM9PR06MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 05263aae-fe2d-49e6-c326-08dd3615c8d6
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+QY/CCWE8NEV/UIuIAxRzX7tOWc2w4GsUY2OcSGDu06a08XzA1dTeEDGbzVp?=
 =?us-ascii?Q?YZjsX9CPf6ip/UkexUWvqkM3y27WX6prg76bzuAL0x9mLSi8nCD3jj9xDpBH?=
 =?us-ascii?Q?cGkx1V/DB/ecLvYkOuQxI7eTM84YVmU4vfHGq0vDP4ugxg69dygR6QxlNvEh?=
 =?us-ascii?Q?mCA/xxVB+oyOOJnnWs2p9zuVY6CHsPR1ohniNWg1cNje5dlZC1kzlYETHQdc?=
 =?us-ascii?Q?HGr4F+vTARp3bCUHO0Rd8sW+8DVLLDiZ45Lq42TB4Lv3YpI9aJSKQ6aLAzQj?=
 =?us-ascii?Q?inDlB7dzzKlpsSCT1Z46ODb1/FSwcWxagYCdUbV2IFteYoGutO7VzNnwl24/?=
 =?us-ascii?Q?ZWci6B3ll0yRg/QwxpfMyCyAHtO5O46+rHhRa9eLtKVU7q7OgbhiiJvXzUUE?=
 =?us-ascii?Q?X6CFBp6heXhvlX1EBHqV0LjjmvVLBXyNmyX8fEj7mcHHBwb3NwfUEubnVNl0?=
 =?us-ascii?Q?XWCZi6HoYDtPeDielqP/3hHj9hZDAC+gKBj1Ge8HXDVkNN3UbDf72Iu0IB7M?=
 =?us-ascii?Q?NgwT4zcOMe8S2E6UDqR8pPGg81ibH3RJFfi2Ry2Df0LjoD5+E2m0aHSgwgtY?=
 =?us-ascii?Q?m6ujsPFNvZ0noPh2O/CcT5x2iLjiDXhro5FCgxc7kk0uVzKkvcxc98uUhnP5?=
 =?us-ascii?Q?93shpOxTlD4hL8zeG5DbNtptwZFKikiA1m63V26D1tK2zC3/m5DX5PAHoUZQ?=
 =?us-ascii?Q?CzzIkn4RpbVQz2vqaUZRVlnoDYNZnAtGus+iBIS74t9il1Pa3cQyKm6c9WJ5?=
 =?us-ascii?Q?f/i+f/L8AnvG60c7FzsVW7nG2zs8AWryUoC9eZOSrZ637PtK5ANPWHO5exQ0?=
 =?us-ascii?Q?mY36PoXzzm2EK4ORAfdisCzYbuwZUa0NDaAafUmqGS7uwBdyWL4RjvJAxdgo?=
 =?us-ascii?Q?kdRuyKJrWsGJk4iIWdYmB78FaEyYhm1O2tEmZ9WSajxpETvniNyBHq+HCbRC?=
 =?us-ascii?Q?yO8HrI0RhFYCXwtLTu7gZTd9yiKW+v4YghQf0+Wmyg8bXfL/21+CyOPXzK9l?=
 =?us-ascii?Q?m09Rha2/fTPAYek3xWUAumRxWIUDDc5+H6goUrJ+BKAhBPf5s+QzuhurdNfZ?=
 =?us-ascii?Q?2NN0kHNJHAEUQU8+HNTGPnXyN0ei3yqbMFpGIK2uqYHqhXWajFngxspYqHa3?=
 =?us-ascii?Q?zfCRrO8Oge1NalaHX4zwzlGiFZo+2sPapcYWcmhcbaCP8YATqqkccAYCtENR?=
 =?us-ascii?Q?ed02aq3A++Gl+WHR/DkGmx46vgWiC3hWgLnyH2axkiCphdiDPV0VwKV1GN3i?=
 =?us-ascii?Q?soEHVIss1X+GG6nT1x7jSoDVcM6vBMljiv62323t7D/z4jovp+zna89OkXSc?=
 =?us-ascii?Q?kGhSxAecNtY97jHKD2B04TZxtsGOvLpLpOqFHd9CwzClPH6+VBMVfWTNabre?=
 =?us-ascii?Q?mGXd+WZ3XCcqmmP5Qa5EU9ptdqpDi/OqFlqNDPS+Yx5QA4HUVAWkxU+4APu6?=
 =?us-ascii?Q?V8DPdTm41ugjkOGJWIHzP3c/LUxEsSzxQAsUIl52hcIJsMQNYJoELg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 10:08:54.7584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05263aae-fe2d-49e6-c326-08dd3615c8d6
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7873
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 11:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209941

This reverts commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388 which
introduced a bluetooth regression on systems with read-only rootfs.

When configuration files are missing, bluez tries to generate them which
fails on a read-only rootfs. As a result bluetooth service fails to
start and bluetooth is broken. Hence, configuration files need to be
installed in the rootfs in a way or another.

Bluez commit be0e79629 (build: ship all config files with --enable-datafile=
s,
2024-02-12) introduced configuration files installation in bluez version
5.73. However, scarthgap pulls in version 5.72, so it is responsible of the
installation of configuration files until bluez is upgraded. Scarthgap
commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388 removed installation of
configuration files too early, hence the revert.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index 3f2f096aac..976297127d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -86,6 +86,14 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
=20
+	install -d ${D}${sysconfdir}/bluetooth/
+	if [ -f ${S}/profiles/network/network.conf ]; then
+		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bl=
uetooth/
+	fi
+	if [ -f ${S}/profiles/input/input.conf ]; then
+		install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/blueto=
oth/
+	fi
+
 	if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
 		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/blu=
etooth
 	fi

base-commit: c3e0666dd2624c20c5f32657846d6f044046205b
--=20
2.34.1


