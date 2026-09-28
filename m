Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C98CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:04:30 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66570.1790622263844724238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=B0PHTYwM;
 spf=pass (domain: ericsson.com, ip: 52.101.72.63, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y14aGTQQCus4VHrBlnoZYJK7RDOqiSf1iNAu5RBo1ZmCcMP0KfriXu0EKd3MGp93cu5QyNChKsq9MCqEZpaU58g/zNy1edNLn6dwsZy69nAkUnmfSUk2RDuB5e5eCxv2ejpE9ldN84L3ww/3bhIbemJ3sewouMYeWcYdDbUdegSal2OFvp/Y4Yp72oqoxnhkSYnnD1ociTHZklfrQdEB9X4mzEf7tKqJ6B/hPAGZgLEWxIDo6ipw5RRRFt2gW6CDZLpMbZ87T+IFP/eX8OlOvsfEoqU03sKzpe+6gvwm4VAa0DcB5B8xJboIWK8/McmqYVGis0h3zVEltebxJPxW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7EfrB5X37dWayq88Eqa9sWYIr4qXtfB/GbQvvDZmaU=;
 b=rZs5GGr2CREtGB7MW5igMAaj8+UDTBUn7nfpkZkHMZMOzv+irEh8LVrmUj7GsvAzkpt6hURet9JzCFf7vEP2/oqGlYjiMsE2IWy9kDi6IfqOIsdetwV7/4WQvCzUa/dOX5wDzjv90uQAr3w56u/IRyWFdKpeM+hxn/JV3bED4wszOzTt7O2roku6eeqm0c9O7ZXrGXoe0iP0+CAmBPMjZUaB5J+cLBJCnkyVs2oOQcsRAYd6JO6sMb7fIghVs2G/caVfgVSE/sm9pR49Vdze8p5rPhNMvXKSat4VpiqDEnCMCT85P2Qr9PADYpZRlQbKuXxleX6nSUefPovdj6dcfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7EfrB5X37dWayq88Eqa9sWYIr4qXtfB/GbQvvDZmaU=;
 b=B0PHTYwMM0fwtgrYG+XKLKJuSHtHKWtIqqT6vRDOTAev9aosAL87R3hzubb1SanTELrLo2jTV8M0VG4ourffuIuFnpPyCHnnB5yi11sh3d9wNmEL8Su3FmKwWB3DwrFy8drWc05tH3/XuAreefXIXzuA/5YtjdupahJTa0dmd3kmSLkSBtUY2MtWAFVQ/mjWP3723QL7jGAWXekAt9V4l9FheOHbTb9zB6WGzuCyVwKlDArkHla+qJXD78G2jvS7i4BfgRGcV4rljJMHkWDD7qdaFDtlUmszMOsct4tGpJ8rkjm03sjKdgnQtToa8kETItc3CEKvxwAu9a9dSC/QYg==
Received: from PAZP264CA0052.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::15)
 by DB9PR07MB7770.eurprd07.prod.outlook.com (2603:10a6:10:2af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:04:18 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:102:1fc:cafe::ac) by PAZP264CA0052.outlook.office365.com
 (2603:10a6:102:1fc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 19:04:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 19:04:18 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 28 Sep 2026 21:04:10 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id DBC6C957DA;
	Mon, 28 Sep 2026 21:04:05 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id ACD28700CF27; Mon, 28 Sep 2026 21:04:05 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v3 1/3] classes/base: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
Date: Mon, 28 Sep 2026 21:03:58 +0200
Message-ID: <20260928190400.3908822-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928190400.3908822-1-daniel.turull@ericsson.com>
References: <20260928190400.3908822-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|DB9PR07MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: dffe7449-a888-4582-6963-08df1d934c13
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	xRtMuvSky1IcVMU9CHIieaKsBE/Ro1lOpmc+/H9pT5FdRY0MxDqanXMMmqhZCBmrVQbsaa/QUT1kMva6wveP54olNghoB8FP+CdfuKMNXbXXOX7eKjyas+FdCruG8bqKly6KkP578d3hrRozER+KXvW0dkZ3aGYTXl85eff6kF/CG+cOV8tOnyQqOjW58Q8TrDN707lrK/Y9ssafmzMq0QHuyAMP3bfNVgZaX6xPEaKYfhiT7YDs+FUXdi76OFS1sYjUAFDxF+aOd/4/sgwR7midpDyFzy7LcRFc6sUneMJ+afwbVXAQ6NYyhJ5VAqfGTOZJ36olvf2/03PAT/FCJBmYyJgrhddeShtRqJndAp18qZBXHH0GlCkU8/fnR8SWH5bNCogps7lEQgaz1Haoz2r8LdcRL/Yf27FeaM2FAV9y6ra+smiWmAWirpaQVoJZq92aID6kyo1zhyEJZ27UYjRZ7mBuWNYsZh5BoUdhRJ6F/nSyCnBP9JyUKF0D50RJESgDY1Ac8dAO4/tzMTW71v0XTLGbNcZIOOWgi1dEDeVHeiDya+z0VUiAVJac9ViEkdcGNO9Ap51wD7mD+5Km6OVh+ot5kduPeLNKXMntSMu4C8YsXzgrDmC5A59fjHlqSei0axZn37zb2gFKNOv+aUr8zPjBMgVQNfkWegijYtK6e/e2oMbENTO4tquFglkeEmE2qCpyXNtulM98Ckhgdw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2AqTrtWek6keUqSsGzbUZWQY9+SOR82GaPx8A3FWfNcU/4l0aLAdi3++zPY7BMWDu7lCAbal5TvLI2vfhoLPrJGfcHZJplOZSLz8r1rYPl3FH840F84URTvjnGdNFBwH2ChQBmAY109gRdMjitk3KhxnAEFFDbDINxalxeviMzg6o4jQUt9SdUnbEUUZuTzb7pZM8RVeqc2bYLg5ndSjPixaKULcvMtyQV9f+YnekHYmtjUSgRuEoTaD32tx25TqxzsHnRyYtOwfZiR8Ker9bUMmpRijmtkrFF1+aGJpsLZJD/bGWNMUbEKhWN8dXJKaxlgFkdU9qMDJyGG9QFBOsiizdwvfQZ32v2lkY+UtsAXBrXknjn/hAe68tz+vQVnvtnMqWP8T5kuW/QxS+zVOYAGGQf1pRaFiBX58K/vwG5+H2atnr7NLu+NS/ujBnfMX
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:04:18.2847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dffe7449-a888-4582-6963-08df1d934c13
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7770
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246790

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

