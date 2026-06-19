Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27544CD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 11:21:00 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40116.1781868056696515254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 04:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=qs1C7e1x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202606191120530dd8a8a56f00020771-dye8ag@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202606191120530dd8a8a56f00020771
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Jun 2026 13:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AlpzQuq9mj5ndbLnOq40IKrZWS6KQWnBFIr5B6FDutI=;
 b=qs1C7e1x+o4zk4SQCORM3DAwD0Ar+dJdDhfk7K19CFLZrtWjz6Zc7A0/5NYPGIYIlPsFir
 XGz0kRv48J0HSjN4/3lopW8n0mhy3JutNsMaETzSu1jroLWxIlJ/Hrb1mpA8Lvs/i1F9pfwr
 ShbYwG8njm2krFxshcdUZKPXsVWJRxo5LZ+0BeGb6SKdmX5MPeHQKc4OipYPdbXCZU0l7m0h
 C38b7FVzVsTNf4EF3fbG1n2irnzZHeqlLV/cZ6/SzHrj2a+WCaQSjPSfATw/S9JKZ6xGKKn3
 zV9kdD7/87EW0Lys9oSpWqhasSCCe5TScQoEBoTguBTVNmp/tiUxys3w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 5/6] oe-selftest: fitimage: add machine settings table and skip helpers
Date: Fri, 19 Jun 2026 13:17:13 +0200
Message-ID: <20260619112046.125876-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260619112046.125876-1-adrian.freihofer@siemens.com>
References: <20260619112046.125876-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239162

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a _MACHINE_SETTINGS class-level dict to FitImageTestCase that maps
each supported MACHINE name to the bitbake variables its tests need:
KERNEL_DEVICETREE, FIT_CONF_DEFAULT_DTB, UBOOT_MACHINE, UBOOT_DTB_BINARY,
UBOOT_ARCH, SPL_BINARY and optional capability sub-dicts (_cap_spl_dtb,
_cap_atf_tee, _bl31_image).

Supported machines: qemuarm, qemuarm64, qemux86-64.

Add five helpers that tests will call in subsequent commits:
- _get_machine_settings(machine): return the settings dict.
- _config_add_machine_settings(config, machine, keys=None): append
  a requested subset of settings to a config string.
- _get_machine_capability(machine, cap_name): return a capability
  sub-dict, or None if absent.
- _require_machine_capability(self, config, machine, cap_name): append
  a capability's variables or call self.skipTest() when absent.
- _get_machine_or_skip(self): read MACHINE at runtime and skip the test
  gracefully when the machine is not listed in _MACHINE_SETTINGS.

Add extra variables to both _fit_get_bb_vars implementations:
- KernelFitImageBase: add UBOOT_FIT_ARM_TRUSTED_FIRMWARE*, UBOOT_FIT_TEE*
  so that _gen_atf_tee_dummy_images() can resolve image paths for any
  machine that has ATF/TEE in its FIT image.
- UBootFitImageTests: add TOPDIR (needed to resolve ${TOPDIR} in
  _bl31_image paths), UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE, and
  UBOOT_FIT_TEE_IMAGE (needed by _gen_atf_tee_dummy_images).

Add BL31 injection logic to UBootFitImageTests._bitbake_fit_image():
when _MACHINE_SETTINGS declares a '_bl31_image' path for the active
machine, generate a minimal ELF64 dummy at that path and inject it via
EXTRA_OEMAKE:append before calling bitbake. This is needed for sunxi/
Allwinner arm64 boards where binman parses BL31 as ELF at build time.

No test code is changed in this commit; all new helpers are dead code
until the following commit wires them in.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 205 ++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 57bff2e4c6..38404464d6 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -63,6 +63,181 @@ class FitImageTestCase(OESelftestTestCase):
     MKIMAGE_HASH_LENGTHS = { 'sha256': 64, 'sha384': 96, 'sha512': 128 }
     MKIMAGE_SIGNATURE_LENGTHS = { 'rsa2048': 512 }
 
+    # Machine-specific bitbake variable settings for OE-core machines.
+    # Each entry maps a MACHINE name to the bitbake config lines that tests need
+    # in order to build a kernel FIT image and/or a U-Boot FIT image on that
+    # machine. Tests call _config_add_machine_settings() which reads the
+    # current MACHINE and appends the matching block.
+    #
+    # Keys used by the kernel / KernelFitImageBase tests:
+    #   KERNEL_DEVICETREE     - at least one DTB that the kernel ships
+    #   FIT_CONF_DEFAULT_DTB  - default FIT configuration DTB (basename only)
+    #
+    # Keys used by the UBoot / UBootFitImageTests tests:
+    #   UBOOT_MACHINE    - defconfig that produces an MLO/SPL + U-Boot
+    #   UBOOT_DTB_BINARY - the DTB file embedded in the U-Boot FIT image
+    #   UBOOT_ARCH       - architecture string used by mkimage
+    #
+    # Capability sub-dicts (keys starting with '_cap_') declare optional board
+    # features. Their presence signals the capability; their contents (if any)
+    # are extra bitbake variables that tests should emit via
+    # _require_machine_capability(). Tests that require a capability call
+    # _get_machine_capability() and skip when it returns None.
+    #
+    # Defined capabilities:
+    #   _cap_spl_dtb  - board produces spl/u-boot-spl.dtb (CONFIG_SPL_OF_CONTROL=y)
+    #   _cap_atf_tee  - board supports ATF + TEE in the U-Boot FIT image
+    #
+    # A capability sub-dict may override UBOOT_MACHINE (and SPL_BINARY etc.) so
+    # that one MACHINE can use different defconfigs depending on what the test
+    # needs. Because _require_machine_capability() emits after
+    # _config_add_machine_settings(), the capability's UBOOT_MACHINE wins.
+    #
+    # Some boards (e.g. all Allwinner/sunxi arm64) require a BL31 binary at
+    # compile time regardless of whether the U-Boot FIT image exposes an ATF
+    # node. Use the top-level '_bl31_image' key for this build-time dependency
+    # so that _bitbake_fit_image() can inject BL31 for any defconfig used on
+    # that machine, not just when _cap_atf_tee is requested.
+    _MACHINE_SETTINGS = {
+        "qemuarm": {
+            "KERNEL_DEVICETREE": "arm/versatile-pb.dtb arm/versatile-ab.dtb",
+            "FIT_CONF_DEFAULT_DTB": "versatile-pb.dtb",
+            "UBOOT_MACHINE": "am57xx_evm_defconfig",
+            "UBOOT_DTB_BINARY": "u-boot.dtb",
+            "UBOOT_ARCH": "arm",
+            "SPL_BINARY": "MLO",
+            # am57xx_evm produces spl/u-boot-spl.dtb (CONFIG_SPL_OF_CONTROL=y)
+            "_cap_spl_dtb": {},
+        },
+        "qemuarm64": {
+            "KERNEL_DEVICETREE": "arm/foundation-v8.dtb",
+            "FIT_CONF_DEFAULT_DTB": "foundation-v8.dtb",
+            "UBOOT_MACHINE": "pine64_plus_defconfig",
+            "UBOOT_DTB_BINARY": "u-boot.dtb",
+            "UBOOT_ARCH": "arm64",
+            "SPL_BINARY": "spl/sunxi-spl.bin",
+            # BL31 is required at build time by binman for ALL arm64 builds on this machine,
+            # regardless of which defconfig or capability is selected.
+            "_bl31_image": "${TOPDIR}/atf-dummy.bin",
+            # Capability: produces spl/u-boot-spl.dtb (CONFIG_SPL_OF_CONTROL=y).
+            # evb-rk3399_defconfig is arm64 + CONFIG_SPL_OF_CONTROL=y, so it produces
+            # spl/u-boot-spl.dtb which is needed for SPL FIT image signing tests.
+            # Overrides UBOOT_MACHINE and SPL_BINARY from the base settings.
+            "_cap_spl_dtb": {
+                "UBOOT_MACHINE": "evb-rk3399_defconfig",
+                "SPL_BINARY": "spl/u-boot-spl.bin",
+            },
+            # Capability: ATF + TEE nodes in the U-Boot FIT image
+            "_cap_atf_tee": {
+                "UBOOT_FIT_TEE": "1",
+                "UBOOT_FIT_TEE_IMAGE": "${TOPDIR}/tee-dummy.bin",
+                "UBOOT_FIT_TEE_LOADADDRESS": "0x80180000",
+                "UBOOT_FIT_TEE_ENTRYPOINT": "0x80180000",
+                "UBOOT_FIT_ARM_TRUSTED_FIRMWARE": "1",
+                "UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE": "${TOPDIR}/atf-dummy.bin",
+                "UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS": "0x80280000",
+                "UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT": "0x80280000",
+            },
+        },
+        # x86-64 uses setup.bin instead of DTBs; KERNEL_DEVICETREE is intentionally absent.
+        "qemux86-64": {
+            "UBOOT_MACHINE": "qemu-x86_64_defconfig",
+            "UBOOT_ARCH": "x86",
+        },
+    }
+
+    @staticmethod
+    def _get_machine_settings(machine):
+        """Return machine-specific bitbake settings for the given MACHINE.
+
+        Raises KeyError when the machine is not listed in _MACHINE_SETTINGS.
+        Callers that run bitbake should call _get_machine_or_skip() first so
+        the test is skipped rather than errored for unknown machines.
+        """
+        return FitImageTestCase._MACHINE_SETTINGS[machine]
+
+    @staticmethod
+    def _config_add_machine_settings(config, machine, keys=None):
+        """Append machine-specific variable assignments to a config string.
+
+        Args:
+            config: The bitbake config string to extend.
+            machine: The MACHINE value (from get_bb_var("MACHINE")).
+            keys: Optional list of keys to include (e.g. ["KERNEL_DEVICETREE",
+                  "FIT_CONF_DEFAULT_DTB"]).  When None all non-empty settings
+                  for the machine are appended.
+
+        Returns:
+            The extended config string.
+        """
+        settings = FitImageTestCase._get_machine_settings(machine)
+        for key, value in settings.items():
+            if key.startswith('_'):
+                continue
+            if keys is not None and key not in keys:
+                continue
+            if value:
+                config += '%s = "%s"\n' % (key, value)
+        return config
+
+    @staticmethod
+    def _get_machine_capability(machine, cap_name):
+        """Return the capability sub-dict for a machine, or None if absent.
+
+        Capability sub-dicts are entries whose keys start with '_cap_' in
+        _MACHINE_SETTINGS.  Their presence indicates a board feature; their
+        contents (if non-empty) are extra bitbake variables to emit.
+
+        Returns None when the machine does not declare the capability.
+        Most callers should use _require_machine_capability() instead,
+        which skips the test automatically when the capability is absent.
+        """
+        return FitImageTestCase._MACHINE_SETTINGS.get(machine, {}).get(cap_name)
+
+    def _require_machine_capability(self, config, machine, cap_name):
+        """Append capability-specific variable assignments to a config string.
+
+        If the machine does not have the named capability sub-dict, the test is
+        skipped automatically via self.skipTest().  Callers do not need a
+        separate _get_machine_capability() guard before calling this method.
+
+        Args:
+            config:   The bitbake config string to extend.
+            machine:  The MACHINE value (from get_bb_var("MACHINE")).
+            cap_name: Capability name, e.g. '_cap_atf_tee' or '_cap_spl_dtb'.
+
+        Returns:
+            The extended config string.
+        """
+        cap = FitImageTestCase._MACHINE_SETTINGS.get(machine, {}).get(cap_name)
+        if cap is None:
+            self.skipTest(
+                "MACHINE=%s does not provide capability %s" % (machine, cap_name)
+            )
+        for key, value in cap.items():
+            if value:
+                config += '%s = "%s"\n' % (key, value)
+        return config
+
+    def _get_machine_or_skip(self):
+        """Read the current MACHINE and skip this test if it is not supported.
+
+        Tests that need machine-specific settings (KERNEL_DEVICETREE, U-Boot
+        defconfig, etc.) call this at the start instead of hard-coding
+        MACHINE = "...".  The machine name is returned so it can be passed to
+        _config_add_machine_settings().
+
+        The test is skipped rather than failed when the machine is unknown so
+        that the suite remains green on machines that simply haven't been
+        enumerated in _MACHINE_SETTINGS yet.
+        """
+        machine = get_bb_var("MACHINE")
+        if machine not in FitImageTestCase._MACHINE_SETTINGS:
+            self.skipTest(
+                "MACHINE=%s is not listed in FitImageTestCase._MACHINE_SETTINGS; "
+                "add an entry to run these tests on that machine" % machine)
+        return machine
+
     def _gen_signing_key(self, bb_vars):
         """Generate a key pair and a singing certificate
 
@@ -510,6 +685,14 @@ class KernelFitImageBase(FitImageTestCase):
             'UBOOT_SIGN_KEYDIR',
             'UBOOT_SIGN_KEYNAME',
             'UBOOT_DTB_IMAGE',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT',
+            'UBOOT_FIT_TEE',
+            'UBOOT_FIT_TEE_IMAGE',
+            'UBOOT_FIT_TEE_LOADADDRESS',
+            'UBOOT_FIT_TEE_ENTRYPOINT',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), self.kernel_recipe)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
@@ -1439,10 +1622,12 @@ class UBootFitImageTests(FitImageTestCase):
             'SPL_MKIMAGE_SIGN_ARGS',
             'SPL_SIGN_ENABLE',
             'SPL_SIGN_KEYNAME',
+            'TOPDIR',
             'UBOOT_ARCH',
             'UBOOT_DTB_BINARY',
             'UBOOT_DTB_IMAGE',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
             'UBOOT_FIT_CONF_USER_LOADABLES',
@@ -1450,6 +1635,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_HASH_ALG',
             'UBOOT_FIT_SIGN_ALG',
             'UBOOT_FIT_TEE_ENTRYPOINT',
+            'UBOOT_FIT_TEE_IMAGE',
             'UBOOT_FIT_TEE_LOADADDRESS',
             'UBOOT_FIT_TEE',
             'UBOOT_FIT_UBOOT_ENTRYPOINT',
@@ -1468,10 +1654,27 @@ class UBootFitImageTests(FitImageTestCase):
 
     def _bitbake_fit_image(self, bb_vars):
         """Bitbake the bootloader and return the paths to the its file and the FIT image"""
+        machine = bb_vars['MACHINE']
+        # Some boards (e.g. pine64_plus/sunxi arm64) require a BL31 binary at
+        # compile time for binman regardless of which capability the test
+        # requested. The '_bl31_image' top-level key in _MACHINE_SETTINGS marks
+        # this build-time dependency.
+        bl31_path = FitImageTestCase._MACHINE_SETTINGS.get(machine, {}).get('_bl31_image', '')
+        if bl31_path:
+            bl31_resolved = bl31_path.replace('${TOPDIR}', bb_vars['TOPDIR'])
+            # Always (re)generate the ELF dummy so that a prior call to
+            # _gen_atf_tee_dummy_images (which may write the same path) does
+            # not leave a non-ELF file. Binman on boards such as RK3399
+            # parses BL31 as ELF to extract load/entry addresses, so a plain
+            # random binary fails with "Magic number does not match". An ELF
+            # file also works for sunxi which treats BL31 as a raw binary.
+            self.logger.debug("Creating fake BL31 ELF at %s" % bl31_resolved)
+            FitImageTestCase._gen_elf64_dummy(bl31_resolved)
+            self.append_config('EXTRA_OEMAKE:append:pn-u-boot = " BL31=%s"' % bl31_resolved)
+
         bitbake(UBootFitImageTests.BOOTLOADER_RECIPE)
 
         deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
-        machine = bb_vars['MACHINE']
         fitimage_its_path = os.path.join(deploy_dir_image, "u-boot-its-%s" % machine)
         fitimage_path = os.path.join(deploy_dir_image, "u-boot-fitImage-%s" % machine)
         return (fitimage_its_path, fitimage_path)
-- 
2.54.0


