Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D72C5AC82
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:04:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37168.1786086238878335076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=XOzypwWv;
 spf=pass (domain: ericsson.com, ip: 52.101.84.1, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqjwrVkH+ajfr14QaPXfcjHT+NsTUERNdCCWwVPls1iiCnA4el7OKWEFTkBs7glSA40dneV1iEV4NwNfLXYyJaSfpL3dJ1igxuaC0HCg4MBZZ3fXyRwj8cJgUlQIbjy+TyfoJ537Pzw1NWb+7s4ebefbIU/QSB9ey/631ZYdmm4lhYZPdywazBdrpQ87Zaf+owCCQZhd23/YV/2JzK4aqhmbPEFGOLQOXmzPFJu0n0II3ck5LSLNji5G47CjEsLiL+Rm/HjuVRMlC+Jtjf9Y/VjHFFO0iPjohV/oADsuvbkwANtECnsFdnUB+tfkFErvunU4B+sja5yD7306sMcHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6SbKiYIA2k4JptVtevpAAg+xb90X6ukyN1OW+BAJpA=;
 b=echuGipWu0YEfqPHNLYVUcmhXwgHXZHiqD2rtl0WCByj0LdSN+Go57k2/5I1ze2q3qEOc8oXno38cNJjjNopffji4MLVeNW8Pfca/XIbg02ZiQOYfPHXmTN4YYkjUu4fqvB1GsY1ElUwFCrcEzOktG17w6e1kSL+xGU/ccv8DBv3/m6Y//qfEpFPClRkR47YBOpkteiJtea3q7peiBoLs1o7PxtGR9Nv4e6j0vTXQaaaW8abpS1rlvaI7PmFCA/sm5lUM8hU01hCGsrfG1VQfHLepXxGElkxDt6W5HrvSqCKRz5FZCpkgboy65nhS/kkPUIzOjZ7PFbmEpMPvleeHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6SbKiYIA2k4JptVtevpAAg+xb90X6ukyN1OW+BAJpA=;
 b=XOzypwWvoY/fvkmipUHtUfouLfhhQBsf7z4aIbgNNJrurMAASHL2nZwzrkkc211ToVVnYMFGZigpvEzVjK0v/uOTYMfUT2PbJ26ign+WEyAaLp7MYYWKqJTB0GcO9Jq7koj2T/cqtOwf8l4TMmeLr83BMaHj5QVZwwKebrjzkxsyRX/Mg9RueTXZ5n1edy8KL0zVor5ZdZV8ZC3tYKWBjISAVr99rjIaDvlFyL2Fcr688h/URLwtAQh9Cc6uP1zMubxXQQ+Vbg4MK8QVoo8L6pscczNq5J3k8uP4D2jTwXbGjXzzNdvLnCg15CO07MJRGT+PEB4S7b0qxYM5+Xvj5Q==
Received: from AM9P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::9)
 by AMBPR07MB10637.eurprd07.prod.outlook.com (2603:10a6:20b:6af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Fri, 7 Aug
 2026 07:03:54 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:20b:21d:cafe::13) by AM9P192CA0004.outlook.office365.com
 (2603:10a6:20b:21d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Fri, 7
 Aug 2026 07:03:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 07:03:54 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 7 Aug 2026 09:03:53 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id AC9D499679;
	Fri,  7 Aug 2026 09:03:47 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7D73C700DF49; Fri,  7 Aug 2026 09:03:47 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Ross.Burton@arm.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3 1/2] devtool: upgrade: call subprocess.run() instead of bb.process.run()
Date: Fri, 7 Aug 2026 09:03:32 +0200
Message-ID: <20260807070333.485360-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807070333.485360-1-daniel.turull@ericsson.com>
References: <20260807070333.485360-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|AMBPR07MB10637:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcb0508-81bc-4b1b-5fb2-08def4520b21
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|22082099003|18002099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	3en85bVzfJ7ukK4/J8L+8TXPP/ojCEQX7AAkA8AN2bgebg4vcprE0yas+utbBHMUj4bZmvX5jkEuO8fRthzvyCYgOhgQGL9a5C9cVj7l7NS32w/TtUNvQNObojRfGbYFZo/dFxhb0pd4NCqNDD1iSjjBud484H6jvshgd8tgVfIYqDc6aScRR1NK7SbrobUlQxAaGSAg+U6ym5SiI1OCbo70H4z5oy5IQdTTG1oF81cqicw+b9BXwcpbZDpU8qpllNihYo25qdCg4SPg6k6S+Re1Nnw3SMFejZyVEuFVOHX4pKdQNgnexy5hHehSFTSI80RJElxKTfo1AEJMdWhKxVYIXNAZ7EUfCJ/aHl8TmzeVft5J4oDs8wEeSG7ZMLkSpBxk0okzFdYeYhla7VjHbm1l8XMV6/nyisp5uWIoA8X3sCdhFO2S4GUQFVISUlSbivPecG7nOh6aQUO8GR77EJMwLLT3ztFeNi8NugbQzCHIW3I4cHzG5HBGM4RoIYlMRtLyIF/UvMOfTSmBmCRB028PGQ8iHsuEeqsnEnSex81PTHbQ9e8Ym2aQbWdwm0Nntypkp8y21D+S0lIZeMqjtjuPJjl+SIfVJs1i7Qi6IdBCyoh725ZrUi8u+aS7nC9rkp5wgG7ouVi8d9WL1pCUWCFfuF8LWF+CJlAv2DMeiQkRTHkZbKoXcjx7de0GLMz68EIxnHLaO3dZ7FvxKCz4Mg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bF9AZIN/eNkIyUpOG1R3JmeG5LJfLcx7fe5e3EQ5AfTwjWCe5yF0X1i8GvDaNZUagIk7DjGAD3mKVVbqPh3frB+x2w0AwgYYhY7CDLUwgkOcp4UUPYuF5phCZ+3xudVqOM/+8Pw9hoC41W62QxuvLmU/WfrgUwieQNDrnfdSaDb1skEItOZJDHVcYIFRBAWif4Hd3RxgWh87nVH4Y/ELJjh+0B5m3traXSPzYsgepRXPBNeXFKYAVEClqJ6ZbSsEzrAL8jBx8i667fav8bWomIomGoL4iAQ0l80RAOEYqoL3aG/I2dAKIc1J76QPrDJNO0wVYTXs/RM7kjpQNQzSfkmG7NVmPXT7WRVBmeMvlKDi1FmkSBNeBwYVili0VkBzqhTqMgBmKIAsn0+T8IufpWofhFkPjXsbyGO/PjAXfLoTlAP1pBaJfsJLrgIZB41Z
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:03:54.3625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcb0508-81bc-4b1b-5fb2-08def4520b21
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB10637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 07:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242988

From: Daniel Turull <daniel.turull@ericsson.com>

bb.process.run() is intended for bitbake's own use: it wraps subprocess
with logging behaviour and always decodes command output as UTF-8. The
latter makes _run() raise UnicodeDecodeError on files containing
non-UTF-8 bytes (e.g. Latin-1 author names in a changelog), which
_extract_changelog() hits when reading release notes with `git show`.

Call subprocess.run() directly and decode with errors=3D'replace' to
tolerate that. Keep raising bb.process.ExecutionError so the existing
callers and their error messages are unaffected.

AI-Generated: Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 495a5b8217..d74ffcf534 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -11,6 +11,7 @@ import sys
 import re
 import shlex
 import shutil
+import subprocess
 import tempfile
 import logging
 import argparse
@@ -64,7 +65,11 @@ _VENDORED_PATH_RE =3D re.compile(
=20
 def _run(cmd, cwd=3D''):
     logger.debug("Running command %s> %s" % (cwd,cmd))
-    return bb.process.run('%s' % cmd, cwd=3Dcwd)
+    result =3D subprocess.run(cmd, cwd=3Dcwd or None, shell=3DTrue, captur=
e_output=3DTrue,
+                            text=3DTrue, errors=3D'replace')
+    if result.returncode !=3D 0:
+        raise bb.process.ExecutionError(cmd, result.returncode, result.std=
out, result.stderr)
+    return (result.stdout, result.stderr)
=20
 def _get_srctree(tmpdir):
     srctree =3D tmpdir

