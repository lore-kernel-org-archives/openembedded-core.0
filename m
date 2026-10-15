Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E168ECC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32848.1792040651568378917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fn6OwRMG;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so45975615e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040650; x=1792645450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/E+9PGS7p6M/GA8sNJgyj2KOv/LpTLbQRy5ibDLtb5k=;
        b=fn6OwRMGSw/43HhDooWv2nn62P1u1dhvWpG+oSY3X9so/A8ax6a0qr+AxVfgAzw+Ff
         /22TUjlk4J1o3XdjRwFAHWv19ikDu/Q+H4gupE+hM797C8bc/Co4y35dcpLqwxl8jAYI
         IL5Kbo6K6vGX+YVinP0SaceQ2CbClVMsU7SXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040650; x=1792645450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/E+9PGS7p6M/GA8sNJgyj2KOv/LpTLbQRy5ibDLtb5k=;
        b=W/oVY09HQaTW/hfjIKctw+M4ktMbAuhgnD/jMdviVm0tCKwMJPC7QbzT8YemeoY9MO
         VdLcS2PGd5NT4uSr2n+PPhxhzgNdQgyRivEGgONJb3tvjy8t9GDzbSf7f3fc55nuhYAI
         fYDaDEZmYGDyj+XTSsA4lN3zJVyVmqgoNFIXN4Te8skzi7yZ9tC6MVFcIMhZQW8dh9jm
         ma2kDKJ4xIWxm3nVMbbtFbXTdAtrUcSDJInI5r5vvkP4Ifn0N71N8yOzEedCGaLvJTPW
         KdU4C9iMD8yRBkt9UfLoj8wc6QR+ST64WvuFcN2ujGPbr5juA4mwLw1wRLv9cSp8+t/i
         TkMQ==
X-Gm-Message-State: AFq9FYIDT1VMRtsZQAh5IZe9BrNDHIRzyf+SDagvv+e+GZoFkXIJNCld
	3KbwYXE+nqE/kxeTbj10XRfXegKnLAU1hBHfxUyU+FXx1oEblyMionVaL+CmbPFBkWjNBx+BlKP
	9MJDrzB4=
X-Gm-Gg: AYBFou1S9JW4cxPyvDk0h7ePgi1J4xvdo0wJ+NiwoA0R/WYtTUk0d3kdeIXShmPqreM
	QcKz2eYxolXtkPEjX7ZA3F/HUR3Xy6wNym2jUHnZu8csR7TZE86tUkry3SWQz+f3BS84DzQloVh
	BFdXyoZKFxwwkb3xZYhEAIum7n953WDuF0OfDYSWUxrVkP2P7YT5grFIyiDkH2PKrtmm43iJsvV
	SI6t0142IkgkVHUAhBMqz/5PwV1AOGjpbkw91csutouQv+mOPKlXAqcdyQQIXKjlVxuPCU6pXTo
	6fZ5FFiC3sDc4ODSHEvLN7jHl3Ym5RdA8gkAx6RjwgP31Cr0z/P92rACodpY1zru3OLvb0yCULV
	mwWQSM7Lw8rk5BLbD0UmOI7k0YYQeNXdzLL5lbLlT+gGf7KV0zV5cGIEjUbJVjTBFI16LkU+Cg1
	d5YTLT6WbnABzk/t4Ao2eLItR8Numontk3wHhI97wUw/OPwttVOESMsxWqnbaVLBpKFOu3hQgcX
	VooxDf/5T6BrUJc3MlXjekppisbMMYYtPK8BBQDFyQ6c10g9pfFc6PO8e54qLHx5VZSQ5t5YA==
X-Received: by 2002:a05:600c:46cf:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a18e47ad5fmr391992755e9.10.1792040649577;
        Wed, 14 Oct 2026 22:04:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 45/55] qemu: restore 64-bit file lock handling for 32-bit guests
Date: Thu, 15 Oct 2026 07:03:08 +0200
Message-ID: <81c4b64e499d4f90ed0d76ec9fbe05b75f9ec74d.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247843

From: Babanpreet Singh <bbnpreetsingh@gmail.com>

0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch removes the
TARGET_F_GETLK64, TARGET_F_SETLK64 and TARGET_F_SETLKW64 cases from
target_to_host_fcntl_cmd(), along with the struct target_flock64
conversions. So every 32-bit guest calling fcntl64() to lock a file gets -TARGET_EINVAL.

[YOCTO #16326]

AI-Generated: Uses Claude (claude-fable-5-1)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
Reviewed-by: Daniel R. Slater <daniel.slater@thermofisher.com>
Tested-by: Daniel R. Slater <daniel.slater@thermofisher.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 ...all.c-drop-64-suffix-from-flock64-Co.patch | 225 +++++++++++
 ...ce-use-of-lfs64-related-functions-an.patch | 355 ------------------
 ...-eliminate-other-explicit-LFS-usages.patch | 107 ++++++
 4 files changed, 334 insertions(+), 356 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-linux-user-syscall.c-eliminate-other-explicit-LFS-usages.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 46cc7cb5cb0..1f510cbcb98 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,7 +30,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
-           file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
+           file://0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch \
+           file://0002-linux-user-syscall.c-eliminate-other-explicit-LFS-usages.patch \
            file://fixedmeson.patch \
            file://no-pip.patch \
            file://4a8579ad8629b57a43daa62e46cc7af6e1078116.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch
new file mode 100644
index 00000000000..6ebe2b895db
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch
@@ -0,0 +1,225 @@
+From ac1bbe8ca46c550b3ad99c85744119a3ace7b4f4 Mon Sep 17 00:00:00 2001
+From: Michael Tokarev <mjt@tls.msk.ru>
+Date: Thu, 29 Aug 2024 09:39:50 +0300
+Subject: [PATCH] linux-user/syscall.c: drop 64 suffix from flock64 &Co
+
+Since we are always building with LFS enabled, in particular
+with -D_FILE_OFFSET_BITS=64, we should always have struct flock
+mapped to the 64bit variant (with off64_t), and F_GETLK mapped
+to F_GETLK64 etc, automatically.
+
+So there should be no need to explicitly use the "64" suffix
+for these things anymore.
+
+Also fix a misleading comment near safe_fcntl telling us to
+always use flock64 (since v2.6.0-1311-g435da5e7092a "linux-user:
+Use safe_syscall wrapper for fcntl").
+
+Reference: https://gitlab.com/qemu-project/qemu/-/issues/2215
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/ac1bbe8ca46c550b3ad99c85744119a3ace7b4f4]
+---
+ linux-user/syscall.c | 92 ++++++++++++++++++++--------------------------------
+ 1 file changed, 40 insertions(+), 52 deletions(-)
+
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -758,10 +758,8 @@
+  * the libc function.
+  */
+ #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
+-/* Similarly for fcntl. Note that callers must always:
+- *  pass the F_GETLK64 etc constants rather than the unsuffixed F_GETLK
+- *  use the flock64 struct rather than unsuffixed flock
+- * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
++/* Similarly for fcntl. Since we always build with LFS enabled,
++ * we should be using the 64-bit structures automatically.
+  */
+ #ifdef __NR_fcntl64
+ #define safe_fcntl(...) safe_syscall(__NR_fcntl64, __VA_ARGS__)
+@@ -6720,13 +6718,13 @@
+         ret = cmd;
+         break;
+     case TARGET_F_GETLK:
+-        ret = F_GETLK64;
++        ret = F_GETLK;
+         break;
+     case TARGET_F_SETLK:
+-        ret = F_SETLK64;
++        ret = F_SETLK;
+         break;
+     case TARGET_F_SETLKW:
+-        ret = F_SETLKW64;
++        ret = F_SETLKW;
+         break;
+     case TARGET_F_GETOWN:
+         ret = F_GETOWN;
+@@ -6742,13 +6740,13 @@
+         break;
+ #if TARGET_ABI_BITS == 32
+     case TARGET_F_GETLK64:
+-        ret = F_GETLK64;
++        ret = F_GETLK;
+         break;
+     case TARGET_F_SETLK64:
+-        ret = F_SETLK64;
++        ret = F_SETLK;
+         break;
+     case TARGET_F_SETLKW64:
+-        ret = F_SETLKW64;
++        ret = F_SETLKW;
+         break;
+ #endif
+     case TARGET_F_SETLEASE:
+@@ -6802,8 +6800,8 @@
+      * them to 5, 6 and 7 before making the syscall(). Since we make the
+      * syscall directly, adjust to what is supported by the kernel.
+      */
+-    if (ret >= F_GETLK64 && ret <= F_SETLKW64) {
+-        ret -= F_GETLK64 - 5;
++    if (ret >= F_GETLK && ret <= F_SETLKW) {
++        ret -= F_GETLK - 5;
+     }
+ #endif
+ 
+@@ -6836,7 +6834,7 @@
+     return type;
+ }
+ 
+-static inline abi_long copy_from_user_flock(struct flock64 *fl,
++static inline abi_long copy_from_user_flock(struct flock *fl,
+                                             abi_ulong target_flock_addr)
+ {
+     struct target_flock *target_fl;
+@@ -6861,7 +6859,7 @@
+ }
+ 
+ static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
+-                                          const struct flock64 *fl)
++                                          const struct flock *fl)
+ {
+     struct target_flock *target_fl;
+     short l_type;
+@@ -6880,8 +6878,8 @@
+     return 0;
+ }
+ 
+-typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
+-typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
++typedef abi_long from_flock64_fn(struct flock *fl, abi_ulong target_addr);
++typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock *fl);
+ 
+ #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
+ struct target_oabi_flock64 {
+@@ -6892,7 +6890,7 @@
+     abi_int   l_pid;
+ } QEMU_PACKED;
+ 
+-static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
++static inline abi_long copy_from_user_oabi_flock64(struct flock *fl,
+                                                    abi_ulong target_flock_addr)
+ {
+     struct target_oabi_flock64 *target_fl;
+@@ -6917,7 +6915,7 @@
+ }
+ 
+ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
+-                                                 const struct flock64 *fl)
++                                                 const struct flock *fl)
+ {
+     struct target_oabi_flock64 *target_fl;
+     short l_type;
+@@ -6937,7 +6935,7 @@
+ }
+ #endif
+ 
+-static inline abi_long copy_from_user_flock64(struct flock64 *fl,
++static inline abi_long copy_from_user_flock64(struct flock *fl,
+                                               abi_ulong target_flock_addr)
+ {
+     struct target_flock64 *target_fl;
+@@ -6962,7 +6960,7 @@
+ }
+ 
+ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
+-                                            const struct flock64 *fl)
++                                            const struct flock *fl)
+ {
+     struct target_flock64 *target_fl;
+     short l_type;
+@@ -6983,7 +6981,7 @@
+ 
+ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+ {
+-    struct flock64 fl64;
++    struct flock fl;
+ #ifdef F_GETOWN_EX
+     struct f_owner_ex fox;
+     struct target_f_owner_ex *target_fox;
+@@ -6996,45 +6994,45 @@
+ 
+     switch(cmd) {
+     case TARGET_F_GETLK:
+-        ret = copy_from_user_flock(&fl64, arg);
++        ret = copy_from_user_flock(&fl, arg);
+         if (ret) {
+             return ret;
+         }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
++        ret = get_errno(safe_fcntl(fd, host_cmd, &fl));
+         if (ret == 0) {
+-            ret = copy_to_user_flock(arg, &fl64);
++            ret = copy_to_user_flock(arg, &fl);
+         }
+         break;
+ 
+     case TARGET_F_SETLK:
+     case TARGET_F_SETLKW:
+-        ret = copy_from_user_flock(&fl64, arg);
++        ret = copy_from_user_flock(&fl, arg);
+         if (ret) {
+             return ret;
+         }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
++        ret = get_errno(safe_fcntl(fd, host_cmd, &fl));
+         break;
+ 
+     case TARGET_F_GETLK64:
+     case TARGET_F_OFD_GETLK:
+-        ret = copy_from_user_flock64(&fl64, arg);
++        ret = copy_from_user_flock64(&fl, arg);
+         if (ret) {
+             return ret;
+         }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
++        ret = get_errno(safe_fcntl(fd, host_cmd, &fl));
+         if (ret == 0) {
+-            ret = copy_to_user_flock64(arg, &fl64);
++            ret = copy_to_user_flock64(arg, &fl);
+         }
+         break;
+     case TARGET_F_SETLK64:
+     case TARGET_F_SETLKW64:
+     case TARGET_F_OFD_SETLK:
+     case TARGET_F_OFD_SETLKW:
+-        ret = copy_from_user_flock64(&fl64, arg);
++        ret = copy_from_user_flock64(&fl, arg);
+         if (ret) {
+             return ret;
+         }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
++        ret = get_errno(safe_fcntl(fd, host_cmd, &fl));
+         break;
+ 
+     case TARGET_F_GETFL:
+@@ -12301,7 +12299,7 @@
+     case TARGET_NR_fcntl64:
+     {
+         int cmd;
+-        struct flock64 fl;
++        struct flock fl;
+         from_flock64_fn *copyfrom = copy_from_user_flock64;
+         to_flock64_fn *copyto = copy_to_user_flock64;
+ 
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
deleted file mode 100644
index ceae67be644..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ /dev/null
@@ -1,355 +0,0 @@
-From 71f14902256e3c3529710b713e1ea43100bf4c40 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Dec 2022 08:37:46 -0800
-Subject: [PATCH 2/2] linux-user: Replace use of lfs64 related functions and
- macros
-
-Builds defines -D_FILE_OFFSET_BITS=64 which makes the original functions
-anf macros behave same as their 64 suffixed counterparts. This also
-helps in compiling with latest musl C library, where these macros and
-functions are no more available under _GNU_SOURCE feature macro
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg02841.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Laurent Vivier <laurent@vivier.eu>
----
- linux-user/syscall.c | 153 +++++++++++--------------------------------
- 1 file changed, 39 insertions(+), 114 deletions(-)
-
-Index: qemu-8.0.0/linux-user/syscall.c
-===================================================================
---- qemu-8.0.0.orig/linux-user/syscall.c
-+++ qemu-8.0.0/linux-user/syscall.c
-@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range,
-  */
- #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
- /* Similarly for fcntl. Note that callers must always:
-- *  pass the F_GETLK64 etc constants rather than the unsuffixed F_GETLK
-- *  use the flock64 struct rather than unsuffixed flock
-+ *  pass the F_GETLK etc constants rather than the unsuffixed F_GETLK
-+ *  use the flock struct rather than unsuffixed flock
-  * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
-  */
- #ifdef __NR_fcntl64
-@@ -6813,13 +6813,13 @@ static int target_to_host_fcntl_cmd(int
-         ret = cmd;
-         break;
-     case TARGET_F_GETLK:
--        ret = F_GETLK64;
-+        ret = F_GETLK;
-         break;
-     case TARGET_F_SETLK:
--        ret = F_SETLK64;
-+        ret = F_SETLK;
-         break;
-     case TARGET_F_SETLKW:
--        ret = F_SETLKW64;
-+        ret = F_SETLKW;
-         break;
-     case TARGET_F_GETOWN:
-         ret = F_GETOWN;
-@@ -6833,17 +6833,6 @@ static int target_to_host_fcntl_cmd(int
-     case TARGET_F_SETSIG:
-         ret = F_SETSIG;
-         break;
--#if TARGET_ABI_BITS == 32
--    case TARGET_F_GETLK64:
--        ret = F_GETLK64;
--        break;
--    case TARGET_F_SETLK64:
--        ret = F_SETLK64;
--        break;
--    case TARGET_F_SETLKW64:
--        ret = F_SETLKW64;
--        break;
--#endif
-     case TARGET_F_SETLEASE:
-         ret = F_SETLEASE;
-         break;
-@@ -6895,8 +6884,8 @@ static int target_to_host_fcntl_cmd(int
-      * them to 5, 6 and 7 before making the syscall(). Since we make the
-      * syscall directly, adjust to what is supported by the kernel.
-      */
--    if (ret >= F_GETLK64 && ret <= F_SETLKW64) {
--        ret -= F_GETLK64 - 5;
-+    if (ret >= F_GETLK && ret <= F_SETLKW) {
-+        ret -= F_GETLK - 5;
-     }
- #endif
- 
-@@ -6929,55 +6918,11 @@ static int host_to_target_flock(int type
-     return type;
- }
- 
--static inline abi_long copy_from_user_flock(struct flock64 *fl,
--                                            abi_ulong target_flock_addr)
--{
--    struct target_flock *target_fl;
--    int l_type;
--
--    if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
--        return -TARGET_EFAULT;
--    }
--
--    __get_user(l_type, &target_fl->l_type);
--    l_type = target_to_host_flock(l_type);
--    if (l_type < 0) {
--        return l_type;
--    }
--    fl->l_type = l_type;
--    __get_user(fl->l_whence, &target_fl->l_whence);
--    __get_user(fl->l_start, &target_fl->l_start);
--    __get_user(fl->l_len, &target_fl->l_len);
--    __get_user(fl->l_pid, &target_fl->l_pid);
--    unlock_user_struct(target_fl, target_flock_addr, 0);
--    return 0;
--}
--
--static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
--                                          const struct flock64 *fl)
--{
--    struct target_flock *target_fl;
--    short l_type;
--
--    if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
--        return -TARGET_EFAULT;
--    }
--
--    l_type = host_to_target_flock(fl->l_type);
--    __put_user(l_type, &target_fl->l_type);
--    __put_user(fl->l_whence, &target_fl->l_whence);
--    __put_user(fl->l_start, &target_fl->l_start);
--    __put_user(fl->l_len, &target_fl->l_len);
--    __put_user(fl->l_pid, &target_fl->l_pid);
--    unlock_user_struct(target_fl, target_flock_addr, 1);
--    return 0;
--}
--
--typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
--typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
-+typedef abi_long from_flock_fn(struct flock *fl, abi_ulong target_addr);
-+typedef abi_long to_flock_fn(abi_ulong target_addr, const struct flock *fl);
- 
- #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
--struct target_oabi_flock64 {
-+struct target_oabi_flock {
-     abi_short l_type;
-     abi_short l_whence;
-     abi_llong l_start;
-@@ -6985,10 +6930,10 @@ struct target_oabi_flock64 {
-     abi_int   l_pid;
- } QEMU_PACKED;
- 
--static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
-+static inline abi_long copy_from_user_oabi_flock(struct flock *fl,
-                                                    abi_ulong target_flock_addr)
- {
--    struct target_oabi_flock64 *target_fl;
-+    struct target_oabi_flock *target_fl;
-     int l_type;
- 
-     if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7009,10 +6954,10 @@ static inline abi_long copy_from_user_oa
-     return 0;
- }
- 
--static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
--                                                 const struct flock64 *fl)
-+static inline abi_long copy_to_user_oabi_flock(abi_ulong target_flock_addr,
-+                                                 const struct flock *fl)
- {
--    struct target_oabi_flock64 *target_fl;
-+    struct target_oabi_flock *target_fl;
-     short l_type;
- 
-     if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7030,10 +6975,10 @@ static inline abi_long copy_to_user_oabi
- }
- #endif
- 
--static inline abi_long copy_from_user_flock64(struct flock64 *fl,
-+static inline abi_long copy_from_user_flock(struct flock *fl,
-                                               abi_ulong target_flock_addr)
- {
--    struct target_flock64 *target_fl;
-+    struct target_flock *target_fl;
-     int l_type;
- 
-     if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7054,10 +6999,10 @@ static inline abi_long copy_from_user_fl
-     return 0;
- }
- 
--static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
--                                            const struct flock64 *fl)
-+static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
-+                                            const struct flock *fl)
- {
--    struct target_flock64 *target_fl;
-+    struct target_flock *target_fl;
-     short l_type;
- 
-     if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7076,7 +7021,7 @@ static inline abi_long copy_to_user_floc
- 
- static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
- {
--    struct flock64 fl64;
-+    struct flock fl64;
- #ifdef F_GETOWN_EX
-     struct f_owner_ex fox;
-     struct target_f_owner_ex *target_fox;
-@@ -7089,6 +7034,7 @@ static abi_long do_fcntl(int fd, int cmd
- 
-     switch(cmd) {
-     case TARGET_F_GETLK:
-+    case TARGET_F_OFD_GETLK:
-         ret = copy_from_user_flock(&fl64, arg);
-         if (ret) {
-             return ret;
-@@ -7098,32 +7044,11 @@ static abi_long do_fcntl(int fd, int cmd
-             ret = copy_to_user_flock(arg, &fl64);
-         }
-         break;
--
-     case TARGET_F_SETLK:
-     case TARGET_F_SETLKW:
--        ret = copy_from_user_flock(&fl64, arg);
--        if (ret) {
--            return ret;
--        }
--        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
--        break;
--
--    case TARGET_F_GETLK64:
--    case TARGET_F_OFD_GETLK:
--        ret = copy_from_user_flock64(&fl64, arg);
--        if (ret) {
--            return ret;
--        }
--        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
--        if (ret == 0) {
--            ret = copy_to_user_flock64(arg, &fl64);
--        }
--        break;
--    case TARGET_F_SETLK64:
--    case TARGET_F_SETLKW64:
-     case TARGET_F_OFD_SETLK:
-     case TARGET_F_OFD_SETLKW:
--        ret = copy_from_user_flock64(&fl64, arg);
-+        ret = copy_from_user_flock(&fl64, arg);
-         if (ret) {
-             return ret;
-         }
-@@ -7348,7 +7273,7 @@ static inline abi_long target_truncate64
-         arg2 = arg3;
-         arg3 = arg4;
-     }
--    return get_errno(truncate64(arg1, target_offset64(arg2, arg3)));
-+    return get_errno(truncate(arg1, target_offset64(arg2, arg3)));
- }
- #endif
- 
-@@ -7362,7 +7287,7 @@ static inline abi_long target_ftruncate6
-         arg2 = arg3;
-         arg3 = arg4;
-     }
--    return get_errno(ftruncate64(arg1, target_offset64(arg2, arg3)));
-+    return get_errno(ftruncate(arg1, target_offset64(arg2, arg3)));
- }
- #endif
- 
-@@ -8598,7 +8523,7 @@ static int do_getdents(abi_long dirfd, a
-     void *tdirp;
-     int hlen, hoff, toff;
-     int hreclen, treclen;
--    off64_t prev_diroff = 0;
-+    off_t prev_diroff = 0;
- 
-     hdirp = g_try_malloc(count);
-     if (!hdirp) {
-@@ -8651,7 +8576,7 @@ static int do_getdents(abi_long dirfd, a
-              * Return what we have, resetting the file pointer to the
-              * location of the first record not returned.
-              */
--            lseek64(dirfd, prev_diroff, SEEK_SET);
-+            lseek(dirfd, prev_diroff, SEEK_SET);
-             break;
-         }
- 
-@@ -8685,7 +8610,7 @@ static int do_getdents64(abi_long dirfd,
-     void *tdirp;
-     int hlen, hoff, toff;
-     int hreclen, treclen;
--    off64_t prev_diroff = 0;
-+    off_t prev_diroff = 0;
- 
-     hdirp = g_try_malloc(count);
-     if (!hdirp) {
-@@ -8727,7 +8652,7 @@ static int do_getdents64(abi_long dirfd,
-              * Return what we have, resetting the file pointer to the
-              * location of the first record not returned.
-              */
--            lseek64(dirfd, prev_diroff, SEEK_SET);
-+            lseek(dirfd, prev_diroff, SEEK_SET);
-             break;
-         }
- 
-@@ -11158,7 +11083,7 @@ static abi_long do_syscall1(CPUArchState
-                 return -TARGET_EFAULT;
-             }
-         }
--        ret = get_errno(pread64(arg1, p, arg3, target_offset64(arg4, arg5)));
-+        ret = get_errno(pread(arg1, p, arg3, target_offset64(arg4, arg5)));
-         unlock_user(p, arg2, ret);
-         return ret;
-     case TARGET_NR_pwrite64:
-@@ -11175,7 +11100,7 @@ static abi_long do_syscall1(CPUArchState
-                 return -TARGET_EFAULT;
-             }
-         }
--        ret = get_errno(pwrite64(arg1, p, arg3, target_offset64(arg4, arg5)));
-+        ret = get_errno(pwrite(arg1, p, arg3, target_offset64(arg4, arg5)));
-         unlock_user(p, arg2, 0);
-         return ret;
- #endif
-@@ -11998,14 +11923,14 @@ static abi_long do_syscall1(CPUArchState
-     case TARGET_NR_fcntl64:
-     {
-         int cmd;
--        struct flock64 fl;
--        from_flock64_fn *copyfrom = copy_from_user_flock64;
--        to_flock64_fn *copyto = copy_to_user_flock64;
-+        struct flock fl;
-+        from_flock_fn *copyfrom = copy_from_user_flock;
-+        to_flock_fn *copyto = copy_to_user_flock;
- 
- #ifdef TARGET_ARM
-         if (!cpu_env->eabi) {
--            copyfrom = copy_from_user_oabi_flock64;
--            copyto = copy_to_user_oabi_flock64;
-+            copyfrom = copy_from_user_oabi_flock;
-+            copyto = copy_to_user_oabi_flock;
-         }
- #endif
- 
-@@ -12015,7 +11940,7 @@ static abi_long do_syscall1(CPUArchState
-         }
- 
-         switch(arg2) {
--        case TARGET_F_GETLK64:
-+        case TARGET_F_GETLK:
-             ret = copyfrom(&fl, arg3);
-             if (ret) {
-                 break;
-@@ -12026,8 +11951,8 @@ static abi_long do_syscall1(CPUArchState
-             }
- 	    break;
- 
--        case TARGET_F_SETLK64:
--        case TARGET_F_SETLKW64:
-+        case TARGET_F_SETLK:
-+        case TARGET_F_SETLKW:
-             ret = copyfrom(&fl, arg3);
-             if (ret) {
-                 break;
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-syscall.c-eliminate-other-explicit-LFS-usages.patch b/meta/recipes-devtools/qemu/qemu/0002-linux-user-syscall.c-eliminate-other-explicit-LFS-usages.patch
new file mode 100644
index 00000000000..435ce519464
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-linux-user-syscall.c-eliminate-other-explicit-LFS-usages.patch
@@ -0,0 +1,107 @@
+From 99174ce39e86ec6aea7bb7ce326b16e3eed9e3da Mon Sep 17 00:00:00 2001
+From: Michael Tokarev <mjt@tls.msk.ru>
+Date: Thu, 29 Aug 2024 09:59:51 +0300
+Subject: [PATCH] linux-user/syscall.c: eliminate other explicit LFS usages
+
+Since we alwasy build with LFS enabled, and with -D_FILE_OFFSET_BITS=64
+in particular, there is no need to use 64bit versions of various system
+calls and constants, regular ones will do just fine.  Eliminate a few
+last uses of the following constructs in linux-user/syscall.c:
+  off64_t
+  ftruncate64()
+  lseek64()
+  pread64()
+  pwrite64()
+
+This way it can be built on systems where the 64bit variants of
+everything is not defined (since the system always uses 64bit
+variants), such as on recent MUSL.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2215
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/99174ce39e86ec6aea7bb7ce326b16e3eed9e3da]
+---
+ linux-user/syscall.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 48c459e515..a666986189 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -7265,7 +7265,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
+         arg2 = arg3;
+         arg3 = arg4;
+     }
+-    return get_errno(truncate64(arg1, target_offset64(arg2, arg3)));
++    return get_errno(truncate(arg1, target_offset64(arg2, arg3)));
+ }
+ #endif
+ 
+@@ -7279,7 +7279,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
+         arg2 = arg3;
+         arg3 = arg4;
+     }
+-    return get_errno(ftruncate64(arg1, target_offset64(arg2, arg3)));
++    return get_errno(ftruncate(arg1, target_offset64(arg2, arg3)));
+ }
+ #endif
+ 
+@@ -8664,7 +8664,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+     void *tdirp;
+     int hlen, hoff, toff;
+     int hreclen, treclen;
+-    off64_t prev_diroff = 0;
++    off_t prev_diroff = 0;
+ 
+     hdirp = g_try_malloc(count);
+     if (!hdirp) {
+@@ -8717,7 +8717,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+              * Return what we have, resetting the file pointer to the
+              * location of the first record not returned.
+              */
+-            lseek64(dirfd, prev_diroff, SEEK_SET);
++            lseek(dirfd, prev_diroff, SEEK_SET);
+             break;
+         }
+ 
+@@ -8751,7 +8751,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+     void *tdirp;
+     int hlen, hoff, toff;
+     int hreclen, treclen;
+-    off64_t prev_diroff = 0;
++    off_t prev_diroff = 0;
+ 
+     hdirp = g_try_malloc(count);
+     if (!hdirp) {
+@@ -8793,7 +8793,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+              * Return what we have, resetting the file pointer to the
+              * location of the first record not returned.
+              */
+-            lseek64(dirfd, prev_diroff, SEEK_SET);
++            lseek(dirfd, prev_diroff, SEEK_SET);
+             break;
+         }
+ 
+@@ -11524,7 +11524,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+                 return -TARGET_EFAULT;
+             }
+         }
+-        ret = get_errno(pread64(arg1, p, arg3, target_offset64(arg4, arg5)));
++        ret = get_errno(pread(arg1, p, arg3, target_offset64(arg4, arg5)));
+         unlock_user(p, arg2, ret);
+         return ret;
+     case TARGET_NR_pwrite64:
+@@ -11541,7 +11541,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+                 return -TARGET_EFAULT;
+             }
+         }
+-        ret = get_errno(pwrite64(arg1, p, arg3, target_offset64(arg4, arg5)));
++        ret = get_errno(pwrite(arg1, p, arg3, target_offset64(arg4, arg5)));
+         unlock_user(p, arg2, 0);
+         return ret;
+ #endif
+-- 
+2.43.0
+

