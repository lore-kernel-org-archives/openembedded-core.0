Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4E877FEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279795"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:47 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:36 -0500
Message-Id: <c84702b7407ee71b6f3ccab5c7db61dd0b4c2d36.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 21/30] oeqa/selftest/cases: runtime enable threaded runs
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Use wrappers from OESelfTestCase for runCmd, bitbake, etc.
- Split into tree modules because runtime_test_export and
runtime_test_postinsts uses runqemu/tinfoil and needs to be
executed into the main thread.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py       | 225 +--------------------
 .../lib/oeqa/selftest/cases/runtime_test_export.py | 104 ++++++++++
 .../oeqa/selftest/cases/runtime_test_postinsts.py  | 114 +++++++++++
 3 files changed, 226 insertions(+), 217 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/runtime_test_export.py
 create mode 100644 meta/lib/oeqa/selftest/cases/runtime_test_postinsts.py

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 2a70ae15b81..e45410e0e56 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -1,110 +1,9 @@
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
 from oeqa.core.decorator.oeid import OETestID
-import os
-import re
-
-class TestExport(OESelftestTestCase):
-
-    @classmethod
-    def tearDownClass(cls):
-        runCmd("rm -rf /tmp/sdk")
-        super(TestExport, cls).tearDownClass()
-
-    @OETestID(1499)
-    def test_testexport_basic(self):
-        """
-        Summary: Check basic testexport functionality with only ping test enabled.
-        Expected: 1. testexport directory must be created.
-                  2. runexported.py must run without any error/exception.
-                  3. ping test must succeed.
-        Product: oe-core
-        Author: Mariano Lopez <mariano.lopez@intel.com>
-        """
-
-        features = 'INHERIT += "testexport"\n'
-        # These aren't the actual IP addresses but testexport class needs something defined
-        features += 'TEST_SERVER_IP = "192.168.7.1"\n'
-        features += 'TEST_TARGET_IP = "192.168.7.1"\n'
-        features += 'TEST_SUITES = "ping"\n'
-        self.write_config(features)
-
-        # Build tesexport for core-image-minimal
-        bitbake('core-image-minimal')
-        bitbake('-c testexport core-image-minimal')
-
-        testexport_dir = get_bb_var('TEST_EXPORT_DIR', 'core-image-minimal')
-
-        # Verify if TEST_EXPORT_DIR was created
-        isdir = os.path.isdir(testexport_dir)
-        self.assertEqual(True, isdir, 'Failed to create testexport dir: %s' % testexport_dir)
-
-        with runqemu('core-image-minimal') as qemu:
-            # Attempt to run runexported.py to perform ping test
-            test_path = os.path.join(testexport_dir, "oe-test")
-            data_file = os.path.join(testexport_dir, 'data', 'testdata.json')
-            manifest = os.path.join(testexport_dir, 'data', 'manifest')
-            cmd = ("%s runtime --test-data-file %s --packages-manifest %s "
-                   "--target-ip %s --server-ip %s --quiet"
-                  % (test_path, data_file, manifest, qemu.ip, qemu.server_ip))
-            result = runCmd(cmd)
-            # Verify ping test was succesful
-            self.assertEqual(0, result.status, 'oe-test runtime returned a non 0 status')
-
-    @OETestID(1641)
-    def test_testexport_sdk(self):
-        """
-        Summary: Check sdk functionality for testexport.
-        Expected: 1. testexport directory must be created.
-                  2. SDK tarball must exists.
-                  3. Uncompressing of tarball must succeed.
-                  4. Check if the SDK directory is added to PATH.
-                  5. Run tar from the SDK directory.
-        Product: oe-core
-        Author: Mariano Lopez <mariano.lopez@intel.com>
-        """
-
-        features = 'INHERIT += "testexport"\n'
-        # These aren't the actual IP addresses but testexport class needs something defined
-        features += 'TEST_SERVER_IP = "192.168.7.1"\n'
-        features += 'TEST_TARGET_IP = "192.168.7.1"\n'
-        features += 'TEST_SUITES = "ping"\n'
-        features += 'TEST_EXPORT_SDK_ENABLED = "1"\n'
-        features += 'TEST_EXPORT_SDK_PACKAGES = "nativesdk-tar"\n'
-        self.write_config(features)
-
-        # Build tesexport for core-image-minimal
-        bitbake('core-image-minimal')
-        bitbake('-c testexport core-image-minimal')
-
-        needed_vars = ['TEST_EXPORT_DIR', 'TEST_EXPORT_SDK_DIR', 'TEST_EXPORT_SDK_NAME']
-        bb_vars = get_bb_vars(needed_vars, 'core-image-minimal')
-        testexport_dir = bb_vars['TEST_EXPORT_DIR']
-        sdk_dir = bb_vars['TEST_EXPORT_SDK_DIR']
-        sdk_name = bb_vars['TEST_EXPORT_SDK_NAME']
-
-        # Check for SDK
-        tarball_name = "%s.sh" % sdk_name
-        tarball_path = os.path.join(testexport_dir, sdk_dir, tarball_name)
-        msg = "Couldn't find SDK tarball: %s" % tarball_path
-        self.assertEqual(os.path.isfile(tarball_path), True, msg)
-
-        # Extract SDK and run tar from SDK
-        result = runCmd("%s -y -d /tmp/sdk" % tarball_path)
-        self.assertEqual(0, result.status, "Couldn't extract SDK")
-
-        env_script = result.output.split()[-1]
-        result = runCmd(". %s; which tar" % env_script, shell=True)
-        self.assertEqual(0, result.status, "Couldn't setup SDK environment")
-        is_sdk_tar = True if "/tmp/sdk" in result.output else False
-        self.assertTrue(is_sdk_tar, "Couldn't setup SDK environment")
-
-        tar_sdk = result.output
-        result = runCmd("%s --version" % tar_sdk)
-        self.assertEqual(0, result.status, "Couldn't run tar from SDK")
-
 
 class TestImage(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @OETestID(1644)
     def test_testimage_install(self):
@@ -115,7 +14,7 @@ class TestImage(OESelftestTestCase):
         Product: oe-core
         Author: Mariano Lopez <mariano.lopez@intel.com>
         """
-        if get_bb_var('DISTRO') == 'poky-tiny':
+        if self.get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
         features = 'INHERIT += "testimage"\n'
@@ -123,8 +22,8 @@ class TestImage(OESelftestTestCase):
         self.write_config(features)
 
         # Build core-image-sato and testimage
-        bitbake('core-image-full-cmdline socat')
-        bitbake('-c testimage core-image-full-cmdline')
+        self.bitbake('core-image-full-cmdline socat')
+        self.bitbake('-c testimage core-image-full-cmdline')
 
     @OETestID(1883)
     def test_testimage_dnf(self):
@@ -134,7 +33,7 @@ class TestImage(OESelftestTestCase):
         Product: oe-core
         Author: Alexander Kanavin <alexander.kanavin@intel.com>
         """
-        if get_bb_var('DISTRO') == 'poky-tiny':
+        if self.get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
         features = 'INHERIT += "testimage"\n'
@@ -147,113 +46,5 @@ class TestImage(OESelftestTestCase):
         self.write_config(features)
 
         # Build core-image-sato and testimage
-        bitbake('core-image-full-cmdline socat')
-        bitbake('-c testimage core-image-full-cmdline')
-
-class Postinst(OESelftestTestCase):
-    @OETestID(1540)
-    def test_verify_postinst(self):
-        """
-        Summary: The purpose of this test is to verify the execution order of postinst Bugzilla ID: [5319]
-        Expected :
-        1. Compile a minimal image.
-        2. The compiled image will add the created layer with the recipes postinst[ abdpt]
-        3. Run qemux86
-        4. Validate the task execution order
-        Author: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
-        """
-        features = 'INHERIT += "testimage"\n'
-        features += 'CORE_IMAGE_EXTRA_INSTALL += "postinst-at-rootfs \
-postinst-delayed-a \
-postinst-delayed-b \
-postinst-delayed-d \
-postinst-delayed-p \
-postinst-delayed-t \
-"\n'
-        self.write_config(features)
-
-        bitbake('core-image-minimal -f ')
-
-        postinst_list = ['100-postinst-at-rootfs',
-                         '101-postinst-delayed-a',
-                         '102-postinst-delayed-b',
-                         '103-postinst-delayed-d',
-                         '104-postinst-delayed-p',
-                         '105-postinst-delayed-t']
-        path_workdir = get_bb_var('WORKDIR','core-image-minimal')
-        workspacedir = 'testimage/qemu_boot_log'
-        workspacedir = os.path.join(path_workdir, workspacedir)
-        rexp = re.compile("^Running postinst .*/(?P<postinst>.*)\.\.\.$")
-        with runqemu('core-image-minimal') as qemu:
-            with open(workspacedir) as f:
-                found = False
-                idx = 0
-                for line in f.readlines():
-                    line = line.strip().replace("^M","")
-                    if not line: # To avoid empty lines
-                        continue
-                    m = rexp.search(line)
-                    if m:
-                        self.assertEqual(postinst_list[idx], m.group('postinst'), "Fail")
-                        idx = idx+1
-                        found = True
-                    elif found:
-                        self.assertEqual(idx, len(postinst_list), "Not found all postinsts")
-                        break
-
-    @OETestID(1545)
-    def test_postinst_rootfs_and_boot(self):
-        """
-        Summary:        The purpose of this test case is to verify Post-installation
-                        scripts are called when rootfs is created and also test
-                        that script can be delayed to run at first boot.
-        Dependencies:   NA
-        Steps:          1. Add proper configuration to local.conf file
-                        2. Build a "core-image-minimal" image
-                        3. Verify that file created by postinst_rootfs recipe is
-                           present on rootfs dir.
-                        4. Boot the image created on qemu and verify that the file
-                           created by postinst_boot recipe is present on image.
-        Expected:       The files are successfully created during rootfs and boot
-                        time for 3 different package managers: rpm,ipk,deb and
-                        for initialization managers: sysvinit and systemd.
-
-        """
-        file_rootfs_name = "this-was-created-at-rootfstime"
-        fileboot_name = "this-was-created-at-first-boot"
-        rootfs_pkg = 'postinst-at-rootfs'
-        boot_pkg = 'postinst-delayed-a'
-        #Step 1
-        common_features = 'MACHINE = "qemux86"\n'
-        common_features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
-        common_features += 'IMAGE_FEATURES += "ssh-server-openssh"\n'
-        for init_manager in ("sysvinit", "systemd"):
-            #for sysvinit no extra configuration is needed,
-            features = ''
-            if (init_manager is "systemd"):
-                features += 'DISTRO_FEATURES_append = " systemd"\n'
-                features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
-                features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"\n'
-                features += 'VIRTUAL-RUNTIME_initscripts = ""\n'
-            for classes in ("package_rpm package_deb package_ipk",
-                            "package_deb package_rpm package_ipk",
-                            "package_ipk package_deb package_rpm"):
-                features += 'PACKAGE_CLASSES = "%s"\n' % classes
-                self.write_config(common_features + features)
-
-                #Step 2
-                bitbake('core-image-minimal')
-
-                #Step 3
-                file_rootfs_created = os.path.join(get_bb_var('IMAGE_ROOTFS',"core-image-minimal"),
-                                                   file_rootfs_name)
-                found = os.path.isfile(file_rootfs_created)
-                self.assertTrue(found, "File %s was not created at rootfs time by %s" % \
-                                (file_rootfs_name, rootfs_pkg))
-
-                #Step 4
-                testcommand = 'ls /etc/'+fileboot_name
-                with runqemu('core-image-minimal') as qemu:
-                    sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-                    result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
-                    self.assertEqual(result.status, 0, 'File %s was not created at firts boot'% fileboot_name)
+        self.bitbake('core-image-full-cmdline socat')
+        self.bitbake('-c testimage core-image-full-cmdline')
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test_export.py b/meta/lib/oeqa/selftest/cases/runtime_test_export.py
new file mode 100644
index 00000000000..8182f182735
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/runtime_test_export.py
@@ -0,0 +1,104 @@
+import os
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runqemu
+from oeqa.core.decorator.oeid import OETestID
+
+class TestExport(OESelftestTestCase):
+    @classmethod
+    def tearDownClass(cls):
+        cls.runCmd("rm -rf /tmp/sdk")
+        super(TestExport, cls).tearDownClass()
+
+    @OETestID(1499)
+    def test_testexport_basic(self):
+        """
+        Summary: Check basic testexport functionality with only ping test enabled.
+        Expected: 1. testexport directory must be created.
+                  2. runexported.py must run without any error/exception.
+                  3. ping test must succeed.
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        features = 'INHERIT += "testexport"\n'
+        # These aren't the actual IP addresses but testexport class needs something defined
+        features += 'TEST_SERVER_IP = "192.168.7.1"\n'
+        features += 'TEST_TARGET_IP = "192.168.7.1"\n'
+        features += 'TEST_SUITES = "ping"\n'
+        self.write_config(features)
+
+        # Build tesexport for core-image-minimal
+        self.bitbake('core-image-minimal')
+        self.bitbake('-c testexport core-image-minimal')
+
+        testexport_dir = self.get_bb_var('TEST_EXPORT_DIR', 'core-image-minimal')
+
+        # Verify if TEST_EXPORT_DIR was created
+        isdir = os.path.isdir(testexport_dir)
+        self.assertEqual(True, isdir, 'Failed to create testexport dir: %s' % testexport_dir)
+
+        with runqemu('core-image-minimal') as qemu:
+            # Attempt to run runexported.py to perform ping test
+            test_path = os.path.join(testexport_dir, "oe-test")
+            data_file = os.path.join(testexport_dir, 'data', 'testdata.json')
+            manifest = os.path.join(testexport_dir, 'data', 'manifest')
+            cmd = ("%s runtime --test-data-file %s --packages-manifest %s "
+                   "--target-ip %s --server-ip %s --quiet"
+                  % (test_path, data_file, manifest, qemu.ip, qemu.server_ip))
+            result = self.runCmd(cmd)
+            # Verify ping test was succesful
+            self.assertEqual(0, result.status, 'oe-test runtime returned a non 0 status')
+
+    @OETestID(1641)
+    def test_testexport_sdk(self):
+        """
+        Summary: Check sdk functionality for testexport.
+        Expected: 1. testexport directory must be created.
+                  2. SDK tarball must exists.
+                  3. Uncompressing of tarball must succeed.
+                  4. Check if the SDK directory is added to PATH.
+                  5. Run tar from the SDK directory.
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        features = 'INHERIT += "testexport"\n'
+        # These aren't the actual IP addresses but testexport class needs something defined
+        features += 'TEST_SERVER_IP = "192.168.7.1"\n'
+        features += 'TEST_TARGET_IP = "192.168.7.1"\n'
+        features += 'TEST_SUITES = "ping"\n'
+        features += 'TEST_EXPORT_SDK_ENABLED = "1"\n'
+        features += 'TEST_EXPORT_SDK_PACKAGES = "nativesdk-tar"\n'
+        self.write_config(features)
+
+        # Build tesexport for core-image-minimal
+        self.bitbake('core-image-minimal')
+        self.bitbake('-c testexport core-image-minimal')
+
+        needed_vars = ['TEST_EXPORT_DIR', 'TEST_EXPORT_SDK_DIR', 'TEST_EXPORT_SDK_NAME']
+        bb_vars = self.get_bb_vars(needed_vars, 'core-image-minimal')
+        testexport_dir = bb_vars['TEST_EXPORT_DIR']
+        sdk_dir = bb_vars['TEST_EXPORT_SDK_DIR']
+        sdk_name = bb_vars['TEST_EXPORT_SDK_NAME']
+
+        # Check for SDK
+        tarball_name = "%s.sh" % sdk_name
+        tarball_path = os.path.join(testexport_dir, sdk_dir, tarball_name)
+        msg = "Couldn't find SDK tarball: %s" % tarball_path
+        self.assertEqual(os.path.isfile(tarball_path), True, msg)
+
+        # Extract SDK and run tar from SDK
+        result = self.runCmd("%s -y -d /tmp/sdk" % tarball_path)
+        self.assertEqual(0, result.status, "Couldn't extract SDK")
+
+        env_script = result.output.split()[-1]
+        result = self.runCmd(". %s; which tar" % env_script, shell=True)
+        self.assertEqual(0, result.status, "Couldn't setup SDK environment")
+        is_sdk_tar = True if "/tmp/sdk" in result.output else False
+        self.assertTrue(is_sdk_tar, "Couldn't setup SDK environment")
+
+        tar_sdk = result.output
+        result = self.runCmd("%s --version" % tar_sdk)
+        self.assertEqual(0, result.status, "Couldn't run tar from SDK")
+
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test_postinsts.py b/meta/lib/oeqa/selftest/cases/runtime_test_postinsts.py
new file mode 100644
index 00000000000..b8e6b9c6d5c
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/runtime_test_postinsts.py
@@ -0,0 +1,114 @@
+import os
+import re
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.utils.commands import runqemu
+
+class Postinst(OESelftestTestCase):
+    @OETestID(1540)
+    def test_verify_postinst(self):
+        """
+        Summary: The purpose of this test is to verify the execution order of postinst Bugzilla ID: [5319]
+        Expected :
+        1. Compile a minimal image.
+        2. The compiled image will add the created layer with the recipes postinst[ abdpt]
+        3. Run qemux86
+        4. Validate the task execution order
+        Author: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
+        """
+        features = 'INHERIT += "testimage"\n'
+        features += 'CORE_IMAGE_EXTRA_INSTALL += "postinst-at-rootfs \
+postinst-delayed-a \
+postinst-delayed-b \
+postinst-delayed-d \
+postinst-delayed-p \
+postinst-delayed-t \
+"\n'
+        self.write_config(features)
+
+        self.bitbake('core-image-minimal -f ')
+
+        postinst_list = ['100-postinst-at-rootfs',
+                         '101-postinst-delayed-a',
+                         '102-postinst-delayed-b',
+                         '103-postinst-delayed-d',
+                         '104-postinst-delayed-p',
+                         '105-postinst-delayed-t']
+        path_workdir = self.get_bb_var('WORKDIR','core-image-minimal')
+        workspacedir = 'testimage/qemu_boot_log'
+        workspacedir = os.path.join(path_workdir, workspacedir)
+        rexp = re.compile("^Running postinst .*/(?P<postinst>.*)\.\.\.$")
+        with runqemu('core-image-minimal') as qemu:
+            with open(workspacedir) as f:
+                found = False
+                idx = 0
+                for line in f.readlines():
+                    line = line.strip().replace("^M","")
+                    if not line: # To avoid empty lines
+                        continue
+                    m = rexp.search(line)
+                    if m:
+                        self.assertEqual(postinst_list[idx], m.group('postinst'), "Fail")
+                        idx = idx+1
+                        found = True
+                    elif found:
+                        self.assertEqual(idx, len(postinst_list), "Not found all postinsts")
+                        break
+
+    @OETestID(1545)
+    def test_postinst_rootfs_and_boot(self):
+        """
+        Summary:        The purpose of this test case is to verify Post-installation
+                        scripts are called when rootfs is created and also test
+                        that script can be delayed to run at first boot.
+        Dependencies:   NA
+        Steps:          1. Add proper configuration to local.conf file
+                        2. Build a "core-image-minimal" image
+                        3. Verify that file created by postinst_rootfs recipe is
+                           present on rootfs dir.
+                        4. Boot the image created on qemu and verify that the file
+                           created by postinst_boot recipe is present on image.
+        Expected:       The files are successfully created during rootfs and boot
+                        time for 3 different package managers: rpm,ipk,deb and
+                        for initialization managers: sysvinit and systemd.
+
+        """
+        file_rootfs_name = "this-was-created-at-rootfstime"
+        fileboot_name = "this-was-created-at-first-boot"
+        rootfs_pkg = 'postinst-at-rootfs'
+        boot_pkg = 'postinst-delayed-a'
+        #Step 1
+        common_features = 'MACHINE = "qemux86"\n'
+        common_features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
+        common_features += 'IMAGE_FEATURES += "ssh-server-openssh"\n'
+        for init_manager in ("sysvinit", "systemd"):
+            #for sysvinit no extra configuration is needed,
+            features = ''
+            if (init_manager is "systemd"):
+                features += 'DISTRO_FEATURES_append = " systemd"\n'
+                features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
+                features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"\n'
+                features += 'VIRTUAL-RUNTIME_initscripts = ""\n'
+            for classes in ("package_rpm package_deb package_ipk",
+                            "package_deb package_rpm package_ipk",
+                            "package_ipk package_deb package_rpm"):
+                features += 'PACKAGE_CLASSES = "%s"\n' % classes
+                self.write_config(common_features + features)
+
+                #Step 2
+                self.bitbake('core-image-minimal')
+
+                #Step 3
+                file_rootfs_created = os.path.join(self.get_bb_var('IMAGE_ROOTFS',"core-image-minimal"),
+                                                   file_rootfs_name)
+                found = os.path.isfile(file_rootfs_created)
+                self.assertTrue(found, "File %s was not created at rootfs time by %s" % \
+                                (file_rootfs_name, rootfs_pkg))
+
+                #Step 4
+                testcommand = 'ls /etc/'+fileboot_name
+                with runqemu('core-image-minimal') as qemu:
+                    sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+                    result = self.runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
+                    self.assertEqual(result.status, 0, 'File %s was not created at firts boot'% fileboot_name)
-- 
2.11.0


