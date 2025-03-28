Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8EEC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 19:21:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web11.2539.1743189699336736609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 12:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=H0JqEB67;
 spf=pass (domain: axis.com, ip: 40.107.20.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDYNtDRlq8GjYVlD9KcLt4jcgSqOESE3O6fsYVUVfCWGfojyyKtAcSlbT9T9COsVPArHWZ1HC443LVb1crQkXgLIxzgXclgVv25+rGUUDUP5I+zxHYF+OcHY0dNZhuMt6blUZCNtGWoSmhRtSK179MA5OZkL9BQAOtm0GbHhzyvjeScjRgI2muOGraQ/h4haqBARKPzLwxBkn7TkNFpH30egc8ieDvLUILmy2KRIyI2qMyqhp8KXdJjpm+7hY+/HeGG1QlJBtcU1ZJatKXUWCmrpuH0EjUo/6CHJt5Q/jo2hXi1+moL+J5A6+VQzmIeJ6wEeZjvQBN2WXAH/i3wdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohVnHuznZChNkr16bXC/+k3WE9qePG7/NCbCEvBGchA=;
 b=y1rUaQ8I5pTUc2t9tvkbb+ql7nXHMXU5ox22Qz3WVVlWdD00G5mXeDbl8sY2FX6EevqdH6EmA1ju8Ac6LcHAk08gUu7BQL8+UToDKeKi0IgEm4IvBM0IeTj5wH83Sp+jVcl3nG89xKdtj2VQ9127jDOgSKt6cWhSd1GOY1E9cSp5fZouplTANBcEvg0LyyH08xhx6hZatV1CgXNt5ah0qCZIhalmiMxqm/gxMDPFOatifY/rS+e3UweaW8UzfrmkKWu6C3SnUP2RSySF08Y+0bbd5s9WNTkEoe4x2y84XrnNf32o/4yJu1W5l2tcBaLlazFcfm82Xt3Neo291m0MDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohVnHuznZChNkr16bXC/+k3WE9qePG7/NCbCEvBGchA=;
 b=H0JqEB67nE8D7RXxyJFxgIpKUJBq1mtGr+cFSt8pxo3BNHtzeIYfKhSsS42cCqhGf1/7ZpRcbmh58mUJ9avCAjDVoxK3g6rP5jeQ1Ei4Xv36lmfgVB3qj2y07EC7ZLE378aKMVAiKSH1g1XDhyQ29uUuXewT04j382czswN4JkI=
Received: from AS9PR05CA0280.eurprd05.prod.outlook.com (2603:10a6:20b:492::32)
 by AS2PR02MB8792.eurprd02.prod.outlook.com (2603:10a6:20b:553::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 19:21:36 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:492:cafe::9a) by AS9PR05CA0280.outlook.office365.com
 (2603:10a6:20b:492::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.45 via Frontend Transport; Fri,
 28 Mar 2025 19:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 19:21:35 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 20:21:35 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 20:21:35 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 28 Mar 2025 20:21:35 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1BE691AE
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:21:35 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 52SJLY0D1766682
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:21:35 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 52SJLYsl1766681
	for openembedded-core@lists.openembedded.org; Fri, 28 Mar 2025 20:21:34 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd-systemctl-native: Use += instead of :append
Date: Fri, 28 Mar 2025 20:21:31 +0100
Message-ID: <20250328192131.1766660-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C713:EE_|AS2PR02MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: abc4e77a-dc25-48fe-ac47-08dd6e2dc192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?emHrjTe6Oyk5+MKnvLGd0ceCw1/Nf11u7vSCHXyKeyh8wf7vEnxX6B+b0oca?=
 =?us-ascii?Q?NVRHLoBJtLTuyeA0QIR0sDY9oXPthPvF8XlTrY/dMamEBHydwDVyLrkyMk/U?=
 =?us-ascii?Q?ys5ftq6DLJUirQ8UjigWUx6DQs7PW0NHMFWr7AidIM7mc0CTf1VA78n+YEI5?=
 =?us-ascii?Q?lKDrKcqFOji4r8ECauI6NIpyOST+Mn7FelkZqoYCzj8H4gqyX2/2kUB8b//p?=
 =?us-ascii?Q?QW8ERckwfkVdf13LJcBF4BQyFqWEH/c/GHOd2c5xGwiZwG4AH2Y4ffBl8QlR?=
 =?us-ascii?Q?cXwphlnIWxqD4yCKp9q+2cVNtLEQ7QoNWZNG9gAgcFvvnwXU5Cbm6XXOj2yY?=
 =?us-ascii?Q?LWApIPUJ9je8Ow4zRmLIik1id6HqZicgG1xxQxNjPl8c8sOvcxN4Ce6AyS+/?=
 =?us-ascii?Q?rrpYO59yw2frlTBZYXtomKDdDBnk5IwES7aOYUXR0cSzow6ko7HvnVMST8jZ?=
 =?us-ascii?Q?O2uHiA6HP1DJj6LUpdbExwJ2VifkAwp4f9WcOX5YLDYi2KM2p/xkaMyEs75H?=
 =?us-ascii?Q?7FhHWwqeG/HzYfWGs0W7F/Y3iGrE26DOINb2u+ehvTSdkz7b2yoGSIJLC6JP?=
 =?us-ascii?Q?enGj3OV1s2b2eqCDIGzc93SrMYhzpkckuQbAptC5rBSfbN0HKSyrk+LihXpf?=
 =?us-ascii?Q?gpnHLxNNN9Sx6yPG6k5u6LjSQN4hhZwPgSpoFp0Fy8sBdoZBYDkOBYt3UbJp?=
 =?us-ascii?Q?h66e/xLT743f4A5VAGeEWMdJv/eq10IRZ2xF8jo7uSe8GXkDx4JnOcPo7Kgs?=
 =?us-ascii?Q?dICChKM5FA1fn3cULarttUVLr4JKB5WUgmGojDpvKWFO7qfl9D5QKrexocWb?=
 =?us-ascii?Q?ajcsZvTEU5r2Pa2ZDUnugNf31UNXfR1Q0RWzop72sdVySPUk0vVoeiaJX5u+?=
 =?us-ascii?Q?ZQsSXLSjbycZoD+RUxoCQsBkOVNazcXdM6F58kzA3CeKZs0KESoNu6tEGiaW?=
 =?us-ascii?Q?IyWJVcSn8W1RbLG/9Ra3QHQtwMt7ieSCf+BquYJ5B4pNvUCRF5cG3NzWFTpb?=
 =?us-ascii?Q?2e3W+5VpNWJs+/rAYpcUNF/eb3z4OohKI7CGUeHTv54sGHvv5se5OS8gqkUR?=
 =?us-ascii?Q?yvMhtgc5i/UkwDZO3veVLYld1eCc0YKLnYYZmmRRJEiUSyXtm2YRpKq8tX0N?=
 =?us-ascii?Q?Bc6Cdxjc+ioLwcr+CJw8torom8Ql8ZnV6uPG89IA6apPnpRDyeTNr/3VbdAU?=
 =?us-ascii?Q?JvgxjtLG3aRF9Dw53Q2feeUcnVcKujbYKxEFlJkwoO70eYsy2es6KqlR0rEu?=
 =?us-ascii?Q?vockxh33w/j8OCloD/Ff5bSikb5Koq4NsYMcryRNxPN+s7ay8UW9rqh4qrzS?=
 =?us-ascii?Q?DCPbhBFP6kFqBT7qEmwvC4AT4iAqK1hLXKoZ16xNW9k35Ack5B8bDseevsX4?=
 =?us-ascii?Q?6pfAge8ZQYGHpTeh7jT1YnY0vsG3RxrHLUQ5G38kSuZOYDbj8oIWlnG1gcyR?=
 =?us-ascii?Q?PJAw+scpjxE=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 19:21:35.6364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abc4e77a-dc25-48fe-ac47-08dd6e2dc192
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8792
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 19:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213864

There is no reason to use EXTRA_OEMESON:append when +=3D will do.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
index 73862b4e23..041a040a26 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
@@ -8,9 +8,9 @@ inherit pkgconfig meson native
=20
 MESON_TARGET =3D "systemctl:executable"
 MESON_INSTALL_TAGS =3D "systemctl"
-EXTRA_OEMESON:append =3D " -Dlink-systemctl-shared=3Dfalse"
+EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
=20
 # Systemctl is supposed to operate on target, but the target sysroot is no=
t
 # determined at run-time, but rather set during configure
 # More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
-EXTRA_OEMESON:append =3D " --sysconfdir ${sysconfdir_native}"
+EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"

