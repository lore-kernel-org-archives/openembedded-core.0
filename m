Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDB9CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:25:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70054.1778570701683663449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 00:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=I6c/V2IS;
 spf=pass (domain: ericsson.com, ip: 40.107.159.27, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbTIna09QkrC8WpP0p2NC+akER0C6JqYRpSCjE3XMQs6oLSffW2E9wzbl00y/wYcfWW6jMwDRwqhJEAHvbbhtvjOsqCQIYzc8Pmw/42c+XdEUsxISCGZA9asPWmFuuYEv2L8FM+YwwleQ54cNSQLA5LHxdwZ3+7TsnrnlhjZOP8Fpjzbxbm1/anMLAAbEvbc9GlHUXfCBS8lupBfw+heWmZydUJLs3T61kEBy4aFxG4NhJRGfVVeJXvp1SuYv+urB/u6JsH1hFE0WhEzj+XaHEf1pEshN9wsTSoMpT7r7GGBVdE3C4wBjaq+K/oYYR7u6EwOdNsq5gcWZpMSIISVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhq9yQAMOfIXqgGxAO2tfnLirMh7VWf47Gs9SXnc/QY=;
 b=GBsRYiYEnJ9EVVsXMnDJE4Glda/YM91W9iOY770QFucFeQUkXNkjkiq7ZFkvquiMPrzjkEYT0JtyP0jvjSRSVy0GYTnzGcQ7t6n+nd0xKajLOdDpBvRbGPc7k49TWi6DoFPfHmIvitHs0Ge32mUJu1RwtcEfy086t0jiIC1opjTNAVakw21exuprOMfNBt3ail9Qat54EDv+P2trVfFP1x7bEcWMb1wae4RwJeTjYFZQd9gyymjPD30NPTjdeaTXoHTg94/N4c9kMJ8eExA98F0cVXAtB73kSLJEYMxdQ7lJsw9hXM1hQcKDzv8IILj7gcyG151hM7b1p8cWttJzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhq9yQAMOfIXqgGxAO2tfnLirMh7VWf47Gs9SXnc/QY=;
 b=I6c/V2ISN4niFaI7hAhN0H+wXwzLjFEdRkXdEaav9nmynUJSWA+2OdlGF34ZfgZfpb+X2NsQfD+c+R8xJzdLE4EkNqIT81W+tOKWm8NRQUDz9i5TZs3TnhPbBQDHRF+vKzkKpY2hpgrvxhInfK1qwkc30uv15cWZWtNrCF+XhXHwYJox9/4QNt/jBEBB/2GsVSd+JLb7hX1PUgKG1bMLP45A4Qbzrv9XKzUubmXj7WNVij0A7JurrMEcRBTQyaJZTa+GH98oMlgxmRJ/Tf29NQ+jI+jolZB4YTxDTYZBUO6Ayt2ju/DjYTsyBpPvGowOeiCP8RTFjW/7r7tt5GenzQ==
Received: from CW1P123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:293::7)
 by AS8PR07MB7174.eurprd07.prod.outlook.com (2603:10a6:20b:25f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Tue, 12 May
 2026 07:24:57 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:400:293:cafe::b) by CW1P123CA0011.outlook.office365.com
 (2603:10a6:400:293::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 07:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:24:56 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 12 May 2026 09:24:55 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id D049C9569F;
	Tue, 12 May 2026 09:24:55 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id BCDF27000584; Tue, 12 May 2026 09:24:55 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/3] devtool: upgrade: detect per-version release notes files
Date: Tue, 12 May 2026 09:24:45 +0200
Message-ID: <20260512072446.2323529-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512072446.2323529-1-daniel.turull@ericsson.com>
References: <20260512072446.2323529-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA1:EE_|AS8PR07MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2a3567-30ec-4844-159e-08deaff79162
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	yrxaPGX2ryatjW3BcWK1IKzTNlFvvjni0EbsPN2cTAm3Bxq6W+HeT6sS5Vvp1yTelxYcgvzo2geGFsXJN2yT4wwh0pqYFVIO7SxYMyJvDSFtHF76s7OerilseLLtZ/A/JR+dR0J16l6PTnqJvXpzo3wJI4Rejm/+J3PRSRT9Ya7VIOcKrNnK0gwTL1mrcKapeekhAzb0xn7TAb46q+DjftHTQ+/dEp/O9cyifpVCukwER2G+7NcmXukjPK0F5+KE+Kqjiq3upF2chdNPUvkOqFZV5l65DaD0x1JgRpdAVmm2bb8wV5iDG/6cYQ+Y73rCTq9umidgWVVyOJ3XTxorqf17bUQjx49tpi2KQC88aRVhZA/k7MoxArKRGD5Z5bQs7HmnGN5W1ayjcPJS91Q39ZQxmXd6tKjhqSHSHazo16bpLmrBPgsEh3r1Cyk8uN0ihDND5GAR6AfsLix5J+D8l/fcpEtjdbnFQanGdPVUzUOi6GlRVmZoa5/sRBpIzd2VsuCYAin+Jgz2mrS4jYT9nAlJCZgE0RL7aChAWiK+ZHnXztR7KlnDxNCBvG2kW6TU18M7UOuMrEoOAQnDt7SMlDRnEWfxu1r09e3oeKkz/c74ATm2/EtDSUdDYihnbMaQLQRdRdRsOIiQofRbjEgDQvRZKO0sVU/v3uvkScozWdBw28q10KjW80pGeKFxIlGS4cDSjOMoKV2TCfyixJsW8OhTBvCvBZQcjYba17A+zlw=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oKDU/H1kwrWVKbcvd0gaj9jznY05p5WF3gjzv/18vSPhcEXABLMyyxAzyG42cssSiBJMzG1CaQwXRpIZT4Wej0aFJWUCj4fdeYwtBuu2eMc8ZtGVgYSzJFlAUGYtJStNV/+l/SgtqToae6HL2ho89H8DnZvecaH8Y9nnroW8dlYcxTtu2wbth7gEc6qhMyvefmF4yjXRhe+DCjJTHC1n/I20ULL10DyJEjdo8O4gkePMqiW4RsAZ5jE84ty/tH1qT7wDzRyJXnz4sP4a7QNp55lc8/k5HKJLb3riZmDoHb4Fh14GdChL+qYu+3yZIbsKl/03ai3wIfnO0KDbncZFV8yp+S0qSmNnDv1+cJlug3hmJu2p2v4mXe+Of/F3+xSNSXPY6TNwnNHDtlFapMWwNGOK31eBr8uyrGFRBZHg3vSwLXSV/pFxbp0clkg1lEFN
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:24:56.3477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2a3567-30ec-4844-159e-08deaff79162
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 07:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236855

From: Daniel Turull <daniel.turull@ericsson.com>

Extend the changelog file detection loop to also match per-version
release notes files like git's Documentation/RelNotes/2.53.0.adoc
or mesa's docs/relnotes/26.0.3.rst.

These are detected by matching filenames that contain a version
number with a documentation extension (.txt, .md, .rst, .adoc).
Their full content is read via git show since they are new files
rather than modifications to an existing changelog.

Assisted-by: kiro:claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 6adaf5185e..f2a2c8a6fb 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -576,6 +576,12 @@ def _extract_changelog(srctree, pn, old_ver, new_ver, =
old_tag, new_tag, workspac
                     if lines:
                         changelog_content =3D '\n'.join(lines)
                         break
+            # Per-version release notes (e.g., git RelNotes/2.53.0.adoc, m=
esa relnotes/26.0.3.rst)
+            elif re.search(r'(\d+[.\-])+\d+\.(txt|md|rst|adoc)$', basename=
):
+                file_content, _ =3D _run('git show %s' % shlex.quote('%s:%=
s' % (new_tag, fname)), srctree)
+                if file_content.strip():
+                    changelog_content =3D file_content.strip()
+                    break
     except bb.process.ExecutionError as e:
         logger.warning('Changelog file extraction failed: %s' % str(e))
=20
--=20
2.34.1


