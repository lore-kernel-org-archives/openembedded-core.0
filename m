Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7261BC79F80
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9241.1788343179155347913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=kD5m3oN2;
 spf=pass (domain: ericsson.com, ip: 52.101.83.34, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GL7Qw3D1G+CT9Lb976yToG0iIAp/0KN4zry42zaBypc60Z5WWEe8rsEnBo1E82GuvT8R8Drl20KmseOz9G4tTQSubqmOF5yDPx94HqK6da4CuESMqrbbElvpviAfb0eMVpgIV/iRzy+zBsBt3bdtpS154LYMxqU49uu8tJ8wPuAE5FopVqId7fZB/EQOvt5TsqbUFHgCD1Md2wyvtt2QsO6RpQSe/ywYrwp+lbLLrgSFiVa04jp7UzZ8kEu5wg95IZtcgLCjfHMOoC/JmGcUDjgDJ3haGp6pnz8quO1u79WCVZbHwp4FEQw2+OvLmjPDECGWbJRmiyg3gyqqfRc8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQDmktsf0XNkQdWbeWUd0Wrc1ZU/Na9Fayym0UoMr48=;
 b=D4JgTDIiSLbGFjs8FkiFwM6/VtG3N5fqHBHKfqWrq3pbdG86iWchwrAfTeQNbonfKz/zR9A1ndkJAMabe/Ky718farHX1f1JaXOeBD9cLPGIB3G9I9jvQUelOZtxFeitcbTVP56NPvQn00OMeEviYiW4Ek8YX6qf/RWy3kii/bO7zHaGtD62pl6GnDULdhJPm470KBYaIu9B5yS9zBDZqaVdGCDBmUUIW1H+S63ASBVYvMc4Y7YexQeR/tyfD3Jtnb9dBtOjMCMRuMJEdwvNYL72+GreOB1yyjKC3NzNqS/cDUBFuZT4Ix8TorD6YE1g1mE3tyHK93tfHfm1L9YaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQDmktsf0XNkQdWbeWUd0Wrc1ZU/Na9Fayym0UoMr48=;
 b=kD5m3oN2S3gVyKBJd6ATScOkVS9D4BHpNm7wtZiylSxWi1oc/GWWZjJgFNttOSm/FpY4xmH0TJ/VvT1jh6CAJhRwA8fhUILwNveNDQdkR5w0oKMm408ZrNyNlSwB4kMkAmNjsCM4QJ22MFxWvgP61XOcgK4zDbq/PGqxCnNJ2mNx07oCfG4pEF1JxZusue0rrVdiBYcw78vzw0YjJUn6raSD5QY8aJpdofSn63geQg0an8eulb70bZSc1KQaUo4xn+jq5af9rwxmosFO8gA6+fJEJDDBNDizDtkIPF0iut3GXgI+O933uj5CfXoJHZZF8zwfRQN/pAcOu8Bm1dKvpg==
Received: from AS4PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::11)
 by GV1PR07MB8365.eurprd07.prod.outlook.com (2603:10a6:150:20::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:34 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::14) by AS4PR10CA0015.outlook.office365.com
 (2603:10a6:20b:5dc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:34 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 1AD2C4020AB7;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 684B9700E7C0; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: [wrynose][PATCH 11/20] python3: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:11 +0200
Message-ID: <20260902095920.2840293-12-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|GV1PR07MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 021f9408-56ab-4a23-fecd-08df08d8e40a
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	S/TBBJLiZdk1GWCTuzBOgHJ0fj9PerAo244zK0qPV4VxmGxW8WElvk6uohL7CWWBQBPCvSYeU4QwG29hAQ/vCV2RiR7zI2yz6QKf75GQIh0kpVR0r0C3kAGC7WHwF8qFtzRjEiubaH8Rq86mmsm6zbN3ahP3BuCDLhJcUNzg7Lg0UevV6tvWqKH+a0MhNH0+G7nOHNlx9qzwAjin49d8797MyVpsQLgN6emfx58QRoKYXCtolntnmuetDMzQzO2l+MtHgUfaFoPEQeAXwB48wwZ3ROV39od+G/IMKSOriBaR2f/LCSTOxAKO8bS+fuT4v7YvQZoukHAwNWHZoNIAVkk7reBI82mJwH0Um2kc30cD0i+dYVYyWQJxBX5f/recTYK1ao80i6ahCZHVvtYEpSssOp6Lh+3X85gzizbXnEYlU2/6qOIO0kPe8IfutEQw9U5bbRxpVICe2hsBVd4yDlPz4BhhaBrPQAFBwZnu4Ia4FeZ/JcF1NqxhetZ1SngH9rd5DVYdgAZ4awjZPXfmywSN/A/ZBXxztL38y+8qgxoeyLjvkW+ZcORz8hgMMwENKql+v/yI1+YLup6fx3q6SDWqBvB+hpq7gcVVSvoB0FztBRGOO9Kt7AiiKCosO3pcdMflZnMBgrKZE+dsFsXNNJPX6ZsAgKAR++daqr8eUdg=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nvMRW5iQlfNFY7jIJREAmwfQ/eya+ahd01vZQRfu+7XJhozGNyFsYlKxUWdk2nPCS0VdHHb+NsYuQd9Q2NqAq/SvKb458IJx1G6vsBI0b+GGAl0W/wZZH8IbluzaLXreTDfC5M53VMdECnoOEA7cSAKd+NgZ3IsV4qJDS2MmgfwNeFnKdASOwMZc5xWae9JDz66i2cQK4LqWoDdrjLUEN+IR1jMYka/VU0FDL4reJCJVQc3yO+N0qq/GfrQyL0N6YYn+SI6vk1jGeEcwk1RAuUZuqIozqScjZ8EJhjtlXuHHGK7lx5uajxd3/2/Pc/ZLUiA849nZGYkeVjO4k3owclaoFX9pcPXvDnoNev4PmHmAolnO4/+paP6QuwkT66wlP39+fh+xmMBAtt3E8wHHj/sML5nu1kFov6s0NipLnx68iB2ae5snAHotltz6wLIF
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:34.1171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 021f9408-56ab-4a23-fecd-08df08d8e40a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB8365
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244913

From: Daniel Turull <daniel.turull@ericsson.com>

Python maintains each release series on a per-minor maintenance branch
that, once released, takes bug and security fixes only, and it releases
from several at once: 3.10.20, 3.11.15 and 3.12.13 all went out on
2026-03-03, after 3.14.3. So upgrades within a major.minor are stable
point upgrades per the OE-Core stable release policy (ref-manual, "Stable
Point Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://devguide.python.org/versions/

Checked the last three point releases by category, since these are
substantial bug-fix releases rather than security-only. 3.14.6 (Jun 10
2026) has 8 Security, 32 Library and 17 Core entries; 3.14.4 (Apr 07 2026)
has 5, 59 and 46. Every C API entry in both is a fix, so neither adds C
API. 3.14.5 (May 10 2026) is mostly fixes but does add RFC 9309 support to
urllib.robotparser -- one extra capability in one module, touching neither
the language, the C API nor the stable ABI.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone 3.10.4 -> 3.10.20, scarthgap 3.12.3 ->
3.12.13, wrynose 3.14.4 -> 3.14.6.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit e49e237208a9a5074d7bbc65b748962f3ea0eb49)
---
 meta/recipes-devtools/python/python3_3.14.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-=
devtools/python/python3_3.14.6.bb
index 0a9e82d445..c10ce3f0f4 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -47,6 +47,10 @@ SRC_URI[sha256sum] =3D "143b1dddefaec3bd2e21e3b839b34a2b=
7fb9842272883c576420d605e9
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
=20
+# Python publishes bugfix/security-only releases on its per-minor
+# maintenance branches.
+inherit upstream-stable-release-point
+
 CVE_PRODUCT =3D "python:python python_software_foundation:python cpython"
=20
 PYTHON_MAJMIN =3D "3.14"

