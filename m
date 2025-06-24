Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98036C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 21:51:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.27])
 by mx.groups.io with SMTP id smtpd.web10.925.1750801861967663063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 14:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QK7D23f3;
 spf=pass (domain: axis.com, ip: 52.101.84.27, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJQ/4AidYNdWPpnK1nqZ8tg/EPEGuawNSv+sHnBDhs1Kp2Cad6c9MXKrWfagCsItuQeA6cAjwfQRcKNw635q3jVks4yU4NiOmAv2wgZwjNYXKSq0ZC43oD5rpMrsWg88g1qEo4LENbbyVRQsTlFPiG0EQk+DOzlHRl0AwqqpsOAwslmEpRmx8fgW77G9EqYIYeJlO+RM3XLnlVd9R5RYZx8O4MNP4PLR10HEb3AzDF7lKUsSecBRKloiGZUmnMCg/7cs2gANuNB6QbfQ5FWEivavXhfYaINvN+3szWrs0McSLVIIcbjkBWuMNRbh38N0uJbdo6IACOYC57qDzTeZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jt4K95o/zRz93Xn66cCAc+PR+3Prmv0i7JNAnr7xak=;
 b=aszjDpl/9u5QkMMGFw/BWLDSnad+Dig88Mx7AmnyAO7Bpab0odK1Tljq6YDW7sbRCmXDVsMpk+3hQqcfVVtUacKNkAh/I67MemodG5P1LocEnXwAdmbDCXaUQFYLI61chmCskCXB6vBnn+NoaVL1ZAX1Q0aHl/hm6vKHdmfi7KXpB4hINMM0U/6z/qildnfE9tglUUDT0J7EA0SthjFmzfI99VYMQ53wRDvbcccJ8XNl8zxTYrfqT3ngVisiPayEXGzjPjJxndZxt0W9vZJdWqAPFyEpzDPnuff7oOPCgYZxW07fStWOD38vflhROpcTEpMHPEmQ3o3A+ucCyE6G6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jt4K95o/zRz93Xn66cCAc+PR+3Prmv0i7JNAnr7xak=;
 b=QK7D23f3aR0HNEGHgih/7Dt/XWQ+tGe8ggt6V69QitT5KytN/+R2Y9qkOYiGAEjWEh1l+aQXYXWHYdebdTEZcOMjK6ATwUuAxdm/9bqZOc3PFTTEjFUL+OWZO0wgExwcgCtyLIxIEVAFl0t5BhAJq5vvS+JIoDodeUZcambrDg8=
Received: from AS4P191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::18)
 by AS8PR02MB6743.eurprd02.prod.outlook.com (2603:10a6:20b:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 21:50:57 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::66) by AS4P191CA0036.outlook.office365.com
 (2603:10a6:20b:657::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 21:50:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 21:50:57 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 24 Jun
 2025 23:50:56 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 24 Jun
 2025 23:50:56 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 23:50:56 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B121E376E
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 23:50:56 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id A93421294F7; Tue, 24 Jun 2025 23:50:56 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] glibc: Use :append to add to CC
Date: Tue, 24 Jun 2025 23:50:53 +0200
Message-ID: <20250624215053.3162975-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A66:EE_|AS8PR02MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf9e656-ba96-4f9a-93c0-08ddb3693378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z12k3UJXYy0KTlIgZQM6KnJOeYhVqyjjVk1Q+LkxC+XfF03u5Ep1QANzNB1Q?=
 =?us-ascii?Q?81LI7OD8J4Q17xZLkPRxoJBwYPCwgYwYlYrbkErdUw2hyJbKIsH72s+QMtQM?=
 =?us-ascii?Q?N0LA/cwFh4Jee/pQbEiQ10Z+vSeFBSoVd/nqT2KRQV5jNtr7zKpv+npYtp3y?=
 =?us-ascii?Q?HAr3Prhw6F0Q9n036HwvxyWfwRRciMZg3sZOsVmktmWIDlsxj1B0jEZZ4+wP?=
 =?us-ascii?Q?VsmHULzyAoQQ85tejIFGJ+Ml3qqQS8yEuYuDhoiASaKkuWgYNMBX5C/Av6qU?=
 =?us-ascii?Q?V9o66RCOWUI1gFEUqguztx9IPIz3C06ud6GnJq8K93nQ+dAMcbLGzypHZc8O?=
 =?us-ascii?Q?WX+g3fdU1CGfh1x2Sdy/tub0XxLf5wH7e3BvWTJp1PgeJAhvWZeIWREWYD4f?=
 =?us-ascii?Q?M4pcIwPoyd5eN8Z9Y/j8+WixBVE54HkeKxMumL3u8zrtfd8Z6U+myhzNZdTa?=
 =?us-ascii?Q?Cp2Ypj2xE5REBgoJjzRJ1UpLjiivLIRAOOV+bX5s+WF/yIHI7EslfkSEvu34?=
 =?us-ascii?Q?M/Hob57i2Dbwd8mcg7ZZFcXaGPpn6jWANkBm5R7GT6z6oDbrEEAE1o+i9gxG?=
 =?us-ascii?Q?a23iWlK3Eqx6fCUDYLMR87l/1GO27Aac19kY2lfONocuH8IunLq+ZWylcbf1?=
 =?us-ascii?Q?t8F129cKshWZcKPXhy9wzoWNlzfVTutKu9QbZrp32YG/5FJ4/OOo9j4gjejc?=
 =?us-ascii?Q?BIEpgFpHK7i1l1hv7vc6iacoU8+m/QNIXMJCXTC+fZ8IvzUmGdh5ZdZwM9qZ?=
 =?us-ascii?Q?QeTjzA6LJaSPeTc+IzEMXcsyuoKhYF7f93vUQ8Tnxltkz+CpPRYKp79U2X9u?=
 =?us-ascii?Q?5us5wyKYM8fhvZK7y5Z9vte4LZjGTwr2YGNyD2DAa8FV2iWVf72BqEz69ywk?=
 =?us-ascii?Q?qrlmwKbsY+wOGVsGVUD0phjPfNjhKhmFRNihdj1T3szTWwr3bFfHsNrIhkO5?=
 =?us-ascii?Q?pcqN2ckYyodw5lEVbAzjujlWweWTihfeayE+LLGgmOnIVrtdorALnnVUi1Zu?=
 =?us-ascii?Q?UxhIBoAQajyZ1tko+Kj7Hk6F2dYH3d3DroJQ2MhQ6sXwJ3i3QaNXY56WoJe1?=
 =?us-ascii?Q?CncbQuSAM00BBmx6nzYWS13jTSoCfKBUYAeD8EKvHvWFK/cDy8nbyHdYETYH?=
 =?us-ascii?Q?lKB3YCINRFNpkvIbpAlFHxNqrjFMxCalgeaMj7T58v4IQB8BH7cyW8ZxJaWm?=
 =?us-ascii?Q?FVra+UceIC+CgcQDCZPvnSXnxPttGxxhtFFgiegYSptnnm1iOudKqkdxulwu?=
 =?us-ascii?Q?L7TbqooQ3ialGLHmwFEkt0nRkIUh5omAttGe1KsJOY2j5t8ZlJSdSQBW/5l8?=
 =?us-ascii?Q?CGAB6dYvbVxB5X1HAEgd/vD+sTpOK/QJbzXxhm9OySWEeP5UG4n3Vn4mZAQb?=
 =?us-ascii?Q?z9JApczMPK215W5aLJaEwvWcITymglLmCxzWt2EeJUmpzHIuMkolIj73HIgy?=
 =?us-ascii?Q?Yr9c6AWxUFYaRYXQ3SsSoYFiwhOmYexYVCqxpLUGVDNwFMg80Y8VEbZejZuz?=
 =?us-ascii?Q?lB/hWNof2BXCv4Yjcyq2GSB+anO9Ihupj/B+?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:50:57.2537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf9e656-ba96-4f9a-93c0-08ddb3693378
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 21:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219285

Due to the recent changes to how the toolchain variables are initialized
via inherit_defer, it is no longer possible to add to CC using the +=3D
operator. Instead, CC:append needs to be used.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glibc/glibc_2.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glib=
c/glibc_2.41.bb
index 7771fac041..2ef738f5b4 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -111,7 +111,7 @@ do_configure () {
 }
=20
 LDFLAGS +=3D "-fuse-ld=3Dbfd"
-CC +=3D "-fuse-ld=3Dbfd"
+CC:append =3D " -fuse-ld=3Dbfd"
=20
 do_compile () {
 	base_do_compile

