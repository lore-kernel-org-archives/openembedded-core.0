Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ACAF960720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 01:45:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 17:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,616,1473145200"; d="scan'208";a="189697357"
Received: from yspay-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.149])
	by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2016 17:45:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 14:45:16 +1300
Message-Id: <09407cc6b7d5b3b7bd269d7a1e774bed593e8eb8.1478742229.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] lib/oe/patch: fix handling of patches with no header
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
X-List-Received-Date: Thu, 10 Nov 2016 01:45:54 -0000

If a patch applied by a recipe has no header and we turn the recipe's
source into a git tree (when PATCHTOOL = "git" or when using devtool
extract / modify / upgrade), the commit message ends up consisting only
of the original filename marker ("%% original patch: filename.patch").
When we come to do turn the commits back into a set of patches in
extractPatches(), this first line ends up in the "Subject: " part of
the file, but we were ignoring it because the line didn't start with the
marker text. The end result was we weren't able to get the original
patch name. Strip off any "Subject [PATCH x/y]" part before looking for
the marker text to fix.

This caused "devtool modify openssl" followed by "devtool update-recipe
openssl" (without any changes in-between) to remove version-script.patch
because that patch has no header and we weren't able to determine the
original filename.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 0332f10..dbefd28 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -428,6 +428,7 @@ class GitApplyTree(PatchTree):
     def extractPatches(tree, startcommit, outdir, paths=None):
         import tempfile
         import shutil
+        import re
         tempdir = tempfile.mkdtemp(prefix='oepatch')
         try:
             shellcmd = ["git", "format-patch", startcommit, "-o", tempdir]
@@ -443,10 +444,13 @@ class GitApplyTree(PatchTree):
                         try:
                             with open(srcfile, 'r', encoding=encoding) as f:
                                 for line in f:
-                                    if line.startswith(GitApplyTree.patch_line_prefix):
+                                    checkline = line
+                                    if checkline.startswith('Subject: '):
+                                        checkline = re.sub(r'\[.+?\]\s*', '', checkline[9:])
+                                    if checkline.startswith(GitApplyTree.patch_line_prefix):
                                         outfile = line.split()[-1].strip()
                                         continue
-                                    if line.startswith(GitApplyTree.ignore_commit_prefix):
+                                    if checkline.startswith(GitApplyTree.ignore_commit_prefix):
                                         continue
                                     patchlines.append(line)
                         except UnicodeDecodeError:
-- 
2.5.5


