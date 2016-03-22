Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 50F956E660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:02:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Mar 2016 09:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,377,1455004800"; d="scan'208";a="939264234"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2016 09:01:13 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 18:01:09 +0200
Message-Id: <1458662470-20336-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1458662470-20336-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1458662470-20336-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v3 1/2] externalsrc: do not use do_configure[nostamp] for git srctrees
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
X-List-Received-Date: Tue, 22 Mar 2016 16:02:41 -0000

Be a bit more intelligent than mindlessly re-compiling every time.
Instead of always using 'nostamp' flag for do_compile run a python
function to get a list of files to add as 'file-checksums' flag. The
intention is to only re-run do_compile if something in the source tree
content changes.

This python function, srctree_hash_files(), works differently, depending
if the source tree is a git repository clone or not. If the source tree
is a git repository, the function runs 'git add .' and 'git write tree'
to get a hash of the working tree and writes this hash into a file under
the .git directory. This file containing the hash is then returned as
the file for the task to depend on. Hash is changed if any changes are
made in the source tree causing the task to be re-run. A trick is used
to parse the recipe every time so that the hash file gets updated.

If the source tree is not a git repository behaviour remains the same.
In this case srctree_hash_files() currently sets the 'nostamp' flag for
do_compile causing it to be re-run every time.

This method of tracking changes source tree changes to determine if
re-build is needed does not work perofectly, though. Many packages are
built under ${S} which effectively changes the source tree causing some
unwanted re-compilations.  However, if do_compile of the recipe does not
produce new/different artefacts on every run (as commonly is and should
be the case) the re-compilation loop stops. Thus, you should usually see
only one re-compilation (if any) after which the source tree is
"stabilized" and no more re-compilations happen.

[YOCTO #8853]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index d3cede2..f983359 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -85,8 +85,10 @@ python () {
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
 
-        # Ensure compilation happens every time
-        d.setVarFlag('do_compile', 'nostamp', '1')
+        # Force the recipe to be always re-parsed so that the file_checksums
+        # function is run every time
+        d.setVar('BB_DONT_CACHE', '1')
+        d.setVarFlag('do_compile', 'file-checksums', '${@srctree_hash_files(d)}')
 
         # We don't want the workdir to go away
         d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN', True))
@@ -124,3 +126,28 @@ python externalsrc_compile_prefunc() {
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
+    oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
+
+    ret = " "
+    if os.path.exists(git_dir):
+        # Clone index
+        shutil.copy2(os.path.join(git_dir, 'index'), oe_index_file)
+        # Update our custom index
+        env = os.environ.copy()
+        env['GIT_INDEX_FILE'] = oe_index_file
+        subprocess.check_output(['git', 'add', '.'], cwd=s_dir, env=env)
+        sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env)
+        with open(oe_hash_file, 'w') as fobj:
+            fobj.write(sha1)
+        ret = oe_hash_file + ':True'
+    else:
+        d.setVarFlag('do_compile', 'nostamp', '1')
+    return ret
-- 
2.6.2


