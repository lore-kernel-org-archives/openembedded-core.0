Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A158A78D20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 13:12:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 06:12:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,427,1526367600"; d="scan'208";a="220570197"
Received: from unknown (HELO localhost.intel.com) ([10.103.239.194])
	by orsmga004.jf.intel.com with ESMTP; 31 Jul 2018 06:12:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 14:11:53 +0100
Message-Id: <20180731131153.29464-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oe-selftest: devtool: avoid parallel races by using temporary copy of core
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
X-List-Received-Date: Tue, 31 Jul 2018 13:12:01 -0000

Some of the devtool tests make changes to files under meta/ -
legitimately since we want these tests to be working with real recipes
and associated files. Unfortunately with the new oe-selftest
parallelisation this can break other tests if files go missing at the
wrong time (among other scenarios). To avoid this issue, simply take a
copy of the core repository and use that for these tests. (We copy the
entire repository since changing the path of meta/ influences COREBASE
and thus we need to have things like scripts/ alongside as well).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 64 +++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 43a66c8e283..3c1189003de 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -11,6 +11,70 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
 from oeqa.core.decorator.oeid import OETestID
 
+oldmetapath = None
+
+def setUpModule():
+    import bb.utils
+
+    global templayerdir
+    templayerdir = tempfile.mkdtemp(prefix='devtoolqa')
+    corecopydir = os.path.join(templayerdir, 'core-copy')
+    bblayers_conf = os.path.join(os.environ['BUILDDIR'], 'conf', 'bblayers.conf')
+    edited_layers = []
+
+    # We need to take a copy of the meta layer so we can modify it and not
+    # have any races against other tests that might be running in parallel
+    # however things like COREBASE mean that you can't just copy meta, you
+    # need the whole repository.
+    def bblayers_edit_cb(layerpath, canonical_layerpath):
+        global oldmetapath
+        if not canonical_layerpath.endswith('/'):
+            # This helps us match exactly when we're using this path later
+            canonical_layerpath += '/'
+        if not edited_layers and canonical_layerpath.endswith('/meta/'):
+            edited_layers.append(layerpath)
+            oldmetapath = layerpath
+            result = runCmd('git rev-parse --show-toplevel', cwd=canonical_layerpath)
+            oldreporoot = result.output.rstrip()
+            newmetapath = os.path.join(corecopydir, os.path.relpath(oldmetapath, oldreporoot))
+            runCmd('git clone %s %s' % (oldreporoot, corecopydir), cwd=templayerdir)
+            # Now we need to copy any modified files
+            # You might ask "why not just copy the entire tree instead of
+            # cloning and doing this?" - well, the problem with that is
+            # TMPDIR or an equally large subdirectory might exist
+            # under COREBASE and we don't want to copy that, so we have
+            # to be selective.
+            result = runCmd('git status --porcelain', cwd=oldreporoot)
+            for line in result.output.splitlines():
+                if line.startswith(' M ') or line.startswith('?? '):
+                    relpth = line.split()[1]
+                    pth = os.path.join(oldreporoot, relpth)
+                    if pth.startswith(canonical_layerpath):
+                        if relpth.endswith('/'):
+                            destdir = os.path.join(corecopydir, relpth)
+                            shutil.copytree(pth, destdir)
+                        else:
+                            destdir = os.path.join(corecopydir, os.path.dirname(relpth))
+                            bb.utils.mkdirhier(destdir)
+                            shutil.copy2(pth, destdir)
+            return newmetapath
+        else:
+            return layerpath
+    bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
+
+def tearDownModule():
+    if oldmetapath:
+        edited_layers = []
+        def bblayers_edit_cb(layerpath, canonical_layerpath):
+            if not edited_layers and canonical_layerpath.endswith('/meta'):
+                edited_layers.append(layerpath)
+                return oldmetapath
+            else:
+                return layerpath
+        bblayers_conf = os.path.join(os.environ['BUILDDIR'], 'conf', 'bblayers.conf')
+        bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
+    shutil.rmtree(templayerdir)
+
 class DevtoolBase(OESelftestTestCase):
 
     @classmethod
-- 
2.17.1


