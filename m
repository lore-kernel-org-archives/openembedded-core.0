Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8751F771EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 22:07:19 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 31 Jan 2017 14:07:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; d="scan'208";a="59699333"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.122])
	by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2017 14:07:18 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 16:10:24 -0600
Message-Id: <1485900624-22510-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCHv4] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Tue, 31 Jan 2017 22:07:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Added patches:

- target-ppc-fix-user-mode.patch

Rebased patches:

- exclude-some-arm-EABI-obsolete-syscalls.patc

Removed patches (already in upstream):

- 0003-fix-CVE-2016-7908.patch
- 0004-fix-CVE-2016-7909.patch
- 0001-target-mips-add-24KEc-CPU-definition.patch

Changelog,

http://wiki.qemu.org/ChangeLog/2.8

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 -
 ...0001-target-mips-add-24KEc-CPU-definition.patch | 54 -------------------
 .../qemu/qemu/0003-fix-CVE-2016-7908.patch         | 62 ----------------------
 .../qemu/qemu/0004-fix-CVE-2016-7909.patch         | 42 ---------------
 ...-Arm-versatilepb-Add-memory-size-checking.patch | 46 ----------------
 .../exclude-some-arm-EABI-obsolete-syscalls.patch  | 22 +++-----
 .../qemu/qemu/target-ppc-fix-user-mode.patch       | 48 +++++++++++++++++
 .../qemu/{qemu_2.7.1.bb => qemu_2.8.0.bb}          |  8 ++-
 8 files changed, 59 insertions(+), 224 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
 rename meta/recipes-devtools/qemu/{qemu_2.7.1.bb => qemu_2.8.0.bb} (70%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ac5fcac..e3af5c2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -19,7 +19,6 @@ SRC_URI = "\
     file://wacom.patch \
     file://add-ptest-in-makefile.patch \
     file://run-ptest \
-    file://0001-target-mips-add-24KEc-CPU-definition.patch \
     "
 
 SRC_URI_append_class-native = "\
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch b/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch
deleted file mode 100644
index c4dbee7..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 926bc194f918d46bd93557b15da8153b6a94a1d5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
-Date: Mon, 25 Jul 2016 23:58:22 +0100
-Subject: [PATCH] target-mips: add 24KEc CPU definition
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Define a new CPU definition supporting 24KEc cores, similar to
-the existing 24Kc, but with added support for DSP instructions
-and MIPS16e (and without FPU).
-
-Signed-off-by: André Draszik <git@andred.net>
----
-Upstream-Status: Submitted [http://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg05778.html]
- target-mips/translate_init.c | 22 ++++++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
-index 39ed5c4..6ae23e4 100644
---- a/target-mips/translate_init.c
-+++ b/target-mips/translate_init.c
-@@ -256,6 +256,28 @@ static const mips_def_t mips_defs[] =
-         .mmu_type = MMU_TYPE_R4000,
-     },
-     {
-+        .name = "24KEc",
-+        .CP0_PRid = 0x00019600,
-+        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
-+                       (MMU_TYPE_R4000 << CP0C0_MT),
-+        .CP0_Config1 = MIPS_CONFIG1 | (15 << CP0C1_MMU) |
-+                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
-+                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
-+                       (1 << CP0C1_CA),
-+        .CP0_Config2 = MIPS_CONFIG2,
-+        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_DSPP) | (0 << CP0C3_VInt),
-+        .CP0_LLAddr_rw_bitmask = 0,
-+        .CP0_LLAddr_shift = 4,
-+        .SYNCI_Step = 32,
-+        .CCRes = 2,
-+        /* we have a DSP, but no FPU */
-+        .CP0_Status_rw_bitmask = 0x1378FF1F,
-+        .SEGBITS = 32,
-+        .PABITS = 32,
-+        .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP,
-+        .mmu_type = MMU_TYPE_R4000,
-+    },
-+    {
-         .name = "24Kf",
-         .CP0_PRid = 0x00019300,
-         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch b/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
deleted file mode 100644
index 05cc3d9..0000000
--- a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2016-7908 from:
-
-http://git.qemu.org/?p=qemu.git;a=commit;h=070c4b92b8c
-
-CVE: CVE-2016-7908
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 070c4b92b8cd5390889716677a0b92444d6e087a Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 22 Sep 2016 16:02:37 +0530
-Subject: [PATCH] net: mcf: limit buffer descriptor count
-
-ColdFire Fast Ethernet Controller uses buffer descriptors to manage
-data flow to/fro receive & transmit queues. While transmitting
-packets, it could continue to read buffer descriptors if a buffer
-descriptor has length of zero and has crafted values in bd.flags.
-Set upper limit to number of buffer descriptors.
-
-Reported-by: Li Qiang <liqiang6-s@360.cn>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
----
- hw/net/mcf_fec.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
-index 0ee8ad9..d31fea1 100644
---- a/hw/net/mcf_fec.c
-+++ b/hw/net/mcf_fec.c
-@@ -23,6 +23,7 @@ do { printf("mcf_fec: " fmt , ## __VA_ARGS__); } while (0)
- #define DPRINTF(fmt, ...) do {} while(0)
- #endif
- 
-+#define FEC_MAX_DESC 1024
- #define FEC_MAX_FRAME_SIZE 2032
- 
- typedef struct {
-@@ -149,7 +150,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
-     uint32_t addr;
-     mcf_fec_bd bd;
-     int frame_size;
--    int len;
-+    int len, descnt = 0;
-     uint8_t frame[FEC_MAX_FRAME_SIZE];
-     uint8_t *ptr;
- 
-@@ -157,7 +158,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
-     ptr = frame;
-     frame_size = 0;
-     addr = s->tx_descriptor;
--    while (1) {
-+    while (descnt++ < FEC_MAX_DESC) {
-         mcf_fec_read_bd(&bd, addr);
-         DPRINTF("tx_bd %x flags %04x len %d data %08x\n",
-                 addr, bd.flags, bd.length, bd.data);
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch b/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
deleted file mode 100644
index e71bbf6..0000000
--- a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Backport [http://git.qemu.org/?p=qemu.git;a=commit;h=34e29ce]
-CVE: CVE-2016-7909
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 34e29ce754c02bb6b3bdd244fbb85033460feaff Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Fri, 30 Sep 2016 00:27:33 +0530
-Subject: [PATCH] net: pcnet: check rx/tx descriptor ring length
-
-The AMD PC-Net II emulator has set of control and status(CSR)
-registers. Of these, CSR76 and CSR78 hold receive and transmit
-descriptor ring length respectively. This ring length could range
-from 1 to 65535. Setting ring length to zero leads to an infinite
-loop in pcnet_rdra_addr() or pcnet_transmit(). Add check to avoid it.
-
-Reported-by: Li Qiang <liqiang6-s@360.cn>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
----
- hw/net/pcnet.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
-index 198a01f..3078de8 100644
---- a/hw/net/pcnet.c
-+++ b/hw/net/pcnet.c
-@@ -1429,8 +1429,11 @@ static void pcnet_csr_writew(PCNetState *s, uint32_t rap, uint32_t new_value)
-     case 47: /* POLLINT */
-     case 72:
-     case 74:
-+        break;
-     case 76: /* RCVRL */
-     case 78: /* XMTRL */
-+        val = (val > 0) ? val : 512;
-+        break;
-     case 112:
-        if (CSR_STOP(s) || CSR_SPND(s))
-            break;
--- 
-2.10.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
deleted file mode 100644
index 1a6cf51..0000000
--- a/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 896fa02c24347e6e9259812cfda187b1d6ca6199 Mon Sep 17 00:00:00 2001
-From: Jiang Lu <lu.jiang@windriver.com>
-Date: Wed, 13 Nov 2013 10:38:08 +0800
-Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking
-
-The machine can not work with memory over 256M, so add a checking
-at startup. If the memory size exceed 256M, just stop emulation then
-throw out warning about memory limitation.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
-
-Updated it on 2014-01-15 for rebasing
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Update it when upgrade qemu to 2.2.0
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
----
- hw/arm/versatilepb.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
-index 6c69f4e..9278d90 100644
---- a/hw/arm/versatilepb.c
-+++ b/hw/arm/versatilepb.c
-@@ -204,6 +204,13 @@ static void versatile_init(MachineState *machine, int board_id)
-         exit(1);
-     }
-
-+    if (machine->ram_size > (256 << 20)) {
-+        fprintf(stderr,
-+                "qemu: Too much memory for this machine: %d MB, maximum 256 MB\n",
-+                ((unsigned int)ram_size / (1 << 20)));
-+        exit(1);
-+    }
-+
-     cpuobj = object_new(object_class_get_name(cpu_oc));
-
-     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
--- 
-2.1.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
index 171bda7..f593cf9 100644
--- a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
+++ b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
@@ -27,14 +27,14 @@ or kernel header:
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
- qemu-seccomp.c | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
+ qemu-seccomp.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/qemu-seccomp.c b/qemu-seccomp.c
-index caa926e..5a78502 100644
+index df75d9c..0e577f8 100644
 --- a/qemu-seccomp.c
 +++ b/qemu-seccomp.c
-@@ -25,15 +25,21 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+@@ -35,15 +35,21 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
      { SCMP_SYS(timer_settime), 255 },
      { SCMP_SYS(timer_gettime), 254 },
      { SCMP_SYS(futex), 253 },
@@ -58,7 +58,7 @@ index caa926e..5a78502 100644
      { SCMP_SYS(mprotect), 246 },
      { SCMP_SYS(execve), 245 },
      { SCMP_SYS(open), 245 },
-@@ -48,13 +54,11 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+@@ -58,7 +64,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
      { SCMP_SYS(bind), 245 },
      { SCMP_SYS(listen), 245 },
      { SCMP_SYS(semget), 245 },
@@ -66,13 +66,7 @@ index caa926e..5a78502 100644
      { SCMP_SYS(gettimeofday), 245 },
      { SCMP_SYS(readlink), 245 },
      { SCMP_SYS(access), 245 },
-     { SCMP_SYS(prctl), 245 },
-     { SCMP_SYS(signalfd), 245 },
--    { SCMP_SYS(getrlimit), 245 },
-     { SCMP_SYS(set_tid_address), 245 },
-     { SCMP_SYS(statfs), 245 },
-     { SCMP_SYS(unlink), 245 },
-@@ -93,7 +97,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+@@ -104,7 +109,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
      { SCMP_SYS(times), 245 },
      { SCMP_SYS(exit), 245 },
      { SCMP_SYS(clock_gettime), 245 },
@@ -80,7 +74,7 @@ index caa926e..5a78502 100644
      { SCMP_SYS(restart_syscall), 245 },
      { SCMP_SYS(pwrite64), 245 },
      { SCMP_SYS(nanosleep), 245 },
-@@ -182,7 +185,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+@@ -194,7 +198,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
      { SCMP_SYS(lstat64), 241 },
      { SCMP_SYS(sendfile64), 241 },
      { SCMP_SYS(ugetrlimit), 241 },
@@ -89,5 +83,5 @@ index caa926e..5a78502 100644
      { SCMP_SYS(rt_sigqueueinfo), 241 },
      { SCMP_SYS(rt_tgsigqueueinfo), 241 },
 -- 
-1.9.1
+2.1.4
 
diff --git a/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch b/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
new file mode 100644
index 0000000..ba21e71
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
@@ -0,0 +1,48 @@
+[Qemu-ppc] [PATCH 1/1] target-ppc, tcg: fix usermode segfault with pthread
+
+From: Sam Bobroff
+Subject: [Qemu-ppc] [PATCH 1/1] target-ppc, tcg: fix usermode segfault with pthread_create()
+Date: Mon, 30 Jan 2017 16:08:07 +1100
+Programs run under qemu-ppc64 on an x86_64 host currently segfault
+if they use pthread_create() due to the adjustment made to the NIP in
+commit bd6fefe71cec5a0c7d2be4ac96307f25db56abf9.
+
+This patch changes cpu_loop() to set the NIP back to the
+pre-incremented value before calling do_syscall(), which causes the
+correct address to be used for the new thread and corrects the fault.
+
+Signed-off-by: Sam Bobroff <address@hidden>
+
+Upstream-Status: Backport
+
+---
+
+linux-user/main.c | 4 +++-
+1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/linux-user/main.c b/linux-user/main.c
+index 30049581ef..b5dee01541 100644
+--- a/linux-user/main.c
++++ b/linux-user/main.c
+@@ -1712,18 +1712,20 @@ void cpu_loop(CPUPPCState *env)
+              * in syscalls.
+              */
+             env->crf[0] &= ~0x1;
++            env->nip += 4;
+             ret = do_syscall(env, env->gpr[0], env->gpr[3], env->gpr[4],
+                              env->gpr[5], env->gpr[6], env->gpr[7],
+                              env->gpr[8], 0, 0);
+             if (ret == -TARGET_ERESTARTSYS) {
++                env->nip -= 4;
+                 break;
+             }
+             if (ret == (target_ulong)(-TARGET_QEMU_ESIGRETURN)) {
++                env->nip -= 4;
+                 /* Returning from a successful sigreturn syscall.
+                    Avoid corrupting register state.  */
+                 break;
+             }
+-            env->nip += 4;
+             if (ret > (target_ulong)(-515)) {
+                 env->crf[0] |= 0x1;
+                 ret = -ret;
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.1.bb b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
similarity index 70%
rename from meta/recipes-devtools/qemu/qemu_2.7.1.bb
rename to meta/recipes-devtools/qemu/qemu_2.8.0.bb
index 8180c5f..e0527a8 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
@@ -5,18 +5,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
-            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
-            file://0003-fix-CVE-2016-7908.patch \
-            file://0004-fix-CVE-2016-7909.patch \
+            file://target-ppc-fix-user-mode.patch \
 "
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "a315bc51ed443a08d2cf1416d76b9ab4"
-SRC_URI[sha256sum] = "68636788eb69bcb0b44ba220b32b50495d6bd5712a934c282217831c4822958f"
+SRC_URI[md5sum] = "17940dce063b6ce450a12e719a6c9c43"
+SRC_URI[sha256sum] = "dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.1.4


