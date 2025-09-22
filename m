Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C4BCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.32])
 by mx.groups.io with SMTP id smtpd.web10.47300.1758531648349886463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=Cm9NxgSy;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.32, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdraH3VkR6BnxSRx7QPr84+YkzAB9S6L0sOFWLEggJCtSKgT4iKfgM+1DGCPYPhpZFxNBAO6vx5Tq/xiNfYxHoG/tZGmBuM92QLYytvdVwyRUx0apaGAdazZjFH6njtaqxzq8XtLQe1cctfx/ZP2uLJpOEeUqA/vT4zYeOv8vAxdEvt1KSf+G4xIrLhPR9CQEUOH3kKpnrHYl1N7pFMtqNBZAd1IZb+q0qgo8mk5E411AcaEVdqN0TnW8nS4HuWNB1blm4GibflCQPNHZUFNleoOC3HozZF7pVUJ4Pl+ZLeUUTNyjvAHSUGqZ0ErCnP/JHx/SC1erNOyIl+rH3Dp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVEu6kmWDYC9BGb97CEnmCr25rmcfD8OZvbzf3PBynQ=;
 b=G+EwdmTr1HszHWd2pUHAT3owWhm7Fzb3uEmd7/sfyrdL5OcjsGa2HvFgdoo3PUd8scUbibfK00hi3taRHM2t3s+V7M8nEjqeRsfm4L8a1uxgaX92V9AiakwA419k66EGjlsihwFi+Mj1EVbVYyDPKjX9aYsuRRhY2uyVbY2+9cdybT7jAXEibgVksH1TXiaMyk0AxvRmtJXFNktgzlEG/3fBlDGrZ72YcHXM8R9ddjMZgmv0LMTvKBRsw8FM4WJwuCgoKYqNXE83EoasYzSPt3K3r9lE+rrGeZgADU/JviZnsoiZRgJbsVfYjQh8Xa5t8Y6AKrGZ8mssWBA9lbzK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVEu6kmWDYC9BGb97CEnmCr25rmcfD8OZvbzf3PBynQ=;
 b=Cm9NxgSyCmimEvd82El7V9ZeTslynwnGg4xVccq40EMasHHTF6nxi+VmMbXVqWY0WMOfyMM8oNEDUDKc5xo05zGD0UBFu9w+YKFfcLD91KtJfTnm2dVhrVAjNsFdOPvc4qBxqs1FfXStLD6exXqngfAvhCrS0uo45lrtXMPKv/Q=
Received: from DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) by GV4PR06MB9984.eurprd06.prod.outlook.com
 (2603:10a6:150:27d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:00:43 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::f8) by DUZPR01CA0013.outlook.office365.com
 (2603:10a6:10:3c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 09:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 09:00:43 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 11:00:42 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: jie.gu@leica-geosystems.com.cn,
	jiegu <jie.gu@leica-geosystems.com>
Subject: [scarthgap][PATCH v2 0/8] Backport systemd user presets support
Date: Mon, 22 Sep 2025 09:00:32 +0000
Message-ID: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:42.0806 (UTC) FILETIME=[60339560:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|GV4PR06MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 0661179f-c54a-4b9e-2aed-08ddf9b682dd
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OY9SmpTg+rhUotByJjqu6G58zoJEa37q4GT6D+zyQ85FVLDN1KOyPcrUtWcH?=
 =?us-ascii?Q?RzyA1b9ja0DS4k5+CDK6DaGjLAIENw7hMBv9G5Utp//7gpPL+L/86ICpKvbh?=
 =?us-ascii?Q?0ySgnRzJ6+lxwoZSiy5vlhALMGL9IqSZ0xEnZVU1DObqLwoi8KDzUWnqdRsK?=
 =?us-ascii?Q?eJaYDhw1HTbuGh15MLFwVuEKwqp1cwvUCvuaghkFGjmbe3C6ezZct35ieqT/?=
 =?us-ascii?Q?B37JKlMxUdtP8u5atsnUTZ1vMqO+7tYXYdFNzthrgl+6Zj59aiksj+yMmT3M?=
 =?us-ascii?Q?1Em5PxzBujp/ZcS1VUJ/GT3vXDZsLQoV2M7FnJasbtvemoUyAy7dSNSgPGSF?=
 =?us-ascii?Q?64Z7G5qgNBD1fL5D0yaETkQHZaGZe3B5a0i6B5CteRms8oP3+cHWA65fbLrZ?=
 =?us-ascii?Q?NlEMVjAdnRYUjDuzA5LGOTnZ0WzXaDdyjMBoEssr6TB6Z1qOAs6CXiE6jRcS?=
 =?us-ascii?Q?Mb70KNW6lil/RlTgcfkEhswtRKXR786kY0QWWcguB4RihVblKnu+5/zUelFD?=
 =?us-ascii?Q?/hGkWk01cmGHWI2jKqRHPiQxW5PWiSZb7M1bmfLp5HUoeQXbar0XtwfSJca3?=
 =?us-ascii?Q?s952QOHMEjfttOV9/Hdy6yv9z7kOUSLFEDRHIxO9+VO4qwijhYdHV0cCa0cU?=
 =?us-ascii?Q?9NgnN+wYBJGJAbVYRg1dw52Pto3bN9CZjRyYUlLHUy1uV2ToaF+qlAdZaaJT?=
 =?us-ascii?Q?QyvMIUTTCHlcmL9KH34hDxATLYpMcBvGqsDUUrp1r2JqpLX9EqIfhzeEzgNc?=
 =?us-ascii?Q?6/HHRlJ3pYKZN8Oz8K6WIlil2GXe07YpITkgUUx642EJCZ+FFPb5kOh6Sm5d?=
 =?us-ascii?Q?awHykVfXyMQzAxapVplqIzjDLXmXJ/Klh6l22YYO07Qfaf46PKzPn/61Kegs?=
 =?us-ascii?Q?P2dkYE5snt88PfiApgWs6D/Z4xl82RmJOr2gSuYCZH7zcRxtJnQEZFpEqsoY?=
 =?us-ascii?Q?5yRC11vBGR8UIbL78cIAd9KiboqA8q+pK2p99Lz4N+qKdS6oMWKXohT78z2i?=
 =?us-ascii?Q?krX9sUU818Juav3wjNdkjEMjv3Vv01Jbeb9JMlsNYEUpyvCWm2IhMESD2A6v?=
 =?us-ascii?Q?jGK6NGA3Kh+Ppqmc1c96gxdxLOvQDz8hbE9KhCU+2KU0zrhd73LDKqg5redD?=
 =?us-ascii?Q?bQJ8SVFvC2CgDfvNqp2/fS2e2S9djYvqHLxDFZkM3uWq3MXZiPEIQ5mgCHg2?=
 =?us-ascii?Q?4MqHCLNRrAlWS3TWrGkzrn9doOJ4LMfkRLV0asS258hClZzwzUMefo/xQ7y+?=
 =?us-ascii?Q?/eu0cyqnrenl7HECgUs5KQ5NGWKuhw5qYykhxKqvu1a/YpcnorxKKQCVYSku?=
 =?us-ascii?Q?TsdU05l584zUj0EuOyKAXY808bZWYSNmhIcBn6ffBoHqk8QAP7A7ZUilmjAt?=
 =?us-ascii?Q?qnFcbuUWwChONNkoo6lJ6J+FvX2Am160T36zbB++74ZJtbJNssdIfQx7OKK9?=
 =?us-ascii?Q?tSjWvYGAJwVmyCT6tsvol4U63R62aQ9kxwAyMO4HkM4HTLiiQLBGuVzt5kpi?=
 =?us-ascii?Q?2COvzO8HsOCjioDdHYf5NBNevvoHd3uInuKWRwMhXHkjBoNQecisWxonusAS?=
 =?us-ascii?Q?Dbt9BkWsC/DmSzkFP4o=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:43.0721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0661179f-c54a-4b9e-2aed-08ddf9b682dd
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB9984
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223848

Since we want to support user services in Scarthgap, we consider this a
common function and want to backport it from the 5.2 branch.

---

v2: This is v2 of the series. Please ignore v1, as it was missing the
'subject-prefix'.

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


