Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D288ACD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 11:20:58 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40379.1781868056696156071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 04:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=rAhprfMP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260619112054454ed4e3e300020754-n2yinn@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260619112054454ed4e3e300020754
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Jun 2026 13:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=s1y97YsutcL2P7S6Z6h6pV/4RGMRlvBKVifIwSK6IiM=;
 b=rAhprfMPX6oLU6M1nsrPs9bXsdV+9BRInbtCIcCCs/P1AuZYaxHaY6xdgGBMCnhem2Q5Sv
 jnQotyeUxoEBE6c2FLBJachVFek7pKqdEw6XC6QWYw7t/JOA9R4O/fneaiktKQneco5D3Ci7
 //LIJyr0+W+uBhKcYRmYHBeObgj7gLSEiUllYxGCvKkkx7Fw1nT04O1Ypm0qzu5FM0+XV8Ne
 9hVi7n2htRwaNyuCRjK0zZCwr+GdlPpFz3wvzuqYBWX1xLXuK3IyVRmu7IQXCkqQZ5Bb+E42
 3i6OizgsHL6SHcOytUcjYTRhSHkomIk3OGLwL3dE9MQMYHARXY6cPTZg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 6/6] oe-selftest: fitimage: stop hardcoding MACHINE and DISTRO in tests
Date: Fri, 19 Jun 2026 13:17:14 +0200
Message-ID: <20260619112046.125876-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260619112046.125876-1-adrian.freihofer@siemens.com>
References: <20260619112046.125876-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239160

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Several fitimage selftests hardcoded DISTRO = "poky" and
MACHINE:forcevariable = "beaglebone-yocto".  That is wrong for two
reasons:
- poky is not part of OE-core
- a non-weak MACHINE assignment conflicts with environments that set the
  machine via OE_FRAGMENTS (bitbake fatal()s when both are present)

Replace both patterns with a machine-aware approach built on the
_MACHINE_SETTINGS table introduced by the previous commit:

- Tests that need machine-specific variables (KERNEL_DEVICETREE,
  UBOOT_MACHINE, UBOOT_DTB_BINARY, FIT_CONF_DEFAULT_DTB, …) now call
  _get_machine_or_skip() at the start. This reads the current MACHINE
  from the build environment. When the machine is not listed in
  _MACHINE_SETTINGS the test is skipped rather than failed, keeping the
  suite green on machines that have not been enumerated yet. Also not
  all architectures are used with fitimage, so skipping is the right
  behavior for machines that do not support it. Maybe we can add more
  machines later.

- The required variables are then injected into the bitbake config string
  via _config_add_machine_settings(), passing only the subset of keys
  each test actually needs.

- Tests that require an optional board capability (ATF/TEE, SPL with
  device-tree) call _require_machine_capability(), which also skips the
  test automatically when the machine does not advertise that capability.

- DISTRO = "poky" is removed; the tests run under whatever distro the
  caller has configured.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 211 ++++++++++-------------
 1 file changed, 91 insertions(+), 120 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 38404464d6..23d034517f 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -81,7 +81,7 @@ class FitImageTestCase(OESelftestTestCase):
     # Capability sub-dicts (keys starting with '_cap_') declare optional board
     # features. Their presence signals the capability; their contents (if any)
     # are extra bitbake variables that tests should emit via
-    # _require_machine_capability(). Tests that require a capability call
+    # _config_add_machine_capability(). Tests that require a capability call
     # _get_machine_capability() and skip when it returns None.
     #
     # Defined capabilities:
@@ -90,14 +90,20 @@ class FitImageTestCase(OESelftestTestCase):
     #
     # A capability sub-dict may override UBOOT_MACHINE (and SPL_BINARY etc.) so
     # that one MACHINE can use different defconfigs depending on what the test
-    # needs. Because _require_machine_capability() emits after
+    # needs. Because _config_add_machine_capability() emits after
     # _config_add_machine_settings(), the capability's UBOOT_MACHINE wins.
+    # Example: a future _cap_spl_dtb for qemuarm64 could specify an arm64
+    # defconfig with CONFIG_SPL_OF_CONTROL=y.
     #
     # Some boards (e.g. all Allwinner/sunxi arm64) require a BL31 binary at
     # compile time regardless of whether the U-Boot FIT image exposes an ATF
     # node. Use the top-level '_bl31_image' key for this build-time dependency
     # so that _bitbake_fit_image() can inject BL31 for any defconfig used on
-    # that machine, not just when _cap_atf_tee is requested.
+    # that machine, not just when _cap_atf_tee is requested. Since the real
+    # ATF and TEE recipes are not in oe-core, the test recipe generates dummy
+    # files and _bitbake_fit_image(). This would not allow to boot real hardware
+    # but is sufficient for testing the presence of the corresponding nodes in
+    # the its file and the FIT image.
     _MACHINE_SETTINGS = {
         "qemuarm": {
             "KERNEL_DEVICETREE": "arm/versatile-pb.dtb arm/versatile-ab.dtb",
@@ -140,9 +146,11 @@ class FitImageTestCase(OESelftestTestCase):
             },
         },
         # x86-64 uses setup.bin instead of DTBs; KERNEL_DEVICETREE is intentionally absent.
+        # KERNEL_SETUP_BIN declares that the kernel build is expected to produce setup.bin.
         "qemux86-64": {
             "UBOOT_MACHINE": "qemu-x86_64_defconfig",
             "UBOOT_ARCH": "x86",
+            "KERNEL_SETUP_BIN": "setup.bin",
         },
     }
 
@@ -189,7 +197,7 @@ class FitImageTestCase(OESelftestTestCase):
         contents (if non-empty) are extra bitbake variables to emit.
 
         Returns None when the machine does not declare the capability.
-        Most callers should use _require_machine_capability() instead,
+        Most callers should use _config_add_machine_capability() instead,
         which skips the test automatically when the capability is absent.
         """
         return FitImageTestCase._MACHINE_SETTINGS.get(machine, {}).get(cap_name)
@@ -760,16 +768,15 @@ class KernelFitImageBase(FitImageTestCase):
             fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_its_name))
             fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_name))
             setup_bin_dir = deploy_dir_image
-        # x86 kernel builds produce setup.bin which is packed into the FIT image.
-        # Detect this and inject KERNEL_SETUP_BIN into bb_vars so that the
-        # downstream helpers (_get_req_its_paths, _get_req_sections, etc.) can
-        # use it instead of checking MACHINE == "qemux86-64" directly.
-        if bb_vars['MACHINE'] == "qemux86-64":
-            setup_bin_path = os.path.join(setup_bin_dir, "setup.bin")
+        # KERNEL_SETUP_BIN is declared in _MACHINE_SETTINGS for machines that are
+        # expected to produce setup.bin (x86). Assert it was actually built so
+        # that a missing artifact causes a hard failure instead of a silent skip.
+        machine = bb_vars['MACHINE']
+        expected_setup_bin = FitImageTestCase._MACHINE_SETTINGS.get(machine, {}).get('KERNEL_SETUP_BIN', '')
+        if expected_setup_bin:
+            setup_bin_path = os.path.join(setup_bin_dir, expected_setup_bin)
             self.assertExists(setup_bin_path, "Expected setup.bin artifact not found: %s" % setup_bin_path)
-            bb_vars['KERNEL_SETUP_BIN'] = "setup.bin"
-        else:
-            bb_vars['KERNEL_SETUP_BIN'] = ""
+        bb_vars['KERNEL_SETUP_BIN'] = expected_setup_bin
         return (fitimage_its_path, fitimage_path)
 
     def _get_req_its_paths(self, bb_vars):
@@ -802,8 +809,9 @@ class KernelFitImageBase(FitImageTestCase):
             not_images.append('bootscr-boot.cmd')
 
         # setup-1 is an x86-only section present when the kernel build emits
-        # setup.bin. KERNEL_SETUP_BIN is either injected by _bitbake_fit_image
-        # after the build, or set explicitly in unit tests.
+        # setup.bin.  KERNEL_SETUP_BIN must be set in bb_vars — either
+        # explicitly in unit tests or injected by _bitbake_fit_image after
+        # the build has completed and the deploy dir is populated.
         if bb_vars.get('KERNEL_SETUP_BIN'):
             images.append('setup-1')
         else:
@@ -1074,10 +1082,10 @@ class KernelFitImageBase(FitImageTestCase):
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         all_dtb_names = set(dtb_files + dtb_symlinks)
         # The public key is always injected into UBOOT_DTB_IMAGE (-K flag in
-        # uboot-sign.bbclass concat_dtb). For DTB-based configurations the same
-        # key is also injected into each per-configuration DTB, so either file
-        # works. For configurations without a matching DTB (e.g. conf-1 on x86)
-        # UBOOT_DTB_IMAGE is the only option.
+        # uboot-sign.bbclass concat_dtb).  For DTB-based configurations, the
+        # same key is also injected into each per-configuration DTB, so either
+        # file works.  For configurations without a matching DTB file (e.g.
+        # conf-1 on x86), UBOOT_DTB_IMAGE is the only option.
         uboot_dtb_image = bb_vars.get('UBOOT_DTB_IMAGE')
         uboot_dtb_path_default = os.path.join(deploy_dir_image, uboot_dtb_image) if uboot_dtb_image else None
         for section, values in sections.items():
@@ -1103,10 +1111,11 @@ class KernelFitImageBase(FitImageTestCase):
                     # which always gets the public key injected via -K in concat_dtb
                     dtb_path = uboot_dtb_path_default
                 else:
-                    # No key-holding DTB available (e.g. qemux86-64 without
-                    # UBOOT_DTB_BINARY). The algo/key-name/value checks above
-                    # already ran; the cryptographic fit_check_sign step is not
-                    # possible without a DTB containing the public key.
+                    # No key-holding DTB is available (e.g. qemux86-64 has no
+                    # UBOOT_DTB_BINARY so concat_dtb never injects the public
+                    # key anywhere).  The signature algo/key-name/value checks
+                    # above already ran; the cryptographic fit_check_sign step
+                    # is not possible without a DTB containing the public key.
                     self.logger.debug(
                         "Skipping fit_check_sign for section %s: no UBOOT_DTB_IMAGE "
                         "available to carry the public key on MACHINE=%s"
@@ -1154,6 +1163,7 @@ class KernelFitImageRecipeTests(KernelFitImageBase):
         Product:     oe-core
         Author:      Usama Arif <usama.arif@arm.com>
         """
+        machine = self._get_machine_or_skip()
         config = """
 KERNEL_IMAGETYPE = "Image"
 
@@ -1177,9 +1187,11 @@ FIT_LOADABLE_FILENAME[loadable2] = "linux.bin"
 FIT_LOADABLE_LOADADDRESS[loadable2] = "0x87000000"
 FIT_LOADABLE_TYPE[loadable2] = "firmware"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "FIT_CONF_DEFAULT_DTB"])
         config = self._config_add_kernel_classes(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
     def test_get_compatible_from_dtb(self):
@@ -1195,11 +1207,8 @@ FIT_LOADABLE_TYPE[loadable2] = "firmware"
         DTBO_FILE = "test-overlay.dtbo"
         EXPECTED_COMP = ["oe-selftest,test-ext"]
 
-        config = """
-DISTRO = "poky"
-MACHINE:forcevariable = "beaglebone-yocto"
-"""
-        self.write_config(config)
+        machine = self._get_machine_or_skip()
+        self.write_config("")
 
         # Provide the fdtget command called by get_compatible_from_dtb
         dtc_bindir = FitImageTestCase._setup_native('dtc-native')
@@ -1236,9 +1245,9 @@ MACHINE:forcevariable = "beaglebone-yocto"
                      2) The its file contains also the external devicetree overlay
                      3) Dumping the FIT image indicates the devicetree overlay
         """
+        machine = self._get_machine_or_skip()
         config = """
 # Enable creation of fitImage
-MACHINE:forcevariable = "beaglebone-yocto"
 # Add a devicetree overlay which does not need kernel sources
 PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext"
 """
@@ -1246,6 +1255,7 @@ PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext"
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
 
@@ -1262,16 +1272,16 @@ PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext"
                      4) Verify the FIT image contains the comments passed via
                         UBOOT_MKIMAGE_SIGN_ARGS once per configuration node.
         """
+        machine = self._get_machine_or_skip()
         # Generate a configuration section which gets included into the local.conf file
         config = """
 # Enable creation of fitImage
-MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "dev"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
-FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "FIT_CONF_DEFAULT_DTB"])
         config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
@@ -1286,6 +1296,7 @@ FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
         ])
 
         self._gen_signing_key(bb_vars)
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
     def test_sign_fit_image_individual(self):
@@ -1310,10 +1321,10 @@ FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
         Author:      Paul Eggleton <paul.eggleton@microsoft.com> based upon
                      work by Usama Arif <usama.arif@arm.com>
         """
+        machine = self._get_machine_or_skip()
         # Generate a configuration section which gets included into the local.conf file
         config = """
 # Enable creation of fitImage
-MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
@@ -1322,6 +1333,7 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE"])
         config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
@@ -1330,13 +1342,14 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         # Ensure new keys are generated and FIT_GENERATE_KEYS = "1" is tested
         bitbake("kernel-signing-keys-native -c compile -f")
 
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
     def test_fit_image_sign_initramfs(self):
         """
         Summary:     Verifies the content of the initramfs node in the FIT Image Tree Source (its)
                      The FIT settings are set by the test case.
-                     The machine used is beaglebone-yocto.
+                     The machine used is qemuarm.
         Expected:    1. The ITS is generated with initramfs support
                      2. All the fields in the kernel node are as expected (matching the
                         conf settings)
@@ -1347,22 +1360,18 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         Author:      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
         """
 
+        machine = self._get_machine_or_skip()
         config = """
-DISTRO = "poky"
-MACHINE:forcevariable = "beaglebone-yocto"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
-UBOOT_MACHINE = "am335x_evm_defconfig"
 UBOOT_SIGN_ENABLE = "1"
-UBOOT_SIGN_KEYNAME = "beaglebonekey"
+UBOOT_SIGN_KEYNAME = "qemuarmkey"
 UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
-UBOOT_DTB_BINARY = "u-boot.dtb"
 UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_RD_LOADADDRESS = "0x88000000"
 UBOOT_RD_ENTRYPOINT = "0x88000000"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
-UBOOT_ARCH = "arm"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 UBOOT_MKIMAGE_KERNEL_TYPE = "kernel"
 UBOOT_EXTLINUX = "0"
@@ -1370,6 +1379,7 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "UBOOT_MACHINE", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
         config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
@@ -1384,13 +1394,14 @@ FIT_HASH_ALG = "sha256"
         ])
 
         self._gen_signing_key(bb_vars)
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
     def test_fit_image_sign_initramfs_bundle(self):
         """
         Summary:     Verifies the content of the initramfs bundle node in the FIT Image Tree Source (its)
                      The FIT settings are set by the test case.
-                     The machine used is beaglebone-yocto.
+                     The machine used is qemuarm.
         Expected:    1. The ITS is generated with initramfs bundle support
                      2. All the fields in the kernel node are as expected (matching the
                         conf settings)
@@ -1401,21 +1412,17 @@ FIT_HASH_ALG = "sha256"
         Author:      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
         """
 
+        machine = self._get_machine_or_skip()
         config = """
-DISTRO = "poky"
-MACHINE:forcevariable = "beaglebone-yocto"
 INITRAMFS_IMAGE_BUNDLE = "1"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
-UBOOT_MACHINE = "am335x_evm_defconfig"
 UBOOT_SIGN_ENABLE = "1"
-UBOOT_SIGN_KEYNAME = "beaglebonekey"
+UBOOT_SIGN_KEYNAME = "qemuarmkey"
 UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
-UBOOT_DTB_BINARY = "u-boot.dtb"
 UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
-UBOOT_ARCH = "arm"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 UBOOT_MKIMAGE_KERNEL_TYPE = "kernel"
 UBOOT_EXTLINUX = "0"
@@ -1423,11 +1430,13 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "UBOOT_MACHINE", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
         config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._gen_signing_key(bb_vars)
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
 class FitImagePyTests(KernelFitImageBase):
@@ -1565,7 +1574,7 @@ class FitImagePyTests(KernelFitImageBase):
         """Test FIT_CONF_MAPPINGS with external DTB aliases (symlinks)"""
         bb_vars_overrides = {
             'PREFERRED_PROVIDER_virtual/dtb': "test-dtbs-as-ext",
-            'FIT_CONF_MAPPINGS': "dtb-conf:test-ext-alias.dtb:test-alias-renamed dtb-extra-conf:test-ext.dtb:test-extra",
+            'FIT_CONF_MAPPINGS': "dtb-conf:test-ext-alias.dtb:ext-alias-renamed dtb-extra-conf:test-ext.dtb:ext-extra",
         }
         self._test_fitimage_py(bb_vars_overrides)
 
@@ -1656,18 +1665,19 @@ class UBootFitImageTests(FitImageTestCase):
         """Bitbake the bootloader and return the paths to the its file and the FIT image"""
         machine = bb_vars['MACHINE']
         # Some boards (e.g. pine64_plus/sunxi arm64) require a BL31 binary at
-        # compile time for binman regardless of which capability the test
-        # requested. The '_bl31_image' top-level key in _MACHINE_SETTINGS marks
-        # this build-time dependency.
+        # compile time for binman regardless of which capability the test requested
+        # or whether the U-Boot FIT image exposes an ATF node.  The '_bl31_image'
+        # top-level key in _MACHINE_SETTINGS marks this build-time dependency.
         bl31_path = FitImageTestCase._MACHINE_SETTINGS.get(machine, {}).get('_bl31_image', '')
         if bl31_path:
             bl31_resolved = bl31_path.replace('${TOPDIR}', bb_vars['TOPDIR'])
             # Always (re)generate the ELF dummy so that a prior call to
-            # _gen_atf_tee_dummy_images (which may write the same path) does
-            # not leave a non-ELF file. Binman on boards such as RK3399
-            # parses BL31 as ELF to extract load/entry addresses, so a plain
-            # random binary fails with "Magic number does not match". An ELF
-            # file also works for sunxi which treats BL31 as a raw binary.
+            # _gen_atf_tee_dummy_images (which writes random bytes to the
+            # same path) does not leave a non-ELF file here.  Binman on
+            # boards such as RK3399 parses BL31 as ELF to extract load/entry
+            # addresses, so a plain random binary fails with "Magic number
+            # does not match".  An ELF file also works for sunxi which treats
+            # BL31 as a raw binary concatenation.
             self.logger.debug("Creating fake BL31 ELF at %s" % bl31_resolved)
             FitImageTestCase._gen_elf64_dummy(bl31_resolved)
             self.append_config('EXTRA_OEMAKE:append:pn-u-boot = " BL31=%s"' % bl31_resolved)
@@ -1907,11 +1917,9 @@ class UBootFitImageTests(FitImageTestCase):
         Author:      Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
                      based on work by Usama Arif <usama.arif@arm.com>
         """
+        machine = self._get_machine_or_skip()
         config = """
 # We need at least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE:forcevariable = "qemuarm"
-UBOOT_MACHINE = "am57xx_evm_defconfig"
-SPL_BINARY = "MLO"
 
 # Enable creation of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE = "1"
@@ -1921,6 +1929,7 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 UBOOT_FIT_DESC = "A model description"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY"])
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
@@ -1945,28 +1954,26 @@ UBOOT_FIT_DESC = "A model description"
                      work by Paul Eggleton <paul.eggleton@microsoft.com> and
                      Usama Arif <usama.arif@arm.com>
         """
+        machine = self._get_machine_or_skip()
         config = """
 # There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE:forcevariable = "qemuarm"
-UBOOT_MACHINE = "am57xx_evm_defconfig"
-SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE = "1"
 SPL_SIGN_KEYNAME = "spl-oe-selftest"
 SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_DTB_BINARY = "u-boot.dtb"
 UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
-UBOOT_ARCH = "arm"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
 UBOOT_EXTLINUX = "0"
 UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._require_machine_capability(config, machine, '_cap_spl_dtb')
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
@@ -1992,24 +1999,20 @@ UBOOT_FIT_HASH_ALG = "sha256"
                      work by Paul Eggleton <paul.eggleton@microsoft.com> and
                      Usama Arif <usama.arif@arm.com>
         """
+        machine = self._get_machine_or_skip()
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE:forcevariable = "qemuarm"
-UBOOT_MACHINE = "am57xx_evm_defconfig"
-SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE = "1"
 SPL_SIGN_KEYNAME = "spl-cascaded-oe-selftest"
 SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_DTB_BINARY = "u-boot.dtb"
 UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart cascaded U-Boot comment'"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
-UBOOT_ARCH = "arm"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart cascaded U-Boot comment'"
 UBOOT_EXTLINUX = "0"
@@ -2019,6 +2022,8 @@ UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._require_machine_capability(config, machine, '_cap_spl_dtb')
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
 
@@ -2041,11 +2046,9 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
                 Product:     oe-core
                 Author:      Jamin Lin <jamin_lin@aspeedtech.com>
         """
+        machine = self._get_machine_or_skip()
         config = """
 # We need at least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE:forcevariable = "qemuarm"
-UBOOT_MACHINE = "am57xx_evm_defconfig"
-SPL_BINARY = "MLO"
 
 # Enable creation of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE = "1"
@@ -2054,31 +2057,15 @@ UBOOT_FITIMAGE_ENABLE = "1"
 UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 UBOOT_FIT_DESC = "A model description"
-
-# Enable creation of the TEE fitImage
-UBOOT_FIT_TEE = "1"
-
-# TEE fitImage properties
-UBOOT_FIT_TEE_IMAGE = "${TOPDIR}/tee-dummy.bin"
-UBOOT_FIT_TEE_LOADADDRESS = "0x80180000"
-UBOOT_FIT_TEE_ENTRYPOINT = "0x80180000"
-
-# Enable creation of the ATF fitImage
-UBOOT_FIT_ARM_TRUSTED_FIRMWARE = "1"
-
-# ATF fitImage properties
-UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE = "${TOPDIR}/atf-dummy.bin"
-UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS = "0x80280000"
-UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine)
+        config = self._require_machine_capability(config, machine, '_cap_atf_tee')
         self.write_config(config)
 
-        bb_vars = self._fit_get_bb_vars([
-            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE',
-            'UBOOT_FIT_TEE_IMAGE',
-        ])
+        bb_vars = self._fit_get_bb_vars()
 
         self._gen_atf_tee_dummy_images(bb_vars)
+
         self._test_fitimage(bb_vars)
 
     def test_sign_standalone_uboot_atf_tee_fit_image(self):
@@ -2099,51 +2086,32 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
                 Product:     oe-core
                 Author:      Jamin Lin <jamin_lin@aspeedtech.com>
         """
+        machine = self._get_machine_or_skip()
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE:forcevariable = "qemuarm"
-UBOOT_MACHINE = "am57xx_evm_defconfig"
-SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE = "1"
 SPL_SIGN_KEYNAME = "spl-oe-selftest"
 SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
-UBOOT_DTB_BINARY = "u-boot.dtb"
 UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
-UBOOT_ARCH = "arm"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot ATF TEE comment'"
 UBOOT_EXTLINUX = "0"
 UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
-
-# Enable creation of the TEE fitImage
-UBOOT_FIT_TEE = "1"
-
-# TEE fitImage properties
-UBOOT_FIT_TEE_IMAGE = "${TOPDIR}/tee-dummy.bin"
-UBOOT_FIT_TEE_LOADADDRESS = "0x80180000"
-UBOOT_FIT_TEE_ENTRYPOINT = "0x80180000"
-
-# Enable creation of the ATF fitImage
-UBOOT_FIT_ARM_TRUSTED_FIRMWARE = "1"
-
-# ATF fitImage properties
-UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE = "${TOPDIR}/atf-dummy.bin"
-UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS = "0x80280000"
-UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine)
+        config = self._require_machine_capability(config, machine, '_cap_spl_dtb')
+        config = self._require_machine_capability(config, machine, '_cap_atf_tee')
         self.write_config(config)
 
-        bb_vars = self._fit_get_bb_vars([
-            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE',
-            'UBOOT_FIT_TEE_IMAGE',
-        ])
+        bb_vars = self._fit_get_bb_vars()
 
         self._gen_atf_tee_dummy_images(bb_vars)
+
         self._test_fitimage(bb_vars)
 
 
@@ -2157,9 +2125,9 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
                      the individual image nodes, the other is required for the
                      verification of the configuration section.
         """
+        machine = self._get_machine_or_skip()
         config = """
 # Enable creation of fitImage
-MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "the-kernel-config-key"
@@ -2167,11 +2135,14 @@ UBOOT_SIGN_IMG_KEYNAME = "the-kernel-image-key"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 FIT_SIGN_INDIVIDUAL = "1"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._gen_signing_key(bb_vars)
 
-        bitbake(UBootFitImageTests.BOOTLOADER_RECIPE)
+        # Use _bitbake_fit_image so that any board-specific build requirements
+        # (e.g. BL31 for sunxi/pine64) are set up before invoking bitbake.
+        self._bitbake_fit_image(bb_vars)
 
         # Just check the DTB of u-boot since there is no u-boot FIT image
         self._check_kernel_dtb(bb_vars)
@@ -2195,11 +2166,10 @@ FIT_SIGN_INDIVIDUAL = "1"
         Product:     oe-core
         Author:      Jamin Lin <jamin_lin@aspeedtech.com>
         """
+        machine = self._get_machine_or_skip()
         config = """
 # There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE:forcevariable = "qemuarm"
-UBOOT_MACHINE = "am57xx_evm_defconfig"
 # Enable creation and signing of the U-Boot fitImage (no SPL)
 UBOOT_FITIMAGE_ENABLE = "1"
 SPL_DTB_BINARY = ""
@@ -2208,6 +2178,7 @@ SPL_SIGN_KEYNAME = "spl-oe-selftest"
 SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_FIT_GENERATE_KEYS = "1"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE"])
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
-- 
2.54.0


