Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28039C28B30
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:37:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.33763.1741599425871947499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bD+7ifM7;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso296093f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599424; x=1742204224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPSpVhMvXGxfG617kIqy5nIDIFNjaQyB6hXpeMxbWDI=;
        b=bD+7ifM7+usP5IQPkOGRMU7d44w+6A6iQS5eAIE00dcj4HG8Xg4EYZ8s/aFh4DJhem
         4poVaa7C9VL7xZ0SyzQLHiH+LtLDZA5q1ji+5by5zcFgjUI0vVJJu2oMI3+T88LPFSOg
         6jmyOCYnvWYMVH1sI5B4R/GmTtxfsPngLg47raWIraIpg2txfpnHbO8efNbQQVOJDFzA
         8AoB//miyL4kqXUhvdQQHnjFJtCFS1deYE3OWofaekaA7BPAjQDXXIvGAptq1q2/bqIn
         nRCJ/TL7cq4uGFm1L/3pYrYA6/zlnsEMbA/NSePVuFIc+VIErwTTwEWOEUNZt3ZDYHgr
         supA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599424; x=1742204224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPSpVhMvXGxfG617kIqy5nIDIFNjaQyB6hXpeMxbWDI=;
        b=Onuyl0oNueyEV17Cd85YN2n/2gg+r+7ehREgz8haXmv47EqsqUzL1yulHizkmgj6Sy
         Wp/5esJEhAIdH4jSbgxq4FrZjJ4ICAkMoiEL7UV3uG+2uvZ+aRW/x+f94enmiCoNNMpv
         9f47k26JPXMnZVgQiw7fwszOINQkZT/vVgO7Q5ciYdLF6KG+jsgYLQ9fB0ljn4ZFaPdO
         yBuDN4dI5eQefvsH70LCb8BykplhlUfuXYSGdRX8rGDbLDKKx7xpWRarhzljP3gylI51
         LceU5NlSNfzIRIOZKimF3t1z17M1ZfcH/VkxQEgcgMJNRkpa5+X4dtByN8qkXMjAXJbn
         743g==
X-Gm-Message-State: AOJu0Ywrm20EWOx/BmRs5VnhGkahLKCh7529nAQLL5B3PyR13WrgModx
	tpWmnWcjrwfAvzesGZdIpTXRYl+Jf8pHHBR9n4mrdkLvvLnFTYr1rUipYA==
X-Gm-Gg: ASbGncu7v4MWo5iJTG3xioQLmHxukcyp0je7/ETiCjIA+QI5sFTWCU2W8mUMDfVdRJh
	VHpA4duVoFNav5WbRsj+NSj/nhrEnAhcOVhwAFBf4qg+jA769G3QVTtr7m6JwEH4hWP/oFWVVO/
	fN23bxSx/Ty2EM138+DEPZ1RN/5YY/4/+nEcm8oErY6qfqf/2zA9y6rnXbPhgaiUnAGIxIGnKYj
	4U/vOsKRAj+bZ00uX61JDd33OLWBy4R5JVIoLb7bk8mVE+7U/AW+R8Va5jEstsaIakSxw7t7Wtr
	TJMrT4F9bpcHMZp8dSJL+UxmL/9Gscur8Qq09prgC0MYV9TUNuMweoqo7jVs2LawGEs=
X-Google-Smtp-Source: AGHT+IH9eTxNY65CSJix4sFv4NYq9ZQdSIoImC6BnstiPDRHVYtXl1BLyXRCwWx/Mgs5vi8w8H7U/Q==
X-Received: by 2002:a5d:6482:0:b0:390:f88c:a6a2 with SMTP id ffacd0b85a97d-39132d986f8mr10127495f8f.39.1741599423323;
        Mon, 10 Mar 2025 02:37:03 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm14554454f8f.13.2025.03.10.02.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:37:02 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/7] oe-selftest: fitimage cleanup
Date: Mon, 10 Mar 2025 10:35:48 +0100
Message-ID: <20250310093641.1983560-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
References: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212503

This is a comprehensive cleanup of the fitImage related test cases.
The existing test cases were essentially the same code copied and pasted
9 times. All 9 test cases contained the code to parse an its file and to
parse the output of the dumpimage utility in slightly different variants.
Changing the kernel-fitimage.bbclass or the uboot-sign.bbclass would mean
changing 9 test cases individually. This is no longer maintainable.

This cleanup converts the code into reusable functions. The new test
code is more like a reverse implementation of the bbclasses to be tested
than a collection of straightforward test sequences.
This also means that the test code evaluates the same bitbake variables
as the implementation. This makes it much easier to add new test cases,
as a test case is basically just another local.conf file. The code is
not yet complete. But it can now be improved step by step in this
direction.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 1454 ++++++++++++----------
 1 file changed, 793 insertions(+), 661 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 00769443e80..6f3bf296d56 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -5,27 +5,58 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars
 import os
 import re
+import shlex
+import logging
+import pprint
 
-class FitImageTests(OESelftestTestCase):
+class FitImageTestCase(OESelftestTestCase):
+    """Test functions usable for testing kernel-fitimage.bbclass and uboot-sign.bbclass
 
-    def _setup_uboot_tools_native(self):
-        """build u-boot-tools-native and return ${RECIPE_SYSROOT_NATIVE}/${bindir}"""
-        bitbake("u-boot-tools-native -c addto_recipe_sysroot")
-        vars = get_bb_vars(['RECIPE_SYSROOT_NATIVE', 'bindir'], 'u-boot-tools-native')
+    A brief summary showing the structure of a test case:
+
+    self._test_fitimage()
+        # Generate a local.conf file and bitbake the bootloader or the kernel
+        self._bitbake_fit_image()
+
+        # Check if the its file contains the expected paths and attributes.
+        # The _get_req_* functions are implemented by more specific chield classes.
+        self._check_its_file()
+            req_its_paths = self._get_req_its_paths()
+            req_sigvalues_config = self._get_req_sigvalues_config()
+            req_sigvalues_image = self._get_req_sigvalues_image()
+            # Compare the its file against req_its_paths, req_sigvalues_config, req_sigvalues_image
+
+        # Call the dumpimage utiliy and check that it prints all the expected paths and attributes
+        # The _get_req_* functions are implemented by more specific chield classes.
+        self._check_fitimage()
+            self._get_req_sections()
+            # Compare the output of the dumpimage utility against
+    """
+
+    MKIMAGE_HASH_LENGTHS = { 'sha256': 64, 'sha384': 96, 'sha512': 128 }
+    MKIMAGE_SIGNATURE_LENGTHS = { 'rsa2048': 512 }
+
+    @staticmethod
+    def _gen_random_file(file_path, num_bytes=65536):
+        with open(file_path, 'wb') as file_out:
+            file_out.write(os.urandom(num_bytes))
+
+    @staticmethod
+    def _setup_native(native_recipe):
+        """Build a native recipe and return the path to its bindir in RECIPE_SYSROOT_NATIVE"""
+        bitbake(native_recipe + " -c addto_recipe_sysroot")
+        vars = get_bb_vars(['RECIPE_SYSROOT_NATIVE', 'bindir'], native_recipe)
         return os.path.join(vars['RECIPE_SYSROOT_NATIVE'], vars['bindir'])
 
-    def _run_dumpimage(self, fitimage_path, uboot_tools_bindir):
-        dumpimage_path = os.path.join(uboot_tools_bindir, 'dumpimage')
-        return runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
-
     def _verify_fit_image_signature(self, uboot_tools_bindir, fitimage_path, dtb_path, conf_name=None):
-        """Verify the signature of a fit contfiguration
+        """Verify the signature of a fit configuration
 
         The fit_check_sign utility from u-boot-tools-native is called.
-        uboot-fit_check_sign -f fitImage -k $dtb_name -c conf-$dtb_name
+        uboot-fit_check_sign -f fitImage -k $dtb_path -c conf-$dtb_name
+        dtb_path refers to a binary device tree containing the public key.
         """
         fit_check_sign_path = os.path.join(uboot_tools_bindir, 'uboot-fit_check_sign')
         cmd = '%s -f %s -k %s' % (fit_check_sign_path, fitimage_path, dtb_path)
@@ -37,33 +68,276 @@ class FitImageTests(OESelftestTestCase):
 
     @staticmethod
     def _find_string_in_bin_file(file_path, search_string):
-        """find stings in a binary file
+        """find strings in a binary file
 
         Shell equivalent: strings "$1" | grep "$2" | wc -l
         return number of matches
         """
         found_positions = 0
         with open(file_path, 'rb') as file:
-            byte = file.read(1)
-            current_position = 0
-            current_match = 0
-            while byte:
-                char = byte.decode('ascii', errors='ignore')
-                if char == search_string[current_match]:
-                    current_match += 1
-                    if current_match == len(search_string):
-                        found_positions += 1
-                        current_match = 0
-                else:
-                    current_match = 0
-                current_position += 1
-                byte = file.read(1)
+            content = file.read().decode('ascii', errors='ignore')
+            found_positions = content.count(search_string)
         return found_positions
 
+    @staticmethod
+    def _get_uboot_mkimage_sign_args(uboot_mkimage_sign_args):
+        """Retrive the string passed via -c to the mkimage command
+
+        Example: If a build configutation defines
+          UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
+        this function returns "a smart comment"
+        """
+        a_comment = None
+        if uboot_mkimage_sign_args:
+            mkimage_args = shlex.split(uboot_mkimage_sign_args)
+            try:
+                c_index = mkimage_args.index('-c')
+                a_comment = mkimage_args[c_index+1]
+            except ValueError:
+                pass
+        return a_comment
+
+    @staticmethod
+    def _get_dtb_files(bb_vars):
+        kernel_devicetree = bb_vars['KERNEL_DEVICETREE'] or ""
+        if kernel_devicetree:
+            return [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
+        return []
+
+    def _is_req_dict_in_dict(self, found_dict, req_dict):
+        """
+        Check if all key-value pairs in the required dictionary are present in the found dictionary.
+
+        This function recursively checks if the required dictionary (`req_dict`) is a subset of the found dictionary (`found_dict`).
+        It supports nested dictionaries, strings, lists, and sets as values.
+
+        Args:
+            found_dict (dict): The dictionary to search within.
+            req_dict (dict): The dictionary containing the required key-value pairs.
+        """
+        for key, value in req_dict.items():
+            self.assertIn(key, found_dict)
+            if isinstance(value, dict):
+                self._is_req_dict_in_dict(found_dict[key], value)
+            elif isinstance(value, str):
+                self.assertIn(value, found_dict[key])
+            elif isinstance(value, list):
+                self.assertLessEqual(set(value), set(found_dict[key]))
+            elif isinstance(value, set):
+                self.assertLessEqual(value, found_dict[key])
+            else:
+                self.assertEqual(value, found_dict[key])
+
+    def _check_its_file(self, bb_vars, its_file_path):
+        """Check if the its file contains the expected sections and fields"""
+        # print the its file for debugging
+        if logging.DEBUG >= self.logger.level:
+            with open(its_file_path) as its_file:
+                self.logger.debug("its file: %s" % its_file.read())
+
+        # Generate a list of expected paths in the its file
+        req_its_paths = self._get_req_its_paths(bb_vars)
+        self.logger.debug("req_its_paths:\n%s\n" % pprint.pformat(req_its_paths, indent=4))
+
+        # Generate a dict of expected configuration signature nodes
+        req_sigvalues_config = self._get_req_sigvalues_config(bb_vars)
+        self.logger.debug("req_sigvalues_config:\n%s\n" % pprint.pformat(req_sigvalues_config, indent=4))
+
+        # Generate a dict of expected image signature nodes
+        req_sigvalues_image = self._get_req_sigvalues_image(bb_vars)
+        self.logger.debug("req_sigvalues_image:\n%s\n" % pprint.pformat(req_sigvalues_image, indent=4))
+
+        # Parse the its file for paths and signatures
+        its_path = []
+        its_paths = []
+        linect = 0
+        sigs = {}
+        with open(its_file_path) as its_file:
+            for line in its_file:
+                linect += 1
+                line = line.strip()
+                if line.endswith('};'):
+                    its_path.pop()
+                elif line.endswith('{'):
+                    its_path.append(line[:-1].strip())
+                    its_paths.append(its_path[:])
+                # kernel-fitimage uses signature-1, uboot-sign uses signature
+                elif its_path and (its_path[-1] == 'signature-1' or its_path[-1] == 'signature'):
+                    itsdotpath = '.'.join(its_path)
+                    if not itsdotpath in sigs:
+                        sigs[itsdotpath] = {}
+                    if not '=' in line or not line.endswith(';'):
+                        self.fail('Unexpected formatting in %s sigs section line %d:%s' % (its_file_path, linect, line))
+                    key, value = line.split('=', 1)
+                    sigs[itsdotpath][key.rstrip()] = value.lstrip().rstrip(';')
+
+        # Check if all expected paths are found in the its file
+        self.logger.debug("itspaths:\n%s\n" % pprint.pformat(its_paths, indent=4))
+        for req_path in req_its_paths:
+            if not req_path in its_paths:
+                self.fail('Missing path in its file: %s (%s)' % (req_path, its_file_path))
+
+        # Check if all the expected singnature nodes (images and configurations) are found
+        self.logger.debug("sigs:\n%s\n" % pprint.pformat(sigs, indent=4))
+        if req_sigvalues_config or req_sigvalues_image:
+            for its_path, values in sigs.items():
+                if 'conf-' in its_path:
+                    reqsigvalues = req_sigvalues_config
+                else:
+                    reqsigvalues = req_sigvalues_image
+                for reqkey, reqvalue in reqsigvalues.items():
+                    value = values.get(reqkey, None)
+                    if value is None:
+                        self.fail('Missing key "%s" in its file signature section %s (%s)' % (reqkey, its_path, its_file_path))
+                    self.assertEqual(value, reqvalue)
+
+        # Generate a list of expected fields in the its file
+        req_its_fields = self._get_req_its_fields(bb_vars)
+        self.logger.debug("req_its_fields:\n%s\n" % pprint.pformat(req_its_fields, indent=4))
+
+        # Check if all expected fields are in the its file
+        if req_its_fields:
+            field_index = 0
+            field_index_last = len(req_its_fields) - 1
+            with open(its_file_path) as its_file:
+                for line in its_file:
+                    if req_its_fields[field_index] in line:
+                        if field_index < field_index_last:
+                            field_index +=1
+                        else:
+                            break
+            self.assertEqual(field_index, field_index_last,
+                "Fields in Image Tree Source File %s did not match, error in finding %s"
+                % (its_file_path, req_its_fields[field_index]))
+
+    def _check_fitimage(self, bb_vars, fitimage_path, uboot_tools_bindir):
+        """Run dumpimage on the final FIT image and parse the output into a dict"""
+        dumpimage_path = os.path.join(uboot_tools_bindir, 'dumpimage')
+        cmd = '%s -l %s' % (dumpimage_path, fitimage_path)
+        self.logger.debug("Analyzing output from dumpimage: %s" % cmd)
+        dumpimage_result = runCmd(cmd)
+        in_section = None
+        sections = {}
+        self.logger.debug("dumpimage output: %s" % dumpimage_result.output)
+        for line in dumpimage_result.output.splitlines():
+            # Find potentially hashed and signed sections
+            if line.startswith((' Configuration', ' Image')):
+                in_section = re.search(r'\((.*)\)', line).groups()[0]
+            # Key value lines start with two spaces otherwise the section ended
+            elif not line.startswith("  "):
+                in_section = None
+            # Handle key value lines of this section
+            elif in_section:
+                if not in_section in sections:
+                    sections[in_section] = {}
+                try:
+                    key, value = line.split(':', 1)
+                    key = key.strip()
+                    value = value.strip()
+                except ValueError as val_err:
+                    self.logger.debug("dumpimage debug: %s = %s" % (key, line))
+                    # Handle multiple entries as e.g. for Loadables as a list
+                    if key and line.startswith("   "):
+                        value = sections[in_section][key] + "," + line.strip()
+                    else:
+                        raise ValueError(f"Error processing line: '{line}'. Original error: {val_err}")
+                sections[in_section][key] = value
+
+        # Check if the requested dictionary is a subset of the parsed dictionary
+        req_sections, num_signatures = self._get_req_sections(bb_vars)
+        self.logger.debug("req_sections: \n%s\n" % pprint.pformat(req_sections, indent=4))
+        self.logger.debug("dumpimage sections: \n%s\n" % pprint.pformat(sections, indent=4))
+        self._is_req_dict_in_dict(sections, req_sections)
+
+        # Call the signing related checks if the function is provided by a inherited class
+        self._check_signing(bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path)
+
+    def _get_req_its_paths(self, bb_vars):
+        self.logger.error("This function needs to be implemented")
+        return []
+
+    def _get_req_its_fields(self, bb_vars):
+        self.logger.error("This function needs to be implemented")
+        return []
+
+    def _get_req_sigvalues_config(self, bb_vars):
+        self.logger.error("This function needs to be implemented")
+        return {}
+
+    def _get_req_sigvalues_image(self, bb_vars):
+        self.logger.error("This function needs to be implemented")
+        return {}
+
+    def _get_req_sections(self, bb_vars):
+        self.logger.error("This function needs to be implemented")
+        return ({}, 0)
+
+    def _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):
+        """Verify the signatures in the FIT image."""
+        self.fail("Function needs to be implemented by inheriting classes")
+
+    def _bitbake_fit_image(self, bb_vars):
+        """Bitbake the FIT image and return the paths to the its file and the FIT image"""
+        self.fail("Function needs to be implemented by inheriting classes")
+
+    def _test_fitimage(self, bb_vars):
+        """Check if the its file and the FIT image are created and signed correctly"""
+        fitimage_its_path, fitimage_path = self._bitbake_fit_image(bb_vars)
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
+
+        self.logger.debug("Checking its: %s" % fitimage_its_path)
+        self._check_its_file(bb_vars, fitimage_its_path)
+
+        # Setup u-boot-tools-native
+        uboot_tools_bindir = FitImageTestCase._setup_native('u-boot-tools-native')
+
+        # Verify the FIT image
+        self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
+
+
+class KernelFitImageTests(FitImageTestCase):
+    """Test cases for the kernel-fitimage bbclass"""
+
+    def _fit_get_bb_vars(self, additional_vars=[]):
+        """Retrieve BitBake variables specific to the test case.
+
+        Call the get_bb_vars function once and get all variables needed by the test case.
+        """
+        internal_used = {
+            'DEPLOY_DIR_IMAGE',
+            'FIT_DESC',
+            'FIT_HASH_ALG',
+            'FIT_KERNEL_COMP_ALG',
+            'FIT_SIGN_ALG',
+            'FIT_SIGN_INDIVIDUAL',
+            'FIT_UBOOT_ENV',
+            'INITRAMFS_IMAGE_BUNDLE',
+            'INITRAMFS_IMAGE_NAME',
+            'INITRAMFS_IMAGE',
+            'KERNEL_DEVICETREE',
+            'KERNEL_FIT_LINK_NAME',
+            'MACHINE',
+            'UBOOT_ARCH',
+            'UBOOT_ENTRYPOINT',
+            'UBOOT_LOADADDRESS',
+            'UBOOT_MKIMAGE_KERNEL_TYPE',
+            'UBOOT_MKIMAGE_SIGN_ARGS',
+            'UBOOT_RD_ENTRYPOINT',
+            'UBOOT_RD_LOADADDRESS',
+            'UBOOT_SIGN_ENABLE',
+            'UBOOT_SIGN_IMG_KEYNAME',
+            'UBOOT_SIGN_KEYDIR',
+            'UBOOT_SIGN_KEYNAME',
+        }
+        bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/kernel")
+        return bb_vars
+
     def _config_add_uboot_env(self, config):
         """Generate an u-boot environment
 
-        Create a boot.cmd file that is packed into the FitImage as a source-able text file.
+        Create a boot.cmd file that is packed into the FIT image as a source-able text file.
+        Updates the configuration to include the boot.cmd file.
         """
         fit_uenv_file =  "boot.cmd"
         test_files_dir = "test-files"
@@ -75,17 +349,253 @@ class FitImageTests(OESelftestTestCase):
         config += 'SRC_URI:append:pn-linux-yocto = " file://${FIT_UBOOT_ENV}"' + os.linesep
 
         if not os.path.isdir(test_files_dir):
-            os.mkdir(test_files_dir)
+            os.makedirs(test_files_dir)
         self.logger.debug("Writing to: %s" % fit_uenv_path)
         with open(fit_uenv_path, "w") as f:
             f.write('echo "hello world"')
 
         return config
 
-    def _verify_fitimage_uboot_env(self, dumpimage_result):
-        """Check if the boot.cmd script is part of the fitImage"""
-        num_scr_images = len(re.findall(r"^ *Image +[0-9]+ +\(bootscr-boot\.cmd\)$", dumpimage_result.output, re.MULTILINE))
-        self.assertEqual(1, num_scr_images, msg="Expected exactly 1 bootscr-boot.cmd image section in the fitImage")
+    def _bitbake_fit_image(self, bb_vars):
+        """Bitbake the kernel and return the paths to the its file and the FIT image"""
+        bitbake("virtual/kernel")
+
+        # Find the right its file and the final fitImage and check if both files are available
+        deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
+        initramfs_image = bb_vars['INITRAMFS_IMAGE']
+        initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
+        initramfs_image_name = bb_vars['INITRAMFS_IMAGE_NAME']
+        kernel_fit_link_name = bb_vars['KERNEL_FIT_LINK_NAME']
+        if not initramfs_image and initramfs_image_bundle != "1":
+            fitimage_its_name = "fitImage-its-%s" % kernel_fit_link_name
+            fitimage_name = "fitImage"
+        elif initramfs_image and initramfs_image_bundle != "1":
+            fitimage_its_name = "fitImage-its-%s-%s" % (initramfs_image_name, kernel_fit_link_name)
+            fitimage_name = "fitImage-%s-%s" % (initramfs_image_name, kernel_fit_link_name)
+        elif initramfs_image and initramfs_image_bundle == "1":
+            fitimage_its_name = "fitImage-its-%s-%s" % (initramfs_image_name, kernel_fit_link_name)
+            fitimage_name = "fitImage"  # or fitImage-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
+        else:
+            self.fail('Invalid configuration: INITRAMFS_IMAGE_BUNDLE = "1" and not INITRAMFS_IMAGE')
+        fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_its_name))
+        fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_name))
+        return (fitimage_its_path, fitimage_path)
+
+    def _get_req_its_paths(self, bb_vars):
+        """Generate a list of expected paths in the its file
+
+        Example:
+            [
+                ['/', 'images', 'kernel-1', 'hash-1'],
+                ['/', 'images', 'kernel-1', 'signature-1'],
+            ]
+        """
+        dtb_files = FitImageTestCase._get_dtb_files(bb_vars)
+        fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
+        fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
+        initramfs_image = bb_vars['INITRAMFS_IMAGE']
+        initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
+        uboot_sign_enable = bb_vars['UBOOT_SIGN_ENABLE']
+
+        # image nodes
+        images = [ 'kernel-1' ]
+        if dtb_files:
+            images += [ 'fdt-' + dtb for dtb in dtb_files ]
+        if fit_uboot_env:
+            images.append('bootscr-' + fit_uboot_env)
+        if bb_vars['MACHINE'] == "qemux86-64": # Not really the right if
+            images.append('setup-1')
+        if initramfs_image and initramfs_image_bundle != "1":
+            images.append('ramdisk-1')
+
+        # configuration nodes
+        if dtb_files:
+            configurations = [ 'conf-' + conf for conf in dtb_files ]
+        else:
+            configurations = [ 'conf-1' ]
+
+        # Create a list of paths for all image and configuration nodes
+        req_its_paths = []
+        for image in images:
+            req_its_paths.append(['/', 'images', image, 'hash-1'])
+            if uboot_sign_enable == "1" and fit_sign_individual == "1":
+                req_its_paths.append(['/', 'images', image, 'signature-1'])
+        for configuration in configurations:
+            req_its_paths.append(['/', 'configurations', configuration, 'hash-1'])
+            if uboot_sign_enable == "1":
+                req_its_paths.append(['/', 'configurations', configuration, 'signature-1'])
+        return req_its_paths
+
+    def _get_req_its_fields(self, bb_vars):
+        initramfs_image = bb_vars['INITRAMFS_IMAGE']
+        initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
+        uboot_rd_loadaddress = bb_vars['UBOOT_RD_LOADADDRESS']
+        uboot_rd_entrypoint = bb_vars['UBOOT_RD_ENTRYPOINT']
+
+        its_field_check = [
+            'description = "%s";' % bb_vars['FIT_DESC'],
+            'description = "Linux kernel";',
+            'data = /incbin/("linux.bin");',
+            'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
+            'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
+            'os = "linux";',
+            # 'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";', defined based on files in TMPDIR, not ideal...
+            'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
+            'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
+        ]
+        if initramfs_image and initramfs_image_bundle != "1":
+            its_field_check.append('type = "ramdisk";')
+            if uboot_rd_loadaddress:
+                its_field_check.append("load = <%s>;" % uboot_rd_loadaddress)
+            if uboot_rd_entrypoint:
+                its_field_check.append("entry = <%s>;" % uboot_rd_entrypoint)
+        its_field_check += [
+            # 'default = "conf-1";', needs more work
+            'kernel = "kernel-1";',
+        ]
+        if initramfs_image and initramfs_image_bundle != "1":
+            its_field_check.append('ramdisk = "ramdisk-1";')
+
+        return its_field_check
+
+    def _get_req_sigvalues_config(self, bb_vars):
+        """Generate a dictionary of expected configuration signature nodes"""
+        sign_images = '"kernel", "fdt"'
+        if bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDLE'] != "1":
+            sign_images += ', "ramdisk"'
+        if bb_vars['FIT_UBOOT_ENV']:
+            sign_images += ', "bootscr"'
+        req_sigvalues_config = {
+            'algo': '"%s,%s"' % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG']),
+            'key-name-hint': '"%s"' % bb_vars['UBOOT_SIGN_KEYNAME'],
+            'sign-images': sign_images,
+        }
+        return req_sigvalues_config
+
+    def _get_req_sigvalues_image(self, bb_vars):
+        """Generate a dictionary of expected image signature nodes"""
+        if bb_vars['FIT_SIGN_INDIVIDUAL'] != "1":
+            return {}
+        req_sigvalues_image = {
+            'algo': '"%s,%s"' % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG']),
+            'key-name-hint': '"%s"' % bb_vars['UBOOT_SIGN_IMG_KEYNAME'],
+        }
+        return req_sigvalues_image
+
+    def _get_req_sections(self, bb_vars):
+        """Generate a dictionary of expected sections in the output of dumpimage"""
+        dtb_files = FitImageTestCase._get_dtb_files(bb_vars)
+        fit_hash_alg = bb_vars['FIT_HASH_ALG']
+        fit_sign_alg = bb_vars['FIT_SIGN_ALG']
+        fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
+        fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
+        initramfs_image = bb_vars['INITRAMFS_IMAGE']
+        initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
+        uboot_sign_enable = bb_vars['UBOOT_SIGN_ENABLE']
+        uboot_sign_img_keyname = bb_vars['UBOOT_SIGN_IMG_KEYNAME']
+        uboot_sign_keyname = bb_vars['UBOOT_SIGN_KEYNAME']
+        num_signatures = 0
+        req_sections = {
+            "kernel-1": {
+                "Type": "Kernel Image",
+                "OS": "Linux",
+                "Load Address": bb_vars['UBOOT_LOADADDRESS'],
+                "Entry Point": bb_vars['UBOOT_ENTRYPOINT'],
+            }
+        }
+        # Create one section per DTB
+        for dtb in dtb_files:
+            req_sections['fdt-' + dtb] = {
+                "Type": "Flat Device Tree",
+            }
+        # Add a script section if there is a script
+        if fit_uboot_env:
+            req_sections['bootscr-' + fit_uboot_env] = { "Type": "Script" }
+        # Add the initramfs
+        if initramfs_image and initramfs_image_bundle != "1":
+            req_sections['ramdisk-1'] = {
+                "Type": "RAMDisk Image",
+                "Load Address": bb_vars['UBOOT_RD_LOADADDRESS'],
+                "Entry Point": bb_vars['UBOOT_RD_ENTRYPOINT']
+            }
+        # Create a configuration section for each DTB
+        if dtb_files:
+            for dtb in dtb_files:
+                req_sections['conf-' + dtb] = {
+                    "Kernel": "kernel-1",
+                    "FDT": 'fdt-' + dtb,
+                }
+                if initramfs_image and initramfs_image_bundle != "1":
+                    req_sections['conf-' + dtb]['Init Ramdisk'] = "ramdisk-1"
+        else:
+            req_sections['conf-1'] = {
+                "Kernel": "kernel-1"
+            }
+            if initramfs_image and initramfs_image_bundle != "1":
+                req_sections['conf-1']['Init Ramdisk'] = "ramdisk-1"
+
+        # Add signing related properties if needed
+        if uboot_sign_enable == "1":
+            for section in req_sections:
+                req_sections[section]['Hash algo'] = fit_hash_alg
+                if section.startswith('conf-'):
+                    req_sections[section]['Hash value'] = "unavailable"
+                    req_sections[section]['Sign algo'] = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_keyname)
+                    num_signatures += 1
+                elif fit_sign_individual == "1":
+                    req_sections[section]['Sign algo'] = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_img_keyname)
+                    num_signatures += 1
+        return (req_sections, num_signatures)
+
+    def _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):
+        """Verify the signature nodes in the FIT image"""
+        if bb_vars['UBOOT_SIGN_ENABLE'] == "1":
+            self.logger.debug("Verifying signatures in the FIT image")
+        else:
+            self.logger.debug("FIT image is not signed. Signature verification is not needed.")
+            return
+
+        fit_hash_alg = bb_vars['FIT_HASH_ALG']
+        fit_sign_alg = bb_vars['FIT_SIGN_ALG']
+        uboot_sign_keyname = bb_vars['UBOOT_SIGN_KEYNAME']
+        uboot_sign_img_keyname = bb_vars['UBOOT_SIGN_IMG_KEYNAME']
+        deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
+        fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
+        fit_hash_alg_len = FitImageTestCase.MKIMAGE_HASH_LENGTHS[fit_hash_alg]
+        fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[fit_sign_alg]
+        for section, values in sections.items():
+            # Configuration nodes are always signed with UBOOT_SIGN_KEYNAME (if UBOOT_SIGN_ENABLE = "1")
+            if section.startswith("conf"):
+                sign_algo = values.get('Sign algo', None)
+                req_sign_algo = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_keyname)
+                self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
+                sign_value = values.get('Sign value', None)
+                self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
+                dtb_path = os.path.join(deploy_dir_image, section.replace('conf-', ''))
+                self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, dtb_path, section)
+            else:
+                # Image nodes always need a hash which gets indirectly signed by the config signature
+                hash_algo = values.get('Hash algo', None)
+                self.assertEqual(hash_algo, fit_hash_alg)
+                hash_value = values.get('Hash value', None)
+                self.assertEqual(len(hash_value), fit_hash_alg_len, 'Hash value for section %s not expected length' % section)
+                # Optionally, if FIT_SIGN_INDIVIDUAL = 1 also the image nodes have a signature (which is redundant but possible)
+                if fit_sign_individual == "1":
+                    sign_algo = values.get('Sign algo', None)
+                    req_sign_algo = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_img_keyname)
+                    self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
+                    sign_value = values.get('Sign value', None)
+                    self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
+
+        # Search for the string passed to mkimage in each signed section of the FIT image.
+        # Looks like mkimage supports to add a comment but does not support to read it back.
+        a_comment = FitImageTestCase._get_uboot_mkimage_sign_args(bb_vars['UBOOT_MKIMAGE_SIGN_ARGS'])
+        self.logger.debug("a_comment: %s" % a_comment)
+        if a_comment:
+            found_comments = FitImageTestCase._find_string_in_bin_file(fitimage_path, a_comment)
+            self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
+                             (num_signatures, a_comment))
+
 
     def test_fit_image(self):
         """
@@ -117,76 +627,34 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
 """
-        config = self._config_add_uboot_env(config)
         self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
 
-        # fitImage is created as part of linux recipe
-        image = "virtual/kernel"
-        bitbake(image)
-        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'INITRAMFS_IMAGE_NAME', 'KERNEL_FIT_LINK_NAME'], image)
-
-        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-            "fitImage-its-%s-%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_LINK_NAME']))
-        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-            "fitImage-%s-%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_LINK_NAME']))
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        # Check that the type, load address, entrypoint address and default
-        # values for kernel and ramdisk in Image Tree Source are as expected.
-        # The order of fields in the below array is important. Not all the
-        # fields are tested, only the key fields that wont vary between
-        # different architectures.
-        its_field_check = [
-            'description = "A model description";',
-            'type = "kernel";',
-            'load = <0x80080000>;',
-            'entry = <0x80080000>;',
-            'type = "ramdisk";',
-            'load = <0x88000000>;',
-            'entry = <0x88000000>;',
-            'default = "conf-1";',
-            'kernel = "kernel-1";',
-            'ramdisk = "ramdisk-1";'
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
-        uboot_tools_bindir = self._setup_uboot_tools_native()
-        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
-        self._verify_fitimage_uboot_env(dumpimage_result)
 
     def test_sign_fit_image(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are created
-                     and signed correctly.
+                     and all nodes are signed correctly.
         Expected:    1) its and FIT image are built successfully
                      2) Scanning the its file indicates signing is enabled
-                        as requested by UBOOT_SIGN_ENABLE (using keys generated
-                        via FIT_GENERATE_KEYS)
+                        as requested by UBOOT_SIGN_ENABLE (using 2 keys
+                        generated via FIT_GENERATE_KEYS)
                      3) Dumping the FIT image indicates signature values
                         are present (including for images as enabled via
                         FIT_SIGN_INDIVIDUAL)
-                     4) Examination of the do_assemble_fitimage runfile/logfile
-                        indicate that UBOOT_MKIMAGE, UBOOT_MKIMAGE_SIGN and
-                        UBOOT_MKIMAGE_SIGN_ARGS are working as expected.
+                     4) Verify the FIT image contains the comments passed via
+                        UBOOT_MKIMAGE_SIGN_ARGS once per image and per
+                        configuration node.
+        Note:        This test is mostly for backward compatibility.
+                     The recommended approach is to sign the configuration nodes
+                     which include also the hashes of all the images. Signing
+                     all the images individually is therefore redundant.
         Product:     oe-core
         Author:      Paul Eggleton <paul.eggleton@microsoft.com> based upon
                      work by Usama Arif <usama.arif@arm.com>
         """
-        a_comment = "a smart comment"
+        # Generate a configuration section which gets included into the local.conf file
         config = """
 # Enable creation of fitImage
 MACHINE = "beaglebone-yocto"
@@ -198,120 +666,13 @@ UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
 UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
-UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
-""" % a_comment
-
+UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
+"""
         config = self._config_add_uboot_env(config)
         self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
 
-        # fitImage is created as part of linux recipe
-        image = "virtual/kernel"
-        bitbake(image)
-        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'KERNEL_FIT_LINK_NAME'], image)
-
-        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-            "fitImage-its-%s" % (bb_vars['KERNEL_FIT_LINK_NAME']))
-        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-            "fitImage-%s.bin" % (bb_vars['KERNEL_FIT_LINK_NAME']))
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        req_itspaths = [
-            ['/', 'images', 'kernel-1'],
-            ['/', 'images', 'kernel-1', 'signature-1'],
-            ['/', 'images', 'fdt-am335x-boneblack.dtb'],
-            ['/', 'images', 'fdt-am335x-boneblack.dtb', 'signature-1'],
-            ['/', 'configurations', 'conf-am335x-boneblack.dtb'],
-            ['/', 'configurations', 'conf-am335x-boneblack.dtb', 'signature-1'],
-        ]
-
-        itspath = []
-        itspaths = []
-        linect = 0
-        sigs = {}
-        with open(fitimage_its_path) as its_file:
-            linect += 1
-            for line in its_file:
-                line = line.strip()
-                if line.endswith('};'):
-                    itspath.pop()
-                elif line.endswith('{'):
-                    itspath.append(line[:-1].strip())
-                    itspaths.append(itspath[:])
-                elif itspath and itspath[-1] == 'signature-1':
-                    itsdotpath = '.'.join(itspath)
-                    if not itsdotpath in sigs:
-                        sigs[itsdotpath] = {}
-                    if not '=' in line or not line.endswith(';'):
-                        self.fail('Unexpected formatting in %s sigs section line %d:%s' % (fitimage_its_path, linect, line))
-                    key, value = line.split('=', 1)
-                    sigs[itsdotpath][key.rstrip()] = value.lstrip().rstrip(';')
-
-        for reqpath in req_itspaths:
-            if not reqpath in itspaths:
-                self.fail('Missing section in its file: %s' % reqpath)
-
-        reqsigvalues_image = {
-            'algo': '"sha256,rsa2048"',
-            'key-name-hint': '"img-oe-selftest"',
-        }
-        reqsigvalues_config = {
-            'algo': '"sha256,rsa2048"',
-            'key-name-hint': '"cfg-oe-selftest"',
-            'sign-images': '"kernel", "fdt", "bootscr"',
-        }
-
-        for itspath, values in sigs.items():
-            if 'conf-' in itspath:
-                reqsigvalues = reqsigvalues_config
-            else:
-                reqsigvalues = reqsigvalues_image
-            for reqkey, reqvalue in reqsigvalues.items():
-                value = values.get(reqkey, None)
-                if value is None:
-                    self.fail('Missing key "%s" in its file signature section %s' % (reqkey, itspath))
-                self.assertEqual(value, reqvalue)
-
-        # Dump the image to see if it really got signed
-        uboot_tools_bindir = self._setup_uboot_tools_native()
-        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
-        in_signed = None
-        signed_sections = {}
-        for line in dumpimage_result.output.splitlines():
-            if line.startswith((' Configuration', ' Image')):
-                in_signed = re.search(r'\((.*)\)', line).groups()[0]
-            elif re.match('^ *', line) in (' ', ''):
-                in_signed = None
-            elif in_signed:
-                if not in_signed in signed_sections:
-                    signed_sections[in_signed] = {}
-                key, value = line.split(':', 1)
-                signed_sections[in_signed][key.strip()] = value.strip()
-        self.assertIn('kernel-1', signed_sections)
-        self.assertIn('fdt-am335x-boneblack.dtb', signed_sections)
-        self.assertIn('conf-am335x-boneblack.dtb', signed_sections)
-        for signed_section, values in signed_sections.items():
-            value = values.get('Sign algo', None)
-            if signed_section.startswith("conf"):
-                self.assertEqual(value, 'sha256,rsa2048:cfg-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
-            else:
-                self.assertEqual(value, 'sha256,rsa2048:img-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
-            value = values.get('Sign value', None)
-            self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
-
-        # Check if the u-boot boot.scr script is in the fitImage
-        self._verify_fitimage_uboot_env(dumpimage_result)
-
-        # Search for the string passed to mkimage: 1 kernel + 3 DTBs + config per DTB = 7 sections
-        # Looks like mkimage supports to add a comment but does not support to read it back.
-        found_comments = FitImageTests._find_string_in_bin_file(fitimage_path, a_comment)
-        self.assertEqual(found_comments, 8, "Expected 8 signed and commented section in the fitImage.")
-
-        # Verify the signature for all configurations = DTBs
-        for dtb in ['am335x-bone.dtb', 'am335x-boneblack.dtb', 'am335x-bonegreen.dtb']:
-            self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
-                                             os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], dtb), 'conf-' + dtb)
 
     def test_initramfs_bundle(self):
         """
@@ -355,92 +716,224 @@ FIT_HASH_ALG = "sha256"
 """
         config = self._config_add_uboot_env(config)
         self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
 
-        # fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
 
-        bb_vars = get_bb_vars([
+class UBootFitImageTests(FitImageTestCase):
+    """Test cases for the uboot-sign bbclass"""
+
+    def _fit_get_bb_vars(self, additional_vars=[]):
+        """Get bb_vars as needed by _test_sign_fit_image
+
+        Call the get_bb_vars function once and get all variables needed by the test case.
+        """
+        internal_used = {
             'DEPLOY_DIR_IMAGE',
-            'FIT_HASH_ALG',
-            'FIT_KERNEL_COMP_ALG',
-            'INITRAMFS_IMAGE',
             'MACHINE',
+            'SPL_MKIMAGE_SIGN_ARGS',
+            'SPL_SIGN_ENABLE',
+            'SPL_SIGN_KEYNAME',
             'UBOOT_ARCH',
-            'UBOOT_ENTRYPOINT',
-            'UBOOT_LOADADDRESS',
-            'UBOOT_MKIMAGE_KERNEL_TYPE'
-            ],
-            'virtual/kernel')
-        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-                    "fitImage-its-%s-%s-%s" % (bb_vars['INITRAMFS_IMAGE'], bb_vars['MACHINE'], bb_vars['MACHINE']))
-        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],"fitImage")
+            'UBOOT_DTB_BINARY',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
+            'UBOOT_FIT_CONF_USER_LOADABLES',
+            'UBOOT_FIT_DESC',
+            'UBOOT_FIT_HASH_ALG',
+            'UBOOT_FIT_SIGN_ALG',
+            'UBOOT_FIT_TEE_ENTRYPOINT',
+            'UBOOT_FIT_TEE_LOADADDRESS',
+            'UBOOT_FIT_TEE',
+            'UBOOT_FIT_UBOOT_ENTRYPOINT',
+            'UBOOT_FIT_UBOOT_LOADADDRESS',
+            'UBOOT_FIT_USER_SETTINGS',
+            'UBOOT_FITIMAGE_ENABLE',
+            'UBOOT_NODTB_BINARY',
+            'UBOOT_SIGN_IMG_KEYNAME',
+        }
+        bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/bootloader")
+        return bb_vars
 
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
+    def _bitbake_fit_image(self, bb_vars):
+        """Bitbake the bootloader and return the paths to the its file and the FIT image"""
+        bitbake("virtual/bootloader")
 
-        its_file = open(fitimage_its_path)
+        deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
+        machine = bb_vars['MACHINE']
+        fitimage_its_path = os.path.join(deploy_dir_image, "u-boot-its-%s" % machine)
+        fitimage_path = os.path.join(deploy_dir_image, "u-boot-fitImage-%s" % machine)
+        return (fitimage_its_path, fitimage_path)
 
-        its_lines = [line.strip() for line in its_file.readlines()]
+    def _get_req_its_paths(self, bb_vars):
+        # image nodes
+        images = [ 'uboot', 'fdt',  ]
+        if bb_vars['UBOOT_FIT_TEE'] == "1":
+            images.append('tee')
+        if bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE'] == "1":
+            images.append('atf')
+        # if bb_vars['UBOOT_FIT_USER_SETTINGS']:
 
-        exp_node_lines = [
-            'kernel-1 {',
-            'description = "Linux kernel";',
-            'data = /incbin/("linux.bin");',
-            'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
-            'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
-            'os = "linux";',
-            'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";',
-            'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
-            'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
-            'hash-1 {',
-            'algo = "' + str(bb_vars['FIT_HASH_ALG']) +'";',
-            '};',
-            '};'
+        # configuration nodes
+        configurations = [ 'conf']
+
+        # Create a list of paths for all image and configuration nodes
+        req_its_paths = []
+        for image in images:
+            req_its_paths.append(['/', 'images', image])
+            if bb_vars['SPL_SIGN_ENABLE'] == "1":
+                req_its_paths.append(['/', 'images', image, 'signature'])
+        for configuration in configurations:
+            req_its_paths.append(['/', 'configurations', configuration])
+        return req_its_paths
+
+    def _get_req_its_fields(self, bb_vars):
+        loadables = ["uboot"]
+        its_field_check = [
+            'description = "%s";' % bb_vars['UBOOT_FIT_DESC'],
+            'description = "U-Boot image";',
+            'data = /incbin/("%s");' % bb_vars['UBOOT_NODTB_BINARY'],
+            'type = "standalone";',
+            'os = "u-boot";',
+            'arch = "%s";' % bb_vars['UBOOT_ARCH'],
+            'compression = "none";',
+            'load = <%s>;' % bb_vars['UBOOT_FIT_UBOOT_LOADADDRESS'],
+            'entry = <%s>;' % bb_vars['UBOOT_FIT_UBOOT_ENTRYPOINT'],
+            'description = "U-Boot FDT";',
+            'data = /incbin/("%s");' % bb_vars['UBOOT_DTB_BINARY'],
+            'type = "flat_dt";',
+            'arch = "%s";' % bb_vars['UBOOT_ARCH'],
+            'compression = "none";',
         ]
+        if bb_vars['UBOOT_FIT_TEE'] == "1":
+            its_field_check += [
+                'description = "Trusted Execution Environment";',
+                'data = /incbin/("%s");' % bb_vars['UBOOT_FIT_TEE_IMAGE'],
+                'type = "tee";',
+                'arch = "%s";' % bb_vars['UBOOT_ARCH'],
+                'os = "tee";',
+                'load = <%s>;' % bb_vars['UBOOT_FIT_TEE_LOADADDRESS'],
+                'entry = <%s>;' % bb_vars['UBOOT_FIT_TEE_ENTRYPOINT'],
+                'compression = "none";',
+            ]
+            loadables.insert(0, "tee")
+        if bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE'] == "1":
+            its_field_check += [
+                'description = "ARM Trusted Firmware";',
+                'data = /incbin/("%s");' % bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'],
+                'type = "firmware";',
+                'arch = "%s";' % bb_vars['UBOOT_ARCH'],
+                'os = "arm-trusted-firmware";',
+                'load = <%s>;' % bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS'],
+                'entry = <%s>;' % bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT'],
+                'compression = "none";',
+            ]
+            loadables.insert(0, "atf")
+        its_field_check += [
+            'default = "conf";',
+            'description = "Boot with signed U-Boot FIT";',
+            'loadables = "%s";' % '", "'.join(loadables),
+            'fdt = "fdt";',
+        ]
+        return its_field_check
 
-        node_str = exp_node_lines[0]
+    def _get_req_sigvalues_config(self, bb_vars):
+        # COnfigurations are not signed by uboot-sign
+        return {}
 
-        print ("checking kernel node\n")
-        self.assertIn(node_str, its_lines)
+    def _get_req_sigvalues_image(self, bb_vars):
+        if bb_vars['SPL_SIGN_ENABLE'] != "1":
+            return {}
+        req_sigvalues_image = {
+            'algo': '"%s,%s"' % (bb_vars['UBOOT_FIT_HASH_ALG'], bb_vars['UBOOT_FIT_SIGN_ALG']),
+            'key-name-hint': '"%s"' % bb_vars['SPL_SIGN_KEYNAME'],
+        }
+        return req_sigvalues_image
 
-        node_start_idx = its_lines.index(node_str)
-        node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
+    def _get_req_sections(self, bb_vars):
+        """Generate the expected output of dumpimage for beaglebone targets
 
-        # Remove the absolute path. This refers to WORKDIR which is not always predictable.
-        re_data = re.compile(r'^data = /incbin/\(.*/linux\.bin"\);$')
-        node = [re.sub(re_data, 'data = /incbin/("linux.bin");', cfg_str) for cfg_str in node]
+        The dict generated by this function is supposed to be compared against
+        the dict which is generated by the _dump_fitimage function.
+        """
+        loadables = ['uboot']
+        req_sections = {
+            "uboot": {
+                "Type": "Standalone Program",
+                "Load Address": bb_vars['UBOOT_FIT_UBOOT_LOADADDRESS'],
+                "Entry Point": bb_vars['UBOOT_FIT_UBOOT_ENTRYPOINT'],
+            },
+            "fdt": {
+                "Type": "Flat Device Tree",
+            }
+        }
+        if bb_vars['UBOOT_FIT_TEE'] == "1":
+            loadables.insert(0, "tee")
+            req_sections['tee'] = {
+                "Type": "Trusted Execution Environment Image",
+                # "Load Address": bb_vars['UBOOT_FIT_TEE_LOADADDRESS'], not printed by mkimage?
+                # "Entry Point": bb_vars['UBOOT_FIT_TEE_ENTRYPOINT'], not printed by mkimage?
+            }
+        if bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE'] == "1":
+            loadables.insert(0, "atf")
+            req_sections['atf'] = {
+                "Type": "Firmware",
+                "Load Address": bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS'],
+                # "Entry Point": bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT'], not printed by mkimage?
+            }
+        req_sections["conf"] = {
+            "Kernel": "unavailable",
+            "FDT": "fdt",
+            "Loadables": ','.join(loadables),
+        }
 
-        self.assertEqual(node, exp_node_lines, "kernel node does not match expectation")
+        # Add signing related properties if needed
+        uboot_fit_hash_alg = bb_vars['UBOOT_FIT_HASH_ALG']
+        uboot_fit_sign_alg = bb_vars['UBOOT_FIT_SIGN_ALG']
+        spl_sign_enable = bb_vars['SPL_SIGN_ENABLE']
+        spl_sign_keyname = bb_vars['SPL_SIGN_KEYNAME']
+        num_signatures = 0
+        if spl_sign_enable == "1":
+            for section in req_sections:
+                if not section.startswith('conf'):
+                    req_sections[section]['Sign algo'] = "%s,%s:%s" % \
+                        (uboot_fit_hash_alg, uboot_fit_sign_alg, spl_sign_keyname)
+                    num_signatures += 1
+        return (req_sections, num_signatures)
 
-        rx_configs = re.compile("^conf-.*")
-        its_configs = list(filter(rx_configs.match, its_lines))
+    def  _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):
+        if bb_vars['UBOOT_FITIMAGE_ENABLE'] == '1' and bb_vars['SPL_SIGN_ENABLE'] == "1":
+            self.logger.debug("Verifying signatures in the FIT image")
+        else:
+            self.logger.debug("FIT image is not signed. Signature verification is not needed.")
+            return
 
-        for cfg_str in its_configs:
-            cfg_start_idx = its_lines.index(cfg_str)
-            line_idx = cfg_start_idx + 2
-            node_end = False
-            while node_end == False:
-                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};" :
-                    node_end = True
-                line_idx = line_idx + 1
+        uboot_fit_hash_alg = bb_vars['UBOOT_FIT_HASH_ALG']
+        uboot_fit_sign_alg = bb_vars['UBOOT_FIT_SIGN_ALG']
+        spl_sign_keyname = bb_vars['SPL_SIGN_KEYNAME']
+        fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[uboot_fit_sign_alg]
+        for section, values in sections.items():
+            # Configuration nodes are always signed with UBOOT_SIGN_KEYNAME (if UBOOT_SIGN_ENABLE = "1")
+            if section.startswith("conf"):
+                # uboot-sign does not sign configuration nodes
+                pass
+            else:
+                # uboot-sign does not add hash nodes, only image signatures
+                sign_algo = values.get('Sign algo', None)
+                req_sign_algo = "%s,%s:%s" % (uboot_fit_hash_alg, uboot_fit_sign_alg, spl_sign_keyname)
+                self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
+                sign_value = values.get('Sign value', None)
+                self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
 
-            node = its_lines[cfg_start_idx:line_idx]
-            print("checking configuration " + cfg_str.rstrip(" {"))
-            rx_desc_line = re.compile(r'^description = ".*Linux kernel.*')
-            self.assertEqual(len(list(filter(rx_desc_line.match, node))), 1, "kernel keyword not found in the description line")
-
-            self.assertIn('kernel = "kernel-1";', node)
-
-            rx_sign_line = re.compile(r'^sign-images = .*kernel.*')
-            self.assertEqual(len(list(filter(rx_sign_line.match, node))), 1, "kernel hash not signed")
-
-        # Verify the signature
-        uboot_tools_bindir = self._setup_uboot_tools_native()
-        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], 'am335x-bone.dtb'))
-
-        # Check if the u-boot boot.scr script is in the fitImage
-        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
-        self._verify_fitimage_uboot_env(dumpimage_result)
+        # Search for the string passed to mkimage in each signed section of the FIT image.
+        # Looks like mkimage supports to add a comment but does not support to read it back.
+        a_comment = FitImageTestCase._get_uboot_mkimage_sign_args(bb_vars['SPL_MKIMAGE_SIGN_ARGS'])
+        self.logger.debug("a_comment: %s" % a_comment)
+        if a_comment:
+            found_comments = FitImageTestCase._find_string_in_bin_file(fitimage_path, a_comment)
+            self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
+                             (num_signatures, a_comment))
 
     def test_uboot_fit_image(self):
         """
@@ -472,47 +965,9 @@ UBOOT_ENTRYPOINT = "0x80080000"
 UBOOT_FIT_DESC = "A model description"
 """
         self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
 
-        # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
-
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        # Check that the type, load address, entrypoint address and default
-        # values for kernel and ramdisk in Image Tree Source are as expected.
-        # The order of fields in the below array is important. Not all the
-        # fields are tested, only the key fields that wont vary between
-        # different architectures.
-        its_field_check = [
-            'description = "A model description";',
-            'type = "standalone";',
-            'load = <0x80080000>;',
-            'entry = <0x80080000>;',
-            'default = "conf";',
-            'loadables = "uboot";',
-            'fdt = "fdt";'
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
 
     def test_sign_standalone_uboot_fit_image(self):
         """
@@ -533,9 +988,8 @@ UBOOT_FIT_DESC = "A model description"
                      work by Paul Eggleton <paul.eggleton@microsoft.com> and
                      Usama Arif <usama.arif@arm.com>
         """
-        a_comment = "a smart U-Boot comment"
         config = """
-# There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
+# There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
 MACHINE = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
@@ -551,104 +1005,15 @@ UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
 UBOOT_ARCH = "arm"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
-SPL_MKIMAGE_SIGN_ARGS = "-c '%s'"
+SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
 UBOOT_EXTLINUX = "0"
 UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
-""" % a_comment
-
+"""
         self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
 
-        # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
-
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        req_itspaths = [
-            ['/', 'images', 'uboot'],
-            ['/', 'images', 'uboot', 'signature'],
-            ['/', 'images', 'fdt'],
-            ['/', 'images', 'fdt', 'signature'],
-        ]
-
-        itspath = []
-        itspaths = []
-        linect = 0
-        sigs = {}
-        with open(fitimage_its_path) as its_file:
-            linect += 1
-            for line in its_file:
-                line = line.strip()
-                if line.endswith('};'):
-                    itspath.pop()
-                elif line.endswith('{'):
-                    itspath.append(line[:-1].strip())
-                    itspaths.append(itspath[:])
-                elif itspath and itspath[-1] == 'signature':
-                    itsdotpath = '.'.join(itspath)
-                    if not itsdotpath in sigs:
-                        sigs[itsdotpath] = {}
-                    if not '=' in line or not line.endswith(';'):
-                        self.fail('Unexpected formatting in %s sigs section line %d:%s' % (fitimage_its_path, linect, line))
-                    key, value = line.split('=', 1)
-                    sigs[itsdotpath][key.rstrip()] = value.lstrip().rstrip(';')
-
-        for reqpath in req_itspaths:
-            if not reqpath in itspaths:
-                self.fail('Missing section in its file: %s' % reqpath)
-
-        reqsigvalues_image = {
-            'algo': '"sha256,rsa2048"',
-            'key-name-hint': '"spl-oe-selftest"',
-        }
-
-        for itspath, values in sigs.items():
-            reqsigvalues = reqsigvalues_image
-            for reqkey, reqvalue in reqsigvalues.items():
-                value = values.get(reqkey, None)
-                if value is None:
-                    self.fail('Missing key "%s" in its file signature section %s' % (reqkey, itspath))
-                self.assertEqual(value, reqvalue)
-
-        # Dump the image to see if it really got signed
-        uboot_tools_bindir = self._setup_uboot_tools_native()
-        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
-        in_signed = None
-        signed_sections = {}
-        for line in dumpimage_result.output.splitlines():
-            if line.startswith((' Image')):
-                in_signed = re.search(r'\((.*)\)', line).groups()[0]
-            elif re.match(' \w', line):
-                in_signed = None
-            elif in_signed:
-                if not in_signed in signed_sections:
-                    signed_sections[in_signed] = {}
-                key, value = line.split(':', 1)
-                signed_sections[in_signed][key.strip()] = value.strip()
-        self.assertIn('uboot', signed_sections)
-        self.assertIn('fdt', signed_sections)
-        for signed_section, values in signed_sections.items():
-            value = values.get('Sign algo', None)
-            self.assertEqual(value, 'sha256,rsa2048:spl-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
-            value = values.get('Sign value', None)
-            self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
-
-        # Check for SPL_MKIMAGE_SIGN_ARGS
-        # Looks like mkimage supports to add a comment but does not support to read it back.
-        found_comments = FitImageTests._find_string_in_bin_file(fitimage_path, a_comment)
-        self.assertEqual(found_comments, 2, "Expected 2 signed and commented section in the fitImage.")
-
-        # Verify the signature
-        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
-                                         os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
 
     def test_sign_cascaded_uboot_fit_image(self):
         """
@@ -670,7 +1035,6 @@ UBOOT_FIT_HASH_ALG = "sha256"
                      work by Paul Eggleton <paul.eggleton@microsoft.com> and
                      Usama Arif <usama.arif@arm.com>
         """
-        a_comment = "a smart cascaded U-Boot comment"
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
@@ -686,7 +1050,7 @@ UBOOT_DTB_BINARY = "u-boot.dtb"
 UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
-UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
+UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart cascaded U-Boot comment'"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
 UBOOT_ARCH = "arm"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
@@ -700,99 +1064,10 @@ UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
 UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
-""" % a_comment
+"""
         self.write_config(config)
-
-        # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
-
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        req_itspaths = [
-            ['/', 'images', 'uboot'],
-            ['/', 'images', 'uboot', 'signature'],
-            ['/', 'images', 'fdt'],
-            ['/', 'images', 'fdt', 'signature'],
-        ]
-
-        itspath = []
-        itspaths = []
-        linect = 0
-        sigs = {}
-        with open(fitimage_its_path) as its_file:
-            linect += 1
-            for line in its_file:
-                line = line.strip()
-                if line.endswith('};'):
-                    itspath.pop()
-                elif line.endswith('{'):
-                    itspath.append(line[:-1].strip())
-                    itspaths.append(itspath[:])
-                elif itspath and itspath[-1] == 'signature':
-                    itsdotpath = '.'.join(itspath)
-                    if not itsdotpath in sigs:
-                        sigs[itsdotpath] = {}
-                    if not '=' in line or not line.endswith(';'):
-                        self.fail('Unexpected formatting in %s sigs section line %d:%s' % (fitimage_its_path, linect, line))
-                    key, value = line.split('=', 1)
-                    sigs[itsdotpath][key.rstrip()] = value.lstrip().rstrip(';')
-
-        for reqpath in req_itspaths:
-            if not reqpath in itspaths:
-                self.fail('Missing section in its file: %s' % reqpath)
-
-        reqsigvalues_image = {
-            'algo': '"sha256,rsa2048"',
-            'key-name-hint': '"spl-cascaded-oe-selftest"',
-        }
-
-        for itspath, values in sigs.items():
-            reqsigvalues = reqsigvalues_image
-            for reqkey, reqvalue in reqsigvalues.items():
-                value = values.get(reqkey, None)
-                if value is None:
-                    self.fail('Missing key "%s" in its file signature section %s' % (reqkey, itspath))
-                self.assertEqual(value, reqvalue)
-
-        # Dump the image to see if it really got signed
-        uboot_tools_bindir = self._setup_uboot_tools_native()
-        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
-        in_signed = None
-        signed_sections = {}
-        for line in dumpimage_result.output.splitlines():
-            if line.startswith((' Image')):
-                in_signed = re.search(r'\((.*)\)', line).groups()[0]
-            elif re.match(' \w', line):
-                in_signed = None
-            elif in_signed:
-                if not in_signed in signed_sections:
-                    signed_sections[in_signed] = {}
-                key, value = line.split(':', 1)
-                signed_sections[in_signed][key.strip()] = value.strip()
-        self.assertIn('uboot', signed_sections)
-        self.assertIn('fdt', signed_sections)
-        for signed_section, values in signed_sections.items():
-            value = values.get('Sign algo', None)
-            self.assertEqual(value, 'sha256,rsa2048:spl-cascaded-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
-            value = values.get('Sign value', None)
-            self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
-
-        # Check for SPL_MKIMAGE_SIGN_ARGS
-        # Looks like mkimage supports to add a comment but does not support to read it back.
-        found_comments = FitImageTests._find_string_in_bin_file(fitimage_path, a_comment)
-        self.assertEqual(found_comments, 2, "Expected 2 signed and commented section in the fitImage.")
-
-        # Verify the signature
-        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
-                                         os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
 
     def test_uboot_atf_tee_fit_image(self):
         """
@@ -841,67 +1116,20 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
 """
         self.write_config(config)
 
+        bb_vars = self._fit_get_bb_vars([
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE',
+            'UBOOT_FIT_TEE_IMAGE',
+        ])
+
         # Create an ATF dummy image
-        atf_dummy_image = os.path.join(self.builddir, "atf-dummy.bin")
-        cmd = 'dd if=/dev/random of=%s bs=1k count=64' % (atf_dummy_image)
-        result = runCmd(cmd)
-        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
+        dummy_atf = os.path.join(self.builddir, bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'])
+        FitImageTestCase._gen_random_file(dummy_atf)
 
         # Create a TEE dummy image
-        tee_dummy_image = os.path.join(self.builddir, "tee-dummy.bin")
-        cmd = 'dd if=/dev/random of=%s bs=1k count=64' % (tee_dummy_image)
-        result = runCmd(cmd)
-        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
-
-        # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
-
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        # Check that the type, load address, entrypoint address and default
-        # values for u-boot, ATF and TEE in Image Tree Source are as expected.
-        # The order of fields in the below array is important. Not all the
-        # fields are tested, only the key fields that wont vary between
-        # different architectures.
-        its_field_check = [
-            'description = "A model description";',
-            'type = "standalone";',
-            'load = <0x80080000>;',
-            'entry = <0x80080000>;',
-            'description = "Trusted Execution Environment";',
-            'os = "tee";',
-            'load = <0x80180000>;',
-            'entry = <0x80180000>;',
-            'description = "ARM Trusted Firmware";',
-            'os = "arm-trusted-firmware";',
-            'load = <0x80280000>;',
-            'entry = <0x80280000>;',
-            'default = "conf";',
-            'loadables = "atf", "tee", "uboot";',
-            'fdt = "fdt";'
-        ]
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
+        dummy_tee = os.path.join(self.builddir, bb_vars['UBOOT_FIT_TEE_IMAGE'])
+        FitImageTestCase._gen_random_file(dummy_tee)
 
+        self._test_fitimage(bb_vars)
 
     def test_sign_standalone_uboot_atf_tee_fit_image(self):
         """
@@ -921,7 +1149,6 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
                 Product:     oe-core
                 Author:      Jamin Lin <jamin_lin@aspeedtech.com>
         """
-        a_comment = "a smart U-Boot ATF TEE comment"
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
@@ -938,7 +1165,7 @@ UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_ARCH = "arm"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
-SPL_MKIMAGE_SIGN_ARGS = "-c '%s'"
+SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot ATF TEE comment'"
 UBOOT_EXTLINUX = "0"
 UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
@@ -958,115 +1185,20 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE = "1"
 UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE = "${TOPDIR}/atf-dummy.bin"
 UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS = "0x80280000"
 UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
-""" % a_comment
-
+"""
         self.write_config(config)
 
+        bb_vars = self._fit_get_bb_vars([
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE',
+            'UBOOT_FIT_TEE_IMAGE',
+        ])
+
         # Create an ATF dummy image
-        atf_dummy_image = os.path.join(self.builddir, "atf-dummy.bin")
-        cmd = 'dd if=/dev/random of=%s bs=1k count=64' % (atf_dummy_image)
-        result = runCmd(cmd)
-        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
+        dummy_atf = os.path.join(self.builddir, bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'])
+        FitImageTestCase._gen_random_file(dummy_atf)
 
         # Create a TEE dummy image
-        tee_dummy_image = os.path.join(self.builddir, "tee-dummy.bin")
-        cmd = 'dd if=/dev/random of=%s bs=1k count=64' % (tee_dummy_image)
-        result = runCmd(cmd)
-        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
+        dummy_tee = os.path.join(self.builddir, bb_vars['UBOOT_FIT_TEE_IMAGE'])
+        FitImageTestCase._gen_random_file(dummy_tee)
 
-        # The U-Boot fitImage is created as part of the U-Boot recipe
-        bitbake("virtual/bootloader")
-
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-            "u-boot-its-%s" % (machine,))
-        fitimage_path = os.path.join(deploy_dir_image,
-            "u-boot-fitImage-%s" % (machine,))
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        req_itspaths = [
-            ['/', 'images', 'uboot'],
-            ['/', 'images', 'uboot', 'signature'],
-            ['/', 'images', 'fdt'],
-            ['/', 'images', 'fdt', 'signature'],
-            ['/', 'images', 'tee'],
-            ['/', 'images', 'tee', 'signature'],
-            ['/', 'images', 'atf'],
-            ['/', 'images', 'atf', 'signature'],
-        ]
-
-        itspath = []
-        itspaths = []
-        linect = 0
-        sigs = {}
-        with open(fitimage_its_path) as its_file:
-            linect += 1
-            for line in its_file:
-                line = line.strip()
-                if line.endswith('};'):
-                    itspath.pop()
-                elif line.endswith('{'):
-                    itspath.append(line[:-1].strip())
-                    itspaths.append(itspath[:])
-                elif itspath and itspath[-1] == 'signature':
-                    itsdotpath = '.'.join(itspath)
-                    if not itsdotpath in sigs:
-                        sigs[itsdotpath] = {}
-                    if not '=' in line or not line.endswith(';'):
-                        self.fail('Unexpected formatting in %s sigs section line %d:%s' % (fitimage_its_path, linect, line))
-                    key, value = line.split('=', 1)
-                    sigs[itsdotpath][key.rstrip()] = value.lstrip().rstrip(';')
-
-        for reqpath in req_itspaths:
-            if not reqpath in itspaths:
-                self.fail('Missing section in its file: %s' % reqpath)
-
-        reqsigvalues_image = {
-            'algo': '"sha256,rsa2048"',
-            'key-name-hint': '"spl-oe-selftest"',
-        }
-
-        for itspath, values in sigs.items():
-            reqsigvalues = reqsigvalues_image
-            for reqkey, reqvalue in reqsigvalues.items():
-                value = values.get(reqkey, None)
-                if value is None:
-                    self.fail('Missing key "%s" in its file signature section %s' % (reqkey, itspath))
-                self.assertEqual(value, reqvalue)
-
-        # Dump the image to see if it really got signed
-        uboot_tools_bindir = self._setup_uboot_tools_native()
-        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
-        in_signed = None
-        signed_sections = {}
-        for line in dumpimage_result.output.splitlines():
-            if line.startswith((' Image')):
-                in_signed = re.search(r'\((.*)\)', line).groups()[0]
-            elif re.match(' \w', line):
-                in_signed = None
-            elif in_signed:
-                if not in_signed in signed_sections:
-                    signed_sections[in_signed] = {}
-                key, value = line.split(':', 1)
-                signed_sections[in_signed][key.strip()] = value.strip()
-        self.assertIn('uboot', signed_sections)
-        self.assertIn('fdt', signed_sections)
-        self.assertIn('tee', signed_sections)
-        self.assertIn('atf', signed_sections)
-        for signed_section, values in signed_sections.items():
-            value = values.get('Sign algo', None)
-            self.assertEqual(value, 'sha256,rsa2048:spl-oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
-            value = values.get('Sign value', None)
-            self.assertEqual(len(value), 512, 'Signature value for section %s not expected length' % signed_section)
-
-        # Check for SPL_MKIMAGE_SIGN_ARGS
-        # Looks like mkimage supports to add a comment but does not support to read it back.
-        found_comments = FitImageTests._find_string_in_bin_file(fitimage_path, a_comment)
-        self.assertEqual(found_comments, 4, "Expected 4 signed and commented section in the fitImage.")
-
-        # Verify the signature
-        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
-                                         os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
+        self._test_fitimage(bb_vars)
-- 
2.47.1


