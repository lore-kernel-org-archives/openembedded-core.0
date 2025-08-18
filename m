Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B760CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 14:01:28 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.2])
 by mx.groups.io with SMTP id smtpd.web10.76055.1755525682681027810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 07:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=VjWAR2v/;
 spf=pass (domain: ericsson.com, ip: 52.101.69.2, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILsXHzfKNde8RsLSDsV+piBfTVGST/9TEFLk5seUnQPZE9Vx86eYUEiIRzs8RhlxG771V2BTCixOYgQvcow4hCS0BVnOFej024vrKhKJUgPoOW8vCoKfKxxlBLEz3qFjq5knlfob8j8qvdiwpEbB0rmffamODmtxLIklYKp0+SQJRrcuQij3OgZfW+gujw15Ya3YijI3HYZtXnsKFQY1aXU2MDgjsFvkjuuNNF+bitdyjyAxvSvYGyTN1AhBghTgH4iE0QGdMCf6y1BvNWkD7AYe0UkdKoJKWy7Kgaq/+tGH0gVbQbnxHP+n22SKFHM97GRKe9l4+E0NtVTcnPIHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMZL/tdQm7mnSwW5acW6bBHrDzNQ9VE9afCAlFX1XDc=;
 b=vwqCLL9VdRcIJtfdlpKS68f8l51ASJW1eKvIBe57HrAqgCHO2v2uFB1fgCefBWz1GFg5mni4/WkAj5fwXufqC217QDhEXxN1PALaOLMi9nS0ktslss3v3yoHMa/iIhcVEtEtNrTUsBi80w3qJ7knu0tkUgFXbQc52D2aOH/jHAoAcI+1uNehgp4cYrJF0xJUiqYPPT+pScjWj0e3/sUdP9FgkGzQR+lSglLL8RnY2Ufit3JY+kXRVdrULsPjxx5A3pMrHNJ14fMsE1Ea2Al61c34yerDmkYo6AIUf1VXzf1rT/kYzuptUn6n95Q3unpNr+51CKuQvprvHKwH39D73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMZL/tdQm7mnSwW5acW6bBHrDzNQ9VE9afCAlFX1XDc=;
 b=VjWAR2v/Ri3491wuhTfG2+EJB8lLNaoM6B3veiHG3XTvO4lS0vUC0EhgT/p7Cm8wrmP6nQoeTRMhTUa2Jr6Aa1bbI3E/BrdrrUjcoU/FR/O/mZ4NFW549TRT26jXjHJxypG5hQ+8oWKZDdTAD35EeyDg3agBdrVjbFpqb9PbJrZS9Qd2FNzhQT7vCrdwdB1TdLrtQSanp6k+2iUpPLRFZhWZ6H4udGGby7vAjQ6wLT5W7oSAjgvDKLSMSm3TR7bphwcq+HRdLx51Qz8hy0ov8OcvxsGsrtx1uNr2srgExMCGXY3ANAIaePwJDFRSAReWV4Y9oYXvyYl79T1PlZD2Vw==
Received: from AS4P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::7)
 by AM0PR07MB6468.eurprd07.prod.outlook.com (2603:10a6:20b:158::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Mon, 18 Aug
 2025 14:01:19 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::3d) by AS4P195CA0007.outlook.office365.com
 (2603:10a6:20b:5e2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.21 via Frontend Transport; Mon,
 18 Aug 2025 14:01:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 14:01:18 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 18 Aug 2025 16:01:17 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 138ED4020B6A;
	Mon, 18 Aug 2025 16:01:17 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id EFC13700456E; Mon, 18 Aug 2025 16:01:16 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH] xz: ignore CVE-2024-47611
Date: Mon, 18 Aug 2025 16:01:02 +0200
Message-ID: <20250818140102.1660577-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A61:EE_|AM0PR07MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3a6464-3c85-42fa-c6e7-08ddde5fb420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q+pq53xPLdJaM5rOqEoMTzx3/49X04Qn7Wqn/yki5IZ5jOqSqb9QIPSyeiDA?=
 =?us-ascii?Q?Dzq0IVpKfJ+8rmTK1+tN2AMOmzT7uMeqgT3XL7mKMuvNCGSKySbKPLNkWHXY?=
 =?us-ascii?Q?wIFP8jtTNc+QRawN018qNVUn/20knIpZeaptB1MjJPz/qaj9e3jYN6vh7yKE?=
 =?us-ascii?Q?gVR7FQbfSxcO5vtnjnHqpu0y4RXPYPVSOLxluVW09k9Ko2Fcd4Vmag1NmnWw?=
 =?us-ascii?Q?mrqiqE2oR/R3jnjCYETGBNzzzSIIWXm8HqgFsGh8Ca5Ay2Yg90NNtMT6xxrY?=
 =?us-ascii?Q?6VsK2d5uN7c9Y4rKrKBkTEhP8tysc3iKarhlWu5E+aDLxQDQUguEkE5ErRxx?=
 =?us-ascii?Q?zuzUyAW1g9GWU7gHXJ6BTJYZOfKBPUhF/74cM0UOyPn1PbMHt3RTxO8WE19N?=
 =?us-ascii?Q?UnJlUQRDltXQzlZctcpZbPtJaS0qjdfZIbZrc4uLAxlPkL8IuXY/YXesmrBb?=
 =?us-ascii?Q?TT24c4Yynq1hqpgUelF0TqTG68VolE85BRvf+d/ytSlMg3cJbHisip7zBaZr?=
 =?us-ascii?Q?IbVy0dYiSHIqO0Ci/R9Rkrz/A375TWSIRooubLw280ad0RkwmUCbgw8BkSWn?=
 =?us-ascii?Q?aDysfMjadaCX7ogU45t9VEHrNHpnD6V5eGy9SSBo72pxXCuOOvifDyHLmGYX?=
 =?us-ascii?Q?vNxS7098aVUWp5tqyQ+YxzoUtFzW9Ae4dPvasyBihYewuUEwtlDGLSzMkzLg?=
 =?us-ascii?Q?jbD9pYf39qA7Y3m3VQx/QTKa40CVJd3pemwhCqLVwTHIOXtuGWgs6COC3MZQ?=
 =?us-ascii?Q?Zu499BMuWSUOGzTD9iK/7q8p5IkTaAtYFsIyWEHnwmmr3dDQRD9o8goy1hWX?=
 =?us-ascii?Q?lWnbaV4XiezLfSQODGAZyhQMUfo72/AvIrAybnEFSjRmyhpNlLgVF/OjCXMR?=
 =?us-ascii?Q?CjqBKm3OWAEsU1LB08cw4Zj2Ld3gthrYL+KEoutnUciNmcTN+6x/smfAIqUr?=
 =?us-ascii?Q?sr8WdCjvprVAG3sfvK+TbcBK0OdFdqwwHKBZXfJsMu+tc5c1uGcyWNh8pBJS?=
 =?us-ascii?Q?AYHfctQxtZVPDOw7qjvGdZD+JE45czK6n9h5f3Knxtg18wm9WuPsYdv4dDXw?=
 =?us-ascii?Q?9Wg0nQdcNxG9+3TJioRp8/XLz+RyP0libEzpdmWhvuSM1tcAcHvRAHH/gb6X?=
 =?us-ascii?Q?Hx9tc7lCfttS7ICAvms3CWbfh33hXhBx09f7WG1LPlIcNZO47v/p08ZqyPw/?=
 =?us-ascii?Q?BFXDUqHWuZD0YGYSaiQdMy8Pow0RtbwSBb7PP2C64M07X9HVWresO8Cz9B3C?=
 =?us-ascii?Q?ThVFMFyirRV98iutFECcNUzFZ8VmI+biC50MQvTCMpa+rnsQuf1PPM9/+Xnj?=
 =?us-ascii?Q?KDH/M4AbxYBs5wee4mZT8/U0xuUxERyHgU4LUQr8Uy6miXH4NosiRQJTAX7h?=
 =?us-ascii?Q?khg7/1SGP4cZeCzCZNu3hjSOZwiyKNqUuIfwosNZDO9BOpFPZiISyZWYfPfs?=
 =?us-ascii?Q?eSMY9BjODWJIqGPXoQQK1T25KBxptYRf5Jk/nWVDTcoGvV0EH8Zp8Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 14:01:18.1253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3a6464-3c85-42fa-c6e7-08ddde5fb420
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6468
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 14:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222037

From: Daniel Turull <daniel.turull@ericsson.com>

According to the NVD entry, it is only applicable when built
for native Windows (MinGW-w64 or MSVC).

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-extended/xz/xz_5.4.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.4.7.bb b/meta/recipes-extended/x=
z/xz_5.4.7.bb
index 563643d4d9..30a4c8e88c 100644
--- a/meta/recipes-extended/xz/xz_5.4.7.bb
+++ b/meta/recipes-extended/xz/xz_5.4.7.bb
@@ -35,6 +35,8 @@ SRC_URI[sha256sum] =3D "8db6664c48ca07908b92baedcfe7f3ba2=
3f49ef2476864518ab5db6723
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI =3D "https://github.com/tukaani-project/xz/releases/"
=20
+CVE_STATUS[CVE-2024-47611] =3D "not-applicable-platform: Issue only applie=
s on Windows"
+
 CACHED_CONFIGUREVARS +=3D "gl_cv_posix_shell=3D/bin/sh"
=20
 inherit autotools gettext ptest

