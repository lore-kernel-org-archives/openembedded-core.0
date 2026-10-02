Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D105CA5FE0
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:54:28 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6366.1790927665003254489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=FTp+Wt5F;
 spf=none, err=SPF record not found (domain: ericsson.com, ip: 52.101.83.64, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8z570hPSrSvqRUNCxh1BBaKhuRko1ySko4OokDTgSii0jwdueuqa2mMeod1lV/780GRNKwfspZtN7CnTvqh97St9epAcW2owpKNAI2sryVGPRL8pBQQ/FwT7UE8SKMS9C56XM04ijQwsJNpSnG4pwaFIB0/1a1RP8RUb3MsVu9jRiN0oCouFRIe2ZYGM8wZb8b45A1GZ9Ojo0rPdvtbxRKDnhNnfvPwyeqZEPhHuMIYdWtz+bItXVn+e0VGD062dyVDofmVPy7+G1iE+lXoXc7YDvEk7R3zwS/PkT0N/6g8SLHCsW3Vtcqs3rWsseCY9aY7pi2WHbYQTK9RPlgrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7EfrB5X37dWayq88Eqa9sWYIr4qXtfB/GbQvvDZmaU=;
 b=U+acesXM/TGykyLDQqxLXlW9uaAny8SWQgsiOKkM+X+8kwPtPMJZn/KEfgD9PEhSURtOQ9hNSX4m53lYl8Mqc84svVHDUQBGI4sH+gY6blf1DeseV1p/ZNi120FJtTuBPRv/jUxevavFFkYEDDxwJ3guuYNeNz8qrSrde4rXpb0xWJwQg9649x+rMmhw9F4SrywTCP8S0C3E6XssGBjkCgMNy4FQiCgZc16nYLSrW5zZPIOiSqeZjOD+JDIWjbpN0StQVgsLK70D4evFv94UZTSQtvmixfkJhyZdcfzK1zxJDARKzt2jSW7vxwLv2h2E4PzZgPXuJoMjCq6g5rf9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7EfrB5X37dWayq88Eqa9sWYIr4qXtfB/GbQvvDZmaU=;
 b=FTp+Wt5Fl20WQMO30WKgGLmY/KIPdPzQ2mesKTx6wxzn683dmFIKkkwMJcN1OQeZiilEF4Nau05qDXtgB4nbBbn+cmaYkg75bb5R1BM3QZrdu1Z+rIzp8zSPOtPWqvI7YiKa25x+Uv1bjnTaM+gWtDdzKju978QP1x9ciaXIVLpLOusZPbuD98vj3RKnfnUdMTlGOkO9DiQO6lWAeOnli7eLfnmgwDzZ+AshOUdQDx/xk2U4zdQ6kko77f41kmvfNj+qihsE7kY/tVocdDKX0rqTxmDOijrdAVlBuZH5OuhNM1hWBnTBGf2iUDU3JwPLVr2rhwoy38OkLWUNZDv62w==
Received: from AS9PR05CA0246.eurprd05.prod.outlook.com (2603:10a6:20b:493::21)
 by DB9PR07MB7242.eurprd07.prod.outlook.com (2603:10a6:10:21e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 07:54:19 +0000
Received: from AMS0EPF0000056D.eurprd02.prod.outlook.com
 (2603:10a6:20b:493:cafe::7b) by AS9PR05CA0246.outlook.office365.com
 (2603:10a6:20b:493::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 07:54:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF0000056D.mail.protection.outlook.com (10.167.242.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 07:54:19 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 2 Oct 2026 09:54:19 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 77AF695809;
	Fri,  2 Oct 2026 09:54:18 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3BD75700CF27; Fri,  2 Oct 2026 09:54:18 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v4 1/3] classes/base: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
Date: Fri, 2 Oct 2026 09:54:12 +0200
Message-ID: <20261002075414.2311840-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002075414.2311840-1-daniel.turull@ericsson.com>
References: <20261002075414.2311840-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000056D:EE_|DB9PR07MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 151fe79e-df09-4ae5-3b1f-08df205a5d77
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	dWiUBEDlh1SFKyAn/ADSYIr6MWEnx+yYpTAMMwJPXwpDj09Glnh3O9eKW/9qdHmIMk4v24xeW5GxsnRHTEv4wZyX9QlsY5kYVuUop7csTGSMvC0xAADijNuNjsqn6rY9fEmf1mlvSezaACbeRlp3eN+av+MBft47r7XKGz+HskgjMcGEJVp2bvOwdPiO7+fMLsIojqtscQxLixiHuaZJABzdynR8bTUEJPckeb1PgrodvfV+epXlkKFwLlLDoFDEPNMAlaab6p3Srv3+/Ks21d7S9okMNd4xOXy2szLT5jQgrwgzuSWYmLtON4uVaNh+qoR4qGw8xNTyxNdV5GWD1Ka8nRdAx0WJ0nNSLkV3eCr6vyXkXWO2FxPwN0bdiZr3o6AXjoLSmejV9cWPDu3NneLMBlmU4OR0ZzKKrkes+4m7BiGXhlReaPClN2WcoVYOkfd5bNyZSv5jnw5Nu4VkdQttP3NYfBDhrWOMmIHT8Sm5VynH8HHSy5EJ1WFc/i8k+/61EaEFWjdmzEqeYZ73zgLAK8zXLxxyy/TmOEGs6skdcvAmkL9Dwku4Zn6XDs9b9mn+vJucEACgbGQUxb/P1nR/lgeDD/HyzWWhQMXrZERPlk2RyHYP6WBIjWUuHTpRCW+Iksp9CcVqqV0iH13pJ4ur/kq+HmiaCnsnZZpxu16RRLbH4k/IKedCewI1oyzdUEnGho2W+TfR6Jw15VMi/g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8aA7jxtdeKKwB0HngNyX7+yojaZzzTJhjshgyQfLz79dazWIQeYY0+1sH8I3hwLZzc7OqlO+RXSAoBFQs/2dd5TF7yIbEf6yKPm0e7QdDs+TsRXEMyrtJqyoOGgoQEFEZAPyTzZFfx8ai/ZYFc9P7IvTJPkKnuzUAo6XJFo3DPVXDxEj4blTmpBn4n2peblZv0giEavetJVZ1CXB1ytAIPMGkDfAoSSw3EaT3K0huf5nXAPCJG4fhLn897Y9iDh+jvQ42DS0pCnDhV3ASq/5KLF65QBERid/O61NfyYr1P+G8szZIZdk5r4E+OXPnxNvUrKRsG3Gph13uHp3p8buNmwprEbsuRuqqnpr7R3TKqhyWUdfKrdRrnDOn0SEH+usa2oCqpHvpWmUnjm/EQ+7f96WyPh1xZa/n+nOaYZRJ40zeybqGh/8eFTP4JW8ix2w
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:54:19.6510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 151fe79e-df09-4ae5-3b1f-08df205a5d77
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000056D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7242
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247085

From: Daniel Turull <daniel.turull@ericsson.com>

epochfile_read() memoizes its result into __CACHED_SOURCE_DATE_EPOCH
via d.setVar(), so its runtime value leaks into the basehash of any
task that calls it, causing a "metadata is not deterministic" error
once SDE_FILE is populated.

Exclude it, since it is not meaningful build metadata.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
This should fix the selftest errors reported by Mathieu
---
 meta/classes-global/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class
index 9553f00432..01a030399e 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -249,6 +249,10 @@ do_unpack[postfuncs] +=3D "create_source_date_epoch_st=
amp"
 def get_source_date_epoch_value(d):
     return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
=20
+# epochfile_read() memoizes into this variable via d.setVar(), so its
+# runtime value must not leak into any task's hash.
+oe.reproducible.epochfile_read[vardepsexclude] =3D "__CACHED_SOURCE_DATE_E=
POCH"
+
 def get_layers_branch_rev(d):
     revisions =3D oe.buildcfg.get_layer_revisions(d)
     layers_branch_rev =3D ["%-20s =3D \"%s:%s\"" % (r[1], r[2], r[3]) for =
r in revisions]

