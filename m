Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45565E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 14:36:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.57975.1734359808536367794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 06:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VICNlnqv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361f796586so46994735e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 06:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734359806; x=1734964606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDvbqp0cAL2qHcQPSPGF9Or+EImLhxAjK/Miq57+MCg=;
        b=VICNlnqvB+njGIxThSghzbGxyzyhUO5397l+UIsixCvJj3AfIN97CWDrrhe+6hBkf2
         n4Wma38u528FN81aR2QpOLqNyWZZcWCVucveOTWUP0VJGoNaxLhoDRWW5m9BId4xe8e8
         sjerFXYm45D8w0hUMPBlKsxa5IUGfpB4YQkN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359806; x=1734964606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDvbqp0cAL2qHcQPSPGF9Or+EImLhxAjK/Miq57+MCg=;
        b=BwbbidXfgx1gyM7NXrB3QJnKuu2yAnRd5WivucawdOULpEGFM++D+C0hIPtMQYEuLl
         BFiSjFot7Gr2fPk0rNT0Au20C2qfDTckDu5a8bPPGTMfZC3LAsx4qhbu9LkWu09DGZc/
         syNFSjy+uuKZV5Kk5WFii/hQV4350o2CnlbVuSfgOp96HPWX4YHe0fkem5BZVTy/M2ds
         3Pj0cfPlhEy2LO6ewytevqE0JsYTIOMkrHqpS1lkUwqvrThPsbmPwCbYPkuhu2epODaM
         MyZDn8nmz3c1iN4/cOUgHS/UIngl8gxxlfBRi/lttLDtasOzEaUcjlgDUPyYIblpYtMQ
         Dlpg==
X-Gm-Message-State: AOJu0YyqWIugvYfxER3hshXGqnxpfGD0VhTv6nkZdJmP5HTbKsWOsEOg
	gmLkE8mmb3bJimtfkSkMmtx1Wu5a0zDxoQtDLpP+EDUabjhdSF3cX3zIS1CEGCLHOkdG9F7seh4
	5
X-Gm-Gg: ASbGncvLKja0lbgiAKABQp2zq56MAyCStvz4bSgaE46v9DMY6DqkxeZ7h4GyNZBrEyr
	pKartzK4Dd3j1N97bmW6tS/vLUdvjZjisdw/LwC3vUGNW+oEuWeIhKfQv+5iiIhte9jMTV0Ufey
	mLWW/uSknPtzEtreuSMbkYxY00u6LZbozGDwMg66gXpDdR7s1ZCKG23QBfbGDgOgsZlx95IvoUA
	0lQDoJCXdEUHTWu26dAHOjxWAch/GPg2fTNRzccElYPIHYm/t/jPj+HIJJwwOVW+xWe0qymnESy
	rjfADU8Y5Q==
X-Google-Smtp-Source: AGHT+IGtkWfuu6q+Jff4uI4rHP7zaT3tbaiEWGBqIr/+Hr4pFIh387cXAg16rmn4Z1iHdKBcd7xkgA==
X-Received: by 2002:a05:600c:4fc8:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-4362aa509ccmr129477985e9.18.1734359806300;
        Mon, 16 Dec 2024 06:36:46 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80163b8sm8191107f8f.35.2024.12.16.06.36.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:36:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] qemu: Upgrade 9.1.1 -> 9.2.0
Date: Mon, 16 Dec 2024 14:36:40 +0000
Message-ID: <20241216143643.1485197-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241216143643.1485197-1-richard.purdie@linuxfoundation.org>
References: <20241216143643.1485197-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208768

Drop two patches merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...u-native_9.1.1.bb => qemu-native_9.2.0.bb} |   0
 ...e_9.1.1.bb => qemu-system-native_9.2.0.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   4 +-
 ...o-riscv.c-fix-riscv64-build-on-musl-.patch |  41 --
 ...ce-use-of-lfs64-related-functions-an.patch | 354 ------------------
 .../qemu/{qemu_9.1.1.bb => qemu_9.2.0.bb}     |   0
 7 files changed, 2 insertions(+), 399 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.1.1.bb => qemu-native_9.2.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.1.1.bb => qemu-system-native_9.2.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
 rename meta/recipes-devtools/qemu/{qemu_9.1.1.bb => qemu_9.2.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 37621cb37d0..8ccef0a4d81 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.43%"
 GDBVERSION ?= "15.%"
 GLIBCVERSION ?= "2.40%"
 LINUXLIBCVERSION ?= "6.12%"
-QEMUVERSION ?= "9.1%"
+QEMUVERSION ?= "9.2%"
 GOVERSION ?= "1.22%"
 RUSTVERSION ?= "1.80%"
 
diff --git a/meta/recipes-devtools/qemu/qemu-native_9.1.1.bb b/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_9.1.1.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.1.1.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.1.1.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d4693fe8b03..d253529b3d8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,17 +29,15 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0006-qemu-Determinism-fixes.patch \
            file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
-           file://0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
            file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
-           file://0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "7dc0f9da5491ff449500f3310063a36b619f236ee45706fd0846eb37d4bba889"
+SRC_URI[sha256sum] = "f859f0bc65e1f533d040bbe8c92bcfecee5af2c921a6687c652fb44d089bd894"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch b/meta/recipes-devtools/qemu/qemu/0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch
deleted file mode 100644
index 16762e033eb..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f60ea4ae2298f0f077a97648c138283357337370 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Milan=20P=2E=20Stani=C4=87?= <mps@arvanta.net>
-Date: Thu, 5 Sep 2024 16:17:50 +0200
-Subject: [PATCH] util/util/cpuinfo-riscv.c: fix riscv64 build on musl libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-build fails on musl libc (alpine linux) with this error:
-
-../util/cpuinfo-riscv.c: In function 'cpuinfo_init':
-../util/cpuinfo-riscv.c:63:21: error: '__NR_riscv_hwprobe' undeclared (first use in this function); did you mean 'riscv_hwprobe'?
-   63 |         if (syscall(__NR_riscv_hwprobe, &pair, 1, 0, NULL, 0) == 0
-      |                     ^~~~~~~~~~~~~~~~~~
-      |                     riscv_hwprobe
-../util/cpuinfo-riscv.c:63:21: note: each undeclared identifier is reported only once for each function it appears in
-ninja: subcommand failed
-
-add '#include "asm/unistd.h"' to util/cpuinfo-riscv.c fixes build
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/c5757f808bd74db7ef1a90ee28334f3b5afb8179]
-Signed-off-by: Milan P. Stanić <mps@arvanta.net>
----
- util/cpuinfo-riscv.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/util/cpuinfo-riscv.c b/util/cpuinfo-riscv.c
-index 497ce12680..8cacc67645 100644
---- a/util/cpuinfo-riscv.c
-+++ b/util/cpuinfo-riscv.c
-@@ -9,6 +9,7 @@
- #ifdef CONFIG_ASM_HWPROBE_H
- #include <asm/hwprobe.h>
- #include <sys/syscall.h>
-+#include <asm/unistd.h>
- #endif
- 
- unsigned cpuinfo;
--- 
-2.46.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
deleted file mode 100644
index f9eddb81786..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ /dev/null
@@ -1,354 +0,0 @@
-From a6b57d63bcdc3f3cae9827d2e1e3492d2293695f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Dec 2022 08:37:46 -0800
-Subject: [PATCH] linux-user: Replace use of lfs64 related functions and macros
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
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 22df46859..27aa59594 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -762,8 +762,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
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
-@@ -6724,13 +6724,13 @@ static int target_to_host_fcntl_cmd(int cmd)
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
-@@ -6744,17 +6744,6 @@ static int target_to_host_fcntl_cmd(int cmd)
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
-@@ -6806,8 +6795,8 @@ static int target_to_host_fcntl_cmd(int cmd)
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
-@@ -6840,55 +6829,11 @@ static int host_to_target_flock(int type)
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
-@@ -6896,10 +6841,10 @@ struct target_oabi_flock64 {
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
-@@ -6920,10 +6865,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
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
-@@ -6941,10 +6886,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
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
-@@ -6965,10 +6910,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
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
-@@ -6987,7 +6932,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
- 
- static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
- {
--    struct flock64 fl64;
-+    struct flock fl64;
- #ifdef F_GETOWN_EX
-     struct f_owner_ex fox;
-     struct target_f_owner_ex *target_fox;
-@@ -7000,6 +6945,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
- 
-     switch(cmd) {
-     case TARGET_F_GETLK:
-+    case TARGET_F_OFD_GETLK:
-         ret = copy_from_user_flock(&fl64, arg);
-         if (ret) {
-             return ret;
-@@ -7009,32 +6955,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
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
-@@ -7269,7 +7194,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
-         arg2 = arg3;
-         arg3 = arg4;
-     }
--    return get_errno(truncate64(arg1, target_offset64(arg2, arg3)));
-+    return get_errno(truncate(arg1, target_offset64(arg2, arg3)));
- }
- #endif
- 
-@@ -7283,7 +7208,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
-         arg2 = arg3;
-         arg3 = arg4;
-     }
--    return get_errno(ftruncate64(arg1, target_offset64(arg2, arg3)));
-+    return get_errno(ftruncate(arg1, target_offset64(arg2, arg3)));
- }
- #endif
- 
-@@ -8668,7 +8593,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
-     void *tdirp;
-     int hlen, hoff, toff;
-     int hreclen, treclen;
--    off64_t prev_diroff = 0;
-+    off_t prev_diroff = 0;
- 
-     hdirp = g_try_malloc(count);
-     if (!hdirp) {
-@@ -8721,7 +8646,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
-              * Return what we have, resetting the file pointer to the
-              * location of the first record not returned.
-              */
--            lseek64(dirfd, prev_diroff, SEEK_SET);
-+            lseek(dirfd, prev_diroff, SEEK_SET);
-             break;
-         }
- 
-@@ -8755,7 +8680,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
-     void *tdirp;
-     int hlen, hoff, toff;
-     int hreclen, treclen;
--    off64_t prev_diroff = 0;
-+    off_t prev_diroff = 0;
- 
-     hdirp = g_try_malloc(count);
-     if (!hdirp) {
-@@ -8797,7 +8722,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
-              * Return what we have, resetting the file pointer to the
-              * location of the first record not returned.
-              */
--            lseek64(dirfd, prev_diroff, SEEK_SET);
-+            lseek(dirfd, prev_diroff, SEEK_SET);
-             break;
-         }
- 
-@@ -11528,7 +11453,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
-                 return -TARGET_EFAULT;
-             }
-         }
--        ret = get_errno(pread64(arg1, p, arg3, target_offset64(arg4, arg5)));
-+        ret = get_errno(pread(arg1, p, arg3, target_offset64(arg4, arg5)));
-         unlock_user(p, arg2, ret);
-         return ret;
-     case TARGET_NR_pwrite64:
-@@ -11545,7 +11470,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
-                 return -TARGET_EFAULT;
-             }
-         }
--        ret = get_errno(pwrite64(arg1, p, arg3, target_offset64(arg4, arg5)));
-+        ret = get_errno(pwrite(arg1, p, arg3, target_offset64(arg4, arg5)));
-         unlock_user(p, arg2, 0);
-         return ret;
- #endif
-@@ -12405,14 +12330,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
-@@ -12422,7 +12347,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
-         }
- 
-         switch(arg2) {
--        case TARGET_F_GETLK64:
-+        case TARGET_F_GETLK:
-             ret = copyfrom(&fl, arg3);
-             if (ret) {
-                 break;
-@@ -12433,8 +12358,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
diff --git a/meta/recipes-devtools/qemu/qemu_9.1.1.bb b/meta/recipes-devtools/qemu/qemu_9.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.1.1.bb
rename to meta/recipes-devtools/qemu/qemu_9.2.0.bb

