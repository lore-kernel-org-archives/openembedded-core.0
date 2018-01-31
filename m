Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 824D878421
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 19:32:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2018 11:32:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,441,1511856000"; d="scan'208";a="14501289"
Received: from fungyihn-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.61])
	by orsmga008.jf.intel.com with ESMTP; 31 Jan 2018 11:32:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 08:32:07 +1300
Message-Id: <6546ec5084e19e1de98fc9cfad96e27a3f4ea2ee.1517427017.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1517427017.git.paul.eggleton@linux.intel.com>
References: <cover.1517427017.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] devtool: set up git repos so that singletask.lock is ignored
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
X-List-Received-Date: Wed, 31 Jan 2018 19:32:44 -0000

singletask.lock is written out while certain tasks execute for recipes
that have externalsrc.bbclass enabled - this includes recipes in
devtool's workspace. It appears that there's a race where
singletask.lock will be there one minute and then when we try to get the
file checksum of it (since we want to know if anything in the source
tree has changed) it will be gone, and git chokes. To fix that, add
singletask.lock to .git/info/exclude in the repository, regardless of
whether we created the repository or not. In any case singletask.lock
should never be tracked by git, so this is a good thing to be doing for
that reason as well.

This fixes oe-selftest failures in test_devtool_modify that we've seen
on the Yocto Project autobuilder:

bb.data_smart.ExpansionError: Failure expanding variable
do_compile[file-checksums], expression was ${@srctree_hash_files(d)}
which triggered exception CalledProcessError: Command
'['git', 'add', '-A', '.']' returned non-zero exit status 128.

Note that this only fixes this issue for devtool; if you are using
externalsrc independently of devtool there's a chance this will still
be an issue unless you add singletask.lock to your .gitignore.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 07d774d..89f098a 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -220,6 +220,20 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
         commit_cmd += ['-m', commitmsg]
         bb.process.run(commit_cmd, cwd=repodir)
 
+    # Ensure singletask.lock (as used by externalsrc.bbclass) is ignored by git
+    excludes = []
+    excludefile = os.path.join(repodir, '.git', 'info', 'exclude')
+    try:
+        with open(excludefile, 'r') as f:
+            excludes = f.readlines()
+    except FileNotFoundError:
+        pass
+    if 'singletask.lock\n' not in excludes:
+        excludes.append('singletask.lock\n')
+    with open(excludefile, 'w') as f:
+        for line in excludes:
+            f.write(line)
+
     bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
     bb.process.run('git tag -f %s' % basetag, cwd=repodir)
 
-- 
2.9.5


