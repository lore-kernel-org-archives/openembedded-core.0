Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255AECA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:53:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11542.1791806028360669853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=lpZaEYIV;
 spf=pass (domain: ericsson.com, ip: 40.107.130.50, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySuAPs05rnh6xZep5Yjo+GojLVHFUpvBpgS4+NUB3s2Tbi7U3ANgU5LBm3Te7QKOucjO2TH9i9aYExBlBu4m+UGcg3tErycamu5UvxSxwyeanhhogB9i+PWBwARmGG3IU3tmsLBmr440y3Q+gBg7iSYFTSeXKLQWgqB0MtsdDj5GIu94trT2knI3K1zZ46U2oUBVJTun+H3MfdraVnd6ZwNlS4Cz0PcvIlN5G6ZMJ5kCxcHHKHxOrhe7VLu1Srtc7vISag3z1CZLLfmRFqw79/sEdC1Lcg6HgBx1RRBscVQJCyRsRWvCfIXJJZz/VrohCzpANuxF4frKWaRL/yYuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7EfrB5X37dWayq88Eqa9sWYIr4qXtfB/GbQvvDZmaU=;
 b=rSljUR5vEaVPbTWZ/4tYdAXpq28UhJX290e0vez6TQCjGcTwFGE+gOc2gV8bWbPyMJ/XS8sk/NS6ZJwsgHFKAN6AY8G08p5MenVGQ7sdxQ5/xqW+JrTdZJ5Hrsm7cgM5DDUhXYsqfhPsnB8djguvR81xljDcMXFwklSrw8oRFb92/o7TovbEZR++IfYaWPLJ7jStX61vVlww5risI2366iRC/g4NKVl1guD6eXvJ1FAXMnwb73mwwTWtdtIU3w5DnpHXepjnHjiLf6hQKvraJXoBY6kOi8ymmEPN2pG09A5R4M7STRLruVwvqAzWjRwbieD32PuPVEBYujm0XnhKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7EfrB5X37dWayq88Eqa9sWYIr4qXtfB/GbQvvDZmaU=;
 b=lpZaEYIVc2gJjpwA8Ul+IDzVkFgldXcTPaXzurpgeIMlv9Ih+IvtlYwr7Z0WG5w+M9xw2u+qaaVPzeYkzoIeTjIOT3IQt3Wq+kzjrBDVDthzy5uG5a09d2RStbbtsFHAlzF0vUeSNn64NWrH9qUC4r4grJ1j89av47ygxH/7lDvDzEY568StPdPQb/n25kr3DPSHiIom6iOu0/e+aouUYzVFaBGQlj4qGv6Kq45hNahrjIyU86V3wSlgj30ivAxKzoThCds5sFlrSQpZG0lG83qNPAU+MlPAC//95wmnI6Sex1MP05O+II8H/nNNl52vse9WyPUb4VZaLiAOhhx3ow==
Received: from AS9PR06CA0752.eurprd06.prod.outlook.com (2603:10a6:20b:484::7)
 by DBBPR07MB7675.eurprd07.prod.outlook.com (2603:10a6:10:1e8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:53:42 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:20b:484:cafe::a3) by AS9PR06CA0752.outlook.office365.com
 (2603:10a6:20b:484::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 11:53:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 11:53:41 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 12 Oct 2026 13:53:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 4809C4020E5F;
	Mon, 12 Oct 2026 13:53:24 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 17C46700E7CC; Mon, 12 Oct 2026 13:53:24 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v5 1/3] classes/base: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
Date: Mon, 12 Oct 2026 13:53:17 +0200
Message-ID: <20261012115319.1704048-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115319.1704048-1-daniel.turull@ericsson.com>
References: <20261012115319.1704048-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|DBBPR07MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: d2398daa-4a93-4c5f-d352-08df28577639
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zeCfVdWDtd3FXFIEhDsdqljxyW3C23UxHev5laAJGUUxxNoXE3pWVqKxMb2197SQ10T57VPfiOdyvnikJNuF0xMtBJ7Sl7MgnR1qyxQcgpAPlfpz3ZwcIaDZUE/ntNEBUdfEhRVhMq4eJzB5bMYxLrUgYcBSTqCfaUYROi++JEgPjT5O0gtQK7AmrekJ7HIgoMujrHtfprWKjo6EOBwCPpQTQzvWjMspmU+BXDAywrJ9xEI2NFh6aeiXVppk/YiAGjAN9qm9GblgjMF086bvtk0AbsGFGDPnjS4wFe0vcDC1lnYsR0Ak8P3DaY59tIEiLq1/pKIsihgBoJ12Oa/ConA02GcM6BSzpTTyvKszJHFXJWp0no5mSdXYqm7hxiJC5iCZrMzsquXWjhyjn0kz4e4rK2XlalrWXv6EYnEf/A6RVi3kkbXpMND7n1fZPfZwTwfFadppOXodz9cXdU8chKCOxrK64Qt1lmsmTMktvr/t/eRlrZQg3QO4zJKOS8J0yk6HURH1r9fhkf3KFvB4DMs1jPGQzgW9D6yfUsPuy9x30v/OO2FeejqWEE+Xl/17qcSQdDWxvzsVat9/003oABtA1/ugt/H8/Io+Gv/crJClJZWtxZU8FAIsuCb6oS0kKUUpARlV1I17m/TCzFKmXX3p4oVDecjxiPiu+HOtURego1St0MQELVbx9ZQa3CAggaVWkwlh5Sb2FJSRuPK6RA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2lB8K/fAg2eLX9kYBUKE2x/FTphjxAd+WiqwmhlS2l+uBZauVBK66q3IJNWuqxj5Dc7blVQU8QiktGILkGzcJJRMAYkFuMWH8YZvZoLDMcCK482/lhM7MGt63jXnIxDzS6XhJauMLXZ/0Dx+/jTgPnbdzXBm/MRF33+O/PCWRWFEGeEF5dek3xF5mwA2Z+qt2IcViOnDleD8UH68OwVQLyyY5KZI9em6N/nWTVy6e9Mk2EBhIeTIAh7c4tHQG/tLmcIsJOP2bwXVkRy0Sq66rI1kiLrDUZWHSqiwNY/a2Bd6zdL5jOcicVGJeSmR3Kx2jByiVSRKiGmEl4//Z+161C+KJ3d+HY5GseURnNpVBcSGe/T3rLCL8C8cIBJiWj1mZfqWdH43oZWTZNa2JS0jytYvHlo2oGqcnu0pEEVnBl10kD/AC5m3eaaSDstkCpXh
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:53:41.9839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2398daa-4a93-4c5f-d352-08df28577639
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247642

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

