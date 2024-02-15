Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462DBC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:13:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web11.4801.1708035191022660196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=RZhVQg9D;
 spf=pass (domain: axis.com, ip: 40.107.20.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBWSUgLg0GNO1WoK0W9Lu3jeD9//zCOCzUgEbPiFkeRmmwYEex0C8kdv9IdTFJ0quiMgyTsbvT+Kl+kot2/ciZxs7b4Dy2C4KB0bK+tljS56jOOU7/eQN43t/+kjn/bXaqVJ6RVE05SrVzE7Eu0Kw8HotmIuKQkzBGB8cWyPsZU0kQ9mxIPj9gx5RZC1YIwK4LzkHTAIMOM44YeBVt9N9mJgDEsAjAZjMUclG0pICyVG+zrBNe7JG6OYj7g8oIAIwR8arpb77GtQYJGmuoRLXRJ5T4MV5xUaLebmaUcGo/NqLKnMXxTYEA1Z1pdWoANeReZ10snIVUUa1oteKa60Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjSUrzKumJ+jZl4+1a610/6mHJ39LpmdAPRgo78l4n8=;
 b=VfEeyM5oZOfu4hUjX86/EduOdEiB9HKUzm3Tduk6OnCb4lWYTSVQLepHoL88QJwp4QS9ywWYr25pE6sQxhuyp8wDdJxL6uoqIJrAsfYlmMjwcQ3QMtceAkaZh6u0D2u7SDrJpgJ5tqW3z1I9gTpHpJCSOqNMRxU1O1AIOPZ6svResj9AH0o2gc4RzumPoD11FLCyTrYIjcktqV3n5lk0n9zTrz8Vat5CcT8dTSPHqbgP2znQ+b1dh72GPsEctbjK8mC0yVPv99PnpeadUbIPLPHce+x187CAJ5AiwsBJYgg10uxwdQsaSszmFkcHBLBHxv3tFCtrlrXS4DuZ/t3/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjSUrzKumJ+jZl4+1a610/6mHJ39LpmdAPRgo78l4n8=;
 b=RZhVQg9DV5ul33X639s4ymvDeya1MKgWLxC9LoNWQQqEnXqCtieZDWP5i0dfVxDB25l3crneoaqEyt2kDsHm76fEeQeZIVRsoUhPn5rNZPZzihdIn9BhkwT6YnXNbBjtpR2cEAhXVI92fsZBC1ME68V2tv8jEx7tnf5q0JEEW9I=
Received: from DUZPR01CA0256.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::16) by AS1PR02MB7943.eurprd02.prod.outlook.com
 (2603:10a6:20b:4a3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 22:13:07 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::68) by DUZPR01CA0256.outlook.office365.com
 (2603:10a6:10:4b5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Thu, 15 Feb 2024 22:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 22:13:06 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Feb
 2024 23:13:06 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Feb
 2024 23:13:06 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 15 Feb 2024 23:13:06 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 17B9B1462E
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 23:13:06 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41FMD5371161148
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 23:13:06 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41FMD5661161147
	for openembedded-core@lists.openembedded.org; Thu, 15 Feb 2024 23:13:05 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] devtool: modify: Correct appending of type=git-dependency to URIs
Date: Thu, 15 Feb 2024 23:12:50 +0100
Message-ID: <20240215221250.1161135-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EB:EE_|AS1PR02MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 1309c9fb-635c-432b-9e2f-08dc2e734972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qVtvq2BqkFwtAdZABomr0t19wTDhLcN1CLDs7BfSqkqQ+2CbyDVAyYq5/lSdCLzsG2IvcECoCnZ7jWGgt5rbVGmXV1oZXj6lPKT3YPwnvlGljvc7qN3cRNx2rhACoKe3kvtND66iKp0aowKV7uB0oWuGtD7hQ2rO9MlmpOflaE1lcxmvKjBmJZgjeV5BdhNJ5TjBtLUNAl1/XYq2EXf19sAd3qZxxLyJJsfyugRcENaddPubitPhioFJDcc3Q1jXU/2pKd/63x4gUkwbQpbZODwO5WLu1hyMCJma9kDVdBgCLdsOPoz9KZ2Ygs32VIEtaKErjcKCEJb99+7GAgknLg9JFdXkPCyeX0cMgDpSSQgpvhyXdU9bXiBMl4XdMu3CBywMNkIuaEPAuhuXCDgCiE6puXWawsjT45GPX1Mgq7RtHDbk8/E2zvqk1KO2oKll6Hp9D9PviAKbT3QZAu6vPJMefSw6QmuyVwRibpfYYqb7XvQwMjYK6A/EOg8nZKIOHG0rT/s9N2NDEWG+6rUBlRkvuJlz4sPkzOrcoFxz6nj+5jmQuQ8vZcdOo2/mjjae//m9/Wdj0HTAkYnSGx0gpt9jcGO7eirn6tnfCHdfG2F+Yd1R7CJbXO5pukAhRi77PXy/DNu4DnmF5sO69J7XZ0jpPwtLJeaTNYigg1S66zQ=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799012)(36860700004)(40470700004)(46966006)(70586007)(41300700001)(26005)(42186006)(2906002)(5660300002)(83380400001)(82740400003)(70206006)(8676002)(8936002)(316002)(336012)(6916009)(36756003)(6666004)(426003)(2616005)(81166007)(478600001)(356005)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 22:13:06.7507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1309c9fb-635c-432b-9e2f-08dc2e734972
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB7943
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195708

A missing space when using :append would lead to run-on URIs if there
was no whitespace at the end of the original SRC_URI.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 8fb4b934d4..0243e3bc75 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -966,7 +966,7 @@ def modify(args, config, basepath, workspace):
             # Assume first entry is main source extracted in ${S} so skip =
it
             src_uri =3D src_uri[1::]
=20
-            #Add "type=3Dgit-dependency" to all non local sources
+            # Add "type=3Dgit-dependency" to all non local sources
             for url in src_uri:
                 if not url.startswith('file://') and not 'type=3D' in url:
                     src_uri_remove.append(url)
@@ -974,7 +974,7 @@ def modify(args, config, basepath, workspace):
=20
             if src_uri_remove:
                 f.write('SRC_URI:remove =3D "%s"\n' % ' '.join(src_uri_rem=
ove))
-                f.write('SRC_URI:append =3D "%s"\n\n' % ' '.join(src_uri_a=
ppend))
+                f.write('SRC_URI:append =3D " %s"\n\n' % ' '.join(src_uri_=
append))
=20
             f.write('FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"\n')
             # Local files can be modified/tracked in separate subdir under=
 srctree

