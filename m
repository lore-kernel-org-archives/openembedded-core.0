Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrF-0004Y7-L5
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752215"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:40 -0800
Message-Id: <1025eee148e50222129f680da55ac0068c00bed0.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 054/113] linux-yocto-tiny: New kernel recipe for tiny distros
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:27 -0000

From: Darren Hart <dvhart@linux.intel.com>

linux-yocto-tiny drops the linux-tools and sets the KMACHINE
branch to standard/tiny.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg |    9 +
 .../recipes-kernel/linux/linux-yocto-tiny/core.cfg |   19 +
 .../linux/linux-yocto-tiny/debug.cfg               |    5 +
 .../linux/linux-yocto-tiny/devtmpfs.cfg            |    6 +
 .../linux/linux-yocto-tiny/e1000.cfg               |    7 +
 .../recipes-kernel/linux/linux-yocto-tiny/ext2.cfg |    1 +
 .../recipes-kernel/linux/linux-yocto-tiny/ext3.cfg |    2 +
 .../recipes-kernel/linux/linux-yocto-tiny/lzma.cfg |    3 +
 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg |   26 +
 .../linux/linux-yocto-tiny/qemux86/defconfig       |  613 ++++++++++++++++++++
 .../linux/linux-yocto-tiny/ramfs.cfg               |    6 +
 .../linux/linux-yocto-tiny/rtc-pc.cfg              |   13 +
 .../linux/linux-yocto-tiny/serial.cfg              |    7 +
 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg |    7 +
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   36 ++
 15 files changed, 760 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
new file mode 100644
index 0000000..97e4d00
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
@@ -0,0 +1,9 @@
+# IDE disk support
+# Dependencies
+CONFIG_PCI=y
+CONFIG_BLOCK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_SFF=y
+CONFIG_ATA_BMDMA=y
+CONFIG_ATA_PIIX=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
new file mode 100644
index 0000000..7057218
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
@@ -0,0 +1,19 @@
+# Basic facilities that shall be present in all kernels
+
+# Needed to execute... anything (like init)
+CONFIG_BINFMT_ELF=y
+
+# Needed by at least the telephony daemon
+CONFIG_SIGNALFD=y
+
+# At least bootlogd requires this
+CONFIG_UNIX98_PTYS=y
+
+# Required for basic IPC and pthread locking support
+CONFIG_SYSVIPC=y
+CONFIG_FUTEX=y
+CONFIG_RT_MUTEXES=y
+
+CONFIG_PROC_FS=y
+CONFIG_SYSFS=y
+
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
new file mode 100644
index 0000000..886bfd9
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
@@ -0,0 +1,5 @@
+# Debug options
+# +98k bzImage
+CONFIG_PRINTK=y
+CONFIG_EARLY_PRINTK=y
+CONFIG_PRINTK_TIME=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
new file mode 100644
index 0000000..07632e2
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
@@ -0,0 +1,6 @@
+# For /dev and udev
+# Could eliminate for a static /dev tree
+# +1.5k bzImage
+CONFIG_HOTPLUG=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
new file mode 100644
index 0000000..8e18bbb
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
@@ -0,0 +1,7 @@
+# e1000 PCI network card support (qemu default)
+# FIXME: This appears in dmesg, but a probe fails
+# bzImage +31k
+CONFIG_PCI=y
+CONFIG_NETDEVICES=y
+CONFIG_NETDEV_1000=y
+CONFIG_E1000=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
new file mode 100644
index 0000000..e35c36d
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
@@ -0,0 +1 @@
+CONFIG_EXT2_FS=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
new file mode 100644
index 0000000..df9dd64
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
@@ -0,0 +1,2 @@
+# bzImage +61k
+CONFIG_EXT3_FS=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
new file mode 100644
index 0000000..f1bafe1
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
@@ -0,0 +1,3 @@
+# bzImage -235k (-15% of bzImage size)
+CONFIG_KERNEL_LZMA=y
+
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
new file mode 100644
index 0000000..ab6d1ee
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
@@ -0,0 +1,26 @@
+# +246k bzImage
+
+# Basic socket support
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NLATTR=y
+
+# INET TCP/IP
+CONFIG_INET=y
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+
+# Disable certain new defaults
+# bzImage ~ -200k
+# Using allnoconfig internally would eliminate the need for this
+# CONFIG_XFRM is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+# CONFIG_IPCOMP_XFRM is not set
+# IPSEC
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+#
+# CONFIG_INET_DIAG is not set
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig b/meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
new file mode 100644
index 0000000..ba9ae04
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
@@ -0,0 +1,613 @@
+#
+# Automatically generated make config: don't edit
+# Linux/i386 3.0.4 Kernel Configuration
+#
+# CONFIG_64BIT is not set
+CONFIG_X86_32=y
+# CONFIG_X86_64 is not set
+CONFIG_X86=y
+CONFIG_INSTRUCTION_DECODER=y
+CONFIG_OUTPUT_FORMAT="elf32-i386"
+CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
+CONFIG_GENERIC_CMOS_UPDATE=y
+CONFIG_CLOCKSOURCE_WATCHDOG=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_MMU=y
+# CONFIG_ZONE_DMA is not set
+# CONFIG_NEED_DMA_MAP_STATE is not set
+CONFIG_NEED_SG_DMA_LENGTH=y
+CONFIG_GENERIC_ISA_DMA=y
+CONFIG_GENERIC_IOMAP=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_ARCH_MAY_HAVE_PC_FDC=y
+# CONFIG_RWSEM_GENERIC_SPINLOCK is not set
+CONFIG_RWSEM_XCHGADD_ALGORITHM=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+# CONFIG_GENERIC_TIME_VSYSCALL is not set
+CONFIG_ARCH_HAS_CPU_RELAX=y
+CONFIG_ARCH_HAS_DEFAULT_IDLE=y
+CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
+CONFIG_HAVE_SETUP_PER_CPU_AREA=y
+CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
+CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
+# CONFIG_HAVE_CPUMASK_OF_CPU_MAP is not set
+CONFIG_ARCH_HIBERNATION_POSSIBLE=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+# CONFIG_ZONE_DMA32 is not set
+CONFIG_ARCH_POPULATES_NODE_MAP=y
+# CONFIG_AUDIT_ARCH is not set
+CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
+CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
+CONFIG_X86_32_LAZY_GS=y
+CONFIG_ARCH_HWEIGHT_CFLAGS="-fcall-saved-ecx -fcall-saved-edx"
+CONFIG_KTIME_SCALAR=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+# CONFIG_EXPERIMENTAL is not set
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_BZIP2=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_XZ=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_BZIP2 is not set
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_XZ is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+# CONFIG_SYSVIPC is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_FHANDLE is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_IRQ_FORCED_THREADING=y
+# CONFIG_SPARSE_IRQ is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=17
+CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
+# CONFIG_NAMESPACES is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_RELAY is not set
+# CONFIG_BLK_DEV_INITRD is not set
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+# CONFIG_UPTIME_LIMITED_KERNEL is not set
+# CONFIG_UID16 is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_HOTPLUG is not set
+# CONFIG_PRINTK is not set
+# CONFIG_BUG is not set
+# CONFIG_ELF_CORE is not set
+# CONFIG_PCSPKR_PLATFORM is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_SHMEM is not set
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB is not set
+CONFIG_SLUB=y
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
+CONFIG_HAVE_IOREMAP_PROT=y
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_OPTPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_HW_BREAKPOINT=y
+CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
+CONFIG_HAVE_USER_RETURN_NOTIFIER=y
+CONFIG_HAVE_PERF_EVENTS_NMI=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_BASE_SMALL=1
+# CONFIG_MODULES is not set
+# CONFIG_BLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+# CONFIG_FREEZER is not set
+
+#
+# Processor type and features
+#
+# CONFIG_NO_HZ is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+# CONFIG_SMP is not set
+# CONFIG_X86_EXTENDED_PLATFORM is not set
+# CONFIG_X86_32_IRIS is not set
+# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
+# CONFIG_PARAVIRT_GUEST is not set
+CONFIG_NO_BOOTMEM=y
+# CONFIG_MEMTEST is not set
+# CONFIG_M386 is not set
+# CONFIG_M486 is not set
+# CONFIG_M586 is not set
+# CONFIG_M586TSC is not set
+# CONFIG_M586MMX is not set
+CONFIG_M686=y
+# CONFIG_MPENTIUMII is not set
+# CONFIG_MPENTIUMIII is not set
+# CONFIG_MPENTIUMM is not set
+# CONFIG_MPENTIUM4 is not set
+# CONFIG_MK6 is not set
+# CONFIG_MK7 is not set
+# CONFIG_MK8 is not set
+# CONFIG_MCRUSOE is not set
+# CONFIG_MEFFICEON is not set
+# CONFIG_MWINCHIPC6 is not set
+# CONFIG_MWINCHIP3D is not set
+# CONFIG_MELAN is not set
+# CONFIG_MGEODEGX1 is not set
+# CONFIG_MGEODE_LX is not set
+# CONFIG_MCYRIXIII is not set
+# CONFIG_MVIAC3_2 is not set
+# CONFIG_MVIAC7 is not set
+# CONFIG_MCORE2 is not set
+# CONFIG_MATOM is not set
+# CONFIG_X86_GENERIC is not set
+CONFIG_X86_INTERNODE_CACHE_SHIFT=5
+CONFIG_X86_CMPXCHG=y
+CONFIG_CMPXCHG_LOCAL=y
+CONFIG_X86_L1_CACHE_SHIFT=5
+CONFIG_X86_XADD=y
+# CONFIG_X86_PPRO_FENCE is not set
+CONFIG_X86_WP_WORKS_OK=y
+CONFIG_X86_INVLPG=y
+CONFIG_X86_BSWAP=y
+CONFIG_X86_POPAD_OK=y
+CONFIG_X86_USE_PPRO_CHECKSUM=y
+CONFIG_X86_TSC=y
+CONFIG_X86_CMPXCHG64=y
+CONFIG_X86_CMOV=y
+CONFIG_X86_MINIMUM_CPU_FAMILY=5
+CONFIG_X86_DEBUGCTLMSR=y
+# CONFIG_PROCESSOR_SELECT is not set
+CONFIG_CPU_SUP_INTEL=y
+CONFIG_CPU_SUP_CYRIX_32=y
+CONFIG_CPU_SUP_AMD=y
+CONFIG_CPU_SUP_CENTAUR=y
+CONFIG_CPU_SUP_TRANSMETA_32=y
+CONFIG_CPU_SUP_UMC_32=y
+# CONFIG_HPET_TIMER is not set
+# CONFIG_DMI is not set
+# CONFIG_IOMMU_HELPER is not set
+# CONFIG_IOMMU_API is not set
+CONFIG_NR_CPUS=1
+# CONFIG_IRQ_TIME_ACCOUNTING is not set
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+# CONFIG_X86_UP_APIC is not set
+# CONFIG_X86_MCE is not set
+# CONFIG_VM86 is not set
+# CONFIG_TOSHIBA is not set
+# CONFIG_I8K is not set
+# CONFIG_X86_REBOOTFIXUPS is not set
+# CONFIG_MICROCODE is not set
+# CONFIG_X86_MSR is not set
+# CONFIG_X86_CPUID is not set
+# CONFIG_NOHIGHMEM is not set
+CONFIG_HIGHMEM4G=y
+# CONFIG_HIGHMEM64G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_HIGHMEM=y
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+# CONFIG_ARCH_DMA_ADDR_T_64BIT is not set
+CONFIG_ARCH_FLATMEM_ENABLE=y
+CONFIG_ILLEGAL_POINTER_VALUE=0
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_COMPACTION is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_TRANSPARENT_HUGEPAGE is not set
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+# CONFIG_HIGHPTE is not set
+# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
+CONFIG_X86_RESERVE_LOW=64
+# CONFIG_MATH_EMULATION is not set
+# CONFIG_MTRR is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_HZ_100 is not set
+CONFIG_HZ_250=y
+# CONFIG_HZ_300 is not set
+# CONFIG_HZ_1000 is not set
+CONFIG_HZ=250
+# CONFIG_SCHED_HRTICK is not set
+# CONFIG_KEXEC is not set
+# CONFIG_CRASH_DUMP is not set
+CONFIG_PHYSICAL_START=0x1000000
+# CONFIG_RELOCATABLE is not set
+CONFIG_PHYSICAL_ALIGN=0x1000000
+# CONFIG_COMPAT_VDSO is not set
+# CONFIG_CMDLINE_BOOL is not set
+CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
+
+#
+# Power management and ACPI options
+#
+# CONFIG_SUSPEND is not set
+# CONFIG_PM_RUNTIME is not set
+# CONFIG_SFI is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
+
+#
+# Bus options (PCI etc.)
+#
+# CONFIG_PCI is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+CONFIG_ISA_DMA_API=y
+# CONFIG_ISA is not set
+# CONFIG_MCA is not set
+# CONFIG_SCx200 is not set
+# CONFIG_OLPC is not set
+
+#
+# Executable file formats / Emulations
+#
+# CONFIG_BINFMT_ELF is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+CONFIG_HAVE_ATOMIC_IOMAP=y
+CONFIG_HAVE_TEXT_POKE_SMP=y
+# CONFIG_NET is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_STANDALONE=y
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+# CONFIG_MISC_DEVICES is not set
+CONFIG_HAVE_IDE=y
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_MACINTOSH_DRIVERS is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+# CONFIG_INPUT is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_TRACE_SINK is not set
+# CONFIG_DEVKMEM is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+CONFIG_FIX_EARLYCON_MEM=y
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_RTC is not set
+# CONFIG_GEN_RTC is not set
+# CONFIG_R3964 is not set
+# CONFIG_MWAVE is not set
+# CONFIG_PC8736x_GPIO is not set
+# CONFIG_NSC_GPIO is not set
+# CONFIG_HANGCHECK_TIMER is not set
+# CONFIG_RAMOOPS is not set
+# CONFIG_I2C is not set
+# CONFIG_SPI is not set
+
+#
+# PPS support
+#
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
+# CONFIG_GPIOLIB is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+# CONFIG_MFD_SUPPORT is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+# CONFIG_FB is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+# CONFIG_SOUND is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_NFC_DEVICES is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_EDAC is not set
+# CONFIG_RTC_CLASS is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+# CONFIG_X86_PLATFORM_DEVICES is not set
+CONFIG_CLKSRC_I8253=y
+
+#
+# Firmware Drivers
+#
+# CONFIG_EDD is not set
+# CONFIG_FIRMWARE_MEMMAP is not set
+# CONFIG_DELL_RBU is not set
+# CONFIG_DCDBAS is not set
+# CONFIG_ISCSI_IBFT_FIND is not set
+# CONFIG_GOOGLE_FIRMWARE is not set
+
+#
+# File systems
+#
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_FSNOTIFY is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# Pseudo filesystems
+#
+# CONFIG_PROC_FS is not set
+# CONFIG_SYSFS is not set
+# CONFIG_HUGETLBFS is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_NLS is not set
+
+#
+# Kernel hacking
+#
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+CONFIG_ARCH_WANT_FRAME_POINTERS=y
+# CONFIG_FRAME_POINTER is not set
+CONFIG_USER_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=y
+CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_HAVE_ARCH_KMEMCHECK=y
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+# CONFIG_X86_VERBOSE_BOOTUP is not set
+# CONFIG_EARLY_PRINTK is not set
+# CONFIG_DOUBLEFAULT is not set
+# CONFIG_IOMMU_STRESS is not set
+CONFIG_HAVE_MMIOTRACE_SUPPORT=y
+CONFIG_IO_DELAY_TYPE_0X80=0
+CONFIG_IO_DELAY_TYPE_0XED=1
+CONFIG_IO_DELAY_TYPE_UDELAY=2
+CONFIG_IO_DELAY_TYPE_NONE=3
+CONFIG_IO_DELAY_0X80=y
+# CONFIG_IO_DELAY_0XED is not set
+# CONFIG_IO_DELAY_UDELAY is not set
+# CONFIG_IO_DELAY_NONE is not set
+CONFIG_DEFAULT_IO_DELAY_TYPE=0
+# CONFIG_OPTIMIZE_INLINING is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+# CONFIG_CRYPTO is not set
+CONFIG_HAVE_KVM=y
+# CONFIG_VIRTUALIZATION is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_GENERIC_FIND_FIRST_BIT=y
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+# CONFIG_CRC32 is not set
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+# CONFIG_XZ_DEC is not set
+# CONFIG_XZ_DEC_BCJ is not set
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+# CONFIG_AVERAGE is not set
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
new file mode 100644
index 0000000..96f4bd3
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
@@ -0,0 +1,6 @@
+CONFIG_BLK_DEV=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=6144
+
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
new file mode 100644
index 0000000..f667440
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
@@ -0,0 +1,13 @@
+# Dependencies
+CONFIG_ACPI=y
+CONFIG_HPET=y
+CONFIG_HPET_TIMER=y
+
+CONFIG_HPET_EMULATE_RTC=y
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+CONFIG_RTC_DRV_CMOS=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
new file mode 100644
index 0000000..0a28dca
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
@@ -0,0 +1,7 @@
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
new file mode 100644
index 0000000..a82096e
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
@@ -0,0 +1,7 @@
+# bzImage +104k
+CONFIG_HOTPLUG=y
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SMP=y
+CONFIG_SCHED_SMT=y
+CONFIG_SCHED_MC=y
+
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
new file mode 100644
index 0000000..c5855a3
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -0,0 +1,36 @@
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+#KMACHINE = "yocto/standard/tiny/base"
+KMACHINE = "yocto/standard/base"
+KBRANCH = ${KMACHINE}
+
+LINUX_VERSION ?= "3.0.12"
+
+SRCREV_machine ?= "f389d310965a56091f688b28ea8be6d9cbb7fbbe"
+SRCREV_meta ?= "04a52a32cbdf0972033b97b83eaa83eb275dfdc9"
+
+PR = "r1"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta \
+           file://core.cfg \
+           file://serial.cfg \
+           file://ext2.cfg \
+           file://rtc-pc.cfg \
+           file://ramfs.cfg \
+           file://devtmpfs.cfg \
+           file://net.cfg \
+           file://debug.cfg \
+           file://lzma.cfg \
+           "
+
+
+# Enable qemux86 specific emulated options
+SRC_URI_append_qemux86 = " file://defconfig file://ata.cfg file://e1000.cfg"
+
+#COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES=""
-- 
1.7.6.4



