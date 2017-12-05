Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 56A8F7873D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:47 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:41:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181356001"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:14 +1300
Message-Id: <a8eaa169c4dff9c6751c107b6ee88fd2267b165c.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/12] devtool: extract: fix usage with kern-tools-native
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:47 -0000

The kern-tools-native recipe as it currently stands is unusual in that
it fetches source from a repository but sets S = "${WORKDIR}" which
causes some problems. First you get a failure because we're calling "git
commit" unconditionally even if there are no local files, and there
aren't any in this case which means the commit fails.

After that's fixed, we hit another problem where "recipe-sysroot-native"
subdirectory appears in the extracted source tree. We don't want that so
exclude it from copying.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/devtool-source.bbclass | 6 ++++++
 scripts/lib/devtool/standard.py     | 6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 56882a4..540a602 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -118,7 +118,13 @@ python devtool_post_unpack() {
                         os.path.basename(fname) not in recipe_patches]
         srcsubdir = d.getVar('DEVTOOL_PATCH_SRCDIR')
         # Move source files to S
+        excludevars = ['RECIPE_SYSROOT', 'RECIPE_SYSROOT_NATIVE']
+        excludepaths = []
+        for excludevar in excludevars:
+            excludepaths.append(os.path.relpath(d.getVar(excludevar), workdir) + os.sep)
         for path in src_files:
+            if path.startswith(tuple(excludepaths)):
+                continue
             _move_file(os.path.join(workdir, path),
                         os.path.join(srcsubdir, path))
     elif os.path.dirname(srcsubdir) != workdir:
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index cdd2346..a6656e4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -634,9 +634,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                         addfiles.append(os.path.join(relpth, fn))
                 if addfiles:
                     bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
-                useroptions = []
-                oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
-                bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+                    useroptions = []
+                    oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+                    bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
 
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
-- 
2.9.5


