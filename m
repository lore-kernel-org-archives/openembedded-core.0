Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC9C078296
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:24:04 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e199so20439152pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fPE7CmQrvQ7RJD0gaQUOueRlwe6mkfkjwS09/1+/AwU=;
	b=uvpa0ORqwkrK5ZtnHeb+HT9Y8vF9iGP0AOmKedzC8FNZlSDbYL/39VrK1hcLhqO7tM
	iLi22+OZr5cyj9oM/GTrsstWJCPQr2PhYgZ6kbH+dwJADFo/W4CHEFVz2NzIzVYtOmU+
	vjcfZb+qjA4yb7JoP8HL7a402B7E6qRN2kxNOKKmYIj2gsajto7mfYdchlok42aY9bEv
	jcpXjViIw7cwaTkA3A9datd5fBeT7tQxVTMWXTRfcU5ZFCJ90uRujzJJjqM/leeus+bv
	RUGQ18ZwUHuoL+bj6pxA8ZIW61oRUllQJMLGoeG9Gwd9GXgI+Q5Qp3COVQAWFi4Rs/px
	iQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fPE7CmQrvQ7RJD0gaQUOueRlwe6mkfkjwS09/1+/AwU=;
	b=Pdat1qrCHCiQapPiZ8Csvt4CPf8JA022SfeGNvOhcmaEv2r83FDPupyCzMXj19iFar
	YRohDS/AMYqS/uGIZc8nzQsg8WAuUkgQF958uyEh7O1NZoRNlW8YTB3MkcczpHWI5dQ9
	7W9cPsxBJywa9fnlHYB8UGNnPafoIaeCZFio5KjmykYNh+I6wmHvzOELTMlJPs69pGr2
	AZesRpPN1/wHCquHKYuw2T6vOQtjliGOo+tLd6+yp2qOwUwallcDA+Sjq1T2S8/Ad99O
	QrGgCsnVrLmTQR9vmy1ZGTrk0mjK5L4tVU1Zz/X6rttzSF0UZP2e7f4UzKkHeE9jIpFa
	vhDg==
X-Gm-Message-State: AIVw110zBfhJXxLo23dyvlANA4S57vHKyQLXQuKb9A34ZXHR0eQjQNed
	hyUdHMGU5sJ5E6wy
X-Received: by 10.101.75.199 with SMTP id p7mr1042619pgr.164.1498919045957;
	Sat, 01 Jul 2017 07:24:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.24.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:24:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:21 -0700
Message-Id: <7499fec4fe868c03034563c7fb27ecffa066d7a6.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 18/19] qemu: Replace use of struct ucontext with ucontext_t
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Jul 2017 14:24:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lace-struct-ucontext-with-ucontext_t-type.patch | 265 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb         |  46 ++--
 2 files changed, 286 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch b/meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
new file mode 100644
index 0000000000..c3eb543ec0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
@@ -0,0 +1,265 @@
+From 80954c03163fdbf8b905595a69008093096ee2f6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Jun 2017 13:28:37 -0700
+Subject: [PATCH] replace struct ucontext with ucontext_t type
+
+The ucontext_t type had a tag struct ucontext until now
+but newer glibc will drop it so we need to adjust and use
+the exposed type instead
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Kamil Rytarowski <kamil@netbsd.org>
+Cc: Riku Voipio <riku.voipio@iki.fi>
+Cc: Laurent Vivier <laurent@vivier.eu>
+Cc: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Submitted
+---
+ linux-user/host/aarch64/hostdep.h |  2 +-
+ linux-user/host/arm/hostdep.h     |  2 +-
+ linux-user/host/i386/hostdep.h    |  2 +-
+ linux-user/host/ppc64/hostdep.h   |  2 +-
+ linux-user/host/s390x/hostdep.h   |  2 +-
+ linux-user/host/x86_64/hostdep.h  |  2 +-
+ linux-user/signal.c               | 10 +++++-----
+ tests/tcg/test-i386.c             |  4 ++--
+ user-exec.c                       | 18 +++++++++---------
+ 9 files changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
+index 64f75cef49..a8d41a21ad 100644
+--- a/linux-user/host/aarch64/hostdep.h
++++ b/linux-user/host/aarch64/hostdep.h
+@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
+ /* Adjust the signal context to rewind out of safe-syscall if we're in it */
+ static inline void rewind_if_in_safe_syscall(void *puc)
+ {
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     __u64 *pcreg = &uc->uc_mcontext.pc;
+ 
+     if (*pcreg > (uintptr_t)safe_syscall_start
+diff --git a/linux-user/host/arm/hostdep.h b/linux-user/host/arm/hostdep.h
+index 5c1ae60120..9276fe6ceb 100644
+--- a/linux-user/host/arm/hostdep.h
++++ b/linux-user/host/arm/hostdep.h
+@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
+ /* Adjust the signal context to rewind out of safe-syscall if we're in it */
+ static inline void rewind_if_in_safe_syscall(void *puc)
+ {
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     unsigned long *pcreg = &uc->uc_mcontext.arm_pc;
+ 
+     if (*pcreg > (uintptr_t)safe_syscall_start
+diff --git a/linux-user/host/i386/hostdep.h b/linux-user/host/i386/hostdep.h
+index d834bd80ea..073be74d87 100644
+--- a/linux-user/host/i386/hostdep.h
++++ b/linux-user/host/i386/hostdep.h
+@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
+ /* Adjust the signal context to rewind out of safe-syscall if we're in it */
+ static inline void rewind_if_in_safe_syscall(void *puc)
+ {
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     greg_t *pcreg = &uc->uc_mcontext.gregs[REG_EIP];
+ 
+     if (*pcreg > (uintptr_t)safe_syscall_start
+diff --git a/linux-user/host/ppc64/hostdep.h b/linux-user/host/ppc64/hostdep.h
+index 0b0f5f7821..98979ad917 100644
+--- a/linux-user/host/ppc64/hostdep.h
++++ b/linux-user/host/ppc64/hostdep.h
+@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
+ /* Adjust the signal context to rewind out of safe-syscall if we're in it */
+ static inline void rewind_if_in_safe_syscall(void *puc)
+ {
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     unsigned long *pcreg = &uc->uc_mcontext.gp_regs[PT_NIP];
+ 
+     if (*pcreg > (uintptr_t)safe_syscall_start
+diff --git a/linux-user/host/s390x/hostdep.h b/linux-user/host/s390x/hostdep.h
+index 6f9da9c608..4f0171f36f 100644
+--- a/linux-user/host/s390x/hostdep.h
++++ b/linux-user/host/s390x/hostdep.h
+@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
+ /* Adjust the signal context to rewind out of safe-syscall if we're in it */
+ static inline void rewind_if_in_safe_syscall(void *puc)
+ {
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     unsigned long *pcreg = &uc->uc_mcontext.psw.addr;
+ 
+     if (*pcreg > (uintptr_t)safe_syscall_start
+diff --git a/linux-user/host/x86_64/hostdep.h b/linux-user/host/x86_64/hostdep.h
+index 3b4259633e..a4fefb5114 100644
+--- a/linux-user/host/x86_64/hostdep.h
++++ b/linux-user/host/x86_64/hostdep.h
+@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
+ /* Adjust the signal context to rewind out of safe-syscall if we're in it */
+ static inline void rewind_if_in_safe_syscall(void *puc)
+ {
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     greg_t *pcreg = &uc->uc_mcontext.gregs[REG_RIP];
+ 
+     if (*pcreg > (uintptr_t)safe_syscall_start
+diff --git a/linux-user/signal.c b/linux-user/signal.c
+index c750053edd..4638123dd8 100644
+--- a/linux-user/signal.c
++++ b/linux-user/signal.c
+@@ -3170,7 +3170,7 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
+     *
+     *   a0 = signal number
+     *   a1 = pointer to siginfo_t
+-    *   a2 = pointer to struct ucontext
++    *   a2 = pointer to ucontext_t
+     *
+     * $25 and PC point to the signal handler, $29 points to the
+     * struct sigframe.
+@@ -3557,7 +3557,7 @@ struct target_signal_frame {
+ 
+ struct rt_signal_frame {
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+     uint32_t tramp[2];
+ };
+ 
+@@ -3773,7 +3773,7 @@ struct rt_signal_frame {
+     siginfo_t *pinfo;
+     void *puc;
+     siginfo_t info;
+-    struct ucontext uc;
++    ucontext_t uc;
+     uint16_t retcode[4];      /* Trampoline code. */
+ };
+ 
+@@ -4074,7 +4074,7 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
+         tswap_siginfo(&frame->info, info);
+     }
+ 
+-    /*err |= __clear_user(&frame->uc, offsetof(struct ucontext, uc_mcontext));*/
++    /*err |= __clear_user(&frame->uc, offsetof(ucontext_t, uc_mcontext));*/
+     __put_user(0, &frame->uc.tuc_flags);
+     __put_user(0, &frame->uc.tuc_link);
+     __put_user(target_sigaltstack_used.ss_sp,
+@@ -4565,7 +4565,7 @@ enum {
+ 
+ struct target_ucontext {
+     target_ulong tuc_flags;
+-    target_ulong tuc_link;    /* struct ucontext __user * */
++    target_ulong tuc_link;    /* ucontext_t __user * */
+     struct target_sigaltstack tuc_stack;
+ #if !defined(TARGET_PPC64)
+     int32_t tuc_pad[7];
+diff --git a/tests/tcg/test-i386.c b/tests/tcg/test-i386.c
+index 0f7b943b0c..9599204895 100644
+--- a/tests/tcg/test-i386.c
++++ b/tests/tcg/test-i386.c
+@@ -1720,7 +1720,7 @@ int tab[2];
+ 
+ void sig_handler(int sig, siginfo_t *info, void *puc)
+ {
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+ 
+     printf("si_signo=%d si_errno=%d si_code=%d",
+            info->si_signo, info->si_errno, info->si_code);
+@@ -1912,7 +1912,7 @@ void test_exceptions(void)
+ /* specific precise single step test */
+ void sig_trap_handler(int sig, siginfo_t *info, void *puc)
+ {
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     printf("EIP=" FMTLX "\n", (long)uc->uc_mcontext.gregs[REG_EIP]);
+ }
+ 
+diff --git a/user-exec.c b/user-exec.c
+index 6db075884d..3f1b899e3d 100644
+--- a/user-exec.c
++++ b/user-exec.c
+@@ -155,7 +155,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+ #elif defined(__OpenBSD__)
+     struct sigcontext *uc = puc;
+ #else
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+ #endif
+     unsigned long pc;
+     int trapno;
+@@ -210,7 +210,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+ #elif defined(__OpenBSD__)
+     struct sigcontext *uc = puc;
+ #else
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+ #endif
+ 
+     pc = PC_sig(uc);
+@@ -277,7 +277,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+ #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
+     ucontext_t *uc = puc;
+ #else
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+ #endif
+     unsigned long pc;
+     int is_write;
+@@ -304,7 +304,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+                            void *puc)
+ {
+     siginfo_t *info = pinfo;
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     uint32_t *pc = uc->uc_mcontext.sc_pc;
+     uint32_t insn = *pc;
+     int is_write = 0;
+@@ -402,7 +402,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+ #if defined(__NetBSD__)
+     ucontext_t *uc = puc;
+ #else
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+ #endif
+     unsigned long pc;
+     int is_write;
+@@ -429,7 +429,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+ int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
+ {
+     siginfo_t *info = pinfo;
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     uintptr_t pc = uc->uc_mcontext.pc;
+     uint32_t insn = *(uint32_t *)pc;
+     bool is_write;
+@@ -462,7 +462,7 @@ int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
+ int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
+ {
+     siginfo_t *info = pinfo;
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     unsigned long ip;
+     int is_write = 0;
+ 
+@@ -493,7 +493,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+                        void *puc)
+ {
+     siginfo_t *info = pinfo;
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     unsigned long pc;
+     uint16_t *pinsn;
+     int is_write = 0;
+@@ -546,7 +546,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+                        void *puc)
+ {
+     siginfo_t *info = pinfo;
+-    struct ucontext *uc = puc;
++    ucontext_t *uc = puc;
+     greg_t pc = uc->uc_mcontext.pc;
+     int is_write;
+ 
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
index d37dd49064..a5dc70469d 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
@@ -7,37 +7,33 @@ RDEPENDS_${PN}-ptest = "bash make"
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += " \
-            file://powerpc_rom.bin \
-            file://disable-grabs.patch \
-            file://exclude-some-arm-EABI-obsolete-syscalls.patch \
-            file://wacom.patch \
-            file://add-ptest-in-makefile.patch \
-            file://run-ptest \
-            file://configure-fix-Darwin-target-detection.patch \
-            file://qemu-enlarge-env-entry-size.patch \
-            file://no-valgrind.patch \
-            file://pathlimit.patch \
-            file://qemu-2.5.0-cflags.patch \
-            file://glibc-2.25.patch \
-"
-
-SRC_URI += " \
-            file://0001-Provide-support-for-the-CUSE-TPM.patch \
-            file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
-            file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
-            file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch \
-            file://CVE-2016-9908.patch \
-            file://CVE-2016-9912.patch \
-"
+SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
+           file://powerpc_rom.bin \
+           file://disable-grabs.patch \
+           file://exclude-some-arm-EABI-obsolete-syscalls.patch \
+           file://wacom.patch \
+           file://add-ptest-in-makefile.patch \
+           file://run-ptest \
+           file://configure-fix-Darwin-target-detection.patch \
+           file://qemu-enlarge-env-entry-size.patch \
+           file://no-valgrind.patch \
+           file://pathlimit.patch \
+           file://qemu-2.5.0-cflags.patch \
+           file://glibc-2.25.patch \
+           file://0001-Provide-support-for-the-CUSE-TPM.patch \
+           file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch \
+           file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
+           file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch \
+           file://CVE-2016-9908.patch \
+           file://CVE-2016-9912.patch \
+           file://0001-replace-struct-ucontext-with-ucontext_t-type.patch \
+           "
 
 SRC_URI_append_class-native = " \
             file://fix-libcap-header-issue-on-some-distro.patch \
             file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
             "
 
-SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-
 SRC_URI[md5sum] = "a6a23a0c59fd0f8ec564b0fb89a79954"
 SRC_URI[sha256sum] = "f62ab18a1fb9ff5b4c81ed44becc945b11581eff777618141bdb787da55d3638"
 
-- 
2.13.2


