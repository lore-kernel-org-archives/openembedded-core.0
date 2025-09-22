Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C842FCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.43])
 by mx.groups.io with SMTP id smtpd.web11.46868.1758529093626566746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=Teh5rKPP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.43, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMTW7bxj7cjEVLB2XzLaE8iLfeHepkk/cP/DORFOWrKlfdSN4khyCwop/nIlXcG44T2foJ4WZZ2XjECIMTaQ0y217N/bk2e/v92RGNH2bOOQfuQhMM1oBm385Zh5xs76HXgIO1I3YCNqy2sUI2IEnoNsSGWEg+McvAHgD3gs1KxYy3i1YLlFYMmNDEVWZ66IVVCUCnhO/gaK4z9O3kNE7PixVdMbvjf6AB1EK522NHKvyQFEgnuMPfQOPLh/JojWfBP53/JL+/VibPpubcmJ6XjLjLktaLtGFvv+48W55tzzI7VcKkOwOBMyQejJE2ZV95MuFrnUrRn4jOVx5C4KQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFTcbskdfhTh2zHfXbuiZ3JcDnhy5hRk604BBZ1IbIM=;
 b=qBF/Gw7xYnDTrsp+VZpP6GhNptVIBCvatLbum2XVIX1/VzAEaOcx2QpG/4+XhCAAA49UOQjtwcCLCzhXFbeoQiOlMWqYC6PQpwIgW+MO7MgB5/CWVyFv0Aa93WfWH0ycV1Ta8vEsqEuT/UCU2Vbrxast4cEzEcSfx+VaC1w3m418xLTaXR7sBS+Moa6eEmDLRtzuQzdlmf+PU0lwf+7iVFRTyWlIldFKwBkBBWnboPh8IlHJ3oE8tJddWqiSdh6qx1U2e18MCLUgWD2n4VlYSk3MaSz39UoVhaDIG2bGYxtjlUD6LQuRKQhH6V0mMAv5v6ULaPrqYntISJol8XCupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFTcbskdfhTh2zHfXbuiZ3JcDnhy5hRk604BBZ1IbIM=;
 b=Teh5rKPPzhobLSTd6fiAd7fPmGDUagxkQgHNBFCVc3uKdF+5cbX+PsuEB1KIN7z9lu6smct1/HffSbC0WXbbuqeUT7kcIFBD2yTYe+HsjYRxyl0kxkq9qpmCrvQWSu3FGCLTj03F0qCfpFAj/UJyYul0d61Kpuo40khl+kqXxMk=
Received: from AM0PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:208:3e::23)
 by DUZPR06MB9058.eurprd06.prod.outlook.com (2603:10a6:10:4b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:02:03 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::6d) by AM0PR02CA0010.outlook.office365.com
 (2603:10a6:208:3e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
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
Subject: [PATCH 7/8] systemd.bbclass: support user units in postinst and prerm hooks
Date: Mon, 22 Sep 2025 08:01:50 +0000
Message-ID: <20250922080151.3483394-8-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
References: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0839 (UTC) FILETIME=[2BC0E470:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|DUZPR06MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: b2df38d7-7d4a-444f-5291-08ddf9ae50f0
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gS5Wi80xQpXYKD6IfH0VfLDJfgIjhuyRQESgbJeptaVhu/PuDIyJMR9BKL8Z?=
 =?us-ascii?Q?ti6tGPfolG2eCkCo8JtWoD4MfXEtNiG/YSqDXlaZtxQZt9MjVQ6AQC8SEppp?=
 =?us-ascii?Q?Lhj1Z0nTRBFjfJb859lfM8eUU6Z3qMDJiyXWga/LVQRlv0+Owv630AoWIDK4?=
 =?us-ascii?Q?tceqwC8eaUrWuhp0N0H+Yl8GWJGKOiea4MFlI0dLTnnEgLyNirMPQQnQ9m6Q?=
 =?us-ascii?Q?afaIk/LGMdEjuWM46jSNewrkNSmA4X58mkxbqeh1fexUicxIVg9iFWbHtUnN?=
 =?us-ascii?Q?1aDVEnSGVhLdt9kglgSsvWvGqq1vcJF3FplBkEh9gaMrA303sEgg6ktqwS0k?=
 =?us-ascii?Q?3ZtKPJV28d6vRaw12ANcqqz+rxjutooSa/5pL3mQd9o3E+y1vuAe/uOLNTSM?=
 =?us-ascii?Q?/w485tnp+tP2QA32nQuyUN0YKOmYYgrJdGCu97ldEXq3BZ0G8q7mgYaqf2W8?=
 =?us-ascii?Q?YwjDdqcsQhgJedZu6MVkF8i4jKNewkR8O64Q2f8pFxwlcTFQ8b8mHyb5kRhz?=
 =?us-ascii?Q?3AaHifxPrhiZpej32jqH5jFf/xtFNTPaUQzr3sl7tbJJamUSug9ttQoguu8V?=
 =?us-ascii?Q?atdp0FLqDXloMPyRm74EmUVW7JU0wJ97lhzO85JcNhz/3qdxbvfzNp7xOXWW?=
 =?us-ascii?Q?npDxOXtNd/sNumpnjNAp1ReYH8KPfxrXVnDYKCblnBVbwVmmgaW8lUkPKbg3?=
 =?us-ascii?Q?neKa8Dq12UdxB55sWAzdMNMIxqZx6FYBWIQTt9Zc/uIgBgKdo0A0fqzb8vEf?=
 =?us-ascii?Q?FIr/nCK7RkdOaZgjSPOkx0SvTwM4gX08jNuoDDQHN6De2ryNSMaYvrOhy6uu?=
 =?us-ascii?Q?XCyHPKdsbTX5DvfoY96BEhDgkr5G4KyTBA1pouPXavIIiWMKmoH9O4wNoMQp?=
 =?us-ascii?Q?wmqNU8yy6lW8sxZBCxeegZ0EjLivQ4YHgF6NHM1GplF9AxR2GEPrU91RPbxD?=
 =?us-ascii?Q?QQgfqjUiC6JPX29MAeC3J427+4RVgIVh4/dPYAQXj4eV+Z3YF9eEqQyB6snT?=
 =?us-ascii?Q?mcFuRpQVRTr27knXGP8WzpJb8pqVU1nYBZJiBDoKxR6Cb6A5JXNR4ZuQYyag?=
 =?us-ascii?Q?M9sv6Vz4ZN8S93pCAU5c+H9nEu/2DsOOIMVpbYB6B1Q8RYtSeFsmZfD1hZqM?=
 =?us-ascii?Q?8DFoozXE3HSyc7IKni4Tx/J0N0OcZlVyojFPKXNv3MIafgqPaAV58S+4XCqx?=
 =?us-ascii?Q?B7cwO+t9hQYEo+oOshMBL7yHpYaZd3P6xCELhTv3/68nB5qKEwOhVpu5NVAN?=
 =?us-ascii?Q?r9napYAclHnE+FnWetO+HT8MsupN2Gd/kL+VzZ5mD/0RWO9E1TvZ7DEKu5dC?=
 =?us-ascii?Q?d+0/To980dcbmxt5o7UnmSxLeS/Ojd4OtpLw+x2gNW5AqQQ9QQd6sC9jR+N9?=
 =?us-ascii?Q?koTVnR9/ZOybbcj+49mz00wQWyhkynaN/TRvHWXgmNBW5BajYNRoF/n8WaH4?=
 =?us-ascii?Q?D1V3scF4moJmoaV6QwBkhe2wLxWk9jfhPfNg/RASZ3aXgLsTT1KJ0/h0/cu9?=
 =?us-ascii?Q?JCT6D/uhNM3hQ0+wvtGsWed5lNPlwesjbI23W7yJrMntNvH3wUfxJJaYF20T?=
 =?us-ascii?Q?kUBLbNbWOXUo1FXNWL4=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:02:03.3693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2df38d7-7d4a-444f-5291-08ddf9ae50f0
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB9058
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223844

From: Artur Kowalski <arturkow2000@gmail.com>

Handle user units in a manner similar to system units where possible.
Not everything is supported by systemd, but systemd limitations only
affect runtime package management - during update user services are not
reloaded/restart and each user must re-login or manually restart
services.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce62b88d8f71368e356b6409ada46a34a6017ddf)
---
 meta/classes-recipe/systemd.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index d827ec813c..a9ffc33c45 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -40,14 +40,24 @@ if systemctl >/dev/null 2>/dev/null; then
 		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", =
False, d)}; do
 			systemctl ${OPTS} enable "$service"
 		done
+
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", =
True, d)}; do
+			systemctl --global ${OPTS} enable "$service"
+		done
 	fi
=20
 	if [ -z "$D" ]; then
+		# Reload only system service manager
+		# --global for daemon-reload is not supported: https://github.com/system=
d/systemd/issues/19284
 		systemctl daemon-reload
 		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)=
}" ] && \
 			systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}=
", False, d)}
=20
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}=
" ] && \
+			systemctl --global preset ${@systemd_filter_services("${SYSTEMD_SERVICE=
_ESCAPED}", True, d)}
+
 		if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
+			# --global flag for restart is not supported by systemd (see above)
 			[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d=
)}" ] && \
 				systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SER=
VICE_ESCAPED}", False, d)}
 		fi
@@ -62,6 +72,10 @@ if systemctl >/dev/null 2>/dev/null; then
 			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}",=
 False, d)}
 			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED=
}", False, d)}
 		fi
+
+		# same as above, --global flag is not supported for stop so do disable o=
nly
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}=
" ] && \
+			systemctl --global disable ${@systemd_filter_services("${SYSTEMD_SERVIC=
E_ESCAPED}", True, d)}
 	fi
 fi
 }
--=20
2.43.0


