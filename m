Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD68C982DC
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 12:02:21 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9504.1789732937355967062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 05:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Q8vg3tY7;
 spf=pass (domain: ericsson.com, ip: 40.107.130.53, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaFFCR6jwXmfV3Pet94OgR5PkFvuWpvWnqDmihX5o9tGsLxMLwzP1tg+TXtxo0EBxLLLKSvporI5PXdHebRbC2tkOXGvDQxobPVj88efut25orp9H3pKhweSL9CYhsIYw4IBAAUPHCcGxeWjjaGGGLvyfuUPwMCnLeHqF4NQf5M/BUgSn9uGahoVrLS1LSoolG+tLvZ87loADtOxXjKQSRpxH2591lX+w8W47S/9ld4v9nqE0jBKcEe42kMRV/+4T9cAWZ7UlTbCEVeRIdp19oPlh93H+LoPYzcKQQbLoXtNQV9XrKe8neOTuhZs0yl7scm0QNMdP58tpEkdokjiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBKppCMfBRtfpYbTBAKbgFShevyS+8R66iuz8CMK6Ps=;
 b=X1kZhiS0gqGRIwxkCN47bIFD2Tqq3/Qi9FeIvoeqxmuWPvw6cgKp7PGUorbaw6uN9CRAz1XM350V5j9q817JO4QxrRG94SM2h20Y5KSMtWXWE1CJGWq94dXA9xEHScXBatkqWCejMj6uDG3FIHZ03Hvx0sM9YmtyVY4SxQ/cMMbx4n/xUyHRRAS4hs9z21c0s6JPuWaaUh2bebTJAcvv2coLbsf5cWNqE5Da4D0/eZjQAVzuUYFkkyZqsYQaW1nNICEO4YrSQs3k6XM89Zgbn0SEr0o45+YA3eC6s6bPuqd0SNhLssHinyqgD7xbmdtgVKJ1bS8jJMcSVdvN+hhSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBKppCMfBRtfpYbTBAKbgFShevyS+8R66iuz8CMK6Ps=;
 b=Q8vg3tY7wTOCWdJGlrjl6m2FHUxtuEW6WAxR9YdP/TWCcmtj3fxRfEWfSuhroOWk1wzhaHGKmWB6r3bP19gBZWvw7Pj1yq4MLcgHcUVFVe2ioH0HZFXT69A/dsl/85Xqy/x/T20RzXhCUyuq3vCJvfZb4hVyoRH+2XA58SwxIJPZ2/c1hjH5f+lrYIOst533bGM6MwdKpKlZbE7rgAH5dDTeBmj9MJDkhhmGlJCT0yj9uKgkuNd2em9Ts0726DOBllQ4yoxedYhO2/G/9/fkGYEd5G8zdA5oWP7cOz0aJShWW6eL9ZFPHJCE/1jlsnulkakQuCkaCULPxuwo+lWJqQ==
Received: from PA7P264CA0137.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:377::6)
 by PA4PR07MB7408.eurprd07.prod.outlook.com (2603:10a6:102:cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 12:02:11 +0000
Received: from MI3PEPF0000847F.eurprd02.prod.outlook.com
 (2603:10a6:102:377:cafe::a6) by PA7P264CA0137.outlook.office365.com
 (2603:10a6:102:377::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 12:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF0000847F.mail.protection.outlook.com (10.167.240.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 12:02:10 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 18 Sep 2026 14:01:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 7F8A74020A8B;
	Fri, 18 Sep 2026 14:01:31 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 43255700CF27; Fri, 18 Sep 2026 14:01:31 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/2] devtool: upgrade: clean up changelog content for commit messages
Date: Fri, 18 Sep 2026 14:01:25 +0200
Message-ID: <20260918120125.770604-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918120125.770604-1-daniel.turull@ericsson.com>
References: <20260918120125.770604-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847F:EE_|PA4PR07MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a2e980-e179-4722-37ed-08df157cab91
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	t9WdSGJTxQFJYijQJsNYd2nHv1SUB3zgehHrWsay8/0dFgEZIXcqXoKvN/mfLw5dEZRG2cf7byIEy+tK4waYs6geyxYx6ohaHsIoUkSEGR57V6kIPcgKMukWQK2leTBkOGwe8OzbJt2bbBmBueLe5IKv6eT/wQxmQZ+lb4vj7GzUdjKGS2sFDEKcR5CzPSBgP/VM+s5fUaaXLC5peEn5IPFRDBlN64qzCBP/tFwvWy6mm0jSTRMpHK88QGxzjwYsbkiQnc851HRMmiyj3+9HtVZsfr3HmBBYQE/hWVBjX2TTu4ww9u9c4sPOdX0D4RtU6+dVyIneFf7HFj/07GspFZC58yEB981s2ELyW3bUybFhJrN4QEvnkKond33EMTDvOPEFuvA0toSiwu83x715ItGCazUUn7kltg2cLqgGsrEANeJeOSmQRicrpI6UlYPJfgjxuOPwy1v09v9fwS+WwCATe4SwdfxXg+7Oq5wTPcCe+uKnkOeNGeIY6+Q3hXL6p2v9CONB3wuKv8gd474KL1ObWYRoF4cjREA0BupZos6Aws7QKtfGEsBdBy2jSn0P3S6GQ6mdk1p36tl3EF1HIwUS2MYjzVwUA91EC0jP/cebpcynHyDJgDXtC1VNk/Cw1XOR/ut2gUlfyqDVRHRHGb5eIDCuBxZF7JhkDf8SKcA8R05nQHZZVVJf45pa8ICRUxLpvyD3sNfbO8AC8eh+8Q==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sCWn4OtmYAKi+doosZybcJGH4G9bqaMnps6SAID08/s/5N1NkgmTasuvVtX+7syccE1p3v2ix1Vrr3LJzyDK+k3hJMRfiPypv85DpWzdT2AKDWtqdMl5tLkaLXPp4zWP1so2KCE0Ftqj8i2ve1LLDcTL7r0QA/nbq7R1XP8FpNtzWpD/HanKAY8h/4LxyZg/n5V55CXwE4IoweORTk4U9lrO5vmOnsl0wFCH2/bfcuSdc5Ql4FLNd1ZMAvWh/CUwHqqz2m7Uai/Xp95xXty9483SgH+V8asi/WvyAX1IHwMAB6AWK2bSAnSTZHi2aGfGodER++xxocdrk2C6/oTAuY+hevMdjlVSYmQf1bY12c8y2IWwovnQuXVd0CAIU1VlMfst6Bv0AFIwbRhIUk7FEAHJ8dwUsIoNlGgCx+x8sQXtFx8jU5VJ+DVcZTilF3dD
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 12:02:10.7635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a2e980-e179-4722-37ed-08df157cab91
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF0000847F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7408
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 12:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246215

From: Daniel Turull <daniel.turull@ericsson.com>

Strip noise that has no value in a commit message:
- GitHub PR references: trailing "(#NNN)" and full pull/issue URLs.
- Commit hash prefixes from "git log --oneline"-style content,
  including the git-log fallback used when no changelog file exists.
- GNU ChangeLog noise: "YYYY-MM-DD  Name  <email>" entry headers, and
  "* file (func):" / "+ commit <hash>" bullets plus their wrapped
  continuation lines, down to the next blank line, keeping only the
  human-readable summary of each entry. Remaining tabs are stripped.
- NEWS-style "Changes in X.Y.Z, DATE" release headers and their "=3D=3D=3D"
  underline (libportal/glib-family projects).

Lines exceeding 80 chars are wrapped, preserving existing indentation.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../python3-guessing-game_git.bb.changelog    |  2 +-
 .../devtool-upgrade-test2_git.bb.changelog    |  2 +-
 .../devtool-upgrade-test5_git.bb.changelog    |  2 +-
 scripts/lib/devtool/upgrade.py                | 63 ++++++++++++++++++-
 4 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_gi=
t.bb.changelog b/meta-selftest/recipes-devtools/python/python3-guessing-gam=
e_git.bb.changelog
index ef0052160b..6c7bf9f713 100644
--- a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.ch=
angelog
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.ch=
angelog
@@ -1 +1 @@
-40cf004 Sync with maturin tutorial source
+Sync with maturin tutorial source
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.b=
b.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.=
bb.changelog
index ac133c483f..4699b1e89e 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.chang=
elog
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.chang=
elog
@@ -1 +1 @@
-6cc6077 dbus-wait.c: Fix typo
+dbus-wait.c: Fix typo
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.b=
b.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.=
bb.changelog
index 8077da3e21..3196cc13bd 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.chang=
elog
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.chang=
elog
@@ -1 +1 @@
-0a60d6a Add dummy commit on tip for testing
+Add dummy commit on tip for testing
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index cdc85fe7ae..ba7348664f 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -14,6 +14,7 @@ import shlex
 import shutil
 import subprocess
 import tempfile
+import textwrap
 import logging
 import argparse
 import scriptutils
@@ -634,6 +635,66 @@ def _diff_git_log_changelog(old_content, new_content):
     return '\n'.join(subjects) if subjects else None
=20
=20
+# GitHub PR references: trailing (#123) at end of line, or full URLs
+_GITHUB_PR_RE =3D re.compile(r'\s*\(#[0-9]+\)\s*$|\s*https?://github\.com/=
[^/]+/[^/]+/(pull|issues)/[0-9]+\s*')
+# Commit hash prefixes from git log --oneline: "abc1234 "
+_COMMIT_HASH_RE =3D re.compile(r'^[0-9a-f]{7,40}\s+')
+# A GNU ChangeLog entry: starts at either an entry header
+# ("2026-08-24  Werner Koch  <wk@gnupg.org>") or a technical bullet
+# ("* file.c (func): text" or "+ commit <hash>"), and extends through all
+# wrapped continuation lines up to (but not including) the next blank line=
.
+_GNU_CHANGELOG_ENTRY_RE =3D re.compile(
+    r'^(?:\d{4}-\d{2}-\d{2}\s+.+<.+@.+>|\s*(?:\*\s|\+ commit [0-9a-f]{7,40=
}).*)'
+    r'(?:\n(?!\s*$).*)*\n?',
+    re.MULTILINE)
+# NEWS-style release header + underline (glib/gtk family):
+# "Changes in 0.11.0, 2026-09-12\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n"
+_NEWS_RELEASE_HEADER_RE =3D re.compile(r'^Changes in .+,\s*\d{4}-\d{2}-\d{=
2}\s*\n=3D+\s*$', re.MULTILINE)
+
+def _join_single_line_paragraphs(text):
+    """Drop the blank line between two adjacent one-line paragraphs (each
+    surrounded by blank lines), so lines left behind by GNU ChangeLog entr=
y
+    stripping read as one entry per line instead of double-spaced."""
+    paragraphs =3D text.split('\n\n')
+    out =3D [paragraphs[0]]
+    prev_is_single_line =3D '\n' not in paragraphs[0]
+    for para in paragraphs[1:]:
+        this_is_single_line =3D '\n' not in para
+        if prev_is_single_line and this_is_single_line:
+            out[-1] +=3D '\n' + para
+        else:
+            out.append(para)
+        prev_is_single_line =3D this_is_single_line
+    return '\n\n'.join(out)
+
+
+def _cleanup_changelog(content):
+    """Strip GitHub PR refs, commit hashes, GNU ChangeLog entries (headers
+    and file/function bullets, plus their wrapped continuation lines) and
+    NEWS-style 'Changes in X.Y.Z, DATE' release headers with their
+    underline. Wrap lines over 80 chars, preserving indentation."""
+    content =3D _NEWS_RELEASE_HEADER_RE.sub('', content)
+    content =3D _GNU_CHANGELOG_ENTRY_RE.sub('', content)
+    out =3D []
+    for line in content.splitlines():
+        line =3D _GITHUB_PR_RE.sub(' ', line)
+        line =3D _COMMIT_HASH_RE.sub('', line)
+        line =3D line.replace('\t', '').rstrip()
+        stripped =3D line.lstrip()
+        indent =3D line[:len(line) - len(stripped)]
+        if len(line) > 80:
+            if stripped.startswith('- '):
+                indent +=3D '  '
+            line =3D textwrap.fill(line, width=3D80, subsequent_indent=3Di=
ndent)
+        out.append(line)
+    text =3D '\n'.join(out)
+    # Entries removed above can leave 3+ blank newlines where a blank-line
+    # separator butted up against a removed entry's own blank line;
+    # collapse any such run down to a single blank line (2 newlines).
+    text =3D re.sub(r'\n{3,}', '\n\n', text).strip()
+    return _join_single_line_paragraphs(text)
+
+
 def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source):
     """Extract changelog between old and new version using devtool git tag=
s."""
     changelog_content =3D None
@@ -723,7 +784,7 @@ def _extract_changelog(srctree, pn, old_ver, new_ver, o=
ld_tag, new_tag, workspac
         changelog_content =3D ''.join(filtered)
=20
     # Clean up content for readability and commit message use
-    changelog_content =3D re.sub(r'\n{3,}', '\n\n', changelog_content).str=
ip()
+    changelog_content =3D _cleanup_changelog(changelog_content)
     if not changelog_content:
         return None
=20

