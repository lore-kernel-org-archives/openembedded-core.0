Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A48060746
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:38:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2016 05:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1000491762"
Received: from lwong9-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.13])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2016 05:38:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jul 2016 00:38:09 +1200
Message-Id: <7db748b32e32d5863921f15797b987b0f113990d.1469190931.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/8] classes/populate_sdk_ext: allow including toolchain in eSDK on install
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
X-List-Received-Date: Fri, 22 Jul 2016 12:38:49 -0000

If we're to completely replace the standard SDK with the extensible SDK,
we need to be able to provide the standard toolchain on install without
doing anything other than installing it, so that you can install the SDK
and then point your IDE at it. This is particularly applicable to the
minimal SDK which normally installs nothing by default.

NOTE: enabling this option currently adds ~280MB to the size of the
minimal eSDK installer. If we need to reduce this further we would have
to look at adjusting the dependencies and/or the sstate_depvalid()
function in sstate.bbclass which eliminates dependencies, or look at
reducing the size of the artifacts themselves.

Implements [YOCTO #9751].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass           | 19 ++++++++++++++++++-
 meta/lib/oe/copy_buildsystem.py                 |  5 +++--
 meta/recipes-core/meta/meta-extsdk-toolchain.bb | 15 +++++++++++++++
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 720142f..211a022 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -21,6 +21,7 @@ SDK_EXT_task-populate-sdk-ext = "-ext"
 # Options are full or minimal
 SDK_EXT_TYPE ?= "full"
 SDK_INCLUDE_PKGDATA ?= "0"
+SDK_INCLUDE_TOOLCHAIN ?= "0"
 
 SDK_RECRDEP_TASKS ?= ""
 
@@ -54,6 +55,8 @@ def get_sdk_install_targets(d, images_only=False):
     if not images_only:
         if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
             sdk_install_targets += ' meta-world-pkgdata:do_allpackagedata'
+        if d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1':
+            sdk_install_targets += ' meta-extsdk-toolchain:do_populate_sysroot'
 
     return sdk_install_targets
 
@@ -309,6 +312,19 @@ python copy_buildsystem () {
                                              lockedsigs_pruned,
                                              lockedsigs_copy)
 
+    if d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1':
+        lockedsigs_base = d.getVar('WORKDIR', True) + '/locked-sigs-base2.inc'
+        lockedsigs_toolchain = d.getVar('STAGING_DIR_HOST', True) + '/locked-sigs/locked-sigs-extsdk-toolchain.inc'
+        shutil.move(lockedsigs_pruned, lockedsigs_base)
+        oe.copy_buildsystem.merge_lockedsigs(['do_populate_sysroot'],
+                                             lockedsigs_base,
+                                             lockedsigs_toolchain,
+                                             lockedsigs_pruned)
+        oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_toolchain,
+                                                       d.getVar('SSTATE_DIR', True),
+                                                       sstate_out, d,
+                                                       fixedlsbstring)
+
     if d.getVar('SDK_EXT_TYPE', True) == 'minimal':
         if derivative:
             # Assume the user is not going to set up an additional sstate
@@ -486,7 +502,8 @@ do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
 
 do_populate_sdk_ext[depends] = "${@d.getVarFlag('do_populate_sdk', 'depends', False)} \
                                 buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk \
-                                ${@'meta-world-pkgdata:do_collect_packagedata' if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1' else ''}"
+                                ${@'meta-world-pkgdata:do_collect_packagedata' if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1' else ''} \
+                                ${@'meta-extsdk-toolchain:do_locked_sigs' if d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1' else ''}"
 
 do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS', True).split()])}"
 
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index eddf5bb..b5f546f 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -145,7 +145,7 @@ def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output
                     invalue = True
                     f.write(line)
 
-def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_output, copy_output):
+def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_output, copy_output=None):
     merged = {}
     arch_order = []
     with open(lockedsigs_main, 'r') as f:
@@ -195,7 +195,8 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
                     fulltypes.append(typename)
             f.write('SIGGEN_LOCKEDSIGS_TYPES = "%s"\n' % ' '.join(fulltypes))
 
-    write_sigs_file(copy_output, list(tocopy.keys()), tocopy)
+    if copy_output:
+        write_sigs_file(copy_output, list(tocopy.keys()), tocopy)
     if merged_output:
         write_sigs_file(merged_output, arch_order, merged)
 
diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 9bff220..886ff07 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -11,3 +11,18 @@ do_populate_sysroot[deptask] = "do_populate_sysroot"
 # NOTE: There is logic specific to this recipe in setscene_depvalid()
 # within sstate.bbclass, so if you copy or rename this and expect the same
 # functionality you'll need to modify that as well.
+
+LOCKED_SIGS_INDIR = "${D}/locked-sigs"
+
+addtask do_locked_sigs after do_populate_sysroot
+SSTATETASKS += "do_locked_sigs"
+do_locked_sigs[sstate-inputdirs] = "${LOCKED_SIGS_INDIR}"
+do_locked_sigs[sstate-outputdirs] = "${STAGING_DIR_HOST}/locked-sigs"
+
+python do_locked_sigs() {
+    import oe.copy_buildsystem
+    outdir = os.path.join(d.getVar('LOCKED_SIGS_INDIR', True))
+    bb.utils.mkdirhier(outdir)
+    sigfile = os.path.join(outdir, 'locked-sigs-extsdk-toolchain.inc')
+    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
+}
-- 
2.5.5


