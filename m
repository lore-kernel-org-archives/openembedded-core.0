Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4580673D76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 09:16:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2015 02:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,675,1422950400"; d="scan'208";a="487591080"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2015 02:16:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 12:16:09 +0300
Message-Id: <1430385372-6975-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] oe.patch.GitApplyTree: add paths argument to extractPatches
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
X-List-Received-Date: Thu, 30 Apr 2015 09:16:21 -0000

Makes it possible to define which paths are included in the patches.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/patch.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f68d40f..85cb2c1 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -273,12 +273,15 @@ class GitApplyTree(PatchTree):
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


