Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 61/61] qemu: update 6.2.0 -> 7.0.0
Date: Thu,  5 May 2022 07:05:44 +0200
Message-Id: <20220505050544.651895-61-alex@linutronix.de>
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

Drop xfs/libxml2 options no longer offered upstream.

Dropped patches all found their way upstream, particularly
0001-qemu-Add-missing-wacom-HID-descriptor.patch as well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...u-native_6.2.0.bb => qemu-native_7.0.0.bb} |   0
 ...e_6.2.0.bb => qemu-system-native_7.0.0.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |  31 ++--
 ...issing-device-identification-objects.patch |  83 -----------
 ...ptrace.h-for-pt_regs-struct-definiti.patch |  92 ------------
 ...-environment-space-to-boot-loader-q.patch} |  17 ++-
 ...emu-Add-missing-wacom-HID-descriptor.patch | 141 ------------------
 ...s-minimum-kernel-version-for-riscv32.patch |  40 -----
 ...ch-the-virqueue-element-in-case-of-e.patch |  60 --------
 ...connect-socket-to-a-spawned-command.patch} |  59 ++++----
 ...-map-leaking-on-error-during-receive.patch |  43 ------
 ... 0003-apic-fixup-fallthrough-to-PIC.patch} |  17 ++-
 ...d-pkg-config-handling-for-libgcrypt.patch} |  11 +-
 ...u-Do-not-include-file-if-not-exists.patch} |  16 +-
 ...r-space-mmap-tweaks-to-address-musl.patch} |  23 ++-
 ...atch => 0007-qemu-Determinism-fixes.patch} |  24 ++-
 ...-use-relative-path-to-refer-to-file.patch} |  20 ++-
 ...nd-MAP_SHARED_VALIDATE-on-needed-li.patch} |   9 +-
 ...-against-buggy-or-malicious-guest-d.patch} |  32 ++--
 meta/recipes-devtools/qemu/qemu/cross.patch   |  15 +-
 meta/recipes-devtools/qemu/qemu/no-ps2.patch  | 123 ---------------
 .../qemu/{qemu_6.2.0.bb => qemu_7.0.0.bb}     |   0
 23 files changed, 163 insertions(+), 695 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_6.2.0.bb => qemu-native_7.0.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_6.2.0.bb => qemu-system-native_7.0.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-acpi-tpm-Add-missing-device-identification-objects.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch
 rename meta/recipes-devtools/qemu/qemu/{0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch => 0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch} (73%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch
 rename meta/recipes-devtools/qemu/qemu/{0006-chardev-connect-socket-to-a-spawned-command.patch => 0002-chardev-connect-socket-to-a-spawned-command.patch} (84%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-virtio-net-fix-map-leaking-on-error-during-receive.patch
 rename meta/recipes-devtools/qemu/qemu/{0007-apic-fixup-fallthrough-to-PIC.patch => 0003-apic-fixup-fallthrough-to-PIC.patch} (80%)
 rename meta/recipes-devtools/qemu/qemu/{0010-configure-Add-pkg-config-handling-for-libgcrypt.patch => 0004-configure-Add-pkg-config-handling-for-libgcrypt.patch} (81%)
 rename meta/recipes-devtools/qemu/qemu/{0001-qemu-Do-not-include-file-if-not-exists.patch => 0005-qemu-Do-not-include-file-if-not-exists.patch} (70%)
 rename meta/recipes-devtools/qemu/qemu/{mmap2.patch => 0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch} (68%)
 rename meta/recipes-devtools/qemu/qemu/{determinism.patch => 0007-qemu-Determinism-fixes.patch} (54%)
 rename meta/recipes-devtools/qemu/qemu/{0001-tests-meson.build-use-relative-path-to-refer-to-file.patch => 0008-tests-meson.build-use-relative-path-to-refer-to-file.patch} (69%)
 rename meta/recipes-devtools/qemu/qemu/{0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch => 0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch} (87%)
 rename meta/recipes-devtools/qemu/qemu/{pvrdma.patch => 0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch} (59%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/no-ps2.patch
 rename meta/recipes-devtools/qemu/{qemu_6.2.0.bb => qemu_7.0.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4064d84b32..e8ea7cc546 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.38%"
 GDBVERSION ?= "11.%"
 GLIBCVERSION ?= "2.35"
 LINUXLIBCVERSION ?= "5.16%"
-QEMUVERSION ?= "6.2%"
+QEMUVERSION ?= "7.0%"
 GOVERSION ?= "1.18%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
diff --git a/meta/recipes-devtools/qemu/qemu-native_6.2.0.bb b/meta/recipes-devtools/qemu/qemu-native_7.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_6.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_7.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0aaeaa1cb5..5f303992be 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -17,27 +17,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
-           file://0001-qemu-Add-missing-wacom-HID-descriptor.patch \
-           file://0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
-           file://0006-chardev-connect-socket-to-a-spawned-command.patch \
-           file://0007-apic-fixup-fallthrough-to-PIC.patch \
-           file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
-           file://0001-qemu-Do-not-include-file-if-not-exists.patch \
-           file://mmap2.patch \
-           file://determinism.patch \
-           file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
-           file://0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch \
-           file://0001-acpi-tpm-Add-missing-device-identification-objects.patch \
-           file://0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch \
-           file://0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
-           file://0001-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch \
-           file://0002-virtio-net-fix-map-leaking-on-error-during-receive.patch \
-           file://pvrdma.patch \
-           file://no-ps2.patch \
+           file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
+           file://0002-chardev-connect-socket-to-a-spawned-command.patch \
+           file://0003-apic-fixup-fallthrough-to-PIC.patch \
+           file://0004-configure-Add-pkg-config-handling-for-libgcrypt.patch \
+           file://0005-qemu-Do-not-include-file-if-not-exists.patch \
+           file://0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch \
+           file://0007-qemu-Determinism-fixes.patch \
+           file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
+           file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
+           file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "68e15d8e45ac56326e0b9a4afa8b49a3dfe8aba3488221d098c84698bca65b45"
+SRC_URI[sha256sum] = "f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
@@ -152,7 +145,6 @@ PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
-PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
 PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
 PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
 PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
@@ -185,7 +177,6 @@ PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs,glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
-PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 PACKAGECONFIG[attr] = "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] = "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] = "--enable-vhost-net,--disable-vhost-net,,"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-acpi-tpm-Add-missing-device-identification-objects.patch b/meta/recipes-devtools/qemu/qemu/0001-acpi-tpm-Add-missing-device-identification-objects.patch
deleted file mode 100644
index ff91674879..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-acpi-tpm-Add-missing-device-identification-objects.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 5903646d3913af6544680f6645fcb7296d0b3a1c Mon Sep 17 00:00:00 2001
-From: Stefan Berger <stefanb@linux.ibm.com>
-Date: Tue, 4 Jan 2022 12:58:05 -0500
-Subject: [PATCH] acpi: tpm: Add missing device identification objects
-
-Add missing TPM device identification objects _STR and _UID. They will
-appear as files 'description' and 'uid' under Linux sysfs.
-
-Following inspection of sysfs entries for hardware TPMs we chose
-uid '1'.
-
-Upstream-Status: Backport [5903646d3913af6544680f6645fcb7296d0b3a1c]
-
-Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
-Cc: Michael S. Tsirkin <mst@redhat.com>
-Cc: Igor Mammedov <imammedo@redhat.com>
-Cc: Ani Sinha <ani@anisinha.ca>
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/708
-Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
-Reviewed-by: Ani Sinha <ani@anisinha.ca>
-Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>
-Message-id: 20211223022310.575496-3-stefanb@linux.ibm.com
-Message-Id: <20220104175806.872996-3-stefanb@linux.ibm.com>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
-Reviewed-by: Igor Mammedov <imammedo@redhat.com>
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- hw/arm/virt-acpi-build.c | 1 +
- hw/i386/acpi-build.c     | 7 +++++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
-index d0f4867fdfe5..f2514ce77c0b 100644
---- a/hw/arm/virt-acpi-build.c
-+++ b/hw/arm/virt-acpi-build.c
-@@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
- 
-     Aml *dev = aml_device("TPM0");
-     aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
-+    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
-     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
- 
-     Aml *crs = aml_resource_template();
-diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
-index 0234fe7588b7..ce823e8fcb97 100644
---- a/hw/i386/acpi-build.c
-+++ b/hw/i386/acpi-build.c
-@@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
-                     dev = aml_device("TPM");
-                     aml_append(dev, aml_name_decl("_HID",
-                                                   aml_string("MSFT0101")));
-+                    aml_append(dev,
-+                               aml_name_decl("_STR",
-+                                             aml_string("TPM 2.0 Device")));
-                 } else {
-                     dev = aml_device("ISA.TPM");
-                     aml_append(dev, aml_name_decl("_HID",
-                                                   aml_eisaid("PNP0C31")));
-                 }
-+                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
- 
-                 aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
-                 crs = aml_resource_template();
-@@ -1844,12 +1848,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
-     if (TPM_IS_CRB(tpm)) {
-         dev = aml_device("TPM");
-         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
-+        aml_append(dev, aml_name_decl("_STR",
-+                                      aml_string("TPM 2.0 Device")));
-         crs = aml_resource_template();
-         aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
-                                            TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
-         aml_append(dev, aml_name_decl("_CRS", crs));
- 
-         aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
-+        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
- 
-         tpm_build_ppi_acpi(tpm, dev);
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch b/meta/recipes-devtools/qemu/qemu/0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch
deleted file mode 100644
index e8e42007df..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 91e15627fd05d5a59fd2b88bc5c3491d3e0b56b0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Mar 2022 09:58:21 -0700
-Subject: [PATCH] ppc: Include asm/ptrace.h for pt_regs struct definition
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes
-../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
-    return uc->uc_mcontext.regs->nip;
-           ~~~~~~~~~~~~~~~~~~~~^
-
-Upstream-Status: Submitted [https://patchwork.kernel.org/project/qemu-devel/patch/20220314170223.554679-1-raj.khem@gmail.com/]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Peter Maydell <peter.maydell@linaro.org>
-Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Cc: Richard Henderson <richard.henderson@linaro.org>
----
- linux-user/include/host/ppc/host-signal.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
---- a/linux-user/host/ppc/host-signal.h
-+++ /dev/null
-@@ -1,30 +0,0 @@
--/*
-- * host-signal.h: signal info dependent on the host architecture
-- *
-- * Copyright (c) 2003-2005 Fabrice Bellard
-- * Copyright (c) 2021 Linaro Limited
-- *
-- * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
-- * See the COPYING file in the top-level directory.
-- */
--
--#ifndef PPC_HOST_SIGNAL_H
--#define PPC_HOST_SIGNAL_H
--
--static inline uintptr_t host_signal_pc(ucontext_t *uc)
--{
--    return uc->uc_mcontext.regs->nip;
--}
--
--static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
--{
--    uc->uc_mcontext.regs->nip = pc;
--}
--
--static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
--{
--    return uc->uc_mcontext.regs->trap != 0x400
--        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
--}
--
--#endif
---- a/linux-user/host/ppc64/host-signal.h
-+++ b/linux-user/host/ppc64/host-signal.h
-@@ -1 +1,32 @@
--#include "../ppc/host-signal.h"
-+/*
-+ * host-signal.h: signal info dependent on the host architecture
-+ *
-+ * Copyright (c) 2003-2005 Fabrice Bellard
-+ * Copyright (c) 2021 Linaro Limited
-+ *
-+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
-+ * See the COPYING file in the top-level directory.
-+ */
-+
-+#ifndef PPC_HOST_SIGNAL_H
-+#define PPC_HOST_SIGNAL_H
-+
-+#include <asm/ptrace.h>
-+
-+static inline uintptr_t host_signal_pc(ucontext_t *uc)
-+{
-+    return uc->uc_mcontext.gp_regs[PT_NIP];
-+}
-+
-+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
-+{
-+    uc->uc_mcontext.gp_regs[PT_NIP] = pc;
-+}
-+
-+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
-+{
-+    return uc->uc_mcontext.gp_regs[PT_TRAP] != 0x400
-+        && (uc->uc_mcontext.gp_regs[PT_DSISR] & 0x02000000);
-+}
-+
-+#endif
diff --git a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
similarity index 73%
rename from meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
rename to meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 733789be29..6fb160e6d3 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,7 +1,7 @@
-From ce1eceab2350d27960ec254650717085f6a11c9a Mon Sep 17 00:00:00 2001
+From de64af82950a6908f9407dfc92b83c17e2af3eab Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
-Subject: [PATCH] qemu: Add addition environment space to boot loader
+Subject: [PATCH 01/12] qemu: Add addition environment space to boot loader
  qemu-system-mips
 
 Upstream-Status: Inappropriate - OE uses deep paths
@@ -18,11 +18,11 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  hw/mips/malta.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-6.0.0/hw/mips/malta.c
-===================================================================
---- qemu-6.0.0.orig/hw/mips/malta.c
-+++ qemu-6.0.0/hw/mips/malta.c
-@@ -65,7 +65,7 @@
+diff --git a/hw/mips/malta.c b/hw/mips/malta.c
+index 628851172..12d37f35d 100644
+--- a/hw/mips/malta.c
++++ b/hw/mips/malta.c
+@@ -61,7 +61,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
@@ -31,3 +31,6 @@ Index: qemu-6.0.0/hw/mips/malta.c
  
  /* Hardware addresses */
  #define FLASH_ADDRESS       0x1e000000ULL
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
deleted file mode 100644
index 2f2d19f536..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 883feb43129dc39b491e492c7ccfe89aefe53c44 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 27 Nov 2014 14:04:29 +0000
-Subject: [PATCH] qemu: Add missing wacom HID descriptor
-
-The USB wacom device is missing a HID descriptor which causes it
-to fail to operate with recent kernels (e.g. 3.17).
-
-This patch adds a HID desriptor to the device, based upon one from
-real wcom device.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted
-2014/11/27
-
-[update patch context]
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
- 1 file changed, 93 insertions(+), 1 deletion(-)
-
-Index: qemu-6.0.0/hw/usb/dev-wacom.c
-===================================================================
---- qemu-6.0.0.orig/hw/usb/dev-wacom.c
-+++ qemu-6.0.0/hw/usb/dev-wacom.c
-@@ -69,6 +69,89 @@ static const USBDescStrings desc_strings
-     [STR_SERIALNUMBER]     = "1",
- };
- 
-+static const uint8_t qemu_tablet_hid_report_descriptor[] = {
-+    0x05, 0x01,		/* Usage Page (Generic Desktop) */
-+    0x09, 0x02,		/* Usage (Mouse) */
-+    0xa1, 0x01,		/* Collection (Application) */
-+    0x85, 0x01,		/*   Report ID (1) */ 
-+    0x09, 0x01,		/*   Usage (Pointer) */
-+    0xa1, 0x00,		/*   Collection (Physical) */
-+    0x05, 0x09,		/*     Usage Page (Button) */
-+    0x19, 0x01,		/*     Usage Minimum (1) */
-+    0x29, 0x05,		/*     Usage Maximum (5) */
-+    0x15, 0x00,		/*     Logical Minimum (0) */
-+    0x25, 0x01,		/*     Logical Maximum (1) */
-+    0x95, 0x05,		/*     Report Count (5) */
-+    0x75, 0x01,		/*     Report Size (1) */
-+    0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
-+    0x95, 0x01,		/*     Report Count (1) */
-+    0x75, 0x03,		/*     Report Size (3) */
-+    0x81, 0x01,		/*     Input (Constant) */
-+    0x05, 0x01,		/*     Usage Page (Generic Desktop) */
-+    0x09, 0x30,		/*     Usage (X) */
-+    0x09, 0x31,		/*     Usage (Y) */
-+    0x15, 0x81,		/*     Logical Minimum (-127) */
-+    0x25, 0x7f,		/*     Logical Maximum (127) */
-+    0x75, 0x08,		/*     Report Size (8) */
-+    0x95, 0x02,		/*     Report Count (2) */
-+    0x81, 0x06,		/*     Input (Data, Variable, Relative) */
-+    0xc0,		/*   End Collection */
-+    0xc0,		/* End Collection */
-+    0x05, 0x0d,		/* Usage Page (Digitizer) */
-+    0x09, 0x01,		/* Usage (Digitizer) */
-+    0xa1, 0x01,		/* Collection (Application) */
-+    0x85, 0x02,		/*   Report ID (2) */ 
-+    0xa1, 0x00,		/*   Collection (Physical) */
-+    0x06, 0x00, 0xff,   /*   Usage Page (Vendor 0xff00) */
-+    0x09, 0x01, 	/*   Usage (Digitizer) */
-+    0x15, 0x00, 	/*     Logical Minimum (0) */
-+    0x26, 0xff, 0x00,	/*     Logical Maximum (255) */
-+    0x75, 0x08,		/*     Report Size (8) */
-+    0x95, 0x08,		/*     Report Count (8) */
-+    0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
-+    0xc0, 		/*   End Collection */
-+    0x09, 0x01,		/*   Usage (Digitizer) */
-+    0x85, 0x02, 	/*   Report ID (2) */ 
-+    0x95, 0x01,		/*   Report Count (1) */
-+    0xb1, 0x02,		/*   FEATURE (2) */
-+    0xc0,		/* End Collection */
-+    0x06, 0x00, 0xff,	/* Usage Page (Vendor 0xff00) */
-+    0x09, 0x01,		/* Usage (Digitizer) */
-+    0xa1, 0x01,		/* Collection (Application) */
-+    0x85, 0x02,   	/*   Report ID (2) */ 
-+    0x05, 0x0d,		/*   Usage Page (Digitizer)  */
-+    0x09, 0x22, 	/*   Usage (Finger) */
-+    0xa1, 0x00,  	/*   Collection (Physical) */
-+    0x06, 0x00, 0xff,	/*   Usage Page (Vendor 0xff00) */
-+    0x09, 0x01,		/*     Usage (Digitizer) */
-+    0x15, 0x00, 	/*     Logical Minimum (0) */
-+    0x26, 0xff, 0x00,  	/*     Logical Maximum */
-+    0x75, 0x08,		/*     Report Size (8) */
-+    0x95, 0x02,		/*     Report Count (2) */
-+    0x81, 0x02, 	/*     Input (Data, Variable, Absolute) */
-+    0x05, 0x01,		/*     Usage Page (Generic Desktop) */
-+    0x09, 0x30,		/*     Usage (X) */
-+    0x35, 0x00, 	/*     Physical Minimum */
-+    0x46, 0xe0, 0x2e,	/*     Physical Maximum */
-+    0x26, 0xe0, 0x01,   /*     Logical Maximum */
-+    0x75, 0x10,		/*     Report Size (16) */
-+    0x95, 0x01,		/*     Report Count (1) */
-+    0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
-+    0x09, 0x31,		/*     Usage (Y) */
-+    0x46, 0x40, 0x1f, 	/*     Physical Maximum */
-+    0x26, 0x40, 0x01, 	/*     Logical Maximum */
-+    0x81, 0x02, 	/*     Input (Data, Variable, Absolute) */
-+    0x06, 0x00, 0xff,	/*     Usage Page (Vendor 0xff00) */
-+    0x09, 0x01, 	/*     Usage (Digitizer) */
-+    0x26, 0xff, 0x00,  	/*     Logical Maximum */
-+    0x75, 0x08,		/*     Report Size (8) */
-+    0x95, 0x0d,		/*     Report Count (13) */
-+    0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
-+    0xc0,		/*   End Collection */ 
-+    0xc0,		/* End Collection */
-+};
-+
-+
- static const USBDescIface desc_iface_wacom = {
-     .bInterfaceNumber              = 0,
-     .bNumEndpoints                 = 1,
-@@ -86,7 +169,7 @@ static const USBDescIface desc_iface_wac
-                 0x00,          /*  u8  country_code */
-                 0x01,          /*  u8  num_descriptors */
-                 USB_DT_REPORT, /*  u8  type: Report */
--                0x6e, 0,       /*  u16 len */
-+                sizeof(qemu_tablet_hid_report_descriptor), 0,       /*  u16 len */
-             },
-         },
-     },
-@@ -266,6 +349,15 @@ static void usb_wacom_handle_control(USB
-     }
- 
-     switch (request) {
-+    case InterfaceRequest | USB_REQ_GET_DESCRIPTOR:
-+        switch (value >> 8) {
-+        case 0x22:
-+                memcpy(data, qemu_tablet_hid_report_descriptor,
-+                       sizeof(qemu_tablet_hid_report_descriptor));
-+                p->actual_length = sizeof(qemu_tablet_hid_report_descriptor);
-+            break;
-+        }
-+        break;
-     case WACOM_SET_REPORT:
-         if (s->mouse_grabbed) {
-             qemu_remove_mouse_event_handler(s->eh_entry);
diff --git a/meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch b/meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch
deleted file mode 100644
index ac4b6dcc44..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 359dc12eb32b2395cf10796157002024e6a58054 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 Dec 2021 23:31:11 -0800
-Subject: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
-
-5.4 is first stable API as far as rv32 is concerned see [1]
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=7a55dd3fb6d2c307a002a16776be84310b9c8989
-
-Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2021-12/msg02495.html]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Palmer Dabbelt <palmer@dabbelt.com>
-Cc: Alistair Francis <alistair.francis@wdc.com>
-Cc: Bin Meng <bin.meng@windriver.com>
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- linux-user/riscv/target_syscall.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
-index dc597c897..9b1316132 100644
---- a/linux-user/riscv/target_syscall.h
-+++ b/linux-user/riscv/target_syscall.h
-@@ -45,10 +45,11 @@ struct target_pt_regs {
- 
- #ifdef TARGET_RISCV32
- #define UNAME_MACHINE "riscv32"
-+#define UNAME_MINIMUM_RELEASE "5.4.0"
- #else
- #define UNAME_MACHINE "riscv64"
--#endif
- #define UNAME_MINIMUM_RELEASE "4.15.0"
-+#endif
- 
- #define TARGET_MINSIGSTKSZ 2048
- #define TARGET_MCL_CURRENT 1
--- 
-2.32.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch b/meta/recipes-devtools/qemu/qemu/0001-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch
deleted file mode 100644
index dcea9040c7..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-CVE: CVE-2022-26354
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 0190d651a73463dc2b8f170b29326d1f38140a04 Mon Sep 17 00:00:00 2001
-From: Stefano Garzarella <sgarzare@redhat.com>
-Date: Mon, 28 Feb 2022 10:50:58 +0100
-Subject: [PATCH 1/2] vhost-vsock: detach the virqueue element in case of error
-
-In vhost_vsock_common_send_transport_reset(), if an element popped from
-the virtqueue is invalid, we should call virtqueue_detach_element() to
-detach it from the virtqueue before freeing its memory.
-
-Fixes: fc0b9b0e1c ("vhost-vsock: add virtio sockets device")
-Fixes: CVE-2022-26354
-Cc: qemu-stable@nongnu.org
-Reported-by: VictorV <vv474172261@gmail.com>
-Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
-Message-Id: <20220228095058.27899-1-sgarzare@redhat.com>
-Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
----
- hw/virtio/vhost-vsock-common.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
-index 3f3771274e..ed706681ac 100644
---- a/hw/virtio/vhost-vsock-common.c
-+++ b/hw/virtio/vhost-vsock-common.c
-@@ -153,19 +153,23 @@ static void vhost_vsock_common_send_transport_reset(VHostVSockCommon *vvc)
-     if (elem->out_num) {
-         error_report("invalid vhost-vsock event virtqueue element with "
-                      "out buffers");
--        goto out;
-+        goto err;
-     }
- 
-     if (iov_from_buf(elem->in_sg, elem->in_num, 0,
-                      &event, sizeof(event)) != sizeof(event)) {
-         error_report("vhost-vsock event virtqueue element is too short");
--        goto out;
-+        goto err;
-     }
- 
-     virtqueue_push(vq, elem, sizeof(event));
-     virtio_notify(VIRTIO_DEVICE(vvc), vq);
- 
--out:
-+    g_free(elem);
-+    return;
-+
-+err:
-+    virtqueue_detach_element(vq, elem, 0);
-     g_free(elem);
- }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0002-chardev-connect-socket-to-a-spawned-command.patch
similarity index 84%
rename from meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
rename to meta/recipes-devtools/qemu/qemu/0002-chardev-connect-socket-to-a-spawned-command.patch
index cf8b0e7a45..63a99c9620 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-chardev-connect-socket-to-a-spawned-command.patch
@@ -1,7 +1,7 @@
-From bcc63f775e265df69963a4ad7805b8678ace68f0 Mon Sep 17 00:00:00 2001
+From 14cd62607c9de232edf0a9b8503bd02783e03411 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Thu, 21 Dec 2017 11:35:16 -0800
-Subject: [PATCH] chardev: connect socket to a spawned command
+Subject: [PATCH 02/12] chardev: connect socket to a spawned command
 
 The command is started in a shell (sh -c) with stdin connect to QEMU
 via a Unix domain stream socket. QEMU then exchanges data via its own
@@ -46,16 +46,16 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 
 ---
- chardev/char-socket.c | 101 ++++++++++++++++++++++++++++++++++++++++++
+ chardev/char-socket.c | 100 ++++++++++++++++++++++++++++++++++++++++++
  chardev/char.c        |   3 ++
  qapi/char.json        |   5 +++
- 3 files changed, 109 insertions(+)
+ 3 files changed, 108 insertions(+)
 
-Index: qemu-6.2.0/chardev/char-socket.c
-===================================================================
---- qemu-6.2.0.orig/chardev/char-socket.c
-+++ qemu-6.2.0/chardev/char-socket.c
-@@ -1362,6 +1362,67 @@ static bool qmp_chardev_validate_socket(
+diff --git a/chardev/char-socket.c b/chardev/char-socket.c
+index fab2d791d..c79641f24 100644
+--- a/chardev/char-socket.c
++++ b/chardev/char-socket.c
+@@ -1315,6 +1315,67 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
      return true;
  }
  
@@ -123,7 +123,7 @@ Index: qemu-6.2.0/chardev/char-socket.c
  
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
-@@ -1370,6 +1431,9 @@ static void qmp_chardev_open_socket(Char
+@@ -1323,6 +1384,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -133,7 +133,7 @@ Index: qemu-6.2.0/chardev/char-socket.c
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -1440,6 +1504,14 @@ static void qmp_chardev_open_socket(Char
+@@ -1393,6 +1457,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
  
      update_disconnected_filename(s);
  
@@ -148,7 +148,7 @@ Index: qemu-6.2.0/chardev/char-socket.c
      if (s->is_listen) {
          if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
                                             is_waitconnect, errp) < 0) {
-@@ -1459,6 +1531,9 @@ static void qemu_chr_parse_socket(QemuOp
+@@ -1412,6 +1484,9 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *fd = qemu_opt_get(opts, "fd");
@@ -158,7 +158,7 @@ Index: qemu-6.2.0/chardev/char-socket.c
  #ifdef CONFIG_LINUX
      bool tight = qemu_opt_get_bool(opts, "tight", true);
      bool abstract = qemu_opt_get_bool(opts, "abstract", false);
-@@ -1466,6 +1541,20 @@ static void qemu_chr_parse_socket(QemuOp
+@@ -1419,6 +1494,20 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      SocketAddressLegacy *addr;
      ChardevSocket *sock;
  
@@ -176,10 +176,10 @@ Index: qemu-6.2.0/chardev/char-socket.c
 +    } else
 +#endif
 +
-     if ((!!path + !!fd + !!host) != 1) {
+     if ((!!path + !!fd + !!host) > 1) {
          error_setg(errp,
-                    "Exactly one of 'path', 'fd' or 'host' required");
-@@ -1516,13 +1605,24 @@ static void qemu_chr_parse_socket(QemuOp
+                    "None or one of 'path', 'fd' or 'host' option required.");
+@@ -1469,13 +1558,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      sock->tls_creds = g_strdup(qemu_opt_get(opts, "tls-creds"));
      sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
      sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
@@ -204,24 +204,24 @@ Index: qemu-6.2.0/chardev/char-socket.c
  #ifdef CONFIG_LINUX
          q_unix->has_tight = true;
          q_unix->tight = tight;
-Index: qemu-6.2.0/chardev/char.c
-===================================================================
---- qemu-6.2.0.orig/chardev/char.c
-+++ qemu-6.2.0/chardev/char.c
-@@ -836,6 +836,9 @@ QemuOptsList qemu_chardev_opts = {
+diff --git a/chardev/char.c b/chardev/char.c
+index 0169d8dde..ce9a21f41 100644
+--- a/chardev/char.c
++++ b/chardev/char.c
+@@ -835,6 +835,9 @@ QemuOptsList qemu_chardev_opts = {
+         },{
              .name = "path",
              .type = QEMU_OPT_STRING,
-         },{
++        },{
 +            .name = "cmd",
 +            .type = QEMU_OPT_STRING,
-+        },{
+         },{
              .name = "host",
              .type = QEMU_OPT_STRING,
-         },{
-Index: qemu-6.2.0/qapi/char.json
-===================================================================
---- qemu-6.2.0.orig/qapi/char.json
-+++ qemu-6.2.0/qapi/char.json
+diff --git a/qapi/char.json b/qapi/char.json
+index 7b4215157..37feabdac 100644
+--- a/qapi/char.json
++++ b/qapi/char.json
 @@ -250,6 +250,10 @@
  #
  # @addr: socket address to listen on (server=true)
@@ -241,3 +241,6 @@ Index: qemu-6.2.0/qapi/char.json
              '*tls-creds': 'str',
              '*tls-authz'  : 'str',
              '*server': 'bool',
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-virtio-net-fix-map-leaking-on-error-during-receive.patch b/meta/recipes-devtools/qemu/qemu/0002-virtio-net-fix-map-leaking-on-error-during-receive.patch
deleted file mode 100644
index 59ccfdd03c..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-virtio-net-fix-map-leaking-on-error-during-receive.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-CVE: CVE-2022-26353
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 4d65ecbddd16f38a8cf23b3053ca5c3594f8d4a4 Mon Sep 17 00:00:00 2001
-From: Jason Wang <jasowang@redhat.com>
-Date: Tue, 8 Mar 2022 10:42:51 +0800
-Subject: [PATCH 2/2] virtio-net: fix map leaking on error during receive
-
-Commit bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
-tries to fix the use after free of the sg by caching the virtqueue
-elements in an array and unmap them at once after receiving the
-packets, But it forgot to unmap the cached elements on error which
-will lead to leaking of mapping and other unexpected results.
-
-Fixing this by detaching the cached elements on error. This addresses
-CVE-2022-26353.
-
-Reported-by: Victor Tom <vv474172261@gmail.com>
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2022-26353
-Fixes: bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
----
- hw/net/virtio-net.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
-index f2014d5ea0..e1f4748831 100644
---- a/hw/net/virtio-net.c
-+++ b/hw/net/virtio-net.c
-@@ -1862,6 +1862,7 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
- 
- err:
-     for (j = 0; j < i; j++) {
-+        virtqueue_detach_element(q->rx_vq, elems[j], lens[j]);
-         g_free(elems[j]);
-     }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
similarity index 80%
rename from meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
rename to meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
index 3491fa8a53..f350ffce47 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From a59a98d100123030a4145e7efe3b8a001920a9f1 Mon Sep 17 00:00:00 2001
+From dc2a8ccd440ee3741b61606eafed3f7e092f4312 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
-Subject: [PATCH] apic: fixup fallthrough to PIC
+Subject: [PATCH 03/12] apic: fixup fallthrough to PIC
 
 Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
 interrupts through the local APIC if the local APIC config says so.]
@@ -29,11 +29,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-6.0.0/hw/intc/apic.c
-===================================================================
---- qemu-6.0.0.orig/hw/intc/apic.c
-+++ qemu-6.0.0/hw/intc/apic.c
-@@ -606,7 +606,7 @@ int apic_accept_pic_intr(DeviceState *de
+diff --git a/hw/intc/apic.c b/hw/intc/apic.c
+index 3df11c34d..9506c88ce 100644
+--- a/hw/intc/apic.c
++++ b/hw/intc/apic.c
+@@ -605,7 +605,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
@@ -42,3 +42,6 @@ Index: qemu-6.0.0/hw/intc/apic.c
          return -1;
  
      lvt0 = s->lvt[APIC_LVT_LINT0];
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
similarity index 81%
rename from meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
rename to meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
index 4298964dfa..6faebd4e09 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -1,7 +1,7 @@
-From b51e6dd833172954c718bd600d846540eeb07220 Mon Sep 17 00:00:00 2001
+From d8265abdce5dc2bf74b3fccdf2b7257b4f3894f0 Mon Sep 17 00:00:00 2001
 From: He Zhe <zhe.he@windriver.com>
 Date: Wed, 28 Aug 2019 19:56:28 +0800
-Subject: [PATCH] configure: Add pkg-config handling for libgcrypt
+Subject: [PATCH 04/12] configure: Add pkg-config handling for libgcrypt
 
 libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
 handling for libgcrypt.
@@ -15,10 +15,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index b3e7ec0e9..4cbe715b7 100644
+index 861de93c4..d45ff2d7c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -874,7 +874,7 @@ endif
+@@ -1063,7 +1063,7 @@ endif
  if not gnutls_crypto.found()
    if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
      gcrypt = dependency('libgcrypt', version: '>=1.8',
@@ -27,3 +27,6 @@ index b3e7ec0e9..4cbe715b7 100644
                          required: get_option('gcrypt'),
                          kwargs: static_kwargs)
      # Debian has removed -lgpg-error from libgcrypt-config
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
similarity index 70%
rename from meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
rename to meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
index b8d288d3a2..3f3c39f996 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,7 +1,7 @@
-From 34247f83095f8cdcdc1f9d7f0c6ffbd46b25d979 Mon Sep 17 00:00:00 2001
+From f39e7bfc5ed07b5ecaeb705c4eae4855ca120d47 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
-Subject: [PATCH] qemu: Do not include file if not exists
+Subject: [PATCH 05/12] qemu: Do not include file if not exists
 
 Script configure checks for if_alg.h and check failed but
 if_alg.h still included.
@@ -11,14 +11,15 @@ Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
 
 [update patch context]
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+
 ---
  linux-user/syscall.c | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: qemu-6.0.0/linux-user/syscall.c
-===================================================================
---- qemu-6.0.0.orig/linux-user/syscall.c
-+++ qemu-6.0.0/linux-user/syscall.c
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index f65045efe..340e0c6f0 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
 @@ -113,7 +113,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
@@ -29,3 +30,6 @@ Index: qemu-6.0.0/linux-user/syscall.c
  #include <linux/rtc.h>
  #include <sound/asound.h>
  #ifdef HAVE_BTRFS_H
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/mmap2.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
similarity index 68%
rename from meta/recipes-devtools/qemu/qemu/mmap2.patch
rename to meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index e115473b70..75c0369318 100644
--- a/meta/recipes-devtools/qemu/qemu/mmap2.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,3 +1,9 @@
+From 375cae3dd6151ef33cae8f243f6a2c2da6c0c356 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 8 Jan 2021 17:27:06 +0000
+Subject: [PATCH 06/12] qemu: Add some user space mmap tweaks to address musl
+ 32 bit
+
 When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
 infinite loop of mremap calls of ever decreasing/increasing addresses.
 
@@ -13,11 +19,15 @@ rather than ENOMEM so adjust the other part of the test to this.
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01355.html]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 
-Index: qemu-6.0.0/linux-user/mmap.c
-===================================================================
---- qemu-6.0.0.orig/linux-user/mmap.c
-+++ qemu-6.0.0/linux-user/mmap.c
-@@ -733,12 +733,16 @@ abi_long target_mremap(abi_ulong old_add
+---
+ linux-user/mmap.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/linux-user/mmap.c b/linux-user/mmap.c
+index c125031b9..e651834a5 100644
+--- a/linux-user/mmap.c
++++ b/linux-user/mmap.c
+@@ -749,12 +749,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
@@ -37,3 +47,6 @@ Index: qemu-6.0.0/linux-user/mmap.c
          return -1;
      }
  
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/determinism.patch b/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
similarity index 54%
rename from meta/recipes-devtools/qemu/qemu/determinism.patch
rename to meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
index 330a31204d..0d7dae3689 100644
--- a/meta/recipes-devtools/qemu/qemu/determinism.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
@@ -1,4 +1,9 @@
-When sources are included within debug information, a couple of areas of the 
+From 50bab5c2605b609ea7ea154f57a9be96d656725a Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 1 Mar 2021 13:00:47 +0000
+Subject: [PATCH 07/12] qemu: Determinism fixes
+
+When sources are included within debug information, a couple of areas of the
 qemu build are not reproducible due to either full buildpaths or timestamps.
 
 Replace the full paths with relative ones. I couldn't figure out how to get
@@ -7,11 +12,15 @@ meson to pass relative paths but we can fix that in the script.
 Upstream-Status: Pending [some version of all/part of this may be accepted]
 RP 2021/3/1
 
-Index: qemu-6.0.0/scripts/decodetree.py
-===================================================================
---- qemu-6.0.0.orig/scripts/decodetree.py
-+++ qemu-6.0.0/scripts/decodetree.py
-@@ -1304,7 +1304,7 @@ def main():
+---
+ scripts/decodetree.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/decodetree.py b/scripts/decodetree.py
+index a03dc6b5e..4ea24c1f3 100644
+--- a/scripts/decodetree.py
++++ b/scripts/decodetree.py
+@@ -1328,7 +1328,7 @@ def main():
      toppat = ExcMultiPattern(0)
  
      for filename in args:
@@ -20,3 +29,6 @@ Index: qemu-6.0.0/scripts/decodetree.py
          f = open(filename, 'rt', encoding='utf-8')
          parse_file(f, toppat)
          f.close()
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
similarity index 69%
rename from meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
rename to meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
index fcef129181..43d3c7cf1f 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,7 +1,7 @@
-From a4bdc0416134477e4eae386db04b1de7491163bb Mon Sep 17 00:00:00 2001
+From 2bf9388b801d4389e2d57e95a7897bfc1c42786e Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
-Subject: [PATCH] tests/meson.build: use relative path to refer to files
+Subject: [PATCH 08/12] tests/meson.build: use relative path to refer to files
 
 Fix error like:
 Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long
@@ -12,14 +12,15 @@ filename too long. Fixed by using relative path to refer to files
 Upstream-Status: Submitted [send to qemu-devel]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
- tests/meson.build   | 2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
+ tests/unit/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: qemu-6.2.0/tests/unit/meson.build
-===================================================================
---- qemu-6.2.0.orig/tests/unit/meson.build
-+++ qemu-6.2.0/tests/unit/meson.build
+diff --git a/tests/unit/meson.build b/tests/unit/meson.build
+index 96b295263..e4c3246dc 100644
+--- a/tests/unit/meson.build
++++ b/tests/unit/meson.build
 @@ -44,9 +44,9 @@ tests = {
    'test-keyval': [testqapi],
    'test-logging': [],
@@ -32,3 +33,6 @@ Index: qemu-6.2.0/tests/unit/meson.build
  }
  
  if have_system or have_tools
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
similarity index 87%
rename from meta/recipes-devtools/qemu/qemu/0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
rename to meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 4691a3672a..23d0a69802 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,7 +1,7 @@
-From 444e80e63d35006f41e7d658e2bf6d7c9f7641df Mon Sep 17 00:00:00 2001
+From ebf4bb2f51da83af0c61480414cfa156f7308b34 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
-Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
+Subject: [PATCH 09/12] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
  systems
 
 linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
@@ -13,12 +13,13 @@ Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/202
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Cc: Zhang Yi <yi.z.zhang@linux.intel.com>
 Cc: Michael S. Tsirkin <mst@redhat.com>
+
 ---
  util/mmap-alloc.c | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
-index 893d864354..86d3cda248 100644
+index 893d86435..86d3cda24 100644
 --- a/util/mmap-alloc.c
 +++ b/util/mmap-alloc.c
 @@ -10,14 +10,18 @@
@@ -44,5 +45,5 @@ index 893d864354..86d3cda248 100644
  #include "qemu/host-utils.h"
  #include "qemu/cutils.h"
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta/recipes-devtools/qemu/qemu/pvrdma.patch b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
similarity index 59%
rename from meta/recipes-devtools/qemu/qemu/pvrdma.patch
rename to meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
index 7b0335b1dc..826d42fc20 100644
--- a/meta/recipes-devtools/qemu/qemu/pvrdma.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
@@ -1,4 +1,8 @@
-hw/pvrdma: Protect against buggy or malicious guest driver
+From 52c38fa9f3a790a7c2805e7d8cce3ea9262d6ae2 Mon Sep 17 00:00:00 2001
+From: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Date: Tue, 12 Apr 2022 11:01:51 +0100
+Subject: [PATCH 10/12] hw/pvrdma: Protect against buggy or malicious guest
+ driver
 
 Guest driver might execute HW commands when shared buffers are not yet
 allocated.
@@ -12,10 +16,15 @@ Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
 CVE: CVE-2022-1050
 Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05197.html]
 
-Index: qemu-6.2.0/hw/rdma/vmw/pvrdma_cmd.c
-===================================================================
---- qemu-6.2.0.orig/hw/rdma/vmw/pvrdma_cmd.c
-+++ qemu-6.2.0/hw/rdma/vmw/pvrdma_cmd.c
+---
+ hw/rdma/vmw/pvrdma_cmd.c  | 6 ++++++
+ hw/rdma/vmw/pvrdma_main.c | 3 ++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
+index da7ddfa54..89db963c4 100644
+--- a/hw/rdma/vmw/pvrdma_cmd.c
++++ b/hw/rdma/vmw/pvrdma_cmd.c
 @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
  
      dsr_info = &dev->dsr_info;
@@ -29,11 +38,11 @@ Index: qemu-6.2.0/hw/rdma/vmw/pvrdma_cmd.c
      if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
                        sizeof(struct cmd_handler)) {
          rdma_error_report("Unsupported command");
-Index: qemu-6.2.0/hw/rdma/vmw/pvrdma_main.c
-===================================================================
---- qemu-6.2.0.orig/hw/rdma/vmw/pvrdma_main.c
-+++ qemu-6.2.0/hw/rdma/vmw/pvrdma_main.c
-@@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev
+diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
+index 91206dbb8..0b7d908e2 100644
+--- a/hw/rdma/vmw/pvrdma_main.c
++++ b/hw/rdma/vmw/pvrdma_main.c
+@@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
  {
      struct pvrdma_device_shared_region *dsr;
  
@@ -43,3 +52,6 @@ Index: qemu-6.2.0/hw/rdma/vmw/pvrdma_main.c
          rdma_error_report("Can't initialized DSR");
          return;
      }
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/cross.patch b/meta/recipes-devtools/qemu/qemu/cross.patch
index bdb77ec7d0..d1256a1229 100644
--- a/meta/recipes-devtools/qemu/qemu/cross.patch
+++ b/meta/recipes-devtools/qemu/qemu/cross.patch
@@ -1,7 +1,7 @@
-From f51ece86f84c877f255746cba22a6745f37d2b7f Mon Sep 17 00:00:00 2001
+From 76c3fc4c87231bed32974ebbbdb5079cff45a6b7 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 5 Jan 2021 23:00:14 +0000
-Subject: [PATCH] qemu: Upgrade 5.1.0->5.2.0
+Subject: [PATCH 12/12] qemu: Upgrade 5.1.0->5.2.0
 
 We need to be able to trigger configure's cross code but we don't want
 to set cross_prefix as it does other things we don't want. Patch things
@@ -9,23 +9,24 @@ so we can do what we need in the target config case.
 
 Upstream-Status: Inappropriate [may be rewritten in a way upstream may accept?]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
 ---
  configure | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/configure b/configure
-index 9a79a004d..563b7827f 100755
+index 7c08c1835..0613279f9 100755
 --- a/configure
 +++ b/configure
-@@ -5128,7 +5128,6 @@ if test "$skip_meson" = no; then
+@@ -3118,7 +3118,6 @@ if test "$skip_meson" = no; then
    fi
    echo "strip = [$(meson_quote $strip)]" >> $cross
    echo "windres = [$(meson_quote $windres)]" >> $cross
 -  if test "$cross_compile" = "yes"; then
      cross_arg="--cross-file config-meson.cross"
      echo "[host_machine]" >> $cross
-     if test "$mingw32" = "yes" ; then
-@@ -5160,9 +5159,6 @@ if test "$skip_meson" = no; then
+     echo "system = '$targetos'" >> $cross
+@@ -3136,9 +3135,6 @@ if test "$skip_meson" = no; then
      else
          echo "endian = 'little'" >> $cross
      fi
@@ -36,5 +37,5 @@ index 9a79a004d..563b7827f 100755
  
    rm -rf meson-private meson-info meson-logs
 -- 
-2.17.1
+2.30.2
 
diff --git a/meta/recipes-devtools/qemu/qemu/no-ps2.patch b/meta/recipes-devtools/qemu/qemu/no-ps2.patch
deleted file mode 100644
index 8c167521d7..0000000000
--- a/meta/recipes-devtools/qemu/qemu/no-ps2.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-Upstream-Status: Backport [4ccd5fe22feb95137d325f422016a6473541fe9f]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ec2d4aa7ca28127faa7ccdbf89d2bf5a4984b62f Mon Sep 17 00:00:00 2001
-From: Joelle van Dyne <j@getutm.app>
-Date: Sun, 27 Feb 2022 13:06:55 -0800
-Subject: [PATCH] pc: add option to disable PS/2 mouse/keyboard
-
-On some older software like Windows 7 installer, having both a PS/2
-mouse and USB mouse results in only one device working property (which
-might be a different device each boot). While the workaround to not use
-a USB mouse with such software is valid, it creates an inconsistent
-experience if the user wishes to always use a USB mouse.
-
-This introduces a new machine property to inhibit the creation of the
-i8042 PS/2 controller.
-
-Signed-off-by: Joelle van Dyne <j@getutm.app>
-Message-Id: <20220227210655.45592-1-j@getutm.app>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
----
- hw/i386/pc.c         | 28 ++++++++++++++++++++++++++--
- include/hw/i386/pc.h |  2 ++
- 2 files changed, 28 insertions(+), 2 deletions(-)
-
-diff --git a/hw/i386/pc.c b/hw/i386/pc.c
-index a2ef40ecbc..8a6a089ee2 100644
---- a/hw/i386/pc.c
-+++ b/hw/i386/pc.c
-@@ -1008,7 +1008,8 @@ static const MemoryRegionOps ioportF0_io_ops = {
-     },
- };
- 
--static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
-+static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
-+                            bool create_i8042, bool no_vmport)
- {
-     int i;
-     DriveInfo *fd[MAX_FD];
-@@ -1030,6 +1031,10 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
-         }
-     }
- 
-+    if (!create_i8042) {
-+        return;
-+    }
-+
-     i8042 = isa_create_simple(isa_bus, "i8042");
-     if (!no_vmport) {
-         isa_create_simple(isa_bus, TYPE_VMPORT);
-@@ -1125,7 +1130,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
-     i8257_dma_init(isa_bus, 0);
- 
-     /* Super I/O */
--    pc_superio_init(isa_bus, create_fdctrl, pcms->vmport != ON_OFF_AUTO_ON);
-+    pc_superio_init(isa_bus, create_fdctrl, pcms->i8042_enabled,
-+                    pcms->vmport != ON_OFF_AUTO_ON);
- }
- 
- void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
-@@ -1506,6 +1512,20 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
-     pcms->hpet_enabled = value;
- }
- 
-+static bool pc_machine_get_i8042(Object *obj, Error **errp)
-+{
-+    PCMachineState *pcms = PC_MACHINE(obj);
-+
-+    return pcms->i8042_enabled;
-+}
-+
-+static void pc_machine_set_i8042(Object *obj, bool value, Error **errp)
-+{
-+    PCMachineState *pcms = PC_MACHINE(obj);
-+
-+    pcms->i8042_enabled = value;
-+}
-+
- static bool pc_machine_get_default_bus_bypass_iommu(Object *obj, Error **errp)
- {
-     PCMachineState *pcms = PC_MACHINE(obj);
-@@ -1616,6 +1636,7 @@ static void pc_machine_initfn(Object *obj)
-     pcms->smbus_enabled = true;
-     pcms->sata_enabled = true;
-     pcms->pit_enabled = true;
-+    pcms->i8042_enabled = true;
-     pcms->max_fw_size = 8 * MiB;
- #ifdef CONFIG_HPET
-     pcms->hpet_enabled = true;
-@@ -1744,6 +1765,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
-     object_class_property_add_bool(oc, "hpet",
-         pc_machine_get_hpet, pc_machine_set_hpet);
- 
-+    object_class_property_add_bool(oc, PC_MACHINE_I8042,
-+        pc_machine_get_i8042, pc_machine_set_i8042);
-+
-     object_class_property_add_bool(oc, "default-bus-bypass-iommu",
-         pc_machine_get_default_bus_bypass_iommu,
-         pc_machine_set_default_bus_bypass_iommu);
-diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
-index 9ab39e428f..642c915aa3 100644
---- a/include/hw/i386/pc.h
-+++ b/include/hw/i386/pc.h
-@@ -46,6 +46,7 @@ typedef struct PCMachineState {
-     bool sata_enabled;
-     bool pit_enabled;
-     bool hpet_enabled;
-+    bool i8042_enabled;
-     bool default_bus_bypass_iommu;
-     uint64_t max_fw_size;
- 
-@@ -62,6 +63,7 @@ typedef struct PCMachineState {
- #define PC_MACHINE_SMBUS            "smbus"
- #define PC_MACHINE_SATA             "sata"
- #define PC_MACHINE_PIT              "pit"
-+#define PC_MACHINE_I8042            "i8042"
- #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
- /**
-  * PCMachineClass:
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_7.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_6.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_7.0.0.bb
-- 
2.30.2

