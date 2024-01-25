Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6FCC47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 21:04:12 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.163.1706216647344308127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 13:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 40PL44R6030454;
	Thu, 25 Jan 2024 15:04:04 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH 1/1] qemu: Allow native and nativesdk versions on Linux older then 4.17
Date: Thu, 25 Jan 2024 15:03:54 -0600
Message-Id: <1706216634-8340-2-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1706216634-8340-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1706216634-8340-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 21:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194331

From: Mark Hatle <mark.hatle@amd.com>

Linux kernel 4.17 introduced two new mmap flags, MAP_FIXED_NOREPLACE and
MAP_SHARED_VALIDATE.  Starting with QEMU 8.1, these flags are now used
and required for proper system operation.  In order to build and run on a
system older then 4.17, we need to emulate this new behavior.

Not having a newer kernel could result in the mmap memory being allocated
in a way that will cause failures without QEMU checking for these
conditions.  Note, memory allocation issues are rare in my experience so
this is more of a 'just-in-case' behavior.

SDK_OLDEST_KERNEL is currently set to 3.2.0, the only way this can claim
that qemu works in an SDK is by checking the return values to emulate
the expected behavior.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-devtools/qemu/qemu.inc           |  12 +
 ...round-for-missing-MAP_FIXED_NOREPLAC.patch | 286 ++++++++++++++++++
 ...round-for-missing-MAP_SHARED_VALIDAT.patch |  51 ++++
 3 files changed, 349 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ccb2880402..7c31a5aa83 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,18 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# SDK_OLDEST_KERNEL is set below 4.17, which is the minimum version required by QEMU >= 8.1
+# This is due to two MMAP flags being used at certain points
+SRC_URI:append:class-nativesdk = " \
+	file://0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch \
+	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
+        "
+
+# Support building and using native version on pre 4.17 kernels
+SRC_URI:append:class-native = " \
+	file://0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch \
+	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
+        "
 
 SRC_URI[sha256sum] = "bf00d2fa12010df8b0ade93371def58e632cb32a6bfdc5f5a0ff8e6a1fb1bf32"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
new file mode 100644
index 0000000000..8941911fb3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
@@ -0,0 +1,286 @@
+From fa9bcabe2387bb230ef82d62827ad6f93b8a1e61 Mon Sep 17 00:00:00 2001
+From: Frederic Konrad <fkonrad@amd.com>
+Date: Wed, 17 Jan 2024 18:15:06 +0000
+Subject: [PATCH 1/2] linux-user/*: workaround for missing MAP_FIXED_NOREPLACE
+
+QEMU v8.1.0 recently requires MAP_FIXED_NOREPLACE flags implementation for mmap.
+
+This is missing from ubuntu 18.04, thus this patch catches the mmap calls which
+could use that new flag and forwards them to mmap when MAP_FIXED_NOREPLACE
+flag isn't set or emulates them by checking the returned address w.r.t the
+requested address.
+
+Signed-off-by: Frederic Konrad <fkonrad@amd.com>
+Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
+
+Upstream-Status: Inappropriate [OE specific]
+
+The upstream only supports the last two major releases of an OS.  The ones
+they have declared all have kernel 4.17 or newer.
+
+See:
+https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
+
+https://www.qemu.org/docs/master/about/build-platforms.html
+
+ The project aims to support the most recent major version at all times for up
+ to five years after its initial release. Support for the previous major
+ version will be dropped 2 years after the new major version is released or
+ when the vendor itself drops support, whichever comes first.
+
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+---
+ linux-user/elfload.c    |  7 +++--
+ linux-user/meson.build  |  1 +
+ linux-user/mmap-fixed.c | 63 +++++++++++++++++++++++++++++++++++++++++
+ linux-user/mmap-fixed.h | 39 +++++++++++++++++++++++++
+ linux-user/mmap.c       | 31 +++++++++++---------
+ linux-user/syscall.c    |  1 +
+ 6 files changed, 125 insertions(+), 17 deletions(-)
+ create mode 100644 linux-user/mmap-fixed.c
+ create mode 100644 linux-user/mmap-fixed.h
+
+Index: qemu-8.2.0/linux-user/elfload.c
+===================================================================
+--- qemu-8.2.0.orig/linux-user/elfload.c
++++ qemu-8.2.0/linux-user/elfload.c
+@@ -22,6 +22,7 @@
+ #include "qemu/error-report.h"
+ #include "target_signal.h"
+ #include "accel/tcg/debuginfo.h"
++#include "mmap-fixed.h"
+ 
+ #ifdef TARGET_ARM
+ #include "target/arm/cpu-features.h"
+@@ -2765,9 +2766,9 @@ static abi_ulong create_elf_tables(abi_u
+ static int pgb_try_mmap(uintptr_t addr, uintptr_t addr_last, bool keep)
+ {
+     size_t size = addr_last - addr + 1;
+-    void *p = mmap((void *)addr, size, PROT_NONE,
+-                   MAP_ANONYMOUS | MAP_PRIVATE |
+-                   MAP_NORESERVE | MAP_FIXED_NOREPLACE, -1, 0);
++    void *p = mmap_fixed_noreplace((void *)addr, size, PROT_NONE,
++                                   MAP_ANONYMOUS | MAP_PRIVATE |
++                                   MAP_NORESERVE | MAP_FIXED_NOREPLACE, -1, 0);
+     int ret;
+ 
+     if (p == MAP_FAILED) {
+Index: qemu-8.2.0/linux-user/meson.build
+===================================================================
+--- qemu-8.2.0.orig/linux-user/meson.build
++++ qemu-8.2.0/linux-user/meson.build
+@@ -14,6 +14,7 @@ linux_user_ss.add(files(
+   'linuxload.c',
+   'main.c',
+   'mmap.c',
++  'mmap-fixed.c',
+   'signal.c',
+   'strace.c',
+   'syscall.c',
+Index: qemu-8.2.0/linux-user/mmap-fixed.c
+===================================================================
+--- /dev/null
++++ qemu-8.2.0/linux-user/mmap-fixed.c
+@@ -0,0 +1,63 @@
++/*
++ * Workaround for MAP_FIXED_NOREPLACE
++ *
++ * Copyright (c) 2024, Advanced Micro Devices, Inc.
++ * Developed by Fred Konrad <fkonrad@amd.com>
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a copy
++ * of this software and associated documentation files (the "Software"), to deal
++ * in the Software without restriction, including without limitation the rights
++ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
++ * copies of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be included in
++ * all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
++ * THE SOFTWARE.
++ */
++
++#include <sys/mman.h>
++#include <errno.h>
++
++#ifndef MAP_FIXED_NOREPLACE
++#include "mmap-fixed.h"
++
++void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int flags,
++                                  int fd, off_t offset)
++{
++    void *retaddr;
++
++    if (!(flags & MAP_FIXED_NOREPLACE)) {
++        /* General case, use the regular mmap.  */
++        return mmap(addr, len, prot, flags, fd, offset);
++    }
++
++    /* Since MAP_FIXED_NOREPLACE is not implemented, try to emulate it.  */
++    flags = flags & ~(MAP_FIXED_NOREPLACE | MAP_FIXED);
++    retaddr = mmap(addr, len, prot, flags, fd, offset);
++    if ((retaddr == addr) || (retaddr == MAP_FAILED)) {
++        /*
++         * Either the map worked and we get the good address so it can be
++         * returned, or it failed and would have failed the same with
++         * MAP_FIXED*, in which case return MAP_FAILED.
++         */
++        return retaddr;
++    } else {
++        /*
++         * Page has been mapped but not at the requested address.. unmap it and
++         * return EEXIST.
++         */
++        munmap(retaddr, len);
++        errno = EEXIST;
++        return MAP_FAILED;
++    }
++}
++
++#endif
+Index: qemu-8.2.0/linux-user/mmap-fixed.h
+===================================================================
+--- /dev/null
++++ qemu-8.2.0/linux-user/mmap-fixed.h
+@@ -0,0 +1,39 @@
++/*
++ * Workaround for MAP_FIXED_NOREPLACE
++ *
++ * Copyright (c) 2024, Advanced Micro Devices, Inc.
++ * Developed by Fred Konrad <fkonrad@amd.com>
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a copy
++ * of this software and associated documentation files (the "Software"), to deal
++ * in the Software without restriction, including without limitation the rights
++ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
++ * copies of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be included in
++ * all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
++ * THE SOFTWARE.
++ */
++
++#ifndef MMAP_FIXED_H
++#define MMAP_FIXED_H
++
++#ifndef MAP_FIXED_NOREPLACE
++#define MAP_FIXED_NOREPLACE 0x100000
++
++void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int flags,
++                           int fd, off_t offset);
++
++#else /* MAP_FIXED_NOREPLACE */
++#define mmap_fixed_noreplace mmap
++#endif /* MAP_FIXED_NOREPLACE */
++
++#endif /* MMAP_FIXED_H */
+Index: qemu-8.2.0/linux-user/mmap.c
+===================================================================
+--- qemu-8.2.0.orig/linux-user/mmap.c
++++ qemu-8.2.0/linux-user/mmap.c
+@@ -25,6 +25,7 @@
+ #include "user-mmap.h"
+ #include "target_mman.h"
+ #include "qemu/interval-tree.h"
++#include "mmap-fixed.h"
+ 
+ #ifdef TARGET_ARM
+ #include "target/arm/cpu-features.h"
+@@ -304,9 +305,9 @@ static bool mmap_frag(abi_ulong real_sta
+          * outside of the fragment we need to map.  Allocate a new host
+          * page to cover, discarding whatever else may have been present.
+          */
+-        void *p = mmap(host_start, qemu_host_page_size,
+-                       target_to_host_prot(prot),
+-                       flags | MAP_ANONYMOUS, -1, 0);
++        void *p = mmap_fixed_noreplace(host_start, qemu_host_page_size,
++                                       target_to_host_prot(prot),
++                                       flags | MAP_ANONYMOUS, -1, 0);
+         if (p != host_start) {
+             if (p != MAP_FAILED) {
+                 munmap(p, qemu_host_page_size);
+@@ -405,8 +406,9 @@ abi_ulong mmap_find_vma(abi_ulong start,
+          *  - mremap() with MREMAP_FIXED flag
+          *  - shmat() with SHM_REMAP flag
+          */
+-        ptr = mmap(g2h_untagged(addr), size, PROT_NONE,
+-                   MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
++        ptr = mmap_fixed_noreplace(g2h_untagged(addr), size, PROT_NONE,
++                                   MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE,
++                                   -1, 0);
+ 
+         /* ENOMEM, if host address space has no memory */
+         if (ptr == MAP_FAILED) {
+@@ -600,16 +602,16 @@ abi_long target_mmap(abi_ulong start, ab
+          * especially important if qemu_host_page_size >
+          * qemu_real_host_page_size.
+          */
+-        p = mmap(g2h_untagged(start), host_len, host_prot,
+-                 flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
++        p = mmap_fixed_noreplace(g2h_untagged(start), host_len, host_prot,
++                                 flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+         if (p == MAP_FAILED) {
+             goto fail;
+         }
+         /* update start so that it points to the file position at 'offset' */
+         host_start = (uintptr_t)p;
+         if (!(flags & MAP_ANONYMOUS)) {
+-            p = mmap(g2h_untagged(start), len, host_prot,
+-                     flags | MAP_FIXED, fd, host_offset);
++            p = mmap_fixed_noreplace(g2h_untagged(start), len, host_prot,
++                                     flags | MAP_FIXED, fd, host_offset);
+             if (p == MAP_FAILED) {
+                 munmap(g2h_untagged(start), host_len);
+                 goto fail;
+@@ -734,8 +736,9 @@ abi_long target_mmap(abi_ulong start, ab
+             len1 = real_last - real_start + 1;
+             want_p = g2h_untagged(real_start);
+ 
+-            p = mmap(want_p, len1, target_to_host_prot(target_prot),
+-                     flags, fd, offset1);
++            p = mmap_fixed_noreplace(want_p, len1,
++                                     target_to_host_prot(target_prot),
++                                     flags, fd, offset1);
+             if (p != want_p) {
+                 if (p != MAP_FAILED) {
+                     munmap(p, len1);
+@@ -837,9 +840,9 @@ static int mmap_reserve_or_unmap(abi_ulo
+     host_start = g2h_untagged(real_start);
+ 
+     if (reserved_va) {
+-        void *ptr = mmap(host_start, real_len, PROT_NONE,
+-                         MAP_FIXED | MAP_ANONYMOUS
+-                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
++        void *ptr = mmap_fixed_noreplace(host_start, real_len, PROT_NONE,
++                                         MAP_FIXED | MAP_ANONYMOUS
++                                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
+         return ptr == host_start ? 0 : -1;
+     }
+     return munmap(host_start, real_len);
+Index: qemu-8.2.0/linux-user/syscall.c
+===================================================================
+--- qemu-8.2.0.orig/linux-user/syscall.c
++++ qemu-8.2.0/linux-user/syscall.c
+@@ -145,6 +145,7 @@
+ #include "qapi/error.h"
+ #include "fd-trans.h"
+ #include "cpu_loop-common.h"
++#include "mmap-fixed.h"
+ 
+ #ifndef CLONE_IO
+ #define CLONE_IO                0x80000000      /* Clone io context */
diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch b/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch
new file mode 100644
index 0000000000..081409f355
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch
@@ -0,0 +1,51 @@
+From 5c73e53997df800a742f9cd7355f3045861984bb Mon Sep 17 00:00:00 2001
+From: Frederic Konrad <fkonrad@amd.com>
+Date: Thu, 18 Jan 2024 10:43:44 +0000
+Subject: [PATCH 2/2] linux-user/*: workaround for missing MAP_SHARED_VALIDATE
+
+QEMU v8.1.0 recently requires MAP_SHARED_VALIDATE flags implementation for mmap.
+
+This is missing from the Ubuntu 18.04 compiler but looks like to be in the
+kernel source.
+
+Signed-off-by: Frederic Konrad <fkonrad@amd.com>
+Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
+
+Upstream-Status: Inappropriate [OE specific]
+
+The upstream only supports the last two major releases of an OS.  The ones
+they have declared all have kernel 4.17 or newer.
+
+See:
+https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
+
+https://www.qemu.org/docs/master/about/build-platforms.html
+
+ The project aims to support the most recent major version at all times for up
+ to five years after its initial release. Support for the previous major
+ version will be dropped 2 years after the new major version is released or
+ when the vendor itself drops support, whichever comes first.
+
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+---
+ linux-user/mmap-fixed.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/linux-user/mmap-fixed.h b/linux-user/mmap-fixed.h
+index ef6eef5114..ec86586c1f 100644
+--- a/linux-user/mmap-fixed.h
++++ b/linux-user/mmap-fixed.h
+@@ -26,6 +26,10 @@
+ #ifndef MMAP_FIXED_H
+ #define MMAP_FIXED_H
+ 
++#ifndef MAP_SHARED_VALIDATE
++#define MAP_SHARED_VALIDATE 0x03
++#endif
++
+ #ifndef MAP_FIXED_NOREPLACE
+ #define MAP_FIXED_NOREPLACE 0x100000
+ 
+-- 
+2.34.1
+
-- 
2.34.1


