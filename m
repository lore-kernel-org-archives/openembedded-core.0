Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1BE737A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 20:42:58 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so37109623qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fcNlQ/LNMD6ITRYpm5gFp3kRRaX83oeRcgPCA9NjEwU=;
	b=H5/0Dh850n3YKuV8uL8BkOFv1XKaChPKl+bl8gC5s/3evsodzI+6qZaTK4ku5YcTyX
	7UkGVyParv4etbJP75miG9Xcf00GfOFi4Lw4M/hoUKq4q9mL3bfszGhjlhp2bmRQVtPJ
	FcYCNBipa+fiVVzqZYJHSgmem1lfdiguHV2Z006crKcgfHy1+js1uYo+LkzcLn6/FH7E
	CJU8u+YznxpLLK7G9WMvgqnRwGJJXEbcJjDXWpvYTciqMeGthujYmcP7WYXpqTqDBysR
	eZ2GmPw7yogZ+1neABiNk5ClTPAJvN4s0ZoIob4UJUvM5lzcXh3wJwMPixBd4Nfvfo3D
	h0Jw==
X-Gm-Message-State: ALoCoQmJdQWu/qsf7ustkuG4MhfS3XXLsI1yfzKGxcJuwRwWrHZixdx2sGWDxld7zA+Yc92+kZNO
X-Received: by 10.140.235.19 with SMTP id g19mr5009163qhc.52.1436992978013;
	Wed, 15 Jul 2015 13:42:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Jul 2015 13:42:38 -0700 (PDT)
In-Reply-To: <1436991327-5726-2-git-send-email-yang.shi@windriver.com>
References: <1436991327-5726-1-git-send-email-yang.shi@windriver.com>
	<1436991327-5726-2-git-send-email-yang.shi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Jul 2015 21:42:38 +0100
Message-ID: <CAJTo0LbYUqQ6YJ1CO4bK+PStc7NNttEpkYgN6Kdxu9t6urHvVw@mail.gmail.com>
To: Yang Shi <yang.shi@windriver.com>
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
X-List-Received-Date: Wed, 15 Jul 2015 20:42:59 -0000
Content-Type: multipart/alternative; boundary=001a11376dacffe78c051aefffa3

--001a11376dacffe78c051aefffa3
Content-Type: text/plain; charset=UTF-8

(I think you meant to send this to linux-yocto@...)

On 15 July 2015 at 21:15, Yang Shi <yang.shi@windriver.com> wrote:

> From: Manuel Lauss <manuel.lauss@gmail.com>
>
> commit 842dfc11ea9a21f9825167c8a4f2834b205b0a79 upstream
>
> Starting with version 2.24.51.20140728 MIPS binutils complain loudly
> about mixing soft-float and hard-float object files, leading to this
> build failure since GCC is invoked with "-msoft-float" on MIPS:
>
> {standard input}: Warning: .gnu_attribute 4,3 requires `softfloat'
>   LD      arch/mips/alchemy/common/built-in.o
> mipsel-softfloat-linux-gnu-ld: Warning: arch/mips/alchemy/common/built-in.o
>  uses -msoft-float (set by arch/mips/alchemy/common/prom.o),
>  arch/mips/alchemy/common/sleeper.o uses -mhard-float
>
> To fix this, we detect if GAS is new enough to support "-msoft-float"
> command
> option, and if it does, we can let GCC pass it to GAS;  but then we also
> need
> to sprinkle the files which make use of floating point registers with the
> necessary ".set hardfloat" directives.
>
> Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
> Cc: Linux-MIPS <linux-mips@linux-mips.org>
> Cc: Matthew Fortune <Matthew.Fortune@imgtec.com>
> Cc: Markos Chandras <Markos.Chandras@imgtec.com>
> Cc: Maciej W. Rozycki <macro@linux-mips.org>
> Patchwork: https://patchwork.linux-mips.org/patch/8355/
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> [yshi: Backported to Yocto 3.14 kernel]
> Signed-off-by: Yang Shi <yang.shi@windriver.com>
> ---
>  arch/mips/Makefile                  |  9 +++++++++
>  arch/mips/include/asm/asmmacro-32.h |  6 ++++++
>  arch/mips/include/asm/asmmacro.h    |  7 +++++++
>  arch/mips/include/asm/fpregdef.h    | 14 ++++++++++++++
>  arch/mips/include/asm/mipsregs.h    | 11 ++++++++++-
>  arch/mips/kernel/branch.c           |  6 +-----
>  arch/mips/kernel/genex.S            |  1 +
>  arch/mips/kernel/r2300_fpu.S        |  6 ++++++
>  arch/mips/kernel/r2300_switch.S     |  5 +++++
>  arch/mips/kernel/r4k_fpu.S          | 27 +++++++++++++++++++++++++--
>  arch/mips/kernel/r4k_switch.S       | 11 ++++++++++-
>  arch/mips/kernel/r6000_fpu.S        |  5 +++++
>  arch/mips/math-emu/cp1emu.c         |  6 +-----
>  13 files changed, 100 insertions(+), 14 deletions(-)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 69bd6f7..c1a7f83 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -96,6 +96,15 @@ KBUILD_AFLAGS_MODULE         += -mlong-calls
>  KBUILD_CFLAGS_MODULE           += -mlong-calls
>  endif
>
> +#
> +# pass -msoft-float to GAS if it supports it.  However on newer binutils
> +# (specifically newer than 2.24.51.20140728) we then also need to
> explicitly
> +# set ".set hardfloat" in all files which manipulate floating point
> registers.
> +#
> +ifneq ($(call as-option,-Wa$(comma)-msoft-float,),)
> +       cflags-y                += -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float
> +endif
> +
>  cflags-y += -ffreestanding
>
>  #
> diff --git a/arch/mips/include/asm/asmmacro-32.h
> b/arch/mips/include/asm/asmmacro-32.h
> index 70e1f17..8038647 100644
> --- a/arch/mips/include/asm/asmmacro-32.h
> +++ b/arch/mips/include/asm/asmmacro-32.h
> @@ -13,6 +13,8 @@
>  #include <asm/mipsregs.h>
>
>         .macro  fpu_save_single thread tmp=t0
> +       .set push
> +       SET_HARDFLOAT
>         cfc1    \tmp,  fcr31
>         swc1    $f0,  THREAD_FPR0(\thread)
>         swc1    $f1,  THREAD_FPR1(\thread)
> @@ -47,9 +49,12 @@
>         swc1    $f30, THREAD_FPR30(\thread)
>         swc1    $f31, THREAD_FPR31(\thread)
>         sw      \tmp, THREAD_FCR31(\thread)
> +       .set pop
>         .endm
>
>         .macro  fpu_restore_single thread tmp=t0
> +       .set push
> +       SET_HARDFLOAT
>         lw      \tmp, THREAD_FCR31(\thread)
>         lwc1    $f0,  THREAD_FPR0(\thread)
>         lwc1    $f1,  THREAD_FPR1(\thread)
> @@ -84,6 +89,7 @@
>         lwc1    $f30, THREAD_FPR30(\thread)
>         lwc1    $f31, THREAD_FPR31(\thread)
>         ctc1    \tmp, fcr31
> +       .set pop
>         .endm
>
>         .macro  cpu_save_nonscratch thread
> diff --git a/arch/mips/include/asm/asmmacro.h
> b/arch/mips/include/asm/asmmacro.h
> index 4225e99..d6d5b19 100644
> --- a/arch/mips/include/asm/asmmacro.h
> +++ b/arch/mips/include/asm/asmmacro.h
> @@ -74,6 +74,8 @@
>  #endif /* CONFIG_MIPS_MT_SMTC */
>
>         .macro  fpu_save_16even thread tmp=t0
> +       .set    push
> +       SET_HARDFLOAT
>         cfc1    \tmp, fcr31
>         sdc1    $f0,  THREAD_FPR0(\thread)
>         sdc1    $f2,  THREAD_FPR2(\thread)
> @@ -92,11 +94,13 @@
>         sdc1    $f28, THREAD_FPR28(\thread)
>         sdc1    $f30, THREAD_FPR30(\thread)
>         sw      \tmp, THREAD_FCR31(\thread)
> +       .set    pop
>         .endm
>
>         .macro  fpu_save_16odd thread
>         .set    push
>         .set    mips64r2
> +       SET_HARDFLOAT
>         sdc1    $f1,  THREAD_FPR1(\thread)
>         sdc1    $f3,  THREAD_FPR3(\thread)
>         sdc1    $f5,  THREAD_FPR5(\thread)
> @@ -127,6 +131,8 @@
>         .endm
>
>         .macro  fpu_restore_16even thread tmp=t0
> +       .set    push
> +       SET_HARDFLOAT
>         lw      \tmp, THREAD_FCR31(\thread)
>         ldc1    $f0,  THREAD_FPR0(\thread)
>         ldc1    $f2,  THREAD_FPR2(\thread)
> @@ -150,6 +156,7 @@
>         .macro  fpu_restore_16odd thread
>         .set    push
>         .set    mips64r2
> +       SET_HARDFLOAT
>         ldc1    $f1,  THREAD_FPR1(\thread)
>         ldc1    $f3,  THREAD_FPR3(\thread)
>         ldc1    $f5,  THREAD_FPR5(\thread)
> diff --git a/arch/mips/include/asm/fpregdef.h
> b/arch/mips/include/asm/fpregdef.h
> index 429481f..f184ba0 100644
> --- a/arch/mips/include/asm/fpregdef.h
> +++ b/arch/mips/include/asm/fpregdef.h
> @@ -14,6 +14,20 @@
>
>  #include <asm/sgidefs.h>
>
> +/*
> + * starting with binutils 2.24.51.20140729, MIPS binutils warn about
> mixing
> + * hardfloat and softfloat object files.  The kernel build uses
> soft-float by
> + * default, so we also need to pass -msoft-float along to GAS if it
> supports it.
> + * But this in turn causes assembler errors in files which access
> hardfloat
> + * registers.  We detect if GAS supports "-msoft-float" in the Makefile
> and
> + * explicitly put ".set hardfloat" where floating point registers are
> touched.
> + */
> +#ifdef GAS_HAS_SET_HARDFLOAT
> +#define SET_HARDFLOAT .set hardfloat
> +#else
> +#define SET_HARDFLOAT
> +#endif
> +
>  #if _MIPS_SIM == _MIPS_SIM_ABI32
>
>  /*
> diff --git a/arch/mips/include/asm/mipsregs.h
> b/arch/mips/include/asm/mipsregs.h
> index d6a8ced..67a209f 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -1518,7 +1518,7 @@ do {
>                       \
>  /*
>   * Macros to access the floating point coprocessor control registers
>   */
> -#define read_32bit_cp1_register(source)
>       \
> +#define _read_32bit_cp1_register(source, gas_hardfloat)
>       \
>  ({                                                                     \
>         int __res;                                                      \
>                                                                         \
> @@ -1528,12 +1528,21 @@ do {
>                       \
>         "       # gas fails to assemble cfc1 for some archs,    \n"     \
>         "       # like Octeon.                                  \n"     \
>         "       .set    mips1                                   \n"     \
> +       "       "STR(gas_hardfloat)"                            \n"     \
>         "       cfc1    %0,"STR(source)"                        \n"     \
>         "       .set    pop                                     \n"     \
>         : "=r" (__res));                                                \
>         __res;                                                          \
>  })
>
> +#ifdef GAS_HAS_SET_HARDFLOAT
> +#define read_32bit_cp1_register(source)
>       \
> +       _read_32bit_cp1_register(source, .set hardfloat)
> +#else
> +#define read_32bit_cp1_register(source)
>       \
> +       _read_32bit_cp1_register(source, )
> +#endif
> +
>  #ifdef HAVE_AS_DSP
>  #define rddsp(mask)                                                    \
>  ({                                                                     \
> diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
> index ecba7eb..d14383d 100644
> --- a/arch/mips/kernel/branch.c
> +++ b/arch/mips/kernel/branch.c
> @@ -438,11 +438,7 @@ static unsigned int __get_fcr31(void)
>
>         preempt_disable();
>         if (is_fpu_owner())
> -               asm volatile(
> -                       ".set push\n"
> -                       "\t.set mips1\n"
> -                       "\tcfc1\t%0,$31\n"
> -                       "\t.set pop" : "=r" (fcr31));
> +               fcr31 = read_32bit_cp1_register(CP1_STATUS);
>         else
>                 fcr31 = current->thread.fpu.fcr31;
>         preempt_enable();
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index eb59fed..7b7611a 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -432,6 +432,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
>         .set    push
>         /* gas fails to assemble cfc1 for some archs (octeon).*/ \
>         .set    mips1
> +       SET_HARDFLOAT
>         cfc1    a1, fcr31
>         li      a2, ~(0x3f << 12)
>         and     a2, a1
> diff --git a/arch/mips/kernel/r2300_fpu.S b/arch/mips/kernel/r2300_fpu.S
> index f31063d..5ce3b74 100644
> --- a/arch/mips/kernel/r2300_fpu.S
> +++ b/arch/mips/kernel/r2300_fpu.S
> @@ -28,6 +28,8 @@
>         .set    mips1
>         /* Save floating point context */
>  LEAF(_save_fp_context)
> +       .set    push
> +       SET_HARDFLOAT
>         li      v0, 0                                   # assume success
>         cfc1    t1,fcr31
>         EX(swc1 $f0,(SC_FPREGS+0)(a0))
> @@ -65,6 +67,7 @@ LEAF(_save_fp_context)
>         EX(sw   t1,(SC_FPC_CSR)(a0))
>         cfc1    t0,$0                           # implementation/version
>         jr      ra
> +       .set    pop
>         .set    nomacro
>          EX(sw  t0,(SC_FPC_EIR)(a0))
>         .set    macro
> @@ -80,6 +83,8 @@ LEAF(_save_fp_context)
>   * stack frame which might have been changed by the user.
>   */
>  LEAF(_restore_fp_context)
> +       .set    push
> +       SET_HARDFLOAT
>         li      v0, 0                                   # assume success
>         EX(lw t0,(SC_FPC_CSR)(a0))
>         EX(lwc1 $f0,(SC_FPREGS+0)(a0))
> @@ -116,6 +121,7 @@ LEAF(_restore_fp_context)
>         EX(lwc1 $f31,(SC_FPREGS+248)(a0))
>         jr      ra
>          ctc1   t0,fcr31
> +       .set    pop
>         END(_restore_fp_context)
>         .set    reorder
>
> diff --git a/arch/mips/kernel/r2300_switch.S
> b/arch/mips/kernel/r2300_switch.S
> index 20b7b04..435ea65 100644
> --- a/arch/mips/kernel/r2300_switch.S
> +++ b/arch/mips/kernel/r2300_switch.S
> @@ -120,6 +120,9 @@ LEAF(_restore_fp)
>
>  #define FPU_DEFAULT  0x00000000
>
> +       .set push
> +       SET_HARDFLOAT
> +
>  LEAF(_init_fpu)
>         mfc0    t0, CP0_STATUS
>         li      t1, ST0_CU1
> @@ -165,3 +168,5 @@ LEAF(_init_fpu)
>         mtc1    t0, $f31
>         jr      ra
>         END(_init_fpu)
> +
> +       .set pop
> diff --git a/arch/mips/kernel/r4k_fpu.S b/arch/mips/kernel/r4k_fpu.S
> index 73b0ddf..06f8b2a 100644
> --- a/arch/mips/kernel/r4k_fpu.S
> +++ b/arch/mips/kernel/r4k_fpu.S
> @@ -19,8 +19,12 @@
>  #include <asm/asm-offsets.h>
>  #include <asm/regdef.h>
>
> +/* preprocessor replaces the fp in ".set fp=64" with $30 otherwise */
> +#undef fp
> +
>         .macro  EX insn, reg, src
>         .set    push
> +       SET_HARDFLOAT
>         .set    nomacro
>  .ex\@: \insn   \reg, \src
>         .set    pop
> @@ -33,12 +37,17 @@
>         .set    mips3
>
>  LEAF(_save_fp_context)
> +       .set    push
> +       SET_HARDFLOAT
>         cfc1    t1, fcr31
> +       .set    pop
>
>  #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2)
>         .set    push
> +       SET_HARDFLOAT
>  #ifdef CONFIG_CPU_MIPS32_R2
> -       .set    mips64r2
> +       .set    mips32r2
> +       .set    fp=64
>         mfc0    t0, CP0_STATUS
>         sll     t0, t0, 5
>         bgez    t0, 1f                  # skip storing odd if FR=0
> @@ -64,6 +73,8 @@ LEAF(_save_fp_context)
>  1:     .set    pop
>  #endif
>
> +       .set push
> +       SET_HARDFLOAT
>         /* Store the 16 even double precision registers */
>         EX      sdc1 $f0, SC_FPREGS+0(a0)
>         EX      sdc1 $f2, SC_FPREGS+16(a0)
> @@ -84,11 +95,14 @@ LEAF(_save_fp_context)
>         EX      sw t1, SC_FPC_CSR(a0)
>         jr      ra
>          li     v0, 0                                   # success
> +       .set pop
>         END(_save_fp_context)
>
>  #ifdef CONFIG_MIPS32_COMPAT
>         /* Save 32-bit process floating point context */
>  LEAF(_save_fp_context32)
> +       .set push
> +       SET_HARDFLOAT
>         cfc1    t1, fcr31
>
>         mfc0    t0, CP0_STATUS
> @@ -134,6 +148,7 @@ LEAF(_save_fp_context32)
>         EX      sw t1, SC32_FPC_CSR(a0)
>         cfc1    t0, $0                          # implementation/version
>         EX      sw t0, SC32_FPC_EIR(a0)
> +       .set pop
>
>         jr      ra
>          li     v0, 0                                   # success
> @@ -150,8 +165,10 @@ LEAF(_restore_fp_context)
>
>  #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPS32_R2)
>         .set    push
> +       SET_HARDFLOAT
>  #ifdef CONFIG_CPU_MIPS32_R2
> -       .set    mips64r2
> +       .set    mips32r2
> +       .set    fp=64
>         mfc0    t0, CP0_STATUS
>         sll     t0, t0, 5
>         bgez    t0, 1f                  # skip loading odd if FR=0
> @@ -175,6 +192,8 @@ LEAF(_restore_fp_context)
>         EX      ldc1 $f31, SC_FPREGS+248(a0)
>  1:     .set pop
>  #endif
> +       .set push
> +       SET_HARDFLOAT
>         EX      ldc1 $f0, SC_FPREGS+0(a0)
>         EX      ldc1 $f2, SC_FPREGS+16(a0)
>         EX      ldc1 $f4, SC_FPREGS+32(a0)
> @@ -192,6 +211,7 @@ LEAF(_restore_fp_context)
>         EX      ldc1 $f28, SC_FPREGS+224(a0)
>         EX      ldc1 $f30, SC_FPREGS+240(a0)
>         ctc1    t1, fcr31
> +       .set pop
>         jr      ra
>          li     v0, 0                                   # success
>         END(_restore_fp_context)
> @@ -199,6 +219,8 @@ LEAF(_restore_fp_context)
>  #ifdef CONFIG_MIPS32_COMPAT
>  LEAF(_restore_fp_context32)
>         /* Restore an o32 sigcontext.  */
> +       .set push
> +       SET_HARDFLOAT
>         EX      lw t1, SC32_FPC_CSR(a0)
>
>         mfc0    t0, CP0_STATUS
> @@ -242,6 +264,7 @@ LEAF(_restore_fp_context32)
>         ctc1    t1, fcr31
>         jr      ra
>          li     v0, 0                                   # success
> +       .set pop
>         END(_restore_fp_context32)
>  #endif
>
> diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
> index 8a4f9a5..715fb13 100644
> --- a/arch/mips/kernel/r4k_switch.S
> +++ b/arch/mips/kernel/r4k_switch.S
> @@ -22,6 +22,9 @@
>
>  #include <asm/asmmacro.h>
>
> +/* preprocessor replaces the fp in ".set fp=64" with $30 otherwise */
> +#undef fp
> +
>  /*
>   * Offset to the current process status flags, the first 32 bytes of the
>   * stack are not used.
> @@ -154,6 +157,9 @@ LEAF(_restore_fp)
>
>  #define FPU_DEFAULT  0x00000000
>
> +       .set push
> +       SET_HARDFLOAT
> +
>  LEAF(_init_fpu)
>  #ifdef CONFIG_MIPS_MT_SMTC
>         /* Rather than manipulate per-VPE Status, set per-TC bit in
> TCStatus */
> @@ -234,7 +240,8 @@ LEAF(_init_fpu)
>
>  #ifdef CONFIG_CPU_MIPS32_R2
>         .set    push
> -       .set    mips64r2
> +       .set    mips32r2
> +       .set    fp=64
>         sll     t0, t0, 5                       # is Status.FR set?
>         bgez    t0, 1f                          # no: skip setting upper
> 32b
>
> @@ -293,3 +300,5 @@ LEAF(_init_fpu)
>  #endif
>         jr      ra
>         END(_init_fpu)
> +
> +       .set pop        /* SET_HARDFLOAT */
> diff --git a/arch/mips/kernel/r6000_fpu.S b/arch/mips/kernel/r6000_fpu.S
> index da0fbe4..4707738 100644
> --- a/arch/mips/kernel/r6000_fpu.S
> +++ b/arch/mips/kernel/r6000_fpu.S
> @@ -18,6 +18,9 @@
>
>         .set    noreorder
>         .set    mips2
> +       .set    push
> +       SET_HARDFLOAT
> +
>         /* Save floating point context */
>         LEAF(_save_fp_context)
>         mfc0    t0,CP0_STATUS
> @@ -85,3 +88,5 @@
>  1:     jr      ra
>          nop
>         END(_restore_fp_context)
> +
> +       .set pop        /* SET_HARDFLOAT */
> diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
> index edb110c..4e9e3c1 100644
> --- a/arch/mips/math-emu/cp1emu.c
> +++ b/arch/mips/math-emu/cp1emu.c
> @@ -821,11 +821,7 @@ static int isBranchInstr(struct pt_regs *regs, struct
> mm_decoded_insn dec_insn,
>                 if (insn.i_format.rs == bc_op) {
>                         preempt_disable();
>                         if (is_fpu_owner())
> -                               asm volatile(
> -                                       ".set push\n"
> -                                       "\t.set mips1\n"
> -                                       "\tcfc1\t%0,$31\n"
> -                                       "\t.set pop" : "=r" (fcr31));
> +                               fcr31 =
> read_32bit_cp1_register(CP1_STATUS);
>                         else
>                                 fcr31 = current->thread.fpu.fcr31;
>                         preempt_enable();
> --
> 2.0.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11376dacffe78c051aefffa3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+KEkgdGhpbmsgeW91IG1lYW50IHRvIHNlbmQgdGhpcyB0byBsaW51eC15
b2N0b0AuLi4pPC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+T24gMTUgSnVseSAyMDE1IGF0IDIxOjE1LCBZYW5nIFNoaSA8c3BhbiBkaXI9
Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzp5YW5nLnNoaUB3aW5kcml2ZXIuY29tIiB0YXJnZXQ9
Il9ibGFuayI+eWFuZy5zaGlAd2luZHJpdmVyLmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+RnJvbTogTWFudWVs
IExhdXNzICZsdDs8YSBocmVmPSJtYWlsdG86bWFudWVsLmxhdXNzQGdtYWlsLmNvbSI+bWFudWVs
LmxhdXNzQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KPGJyPg0KY29tbWl0IDg0MmRmYzExZWE5YTIx
Zjk4MjUxNjdjOGE0ZjI4MzRiMjA1YjBhNzkgdXBzdHJlYW08YnI+DQo8YnI+DQpTdGFydGluZyB3
aXRoIHZlcnNpb24gMi4yNC41MS4yMDE0MDcyOCBNSVBTIGJpbnV0aWxzIGNvbXBsYWluIGxvdWRs
eTxicj4NCmFib3V0IG1peGluZyBzb2Z0LWZsb2F0IGFuZCBoYXJkLWZsb2F0IG9iamVjdCBmaWxl
cywgbGVhZGluZyB0byB0aGlzPGJyPg0KYnVpbGQgZmFpbHVyZSBzaW5jZSBHQ0MgaXMgaW52b2tl
ZCB3aXRoICZxdW90Oy1tc29mdC1mbG9hdCZxdW90OyBvbiBNSVBTOjxicj4NCjxicj4NCntzdGFu
ZGFyZCBpbnB1dH06IFdhcm5pbmc6IC5nbnVfYXR0cmlidXRlIDQsMyByZXF1aXJlcyBgc29mdGZs
b2F0JiMzOTs8YnI+DQrCoCBMRMKgIMKgIMKgIGFyY2gvbWlwcy9hbGNoZW15L2NvbW1vbi9idWls
dC1pbi5vPGJyPg0KbWlwc2VsLXNvZnRmbG9hdC1saW51eC1nbnUtbGQ6IFdhcm5pbmc6IGFyY2gv
bWlwcy9hbGNoZW15L2NvbW1vbi9idWlsdC1pbi5vPGJyPg0KwqB1c2VzIC1tc29mdC1mbG9hdCAo
c2V0IGJ5IGFyY2gvbWlwcy9hbGNoZW15L2NvbW1vbi9wcm9tLm8pLDxicj4NCsKgYXJjaC9taXBz
L2FsY2hlbXkvY29tbW9uL3NsZWVwZXIubyB1c2VzIC1taGFyZC1mbG9hdDxicj4NCjxicj4NClRv
IGZpeCB0aGlzLCB3ZSBkZXRlY3QgaWYgR0FTIGlzIG5ldyBlbm91Z2ggdG8gc3VwcG9ydCAmcXVv
dDstbXNvZnQtZmxvYXQmcXVvdDsgY29tbWFuZDxicj4NCm9wdGlvbiwgYW5kIGlmIGl0IGRvZXMs
IHdlIGNhbiBsZXQgR0NDIHBhc3MgaXQgdG8gR0FTO8KgIGJ1dCB0aGVuIHdlIGFsc28gbmVlZDxi
cj4NCnRvIHNwcmlua2xlIHRoZSBmaWxlcyB3aGljaCBtYWtlIHVzZSBvZiBmbG9hdGluZyBwb2lu
dCByZWdpc3RlcnMgd2l0aCB0aGU8YnI+DQpuZWNlc3NhcnkgJnF1b3Q7LnNldCBoYXJkZmxvYXQm
cXVvdDsgZGlyZWN0aXZlcy48YnI+DQo8YnI+DQpTaWduZWQtb2ZmLWJ5OiBNYW51ZWwgTGF1c3Mg
Jmx0OzxhIGhyZWY9Im1haWx0bzptYW51ZWwubGF1c3NAZ21haWwuY29tIj5tYW51ZWwubGF1c3NA
Z21haWwuY29tPC9hPiZndDs8YnI+DQpDYzogTGludXgtTUlQUyAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmxpbnV4LW1pcHNAbGludXgtbWlwcy5vcmciPmxpbnV4LW1pcHNAbGludXgtbWlwcy5vcmc8L2E+
Jmd0Ozxicj4NCkNjOiBNYXR0aGV3IEZvcnR1bmUgJmx0OzxhIGhyZWY9Im1haWx0bzpNYXR0aGV3
LkZvcnR1bmVAaW1ndGVjLmNvbSI+TWF0dGhldy5Gb3J0dW5lQGltZ3RlYy5jb208L2E+Jmd0Ozxi
cj4NCkNjOiBNYXJrb3MgQ2hhbmRyYXMgJmx0OzxhIGhyZWY9Im1haWx0bzpNYXJrb3MuQ2hhbmRy
YXNAaW1ndGVjLmNvbSI+TWFya29zLkNoYW5kcmFzQGltZ3RlYy5jb208L2E+Jmd0Ozxicj4NCkNj
OiBNYWNpZWogVy4gUm96eWNraSAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1hY3JvQGxpbnV4LW1pcHMu
b3JnIj5tYWNyb0BsaW51eC1taXBzLm9yZzwvYT4mZ3Q7PGJyPg0KUGF0Y2h3b3JrOiA8YSBocmVm
PSJodHRwczovL3BhdGNod29yay5saW51eC1taXBzLm9yZy9wYXRjaC84MzU1LyIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9wYXRjaHdvcmsubGludXgtbWlwcy5vcmcv
cGF0Y2gvODM1NS88L2E+PGJyPg0KU2lnbmVkLW9mZi1ieTogUmFsZiBCYWVjaGxlICZsdDs8YSBo
cmVmPSJtYWlsdG86cmFsZkBsaW51eC1taXBzLm9yZyI+cmFsZkBsaW51eC1taXBzLm9yZzwvYT4m
Z3Q7PGJyPg0KW3lzaGk6IEJhY2twb3J0ZWQgdG8gWW9jdG8gMy4xNCBrZXJuZWxdPGJyPg0KU2ln
bmVkLW9mZi1ieTogWWFuZyBTaGkgJmx0OzxhIGhyZWY9Im1haWx0bzp5YW5nLnNoaUB3aW5kcml2
ZXIuY29tIj55YW5nLnNoaUB3aW5kcml2ZXIuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQrCoGFy
Y2gvbWlwcy9NYWtlZmlsZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCA5ICsrKysrKysr
Kzxicj4NCsKgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2FzbW1hY3JvLTMyLmggfMKgIDYgKysrKysr
PGJyPg0KwqBhcmNoL21pcHMvaW5jbHVkZS9hc20vYXNtbWFjcm8uaMKgIMKgIHzCoCA3ICsrKysr
Kys8YnI+DQrCoGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9mcHJlZ2RlZi5owqAgwqAgfCAxNCArKysr
KysrKysrKysrKzxicj4NCsKgYXJjaC9taXBzL2luY2x1ZGUvYXNtL21pcHNyZWdzLmjCoCDCoCB8
IDExICsrKysrKysrKystPGJyPg0KwqBhcmNoL21pcHMva2VybmVsL2JyYW5jaC5jwqAgwqAgwqAg
wqAgwqAgwqB8wqAgNiArLS0tLS08YnI+DQrCoGFyY2gvbWlwcy9rZXJuZWwvZ2VuZXguU8KgIMKg
IMKgIMKgIMKgIMKgIHzCoCAxICs8YnI+DQrCoGFyY2gvbWlwcy9rZXJuZWwvcjIzMDBfZnB1LlPC
oCDCoCDCoCDCoCB8wqAgNiArKysrKys8YnI+DQrCoGFyY2gvbWlwcy9rZXJuZWwvcjIzMDBfc3dp
dGNoLlPCoCDCoCDCoHzCoCA1ICsrKysrPGJyPg0KwqBhcmNoL21pcHMva2VybmVsL3I0a19mcHUu
U8KgIMKgIMKgIMKgIMKgIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKy0tPGJyPg0KwqBh
cmNoL21pcHMva2VybmVsL3I0a19zd2l0Y2guU8KgIMKgIMKgIMKgfCAxMSArKysrKysrKysrLTxi
cj4NCsKgYXJjaC9taXBzL2tlcm5lbC9yNjAwMF9mcHUuU8KgIMKgIMKgIMKgIHzCoCA1ICsrKysr
PGJyPg0KwqBhcmNoL21pcHMvbWF0aC1lbXUvY3AxZW11LmPCoCDCoCDCoCDCoCDCoHzCoCA2ICst
LS0tLTxicj4NCsKgMTMgZmlsZXMgY2hhbmdlZCwgMTAwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvTWFrZWZpbGUgYi9hcmNo
L21pcHMvTWFrZWZpbGU8YnI+DQppbmRleCA2OWJkNmY3Li5jMWE3ZjgzIDEwMDY0NDxicj4NCi0t
LSBhL2FyY2gvbWlwcy9NYWtlZmlsZTxicj4NCisrKyBiL2FyY2gvbWlwcy9NYWtlZmlsZTxicj4N
CkBAIC05Niw2ICs5NiwxNSBAQCBLQlVJTERfQUZMQUdTX01PRFVMRcKgIMKgIMKgIMKgIMKgKz0g
LW1sb25nLWNhbGxzPGJyPg0KwqBLQlVJTERfQ0ZMQUdTX01PRFVMRcKgIMKgIMKgIMKgIMKgIMKg
Kz0gLW1sb25nLWNhbGxzPGJyPg0KwqBlbmRpZjxicj4NCjxicj4NCisjPGJyPg0KKyMgcGFzcyAt
bXNvZnQtZmxvYXQgdG8gR0FTIGlmIGl0IHN1cHBvcnRzIGl0LsKgIEhvd2V2ZXIgb24gbmV3ZXIg
YmludXRpbHM8YnI+DQorIyAoc3BlY2lmaWNhbGx5IG5ld2VyIHRoYW4gMi4yNC41MS4yMDE0MDcy
OCkgd2UgdGhlbiBhbHNvIG5lZWQgdG8gZXhwbGljaXRseTxicj4NCisjIHNldCAmcXVvdDsuc2V0
IGhhcmRmbG9hdCZxdW90OyBpbiBhbGwgZmlsZXMgd2hpY2ggbWFuaXB1bGF0ZSBmbG9hdGluZyBw
b2ludCByZWdpc3RlcnMuPGJyPg0KKyM8YnI+DQoraWZuZXEgKCQoY2FsbCBhcy1vcHRpb24sLVdh
JChjb21tYSktbXNvZnQtZmxvYXQsKSwpPGJyPg0KK8KgIMKgIMKgIMKgY2ZsYWdzLXnCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCArPSAtREdBU19IQVNfU0VUX0hBUkRGTE9BVCAtV2EsLW1zb2Z0LWZs
b2F0PGJyPg0KK2VuZGlmPGJyPg0KKzxicj4NCsKgY2ZsYWdzLXkgKz0gLWZmcmVlc3RhbmRpbmc8
YnI+DQo8YnI+DQrCoCM8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2Fz
bW1hY3JvLTMyLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vYXNtbWFjcm8tMzIuaDxicj4NCmlu
ZGV4IDcwZTFmMTcuLjgwMzg2NDcgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUv
YXNtL2FzbW1hY3JvLTMyLmg8YnI+DQorKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vYXNtbWFj
cm8tMzIuaDxicj4NCkBAIC0xMyw2ICsxMyw4IEBAPGJyPg0KwqAjaW5jbHVkZSAmbHQ7YXNtL21p
cHNyZWdzLmgmZ3Q7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLm1hY3JvwqAgZnB1X3NhdmVfc2lu
Z2xlIHRocmVhZCB0bXA9dDA8YnI+DQorwqAgwqAgwqAgwqAuc2V0IHB1c2g8YnI+DQorwqAgwqAg
wqAgwqBTRVRfSEFSREZMT0FUPGJyPg0KwqAgwqAgwqAgwqAgY2ZjMcKgIMKgIFx0bXAswqAgZmNy
MzE8YnI+DQrCoCDCoCDCoCDCoCBzd2MxwqAgwqAgJGYwLMKgIFRIUkVBRF9GUFIwKFx0aHJlYWQp
PGJyPg0KwqAgwqAgwqAgwqAgc3djMcKgIMKgICRmMSzCoCBUSFJFQURfRlBSMShcdGhyZWFkKTxi
cj4NCkBAIC00Nyw5ICs0OSwxMiBAQDxicj4NCsKgIMKgIMKgIMKgIHN3YzHCoCDCoCAkZjMwLCBU
SFJFQURfRlBSMzAoXHRocmVhZCk8YnI+DQrCoCDCoCDCoCDCoCBzd2MxwqAgwqAgJGYzMSwgVEhS
RUFEX0ZQUjMxKFx0aHJlYWQpPGJyPg0KwqAgwqAgwqAgwqAgc3fCoCDCoCDCoCBcdG1wLCBUSFJF
QURfRkNSMzEoXHRocmVhZCk8YnI+DQorwqAgwqAgwqAgwqAuc2V0IHBvcDxicj4NCsKgIMKgIMKg
IMKgIC5lbmRtPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLm1hY3JvwqAgZnB1X3Jlc3RvcmVfc2lu
Z2xlIHRocmVhZCB0bXA9dDA8YnI+DQorwqAgwqAgwqAgwqAuc2V0IHB1c2g8YnI+DQorwqAgwqAg
wqAgwqBTRVRfSEFSREZMT0FUPGJyPg0KwqAgwqAgwqAgwqAgbHfCoCDCoCDCoCBcdG1wLCBUSFJF
QURfRkNSMzEoXHRocmVhZCk8YnI+DQrCoCDCoCDCoCDCoCBsd2MxwqAgwqAgJGYwLMKgIFRIUkVB
RF9GUFIwKFx0aHJlYWQpPGJyPg0KwqAgwqAgwqAgwqAgbHdjMcKgIMKgICRmMSzCoCBUSFJFQURf
RlBSMShcdGhyZWFkKTxicj4NCkBAIC04NCw2ICs4OSw3IEBAPGJyPg0KwqAgwqAgwqAgwqAgbHdj
McKgIMKgICRmMzAsIFRIUkVBRF9GUFIzMChcdGhyZWFkKTxicj4NCsKgIMKgIMKgIMKgIGx3YzHC
oCDCoCAkZjMxLCBUSFJFQURfRlBSMzEoXHRocmVhZCk8YnI+DQrCoCDCoCDCoCDCoCBjdGMxwqAg
wqAgXHRtcCwgZmNyMzE8YnI+DQorwqAgwqAgwqAgwqAuc2V0IHBvcDxicj4NCsKgIMKgIMKgIMKg
IC5lbmRtPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLm1hY3JvwqAgY3B1X3NhdmVfbm9uc2NyYXRj
aCB0aHJlYWQ8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2FzbW1hY3Jv
LmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vYXNtbWFjcm8uaDxicj4NCmluZGV4IDQyMjVlOTku
LmQ2ZDViMTkgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2FzbW1hY3Jv
Lmg8YnI+DQorKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vYXNtbWFjcm8uaDxicj4NCkBAIC03
NCw2ICs3NCw4IEBAPGJyPg0KwqAjZW5kaWYgLyogQ09ORklHX01JUFNfTVRfU01UQyAqLzxicj4N
Cjxicj4NCsKgIMKgIMKgIMKgIC5tYWNyb8KgIGZwdV9zYXZlXzE2ZXZlbiB0aHJlYWQgdG1wPXQw
PGJyPg0KK8KgIMKgIMKgIMKgLnNldMKgIMKgIHB1c2g8YnI+DQorwqAgwqAgwqAgwqBTRVRfSEFS
REZMT0FUPGJyPg0KwqAgwqAgwqAgwqAgY2ZjMcKgIMKgIFx0bXAsIGZjcjMxPGJyPg0KwqAgwqAg
wqAgwqAgc2RjMcKgIMKgICRmMCzCoCBUSFJFQURfRlBSMChcdGhyZWFkKTxicj4NCsKgIMKgIMKg
IMKgIHNkYzHCoCDCoCAkZjIswqAgVEhSRUFEX0ZQUjIoXHRocmVhZCk8YnI+DQpAQCAtOTIsMTEg
Kzk0LDEzIEBAPGJyPg0KwqAgwqAgwqAgwqAgc2RjMcKgIMKgICRmMjgsIFRIUkVBRF9GUFIyOChc
dGhyZWFkKTxicj4NCsKgIMKgIMKgIMKgIHNkYzHCoCDCoCAkZjMwLCBUSFJFQURfRlBSMzAoXHRo
cmVhZCk8YnI+DQrCoCDCoCDCoCDCoCBzd8KgIMKgIMKgIFx0bXAsIFRIUkVBRF9GQ1IzMShcdGhy
ZWFkKTxicj4NCivCoCDCoCDCoCDCoC5zZXTCoCDCoCBwb3A8YnI+DQrCoCDCoCDCoCDCoCAuZW5k
bTxicj4NCjxicj4NCsKgIMKgIMKgIMKgIC5tYWNyb8KgIGZwdV9zYXZlXzE2b2RkIHRocmVhZDxi
cj4NCsKgIMKgIMKgIMKgIC5zZXTCoCDCoCBwdXNoPGJyPg0KwqAgwqAgwqAgwqAgLnNldMKgIMKg
IG1pcHM2NHIyPGJyPg0KK8KgIMKgIMKgIMKgU0VUX0hBUkRGTE9BVDxicj4NCsKgIMKgIMKgIMKg
IHNkYzHCoCDCoCAkZjEswqAgVEhSRUFEX0ZQUjEoXHRocmVhZCk8YnI+DQrCoCDCoCDCoCDCoCBz
ZGMxwqAgwqAgJGYzLMKgIFRIUkVBRF9GUFIzKFx0aHJlYWQpPGJyPg0KwqAgwqAgwqAgwqAgc2Rj
McKgIMKgICRmNSzCoCBUSFJFQURfRlBSNShcdGhyZWFkKTxicj4NCkBAIC0xMjcsNiArMTMxLDgg
QEA8YnI+DQrCoCDCoCDCoCDCoCAuZW5kbTxicj4NCjxicj4NCsKgIMKgIMKgIMKgIC5tYWNyb8Kg
IGZwdV9yZXN0b3JlXzE2ZXZlbiB0aHJlYWQgdG1wPXQwPGJyPg0KK8KgIMKgIMKgIMKgLnNldMKg
IMKgIHB1c2g8YnI+DQorwqAgwqAgwqAgwqBTRVRfSEFSREZMT0FUPGJyPg0KwqAgwqAgwqAgwqAg
bHfCoCDCoCDCoCBcdG1wLCBUSFJFQURfRkNSMzEoXHRocmVhZCk8YnI+DQrCoCDCoCDCoCDCoCBs
ZGMxwqAgwqAgJGYwLMKgIFRIUkVBRF9GUFIwKFx0aHJlYWQpPGJyPg0KwqAgwqAgwqAgwqAgbGRj
McKgIMKgICRmMizCoCBUSFJFQURfRlBSMihcdGhyZWFkKTxicj4NCkBAIC0xNTAsNiArMTU2LDcg
QEA8YnI+DQrCoCDCoCDCoCDCoCAubWFjcm/CoCBmcHVfcmVzdG9yZV8xNm9kZCB0aHJlYWQ8YnI+
DQrCoCDCoCDCoCDCoCAuc2V0wqAgwqAgcHVzaDxicj4NCsKgIMKgIMKgIMKgIC5zZXTCoCDCoCBt
aXBzNjRyMjxicj4NCivCoCDCoCDCoCDCoFNFVF9IQVJERkxPQVQ8YnI+DQrCoCDCoCDCoCDCoCBs
ZGMxwqAgwqAgJGYxLMKgIFRIUkVBRF9GUFIxKFx0aHJlYWQpPGJyPg0KwqAgwqAgwqAgwqAgbGRj
McKgIMKgICRmMyzCoCBUSFJFQURfRlBSMyhcdGhyZWFkKTxicj4NCsKgIMKgIMKgIMKgIGxkYzHC
oCDCoCAkZjUswqAgVEhSRUFEX0ZQUjUoXHRocmVhZCk8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9t
aXBzL2luY2x1ZGUvYXNtL2ZwcmVnZGVmLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vZnByZWdk
ZWYuaDxicj4NCmluZGV4IDQyOTQ4MWYuLmYxODRiYTAgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9t
aXBzL2luY2x1ZGUvYXNtL2ZwcmVnZGVmLmg8YnI+DQorKysgYi9hcmNoL21pcHMvaW5jbHVkZS9h
c20vZnByZWdkZWYuaDxicj4NCkBAIC0xNCw2ICsxNCwyMCBAQDxicj4NCjxicj4NCsKgI2luY2x1
ZGUgJmx0O2FzbS9zZ2lkZWZzLmgmZ3Q7PGJyPg0KPGJyPg0KKy8qPGJyPg0KKyAqIHN0YXJ0aW5n
IHdpdGggYmludXRpbHMgMi4yNC41MS4yMDE0MDcyOSwgTUlQUyBiaW51dGlscyB3YXJuIGFib3V0
IG1peGluZzxicj4NCisgKiBoYXJkZmxvYXQgYW5kIHNvZnRmbG9hdCBvYmplY3QgZmlsZXMuwqAg
VGhlIGtlcm5lbCBidWlsZCB1c2VzIHNvZnQtZmxvYXQgYnk8YnI+DQorICogZGVmYXVsdCwgc28g
d2UgYWxzbyBuZWVkIHRvIHBhc3MgLW1zb2Z0LWZsb2F0IGFsb25nIHRvIEdBUyBpZiBpdCBzdXBw
b3J0cyBpdC48YnI+DQorICogQnV0IHRoaXMgaW4gdHVybiBjYXVzZXMgYXNzZW1ibGVyIGVycm9y
cyBpbiBmaWxlcyB3aGljaCBhY2Nlc3MgaGFyZGZsb2F0PGJyPg0KKyAqIHJlZ2lzdGVycy7CoCBX
ZSBkZXRlY3QgaWYgR0FTIHN1cHBvcnRzICZxdW90Oy1tc29mdC1mbG9hdCZxdW90OyBpbiB0aGUg
TWFrZWZpbGUgYW5kPGJyPg0KKyAqIGV4cGxpY2l0bHkgcHV0ICZxdW90Oy5zZXQgaGFyZGZsb2F0
JnF1b3Q7IHdoZXJlIGZsb2F0aW5nIHBvaW50IHJlZ2lzdGVycyBhcmUgdG91Y2hlZC48YnI+DQor
ICovPGJyPg0KKyNpZmRlZiBHQVNfSEFTX1NFVF9IQVJERkxPQVQ8YnI+DQorI2RlZmluZSBTRVRf
SEFSREZMT0FUIC5zZXQgaGFyZGZsb2F0PGJyPg0KKyNlbHNlPGJyPg0KKyNkZWZpbmUgU0VUX0hB
UkRGTE9BVDxicj4NCisjZW5kaWY8YnI+DQorPGJyPg0KwqAjaWYgX01JUFNfU0lNID09IF9NSVBT
X1NJTV9BQkkzMjxicj4NCjxicj4NCsKgLyo8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2lu
Y2x1ZGUvYXNtL21pcHNyZWdzLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vbWlwc3JlZ3MuaDxi
cj4NCmluZGV4IGQ2YThjZWQuLjY3YTIwOWYgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9taXBzL2lu
Y2x1ZGUvYXNtL21pcHNyZWdzLmg8YnI+DQorKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vbWlw
c3JlZ3MuaDxicj4NCkBAIC0xNTE4LDcgKzE1MTgsNyBAQCBkbyB7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCsKgLyo8YnI+DQrCoCAqIE1hY3Jv
cyB0byBhY2Nlc3MgdGhlIGZsb2F0aW5nIHBvaW50IGNvcHJvY2Vzc29yIGNvbnRyb2wgcmVnaXN0
ZXJzPGJyPg0KwqAgKi88YnI+DQotI2RlZmluZSByZWFkXzMyYml0X2NwMV9yZWdpc3Rlcihzb3Vy
Y2UpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgXDxicj4NCisjZGVmaW5lIF9yZWFkXzMyYml0X2NwMV9yZWdpc3Rlcihzb3VyY2UsIGdh
c19oYXJkZmxvYXQpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCsKg
KHvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQrC
oCDCoCDCoCDCoCBpbnQgX19yZXM7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQpAQCAt
MTUyOCwxMiArMTUyOCwyMSBAQCBkbyB7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgXDxicj4NCsKgIMKgIMKgIMKgICZxdW90O8KgIMKgIMKgIMKgIyBnYXMgZmFp
bHMgdG8gYXNzZW1ibGUgY2ZjMSBmb3Igc29tZSBhcmNocyzCoCDCoCBcbiZxdW90O8KgIMKgIMKg
XDxicj4NCsKgIMKgIMKgIMKgICZxdW90O8KgIMKgIMKgIMKgIyBsaWtlIE9jdGVvbi7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcbiZxdW90O8KgIMKg
IMKgXDxicj4NCsKgIMKgIMKgIMKgICZxdW90O8KgIMKgIMKgIMKgLnNldMKgIMKgIG1pcHMxwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcbiZxdW90
O8KgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCZxdW90O8KgIMKgIMKgIMKgJnF1b3Q7U1RSKGdh
c19oYXJkZmxvYXQpJnF1b3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgXG4mcXVvdDvCoCDCoCDCoFw8YnI+DQrCoCDCoCDCoCDCoCAmcXVvdDvCoCDCoCDCoCDCoGNm
YzHCoCDCoCAlMCwmcXVvdDtTVFIoc291cmNlKSZxdW90O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIFxuJnF1b3Q7wqAgwqAgwqBcPGJyPg0KwqAgwqAgwqAgwqAgJnF1b3Q7wqAg
wqAgwqAgwqAuc2V0wqAgwqAgcG9wwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBcbiZxdW90O8KgIMKgIMKgXDxicj4NCsKgIMKgIMKgIMKgIDog
JnF1b3Q7PXImcXVvdDsgKF9fcmVzKSk7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCsKgIMKgIMKgIMKg
IF9fcmVzO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQrCoH0pPGJyPg0KPGJy
Pg0KKyNpZmRlZiBHQVNfSEFTX1NFVF9IQVJERkxPQVQ8YnI+DQorI2RlZmluZSByZWFkXzMyYml0
X2NwMV9yZWdpc3Rlcihzb3VyY2UpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoF9yZWFkXzMyYml0X2Nw
MV9yZWdpc3Rlcihzb3VyY2UsIC5zZXQgaGFyZGZsb2F0KTxicj4NCisjZWxzZTxicj4NCisjZGVm
aW5lIHJlYWRfMzJiaXRfY3AxX3JlZ2lzdGVyKHNvdXJjZSnCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKg
X3JlYWRfMzJiaXRfY3AxX3JlZ2lzdGVyKHNvdXJjZSwgKTxicj4NCisjZW5kaWY8YnI+DQorPGJy
Pg0KwqAjaWZkZWYgSEFWRV9BU19EU1A8YnI+DQrCoCNkZWZpbmUgcmRkc3AobWFzaynCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBcPGJyPg0KwqAoe8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgXDxicj4NCmRpZmYgLS1naXQgYS9hcmNoL21pcHMva2VybmVsL2JyYW5j
aC5jIGIvYXJjaC9taXBzL2tlcm5lbC9icmFuY2guYzxicj4NCmluZGV4IGVjYmE3ZWIuLmQxNDM4
M2QgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9taXBzL2tlcm5lbC9icmFuY2guYzxicj4NCisrKyBi
L2FyY2gvbWlwcy9rZXJuZWwvYnJhbmNoLmM8YnI+DQpAQCAtNDM4LDExICs0MzgsNyBAQCBzdGF0
aWMgdW5zaWduZWQgaW50IF9fZ2V0X2ZjcjMxKHZvaWQpPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAg
cHJlZW1wdF9kaXNhYmxlKCk7PGJyPg0KwqAgwqAgwqAgwqAgaWYgKGlzX2ZwdV9vd25lcigpKTxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFzbSB2b2xhdGlsZSg8YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDsuc2V0IHB1c2hcbiZxdW90Ozxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O1x0LnNldCBtaXBzMVxuJnF1
b3Q7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7XHRjZmMx
XHQlMCwkMzFcbiZxdW90Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZxdW90O1x0LnNldCBwb3AmcXVvdDsgOiAmcXVvdDs9ciZxdW90OyAoZmNyMzEpKTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmY3IzMSA9IHJlYWRfMzJiaXRfY3AxX3JlZ2lzdGVyKENQ
MV9TVEFUVVMpOzxicj4NCsKgIMKgIMKgIMKgIGVsc2U8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBmY3IzMSA9IGN1cnJlbnQtJmd0O3RocmVhZC5mcHUuZmNyMzE7PGJyPg0KwqAgwqAgwqAg
wqAgcHJlZW1wdF9lbmFibGUoKTs8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2tlcm5lbC9n
ZW5leC5TIGIvYXJjaC9taXBzL2tlcm5lbC9nZW5leC5TPGJyPg0KaW5kZXggZWI1OWZlZC4uN2I3
NjExYSAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL21pcHMva2VybmVsL2dlbmV4LlM8YnI+DQorKysg
Yi9hcmNoL21pcHMva2VybmVsL2dlbmV4LlM8YnI+DQpAQCAtNDMyLDYgKzQzMiw3IEBAIE5FU1RF
RChubWlfaGFuZGxlciwgUFRfU0laRSwgc3ApPGJyPg0KwqAgwqAgwqAgwqAgLnNldMKgIMKgIHB1
c2g8YnI+DQrCoCDCoCDCoCDCoCAvKiBnYXMgZmFpbHMgdG8gYXNzZW1ibGUgY2ZjMSBmb3Igc29t
ZSBhcmNocyAob2N0ZW9uKS4qLyBcPGJyPg0KwqAgwqAgwqAgwqAgLnNldMKgIMKgIG1pcHMxPGJy
Pg0KK8KgIMKgIMKgIMKgU0VUX0hBUkRGTE9BVDxicj4NCsKgIMKgIMKgIMKgIGNmYzHCoCDCoCBh
MSwgZmNyMzE8YnI+DQrCoCDCoCDCoCDCoCBsacKgIMKgIMKgIGEyLCB+KDB4M2YgJmx0OyZsdDsg
MTIpPGJyPg0KwqAgwqAgwqAgwqAgYW5kwqAgwqAgwqBhMiwgYTE8YnI+DQpkaWZmIC0tZ2l0IGEv
YXJjaC9taXBzL2tlcm5lbC9yMjMwMF9mcHUuUyBiL2FyY2gvbWlwcy9rZXJuZWwvcjIzMDBfZnB1
LlM8YnI+DQppbmRleCBmMzEwNjNkLi41Y2UzYjc0IDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvbWlw
cy9rZXJuZWwvcjIzMDBfZnB1LlM8YnI+DQorKysgYi9hcmNoL21pcHMva2VybmVsL3IyMzAwX2Zw
dS5TPGJyPg0KQEAgLTI4LDYgKzI4LDggQEA8YnI+DQrCoCDCoCDCoCDCoCAuc2V0wqAgwqAgbWlw
czE8YnI+DQrCoCDCoCDCoCDCoCAvKiBTYXZlIGZsb2F0aW5nIHBvaW50IGNvbnRleHQgKi88YnI+
DQrCoExFQUYoX3NhdmVfZnBfY29udGV4dCk8YnI+DQorwqAgwqAgwqAgwqAuc2V0wqAgwqAgcHVz
aDxicj4NCivCoCDCoCDCoCDCoFNFVF9IQVJERkxPQVQ8YnI+DQrCoCDCoCDCoCDCoCBsacKgIMKg
IMKgIHYwLCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjIGFzc3VtZSBzdWNjZXNzPGJyPg0KwqAgwqAgwqAgwqAgY2ZjMcKgIMKgIHQxLGZjcjMx
PGJyPg0KwqAgwqAgwqAgwqAgRVgoc3djMSAkZjAsKFNDX0ZQUkVHUyswKShhMCkpPGJyPg0KQEAg
LTY1LDYgKzY3LDcgQEAgTEVBRihfc2F2ZV9mcF9jb250ZXh0KTxicj4NCsKgIMKgIMKgIMKgIEVY
KHN3wqAgwqB0MSwoU0NfRlBDX0NTUikoYTApKTxicj4NCsKgIMKgIMKgIMKgIGNmYzHCoCDCoCB0
MCwkMMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIyBpbXBsZW1lbnRh
dGlvbi92ZXJzaW9uPGJyPg0KwqAgwqAgwqAgwqAganLCoCDCoCDCoCByYTxicj4NCivCoCDCoCDC
oCDCoC5zZXTCoCDCoCBwb3A8YnI+DQrCoCDCoCDCoCDCoCAuc2V0wqAgwqAgbm9tYWNybzxicj4N
CsKgIMKgIMKgIMKgIMKgRVgoc3fCoCB0MCwoU0NfRlBDX0VJUikoYTApKTxicj4NCsKgIMKgIMKg
IMKgIC5zZXTCoCDCoCBtYWNybzxicj4NCkBAIC04MCw2ICs4Myw4IEBAIExFQUYoX3NhdmVfZnBf
Y29udGV4dCk8YnI+DQrCoCAqIHN0YWNrIGZyYW1lIHdoaWNoIG1pZ2h0IGhhdmUgYmVlbiBjaGFu
Z2VkIGJ5IHRoZSB1c2VyLjxicj4NCsKgICovPGJyPg0KwqBMRUFGKF9yZXN0b3JlX2ZwX2NvbnRl
eHQpPGJyPg0KK8KgIMKgIMKgIMKgLnNldMKgIMKgIHB1c2g8YnI+DQorwqAgwqAgwqAgwqBTRVRf
SEFSREZMT0FUPGJyPg0KwqAgwqAgwqAgwqAgbGnCoCDCoCDCoCB2MCwgMMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIyBhc3N1bWUgc3VjY2Vzczxi
cj4NCsKgIMKgIMKgIMKgIEVYKGx3IHQwLChTQ19GUENfQ1NSKShhMCkpPGJyPg0KwqAgwqAgwqAg
wqAgRVgobHdjMSAkZjAsKFNDX0ZQUkVHUyswKShhMCkpPGJyPg0KQEAgLTExNiw2ICsxMjEsNyBA
QCBMRUFGKF9yZXN0b3JlX2ZwX2NvbnRleHQpPGJyPg0KwqAgwqAgwqAgwqAgRVgobHdjMSAkZjMx
LChTQ19GUFJFR1MrMjQ4KShhMCkpPGJyPg0KwqAgwqAgwqAgwqAganLCoCDCoCDCoCByYTxicj4N
CsKgIMKgIMKgIMKgIMKgY3RjMcKgIMKgdDAsZmNyMzE8YnI+DQorwqAgwqAgwqAgwqAuc2V0wqAg
wqAgcG9wPGJyPg0KwqAgwqAgwqAgwqAgRU5EKF9yZXN0b3JlX2ZwX2NvbnRleHQpPGJyPg0KwqAg
wqAgwqAgwqAgLnNldMKgIMKgIHJlb3JkZXI8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9t
aXBzL2tlcm5lbC9yMjMwMF9zd2l0Y2guUyBiL2FyY2gvbWlwcy9rZXJuZWwvcjIzMDBfc3dpdGNo
LlM8YnI+DQppbmRleCAyMGI3YjA0Li40MzVlYTY1IDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvbWlw
cy9rZXJuZWwvcjIzMDBfc3dpdGNoLlM8YnI+DQorKysgYi9hcmNoL21pcHMva2VybmVsL3IyMzAw
X3N3aXRjaC5TPGJyPg0KQEAgLTEyMCw2ICsxMjAsOSBAQCBMRUFGKF9yZXN0b3JlX2ZwKTxicj4N
Cjxicj4NCsKgI2RlZmluZSBGUFVfREVGQVVMVMKgIDB4MDAwMDAwMDA8YnI+DQo8YnI+DQorwqAg
wqAgwqAgwqAuc2V0IHB1c2g8YnI+DQorwqAgwqAgwqAgwqBTRVRfSEFSREZMT0FUPGJyPg0KKzxi
cj4NCsKgTEVBRihfaW5pdF9mcHUpPGJyPg0KwqAgwqAgwqAgwqAgbWZjMMKgIMKgIHQwLCBDUDBf
U1RBVFVTPGJyPg0KwqAgwqAgwqAgwqAgbGnCoCDCoCDCoCB0MSwgU1QwX0NVMTxicj4NCkBAIC0x
NjUsMyArMTY4LDUgQEAgTEVBRihfaW5pdF9mcHUpPGJyPg0KwqAgwqAgwqAgwqAgbXRjMcKgIMKg
IHQwLCAkZjMxPGJyPg0KwqAgwqAgwqAgwqAganLCoCDCoCDCoCByYTxicj4NCsKgIMKgIMKgIMKg
IEVORChfaW5pdF9mcHUpPGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC5zZXQgcG9wPGJyPg0KZGlm
ZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwvcjRrX2ZwdS5TIGIvYXJjaC9taXBzL2tlcm5lbC9y
NGtfZnB1LlM8YnI+DQppbmRleCA3M2IwZGRmLi4wNmY4YjJhIDEwMDY0NDxicj4NCi0tLSBhL2Fy
Y2gvbWlwcy9rZXJuZWwvcjRrX2ZwdS5TPGJyPg0KKysrIGIvYXJjaC9taXBzL2tlcm5lbC9yNGtf
ZnB1LlM8YnI+DQpAQCAtMTksOCArMTksMTIgQEA8YnI+DQrCoCNpbmNsdWRlICZsdDthc20vYXNt
LW9mZnNldHMuaCZndDs8YnI+DQrCoCNpbmNsdWRlICZsdDthc20vcmVnZGVmLmgmZ3Q7PGJyPg0K
PGJyPg0KKy8qIHByZXByb2Nlc3NvciByZXBsYWNlcyB0aGUgZnAgaW4gJnF1b3Q7LnNldCBmcD02
NCZxdW90OyB3aXRoICQzMCBvdGhlcndpc2UgKi88YnI+DQorI3VuZGVmIGZwPGJyPg0KKzxicj4N
CsKgIMKgIMKgIMKgIC5tYWNyb8KgIEVYIGluc24sIHJlZywgc3JjPGJyPg0KwqAgwqAgwqAgwqAg
LnNldMKgIMKgIHB1c2g8YnI+DQorwqAgwqAgwqAgwqBTRVRfSEFSREZMT0FUPGJyPg0KwqAgwqAg
wqAgwqAgLnNldMKgIMKgIG5vbWFjcm88YnI+DQrCoC5leFxAOiBcaW5zbsKgIMKgXHJlZywgXHNy
Yzxicj4NCsKgIMKgIMKgIMKgIC5zZXTCoCDCoCBwb3A8YnI+DQpAQCAtMzMsMTIgKzM3LDE3IEBA
PGJyPg0KwqAgwqAgwqAgwqAgLnNldMKgIMKgIG1pcHMzPGJyPg0KPGJyPg0KwqBMRUFGKF9zYXZl
X2ZwX2NvbnRleHQpPGJyPg0KK8KgIMKgIMKgIMKgLnNldMKgIMKgIHB1c2g8YnI+DQorwqAgwqAg
wqAgwqBTRVRfSEFSREZMT0FUPGJyPg0KwqAgwqAgwqAgwqAgY2ZjMcKgIMKgIHQxLCBmY3IzMTxi
cj4NCivCoCDCoCDCoCDCoC5zZXTCoCDCoCBwb3A8YnI+DQo8YnI+DQrCoCNpZiBkZWZpbmVkKENP
TkZJR182NEJJVCkgfHwgZGVmaW5lZChDT05GSUdfQ1BVX01JUFMzMl9SMik8YnI+DQrCoCDCoCDC
oCDCoCAuc2V0wqAgwqAgcHVzaDxicj4NCivCoCDCoCDCoCDCoFNFVF9IQVJERkxPQVQ8YnI+DQrC
oCNpZmRlZiBDT05GSUdfQ1BVX01JUFMzMl9SMjxicj4NCi3CoCDCoCDCoCDCoC5zZXTCoCDCoCBt
aXBzNjRyMjxicj4NCivCoCDCoCDCoCDCoC5zZXTCoCDCoCBtaXBzMzJyMjxicj4NCivCoCDCoCDC
oCDCoC5zZXTCoCDCoCBmcD02NDxicj4NCsKgIMKgIMKgIMKgIG1mYzDCoCDCoCB0MCwgQ1AwX1NU
QVRVUzxicj4NCsKgIMKgIMKgIMKgIHNsbMKgIMKgIMKgdDAsIHQwLCA1PGJyPg0KwqAgwqAgwqAg
wqAgYmdlesKgIMKgIHQwLCAxZsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICMgc2tpcCBzdG9y
aW5nIG9kZCBpZiBGUj0wPGJyPg0KQEAgLTY0LDYgKzczLDggQEAgTEVBRihfc2F2ZV9mcF9jb250
ZXh0KTxicj4NCsKgMTrCoCDCoCDCoC5zZXTCoCDCoCBwb3A8YnI+DQrCoCNlbmRpZjxicj4NCjxi
cj4NCivCoCDCoCDCoCDCoC5zZXQgcHVzaDxicj4NCivCoCDCoCDCoCDCoFNFVF9IQVJERkxPQVQ8
YnI+DQrCoCDCoCDCoCDCoCAvKiBTdG9yZSB0aGUgMTYgZXZlbiBkb3VibGUgcHJlY2lzaW9uIHJl
Z2lzdGVycyAqLzxicj4NCsKgIMKgIMKgIMKgIEVYwqAgwqAgwqAgc2RjMSAkZjAsIFNDX0ZQUkVH
UyswKGEwKTxicj4NCsKgIMKgIMKgIMKgIEVYwqAgwqAgwqAgc2RjMSAkZjIsIFNDX0ZQUkVHUysx
NihhMCk8YnI+DQpAQCAtODQsMTEgKzk1LDE0IEBAIExFQUYoX3NhdmVfZnBfY29udGV4dCk8YnI+
DQrCoCDCoCDCoCDCoCBFWMKgIMKgIMKgIHN3IHQxLCBTQ19GUENfQ1NSKGEwKTxicj4NCsKgIMKg
IMKgIMKgIGpywqAgwqAgwqAgcmE8YnI+DQrCoCDCoCDCoCDCoCDCoGxpwqAgwqAgwqB2MCwgMMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIyBzdWNj
ZXNzPGJyPg0KK8KgIMKgIMKgIMKgLnNldCBwb3A8YnI+DQrCoCDCoCDCoCDCoCBFTkQoX3NhdmVf
ZnBfY29udGV4dCk8YnI+DQo8YnI+DQrCoCNpZmRlZiBDT05GSUdfTUlQUzMyX0NPTVBBVDxicj4N
CsKgIMKgIMKgIMKgIC8qIFNhdmUgMzItYml0IHByb2Nlc3MgZmxvYXRpbmcgcG9pbnQgY29udGV4
dCAqLzxicj4NCsKgTEVBRihfc2F2ZV9mcF9jb250ZXh0MzIpPGJyPg0KK8KgIMKgIMKgIMKgLnNl
dCBwdXNoPGJyPg0KK8KgIMKgIMKgIMKgU0VUX0hBUkRGTE9BVDxicj4NCsKgIMKgIMKgIMKgIGNm
YzHCoCDCoCB0MSwgZmNyMzE8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBtZmMwwqAgwqAgdDAsIENQ
MF9TVEFUVVM8YnI+DQpAQCAtMTM0LDYgKzE0OCw3IEBAIExFQUYoX3NhdmVfZnBfY29udGV4dDMy
KTxicj4NCsKgIMKgIMKgIMKgIEVYwqAgwqAgwqAgc3cgdDEsIFNDMzJfRlBDX0NTUihhMCk8YnI+
DQrCoCDCoCDCoCDCoCBjZmMxwqAgwqAgdDAsICQwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgIyBpbXBsZW1lbnRhdGlvbi92ZXJzaW9uPGJyPg0KwqAgwqAgwqAgwqAgRVjC
oCDCoCDCoCBzdyB0MCwgU0MzMl9GUENfRUlSKGEwKTxicj4NCivCoCDCoCDCoCDCoC5zZXQgcG9w
PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAganLCoCDCoCDCoCByYTxicj4NCsKgIMKgIMKgIMKgIMKg
bGnCoCDCoCDCoHYwLCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjIHN1Y2Nlc3M8YnI+DQpAQCAtMTUwLDggKzE2NSwxMCBAQCBMRUFGKF9yZXN0
b3JlX2ZwX2NvbnRleHQpPGJyPg0KPGJyPg0KwqAjaWYgZGVmaW5lZChDT05GSUdfNjRCSVQpIHx8
IGRlZmluZWQoQ09ORklHX0NQVV9NSVBTMzJfUjIpPGJyPg0KwqAgwqAgwqAgwqAgLnNldMKgIMKg
IHB1c2g8YnI+DQorwqAgwqAgwqAgwqBTRVRfSEFSREZMT0FUPGJyPg0KwqAjaWZkZWYgQ09ORklH
X0NQVV9NSVBTMzJfUjI8YnI+DQotwqAgwqAgwqAgwqAuc2V0wqAgwqAgbWlwczY0cjI8YnI+DQor
wqAgwqAgwqAgwqAuc2V0wqAgwqAgbWlwczMycjI8YnI+DQorwqAgwqAgwqAgwqAuc2V0wqAgwqAg
ZnA9NjQ8YnI+DQrCoCDCoCDCoCDCoCBtZmMwwqAgwqAgdDAsIENQMF9TVEFUVVM8YnI+DQrCoCDC
oCDCoCDCoCBzbGzCoCDCoCDCoHQwLCB0MCwgNTxicj4NCsKgIMKgIMKgIMKgIGJnZXrCoCDCoCB0
MCwgMWbCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjIHNraXAgbG9hZGluZyBvZGQgaWYgRlI9
MDxicj4NCkBAIC0xNzUsNiArMTkyLDggQEAgTEVBRihfcmVzdG9yZV9mcF9jb250ZXh0KTxicj4N
CsKgIMKgIMKgIMKgIEVYwqAgwqAgwqAgbGRjMSAkZjMxLCBTQ19GUFJFR1MrMjQ4KGEwKTxicj4N
CsKgMTrCoCDCoCDCoC5zZXQgcG9wPGJyPg0KwqAjZW5kaWY8YnI+DQorwqAgwqAgwqAgwqAuc2V0
IHB1c2g8YnI+DQorwqAgwqAgwqAgwqBTRVRfSEFSREZMT0FUPGJyPg0KwqAgwqAgwqAgwqAgRVjC
oCDCoCDCoCBsZGMxICRmMCwgU0NfRlBSRUdTKzAoYTApPGJyPg0KwqAgwqAgwqAgwqAgRVjCoCDC
oCDCoCBsZGMxICRmMiwgU0NfRlBSRUdTKzE2KGEwKTxicj4NCsKgIMKgIMKgIMKgIEVYwqAgwqAg
wqAgbGRjMSAkZjQsIFNDX0ZQUkVHUyszMihhMCk8YnI+DQpAQCAtMTkyLDYgKzIxMSw3IEBAIExF
QUYoX3Jlc3RvcmVfZnBfY29udGV4dCk8YnI+DQrCoCDCoCDCoCDCoCBFWMKgIMKgIMKgIGxkYzEg
JGYyOCwgU0NfRlBSRUdTKzIyNChhMCk8YnI+DQrCoCDCoCDCoCDCoCBFWMKgIMKgIMKgIGxkYzEg
JGYzMCwgU0NfRlBSRUdTKzI0MChhMCk8YnI+DQrCoCDCoCDCoCDCoCBjdGMxwqAgwqAgdDEsIGZj
cjMxPGJyPg0KK8KgIMKgIMKgIMKgLnNldCBwb3A8YnI+DQrCoCDCoCDCoCDCoCBqcsKgIMKgIMKg
IHJhPGJyPg0KwqAgwqAgwqAgwqAgwqBsacKgIMKgIMKgdjAsIDDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCMgc3VjY2Vzczxicj4NCsKgIMKgIMKg
IMKgIEVORChfcmVzdG9yZV9mcF9jb250ZXh0KTxicj4NCkBAIC0xOTksNiArMjE5LDggQEAgTEVB
RihfcmVzdG9yZV9mcF9jb250ZXh0KTxicj4NCsKgI2lmZGVmIENPTkZJR19NSVBTMzJfQ09NUEFU
PGJyPg0KwqBMRUFGKF9yZXN0b3JlX2ZwX2NvbnRleHQzMik8YnI+DQrCoCDCoCDCoCDCoCAvKiBS
ZXN0b3JlIGFuIG8zMiBzaWdjb250ZXh0LsKgICovPGJyPg0KK8KgIMKgIMKgIMKgLnNldCBwdXNo
PGJyPg0KK8KgIMKgIMKgIMKgU0VUX0hBUkRGTE9BVDxicj4NCsKgIMKgIMKgIMKgIEVYwqAgwqAg
wqAgbHcgdDEsIFNDMzJfRlBDX0NTUihhMCk8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBtZmMwwqAg
wqAgdDAsIENQMF9TVEFUVVM8YnI+DQpAQCAtMjQyLDYgKzI2NCw3IEBAIExFQUYoX3Jlc3RvcmVf
ZnBfY29udGV4dDMyKTxicj4NCsKgIMKgIMKgIMKgIGN0YzHCoCDCoCB0MSwgZmNyMzE8YnI+DQrC
oCDCoCDCoCDCoCBqcsKgIMKgIMKgIHJhPGJyPg0KwqAgwqAgwqAgwqAgwqBsacKgIMKgIMKgdjAs
IDDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCMg
c3VjY2Vzczxicj4NCivCoCDCoCDCoCDCoC5zZXQgcG9wPGJyPg0KwqAgwqAgwqAgwqAgRU5EKF9y
ZXN0b3JlX2ZwX2NvbnRleHQzMik8YnI+DQrCoCNlbmRpZjxicj4NCjxicj4NCmRpZmYgLS1naXQg
YS9hcmNoL21pcHMva2VybmVsL3I0a19zd2l0Y2guUyBiL2FyY2gvbWlwcy9rZXJuZWwvcjRrX3N3
aXRjaC5TPGJyPg0KaW5kZXggOGE0ZjlhNS4uNzE1ZmIxMyAxMDA2NDQ8YnI+DQotLS0gYS9hcmNo
L21pcHMva2VybmVsL3I0a19zd2l0Y2guUzxicj4NCisrKyBiL2FyY2gvbWlwcy9rZXJuZWwvcjRr
X3N3aXRjaC5TPGJyPg0KQEAgLTIyLDYgKzIyLDkgQEA8YnI+DQo8YnI+DQrCoCNpbmNsdWRlICZs
dDthc20vYXNtbWFjcm8uaCZndDs8YnI+DQo8YnI+DQorLyogcHJlcHJvY2Vzc29yIHJlcGxhY2Vz
IHRoZSBmcCBpbiAmcXVvdDsuc2V0IGZwPTY0JnF1b3Q7IHdpdGggJDMwIG90aGVyd2lzZSAqLzxi
cj4NCisjdW5kZWYgZnA8YnI+DQorPGJyPg0KwqAvKjxicj4NCsKgICogT2Zmc2V0IHRvIHRoZSBj
dXJyZW50IHByb2Nlc3Mgc3RhdHVzIGZsYWdzLCB0aGUgZmlyc3QgMzIgYnl0ZXMgb2YgdGhlPGJy
Pg0KwqAgKiBzdGFjayBhcmUgbm90IHVzZWQuPGJyPg0KQEAgLTE1NCw2ICsxNTcsOSBAQCBMRUFG
KF9yZXN0b3JlX2ZwKTxicj4NCjxicj4NCsKgI2RlZmluZSBGUFVfREVGQVVMVMKgIDB4MDAwMDAw
MDA8YnI+DQo8YnI+DQorwqAgwqAgwqAgwqAuc2V0IHB1c2g8YnI+DQorwqAgwqAgwqAgwqBTRVRf
SEFSREZMT0FUPGJyPg0KKzxicj4NCsKgTEVBRihfaW5pdF9mcHUpPGJyPg0KwqAjaWZkZWYgQ09O
RklHX01JUFNfTVRfU01UQzxicj4NCsKgIMKgIMKgIMKgIC8qIFJhdGhlciB0aGFuIG1hbmlwdWxh
dGUgcGVyLVZQRSBTdGF0dXMsIHNldCBwZXItVEMgYml0IGluIFRDU3RhdHVzICovPGJyPg0KQEAg
LTIzNCw3ICsyNDAsOCBAQCBMRUFGKF9pbml0X2ZwdSk8YnI+DQo8YnI+DQrCoCNpZmRlZiBDT05G
SUdfQ1BVX01JUFMzMl9SMjxicj4NCsKgIMKgIMKgIMKgIC5zZXTCoCDCoCBwdXNoPGJyPg0KLcKg
IMKgIMKgIMKgLnNldMKgIMKgIG1pcHM2NHIyPGJyPg0KK8KgIMKgIMKgIMKgLnNldMKgIMKgIG1p
cHMzMnIyPGJyPg0KK8KgIMKgIMKgIMKgLnNldMKgIMKgIGZwPTY0PGJyPg0KwqAgwqAgwqAgwqAg
c2xswqAgwqAgwqB0MCwgdDAsIDXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCMg
aXMgU3RhdHVzLkZSIHNldD88YnI+DQrCoCDCoCDCoCDCoCBiZ2V6wqAgwqAgdDAsIDFmwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgIyBubzogc2tpcCBzZXR0aW5nIHVwcGVy
IDMyYjxicj4NCjxicj4NCkBAIC0yOTMsMyArMzAwLDUgQEAgTEVBRihfaW5pdF9mcHUpPGJyPg0K
wqAjZW5kaWY8YnI+DQrCoCDCoCDCoCDCoCBqcsKgIMKgIMKgIHJhPGJyPg0KwqAgwqAgwqAgwqAg
RU5EKF9pbml0X2ZwdSk8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLnNldCBwb3DCoCDCoCDCoCDC
oCAvKiBTRVRfSEFSREZMT0FUICovPGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwv
cjYwMDBfZnB1LlMgYi9hcmNoL21pcHMva2VybmVsL3I2MDAwX2ZwdS5TPGJyPg0KaW5kZXggZGEw
ZmJlNC4uNDcwNzczOCAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL21pcHMva2VybmVsL3I2MDAwX2Zw
dS5TPGJyPg0KKysrIGIvYXJjaC9taXBzL2tlcm5lbC9yNjAwMF9mcHUuUzxicj4NCkBAIC0xOCw2
ICsxOCw5IEBAPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLnNldMKgIMKgIG5vcmVvcmRlcjxicj4N
CsKgIMKgIMKgIMKgIC5zZXTCoCDCoCBtaXBzMjxicj4NCivCoCDCoCDCoCDCoC5zZXTCoCDCoCBw
dXNoPGJyPg0KK8KgIMKgIMKgIMKgU0VUX0hBUkRGTE9BVDxicj4NCis8YnI+DQrCoCDCoCDCoCDC
oCAvKiBTYXZlIGZsb2F0aW5nIHBvaW50IGNvbnRleHQgKi88YnI+DQrCoCDCoCDCoCDCoCBMRUFG
KF9zYXZlX2ZwX2NvbnRleHQpPGJyPg0KwqAgwqAgwqAgwqAgbWZjMMKgIMKgIHQwLENQMF9TVEFU
VVM8YnI+DQpAQCAtODUsMyArODgsNSBAQDxicj4NCsKgMTrCoCDCoCDCoGpywqAgwqAgwqAgcmE8
YnI+DQrCoCDCoCDCoCDCoCDCoG5vcDxicj4NCsKgIMKgIMKgIMKgIEVORChfcmVzdG9yZV9mcF9j
b250ZXh0KTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAuc2V0IHBvcMKgIMKgIMKgIMKgIC8qIFNF
VF9IQVJERkxPQVQgKi88YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL21hdGgtZW11L2NwMWVt
dS5jIGIvYXJjaC9taXBzL21hdGgtZW11L2NwMWVtdS5jPGJyPg0KaW5kZXggZWRiMTEwYy4uNGU5
ZTNjMSAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL21pcHMvbWF0aC1lbXUvY3AxZW11LmM8YnI+DQor
KysgYi9hcmNoL21pcHMvbWF0aC1lbXUvY3AxZW11LmM8YnI+DQpAQCAtODIxLDExICs4MjEsNyBA
QCBzdGF0aWMgaW50IGlzQnJhbmNoSW5zdHIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBt
bV9kZWNvZGVkX2luc24gZGVjX2luc24sPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYg
KDxhIGhyZWY9Imh0dHA6Ly9pbnNuLmlfZm9ybWF0LnJzIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5pbnNuLmlfZm9ybWF0LnJzPC9hPiA9PSBiY19vcCkgezxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHByZWVtcHRfZGlzYWJsZSgpOzxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChpc19mcHVfb3duZXIoKSk8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc20gdm9sYXRp
bGUoPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJnF1b3Q7LnNldCBwdXNoXG4mcXVvdDs8YnI+DQotwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtcdC5zZXQg
bWlwczFcbiZxdW90Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O1x0Y2ZjMVx0JTAsJDMxXG4mcXVvdDs8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmcXVvdDtcdC5zZXQgcG9wJnF1b3Q7IDogJnF1b3Q7PXImcXVvdDsgKGZjcjMxKSk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmNyMzEgPSBy
ZWFkXzMyYml0X2NwMV9yZWdpc3RlcihDUDFfU1RBVFVTKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBlbHNlPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgZmNyMzEgPSBjdXJyZW50LSZndDt0aHJlYWQuZnB1LmZjcjMx
Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHByZWVtcHRfZW5hYmxl
KCk7PGJyPg0KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZvbnQgY29sb3I9IiM4ODg4ODgiPi0tPGJy
Pg0KMi4wLjI8YnI+DQo8YnI+DQotLTxicj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fPGJyPg0KT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0PGJy
Pg0KPGEgaHJlZj0ibWFpbHRvOk9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmciPk9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8L2E+PGJyPg0KPGEg
aHJlZj0iaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
ZW1iZWRkZWQtY29yZSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZTwv
YT48YnI+DQo8L2ZvbnQ+PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+DQo=

--001a11376dacffe78c051aefffa3--
