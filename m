Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C33C54E41
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 09:35:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.19013.1709285750870406411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 01:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aemnLtAH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412bef42c91so9793555e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 01:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709285749; x=1709890549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UX4ACzbG16vZhXV0Wva6943encw0w+oCfr3WhE6bYJs=;
        b=aemnLtAHRH2voJEn4xmRfaoLc8aUm9yNaKukHg4uH9lqtJo+jy5Mru22JYk+irodYf
         BfDt8G41LqmFHihbjBAmbpOOvkbpjjah69HHKJ9xLWR7H5YNt2MKPUezqdNMUdCnE7R2
         BW7wjPAfvb9ik8SihdBbso1+5fPYVhEKyH/is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709285749; x=1709890549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UX4ACzbG16vZhXV0Wva6943encw0w+oCfr3WhE6bYJs=;
        b=j7WzWWxsZoind0OXUeRb4Ga0qGDQxWDYYu867tj0uRNd13EPSwTaKkKmGAVxVONt3j
         crLfI3b+ooJRPbcHE/OrcEfMiNzeuwDEPW/zErixKxId/fC154fO1khQ6LtHNY7u47js
         4lWzOVkghEaxQY5MrPzLVj28zct4FAtJd9nQAx/Yw3aD3ak2t3mEpPUX+fETJhON3aCN
         GsSEbEcmjqfTJOFVAl7J8uNAX/LU6wYxEOQUsGqN4IbG57/+Wzvj34thhula0DOeuTFD
         g8X/NDoSMdVivoAoylo8pe3SDQZBc3UZBsCSEGcBsW4Cj9nkVjHKEx2Q0YB54usn7WPM
         Qaew==
X-Gm-Message-State: AOJu0YwsFE6uMpXpYJuB+fR3LM/fZmTFrIBi9CFa7xdgxwELsUJqioBI
	c3YuMQBiJ1g85w73dizbbW8D8UlthYVUGvKJZEyTblN3EZS6zNf66J4/qXLiWDKRvnI2T7pnuJv
	2
X-Google-Smtp-Source: AGHT+IGohCbnvmsM71AYh10amITS1CHV2G1TwP0Bn9P/LIUASWkZ7id2IINbGDWjsRm/lQ4zPqswQw==
X-Received: by 2002:a05:600c:474d:b0:412:b8fd:2dd4 with SMTP id w13-20020a05600c474d00b00412b8fd2dd4mr772888wmo.17.1709285748314;
        Fri, 01 Mar 2024 01:35:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef7:29f4:cff2:85e4])
        by smtp.gmail.com with ESMTPSA id je1-20020a05600c1f8100b004127ead18aasm4902549wmb.22.2024.03.01.01.35.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:35:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: Replace workaround with proper usermode fix for shmat
Date: Fri,  1 Mar 2024 09:35:46 +0000
Message-Id: <20240301093547.1810401-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 09:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196458

We were using a workaround to avoid problems with the behaviour of shmat()
calls in usermode qemu. Switch to patches from upstream which are in review
but not merged yet.

Update the mmap fixed/noreplace workaround for the changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc           |   7 +-
 ...4-Handle-the-vsyscall-page-in-open_s.patch |  56 +++++
 ...ongarch64-Remove-TARGET_FORCE_SHMLBA.patch |  43 ++++
 ...0003-linux-user-Add-strace-for-shmat.patch |  71 ++++++
 ...0004-linux-user-Rewrite-target_shmat.patch | 236 ++++++++++++++++++
 ...that-shmat-does-not-break-proc-self-.patch |  85 +++++++
 ...round-for-missing-MAP_FIXED_NOREPLAC.patch |  62 +++--
 ...79ad8629b57a43daa62e46cc7af6e1078116.patch |  60 +++++
 .../recipes-devtools/qemu/qemu/fix_segv.patch |  47 ----
 9 files changed, 586 insertions(+), 81 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-for-shmat.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-target_shmat.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/fix_segv.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a403f7d69fa..b42cc120f1f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,7 +33,12 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://fixedmeson.patch \
            file://no-pip.patch \
-           file://fix_segv.patch \
+           file://4a8579ad8629b57a43daa62e46cc7af6e1078116.patch \
+           file://0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch \
+           file://0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch \
+           file://0003-linux-user-Add-strace-for-shmat.patch \
+           file://0004-linux-user-Rewrite-target_shmat.patch \
+           file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
new file mode 100644
index 00000000000..2eaebe883c7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
@@ -0,0 +1,56 @@
+From 4517e2046610722879761bcdb60edbb2b929c848 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Wed, 28 Feb 2024 10:25:14 -1000
+Subject: [PATCH 1/5] linux-user/x86_64: Handle the vsyscall page in
+ open_self_maps_{2,4}
+
+This is the only case in which we expect to have no host memory backing
+for a guest memory page, because in general linux user processes cannot
+map any pages in the top half of the 64-bit address space.
+
+Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2170
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ linux-user/syscall.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index a114f29a8..8307a8a61 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -7922,6 +7922,10 @@ static void open_self_maps_4(const struct open_self_maps_data *d,
+         path = "[heap]";
+     } else if (start == info->vdso) {
+         path = "[vdso]";
++#ifdef TARGET_X86_64
++    } else if (start == TARGET_VSYSCALL_PAGE) {
++        path = "[vsyscall]";
++#endif
+     }
+ 
+     /* Except null device (MAP_ANON), adjust offset for this fragment. */
+@@ -8010,6 +8014,18 @@ static int open_self_maps_2(void *opaque, target_ulong guest_start,
+     uintptr_t host_start = (uintptr_t)g2h_untagged(guest_start);
+     uintptr_t host_last = (uintptr_t)g2h_untagged(guest_end - 1);
+ 
++#ifdef TARGET_X86_64
++    /*
++     * Because of the extremely high position of the page within the guest
++     * virtual address space, this is not backed by host memory at all.
++     * Therefore the loop below would fail.  This is the only instance
++     * of not having host backing memory.
++     */
++    if (guest_start == TARGET_VSYSCALL_PAGE) {
++        return open_self_maps_3(opaque, guest_start, guest_end, flags);
++    }
++#endif
++
+     while (1) {
+         IntervalTreeNode *n =
+             interval_tree_iter_first(d->host_maps, host_start, host_start);
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch b/meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch
new file mode 100644
index 00000000000..3f01aaa6447
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch
@@ -0,0 +1,43 @@
+From 5bf65b24414d3ff8339f6f1beb221c7c35c91e5d Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Wed, 28 Feb 2024 10:25:15 -1000
+Subject: [PATCH 2/5] linux-user/loongarch64: Remove TARGET_FORCE_SHMLBA
+
+The kernel abi was changed with
+
+    commit d23b77953f5a4fbf94c05157b186aac2a247ae32
+    Author: Huacai Chen <chenhuacai@kernel.org>
+    Date:   Wed Jan 17 12:43:08 2024 +0800
+
+        LoongArch: Change SHMLBA from SZ_64K to PAGE_SIZE
+
+during the v6.8 cycle.
+
+Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
+
+Reviewed-by: Song Gao <gaosong@loongson.cn>
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ linux-user/loongarch64/target_syscall.h | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/linux-user/loongarch64/target_syscall.h b/linux-user/loongarch64/target_syscall.h
+index 8b5de5212..39f229bb9 100644
+--- a/linux-user/loongarch64/target_syscall.h
++++ b/linux-user/loongarch64/target_syscall.h
+@@ -38,11 +38,4 @@ struct target_pt_regs {
+ #define TARGET_MCL_FUTURE  2
+ #define TARGET_MCL_ONFAULT 4
+ 
+-#define TARGET_FORCE_SHMLBA
+-
+-static inline abi_ulong target_shmlba(CPULoongArchState *env)
+-{
+-    return 64 * KiB;
+-}
+-
+ #endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-for-shmat.patch b/meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-for-shmat.patch
new file mode 100644
index 00000000000..0c601c804a7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-for-shmat.patch
@@ -0,0 +1,71 @@
+From e8f06676c6c88e12cd5f4f81a839b7111c683596 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Wed, 28 Feb 2024 10:25:16 -1000
+Subject: [PATCH 3/5] linux-user: Add strace for shmat
+
+Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ linux-user/strace.c    | 23 +++++++++++++++++++++++
+ linux-user/strace.list |  2 +-
+ 2 files changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/linux-user/strace.c b/linux-user/strace.c
+index cf26e5526..47d6ec326 100644
+--- a/linux-user/strace.c
++++ b/linux-user/strace.c
+@@ -670,6 +670,25 @@ print_semctl(CPUArchState *cpu_env, const struct syscallname *name,
+ }
+ #endif
+ 
++static void
++print_shmat(CPUArchState *cpu_env, const struct syscallname *name,
++            abi_long arg0, abi_long arg1, abi_long arg2,
++            abi_long arg3, abi_long arg4, abi_long arg5)
++{
++    static const struct flags shmat_flags[] = {
++        FLAG_GENERIC(SHM_RND),
++        FLAG_GENERIC(SHM_REMAP),
++        FLAG_GENERIC(SHM_RDONLY),
++        FLAG_GENERIC(SHM_EXEC),
++    };
++
++    print_syscall_prologue(name);
++    print_raw_param(TARGET_ABI_FMT_ld, arg0, 0);
++    print_pointer(arg1, 0);
++    print_flags(shmat_flags, arg2, 1);
++    print_syscall_epilogue(name);
++}
++
+ #ifdef TARGET_NR_ipc
+ static void
+ print_ipc(CPUArchState *cpu_env, const struct syscallname *name,
+@@ -683,6 +702,10 @@ print_ipc(CPUArchState *cpu_env, const struct syscallname *name,
+         print_ipc_cmd(arg3);
+         qemu_log(",0x" TARGET_ABI_FMT_lx ")", arg4);
+         break;
++    case IPCOP_shmat:
++        print_shmat(cpu_env, &(const struct syscallname){ .name = "shmat" },
++                    arg1, arg4, arg2, 0, 0, 0);
++        break;
+     default:
+         qemu_log(("%s("
+                   TARGET_ABI_FMT_ld ","
+diff --git a/linux-user/strace.list b/linux-user/strace.list
+index 6655d4f26..dfd4237d1 100644
+--- a/linux-user/strace.list
++++ b/linux-user/strace.list
+@@ -1398,7 +1398,7 @@
+ { TARGET_NR_sgetmask, "sgetmask" , NULL, NULL, NULL },
+ #endif
+ #ifdef TARGET_NR_shmat
+-{ TARGET_NR_shmat, "shmat" , NULL, NULL, print_syscall_ret_addr },
++{ TARGET_NR_shmat, "shmat" , NULL, print_shmat, print_syscall_ret_addr },
+ #endif
+ #ifdef TARGET_NR_shmctl
+ { TARGET_NR_shmctl, "shmctl" , NULL, NULL, NULL },
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-target_shmat.patch b/meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-target_shmat.patch
new file mode 100644
index 00000000000..88c3ed40b06
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-target_shmat.patch
@@ -0,0 +1,236 @@
+From cb48d5d1592e63ebd0d4a3e300ef98e38e6306d7 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Wed, 28 Feb 2024 10:25:17 -1000
+Subject: [PATCH 4/5] linux-user: Rewrite target_shmat
+
+Handle combined host and guest alignment requirements.
+Handle host and guest page size differences.
+Handle SHM_EXEC.
+
+Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/115
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ linux-user/mmap.c | 166 +++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 133 insertions(+), 33 deletions(-)
+
+diff --git a/linux-user/mmap.c b/linux-user/mmap.c
+index 18fb3aaf7..6a2f649bb 100644
+--- a/linux-user/mmap.c
++++ b/linux-user/mmap.c
+@@ -1062,69 +1062,161 @@ static inline abi_ulong target_shmlba(CPUArchState *cpu_env)
+ }
+ #endif
+ 
++#if defined(__arm__) || defined(__mips__) || defined(__sparc__)
++#define HOST_FORCE_SHMLBA 1
++#else
++#define HOST_FORCE_SHMLBA 0
++#endif
++
+ abi_ulong target_shmat(CPUArchState *cpu_env, int shmid,
+                        abi_ulong shmaddr, int shmflg)
+ {
+     CPUState *cpu = env_cpu(cpu_env);
+-    abi_ulong raddr;
+     struct shmid_ds shm_info;
+     int ret;
+-    abi_ulong shmlba;
++    int h_pagesize;
++    int t_shmlba, h_shmlba, m_shmlba;
++    size_t t_len, h_len, m_len;
+ 
+     /* shmat pointers are always untagged */
+ 
+-    /* find out the length of the shared memory segment */
++    /*
++     * Because we can't use host shmat() unless the address is sufficiently
++     * aligned for the host, we'll need to check both.
++     * TODO: Could be fixed with softmmu.
++     */
++    t_shmlba = target_shmlba(cpu_env);
++    h_pagesize = qemu_real_host_page_size();
++    h_shmlba = (HOST_FORCE_SHMLBA ? SHMLBA : h_pagesize);
++    m_shmlba = MAX(t_shmlba, h_shmlba);
++
++    if (shmaddr) {
++        if (shmaddr & (m_shmlba - 1)) {
++            if (shmflg & SHM_RND) {
++                /*
++                 * The guest is allowing the kernel to round the address.
++                 * Assume that the guest is ok with us rounding to the
++                 * host required alignment too.  Anyway if we don't, we'll
++                 * get an error from the kernel.
++                 */
++                shmaddr &= ~(m_shmlba - 1);
++                if (shmaddr == 0 && (shmflg & SHM_REMAP)) {
++                    return -TARGET_EINVAL;
++                }
++            } else {
++                int require = TARGET_PAGE_SIZE;
++#ifdef TARGET_FORCE_SHMLBA
++                require = t_shmlba;
++#endif
++                /*
++                 * Include host required alignment, as otherwise we cannot
++                 * use host shmat at all.
++                 */
++                require = MAX(require, h_shmlba);
++                if (shmaddr & (require - 1)) {
++                    return -TARGET_EINVAL;
++                }
++            }
++        }
++    } else {
++        if (shmflg & SHM_REMAP) {
++            return -TARGET_EINVAL;
++        }
++    }
++    /* All rounding now manually concluded. */
++    shmflg &= ~SHM_RND;
++
++    /* Find out the length of the shared memory segment. */
+     ret = get_errno(shmctl(shmid, IPC_STAT, &shm_info));
+     if (is_error(ret)) {
+         /* can't get length, bail out */
+         return ret;
+     }
++    t_len = TARGET_PAGE_ALIGN(shm_info.shm_segsz);
++    h_len = ROUND_UP(shm_info.shm_segsz, h_pagesize);
++    m_len = MAX(t_len, h_len);
+ 
+-    shmlba = target_shmlba(cpu_env);
+-
+-    if (shmaddr & (shmlba - 1)) {
+-        if (shmflg & SHM_RND) {
+-            shmaddr &= ~(shmlba - 1);
+-        } else {
+-            return -TARGET_EINVAL;
+-        }
+-    }
+-    if (!guest_range_valid_untagged(shmaddr, shm_info.shm_segsz)) {
++    if (!guest_range_valid_untagged(shmaddr, m_len)) {
+         return -TARGET_EINVAL;
+     }
+ 
+     WITH_MMAP_LOCK_GUARD() {
+-        void *host_raddr;
++        bool mapped = false;
++        void *want, *test;
+         abi_ulong last;
+ 
+-        if (shmaddr) {
+-            host_raddr = shmat(shmid, (void *)g2h_untagged(shmaddr), shmflg);
++        if (!shmaddr) {
++            shmaddr = mmap_find_vma(0, m_len, m_shmlba);
++            if (shmaddr == -1) {
++                return -TARGET_ENOMEM;
++            }
++            mapped = !reserved_va;
++        } else if (shmflg & SHM_REMAP) {
++            /*
++             * If host page size > target page size, the host shmat may map
++             * more memory than the guest expects.  Reject a mapping that
++             * would replace memory in the unexpected gap.
++             * TODO: Could be fixed with softmmu.
++             */
++            if (t_len < h_len &&
++                !page_check_range_empty(shmaddr + t_len,
++                                        shmaddr + h_len - 1)) {
++                return -TARGET_EINVAL;
++            }
+         } else {
+-            abi_ulong mmap_start;
++            if (!page_check_range_empty(shmaddr, shmaddr + m_len - 1)) {
++                return -TARGET_EINVAL;
++            }
++        }
+ 
+-            /* In order to use the host shmat, we need to honor host SHMLBA.  */
+-            mmap_start = mmap_find_vma(0, shm_info.shm_segsz,
+-                                       MAX(SHMLBA, shmlba));
++        /* All placement is now complete. */
++        want = (void *)g2h_untagged(shmaddr);
+ 
+-            if (mmap_start == -1) {
+-                return -TARGET_ENOMEM;
++        /*
++         * Map anonymous pages across the entire range, then remap with
++         * the shared memory.  This is required for a number of corner
++         * cases for which host and guest page sizes differ.
++         */
++        if (h_len != t_len) {
++            int mmap_p = PROT_READ | (shmflg & SHM_RDONLY ? 0 : PROT_WRITE);
++            int mmap_f = MAP_PRIVATE | MAP_ANONYMOUS
++                       | (reserved_va || (shmflg & SHM_REMAP)
++                          ? MAP_FIXED : MAP_FIXED_NOREPLACE);
++
++            test = mmap(want, m_len, mmap_p, mmap_f, -1, 0);
++            if (unlikely(test != want)) {
++                /* shmat returns EINVAL not EEXIST like mmap. */
++                ret = (test == MAP_FAILED && errno != EEXIST
++                       ? get_errno(-1) : -TARGET_EINVAL);
++                if (mapped) {
++                    do_munmap(want, m_len);
++                }
++                return ret;
+             }
+-            host_raddr = shmat(shmid, g2h_untagged(mmap_start),
+-                               shmflg | SHM_REMAP);
++            mapped = true;
+         }
+ 
+-        if (host_raddr == (void *)-1) {
+-            return get_errno(-1);
++        if (reserved_va || mapped) {
++            shmflg |= SHM_REMAP;
++        }
++        test = shmat(shmid, want, shmflg);
++        if (test == MAP_FAILED) {
++            ret = get_errno(-1);
++            if (mapped) {
++                do_munmap(want, m_len);
++            }
++            return ret;
+         }
+-        raddr = h2g(host_raddr);
+-        last = raddr + shm_info.shm_segsz - 1;
++        assert(test == want);
+ 
+-        page_set_flags(raddr, last,
++        last = shmaddr + m_len - 1;
++        page_set_flags(shmaddr, last,
+                        PAGE_VALID | PAGE_RESET | PAGE_READ |
+-                       (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE));
++                       (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE) |
++                       (shmflg & SHM_EXEC ? PAGE_EXEC : 0));
+ 
+-        shm_region_rm_complete(raddr, last);
+-        shm_region_add(raddr, last);
++        shm_region_rm_complete(shmaddr, last);
++        shm_region_add(shmaddr, last);
+     }
+ 
+     /*
+@@ -1138,7 +1230,15 @@ abi_ulong target_shmat(CPUArchState *cpu_env, int shmid,
+         tb_flush(cpu);
+     }
+ 
+-    return raddr;
++    if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
++        FILE *f = qemu_log_trylock();
++        if (f) {
++            fprintf(f, "page layout changed following shmat\n");
++            page_dump(f);
++            qemu_log_unlock(f);
++        }
++    }
++    return shmaddr;
+ }
+ 
+ abi_long target_shmdt(abi_ulong shmaddr)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch b/meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch
new file mode 100644
index 00000000000..5afb35ea0c1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch
@@ -0,0 +1,85 @@
+From 1234063488134ad1f541f56dd30caa7896905f06 Mon Sep 17 00:00:00 2001
+From: Ilya Leoshkevich <iii@linux.ibm.com>
+Date: Wed, 28 Feb 2024 10:25:18 -1000
+Subject: [PATCH 5/5] tests/tcg: Check that shmat() does not break
+ /proc/self/maps
+
+Add a regression test for a recently fixed issue, where shmat()
+desynced the guest and the host view of the address space and caused
+open("/proc/self/maps") to SEGV.
+
+Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
+
+Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
+Message-Id: <jwyuvao4apydvykmsnvacwshdgy3ixv7qvkh4dbxm3jkwgnttw@k4wpaayou7oq>
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ tests/tcg/multiarch/linux/linux-shmat-maps.c | 55 ++++++++++++++++++++
+ 1 file changed, 55 insertions(+)
+ create mode 100644 tests/tcg/multiarch/linux/linux-shmat-maps.c
+
+diff --git a/tests/tcg/multiarch/linux/linux-shmat-maps.c b/tests/tcg/multiarch/linux/linux-shmat-maps.c
+new file mode 100644
+index 000000000..0ccf7a973
+--- /dev/null
++++ b/tests/tcg/multiarch/linux/linux-shmat-maps.c
+@@ -0,0 +1,55 @@
++/*
++ * Test that shmat() does not break /proc/self/maps.
++ *
++ * SPDX-License-Identifier: GPL-2.0-or-later
++ */
++#include <assert.h>
++#include <fcntl.h>
++#include <stdlib.h>
++#include <sys/ipc.h>
++#include <sys/shm.h>
++#include <unistd.h>
++
++int main(void)
++{
++    char buf[128];
++    int err, fd;
++    int shmid;
++    ssize_t n;
++    void *p;
++
++    shmid = shmget(IPC_PRIVATE, 1, IPC_CREAT | 0600);
++    assert(shmid != -1);
++
++    /*
++     * The original bug required a non-NULL address, which skipped the
++     * mmap_find_vma step, which could result in a host mapping smaller
++     * than the target mapping.  Choose an address at random.
++     */
++    p = shmat(shmid, (void *)0x800000, SHM_RND);
++    if (p == (void *)-1) {
++        /*
++         * Because we are now running the testcase for all guests for which
++         * we have a cross-compiler, the above random address might conflict
++         * with the guest executable in some way.  Rather than stopping,
++         * continue with a system supplied address, which should never fail.
++         */
++        p = shmat(shmid, NULL, 0);
++        assert(p != (void *)-1);
++    }
++
++    fd = open("/proc/self/maps", O_RDONLY);
++    assert(fd != -1);
++    do {
++        n = read(fd, buf, sizeof(buf));
++        assert(n >= 0);
++    } while (n != 0);
++    close(fd);
++
++    err = shmdt(p);
++    assert(err == 0);
++    err = shmctl(shmid, IPC_RMID, NULL);
++    assert(err == 0);
++
++    return EXIT_SUCCESS;
++}
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
index 672d5458cde..cc53b1eeddf 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
@@ -40,10 +40,10 @@ Signed-off-by: Mark Hatle <mark.hatle@amd.com>
  create mode 100644 linux-user/mmap-fixed.c
  create mode 100644 linux-user/mmap-fixed.h
 
-Index: qemu-8.2.0/linux-user/elfload.c
+Index: qemu-8.2.1/linux-user/elfload.c
 ===================================================================
---- qemu-8.2.0.orig/linux-user/elfload.c
-+++ qemu-8.2.0/linux-user/elfload.c
+--- qemu-8.2.1.orig/linux-user/elfload.c
++++ qemu-8.2.1/linux-user/elfload.c
 @@ -22,6 +22,7 @@
  #include "qemu/error-report.h"
  #include "target_signal.h"
@@ -65,10 +65,10 @@ Index: qemu-8.2.0/linux-user/elfload.c
      int ret;
  
      if (p == MAP_FAILED) {
-Index: qemu-8.2.0/linux-user/meson.build
+Index: qemu-8.2.1/linux-user/meson.build
 ===================================================================
---- qemu-8.2.0.orig/linux-user/meson.build
-+++ qemu-8.2.0/linux-user/meson.build
+--- qemu-8.2.1.orig/linux-user/meson.build
++++ qemu-8.2.1/linux-user/meson.build
 @@ -14,6 +14,7 @@ linux_user_ss.add(files(
    'linuxload.c',
    'main.c',
@@ -77,10 +77,10 @@ Index: qemu-8.2.0/linux-user/meson.build
    'signal.c',
    'strace.c',
    'syscall.c',
-Index: qemu-8.2.0/linux-user/mmap-fixed.c
+Index: qemu-8.2.1/linux-user/mmap-fixed.c
 ===================================================================
 --- /dev/null
-+++ qemu-8.2.0/linux-user/mmap-fixed.c
++++ qemu-8.2.1/linux-user/mmap-fixed.c
 @@ -0,0 +1,63 @@
 +/*
 + * Workaround for MAP_FIXED_NOREPLACE
@@ -145,10 +145,10 @@ Index: qemu-8.2.0/linux-user/mmap-fixed.c
 +}
 +
 +#endif
-Index: qemu-8.2.0/linux-user/mmap-fixed.h
+Index: qemu-8.2.1/linux-user/mmap-fixed.h
 ===================================================================
 --- /dev/null
-+++ qemu-8.2.0/linux-user/mmap-fixed.h
++++ qemu-8.2.1/linux-user/mmap-fixed.h
 @@ -0,0 +1,39 @@
 +/*
 + * Workaround for MAP_FIXED_NOREPLACE
@@ -189,10 +189,10 @@ Index: qemu-8.2.0/linux-user/mmap-fixed.h
 +#endif /* MAP_FIXED_NOREPLACE */
 +
 +#endif /* MMAP_FIXED_H */
-Index: qemu-8.2.0/linux-user/mmap.c
+Index: qemu-8.2.1/linux-user/mmap.c
 ===================================================================
---- qemu-8.2.0.orig/linux-user/mmap.c
-+++ qemu-8.2.0/linux-user/mmap.c
+--- qemu-8.2.1.orig/linux-user/mmap.c
++++ qemu-8.2.1/linux-user/mmap.c
 @@ -25,6 +25,7 @@
  #include "user-mmap.h"
  #include "target_mman.h"
@@ -201,7 +201,16 @@ Index: qemu-8.2.0/linux-user/mmap.c
  
  #ifdef TARGET_ARM
  #include "target/arm/cpu-features.h"
-@@ -304,9 +305,9 @@ static bool mmap_frag(abi_ulong real_sta
+@@ -273,7 +274,7 @@ int target_mprotect(abi_ulong start, abi
+ static int do_munmap(void *addr, size_t len)
+ {
+     if (reserved_va) {
+-        void *ptr = mmap(addr, len, PROT_NONE,
++        void *ptr =  mmap_fixed_noreplace(addr, len, PROT_NONE,
+                          MAP_FIXED | MAP_ANONYMOUS
+                          | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
+         return ptr == addr ? 0 : -1;
+@@ -319,9 +320,9 @@ static bool mmap_frag(abi_ulong real_sta
           * outside of the fragment we need to map.  Allocate a new host
           * page to cover, discarding whatever else may have been present.
           */
@@ -214,7 +223,7 @@ Index: qemu-8.2.0/linux-user/mmap.c
          if (p != host_start) {
              if (p != MAP_FAILED) {
                  munmap(p, qemu_host_page_size);
-@@ -405,8 +406,9 @@ abi_ulong mmap_find_vma(abi_ulong start,
+@@ -420,8 +421,9 @@ abi_ulong mmap_find_vma(abi_ulong start,
           *  - mremap() with MREMAP_FIXED flag
           *  - shmat() with SHM_REMAP flag
           */
@@ -226,7 +235,7 @@ Index: qemu-8.2.0/linux-user/mmap.c
  
          /* ENOMEM, if host address space has no memory */
          if (ptr == MAP_FAILED) {
-@@ -600,16 +602,16 @@ abi_long target_mmap(abi_ulong start, ab
+@@ -615,16 +617,16 @@ abi_long target_mmap(abi_ulong start, ab
           * especially important if qemu_host_page_size >
           * qemu_real_host_page_size.
           */
@@ -247,7 +256,7 @@ Index: qemu-8.2.0/linux-user/mmap.c
              if (p == MAP_FAILED) {
                  munmap(g2h_untagged(start), host_len);
                  goto fail;
-@@ -734,8 +736,9 @@ abi_long target_mmap(abi_ulong start, ab
+@@ -749,8 +751,9 @@ abi_long target_mmap(abi_ulong start, ab
              len1 = real_last - real_start + 1;
              want_p = g2h_untagged(real_start);
  
@@ -259,23 +268,10 @@ Index: qemu-8.2.0/linux-user/mmap.c
              if (p != want_p) {
                  if (p != MAP_FAILED) {
                      munmap(p, len1);
-@@ -837,9 +840,9 @@ static int mmap_reserve_or_unmap(abi_ulo
-     host_start = g2h_untagged(real_start);
- 
-     if (reserved_va) {
--        void *ptr = mmap(host_start, real_len, PROT_NONE,
--                         MAP_FIXED | MAP_ANONYMOUS
--                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
-+        void *ptr = mmap_fixed_noreplace(host_start, real_len, PROT_NONE,
-+                                         MAP_FIXED | MAP_ANONYMOUS
-+                                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
-         return ptr == host_start ? 0 : -1;
-     }
-     return munmap(host_start, real_len);
-Index: qemu-8.2.0/linux-user/syscall.c
+Index: qemu-8.2.1/linux-user/syscall.c
 ===================================================================
---- qemu-8.2.0.orig/linux-user/syscall.c
-+++ qemu-8.2.0/linux-user/syscall.c
+--- qemu-8.2.1.orig/linux-user/syscall.c
++++ qemu-8.2.1/linux-user/syscall.c
 @@ -145,6 +145,7 @@
  #include "qapi/error.h"
  #include "fd-trans.h"
diff --git a/meta/recipes-devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch b/meta/recipes-devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
new file mode 100644
index 00000000000..5ad859ebe63
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
@@ -0,0 +1,60 @@
+From 4a8579ad8629b57a43daa62e46cc7af6e1078116 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Tue, 13 Feb 2024 10:20:27 -1000
+Subject: [PATCH] linux-user: Split out do_munmap
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [https://gitlab.com/rth7680/qemu/-/commit/4a8579ad8629b57a43daa62e46cc7af6e1078116]
+
+Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+---
+ linux-user/mmap.c | 23 ++++++++++++++++-------
+ 1 file changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/linux-user/mmap.c b/linux-user/mmap.c
+index 1bbfeb25b14..8ebcca44444 100644
+--- a/linux-user/mmap.c
++++ b/linux-user/mmap.c
+@@ -267,6 +267,21 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
+     return ret;
+ }
+ 
++/*
++ * Perform munmap on behalf of the target, with host parameters.
++ * If reserved_va, we must replace the memory reservation.
++ */
++static int do_munmap(void *addr, size_t len)
++{
++    if (reserved_va) {
++        void *ptr = mmap(addr, len, PROT_NONE,
++                         MAP_FIXED | MAP_ANONYMOUS
++                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
++        return ptr == addr ? 0 : -1;
++    }
++    return munmap(addr, len);
++}
++
+ /* map an incomplete host page */
+ static bool mmap_frag(abi_ulong real_start, abi_ulong start, abi_ulong last,
+                       int prot, int flags, int fd, off_t offset)
+@@ -854,13 +869,7 @@ static int mmap_reserve_or_unmap(abi_ulong start, abi_ulong len)
+     real_len = real_last - real_start + 1;
+     host_start = g2h_untagged(real_start);
+ 
+-    if (reserved_va) {
+-        void *ptr = mmap(host_start, real_len, PROT_NONE,
+-                         MAP_FIXED | MAP_ANONYMOUS
+-                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
+-        return ptr == host_start ? 0 : -1;
+-    }
+-    return munmap(host_start, real_len);
++    return do_munmap(host_start, real_len);
+ }
+ 
+ int target_munmap(abi_ulong start, abi_ulong len)
+-- 
+GitLab
+
diff --git a/meta/recipes-devtools/qemu/qemu/fix_segv.patch b/meta/recipes-devtools/qemu/qemu/fix_segv.patch
deleted file mode 100644
index da5ae87e0c4..00000000000
--- a/meta/recipes-devtools/qemu/qemu/fix_segv.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-With qemu 8.2.0 we started seeing SEGV errors when compiling webkitgtk from
-usermode qemu:
-
-qemu-x86_64: QEMU internal SIGSEGV {code=MAPERR, addr=0x20}
-Segmentation fault
-
-By bisection, this was tracked down to:
-
-commit 7b7a3366e142d3baeb3fd1d3660a50e7956c19eb
-Author: Richard Henderson <richard.henderson@linaro.org>
-Date:   Tue Aug 8 20:02:19 2023 -0700
-
-    linux-user: Use walk_memory_regions for open_self_maps
-    
-    Replace the by-hand method of region identification with
-    the official user-exec interface.  Cross-check the region
-    provided to the callback with the interval tree from
-    read_self_maps().
-    
-    Tested-by: Helge Deller <deller@gmx.de>
-    Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
-    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-
-and specifically to 'n' being NULL. For now, just skip in that case
-until a proper fix can be identified.
-
-Reported upstream: https://www.mail-archive.com/qemu-devel@nongnu.org/msg1018813.html
-
-YOCTO #15367
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index e384e14248..2577fb770d 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -8085,6 +8085,9 @@ static int open_self_maps_2(void *opaque, target_ulong guest_start,
-     while (1) {
-         IntervalTreeNode *n =
-             interval_tree_iter_first(d->host_maps, host_start, host_start);
-+        if (!n) {
-+            return 0;
-+        }
-         MapInfo *mi = container_of(n, MapInfo, itree);
-         uintptr_t this_hlast = MIN(host_last, n->last);
-         target_ulong this_gend = h2g(this_hlast) + 1;
-- 
2.40.1


