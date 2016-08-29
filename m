Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 819256FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 08:41:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2016 01:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,595,1464678000"; d="scan'208";a="1032568775"
Received: from aupadhy1-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.181.46])
	by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2016 01:41:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 20:40:38 +1200
Message-Id: <47033fea9505f23e66c1543a5af5849d2325b099.1472459569.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1472459569.git.paul.eggleton@linux.intel.com>
References: <cover.1472459569.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1472459569.git.paul.eggleton@linux.intel.com>
References: <cover.1472459569.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] lib/oe/patch: commit with a dummy user/email when PATCHTOOL=git
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
X-List-Received-Date: Mon, 29 Aug 2016 08:41:54 -0000

When using PATCHTOOL = "git", the user of the system is not really the
committer - it's the build system itself. Thus, specify "dummy" values
for username and email instead of using the user's configured values.
Various parts of the devtool code that need to make commits have also
been updated to use the same logic.

This allows PATCHTOOL = "git" and devtool to be used on systems where
git user.name / user.email has not been set (on versions of git where
it doesn't default a value under this circumstance).

If you want to return to the old behaviour where the externally
configured user name / email are used, set the following in your
local.conf:

PATCH_GIT_USER_NAME = ""
PATCH_GIT_USER_EMAIL = ""

Fixes [YOCTO #8703].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/patch.bbclass      |  3 +++
 meta/lib/oe/patch.py            | 24 ++++++++++++++++++++----
 scripts/lib/devtool/__init__.py |  7 +++++--
 scripts/lib/devtool/standard.py | 19 +++++++++++--------
 scripts/lib/devtool/upgrade.py  |  4 +++-
 5 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 3d22ad8..1f6927b 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -5,6 +5,9 @@ QUILTRCFILE ?= "${STAGING_ETCDIR_NATIVE}/quiltrc"
 
 PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
 
+PATCH_GIT_USER_NAME ?= "OpenEmbedded"
+PATCH_GIT_USER_EMAIL ?= "oe.patch@oe"
+
 inherit terminal
 
 def src_patches(d, all = False ):
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index af3adec..cad5015 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -281,6 +281,8 @@ class GitApplyTree(PatchTree):
 
     def __init__(self, dir, d):
         PatchTree.__init__(self, dir, d)
+        self.commituser = d.getVar('PATCH_GIT_USER_NAME', True)
+        self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL', True)
 
     @staticmethod
     def extractPatchHeader(patchfile):
@@ -348,7 +350,17 @@ class GitApplyTree(PatchTree):
         return outlines, author, date, subject
 
     @staticmethod
-    def prepareCommit(patchfile):
+    def gitCommandUserOptions(cmd, commituser=None, commitemail=None, d=None):
+        if d:
+            commituser = d.getVar('PATCH_GIT_USER_NAME', True)
+            commitemail = d.getVar('PATCH_GIT_USER_EMAIL', True)
+        if commituser:
+            cmd += ['-c', 'user.name="%s"' % commituser]
+        if commitemail:
+            cmd += ['-c', 'user.email="%s"' % commitemail]
+
+    @staticmethod
+    def prepareCommit(patchfile, commituser=None, commitemail=None):
         """
         Prepare a git commit command line based on the header from a patch file
         (typically this is useful for patches that cannot be applied with "git am" due to formatting)
@@ -380,7 +392,9 @@ class GitApplyTree(PatchTree):
             for line in outlines:
                 tf.write(line)
         # Prepare git command
-        cmd = ["git", "commit", "-F", tmpfile]
+        cmd = ["git"]
+        GitApplyTree.gitCommandUserOptions(cmd, commituser, commitemail)
+        cmd += ["commit", "-F", tmpfile]
         # git doesn't like plain email addresses as authors
         if author and '<' in author:
             cmd.append('--author="%s"' % author)
@@ -456,7 +470,9 @@ class GitApplyTree(PatchTree):
         try:
             patchfilevar = 'PATCHFILE="%s"' % os.path.basename(patch['file'])
             try:
-                shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot, "am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
+                shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot]
+                self.gitCommandUserOptions(shellcmd, self.commituser, self.commitemail)
+                shellcmd += ["am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
                 return _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at the end
@@ -486,7 +502,7 @@ class GitApplyTree(PatchTree):
                 shellcmd = ["git", "reset", "HEAD", self.patchdir]
                 output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
                 # Commit the result
-                (tmpfile, shellcmd) = self.prepareCommit(patch['file'])
+                (tmpfile, shellcmd) = self.prepareCommit(patch['file'], self.commituser, self.commitemail)
                 try:
                     shellcmd.insert(0, patchfilevar)
                     output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 216b7c3..b432e3d 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -196,15 +196,18 @@ def use_external_build(same_dir, no_same_dir, d):
         b_is_s = False
     return b_is_s
 
-def setup_git_repo(repodir, version, devbranch, basetag='devtool-base'):
+def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     """
     Set up the git repository for the source tree
     """
     import bb.process
+    import oe.patch
     if not os.path.exists(os.path.join(repodir, '.git')):
         bb.process.run('git init', cwd=repodir)
         bb.process.run('git add .', cwd=repodir)
-        commit_cmd = ['git', 'commit', '-q']
+        commit_cmd = ['git']
+        oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
+        commit_cmd += ['commit', '-q']
         stdout, _ = bb.process.run('git status --porcelain', cwd=repodir)
         if not stdout:
             commit_cmd.append('--allow-empty')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 6874224..0d5a421 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -212,19 +212,19 @@ def add(args, config, basepath, workspace):
     for fn in os.listdir(recipedir):
         _add_md5(config, recipename, os.path.join(recipedir, fn))
 
+    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+    rd = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, None)
+    if not rd:
+        return 1
+
     if args.fetchuri and not args.no_git:
-        setup_git_repo(srctree, args.version, 'devtool')
+        setup_git_repo(srctree, args.version, 'devtool', d=tinfoil.config_data)
 
     initial_rev = None
     if os.path.exists(os.path.join(srctree, '.git')):
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
         initial_rev = stdout.rstrip()
 
-    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
-    rd = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, None)
-    if not rd:
-        return 1
-
     if args.src_subdir:
         srctree = os.path.join(srctree, args.src_subdir)
 
@@ -420,7 +420,10 @@ class BbTaskExecutor(object):
 
 class PatchTaskExecutor(BbTaskExecutor):
     def __init__(self, rdata):
+        import oe.patch
         self.check_git = False
+        self.useroptions = []
+        oe.patch.GitApplyTree.gitCommandUserOptions(self.useroptions, d=rdata)
         super(PatchTaskExecutor, self).__init__(rdata)
 
     def exec_func(self, func, report):
@@ -447,7 +450,7 @@ class PatchTaskExecutor(BbTaskExecutor):
 
             stdout, _ = bb.process.run('git status --porcelain', cwd=srcsubdir)
             if stdout:
-                bb.process.run('git add .; git commit -a -m "Committing changes from %s\n\n%s"' % (func, GitApplyTree.ignore_commit_prefix + ' - from %s' % func), cwd=srcsubdir)
+                bb.process.run('git add .; git %s commit -a -m "Committing changes from %s\n\n%s"' % (' '.join(self.useroptions), func, GitApplyTree.ignore_commit_prefix + ' - from %s' % func), cwd=srcsubdir)
 
 
 def _prep_extract_operation(config, basepath, recipename, tinfoil=None):
@@ -592,7 +595,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
                            "doesn't use any source or the correct source "
                            "directory could not be determined" % pn)
 
-        setup_git_repo(srcsubdir, crd.getVar('PV', True), devbranch)
+        setup_git_repo(srcsubdir, crd.getVar('PV', True), devbranch, d=d)
 
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
         initial_rev = stdout.rstrip()
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index fc2f919..a5063f5 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -227,7 +227,9 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
         for f in stdout.splitlines():
             __run('git add "%s"' % f)
 
-        __run('git commit -q -m "Commit of upstream changes at version %s" --allow-empty' % newpv)
+        useroptions = []
+        oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=rd)
+        __run('git %s commit -q -m "Commit of upstream changes at version %s" --allow-empty' % (' '.join(useroptions), newpv))
         __run('git tag -f devtool-base-%s' % newpv)
 
     (stdout, _) = __run('git rev-parse HEAD')
-- 
2.5.5


