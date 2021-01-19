Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9616.1611053598918282700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 02:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9239A113E;
	Tue, 19 Jan 2021 02:53:18 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.9.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E3383F68F;
	Tue, 19 Jan 2021 02:53:17 -0800 (PST)
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: openembedded-core@lists.openembedded.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [meta-oe][PATCH v2 3/3] oeqa/selftest/imagefeatures: adding fitImage initramfs bundle testcase
Date: Tue, 19 Jan 2021 10:53:03 +0000
Message-Id: <20210119105303.20592-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>
References: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit provides a testcase for the initramfs bundle support implemented
in kernel-fitimage.bbclass

The testcase verifies the content of the initramfs bundle node in the FIT
Image Tree Source (its).

The testcase is self-contained and the configurations are set by the test case itself.

To verify the initramfs bundle support, the testcase uses beaglebone-yocto machine.

This testcase can be run through the following command:

oe-selftest -r fitimage.FitImageTests.test_initramfs_bundle

Change-Id: I8ab8abf2c150ea515fd439784eb20c6b092bfbc5
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 132 +++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 19b9f53ee4..0958036a6f 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -231,3 +231,135 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_assemble_fitimage' % tempdir, ignore_status=True)
         self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
 
+    def test_initramfs_bundle(self):
+        """
+        Summary:     Verifies the content of the initramfs bundle node in the FIT Image Tree Source (its)
+                     The FIT settings are set by the test case.
+                     The machine used is beaglebone-yocto.
+        Expected:    1. The ITS is generated with initramfs bundle support
+                     2. All the fields in the kernel node are as expected (matching the
+                        conf settings)
+                     3. The kernel is included in all the available configurations and
+                        its hash is included in the configuration signature
+
+        Product:     oe-core
+        Author:      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+        """
+
+        config = """
+DISTRO="poky"
+MACHINE = "beaglebone-yocto"
+INITRAMFS_IMAGE_BUNDLE = "1"
+INITRAMFS_IMAGE = "core-image-minimal-initramfs"
+INITRAMFS_SCRIPTS = ""
+UBOOT_MACHINE = "am335x_evm_defconfig"
+KERNEL_CLASSES = " kernel-fitimage "
+KERNEL_IMAGETYPES = "fitImage"
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_SIGN_KEYNAME = "beaglebonekey"
+UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
+UBOOT_DTB_BINARY = "u-boot.dtb"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+UBOOT_ARCH = "arm"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+UBOOT_EXTLINUX = "0"
+FIT_GENERATE_KEYS = "1"
+KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
+FIT_HASH_ALG = "sha256"
+"""
+        self.write_config(config)
+
+        # fitImage is created as part of linux recipe
+        bitbake("virtual/kernel")
+
+        image_type = get_bb_var('INITRAMFS_IMAGE')
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = get_bb_var('MACHINE')
+        fitimage_its_path = os.path.join(deploy_dir_image,
+                    "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
+        fitimage_path = os.path.join(deploy_dir_image,"fitImage")
+
+        self.assertTrue(os.path.exists(fitimage_its_path),
+            "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertTrue(os.path.exists(fitimage_path),
+            "%s FIT image doesn't exist" % (fitimage_path))
+
+        kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
+        kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
+        initramfs_bundle_format = str(get_bb_var('KERNEL_IMAGETYPE_REPLACEMENT'))
+        uboot_arch = str(get_bb_var('UBOOT_ARCH'))
+        initramfs_bundle = "arch/" + uboot_arch + "/boot/" + initramfs_bundle_format + ".initramfs"
+        fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
+
+        its_file = open(fitimage_its_path)
+
+        its_lines = [line.strip() for line in its_file.readlines()]
+
+        exp_node_lines = [
+            'kernel@1 {',
+            'description = "Linux kernel";',
+            'data = /incbin/("' + initramfs_bundle + '");',
+            'type = "kernel";',
+            'arch = "' + uboot_arch + '";',
+            'os = "linux";',
+            'compression = "none";',
+            'load = <' + kernel_load + '>;',
+            'entry = <' + kernel_entry + '>;',
+            'hash@1 {',
+            'algo = "' + fit_hash_alg +'";',
+            '};',
+            '};'
+        ]
+
+        node_str = exp_node_lines[0]
+
+        test_passed = False
+
+        print ("checking kernel node\n")
+
+        if node_str in its_lines:
+            node_start_idx = its_lines.index(node_str)
+            node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
+            if node == exp_node_lines:
+                print("kernel node verified")
+            else:
+                self.assertTrue(test_passed == True,"kernel node does not match expectation")
+
+        rx_configs = re.compile("^conf@.*")
+        its_configs = list(filter(rx_configs.match, its_lines))
+
+        for cfg_str in its_configs:
+            cfg_start_idx = its_lines.index(cfg_str)
+            line_idx = cfg_start_idx + 2
+            node_end = False
+            while node_end == False:
+                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};" :
+                    node_end = True
+                line_idx = line_idx + 1
+
+            node = its_lines[cfg_start_idx:line_idx]
+            print("checking configuration " + cfg_str.rstrip(" {"))
+            rx_desc_line = re.compile("^description.*1 Linux kernel.*")
+            if len(list(filter(rx_desc_line.match, node))) != 1:
+                self.assertTrue(test_passed == True,"kernel keyword not found in the description line")
+                break
+            else:
+                print("kernel keyword found in the description line")
+
+            if 'kernel = "kernel@1";' not in node:
+                self.assertTrue(test_passed == True,"kernel line not found")
+                break
+            else:
+                print("kernel line found")
+
+            rx_sign_line = re.compile("^sign-images.*kernel.*")
+            if len(list(filter(rx_sign_line.match, node))) != 1:
+                self.assertTrue(test_passed == True,"kernel hash not signed")
+                break
+            else:
+                print("kernel hash signed")
+
+            test_passed = True
+            self.assertTrue(test_passed == True,"Initramfs bundle test success")
-- 
2.17.1

