Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T108d-00020k-Ut
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:17:20 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7DJ5LCx016933;
	Mon, 13 Aug 2012 12:05:23 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 13 Aug 2012 15:04:53 -0400
Message-Id: <4a06d873360678cdb3be1773e88e5a90e9e7e798.1344884450.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1344884450.git.bruce.ashfield@windriver.com>
References: <cover.1344884450.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1344884450.git.bruce.ashfield@windriver.com>
References: <cover.1344884450.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto/3.4: BSP, uprobes, config and cleanups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2012 19:17:20 -0000

Updating the linux-yocto 3.4 recipe with consolidated fixes, BSPs
and cleanups.

From the kernel meta branch:

  28bcd46 meta: move emgd features to staging
  6c01949 meta: Crystal Forest Machine Created.
  3c19c4d meta/qemuppc: remove redundant profiling options
  a5da4d5 meta: kgdb: update configuration for out of box functionality
  1d13e00 meta: update status/series and patches for v3.4
  b96c408 fsl-mpc8315e-rdb: replace leading dot with hash in cfg file
  7c9a3b0 usb: fix scc and cfg filename collision with ktypes/base/
  aa0e1f6 kconfig: make CONFIG_BLOCK=y part of base config
  3d1a2f2 kconfig: add tty/serial file to hardware listing
  60b600f routerstationpro: specify chosen filesystems in audit input.
  8b5c8c7 routerstationpro: add config data for audit purposes
  d7ae8fa meta: add ath79 Kconfig to hardware listing.

And from the standard branch:

  c77666c powerpc: uprobes: removed external declaration of uprobe_get_swbp_addr.
  c262f3e powerpc: Uprobes port to powerpc
  d40e73d powerpc: Add trap_nr to thread_struct
  6a64190 Revert "This is the port of uprobes to powerpc. Usage is similar to x86."
  e422119 Revert "powerpc: uprobes: removed external declaration of uprobe_get_swbp_addr."
  d4ef82f keys: kill task_struct->replacement_session_keyring
  1cc141e keys: kill the dummy key_replace_session_keyring()
  090ca45 keys: change keyctl_session_to_parent() to use task_work_add()
  61bc7a8 genirq: reimplement exit_irq_thread() hook via task_work_add()
  5ee34dd task_work_add: generic process-context callbacks
  70754de move key_repace_session_keyring() into tracehook_notify_resume()
  6f70bc1 powerpc: uprobes: removed external declaration of uprobe_get_swbp_addr.
  e5f6a4c This is the port of uprobes to powerpc. Usage is similar to x86.
  2bc4597 On RISC architectures like powerpc, instructions are fixed size. Instruction analysis on such pl
  8893371 perf probe: Detect probe target when m/x options are absent
  544d531a perf probe: Provide perf interface for uprobes
  103b503 tracing: Fix kconfig warning due to a typo
  9bb012e tracing: Provide trace events interface for uprobes
  b9b7281 tracing: Extract out common code for kprobes/uprobes trace events
  91f0360 tracing: Modify is_delete, is_return from int to bool
  a8600f2 uprobes/core: Decrement uprobe count before the pages are unmapped
  a252056 uprobes/core: Make background page replacement logic account for rss_stat counters
  3efc15b uprobes/core: Optimize probe hits with the help of a counter
  20f3d76 uprobes/core: Allocate XOL slots for uprobes use
  77bfad8 uprobes/core: Handle breakpoint and singlestep exceptions
  7196d9a uprobes/core: Rename bkpt to swbp
  c99bc18 uprobes/core: Make order of function parameters consistent across functions
  7e9be99 uprobes/core: Make macro names consistent
  c4247f2 uprobes: Update copyright notices
  f066ff9 uprobes/core: Move insn to arch specific structure
  e91cf65 uprobes/core: Remove uprobe_opcode_sz
  942b91c uprobes/core: Make instruction tables volatile
  56c1e99 uprobes: Move to kernel/events/
  0a7ad1c uprobes/core: Clean up, refactor and improve the code
  3760d62 uprobes, mm, x86: Add the ability to install and remove uprobes breakpoints

Two BSP updates:

  - Crystal Forest Machine has been added
  - routerstationpro configuration updates for 3.4

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index b995a42..1c4d2fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "50cc910aeb0571921b7ad86091ec2dc621adf67f"
-SRCREV_machine_qemuppc ?= "713b13fa93d4d0b1780b31ed9bbb7a5527447886"
-SRCREV_meta ?= "8d2012649516f3c489295a31fb9ea7afd1b464e4"
+SRCREV_machine ?= "7c172e3f3d3109b23a1107f512f9463d3108f5b2"
+SRCREV_machine_qemuppc ?= "ee88dfc005ec2cdbfe5fda3c27e5f8a175991948"
+SRCREV_meta ?= "28bcd46af1d592dab39bd8a0891c872454fde8bc"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 9f1e550..64a19a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,13 +10,13 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "469cf6a66c720944adeaf8e43c044dfcb8d90599"
-SRCREV_machine_qemumips  ?= "0985f3076c1a5a2cc3a01054e8a0411ffe440395"
-SRCREV_machine_qemuppc ?= "e662bb66d9114c05919cd57ee4d620f4e67d2123"
-SRCREV_machine_qemux86 ?= "f01bddc9534f31b27b475b68d13b5897533a6fca"
-SRCREV_machine_qemux86-64 ?= "f01bddc9534f31b27b475b68d13b5897533a6fca"
-SRCREV_machine ?= "f01bddc9534f31b27b475b68d13b5897533a6fca"
-SRCREV_meta ?= "8d2012649516f3c489295a31fb9ea7afd1b464e4"
+SRCREV_machine_qemuarm ?= "6db2c606429fa8671e76eb312cdd92f9451cf8e8"
+SRCREV_machine_qemumips  ?= "a9f79fc1bde4f5adb7cb015d2f2b5a04bd5597a1"
+SRCREV_machine_qemuppc ?= "492560e2f9a6864c5b4bbb24a35631c182fa35a5"
+SRCREV_machine_qemux86 ?= "c77666c1d4c4be4be4b2046c3ff25bf1db34eb21"
+SRCREV_machine_qemux86-64 ?= "c77666c1d4c4be4be4b2046c3ff25bf1db34eb21"
+SRCREV_machine ?= "c77666c1d4c4be4be4b2046c3ff25bf1db34eb21"
+SRCREV_meta ?= "28bcd46af1d592dab39bd8a0891c872454fde8bc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



