Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH v2] qemu: Fix build on ppc64
Date: Mon, 14 Mar 2022 14:57:14 -0700
Message-Id: <20220314215714.1360249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

add a missing system include

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use upstream submitted patch

 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ptrace.h-for-pt_regs-struct-definiti.patch | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 86bf2c1016f..216af037a66 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch \
            file://0001-acpi-tpm-Add-missing-device-identification-objects.patch \
+           file://0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch b/meta/recipes-devtools/qemu/qemu/0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch
new file mode 100644
index 00000000000..b213b2f4472
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-ppc-Include-asm-ptrace.h-for-pt_regs-struct-definiti.patch
@@ -0,0 +1,90 @@
+From 91e15627fd05d5a59fd2b88bc5c3491d3e0b56b0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Mar 2022 09:58:21 -0700
+Subject: [PATCH] ppc: Include asm/ptrace.h for pt_regs struct definition
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes
+../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
+    return uc->uc_mcontext.regs->nip;
+           ~~~~~~~~~~~~~~~~~~~~^
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/project/qemu-devel/patch/20220314170223.554679-1-raj.khem@gmail.com/]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Peter Maydell <peter.maydell@linaro.org>
+Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Cc: Richard Henderson <richard.henderson@linaro.org>
+---
+ linux-user/include/host/ppc/host-signal.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+--- a/linux-user/host/ppc/host-signal.h
++++ /dev/null
+@@ -1,30 +0,0 @@
+-/*
+- * host-signal.h: signal info dependent on the host architecture
+- *
+- * Copyright (c) 2003-2005 Fabrice Bellard
+- * Copyright (c) 2021 Linaro Limited
+- *
+- * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+- * See the COPYING file in the top-level directory.
+- */
+-
+-#ifndef PPC_HOST_SIGNAL_H
+-#define PPC_HOST_SIGNAL_H
+-
+-static inline uintptr_t host_signal_pc(ucontext_t *uc)
+-{
+-    return uc->uc_mcontext.regs->nip;
+-}
+-
+-static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+-{
+-    uc->uc_mcontext.regs->nip = pc;
+-}
+-
+-static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+-{
+-    return uc->uc_mcontext.regs->trap != 0x400
+-        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
+-}
+-
+-#endif
+--- a/linux-user/host/ppc64/host-signal.h
++++ b/linux-user/host/ppc64/host-signal.h
+@@ -1 +1,30 @@
+-#include "../ppc/host-signal.h"
++/*
++ * host-signal.h: signal info dependent on the host architecture
++ *
++ * Copyright (c) 2003-2005 Fabrice Bellard
++ * Copyright (c) 2021 Linaro Limited
++ *
++ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
++ * See the COPYING file in the top-level directory.
++ */
++
++#ifndef PPC_HOST_SIGNAL_H
++#define PPC_HOST_SIGNAL_H
++
++static inline uintptr_t host_signal_pc(ucontext_t *uc)
++{
++    return uc->uc_mcontext.gp_regs[32];
++}
++
++static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
++{
++    uc->uc_mcontext.gp_regs[32] = pc;
++}
++
++static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
++{
++    return uc->uc_mcontext.gp_regs[40] != 0x400
++        && (uc->uc_mcontext.gp_regs[42] & 0x02000000);
++}
++
++#endif
-- 
2.35.1

