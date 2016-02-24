Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDF077397
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305662"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:29 +1300
Message-Id: <c12b6e0b8ef5e8ee2809dd5d9a17190bcf7b262d.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/14] devtool: upgrade: fix several issues with extraction of new source
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:19 -0000

Fix several issues when extracting the new version source over the top
of the old one (when the recipe is not fetching from a git repo):

* Delete the old source first so we ensure files deleted in the new
  version are deleted. This also has the side-effect of fixing any
  issues where files aren't marked writeable in the old source and thus
  overwriting them failed (harfbuzz 1.1.3 contains such files).
* Fix incorrect variable name in abspath statement that made it a no-op

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index fab7b15..fae20ef 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -188,9 +188,19 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
             raise DevtoolError(e)
 
         tmpsrctree = _get_srctree(tmpdir)
+        srctree = os.path.abspath(srctree)
+
+        # Delete all sources so we ensure no stray files are left over
+        for item in os.listdir(srctree):
+            if item in ['.git', 'oe-local-files']:
+                continue
+            itempath = os.path.join(srctree, item)
+            if os.path.isdir(itempath):
+                shutil.rmtree(itempath)
+            else:
+                os.remove(itempath)
 
-        scrtree = os.path.abspath(srctree)
-
+        # Copy in new ones
         _copy_source_code(tmpsrctree, srctree)
 
         (stdout,_) = __run('git ls-files --modified --others --exclude-standard')
-- 
2.5.0


