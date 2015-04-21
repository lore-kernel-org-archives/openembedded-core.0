Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6236360167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 14:49:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Apr 2015 07:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="683407583"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2015 07:49:55 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 17:49:54 +0300
Message-Id: <1429627794-28895-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH] devtool: extract: remove patches when S=WORKDIR
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
X-List-Received-Date: Tue, 21 Apr 2015 14:49:57 -0000

All local files from the layer, including patches, are added to to
srctree repository when S==WORKDIR. The patch files are useless as they
are automatically applied on top of the srctree by devtool.

This change causes devtool extract to remove these unnecessary (and
possibly confusing) patch file(s). The patches will be removed in one
single commit.

[YOCTO #7602]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a50a771..41bcf86 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -248,6 +248,26 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             else:
                 os.rmdir(patchdir)
 
+        # Find local patches that were "unpacked" to srctree directory
+        patches = []
+        for uri in (crd.getVar('SRC_URI', True) or "").split():
+            if uri.startswith('file://'):
+                fname = os.path.basename(uri).split(';')[0]
+                # Take patch "basename" without the possible compression
+                # extension (.gz etc)
+                match = re.match(r'^(.+\.patch)(\..+)?$', fname)
+                if match:
+                    patches.append(match.group(1))
+        patches = [fname for fname in os.listdir(workdir) if fname in patches]
+
+        # Remove patches if S=WORKDIR so that the unneeded patch files are
+        # not committed into srctree (as they're applied later on)
+        if patches and srcsubdir == workdir:
+            logger.info('Removing patch files...')
+            for patch in patches:
+                os.unlink(os.path.join(workdir, patch))
+
+        # Set-up srctree repo
         if bb.data.inherits_class('kernel-yocto', d):
             (stdout, _) = bb.process.run('git --git-dir="%s" rev-parse HEAD' % crd.expand('${WORKDIR}/git'), cwd=srcsubdir)
             initial_rev = stdout.rstrip()
-- 
2.1.4


