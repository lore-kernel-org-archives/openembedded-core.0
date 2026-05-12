Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11949CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:25:13 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70363.1778570703584944562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 00:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Nyg3bspV;
 spf=pass (domain: ericsson.com, ip: 52.101.72.45, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8mxa4RvKDZlFdABiAcktYdpk2oYZ6xyNY1fwcibq6PuxrKJbvm8VsiSonlcCdU0KzNQ0GX7SSXBd3gmSYf+tdhM8YPQZon9+/smNfRp5dWFy04dI8iUJui/IcXYy6fWo8ZbjvHAMzXMS7/rrVVgHSZ+4u9ZNA4sepuyPVde1h7eik8cRop3O9jG8rTtHvKfOofNSD48aINCanaWOw+cAd9kxy2ptKuxE4m/0UVEDyCnqrVoZRIDcwcGIv4qwr0PcwH37wHlKs/pIaexn+BhA5EV4/ItC/m4pTzTfjff2zmPXhvDkgoQyr5TRrH5s+R7f16Tt+wdXbOzokEsAi0uAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=576zrtLv+8qiVxlrCfjBwQ0BfvjDu8jwccK6V4+kkSQ=;
 b=Mb68rhD++Mg9oMatU1TNHYlgifVChJ1/3kSbhp76oKZPpxks9Alp6wIaUj6Q4qP3O4Dd/wLVgl8VNqGGZ+RaVG7m0hNVWNl04W9wF3WCbWk6pgc2umAUbY19kOOwiFKbr2cgarMRetznEKPsVNfgeC0W3rdlD3hzanNlukzdSmtkNx+1QAIueebnrn2qLWBD2lfFB5zfyyGZPCBJvp+BtfNoaivHo7W9v9z3bNKfMtdFIJBlUkWjVzwpm9e6Ud5iIptT8sRGAY8dLsBL5wqt5cPpwAWNTm2eCNBBjJPNFP2j9Y51Wueig6v9bC3J73Ud2pxan4wBnpsVw2EBF+MdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=576zrtLv+8qiVxlrCfjBwQ0BfvjDu8jwccK6V4+kkSQ=;
 b=Nyg3bspVZvMEeK2t9bfHdTyS6DYf71iXuhnirBsgdw3vQuCMACguOjWHm2lWEG7pbeF14+04MiEb2VZ9qQpcxcX9JAD4LpfDOpPWs8pSsPh1nBcZNCmK7MA1oBl6p+SakQFg66J9jHi1bTtLF3SVG2qn6/Dg7DZsYxmE5DVNlXIYPkHENmYXuf8VDJFmtChJYHhUSuGoDIaiR4KKuX2u2ITTM/VQVKFmWWX62SDffJM72aoxjHnfKTAwc7a8+sv9wCUTu7OaSYwz06zCzvba17O/A/6UI7taYSTRmpEm1TckAoqBPKPKQL4WcH8JCSgp/137DCc2Lm+CH6fLiQN3BA==
Received: from CW1P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:293::13)
 by GV2PR07MB12239.eurprd07.prod.outlook.com (2603:10a6:150:366::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Tue, 12 May
 2026 07:24:57 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:400:293:cafe::46) by CW1P123CA0003.outlook.office365.com
 (2603:10a6:400:293::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 07:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:24:57 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 12 May 2026 09:24:56 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id DA0D74020B41;
	Tue, 12 May 2026 09:24:55 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C0C5A70002E0; Tue, 12 May 2026 09:24:55 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 3/3] devtool: upgrade: clean up extracted changelog content
Date: Tue, 12 May 2026 09:24:46 +0200
Message-ID: <20260512072446.2323529-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512072446.2323529-1-daniel.turull@ericsson.com>
References: <20260512072446.2323529-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA1:EE_|GV2PR07MB12239:EE_
X-MS-Office365-Filtering-Correlation-Id: 81158724-6462-4b54-cef4-08deaff791e1
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|22082099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	ESkkdgtjN7RtQc9FQrB+xfcHPQpYJCl7CQGcFY/8WT3tI3XciKGBYaRxmGglKjMHtFXPDEFID4yL9JID6SesYPHmp03PnoJET5E1bmxehS8UPifzrGqRu66JzURQMTVEVT1XVXnbgn0i8aVCAnVTdSOhvud+0v0gQKrtRFejto2mAZ2rNnkSZxbbQCT4fEnYreiiQW8i0JuJuSESexr82uNKgbft+xXsZjX7MIAGgdbsKWK4ViSdM8iNga0fgL0CZpMaSttFrVdsEXHrSBIox43Enm0Nyc8ayJxxaQBaCaZ4kbjeA4rzXYiExavXR5O0CqwztBpvjZ4MOdEyvRf0GN3b7Laxh20aWXNww6T+5grbXlG2AEV+0UIPWSXdbJV5bfKdcBD0rqmtRBSoUTF/9UrJga0BpetFD9R/SqKkw9yNIayPsnY3ZbUx5/imaZiUqLtrb379kws/GREFTB6B/3nyLLbFIog65mx71SoEM26WaZngl6YtUQyDrMXuMkbc9BNRZqx71GdvdcqGvwhRAVWGjy5kg0slfU7I6UYaNQK61r/tixf2kQKgy0TRfXWLNupM/XLaUspfEvOw8zfKbhjIL1hgV5AgRDAx4UJfi9AWQ4L22C07u/iacmAhhzP/R5eNCQwHNJg+lDVQ8gLYfnIOm7yyEvsRPbl9w9i60bBzwAMhBGBpKGLCRhm9QBdbyiiIKenPbSQ56vxeW5wd7lQFaEgCfQwNkYv3oKIIvg8=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ShzPBrsUEkO0hin8Fv0rEOmcq9rAfVUdiESkEw9v5Bmv41/sjs8e4VtD3C86vd9Zn3Jm7cjtWDhnISUX+ryX3KP2+oZPsGYrxOL0AhRBb2l4u0hIYt8s073rSeIfrFGxPhYuGKMdR+4ey6f28Rjwgcu43kebTyGID56BuqCNlxo5FZ3MRTVjK3lq7LuYKz4/phgdjCnkmAedI/wFAu4y/cpyRkLtS0fabkJ17Vt8aKL7mLulLphDsVKaCTzx7W8alIt/RgKlA6q2HmBpL2k3IxwzhR9/QHKY/J6qu43guZ28DJlusVmQSoKntgbahOCQPT+afjoWDy9wQR2y9kOLlliGU26C1+Ad4xO1GbXdgVjUNwO3djsXvGTMs8poFGOKTfpkWUB4gkM6+LuLo4kEyG55i6SWASl+G5IzU82o8PBLjkTaMclKF1EG8LMQsA8M
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:24:57.1844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81158724-6462-4b54-cef4-08deaff791e1
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB12239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 07:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236856

From: Daniel Turull <daniel.turull@ericsson.com>

Collapse runs of multiple blank lines into a single blank line and
strip leading/trailing whitespace from the extracted changelog. This
produces cleaner output that is suitable for inclusion in commit
messages by tools like AUH.

Assisted-by: kiro:claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index f2a2c8a6fb..e37ad07ea1 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -597,6 +597,11 @@ def _extract_changelog(srctree, pn, old_ver, new_ver, =
old_tag, new_tag, workspac
     if not changelog_content:
         return None
=20
+    # Clean up content for readability and commit message use
+    changelog_content =3D re.sub(r'\n{3,}', '\n\n', changelog_content).str=
ip()
+    if not changelog_content:
+        return None
+
     changelog_dir =3D os.path.join(workspace_path, 'changelogs')
     bb.utils.mkdirhier(changelog_dir)
     changelog_path =3D os.path.join(changelog_dir, '%s.txt' % pn)
--=20
2.34.1


