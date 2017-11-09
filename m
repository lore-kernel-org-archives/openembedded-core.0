Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B195178519
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401019"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:08 +1300
Message-Id: <1557899cb44cb97a7443cc5ab9b9f00289b5574a.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/24] devtool: upgrade: improve performance and show progress when adding files
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:29 -0000

When devtool upgrade is upgrading to a new version where the source is
fetched as an archive (e.g. a tarball), we create a single commit in the
git repository that is the upgrade from the old version to the new. We
do this by extracting the old source, committing it, deleting all files,
copying in the new files, running git add on each new/changed/deleted
file, and then committing the result. When a lot of files have changed
in an upgrade (such as QEMU 2.8.1.1 -> 2.10.0) the penultimate step of
running git add it can take quite a long time; in order to reduce this
and show some feedback to the user, run git add with batches of 100
files at once and also show a progress bar. In a local test with the
aforementioned QEMU upgrade it took the time down from over 7 minutes
down to about 13 seconds.

Fixes [YOCTO #11948].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 073002b..441dd35 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -251,8 +251,15 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         _copy_source_code(tmpsrctree, srctree)
 
         (stdout,_) = __run('git ls-files --modified --others --exclude-standard')
-        for f in stdout.splitlines():
-            __run('git add -A "%s"' % f)
+        filelist = stdout.splitlines()
+        pbar = bb.ui.knotty.BBProgress('Adding changed files', len(filelist))
+        pbar.start()
+        batchsize = 100
+        for i in range(0, len(filelist), batchsize):
+            batch = filelist[i:i+batchsize]
+            __run('git add -A %s' % ' '.join(['"%s"' % item for item in batch]))
+            pbar.update(i)
+        pbar.finish()
 
         useroptions = []
         oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=rd)
-- 
2.9.5


