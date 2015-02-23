Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 96D797365F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537393"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:38 +0000
Message-Id: <c869bdd23d67ed0253f78fa3829deb5a5a35e1ae.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/9] copy_buildsystem.py: Add methods to copy shared state.
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
X-List-Received-Date: Mon, 23 Feb 2015 17:00:50 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

Added the helper functions necessary to copy the sstate from the
current build, and generate the file to "lock" it.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 5a4d8c3..cf7fada 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -68,3 +68,35 @@ class BuildSystem(object):
                     _smart_copy(layer, layerdestpath)
 
         return layers_copied
+
+def generate_locked_sigs(sigfile, d):
+    bb.utils.mkdirhier(os.path.dirname(sigfile))
+    depd = d.getVar('BB_TASKDEPDATA', True)
+    tasks = ['%s.%s' % (v[2], v[1]) for v in depd.itervalues()]
+    bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
+
+def prune_lockedsigs(allowed_tasks, excluded_targets, lockedsigs, pruned_output):
+    with open(lockedsigs, 'r') as infile:
+        bb.utils.mkdirhier(os.path.dirname(pruned_output))
+        with open(pruned_output, 'w') as f:
+            invalue = False
+            for line in infile:
+                if invalue:
+                    if line.endswith('\\\n'):
+                        splitval = line.strip().split(':')
+                        if splitval[1] in allowed_tasks and not splitval[0] in excluded_targets:
+                            f.write(line)
+                    else:
+                        f.write(line)
+                        invalue = False
+                elif line.startswith('SIGGEN_LOCKEDSIGS'):
+                    invalue = True
+                    f.write(line)
+
+def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring=""):
+    bb.note('Generating sstate-cache...')
+
+    bb.process.run("gen-lockedsig-cache %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache))
+    if fixedlsbstring:
+        os.rename(output_sstate_cache + '/' + d.getVar('NATIVELSBSTRING', True),
+        output_sstate_cache + '/' + fixedlsbstring)
-- 
1.9.3


