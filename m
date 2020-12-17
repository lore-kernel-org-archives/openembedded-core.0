Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.2475.1608173537551388418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=XhhApUaJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id BFFB920B7194; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFFB920B7194
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=BH/ZvCKKXziUOt/Coe3fffEJiETstwztZbo/sfh13wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XhhApUaJ8xn2OQuuehn+30ZrgVC9MyP4I4QgKA49q8fRItZ4CQaXOJbKpAwb892E8
	 aSCAZ1peZIOShKs13Y6cXH76gM5T3J4fDsS6mHJmCf6DZgjXOdFbGros7n5xpNmjom
	 sKZbOL86srZ2lxY6HGfiZIdNnxzUjaAp5GsJMxAU=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 8/8] oe-selftest: fitimage: add test for signing FIT images
Date: Wed, 16 Dec 2020 18:51:42 -0800
Message-Id: <986494b3b6b35d43bd5b91f5f9b78c727da8ba9e.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a new test to verify signing FIT images. Also includes testing for
the newly introduced FIT_SIGN_INDIVIDUAL, UBOOT_MKIMAGE,
UBOOT_MKIMAGE_SIGN, and UBOOT_MKIMAGE_SIGN_ARGS variables.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta-selftest/classes/test-mkimage-wrapper.bbclass |  19 +++
 meta/lib/oeqa/selftest/cases/fitimage.py           | 146 +++++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 meta-selftest/classes/test-mkimage-wrapper.bbclass

diff --git a/meta-selftest/classes/test-mkimage-wrapper.bbclass b/meta-selftest/classes/test-mkimage-wrapper.bbclass
new file mode 100644
index 0000000..7c98d7b
--- /dev/null
+++ b/meta-selftest/classes/test-mkimage-wrapper.bbclass
@@ -0,0 +1,19 @@
+# Class to test UBOOT_MKIMAGE and UBOOT_MKIMAGE_SIGN
+# (in conjunction with kernel-fitimage.bbclass)
+#
+# SPDX-License-Identifier: MIT
+#
+
+UBOOT_MKIMAGE = "test_mkimage_wrapper"
+UBOOT_MKIMAGE_SIGN = "test_mkimage_signing_wrapper"
+
+test_mkimage_wrapper() {
+    echo "### uboot-mkimage wrapper message"
+    uboot-mkimage "$@"
+}
+
+test_mkimage_signing_wrapper() {
+    echo "### uboot-mkimage signing wrapper message"
+    uboot-mkimage "$@"
+}
+
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 2a02c60..19b9f53 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -6,6 +6,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 import os
 import json
+import re
 
 class FitImageTests(OESelftestTestCase):
 
@@ -85,3 +86,148 @@ FIT_DESC = "A model description"
             self.assertTrue(field_index == len(its_field_check),
                 "Fields in Image Tree Source File %s did not match, error in finding %s"
                 % (fitimage_its_path, its_field_check[field_index]))
+
+
+    def test_sign_fit_image(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are created
+                     and signed correctly.
+        Expected:    1) its and FIT image are built successfully
+                     2) Scanning the its file indicates signing is enabled
+                        as requested by UBOOT_SIGN_ENABLE (using keys generated
+                        via FIT_GENERATE_KEYS)
+                     3) Dumping the FIT image indicates signature values
+                        are present (including for images as enabled via
+                        FIT_SIGN_INDIVIDUAL)
+                     4) Examination of the do_assemble_fitimage runfile/logfile
+                        indicate that UBOOT_MKIMAGE, UBOOT_MKIMAGE_SIGN and
+                        UBOOT_MKIMAGE_SIGN_ARGS are working as expected.
+        Product:     oe-core
+        Author:      Paul Eggleton <paul.eggleton@microsoft.com> based upon
+                     work by Usama Arif <usama.arif@arm.com>
+        """
+        config = """
+# Enable creation of fitImage
+MACHINE = "beaglebone-yocto"
+KERNEL_IMAGETYPES += " fitImage "
+KERNEL_CLASSES = " kernel-fitimage test-mkimage-wrapper "
+UBOOT_SIGN_ENABLE = "1"
+FIT_GENERATE_KEYS = "1"
+UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_SIGN_KEYNAME = "oe-selftest"
+FIT_SIGN_INDIVIDUAL = "1"
+UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
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
+            "fitImage-its-%s" % (machine,))
+        fitimage_path = os.path.join(deploy_dir_image,
+            "fitImage-%s.bin" % (machine,))
+
+        self.assertTrue(os.path.exists(fitimage_its_path),
+            "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertTrue(os.path.exists(fitimage_path),
+            "%s FIT image doesn't exist" % (fitimage_path))
+
+        req_itspaths = [
+            ['/', 'images', 'kernel@1'],
+            ['/', 'images', 'kernel@1', 'signature@1'],
+            ['/', 'images', 'fdt@am335x-boneblack.dtb'],
+            ['/', 'images', 'fdt@am335x-boneblack.dtb', 'signature@1'],
+            ['/', 'configurations', 'conf@am335x-boneblack.dtb'],
+            ['/', 'configurations', 'conf@am335x-boneblack.dtb', 'signature@1'],
+        ]
+
+        itspath = []
+        itspaths = []
+        linect = 0
+        sigs = {}
+        with open(fitimage_its_path) as its_file:
+            linect += 1
+            for line in its_file:
+                line = line.strip()
+                if line.endswith('};'):
+                    itspath.pop()
+                elif line.endswith('{'):
+                    itspath.append(line[:-1].strip())
+                    itspaths.append(itspath[:])
+                elif itspath and itspath[-1] == 'signature@1':
+                    itsdotpath = '.'.join(itspath)
+                    if not itsdotpath in sigs:
+                        sigs[itsdotpath] = {}
+                    if not '=' in line or not line.endswith(';'):
+                        self.fail('Unexpected formatting in %s sigs section line %d:%s' % (fitimage_its_path, linect, line))
+                    key, value = line.split('=', 1)
+                    sigs[itsdotpath][key.rstrip()] = value.lstrip().rstrip(';')
+
+        for reqpath in req_itspaths:
+            if not reqpath in itspaths:
+                self.fail('Missing section in its file: %s' % reqpath)
+
+        reqsigvalues_image = {
+            'algo': '"sha256,rsa2048"',
+            'key-name-hint': '"oe-selftest"',
+        }
+        reqsigvalues_config = {
+            'algo': '"sha256,rsa2048"',
+            'key-name-hint': '"oe-selftest"',
+            'sign-images': '"kernel", "fdt"',
+        }
+
+        for itspath, values in sigs.items():
+            if 'conf@' in itspath:
+                reqsigvalues = reqsigvalues_config
+            else:
+                reqsigvalues = reqsigvalues_image
+            for reqkey, reqvalue in reqsigvalues.items():
+                value = values.get(reqkey, None)
+                if value is None:
+                    self.fail('Missing key "%s" in its file signature section %s' % (reqkey, itspath))
+                self.assertEqual(value, reqvalue)
+
+        # Dump the image to see if it really got signed
+        bitbake("u-boot-tools-native -c addto_recipe_sysroot")
+        result = runCmd('bitbake -e u-boot-tools-native | grep ^RECIPE_SYSROOT_NATIVE=')
+        recipe_sysroot_native = result.output.split('=')[1].strip('"')
+        dumpimage_path = os.path.join(recipe_sysroot_native, 'usr', 'bin', 'dumpimage')
+        result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
+        in_signed = None
+        signed_sections = {}
+        for line in result.output.splitlines():
+            if line.startswith((' Configuration', ' Image')):
+                in_signed = re.search('\((.*)\)', line).groups()[0]
+            elif re.match('^ *', line) in (' ', ''):
+                in_signed = None
+            elif in_signed:
+                if not in_signed in signed_sections:
+                    signed_sections[in_signed] = {}
+                key, value = line.split(':', 1)
+                signed_sections[in_signed][key.strip()] = value.strip()
+        self.assertIn('kernel@1', signed_sections)
+        self.assertIn('fdt@am335x-boneblack.dtb', signed_sections)
+        self.assertIn('conf@am335x-boneblack.dtb', signed_sections)
+        for signed_section, values in signed_sections.items():
+            value = values.get('Sign algo', None)
+            self.assertEqual(value, 'sha256,rsa2048:oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
+            value = values.get('Sign value', None)
+            self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
+
+        # Check for UBOOT_MKIMAGE_SIGN_ARGS
+        result = runCmd('bitbake -e virtual/kernel | grep ^T=')
+        tempdir = result.output.split('=', 1)[1].strip().strip('')
+        result = runCmd('grep "a smart comment" %s/run.do_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN_ARGS value did not get used')
+
+        # Check for evidence of test-mkimage-wrapper class
+        result = runCmd('grep "### uboot-mkimage wrapper message" %s/log.do_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE did not work')
+        result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_assemble_fitimage' % tempdir, ignore_status=True)
+        self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
+
-- 
1.8.3.1

