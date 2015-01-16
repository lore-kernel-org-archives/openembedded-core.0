Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5EC72332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 07:01:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56157067"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2015 14:58:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0G70qw2021820
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 15:00:52 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 16 Jan 2015 15:01:33 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 15:00:34 +0800
Message-ID: <1421391634-32189-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [PATCH v2]gcc: upgrade to 4.9.2 and fix the bug #6824
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
X-List-Received-Date: Fri, 16 Jan 2015 07:01:45 -0000
Content-Type: text/plain

The new patches 0060-Only-xxx and 0061-Fix-xxx aim to fix the bug in e500v2 as following:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63908 .

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  12 +-
 ...e500-double-in-SPE_SIMD_REGNO_P-registers.patch |  33 ++++
 .../0061-Fix-for-unwinder-aborts-on-e500.patch     | 193 +++++++++++++++++++++
 3 files changed, 232 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 2568e99..e0b291e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "4.9.1"
+PV = "4.9.2"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "4.9.1"
+BINV = "4.9.2"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-4.9:"
 
@@ -69,14 +69,14 @@ SRC_URI = "\
     file://0051-eabispe.patch \
     file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
     file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
-    file://0055-PR-rtl-optimization-61801.patch \
     file://0056-top-level-reorder_gcc-bug-61144.patch \
-    file://0057-aarch64-config.patch \
     file://0058-gcc-r212171.patch \
     file://0059-gcc-PR-rtl-optimization-63348.patch \
+    file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch \
+    file://0061-Fix-for-unwinder-aborts-on-e500.patch \
 "
-SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
-SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
+SRC_URI[md5sum] = "4df8ee253b7f3863ad0b86359cd39c43"
+SRC_URI[sha256sum] = "2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch
new file mode 100644
index 0000000..44343bc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch
@@ -0,0 +1,33 @@
+backport to fix the bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63908 .
+
+2014-10-25  Joseph Myers  <joseph@codesourcery.com>
+
+        * config/rs6000/rs6000.c (rs6000_hard_regno_nregs_internal): Do
+        not allow e500 double in registers not satisyfing
+        SPE_SIMD_REGNO_P.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@216688 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63908]
+Note : This patch though presents in upstream trunk, have not been back-ported to gcc-4_9-branch.
+
+---
+ gcc/config/rs6000/rs6000.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
+index e1a226c..eab0a49 100644
+--- a/gcc/config/rs6000/rs6000.c
++++ b/gcc/config/rs6000/rs6000.c
+@@ -1703,7 +1703,7 @@ rs6000_hard_regno_nregs_internal (int regno, enum machine_mode mode)
+      SCmode so as to pass the value correctly in a pair of
+      registers.  */
+   else if (TARGET_E500_DOUBLE && FLOAT_MODE_P (mode) && mode != SCmode
+-	   && !DECIMAL_FLOAT_MODE_P (mode))
++           && !DECIMAL_FLOAT_MODE_P (mode) && SPE_SIMD_REGNO_P (regno))
+     reg_size = UNITS_PER_FP_WORD;
+ 
+   else
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500.patch b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500.patch
new file mode 100644
index 0000000..52ceb2c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0061-Fix-for-unwinder-aborts-on-e500.patch
@@ -0,0 +1,193 @@
+backport to fix the bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63908 .
+
+    2014-12-05  Olivier Hainque  <hainque@adacore.com>
+
+            gcc/
+            * defaults.h: (DWARF_REG_TO_UNWIND_COLUMN): Define default.
+            * dwarf2cfi.c (init_one_dwarf_reg_size): Honor
+            DWARF_REG_TO_UNWIND_COLUMN.
+
+            libgcc/
+            * unwind-dw2.c (DWARF_REG_TO_UNWIND_COLUMN): Remove default def,
+            now provided by defaults.h.
+
+    2014-12-05  Olivier Hainque  <hainque@adacore.com>
+
+            * dwarf2cfi.c (init_one_dwarf_reg_size): New helper, processing
+            one particular reg for expand_builtin_init_dwarf_reg_sizes.
+            (expand_builtin_init_dwarf_reg_sizes): Rework to use helper and
+            account for dwarf register spans.
+
+Upstream-Status: Backport
+Note: This patch though presents in upstream trunk, have not been back-ported to gcc-4_9-branch..
+
+---
+ gcc/defaults.h      |   5 +++
+ gcc/dwarf2cfi.c     | 103 ++++++++++++++++++++++++++++++++++++++++------------
+ libgcc/unwind-dw2.c |   4 --
+ 3 files changed, 85 insertions(+), 27 deletions(-)
+
+diff --git a/gcc/defaults.h b/gcc/defaults.h
+index f94ae17..80a798f 100644
+--- a/gcc/defaults.h
++++ b/gcc/defaults.h
+@@ -438,6 +438,11 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #define DWARF_FRAME_REGNUM(REG) DBX_REGISTER_NUMBER (REG)
+ #endif
+ 
++/* The mapping from dwarf CFA reg number to internal dwarf reg numbers.  */
++#ifndef DWARF_REG_TO_UNWIND_COLUMN
++#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO)
++#endif
++
+ /* Map register numbers held in the call frame info that gcc has
+    collected using DWARF_FRAME_REGNUM to those that should be output in
+    .debug_frame and .eh_frame.  */
+diff --git a/gcc/dwarf2cfi.c b/gcc/dwarf2cfi.c
+index 60e0308..55d4d2a 100644
+--- a/gcc/dwarf2cfi.c
++++ b/gcc/dwarf2cfi.c
+@@ -252,7 +252,60 @@ init_return_column_size (enum machine_mode mode, rtx mem, unsigned int c)
+ 		  gen_int_mode (size, mode));
+ }
+ 
+-/* Generate code to initialize the register size table.  */
++/* Datastructure used by expand_builtin_init_dwarf_reg_sizes and
++   init_one_dwarf_reg_size to communicate on what has been done by the
++   latter.  */
++
++typedef struct
++{
++  /* Whether the dwarf return column was initialized.  */
++  bool wrote_return_column;
++
++  /* For each hard register REGNO, whether init_one_dwarf_reg_size
++     was given REGNO to process already.  */
++  bool processed_regno [FIRST_PSEUDO_REGISTER];
++
++} init_one_dwarf_reg_state;
++
++/* Helper for expand_builtin_init_dwarf_reg_sizes.  Generate code to
++   initialize the dwarf register size table entry corresponding to register
++   REGNO in REGMODE.  TABLE is the table base address, SLOTMODE is the mode to
++   use for the size entry to initialize, and INIT_STATE is the communication
++   datastructure conveying what we're doing to our caller.  */
++
++static
++void init_one_dwarf_reg_size (int regno, machine_mode regmode,
++                             rtx table, machine_mode slotmode,
++                             init_one_dwarf_reg_state *init_state)
++{
++  const unsigned int dnum = DWARF_FRAME_REGNUM (regno);
++  const unsigned int rnum = DWARF2_FRAME_REG_OUT (dnum, 1);
++  const unsigned int dcol = DWARF_REG_TO_UNWIND_COLUMN (rnum);
++
++  const HOST_WIDE_INT slotoffset = dcol * GET_MODE_SIZE (slotmode);
++  const HOST_WIDE_INT regsize = GET_MODE_SIZE (regmode);
++
++  init_state->processed_regno[regno] = true;
++
++  if (rnum >= DWARF_FRAME_REGISTERS)
++    return;
++
++  if (dnum == DWARF_FRAME_RETURN_COLUMN)
++    {
++      if (regmode == VOIDmode)
++       return;
++      init_state->wrote_return_column = true;
++    }
++
++  if (slotoffset < 0)
++    return;
++
++  emit_move_insn (adjust_address (table, slotmode, slotoffset),
++                 gen_int_mode (regsize, slotmode));
++}
++
++/* Generate code to initialize the dwarf register size table located
++   at the provided ADDRESS.  */
+ 
+ void
+ expand_builtin_init_dwarf_reg_sizes (tree address)
+@@ -261,37 +314,41 @@ expand_builtin_init_dwarf_reg_sizes (tree address)
+   enum machine_mode mode = TYPE_MODE (char_type_node);
+   rtx addr = expand_normal (address);
+   rtx mem = gen_rtx_MEM (BLKmode, addr);
+-  bool wrote_return_column = false;
++
++  init_one_dwarf_reg_state init_state;
++  memset ((char *)&init_state, 0, sizeof (init_state));
+ 
+   for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
+     {
+-      unsigned int dnum = DWARF_FRAME_REGNUM (i);
+-      unsigned int rnum = DWARF2_FRAME_REG_OUT (dnum, 1);
++      machine_mode save_mode;
++      rtx span;
+ 
+-      if (rnum < DWARF_FRAME_REGISTERS)
+-	{
+-	  HOST_WIDE_INT offset = rnum * GET_MODE_SIZE (mode);
+-	  enum machine_mode save_mode = reg_raw_mode[i];
+-	  HOST_WIDE_INT size;
++      /* No point in processing a register multiple times.  This could happen
++         with register spans, e.g. when a reg is first processed as a piece of
++         a span, then as a register on its own later on.  */
+ 
+-	  if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
+-	    save_mode = choose_hard_reg_mode (i, 1, true);
+-	  if (dnum == DWARF_FRAME_RETURN_COLUMN)
+-	    {
+-	      if (save_mode == VOIDmode)
+-		continue;
+-	      wrote_return_column = true;
+-	    }
+-	  size = GET_MODE_SIZE (save_mode);
+-	  if (offset < 0)
+-	    continue;
++      if (init_state.processed_regno[i])
++        continue;
+ 
+-	  emit_move_insn (adjust_address (mem, mode, offset),
+-			  gen_int_mode (size, mode));
++      save_mode = reg_raw_mode[i];
++      if (HARD_REGNO_CALL_PART_CLOBBERED (i, save_mode))
++        save_mode = choose_hard_reg_mode (i, 1, true);
++
++      span = targetm.dwarf_register_span (gen_rtx_REG (save_mode, i));
++      if (!span)
++        init_one_dwarf_reg_size (i, save_mode, mem, mode, &init_state);
++      else
++        {
++           for (int si = 0; si < XVECLEN (span, 0); si++)
++	    {
++               rtx reg = XVECEXP (span, 0, si);
++               init_one_dwarf_reg_size
++                 (REGNO (reg), GET_MODE (reg), mem, mode, &init_state);
++            }
+ 	}
+     }
+ 
+-  if (!wrote_return_column)
++  if (!init_state.wrote_return_column)
+     init_return_column_size (mode, mem, DWARF_FRAME_RETURN_COLUMN);
+ 
+ #ifdef DWARF_ALT_FRAME_RETURN_COLUMN
+diff --git a/libgcc/unwind-dw2.c b/libgcc/unwind-dw2.c
+index 55fc4bc..37f0ae2 100644
+--- a/libgcc/unwind-dw2.c
++++ b/libgcc/unwind-dw2.c
+@@ -55,10 +55,6 @@
+ #define PRE_GCC3_DWARF_FRAME_REGISTERS DWARF_FRAME_REGISTERS
+ #endif
+ 
+-#ifndef DWARF_REG_TO_UNWIND_COLUMN
+-#define DWARF_REG_TO_UNWIND_COLUMN(REGNO) (REGNO)
+-#endif
+-
+ /* ??? For the public function interfaces, we tend to gcc_assert that the
+    column numbers are in range.  For the dwarf2 unwind info this does happen,
+    although so far in a case that doesn't actually matter.
+-- 
+1.8.4.2
+
-- 
1.8.4.2


