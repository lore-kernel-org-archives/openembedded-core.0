Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 150C772916
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244377"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:49 +0000
Message-Id: <e4dd3e1b3225109ff4cde54a5261f315ef2c191a.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/15] lib/oe/patch: add support for extracting patches from git tree
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Dec 2014 11:42:11 -0000

When patches from a recipe have been written out to a git tree, we also
want to be able to do the reverse so we can update the patches next to
the recipe. This is implemented by adding a comment to each commit
message (using git hooks) which we can extract later on.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 112 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 82 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 5227781..b838be8 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -199,6 +199,8 @@ class PatchTree(PatchSet):
         self.Pop(all=True)
 
 class GitApplyTree(PatchTree):
+    patch_line_prefix = '%% original patch'
+
     def __init__(self, dir, d):
         PatchTree.__init__(self, dir, d)
 
@@ -256,10 +258,6 @@ class GitApplyTree(PatchTree):
                 if author_re.match(authorval):
                     author = authorval
             outlines.append(line)
-        # Add a pointer to the original patch file name
-        if outlines and outlines[-1].strip():
-            outlines.append('\n')
-        outlines.append('(from original patch: %s)\n' % os.path.basename(patchfile))
         # Write out commit message to a file
         with tempfile.NamedTemporaryFile('w', delete=False) as tf:
             tmpfile = tf.name
@@ -274,7 +272,35 @@ class GitApplyTree(PatchTree):
             cmd.append('--date="%s"' % date)
         return (tmpfile, cmd)
 
+    @staticmethod
+    def extractPatches(tree, startcommit, outdir):
+        import tempfile
+        import shutil
+        tempdir = tempfile.mkdtemp(prefix='oepatch')
+        try:
+            shellcmd = ["git", "format-patch", startcommit, "-o", tempdir]
+            out = runcmd(["sh", "-c", " ".join(shellcmd)], tree)
+            if out:
+                for srcfile in out.split():
+                    patchlines = []
+                    outfile = None
+                    with open(srcfile, 'r') as f:
+                        for line in f:
+                            if line.startswith(GitApplyTree.patch_line_prefix):
+                                outfile = line.split()[-1].strip()
+                                continue
+                            patchlines.append(line)
+                    if not outfile:
+                        outfile = os.path.basename(srcfile)
+                    with open(os.path.join(outdir, outfile), 'w') as of:
+                        for line in patchlines:
+                            of.write(line)
+        finally:
+            shutil.rmtree(tempdir)
+
     def _applypatch(self, patch, force = False, reverse = False, run = True):
+        import shutil
+
         def _applypatchhelper(shellcmd, patch, force = False, reverse = False, run = True):
             if reverse:
                 shellcmd.append('-R')
@@ -286,36 +312,62 @@ class GitApplyTree(PatchTree):
 
             return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
 
+        # Add hooks which add a pointer to the original patch file name in the commit message
+        commithook = os.path.join(self.dir, '.git', 'hooks', 'commit-msg')
+        commithook_backup = commithook + '.devtool-orig'
+        applyhook = os.path.join(self.dir, '.git', 'hooks', 'applypatch-msg')
+        applyhook_backup = applyhook + '.devtool-orig'
+        if os.path.exists(commithook):
+            shutil.move(commithook, commithook_backup)
+        if os.path.exists(applyhook):
+            shutil.move(applyhook, applyhook_backup)
+        with open(commithook, 'w') as f:
+            # NOTE: the formatting here is significant; if you change it you'll also need to
+            # change other places which read it back
+            f.write('echo >> $1\n')
+            f.write('echo "%s: $PATCHFILE" >> $1\n' % GitApplyTree.patch_line_prefix)
+        os.chmod(commithook, 0755)
+        shutil.copy2(commithook, applyhook)
         try:
-            shellcmd = ["git", "--work-tree=.", "am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
-            return _applypatchhelper(shellcmd, patch, force, reverse, run)
-        except CmdError:
-            # Need to abort the git am, or we'll still be within it at the end
-            try:
-                shellcmd = ["git", "--work-tree=.", "am", "--abort"]
-                runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-            except CmdError:
-                pass
-            # Fall back to git apply
-            shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
+            patchfilevar = 'PATCHFILE="%s"' % os.path.basename(patch['file'])
             try:
-                output = _applypatchhelper(shellcmd, patch, force, reverse, run)
+                shellcmd = [patchfilevar, "git", "--work-tree=.", "am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
+                return _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
-                # Fall back to patch
-                output = PatchTree._applypatch(self, patch, force, reverse, run)
-            # Add all files
-            shellcmd = ["git", "add", "-f", "."]
-            output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-            # Exclude the patches directory
-            shellcmd = ["git", "reset", "HEAD", self.patchdir]
-            output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-            # Commit the result
-            (tmpfile, shellcmd) = self.prepareCommit(patch['file'])
-            try:
+                # Need to abort the git am, or we'll still be within it at the end
+                try:
+                    shellcmd = ["git", "--work-tree=.", "am", "--abort"]
+                    runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+                except CmdError:
+                    pass
+                # Fall back to git apply
+                shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
+                try:
+                    output = _applypatchhelper(shellcmd, patch, force, reverse, run)
+                except CmdError:
+                    # Fall back to patch
+                    output = PatchTree._applypatch(self, patch, force, reverse, run)
+                # Add all files
+                shellcmd = ["git", "add", "-f", "."]
+                output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+                # Exclude the patches directory
+                shellcmd = ["git", "reset", "HEAD", self.patchdir]
                 output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-            finally:
-                os.remove(tmpfile)
-            return output
+                # Commit the result
+                (tmpfile, shellcmd) = self.prepareCommit(patch['file'])
+                try:
+                    shellcmd.insert(0, patchfilevar)
+                    output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+                finally:
+                    os.remove(tmpfile)
+                return output
+        finally:
+            os.remove(commithook)
+            os.remove(applyhook)
+            if os.path.exists(commithook_backup):
+                shutil.move(commithook_backup, commithook)
+            if os.path.exists(applyhook_backup):
+                shutil.move(applyhook_backup, applyhook)
 
 
 class QuiltTree(PatchSet):
-- 
1.9.3


