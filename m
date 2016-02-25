Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1571177346
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:29:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2016 06:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="911117099"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2016 06:29:49 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 16:29:47 +0200
Message-Id: <1456410587-7337-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1456410587-7337-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1456410587-7337-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2] externalsrc.bbclas: remove nostamp from do_configure
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
X-List-Received-Date: Thu, 25 Feb 2016 14:29:50 -0000

Be a bit more intelligent than mindlessly re-compiling every time.
Instead of using 'nostamp' flag for do_compile run a python function to
get a list of files to add as 'file-checksums' flag.  The intention is
to only re-run do_compile if something in the source tree content
changes.

This python function, srctree_hash_files(), works differently, depending
if the source tree is a git repository clone or not. If the source tree
is a git repository, the function runs 'git add .' with a custom git
index file in order to record all changes in the git working tree. This
custom index file is then returned as the file for the task to depend
on. The index file is changed if any changes are made in the source tree
causing the task to be re-run.

If the source tree is not a git repository, srctree_hash_files() simply
adds the whole source tree as a dependency, causing bitbake to basically
hash every file in it. Hidden files and directories in the source tree
root are ignored by the glob currently used. This has the advantage of
automatically ignoring .git directory, for example.

This method of tracking changes source tree changes to determine if
re-build is needed does not work perofectly, though. Many packages are
built under ${S} which effectively changes the source tree causing some
unwanted re-compilations.  However, if do_compile of the recipe does not
produce new/different artefacts on every run (as commonly is and should
be the case) the re-compilation loop stops. Thus, you should usually see
only one re-compilation (if any) after which the source tree is
"stabilized" and no more re-compilations happen.

During the first bitbake run preparing of the task runqueue may take
much longer if the source tree is not a git repository. The reason is
that all the files in the source tree are hashed.  Subsequent builds are
not significantly slower because (most) file hashes are found from the
cache.

[YOCTO #8853]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index b608bd0..4f25bcf 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -85,8 +85,7 @@ python () {
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
 
-        # Ensure compilation happens every time
-        d.setVarFlag('do_compile', 'nostamp', '1')
+        d.setVarFlag('do_compile', 'file-checksums', '${@srctree_hash_files(d)}')
 
         # We don't want the workdir to go away
         d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN', True))
@@ -125,3 +124,25 @@ python externalsrc_compile_prefunc() {
     # Make it obvious that this is happening, since forgetting about it could lead to much confusion
     bb.plain('NOTE: %s: compiling from external source tree %s' % (d.getVar('PN', True), d.getVar('EXTERNALSRC', True)))
 }
+
+def srctree_hash_files(d):
+    import shutil
+    import subprocess
+
+    s_dir = d.getVar('EXTERNALSRC', True)
+    git_dir = os.path.join(s_dir, '.git')
+    oe_index_file = os.path.join(git_dir, 'oe-devtool-index')
+
+    ret = " "
+    if os.path.exists(git_dir):
+        # Clone index
+        if not os.path.exists(oe_index_file):
+            shutil.copy2(os.path.join(git_dir, 'index'), oe_index_file)
+        # Update our custom index
+        env = os.environ.copy()
+        env['GIT_INDEX_FILE'] = oe_index_file
+        subprocess.check_output(['git', 'add', '.'], cwd=s_dir, env=env)
+        ret = oe_index_file + ':True'
+    else:
+        ret = d.getVar('EXTERNALSRC') + '/*:True'
+    return ret
-- 
2.6.2


