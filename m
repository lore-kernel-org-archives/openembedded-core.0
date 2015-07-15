Return-Path: <Yang.Shi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BEFEC6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 21:19:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6FLJXa7002262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Jul 2015 14:19:33 -0700 (PDT)
Received: from [147.11.216.200] (147.11.216.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 15 Jul 2015 14:19:32 -0700
Message-ID: <55A6CE64.7090206@windriver.com>
Date: Wed, 15 Jul 2015 14:19:32 -0700
From: Yang Shi <yang.shi@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1436991327-5726-1-git-send-email-yang.shi@windriver.com>
	<1436991327-5726-2-git-send-email-yang.shi@windriver.com>
	<CAJTo0LbYUqQ6YJ1CO4bK+PStc7NNttEpkYgN6Kdxu9t6urHvVw@mail.gmail.com>
In-Reply-To: <CAJTo0LbYUqQ6YJ1CO4bK+PStc7NNttEpkYgN6Kdxu9t6urHvVw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] MIPS: Fix build with binutils 2.24.51+
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
X-List-Received-Date: Wed, 15 Jul 2015 21:19:34 -0000
Content-Type: multipart/alternative;
	boundary="------------030008020209080806030800"

--------------030008020209080806030800
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/2015 1:42 PM, Burton, Ross wrote:
> (I think you meant to send this to linux-yocto@...)

Yes, should I resend the patch to linux-yocto?

Thanks,
Yang

>
> On 15 July 2015 at 21:15, Yang Shi <yang.shi@windriver.com 
> <mailto:yang.shi@windriver.com>> wrote:
>
>     From: Manuel Lauss <manuel.lauss@gmail.com
>     <mailto:manuel.lauss@gmail.com>>
>
>     commit 842dfc11ea9a21f9825167c8a4f2834b205b0a79 upstream
>
>     Starting with version 2.24.51.20140728 MIPS binutils complain loudly
>     about mixing soft-float and hard-float object files, leading to this
>     build failure since GCC is invoked with "-msoft-float" on MIPS:
>
>     {standard input}: Warning: .gnu_attribute 4,3 requires `softfloat'
>       LD      arch/mips/alchemy/common/built-in.o
>     mipsel-softfloat-linux-gnu-ld: Warning:
>     arch/mips/alchemy/common/built-in.o
>      uses -msoft-float (set by arch/mips/alchemy/common/prom.o),
>      arch/mips/alchemy/common/sleeper.o uses -mhard-float
>
>     To fix this, we detect if GAS is new enough to support
>     "-msoft-float" command
>     option, and if it does, we can let GCC pass it to GAS;  but then
>     we also need
>     to sprinkle the files which make use of floating point registers
>     with the
>     necessary ".set hardfloat" directives.
>
>     Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com
>     <mailto:manuel.lauss@gmail.com>>
>     Cc: Linux-MIPS <linux-mips@linux-mips.org
>     <mailto:linux-mips@linux-mips.org>>
>     Cc: Matthew Fortune <Matthew.Fortune@imgtec.com
>     <mailto:Matthew.Fortune@imgtec.com>>
>     Cc: Markos Chandras <Markos.Chandras@imgtec.com
>     <mailto:Markos.Chandras@imgtec.com>>
>     Cc: Maciej W. Rozycki <macro@linux-mips.org
>     <mailto:macro@linux-mips.org>>
>     Patchwork: https://patchwork.linux-mips.org/patch/8355/
>     Signed-off-by: Ralf Baechle <ralf@linux-mips.org
>     <mailto:ralf@linux-mips.org>>
>     [yshi: Backported to Yocto 3.14 kernel]
>     Signed-off-by: Yang Shi <yang.shi@windriver.com
>     <mailto:yang.shi@windriver.com>>
>     ---
>      arch/mips/Makefile                  |  9 +++++++++
>      arch/mips/include/asm/asmmacro-32.h |  6 ++++++
>      arch/mips/include/asm/asmmacro.h    |  7 +++++++
>      arch/mips/include/asm/fpregdef.h    | 14 ++++++++++++++
>      arch/mips/include/asm/mipsregs.h    | 11 ++++++++++-
>      arch/mips/kernel/branch.c           |  6 +-----
>      arch/mips/kernel/genex.S            |  1 +
>      arch/mips/kernel/r2300_fpu.S        |  6 ++++++
>      arch/mips/kernel/r2300_switch.S     |  5 +++++
>      arch/mips/kernel/r4k_fpu.S          | 27 +++++++++++++++++++++++++--
>      arch/mips/kernel/r4k_switch.S       | 11 ++++++++++-
>      arch/mips/kernel/r6000_fpu.S        |  5 +++++
>      arch/mips/math-emu/cp1emu.c         |  6 +-----
>      13 files changed, 100 insertions(+), 14 deletions(-)
>
>     diff --git a/arch/mips/Makefile b/arch/mips/Makefile
>     index 69bd6f7..c1a7f83 100644
>     --- a/arch/mips/Makefile
>     +++ b/arch/mips/Makefile
>     @@ -96,6 +96,15 @@ KBUILD_AFLAGS_MODULE         += -mlong-calls
>      KBUILD_CFLAGS_MODULE           += -mlong-calls
>      endif
>
>     +#
>     +# pass -msoft-float to GAS if it supports it.  However on newer
>     binutils
>     +# (specifically newer than 2.24.51.20140728) we then also need to
>     explicitly
>     +# set ".set hardfloat" in all files which manipulate floating
>     point registers.
>     +#
>     +ifneq ($(call as-option,-Wa$(comma)-msoft-float,),)
>     +       cflags-y                += -DGAS_HAS_SET_HARDFLOAT
>     -Wa,-msoft-float
>     +endif
>     +
>      cflags-y += -ffreestanding
>
>      #
>     diff --git a/arch/mips/include/asm/asmmacro-32.h
>     b/arch/mips/include/asm/asmmacro-32.h
>     index 70e1f17..8038647 100644
>     --- a/arch/mips/include/asm/asmmacro-32.h
>     +++ b/arch/mips/include/asm/asmmacro-32.h
>     @@ -13,6 +13,8 @@
>      #include <asm/mipsregs.h>
>
>             .macro  fpu_save_single thread tmp=t0
>     +       .set push
>     +       SET_HARDFLOAT
>             cfc1    \tmp,  fcr31
>             swc1    $f0,  THREAD_FPR0(\thread)
>             swc1    $f1,  THREAD_FPR1(\thread)
>     @@ -47,9 +49,12 @@
>             swc1    $f30, THREAD_FPR30(\thread)
>             swc1    $f31, THREAD_FPR31(\thread)
>             sw      \tmp, THREAD_FCR31(\thread)
>     +       .set pop
>             .endm
>
>             .macro  fpu_restore_single thread tmp=t0
>     +       .set push
>     +       SET_HARDFLOAT
>             lw      \tmp, THREAD_FCR31(\thread)
>             lwc1    $f0,  THREAD_FPR0(\thread)
>             lwc1    $f1,  THREAD_FPR1(\thread)
>     @@ -84,6 +89,7 @@
>             lwc1    $f30, THREAD_FPR30(\thread)
>             lwc1    $f31, THREAD_FPR31(\thread)
>             ctc1    \tmp, fcr31
>     +       .set pop
>             .endm
>
>             .macro  cpu_save_nonscratch thread
>     diff --git a/arch/mips/include/asm/asmmacro.h
>     b/arch/mips/include/asm/asmmacro.h
>     index 4225e99..d6d5b19 100644
>     --- a/arch/mips/include/asm/asmmacro.h
>     +++ b/arch/mips/include/asm/asmmacro.h
>     @@ -74,6 +74,8 @@
>      #endif /* CONFIG_MIPS_MT_SMTC */
>
>             .macro  fpu_save_16even thread tmp=t0
>     +       .set    push
>     +       SET_HARDFLOAT
>             cfc1    \tmp, fcr31
>             sdc1    $f0,  THREAD_FPR0(\thread)
>             sdc1    $f2,  THREAD_FPR2(\thread)
>     @@ -92,11 +94,13 @@
>             sdc1    $f28, THREAD_FPR28(\thread)
>             sdc1    $f30, THREAD_FPR30(\thread)
>             sw      \tmp, THREAD_FCR31(\thread)
>     +       .set    pop
>             .endm
>
>             .macro  fpu_save_16odd thread
>             .set    push
>             .set    mips64r2
>     +       SET_HARDFLOAT
>             sdc1    $f1,  THREAD_FPR1(\thread)
>             sdc1    $f3,  THREAD_FPR3(\thread)
>             sdc1    $f5,  THREAD_FPR5(\thread)
>     @@ -127,6 +131,8 @@
>             .endm
>
>             .macro  fpu_restore_16even thread tmp=t0
>     +       .set    push
>     +       SET_HARDFLOAT
>             lw      \tmp, THREAD_FCR31(\thread)
>             ldc1    $f0,  THREAD_FPR0(\thread)
>             ldc1    $f2,  THREAD_FPR2(\thread)
>     @@ -150,6 +156,7 @@
>             .macro  fpu_restore_16odd thread
>             .set    push
>             .set    mips64r2
>     +       SET_HARDFLOAT
>             ldc1    $f1,  THREAD_FPR1(\thread)
>             ldc1    $f3,  THREAD_FPR3(\thread)
>             ldc1    $f5,  THREAD_FPR5(\thread)
>     diff --git a/arch/mips/include/asm/fpregdef.h
>     b/arch/mips/include/asm/fpregdef.h
>     index 429481f..f184ba0 100644
>     --- a/arch/mips/include/asm/fpregdef.h
>     +++ b/arch/mips/include/asm/fpregdef.h
>     @@ -14,6 +14,20 @@
>
>      #include <asm/sgidefs.h>
>
>     +/*
>     + * starting with binutils 2.24.51.20140729, MIPS binutils warn
>     about mixing
>     + * hardfloat and softfloat object files.  The kernel build uses
>     soft-float by
>     + * default, so we also need to pass -msoft-float along to GAS if
>     it supports it.
>     + * But this in turn causes assembler errors in files which access
>     hardfloat
>     + * registers.  We detect if GAS supports "-msoft-float" in the
>     Makefile and
>     + * explicitly put ".set hardfloat" where floating point registers
>     are touched.
>     + */
>     +#ifdef GAS_HAS_SET_HARDFLOAT
>     +#define SET_HARDFLOAT .set hardfloat
>     +#else
>     +#define SET_HARDFLOAT
>     +#endif
>     +
>      #if _MIPS_SIM == _MIPS_SIM_ABI32
>
>      /*
>     diff --git a/arch/mips/include/asm/mipsregs.h
>     b/arch/mips/include/asm/mipsregs.h
>     index d6a8ced..67a209f 100644
>     --- a/arch/mips/include/asm/mipsregs.h
>     +++ b/arch/mips/include/asm/mipsregs.h
>     @@ -1518,7 +1518,7 @@ do {                                     \
>      /*
>       * Macros to access the floating point coprocessor control registers
>       */
>     -#define read_32bit_cp1_register(source)                     \
>     +#define _read_32bit_cp1_register(source, gas_hardfloat)          
>               \
>      ({            \
>             int __res;             \
>                 \
>     @@ -1528,12 +1528,21 @@ do {                                     \
>             "       # gas fails to assemble cfc1 for some archs,   
>     \n"     \
>             "       # like Octeon.     \n"     \
>             "       .set    mips1    \n"     \
>     +       "       "STR(gas_hardfloat)"     \n"     \
>             "       cfc1    %0,"STR(source)"     \n"     \
>             "       .set    pop    \n"     \
>             : "=r" (__res));             \
>             __res;             \
>      })
>
>     +#ifdef GAS_HAS_SET_HARDFLOAT
>     +#define read_32bit_cp1_register(source)                     \
>     +       _read_32bit_cp1_register(source, .set hardfloat)
>     +#else
>     +#define read_32bit_cp1_register(source)                     \
>     +       _read_32bit_cp1_register(source, )
>     +#endif
>     +
>      #ifdef HAVE_AS_DSP
>      #define rddsp(mask)             \
>      ({            \
>     diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
>     index ecba7eb..d14383d 100644
>     --- a/arch/mips/kernel/branch.c
>     +++ b/arch/mips/kernel/branch.c
>     @@ -438,11 +438,7 @@ static unsigned int __get_fcr31(void)
>
>             preempt_disable();
>             if (is_fpu_owner())
>     -               asm volatile(
>     -                       ".set push\n"
>     -                       "\t.set mips1\n"
>     -                       "\tcfc1\t%0,$31\n"
>     -                       "\t.set pop" : "=r" (fcr31));
>     +               fcr31 = read_32bit_cp1_register(CP1_STATUS);
>             else
>                     fcr31 = current->thread.fpu.fcr31;
>             preempt_enable();
>     diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
>     index eb59fed..7b7611a 100644
>     --- a/arch/mips/kernel/genex.S
>     +++ b/arch/mips/kernel/genex.S
>     @@ -432,6 +432,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
>             .set    push
>             /* gas fails to assemble cfc1 for some archs (octeon).*/ \
>             .set    mips1
>     +       SET_HARDFLOAT
>             cfc1    a1, fcr31
>             li      a2, ~(0x3f << 12)
>             and     a2, a1
>     diff --git a/arch/mips/kernel/r2300_fpu.S
>     b/arch/mips/kernel/r2300_fpu.S
>     index f31063d..5ce3b74 100644
>     --- a/arch/mips/kernel/r2300_fpu.S
>     +++ b/arch/mips/kernel/r2300_fpu.S
>     @@ -28,6 +28,8 @@
>             .set    mips1
>             /* Save floating point context */
>      LEAF(_save_fp_context)
>     +       .set    push
>     +       SET_HARDFLOAT
>             li      v0, 0                                   # assume
>     success
>             cfc1    t1,fcr31
>             EX(swc1 $f0,(SC_FPREGS+0)(a0))
>     @@ -65,6 +67,7 @@ LEAF(_save_fp_context)
>             EX(sw   t1,(SC_FPC_CSR)(a0))
>             cfc1    t0,$0                           #
>     implementation/version
>             jr      ra
>     +       .set    pop
>             .set    nomacro
>              EX(sw  t0,(SC_FPC_EIR)(a0))
>             .set    macro
>     @@ -80,6 +83,8 @@ LEAF(_save_fp_context)
>       * stack frame which might have been changed by the user.
>       */
>      LEAF(_restore_fp_context)
>     +       .set    push
>     +       SET_HARDFLOAT
>             li      v0, 0                                   # assume
>     success
>             EX(lw t0,(SC_FPC_CSR)(a0))
>             EX(lwc1 $f0,(SC_FPREGS+0)(a0))
>     @@ -116,6 +121,7 @@ LEAF(_restore_fp_context)
>             EX(lwc1 $f31,(SC_FPREGS+248)(a0))
>             jr      ra
>              ctc1   t0,fcr31
>     +       .set    pop
>             END(_restore_fp_context)
>             .set    reorder
>
>     diff --git a/arch/mips/kernel/r2300_switch.S
>     b/arch/mips/kernel/r2300_switch.S
>     index 20b7b04..435ea65 100644
>     --- a/arch/mips/kernel/r2300_switch.S
>     +++ b/arch/mips/kernel/r2300_switch.S
>     @@ -120,6 +120,9 @@ LEAF(_restore_fp)
>
>      #define FPU_DEFAULT  0x00000000
>
>     +       .set push
>     +       SET_HARDFLOAT
>     +
>      LEAF(_init_fpu)
>             mfc0    t0, CP0_STATUS
>             li      t1, ST0_CU1
>     @@ -165,3 +168,5 @@ LEAF(_init_fpu)
>             mtc1    t0, $f31
>             jr      ra
>             END(_init_fpu)
>     +
>     +       .set pop
>     diff --git a/arch/mips/kernel/r4k_fpu.S b/arch/mips/kernel/r4k_fpu.S
>     index 73b0ddf..06f8b2a 100644
>     --- a/arch/mips/kernel/r4k_fpu.S
>     +++ b/arch/mips/kernel/r4k_fpu.S
>     @@ -19,8 +19,12 @@
>      #include <asm/asm-offsets.h>
>      #include <asm/regdef.h>
>
>     +/* preprocessor replaces the fp in ".set fp=64" with $30 otherwise */
>     +#undef fp
>     +
>             .macro  EX insn, reg, src
>             .set    push
>     +       SET_HARDFLOAT
>             .set    nomacro
>      .ex\@: \insn   \reg, \src
>             .set    pop
>     @@ -33,12 +37,17 @@
>             .set    mips3
>
>      LEAF(_save_fp_context)
>     +       .set    push
>     +       SET_HARDFLOAT
>             cfc1    t1, fcr31
>     +       .set    pop
>
>      #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2)
>             .set    push
>     +       SET_HARDFLOAT
>      #ifdef CONFIG_CPU_MIPS32_R2
>     -       .set    mips64r2
>     +       .set    mips32r2
>     +       .set    fp=64
>             mfc0    t0, CP0_STATUS
>             sll     t0, t0, 5
>             bgez    t0, 1f                  # skip storing odd if FR=0
>     @@ -64,6 +73,8 @@ LEAF(_save_fp_context)
>      1:     .set    pop
>      #endif
>
>     +       .set push
>     +       SET_HARDFLOAT
>             /* Store the 16 even double precision registers */
>             EX      sdc1 $f0, SC_FPREGS+0(a0)
>             EX      sdc1 $f2, SC_FPREGS+16(a0)
>     @@ -84,11 +95,14 @@ LEAF(_save_fp_context)
>             EX      sw t1, SC_FPC_CSR(a0)
>             jr      ra
>              li     v0, 0                                   # success
>     +       .set pop
>             END(_save_fp_context)
>
>      #ifdef CONFIG_MIPS32_COMPAT
>             /* Save 32-bit process floating point context */
>      LEAF(_save_fp_context32)
>     +       .set push
>     +       SET_HARDFLOAT
>             cfc1    t1, fcr31
>
>             mfc0    t0, CP0_STATUS
>     @@ -134,6 +148,7 @@ LEAF(_save_fp_context32)
>             EX      sw t1, SC32_FPC_CSR(a0)
>             cfc1    t0, $0                          #
>     implementation/version
>             EX      sw t0, SC32_FPC_EIR(a0)
>     +       .set pop
>
>             jr      ra
>              li     v0, 0                                   # success
>     @@ -150,8 +165,10 @@ LEAF(_restore_fp_context)
>
>      #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2)
>             .set    push
>     +       SET_HARDFLOAT
>      #ifdef CONFIG_CPU_MIPS32_R2
>     -       .set    mips64r2
>     +       .set    mips32r2
>     +       .set    fp=64
>             mfc0    t0, CP0_STATUS
>             sll     t0, t0, 5
>             bgez    t0, 1f                  # skip loading odd if FR=0
>     @@ -175,6 +192,8 @@ LEAF(_restore_fp_context)
>             EX      ldc1 $f31, SC_FPREGS+248(a0)
>      1:     .set pop
>      #endif
>     +       .set push
>     +       SET_HARDFLOAT
>             EX      ldc1 $f0, SC_FPREGS+0(a0)
>             EX      ldc1 $f2, SC_FPREGS+16(a0)
>             EX      ldc1 $f4, SC_FPREGS+32(a0)
>     @@ -192,6 +211,7 @@ LEAF(_restore_fp_context)
>             EX      ldc1 $f28, SC_FPREGS+224(a0)
>             EX      ldc1 $f30, SC_FPREGS+240(a0)
>             ctc1    t1, fcr31
>     +       .set pop
>             jr      ra
>              li     v0, 0                                   # success
>             END(_restore_fp_context)
>     @@ -199,6 +219,8 @@ LEAF(_restore_fp_context)
>      #ifdef CONFIG_MIPS32_COMPAT
>      LEAF(_restore_fp_context32)
>             /* Restore an o32 sigcontext.  */
>     +       .set push
>     +       SET_HARDFLOAT
>             EX      lw t1, SC32_FPC_CSR(a0)
>
>             mfc0    t0, CP0_STATUS
>     @@ -242,6 +264,7 @@ LEAF(_restore_fp_context32)
>             ctc1    t1, fcr31
>             jr      ra
>              li     v0, 0                                   # success
>     +       .set pop
>             END(_restore_fp_context32)
>      #endif
>
>     diff --git a/arch/mips/kernel/r4k_switch.S
>     b/arch/mips/kernel/r4k_switch.S
>     index 8a4f9a5..715fb13 100644
>     --- a/arch/mips/kernel/r4k_switch.S
>     +++ b/arch/mips/kernel/r4k_switch.S
>     @@ -22,6 +22,9 @@
>
>      #include <asm/asmmacro.h>
>
>     +/* preprocessor replaces the fp in ".set fp=64" with $30 otherwise */
>     +#undef fp
>     +
>      /*
>       * Offset to the current process status flags, the first 32 bytes
>     of the
>       * stack are not used.
>     @@ -154,6 +157,9 @@ LEAF(_restore_fp)
>
>      #define FPU_DEFAULT  0x00000000
>
>     +       .set push
>     +       SET_HARDFLOAT
>     +
>      LEAF(_init_fpu)
>      #ifdef CONFIG_MIPS_MT_SMTC
>             /* Rather than manipulate per-VPE Status, set per-TC bit
>     in TCStatus */
>     @@ -234,7 +240,8 @@ LEAF(_init_fpu)
>
>      #ifdef CONFIG_CPU_MIPS32_R2
>             .set    push
>     -       .set    mips64r2
>     +       .set    mips32r2
>     +       .set    fp=64
>             sll     t0, t0, 5                       # is Status.FR set?
>             bgez    t0, 1f                          # no: skip setting
>     upper 32b
>
>     @@ -293,3 +300,5 @@ LEAF(_init_fpu)
>      #endif
>             jr      ra
>             END(_init_fpu)
>     +
>     +       .set pop        /* SET_HARDFLOAT */
>     diff --git a/arch/mips/kernel/r6000_fpu.S
>     b/arch/mips/kernel/r6000_fpu.S
>     index da0fbe4..4707738 100644
>     --- a/arch/mips/kernel/r6000_fpu.S
>     +++ b/arch/mips/kernel/r6000_fpu.S
>     @@ -18,6 +18,9 @@
>
>             .set    noreorder
>             .set    mips2
>     +       .set    push
>     +       SET_HARDFLOAT
>     +
>             /* Save floating point context */
>             LEAF(_save_fp_context)
>             mfc0    t0,CP0_STATUS
>     @@ -85,3 +88,5 @@
>      1:     jr      ra
>              nop
>             END(_restore_fp_context)
>     +
>     +       .set pop        /* SET_HARDFLOAT */
>     diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
>     index edb110c..4e9e3c1 100644
>     --- a/arch/mips/math-emu/cp1emu.c
>     +++ b/arch/mips/math-emu/cp1emu.c
>     @@ -821,11 +821,7 @@ static int isBranchInstr(struct pt_regs
>     *regs, struct mm_decoded_insn dec_insn,
>                     if (insn.i_format.rs <http://insn.i_format.rs> ==
>     bc_op) {
>                             preempt_disable();
>                             if (is_fpu_owner())
>     -                               asm volatile(
>     -                                       ".set push\n"
>     -                                       "\t.set mips1\n"
>     -                                       "\tcfc1\t%0,$31\n"
>     -                                       "\t.set pop" : "=r" (fcr31));
>     +                               fcr31 =
>     read_32bit_cp1_register(CP1_STATUS);
>                             else
>                                     fcr31 = current->thread.fpu.fcr31;
>                             preempt_enable();
>     --
>     2.0.2
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--------------030008020209080806030800
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 7/15/2015 1:42 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbYUqQ6YJ1CO4bK+PStc7NNttEpkYgN6Kdxu9t6urHvVw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">(I think you meant to send this to linux-yocto@...)</div>
    </blockquote>
    <br>
    Yes, should I resend the patch to linux-yocto?<br>
    <br>
    Thanks,<br>
    Yang<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbYUqQ6YJ1CO4bK+PStc7NNttEpkYgN6Kdxu9t6urHvVw@mail.gmail.com"
      type="cite">
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 15 July 2015 at 21:15, Yang Shi <span
            dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:yang.shi@windriver.com" target="_blank">yang.shi@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            Manuel Lauss &lt;<a moz-do-not-send="true"
              href="mailto:manuel.lauss@gmail.com">manuel.lauss@gmail.com</a>&gt;<br>
            <br>
            commit 842dfc11ea9a21f9825167c8a4f2834b205b0a79 upstream<br>
            <br>
            Starting with version 2.24.51.20140728 MIPS binutils
            complain loudly<br>
            about mixing soft-float and hard-float object files, leading
            to this<br>
            build failure since GCC is invoked with "-msoft-float" on
            MIPS:<br>
            <br>
            {standard input}: Warning: .gnu_attribute 4,3 requires
            `softfloat'<br>
              LD      arch/mips/alchemy/common/built-in.o<br>
            mipsel-softfloat-linux-gnu-ld: Warning:
            arch/mips/alchemy/common/built-in.o<br>
             uses -msoft-float (set by arch/mips/alchemy/common/prom.o),<br>
             arch/mips/alchemy/common/sleeper.o uses -mhard-float<br>
            <br>
            To fix this, we detect if GAS is new enough to support
            "-msoft-float" command<br>
            option, and if it does, we can let GCC pass it to GAS;  but
            then we also need<br>
            to sprinkle the files which make use of floating point
            registers with the<br>
            necessary ".set hardfloat" directives.<br>
            <br>
            Signed-off-by: Manuel Lauss &lt;<a moz-do-not-send="true"
              href="mailto:manuel.lauss@gmail.com">manuel.lauss@gmail.com</a>&gt;<br>
            Cc: Linux-MIPS &lt;<a moz-do-not-send="true"
              href="mailto:linux-mips@linux-mips.org">linux-mips@linux-mips.org</a>&gt;<br>
            Cc: Matthew Fortune &lt;<a moz-do-not-send="true"
              href="mailto:Matthew.Fortune@imgtec.com">Matthew.Fortune@imgtec.com</a>&gt;<br>
            Cc: Markos Chandras &lt;<a moz-do-not-send="true"
              href="mailto:Markos.Chandras@imgtec.com">Markos.Chandras@imgtec.com</a>&gt;<br>
            Cc: Maciej W. Rozycki &lt;<a moz-do-not-send="true"
              href="mailto:macro@linux-mips.org">macro@linux-mips.org</a>&gt;<br>
            Patchwork: <a moz-do-not-send="true"
              href="https://patchwork.linux-mips.org/patch/8355/"
              rel="noreferrer" target="_blank">https://patchwork.linux-mips.org/patch/8355/</a><br>
            Signed-off-by: Ralf Baechle &lt;<a moz-do-not-send="true"
              href="mailto:ralf@linux-mips.org">ralf@linux-mips.org</a>&gt;<br>
            [yshi: Backported to Yocto 3.14 kernel]<br>
            Signed-off-by: Yang Shi &lt;<a moz-do-not-send="true"
              href="mailto:yang.shi@windriver.com">yang.shi@windriver.com</a>&gt;<br>
            ---<br>
             arch/mips/Makefile                  |  9 +++++++++<br>
             arch/mips/include/asm/asmmacro-32.h |  6 ++++++<br>
             arch/mips/include/asm/asmmacro.h    |  7 +++++++<br>
             arch/mips/include/asm/fpregdef.h    | 14 ++++++++++++++<br>
             arch/mips/include/asm/mipsregs.h    | 11 ++++++++++-<br>
             arch/mips/kernel/branch.c           |  6 +-----<br>
             arch/mips/kernel/genex.S            |  1 +<br>
             arch/mips/kernel/r2300_fpu.S        |  6 ++++++<br>
             arch/mips/kernel/r2300_switch.S     |  5 +++++<br>
             arch/mips/kernel/r4k_fpu.S          | 27
            +++++++++++++++++++++++++--<br>
             arch/mips/kernel/r4k_switch.S       | 11 ++++++++++-<br>
             arch/mips/kernel/r6000_fpu.S        |  5 +++++<br>
             arch/mips/math-emu/cp1emu.c         |  6 +-----<br>
             13 files changed, 100 insertions(+), 14 deletions(-)<br>
            <br>
            diff --git a/arch/mips/Makefile b/arch/mips/Makefile<br>
            index 69bd6f7..c1a7f83 100644<br>
            --- a/arch/mips/Makefile<br>
            +++ b/arch/mips/Makefile<br>
            @@ -96,6 +96,15 @@ KBUILD_AFLAGS_MODULE         +=
            -mlong-calls<br>
             KBUILD_CFLAGS_MODULE           += -mlong-calls<br>
             endif<br>
            <br>
            +#<br>
            +# pass -msoft-float to GAS if it supports it.  However on
            newer binutils<br>
            +# (specifically newer than 2.24.51.20140728) we then also
            need to explicitly<br>
            +# set ".set hardfloat" in all files which manipulate
            floating point registers.<br>
            +#<br>
            +ifneq ($(call as-option,-Wa$(comma)-msoft-float,),)<br>
            +       cflags-y                += -DGAS_HAS_SET_HARDFLOAT
            -Wa,-msoft-float<br>
            +endif<br>
            +<br>
             cflags-y += -ffreestanding<br>
            <br>
             #<br>
            diff --git a/arch/mips/include/asm/asmmacro-32.h
            b/arch/mips/include/asm/asmmacro-32.h<br>
            index 70e1f17..8038647 100644<br>
            --- a/arch/mips/include/asm/asmmacro-32.h<br>
            +++ b/arch/mips/include/asm/asmmacro-32.h<br>
            @@ -13,6 +13,8 @@<br>
             #include &lt;asm/mipsregs.h&gt;<br>
            <br>
                    .macro  fpu_save_single thread tmp=t0<br>
            +       .set push<br>
            +       SET_HARDFLOAT<br>
                    cfc1    \tmp,  fcr31<br>
                    swc1    $f0,  THREAD_FPR0(\thread)<br>
                    swc1    $f1,  THREAD_FPR1(\thread)<br>
            @@ -47,9 +49,12 @@<br>
                    swc1    $f30, THREAD_FPR30(\thread)<br>
                    swc1    $f31, THREAD_FPR31(\thread)<br>
                    sw      \tmp, THREAD_FCR31(\thread)<br>
            +       .set pop<br>
                    .endm<br>
            <br>
                    .macro  fpu_restore_single thread tmp=t0<br>
            +       .set push<br>
            +       SET_HARDFLOAT<br>
                    lw      \tmp, THREAD_FCR31(\thread)<br>
                    lwc1    $f0,  THREAD_FPR0(\thread)<br>
                    lwc1    $f1,  THREAD_FPR1(\thread)<br>
            @@ -84,6 +89,7 @@<br>
                    lwc1    $f30, THREAD_FPR30(\thread)<br>
                    lwc1    $f31, THREAD_FPR31(\thread)<br>
                    ctc1    \tmp, fcr31<br>
            +       .set pop<br>
                    .endm<br>
            <br>
                    .macro  cpu_save_nonscratch thread<br>
            diff --git a/arch/mips/include/asm/asmmacro.h
            b/arch/mips/include/asm/asmmacro.h<br>
            index 4225e99..d6d5b19 100644<br>
            --- a/arch/mips/include/asm/asmmacro.h<br>
            +++ b/arch/mips/include/asm/asmmacro.h<br>
            @@ -74,6 +74,8 @@<br>
             #endif /* CONFIG_MIPS_MT_SMTC */<br>
            <br>
                    .macro  fpu_save_16even thread tmp=t0<br>
            +       .set    push<br>
            +       SET_HARDFLOAT<br>
                    cfc1    \tmp, fcr31<br>
                    sdc1    $f0,  THREAD_FPR0(\thread)<br>
                    sdc1    $f2,  THREAD_FPR2(\thread)<br>
            @@ -92,11 +94,13 @@<br>
                    sdc1    $f28, THREAD_FPR28(\thread)<br>
                    sdc1    $f30, THREAD_FPR30(\thread)<br>
                    sw      \tmp, THREAD_FCR31(\thread)<br>
            +       .set    pop<br>
                    .endm<br>
            <br>
                    .macro  fpu_save_16odd thread<br>
                    .set    push<br>
                    .set    mips64r2<br>
            +       SET_HARDFLOAT<br>
                    sdc1    $f1,  THREAD_FPR1(\thread)<br>
                    sdc1    $f3,  THREAD_FPR3(\thread)<br>
                    sdc1    $f5,  THREAD_FPR5(\thread)<br>
            @@ -127,6 +131,8 @@<br>
                    .endm<br>
            <br>
                    .macro  fpu_restore_16even thread tmp=t0<br>
            +       .set    push<br>
            +       SET_HARDFLOAT<br>
                    lw      \tmp, THREAD_FCR31(\thread)<br>
                    ldc1    $f0,  THREAD_FPR0(\thread)<br>
                    ldc1    $f2,  THREAD_FPR2(\thread)<br>
            @@ -150,6 +156,7 @@<br>
                    .macro  fpu_restore_16odd thread<br>
                    .set    push<br>
                    .set    mips64r2<br>
            +       SET_HARDFLOAT<br>
                    ldc1    $f1,  THREAD_FPR1(\thread)<br>
                    ldc1    $f3,  THREAD_FPR3(\thread)<br>
                    ldc1    $f5,  THREAD_FPR5(\thread)<br>
            diff --git a/arch/mips/include/asm/fpregdef.h
            b/arch/mips/include/asm/fpregdef.h<br>
            index 429481f..f184ba0 100644<br>
            --- a/arch/mips/include/asm/fpregdef.h<br>
            +++ b/arch/mips/include/asm/fpregdef.h<br>
            @@ -14,6 +14,20 @@<br>
            <br>
             #include &lt;asm/sgidefs.h&gt;<br>
            <br>
            +/*<br>
            + * starting with binutils 2.24.51.20140729, MIPS binutils
            warn about mixing<br>
            + * hardfloat and softfloat object files.  The kernel build
            uses soft-float by<br>
            + * default, so we also need to pass -msoft-float along to
            GAS if it supports it.<br>
            + * But this in turn causes assembler errors in files which
            access hardfloat<br>
            + * registers.  We detect if GAS supports "-msoft-float" in
            the Makefile and<br>
            + * explicitly put ".set hardfloat" where floating point
            registers are touched.<br>
            + */<br>
            +#ifdef GAS_HAS_SET_HARDFLOAT<br>
            +#define SET_HARDFLOAT .set hardfloat<br>
            +#else<br>
            +#define SET_HARDFLOAT<br>
            +#endif<br>
            +<br>
             #if _MIPS_SIM == _MIPS_SIM_ABI32<br>
            <br>
             /*<br>
            diff --git a/arch/mips/include/asm/mipsregs.h
            b/arch/mips/include/asm/mipsregs.h<br>
            index d6a8ced..67a209f 100644<br>
            --- a/arch/mips/include/asm/mipsregs.h<br>
            +++ b/arch/mips/include/asm/mipsregs.h<br>
            @@ -1518,7 +1518,7 @@ do {                                 
                                                \<br>
             /*<br>
              * Macros to access the floating point coprocessor control
            registers<br>
              */<br>
            -#define read_32bit_cp1_register(source)                   
                                \<br>
            +#define _read_32bit_cp1_register(source, gas_hardfloat)   
                                \<br>
             ({                                                         
                       \<br>
                    int __res;                                         
                        \<br>
                                                                       
                        \<br>
            @@ -1528,12 +1528,21 @@ do {                               
                                                \<br>
                    "       # gas fails to assemble cfc1 for some
            archs,    \n"     \<br>
                    "       # like Octeon.                             
                \n"     \<br>
                    "       .set    mips1                               
               \n"     \<br>
            +       "       "STR(gas_hardfloat)"                       
                \n"     \<br>
                    "       cfc1    %0,"STR(source)"                   
                \n"     \<br>
                    "       .set    pop                                 
               \n"     \<br>
                    : "=r" (__res));                                   
                        \<br>
                    __res;                                             
                        \<br>
             })<br>
            <br>
            +#ifdef GAS_HAS_SET_HARDFLOAT<br>
            +#define read_32bit_cp1_register(source)                   
                                \<br>
            +       _read_32bit_cp1_register(source, .set hardfloat)<br>
            +#else<br>
            +#define read_32bit_cp1_register(source)                   
                                \<br>
            +       _read_32bit_cp1_register(source, )<br>
            +#endif<br>
            +<br>
             #ifdef HAVE_AS_DSP<br>
             #define rddsp(mask)                                       
                        \<br>
             ({                                                         
                       \<br>
            diff --git a/arch/mips/kernel/branch.c
            b/arch/mips/kernel/branch.c<br>
            index ecba7eb..d14383d 100644<br>
            --- a/arch/mips/kernel/branch.c<br>
            +++ b/arch/mips/kernel/branch.c<br>
            @@ -438,11 +438,7 @@ static unsigned int __get_fcr31(void)<br>
            <br>
                    preempt_disable();<br>
                    if (is_fpu_owner())<br>
            -               asm volatile(<br>
            -                       ".set push\n"<br>
            -                       "\t.set mips1\n"<br>
            -                       "\tcfc1\t%0,$31\n"<br>
            -                       "\t.set pop" : "=r" (fcr31));<br>
            +               fcr31 = read_32bit_cp1_register(CP1_STATUS);<br>
                    else<br>
                            fcr31 = current-&gt;thread.fpu.fcr31;<br>
                    preempt_enable();<br>
            diff --git a/arch/mips/kernel/genex.S
            b/arch/mips/kernel/genex.S<br>
            index eb59fed..7b7611a 100644<br>
            --- a/arch/mips/kernel/genex.S<br>
            +++ b/arch/mips/kernel/genex.S<br>
            @@ -432,6 +432,7 @@ NESTED(nmi_handler, PT_SIZE, sp)<br>
                    .set    push<br>
                    /* gas fails to assemble cfc1 for some archs
            (octeon).*/ \<br>
                    .set    mips1<br>
            +       SET_HARDFLOAT<br>
                    cfc1    a1, fcr31<br>
                    li      a2, ~(0x3f &lt;&lt; 12)<br>
                    and     a2, a1<br>
            diff --git a/arch/mips/kernel/r2300_fpu.S
            b/arch/mips/kernel/r2300_fpu.S<br>
            index f31063d..5ce3b74 100644<br>
            --- a/arch/mips/kernel/r2300_fpu.S<br>
            +++ b/arch/mips/kernel/r2300_fpu.S<br>
            @@ -28,6 +28,8 @@<br>
                    .set    mips1<br>
                    /* Save floating point context */<br>
             LEAF(_save_fp_context)<br>
            +       .set    push<br>
            +       SET_HARDFLOAT<br>
                    li      v0, 0                                   #
            assume success<br>
                    cfc1    t1,fcr31<br>
                    EX(swc1 $f0,(SC_FPREGS+0)(a0))<br>
            @@ -65,6 +67,7 @@ LEAF(_save_fp_context)<br>
                    EX(sw   t1,(SC_FPC_CSR)(a0))<br>
                    cfc1    t0,$0                           #
            implementation/version<br>
                    jr      ra<br>
            +       .set    pop<br>
                    .set    nomacro<br>
                     EX(sw  t0,(SC_FPC_EIR)(a0))<br>
                    .set    macro<br>
            @@ -80,6 +83,8 @@ LEAF(_save_fp_context)<br>
              * stack frame which might have been changed by the user.<br>
              */<br>
             LEAF(_restore_fp_context)<br>
            +       .set    push<br>
            +       SET_HARDFLOAT<br>
                    li      v0, 0                                   #
            assume success<br>
                    EX(lw t0,(SC_FPC_CSR)(a0))<br>
                    EX(lwc1 $f0,(SC_FPREGS+0)(a0))<br>
            @@ -116,6 +121,7 @@ LEAF(_restore_fp_context)<br>
                    EX(lwc1 $f31,(SC_FPREGS+248)(a0))<br>
                    jr      ra<br>
                     ctc1   t0,fcr31<br>
            +       .set    pop<br>
                    END(_restore_fp_context)<br>
                    .set    reorder<br>
            <br>
            diff --git a/arch/mips/kernel/r2300_switch.S
            b/arch/mips/kernel/r2300_switch.S<br>
            index 20b7b04..435ea65 100644<br>
            --- a/arch/mips/kernel/r2300_switch.S<br>
            +++ b/arch/mips/kernel/r2300_switch.S<br>
            @@ -120,6 +120,9 @@ LEAF(_restore_fp)<br>
            <br>
             #define FPU_DEFAULT  0x00000000<br>
            <br>
            +       .set push<br>
            +       SET_HARDFLOAT<br>
            +<br>
             LEAF(_init_fpu)<br>
                    mfc0    t0, CP0_STATUS<br>
                    li      t1, ST0_CU1<br>
            @@ -165,3 +168,5 @@ LEAF(_init_fpu)<br>
                    mtc1    t0, $f31<br>
                    jr      ra<br>
                    END(_init_fpu)<br>
            +<br>
            +       .set pop<br>
            diff --git a/arch/mips/kernel/r4k_fpu.S
            b/arch/mips/kernel/r4k_fpu.S<br>
            index 73b0ddf..06f8b2a 100644<br>
            --- a/arch/mips/kernel/r4k_fpu.S<br>
            +++ b/arch/mips/kernel/r4k_fpu.S<br>
            @@ -19,8 +19,12 @@<br>
             #include &lt;asm/asm-offsets.h&gt;<br>
             #include &lt;asm/regdef.h&gt;<br>
            <br>
            +/* preprocessor replaces the fp in ".set fp=64" with $30
            otherwise */<br>
            +#undef fp<br>
            +<br>
                    .macro  EX insn, reg, src<br>
                    .set    push<br>
            +       SET_HARDFLOAT<br>
                    .set    nomacro<br>
             .ex\@: \insn   \reg, \src<br>
                    .set    pop<br>
            @@ -33,12 +37,17 @@<br>
                    .set    mips3<br>
            <br>
             LEAF(_save_fp_context)<br>
            +       .set    push<br>
            +       SET_HARDFLOAT<br>
                    cfc1    t1, fcr31<br>
            +       .set    pop<br>
            <br>
             #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2)<br>
                    .set    push<br>
            +       SET_HARDFLOAT<br>
             #ifdef CONFIG_CPU_MIPS32_R2<br>
            -       .set    mips64r2<br>
            +       .set    mips32r2<br>
            +       .set    fp=64<br>
                    mfc0    t0, CP0_STATUS<br>
                    sll     t0, t0, 5<br>
                    bgez    t0, 1f                  # skip storing odd
            if FR=0<br>
            @@ -64,6 +73,8 @@ LEAF(_save_fp_context)<br>
             1:     .set    pop<br>
             #endif<br>
            <br>
            +       .set push<br>
            +       SET_HARDFLOAT<br>
                    /* Store the 16 even double precision registers */<br>
                    EX      sdc1 $f0, SC_FPREGS+0(a0)<br>
                    EX      sdc1 $f2, SC_FPREGS+16(a0)<br>
            @@ -84,11 +95,14 @@ LEAF(_save_fp_context)<br>
                    EX      sw t1, SC_FPC_CSR(a0)<br>
                    jr      ra<br>
                     li     v0, 0                                   #
            success<br>
            +       .set pop<br>
                    END(_save_fp_context)<br>
            <br>
             #ifdef CONFIG_MIPS32_COMPAT<br>
                    /* Save 32-bit process floating point context */<br>
             LEAF(_save_fp_context32)<br>
            +       .set push<br>
            +       SET_HARDFLOAT<br>
                    cfc1    t1, fcr31<br>
            <br>
                    mfc0    t0, CP0_STATUS<br>
            @@ -134,6 +148,7 @@ LEAF(_save_fp_context32)<br>
                    EX      sw t1, SC32_FPC_CSR(a0)<br>
                    cfc1    t0, $0                          #
            implementation/version<br>
                    EX      sw t0, SC32_FPC_EIR(a0)<br>
            +       .set pop<br>
            <br>
                    jr      ra<br>
                     li     v0, 0                                   #
            success<br>
            @@ -150,8 +165,10 @@ LEAF(_restore_fp_context)<br>
            <br>
             #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2)<br>
                    .set    push<br>
            +       SET_HARDFLOAT<br>
             #ifdef CONFIG_CPU_MIPS32_R2<br>
            -       .set    mips64r2<br>
            +       .set    mips32r2<br>
            +       .set    fp=64<br>
                    mfc0    t0, CP0_STATUS<br>
                    sll     t0, t0, 5<br>
                    bgez    t0, 1f                  # skip loading odd
            if FR=0<br>
            @@ -175,6 +192,8 @@ LEAF(_restore_fp_context)<br>
                    EX      ldc1 $f31, SC_FPREGS+248(a0)<br>
             1:     .set pop<br>
             #endif<br>
            +       .set push<br>
            +       SET_HARDFLOAT<br>
                    EX      ldc1 $f0, SC_FPREGS+0(a0)<br>
                    EX      ldc1 $f2, SC_FPREGS+16(a0)<br>
                    EX      ldc1 $f4, SC_FPREGS+32(a0)<br>
            @@ -192,6 +211,7 @@ LEAF(_restore_fp_context)<br>
                    EX      ldc1 $f28, SC_FPREGS+224(a0)<br>
                    EX      ldc1 $f30, SC_FPREGS+240(a0)<br>
                    ctc1    t1, fcr31<br>
            +       .set pop<br>
                    jr      ra<br>
                     li     v0, 0                                   #
            success<br>
                    END(_restore_fp_context)<br>
            @@ -199,6 +219,8 @@ LEAF(_restore_fp_context)<br>
             #ifdef CONFIG_MIPS32_COMPAT<br>
             LEAF(_restore_fp_context32)<br>
                    /* Restore an o32 sigcontext.  */<br>
            +       .set push<br>
            +       SET_HARDFLOAT<br>
                    EX      lw t1, SC32_FPC_CSR(a0)<br>
            <br>
                    mfc0    t0, CP0_STATUS<br>
            @@ -242,6 +264,7 @@ LEAF(_restore_fp_context32)<br>
                    ctc1    t1, fcr31<br>
                    jr      ra<br>
                     li     v0, 0                                   #
            success<br>
            +       .set pop<br>
                    END(_restore_fp_context32)<br>
             #endif<br>
            <br>
            diff --git a/arch/mips/kernel/r4k_switch.S
            b/arch/mips/kernel/r4k_switch.S<br>
            index 8a4f9a5..715fb13 100644<br>
            --- a/arch/mips/kernel/r4k_switch.S<br>
            +++ b/arch/mips/kernel/r4k_switch.S<br>
            @@ -22,6 +22,9 @@<br>
            <br>
             #include &lt;asm/asmmacro.h&gt;<br>
            <br>
            +/* preprocessor replaces the fp in ".set fp=64" with $30
            otherwise */<br>
            +#undef fp<br>
            +<br>
             /*<br>
              * Offset to the current process status flags, the first 32
            bytes of the<br>
              * stack are not used.<br>
            @@ -154,6 +157,9 @@ LEAF(_restore_fp)<br>
            <br>
             #define FPU_DEFAULT  0x00000000<br>
            <br>
            +       .set push<br>
            +       SET_HARDFLOAT<br>
            +<br>
             LEAF(_init_fpu)<br>
             #ifdef CONFIG_MIPS_MT_SMTC<br>
                    /* Rather than manipulate per-VPE Status, set per-TC
            bit in TCStatus */<br>
            @@ -234,7 +240,8 @@ LEAF(_init_fpu)<br>
            <br>
             #ifdef CONFIG_CPU_MIPS32_R2<br>
                    .set    push<br>
            -       .set    mips64r2<br>
            +       .set    mips32r2<br>
            +       .set    fp=64<br>
                    sll     t0, t0, 5                       # is
            Status.FR set?<br>
                    bgez    t0, 1f                          # no: skip
            setting upper 32b<br>
            <br>
            @@ -293,3 +300,5 @@ LEAF(_init_fpu)<br>
             #endif<br>
                    jr      ra<br>
                    END(_init_fpu)<br>
            +<br>
            +       .set pop        /* SET_HARDFLOAT */<br>
            diff --git a/arch/mips/kernel/r6000_fpu.S
            b/arch/mips/kernel/r6000_fpu.S<br>
            index da0fbe4..4707738 100644<br>
            --- a/arch/mips/kernel/r6000_fpu.S<br>
            +++ b/arch/mips/kernel/r6000_fpu.S<br>
            @@ -18,6 +18,9 @@<br>
            <br>
                    .set    noreorder<br>
                    .set    mips2<br>
            +       .set    push<br>
            +       SET_HARDFLOAT<br>
            +<br>
                    /* Save floating point context */<br>
                    LEAF(_save_fp_context)<br>
                    mfc0    t0,CP0_STATUS<br>
            @@ -85,3 +88,5 @@<br>
             1:     jr      ra<br>
                     nop<br>
                    END(_restore_fp_context)<br>
            +<br>
            +       .set pop        /* SET_HARDFLOAT */<br>
            diff --git a/arch/mips/math-emu/cp1emu.c
            b/arch/mips/math-emu/cp1emu.c<br>
            index edb110c..4e9e3c1 100644<br>
            --- a/arch/mips/math-emu/cp1emu.c<br>
            +++ b/arch/mips/math-emu/cp1emu.c<br>
            @@ -821,11 +821,7 @@ static int isBranchInstr(struct pt_regs
            *regs, struct mm_decoded_insn dec_insn,<br>
                            if (<a moz-do-not-send="true"
              href="http://insn.i_format.rs" rel="noreferrer"
              target="_blank">insn.i_format.rs</a> == bc_op) {<br>
                                    preempt_disable();<br>
                                    if (is_fpu_owner())<br>
            -                               asm volatile(<br>
            -                                       ".set push\n"<br>
            -                                       "\t.set mips1\n"<br>
            -                                       "\tcfc1\t%0,$31\n"<br>
            -                                       "\t.set pop" : "=r"
            (fcr31));<br>
            +                               fcr31 =
            read_32bit_cp1_register(CP1_STATUS);<br>
                                    else<br>
                                            fcr31 =
            current-&gt;thread.fpu.fcr31;<br>
                                    preempt_enable();<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.0.2<br>
                <br>
                --<br>
                _______________________________________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------030008020209080806030800--
