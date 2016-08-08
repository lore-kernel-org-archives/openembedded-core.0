Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9656A771B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316020"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:54 -0700
Message-Id: <eec18337fb3825e0bb8ce2620cc9c131cd68c3c0.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 06/20] oeqa.selftest.buildoptions: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:21 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py        | 231 +++++++++++++++++++-------
 meta/lib/oeqa/selftest/conf/buildoptions.conf |  42 +++++
 2 files changed, 210 insertions(+), 63 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/buildoptions.conf

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 4d01921..877a8c7 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -8,78 +8,145 @@ from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
+
 
 class ImageOptionsTests(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     @testcase(761)
     def test_incremental_image_generation(self):
         image_pkgtype = get_bb_var("IMAGE_PKGTYPE")
         if image_pkgtype != 'rpm':
             self.skipTest('Not using RPM as main package format')
-        bitbake("-c cleanall core-image-minimal")
-        self.write_config('INC_RPM_IMAGE_GEN = "1"')
-        self.append_config('IMAGE_FEATURES += "ssh-server-openssh"')
-        bitbake("core-image-minimal")
-        log_data_file = os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")
+        image = self.config.get(
+              'ImageOptionsTests', 'incremental_image_generation_image')
+        writeconfig = self.config.get(
+                    'ImageOptionsTests',
+                    'incremental_image_generation_writeconfig')
+        appendconfig = self.config.get(
+                     'ImageOptionsTests',
+                     'incremental_image_generation_appendconfig')
+        packagecreated = self.config.get(
+                       'ImageOptionsTests',
+                       'incremental_image_generation_packagecreated')
+        packageremoved = self.config.get(
+                       'ImageOptionsTests',
+                       'incremental_image_generation_packageremoved')
+        bitbake("-c cleanall %s" % image)
+        self.write_config(writeconfig)
+        self.append_config(appendconfig)
+        bitbake(image)
+        log_data_file = os.path.join(
+                      get_bb_var("WORKDIR", image), "temp/log.do_rootfs")
         log_data_created = ftools.read_file(log_data_file)
         incremental_created = re.search("NOTE: load old install solution for incremental install\nNOTE: old install solution not exist\nNOTE: creating new install solution for incremental install(\n.*)*NOTE: Installing the following packages:.*packagegroup-core-ssh-openssh", log_data_created)
-        self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
+        self.remove_config(appendconfig)
         self.assertTrue(incremental_created, msg = "Match failed in:\n%s" % log_data_created)
-        bitbake("core-image-minimal")
+        bitbake(image)
         log_data_removed = ftools.read_file(log_data_file)
         incremental_removed = re.search("NOTE: load old install solution for incremental install\nNOTE: creating new install solution for incremental install(\n.*)*NOTE: incremental removed:.*openssh-sshd-.*", log_data_removed)
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
     @testcase(925)
     def test_rm_old_image(self):
-        bitbake("core-image-minimal")
-        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
-        imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
+        image = self.config.get('ImageOptionsTests', 'rm_old_image_image')
+        bitbake(image)
+        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target=image)
+        imagename = get_bb_var("IMAGE_LINK_NAME", target=image)
         deploydir_files = os.listdir(deploydir)
         track_original_files = []
         for image_file in deploydir_files:
             if imagename in image_file and os.path.islink(os.path.join(deploydir, image_file)):
                 track_original_files.append(os.path.realpath(os.path.join(deploydir, image_file)))
         self.write_config("RM_OLD_IMAGE = \"1\"")
-        bitbake("-C rootfs core-image-minimal")
+        bitbake("-C rootfs %s" % image)
         deploydir_files = os.listdir(deploydir)
         remaining_not_expected = [path for path in track_original_files if os.path.basename(path) in deploydir_files]
         self.assertFalse(remaining_not_expected, msg="\nThe following image files were not removed: %s" % ', '.join(map(str, remaining_not_expected)))
 
     @testcase(286)
     def test_ccache_tool(self):
-        bitbake("ccache-native")
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native'), "ccache")), msg = "No ccache found under %s" % str(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native')))
-        self.write_config('INHERIT += "ccache"')
-        bitbake("m4 -c cleansstate")
-        bitbake("m4 -c compile")
-        self.addCleanup(bitbake, 'ccache-native -ccleansstate')
-        res = runCmd("grep ccache %s" % (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")), ignore_status=True)
-        self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile"))
+        recipe1 = self.config.get('ImageOptionsTests', 'ccache_tool_recipe1')
+        recipe2 = self.config.get('ImageOptionsTests', 'ccache_tool_recipe2')
+        recipenative = self.config.get(
+                     'ImageOptionsTests', 'ccache_tool_recipenative')
+        bitbake("%s-native" % recipe1)
+        self.assertTrue(
+            os.path.isfile(
+                os.path.join(
+                    get_bb_var('STAGING_BINDIR_NATIVE', '%s-native' % recipe1),
+                    recipe1)),
+            msg="No %s found under %s"
+                % (recipe1, str(get_bb_var(
+                                    'STAGING_BINDIR_NATIVE',
+                                    '%s-native' % recipe1))))
+        self.write_config('INHERIT += "%s"' % recipe1)
+        bitbake("%s -c cleansstate" % recipe2)
+        bitbake("%s -c compile" % recipe2)
+        self.addCleanup(bitbake, '%s-native -ccleansstate' % recipe1)
+        res = runCmd("grep %s %s"
+                     % (recipe1, os.path.join(
+                                     get_bb_var("WORKDIR", recipe2),
+                                     "temp/log.do_compile")),
+                     ignore_status=True)
+        self.assertEqual(
+            0, res.status,
+            msg="No match for %s in %s log.do_compile. For further details: %s"
+            % (recipe1, recipe2, os.path.join(get_bb_var("WORKDIR", recipe2),
+                                              "temp/log.do_compile")))
 
     @testcase(1435)
     def test_read_only_image(self):
-        self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
-        bitbake("core-image-sato")
+        recipe = self.config.get(
+               'ImageOptionsTests', 'read_only_image_recipe')
+        config = self.config.get(
+               'ImageOptionsTests', 'read_only_image_config')
+        self.write_config(config)
+        bitbake(recipe)
         # do_image will fail if there are any pending postinsts
 
+
 class DiskMonTest(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     @testcase(277)
     def test_stoptask_behavior(self):
-        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
-        res = bitbake("m4", ignore_status = True)
+        recipe = self.config.get('DiskMonTest', 'stoptask_behavior_recipe')
+        configstop = self.config.get(
+                   'DiskMonTest', 'stoptask_behavior_configstop')
+        configabort = self.config.get(
+                    'DiskMonTest', 'stoptask_behavior_configabort')
+        configwarn = self.config.get(
+                   'DiskMonTest', 'stoptask_behavior_configwarn')
+        self.write_config(configstop)
+        res = bitbake(recipe, ignore_status=True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
-        res = bitbake("m4", ignore_status = True)
+        self.write_config(configabort)
+        res = bitbake(recipe, ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
-        res = bitbake("m4")
+        self.write_config(configwarn)
+        res = bitbake(recipe)
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
+
 class SanityOptionsTest(oeSelfTest):
+
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     def getline(self, res, line):
         for l in res.output.split('\n'):
             if line in l:
@@ -87,49 +154,60 @@ class SanityOptionsTest(oeSelfTest):
 
     @testcase(927)
     def test_options_warnqa_errorqa_switch(self):
-        bitbake("xcursor-transparent-theme -ccleansstate")
+        recipe = self.config.get(
+               'SanityOptionsTest', 'options_warnqa_errorqa_switch_recipe')
+        bitbake("%s -ccleansstate" % recipe)
 
         if "packages-list" not in get_bb_var("ERROR_QA"):
             self.write_config("ERROR_QA_append = \" packages-list\"")
 
-        self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
-        res = bitbake("xcursor-transparent-theme", ignore_status=True)
-        self.delete_recipeinc('xcursor-transparent-theme')
-        line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
+        self.write_recipeinc(recipe, 'PACKAGES += \"${PN}-dbg\"')
+        res = bitbake(recipe, ignore_status=True)
+        self.delete_recipeinc(recipe)
+        line = self.getline(res, "QA Issue: %s-dbg is listed in PACKAGES \
+multiple times, this leads to packaging errors." % recipe)
         self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
+        self.write_recipeinc(recipe, 'PACKAGES += \"${PN}-dbg\"')
         self.append_config('ERROR_QA_remove = "packages-list"')
         self.append_config('WARN_QA_append = " packages-list"')
-        bitbake("xcursor-transparent-theme -ccleansstate")
-        res = bitbake("xcursor-transparent-theme")
-        self.delete_recipeinc('xcursor-transparent-theme')
-        line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
+        bitbake("%s -ccleansstate" % recipe)
+        res = bitbake(recipe)
+        self.delete_recipeinc(recipe)
+        line = self.getline(res, "QA Issue: %s-dbg is listed in PACKAGES \
+multiple times, this leads to packaging errors." % recipe)
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
 
     @testcase(278)
     def test_sanity_unsafe_script_references(self):
+        recipe = self.config.get(
+               'SanityOptionsTest', 'sanity_unsafe_script_references_recipe')
         self.write_config('WARN_QA_append = " unsafe-references-in-scripts"')
 
-        bitbake("-ccleansstate gzip")
-        res = bitbake("gzip")
-        line = self.getline(res, "QA Issue: gzip")
-        self.assertFalse(line, "WARNING: QA Issue: gzip message is present in bitbake's output and shouldn't be: %s" % res.output)
+        bitbake("-ccleansstate %s" % recipe)
+        res = bitbake(recipe)
+        line = self.getline(res, "QA Issue: %s" % recipe)
+        self.assertFalse(line, "WARNING: QA Issue: %s message is present in \
+bitbake's output and shouldn't be: %s" % (recipe, res.output))
 
         self.append_config("""
-do_install_append_pn-gzip () {
-	echo "\n${bindir}/test" >> ${D}${bindir}/zcat
+do_install_append_pn-%s () {
+        echo "\n${bindir}/test" >> ${D}${bindir}/zcat
 }
-""")
-        res = bitbake("gzip")
-        line = self.getline(res, "QA Issue: gzip")
-        self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
+""" % recipe)
+        res = bitbake(recipe)
+        line = self.getline(res, "QA Issue: %s" % recipe)
+        self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA \
+Issue: %s message is not present in bitbake's output: %s"
+                        % (recipe, res.output))
 
     @testcase(1434)
     def test_sanity_unsafe_binary_references(self):
+        recipe = self.config.get(
+               'SanityOptionsTest', 'sanity_unsafe_binary_references_recipe')
         self.write_config('WARN_QA_append = " unsafe-references-in-binaries"')
 
-        bitbake("-ccleansstate nfs-utils")
+        bitbake("-ccleansstate %s" % recipe)
         #res = bitbake("nfs-utils")
         # FIXME when nfs-utils passes this test
         #line = self.getline(res, "QA Issue: nfs-utils")
@@ -140,9 +218,11 @@ do_install_append_pn-gzip () {
 #	echo "\n${bindir}/test" >> ${D}${base_sbindir}/osd_login
 #}
 #""")
-        res = bitbake("nfs-utils")
-        line = self.getline(res, "QA Issue: nfs-utils")
-        self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
+        res = bitbake(recipe)
+        line = self.getline(res, "QA Issue: %s" % recipe)
+        self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA \
+Issue: %s message is not present in bitbake's output: %s"
+                        % (recipe, res.output))
 
     @testcase(1421)
     def test_layer_without_git_dir(self):
@@ -154,9 +234,13 @@ do_install_append_pn-gzip () {
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
+        dummy_layer_name = self.config.get(
+                      'SanityOptionsTest', 'layer_without_git_dir_layername')
+        test_recipe = self.config.get(
+                    'SanityOptionsTest', 'layer_without_git_dir_recipe')
+
         dirpath = tempfile.mkdtemp()
 
-        dummy_layer_name = 'meta-dummy'
         dummy_layer_path = os.path.join(dirpath, dummy_layer_name)
         dummy_layer_conf_dir = os.path.join(dummy_layer_path, 'conf')
         os.makedirs(dummy_layer_conf_dir)
@@ -173,8 +257,6 @@ do_install_append_pn-gzip () {
         bblayers_conf = 'BBLAYERS += "%s"\n' % dummy_layer_path
         self.write_bblayers_config(bblayers_conf)
 
-        test_recipe = 'ed'
-
         ret = bitbake('-n %s' % test_recipe)
 
         err = 'fatal: Not a git repository'
@@ -188,28 +270,51 @@ class BuildhistoryTests(BuildhistoryBase):
 
     @testcase(293)
     def test_buildhistory_basic(self):
-        self.run_buildhistory_operation('xcursor-transparent-theme')
+        self.configlocal = conffile(__file__)
+        recipe = self.configlocal.get(
+               'BuildhistoryTests', 'buildhistory_basic_recipe')
+        self.run_buildhistory_operation(recipe)
         self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
 
     @testcase(294)
     def test_buildhistory_buildtime_pr_backwards(self):
+        self.configlocal = conffile(__file__)
+        target = self.configlocal.get(
+            'BuildhistoryTests', 'buildhistory_buildtime_pr_backwards_target')
         self.add_command_to_tearDown('cleanup-workdir')
-        target = 'xcursor-transparent-theme'
         error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1.* to .*-r0.*)" % target
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
 class ArchiverTest(oeSelfTest):
+
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     @testcase(926)
     def test_arch_work_dir_and_export_source(self):
         """
         Test for archiving the work directory and exporting the source files.
         """
+        recipe = self.config.get(
+               'ArchiverTest', 'arch_work_dir_and_export_source_recipe')
+        config = self.config.get(
+               'ArchiverTest', 'arch_work_dir_and_export_source_config')
+        prefix = self.config.get(
+               'ArchiverTest', 'arch_work_dir_and_export_source_prefix')
+
         self.add_command_to_tearDown('cleanup-workdir')
-        self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
-        res = bitbake("xcursor-transparent-theme", ignore_status=True)
-        self.assertEqual(res.status, 0, "\nCouldn't build xcursortransparenttheme.\nbitbake output %s" % res.output)
-        pkgs_path = g.glob(str(self.builddir) + "/tmp/deploy/sources/allarch*/xcurs*")
-        src_file_glob = str(pkgs_path[0]) + "/xcursor*.src.rpm"
-        tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.gz"
-        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under tmp/deploy/sources/allarch*/xcursor*")
+        self.write_config(config)
+        res = bitbake(recipe, ignore_status=True)
+        self.assertEqual(res.status, 0,
+                         "\nCouldn't build %s.\nbitbake output %s"
+                         % (recipe, res.output))
+        pkgs_path = g.glob(str(self.builddir) +
+                           "/tmp/deploy/sources/allarch*/%s*" % prefix)
+        src_file_glob = str(pkgs_path[0]) + "/%s*.src.rpm" % prefix
+        tar_file_glob = str(pkgs_path[0]) + "/%s*.tar.gz" % prefix
+        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)),
+                        "Couldn't find .src.rpm and .tar.gz files under \
+tmp/deploy/sources/allarch*/%s*" % prefix)
diff --git a/meta/lib/oeqa/selftest/conf/buildoptions.conf b/meta/lib/oeqa/selftest/conf/buildoptions.conf
new file mode 100644
index 0000000..9471166
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/buildoptions.conf
@@ -0,0 +1,42 @@
+[ImageOptionsTests]
+incremental_image_generation_image = core-image-minimal
+incremental_image_generation_writeconfig = INC_RPM_IMAGE_GEN = "1"
+incremental_image_generation_appendconfig = IMAGE_FEATURES += "ssh-server-openssh"
+incremental_image_generation_packagecreated = core-ssh-openssh
+incremental_image_generation_packageremoved = openssh-sshd
+rm_old_image_image = %(incremental_image_generation_image)s
+ccache_tool_recipe1 = ccache
+ccache_tool_recipe2 = m4
+ccache_tool_recipenative = ccache-native
+read_only_image_config = IMAGE_FEATURES += "read-only-rootfs"
+read_only_image_recipe = core-image-sato
+
+[DiskMonTest]
+stoptask_behavior_configstop = BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"
+stoptask_behavior_configabort = BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"
+stoptask_behavior_configwarn = BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"
+stoptask_behavior_recipe = m4
+
+[SanityOptionsTest]
+options_warnqa_errorqa_switch_recipe = xcursor-transparent-theme
+sanity_unsafe_script_references_recipe = gzip
+sanity_unsafe_binary_references_recipe = nfs-utils
+layer_without_git_dir_layername = meta-dummy
+layer_without_git_dir_recipe = ed
+
+[BuildhistoryTests]
+buildhistory_basic_recipe = xcursor-transparent-theme
+buildhistory_buildtime_pr_backwards_target = %(buildhistory_basic_recipe)s
+
+[BuildImagesTest]
+directfb_config = DISTRO_FEATURES_remove = "x11"
+                  DISTRO_FEATURES_append = " directfb"
+                  MACHINE ??= "qemuarm"
+directfb_recipe = core-image-directfb
+
+[ArchiverTest]
+arch_work_dir_and_export_source_config = INHERIT += "archiver"
+                                         ARCHIVER_MODE[src] = "original"
+                                         ARCHIVER_MODE[srpm] = "1"
+arch_work_dir_and_export_source_recipe = xcursor-transparent-theme
+arch_work_dir_and_export_source_prefix = xcurs
-- 
1.8.3.1


