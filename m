Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C84BCD4F48
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 22:52:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.21])
 by mx.groups.io with SMTP id smtpd.web10.63980.1725490322053995761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 15:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=e2a26cII;
 spf=pass (domain: axis.com, ip: 52.101.70.21, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jREjSHOxAyZL0CJly6wgBV/SxRhcua0bH8yaMJwPJ8ABEn9IVaAh5puBqzyvJKgkkQMYFB/dCalyuxdvrWDcShGeZieAVO53HsKjxv94Y45W4JbdCZy9IlMfVQoA92sRDyAGKpLgD+3qbS8VkdapHQWAh20/RANqznvING/begvoW8FH3AymK+e/fZycqIWY6iOpECES1d6Ykwu2eJ2SqNteQWTC4G0F8u44qkyAS+5q1aXnOrEEPo5UFNjqiVGCIeSWSHn3TmMrsbfedGUflzGdb+zO/p3ReztyDS0f0whxD8LqAU20OuoSuDKwuBIhHBz7IUWZm5RKfQJKQgAaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EICk/Ds0LLItNWdYWCWZSGxA1TQe0hu10ou2KGpgeg=;
 b=A7rzTz98h3Qux1xEQv4vJlRw3t5zjspdNyMSmB2Egp5liCJGJFGEUzMwuPquVJ6IA6ba0uPsWb4L5qNbVgDYShSt9zZeCo70Oka9a+cc/PYGnMTb7+ZK2egsz55F3VQRb79gmqHYXBeQYD4wFFiWVkAcuAbsF4VmGhxK8bAzNyOeOtU2bsYSyOnagOk0m4E4H1mojpV3XinUX7tFU/wuttz5J6rlaJk5HMPtqOTRXWcAqu3HMcMgYhak/iSPmty4x/BCHi5ilKRL8Jtx03kqnwPtLqvf2bWU+h16lDVu5KvWBmAZDqGIuconh3LeXklsqNOPFWUmsNcmSL17FDIUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EICk/Ds0LLItNWdYWCWZSGxA1TQe0hu10ou2KGpgeg=;
 b=e2a26cIIQhHflrpwdRkboHuufedSer/kveuORzb5O+BzoA9gkZ6bycn1t0smC4DTEx+r6BHsVlpTV1wPNP2LSdC1L/58lR4gRA3+fYIOfLdGd6uZnW24Aszdw1M/1afD1/jJ+s/Gf0OnEQwZ9Q8iJb+XcxYgkOejHsFuE+ThRZE=
Received: from AS9PR06CA0143.eurprd06.prod.outlook.com (2603:10a6:20b:467::20)
 by AS8PR02MB7333.eurprd02.prod.outlook.com (2603:10a6:20b:3f6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 22:51:57 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:467:cafe::f1) by AS9PR06CA0143.outlook.office365.com
 (2603:10a6:20b:467::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Wed, 4 Sep 2024 22:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 4 Sep 2024 22:51:56 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep
 2024 00:51:56 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep
 2024 00:51:56 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Sep 2024 00:51:56 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 008DF2F4
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Sep 2024 00:51:56 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 484MptnY118867
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Sep 2024 00:51:55 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 484Mpt00118864
	for openembedded-core@lists.openembedded.org; Thu, 5 Sep 2024 00:51:55 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: Remove a leftover reference to ${datadir}/mime
Date: Thu, 5 Sep 2024 00:51:47 +0200
Message-ID: <20240904225147.118819-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|AS8PR02MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: ac16bb39-7504-4cdb-8f21-08dccd342d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sHIgBdA4hUfmPogE+8jIIqQ+M1iJ8aggCEAtLXph+Di/6JIOM96FsKN8uZXQ?=
 =?us-ascii?Q?4XgFrI6T38BYvzX/9Loy6l+xUODb5znu9bF/2i1RRBdSC4UkZBFVovy+8JJq?=
 =?us-ascii?Q?uv7s3sVlKqCnrwh6WDmllY34PQpn9dVIGEegZ+nnCZY6D8I+BYw0O6WYW8Rl?=
 =?us-ascii?Q?tEbh/QH4bD1l5/MFZcU/p8NsHI1llny8mxj1sjlYyeGywaBiyiFhowdRD7cm?=
 =?us-ascii?Q?imiN+TzXP+D0JDb/HWC8baGMm99xfmSiqPIWETdV6HWMwoGkeGFwBzdnJ5Kr?=
 =?us-ascii?Q?Vd6WVBG+yC2FbOuk5ick95+S8TSyZdTEbeRNaU4He16GgOjgCKnpYYvW0JLF?=
 =?us-ascii?Q?8mRS20gpVIkpaZhTV4u4JqANCEWy1Mk81KRUQwqX3bsrq6Wh548zH4OL3V7d?=
 =?us-ascii?Q?N3QOV3kpag/B8y56DSyF2KwQ6ildm6Pu6n8l6XD6AZWbFAO4VQ/zIuCIUPUt?=
 =?us-ascii?Q?mf8jVyeZbrfde4GfLT8vLPhp9wQsrTLRWb/c/YKWoya4jCzwASsyImlT7+O6?=
 =?us-ascii?Q?Xp+wirwbqs9dE6H+hQilnA3hf4SQMbayi9q2oYpibd7YHaA1r0VbX27cvl5o?=
 =?us-ascii?Q?hBAtjx7MTRJ475gH02fWEuktk/w6TpYVaeH4BQGRYeX7+f2ab6yeUvGLILdZ?=
 =?us-ascii?Q?PTSqJgNBXW+fhWIcDakbBVXufx/p6+fod3JfTRYNLeu3dpOHy7C7K6ehj4TV?=
 =?us-ascii?Q?OTHUtd+juDIhup+zIkvCP5t5n5EQohc9VM9lAOK4r9x5FWDDbpFl5C3BwRKW?=
 =?us-ascii?Q?M+hx+ggO6LDKUigNpCFADUWQsNRYKuDcSiBIaUHAtdqSWxi/5Ui/0GFJ+z6G?=
 =?us-ascii?Q?PJiN8/nsuspf3Hy5QU5g2orPwCHw6I92FfZpcUxAz5tAvukQBkL8zfZN2sv+?=
 =?us-ascii?Q?k9YTBSqcbmDY13wqwG94vOWvT6lTmv8Z7d4l0jaqqpiTgNZx6pYcrigwkL7V?=
 =?us-ascii?Q?ua8B9SBnyMLjafhmJEr6ik2pNhXJYryrCtIhWi9WnrcJyZBhoUpM1C9pV2Xw?=
 =?us-ascii?Q?LITIMzXSHQb42whccDxtoNVFYzO72BOpH+97QaBaEtzYiGDh9zaUNAbUQleH?=
 =?us-ascii?Q?uP/Wv9CFwDA6vOB6tj5kQE9vVnUOAMAoAg18DHtUOf7FfR+hpGbezqEJ+Cn0?=
 =?us-ascii?Q?tzAI7RlGCbxsxNOiZuh1IawJjn8bMkeNaDEKuI7IbJ8j3my1xWrjPdoCLU/R?=
 =?us-ascii?Q?jeklVN4xXYqLE9O2nNNdPX5mrRlSdpNQnhYD5MW+jLzPxAk68GdCkEEhXanT?=
 =?us-ascii?Q?PhDTV7T8Fs95c3cmZNGONUvRZcgAOh1WvbgbWgchQwqkE+TLWMoBsJg2utuS?=
 =?us-ascii?Q?hFN94GFc7ec70NzoeGIiH67U/XiYaQ9NzLbo9Ry4WMZF5I/hHULSbvPZZZ3C?=
 =?us-ascii?Q?ZslYLjGeIopkTz+VYr3rdVL+hIGm2ID7BUc4YcnwmHLoiqxGuYElArD0Q/yP?=
 =?us-ascii?Q?2oH5emZ83V9d31Yr4gSNyqvXoydkKBSb?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 22:51:56.5347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac16bb39-7504-4cdb-8f21-08dccd342d8a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7333
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 22:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204227

${MIMEDIR} (aka ${datadir}/mime) is packaged in ${PN}-mime and the
reference to ${datadir}/mime/packages/io.systemd.xml for FILES:${PN}
should have been removed in commit
5560243137f772683e53b614f134dd632b62be8b.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd_256.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core=
/systemd/systemd_256.5.bb
index 1d45670780..11b0fc5f05 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -717,7 +717,6 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${datadir}/dbus-1/system.d/org.freedesktop.portable1.conf =
\
                 ${datadir}/dbus-1/system.d/org.freedesktop.oom1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.home1.conf \
-                ${datadir}/mime/packages/io.systemd.xml \
                "
=20
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/inter=
faces/ ${sysconfdir}/rpm/macros.systemd"

