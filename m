Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27640C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 10:04:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39890.1785751437887362600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 03:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=bLcYm7QV;
 spf=pass (domain: ericsson.com, ip: 52.101.84.13, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvAUxFKFXJusnWyFLYt9BVwnPoXnx+NKbIq/uXtJbnY0Vr9WZSXB0UwkAY11ltpu3frLs3MrrneG2O+Xd97D46xXBo2+maV19c11zbTt9qAQ2wPtD8ys0+CM6tqyvZ6EN1BN0cCWJWWohRtXnhCjhIT0QBms5G6knd9t0O0sZPdUv8MRDm1w/r/a7hoq7w1GGl0aDbfUPYftdxR2xyiir1MedHj4WuT9yqiOdSSEQJsk+C9UFSnxp157MZSwfDWfe1WoCWvdaqQ0BpYXxjEAf5aQ/EWalRv4JG4QCKa6sXIy8sBN+5RqbjJgTgwdBFa70edOIKA4BFGkWF/F+Nkwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u7HfucdEQSJpsS/iBydJ5C4d6zPjc9sy5vxTILK188=;
 b=FLjSIPjxNuKDyLElPrzImJ1iUopghc8igMKqd+kkAhSvpyP/NXlaD+Arg8Z24gdDupaU3fmgRGjkpk4AZmSIUOkgyAnQNYj79r9Es0Q5QVtrjaxuSbIam0tBQ5l0wHGA5IF5QfvX3qmWxyhoJXNZPQxmTNxGEIZO4gQrl4nYDXhht0+v6ZklKojeBn8AvLNyPeeHUhMjC0xiC3V7aJN0glWJ6hhGrNK6+yNntp+eSihqSkBWqPo/KxoWrHOqbYPqDwAlJjIJeWSCJhZUFlMGtK8adA4Pce4Ch3Xrj+BuXlW3TOYVhPwza93AZyaOfJBiI8WbkEXWp1OBqK+UAU1UzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u7HfucdEQSJpsS/iBydJ5C4d6zPjc9sy5vxTILK188=;
 b=bLcYm7QVZjUAwaY9iR4qCSXxqLZY2Fo2GSDfJiMyk+uLFEFkSLW54iXtBM4b2wUzVAfHb2IhFlQPNluAOYcDLCiNEj7D/Xp8/IcBhBfD6WVdaSukhEtuHTEk44LlSVJOwxYRxi98UjxVfapdRGDUCrb8YgFQ4jS0n/Fz2JMZTfeA7goyz5eaSwa8mJlXpJviPjFpIlnRKjScz2VBau6fC5PpxW9AlOmkGhMFyAZ2r59wCJqVpLODrDgbnK4k1DFbRa/0bVOTj4sW1Zj10vTEHAPGrcloo1RH8mRnIL5pkqABbRcE2norkhWTnTBAjNeuzQpcvTiTKWhUJykgcGZdXg==
Received: from DUZPR01CA0182.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::16) by AS8PR07MB7349.eurprd07.prod.outlook.com
 (2603:10a6:20b:2ab::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.14; Mon, 3 Aug
 2026 10:03:53 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::50) by DUZPR01CA0182.outlook.office365.com
 (2603:10a6:10:4b3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 10:03:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 10:03:53 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 3 Aug 2026 12:03:52 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id A50A699679;
	Mon,  3 Aug 2026 12:03:37 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6F773700DBB0; Mon,  3 Aug 2026 12:03:37 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/2] devtool: upgrade: diff git-log-style changelogs by commit hash
Date: Mon, 3 Aug 2026 12:02:31 +0200
Message-ID: <20260803100231.3752129-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803100231.3752129-1-daniel.turull@ericsson.com>
References: <20260803100231.3752129-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9E:EE_|AS8PR07MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6ed9d3-3e47-4b57-027e-08def146860e
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|11063799006|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wYjj1dDLrgn3i/+8MvF+7Gc8MZu38nwv1GUkncy2IxFqlyke7s81aHi9Q8cc9zSCZImR+Ih9M21bOTETisAqftw+alNQf9BJdhqSodcK5IuUf7alYsabg7det7aSDgRTDuUafxGVAUhkZ/ftD9PBRzot75Cf3ByTaXRweH3Q8abL4G0EShU9/DKqmSlDH4zSWeG/pEHqsqpsimR85W5YHwdCI0MVDRn8abAlqtJa2dybtTVgi1zV61JHu+GC7ffcNO6zFPuawM8h0Y2wgH5sboHyCEWIBrQ78GqErWXIIRBD943ulSK8B43VcRYADvTKgYIotb/NKUzLJQY/WBaevztXalbYYw98Bsb+S3R87gSyGnrtOc7jwF7V+hBHxyLf87LqNt7wo6MueXqiZ+8e5kQ+qArIlTctGACARWhND5eYSrct8DI/5QyPREVsBVvC9WSqg/ytbfi7d3majFf4Eowdfd6QaGMpvIt3QrqZJfzN49+uPmG9u269fbC4JqmpU2q9veECRwDP5epEX8ApbZr4qL9YREb5vSC4TXhNWt6+oL7DUL53s8YQjaSUe82lHtQeSosQ5vRlBKdYBQ8cFb97bdGi14hJlqLAT+Qm8W6p7VVGjjQ93DU49Hypf1JG3vmBs7w15NtvAg8CgWhNknROTFMlXKKDldsquRFZNXzSWrUkNUlv1wjdmvOfJyuxYn9Vo8+KBMvFYtf3DImG5g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cD3hYxJNz4ut1yClQjI0qLEoQGoYtQcFIBs+j/6F9xLpBIpopfpxirTGtnl3MIcj1RZlZOeghbqfIHQtZvEHkVNFImHQjF9YugR9N5g2DM1n7BbphONuu70oiviqH9mSyrO7oyHnji1mL2cKcsRVNQg5c7O3TQl5qa7xEbACdmBqZ77RLCOJyQFUCWSrQ5UDAKBcVEzET2f+j0BVa2sLE/sEXRwlBYKFVtYKJ94PQq5SQ77JM4nzp1GrZs67867EWeXLiFLYCxTt2Xll7JHBuxkSeS+SiM89mGK7MJZ2luh9/Fu+LvAZ2wDYgYrs/z/R/iw8YwlORh5lD/y+G04tgWC4Y61xiQd4a2vix3qwy4W/C9Rh23vBcXHog3ohcj4gQ7c+TTmWxRt0H6/9H5JQWHP4j9olZHPnzXYR3eH0yZB9GvQFnhGy2soegzpY1KK6
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 10:03:53.1416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6ed9d3-3e47-4b57-027e-08def146860e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7349
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 10:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242646

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
 scripts/lib/devtool/upgrade.py | 71 +++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 495a5b8217..0155578d68 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -589,6 +589,64 @@ def _resolve_rst_includes(content, srctree):
     return ''.join(result)
=20
=20
+_GIT_LOG_COMMIT_RE =3D re.compile(r'^commit ([0-9a-f]{7,40})\b.*$', re.MUL=
TILINE)
+_GIT_LOG_HEADER_RE =3D re.compile(r'^(Merge|Author|AuthorDate|Commit|Commi=
tDate):')
+
+def _diff_git_log_changelog(old_content, new_content):
+    """Structurally diff a ChangeLog file that is itself the output of
+    `git log` (e.g. nghttp2). Such files are regenerated wholesale on ever=
y
+    release: new commits are prepended, so every existing commit shifts
+    position even though its content is unchanged. A textual diff would
+    see that shift as removed/added lines instead of showing just the
+    commits that were actually added. Comparing commit hashes instead of
+    line content tells the two cases apart: hashes already present in
+    old_content are commits that merely moved, so they're skipped; any
+    other hash is a genuinely new commit. Returns the subject line of
+    each new commit as a single string, or None if either file doesn't
+    look like git log output."""
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
+        message_lines =3D [line.strip() for line in block.splitlines()
+                          if line.strip() and not _GIT_LOG_HEADER_RE.match=
(line)]
+        # Skip the 'Merge pull request ...' line GitHub adds as the first
+        # message line of a merge commit; the actual change subject is the
+        # next line, and keeping the merge line would duplicate it.
+        subject =3D next((l for l in message_lines if not l.startswith('Me=
rge pull request ')), None)
+        # Collapse adjacent duplicates: squash-merged PRs can produce
+        # consecutive commits with the same subject line.
+        if subject and (not subjects or subjects[-1] !=3D subject):
+            subjects.append(subject)
+    return '\n'.join(subjects) if subjects else None
+
+
+def _changelog_file_candidate(srctree, old_tag, new_tag, fname):
+    """Return the changelog text to use for a single changelog-like file t=
hat
+    changed between old_tag and new_tag, or None if it has no usable
+    content. Tries a structural git-log diff first (for files like
+    nghttp2's ChangeLog that are `git log` output regenerated on every
+    release), falling back to the added lines of a plain-text diff."""
+    try:
+        old_file, _ =3D _run('git show %s' % shlex.quote('%s:%s' % (old_ta=
g, fname)), srctree)
+        new_file, _ =3D _run('git show %s' % shlex.quote('%s:%s' % (new_ta=
g, fname)), srctree)
+        candidate =3D _diff_git_log_changelog(old_file, new_file)
+        if candidate is not None:
+            return candidate
+    except bb.process.ExecutionError:
+        pass
+
+    diff_out, _ =3D _run('git diff %s %s -- %s' % (old_tag, new_tag, shlex=
.quote(fname)), srctree)
+    added_lines =3D [line[1:] for line in diff_out.splitlines()
+                   if line.startswith('+') and not line.startswith('+++')]
+    return '\n'.join(added_lines) if added_lines else None
+
+
 def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source):
     """Extract changelog between old and new version using devtool git tag=
s."""
     changelog_content =3D None
@@ -630,15 +688,10 @@ def _extract_changelog(srctree, pn, old_ver, new_ver,=
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
+                    candidate =3D _changelog_file_candidate(srctree, old_t=
ag, new_tag, fname)
+                    if candidate and (not changelog_content or len(candida=
te) > len(changelog_content)):
+                        changelog_content =3D candidate
+                        changelog_fname =3D fname
     except bb.process.ExecutionError as e:
         logger.warning('Changelog file extraction failed: %s' % str(e))
=20

