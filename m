Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B6406731D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 21:39:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 13:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,285,1449561600"; d="scan'208";a="889200394"
Received: from rusilaw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.174])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2016 13:39:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 10:39:03 +1300
Message-Id: <ea9660989f55814d4db0c6489dd8689c1b341242.1452634698.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452634698.git.paul.eggleton@linux.intel.com>
References: <cover.1452634698.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452634698.git.paul.eggleton@linux.intel.com>
References: <cover.1452634698.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/populate_sdk_ext: avoid unnecessary sstate being brought in
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
X-List-Received-Date: Tue, 12 Jan 2016 21:39:32 -0000

Create a separate task where we can just have the recursive dependencies
for the tasks corresponding to constructing the SDK content (i.e. from
the image contents). This avoids us recursing into dependencies from
buildtools and getting a bunch of nativesdk stuff, for example.

(This isn't an ideal way to have to implement it, but without
overcomplicating things on the BitBake side just for this use-case I
can't see a better way.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 4d8d2a6..2f788ee 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -182,11 +182,9 @@ python copy_buildsystem () {
                 if line.strip() and not line.startswith('#'):
                     f.write(line)
 
-    sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
-    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
-
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = d.getVar('SDK_TARGETS', True)
+    sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     oe.copy_buildsystem.prune_lockedsigs([],
                                          excluded_targets.split(),
@@ -288,6 +286,24 @@ fakeroot python do_populate_sdk_ext() {
     bb.build.exec_func("do_populate_sdk", d)
 }
 
+def get_ext_sdk_depends(d):
+    return d.getVarFlag('do_rootfs', 'depends', True) + ' ' + d.getVarFlag('do_build', 'depends', True)
+
+python do_sdk_depends() {
+    # We have to do this separately in its own task so we avoid recursing into
+    # dependencies we don't need to (e.g. buildtools-tarball) and bringing those
+    # into the SDK's sstate-cache
+    import oe.copy_buildsystem
+    sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
+    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
+}
+addtask sdk_depends
+
+do_sdk_depends[dirs] = "${WORKDIR}"
+do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)}"
+do_sdk_depends[recrdeptask] = "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
+do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy"
+
 def get_sdk_ext_rdepends(d):
     localdata = d.createCopy()
     localdata.appendVar('OVERRIDES', ':task-populate-sdk-ext')
@@ -297,15 +313,12 @@ def get_sdk_ext_rdepends(d):
 do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
 do_populate_sdk_ext[depends] += "${@d.getVarFlag('do_populate_sdk', 'depends', False)}"
 do_populate_sdk_ext[rdepends] = "${@get_sdk_ext_rdepends(d)}"
-do_populate_sdk_ext[recrdeptask] += "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
-
 
 do_populate_sdk_ext[depends] += "buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk"
 
 do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS', True).split()])}"
-do_populate_sdk_ext[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy"
 
 # Make sure codes change in copy_buildsystem can result in rebuilt
 do_populate_sdk_ext[vardeps] += "copy_buildsystem"
 
-addtask populate_sdk_ext
+addtask populate_sdk_ext after do_sdk_depends
-- 
2.5.0


