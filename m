Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA59E605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 22:09:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2016 15:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="674045732"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 15:09:16 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 14:04:00 +0000
Message-Id: <2fd58ccee1ae350ad1a5ede4011ab2acf55c9ff6.1458655100.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1458655100.git.mariano.lopez@linux.intel.com>
References: <cover.1458655100.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1458655100.git.mariano.lopez@linux.intel.com>
References: <cover.1458655100.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/4] archiver.bbclass: Don't expand python functions in dumpdata
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
X-List-Received-Date: Tue, 22 Mar 2016 22:09:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently the dumpdata task expands python data in the datastore, in
some functions this causes a silent error and the task will fail.

The change also rewrite the function to make a bit clearer.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/archiver.bbclass | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b95176b..221c7f4 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -335,14 +335,13 @@ python do_dumpdata () {
     dumpfile = os.path.join(d.getVar('ARCHIVER_OUTDIR', True), \
         '%s-showdata.dump' % d.getVar('PF', True))
     bb.note('Dumping metadata into %s' % dumpfile)
-    f = open(dumpfile, 'w')
-    # emit variables and shell functions
-    bb.data.emit_env(f, d, True)
-    # emit the metadata which isn't valid shell
-    for e in d.keys():
-        if bb.data.getVarFlag(e, 'python', d):
-            f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, True)))
-    f.close()
+    with open(dumpfile, "w") as f:
+        # emit variables and shell functions
+        bb.data.emit_env(f, d, True)
+        # emit the metadata which isn't valid shell
+        for e in d.keys():
+            if d.getVarFlag(e, "python", False):
+                f.write("\npython %s () {\n%s}\n" % (e, d.getVar(e, False)))
 }
 
 SSTATETASKS += "do_deploy_archives"
-- 
2.6.2


