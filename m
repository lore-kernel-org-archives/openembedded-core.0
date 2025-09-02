Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D52CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 16:38:59 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.web11.82374.1756831130954957960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 09:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=inb3aXgX;
 spf=pass (domain: axis.com, ip: 52.101.66.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0f6NySTYdC0h1yWJSRu8ewxQozvUhl3REWzHpygTmp5CUduXAeMh39BMx2YpJB0Gt7vTTbJHvMZjYAjlQIBd0jRMkBKYzv53F6FyhfwSVBafa0/I+reBuQLBJpmaZo11pFlkX03eEGWYQNhoEhNaJY1KGdZECh1csD0r0YEUTnoWYt5DOXPgmzpMzeDlvHXZdNtrTjY1uPMgxGwnV0i70dGLOVvudmCl9edOBO9i3FNLHoX8fdtDHGsldEdpFVLv6ic9q5OBXUuw6dsJSlL6xUtWc7TL/g7njBVjcbyovt00/nmcV1GOXgFyFPIS9fxvsYaJrO2JOuQmiu93/A3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/lUZSLSumcXWCk8PBAYTZY8MJscyEegsa8gIe2Z8Hc=;
 b=zLuG7hCxYa+eA1RAJezhB9inu5eR2AnSXmwryS5sz+JzlO/Sgqc06l/oobvwgsgbt8cVGCAU/wIyYByVI2uZzkWbTfd9grgu/mHtrRGV+k6UIMjwTU7wQ/9Vtq3smNouTKkrI6sn9iWNGI9xWiPeJYyorpGw86mmd7uPiK0fnVPOTSr+XAqW0D7kx+/HX6U9dVKto6djym6hnzPgmcsWqY5JyxoyRn7ViYY+sYACZlc7IAUZ+8VIYzjrGURjsLym180TEt82zhiyjpzU9GhsF2wrzb7Fnhk8p/9cjTjeusD+8Tiqn+CkjYUcQbAE3w4hAEHNKhbPb1v+DukiVT0Fkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/lUZSLSumcXWCk8PBAYTZY8MJscyEegsa8gIe2Z8Hc=;
 b=inb3aXgX8iLB21Cr0WYSts008olDjoCuBzYmLFXS79hLUviZ+U4x0QMyvAQUjZptRz25SZVgBlXYhrhX/+GYLlNfADFiG0+6OOhp6NLBEw6SSZs9PmwGnP9vqpVX0tgNbcEqfARGF5LnwTpamvSzRNDsg+m3xoh0TN6tyWcep+w=
Received: from DU2PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:10:234::32)
 by DU2PR02MB10061.eurprd02.prod.outlook.com (2603:10a6:10:498::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 16:38:45 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::bb) by DU2PR04CA0057.outlook.office365.com
 (2603:10a6:10:234::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 16:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 16:38:45 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 18:38:45 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 18:38:44 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 18:38:44 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id E2F261224
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Sep 2025 18:38:44 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id BCE6D1203E4; Tue,  2 Sep 2025 18:38:44 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] rust-target-config: Add has-thread-local option
Date: Tue, 2 Sep 2025 18:38:41 +0200
Message-ID: <20250902163842.3508189-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|DU2PR02MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a457288-b131-403a-48e6-08ddea3f2f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i5mnZHXfbf4Ro2Gp+7G7itPVFKCWJrwJi2qgkBvXqnLnrYqscIe3bNV0S54q?=
 =?us-ascii?Q?1RZ2p0GcbYh/TgaXvaw9cac+kHjyXNNDtSRSZ0F2bfFlhzgSYPVkrAXG3vVZ?=
 =?us-ascii?Q?bL/83A9fNE2/G+Xg9rjCJf4UYdsHfeDHBJnylTFbWEsGRMGZm1SIT/0cYw2V?=
 =?us-ascii?Q?qny43bZatAEa+drMH4MXGWub/8ixCwMoZPRoP29D2ZwjWZ7i/zu2YhXFEXJ9?=
 =?us-ascii?Q?dEyXJNRIqQbH0e3cqBvCI7TADsAhZnVWSecVSjfanlw/pND8Zb/57AiaOM7n?=
 =?us-ascii?Q?bQdqgGAlwVvj2WcWFlVkMkl/zBcruXY+tXvDGS3GX6M1YnQ7CHYTKurkRgAy?=
 =?us-ascii?Q?G3fDdYH7MMGuTi3ZS6ESWMunhzW7Yz/dX7DZa7OC4irfIliPxwgXLXUhcR2t?=
 =?us-ascii?Q?RYr4q8QLUfS3RywfA5pfHFpTkRtAXhltP/1DUEi5H6BhFSnlXPOHVwN9ekIg?=
 =?us-ascii?Q?uvX2ks5aG3UX3btSAiISYAIsoInzInGR7aGuSwRyJ0geoLP4YVR9Uc9WnvH5?=
 =?us-ascii?Q?7Kt5+DAcf92VKmTZ7g3YECrhVbdD3v1cViPxD4mhD6fpugougmF4Vky3Wz73?=
 =?us-ascii?Q?BAJo8udzj2DfJI47U6JafdH/4gYaiR6RL4ynklMMlNDHIfP/V8eCV1hI2XTE?=
 =?us-ascii?Q?wWZK1WnaigemX0HsVyWVI1c4HwO+skydh7ZUw9ZuCxq7sPjZ5NFEGedgaXw4?=
 =?us-ascii?Q?KRMLv8emcKc5RLoOugxVkInhwkSyZXd7wFkoJbaoq8ex8rOnK9p+lWAyPMON?=
 =?us-ascii?Q?HaVIH964UOG8ZjFLXaWl6iMsYQQBhJLRgH/j4Uuk8cd8oJNSyXEFINoQYfHg?=
 =?us-ascii?Q?lmoyU5L8pqVDPgJnjgX1YRo2mjCYwscuA7Hu39Iz6/VjpeRu787e/WaDf0Kr?=
 =?us-ascii?Q?rYZ2LciLyWwjl/jzWqm4PLpxkUmcxPVpPI7BhhB0+Cn7LiQJFWcvimIqsOiy?=
 =?us-ascii?Q?A7lRsnOYM5S5Iv/lLGj4VUFqMTaZiJLtedUza/C5V2nwmPpg5jTastv0yTZa?=
 =?us-ascii?Q?H1e9y424QsMUpiPSwjqNHLCMgU9mu/bw1M0lXkkKD2SWo35NAOqyPmHIWtfa?=
 =?us-ascii?Q?+xOHm6J+s2MeWTYKMtfj3zei6TlUDIuPnV966NcXtyYGuW5T4aVLREwyryEo?=
 =?us-ascii?Q?K9h075iekMP1UTpCyS4dzs1CCtQVmf2V+RJjVkNvtbseG5hmqSlCO1wlHTfg?=
 =?us-ascii?Q?RwP3gFQD2LGK4Jgh3de88psnPwv5FlCDo8DAaWuBjGRYtQ3yeLlMZpQBI+vE?=
 =?us-ascii?Q?97lZ8Gh2GDFGj8Xw+PmcFPmvRB++7fhdCUJJFYzePiecQjPH0exqEIz9TkvW?=
 =?us-ascii?Q?sF+j9obtDiimIi/bbU2cGvYZbADPfcggq5595hjPf5NGu8i3NwUH2SKodlm7?=
 =?us-ascii?Q?olN7QT219VKvPt6SpQ53+Og/g2LkpNQiJAPFz4PYExVOcV40u8L2jAGzRISR?=
 =?us-ascii?Q?cHedL6fhX+ydweh4HpdSZ/ZP7SD/JJdBPAgWi7/T9Fjl85QNfv1PJg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:38:45.4550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a457288-b131-403a-48e6-08ddea3f2f5f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 16:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222743

From: Per x Johansson <perxjoh@axis.com>

The "has-elf-tls" option was removed by the commit
8e1614a906086fb46c5dd7b7f2dffab91194165c. However is should have been
renamed to "has-thread-local", since it was renamed and not removed in
rust by this commit.
https://github.com/rust-lang/rust/commit/391332c5d9d5a5e97a0d36e011a87ad430=
45cfd3

Signed-off-by: Per x Johansson <perxjoh@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This is a backport from master.

 meta/classes-recipe/rust-target-config.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-=
recipe/rust-target-config.bbclass
index 67aaa56bac..bdc1e23501 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -396,6 +396,7 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['linker-is-gnu'] =3D True
     tspec['linker-flavor'] =3D "gcc"
     tspec['has-rpath'] =3D True
+    tspec['has-thread-local'] =3D True
     tspec['position-independent-executables'] =3D True
     tspec['panic-strategy'] =3D d.getVar("RUST_PANIC_STRATEGY")
=20

