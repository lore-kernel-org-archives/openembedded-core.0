Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 166D37576E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:50:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 07:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,547,1427785200"; d="scan'208";a="704663472"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 07:50:39 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 17:50:27 +0300
Message-Id: <1433343032-4559-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/7] oe.patch.GitApplyTree: add paths argument to extractPatches
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
X-List-Received-Date: Wed, 03 Jun 2015 14:51:00 -0000

Makes it possible to define which paths are included in the patches.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/patch.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index afb0013..6da2511 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -337,12 +337,15 @@ class GitApplyTree(PatchTree):
         return (tmpfile, cmd)
 
     @staticmethod
-    def extractPatches(tree, startcommit, outdir):
+    def extractPatches(tree, startcommit, outdir, paths=None):
         import tempfile
         import shutil
         tempdir = tempfile.mkdtemp(prefix='oepatch')
         try:
             shellcmd = ["git", "format-patch", startcommit, "-o", tempdir]
+            if paths:
+                shellcmd.append('--')
+                shellcmd.extend(paths)
             out = runcmd(["sh", "-c", " ".join(shellcmd)], tree)
             if out:
                 for srcfile in out.split():
-- 
2.1.4


