Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA0AC41535
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.25618.1671645361923760519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dLPjO0U/;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id v23so11254190pju.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbnN1TO2FvfJOAXVl0HoOQpwrr/VI/Kc+qah5KrD6MY=;
        b=dLPjO0U/cHbo678OwHUba/fXz/KdmrRK2wAPHoAVtwI4qWnW9/ciq4ziP5M8WrLETT
         yQfjabj9NkCBKy70NPGXBRIiQLyASCfbSkrJfLxBhPaAdAYK9u5UlZwIZ6M9LoilEGnn
         GalbF2nr7lzZ0x/ugoC58nXMXsep/b2aOTWraNsHnqMBjuZPxG8BP+dFfDYdoTCrI5cL
         rs5Tt6FVG00SuNhnOdFJAmvefVHlLCYq0ESzs9DXgNk92fA81od5MFcPB/fFIx1SQXhg
         pbfPSFbS1Nv5DHrDFTK1F/MGh5aPvmt/a5Ntps9E0vsG75nES4WuZleYQuUaYisMT5RQ
         W/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbnN1TO2FvfJOAXVl0HoOQpwrr/VI/Kc+qah5KrD6MY=;
        b=PlDYV4IPUWQqNFhIuqALfY6J//v60SHunlyuxGqutAxK+xu1wdLtoQML1E0NJcUvju
         /o2cTyu/iw5In70ppiUJmYLBxCMpqSgzOHpevyTGEj30W66Zu8EdSBNeLptREERc/sxa
         eFeDWfjrLt9OvkuiRCVLp7Whgxmx5spXKTJrP/yN5GDJKtd0UVRQlDQL2Rnbw4+7fZnJ
         YKz7g2uWfzCW8VIYMKHG351XqbwYY4azb8IuYW2HFa2X+Un9ZEKy37Bd13rfddSTgAhO
         4dlHVxUWx5SOMheYSlwMazdLIiNSrhoUZJN8iRGyRobtS6ryOWLAptmcFZM+SyUb/wYq
         mz2Q==
X-Gm-Message-State: AFqh2krEf3LaEEivg0drgSo7L/3FQk1rRJBx/UN0+GEcGU/YWphdBnf/
	TQqa8SB34E1EPGuiPc94VmEocM2RtFU=
X-Google-Smtp-Source: AMrXdXuy+K2Pagu8ms3G9sROl7fHkl/v1jG42D7V+udV4JCCIUa2Q141+wpb49xUIbeV2fy9FBWEhg==
X-Received: by 2002:a17:90a:5186:b0:219:ce62:7de8 with SMTP id u6-20020a17090a518600b00219ce627de8mr3096632pjh.43.1671645360981;
        Wed, 21 Dec 2022 09:56:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:56:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 9/9] qemu: Fix build with largefile support
Date: Wed, 21 Dec 2022 09:55:51 -0800
Message-Id: <20221221175551.1940464-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221175551.1940464-1-raj.khem@gmail.com>
References: <20221221175551.1940464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174934

drop using lfs64 specific functions and macros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 ...-user-blk-Replace-lseek64-with-lseek.patch |  37 ++
 ...ce-use-of-lfs64-related-functions-an.patch | 358 ++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0b24540bf9..27e3a8e259 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch \
+           file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch \
+           file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://arm-cpreg-fix.patch \
            file://CVE-2022-3165.patch \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch b/meta/recipes-devtools/qemu/qemu/0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch
new file mode 100644
index 0000000000..1838c88f0e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch
@@ -0,0 +1,37 @@
+From 38f5c88bf296dbbc04dcd57f36d64695055a2d3f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Dec 2022 20:19:49 -0800
+Subject: [PATCH 1/2] contrib/vhost-user-blk: Replace lseek64 with lseek
+
+64bit off_t is already in use since build uses _FILE_OFFSET_BITS=64
+already. Using lseek/off_t also makes it work with latest must without
+using _LARGEFILE64_SOURCE macro. This macro is implied with _GNU_SOURCE
+when using glibc but not with musl.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg02840.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Michael S. Tsirkin <mst@redhat.com>
+CC: Raphael Norwitz <raphael.norwitz@nutanix.com>
+---
+ contrib/vhost-user-blk/vhost-user-blk.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
+index aa99877fcd..7941694e53 100644
+--- a/contrib/vhost-user-blk/vhost-user-blk.c
++++ b/contrib/vhost-user-blk/vhost-user-blk.c
+@@ -532,9 +532,9 @@ vub_get_blocksize(int fd)
+ static void
+ vub_initialize_config(int fd, struct virtio_blk_config *config)
+ {
+-    off64_t capacity;
++    off_t capacity;
+ 
+-    capacity = lseek64(fd, 0, SEEK_END);
++    capacity = lseek(fd, 0, SEEK_END);
+     config->capacity = capacity >> 9;
+     config->blk_size = vub_get_blocksize(fd);
+     config->size_max = 65536;
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
new file mode 100644
index 0000000000..14b5338eb2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -0,0 +1,358 @@
+From 71f14902256e3c3529710b713e1ea43100bf4c40 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Dec 2022 08:37:46 -0800
+Subject: [PATCH 2/2] linux-user: Replace use of lfs64 related functions and
+ macros
+
+Builds defines -D_FILE_OFFSET_BITS=64 which makes the original functions
+anf macros behave same as their 64 suffixed counterparts. This also
+helps in compiling with latest musl C library, where these macros and
+functions are no more available under _GNU_SOURCE feature macro
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg02841.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Laurent Vivier <laurent@vivier.eu>
+---
+ linux-user/syscall.c | 153 +++++++++++--------------------------------
+ 1 file changed, 39 insertions(+), 114 deletions(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 1f8c10f8ef..30d83ed162 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -795,8 +795,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
+  */
+ #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
+ /* Similarly for fcntl. Note that callers must always:
+- *  pass the F_GETLK64 etc constants rather than the unsuffixed F_GETLK
+- *  use the flock64 struct rather than unsuffixed flock
++ *  pass the F_GETLK etc constants rather than the unsuffixed F_GETLK
++ *  use the flock struct rather than unsuffixed flock
+  * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
+  */
+ #ifdef __NR_fcntl64
+@@ -6797,13 +6797,13 @@ static int target_to_host_fcntl_cmd(int cmd)
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
+@@ -6817,17 +6817,6 @@ static int target_to_host_fcntl_cmd(int cmd)
+     case TARGET_F_SETSIG:
+         ret = F_SETSIG;
+         break;
+-#if TARGET_ABI_BITS == 32
+-    case TARGET_F_GETLK64:
+-        ret = F_GETLK64;
+-        break;
+-    case TARGET_F_SETLK64:
+-        ret = F_SETLK64;
+-        break;
+-    case TARGET_F_SETLKW64:
+-        ret = F_SETLKW64;
+-        break;
+-#endif
+     case TARGET_F_SETLEASE:
+         ret = F_SETLEASE;
+         break;
+@@ -6879,8 +6868,8 @@ static int target_to_host_fcntl_cmd(int cmd)
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
+@@ -6913,55 +6902,11 @@ static int host_to_target_flock(int type)
+     return type;
+ }
+ 
+-static inline abi_long copy_from_user_flock(struct flock64 *fl,
+-                                            abi_ulong target_flock_addr)
+-{
+-    struct target_flock *target_fl;
+-    int l_type;
+-
+-    if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
+-        return -TARGET_EFAULT;
+-    }
+-
+-    __get_user(l_type, &target_fl->l_type);
+-    l_type = target_to_host_flock(l_type);
+-    if (l_type < 0) {
+-        return l_type;
+-    }
+-    fl->l_type = l_type;
+-    __get_user(fl->l_whence, &target_fl->l_whence);
+-    __get_user(fl->l_start, &target_fl->l_start);
+-    __get_user(fl->l_len, &target_fl->l_len);
+-    __get_user(fl->l_pid, &target_fl->l_pid);
+-    unlock_user_struct(target_fl, target_flock_addr, 0);
+-    return 0;
+-}
+-
+-static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
+-                                          const struct flock64 *fl)
+-{
+-    struct target_flock *target_fl;
+-    short l_type;
+-
+-    if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
+-        return -TARGET_EFAULT;
+-    }
+-
+-    l_type = host_to_target_flock(fl->l_type);
+-    __put_user(l_type, &target_fl->l_type);
+-    __put_user(fl->l_whence, &target_fl->l_whence);
+-    __put_user(fl->l_start, &target_fl->l_start);
+-    __put_user(fl->l_len, &target_fl->l_len);
+-    __put_user(fl->l_pid, &target_fl->l_pid);
+-    unlock_user_struct(target_fl, target_flock_addr, 1);
+-    return 0;
+-}
+-
+-typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
+-typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
++typedef abi_long from_flock_fn(struct flock *fl, abi_ulong target_addr);
++typedef abi_long to_flock_fn(abi_ulong target_addr, const struct flock *fl);
+ 
+ #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
+-struct target_oabi_flock64 {
++struct target_oabi_flock {
+     abi_short l_type;
+     abi_short l_whence;
+     abi_llong l_start;
+@@ -6969,10 +6914,10 @@ struct target_oabi_flock64 {
+     abi_int   l_pid;
+ } QEMU_PACKED;
+ 
+-static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
++static inline abi_long copy_from_user_oabi_flock(struct flock *fl,
+                                                    abi_ulong target_flock_addr)
+ {
+-    struct target_oabi_flock64 *target_fl;
++    struct target_oabi_flock *target_fl;
+     int l_type;
+ 
+     if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
+@@ -6993,10 +6938,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
+     return 0;
+ }
+ 
+-static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
+-                                                 const struct flock64 *fl)
++static inline abi_long copy_to_user_oabi_flock(abi_ulong target_flock_addr,
++                                                 const struct flock *fl)
+ {
+-    struct target_oabi_flock64 *target_fl;
++    struct target_oabi_flock *target_fl;
+     short l_type;
+ 
+     if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
+@@ -7014,10 +6959,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
+ }
+ #endif
+ 
+-static inline abi_long copy_from_user_flock64(struct flock64 *fl,
++static inline abi_long copy_from_user_flock(struct flock *fl,
+                                               abi_ulong target_flock_addr)
+ {
+-    struct target_flock64 *target_fl;
++    struct target_flock *target_fl;
+     int l_type;
+ 
+     if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
+@@ -7038,10 +6983,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
+     return 0;
+ }
+ 
+-static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
+-                                            const struct flock64 *fl)
++static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
++                                            const struct flock *fl)
+ {
+-    struct target_flock64 *target_fl;
++    struct target_flock *target_fl;
+     short l_type;
+ 
+     if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
+@@ -7060,7 +7005,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
+ 
+ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+ {
+-    struct flock64 fl64;
++    struct flock fl64;
+ #ifdef F_GETOWN_EX
+     struct f_owner_ex fox;
+     struct target_f_owner_ex *target_fox;
+@@ -7073,6 +7018,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+ 
+     switch(cmd) {
+     case TARGET_F_GETLK:
++    case TARGET_F_OFD_GETLK:
+         ret = copy_from_user_flock(&fl64, arg);
+         if (ret) {
+             return ret;
+@@ -7082,32 +7028,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+             ret = copy_to_user_flock(arg, &fl64);
+         }
+         break;
+-
+     case TARGET_F_SETLK:
+     case TARGET_F_SETLKW:
+-        ret = copy_from_user_flock(&fl64, arg);
+-        if (ret) {
+-            return ret;
+-        }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
+-        break;
+-
+-    case TARGET_F_GETLK64:
+-    case TARGET_F_OFD_GETLK:
+-        ret = copy_from_user_flock64(&fl64, arg);
+-        if (ret) {
+-            return ret;
+-        }
+-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
+-        if (ret == 0) {
+-            ret = copy_to_user_flock64(arg, &fl64);
+-        }
+-        break;
+-    case TARGET_F_SETLK64:
+-    case TARGET_F_SETLKW64:
+     case TARGET_F_OFD_SETLK:
+     case TARGET_F_OFD_SETLKW:
+-        ret = copy_from_user_flock64(&fl64, arg);
++        ret = copy_from_user_flock(&fl64, arg);
+         if (ret) {
+             return ret;
+         }
+@@ -7332,7 +7257,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
+         arg2 = arg3;
+         arg3 = arg4;
+     }
+-    return get_errno(truncate64(arg1, target_offset64(arg2, arg3)));
++    return get_errno(truncate(arg1, target_offset64(arg2, arg3)));
+ }
+ #endif
+ 
+@@ -7346,7 +7271,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
+         arg2 = arg3;
+         arg3 = arg4;
+     }
+-    return get_errno(ftruncate64(arg1, target_offset64(arg2, arg3)));
++    return get_errno(ftruncate(arg1, target_offset64(arg2, arg3)));
+ }
+ #endif
+ 
+@@ -8452,7 +8377,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+     void *tdirp;
+     int hlen, hoff, toff;
+     int hreclen, treclen;
+-    off64_t prev_diroff = 0;
++    off_t prev_diroff = 0;
+ 
+     hdirp = g_try_malloc(count);
+     if (!hdirp) {
+@@ -8505,7 +8430,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+              * Return what we have, resetting the file pointer to the
+              * location of the first record not returned.
+              */
+-            lseek64(dirfd, prev_diroff, SEEK_SET);
++            lseek(dirfd, prev_diroff, SEEK_SET);
+             break;
+         }
+ 
+@@ -8539,7 +8464,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+     void *tdirp;
+     int hlen, hoff, toff;
+     int hreclen, treclen;
+-    off64_t prev_diroff = 0;
++    off_t prev_diroff = 0;
+ 
+     hdirp = g_try_malloc(count);
+     if (!hdirp) {
+@@ -8581,7 +8506,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+              * Return what we have, resetting the file pointer to the
+              * location of the first record not returned.
+              */
+-            lseek64(dirfd, prev_diroff, SEEK_SET);
++            lseek(dirfd, prev_diroff, SEEK_SET);
+             break;
+         }
+ 
+@@ -11114,7 +11039,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+                 return -TARGET_EFAULT;
+             }
+         }
+-        ret = get_errno(pread64(arg1, p, arg3, target_offset64(arg4, arg5)));
++        ret = get_errno(pread(arg1, p, arg3, target_offset64(arg4, arg5)));
+         unlock_user(p, arg2, ret);
+         return ret;
+     case TARGET_NR_pwrite64:
+@@ -11131,7 +11056,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+                 return -TARGET_EFAULT;
+             }
+         }
+-        ret = get_errno(pwrite64(arg1, p, arg3, target_offset64(arg4, arg5)));
++        ret = get_errno(pwrite(arg1, p, arg3, target_offset64(arg4, arg5)));
+         unlock_user(p, arg2, 0);
+         return ret;
+ #endif
+@@ -11954,14 +11879,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+     case TARGET_NR_fcntl64:
+     {
+         int cmd;
+-        struct flock64 fl;
+-        from_flock64_fn *copyfrom = copy_from_user_flock64;
+-        to_flock64_fn *copyto = copy_to_user_flock64;
++        struct flock fl;
++        from_flock_fn *copyfrom = copy_from_user_flock;
++        to_flock_fn *copyto = copy_to_user_flock;
+ 
+ #ifdef TARGET_ARM
+         if (!cpu_env->eabi) {
+-            copyfrom = copy_from_user_oabi_flock64;
+-            copyto = copy_to_user_oabi_flock64;
++            copyfrom = copy_from_user_oabi_flock;
++            copyto = copy_to_user_oabi_flock;
+         }
+ #endif
+ 
+@@ -11971,7 +11896,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+         }
+ 
+         switch(arg2) {
+-        case TARGET_F_GETLK64:
++        case TARGET_F_GETLK:
+             ret = copyfrom(&fl, arg3);
+             if (ret) {
+                 break;
+@@ -11982,8 +11907,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+             }
+ 	    break;
+ 
+-        case TARGET_F_SETLK64:
+-        case TARGET_F_SETLKW64:
++        case TARGET_F_SETLK:
++        case TARGET_F_SETLKW:
+             ret = copyfrom(&fl, arg3);
+             if (ret) {
+                 break;
+-- 
+2.39.0
+
-- 
2.39.0


