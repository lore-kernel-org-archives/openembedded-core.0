Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C69BC61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 19:07:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29669.1787684869074514719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 12:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ajli0Zol;
 spf=pass (domain: axis.com, ip: 40.107.159.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFXIjTNZ13DRIuqTyKjHt71lysW9bXc2iV27MfW3smUPtlcXpBPn7Raw5GbQV3kVD6ESn05cFsnlP6RIBJGDLgQKypmj/8+r68fV4S5kUFC4EQFSEZ8JFaKYRyBia2hHgmBrmHexbSU1MZufLR9bVeyWLKUQcO7Ze+IaGmNHT9GSgolKnFhkSo6r/4AXB4qD3WeRM2rARXujkuxoOh+5g2cPY0WSL/l9m1h9IPzfNDKuXwmPYuYN60E5q6yflwzYdn2H/NQxAuLha3IdxGB2M33PrUNRr/E5Y9eyBojbMLZuG3adHsY6a5ef0rPnYw0v7kQZUd8y4E0CJ1Dthgl+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5XKiDzHdIGNU544NKzYwtQHAWFtW7KRyzi5LFMaGtM=;
 b=JHk/Pr2AUfxW/2aNw8qQ2BCAelswqn5ZdZlH2Z4dp5xDXvRJ9yWOAWdyuhfhRa4LIThG0v943907xUGBIitvwzKrFTX9arsNgcHiEy5OJTGxlScX8ednCzdEtUcey3e+XiWmI1wU+/El/MAOTGv4wal1LY8YQ6Ad2zg1FcDh/gipj+YyumgxSFP2nox6ijbYmE/nyv0iiTwduiwDxY6kB9hyfbfGG//Agkbg1u0UNlDKiDTlocYQXU9NmAImbEOUGjeMiYxqL7+cu+xWLnSfO9s1fMo+oIR6r9V4WZL+lSVTAdF+QpDrMS5TTJVdyqrxniqc9k0ESQeuD1pCXL7qbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5XKiDzHdIGNU544NKzYwtQHAWFtW7KRyzi5LFMaGtM=;
 b=ajli0ZolI161KU0T/A10rd5P6otnR++lB+pjr5FlX6ObEPPSyXL2UGwX9fJyJ7/87RJ2kzOkHH5RB3eGCbcxX9I7ce+NyA5TFyCsHpjivzxqsMSESLpD2VTIQNcwB9OEjtVhTWWEnfkAHsFLBUFhivqx2cL7yVss2fd67ttEWUo=
Received: from AS9PR05CA0341.eurprd05.prod.outlook.com (2603:10a6:20b:490::27)
 by AS2PR02MB8887.eurprd02.prod.outlook.com (2603:10a6:20b:556::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 19:07:44 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::7e) by AS9PR05CA0341.outlook.office365.com
 (2603:10a6:20b:490::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 19:07:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 19:07:43 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 25 Aug
 2026 21:07:43 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 25 Aug
 2026 21:07:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 21:07:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 691B7436E
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 21:07:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 62F8E12B4CA; Tue, 25 Aug 2026 21:07:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] archiver.bbclass: Improve the indentation of the documentation
Date: Tue, 25 Aug 2026 21:07:39 +0200
Message-ID: <20260825190741.3011162-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A69:EE_|AS2PR02MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea2dbff-46cb-46d9-3cba-08df02dc2490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|13003099007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NHaLiG/OI9cNwjKc47O6DDMEH6z8vCJu/j8TaEloTJPzIUpUV31EbHnH+zyB3UU8zzPu4aSQxrJy7c+SpWAS+TiF7Md7aeIVG6uM1ZSbF00fuCK03/PE8hPkcH/xxUzdWhIRCW7Yy01s7SAGK7vUXj2tHK0piZd/sCPPJUQjmaL0B2+PoPwPv+kfFjBbJy764zHme8tUoyBk9hm970oDiv/fIbM0YhzNkQWF0zr3Hh0vhB2nY9Y2H7Kuijls824oW1T0XPYd0epNeYZkQWvuS05WkR7ZvvIkE/WQ3hKCYQzWRHPytIuBR9JJqZMkGNvkLO5qm+pXBH+lFJFFOlIBMnDhk5nvvVfo4FK5xcaucVojVuGvXqO695Zn0d4iBJZqgUWtRPDBa0GblLr2CD4CrM5H7j/VLjain7t9rqkwOfpw1BWSYWnwqLIvAAelGcMJLy7n9G2wwFL8EqhlJ8SzijvC4W6I6IAyzmuR9bZU8h4ViWrJt/RyfklRv/W4NQWZXRI4oEUmBuw5yxOBYRlPgdkQBfDAuCq1larnCxIwitpGj4DuVXlEBxhS/UC7EMkcZWHBtliG0BpC2j6bhe5bDb9ZSMkQ3EUHbg18r+9GUEUwWCRE2qehcGga2hDQeRGnNkD5LB+KybQ/efEahHe8SA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(13003099007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gpCvWjPL/832kEn5pHD8KhUH583voi9OssIbfi/+A6fMwom9KaHb/zoDT13pN5hAKPbYVQrSUXlvMI2ry6wpQtbrQXTitdr144zqavVN43HtBkrPeuViar2yB9VZl75JUmtnwSre/ouvZXnmUJnUKX4JKduWn8s2b8rbWnNsDdCxRCi1QfbCxoxPoJUb0/b2JM4ERtVDYUzSUdT/irUCQ0h20Gi8offXSheVMnIZlfsLL4cZxoAf/2XJ8iaseyZxshDrSAsAhl5s98ApVZcKQIaMnHxe4PEA5S2q60g2bAIec/uL+ni+G9pMhOscRlnzmeJDanGA2z+LrdVqSumZpl4rhSOMzd2u5+3XAUT40CtGuxZP8j5gFsMT2cmY2kj++sB0LP5ZqRhGqSs/H0mGXvStvJ6cU/tnmVMaSp/Y2+JthPSBw+BQUhKfeb4nDvUr
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 19:07:43.9005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea2dbff-46cb-46d9-3cba-08df02dc2490
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8887
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 19:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244268

This makes the class documentation's indentation consistent.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/archiver.bbclass | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 3124b7040d..f38409774d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -19,12 +19,12 @@
 #  - The recipe (.bb and .inc): ARCHIVER_MODE[recipe] =3D "1"
 #  - Filter the license, the recipe whose license in
 #    COPYLEFT_LICENSE_INCLUDE will be included, and in
-#    COPYLEFT_LICENSE_EXCLUDE will be excluded.
-#    COPYLEFT_LICENSE_INCLUDE =3D 'GPL* LGPL*'
-#    COPYLEFT_LICENSE_EXCLUDE =3D 'CLOSED Proprietary'
-# - The recipe type that will be archived:
-#    COPYLEFT_RECIPE_TYPES =3D 'target'
-# - The source mirror mode:
+#    COPYLEFT_LICENSE_EXCLUDE will be excluded:
+#     COPYLEFT_LICENSE_INCLUDE =3D 'GPL* LGPL*'
+#     COPYLEFT_LICENSE_EXCLUDE =3D 'CLOSED Proprietary'
+#  - The recipe type that will be archived:
+#     COPYLEFT_RECIPE_TYPES =3D 'target'
+#  - The source mirror mode:
 #    ARCHIVER_MODE[mirror] =3D "split" (default): Sources are split into
 #    per-recipe directories in a similar way to other archiver modes.
 #    Post-processing may be required to produce a single mirror directory.
@@ -33,13 +33,13 @@
 #    ARCHIVER_MODE[mirror] =3D "combined": All sources are placed into a s=
ingle
 #    directory suitable for direct use as a mirror. Duplicate sources are
 #    ignored.
-# - Source mirror exclusions:
-#     ARCHIVER_MIRROR_EXCLUDE is a list of prefixes to exclude from the mi=
rror.
-#     This may be used for sources which you are already publishing yourse=
lf
-#     (e.g. if the URI starts with 'https://mysite.com/' and your mirror i=
s
-#     going to be published to the same site). It may also be used to excl=
ude
-#     local files (with the prefix 'file://') if these will be provided as=
 part
-#     of an archive of the layers themselves.
+#  - Source mirror exclusions:
+#    ARCHIVER_MIRROR_EXCLUDE is a list of prefixes to exclude from the mir=
ror.
+#    This may be used for sources which you are already publishing yoursel=
f
+#    (e.g. if the URI starts with 'https://mysite.com/' and your mirror is
+#    going to be published to the same site). It may also be used to exclu=
de
+#    local files (with the prefix 'file://') if these will be provided as =
part
+#    of an archive of the layers themselves.
 #
=20
 # Create archive for all the recipe types

