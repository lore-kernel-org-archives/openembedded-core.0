Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AB7C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:04:05 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37482.1786086237136795040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=OOkWk/jL;
 spf=pass (domain: ericsson.com, ip: 40.107.130.30, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZbFx/dwxzEXpnUoG6+VxV6BKpY3n1EWDchYH5H8CNGIlblWbvs98wmqNfVGZcXLbBpDt0WAiqhq0i5PEzyr7293bA+ur0iLgQJzjJ88hCYit2SfTehZgs0SNpjJeb2WmThrK+nTHqbG6rVRVM6iH5nU5Vs79SIUX8aFk4aeNpXTRwiydBXrQeofkLmNcQBSwiXWZLvBtauoEW5uFPQM2yQTIASyw7nIhNpHeVKf2WapzaL//dJlv2J1WaBXEW9m3ufbGdOqeiQrZkUbAN1zhW/3GE3TReSN13t+/4TJCPLyp1UjtHruFa3li1bGBDhSKQgunrtyJtG2RXWEO1l2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqimtkPTxImT8KLPASEqVpBMl1gB3NcH8o6+QkLVpy4=;
 b=w9QhW84m1jDS0pCAl6dly1+UcYR9CHJmgZukznB2SR9c6tL2zKggvNjWL2XJKu8lyThbn46CSOXRRsEnSKCWPJK9eBxkgRSsREmrgqzU2hHMVzdYT6HrsY4i4jVwf1GeVbpMSWHypI8vLjmo6IqdJ4Olx6LJNOdfvP+AEXDcnZLwwfquEFS++ONbf314XEyGCUbvuCZ23+fImi65d6D6ineMVK64jRu61l0+lIbpk+2KmwD+vlBcUWEj7GPJBaKtCXq8byZmhirAlDhFOZL1Dll+8GTDBMLEU+y5mEzfjfBitANexecWg8c2GnQC+MRJJutPdaI9nVZ04PK533Jfvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqimtkPTxImT8KLPASEqVpBMl1gB3NcH8o6+QkLVpy4=;
 b=OOkWk/jLASkvFuBgu+CMk5rKvma+GBwBH8jldiOFF5bI5OviEjEx9HjQ3GsevwYtDUUPdJbWHuusTOL6tNftaVG4ZYIY+byVT7X/MBzCagoJZ/6xhkcDgV8T19IS++lXndDPXCHIpksJz10RPvn0h3avRzyXfQuekISHZl3KWpmStbKdXNv0LMoQpR8+/ZWny6CJk7POdSBH4PnXM5IBjHq4/XBdr4BfWAct6v4GLZuEn1S3zavxqznh7wJ/w8/S0Ai6EuHo0tobd1SYiBVmZbGeerm/dXtOfZNbhUYlbSAuQgpF/mbyt/aFn2KEoTUVn319XKXxNIU+Qrzenk+pUg==
Received: from DB8P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::40)
 by DB8PR07MB6345.eurprd07.prod.outlook.com (2603:10a6:10:137::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.8; Fri, 7 Aug 2026
 07:03:51 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::95) by DB8P191CA0030.outlook.office365.com
 (2603:10a6:10:130::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 07:03:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 7 Aug 2026 07:03:51 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 7 Aug 2026 09:03:50 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id BDD874020B46;
	Fri,  7 Aug 2026 09:03:47 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 8178D700DF4B; Fri,  7 Aug 2026 09:03:47 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Ross.Burton@arm.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3 2/2] devtool: upgrade: diff git-log-style changelogs by commit hash
Date: Fri, 7 Aug 2026 09:03:33 +0200
Message-ID: <20260807070333.485360-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807070333.485360-1-daniel.turull@ericsson.com>
References: <20260807070333.485360-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|DB8PR07MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: f097a77c-6917-4c70-5a38-08def4520923
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	+ssb28CFlADC71+gj2CHaZA9EFngdxNM0RtXqjxEWEWLY06qNtyKHt49KIwy0uCACJcQJ2kgrZBoEfdH1lA9K/gBSSR0xi3rKeeNF+Cqrcna5wyKon7d2KzaiZuaJbpdKP6Ti/4Ik87S4sX6ReQDfEa9NJ6AvIvho0MFJwvIzsc6pG+FP1/HMY8iTlMCHuX5G+CTKaM4JzDvGDCkeMX7FORo2+5lnrRQTBTmupfhpwOE4/ykLqk/Pcba2mKH34EfzVPpIhdMrCpcQIfyVggYcO9HOgEfn/wDxheifAE45SAFnPyml49L6o4/VolrfVyfhCU6O/uXAuT+E16MdiqgyR9UZji4P8Ki41r8h3Ws1FEJMQ9BDFCPdC9HCxsLz3rS63LFGMnEafeBNOpeMgUsO1zcKEH1biuOghJm1e1HJUkttq392FbUOL3VZezBAslHV9+4QqeBWmvfCJnT3lYxwyLxjU1w6+Lq8cNXLjzY3JihWf5mGQyGZpM5WQftXCfgyZocEaf4MMA/2+8znpP6/c/t43QyNLYOgMY5RbvgZEDT4whLKwoTfp8vxq6RcZ2iVLJLbVJ+dAMCLazwUFFVip65AWU3+xJLvodkvtvo+vCj824VZRePPEOClTyIYWaOlCcKIcIhvWWTjCGr4XjLRtGsb3tNpniYzQcXV9biv96SQXljfUL1ReC8r/4YxiDaC2lfF1RQrOaHzt5+N98fDQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6vqZwNvAb2DDt5SyBK6Ar31MxtwYLSxtKbtnSa3NuFur8RLUo+qEZaZwtTfLTgqkN9g40+RblE97YRyR9yUFa5XNiKxi1U3tt56MbVVe3WyDJxHxIyGzjI1JLftmXaFY0RK2jNQk+zAhbFjeVuQABaEoS2ry+G8p4VQZymts0BHJQ08CYy3yH6NU65XXEX4enPpvPDS7byr+8eEMoeP4mmsK3agbgPPOA8///j8HM9fq+hZDscOl9JRo+1aWgvJjg/Pa+GO8/IHqtS2nT5+oTC8CP1vCbWEJs2M3RYowrZBea6bny86TZAfpQ4gtNxrO1TuJ5Aw3SN1oX9jieOGRk4oNBfFjCWlkmmx0V0DUnMOxO1Sfb1WOXzRxxszFrL3mOc6HSDkkN78Bnw79+kU4cnFm/U6ajYtoltYOAXd9RMNgYRTzq51lgzg3xEI/YdbD
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:03:51.0156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f097a77c-6917-4c70-5a38-08def4520923
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6345
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 07:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242987

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

Tested with: oe-selftest -r devtool.DevtoolUpgradeTests

AI-Generated: Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 61 +++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index d74ffcf534..523acf4250 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -594,6 +594,43 @@ def _resolve_rst_includes(content, srctree):
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
 def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source):
     """Extract changelog between old and new version using devtool git tag=
s."""
     changelog_content =3D None
@@ -635,15 +672,21 @@ def _extract_changelog(srctree, pn, old_ver, new_ver,=
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
+                        old_file, _ =3D _run('git show %s' % shlex.quote('=
%s:%s' % (old_tag, fname)), srctree)
+                        new_file, _ =3D _run('git show %s' % shlex.quote('=
%s:%s' % (new_tag, fname)), srctree)
+                        candidate =3D _diff_git_log_changelog(old_file, ne=
w_file)
+                    except bb.process.ExecutionError:
+                        pass
+                    if candidate is None:
+                        diff_out, _ =3D _run('git diff %s %s -- %s' % (old=
_tag, new_tag, shlex.quote(fname)), srctree)
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

