Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9770CD8C8C
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 12:19:17 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14873.1780748353086568756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2026 05:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=dCf+FjPJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260606121913adc13d960500020723-g7_boh@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260606121913adc13d960500020723
        for <openembedded-core@lists.openembedded.org>;
        Sat, 06 Jun 2026 14:19:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gz3bnjHZMGCEXsk3vcrcd0U3mm9xWAcbbcpdhIwAhAE=;
 b=dCf+FjPJnsYp9NCdmDOouSIU70uHJ1lMElHwQGoKqviVYHOEdgkMHGK77GY1NBmUSt0UzV
 actpzAXQMyNkaSkEp5WCW1Xufzri6Sk+PoxIFvm0O1Z+ETpYtjI13Gc5EyEemcl8NS7Wx031
 4k5p4yry2GXcKY7Kic/BIQrMI0RdQ4GpkwmthDTNG2Tau0ksztuUouG5Zh1FQYYunWuJ9mH4
 ftv1/PYxHwRcezbiofbRF0iUm7tvDH1OkGGYDdbzNrZQOzuW2y0dx7dIKHz1MVa2dAUnuJLX
 OVD0IHOCCdsUcMjPPEBSbop61X9l1UE3gQmlPtI6K1qNrL1plABpsLew==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/3] oeqa/selftest/fitimage: use the provided DISTRO and MACHINE, skip if unsupported
Date: Sat,  6 Jun 2026 14:17:57 +0200
Message-ID: <20260606121836.2782754-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260606121836.2782754-1-adrian.freihofer@siemens.com>
References: <20260606121836.2782754-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 12:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238218

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The fitimage selftests hardcoded DISTRO and MACHINE in their local.conf
snippets. Both are wrong: poky is not part of OE-core, and forcing a
specific MACHINE conflicts with environments that already set the machine
via OE_FRAGMENTS (bitbake bb.fatal()s when it sees a non-weak MACHINE
assignment alongside a machine/ fragment). The tests also referenced
beaglebone-yocto, which lives in meta-yocto-bsp rather than OE-core, so
they could not pass in a plain OE-core setup at all.

Fix this by making the tests use whatever DISTRO and MACHINE the caller
has already configured, and skip gracefully when the active environment
does not support a particular test scenario. As a side effect this lets
the same test suite exercise genuinely different code paths on different
machines rather than always resetting to a single hardcoded target.

Implementation details:

* No test writes MACHINE = "..." to the config anymore. The active
  machine is read at runtime via get_bb_var("MACHINE"). If the machine
  is not listed in the new _MACHINE_SETTINGS dict the test calls
  self.skipTest(), keeping the suite green on unsupported machines.

* _MACHINE_SETTINGS maps each known machine to its required variables.
  Supported machines: qemuarm, qemuarm64, qemux86-64.
  Each entry may also carry "_cap_*" sub-dicts that override the base
  settings for tests requiring a specific board feature:
  - _cap_spl_dtb: board has CONFIG_SPL_OF_CONTROL=y (DTB-appended SPL);
    qemuarm64 uses evb-rk3399_defconfig for this.
  - _cap_atf_tee: board supports ATF + OP-TEE in the U-Boot FIT;
    qemuarm64 enables UBOOT_FIT_ARM_TRUSTED_FIRMWARE and UBOOT_FIT_TEE.

* Four helpers are added to FitImageTestCase:
  - _get_machine_settings(machine): returns the settings dict (KeyError
    on unknown machines).
  - _config_add_machine_settings(config, machine, keys=None): appends
    a requested subset of machine settings to a config string.
  - _get_machine_or_skip(): reads MACHINE, skips if not in
    _MACHINE_SETTINGS, and returns the machine name.
  - _require_machine_capability(config, machine, cap_name): appends a
    capability's settings or calls self.skipTest() if absent.

* _gen_random_file() is replaced by _gen_elf64_dummy(), which writes a
  minimal valid ARM64 ELF64 file. binman (used by evb-rk3399_defconfig)
  parses the BL31 blob as ELF and rejects files with invalid magic.

* The sign-images list in _get_req_sigvalues_config() is now
  conditional: "fdt" is only added when DTBs are present, "setup" only
  when KERNEL_SETUP_BIN is set. The previous hardcoded list produced an
  incorrect UBOOT_FIT_SIGN_IMAGES for qemux86-64 (no DTBs, has setup).

* _get_req_sections() adds a setup-1 entry (Type: "x86 setup.bin") when
  KERNEL_SETUP_BIN is set, matching the actual FIT section count on x86.

* _check_signing() falls back to UBOOT_DTB_IMAGE as the key-holding DTB
  when no per-configuration DTB exists (e.g. conf-1 on qemux86-64). If
  no key holder is available at all, uboot-fit_check_sign is skipped
  with a debug message while the remaining signature checks still run.

* The beaglebone-specific bbb-dtbs-as-ext recipe (meta-yocto-bsp) is
  replaced by a machine-agnostic test-dtbs-as-ext recipe with standalone
  DTS files and COMPATIBLE_MACHINE = ".*".

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/ext-dtb/bbb-dtbs-as-ext.bb   |  29 -
 .../ext-dtb/files/BBORG_RELAY-00A2.dts        |  49 --
 .../ext-dtb/files/am335x-bonegreen-ext.dts    |  14 -
 .../recipes-test/ext-dtb/files/test-ext.dts   |  17 +
 .../ext-dtb/files/test-overlay.dts            |  14 +
 .../recipes-test/ext-dtb/test-dtbs-as-ext.bb  |  25 +
 meta/lib/oeqa/selftest/cases/fitimage.py      | 536 +++++++++++++-----
 7 files changed, 459 insertions(+), 225 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
 delete mode 100644 meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/test-ext.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb

diff --git a/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb b/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
deleted file mode 100644
index 5055d03e54..0000000000
--- a/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Boeaglebone Devicetrees"
-DESCRIPTION = "Handle the dtc files of the beaglebone-yocto via devicetree.bbclass just for testing purpose"
-SECTION = "kernel"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-inherit devicetree
-
-COMPATIBLE_MACHINE  = "^(beaglebone-yocto)$"
-
-# Take a copy of a small devicetree from the kernel's source directory for handling it externally
-# Borrowed an example DTB overlay from
-# https://raw.githubusercontent.com/beagleboard/linux/refs/heads/5.10/arch/arm/boot/dts/overlays/BBORG_RELAY-00A2.dts
-SRC_URI = "\
-    file://am335x-bonegreen-ext.dts \
-    file://BBORG_RELAY-00A2.dts \
-"
-
-# The am335x-bonegreen-ext.dts needs also the ti directories
-DT_INCLUDE:append = " ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/ti/omap"
-
-# Sym-links are handled as extra configuration nodes in FIT images.
-do_install:append() {
-    ln -sf am335x-bonegreen-ext.dtb "${D}/boot/devicetree/am335x-bonegreen-ext-alias.dtb"
-}
-
-do_deploy:append() {
-    ln -sf am335x-bonegreen-ext.dtb "${DEPLOYDIR}/devicetree/am335x-bonegreen-ext-alias.dtb"
-}
diff --git a/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts b/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
deleted file mode 100644
index 9530fa50fe..0000000000
--- a/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
+++ /dev/null
@@ -1,49 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2015 Robert Nelson <robertcnelson@gmail.com>
- * Copyright (C) 2019 Amilcar Lucas <amilcar.lucas@iav.de>
- */
-
-/dts-v1/;
-/plugin/;
-
-&{/chosen} {
-	overlays {
-		BBORG_RELAY-00A2.kernel = __TIMESTAMP__;
-	};
-};
-
-&ocp {
-	P9_41_pinmux { pinctrl-0 = <&P9_41_gpio_pin>;};
-	P9_42_pinmux { pinctrl-0 = <&P9_42_gpio_pin>;};
-	P9_30_pinmux { pinctrl-0 = <&P9_30_gpio_pin>;};
-	P9_27_pinmux { pinctrl-0 = <&P9_27_gpio_pin>;};
-};
-
-// relay1
-&bone_led_P9_41 {
-	status = "okay";
-	label = "relay1";
-	default-state = "keep";
-};
-
-// relay2
-&bone_led_P9_42 {
-	status = "okay";
-	label = "relay2";
-	default-state = "keep";
-};
-
-// realy3
-&bone_led_P9_30 {
-	status = "okay";
-	label = "relay3";
-	default-state = "keep";
-};
-
-// realy4
-&bone_led_P9_27 {
-	status = "okay";
-	label = "relay4";
-	default-state = "keep";
-};
diff --git a/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts b/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
deleted file mode 100644
index a0b39337a9..0000000000
--- a/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
- */
-/dts-v1/;
-
-#include "am33xx.dtsi"
-#include "am335x-bone-common.dtsi"
-#include "am335x-bonegreen-common.dtsi"
-
-/ {
-	model = "TI AM335x BeagleBone Green External";
-	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
-};
diff --git a/meta-selftest/recipes-test/ext-dtb/files/test-ext.dts b/meta-selftest/recipes-test/ext-dtb/files/test-ext.dts
new file mode 100644
index 0000000000..53f2be0598
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/files/test-ext.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Minimal standalone device tree for OE selftest external DTB testing.
+ * No kernel source dependencies required.
+ */
+/dts-v1/;
+
+/ {
+	model = "OE Selftest External DTB";
+	compatible = "oe-selftest,test-ext";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+		selftest = "/";
+	};
+};
diff --git a/meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts b/meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts
new file mode 100644
index 0000000000..d9d364ad3f
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device tree overlay for OE selftest external DTB overlay testing.
+ * Intentionally self-contained with no kernel source dependencies.
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	oe-selftest-overlay {
+		compatible = "oe-selftest,test-overlay";
+		status = "okay";
+	};
+};
diff --git a/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb b/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb
new file mode 100644
index 0000000000..217ca36235
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Standalone Devicetrees for OE selftest"
+DESCRIPTION = "Standalone DTB and DTBO files used for external DTB FIT image testing. \
+Intentionally self-contained with no kernel source dependencies so any OE-core \
+build can run the FIT image selftests without a BSP layer."
+SECTION = "kernel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit devicetree
+
+COMPATIBLE_MACHINE = ".*"
+
+SRC_URI = "\
+    file://test-ext.dts \
+    file://test-overlay.dts \
+"
+
+# Sym-links are handled as extra configuration nodes in FIT images.
+do_install:append() {
+    ln -sf test-ext.dtb "${D}/boot/devicetree/test-ext-alias.dtb"
+}
+
+do_deploy:append() {
+    ln -sf test-ext.dtb "${DEPLOYDIR}/devicetree/test-ext-alias.dtb"
+}
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 34b248ee0b..5fe94e1455 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -63,6 +63,189 @@ class FitImageTestCase(OESelftestTestCase):
     MKIMAGE_HASH_LENGTHS = { 'sha256': 64, 'sha384': 96, 'sha512': 128 }
     MKIMAGE_SIGNATURE_LENGTHS = { 'rsa2048': 512 }
 
+    # Machine-specific bitbake variable settings for OE-core machines.
+    # Each entry maps a MACHINE name to the bitbake config lines that tests need
+    # in order to build a kernel FIT image and/or a U-Boot FIT image on that
+    # machine. Tests call _config_add_machine_settings() which reads the
+    # current MACHINE and appends the matching block.
+    #
+    # Keys used by the kernel / KernelFitImageBase tests:
+    #   KERNEL_DEVICETREE     – at least one DTB that the kernel ships
+    #   FIT_CONF_DEFAULT_DTB  – default FIT configuration DTB (basename only)
+    #
+    # Keys used by the UBoot / UBootFitImageTests tests:
+    #   UBOOT_MACHINE   – defconfig that produces an MLO/SPL + U-Boot
+    #   UBOOT_DTB_BINARY – the DTB file embedded in the U-Boot FIT image
+    #   UBOOT_ARCH      – architecture string used by mkimage
+    #
+    # Capability sub-dicts (keys starting with '_cap_') declare optional board
+    # features. Their presence signals the capability; their contents (if any)
+    # are extra bitbake variables that tests should emit via
+    # _config_add_machine_capability(). Tests that require a capability call
+    # _get_machine_capability() and skip when it returns None.
+    #
+    # Defined capabilities:
+    #   _cap_spl_dtb  – board produces spl/u-boot-spl.dtb (CONFIG_SPL_OF_CONTROL=y)
+    #   _cap_atf_tee  – board supports ATF + TEE in the U-Boot FIT image
+    #
+    # A capability sub-dict may override UBOOT_MACHINE (and SPL_BINARY etc.) so
+    # that one MACHINE can use different defconfigs depending on what the test
+    # needs. Because _config_add_machine_capability() emits after
+    # _config_add_machine_settings(), the capability's UBOOT_MACHINE wins.
+    # Example: a future _cap_spl_dtb for qemuarm64 could specify an arm64
+    # defconfig with CONFIG_SPL_OF_CONTROL=y.
+    #
+    # Some boards (e.g. all Allwinner/sunxi arm64) require a BL31 binary at
+    # compile time regardless of whether the U-Boot FIT image exposes an ATF
+    # node. Use the top-level '_bl31_image' key for this build-time dependency
+    # so that _bitbake_fit_image() can inject BL31 for any defconfig used on
+    # that machine, not just when _cap_atf_tee is requested. Since the real
+    # ATF and TEE recipes are not in oe-core, the test recipe generates dummy
+    # files and _bitbake_fit_image(). This would not allow to boot real hardware
+    # but is sufficient for testing the presence of the corresponding nodes in
+    # the its file and the FIT image.
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
+        # KERNEL_SETUP_BIN declares that the kernel build is expected to produce setup.bin.
+        "qemux86-64": {
+            "UBOOT_MACHINE": "qemu-x86_64_defconfig",
+            "UBOOT_ARCH": "x86",
+            "KERNEL_SETUP_BIN": "setup.bin",
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
+        Most callers should use _config_add_machine_capability() instead,
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
 
@@ -110,9 +293,67 @@ class FitImageTestCase(OESelftestTestCase):
             ))
 
     @staticmethod
-    def _gen_random_file(file_path, num_bytes=65536):
-        with open(file_path, 'wb') as file_out:
-            file_out.write(os.urandom(num_bytes))
+    def _gen_elf64_dummy(file_path, load_addr=0x80000000):
+        """Generate a minimal valid ELF64 (ARM64, little-endian) file.
+
+        Some boards (e.g. RK3399) let binman parse BL31 as an ELF to extract
+        load/entry addresses.  A plain random binary fails ELF magic checks, so
+        we need a structurally valid ELF even for a dummy/fake binary.
+        """
+        import struct
+        payload = b'\x00' * 4
+        phoff = 64                    # program header immediately after ELF header
+        payload_off = phoff + 56      # after one ELF64 program header entry
+        elf_ident = (
+            b'\x7fELF'   # magic
+            + b'\x02'    # ELFCLASS64
+            + b'\x01'    # ELFDATA2LSB
+            + b'\x01'    # EV_CURRENT
+            + b'\x00' * 9  # OS/ABI + padding
+        )
+        elf_header = struct.pack(
+            '<HHIQQQIHHHHHH',
+            2,            # e_type  = ET_EXEC
+            0xb7,         # e_machine = EM_AARCH64
+            1,            # e_version = EV_CURRENT
+            load_addr,    # e_entry
+            phoff,        # e_phoff
+            0,            # e_shoff
+            0,            # e_flags
+            64,           # e_ehsize
+            56,           # e_phentsize
+            1,            # e_phnum
+            64,           # e_shentsize
+            0,            # e_shnum
+            0,            # e_shstrndx
+        )
+        ph = struct.pack(
+            '<IIQQQQQQ',
+            1,            # p_type  = PT_LOAD
+            5,            # p_flags = PF_R | PF_X
+            payload_off,  # p_offset
+            load_addr,    # p_vaddr
+            load_addr,    # p_paddr
+            len(payload), # p_filesz
+            len(payload), # p_memsz
+            0x1000,       # p_align
+        )
+        with open(file_path, 'wb') as f:
+            f.write(elf_ident + elf_header + ph + payload)
+
+    def _gen_atf_tee_dummy_images(self, bb_vars):
+        """Generate dummy ATF and TEE images when the corresponding variables are defined
+
+        This is needed for testing the presence of the corresponding nodes in the its file and the FIT image.
+        For arm64 this is more or less a hard dependency because the BL31 binary is needed for the build to succeed.
+        """
+        if bb_vars.get('UBOOT_FIT_ARM_TRUSTED_FIRMWARE') == "1":
+            dummy_atf = os.path.join(self.builddir, bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'])
+            FitImageTestCase._gen_elf64_dummy(dummy_atf)
+
+        if bb_vars.get('UBOOT_FIT_TEE') == "1":
+            dummy_tee = os.path.join(self.builddir, bb_vars['UBOOT_FIT_TEE_IMAGE'])
+            FitImageTestCase._gen_elf64_dummy(dummy_tee)
 
     @staticmethod
     def _setup_native(native_recipe):
@@ -189,7 +430,7 @@ class FitImageTestCase(OESelftestTestCase):
 
         The list should be used to check the dtb and conf nodes in the FIT image or its file.
         In addition to the entries from KERNEL_DEVICETREE, the external devicetree and the
-        external devicetree overlay added by the test recipe bbb-dtbs-as-ext are handled as well.
+        external devicetree overlay added by the test recipe test-dtbs-as-ext are handled as well.
         """
         kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE')
         all_dtbs = []
@@ -198,9 +439,9 @@ class FitImageTestCase(OESelftestTestCase):
             all_dtbs += [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
         # Support only the test recipe which provides 1 devicetree and 1 devicetree overlay
         pref_prov_dtb = bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
-        if pref_prov_dtb == "bbb-dtbs-as-ext":
-            all_dtbs += ["BBORG_RELAY-00A2.dtbo", "am335x-bonegreen-ext.dtb"]
-            dtb_symlinks.append("am335x-bonegreen-ext-alias.dtb")
+        if pref_prov_dtb == "test-dtbs-as-ext":
+            all_dtbs += ["test-ext.dtb", "test-overlay.dtbo"]
+            dtb_symlinks.append("test-ext-alias.dtb")
         return (all_dtbs, dtb_symlinks)
 
     @staticmethod
@@ -441,6 +682,14 @@ class KernelFitImageBase(FitImageTestCase):
             'MACHINE',
             'PREFERRED_PROVIDER_virtual/dtb',
             'UBOOT_ARCH',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS',
+            'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT',
+            'UBOOT_FIT_TEE',
+            'UBOOT_FIT_TEE_IMAGE',
+            'UBOOT_FIT_TEE_LOADADDRESS',
+            'UBOOT_FIT_TEE_ENTRYPOINT',
             'UBOOT_ENTRYPOINT',
             'UBOOT_LOADADDRESS',
             'UBOOT_MKIMAGE_KERNEL_TYPE',
@@ -451,6 +700,7 @@ class KernelFitImageBase(FitImageTestCase):
             'UBOOT_SIGN_IMG_KEYNAME',
             'UBOOT_SIGN_KEYDIR',
             'UBOOT_SIGN_KEYNAME',
+            'UBOOT_DTB_IMAGE',
         }
         bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), self.kernel_recipe)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
@@ -513,9 +763,20 @@ class KernelFitImageBase(FitImageTestCase):
         if kernel_deploysubdir:
             fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, kernel_deploysubdir, fitimage_its_name))
             fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, kernel_deploysubdir, fitimage_name))
+            setup_bin_dir = os.path.join(deploy_dir_image, kernel_deploysubdir)
         else:
             fitimage_its_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_its_name))
             fitimage_path = os.path.realpath(os.path.join(deploy_dir_image, fitimage_name))
+            setup_bin_dir = deploy_dir_image
+        # KERNEL_SETUP_BIN is declared in _MACHINE_SETTINGS for machines that are
+        # expected to produce setup.bin (x86). Assert it was actually built so
+        # that a missing artifact causes a hard failure instead of a silent skip.
+        machine = bb_vars['MACHINE']
+        expected_setup_bin = FitImageTestCase._MACHINE_SETTINGS.get(machine, {}).get('KERNEL_SETUP_BIN', '')
+        if expected_setup_bin:
+            setup_bin_path = os.path.join(setup_bin_dir, expected_setup_bin)
+            self.assertExists(setup_bin_path, "Expected setup.bin artifact not found: %s" % setup_bin_path)
+        bb_vars['KERNEL_SETUP_BIN'] = expected_setup_bin
         return (fitimage_its_path, fitimage_path)
 
     def _get_req_its_paths(self, bb_vars):
@@ -547,7 +808,11 @@ class KernelFitImageBase(FitImageTestCase):
         else:
             not_images.append('bootscr-boot.cmd')
 
-        if bb_vars['MACHINE'] == "qemux86-64": # Not really the right if
+        # setup-1 is an x86-only section present when the kernel build emits
+        # setup.bin.  KERNEL_SETUP_BIN must be set in bb_vars — either
+        # explicitly in unit tests or injected by _bitbake_fit_image after
+        # the build has completed and the deploy dir is populated.
+        if bb_vars.get('KERNEL_SETUP_BIN'):
             images.append('setup-1')
         else:
             not_images.append('setup-1')
@@ -679,11 +944,16 @@ class KernelFitImageBase(FitImageTestCase):
         """Generate a dictionary of expected configuration signature nodes"""
         if bb_vars.get('UBOOT_SIGN_ENABLE') != "1":
             return {}
-        sign_images = '"kernel", "fdt"'
+        sign_images = '"kernel"'
+        dtb_files, _ = FitImageTestCase._get_dtb_files(bb_vars)
+        if dtb_files:
+            sign_images += ', "fdt"'
         if bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDLE'] != "1":
             sign_images += ', "ramdisk"'
         if bb_vars['FIT_UBOOT_ENV']:
             sign_images += ', "bootscr"'
+        if bb_vars.get('KERNEL_SETUP_BIN'):
+            sign_images += ', "setup"'
         req_sigvalues_config = {
             'algo': '"%s,%s"' % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG']),
             'key-name-hint': '"%s"' % bb_vars['UBOOT_SIGN_KEYNAME'],
@@ -731,6 +1001,9 @@ class KernelFitImageBase(FitImageTestCase):
         # Add a script section if there is a script
         if fit_uboot_env:
             req_sections['bootscr-' + fit_uboot_env] = { "Type": "Script" }
+        # Add the x86 setup section if present
+        if bb_vars.get('KERNEL_SETUP_BIN'):
+            req_sections['setup-1'] = { "Type": "x86 setup.bin" }
         # Add the initramfs
         if initramfs_image and initramfs_image_bundle != "1":
             req_sections['ramdisk-1'] = {
@@ -750,7 +1023,7 @@ class KernelFitImageBase(FitImageTestCase):
             for dtb in dtb_files + dtb_symlinks:
                 conf_name = bb_vars['FIT_CONF_PREFIX'] + dtb
                 # Assume that DTBs with an "-alias" in its name are symlink DTBs created e.g. by the
-                # bbb-dtbs-as-ext test recipe. Make the configuration node pointing to the real DTB.
+                # test-dtbs-as-ext test recipe. Make the configuration node pointing to the real DTB.
                 real_dtb = dtb.replace("-alias", "")
                 # dtb overlays do not refer to a kernel (yet?)
                 if dtb.endswith('.dtbo'):
@@ -806,6 +1079,15 @@ class KernelFitImageBase(FitImageTestCase):
         fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
         fit_hash_alg_len = FitImageTestCase.MKIMAGE_HASH_LENGTHS[fit_hash_alg]
         fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[fit_sign_alg]
+        dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
+        all_dtb_names = set(dtb_files + dtb_symlinks)
+        # The public key is always injected into UBOOT_DTB_IMAGE (-K flag in
+        # uboot-sign.bbclass concat_dtb).  For DTB-based configurations, the
+        # same key is also injected into each per-configuration DTB, so either
+        # file works.  For configurations without a matching DTB file (e.g.
+        # conf-1 on x86), UBOOT_DTB_IMAGE is the only option.
+        uboot_dtb_image = bb_vars.get('UBOOT_DTB_IMAGE')
+        uboot_dtb_path_default = os.path.join(deploy_dir_image, uboot_dtb_image) if uboot_dtb_image else None
         for section, values in sections.items():
             # Configuration nodes are always signed with UBOOT_SIGN_KEYNAME (if UBOOT_SIGN_ENABLE = "1")
             if section.startswith(bb_vars['FIT_CONF_PREFIX']):
@@ -815,13 +1097,30 @@ class KernelFitImageBase(FitImageTestCase):
                 sign_value = values.get('Sign value', None)
                 self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
                 dtb_file_name = section.replace(bb_vars['FIT_CONF_PREFIX'], '')
-                dtb_path = os.path.join(deploy_dir_image, dtb_file_name)
-                if kernel_deploysubdir:
-                    dtb_path = os.path.join(deploy_dir_image, kernel_deploysubdir, dtb_file_name)
-                # External devicetrees created by devicetree.bbclass are in a subfolder and have priority
-                dtb_path_ext = os.path.join(deploy_dir_image, "devicetree", dtb_file_name)
-                if os.path.exists(dtb_path_ext):
-                    dtb_path = dtb_path_ext
+                if dtb_file_name in all_dtb_names:
+                    # Use the per-configuration DTB (public key is also injected there)
+                    dtb_path = os.path.join(deploy_dir_image, dtb_file_name)
+                    if kernel_deploysubdir:
+                        dtb_path = os.path.join(deploy_dir_image, kernel_deploysubdir, dtb_file_name)
+                    # External devicetrees created by devicetree.bbclass are in a subfolder and have priority
+                    dtb_path_ext = os.path.join(deploy_dir_image, "devicetree", dtb_file_name)
+                    if os.path.exists(dtb_path_ext):
+                        dtb_path = dtb_path_ext
+                elif uboot_dtb_path_default:
+                    # No per-config DTB (e.g. conf-1 on x86): use the U-Boot DTB
+                    # which always gets the public key injected via -K in concat_dtb
+                    dtb_path = uboot_dtb_path_default
+                else:
+                    # No key-holding DTB is available (e.g. qemux86-64 has no
+                    # UBOOT_DTB_BINARY so concat_dtb never injects the public
+                    # key anywhere).  The signature algo/key-name/value checks
+                    # above already ran; the cryptographic fit_check_sign step
+                    # is not possible without a DTB containing the public key.
+                    self.logger.debug(
+                        "Skipping fit_check_sign for section %s: no UBOOT_DTB_IMAGE "
+                        "available to carry the public key on MACHINE=%s"
+                        % (section, bb_vars.get('MACHINE', '?')))
+                    continue
                 self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, dtb_path, section)
             else:
                 # Image nodes always need a hash which gets indirectly signed by the config signature
@@ -864,6 +1163,7 @@ class KernelFitImageRecipeTests(KernelFitImageBase):
         Product:     oe-core
         Author:      Usama Arif <usama.arif@arm.com>
         """
+        machine = self._get_machine_or_skip()
         config = """
 KERNEL_IMAGETYPE = "Image"
 
@@ -887,29 +1187,28 @@ FIT_LOADABLE_FILENAME[loadable2] = "linux.bin"
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
         """Test the oe.fitimage.get_compatible_from_dtb function
 
-        1. bitbake bbb-dtbs-as-ext
+        1. bitbake test-dtbs-as-ext
         2. Check if symlink_points_below returns the path to the DTB
         3. Check if the expected compatible string is found by get_compatible_from_dtb()
         """
-        DTB_RECIPE = "bbb-dtbs-as-ext"
-        DTB_FILE = "am335x-bonegreen-ext.dtb"
-        DTB_SYMLINK = "am335x-bonegreen-ext-alias.dtb"
-        DTBO_FILE = "BBORG_RELAY-00A2.dtbo"
-        EXPECTED_COMP = ["ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx"]
+        DTB_RECIPE = "test-dtbs-as-ext"
+        DTB_FILE = "test-ext.dtb"
+        DTB_SYMLINK = "test-ext-alias.dtb"
+        DTBO_FILE = "test-overlay.dtbo"
+        EXPECTED_COMP = ["oe-selftest,test-ext"]
 
-        config = """
-DISTRO = "poky"
-MACHINE:forcevariable = "beaglebone-yocto"
-"""
-        self.write_config(config)
+        machine = self._get_machine_or_skip()
+        self.write_config("")
 
         # Provide the fdtget command called by get_compatible_from_dtb
         dtc_bindir = FitImageTestCase._setup_native('dtc-native')
@@ -946,16 +1245,17 @@ MACHINE:forcevariable = "beaglebone-yocto"
                      2) The its file contains also the external devicetree overlay
                      3) Dumping the FIT image indicates the devicetree overlay
         """
+        machine = self._get_machine_or_skip()
         config = """
 # Enable creation of fitImage
-MACHINE:forcevariable = "beaglebone-yocto"
 # Add a devicetree overlay which does not need kernel sources
-PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
+PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext"
 """
         config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
 
@@ -972,16 +1272,16 @@ PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
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
@@ -996,6 +1296,7 @@ FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
         ])
 
         self._gen_signing_key(bb_vars)
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
     def test_sign_fit_image_individual(self):
@@ -1020,10 +1321,10 @@ FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
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
@@ -1032,6 +1333,7 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 FIT_SIGN_INDIVIDUAL = "1"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE"])
         config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
@@ -1040,13 +1342,14 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
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
@@ -1057,22 +1360,18 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
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
@@ -1080,6 +1379,7 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
 FIT_KERNEL_COMP_ALG = "none"
 FIT_HASH_ALG = "sha256"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "UBOOT_MACHINE", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
         config = self._config_add_kernel_classes(config)
         config = self._config_add_uboot_env(config)
         self.write_config(config)
@@ -1094,13 +1394,14 @@ FIT_HASH_ALG = "sha256"
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
@@ -1111,21 +1412,17 @@ FIT_HASH_ALG = "sha256"
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
@@ -1133,11 +1430,13 @@ KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
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
@@ -1189,7 +1488,10 @@ class FitImagePyTests(KernelFitImageBase):
             # others
             'MACHINE': "qemux86-64",
             'UBOOT_ARCH': "x86",
-            'HOST_PREFIX': "x86_64-poky-linux-"
+            'HOST_PREFIX': "x86_64-poky-linux-",
+            # x86 kernels produce a setup.bin section; set to the file name to
+            # enable it, or to "" / omit the key to suppress it.
+            'KERNEL_SETUP_BIN': 'setup1.bin',
         }
         if bb_vars_overrides:
             bb_vars.update(bb_vars_overrides)
@@ -1220,7 +1522,7 @@ class FitImagePyTests(KernelFitImageBase):
 
         for dtb_symlink in dtb_symlinks:
             # For test purposes, assume each symlink points to a DTB with the same basename minus "-alias"
-            # In this case, "am335x-bonegreen-ext-alias.dtb" -> "am335x-bonegreen-ext.dtb"
+            # In this case, "test-ext-alias.dtb" -> "test-ext.dtb"
             dtb_target = dtb_symlink.replace("-alias", "")
             root_node.fitimage_emit_section_dtb_alias(dtb_symlink, os.path.join("a-dir", dtb_target))
 
@@ -1228,8 +1530,8 @@ class FitImagePyTests(KernelFitImageBase):
             root_node.fitimage_emit_section_boot_script(
                 "bootscr-" + bb_vars['FIT_UBOOT_ENV'], bb_vars['FIT_UBOOT_ENV'])
 
-        if bb_vars['MACHINE'] == "qemux86-64": # Not really the right if
-            root_node.fitimage_emit_section_setup("setup-1", "setup1.bin")
+        if bb_vars.get('KERNEL_SETUP_BIN'):
+            root_node.fitimage_emit_section_setup("setup-1", bb_vars['KERNEL_SETUP_BIN'])
 
         if bb_vars.get('INITRAMFS_IMAGE') and bb_vars.get("INITRAMFS_IMAGE_BUNDLE") != "1":
             root_node.fitimage_emit_section_ramdisk("ramdisk-1", "a-dir/a-initramfs-1",
@@ -1271,8 +1573,8 @@ class FitImagePyTests(KernelFitImageBase):
     def test_fitimage_py_conf_mappings_with_alias(self):
         """Test FIT_CONF_MAPPINGS with external DTB aliases (symlinks)"""
         bb_vars_overrides = {
-            'PREFERRED_PROVIDER_virtual/dtb': "bbb-dtbs-as-ext",
-            'FIT_CONF_MAPPINGS': "dtb-conf:am335x-bonegreen-ext-alias.dtb:green-alias-renamed dtb-extra-conf:am335x-bonegreen-ext.dtb:green-extra",
+            'PREFERRED_PROVIDER_virtual/dtb': "test-dtbs-as-ext",
+            'FIT_CONF_MAPPINGS': "dtb-conf:test-ext-alias.dtb:ext-alias-renamed dtb-extra-conf:test-ext.dtb:ext-extra",
         }
         self._test_fitimage_py(bb_vars_overrides)
 
@@ -1329,10 +1631,12 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -1340,6 +1644,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_HASH_ALG',
             'UBOOT_FIT_SIGN_ALG',
             'UBOOT_FIT_TEE_ENTRYPOINT',
+            'UBOOT_FIT_TEE_IMAGE',
             'UBOOT_FIT_TEE_LOADADDRESS',
             'UBOOT_FIT_TEE',
             'UBOOT_FIT_UBOOT_ENTRYPOINT',
@@ -1358,10 +1663,28 @@ class UBootFitImageTests(FitImageTestCase):
 
     def _bitbake_fit_image(self, bb_vars):
         """Bitbake the bootloader and return the paths to the its file and the FIT image"""
+        machine = bb_vars['MACHINE']
+        # Some boards (e.g. pine64_plus/sunxi arm64) require a BL31 binary at
+        # compile time for binman regardless of which capability the test requested
+        # or whether the U-Boot FIT image exposes an ATF node.  The '_bl31_image'
+        # top-level key in _MACHINE_SETTINGS marks this build-time dependency.
+        bl31_path = FitImageTestCase._MACHINE_SETTINGS.get(machine, {}).get('_bl31_image', '')
+        if bl31_path:
+            bl31_resolved = bl31_path.replace('${TOPDIR}', bb_vars['TOPDIR'])
+            # Always (re)generate the ELF dummy so that a prior call to
+            # _gen_atf_tee_dummy_images (which writes random bytes to the
+            # same path) does not leave a non-ELF file here.  Binman on
+            # boards such as RK3399 parses BL31 as ELF to extract load/entry
+            # addresses, so a plain random binary fails with "Magic number
+            # does not match".  An ELF file also works for sunxi which treats
+            # BL31 as a raw binary concatenation.
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
@@ -1594,11 +1917,9 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -1608,6 +1929,7 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 UBOOT_FIT_DESC = "A model description"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY"])
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
@@ -1632,28 +1954,26 @@ UBOOT_FIT_DESC = "A model description"
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
@@ -1679,24 +1999,20 @@ UBOOT_FIT_HASH_ALG = "sha256"
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
@@ -1706,6 +2022,8 @@ UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._require_machine_capability(config, machine, '_cap_spl_dtb')
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
 
@@ -1728,11 +2046,9 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
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
@@ -1741,37 +2057,14 @@ UBOOT_FITIMAGE_ENABLE = "1"
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
 
-        # Create an ATF dummy image
-        dummy_atf = os.path.join(self.builddir, bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'])
-        FitImageTestCase._gen_random_file(dummy_atf)
-
-        # Create a TEE dummy image
-        dummy_tee = os.path.join(self.builddir, bb_vars['UBOOT_FIT_TEE_IMAGE'])
-        FitImageTestCase._gen_random_file(dummy_tee)
+        self._gen_atf_tee_dummy_images(bb_vars)
 
         self._test_fitimage(bb_vars)
 
@@ -1793,57 +2086,31 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
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
 
-        # Create an ATF dummy image
-        dummy_atf = os.path.join(self.builddir, bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'])
-        FitImageTestCase._gen_random_file(dummy_atf)
-
-        # Create a TEE dummy image
-        dummy_tee = os.path.join(self.builddir, bb_vars['UBOOT_FIT_TEE_IMAGE'])
-        FitImageTestCase._gen_random_file(dummy_tee)
+        self._gen_atf_tee_dummy_images(bb_vars)
 
         self._test_fitimage(bb_vars)
 
@@ -1858,9 +2125,9 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
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
@@ -1868,11 +2135,14 @@ UBOOT_SIGN_IMG_KEYNAME = "the-kernel-image-key"
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
@@ -1896,11 +2166,10 @@ FIT_SIGN_INDIVIDUAL = "1"
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
@@ -1909,6 +2178,7 @@ SPL_SIGN_KEYNAME = "spl-oe-selftest"
 SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_FIT_GENERATE_KEYS = "1"
 """
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE"])
         self.write_config(config)
         bb_vars = self._fit_get_bb_vars()
         self._test_fitimage(bb_vars)
-- 
2.54.0


