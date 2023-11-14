Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B95C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 19:29:04 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.49])
 by mx.groups.io with SMTP id smtpd.web11.2101.1699990135071290935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 11:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=oEuAV/HS;
 spf=pass (domain: axis.com, ip: 40.107.241.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJY3nzSNXgJBb2eFdsvGPhXqxLUFegi3/aNVdYbqLix+ea5JlYSizFWVgdeYc1RSTT94yiM5Y2wxZgUtKuGAox6glcC7q402h0MsE1qUTRF4jHGuSflPHvq4vUCZucadnqNkEzcS2yp0aVlcE7Pghym0in8oRXzubF4F8GGz/CQx78ffnWbusfrc9dO77b3cw54dFPEht4s+bkk7ZFZpGuh1avABtsOzArQo36cXpXSomlihQ5GaQvZtRkapetHF5zDEZnLk99Ymy9hvOEpTC8lsdsshVaSXx5pcNWpCLVZbRkwmbZjuKv9UyKb4f3XoLe4UeieqhMZocRL52UepPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Faw8PiiAmDaZfAOALmEOHjfNPlfI0+bw+ej0bmjplV8=;
 b=XFw3AzW94V446dsr8hnS32jfhd3CV2gUy6GYkyvT/0NIcqzIsPGt25guaG6yTqNdEUXjA0VD93VHqtGkDMWL7lqQnFSYblB4zuNN25IBNyPgA8Grto4eenMfakmry/NbAUDzIyJB3LILDDqK3Lf/V10WRfCLeb4zb4Dxm6os0OtAP6mQbj010DnK/PxhAc6dmDEbBbWjMRioPAiGNRAs9FORaOx3r/pw5VX0SyQRdkDVQBkdU0O4zdFK4RYC0dbVNPELiX/btt9zURZyyYpH6e2DPvtyme1QOXg4RV+UqkNqyB/WYSei2UPlKA2IdawmH/J7lhvcjzXCZSSjo2g0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Faw8PiiAmDaZfAOALmEOHjfNPlfI0+bw+ej0bmjplV8=;
 b=oEuAV/HSGwc4O36gdJoMG9SxBd+Ohq/ciq+6Rk9X47C9QEO34k5cuZRQFrry/W0Z7KUNojPZXuWYV3zJ/FdMoMikxPGIfqZfU5W63XW0U+oNFVl25Zq8CRlFFSNzpCIew3Iqmzm4HCyCeHd3yUZ1wXkngj/rk/nBfyNhyBIyfrA=
Received: from AS9PR05CA0212.eurprd05.prod.outlook.com (2603:10a6:20b:494::31)
 by AM9PR02MB6753.eurprd02.prod.outlook.com (2603:10a6:20b:2c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 19:28:51 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:494:cafe::f5) by AS9PR05CA0212.outlook.office365.com
 (2603:10a6:20b:494::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Tue, 14 Nov 2023 19:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 19:28:49 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Nov
 2023 20:28:49 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Nov
 2023 20:28:49 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 14 Nov 2023 20:28:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5933A7F11
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:28:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3AEJSngC1335470
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:28:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3AEJSmi71335469
	for openembedded-core@lists.openembedded.org; Tue, 14 Nov 2023 20:28:48 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [nanbield][PATCH] Revert "bin_package.bbclass: Inhibit the default dependencies"
Date: Tue, 14 Nov 2023 20:28:46 +0100
Message-ID: <20231114192846.1335457-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|AM9PR02MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: b7fafef2-3648-4e55-1518-08dbe547eddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E6Nd9xPoxSRRLFi36W+kVYCzYIPIPLcvOfh1uChgKxacURkPPOXv0Lsc8pLCSstrIPKz76ySWYKN2GTAbY5PxlsbnXo7aUE/ynRRcj0H9OIZmqtAwNG7gst7AWCFPqKaioZR/6xqiyRqxnvrj1pyKRofGDoboCRChCU3jmegXZ3Sm4fxvvkzmMdS0dNNVGshZuHevGqfnxgCJRgzjb6pYZgtJQlyenZJYni0iibxUfU/Wyf2iOITiYqDs6etpqFwJh8q4iownHu95RR7W81/PJkUooPkpfrSwy+TcurQuAPzYcmORkkYPyz0DBvNQhFlYXW5MNhH4IRUE2fufoA8ev216upgoUo7E785gLe0jylWOcFKvEEdczowcf8Db9Yh+wVn9iQJ4TaOhpri3bMR38smuO5WgeCQ+OYaacKQqlIJlbGjxUHWRFUZfPaJmoqmp8gLm8zxjjBSIFs6AiL7zsOn/6SaQqwZn3jXfuTuE9Yc6uBOsVKa1wm+1lbFQE26niq37OoUkXtzZLz+a+uCu69bejbozVT8DGnCsqhZ6yCB5EwUqKEQ9tZ9MJEBwQ/HWQrywS/zT/MqZs0Zlen9FSdFtglf2ran9wR9n48LrlcuL7E8LpESa4ArapERW8ZUYEiz9RokaG5D9B098R9PpwqWToW1H3PS1pQa89rVSpUIRH2c+I33fmYBEz7GP4eideTwdOEGWel/fIAz9AEhGleLrTp0jkkUibHyZPv3oQAi8zLs3OSr4PWYDYgBHB433x1zsaJTEs7Ez1w1/vKdRg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(82310400011)(186009)(46966006)(40470700004)(36840700001)(40460700003)(26005)(47076005)(36860700001)(426003)(336012)(8676002)(83380400001)(5660300002)(41300700001)(1076003)(2616005)(8936002)(2906002)(478600001)(316002)(6916009)(70206006)(70586007)(82740400003)(42186006)(36756003)(81166007)(356005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 19:28:49.8806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fafef2-3648-4e55-1518-08dbe547eddc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190514

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit d1d09bd4d7be88f0e341d5fccbfbefeb98d4b727.

The commit not only removes the dependencies on the cross compiler
but also does not depend on e.g. virtual/${TARGET_PREFIX}compilerlibs
and virtual/libc which in turn makes the file-rdeps qa check fail
if installing binaries linked against e.g. libc or libstdc++.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/bin_package.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes-recipe/bin_package.bbclass b/meta/classes-recipe/=
bin_package.bbclass
index 9dd2489725..3a1befc29c 100644
--- a/meta/classes-recipe/bin_package.bbclass
+++ b/meta/classes-recipe/bin_package.bbclass
@@ -20,9 +20,6 @@
 # they would be in ${WORKDIR}.
 #
=20
-# Nothing is being built so there is no need for the cross-compiler.
-INHIBIT_DEFAULT_DEPS =3D "1"
-
 # Skip the unwanted steps
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"

