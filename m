Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E6EC48BC4
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 01:28:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web10.32007.1708306130684498781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 17:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=i4CE5S4e;
 spf=pass (domain: axis.com, ip: 40.107.8.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NS3LRAZQhVQAOLXbUf4OUl0X7bMyFrWXTF70tAZmFIYU4s9SVseLuWbghoM9pTfB25Dunkc75IlUr1C055/krRKILJi8gozmxgLfACukvnua4DpVPePeXjwG+CM6Zl0MbHVLrD58PM5wNM3Z6Q7OocoAIXkenx0A0G+4oXOce8qAlpg6pVYWfffWsHfRFC26SOYmD8xeTDqxVQI2Y5lCwReJSbkkLhyakUKD+VmCNx5c/iNYSiAnkiIwyed7uWaNNBtTiNkECadlo/t9+bD4yXqZ+90+gjFsPbZU4G4LynHI8S+I91/9fwqK0u+yAKaVMnxUo56iQ+OtcHeMYZATXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqGcGuYlcMw6dELiBvSJFedNY2auIWePC0eRy8pmw3I=;
 b=OAXbOLeJ4X7u4BFnEyp4JEQdkTUE4zux9HdLbQD8VDEBLf4GTGzaPeJhjXYJRyzNSlR1K9q0hkjsmK01XYYnZhwRGpZZ8xT9+Onl8OoK+MLvHc7JpijIZ/Agdb7MnoPAbn+ldV4u5F5TH7nSJKD7DSssAktsehozNOvCubxwiHJJ5f4GxI1goAT63UYOxXKb1rBZQVEa+l6EizNW2MZNR5zhpjF0pporPN4ATwy8uYr241tdHxhbIRq9uXat2Vb0kK416FwNbAQFBHhSNGr+NmGhWVAK/YzEq/KB1gUlwIAhzNovABE/sK4bXytxAlOlVdhIbwhMk3UU9mR+N1IdHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqGcGuYlcMw6dELiBvSJFedNY2auIWePC0eRy8pmw3I=;
 b=i4CE5S4enWa6kGoLcpjeozcxDvJLh5g/lg5acqwk7BEriT3aWnIEl+uNoPkU0imWreChlD3KC0B2dsxs+drtDD29AqLFn1F/IJyQo4Mgtsc0K/c9B9PmiuKKeRIVPVW3eNhjg/ytOzG9iE0PrOSqfmSXvZocFpYA97X7VMQbK94=
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by DU0PR02MB8762.eurprd02.prod.outlook.com
 (2603:10a6:10:3ee::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 01:28:46 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::96) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
 Transport; Mon, 19 Feb 2024 01:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 19 Feb 2024 01:28:46 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 02:28:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 02:28:44 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 19 Feb 2024 02:28:44 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0338E14929
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:28:44 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41J1Sh4C3090840
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:28:43 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41J1ShXj3090839
	for openembedded-core@lists.openembedded.org; Mon, 19 Feb 2024 02:28:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 5/5] lib/oe/patch: Use git notes to store the filenames for the patches
Date: Mon, 19 Feb 2024 02:28:32 +0100
Message-ID: <20240219012832.3090768-5-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240219012832.3090768-1-pkj@axis.com>
References: <20240219012832.3090768-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|DU0PR02MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: e5627deb-fd16-4051-7526-08dc30ea1de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hsSeUFw/8JvybwuPl77cLTIq6V7jV+slX07AagYUcyHo0zSoU+H7Wmz13ssjZu3I23u0AnR0lVjg6/jfOEAcfqJP91uyU1i1px2vBoR3hpR2aXlMZFiSFt1cZIf6gt/2inrqJqrAr0z8ArP/iQ0rXOT4GIt2pjBiXsCK5oggEXPfvan0V+avGMvSewAeD8vsrGS0+D1bIKLBuvYTx9mMlZ5I/770GUI748hr074UwLql0uUsBSJsLkn1jcuAhmlhkfA44pr6n5EFUz8uDFecsxE1llWLsTUHSBiqg3Fkg0Qh4Y1PrHqh0d4wImw+i0X341K+ObYI4vN1eoXWr7T0EbsqKf7S1E3IVT2kvqSuCyTcTo1be4fjIf4zkYG0rc0qbjdnYeoLmgXtfCaWyrlI6TjxlAW83pCbCo8aKTkxVOANkHFyehwV77ILlsFXRWWO1mZkPdtoi5Mf3C61J1+cBjXidi4G7mVy2VmhwQwGxXnzh7ufItJA9tbvJPs0MksDl+3xRI0bY62aQboOc3wfpOqHvlvtOp1Cks3aoln8DI7MBnJ+IlwLpjzB41G4DOC2KBbUMvHRNxWXDuOT6sUmyRUY05VA90JszxdWHfXu/G2/2F9r4TpiDTicMVEJI+nmGliGKvVjI1w9XWVtGtxr8dtPFQ4UuZpFPJthrgg5jtE=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39850400004)(136003)(230922051799003)(230273577357003)(186009)(64100799003)(82310400011)(36860700004)(451199024)(1800799012)(46966006)(40470700004)(5660300002)(70206006)(70586007)(8676002)(8936002)(30864003)(6916009)(2906002)(356005)(81166007)(36756003)(82740400003)(42186006)(26005)(336012)(426003)(83380400001)(2616005)(41300700001)(478600001)(6666004)(316002)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 01:28:46.1331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5627deb-fd16-4051-7526-08dc30ea1de7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8762
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 01:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195857

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

PATCHv2:
* Remove the --fixed-value option from calls to git config. It was
  added in Git version 2.30, but OE Core currently only requires Git
  version 1.8.3.1.
* Work around a bug (or feature?) in git rebase related to commits with
  notes that are completely absorbed by already existing commits during
  a rebase.
* Configure notes.rewriteMode =3D ignore. This is part of the solution to
  the above problem.

 meta/lib/oe/patch.py                    | 109 +++++++++++++++---------
 meta/lib/oeqa/selftest/cases/devtool.py |   9 +-
 scripts/lib/devtool/standard.py         |  15 ++--
 scripts/lib/devtool/upgrade.py          |  24 +++++-
 4 files changed, 103 insertions(+), 54 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 3ded5f3601..60a0cc8291 100644
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
@@ -460,15 +461,53 @@ class GitApplyTree(PatchTree):
             cmd.append('--date=3D"%s"' % date)
         return (tmpfile, cmd)
=20
+    @staticmethod
+    def addNote(repo, ref, key, value=3DNone):
+        note =3D key + (": %s" % value if value else "")
+        notes_ref =3D GitApplyTree.notes_ref
+        runcmd(["git", "config", "notes.rewriteMode", "ignore"], repo)
+        runcmd(["git", "config", "notes.displayRef", notes_ref, notes_ref]=
, repo)
+        runcmd(["git", "config", "notes.rewriteRef", notes_ref, notes_ref]=
, repo)
+        runcmd(["git", "notes", "--ref", notes_ref, "append", "-m", note, =
ref], repo)
+
+    @staticmethod
+    def removeNote(repo, ref, key):
+        notes =3D GitApplyTree.getNotes(repo, ref)
+        notes =3D {k: v for k, v in notes.items() if k !=3D key and not k.=
startswith(key + ":")}
+        runcmd(["git", "notes", "--ref", GitApplyTree.notes_ref, "remove",=
 "--ignore-missing", ref], repo)
+        for note, value in notes.items():
+            GitApplyTree.addNote(repo, ref, note, value)
+
+    @staticmethod
+    def getNotes(repo, ref):
+        import re
+
+        note =3D None
+        try:
+            note =3D runcmd(["git", "notes", "--ref", GitApplyTree.notes_r=
ef, "show", ref], repo)
+            prefix =3D ""
+        except CmdError:
+            note =3D runcmd(['git', 'show', '-s', '--format=3D%B', ref], r=
epo)
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
@@ -484,18 +523,20 @@ class GitApplyTree(PatchTree):
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
@@ -503,11 +544,16 @@ class GitApplyTree(PatchTree):
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
@@ -555,28 +601,11 @@ class GitApplyTree(PatchTree):
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
@@ -587,7 +616,7 @@ class GitApplyTree(PatchTree):
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
@@ -620,10 +649,12 @@ class GitApplyTree(PatchTree):
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
index c4dcdb4550..d37848bdef 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -989,9 +989,10 @@ class DevtoolModifyTests(DevtoolBase):
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
@@ -999,7 +1000,7 @@ class DevtoolModifyTests(DevtoolBase):
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
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index ef58523dc8..fa5b8ef3c7 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -261,7 +261,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
     revs =3D {}
     for path in paths:
         (stdout, _) =3D _run('git rev-parse HEAD', cwd=3Dpath)
-        revs[os.path.relpath(path,srctree)] =3D stdout.rstrip()
+        revs[os.path.relpath(path, srctree)] =3D stdout.rstrip()
=20
     if no_patch:
         patches =3D oe.recipeutils.get_recipe_patches(crd)
@@ -272,17 +272,35 @@ def _extract_new_source(newpv, srctree, no_patch, src=
rev, srcbranch, branch, kee
             _run('git checkout devtool-patched -b %s' % branch, cwd=3Dpath=
)
             (stdout, _) =3D _run('git branch --list devtool-override-*', c=
wd=3Dpath)
             branches_to_rebase =3D [branch] + stdout.split()
+            target_branch =3D revs[os.path.relpath(path, srctree)]
+
+            # There is a bug (or feature?) in git rebase where if a commit=
 with
+            # a note is fully rebased away by being part of an old commit,=
 the
+            # note is still attached to the old commit. Avoid this by maki=
ng
+            # sure all old devtool related commits have a note attached to=
 them
+            # (this assumes git config notes.rewriteMode is set to ignore)=
.
+            (stdout, _) =3D __run('git rev-list devtool-base..%s' % target=
_branch)
+            for rev in stdout.splitlines():
+                if not oe.patch.GitApplyTree.getNotes(path, rev):
+                    oe.patch.GitApplyTree.addNote(path, rev, "dummy")
+
             for b in branches_to_rebase:
-                logger.info("Rebasing {} onto {}".format(b, revs[os.path.r=
elpath(path,srctree)]))
+                logger.info("Rebasing {} onto {}".format(b, target_branch)=
)
                 _run('git checkout %s' % b, cwd=3Dpath)
                 try:
-                    _run('git rebase %s' % revs[os.path.relpath(path, srct=
ree)], cwd=3Dpath)
+                    _run('git rebase %s' % target_branch, cwd=3Dpath)
                 except bb.process.ExecutionError as e:
                     if 'conflict' in e.stdout:
                         logger.warning('Command \'%s\' failed:\n%s\n\nYou =
will need to resolve conflicts in order to complete the upgrade.' % (e.comm=
and, e.stdout.rstrip()))
                         _run('git rebase --abort', cwd=3Dpath)
                     else:
                         logger.warning('Command \'%s\' failed:\n%s' % (e.c=
ommand, e.stdout))
+
+            # Remove any dummy notes added above.
+            (stdout, _) =3D __run('git rev-list devtool-base..%s' % target=
_branch)
+            for rev in stdout.splitlines():
+                oe.patch.GitApplyTree.removeNote(path, rev, "dummy")
+
             _run('git checkout %s' % branch, cwd=3Dpath)
=20
     if tmpsrctree:

