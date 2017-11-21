Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 203AA601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:10:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vALDAn30017580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 21 Nov 2017 13:10:51 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eH8K9-0004Td-Us; Tue, 21 Nov 2017 13:10:49 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 13:10:43 +0000
Message-Id: <1511269847-17161-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/6] qemu: Add patch to avoid qemuppc boot hangs
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
X-List-Received-Date: Tue, 21 Nov 2017 13:10:51 -0000

qemuppc boots are occasionally hanging on the autobuilder. This adds a
patch which fixes the issue in local testing. Its being discussed with
upstream qemu.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu/ppc_locking.patch | 105 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.1.bb         |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/ppc_locking.patch

diff --git a/meta/recipes-devtools/qemu/qemu/ppc_locking.patch b/meta/recipes-devtools/qemu/qemu/ppc_locking.patch
new file mode 100644
index 0000000..6f72243
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/ppc_locking.patch
@@ -0,0 +1,105 @@
+I've tracked down what I think is a problem causing qemu-system-ppc
+to hang whilst booting images.
+
+I believe the decrementer timer stops receiving interrupts so
+tasks in our images hang indefinitely as the timer stopped. 
+
+It can be summed up with this line of debug:
+
+ppc_set_irq: 0x55b4e0d562f0 n_IRQ 8 level 1 => pending 00000100req 00000004
+
+It should normally read:
+
+ppc_set_irq: 0x55b4e0d562f0 n_IRQ 8 level 1 => pending 00000100req 00000002
+
+The question is why CPU_INTERRUPT_EXITTB ends up being set when the
+lines above this log message clearly sets CPU_INTERRUPT_HARD (via 
+cpu_interrupt() ).
+
+I note in cpu.h:
+
+    /* updates protected by BQL */
+    uint32_t interrupt_request;
+
+(for struct CPUState)
+
+The ppc code does "cs->interrupt_request |= CPU_INTERRUPT_EXITTB" in 5
+places, 3 in excp_helper.c and 2 in helper_regs.h. In all cases,  
+g_assert(qemu_mutex_iothread_locked()); fails. If I do something like:
+
+if (!qemu_mutex_iothread_locked()) {
+    qemu_mutex_lock_iothread();
+    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
+    qemu_mutex_unlock_iothread();
+} else {
+    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
+}
+
+in these call sites then I can no longer lock qemu up with my test
+case.
+
+I suspect the _HARD setting gets overwritten which stops the 
+decrementer interrupts being delivered.
+
+Upstream-Status: Submitted [Issue discussed on qemu mailing list 2017/11/20]
+RP 2017/11/20
+
+Index: qemu-2.10.1/target/ppc/excp_helper.c
+===================================================================
+--- qemu-2.10.1.orig/target/ppc/excp_helper.c
++++ qemu-2.10.1/target/ppc/excp_helper.c
+@@ -207,7 +207,9 @@ static inline void powerpc_excp(PowerPCC
+                         "Entering checkstop state\n");
+             }
+             cs->halted = 1;
+-            cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
++            qemu_mutex_lock_iothread();
++            cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
++            qemu_mutex_unlock_iothread();
+         }
+         if (env->msr_mask & MSR_HVB) {
+             /* ISA specifies HV, but can be delivered to guest with HV clear
+@@ -940,7 +942,9 @@ void helper_store_msr(CPUPPCState *env,
+ 
+     if (excp != 0) {
+         CPUState *cs = CPU(ppc_env_get_cpu(env));
+-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
++        qemu_mutex_lock_iothread();
++        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
++        qemu_mutex_unlock_iothread();
+         raise_exception(env, excp);
+     }
+ }
+@@ -995,7 +999,9 @@ static inline void do_rfi(CPUPPCState *e
+     /* No need to raise an exception here,
+      * as rfi is always the last insn of a TB
+      */
+-    cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
++    qemu_mutex_lock_iothread();
++    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
++    qemu_mutex_unlock_iothread();
+ 
+     /* Reset the reservation */
+     env->reserve_addr = -1;
+Index: qemu-2.10.1/target/ppc/helper_regs.h
+===================================================================
+--- qemu-2.10.1.orig/target/ppc/helper_regs.h
++++ qemu-2.10.1/target/ppc/helper_regs.h
+@@ -114,11 +114,15 @@ static inline int hreg_store_msr(CPUPPCS
+     }
+     if (((value >> MSR_IR) & 1) != msr_ir ||
+         ((value >> MSR_DR) & 1) != msr_dr) {
+-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
++        qemu_mutex_lock_iothread();
++        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
++        qemu_mutex_unlock_iothread();
+     }
+     if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
+         ((value >> MSR_GS) & 1) != msr_gs) {
+-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
++        qemu_mutex_lock_iothread();
++        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
++        qemu_mutex_unlock_iothread();
+     }
+     if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
+                  ((value ^ env->msr) & (1 << MSR_TGPR)))) {
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.1.bb b/meta/recipes-devtools/qemu/qemu_2.10.1.bb
index 6e9b68b..8e3ca3c 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0003-Introduce-condition-in-TPM-backend-for-notification.patch \
            file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
+           file://ppc_locking.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


