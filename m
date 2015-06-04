Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BC16B7580C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:32:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2015 09:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,553,1427785200"; d="scan'208";a="705387174"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Jun 2015 09:32:04 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 19:31:48 +0300
Message-Id: <1433435514-28677-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 04/10] devtool: simplify the logic of determining patches to be removed
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
X-List-Received-Date: Thu, 04 Jun 2015 16:32:05 -0000

A slight simplification of the code.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c8ba247..aa95e6e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -657,26 +657,23 @@ def update_recipe(args, config, basepath, workspace):
         existing_patches = oe.recipeutils.get_recipe_patches(rd)
 
         removepatches = []
-        seqpatch_re = re.compile('^[0-9]{4}-')
+        seqpatch_re = re.compile('^([0-9]{4}-)?(.+)')
         if not args.no_remove:
             # Get all patches from source tree and check if any should be removed
             tempdir = tempfile.mkdtemp(prefix='devtool')
             try:
                 GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
-                newpatches = os.listdir(tempdir)
+                # Strip numbering from patch names. If it's a git sequence
+                # named patch, the numbers might not match up since we are
+                # starting from a different revision This does assume that
+                # people are using unique shortlog values, but they ought to be
+                # anyway...
+                newpatches = [seqpatch_re.match(fname).group(2) for fname in
+                              os.listdir(tempdir)]
                 for patch in existing_patches:
-                    # If it's a git sequence named patch, the numbers might not match up
-                    # since we are starting from a different revision
-                    # This does assume that people are using unique shortlog values, but
-                    # they ought to be anyway...
-                    patchfile = os.path.basename(patch)
-                    if seqpatch_re.search(patchfile):
-                        for newpatch in newpatches:
-                            if seqpatch_re.search(newpatch) and patchfile[5:] == newpatch[5:]:
-                                break
-                            else:
-                                removepatches.append(patch)
-                    elif patchfile not in newpatches:
+                    basename = seqpatch_re.match(
+                                    os.path.basename(patch)).group(2)
+                    if basename not in newpatches:
                         removepatches.append(patch)
             finally:
                 shutil.rmtree(tempdir)
-- 
2.1.4


