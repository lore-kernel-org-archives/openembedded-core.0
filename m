Return-Path: <Yasir.Al-Latifi@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66D1D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 10:35:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3626.1768905318359949035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 02:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=a1MREvQU;
 spf=pass (domain: axis.com, ip: 52.101.72.57, mailfrom: yasir.al-latifi@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjfHu0YrAhm5Y5c8WB2D4wVDSd47+RF/ou8egJtSe53tdQ3bmwrgmAjcXSGth6VkuAxrmvux/W7dsRrSz+sYmPT6mbtXrSYFpEkUsZJyXIaX4wlRy7Sl1dcScXWWgpcmYr57nVOu06A65CsF+gS1WitD6hyOZCKvMBC5w9/SV4dGTz3dcgEruG/sbWGXnIXmJKFHV4CBUXvJelpFQeiLK3g1dz490v5kI987V699/wcUeDTU1PYMAoNg1s2QPdeSwc5L8GMosNIBQI1qpuEqZ4/HUJDg9me21PsTYo8FEqxdyFi+c0R8aB9u64ZwwWgEPswK0s9ophb9BZ/0H7WZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGOeBlAitwy1kjfMHNyrWdJROgntByB61XkdlDjHqXc=;
 b=BqHmo0PjL2MjdzNNQvPDOguT6B3sC1gO0vQoEy7cUYeQX2sPgmFwYj/aBoRFdQSduXqYKkRfm/mGEYIEFkmA55y4Jzq8SrhE0u3cgsqmvvkY30+RFZXarjy3vQNsLPn2vc0yaDKZZzm6El1fZIBtDCYVFVgZyPCZDElyw1hz44a2Hk+t5UzxjjuBmAqAoZavvCtCQNWhhPFbsnwWLhWKm5srPW3kj39GKg2zxLBgdoby7QKqISFvfp58RvIx8bVfaslBbpTwW8hFe2gikrXSUnRo0drefiZzvKrcSrjxziWzKbVZiPfdy57JadRq9YUg3ACXwDKlV+2SMs8oLzS3Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGOeBlAitwy1kjfMHNyrWdJROgntByB61XkdlDjHqXc=;
 b=a1MREvQU/qPeh5ORwpMUDMTJgKTSt+U6MqTjNgrrGiRMp7YL9Dr+rQ5ciH42HW/7M7ifjvJsiZ9mdDiAHzOpt3TM6zDwN2bc9JxCGLGx9U+BTMt9XTyb+EJUtQ18E1k/gpf2AwRWHIJDqVq9r3lmxLrdUL5IhSsLLFURI4dKMJ8=
Received: from AS9PR05CA0316.eurprd05.prod.outlook.com (2603:10a6:20b:491::8)
 by VI1PR02MB5917.eurprd02.prod.outlook.com (2603:10a6:803:135::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 10:35:14 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:491:cafe::85) by AS9PR05CA0316.outlook.office365.com
 (2603:10a6:20b:491::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 10:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 10:35:13 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 20 Jan
 2026 11:35:13 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Tue, 20 Jan 2026 11:35:13 +0100
Received: from pc51387-2239.se.axis.com (pc51387-2239.se.axis.com [10.88.47.14])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1E220F4;
	Tue, 20 Jan 2026 11:35:13 +0100 (CET)
From: Yasir Al-Latifi <yasira@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Yasir Al-Latifi <yasira@axis.com>
Subject: [PATCH] harfbuzz: Upgrade 12.2.0 -> 12.3.0
Date: Tue, 20 Jan 2026 11:35:10 +0100
Message-ID: <20260120103510.3776186-1-yasira@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|VI1PR02MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 14344994-d2ac-4c31-04e0-08de580f9843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zIE6l3U+1sXfY6urttXRZaarQlI7TtvbEffjTSdwff4VLKdusEJsnoobg8o4?=
 =?us-ascii?Q?ghZJutSzNVXxl7m497eXr7tlC1ixjjO8PKzYmvy3M/ZAXeDmWEA0onqVCmrS?=
 =?us-ascii?Q?Plz1drDjqrtTDyuKHlmJCAig52FNZ3Qukr6yJ3UV7Q1s8D5evRmlKLMAZt+C?=
 =?us-ascii?Q?r1mendxnWFSZnV1rgh22rdvDfM51nUVI81bGeGRttaO4xsnOHGaSdZRwdLXC?=
 =?us-ascii?Q?uDk3gEos3MQvarcXxPsJETEO+slmeZ+mhK+V68RYLwP6Ka8oO3jDufXmzwZl?=
 =?us-ascii?Q?L6MZUlghdvNaS6Y5Wf0df8s235XqzeP4jG4bNEHvdnYlsvOQmHoPHHwf8hgu?=
 =?us-ascii?Q?Vn8YcNl0acFsbAntkFp6YH+EJEKrL/ci7UGIx6ymYdiYPrR9xE6920xb5AZx?=
 =?us-ascii?Q?r0KMuX6a5w+hPerfpnnqgAgu6hi6L238GUa+E01OllmAI8EbgVflQPQQTa8q?=
 =?us-ascii?Q?gjvNX4XqR6vzBwPYvwMT5H2Fd0Cjczx7QWj6C2GXSdeIU13yyf9ZBhG4Tt95?=
 =?us-ascii?Q?k7WPdwbQ/bpaF0oAipgKF8e9ijTGnrIktNwXlj7H3zzxV6OhP+zNwRMoz4jf?=
 =?us-ascii?Q?GD5BtfJRqmi2CDm+LUlbKTfYCzRuUaoU8C8yuKwkVowOH5l422kVRiCFlsCZ?=
 =?us-ascii?Q?auwXa8Knqt0qK9je9b3RjphWE0+avBD37aztvD8kGSG7UD6LaeVHk3Xh5xwV?=
 =?us-ascii?Q?KsPkN+8HTE6qyDiMZKPh9cBwb4ZhLpJmpqWz9ixKsUE0feW7jja1+RWYYxnx?=
 =?us-ascii?Q?kuwlHZ0CdW9dlRBsQuAgPq+6YTQwajMP/AxE5QmtAYWe5+dnCnSBqc5CZPYJ?=
 =?us-ascii?Q?3koSCysk4X/pVzYxBM8t6mdBfKg46lYUVKp+JZMZCXAgq769qXv3vb4mP3ig?=
 =?us-ascii?Q?tKQQlx06UOPrFzScnFtNdcZ7Bc4Yt7ejOFKNaVF1bXgtdlmJyGuUJNH8imD+?=
 =?us-ascii?Q?svT7+lCn5mduAGGoRk2Ohfr5uJ9vuTKJPUCNBvZrComqdLu9VHeKlRF6M/bd?=
 =?us-ascii?Q?SOyeAy7sk/GW8Ubm4O7g1mzIM9fu/4Ham7zUJihw7PSud3/UvV6lVn4vnhLo?=
 =?us-ascii?Q?IYLv8JNeazL3PBBwr+eFd4gzGHSgTXeSBTEg56Q/pbAuC0ZTKwIUR18dGotf?=
 =?us-ascii?Q?nuJ+aLeQGj+UkC0y0mmiG0Z/FOgJasXsFNYuG0JgfYV8eU1HAYURFN6RRB1W?=
 =?us-ascii?Q?XDOx2ip7/dvq7I3uJz7yKuJ9L6Fr4200cYey704xTIaJCR99lNzj72vFF13k?=
 =?us-ascii?Q?g9/EEZRwlrKR0jEnDtQ3X5FVc/IlBrRIHmS75kKmDYz37qmkUBqQaDdFpHoE?=
 =?us-ascii?Q?9NldFiQayPLl+U+R05Tn3X3pwSt2vgZRlB/kfWPyFgDV9o87sC7dqqg/p3aU?=
 =?us-ascii?Q?r91uUcfyFX6U6SlC4qgGLspSGORYzb9uHWPf125zuxWZkXgJCDAlB3lezo4F?=
 =?us-ascii?Q?ObG85U123K3id92qoOr+JF9W43QfodMbKVdcI+qm0FY+9FfNrCwQbpWd3wV1?=
 =?us-ascii?Q?4rO4pCf0JVG0cYYLvUmPDNo6/7CLCJgvaWYRyocTIAuRfNKtL8GuBA6CJJBu?=
 =?us-ascii?Q?VNZwQJgCZnhvZXgxApAbo1p+iNEyyYTXU/3ZfhEkj5LHpnkCVCBCt17B543t?=
 =?us-ascii?Q?MJQ4Q0VbJhVaf4SFjRNWw2hcnGNlwKmtBBuaDfX3TXVG3fkGT0h42YBnTaEQ?=
 =?us-ascii?Q?LBgq8Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:35:13.5086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14344994-d2ac-4c31-04e0-08de580f9843
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229657

CVE: CVE-2026-22693
Signed-off-by: Yasir Al-Latifi <yasira@axis.com>
---
 .../harfbuzz/{harfbuzz_12.2.0.bb =3D> harfbuzz_12.3.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.2.0.bb =3D> harfbuzz_12=
.3.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb b/meta/recip=
es-graphics/harfbuzz/harfbuzz_12.3.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
index ef2f6aa4f9..d2e63f5529 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2a6=
7cfef01e99e4893d \
                     "
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "ecb603aa426a8b24665718667bda64a84c1504db7454ee4cad=
bd362eea64e545"
+SRC_URI[sha256sum] =3D "8660ebd3c27d9407fc8433b5d172bafba5f0317cb0bb4339f2=
8e5370c93d42b7"
=20
 DEPENDS +=3D "glib-2.0-native"
=20

