Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EB75162252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 09:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0C9Ijk5016069; Mon, 12 Jan 2015 09:18:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GAgEJ7RXwEii; Mon, 12 Jan 2015 09:18:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0C9IU2b016054
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Jan 2015 09:18:41 GMT
Message-ID: <1421054310.31262.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Date: Mon, 12 Jan 2015 09:18:30 +0000
In-Reply-To: <1421032337-50265-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1421032337-50265-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: upgrade to 4.9.2 and fix the bug #6824
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
X-List-Received-Date: Mon, 12 Jan 2015 09:19:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-01-12 at 11:12 +0800, Lei Maohui wrote:
> fix the yocto bug #6824
> backport from gcc
> 
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  12 +-
>  ...e500-double-in-SPE_SIMD_REGNO_P-registers.patch |  13 ++
>  .../0061-Fix-for-unwinder-aborts-on-e500.patch     | 161 +++++++++++++++++++++
>  3 files changed, 180 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 2568e99..c4ec40d 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>  
>  # Third digit in PV should be incremented after a minor release
>  
> -PV = "4.9.1"
> +PV = "4.9.2"
>  
>  # BINV should be incremented to a revision after a minor gcc release
>  
> -BINV = "4.9.1"
> +BINV = "4.9.2"

I can't spot the upgrade from 4.9.1 to 4.9.2 in here. The SRC_URI
checksums are unchanged for example? Is there part of the patch missing?

Cheers,

Richard

>  
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-4.9:"
>  
> @@ -69,11 +69,11 @@ SRC_URI = "\
>      file://0051-eabispe.patch \
>      file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
>      file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
> -    file://0055-PR-rtl-optimization-61801.patch \
>      file://0056-top-level-reorder_gcc-bug-61144.patch \
> -    file://0057-aarch64-config.patch \
>      file://0058-gcc-r212171.patch \
>      file://0059-gcc-PR-rtl-optimization-63348.patch \
> +    file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch \
> +    file://0061-Fix-for-unwinder-aborts-on-e500.patch \
>  "
>  SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
>  SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
> @@ -125,8 +125,8 @@ EXTRA_OECONF_INTERMEDIATE = "\
>  EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
>  
>  EXTRA_OECONF_PATHS = "\ 
> -    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \ 
> -    --with-sysroot=/not/exist \ 
> +    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \ 
> +    --with-sysroot=${STAGING_DIR_TARGET} \ 
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>  "
>  
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch
> new file mode 100644
> index 0000000..810ff90
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch
> @@ -0,0 +1,13 @@
> +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
> +index 512e7d6..292fb2c 100644
> +--- a/gcc/config/rs6000/rs6000.c
> ++++ b/gcc/config/rs6000/rs6000.c
> +@@ -1704,7 +1704,7 @@ rs6000_hard_regno_nregs_internal (int regno, enum machine_mode mode)
> +      SCmode so as to pass the value correctly in a pair of
> +      registers.  */
> +   else if (TARGET_E500_DOUBLE && FLOAT_MODE_P (mode) && mode != SCmode
> +-	   && !DECIMAL_FLOAT_MODE_P (mode))
> ++           && !DECIMAL_FLOAT_MODE_P (mode) && SPE_SIMD_REGNO_P (regno))
> +     reg_size = UNITS_PER_FP_WORD;
> + 
> +   else
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500.patch b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500.patch
> new file mode 100644
> index 0000000..c37a4c3
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500.patch
> @@ -0,0 +1,161 @@
> +diff --git a/gcc/defaults.h b/gcc/defaults.h
> +index f94ae17..80a798f 100644
> +--- a/gcc/defaults.h
> ++++ b/gcc/defaults.h
> +@@ -438,6 +438,11 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> + #define DWARF_FRAME_REGNUM(REG) DBX_REGISTER_NUMBER (REG)
> + #endif
> + 
> ++/* The mapping from dwarf CFA reg number to internal dwarf reg numbers.  */
> ++#ifndef DWARF_REG_TO_UNWIND_COLUMN
> ++#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO)
> ++#endif
> ++
> + /* Map register numbers held in the call frame info that gcc has
> +    collected using DWARF_FRAME_REGNUM to those that should be output in
> +    .debug_frame and .eh_frame.  */
> +diff --git a/gcc/dwarf2cfi.c b/gcc/dwarf2cfi.c
> +index abcdeb3..4e59dfe 100644
> +--- a/gcc/dwarf2cfi.c
> ++++ b/gcc/dwarf2cfi.c
> +@@ -252,7 +252,60 @@ init_return_column_size (enum machine_mode mode, rtx mem, unsigned int c)
> + 		  gen_int_mode (size, mode));
> + }
> + 
> +-/* Generate code to initialize the register size table.  */
> ++/* Datastructure used by expand_builtin_init_dwarf_reg_sizes and
> ++   init_one_dwarf_reg_size to communicate on what has been done by the
> ++   latter.  */
> ++
> ++typedef struct
> ++{
> ++  /* Whether the dwarf return column was initialized.  */
> ++  bool wrote_return_column;
> ++
> ++  /* For each hard register REGNO, whether init_one_dwarf_reg_size
> ++     was given REGNO to process already.  */
> ++  bool processed_regno [FIRST_PSEUDO_REGISTER];
> ++
> ++} init_one_dwarf_reg_state;
> ++
> ++/* Helper for expand_builtin_init_dwarf_reg_sizes.  Generate code to
> ++   initialize the dwarf register size table entry corresponding to register
> ++   REGNO in REGMODE.  TABLE is the table base address, SLOTMODE is the mode to
> ++   use for the size entry to initialize, and INIT_STATE is the communication
> ++   datastructure conveying what we're doing to our caller.  */
> ++
> ++static
> ++void init_one_dwarf_reg_size (int regno, machine_mode regmode,
> ++                             rtx table, machine_mode slotmode,
> ++                             init_one_dwarf_reg_state *init_state)
> ++{
> ++  const unsigned int dnum = DWARF_FRAME_REGNUM (regno);
> ++  const unsigned int rnum = DWARF2_FRAME_REG_OUT (dnum, 1);
> ++  const unsigned int dcol = DWARF_REG_TO_UNWIND_COLUMN (rnum);
> ++
> ++  const HOST_WIDE_INT slotoffset = dcol * GET_MODE_SIZE (slotmode);
> ++  const HOST_WIDE_INT regsize = GET_MODE_SIZE (regmode);
> ++
> ++  init_state->processed_regno[regno] = true;
> ++
> ++  if (rnum >= DWARF_FRAME_REGISTERS)
> ++    return;
> ++
> ++  if (dnum == DWARF_FRAME_RETURN_COLUMN)
> ++    {
> ++      if (regmode == VOIDmode)
> ++       return;
> ++      init_state->wrote_return_column = true;
> ++    }
> ++
> ++  if (slotoffset < 0)
> ++    return;
> ++
> ++  emit_move_insn (adjust_address (table, slotmode, slotoffset),
> ++                 gen_int_mode (regsize, slotmode));
> ++}
> ++
> ++/* Generate code to initialize the dwarf register size table located
> ++   at the provided ADDRESS.  */
> + 
> + void
> + expand_builtin_init_dwarf_reg_sizes (tree address)
> +@@ -261,37 +314,41 @@ expand_builtin_init_dwarf_reg_sizes (tree address)
> +   enum machine_mode mode = TYPE_MODE (char_type_node);
> +   rtx addr = expand_normal (address);
> +   rtx mem = gen_rtx_MEM (BLKmode, addr);
> +-  bool wrote_return_column = false;
> ++
> ++  init_one_dwarf_reg_state init_state;
> ++  memset ((char *)&init_state, 0, sizeof (init_state));
> + 
> +   for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
> +     {
> +-      unsigned int dnum = DWARF_FRAME_REGNUM (i);
> +-      unsigned int rnum = DWARF2_FRAME_REG_OUT (dnum, 1);
> ++      machine_mode save_mode;
> ++      rtx span;
> + 
> +-      if (rnum < DWARF_FRAME_REGISTERS)
> +-	{
> +-	  HOST_WIDE_INT offset = rnum * GET_MODE_SIZE (mode);
> +-	  enum machine_mode save_mode = reg_raw_mode[i];
> +-	  HOST_WIDE_INT size;
> ++      /* No point in processing a register multiple times.  This could happen
> ++         with register spans, e.g. when a reg is first processed as a piece of
> ++         a span, then as a register on its own later on.  */
> + 
> +-	  if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
> +-	    save_mode = choose_hard_reg_mode (i, 1, true);
> +-	  if (dnum == DWARF_FRAME_RETURN_COLUMN)
> +-	    {
> +-	      if (save_mode == VOIDmode)
> +-		continue;
> +-	      wrote_return_column = true;
> +-	    }
> +-	  size = GET_MODE_SIZE (save_mode);
> +-	  if (offset < 0)
> +-	    continue;
> ++      if (init_state.processed_regno[i])
> ++        continue;
> + 
> +-	  emit_move_insn (adjust_address (mem, mode, offset),
> +-			  gen_int_mode (size, mode));
> ++      save_mode = reg_raw_mode[i];
> ++      if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
> ++        save_mode = choose_hard_reg_mode (i, 1, true);
> ++
> ++      span = targetm.dwarf_register_span (gen_rtx_REG (save_mode, i));
> ++      if (!span)
> ++        init_one_dwarf_reg_size (i, save_mode, mem, mode, &init_state);
> ++      else
> ++        {
> ++           for (int si = 0; si < XVECLEN (span, 0); si++)
> ++	    {
> ++               rtx reg = XVECEXP (span, 0, si);
> ++               init_one_dwarf_reg_size
> ++                 (REGNO (reg), GET_MODE (reg), mem, mode, &init_state);
> ++            }
> + 	}
> +     }
> + 
> +-  if (!wrote_return_column)
> ++  if (!init_state.wrote_return_column)
> +     init_return_column_size (mode, mem, DWARF_FRAME_RETURN_COLUMN);
> + 
> + #ifdef DWARF_ALT_FRAME_RETURN_COLUMN
> +diff --git a/libgcc/unwind-dw2.c b/libgcc/unwind-dw2.c
> +index 55fc4bc..37f0ae2 100644
> +--- a/libgcc/unwind-dw2.c
> ++++ b/libgcc/unwind-dw2.c
> +@@ -55,10 +55,6 @@
> + #define PRE_GCC3_DWARF_FRAME_REGISTERS DWARF_FRAME_REGISTERS
> + #endif
> + 
> +-#ifndef DWARF_REG_TO_UNWIND_COLUMN
> +-#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO)
> +-#endif
> +-
> + /* ??? For the public function interfaces, we tend to gcc_assert that the
> +    column numbers are in range.  For the dwarf2 unwind info this does happen,
> +    although so far in a case that doesn't actually matter.
> -- 
> 1.8.4.2
> 



