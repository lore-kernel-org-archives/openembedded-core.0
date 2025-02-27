Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31342C197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 03:13:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web10.2852.1740626014626499055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 19:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=q9KNP4jL;
 spf=pass (domain: axis.com, ip: 40.107.22.76, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGGuEuD8uqynFM/tBdVgyxqt3cx+NpQ4YSLNLIYaC6UACc4TjlTaJkslQtT7inHUZ/YsgkUjBHfdhRn5+rbM7YElBXnEPHU7s+fMTEmjdeakp57xhkZalf9Bl9hTlVWchNABtAw4GL9D6BCnpndjWayEvZuoC6I/wK5aFv64kOcyVdMTj9SrN8z8Zm0/GpEXJ4XYAWH2pT5t7IQTlQGn7CEcY7qGy7sfklU8iHHyJdK8+0esKDSuU2D3ij4RINu6ZBu3yJLqxW9KYwvnGJtwLbVwNF6PqCZeibtIuzwF4qXkiDsCD2s/5VdX7sZG8/MVqw15oxm4oYo8dy6PpDTFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz5C7jJ+LGaQL0x+99STnsUSKnZfhN+75dAlZSWEv+8=;
 b=xZVsYbk+vl5o/w9y2OIWf4A3SWBXiih2NmEOipiPPwdyPUBsWUTGs6fVtmKiMvNuuFfUzy4k/YW4a94QERSOc6jMUqOqpGFF23Sr51oNxzQilW2MnyhmvSn/jtrDygXFq/HpQPA6LrjvNBBXbGa6EYKHbsaxQQg/sndGZYFCdtU09py4nnPHGo1F9a+bjOSJrMXbTCRKwxQktf9ZOccpDU4O2OmtsYpWQSOI8l8bcwrl2/5Xq+6SS3PVOdDEzyI/KUY31h/uTcl1RLvYSh6TLJSzcGLS4b+Pbwf4l0HkMGtOmFt7Uxjw2kdcM+6GHebqYF7MS7OcPCsoFFBa8gHa8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz5C7jJ+LGaQL0x+99STnsUSKnZfhN+75dAlZSWEv+8=;
 b=q9KNP4jLulh9TW+Z7H7O6lEMDzTXvcLBxxDbFYiHie+yNu0lp+RdQTEYRVqdW2fYUbwENAjmuRZAtkdMXK5095+R3+eRHSqArgiGvxXEcRUHv7D93yAXG1y6VYNPxGEUtvtd/SJtwRdinU2aRY9GnfZvDn3scqWfxashKYd5L24=
Received: from DU2P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::33)
 by VI1PR02MB6173.eurprd02.prod.outlook.com (2603:10a6:800:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 03:13:27 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::34) by DU2P250CA0028.outlook.office365.com
 (2603:10a6:10:231::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Thu,
 27 Feb 2025 03:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 03:13:27 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 04:13:26 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 04:13:26 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 04:13:26 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id BCC621BE
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:13:26 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51R3DQ9x2740057
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:13:26 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51R3DQcx2740054
	for openembedded-core@lists.openembedded.org; Thu, 27 Feb 2025 04:13:26 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libbsd: Remove package specific licenses
Date: Thu, 27 Feb 2025 04:13:21 +0100
Message-ID: <20250227031321.2740025-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|VI1PR02MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a7abd6-3263-4647-e25f-08dd56dcb448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aBqzwByGlLt/4uf12YhVkIENA0l7IdTNPaiGP1dw3qshzJdd7d2zkqsGrabX?=
 =?us-ascii?Q?PCo7Lo5whXpONLX51VSgfwBtuc6u2BHU32dl2yKWe0DsxfY/ZQ72VCbdGRIT?=
 =?us-ascii?Q?y1rDDaeNYtGujdcW5QMKo3NdiKmPT5K8+Ibk15gRnBOHogW+4ULyb5zgSolM?=
 =?us-ascii?Q?aAgeh2WD0QxAY2vKESp9uTYftXAbciIvDHs16pHpsAknvRBZnGmv6mmsLJWF?=
 =?us-ascii?Q?LfZ/VddSc43clZj8HTmiD5rsgqcTmpgHUcWjwLWY43nhLjyNOK94A2XPDAkp?=
 =?us-ascii?Q?n3YtZhiA8lSMwc2pxhVFIINDhJSyejkTUOt6y7N9uhpg0JOCWAhcSE2bei2B?=
 =?us-ascii?Q?fqRgd9uieBqmN9icqWqMr0Im5YYX16jVg2nDMsAH61iMQqLmvLEL40DQHfai?=
 =?us-ascii?Q?v5DtE0mpceb13j1IGfEnQ13BktnhI6q4zrRpA6lSsjA6vZpP6Yaeuo7P+6jh?=
 =?us-ascii?Q?vbnHrF+ihi+w+BYvS6j9g8f/HN9DXPsLQxuBm6liIks2jt5QzSZkEyMFCur+?=
 =?us-ascii?Q?9KopnyJFm16hM2VlKw7LjByIVPz80MRmrxeChl/uuU3VGAwoqLviEpiHSNlD?=
 =?us-ascii?Q?tuWCVkogSaJo1okKOsfP657VxWTTlOl4+GdtzL/Ovt5y+aLe9LcMuDfBQpfQ?=
 =?us-ascii?Q?mGofe3P4UGwWnbeHg7myo32aXr0nfUfrd0i7BmroecGiogrqnCA8HpEn1xoc?=
 =?us-ascii?Q?AlZM2eW4YCvmlg79YwTJAlTREJal/YlkYUVsmqZ0fp53K79ITGf2oz6tuDXq?=
 =?us-ascii?Q?6KAUKElh90aeLlRcvTuU5KFXUMZYBDWZ2yVJFOfYrfarYWNjFsJcTafUHdQy?=
 =?us-ascii?Q?uMrGpIphWqAE/ShHxRMXlZvVQ2/+rLyjYrtLMIrxjyhxXK/NM9Zf3wSjmJ9h?=
 =?us-ascii?Q?Bbk0II+0Y1xxKB7HwR8ldVQ+7h6gfR1Q2yHwhycudRH0Cu/9hdXJDGWNh0JZ?=
 =?us-ascii?Q?sFGg5CQ8ISRhwjTvF0tTbf+OyOskgToQ/9GXg8gY7Kv9SIgYfa8Hkye8/S6T?=
 =?us-ascii?Q?yTOaFBuN2+4+ljq8f6tZlC0xoo9cEIBL9KrcOk1RGYlHyDoQqgF+NkhXEn+W?=
 =?us-ascii?Q?jque+QisdbAHlS90v5rzMyFY0+RBqh9ddCLn/AW4fdfkGHSvz+VX7/g68ZaY?=
 =?us-ascii?Q?zH6vOgvlR0V92BEcS6GD3mcsT3zWrqEGVDPkXKLToARvRbxEDtJfmtF55D0f?=
 =?us-ascii?Q?TKWSc+lpVS75i1u4PSAfVuN6GPMJe6rKA7W1/pkrqlYjgqQAX0RMV5oSQ73S?=
 =?us-ascii?Q?euOJedbNXO+LpScqJQUpd+bV4OzlVMLmIg3ZG+udQ3J1T8XsuBjM+fv7OV8w?=
 =?us-ascii?Q?8YVxqSQpWDPH4tmN4EICVgmdJQJPGezEwsN4W4S0EmuBBO1Cp7kmyfU7Kkwd?=
 =?us-ascii?Q?H6e5/xI+Urm/qvmlC2Resc18EfQtwiSxAkVw5Zvz3kkfKwY3TlPLtHYnp0I2?=
 =?us-ascii?Q?gCnPuvxHfO0=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 03:13:27.3322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a7abd6-3263-4647-e25f-08dd56dcb448
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 03:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211976

After the removal of BSD-4-Clause from LICENSE in commit 362435b0aec
(libbsd: Drop licenses that were removed upstream), the licenses for all
packages match the licenses for the recipe. Thus there is no longer any
reason to explicitly specify the package licenses.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libbsd/libbsd_0.12.2.bb | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb b/meta/recipes-su=
pport/libbsd/libbsd_0.12.2.bb
index bd503cb031..39ecda26af 100644
--- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
@@ -3,8 +3,8 @@ DESCRIPTION =3D "This library provides useful functions com=
monly found on BSD syst
                and lacking on others like GNU systems, thus making it easi=
er to port \
                projects with strong BSD origins, without needing to embed =
the same \
                code over and over again on each project."
-
 HOMEPAGE =3D "https://libbsd.freedesktop.org/wiki/"
+
 # There seems to be more licenses used in the code, I don't think we want =
to list them all here, complete list:
 # OE @ ~/projects/libbsd $ grep ^License: COPYING  | sort -u
 # License: BSD-2-clause
@@ -22,15 +22,8 @@ HOMEPAGE =3D "https://libbsd.freedesktop.org/wiki/"
 # License: ISC-Original
 # License: public-domain
 LICENSE =3D "BSD-3-Clause & ISC & PD"
-LICENSE:${PN} =3D "BSD-3-Clause & ISC & PD"
-LICENSE:${PN}-dbg =3D "BSD-3-Clause & ISC & PD"
-LICENSE:${PN}-dev =3D "BSD-3-Clause & ISC & PD"
-LICENSE:${PN}-doc =3D "BSD-3-Clause & ISC & PD"
-LICENSE:${PN}-locale =3D "BSD-3-Clause & ISC & PD"
-LICENSE:${PN}-src =3D "BSD-3-Clause & ISC & PD"
-LICENSE:${PN}-staticdev =3D "BSD-3-Clause & ISC & PD"
-
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9b087a0981a1fcad42efbba6d4925a0=
f"
+
 SECTION =3D "libs"
=20
 SRC_URI =3D "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"

