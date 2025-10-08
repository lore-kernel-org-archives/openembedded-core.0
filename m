Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E46CCD184
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:52:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.32])
 by mx.groups.io with SMTP id smtpd.web10.859.1759953157710287480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=NPLuYUO2;
 spf=pass (domain: axis.com, ip: 40.107.159.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm3Kbh9WVIXI8Yjp4AqcKydBSIiOZyfRU67uTanxODUGHFnrlqGYRNIgkvMwuMr111hMeRbXdaGt+VoQHBd4SuVZMkJXaercNc6eULfv/fRRpq0UKlJwsb1Lm5OaPvuWl7WsT09CI0/qZd5zZC9TMu3nOhT+5fE8GJ9bn2EQOM9mJPrU6cKUPrmc0te3cPEuEixoy1HMdpVm3e3DrmZCs410hbz4n6KpHxQbgDx8Cgc9mrKXNkKaTCd0BYAfaXsmzNB9O2r2r1eNiiI/Y29DcUGrfBuIHKh6Xv53AHGN1Jn+Pe7KK1Ynnxfe+N12D67I8PAElQyJwed+CirBzj8quQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP1R3Fj58wMHXdcfmumU/4IgoP0leAASLqKD7mf4VGk=;
 b=SUbqGqVi6rWDLWagmPjpenYOvwvf+Mi+M7tDUMFbludClikOGi90rYYfn2tC/LFvHOpvLWlgb15nICRr583OTxDRyFiUhLb3fa8MEa/A1kEFCvM73AzhR/5NUYFKn0+oTMiKZUgazTilx8Gez7bYFWWl6B9eSvk0qg0GjRSQKueDunXnorSnk81AvpWqJl7v7F4FCtM9cG163G3hx+7y0wZPM1BXCJz09FQr9xodCsSOyIv3p0fZGcZfXSa/bJXsB4lbgS74a4I9fQxOXIA1u/mPU12G0Bd+QjtBAFf5eXaoeWRjUYWb3vrV/wNvYlDLvH/BH+2FSh77+6iw9Ze3CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP1R3Fj58wMHXdcfmumU/4IgoP0leAASLqKD7mf4VGk=;
 b=NPLuYUO27HDna5SXDk2hT3ByD0ol5akO5GVlWwefVtm89xPKAqz1gXYV0OxAxJNrCb3gupc6TZmxGocmfVqaQDWwhincS60DKJAxMsR+qCoI+wgRIHDaCLN0UN/4q5n79gAqHHLDkQsNgUYyi7IZjyzRqVXot4Rm18IfkbChqDU=
Received: from AM6PR0202CA0045.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::22) by PAWPR02MB9246.eurprd02.prod.outlook.com
 (2603:10a6:102:342::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 8 Oct
 2025 19:52:32 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:3a:cafe::f8) by AM6PR0202CA0045.outlook.office365.com
 (2603:10a6:20b:3a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Wed, 8
 Oct 2025 19:52:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 19:52:32 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 8 Oct
 2025 21:52:32 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 8 Oct 2025 21:52:32 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2B1593001
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Oct 2025 21:52:32 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2773A120210; Wed,  8 Oct 2025 21:52:31 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/4] core-image.bbclass: Document two image features that were missing
Date: Wed, 8 Oct 2025 21:52:18 +0200
Message-ID: <20251008195219.117570-4-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008195219.117570-1-pkj@axis.com>
References: <20251008195219.117570-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DD:EE_|PAWPR02MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: 80270acd-2984-42b3-6fd2-08de06a43884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3Ck2dDVLZYf0UvoIfeGn/TMzctlyKiIit82uI+0W2coP/czs6murYKWzWoCd?=
 =?us-ascii?Q?IKlaqE+H3QzciD4lYIv66vz48ZwZK+SbH6rYpDOpQfXvg/o4Um8FwMZaqzL3?=
 =?us-ascii?Q?gH1GvnJHVNqzDQE/76VIUvq4LauE46a9afPDg3s7rJdEYJJjxMogllSw6m++?=
 =?us-ascii?Q?uVefumS8GQ0LuN025OSRSAYGkKoHOPyWl9EBJlMmAC3xqXmkmjqBrtFwED5u?=
 =?us-ascii?Q?xefV7GulBn+9LVOtv6MjDdXeB23v7EViCy7PVNUaOsjTBW9qKlmap1ax/r+S?=
 =?us-ascii?Q?g+jbuC+yQfNVtkWSm0AqlJO9rYaL+MdUj2f9k8RzBwiHHIo2A7wrKVwDMGTD?=
 =?us-ascii?Q?7HJeEH/X+HL5PHvgb58Wb5Nul32iGZFQI/2acMTLafzn3xti/cWonc2CG59+?=
 =?us-ascii?Q?lSnlsrAJd5eXvAZn+veENXRBBIMxZpxHuEujT6IDf4Q/Rcoatn8myBqYi2tm?=
 =?us-ascii?Q?TOPr1ExUda0T3MNixXVspaiSKsJKD+N6NfLyoUmbFME4tHan8Eh0MTSCjCCn?=
 =?us-ascii?Q?voNssjyO7g6M7sQatXon9ZVXiFDgyNlhLjebRAowtflZ4KcK+M5efuujVOko?=
 =?us-ascii?Q?9Dj2i2KoOJK1VHovAKVAOXKd16mgbaC7ihz2iupGrFtZAr4El+Y2ycttwV38?=
 =?us-ascii?Q?agS6aiWN6Ir6xfKaZtRoZEtidw2otguD83jy5l6O8GjpYxpfO3bLezf37ghk?=
 =?us-ascii?Q?qwxqPHQyWOFLgMjue2Ft6fQHNdErKkQ6SsavoqwQxOeuvcdWj67ISawIjaCz?=
 =?us-ascii?Q?N857qSA0wCL/9/nAGe25m6eJXw+3X0bvAh92pwpw6VsyljfF5CpM8su+hK9W?=
 =?us-ascii?Q?Irhw5mjrUo8BDQ8aJYawe8Fs7wnVp79+5gclXeCib+t+Mib9P88lsvjmBUZP?=
 =?us-ascii?Q?nnoN3V7iNi9jtOlQhc3gXJauI9JDMWYIgkQaGEYYrgSItRn0n3pmQbN1g8i4?=
 =?us-ascii?Q?BqoPjdRKefQkdWN9og9Z8w+bUcB+kMtj8qFnHR7vYQ7y/Hx7LwIKY/3SATzz?=
 =?us-ascii?Q?2Kd2J2GHvUKHPVbBsYJqqXUiHW4Q8YDt0QWxvT7/eLjZ8Z6euJ4WTE22ayaX?=
 =?us-ascii?Q?vboc1sH5EDGmfJjdvxT2ZjP9vDNF5rpYzaGelAGmGDv39RbnzkRoQ+SY+5y3?=
 =?us-ascii?Q?Inc7oteCFGXVXHx7zDt7qs3iirnNpsqpBpIhCzsUs1GNgrabKtHrOo2GRpDz?=
 =?us-ascii?Q?Q2WAznedLAE1cDDeayy2SL0NU6hdNUGgX3N6YQ8KBo2Xwq2Cx1MdVe2wqBaH?=
 =?us-ascii?Q?Kt6pS9o45s5a5fd7KLqen3p/Kt8ljrq3oJJ5jPLtz0m6v1aCkiNfT8LFkHS4?=
 =?us-ascii?Q?iIwx3NHUCkfTifR1g+Df3KVJf4IbfbykDWC+Up4XaKTo2l30vnQotG0bOMab?=
 =?us-ascii?Q?MwMUQEObTxoD+1Ckj2MziNllv4XMBVy90eW4hCK8MN+QaH+X+on2eQg8pN5u?=
 =?us-ascii?Q?6Rsha8Iu3zF+541V2FUw/KV1PotTxK0p58lQ++8Ygc+Y52/GfGtm7fZcQ/fs?=
 =?us-ascii?Q?Eb1z5nuGCk+eAHnGV69EqCzn0MlvndkZiUubZV/TzvEkptr/u2fKe0ZjS44J?=
 =?us-ascii?Q?+GMiYQfE/NhC4cUIK1U=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 19:52:32.5296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80270acd-2984-42b3-6fd2-08de06a43884
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224597

This adds documentation of overlayfs-etc and
read-only-rootfs-delayed-postinsts.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/core-image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/c=
ore-image.bbclass
index 2fb857d2ff..959df1cf37 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -40,7 +40,9 @@
 # - bash-completion-pkgs - bash-completion packages
 #
 # These features tweak the behavior of the rootfs:
+# - overlayfs-etc       - sets up /etc in overlayfs
 # - read-only-rootfs    - tweaks an image to support a read-only rootfs
+# - read-only-rootfs-delayed-postinsts - supports post-install scripts wit=
h read-only-rootfs
 # - stateless-rootfs    - systemctl-native is not run, image is populated =
by systemd at runtime
 #
 # These features are for development purposes (some were previously part o=
f the debug-tweaks feature):

