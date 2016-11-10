Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A74CF60720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 01:45:49 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 17:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,616,1473145200"; d="scan'208";a="189697332"
Received: from yspay-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.149])
	by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2016 17:45:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 14:45:14 +1300
Message-Id: <5a9b5fccb4378b66b71e0fbfdb4ae3139d30effa.1478742229.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] devtool: update-recipe: check output before treating it as a string
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
X-List-Received-Date: Thu, 10 Nov 2016 01:45:49 -0000

As of the move to Python 3 and the fixes we applied at that time,
bb.process.run() will return a byte array of length 0 rather than an
empty string if the output is empty. That may be a bug that we should
fix, but for now it's easiest to just check the result here before
treating it as a string. This fixes running "devtool update-recipe" or
"devtool finish" on a recipe which has no source tree, for example
initramfs-framework.

Fixes [YOCTO #10563].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4523048..1511641 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -332,10 +332,11 @@ def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
         cmd.append('-r')
     out, _ = bb.process.run(cmd, cwd=repodir)
     ret = {}
-    for line in out.split('\0'):
-        if line:
-            split = line.split(None, 4)
-            ret[split[3]] = split[0:3]
+    if out:
+        for line in out.split('\0'):
+            if line:
+                split = line.split(None, 4)
+                ret[split[3]] = split[0:3]
     return ret
 
 def _git_exclude_path(srctree, path):
-- 
2.5.5


