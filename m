Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400C1C48BF6
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 19:00:11 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.66])
 by mx.groups.io with SMTP id smtpd.web11.5290.1708110007413027266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 11:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=cnxSZcGL;
 spf=pass (domain: axis.com, ip: 40.107.249.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KysNeWo+0nPvqWuhjBT2arTnbX5eYgQPcsOrPV+Mikdal51uowgXOwY+iVHeQFiaOHlIZMtMQVI/FTaXQ6WiqtnSvgUpz4Dw9guXDZqa5cnPIa4OKK94Q82Jmuos90HX8pHqyGEqhDee+ZoGb30ZwyLrjqv91T5MB8o+ji2z/9r/IcUM8GP3qtC0WojiwZu8qaT61h+VU1oLqCaOb8ISlxos2De35PGmKgM6SkTvvveGcTfniGwrA6qe9a/MTkKT2l2EOUTqVqQo5f2XzhUy26rxRTyHLSrKBfUKVl7QLvFtGmFL2w9LS7frgiQXGPR1JcSrEoGJgmAUrSC/S1+/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQClh1L5SUYw3CkUp4hhyPpDibiGkBobckKUQ+Ch7hI=;
 b=h4Y6SSjOWB3xEWm6Scr4puxhZ9vFC45FmFNLdyotCKHtGYomLOwH3B7pKKZQb3YmEAcqxrkdb+1+o/fCKw/xjMjuXM4enW+49q4pGtU78BWE3lk92k/vhbLDrDEWSJNlvIQFjcJrQJeeWTqFvP2Oxi5Va7naEgxbNNbA3aWS6ZZ33BwOYDbTy9XuF+PxOO22FViaPh4ez+Iz0BX+p7CvZ9UsodwGmGHyQPcj/GYJS8NL8/heyGfi7gq4SbqZIidgDe0jAgBKwohannrbJg6FO/YuJr3A07qcwY44U88ItDq5s4vUjq4hmV8BYymIGowi3jykEDOWKIhVv26zWxDFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQClh1L5SUYw3CkUp4hhyPpDibiGkBobckKUQ+Ch7hI=;
 b=cnxSZcGL2ul2hQuf5m1/L3uK6Dfjp1gPjurdk3HgFNnv+sjeFJk7ALzjYd4UF6kw3mQqajDLhQTB1sJswqvTb3LWUpaIsFGpYquO6hxikG8w5CKSlAK12bXvnGt/q5DHFc59kpFAQVpF2CQFZ6e+Ow5CmqT2fStuGDgjfJhlzn8=
Received: from AS4PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::18)
 by DB9PR02MB9996.eurprd02.prod.outlook.com (2603:10a6:10:460::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 19:00:04 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::eb) by AS4PR09CA0029.outlook.office365.com
 (2603:10a6:20b:5d4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37 via Frontend
 Transport; Fri, 16 Feb 2024 19:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 19:00:04 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:03 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Feb 2024 20:00:03 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 283E714698
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:03 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41GJ03Qw2607030
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:03 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41GJ033B2607029
	for openembedded-core@lists.openembedded.org; Fri, 16 Feb 2024 20:00:03 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 7/7] lib/oe/patch: Use git notes to store the filenames for the patches
Date: Fri, 16 Feb 2024 19:59:56 +0100
Message-ID: <20240216185956.2606978-7-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240216185956.2606978-1-pkj@axis.com>
References: <20240216185956.2606978-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|DB9PR02MB9996:EE_
X-MS-Office365-Filtering-Correlation-Id: 504fb278-fc42-4483-aac8-08dc2f217c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/T52HtHgOKpV7t8Mf+m+LMD5keyhYkiDeV3VxLmEqDdjkKXM6u3R+nQCQVW5owKUvBP1RREmPhmjcVwCHhikG73vL8B7fZiD2YXbKeWtbSl5aiayFRvHbT9bcM4fkHjJ6jtU7rpg5vAhYRnq3Pt9ijnWpXchTxh0MBdr6XDf2tfXyy93ubg+Uml2Wt28Heuakrb32EV8C2lYVK3wEAIKN10hm6HY3xEobRTc+7iLpKw/0KN8wfhGacsNUl2K0YTqzzE3qKix4RH5oDuV3XYq9Ud1jXW0IwJFncyVfuKBaYGx8GDGKLS2a1DsPTT8GCoPAKJA0xwDMclBndNRwetD4pAhDcT51KPnLoSVRgLXuErJ1j11RpditjFd/57MkEl7vyjZfL7EXHy9ZlwFxlPmoZ60KK3CkcNKGRoJUkmxnJWaqm7lhOuRYT1e+KjYDfNvMeIYbUi6/F4/+Wd9nJVhzEKfJLUqcK7rFPC6ZOVhQ3dTMl7VoMUHaQ7Yzn72gX3+c+HYPsZ1/Eq2VFBcdXto14sTHvLQtv2+u6P9+w8LambDI6gQ5jjLS9OsY5I8I9VU5kjMtl1qwIATzwjUgUhnV3i+/SSh+3tZyfMbtJd2gN6RYhHOJLMW83x5QVod4weQJRJ2FElBFhREyvHorcvFDSDE1VhDbWjO/UNlcTxDRJU=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(36860700004)(82310400011)(64100799003)(1800799012)(451199024)(186009)(40470700004)(46966006)(2906002)(30864003)(5660300002)(426003)(2616005)(336012)(1076003)(41300700001)(8676002)(70586007)(316002)(70206006)(6916009)(8936002)(83380400001)(26005)(6666004)(42186006)(478600001)(82740400003)(81166007)(36756003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:00:04.3289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504fb278-fc42-4483-aac8-08dc2f217c30
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 19:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195798

The old way of keeping track of the filenames for the patches that
correspond to the commits was to add a special comment line to the end
of the commit message, e.g., "%% original patch: <filename>", using a
temporary git hook. This method had some drawbacks, e.g.:

* It caused problems if one wanted to push the commits upstream as the
  comment line had to be manually removed.
* The comment line would end up in patches if someone used git
  format-path rather than devtool finish to generate the patches.
* The comment line could interfere with global Git hooks used to
  validate the format of the Git commit message.
* When regenerating patches with `devtool finish --force-patch-refresh`,
  the process typically resulted in adding empty lines to the end of the
  commit messages in the updated patches.

A better way of keeping track of the patch filenames is to use Git
notes. This way the commit messages remain unaffected, but the
information is still shown when, e.g., doing `git log`. A special Git
notes space, refs/notes/devtool, is used to not intefere with the
default Git notes. It is configured to be shown in, e.g., `git log` and
to survive rewrites (i.e., `git commit --amend` and `git rebase`).

Since there is no longer any need for a temporary Git hook, the code
that manipulated the .git/hooks directory has also been removed. To
avoid potential problems due to global Git hooks, --no-verify was added
to the `git commit` command.

To not cause troubles for those who have done `devtool modify` for a
recipe with the old solution and then do `devtool finish` with the new
solution, the code will fall back to look for the old strings in the
commit message if no Git note can be found.

While not technically motivated like above, the way to keep track of
ignored commits is also changed to use Git notes to avoid having
different methods to store similar information.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/patch.py                    | 105 +++++++++++++++---------
 meta/lib/oeqa/selftest/cases/devtool.py |   9 +-
 scripts/lib/devtool/standard.py         |  15 ++--
 3 files changed, 78 insertions(+), 51 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 3ded5f3601..4e971f8b30 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -294,8 +294,9 @@ class PatchTree(PatchSet):
         self.Pop(all=3DTrue)
=20
 class GitApplyTree(PatchTree):
-    patch_line_prefix =3D '%% original patch'
-    ignore_commit_prefix =3D '%% ignore'
+    notes_ref =3D "refs/notes/devtool"
+    original_patch =3D 'original patch'
+    ignore_commit =3D 'ignore'
=20
     def __init__(self, dir, d):
         PatchTree.__init__(self, dir, d)
@@ -452,7 +453,7 @@ class GitApplyTree(PatchTree):
         # Prepare git command
         cmd =3D ["git"]
         GitApplyTree.gitCommandUserOptions(cmd, commituser, commitemail)
-        cmd +=3D ["commit", "-F", tmpfile]
+        cmd +=3D ["commit", "-F", tmpfile, "--no-verify"]
         # git doesn't like plain email addresses as authors
         if author and '<' in author:
             cmd.append('--author=3D"%s"' % author)
@@ -460,15 +461,49 @@ class GitApplyTree(PatchTree):
             cmd.append('--date=3D"%s"' % date)
         return (tmpfile, cmd)
=20
+    @staticmethod
+    def addNote(repo, ref, key, value=3DNone):
+        note =3D key + (": %s" % value if value else "")
+        notes_ref =3D GitApplyTree.notes_ref
+        cmd =3D ["git", "config", "--fixed-value", "notes.displayRef", not=
es_ref, notes_ref]
+        runcmd(cmd, repo)
+        cmd =3D ["git", "config", "--fixed-value", "notes.rewriteRef", not=
es_ref, notes_ref]
+        runcmd(cmd, repo)
+        cmd =3D ["git", "notes", "--ref", notes_ref, "append", "-m", note,=
 ref]
+        runcmd(cmd, repo)
+
+    @staticmethod
+    def getNotes(repo, ref):
+        import re
+
+        note =3D None
+        cmd =3D ["git", "notes", "--ref", GitApplyTree.notes_ref, "show", =
ref]
+        try:
+            note =3D runcmd(cmd, repo)
+            prefix =3D ""
+        except CmdError:
+            cmd =3D ['git', 'show', '-s', '--format=3D%B', ref]
+            note =3D runcmd(cmd, repo)
+            prefix =3D "%% "
+
+        note_re =3D re.compile(r'^%s(.*?)(?::\s*(.*))?$' % prefix)
+        notes =3D dict()
+        for line in note.splitlines():
+            m =3D note_re.match(line)
+            if m:
+                notes[m.group(1)] =3D m.group(2)
+
+        return notes
+
     @staticmethod
     def commitIgnored(subject, dir=3DNone, files=3DNone, d=3DNone):
         if files:
             runcmd(['git', 'add'] + files, dir)
-        message =3D "%s\n\n%s" % (subject, GitApplyTree.ignore_commit_pref=
ix)
         cmd =3D ["git"]
         GitApplyTree.gitCommandUserOptions(cmd, d=3Dd)
-        cmd +=3D ["commit", "-m", message, "--no-verify"]
+        cmd +=3D ["commit", "-m", subject, "--no-verify"]
         runcmd(cmd, dir)
+        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit)
=20
     @staticmethod
     def extractPatches(tree, startcommits, outdir, paths=3DNone):
@@ -484,18 +519,20 @@ class GitApplyTree(PatchTree):
                 out =3D runcmd(["sh", "-c", " ".join(shellcmd)], os.path.j=
oin(tree, name))
                 if out:
                     for srcfile in out.split():
-                        outfile =3D os.path.basename(srcfile)
+                        # This loop, which is used to remove any line that
+                        # starts with "%% original patch", is kept for bac=
kwards
+                        # compatibility. If/when that compatibility is dro=
pped,
+                        # it can be replaced with code to just read the fi=
rst
+                        # line of the patch file to get the SHA-1, and the=
 code
+                        # below that writes the modified patch file can be
+                        # replaced with a simple file move.
                         for encoding in ['utf-8', 'latin-1']:
                             patchlines =3D []
                             try:
                                 with open(srcfile, 'r', encoding=3Dencodin=
g, newline=3D'') as f:
                                     for line in f:
-                                        if line.startswith(GitApplyTree.pa=
tch_line_prefix):
-                                            outfile =3D line.split()[-1].s=
trip()
+                                        if line.startswith("%% " + GitAppl=
yTree.original_patch):
                                             continue
-                                        if line.startswith(GitApplyTree.ig=
nore_commit_prefix):
-                                            outfile =3D None
-                                            break
                                         patchlines.append(line)
                             except UnicodeDecodeError:
                                 continue
@@ -503,11 +540,16 @@ class GitApplyTree(PatchTree):
                         else:
                             raise PatchError('Unable to find a character e=
ncoding to decode %s' % srcfile)
=20
-                        if outfile:
-                            bb.utils.mkdirhier(os.path.join(outdir, name))
-                            with open(os.path.join(outdir, name, outfile),=
 'w') as of:
-                                for line in patchlines:
-                                    of.write(line)
+                        sha1 =3D patchlines[0].split()[1]
+                        notes =3D GitApplyTree.getNotes(os.path.join(tree,=
 name), sha1)
+                        if GitApplyTree.ignore_commit in notes:
+                            continue
+                        outfile =3D notes.get(GitApplyTree.original_patch,=
 os.path.basename(srcfile))
+
+                        bb.utils.mkdirhier(os.path.join(outdir, name))
+                        with open(os.path.join(outdir, name, outfile), 'w'=
) as of:
+                            for line in patchlines:
+                                of.write(line)
         finally:
             shutil.rmtree(tempdir)
=20
@@ -555,28 +597,11 @@ class GitApplyTree(PatchTree):
=20
             return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
=20
-        # Add hooks which add a pointer to the original patch file name in=
 the commit message
         reporoot =3D (runcmd("git rev-parse --show-toplevel".split(), self=
.dir) or '').strip()
         if not reporoot:
             raise Exception("Cannot get repository root for directory %s" =
% self.dir)
-        gitdir =3D (runcmd("git rev-parse --absolute-git-dir".split(), sel=
f.dir) or '').strip()
-        if not gitdir:
-            raise Exception("Cannot get gitdir for directory %s" % self.di=
r)
-        hooks_dir =3D os.path.join(gitdir, 'hooks')
-        hooks_dir_backup =3D hooks_dir + '.devtool-orig'
-        if os.path.lexists(hooks_dir_backup):
-            raise Exception("Git hooks backup directory already exists: %s=
" % hooks_dir_backup)
-        if os.path.lexists(hooks_dir):
-            shutil.move(hooks_dir, hooks_dir_backup)
-        os.mkdir(hooks_dir)
-        commithook =3D os.path.join(hooks_dir, 'commit-msg')
-        applyhook =3D os.path.join(hooks_dir, 'applypatch-msg')
-        with open(commithook, 'w') as f:
-            # NOTE: the formatting here is significant; if you change it y=
ou'll also need to
-            # change other places which read it back
-            f.write('echo "\n%s: $PATCHFILE" >> $1' % GitApplyTree.patch_l=
ine_prefix)
-        os.chmod(commithook, 0o755)
-        shutil.copy2(commithook, applyhook)
+
+        patch_applied =3D True
         try:
             patchfilevar =3D 'PATCHFILE=3D"%s"' % os.path.basename(patch['=
file'])
             if self._need_dirty_check():
@@ -587,7 +612,7 @@ class GitApplyTree(PatchTree):
                     pass
                 else:
                     if output:
-                        # The tree is dirty, not need to try to apply patc=
hes with git anymore
+                        # The tree is dirty, no need to try to apply patch=
es with git anymore
                         # since they fail, fallback directly to patch
                         output =3D PatchTree._applypatch(self, patch, forc=
e, reverse, run)
                         output +=3D self._commitpatch(patch, patchfilevar)
@@ -620,10 +645,12 @@ class GitApplyTree(PatchTree):
                     output =3D PatchTree._applypatch(self, patch, force, r=
everse, run)
                 output +=3D self._commitpatch(patch, patchfilevar)
                 return output
+        except:
+            patch_applied =3D False
+            raise
         finally:
-            shutil.rmtree(hooks_dir)
-            if os.path.lexists(hooks_dir_backup):
-                shutil.move(hooks_dir_backup, hooks_dir)
+            if patch_applied:
+                GitApplyTree.addNote(self.dir, "HEAD", GitApplyTree.origin=
al_patch, os.path.basename(patch['file']))
=20
=20
 class QuiltTree(PatchSet):
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index abc85c90a7..a94f4a7148 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -988,9 +988,10 @@ class DevtoolModifyTests(DevtoolBase):
         self.assertIn(tempdir, result.output)
         # Check git repo
         self._check_src_repo(tempdir)
-        # Check that the patch is correctly applied
-        # last commit message in the tree must contain
-        # %% original patch: <patchname>
+        # Check that the patch is correctly applied.
+        # The last commit message in the tree must contain the following n=
ote:
+        # Notes (devtool):
+        #     original patch: <patchname>
         # ..
         patchname =3D None
         for uri in src_uri:
@@ -998,7 +999,7 @@ class DevtoolModifyTests(DevtoolBase):
                 patchname =3D uri.replace("file://", "").partition('.patch=
')[0] + '.patch'
         self.assertIsNotNone(patchname)
         result =3D runCmd('git -C %s log -1' % tempdir)
-        self.assertIn("%%%% original patch: %s" % patchname, result.output=
)
+        self.assertIn("Notes (devtool):\n    original patch: %s" % patchna=
me, result.output)
=20
         # Configure the recipe to check that the git dependencies are corr=
ectly patched in cargo config
         bitbake('-c configure %s' % testrecipe)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 6d7fd17fbd..7972b4f822 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -937,14 +937,13 @@ def modify(args, config, basepath, workspace):
             seen_patches =3D []
             for branch in branches:
                 branch_patches[branch] =3D []
-                (stdout, _) =3D bb.process.run('git log devtool-base..%s' =
% branch, cwd=3Dsrctree)
-                for line in stdout.splitlines():
-                    line =3D line.strip()
-                    if line.startswith(oe.patch.GitApplyTree.patch_line_pr=
efix):
-                        origpatch =3D line[len(oe.patch.GitApplyTree.patch=
_line_prefix):].split(':', 1)[-1].strip()
-                        if not origpatch in seen_patches:
-                            seen_patches.append(origpatch)
-                            branch_patches[branch].append(origpatch)
+                (stdout, _) =3D bb.process.run('git rev-list devtool-base.=
.%s' % branch, cwd=3Dsrctree)
+                for sha1 in stdout.splitlines():
+                    notes =3D oe.patch.GitApplyTree.getNotes(srctree, sha1=
.strip())
+                    origpatch =3D notes.get(oe.patch.GitApplyTree.original=
_patch)
+                    if origpatch and origpatch not in seen_patches:
+                        seen_patches.append(origpatch)
+                        branch_patches[branch].append(origpatch)
=20
         # Need to grab this here in case the source is within a subdirecto=
ry
         srctreebase =3D srctree

