Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 853BE71A5A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 17:18:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 06 Dec 2016 09:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="794936366"
Received: from jgperezc.zpn.intel.com ([10.219.5.150])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Dec 2016 09:18:21 -0800
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 11:29:01 -0600
Message-Id: <1481045341-32526-1-git-send-email-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] postinst: Add a test case to verify postinst scripts behavior
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
X-List-Received-Date: Tue, 06 Dec 2016 17:18:22 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Add test case that verify behavior of postinst scripts at
roofts time and when is delayed to the first boot directly
on the target.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 .../recipes-test/postinst/postinst_1.0.bb          |  2 +
 meta/lib/oeqa/selftest/runtime-test.py             | 61 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/meta-selftest/recipes-test/postinst/postinst_1.0.bb b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
index 97a1987..6d49734 100644
--- a/meta-selftest/recipes-test/postinst/postinst_1.0.bb
+++ b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
@@ -24,6 +24,7 @@ RDEPENDS_${PN}-delayed-t = "${PN}-delayed-p"
 # Main recipe post-install
 pkg_postinst_${PN}-at-rootfs () {
     tfile="/etc/postinsta-test"
+    touch "$D"/this-was-created-at-rootfstime
     if test "x$D" != "x" then
         # Need to run on first boot
         exit 1
@@ -42,6 +43,7 @@ pkg_postinst_${PN}-delayed-a () {
       # Need to run on first boot
       exit 1
     else
+      touch /etc/this-was-created-at-first-boot
       if test -e $efile ; then
         echo 'success' > $tfile
       else
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 1dbfae1..20caa97 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -155,3 +155,64 @@ postinst-delayed-t \
                     elif found:
                         self.assertEqual(idx, len(postinst_list), "Not found all postinsts")
                         break
+
+    @testcase(1545)
+    def test_postinst_roofs_and_boot(self):
+        """
+        Summary:        The purpose of this test case is to verify Post-installation
+                        scripts are called when roofs is created and also test
+                        that script can be delayed to run at first boot.
+        Dependencies:   NA
+        Steps:          1. Add proper configuration to local.conf file
+                        2. Build a "core-image-full-cmdline" image
+                        3. Verify that file created by postinst_rootfs recipe is
+                           present on rootfs dir.
+                        4. Boot the image created on qemu and verify that the file
+                           created by postinst_boot recipe is present on image.
+                        5. Clean the packages and image created to test with
+                           different package managers
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
+        features = 'MACHINE = "qemux86"\n'
+        features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
+        for init_manager in ("sysvinit", "systemd"):
+            #for sysvinit no extra configuration is needed,
+            if (init_manager is "systemd"):
+                features += 'DISTRO_FEATURES_append = " systemd"\n'
+                features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
+                features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"\n'
+                features += 'VIRTUAL-RUNTIME_initscripts = ""\n'
+            for classes in ("package_rpm package_deb package_ipk",
+                            "package_deb package_rpm package_ipk",
+                            "package_ipk package_deb package_rpm"):
+                features += 'PACKAGE_CLASSES = "%s"\n' % classes
+                self.write_config(features)
+
+                #Step 2
+                bitbake('core-image-full-cmdline')
+
+                #Step 3
+                file_rootfs_created = os.path.join(get_bb_var('IMAGE_ROOTFS',"core-image-full-cmdline"),
+                                                   file_rootfs_name)
+                found = os.path.isfile(file_rootfs_created)
+                self.assertTrue(found, "File %s was not created at rootfs time by %s" % \
+                                (file_rootfs_name, rootfs_pkg))
+
+                #Step 4
+                testcommand = 'ls /etc/'+fileboot_name
+                with runqemu('core-image-full-cmdline') as qemu:
+                    sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+                    result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
+                    self.assertEqual(result.status, 0, 'File %s was not created at firts boot'% fileboot_name)
+
+                #Step 5
+                bitbake(' %s %s -c cleanall' % (rootfs_pkg, boot_pkg))
+                bitbake('core-image-full-cmdline -c cleanall')
-- 
2.1.4


