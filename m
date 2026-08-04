Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448EFC55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:02:26 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10518.1785823344544021378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=JhV9RQ85;
 spf=pass (domain: ericsson.com, ip: 40.107.130.13, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obHeaB2jjrWkSPNnXaRUbdg6Yst49EFQlSJ/0dJ6NUJb++O2Vo+q7eE+u4VsG+OOAla39VPkn9mbIMDQt8ImqS4WMoTimWvoQhD7eyBI7KXh2VzafV+vGejtlBLKCYkk6E46XewjlN/8FBdBa3JwJZJSnq4hskfup2MLqC5vkq4/6RYVL+Hk3UvwR9qiGFsTJmT6tplt1Op/Xi3IMTAVpLH0ZT2zhRnpvLCsY6oYhst5mB1FMq/jrLEwiTtVlD5XcfL2nm9zSDWJ09WuMXoTqx9TFwRku22GDDwvB74TTTpuSC3XTHeKMb/H2x9zOWCDN4Wa3T+zoZEoyRjPlpw/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLk95ay/TXPzb/L33O0zGKj1VEPKFSV9Inft88qesrY=;
 b=huRJIw1HURL9yCGyfqeSLE5WiWwHhPtEOgvP60Iu523utk4zPwcdUFkn+YDVSaIs5l44r2WDgycvZED9l5TLMpbEPi9B5mD2j9ZpEOL02Z+gM+S/llO773u++MIUELX1o7Z2xCIYacQBDZ1s2iZqpRzEZtIJHG++IXqfAmooqLwWnK7yQ4p1WmYkXtMfS8Xw2YNWOkeTy+OPyQ6+ZQGxTraMn+2bDmqC1OGxPRq8tj/5k/T+w5/33ZQlQ2KZeZScqJr6nEIZrpJ6PkBbBMg/BF6WVQHGUuV3cT7BVJqlG8RYYz6GQQ7a4PJhN5weHmpKmLq8OhD2b1mj0Wguxz29MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLk95ay/TXPzb/L33O0zGKj1VEPKFSV9Inft88qesrY=;
 b=JhV9RQ85Iw4z1y0XBsrjDYyMoNveuoK1kRmUMWlrN5weM8sBqiwkY7TiEjin0Igeck0CQGFW/UBLWbzzq0QK2dkv+gkpRsn+kFVyoDtD24nk0dRTQfOyz4qr1Bc0knIMJ5x6QQhjHqcD6oLJyVrGJoUXjI+2srIu5Gh5+fjz8DcKdv2qA6Ufi9mC9o5h8uzSgTUhezI3BMxn6xtJTnCUwL1Deaw2ecLbtffA8QKPf1kjMUYpR26LlShQyYj7PW6G9+hlAXGN6/CyfySAJMZqtrUv75KuizLHPVLa0Q/KrZiysrxwfoMgyJ6EnvxfipNnl6ZtWbFy1SpEfBj1EGyQMQ==
Received: from AS9PR06CA0308.eurprd06.prod.outlook.com (2603:10a6:20b:45b::28)
 by AS8PR07MB7397.eurprd07.prod.outlook.com (2603:10a6:20b:2ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 06:02:18 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:45b:cafe::19) by AS9PR06CA0308.outlook.office365.com
 (2603:10a6:20b:45b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 06:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 06:02:18 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 08:02:18 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 114E14020B46;
	Tue,  4 Aug 2026 08:02:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id D4710700DF4C; Tue,  4 Aug 2026 08:02:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 3/3] devtool: upgrade: diff git-log-style changelogs by commit hash
Date: Tue, 4 Aug 2026 08:02:05 +0200
Message-ID: <20260804060205.179715-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260804060205.179715-1-daniel.turull@ericsson.com>
References: <20260804060205.179715-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|AS8PR07MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: a579f621-2559-4db2-734d-08def1edf102
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|6133799003|56012099006|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	L7Umxt/UIAEpdd6fcpD7f8/G5fpnGg9YADVHHndb9v/1bryWvReoYDDBIxFP5FQnXHVdN19EQgCsMd5vOgxB5DZ7jsKRkDhxzRrqa9+9xC9rWxgRtxE81T/PCprVLe/e4kxfdxlfFKteCrbs8T+vZDSmDw1dWcOtxsLW2wGDKG83kDPRadrIPmvR9fKcmM041M4dotcOmseL13OMpmiHHUzfZIlWHUOhcjAYwO1CNurErhvEaiBMtAJhjXvNBWS3BbxUTeJVnpVZIbLsRZaxxw706nnjm/ZOhy9lsA30ozcVzG6GzUtRuumz9OvcmkC25sLNPEQcr/GC8NLI+Uf+kyNqUfe6TqyMabzUlE23DNo5hXuTd71pAkmiSbTdgO302/l1/PdmwOvTeIW4bBW/0VG+xM1OUcvekoTSUiGFGeumVm2W1DWxTcGljaDIF/uWXBjRBJpECVX+fCO6R0w29GcDl5AUUAsmqoEkUxhM+k6peUndtvU92grV8w/nUei/h73GkrvDopxcqYzK6ktgiO8tKY1BF0gNujGdI8Gia7Nvl29suVbp5aEK4fIKmDsDWTPFIeC5v5NQM38+YjTo2fuqGraSpePCKG/8o3MSwU5ROe3buo596vFebkiREIfrGfWGwDmXM1tgUrJX8DHH5yfp3PwJR4Q40K543zq++4wiejkwYvp1HAu7le6gAyN3PyPRo35UBHKQPVU3xBYFAw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cB8n8N4qLvCE5xdbuZ1mMBTOI5rSMf+3hbEIdRLkEgIHgdb25lRUW3E5w24lnEjI857G38wDqbY07Fg/hTBoqBCa5elD1bHUwg8IT7ujdzdpCpfVZ0y6f0Jwnc1sO3xbBQ3qlq0ik3umpcI4ujlkYZkXWgqBwAwH1Jt9DhdV5w6UKQv/NaGCMSGbNlKeDPRo3SsNLe4/MS/Z3WvozFCWqA1FTMS0T6svggyQwi8igI9nWqxFaPJfAlAPQqdADmZNM4U589n2bj0YPw6ewVSh+T2DslH829aw5hAFkpM6beP2Fb2aFjQskq3NOwQqmCeDqeOfcT6Ibi8qVX9DMtlDdw8vBJpFppHxJahhZA1kfPH+fz2xhBxDpKtS+8XlXaDaPOwB4ozC4dJpluoRJciJ7kFZwI+eXe3Xx9tcEjHzFdUrKUgNEYhj9W2Lhzp48U+b
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:02:18.5615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a579f621-2559-4db2-734d-08def1edf102
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7397
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242697

From: Daniel Turull <daniel.turull@ericsson.com>

Files like nghttp2's ChangeLog are the literal output of `git log`,
regenerated wholesale on every release. New commits are prepended, so
every existing commit shifts position even though its content is
unchanged. A textual diff sees that shift as removed/added lines
instead of showing just the commits that were actually added.

Diff these files structurally instead: compare commit hashes between
the old and new file to tell moved commits from genuinely new ones,
and report the subject lines of the new commits. Falls back to the
existing line-based diff for changelogs that aren't git-log output.

AI-Generated: Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 64 +++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 6883c99cce..856110c803 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -589,6 +589,43 @@ def _resolve_rst_includes(content, srctree):
     return ''.join(result)
=20
=20
+_GIT_LOG_COMMIT_RE =3D re.compile(r'^commit ([0-9a-f]{7,40})\b.*$', re.MUL=
TILINE)
+
+def _diff_git_log_changelog(old_content, new_content):
+    """Diff a ChangeLog that is itself `git log` output (e.g. nghttp2),
+    regenerated wholesale on every release. New commits get prepended, so
+    old ones shift position even though unchanged, which a textual diff
+    would wrongly show as removed/added lines. Compare commit hashes
+    instead: hashes already in old_content are just moved, anything else
+    is new. Returns the new commits' subject lines as one string, or
+    None if either file doesn't look like git log output."""
+    old_hashes =3D set(_GIT_LOG_COMMIT_RE.findall(old_content))
+    new_commits =3D _GIT_LOG_COMMIT_RE.split(new_content)[1:]  # [hash, bl=
ock, hash, block, ...]
+    if not old_hashes or not new_commits:
+        return None
+
+    subjects =3D []
+    for commit_hash, block in zip(new_commits[0::2], new_commits[1::2]):
+        if commit_hash in old_hashes:
+            continue
+        # `git log` separates headers (Author:, Date:, etc.) from the
+        # commit message with a blank line; drop the leading blank line
+        # left over from splitting on "commit <hash>", then skip the
+        # headers up to the next blank line to get just the message.
+        lines =3D block.splitlines()
+        while lines and not lines[0].strip():
+            lines.pop(0)
+        blank_at =3D next((i for i, l in enumerate(lines) if not l.strip()=
), len(lines))
+        message_lines =3D [l.strip() for l in lines[blank_at:] if l.strip(=
)]
+        # Skip the 'Merge pull request ...' line GitHub adds as the first
+        # message line of a merge commit; the actual change subject is the
+        # next line, and keeping the merge line would duplicate it.
+        subject =3D next((l for l in message_lines if not l.startswith('Me=
rge pull request ')), None)
+        if subject and (not subjects or subjects[-1] !=3D subject):
+            subjects.append(subject)
+    return '\n'.join(subjects) if subjects else None
+
+
 def _git_show_file(srctree, ref, fname):
     """Return the content of fname at ref. Changelogs occasionally contain
     non-UTF-8 bytes (e.g. Latin-1 author names), which bb.process.run()
@@ -642,15 +679,24 @@ def _extract_changelog(srctree, pn, old_ver, new_ver,=
 old_tag, new_tag, workspac
             for fname in changed_files:
                 basename =3D os.path.basename(fname).lower()
                 if basename in _CHANGELOG_BASENAMES:
-                    diff_out, _ =3D _run('git diff %s %s -- %s' % (old_tag=
, new_tag, shlex.quote(fname)), srctree)
-                    if diff_out.strip():
-                        lines =3D [line[1:] for line in diff_out.splitline=
s()
-                                 if line.startswith('+') and not line.star=
tswith('+++')]
-                        if lines:
-                            candidate =3D '\n'.join(lines)
-                            if not changelog_content or len(candidate) > l=
en(changelog_content):
-                                changelog_content =3D candidate
-                                changelog_fname =3D fname
+                    candidate =3D None
+                    try:
+                        old_file =3D _git_show_file(srctree, old_tag, fnam=
e)
+                        new_file =3D _git_show_file(srctree, new_tag, fnam=
e)
+                        candidate =3D _diff_git_log_changelog(old_file, ne=
w_file)
+                    except bb.process.ExecutionError:
+                        pass
+                    if candidate is None:
+                        try:
+                            diff_out, _ =3D _run('git diff %s %s -- %s' % =
(old_tag, new_tag, shlex.quote(fname)), srctree)
+                        except UnicodeDecodeError:
+                            diff_out =3D ''
+                        added_lines =3D [line[1:] for line in diff_out.spl=
itlines()
+                                       if line.startswith('+') and not lin=
e.startswith('+++')]
+                        candidate =3D '\n'.join(added_lines) if added_line=
s else None
+                    if candidate and (not changelog_content or len(candida=
te) > len(changelog_content)):
+                        changelog_content =3D candidate
+                        changelog_fname =3D fname
     except bb.process.ExecutionError as e:
         logger.warning('Changelog file extraction failed: %s' % str(e))
=20

