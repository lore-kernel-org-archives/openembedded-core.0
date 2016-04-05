Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AC3E077136
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 13:21:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2016 06:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,444,1455004800"; d="scan'208";a="925820818"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2016 06:21:50 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, paul.eggleton@linux.intel.com
Date: Tue,  5 Apr 2016 16:21:49 +0300
Message-Id: <1459862509-13676-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] externalsrc: avoid race in temporary git index file
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
X-List-Received-Date: Tue, 05 Apr 2016 13:21:51 -0000

Use a unique tempfile as the temporary git index file when determining
the git hash of the source tree. A fixed filename was obviously causing
races (with the git index.lock file) under oe-selftest where multiple
bitbake instances were run against the same source tree at the same
time.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index dff6184..da7eb478 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -130,21 +130,22 @@ python externalsrc_compile_prefunc() {
 def srctree_hash_files(d):
     import shutil
     import subprocess
+    import tempfile
 
     s_dir = d.getVar('EXTERNALSRC', True)
     git_dir = os.path.join(s_dir, '.git')
-    oe_index_file = os.path.join(git_dir, 'oe-devtool-index')
     oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
 
     ret = " "
     if os.path.exists(git_dir):
-        # Clone index
-        shutil.copy2(os.path.join(git_dir, 'index'), oe_index_file)
-        # Update our custom index
-        env = os.environ.copy()
-        env['GIT_INDEX_FILE'] = oe_index_file
-        subprocess.check_output(['git', 'add', '.'], cwd=s_dir, env=env)
-        sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env)
+        with tempfile.NamedTemporaryFile(dir=git_dir, prefix='oe-devtool-index') as tmp_index:
+            # Clone index
+            shutil.copy2(os.path.join(git_dir, 'index'), tmp_index.name)
+            # Update our custom index
+            env = os.environ.copy()
+            env['GIT_INDEX_FILE'] = tmp_index.name
+            subprocess.check_output(['git', 'add', '.'], cwd=s_dir, env=env)
+            sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env)
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
-- 
2.6.2


