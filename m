Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3338B700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 22:28:32 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2016 14:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,385,1477983600"; d="scan'208";a="45550717"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga005.fm.intel.com with ESMTP; 21 Dec 2016 14:28:33 -0800
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 14:31:46 -0800
Message-Id: <1482359506-85525-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Make locked sig file consistent
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
X-List-Received-Date: Wed, 21 Dec 2016 22:28:33 -0000

Sort keys of dict 'types' prior to dumping, in order to have
identical output every time. This could make it a little easier
to diff these human-readable dumps.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 8224e3a..c5875a8 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -197,7 +197,8 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             types[t].append(k)
 
         with open(sigfile, "w") as f:
-            for t in types:
+            l = sorted(types)
+            for t in l:
                 f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
                 types[t].sort()
                 sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
@@ -208,7 +209,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                         continue
                     f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
                 f.write('    "\n')
-            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(list(types.keys()))))
+            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(l)))
 
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
         warn_msgs = []
-- 
2.7.4


