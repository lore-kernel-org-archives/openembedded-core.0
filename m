Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42836E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 10:32:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.72])
 by mx.groups.io with SMTP id smtpd.web10.33979.1733481128574499716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 02:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=CC/L9Ol1;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.72, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxBrIRVoCtpBATuzoBqvPouwGiNPRzXDSvhozo2PHN0u9VrixkT+8hn4RurQYG7uG+IY1twIdfuXjATJrfFmMVcd/e7weO5Fsc3VKdSrjsm0q8sSraXm63BFGBx+FvKaPqOfFULrrlQePqvzm8LsCG6GcbUBD8zIzlQcx/7Mp17CfXzGF92yuRY1xA6f2ZgjHMRKfZtu8rkgqrIZTKE8ASeP6z0DZdpqoZ7HM1R4e2y+JD/MX0YrBPxDWCcr7og0Puym7Br8x9sMXib28MaUbABhUlpMvYgXWZ00wdINK0TRLNe4zKzGUdjzzu8FJPOeCv74jwAQMN7OeXhrHXnKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3d+/q8FgP0yxup8xI+o5c/aVJRKuxtifCq8RuMt27LU=;
 b=Shr/7ATvl+nR87syTDZCWWAeOMxYAlUFJDs/I1KgWZgEnOSYWSEmXjRdTpVR3wwq5lgS1iDyVKjlMFt9RErRKOtfrWQ7/OlrMMmpOLkYrbxaCJ2wIQAyOvx4d8VYuMxsoTE+ftu3mpMjqAoKAJNN3WcSYhE+CBxJc3RwYovKN+f3hSTYkHr0ZMHehYzZQI7XQZmGx4MVFkitBY605amVOGPM1f35915V7QifrJ8pwc2yanphHWFC5+oGoDuhYiegmOaMyOmgRRQ5qL0pGVNulnj1wBiUSImHvk50z/+aW7lgTAnSLdzdLqXdj8XXSwZpbSeo+3N4ii2JvQBgp7pFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3d+/q8FgP0yxup8xI+o5c/aVJRKuxtifCq8RuMt27LU=;
 b=CC/L9Ol1MxIw1Bl/AKctYveaaceQ9Lsi9Ods4UeQTzT3CXc+hoSI2bAfghCCmMVJwKYcKh2tAQNRAYXbExZxWldLxo7XX+KX8hcd+tPTduh8Hok5xtHzLZOTkY+3Y+IO5D/KtAERbTm3r9br6mo0z4OsBYWEvTWU5FpTT11D51U=
Received: from AS9PR06CA0060.eurprd06.prod.outlook.com (2603:10a6:20b:463::26)
 by DB9PR06MB7546.eurprd06.prod.outlook.com (2603:10a6:10:259::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 10:32:03 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:463:cafe::7) by AS9PR06CA0060.outlook.office365.com
 (2603:10a6:20b:463::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Fri,
 6 Dec 2024 10:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 10:32:01 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 6 Dec 2024 11:32:01 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: ola.x.nilsson@axis.com,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com,
	openembedded-core@lists.openembedded.org
Cc: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: Re: [PATCH v10 0/3] pkg-database and systemd-sysext image
Date: Fri,  6 Dec 2024 11:31:58 +0100
Message-Id: <20241206103158.1779032-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 06 Dec 2024 10:32:01.0671 (UTC) FILETIME=[16108970:01DB47CA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|DB9PR06MB7546:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 42c739f9-75a6-4f93-d566-08dd15e138a9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eMGs2WEFr28981ZS195HDih8N3tImt4XHALiUewpDdo9/ymyw2wKUG1y1vA6?=
 =?us-ascii?Q?gvgWn1RSWjIdZdO3Oyq9D88Fv0RoBbmq0svAZyLEyzRzh8CdMtxYW5tAXDL0?=
 =?us-ascii?Q?euX3uLq2+RxeDBYUqf8u7KZnB00snxB1U8xIgXj+CsI5WWgn0ngEJ7eR7P6r?=
 =?us-ascii?Q?3HkME8dxnJcYI88/w3ddLLSfKzi3Cx8mTcWhOFt2CssOZZU2rMwVuaR8nEej?=
 =?us-ascii?Q?bMs3wYtH7uhN3/B5ZRDeId3LuzPeerUuesp0woXuPeodNVd1h3JNVq7jY8dc?=
 =?us-ascii?Q?9kMT55ocs/0apjGNRP4cR8/NmBxMZzaeu5SQytdzKxcyTkeKihFvHEwd1x5h?=
 =?us-ascii?Q?OBoeQyDvfWGDe1cxq6DZZR1ZlH/5yO2DUoP8rPgI6ipsXlpmNk+yWeQGBiQ2?=
 =?us-ascii?Q?bP+k9QkRZfrO8nhGZjuw/vNmlTjF91mTqXCNSLlXt0I8bddK4dNo4mhmBObZ?=
 =?us-ascii?Q?Ml7F23Zk8QN1EhZiT9A+UMgYsCwXZrPZcV0BZaJ+xnz7/DYioF99rBX0fq0q?=
 =?us-ascii?Q?64DFa2YDL0DJBjVsTxRu+bmaW253mmPWO9xWOu5hz/bg9LO4MT5uleUSPozp?=
 =?us-ascii?Q?tBhkguIkpvpjD0LaMIVWME9lli4QNaMK8oxApqch0y6xSHa1IzyvNdrwzv8r?=
 =?us-ascii?Q?mNnyE7oP8BYvEg7bRSwG1JYcSgYkaiXGXfiTVdz2Tt/lq7Ek6zywaN5ehSGi?=
 =?us-ascii?Q?mprvxx5yfVI6F+IbTr0nYskSdDc6EGMr4veJfKtrH7eYRCplFnXvisvBGt+e?=
 =?us-ascii?Q?QC/RMBwFqbq0AwdLHMHMOB1Y0bk39lSawVraBKVKXofwkPQvdyKUvDvBV2dA?=
 =?us-ascii?Q?ioeURvDkXpQB2WF4JY+VDTql864pTB1ao78RZoEsG3D37kkSWCdO7MLxEWTq?=
 =?us-ascii?Q?8XS7F9GY2NvYaBReznOJgmla1m0+j5Llluat0vSSC9CGzdcssjKCr/1V6hKK?=
 =?us-ascii?Q?wZbInur1ABLPyFZbahraNzLo4eadqcrIC7ffHeONEok4WXnKY+tiayMXXSZu?=
 =?us-ascii?Q?Uhbq3TIqKY0mncAECcRVjRT5tbWpnqIiR90rnr83RbOJ+CkXzSflJAseJN+v?=
 =?us-ascii?Q?oZzJ4yfUUI7WhnzLhmSyqjTiD5jZTsrIZzFJQSSyfv6Ylz3oSJHB5OW6m++o?=
 =?us-ascii?Q?srM/I3pNdRLAEAXFNZsyaUDx16BlqLIfLtpV6SEw4114+OB6HPFwD9aWHxmy?=
 =?us-ascii?Q?xdZ082tE7Ii3jjPDUrdK7IGI9FAV0+pPDiob7bHs2E9nLIbbJ9slfYjGd3v2?=
 =?us-ascii?Q?ruQuS3nT+E6aTcA/4mT00XCzym9tEt1tim+dYf1Yzo2CIMDagpj6On1kGjt6?=
 =?us-ascii?Q?GEM04AiAhMDKvKxakvG/rM4nu4XPfu7pQUj30G9xYjmzriW2ubGcVMEVemqU?=
 =?us-ascii?Q?/YB31XOWxatCKEZh8OjJg6Bb2m9EZTQnVdAIgHKrndDzXJs5csuqnugc6Tuh?=
 =?us-ascii?Q?UXnvo9o+jNqB+zUf1MK1yqOOsgaYpYlY?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 10:32:01.8645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c739f9-75a6-4f93-d566-08dd15e138a9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7546
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 10:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208417

Hoi,=0D
=0D
> Hi,=0D
>=0D
> Johannes, what's the status of this patchset?=0D
=0D
the status is: it's working (locally) since around v6=0D
but some combination of the testing CI where failing, which led to back-n-f=
orth up to v11=0D
which was AFAICT almost there, but then the patchstack was dropped :'-(=0D
=0D
> I'd like to start experimenting=0D
> with system extensions and this looks like the place to start.=0D
=0D
please do, more voices that use the feature might get it picked up again :-=
)=0D
=0D
>=0D
>/Ola=0D
=0D
=0D
gru=C3=9F=0D
Johannes=0D

