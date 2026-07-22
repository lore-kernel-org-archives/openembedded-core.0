Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B622FC4451C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 07:33:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42700.1784705613526053339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 00:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=bXQa7ycz;
 spf=pass (domain: ericsson.com, ip: 40.107.159.21, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkRL7H2Ts0VO4VXTWaVsrgupxHA2VQRXOICQcQ5Rudl1M4UEn22uQscKq1MxE+nVBSJiwYbGHUPUcereXM19EqoxOCSgujyv25bcMVb8qvQ96P1EFNBqwYbdncwPqczNWvaUnKH0I9d2O7HUrrKU8O/xxr+T9BwLZ7cBYV/jgJwVxN0hLIIoJK2PB5QsM0Pc/MMbggA+rzo2VWyvxHiIU6AGHkEz/okTwgQvGl8h5RRqbiyv0kiEKigX1zwu28dN8pzUqaK/kI6tnc9KsJMXz/4+Z/QYOnI/lqCeidI5Q+6XC1vfycrh6A1f/Vckxc3EVFfWF7ZEuY6PKPdoeK0pRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwM+c+W3hVQOnXymw/ViBkwW91Qs25983E2gmQyw6dQ=;
 b=YVODvPz9VklKMBbU6gOzVfF3Kgof+zHH7ngqEECOG6ilWfRt9cR6w71WUnR99wrmVbX3QcBhwcDZTYYSXlXnYSo/Ezmv0RP3nz8OV608GLVRN6YQ+NL5wuy1TuxBTIOk7z5PGmznabgPq2hbykrQ43xW5jbc22JAaVV7vduTuJ1wACQHco6ZkDXfU2GTn6m++M7s061hgpoH+Xz1x2anXrZYoBxF4Qi05oWt4LpWWmLc0mU1jBiwhNr0lKfmY41xrwSGCL3F8Z5A4ReVN6sSU8U1tmAJIUhxaVrm2BEwlwG2HTPAeOToz5GEg/Z7OueSzznBDe3LK64oqzwplcyv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwM+c+W3hVQOnXymw/ViBkwW91Qs25983E2gmQyw6dQ=;
 b=bXQa7yczRZt7203y85lU77zCNwXa8GgjgEUHrZEhBlY0aKBEB9E4VOgp1yDZWIX2Z3i2VbhbuNT1kpA2Ef8BiMqwaMMBBjJh43U57PPgbq253Sv3rVXUIvQ2xTcdYc5jRaJt3UZ9tS3kxYU1rXsXxFt4ZTa+O1YNCWdmtJWzm6mr7ipU8q0kOWaWAfi+S/b67I4M2idJTwHeXxOiRldMoLIE/X23+gp9goDfX9PZC9Pr2kXcPqwyjyEJW6d8v6nLiQbUB6cf86HtY8AczzBYThE4z8O7259n2xL+NJsTq7+xnOejIe6Qde63K6/S8k8U6kT/ioh2VisOnwg5Bc4Pmw==
Received: from AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::14)
 by MRWPR07MB11675.eurprd07.prod.outlook.com (2603:10a6:501:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:31:45 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:208:17c:cafe::86) by AM0PR10CA0004.outlook.office365.com
 (2603:10a6:208:17c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 07:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 07:31:45 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Jul 2026 09:31:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 1165A4020B41;
	Wed, 22 Jul 2026 09:31:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id D447C700DBB0; Wed, 22 Jul 2026 09:31:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] devtool: recognize perldelta.pod as a changelog file
Date: Wed, 22 Jul 2026 09:31:37 +0200
Message-ID: <20260722073137.1681672-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|MRWPR07MB11675:EE_
X-MS-Office365-Filtering-Correlation-Id: efcefa6d-0c5c-460d-9999-08dee7c3484e
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	RjZtZ1H1xowibI8HR/iEKQEg2zX/Gl/Kb0PNGTJcLAfYp7Yt4OUV7oe0InVP3cHwYQSH7ZJsnpWUGKUJtlXYPkBiOFkr7AcAJbPMzTeBCLCt2wC1YpqDGn3YLmsf/bxxW0sBNw1angBwp8jS/rwnHqzbHT4UHCCQscOPbrozugstxkl9EqzodOJt+etyYAlGG0aEpb1SUiLsEIK73JnoFwXQmigxXxWcM3fyRosvPnkqNCgoEQOcswgeQDs1bY6A3TBAR++WRkX3rwkjrQVu30bb+NyjNNU5dmAYqUYvSFLo2IuQvBMUDPoCJ3QqRF4xlM24XsRp8yBb6IhLd2OeNUwhQcqK8pWjA24fXmzs1SZMQg68M2XhT7yPprX7CwiJiqYULssWmEzrgUjQxZ/dffcmCPlxEfM+4SgQxHqEDV7CbPfiZrgkFQhG/tLfADEyF27t1mpd/1iQRE8aixpMXVllpZfrULjuaPifOuh4QFaT+IObP4MJ/zPFJlSxnR3qJ/3wTs7N9xdY/24vP2tfbEORNBC8MD0jQBtMyYBmDhMg9SGCxLuew4sSnSIqTS/p1T5aosWmKnMFasHyXCbvZ0B9+SQe1346Co73pSwAxlQBf63Nj0C31ANy+dI37c7EI2cdEVUPeHAbXP/1CsQVQZT7pzGgJ47exys5M2j0RFy6mGOVf/mhC46SsOPME5USu9dOPP0tAx2lFF56nJz0Qw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KSaqilNVbv9F2fcGnBHRuRSxF3cjw4Rmo6SugJuLxvCXtbeElqwbJV5PGxjsASsJTw3dC5ZWeXfY8cXxqB1cCFELpYFqY9oIT9gn6mBLdRut4FIYg0kZambsabxQNs/W+7ckjpVqqr6JwuytmH6wF6cuf1Kaxp4JkHlIhiwqtlU/g3OcWGBJYQOmqsw0TK0nibEaz/t+hGHQhieUeEXejJ1UwKjMBkOCCfc4BakBbFzSR0bVYGxogGLUMuSQDy/tcjnpnBzyrnrCLsXJOcHoIAGLJwsaBRAdYk2tZBVUnNIBq9MFFMnOu4YAnHkBGR4fTI5qKCjhpcF1LwaRiW1DFyHsf4mt7RkSlAP4RT2jwNasEqr2kr37Mx8vhBJmWXvNSJoIAvb98clXjJs28a4EgXaOL2jLE83AjeNZcUYvLgFjfvLnwaQlvZ4elGJNgHGr
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 07:31:45.0338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efcefa6d-0c5c-460d-9999-08dee7c3484e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR07MB11675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241605

From: Daniel Turull <daniel.turull@ericsson.com>

perl's changelog extraction was picking up dist/Attribute-Handlers/Changes
instead of perl's own release notes. perl bundles dozens of dual-life CPAN
modules under dist/*/{Changes,ChangeLog}, and since perl's own top-level
Changes file is not updated per-release, none of the known
_CHANGELOG_BASENAMES matched the intended file. The extraction fell back to
picking the largest diff among the bundled subcomponent changelogs, which
is unrelated to the perl core changes being upgraded.

perl's actual per-version release notes live in pod/perldelta.pod, which
is large enough to still win the "largest diff" comparison once
recognized. Add it to _CHANGELOG_BASENAMES so it is considered like any
other known changelog filename.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 74adb29402..13d51bf952 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -43,6 +43,7 @@ logger =3D logging.getLogger('devtool')
 # history.rst - python3-idna, python3-docutils
 # releases.md - rust, cargo (includes CVEs)
 # whatsnew.txt - libsdl2
+# perldelta.pod - perl
 _CHANGELOG_BASENAMES =3D {
     'changelog', 'changelog.md', 'changelog.rst', 'changelog.txt',
     'changes', 'changes.md', 'changes.rst', 'changes.txt',
@@ -51,6 +52,7 @@ _CHANGELOG_BASENAMES =3D {
     'releasenotes.md', 'releasenotes.rst',
     'releases.md',
     'whatsnew.txt',
+    'perldelta.pod',
 }
=20
 def _run(cmd, cwd=3D''):
--=20
2.34.1


