Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D997BCAC5B1
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.8])
 by mx.groups.io with SMTP id smtpd.web11.46848.1758529019536126596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=VyVMw/k8;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.8, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIBb8TJDL9E+Fh4MMuF3PgFhao6w16D2ZYQorpV98xMIaOTQqfrAOI9ivUci82W7+gC3N7msORrO+FgGpqPxVdaE6MyTirFQvC+coVvwd4MYePgusfUTeKsDzHl397SQUdxHMxQpP8kK5PGxEgm/X26Wom5NqST2oCe/bGf5/KzIMKU65mmt9wjMm9QlUpIJu2riFy8ja2Ue3RHSPuVfhvKpeB6Bypa6EyRJP22Y8Ksedy/MMyHo14OoH/bFDTO2Su7DlpedIajQvcecVsRkUfofxIEnXG6p2+3EhdxcV7+4FtDu4beEdT32WqZM0X9untz4yebhP0m5ma3JLqKDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBQ8+3DcU1CNkJas/uZ4vwbFb9c2p0UpqsbPII0YRP4=;
 b=G77OzfgvZP03D3khk3SB2W5vJtTBdHnd/JobMqCRs2l0vvi9mG65YHQnRl6GZ4J6JYCYgPdWNsHEac9qTTodO0hE+tBaUF1cn1NmjomNSgsbvxyz0sDnvnp36G3o921ENt2fgWieJfiwxte2ntTdo1Meis6O31pdyUFtQqg6IwuZPWglwpnZeF60ZgppTC9cK6r9Ll/+ay1faqgWcrXIIC3W+k2FU27UEho89VIAYGOcFXgQ26VwHvzJzXhzkiVqHiQKKhaUyQ7OtPyEDK/S9h/SHJDIA91abHNK2TdHHTZAqu7p88u+1IYr/HTeIJs6nRXa6sVDeJE2VklR1SCilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBQ8+3DcU1CNkJas/uZ4vwbFb9c2p0UpqsbPII0YRP4=;
 b=VyVMw/k8+uBuFVXeGaTao/HoL+am0iVKpsrWqGqsYJEvkXfV5HAdBisMQ5nUxbE+HYTD/q9KAC3U1lupoVSbPA4Ww2spZ24dRNyGlqhaqjlyOhmyxeuULHtHGaLx9zd5nr2767yIKhSMlCUVIzs1nMwPo2n2KQXsvT3g+kyGH9U=
Received: from AM0PR02CA0012.eurprd02.prod.outlook.com (2603:10a6:208:3e::25)
 by AM7PR06MB6817.eurprd06.prod.outlook.com (2603:10a6:20b:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:02:03 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::e0) by AM0PR02CA0012.outlook.office365.com
 (2603:10a6:208:3e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 08:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:02:03 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 10:01:58 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/8] systemd.bbclass: update postinst and prerm hooks
Date: Mon, 22 Sep 2025 08:01:49 +0000
Message-ID: <20250922080151.3483394-7-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
References: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0792 (UTC) FILETIME=[2BB9B880:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|AM7PR06MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: ee00659b-f656-45fa-a270-08ddf9ae50ca
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rzy7JYOJ7+cnIrytN12yl5UxyzVzH4asaWpbxBIW2WPUp9WWqgSvOr3+C3Ox?=
 =?us-ascii?Q?pQHzrICJCQY9u8VDMFepPKLvE154XLPtDSBnVVtGnv4Ud1JQWaLOGnKOTxsf?=
 =?us-ascii?Q?MzZ/8dJBEv3W5PggGqA/+MhtiUiqx4Zb7rEs2cZ/X10/zskpMhk9tskRns35?=
 =?us-ascii?Q?AunrLn472oyWFRA3ZGaYUr1mQLS55tax27AatJv8oSuxnvUYNzeiD3jxHvvq?=
 =?us-ascii?Q?owp0mKno7JZEKRjt3Rzs8CmJVsqNTtwIWTQQGqzjfO0XDsjyJ0Oe8XBLD1Vm?=
 =?us-ascii?Q?vsGg33Qgh1paZVzGFw0+5cC7T1eOG41m+magU3D4VYSnlZ3Zf2fuiclPyPzC?=
 =?us-ascii?Q?iey7JN5Ab3WsDL2zMFypKfe6dWYn15UR3gID4qabzcjyjh6jYfBhZGhFRDkh?=
 =?us-ascii?Q?zWdgwz3wWlk+57IzeXzfDOthe55gJGytZu7i1Iy3yqOsWpRLhF69xen5LYjJ?=
 =?us-ascii?Q?l2ikddarmk7FgGUvINJL9zKkTH/rAo++YhdwftcheAw27O+HAJWduosw46rf?=
 =?us-ascii?Q?6UyDt/hgR7EwFd3/zXnYPUt311UhsCnSXP5qD4zvqvNUX3swOCzdVc236PHm?=
 =?us-ascii?Q?HiOXHcfg/jNuxsgUCJHVA+1AOq3ztweHrzwEGvW/8GM2zZ7sM08skMkeILvW?=
 =?us-ascii?Q?88q0ckArYq4da2xAg/QY65yua4pNN5IDOZaxkE2M+3RclBwoo+aAkE6uRIxm?=
 =?us-ascii?Q?ecB0VcFdGWEfL3bpAnRisn9MjCAUIeTTj9+wKNZgvqQV7WSz+E/w5XG0EG3E?=
 =?us-ascii?Q?TxxCzIQfjzQNRsyEoX4ZKoa1+hFYenrPHBVCu5uUVfi/3U9l28zKedWqsCKR?=
 =?us-ascii?Q?8fQBXLcwyu/KJdpAI0Qjys1v/6eIioAutfhFUA7h78HL2/mWJjvVVU9E4+0H?=
 =?us-ascii?Q?HS/Bk0M/6y4kYQ6dHnWRqBdxDWEo4pcOg3JtOBvtJAuhwRq62ywkGHt9K1RD?=
 =?us-ascii?Q?sIcYgZufw3MUNkbSGJnNvNpjXT6+CpomGxXgqhmxnWV0BRsEH6XBR024Dhif?=
 =?us-ascii?Q?iiB2vTvojU5Cn6U+u6i5bYujTUaO1Oz/ZrpVEBXB4O4B2xn+4BFo20G46xNB?=
 =?us-ascii?Q?nv50B+ZnkttVgA+hNXkVv0kUtk8w5wWgGaRc9G6U8bQVD/H2gFiA/BgV9X8S?=
 =?us-ascii?Q?ppuH3nshX6EZlkbXTT8xxOOwENtwg3MBqterw49Le3rBaKasL4cZNblMWOXg?=
 =?us-ascii?Q?dUlZ/XcspAmCWQvEK5PJgDIFjiXsfh5PBcoUIuAPcPMab38R0euDcnwvCUei?=
 =?us-ascii?Q?N7K86huOVUr0gDljxR5Sd8W/lbYBDvx5qZ2SqXyaMTS+E7sL+qCbhEOjzPAm?=
 =?us-ascii?Q?poNxKmNQfK6hyK5VPs9bE2qjn7cZpWoA2uuCFvocusIE8dA2T+0GPJIas6p5?=
 =?us-ascii?Q?vblofkyyYHeKNkEr8/Et+Lu60gmh+7hIkZtkWqAaan+c9eU936KzkkxMjzpe?=
 =?us-ascii?Q?0/ufgCv2c6u73L4JaNSf/MXKXIQOuv/zbigfC6kI6WUz7RE0xOeBdnC+lSoc?=
 =?us-ascii?Q?DeSpdi2PfHOclz8cRJJikZiX5xoXmyLbKho2J4TpX6reJ5Z+CTSvDqV/1w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:02:03.1216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee00659b-f656-45fa-a270-08ddf9ae50ca
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6817
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223840

From: Artur Kowalski <arturkow2000@gmail.com>

Since SYSTEMD_SERVICE_ESCAPED may contain both system and user services
we need to filter out user services in call to systemctl. Introduce
helper systemd_filter_services() which takes space-separated list of
services and returns services of requested type.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec548b274d56b2c7a2663b70200df95a49e7452c)
---
 meta/classes-recipe/systemd.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 3cffe95d04..d827ec813c 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -37,17 +37,19 @@ if systemctl >/dev/null 2>/dev/null; then
 	fi
=20
 	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
-		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", =
False, d)}; do
 			systemctl ${OPTS} enable "$service"
 		done
 	fi
=20
 	if [ -z "$D" ]; then
 		systemctl daemon-reload
-		systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)=
}" ] && \
+			systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}=
", False, d)}
=20
 		if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
-			systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
+			[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d=
)}" ] && \
+				systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SER=
VICE_ESCAPED}", False, d)}
 		fi
 	fi
 fi
@@ -56,9 +58,10 @@ fi
 systemd_prerm() {
 if systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
-
-		systemctl disable ${SYSTEMD_SERVICE_ESCAPED}
+		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False,=
 d)}" ]; then
+			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}",=
 False, d)}
+			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED=
}", False, d)}
+		fi
 	fi
 fi
 }
@@ -108,6 +111,9 @@ def systemd_service_exists(service, user, d):
=20
     return path !=3D ''
=20
+def systemd_filter_services(services, user, d):
+    return ' '.join(service for service in services.split() if systemd_ser=
vice_exists(service, user, d))
+
 python systemd_populate_packages() {
     import re
     import shlex
--=20
2.43.0


