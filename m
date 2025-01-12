Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA19E77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:55:04 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.85])
 by mx.groups.io with SMTP id smtpd.web10.36957.1736693702177509791
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=lKCocLVj;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.220.85, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCqQDCQmURJLMb0Vu2BgiMc1/5J7f95Lw7T0sOXIhZaWoNe98t6OVhIcNwWnn4KzTbhrTYWMuOPr41CwYJqF3x9OHXyrXyvwn51N/uLcEn0ZElTKKmQcO2AAHwpGKiFUQ+/IzCsRuyTW/hbif+Vv+KBeU6AtsGL3+rPspMjYqvVXHmtwdOlFsyAeUdv3XY0dNkpMXWWXW86WFu9JdhUm76yQWW1CaT4EvIY9wwe/7vNosOlWGttyUabpiFOE/MIFqzQewZL4G+JaLZkOMs+UfSHewf2FmMFY3vm5GO8hF/tnwDeWA3NfPyeX+UTeyeS88v3elcp+uGU0FVN5lMJR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6v1/vILYSn2jcsgEJtUIL3bJ2FNWlyB52P/cCjoeLms=;
 b=FLN2gWZj7/yHM1y4tFBq8qVO+dANVsuavYF0qUZAhVnp4jsT4nenB/PFx9XIJlJyl2crtk22RpoD1p/3/NXFqWZ3iWXjSzyHDSn4HFF5F5KE+ldjfF86NfjOs+TM7ORTWS3j5+Tt2waJtJG1/Y257i7OvNzFvv8cJfXPDGJttqSMwODeifkJtZGsWEXmQqREPhGtXv8cvi2SIEc/hsGygntlw2wWM3WEgHMa3XIoumaqVZ/NFkb7wEnQ7IhxxtYQZeSkNTat/CJ9ahc6n35/W+F9NAa5pfjyDlWympNzEC9FKeABmPnYXmnZapD/geH3aKrUIDZAgiRJvMJkwuCr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6v1/vILYSn2jcsgEJtUIL3bJ2FNWlyB52P/cCjoeLms=;
 b=lKCocLVjQQ2MEoVLGSTQP63FDvbRWRMh5D8qe07pKlTt/okQprb1qIVk/jlEHYtuOQW9vC0ijOdn87L6r0B04PldLY2YQYipq7NWcopDlp8jbu7ocs8Zdi2V3ZcO5QcMh0vOqndS/uZdgydbMR7LzYXCSuWLSh8KLXH8Wr4F9MpBKyTY+w2nbZMF+NT665H2vX49KcUDv8XWYrsA52V+qKXiOnudluyKD3h5R4FEHB/sdkz+UGI1vF1xl5DFqGLNo1LeVscDXTAmYo0XjEqTGnaWR58MpR8JXfMYmdJLNOyydRGkUstXotjp8ziiRW3PnEyyWlNKwgwPVTI/CwOEJQ==
Received: from BN0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:408:e7::28)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Sun, 12 Jan
 2025 14:54:57 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::e0) by BN0PR03CA0053.outlook.office365.com
 (2603:10b6:408:e7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Sun,
 12 Jan 2025 14:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Sun, 12 Jan 2025 14:54:56 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 12 Jan 2025 07:54:55 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 0/7] De-globalization of 'devtool'
Date: Sun, 12 Jan 2025 09:53:52 -0500
Message-ID: <20250112145359.607585-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: c6573b60-ebb6-483e-0c22-08dd331914ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/mgvNux9bBogOJfgm4wYKvwQA9DzumicbXmli4MThDP8PmCRa8p4pA8i7IQG?=
 =?us-ascii?Q?shzqjltEQc0OAUofs55ftuh02EBzOPzFjLkwB5bJ/YR4jty/G7l7GOgXPByk?=
 =?us-ascii?Q?1GsHMB+Iak+mn4J+TvelCI4ATghH5TzYhQhX5hX4kellxJGEI5I/rIKQWhn6?=
 =?us-ascii?Q?EpAZts+wscvMcHIb+PA/lnE8q3Hs4v+kCnryHJPhgJpZWWWBrI88j1esldjm?=
 =?us-ascii?Q?NFetAgZNvJ0RTXAbjQMKByZSv/vzwGJxAcBWWe0rKXd8MG5YNN8XMCXD27vU?=
 =?us-ascii?Q?BqktlaXxhsIz/pVvKmjzN4Ey38kWCCYAcOAKjhwg7ECwzvFzOEDY1PC6lqCt?=
 =?us-ascii?Q?YagG7O2D1Y2luiPDUrOR4YTAJYmuXK68JlD+XRrtSHk1g4C2eqqNEnmd9Qkg?=
 =?us-ascii?Q?P6e+LMEpocRjmCfh9I1XxQ1RPNptnDq48u/pA0kVchU1eP+53GZmfn0MPFis?=
 =?us-ascii?Q?MwhdNOEvvvdWEZVLq8DsrG32m4KkYeohtqvoRocTYYsRZjgB7JrURYzuw60z?=
 =?us-ascii?Q?j5LNEryg3K4LakHZc6s9rudvwf2Tvgu/5+SQFdUccqCETXqdTpIsjjXqfJ/A?=
 =?us-ascii?Q?wNaEZyNbgPiganqOmCedJG1tG/x29cNciz+3gZ1VB1M+ZiVHob0DQUQdYUXN?=
 =?us-ascii?Q?ygsIPdVPXeJoGoLAD1zmKvvKG61IKPjrcL/8LsuboEsOawTDEtNlhNZO0ubV?=
 =?us-ascii?Q?VviFDG2CGzV/WIC1FgLMX/gwHtvZ8RhlRfHR7pwmwhLm8mELtDbbgUYXp/8M?=
 =?us-ascii?Q?ZdF/I28VNoBiD9eCW50YmF2g3nzhM7Zc9OP2UR6eHGhGgj/PdRFowaaljA1a?=
 =?us-ascii?Q?KyU/mvG0g12C/g/jQPWJYO/oO9NXDwlNsqDL5sp1eBdewxiOyWpY9Fn89F1s?=
 =?us-ascii?Q?7m0VWLhwcBti+OaiOPDy+tDQjmtR3Ddd60rDJkn4CjxDWV+o+8MBQM2cqo5g?=
 =?us-ascii?Q?KbalcyffC6Hwsl4MZGrqMJbNo8r6jz34by2r69OSsB8VePPptIZgfNaYGrII?=
 =?us-ascii?Q?mUXkPrYN+oyC+lmI8rdg8Z+ALQsPxcCOfyxrK+Pv8do/UVkFZEme9dcvPK96?=
 =?us-ascii?Q?R2lJrLrtdi2icUJQpobrjYbAMoiZaHWSoTOk+NJkv+TPUeOB2ECxf7LklcRk?=
 =?us-ascii?Q?28H3urjghiH5ryQ3rNdk1ZJNG5v1LfNiAMMJ+jTPhPqqExmrfNOLl+3XwS5m?=
 =?us-ascii?Q?aBqCMGbpagJKOuV1N0Th9B4VBXav3hGOO0XuRJwJsfnQhKZvIv+B8v4AR0J1?=
 =?us-ascii?Q?TEORoYrkKlxC9ltoz5pVRjkoLS73/eUP9dkmMBttvalfN5tgt8XDnGZSzZ3f?=
 =?us-ascii?Q?qOkgoK0/CdSSK3ao9vz+8Qs8P7lou0vkIgw2r8qSsKHKfsfnFDdeSZL5Jn/w?=
 =?us-ascii?Q?uod2SEiYJbOLUnc5v7ZRolb5NOE1NDfFw8osdlWZe8TNCMCg30XWrAfiz0Fm?=
 =?us-ascii?Q?uBZYWHViS9nKOOf1umcdL2JSHgD9F7kdL09cSElLpNC/PEE7Mg8YmZYXTd1s?=
 =?us-ascii?Q?jfa+BLBkk6/mqh4=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 14:54:56.9090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6573b60-ebb6-483e-0c22-08dd331914ac
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209689

From: Chris Laplante <chris.laplante@agilent.com>

This patchset removes global variables from the 'devtool' script. It
also changes `Context` to be a dataclass.

All devtool self-tests pass, tested via: oe-selftest -r devtool

Chris Laplante (7):
  devtool: un-globalize the 'basepath' variable
  devtool: un-globalize 'workspace' variable
  devtool: un-globalize 'context' variable and convert it to a dataclass
  devtool: un-globalize 'config' variable
  devtool: un-globalize 'plugins' variable
  devtool: misc cleanups
  devtool: remove unused 'config' param from '_create_workspace' method

 scripts/devtool | 88 +++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 43 deletions(-)

--
2.43.0


