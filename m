Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 201DF6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 00:35:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8L0Zegl009304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Sep 2017 17:35:40 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 20 Sep 2017 17:35:39 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <juro.bystricky@intel.com>
Date: Thu, 21 Sep 2017 08:34:36 +0800
Message-ID: <1505954077-5031-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 1/2] qemu: remove unused patches
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
X-List-Received-Date: Thu, 21 Sep 2017 00:35:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Remove the following patches since they are unused after qemu update to
2.10:
  0001-replace-struct-ucontext-with-ucontext_t-type.patch
  CVE-2016-9908.patch
  CVE-2016-9912.patch
  configure-fix-Darwin-target-detection.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...lace-struct-ucontext-with-ucontext_t-type.patch | 265 ---------------------
 .../recipes-devtools/qemu/qemu/CVE-2016-9908.patch |  44 ----
 .../recipes-devtools/qemu/qemu/CVE-2016-9912.patch |  45 ----
 .../configure-fix-Darwin-target-detection.patch    |  32 ---
 4 files changed, 386 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/configure-fix-Darwin-target-detection.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch b/meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
deleted file mode 100644
index c3eb543..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
+++ /dev/null
@@ -1,265 +0,0 @@
-From 80954c03163fdbf8b905595a69008093096ee2f6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Jun 2017 13:28:37 -0700
-Subject: [PATCH] replace struct ucontext with ucontext_t type
-
-The ucontext_t type had a tag struct ucontext until now
-but newer glibc will drop it so we need to adjust and use
-the exposed type instead
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Kamil Rytarowski <kamil@netbsd.org>
-Cc: Riku Voipio <riku.voipio@iki.fi>
-Cc: Laurent Vivier <laurent@vivier.eu>
-Cc: Paolo Bonzini <pbonzini@redhat.com>
-
-Upstream-Status: Submitted
----
- linux-user/host/aarch64/hostdep.h |  2 +-
- linux-user/host/arm/hostdep.h     |  2 +-
- linux-user/host/i386/hostdep.h    |  2 +-
- linux-user/host/ppc64/hostdep.h   |  2 +-
- linux-user/host/s390x/hostdep.h   |  2 +-
- linux-user/host/x86_64/hostdep.h  |  2 +-
- linux-user/signal.c               | 10 +++++-----
- tests/tcg/test-i386.c             |  4 ++--
- user-exec.c                       | 18 +++++++++---------
- 9 files changed, 22 insertions(+), 22 deletions(-)
-
-diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
-index 64f75cef49..a8d41a21ad 100644
---- a/linux-user/host/aarch64/hostdep.h
-+++ b/linux-user/host/aarch64/hostdep.h
-@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
- /* Adjust the signal context to rewind out of safe-syscall if we're in it */
- static inline void rewind_if_in_safe_syscall(void *puc)
- {
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     __u64 *pcreg = &uc->uc_mcontext.pc;
- 
-     if (*pcreg > (uintptr_t)safe_syscall_start
-diff --git a/linux-user/host/arm/hostdep.h b/linux-user/host/arm/hostdep.h
-index 5c1ae60120..9276fe6ceb 100644
---- a/linux-user/host/arm/hostdep.h
-+++ b/linux-user/host/arm/hostdep.h
-@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
- /* Adjust the signal context to rewind out of safe-syscall if we're in it */
- static inline void rewind_if_in_safe_syscall(void *puc)
- {
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     unsigned long *pcreg = &uc->uc_mcontext.arm_pc;
- 
-     if (*pcreg > (uintptr_t)safe_syscall_start
-diff --git a/linux-user/host/i386/hostdep.h b/linux-user/host/i386/hostdep.h
-index d834bd80ea..073be74d87 100644
---- a/linux-user/host/i386/hostdep.h
-+++ b/linux-user/host/i386/hostdep.h
-@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
- /* Adjust the signal context to rewind out of safe-syscall if we're in it */
- static inline void rewind_if_in_safe_syscall(void *puc)
- {
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     greg_t *pcreg = &uc->uc_mcontext.gregs[REG_EIP];
- 
-     if (*pcreg > (uintptr_t)safe_syscall_start
-diff --git a/linux-user/host/ppc64/hostdep.h b/linux-user/host/ppc64/hostdep.h
-index 0b0f5f7821..98979ad917 100644
---- a/linux-user/host/ppc64/hostdep.h
-+++ b/linux-user/host/ppc64/hostdep.h
-@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
- /* Adjust the signal context to rewind out of safe-syscall if we're in it */
- static inline void rewind_if_in_safe_syscall(void *puc)
- {
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     unsigned long *pcreg = &uc->uc_mcontext.gp_regs[PT_NIP];
- 
-     if (*pcreg > (uintptr_t)safe_syscall_start
-diff --git a/linux-user/host/s390x/hostdep.h b/linux-user/host/s390x/hostdep.h
-index 6f9da9c608..4f0171f36f 100644
---- a/linux-user/host/s390x/hostdep.h
-+++ b/linux-user/host/s390x/hostdep.h
-@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
- /* Adjust the signal context to rewind out of safe-syscall if we're in it */
- static inline void rewind_if_in_safe_syscall(void *puc)
- {
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     unsigned long *pcreg = &uc->uc_mcontext.psw.addr;
- 
-     if (*pcreg > (uintptr_t)safe_syscall_start
-diff --git a/linux-user/host/x86_64/hostdep.h b/linux-user/host/x86_64/hostdep.h
-index 3b4259633e..a4fefb5114 100644
---- a/linux-user/host/x86_64/hostdep.h
-+++ b/linux-user/host/x86_64/hostdep.h
-@@ -24,7 +24,7 @@ extern char safe_syscall_end[];
- /* Adjust the signal context to rewind out of safe-syscall if we're in it */
- static inline void rewind_if_in_safe_syscall(void *puc)
- {
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     greg_t *pcreg = &uc->uc_mcontext.gregs[REG_RIP];
- 
-     if (*pcreg > (uintptr_t)safe_syscall_start
-diff --git a/linux-user/signal.c b/linux-user/signal.c
-index c750053edd..4638123dd8 100644
---- a/linux-user/signal.c
-+++ b/linux-user/signal.c
-@@ -3170,7 +3170,7 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
-     *
-     *   a0 = signal number
-     *   a1 = pointer to siginfo_t
--    *   a2 = pointer to struct ucontext
-+    *   a2 = pointer to ucontext_t
-     *
-     * $25 and PC point to the signal handler, $29 points to the
-     * struct sigframe.
-@@ -3557,7 +3557,7 @@ struct target_signal_frame {
- 
- struct rt_signal_frame {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-     uint32_t tramp[2];
- };
- 
-@@ -3773,7 +3773,7 @@ struct rt_signal_frame {
-     siginfo_t *pinfo;
-     void *puc;
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-     uint16_t retcode[4];      /* Trampoline code. */
- };
- 
-@@ -4074,7 +4074,7 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
-         tswap_siginfo(&frame->info, info);
-     }
- 
--    /*err |= __clear_user(&frame->uc, offsetof(struct ucontext, uc_mcontext));*/
-+    /*err |= __clear_user(&frame->uc, offsetof(ucontext_t, uc_mcontext));*/
-     __put_user(0, &frame->uc.tuc_flags);
-     __put_user(0, &frame->uc.tuc_link);
-     __put_user(target_sigaltstack_used.ss_sp,
-@@ -4565,7 +4565,7 @@ enum {
- 
- struct target_ucontext {
-     target_ulong tuc_flags;
--    target_ulong tuc_link;    /* struct ucontext __user * */
-+    target_ulong tuc_link;    /* ucontext_t __user * */
-     struct target_sigaltstack tuc_stack;
- #if !defined(TARGET_PPC64)
-     int32_t tuc_pad[7];
-diff --git a/tests/tcg/test-i386.c b/tests/tcg/test-i386.c
-index 0f7b943b0c..9599204895 100644
---- a/tests/tcg/test-i386.c
-+++ b/tests/tcg/test-i386.c
-@@ -1720,7 +1720,7 @@ int tab[2];
- 
- void sig_handler(int sig, siginfo_t *info, void *puc)
- {
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
- 
-     printf("si_signo=%d si_errno=%d si_code=%d",
-            info->si_signo, info->si_errno, info->si_code);
-@@ -1912,7 +1912,7 @@ void test_exceptions(void)
- /* specific precise single step test */
- void sig_trap_handler(int sig, siginfo_t *info, void *puc)
- {
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     printf("EIP=" FMTLX "\n", (long)uc->uc_mcontext.gregs[REG_EIP]);
- }
- 
-diff --git a/user-exec.c b/user-exec.c
-index 6db075884d..3f1b899e3d 100644
---- a/user-exec.c
-+++ b/user-exec.c
-@@ -155,7 +155,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
- #elif defined(__OpenBSD__)
-     struct sigcontext *uc = puc;
- #else
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
- #endif
-     unsigned long pc;
-     int trapno;
-@@ -210,7 +210,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
- #elif defined(__OpenBSD__)
-     struct sigcontext *uc = puc;
- #else
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
- #endif
- 
-     pc = PC_sig(uc);
-@@ -277,7 +277,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
- #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
-     ucontext_t *uc = puc;
- #else
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
- #endif
-     unsigned long pc;
-     int is_write;
-@@ -304,7 +304,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
-                            void *puc)
- {
-     siginfo_t *info = pinfo;
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     uint32_t *pc = uc->uc_mcontext.sc_pc;
-     uint32_t insn = *pc;
-     int is_write = 0;
-@@ -402,7 +402,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
- #if defined(__NetBSD__)
-     ucontext_t *uc = puc;
- #else
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
- #endif
-     unsigned long pc;
-     int is_write;
-@@ -429,7 +429,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
- int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
- {
-     siginfo_t *info = pinfo;
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     uintptr_t pc = uc->uc_mcontext.pc;
-     uint32_t insn = *(uint32_t *)pc;
-     bool is_write;
-@@ -462,7 +462,7 @@ int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
- int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
- {
-     siginfo_t *info = pinfo;
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     unsigned long ip;
-     int is_write = 0;
- 
-@@ -493,7 +493,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
-                        void *puc)
- {
-     siginfo_t *info = pinfo;
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     unsigned long pc;
-     uint16_t *pinsn;
-     int is_write = 0;
-@@ -546,7 +546,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
-                        void *puc)
- {
-     siginfo_t *info = pinfo;
--    struct ucontext *uc = puc;
-+    ucontext_t *uc = puc;
-     greg_t pc = uc->uc_mcontext.pc;
-     int is_write;
- 
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch
deleted file mode 100644
index e0f7a1a..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-9908.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7139ccbc907441337b4b59cde2c5b5a54cb5b2cc Mon Sep 17 00:00:00 2001
-From: Sona Sarmadi <sona.sarmadi@enea.com>
-
-virtio-gpu: fix information leak in capset get dispatch
-
-In virgl_cmd_get_capset function, it uses g_malloc to allocate
-a response struct to the guest. As the 'resp'struct hasn't been full
-initialized it will lead the 'resp->padding' field to the guest.
-Use g_malloc0 to avoid this.
-
-Signed-off-by: Li Qiang <liqiang6-s@360.cn>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 58188cae.4a6ec20a.3d2d1.aff2@mx.google.com
-
-[Sona: backported from master to v2.8.0 and resolved conflict]
-
-Reference to upstream patch:
-http://git.qemu-project.org/?p=qemu.git;a=commit;h=85d9d044471f93c48c5c396f7e217b4ef12f69f8
-
-CVE: CVE-2016-9908
-Upstream-Status: Backport
-
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
- hw/display/virtio-gpu-3d.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
-index 23f39de..d98b140 100644
---- a/hw/display/virtio-gpu-3d.c
-+++ b/hw/display/virtio-gpu-3d.c
-@@ -371,7 +371,7 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
- 
-     virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
-                                &max_size);
--    resp = g_malloc(sizeof(*resp) + max_size);
-+    resp = g_malloc0(sizeof(*resp) + max_size);
- 
-     resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;
-     virgl_renderer_fill_caps(gc.capset_id,
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch
deleted file mode 100644
index c009ffd..0000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2016-9912.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From b8e23926c568f2e963af39028b71c472e3023793 Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@gmail.com>
-Date: Mon, 28 Nov 2016 21:29:25 -0500
-Subject: [PATCH] virtio-gpu: call cleanup mapping function in resource destroy
-
-If the guest destroy the resource before detach banking, the 'iov'
-and 'addrs' field in resource is not freed thus leading memory
-leak issue. This patch avoid this.
-
-CVE: CVE-2016-9912
-Upstream-Status: Backport
-
-Signed-off-by: Li Qiang <liq3ea@gmail.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 1480386565-10077-1-git-send-email-liq3ea@gmail.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
- hw/display/virtio-gpu.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
-index ed2b6d3..6a26258 100644
---- a/hw/display/virtio-gpu.c
-+++ b/hw/display/virtio-gpu.c
-@@ -28,6 +28,8 @@
- static struct virtio_gpu_simple_resource*
- virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
- 
-+static void virtio_gpu_cleanup_mapping(struct virtio_gpu_simple_resource *res);
-+
- #ifdef CONFIG_VIRGL
- #include <virglrenderer.h>
- #define VIRGL(_g, _virgl, _simple, ...)                     \
-@@ -364,6 +366,7 @@ static void virtio_gpu_resource_destroy(VirtIOGPU *g,
-                                         struct virtio_gpu_simple_resource *res)
- {
-     pixman_image_unref(res->image);
-+    virtio_gpu_cleanup_mapping(res);
-     QTAILQ_REMOVE(&g->reslist, res, next);
-     g->hostmem -= res->hostmem;
-     g_free(res);
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/configure-fix-Darwin-target-detection.patch b/meta/recipes-devtools/qemu/qemu/configure-fix-Darwin-target-detection.patch
deleted file mode 100644
index 59cdc1c..0000000
--- a/meta/recipes-devtools/qemu/qemu/configure-fix-Darwin-target-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
-
-From 9ac096d8eccf2d56ece646320c282c8369f8337c Mon Sep 17 00:00:00 2001
-From: Cristian Iorga <cristian.iorga@intel.com>
-Date: Tue, 29 Jul 2014 18:35:59 +0300
-Subject: [PATCH] configure: fix Darwin target detection
-
-fix Darwin target detection for qemu
-cross-compilation.
-
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
----
- configure | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure b/configure
-index 283c71c..1c66a11 100755
---- a/configure
-+++ b/configure
-@@ -444,6 +444,8 @@ elif check_define __sun__ ; then
-   targetos='SunOS'
- elif check_define __HAIKU__ ; then
-   targetos='Haiku'
-+elif check_define __APPLE__ ; then
-+  targetos='Darwin'
- else
-   targetos=`uname -s`
- fi
--- 
-1.9.1
-
-- 
2.7.4


