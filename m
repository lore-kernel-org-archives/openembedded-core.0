Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD235E8307C
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:42:57 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20597.1770212572798861026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=EpDx49w4;
 spf=pass (domain: ericsson.com, ip: 52.101.72.50, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnW/TTaLmy/UOlWMHR+MMotoPrLJ9QAoQoe8wpRd98Sd8/XwMkbqY8YfqvoAB8tdrJeAOcUtnSVOQTvV/Hd+riQcIVgTukJSkMBxhgQ5qL+98BrfgQphTncPLQRL7Y7L3/F5sDKWJ/PEzoGRb1/wsCUdIlu39gkpH3dEj192lgMsU1T+KzqP+ESrDk4+FyLmrGm7MY/9+NL5LixVMqP5ktSKr6fmDr7rm0fGr5KKCMC6nnEg+sE20XheIYrpTHrr7YXIWWCSiCVRNoMOmxnXS0B1JJpMjNUnIqEb9U+fiNLTIhOCU5jTD9P0o1MuL+7nDaPtEVpPh3ne2b+n7KoNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNxIvOmVhU8eOTsOwTQ9nIYuUWcWDP2Np2sYMQxlxZk=;
 b=emaJsqa9jYeOvqmBBIiX9R/8l8xamxQ+cIVud+4OW4bCjBRUqS10J4MtRem5gC9OX4tgOK0FD++gG6z766NRn6Vd1kexkCKvSd6PJgIShtce6LXayM8AqyI/snnZNfW92Yjb+g1pnervVjFPhO4eZArhzVy+GS2zPtgI3O2zuJn78K/8gujiiwna1OxChjtQCDCixD1Dna4vo4DcmBcT4MvxqY7lplEbUXclM+q41VKMO2crrEDp3kT0Ua5McQK6WCOrM4HIo2AIZR97NvHyELmBF74qRe9efU6NoEl3bJlwZU1a4q/A05WCcBgVOuwZVBKItcMjZs+j+5erby0rbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNxIvOmVhU8eOTsOwTQ9nIYuUWcWDP2Np2sYMQxlxZk=;
 b=EpDx49w4sWlRboKiewbkCg9OQyed87nBqT4UJNHVpGC4hJ+XRqxpe35zdhhaqN+5/4aw2b0f5LXYpYmd/UUTmhTjSsjgZLRhnlyt6VNWeFEvq1Q4ZE3mYLr7eTutthnHrUeVZdQyQ/QtiIRVQfGj29bVJIh5LyvJcHqOE/3RM0JNOauw9Y1XuJzbk+UyhU1dWrtZI/rC4585MAMMO5lt2pBZsewfoZ10M3IbKvns22VSqR1d+eAm/hYUTFNmk16kk2IWj7vDf61UehDhhTzJ5xWED/13s47Uzr838cADAHsPCsv9zL/jB0WW7PwvkAmZNB8w/cTgzTMwAWELYflAyA==
Received: from AS4P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::13)
 by DU2PR07MB9553.eurprd07.prod.outlook.com (2603:10a6:10:49e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 13:42:47 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::50) by AS4P251CA0027.outlook.office365.com
 (2603:10a6:20b:5d3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 13:42:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 13:42:46 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Feb 2026 14:42:46 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 0BFFC4020B7B;
	Wed,  4 Feb 2026 14:42:45 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E3DA97000699; Wed,  4 Feb 2026 14:42:45 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Andrew Fenner
	<andrew.fenner@est.tech>
Subject: [PATCH 1/4] improve_kernel_cve_report: sort kernel_compiled_files
Date: Wed, 4 Feb 2026 14:42:32 +0100
Message-ID: <20260204134235.3274889-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|DU2PR07MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd8e2ae-b056-470e-0033-08de63f347fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bJ8rKqJ9bTnXyCcG+CZkqGxEiYq0dHFV/IeMb1ou/IDondVAS+nsL9mYMlCW?=
 =?us-ascii?Q?fF6eWPQzFy0OhKsy5HjUtWfsnf24sXTGV2ki9cLeDT3UVjxAAyuiXRTEWXQF?=
 =?us-ascii?Q?8qzaVfQpOyXJdhHB0aIaa6p4ELJpnbPpn3Dzz9rgpanaAJojT7GBatktuMGt?=
 =?us-ascii?Q?ENVxdI6iiDvomkLCnUCy0c8SjjF99YNi135wk6hjD26jVkjcpNs2vYZ3xyrB?=
 =?us-ascii?Q?FJkoQV1aShlJ++GTc5yjqZQRc2VyG94Sr/u98e5q5ToSDh53rOPM88xAoDpJ?=
 =?us-ascii?Q?/KdNpmhKsDvL0mpm1Ooesq9qjDiAk3PWd7UrX53Tq6OHGaIcaYwWjpd1C+xy?=
 =?us-ascii?Q?cPHyMrOnVVQz697fM4jFHvEY8Ze7j5ldbz+kMVDYFZqvQK784kY8wXwNz7AU?=
 =?us-ascii?Q?L0v6YJ9/UZBMNHfpHscnjJvT2wt27SdHC+KMV3qR4xqNdSti6GGr1NNOGAsN?=
 =?us-ascii?Q?fn5UhFwT8xyh1wV7MbxImMgruoFMA2F5tcfwQd09Dbu3nuJtCN+DXGP+JQov?=
 =?us-ascii?Q?VrlGU8UgTC1ErMrHCM417jh4SfxWIakos7YEdbDt6qnygyl3hyafQ0sUWX+r?=
 =?us-ascii?Q?kRoMhRuzkPc+F07NiosAbmDZRma/2NYgdcDxiO54/z47U4aFvYSw1IecZuaZ?=
 =?us-ascii?Q?cah4ZRfuKG/Z/KxD6qz/9xgsjBsbahte9i5CIFkqWo4MgMLdp4IsQQ4VT1ok?=
 =?us-ascii?Q?bQ2MRxNNyO95tL9iFaiNIfrc5Gzf56YcEw+OXPS7yQTJfaNuBecJrLqMDel0?=
 =?us-ascii?Q?7B9UvpU13s1QQlIHjqjrA9u0BBeRFLH72Zmb9g+J9PvYaYibKjl/tTMj0g2b?=
 =?us-ascii?Q?cEj8+9lba0MzGpVNNduB2Big6LQpn/HnWzOtjl9haVe57pl7PueVWoehYA55?=
 =?us-ascii?Q?Py+7pLluyPzxES7ACVZg72KzsjRHP7H6B7LRfPe8T2xTJiKHqPxiy6U129Fr?=
 =?us-ascii?Q?q0xFiLTEyq4vzKcZG9thtOuUOa0bZcq4AHZ9Bz5Ry8gvYpnmNzo2U5hpIHKc?=
 =?us-ascii?Q?e6K8mftQxouLjlvSf1gBnxns/udinG2lYF+xUHyed9qIykHFvxjjuGMeiTLj?=
 =?us-ascii?Q?FVijMYTfFVvrgGeNgey2kbzUcZ7Qy8OM35Pon7Fqqa/PUuA4Ogpu639fGb2c?=
 =?us-ascii?Q?Y6LqhDap7vJZ9FxyT76FGHZ6KkkG6Xk/xQsE+RriPLYKGUDk3nZx8EUzlIbd?=
 =?us-ascii?Q?nE3RNKgvAwZyJC1j3M65S5EujZrvqpaHXnlM89d31898/7W4JT8unkMR22cd?=
 =?us-ascii?Q?M5ozq/twK81AajbbDvjqT4g40lc/49An7nVTL4yJA4g930evPt6KnsRSCI7s?=
 =?us-ascii?Q?4H24qwJKeZ2uOclSG8/xElFHHzMNinfIip/akj9uwKFel0sWTwAQZChE7nTB?=
 =?us-ascii?Q?7DS/A1nEa5eytUVLcuif4XeBezmtK2Lyn/gsxNG/tQZIXneGbJUMDzJ3EU2j?=
 =?us-ascii?Q?kfRl6eT8fdfZYP1zDbbUI2XbGXLYBSPTojlV30fQEF6rdU9nlB3U3oma81GP?=
 =?us-ascii?Q?SXinI6qdsse+XmK0k/P27UIYT4gUBcipM9LcvxF3DXMSyfVi/XKhhdxgmnz+?=
 =?us-ascii?Q?XCnQWJBSDs53BkRMSKSO7SOnXbmnH/cAYhk6X2RXC/ufmXzO31mlJL121SCF?=
 =?us-ascii?Q?Zykpy/PRpsyxAWlZYRngQRH50S6QQLBRXWxKGeLLLkkelcuriTPXUMyyn7WT?=
 =?us-ascii?Q?oGSKzQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6+0cqMXOFNl9eXBBJiIWjS2qvMQWP6VWKl4WPo6i9CmL0t5ZRI/m3Oz2ANObu0KMaAT9KIm2d70+FQVLfyw6u8jByVIOQESx7X3nYpb8plhIOKWfJBmvLulLNhsv01e3YWc0KEDmHqpg+UOuED35ukEn3E9GVtqKvoI//Bd00l5ES2dQBbXpOVhVy1WXvwuocUrRD59e1YMXrWFfSjEeEgmmlOsE4W/vzNjWR1v26D8YRMSxnbDp4oQ33pu9l1/+q9bCgYkYOUS+7Sq71PbquvmwXoVtRYYoxA4yKWAktZ2pxaNhWkewwyH6/xu0tZoKrY0t+vBG7ELp2lrzPV97OnceIH3RbBcB3YzpDt6eL/clGbKkt9bnrF6JP9qJO2l9gF6Jv0Q4uZpGrEd2DBaQOOXXlvMV8Zvr2Uo1A+acn2nobkwPLFFeC8nKcAxvh00l
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:42:46.8557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd8e2ae-b056-470e-0033-08de63f347fc
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB9553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230522

From: Daniel Turull <daniel.turull@ericsson.com>

Sorting the set so the that output is predictable

Signed-off-by: Andrew Fenner <andrew.fenner@est.tech>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index 3a15b1ed26..27ebed2cbd 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -106,7 +106,7 @@ def get_kernel_cves(datadir, compiled_files, version):
                     "status": "Ignored",
                     "detail": "not-applicable-config",
                     "summary": description,
-                    "description": f"Source code not compiled by config. {=
affected_files}"
+                    "description": f"Source code not compiled by config. {=
sorted(affected_files)}"
                 }
                 not_applicable_config +=3D1
             # Check if we have backport

