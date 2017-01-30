Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AC7597391A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 13:48:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 30 Jan 2017 05:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,311,1477983600"; d="scan'208";a="37303731"
Received: from jgperezc.zpn.intel.com ([10.219.4.33])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2017 05:48:18 -0800
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 07:48:09 -0600
Message-Id: <1485784089-31974-1-git-send-email-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] selftest/runtime-tests: Modify positins test to reduce execution time
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
X-List-Received-Date: Mon, 30 Jan 2017 13:48:20 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Currently test_postinst_roofs_and_boot is building a full-cmdline image
this is taking a lot of time to execute the test, so a minimal image
will be build instead.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/selftest/runtime-test.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 9e2ecc6..52e5b27 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -176,7 +176,7 @@ postinst-delayed-t \
                         that script can be delayed to run at first boot.
         Dependencies:   NA
         Steps:          1. Add proper configuration to local.conf file
-                        2. Build a "core-image-full-cmdline" image
+                        2. Build a "core-image-minimal" image
                         3. Verify that file created by postinst_rootfs recipe is
                            present on rootfs dir.
                         4. Boot the image created on qemu and verify that the file
@@ -195,6 +195,7 @@ postinst-delayed-t \
         #Step 1
         features = 'MACHINE = "qemux86"\n'
         features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
+        features += 'IMAGE_FEATURES += "ssh-server-openssh"\n'
         for init_manager in ("sysvinit", "systemd"):
             #for sysvinit no extra configuration is needed,
             if (init_manager is "systemd"):
@@ -209,10 +210,10 @@ postinst-delayed-t \
                 self.write_config(features)
 
                 #Step 2
-                bitbake('core-image-full-cmdline')
+                bitbake('core-image-minimal')
 
                 #Step 3
-                file_rootfs_created = os.path.join(get_bb_var('IMAGE_ROOTFS',"core-image-full-cmdline"),
+                file_rootfs_created = os.path.join(get_bb_var('IMAGE_ROOTFS',"core-image-minimal"),
                                                    file_rootfs_name)
                 found = os.path.isfile(file_rootfs_created)
                 self.assertTrue(found, "File %s was not created at rootfs time by %s" % \
@@ -220,11 +221,11 @@ postinst-delayed-t \
 
                 #Step 4
                 testcommand = 'ls /etc/'+fileboot_name
-                with runqemu('core-image-full-cmdline') as qemu:
+                with runqemu('core-image-minimal') as qemu:
                     sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
                     result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
                     self.assertEqual(result.status, 0, 'File %s was not created at firts boot'% fileboot_name)
 
                 #Step 5
                 bitbake(' %s %s -c cleanall' % (rootfs_pkg, boot_pkg))
-                bitbake('core-image-full-cmdline -c cleanall')
+                bitbake('core-image-minimal -c cleanall')
-- 
2.1.4


