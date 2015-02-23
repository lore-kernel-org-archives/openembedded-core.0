Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 757DC706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537440"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:43 +0000
Message-Id: <dbb562e543729b016d4a31ceaf08da3abb24f267.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 9/9] populate_sdk_ext: add extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 17:00:55 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

This bbclass will create an SDK with a copy of bitbake and the metadata
and sstate for the target specified for the task. The idea is to let
"system" developers both work on applications and then test adding them
to an image without having to switch between workspaces or having to
download separate items.

Rather than running bitbake directly however, the primary way of running
builds within the extensible SDK is to use the "devtool" command. The
rest of the build system is fixed via locked shared state signatures,
and thus only the recipes you have added get built.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass                        |   2 +-
 meta/classes/populate_sdk_ext.bbclass             | 217 ++++++++++++++++++++++
 meta/recipes-core/meta/meta-environment-extsdk.bb |  12 ++
 3 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/populate_sdk_ext.bbclass
 create mode 100644 meta/recipes-core/meta/meta-environment-extsdk.bb

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 893eb40..89eb5f3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,6 +1,6 @@
 inherit rootfs_${IMAGE_PKGTYPE}
 
-inherit populate_sdk_base
+inherit populate_sdk_ext
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
new file mode 100644
index 0000000..ec1cff0
--- /dev/null
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -0,0 +1,217 @@
+# Extensible SDK
+
+inherit populate_sdk_base
+
+# NOTE: normally you cannot use task overrides for this kind of thing - this
+# only works because of get_sdk_ext_rdepends()
+
+TOOLCHAIN_HOST_TASK_task-populate-sdk-ext = " \
+    meta-environment-extsdk-${MACHINE} \
+    "
+
+TOOLCHAIN_TARGET_TASK_task-populate-sdk-ext = ""
+
+SDK_RDEPENDS_append_task-populate-sdk-ext = " ${SDK_TARGETS}"
+
+SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
+
+SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
+
+SDK_TARGETS ?= "${PN}"
+OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
+
+# The files from COREBASE that you want preserved in the COREBASE copied
+# into the sdk. This allows someone to have their own setup scripts in
+# COREBASE be preserved as well as untracked files.
+COREBASE_FILES ?= " \
+    oe-init-build-env \
+    oe-init-build-env-memres \
+    scripts \
+    LICENSE \
+    .templateconf \
+"
+
+SDK_DIR_task-populate-sdk-ext = "${WORKDIR}/sdk-ext"
+B_task-populate-sdk-ext = "${SDK_DIR}"
+TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext = "${SDK_NAME}-toolchain-ext-${SDK_VERSION}"
+
+python copy_buildsystem () {
+    import re
+    import oe.copy_buildsystem
+
+    oe_init_env_script = d.getVar('OE_INIT_ENV_SCRIPT', True)
+
+    conf_bbpath = ''
+    conf_initpath = ''
+    core_meta_subdir = ''
+
+    # Copy in all metadata layers + bitbake (as repositories)
+    buildsystem = oe.copy_buildsystem.BuildSystem(d)
+    baseoutpath = d.getVar('SDK_OUTPUT', True) + '/' + d.getVar('SDKPATH', True)
+    layers_copied = buildsystem.copy_bitbake_and_layers(baseoutpath + '/layers')
+
+    sdkbblayers = []
+    corebase = os.path.basename(d.getVar('COREBASE', True))
+    for layer in layers_copied:
+        if corebase == os.path.basename(layer):
+            conf_bbpath = os.path.join('layers', layer, 'bitbake')
+        else:
+            sdkbblayers.append(layer)
+
+    for path in os.listdir(baseoutpath + '/layers'):
+        relpath = os.path.join('layers', path, oe_init_env_script)
+        if os.path.exists(os.path.join(baseoutpath, relpath)):
+            conf_initpath = relpath
+
+        relpath = os.path.join('layers', path, 'scripts', 'devtool')
+        if os.path.exists(os.path.join(baseoutpath, relpath)):
+            scriptrelpath = os.path.dirname(relpath)
+
+        relpath = os.path.join('layers', path, 'meta')
+        if os.path.exists(os.path.join(baseoutpath, relpath, 'lib', 'oe')):
+            core_meta_subdir = relpath
+
+    d.setVar('oe_init_build_env_path', conf_initpath)
+    d.setVar('scriptrelpath', scriptrelpath)
+
+    # Write out config file for devtool
+    import ConfigParser
+    config = ConfigParser.SafeConfigParser()
+    config.add_section('General')
+    config.set('General', 'bitbake_subdir', conf_bbpath)
+    config.set('General', 'init_path', conf_initpath)
+    config.set('General', 'core_meta_subdir', core_meta_subdir)
+    bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf'))
+    with open(os.path.join(baseoutpath, 'conf', 'devtool.conf'), 'w') as f:
+        config.write(f)
+
+    # Create a layer for new recipes / appends
+    bb.process.run("devtool --basepath %s create-workspace --create-only %s" % (baseoutpath, os.path.join(baseoutpath, 'workspace')))
+
+    # Create bblayers.conf
+    bb.utils.mkdirhier(baseoutpath + '/conf')
+    with open(baseoutpath + '/conf/bblayers.conf', 'w') as f:
+        f.write('LCONF_VERSION = "%s"\n\n' % d.getVar('LCONF_VERSION'))
+        f.write('BBPATH = "$' + '{TOPDIR}"\n')
+        f.write('SDKBASEMETAPATH = "$' + '{TOPDIR}"\n')
+        f.write('BBLAYERS := " \\\n')
+        for layerrelpath in sdkbblayers:
+            f.write('    $' + '{SDKBASEMETAPATH}/layers/%s \\\n' % layerrelpath)
+        f.write('    $' + '{SDKBASEMETAPATH}/workspace \\\n')
+        f.write('    "\n')
+
+    # Create local.conf
+    with open(baseoutpath + '/conf/local.conf', 'w') as f:
+        f.write('INHERIT += "%s"\n\n' % 'uninative')
+        f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION'))
+
+        # This is a bit of a hack, but we really don't want these dependencies
+        # (we're including them in the SDK as nativesdk- versions instead)
+        f.write('POKYQEMUDEPS_forcevariable = ""\n\n')
+        f.write('EXTRA_IMAGEDEPENDS_remove = "qemu-native qemu-helper-native"\n\n')
+
+        # Another hack, but we want the native part of sstate to be kept the same
+        # regardless of the host distro
+        fixedlsbstring = 'SDK-Fixed'
+        f.write('NATIVELSBSTRING_forcevariable = "%s"\n\n' % fixedlsbstring)
+
+        # Ensure locked sstate cache objects are re-used without error
+        f.write('SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "warn"\n\n')
+
+        for varname in d.getVar('SDK_META_CONF_WHITELIST', True).split():
+            f.write('%s = "%s"\n' % (varname, d.getVar(varname, True)))
+        f.write('require conf/locked-sigs.inc\n')
+        f.write('require conf/work-config.inc\n')
+
+    sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
+    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
+
+    # Filter the locked signatures file to just the sstate tasks we are interested in
+    allowed_tasks = ['do_populate_lic', 'do_populate_sysroot', 'do_packagedata', 'do_package_write_ipk', 'do_package_write_rpm', 'do_package_write_deb', 'do_package_qa', 'do_deploy']
+    excluded_targets = d.getVar('SDK_TARGETS', True)
+    lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
+    oe.copy_buildsystem.prune_lockedsigs(allowed_tasks,
+                                         excluded_targets,
+                                         sigfile,
+                                         lockedsigs_pruned)
+
+    sstate_out = baseoutpath + '/sstate-cache'
+    bb.utils.remove(sstate_out, True)
+    oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_pruned,
+                                                   d.getVar('SSTATE_DIR', True),
+                                                   sstate_out, d,
+                                                   fixedlsbstring)
+
+    # Create a dummy config file for additional settings
+    with open(baseoutpath + '/conf/work-config.inc', 'w') as f:
+        pass
+}
+
+install_tools() {
+	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
+	ln -sr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/devtool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/devtool
+	ln -sr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool
+	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
+
+	install ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKGARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh ${SDK_OUTPUT}/${SDKPATH}
+
+	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 ${SDK_OUTPUT}/${SDKPATH}
+}
+
+# FIXME this preparation should be done as part of the SDK construction
+sdk_ext_postinst() {
+	printf "\nExtracting buildtools...\n"
+	cd $target_sdk_dir
+	printf "buildtools\ny" | ./*buildtools-tarball* > /dev/null
+
+	# Make sure when the user sets up the environment, they also get
+	# the buildtools-tarball tools in their path.
+	echo ". $target_sdk_dir/buildtools/environment-setup*" >> $target_sdk_dir/environment-setup*
+
+	# Allow bitbake environment setup to be ran as part of this sdk.
+	echo "export OE_SKIP_SDK_CHECK=1" >> $target_sdk_dir/environment-setup*
+
+	# A bit of another hack, but we need this in the path only for devtool
+	# so put it at the end of $PATH.
+	echo "export PATH=\$PATH:$target_sdk_dir/sysroots/${SDK_SYS}/${bindir_nativesdk}" >> $target_sdk_dir/environment-setup*
+
+	# For now this is where uninative.bbclass expects the tarball
+	mv *-nativesdk-libc.tar.* $target_sdk_dir/`dirname ${oe_init_build_env_path}`
+
+	printf "Preparing build system...\n"
+	# dash which is /bin/sh on Ubuntu will not preserve the
+	# current working directory when first ran, nor will it set $1 when
+	# sourcing a script. That is why this has to look so ugly.
+	sh -c ". buildtools/environment-setup* > /dev/null && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir > /dev/null && bitbake ${SDK_TARGETS} > /dev/null" || { echo "SDK preparation failed" ; exit 1 ; }
+	echo done
+}
+
+SDK_POST_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_postinst}"
+
+SDK_POSTPROCESS_COMMAND_prepend_task-populate-sdk-ext = "copy_buildsystem; install_tools; "
+
+fakeroot python do_populate_sdk_ext() {
+    bb.build.exec_func("do_populate_sdk", d)
+}
+
+def get_sdk_ext_rdepends(d):
+    localdata = d.createCopy()
+    localdata.appendVar('OVERRIDES', ':task-populate-sdk-ext')
+    bb.data.update_data(localdata)
+    return localdata.getVarFlag('do_populate_sdk', 'rdepends', True)
+
+do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
+do_populate_sdk_ext[depends] += "${@d.getVarFlag('do_populate_sdk', 'depends', False)}"
+do_populate_sdk_ext[rdepends] = "${@get_sdk_ext_rdepends(d)}"
+do_populate_sdk_ext[recrdeptask] += "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
+
+
+do_populate_sdk_ext[depends] += "buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk"
+
+do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS', True).split()])}"
+do_populate_sdk_ext[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy"
+
+# Make sure codes change in copy_buildsystem can result in rebuilt
+do_populate_sdk_ext[vardeps] += "copy_buildsystem"
+
+addtask populate_sdk_ext
diff --git a/meta/recipes-core/meta/meta-environment-extsdk.bb b/meta/recipes-core/meta/meta-environment-extsdk.bb
new file mode 100644
index 0000000..d9e5961
--- /dev/null
+++ b/meta/recipes-core/meta/meta-environment-extsdk.bb
@@ -0,0 +1,12 @@
+# meta-environment for extensible SDK
+
+require meta-environment.bb
+
+PN = "meta-environment-extsdk-${MACHINE}"
+
+create_sdk_files_append() {
+	local sysroot=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_TARGET', True), d.getVar('TOPDIR', True))}
+	local sdkpathnative=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_NATIVE',True), d.getVar('TOPDIR', True))}
+
+	toolchain_create_sdk_env_script '' '' $sysroot '' ${bindir_native} ${prefix_native} $sdkpathnative
+}
-- 
1.9.3


