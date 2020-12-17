Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.2490.1608173537550828933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=fgBKh50q;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id A9DDB20B718B; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A9DDB20B718B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=jamhGjcSAQUZb9U/s94G+2vC3Emw7ETqJoSascdkOYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fgBKh50q11hVoj2DV/5wbaBOof4DxL1mnUk/Z3t2GgVBBQoP5ZaNeOtj7jiAx6q5N
	 2EzD2nZ3iSSZKCyFiqsi85f+7YgezPK0lYTnjZO0bjPXoIrhZVUBNd05ewHL5+wHyr
	 HGvztKGJ45mR1NGHrK+Xi3IKSV6N3XdldgOjLqBY=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 6/8] oe-selftest: move FIT image tests to their own module
Date: Wed, 16 Dec 2020 18:51:40 -0800
Message-Id: <efcddba69ef957063f5d98a1e99c024bc5eb3c7c.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

I'm about to add an additional test, and on the assumption that we might
also add more in future it seems reasonable to have the tests in their own
module.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py      | 84 +++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 74 -----------------------
 2 files changed, 84 insertions(+), 74 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/fitimage.py

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
new file mode 100644
index 0000000..2c3803d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -0,0 +1,84 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+import os
+import json
+
+class FitImageTests(OESelftestTestCase):
+
+    def test_fit_image(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are built
+                     and the Image Tree Source has the correct fields.
+        Expected:    1. fitImage and fitImage-its can be built
+                     2. The type, load address, entrypoint address and
+                     default values of kernel and ramdisk are as expected
+                     in the Image Tree Source. Not all the fields are tested,
+                     only the key fields that wont vary between different
+                     architectures.
+        Product:     oe-core
+        Author:      Usama Arif <usama.arif@arm.com>
+        """
+        config = """
+# Enable creation of fitImage
+KERNEL_IMAGETYPE = "Image"
+KERNEL_IMAGETYPES += " fitImage "
+KERNEL_CLASSES = " kernel-fitimage "
+
+# RAM disk variables including load address and entrypoint for kernel and RAM disk
+IMAGE_FSTYPES += "cpio.gz"
+INITRAMFS_IMAGE = "core-image-minimal"
+UBOOT_RD_LOADADDRESS = "0x88000000"
+UBOOT_RD_ENTRYPOINT = "0x88000000"
+UBOOT_LOADADDRESS = "0x80080000"
+UBOOT_ENTRYPOINT = "0x80080000"
+"""
+        self.write_config(config)
+
+        # fitImage is created as part of linux recipe
+        bitbake("virtual/kernel")
+
+        image_type = "core-image-minimal"
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = get_bb_var('MACHINE')
+        fitimage_its_path = os.path.join(deploy_dir_image,
+            "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
+        fitimage_path = os.path.join(deploy_dir_image,
+            "fitImage-%s-%s-%s" % (image_type, machine, machine))
+
+        self.assertTrue(os.path.exists(fitimage_its_path),
+            "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertTrue(os.path.exists(fitimage_path),
+            "%s FIT image doesn't exist" % (fitimage_path))
+
+        # Check that the type, load address, entrypoint address and default
+        # values for kernel and ramdisk in Image Tree Source are as expected.
+        # The order of fields in the below array is important. Not all the
+        # fields are tested, only the key fields that wont vary between
+        # different architectures.
+        its_field_check = ['type = "kernel";',
+            'load = <0x80080000>;',
+            'entry = <0x80080000>;',
+            'type = "ramdisk";',
+            'load = <0x88000000>;',
+            'entry = <0x88000000>;',
+            'default = "conf@1";',
+            'kernel = "kernel@1";',
+            'ramdisk = "ramdisk@1";'
+            ]
+
+        with open(fitimage_its_path) as its_file:
+            field_index = 0
+            for line in its_file:
+                if field_index == len(its_field_check):
+                    break
+                if its_field_check[field_index] in line:
+                    field_index +=1
+
+        if field_index != len(its_field_check): # if its equal, the test passed
+            self.assertTrue(field_index == len(its_field_check),
+                "Fields in Image Tree Source File %s did not match, error in finding %s"
+                % (fitimage_its_path, its_field_check[field_index]))
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 415e031..6723a81 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -264,80 +264,6 @@ PNBLACKLIST[busybox] = "Don't build this"
 
         bitbake("--graphviz core-image-sato")
 
-    def test_fit_image(self):
-        """
-        Summary:     Check if FIT image and Image Tree Source (its) are built
-                     and the Image Tree Source has the correct fields.
-        Expected:    1. fitImage and fitImage-its can be built
-                     2. The type, load address, entrypoint address and
-                     default values of kernel and ramdisk are as expected
-                     in the Image Tree Source. Not all the fields are tested,
-                     only the key fields that wont vary between different
-                     architectures.
-        Product:     oe-core
-        Author:      Usama Arif <usama.arif@arm.com>
-        """
-        config = """
-# Enable creation of fitImage
-KERNEL_IMAGETYPE = "Image"
-KERNEL_IMAGETYPES += " fitImage "
-KERNEL_CLASSES = " kernel-fitimage "
-
-# RAM disk variables including load address and entrypoint for kernel and RAM disk
-IMAGE_FSTYPES += "cpio.gz"
-INITRAMFS_IMAGE = "core-image-minimal"
-UBOOT_RD_LOADADDRESS = "0x88000000"
-UBOOT_RD_ENTRYPOINT = "0x88000000"
-UBOOT_LOADADDRESS = "0x80080000"
-UBOOT_ENTRYPOINT = "0x80080000"
-"""
-        self.write_config(config)
-
-        # fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
-
-        image_type = "core-image-minimal"
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "fitImage-%s-%s-%s" % (image_type, machine, machine))
-
-        self.assertTrue(os.path.exists(fitimage_its_path),
-            "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertTrue(os.path.exists(fitimage_path),
-            "%s FIT image doesn't exist" % (fitimage_path))
-
-        # Check that the type, load address, entrypoint address and default
-        # values for kernel and ramdisk in Image Tree Source are as expected.
-        # The order of fields in the below array is important. Not all the
-        # fields are tested, only the key fields that wont vary between
-        # different architectures.
-        its_field_check = ['type = "kernel";',
-            'load = <0x80080000>;',
-            'entry = <0x80080000>;',
-            'type = "ramdisk";',
-            'load = <0x88000000>;',
-            'entry = <0x88000000>;',
-            'default = "conf@1";',
-            'kernel = "kernel@1";',
-            'ramdisk = "ramdisk@1";'
-            ]
-
-        with open(fitimage_its_path) as its_file:
-            field_index = 0
-            for line in its_file:
-                if field_index == len(its_field_check):
-                    break
-                if its_field_check[field_index] in line:
-                    field_index +=1
-
-        if field_index != len(its_field_check): # if its equal, the test passed
-            self.assertTrue(field_index == len(its_field_check),
-                "Fields in Image Tree Source File %s did not match, error in finding %s"
-                % (fitimage_its_path, its_field_check[field_index]))
-
     def test_image_gen_debugfs(self):
         """
         Summary:     Check debugfs generation
-- 
1.8.3.1

