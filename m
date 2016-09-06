Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C6C5E774FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:03:58 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 03:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5042680"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 03:03:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 22:03:22 +1200
Message-Id: <d4044adfd000c8b67ed9b523bfbfc49ca97e8fa7.1473155977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/9] lib/oe/patch: handle non-UTF8 encoding when reading patches
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
X-List-Received-Date: Tue, 06 Sep 2016 10:03:59 -0000

When extracting patches from a git repository with PATCHTOOL = "git" we
cannot assume that all patches will be UTF-8 formatted, so as with other
places in this module, try latin-1 if utf-8 fails.

This fixes UnicodeDecodeError running devtool update-recipe or devtool
finish on the openssl recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index cad5015..05e0faa 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -415,16 +415,24 @@ class GitApplyTree(PatchTree):
             out = runcmd(["sh", "-c", " ".join(shellcmd)], tree)
             if out:
                 for srcfile in out.split():
-                    patchlines = []
-                    outfile = None
-                    with open(srcfile, 'r') as f:
-                        for line in f:
-                            if line.startswith(GitApplyTree.patch_line_prefix):
-                                outfile = line.split()[-1].strip()
-                                continue
-                            if line.startswith(GitApplyTree.ignore_commit_prefix):
-                                continue
-                            patchlines.append(line)
+                    for encoding in ['utf-8', 'latin-1']:
+                        patchlines = []
+                        outfile = None
+                        try:
+                            with open(srcfile, 'r', encoding=encoding) as f:
+                                for line in f:
+                                    if line.startswith(GitApplyTree.patch_line_prefix):
+                                        outfile = line.split()[-1].strip()
+                                        continue
+                                    if line.startswith(GitApplyTree.ignore_commit_prefix):
+                                        continue
+                                    patchlines.append(line)
+                        except UnicodeDecodeError:
+                            continue
+                        break
+                    else:
+                        raise PatchError('Unable to find a character encoding to decode %s' % srcfile)
+
                     if not outfile:
                         outfile = os.path.basename(srcfile)
                     with open(os.path.join(outdir, outfile), 'w') as of:
-- 
2.5.5


