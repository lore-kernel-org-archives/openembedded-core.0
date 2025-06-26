Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9F8C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 16:03:25 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.42])
 by mx.groups.io with SMTP id smtpd.web11.32.1750953804981992649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 09:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Af+L7jGu;
 spf=pass (domain: axis.com, ip: 52.101.70.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWi35Fz4/czmUqXLeFBVGdHhL1cVfZ+jrnOVSETCdovi8p2ruvmKc22X/IXcYl/5Oy5fyqBNNkoXUa+iK+oCMBohIkyUmJxjExUbYFhrbRNeNeNigyXVuwtQATLl5mDGkhDrF9rSEkRw4rSb6FU/pTScY8dV8GlkB165Fm7wojpzXNICyi0GKk/LeEFp6HyFARIX3cDxhkSaMl+shGFvoOFs/QuwIAANF2WLWfmSder1ERf1llsikQcesBw0X8nu3xJUCSVAKiC8G1UHgzEDdf1/1yKr4yVYS9iTYcw23oN3MRK91KrkR0AGcQSzr2MjmQq6FGXpFFV4XfefXF4c+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbBFQ4D7njEUWEds8DPIf50/RhHykYf47kJtNpfNUF4=;
 b=DkOh8rtpbBer6A7garBmHf2Uog+7hN7s/gBBarns5Dl/kxwpl3tOTLudh2wU9p1ge7Ywvt3o+bQiESEGFqhFgklXre4ggTzRKNRBMCD0nQu7GLFbdeV1L7gltmhmGMyPkSmBO+9Ltjcfo/mu12J7E4ZIXG1HeLvdxTAu0K/aK9XbszfTSuas1zY1bHKXMekJrB3sUSsAQNh5Oi76/96AWMn8BDfMemWHmTe+Ue0Es75bknRjcCkt5NTGJWf+sO4RYc5DTaCUTBgR6Sp/OMkgK+M5fROZY/O40Z3qfGqzr8zeZxCtEJn9ftuDsSihwWJY763XZIBqeN3mJ3wFFPnt5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbBFQ4D7njEUWEds8DPIf50/RhHykYf47kJtNpfNUF4=;
 b=Af+L7jGuNpGKMQrxIjvokxpLZrDfvT9nCriX90fjphBAO8z0jE76IBqkoBe6dt/XayYBe7j/u8DZxz8G+qEEnpl1r5tgkWkTqdDSgT/SDRInKNy6IlKzRRe9b3PF2kuoq9CdQxoKYmf/QbSvShHyU5qjsQm/xfw+RDobgPdoErU=
Received: from DB8PR09CA0033.eurprd09.prod.outlook.com (2603:10a6:10:a0::46)
 by DB9PR02MB6601.eurprd02.prod.outlook.com (2603:10a6:10:211::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 16:03:21 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::98) by DB8PR09CA0033.outlook.office365.com
 (2603:10a6:10:a0::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Thu,
 26 Jun 2025 16:03:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 16:03:20 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 26 Jun
 2025 18:03:20 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 26 Jun
 2025 18:03:20 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 26 Jun 2025 18:03:20 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 507013A94
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 18:03:20 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 4B96F1202E3; Thu, 26 Jun 2025 18:03:20 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go-mod.bbclass: Calculate GO_MOD_CACHE_DIR relative to ${UNPACKDIR}
Date: Thu, 26 Jun 2025 18:03:16 +0200
Message-ID: <20250626160317.2452268-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|DB9PR02MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a46b1ab-09c0-4352-6027-08ddb4caf8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qqFA41iDQ70tzNN5wGsfGjDihF1SG7Ie7x6g5eLQUI6kRU38GVazxM446y/F?=
 =?us-ascii?Q?rP+PDpwcCCS3L/xVsG67n3h1BiDAZh5tA74mZEsEDc/cL4ZINrTN2ApkMbUb?=
 =?us-ascii?Q?HDdpJwyJC2K+xbR8+pyGlKcGxPjTx4Wy1jeSDnNd3BTjMfPLQn9b9TkjyPBk?=
 =?us-ascii?Q?6R44TqAyoUn940X8Wl4w1h1IITKexzYPtnzp5M8vb7mnxaP/1j2gXrOnCLBS?=
 =?us-ascii?Q?9HaNL232Vvzph6Qcd+XbGIxckCMWCwt2uRCHsyz7e8bCm/W82KzIiN8ViriS?=
 =?us-ascii?Q?9y8APHTTLfxiwxDs6AhMM9CcExuT1jvlAZlcT+96oZw+iz3P5JVHOCkktyXF?=
 =?us-ascii?Q?Qtc4AQerPzooqjGDdl6vmqsNTeKHa/dpX4Vs6ATFZWYQntbSds4q978rOiPV?=
 =?us-ascii?Q?b+VRu3XBLZrLXd6zvlkwaFC0L1KvtODHkwOquAWB50GjRd55NcP6JtMxrh4U?=
 =?us-ascii?Q?eU9vd0l/aSrbmc9riXxIheMa9KUkZyvHTWMlXF5jckd48iTlVh55BHVhy5ll?=
 =?us-ascii?Q?F8TyGsmoTTkLiAB6mIKRCD4aIN1az9GTSFwnp3NBFg/Jpn3xTGxxNtttUMJD?=
 =?us-ascii?Q?6cFXsxyfN24LVXnGJGncR6NrSwzhkX9aM/cNEtfeEWrjCAV0bSu2TAX9zLec?=
 =?us-ascii?Q?vrdkbPvSa8rJ9NVCq8OVPeSnJP2P8GFx5vxaWAshpL8L1apST7haJ6oV0/2B?=
 =?us-ascii?Q?FEp7ucdrjWBWMdyOG7JrI3mBGN2+LQupH+yVQGXIhRUOrNDtTs4gUDLF5Ga9?=
 =?us-ascii?Q?bprG5EjHwhLU4XaS95aJaWJsrMdO/RsqnE19SfhqN6Ge720cEbinbuoGefmy?=
 =?us-ascii?Q?dVJECq1pcaQtviCCsyTWZrUhnYHCh/ZEOPZPW5Q6U8XkUoxJZoNv2FcC5DEL?=
 =?us-ascii?Q?SLh40tzM4y5yi5gbHp/dayLyWT6qHQ+cRCs2vV966dKDplc+HHLRf3Om4Kjy?=
 =?us-ascii?Q?9iT0wznHQK9or+ZeUgiQkMvfG5SMIHClEAlU0ygFmxujns2tvkftsAaReRW1?=
 =?us-ascii?Q?ES7Gl8x2XQv3uQ4wl80jYAil8NLB4BkVP3xz65uJLMP++sr8jXK9gtZyPsb5?=
 =?us-ascii?Q?w3OkDOCsPpIh2ASaBUCCAUn08C+C1gmAzwdddKFb68SSJJO4EBs4HznWbr6b?=
 =?us-ascii?Q?hFBx5YV6q28ElotNoMossqVATzV8RHb+uf+Ktg6AIW1bD1wdnTq4tI4mQFDV?=
 =?us-ascii?Q?SEVyqXYkQXafT1ifz0XQbLkZWIVQwlB4OeD6m9ma88wPmb+bGlnGuCuQ3fzI?=
 =?us-ascii?Q?LfGHOsUtoP/klTwh/4p+f+2L8gKppAm9J0EI20hQBU7BERmK0spUphYASzf9?=
 =?us-ascii?Q?kNWNC0Xyme6s51iStF1NMjr0DYNwkJGrlnDZfpUX+uWfZHBwmo3LiQCI4YdC?=
 =?us-ascii?Q?XwjjanOLPUEQJBxMY12RLy/CiOjWor+XsWS5Ez+rNBv3o/2J4LHSbMhHfJSG?=
 =?us-ascii?Q?tLPCUhbN2oyHSgMUx6Wme88UYJ9/HS5VBUN8iQrBFE+F8ZgoSw6bJQkxAFvW?=
 =?us-ascii?Q?fdRBImeELqXkuTiinGMQl79445O4Z/lu33hl?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:03:20.9163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a46b1ab-09c0-4352-6027-08ddb4caf8f5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6601
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 16:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219366

Adapt to the recent move of S from ${WORKDIR} to ${UNPACKDIR}.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/go-mod.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mo=
d.bbclass
index 93ae72235f..a15dda8f0e 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -23,7 +23,7 @@ GOBUILDFLAGS:append =3D " -modcacherw"
 inherit go
=20
 export GOMODCACHE =3D "${S}/pkg/mod"
-GO_MOD_CACHE_DIR =3D "${@os.path.relpath(d.getVar('GOMODCACHE'), d.getVar(=
'WORKDIR'))}"
+GO_MOD_CACHE_DIR =3D "${@os.path.relpath(d.getVar('GOMODCACHE'), d.getVar(=
'UNPACKDIR'))}"
 do_unpack[cleandirs] +=3D "${GOMODCACHE}"
=20
 GO_WORKDIR ?=3D "${GO_IMPORT}"

