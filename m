Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.216.1609972591985502114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GYjGGAzb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id q18so3831912wrn.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 14:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kTtG0vAV3EskEWJFNMgOwKJug6l/cG8M8Lly1kUoKDg=;
        b=GYjGGAzbb0kyrD77L7lbCKVAHs+g5R12eKak/SyMTMZjfh5WXS5qHhQHgn5b5qewu/
         9ySY1vvN1G8R1qWbF2z3zImfY1PJvR2U3tNAyv9WkRag1EO5we9ZSw6fvv1QoAXxmhy/
         klkMF00WyihUA+6Zkkj7ngGulBmZ4HSE/FXpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kTtG0vAV3EskEWJFNMgOwKJug6l/cG8M8Lly1kUoKDg=;
        b=amvwq0mHfLqL8lw9UFAYDDkOKiClfNl0CILIZZwkMbTB0dKMEtj++DX0ch1vOKOkD+
         4Ktd252vgKUQGjrMJllfYeFJo4Hc/J5eL/OLXLqb9D3isOaWatCo0l5Hn28CK+NP7MJG
         8JYuRDsx/kmii6tksk4qDcjEpAT+QY6r5aYmFHlkaBsNdeSXXY83ErqUSEAUWktxxZkH
         7Smxpubx3M4YSgg/gx3+R1MdOO8P6SiL9mQtEuJshsBXPtOQ0wHZS6zjWhYbnAxtLa8k
         stXoauPnSSX+zWQ3VbZEqj5/eO5JkXLGWpZ22dGH8rbWrg0rGXegJl8EfrvdFCYF0k7P
         fIHA==
X-Gm-Message-State: AOAM530UL3b7tqdTj6Q+fB7lvsmZO5JXn5i+EaKd5cljiZFTaTMU5Xcq
	gyue788yXeKETidOGtbz3VaZvqvbY1NgVw==
X-Google-Smtp-Source: ABdhPJwhfnyFdhs1DZgyQvBX1kK0MTGfZ3INFLyjy7ayIR9mw1/0E+AqzFIY/NXn5cC0Aoob6bLQ2g==
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr6269675wrj.131.1609972590198;
        Wed, 06 Jan 2021 14:36:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id o8sm4765510wrm.17.2021.01.06.14.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 14:36:29 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] qemu: Drop vm reservation changes to resolve build issues
Date: Wed,  6 Jan 2021 22:36:27 +0000
Message-Id: <20210106223628.561432-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
References: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building with the new version of qemu we see errors like:

"""
qemu-i386: Unable to reserve 0x7ffff000 bytes of virtual address space at
0x1000 (Success) for use as guest address space (check your virtual memory
ulimit setting, min_mmap_addr or reserve less using -R option)

ERROR: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed
"""

The VM reseration patches we're carrying look suspicious in this context.
Drop them since we don't appear to be seeing those issues any more on the
autobuilder and I suspect the patches have become broken and a liability.
webkitgtk builds seem to be ok now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 -
 ...webkitgtk-hangs-on-32-bit-x86-target.patch |  33 -----
 .../qemu/qemu/0009-Fix-webkitgtk-builds.patch | 137 ------------------
 3 files changed, 172 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 23d0adb901a..4c1502da7f1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -23,8 +23,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0004-qemu-disable-Valgrind.patch \
            file://0006-chardev-connect-socket-to-a-spawned-command.patch \
            file://0007-apic-fixup-fallthrough-to-PIC.patch \
-           file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
-           file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0001-Add-enable-disable-udev.patch \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
deleted file mode 100644
index 74621a08e80..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From cf8c9aac5243f506a1a3e8e284414f311cde04f5 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Wed, 17 Jan 2018 10:51:49 -0800
-Subject: [PATCH] linux-user: Fix webkitgtk hangs on 32-bit x86 target
-
-Since commit "linux-user: Tidy and enforce reserved_va initialization"
-(18e80c55bb6ec17c05ec0ba717ec83933c2bfc07) the Yocto webkitgtk build
-hangs when cross compiling for 32-bit x86 on a 64-bit x86 machine using
-musl.
-
-To fix the issue reduce the MAX_RESERVED_VA macro to be a closer match
-to what it was before the problematic commit.
-
-Upstream-Status: Submitted http://lists.gnu.org/archive/html/qemu-devel/2018-01/msg04185.html
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
-
----
- linux-user/main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: qemu-5.2.0/linux-user/main.c
-===================================================================
---- qemu-5.2.0.orig/linux-user/main.c
-+++ qemu-5.2.0/linux-user/main.c
-@@ -92,7 +92,7 @@ static int last_log_mask;
-       (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
- /* There are a number of places where we assign reserved_va to a variable
-    of type abi_ulong and expect it to fit.  Avoid the last page.  */
--#   define MAX_RESERVED_VA(CPU)  (0xfffffffful & TARGET_PAGE_MASK)
-+#   define MAX_RESERVED_VA(CPU)  (0x7ffffffful & TARGET_PAGE_MASK)
- #  else
- #   define MAX_RESERVED_VA(CPU)  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
- #  endif
diff --git a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
deleted file mode 100644
index 2ddc09966c4..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 815c97ba0de02da9dace3fcfcbdf9b20e029f0d7 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@lge.com>
-Date: Fri, 1 Jun 2018 08:41:07 +0000
-Subject: [PATCH] Fix webkitgtk builds
-
-This is a partial revert of "linux-user: fix mmap/munmap/mprotect/mremap/shmat".
-
-This patch fixes qemu-i386 hangs during gobject-introspection in webkitgtk build
-when musl is used on qemux86. This is the same issue that
-0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch was
-fixing in the 2.11 release.
-
-This patch also fixes a build failure when building webkitgtk for
-qemumips. A QEMU assert is seen while building webkitgtk:
-page_check_range: Assertion `start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS)' failed.
-
-This reverts commit ebf9a3630c911d0cfc9c20f7cafe9ba4f88cf583.
-
-Upstream-Status: Pending
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
-[update patch context]
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- include/exec/cpu-all.h  |  6 +-----
- include/exec/cpu_ldst.h |  5 ++++-
- linux-user/mmap.c       | 17 ++++-------------
- linux-user/syscall.c    |  5 +----
- 4 files changed, 10 insertions(+), 23 deletions(-)
-
-Index: qemu-5.2.0/include/exec/cpu-all.h
-===================================================================
---- qemu-5.2.0.orig/include/exec/cpu-all.h
-+++ qemu-5.2.0/include/exec/cpu-all.h
-@@ -176,11 +176,8 @@ extern unsigned long reserved_va;
-  * avoid setting bits at the top of guest addresses that might need
-  * to be used for tags.
-  */
--#define GUEST_ADDR_MAX_                                                 \
--    ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
--     UINT32_MAX : ~0ul)
--#define GUEST_ADDR_MAX    (reserved_va ? reserved_va - 1 : GUEST_ADDR_MAX_)
--
-+#define GUEST_ADDR_MAX (reserved_va ? reserved_va : \
-+                                     (1ul << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
- #else
- 
- #include "exec/hwaddr.h"
-Index: qemu-5.2.0/include/exec/cpu_ldst.h
-===================================================================
---- qemu-5.2.0.orig/include/exec/cpu_ldst.h
-+++ qemu-5.2.0/include/exec/cpu_ldst.h
-@@ -75,7 +75,10 @@ typedef uint64_t abi_ptr;
- #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
- #define guest_addr_valid(x) (1)
- #else
--#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
-+#define guest_addr_valid(x) ({ \
-+    ((x) < (1ul << TARGET_VIRT_ADDR_SPACE_BITS)) && \
-+    (!reserved_va || ((x) < reserved_va)); \
-+})
- #endif
- #define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
- 
-Index: qemu-5.2.0/linux-user/mmap.c
-===================================================================
---- qemu-5.2.0.orig/linux-user/mmap.c
-+++ qemu-5.2.0/linux-user/mmap.c
-@@ -119,7 +119,7 @@ int target_mprotect(abi_ulong start, abi
-     }
-     len = TARGET_PAGE_ALIGN(len);
-     end = start + len;
--    if (!guest_range_valid(start, len)) {
-+    if (end < start) {
-         return -TARGET_ENOMEM;
-     }
-     if (len == 0) {
-@@ -527,8 +527,8 @@ abi_long target_mmap(abi_ulong start, ab
-          * It can fail only on 64-bit host with 32-bit target.
-          * On any other target/host host mmap() handles this error correctly.
-          */
--        if (end < start || !guest_range_valid(start, len)) {
--            errno = ENOMEM;
-+        if (end < start || ((unsigned long)start + len - 1 > (abi_ulong) -1)) {
-+            errno = EINVAL;
-             goto fail;
-         }
- 
-@@ -664,10 +664,8 @@ int target_munmap(abi_ulong start, abi_u
-     if (start & ~TARGET_PAGE_MASK)
-         return -TARGET_EINVAL;
-     len = TARGET_PAGE_ALIGN(len);
--    if (len == 0 || !guest_range_valid(start, len)) {
-+    if (len == 0)
-         return -TARGET_EINVAL;
--    }
--
-     mmap_lock();
-     end = start + len;
-     real_start = start & qemu_host_page_mask;
-@@ -722,13 +720,6 @@ abi_long target_mremap(abi_ulong old_add
-     int prot;
-     void *host_addr;
- 
--    if (!guest_range_valid(old_addr, old_size) ||
--        ((flags & MREMAP_FIXED) &&
--         !guest_range_valid(new_addr, new_size))) {
--        errno = ENOMEM;
--        return -1;
--    }
--
-     mmap_lock();
- 
-     if (flags & MREMAP_FIXED) {
-Index: qemu-5.2.0/linux-user/syscall.c
-===================================================================
---- qemu-5.2.0.orig/linux-user/syscall.c
-+++ qemu-5.2.0/linux-user/syscall.c
-@@ -4590,9 +4590,6 @@ static inline abi_ulong do_shmat(CPUArch
-             return -TARGET_EINVAL;
-         }
-     }
--    if (!guest_range_valid(shmaddr, shm_info.shm_segsz)) {
--        return -TARGET_EINVAL;
--    }
- 
-     mmap_lock();
- 
-@@ -7790,7 +7787,7 @@ static int open_self_maps(void *cpu_env,
-             const char *path;
- 
-             max = h2g_valid(max - 1) ?
--                max : (uintptr_t) g2h(GUEST_ADDR_MAX) + 1;
-+                max : (uintptr_t) g2h(GUEST_ADDR_MAX);
- 
-             if (page_check_range(h2g(min), max - min, flags) == -1) {
-                 continue;
-- 
2.27.0

