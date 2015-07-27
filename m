Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EAA8C76324
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926441"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:04:04 +0100
Message-Id: <ddad0a98eae5a77c5a24c5d1752f837ca1a50241.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/11] oeqa/selftest/imagefeatures: fix RPM4 test
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:16 -0000

* Use our new runqemu function
* Don't hard-code the RPM4 version
* Double-check the native version is RPM4
* Check that an rpm 4.x package is in the image manifest (this isn't
  strictly necessary, but "belt-and-braces" and it serves as an example
  of how to do that)
* Check that the database is working on the target
* Ensure the image actually has openssh in it so we can connect to it

Initial runqemu adaptation by Richard Purdie <richard.purdie@linuxfoundation.org>

Part of the fix for [YOCTO #7994].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 75 +++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 20cc58d..a370d1e 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -78,16 +78,17 @@ class ImageFeatures(oeSelfTest):
     def test_rpm_version_4_support_on_image(self):
         """
         Summary:     Check rpm version 4 support on image
-        Expected:    Rpm version must be 4.11.2
+        Expected:    Rpm version must be 4.x
         Product:     oe-core
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        rpm_version = '4.11.2'
-        features = 'IMAGE_INSTALL_append = " rpm"\n'
-        features += 'PREFERRED_VERSION_rpm = "{}"\n'.format(rpm_version)
-        features += 'PREFERRED_VERSION_rpm-native = "{}"\n'.format(rpm_version)
+        features = 'PREFERRED_VERSION_rpm = "4.%"\n'
+        features += 'PREFERRED_VERSION_rpm-native = "4.%"\n'
+        # Use openssh in IMAGE_INSTALL instead of ssh-server-openssh in EXTRA_IMAGE_FEATURES as a workaround for bug 8047
+        features += 'IMAGE_INSTALL_append = " openssh"\n'
+        features += 'EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password package-management"\n'
         features += 'RPMROOTFSDEPENDS_remove = "rpmresolve-native:do_populate_sysroot"'
 
         # Append 'features' to local.conf
@@ -96,32 +97,44 @@ class ImageFeatures(oeSelfTest):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        # Boot qemu image & get rpm version
-        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
-        try:
-            proc_qemu.expect('qemux86 login:', timeout=100)
-            proc_qemu.sendline(self.root_user)
-            proc_qemu.expect(self.prompt)
-            proc_qemu.sendline('rpm --version')
-            proc_qemu.expect(self.prompt)
-        except Exception as e:
-            try:
-                killpg(proc_qemu.pid, signal.SIGTERM)
-            except:
-                pass
-            self.fail('Failed to start qemu: %s' % e)
-
-        found_rpm_version = proc_qemu.before
-
-        # Make sure the retrieved rpm version is the expected one
-        self.assertIn(rpm_version, found_rpm_version,
-                      'RPM version is not {}, found instead {}.'.format(rpm_version, found_rpm_version))
-
-        # Cleanup (close qemu)
-        try:
-            killpg(proc_qemu.pid, signal.SIGTERM)
-        except:
-            pass
+        # Check the native version of rpm is correct
+        native_bindir = get_bb_var('STAGING_BINDIR_NATIVE')
+        result = runCmd(os.path.join(native_bindir, 'rpm') + ' --version')
+        self.assertIn('version 4.', result.output)
+
+        # Check manifest for the rpm package
+        deploydir = get_bb_var('DEPLOY_DIR_IMAGE')
+        imgname = get_bb_var('IMAGE_LINK_NAME', 'core-image-minimal')
+        with open(os.path.join(deploydir, imgname) + '.manifest', 'r') as f:
+            for line in f:
+                splitline = line.split()
+                if len(splitline) > 2:
+                    rpm_version = splitline[2]
+                    if splitline[0] == 'rpm':
+                        if not rpm_version.startswith('4.'):
+                            self.fail('rpm version %s found in image, expected 4.x' % rpm_version)
+                        break
+            else:
+                self.fail('No rpm package found in image')
+
+        # Now do a couple of runtime tests
+        with runqemu("core-image-minimal", self) as qemu:
+            command = "rpm --version"
+            status, output = qemu.run(command)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (command, output))
+            found_rpm_version = output.strip()
+
+            # Make sure the retrieved rpm version is the expected one
+            if rpm_version not in found_rpm_version:
+                self.fail('RPM version is not {}, found instead {}.'.format(rpm_version, found_rpm_version))
+
+            # Test that the rpm database is there and working
+            command = "rpm -qa"
+            status, output = qemu.run(command)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (command, output))
+            self.assertIn('packagegroup-core-boot', output)
+            self.assertIn('busybox', output)
+
 
     @testcase(1116)
     def test_clutter_image_can_be_built(self):
-- 
2.1.0


