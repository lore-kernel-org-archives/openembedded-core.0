Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00281731E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272606"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:48 +1300
Message-Id: <5667550a181e61fd6b168d25bd0acbd76aa99dfe.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/14] classes/populate_sdk_ext: add option to bring in pkgdata for world
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:09 -0000

Add a variable SDK_INCLUDE_PKGDATA which you can set to "1" to include
pkgdata for all recipes in the world target. There are a couple of uses
for this:

1) If you use "devtool add" to add a recipe that builds something which
   depends on anything in world, the dependency can then be correctly
   mapped to the recipe providing it and that recipe can be added to
   DEPENDS, since we have the pkg-config and shared library dependency
   data within pkgdata.
2) You'll be able to search for these recipes and any files they
   package for the target with "devtool search" since that also uses
   pkgdata

This of course assumes you've tailored world through EXCLUDE_FROM_WORLD
to only include recipes you'd want built in your distro, but I think
that's a reasonable assumption; failing that there is a
WORLD_PKGDATA_EXCLUDE variable that you can set to exclude any recipes
you don't want.

Note that this patch relies on functionality implemented in a recent
BitBake patch and will not work without it.

Implements [YOCTO #8600].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass        | 24 +++++++++++-
 meta/lib/oe/copy_buildsystem.py              | 58 +++++++++++++++++++++++++++-
 meta/recipes-core/meta/meta-world-pkgdata.bb | 50 ++++++++++++++++++++++++
 scripts/lib/devtool/sdk.py                   |  6 +--
 4 files changed, 131 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-world-pkgdata.bb

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e5e55b3..ebb57bb 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -24,6 +24,7 @@ SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 SDK_UPDATE_URL ?= ""
 
 SDK_TARGETS ?= "${PN}"
+SDK_INSTALL_TARGETS = "${SDK_TARGETS} ${@'meta-world-pkgdata:do_allpackagedata' if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1' else ''}"
 OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
 
 # The files from COREBASE that you want preserved in the COREBASE copied
@@ -45,6 +46,7 @@ SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar(
 
 python copy_buildsystem () {
     import re
+    import shutil
     import oe.copy_buildsystem
 
     oe_init_env_script = d.getVar('OE_INIT_ENV_SCRIPT', True)
@@ -91,6 +93,7 @@ python copy_buildsystem () {
     config.set('General', 'core_meta_subdir', core_meta_subdir)
     config.add_section('SDK')
     config.set('SDK', 'sdk_targets', d.getVar('SDK_TARGETS', True))
+    config.set('SDK', 'sdk_update_targets', d.getVar('SDK_INSTALL_TARGETS', True))
     updateurl = d.getVar('SDK_UPDATE_URL', True)
     if updateurl:
         config.set('SDK', 'updateserver', updateurl)
@@ -199,6 +202,22 @@ python copy_buildsystem () {
                                                    d.getVar('SSTATE_DIR', True),
                                                    sstate_out, d,
                                                    fixedlsbstring)
+
+    # Add packagedata if enabled
+    if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
+        lockedsigs_base = d.getVar('WORKDIR', True) + '/locked-sigs-base.inc'
+        lockedsigs_copy = d.getVar('WORKDIR', True) + '/locked-sigs-copy.inc'
+        shutil.move(lockedsigs_pruned, lockedsigs_base)
+        oe.copy_buildsystem.merge_lockedsigs(['do_packagedata'],
+                                             lockedsigs_base,
+                                             d.getVar('STAGING_DIR_HOST', True) + '/world-pkgdata/locked-sigs-pkgdata.inc',
+                                             lockedsigs_pruned,
+                                             lockedsigs_copy)
+        oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_copy,
+                                                       d.getVar('SSTATE_DIR', True),
+                                                       sstate_out, d,
+                                                       fixedlsbstring)
+
     # We don't need sstate do_package files
     for root, dirs, files in os.walk(sstate_out):
         for name in files:
@@ -268,7 +287,7 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py '${SDK_TARGETS}' >> $LOGFILE 2>&1" || { echo "ERROR: SDK preparation failed: see $LOGFILE"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py '${SDK_INSTALL_TARGETS}' >> $LOGFILE 2>&1" || { echo "ERROR: SDK preparation failed: see $LOGFILE"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 	fi
 	echo done
 }
@@ -314,7 +333,8 @@ def get_sdk_ext_rdepends(d):
 do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
 
 do_populate_sdk_ext[depends] = "${@d.getVarFlag('do_populate_sdk', 'depends', False)} \
-                                buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk"
+                                buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk \
+                                ${@'meta-world-pkgdata:do_collect_packagedata' if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1' else ''}"
 
 do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS', True).split()])}"
 
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index a5ca3df..6475510 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -93,10 +93,64 @@ def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output
                     invalue = True
                     f.write(line)
 
+def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_output, copy_output):
+    merged = {}
+    arch_order = []
+    with open(lockedsigs_main, 'r') as f:
+        invalue = None
+        for line in f:
+            if invalue:
+                if line.endswith('\\\n'):
+                    merged[invalue].append(line)
+                else:
+                    invalue = None
+            elif line.startswith('SIGGEN_LOCKEDSIGS_t-'):
+                invalue = line[18:].split('=', 1)[0].rstrip()
+                merged[invalue] = []
+                arch_order.append(invalue)
+
+    with open(lockedsigs_extra, 'r') as f:
+        invalue = None
+        tocopy = {}
+        for line in f:
+            if invalue:
+                if line.endswith('\\\n'):
+                    if not line in merged[invalue]:
+                        target, task = line.strip().split(':')[:2]
+                        if task in copy_tasks:
+                            tocopy[invalue].append(line)
+                        merged[invalue].append(line)
+                else:
+                    invalue = None
+            elif line.startswith('SIGGEN_LOCKEDSIGS_t-'):
+                invalue = line[18:].split('=', 1)[0].rstrip()
+                if not invalue in merged:
+                    merged[invalue] = []
+                    arch_order.append(invalue)
+                tocopy[invalue] = []
+
+    def write_sigs_file(fn, types, sigs):
+        fulltypes = []
+        bb.utils.mkdirhier(os.path.dirname(fn))
+        with open(fn, 'w') as f:
+            for typename in types:
+                lines = sigs[typename]
+                if lines:
+                    f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % typename)
+                    for line in lines:
+                        f.write(line)
+                    f.write('    "\n')
+                    fulltypes.append(typename)
+            f.write('SIGGEN_LOCKEDSIGS_TYPES = "%s"\n' % ' '.join(fulltypes))
+
+    write_sigs_file(copy_output, tocopy.keys(), tocopy)
+    write_sigs_file(merged_output, arch_order, merged)
+
 def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring=""):
     bb.note('Generating sstate-cache...')
 
     bb.process.run("gen-lockedsig-cache %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache))
     if fixedlsbstring:
-        os.rename(output_sstate_cache + '/' + d.getVar('NATIVELSBSTRING', True),
-        output_sstate_cache + '/' + fixedlsbstring)
+        nativedir = output_sstate_cache + '/' + d.getVar('NATIVELSBSTRING', True)
+        if os.path.isdir(nativedir):
+            os.rename(nativedir, output_sstate_cache + '/' + fixedlsbstring)
diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
new file mode 100644
index 0000000..48a9027
--- /dev/null
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Pulls in pkgdata for world"
+LICENSE = "MIT"
+INHIBIT_DEFAULT_DEPS = "1"
+
+addtask do_allpackagedata before do_build
+do_allpackagedata() {
+	:
+}
+do_allpackagedata[recrdeptask] = "do_packagedata do_allpackagedata"
+do_allpackagedata[noexec] = "1"
+
+WORLD_PKGDATADIR = "${D}/world-pkgdata"
+
+addtask do_collect_packagedata after do_allpackagedata
+SSTATETASKS += "do_collect_packagedata"
+do_collect_packagedata[sstate-inputdirs] = "${WORLD_PKGDATADIR}"
+do_collect_packagedata[sstate-outputdirs] = "${STAGING_DIR_HOST}/world-pkgdata"
+
+python do_collect_packagedata() {
+    import oe.copy_buildsystem
+    outdir = os.path.join(d.getVar('WORLD_PKGDATADIR', True))
+    bb.utils.mkdirhier(outdir)
+    sigfile = os.path.join(outdir, 'locked-sigs-pkgdata.inc')
+    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
+}
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+
+do_configure[deptask] = ""
+
+WORLD_PKGDATA_EXCLUDE ?= "adt-installer"
+
+python calculate_extra_depends() {
+    exclude = '${WORLD_PKGDATA_EXCLUDE}'.split()
+    for p in world_target:
+        if p == self_pn:
+            continue
+
+        if p in exclude:
+            continue
+
+        deps.append(p)
+}
+
+PACKAGES = ""
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 0872df6..68139aa 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -175,12 +175,12 @@ def sdk_update(args, config, basepath, workspace):
 
     if not args.skip_prepare:
         # Run bitbake command for the whole SDK
-        sdk_targets = config.get('SDK', 'sdk_targets')
+        sdk_update_targets = config.get('SDK', 'sdk_update_targets', config.get('SDK', 'sdk_targets'))
         logger.info("Preparing build system... (This may take some time.)")
         try:
-            exec_build_env_command(config.init_path, basepath, 'bitbake %s --setscene-only' % sdk_targets)
+            exec_build_env_command(config.init_path, basepath, 'bitbake %s --setscene-only' % sdk_update_targets)
         except:
-            logger.error('bitbake %s failed' % sdk_targets)
+            logger.error('bitbake %s failed' % sdk_update_targets)
             return -1
     return 0
 
-- 
2.5.0


