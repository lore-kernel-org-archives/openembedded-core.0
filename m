Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5333EC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 04:57:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web10.5068.1712033833399974937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 21:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=YsQE7MfS;
 spf=pass (domain: axis.com, ip: 40.107.21.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEExcFSaJfDQf2jWN6M3UhEcAwLPLawoLTH8gwxMxV8NBSwLQV805K3/v2yzm1cwbg17jtrZQqheqMjtWgDQy8kHVEos99TywSHXrlBqM268SEDHGk5dhnyEsBb74lFjaXkWYAJx+yKFfm8RTu3xB9oZKjJ/q0GZJ/5MlbLAl3I3gAfS3tAzO2XOjDKj6NGTTQygr4hF96VyixM1iPdYEqDqRAkSpEJSj0P/VG4wIg2oCf6LGgVek9uPSbWEzpVkkdXWg29XEfhSZu/48HkVYK3gho40yCfqIKPZY1u5Ftke6E/8TO1ADPxhu8l4IkZoWwWrgOk1PDtpCT0pz6Hw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBA2gZNBQYDt7b8XYvdxlsP4/oTo6Wdz+yh8Nh6oBZs=;
 b=jnvHHdk9DIHwfZeuclFBIEVbhnrfjfzoYQrJlPRRfYlL891ZTIHnSf5iPaFcrsA3nd0cbke4s08W1kAhIb0WJXGuonS0FgkwANRT2c1vf3lRIpDQ0bKZUAYpeC8mEjRVr5ZVmgVJM+snQPa73fME2wwQLCzbE7eUz3Dbvs2WuT82M/ElAfxIW3j+WxvnlfrWriRSoAY3/DFNoML6/dDs63NjJJuGnXUGCzhFYcB9/PbY1Nero6TX6Fb8RuwdwEqYwWmD7IV37+wezUxeLLjgIQjQhUwbUPmn6Tbwt5wuI284BnXBhK/XV3qmRkaU37vdev1FcGDodGVjbJfIpAy2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBA2gZNBQYDt7b8XYvdxlsP4/oTo6Wdz+yh8Nh6oBZs=;
 b=YsQE7MfSoSJMNvcIw4ZDgcHVyrJknkeY2nBjRZ+SJc3KBr2N+cJLbiL0GQ/MZsAroovWywm+SdzjvhYhEfchxlfV5O34U+/VvZ1SpC1UoXT/pO5sPIojlAtnyA4RCnLlmoRICdnS0ojrKgVn32PQESEeAlawEcQ5X9sbWqg8vSY=
Received: from DU6P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::25)
 by AS8PR02MB7192.eurprd02.prod.outlook.com (2603:10a6:20b:3f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 04:57:09 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::4b) by DU6P191CA0011.outlook.office365.com
 (2603:10a6:10:540::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 2 Apr 2024 04:57:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 2 Apr 2024 04:57:08 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 Apr
 2024 06:57:08 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 Apr
 2024 06:57:08 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 Apr 2024 06:57:08 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 312753114
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Apr 2024 06:57:08 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4324v81e3717623
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Apr 2024 06:57:08 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4324v7vo3717620
	for openembedded-core@lists.openembedded.org; Tue, 2 Apr 2024 06:57:07 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] util-linux: Set the license for util-linux-fcntl-lock to MIT
Date: Tue, 2 Apr 2024 06:56:54 +0200
Message-ID: <20240402045654.3717582-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B622:EE_|AS8PR02MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da6aee4-65b6-4935-06f4-08dc52d159e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tpfroMngKtHnhrUXpXlCMQsIf0m71li0L0yEwPZ3J0YSrL9xo063M9pv5FeWWKMfdwS0ggUwv9sRxRGM2c00m6Ob2qJSHH7RpQLSjfMww8jjduM+rjuBXLw1T5P6AdDrBaJ2YYrCqQ/NAO4/r56f+8ATwdUgrWBeq2Y3E85bB2cn+BXDiIYAnE5WYi/KiiVZ9gyQW/zrjBNn7W7AbgLWYtVQcFZvfy2fDnGQAI7K+P2B/eT23WKiWVKBaQzUwz9H5h+k/3aPoVmrUoVIWsVHFIX7eSS1yxpQnTlkXPh8yBvTE3+FNqEugkrIcuEU3wLGTJ+6as99N3cBOs97k7Ybqbv5e+aW1XFnCk4nkc2q/zy8Dp6XbPaDgtwY9UqIT6BEgnxIvqSF9P3U5+JTxpYSAl5SsnNPW8097780OOtXs08BBLVycc1i55w1VgwppsE3sGWgaIKs+1AkYrZa5P9CE1QfMkTyXQoLhxsmoi7aBtAUGNNb72cagagUMbsI9UzBHqd/Gk54lsBICe3lLZ9ONLiB11TlGoQrJ4K0FL91DyEFz3J31cJHlopUmQSNQRjLxPWwGxKbBUsBr7B/6hHvboPq2hdS1l4gTri3GMm7L4zEm13Th1wjc1h4JE32i6ec7fnOSj6cp26Q99PZcIt2WgAuK9Tip62K1AxmxbqCZewEPXRj/Te3cpDJT7Q7w63oij+Bjq4ftvRlHwDkVZuRHaSNYr4Uk86eythuhFTA5j4NEQqHa4wdSrcgLRKn+iv4
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 04:57:08.9072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da6aee4-65b6-4935-06f4-08dc52d159e9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 04:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197864

This avoids problems if BSD-4-Clause is in INCOMPATIBLE_LICENSE since
util-linux-fcntl-lock is now a dependency of run-postinsts.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index f4b547215e..d506783f9a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -7,6 +7,7 @@ disk partitioning, kernel message management, filesystem cr=
eation, and system lo
 SECTION =3D "base"
=20
 LICENSE =3D "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD=
-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
+LICENSE:${PN}-fcntl-lock =3D "MIT"
 LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
 LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"

