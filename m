Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB88CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:36:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67339.1790624176186672669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=JMVMIoFH;
 spf=pass (domain: ericsson.com, ip: 52.101.70.68, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G62uKBy8OXsHOcNtNlypvHICfzZ4J5zVmbdysZeQLw0ahAX9tuAGuCfLPr7dtZimiF1VOor87P80kX+0RHU4bndBHRFKvwmvktaYOmGiMfleteu0c+5Z7n5kQMebKiI5zhF4qtkdSTpP8CSf3PXdLpgSsCGXBdO+wuC4B2XxdDHJeYUtJqOK9El1HVZZbXlFspsG6eICAt4JNj0bhc1XdHTsz+C6afX6p65AwhlqoYsJ1kBbbWJZjDV5b+DThCX7M1IdUX2jzjFaRPsqEgsRoZjVVm0dgwYg7aBUuJU44326p/5PJiXKCi6MzemOc+Up4tRt5SFEHBL9xlIoA7VxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7ysTdgAe125qdQbLea87vj01gMYh0pUbxxXocJMINE=;
 b=fwvyapS9E/Q7kwJ+v6UYrB35NENkdb4fZQc1msPZM8eEOViab/W1dcPQMYZgprUB3RKZChmPaky1ZCOb61X35UU5PcyqXABHJBK/4xdkirhzTmf/ilQgBbHWoizQvZ8JLAR+rYN4KZs0DJC46mebXVZDA3ES0kQNNGt1JR0DOE1f92d1YBclHvpDHTsbCE/I15jwZAFMIIKdD5pQbAXyDCeGN7uRgFSTFKVgUd2kTBWrkRUBKSxSpSXvOmjT7VvT/+2ug25QxLpU7BsXJFnyQWOcG1509HOAW5DQP7+jQsdqnte9oQTXrEW6yLetmiJ8j4D7hOD0VoH1hz7goXKmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7ysTdgAe125qdQbLea87vj01gMYh0pUbxxXocJMINE=;
 b=JMVMIoFHFRHwOghNSQHxNesdw/TQWM5nG2zzYzQGS6+4Fr1n66eiEkSLSdgAGVxsVHMit88nIP878AD+IH2yj6zhRmsjdI/qK/hXaxmCGVFp1UIK7sWfydPfT8d2s8XSXIoZNM5/JQLJWoXyGorchHKMhQtfZBgrvMi+SZWBxVKSCjBfJnCxJWvJjnujukVA/RcUAzDAT0aKZ01IK29WmfLykMBy33tBvhhSVNrUJEBSx0LxrSwnno9vuqgX4VW+6HPxcZkJ1i+5Wa/huTL4gvx4Q1GwT5QfpRwZQZottT/yvxQkwHmdgRUFQ0FzMr99qNrTIkf9d4wu+g0ducRzOA==
Received: from AM9P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::33)
 by DB9PR07MB7324.eurprd07.prod.outlook.com (2603:10a6:10:215::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:36:10 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:20b:21d:cafe::64) by AM9P192CA0028.outlook.office365.com
 (2603:10a6:20b:21d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 19:36:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 19:36:09 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 28 Sep 2026 21:36:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id E185C4020E99;
	Mon, 28 Sep 2026 21:36:05 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id AD111700CF25; Mon, 28 Sep 2026 21:36:05 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] lib/oe/recipeutils: honor stable_upgrade for UPSTREAM_CHECK_COMMITS recipes
Date: Mon, 28 Sep 2026 21:35:59 +0200
Message-ID: <20260928193559.3922884-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|DB9PR07MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 3543cb83-1393-40a8-b7c0-08df1d97bf36
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9LEKM7RSGWVxPlDyGEjOxzZ8HcoRAQP5Zk6GSPKrutOjwLkzUBkSqNXG1ZGxyu3ieh9UDs03H/xm9iMTEf83g6Tgo5jXftyIrSJ83H5/IHFae2eVs/NVH8lckujsK+DDw0d20Wa9v+jNje4R5CId/jW7rfK86P7ao1g1XfBfoGge+VoUCXL4lu2DiseX29Tt4csDG/ZHjbsdo06FglQbsd/gMESFOJ51SbWpt7Bs7zQp9Zcj7lK4+bMOjVFiJFEfv2xW72uGldnB56bH+1kJuojlPn2BCK2e/0/nmODaa1FaUx5R8PIlx3EhIEPLGxxy7t11UArvEJHkSLHP362wez+yDyTuGnzfdZEYkAqd7Uj/46zl4XRTu6Pvo2KrP7WmaZlEHeMVW+uv6cQQ+rvUqZgbPFG1XrBCF/6zkH9JqTpAVLwTrizNmHSpZS5XOX3RohnutctGZ4ud+Jie3BYzrkVSrz+Cobgqr5kNgtyHAXLAe4VCaTC/hx7HPZetaafxCovXj1rY37RXE1MKWESx7TV6d3hCsDvNqqCkQUrirtZsfim2T09bzUAqpLiONgIpH7mZEJHjPcH9UoofDSiIiIC8Nf2dsnn6b14l94uMJUyHRYBdZhtDBnQS5khFlnJS/+mIkhqZeT8MrO3PjhvF3wdxdyOAm0s1ArjAoGbc98Ot2vXZC314RK8VdetvgfPTnuq3/0lNdbsfVzL5ManaVg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/kBqiafOLtE940suA7RGaB5sx+HjjwtnoQNooXpwe5qh8BA6Ck2mo0p8S97N8lbxupCMwug7fkIr6WHKm5M4OHyHgzcHJWj1I8rRunQcxOlwfe93dee8YnJ67+J/L04PtIoecHsMznYDINzHeGFOhbAIbzHsEDf70+rq+TMB0Ui9fGHbhMJ/Ba2ZDPQpqu+Lt0gqIW8ASoDFouetFc/EaLjANpbDYIwnBIqY5Uzi4kcjD0r6JU7ox42+lhLTwC0OfYR06z6YuKFWRcxK6wWxIrgyenPNArWCpAuw9Q2mMkOYZD6YSu2YdSNWlx3aUi3rTCvD0nREYaTzqTxZSUYGX8KW+2RY2daAuEMq+v458bvegqvLa3H4OAAtaAaq851yS6F1XYNPCHvQhBFzAXrpmSI/gFmBld+GqD5IuYsKuxaXJ5y7k9qsPnyFEgV3LiZw
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:36:09.4328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3543cb83-1393-40a8-b7c0-08df1d97bf36
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7324
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246793

From: Daniel Turull <daniel.turull@ericsson.com>

Found running AUH --stable on wrynose: recipes with
UPSTREAM_CHECK_COMMITS set (gnu-config, gn, piglit, etc.) always
reported "-new-commits-available" regardless of stable_upgrade, since
that check ran before stable_upgrade was ever consulted.

AI-Generated: kiro:claude-sonnet-5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/lib/oe/recipeutils.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 99e7bc7acf..7b8594a612 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1068,7 +1068,7 @@ def get_recipe_upstream_version(rd, stable_upgrade=3D=
False):
         ru['datetime'] =3D datetime.now()
     else:
         ud =3D bb.fetch.FetchData(src_uri, rd)
-        if rd.getVar("UPSTREAM_CHECK_COMMITS") =3D=3D "1":
+        if rd.getVar("UPSTREAM_CHECK_COMMITS") =3D=3D "1" and not stable_u=
pgrade:
             bb.fetch.get_srcrev(rd)
             upversion =3D None
             revision =3D None
@@ -1079,6 +1079,12 @@ def get_recipe_upstream_version(rd, stable_upgrade=
=3DFalse):
                     upversion =3D upversion + "-new-commits-available"
             except bb.fetch.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
+        elif rd.getVar("UPSTREAM_CHECK_COMMITS") =3D=3D "1":
+            # UPSTREAM_CHECK_COMMITS recipes only track git HEAD, not a
+            # version number, so there's no way to filter for a "stable"
+            # release; treat as no update available.
+            upversion =3D pv
+            revision =3D None
         else:
             if stable_upgrade:
                 stable_release_regex =3D rd.getVar("UPSTREAM_STABLE_RELEAS=
E_REGEX")

