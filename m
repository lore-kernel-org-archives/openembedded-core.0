Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 236F577348
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 14:53:14 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 128so169155815wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 06:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0N0g6B9ZOePy6UFkcA0O5CEbUwveyIZhvGfBnotGklM=;
	b=by0rnTTxMDN/e0L3T16/FJp0I0fVWbHei8YnGF4AGtI1/ZGdw4TZEzHFTr790VhU7N
	J6ufCSjUWS2fHja03WJfVbHqiSinO+Tof84NI6OHuNmy5kg2uSZDp+npph+wDqCxS7gu
	v27Qxv2Z0ZbqzCJ8tOsg/A5IjemNFHxiflvoxUsrkS+8yuv2WhNpaT9bDB8ToVJ1MGBH
	laERAnQhAUH15CjS8UY58EmKO+XGOdXVmEnsvNZ9AipeRBnCxdKyiNt1bXY1KVymfk+q
	6R67DNjW5YjzNxD5YX70txk6XDzDSNzIUfRlKG3Sh54BG0JjRJ80V5q2zwR3LkWA/pgm
	/1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0N0g6B9ZOePy6UFkcA0O5CEbUwveyIZhvGfBnotGklM=;
	b=ThFcIvmjRFCFI8Fi/cC+lm6ELmptAq+EXCbhm8BAI+DKYdYYuZnJO0sqNCOEM1Mdfa
	tjY3pzcLtsLU412cvv5DVL7yGG1wb2yrT/SPWIOzBRzdd9E9gPTRZlaxMxnuP8IUpI7h
	+JHzxc/C+V0DIm7VZuLFFoPGCeV28LsDEGR/RVO060P+F9wRhU++0cog3vrwmPcMBBXJ
	y4v1A7X9l2hqEWFB/E8GWbFyBQKPsO8Bnr8gROTIgwVBk2lJcE5lsuVfHBdq2RO0J8K1
	f2EWSW4JbnLRi8O/JYnkqHs0Rkg3M2iOrgylzNPtdNM0VhyJvL0CJuwt8xhaepAgxj9u
	DGXg==
X-Gm-Message-State: AG10YORvCW9C97x6B6MsrCrwMpicQ20STFL0zTGBialxH960bl4clR+BpCr2nkjn0+26jA==
X-Received: by 10.194.103.131 with SMTP id fw3mr2697789wjb.55.1454511195289;
	Wed, 03 Feb 2016 06:53:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v191sm8287531wme.1.2016.02.03.06.53.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 06:53:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 15:56:22 +0100
Message-Id: <1454511382-8312-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] gcc-5.3: backport fix for PR-target-65358
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
X-List-Received-Date: Wed, 03 Feb 2016 14:53:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   3 +-
 .../gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch    |  48 +++-
 ...arget-65358-Avoid-clobbering-partial-argu.patch | 307 +++++++++++++++++++++
 3 files changed, 354 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 80999c1..880e839 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -77,7 +77,8 @@ SRC_URI = "\
            file://0045-Support-for-arm-linux-musl.patch \
            file://0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch \
 	   file://0047-Fix-nios2-musl-build.patch \
-          "
+    file://0048-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch \
+"
 
 BACKPORTS = ""
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch b/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
index 44cea84..6844db4 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
@@ -1,6 +1,45 @@
-diff -Naru gcc-5.3.0.orig/gcc/config/nios2/linux.h gcc-5.3.0/gcc/config/nios2/linux.h
---- gcc-5.3.0.orig/gcc/config/nios2/linux.h	2015-05-28 16:08:37.000000000 +0200
-+++ gcc-5.3.0/gcc/config/nios2/linux.h	2016-01-04 02:42:46.878844806 +0100
+From 5ca6df971f0f10411f986b5147b23918bf39583f Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Wed, 6 Jan 2016 03:13:29 +0100
+Subject: [PATCH 1/2] gcc5: Fix build on NIOS2
+
+The gcc 5.3 does not build on NIOS2 due to a missing MUSL_DYNAMIC_LINKER
+definition in it's config file. Add the definition to fix the build issue.
+The output produced during the failing build is as follows:
+
+g++    -isystem/b/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -static-libstdc++ -static-libgcc -L/b/tmp/sysroots/x86_64-linux/usr/lib -L/b/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/b/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/b/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcc-ar.o -o gcc-ar \
+        file-find.o libcommon.a ../libcpp/libcpp.a   ../libbacktrace/.libs/libbacktrace.a ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a
+In file included from ./tm.h:27:0,
+                 from /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:34:
+./config/linux.h:92:28: error: expected ',' or ';' before 'MUSL_DYNAMIC_LINKER'
+     BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
+                            ^
+./config/linux.h:59:60: note: in definition of macro 'CHOOSE_DYNAMIC_LINKER1'
+   "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1 "}}}"
+                                                            ^
+./config/linux.h:91:3: note: in expansion of macro 'CHOOSE_DYNAMIC_LINKER'
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, \
+   ^
+./config/nios2/linux.h:40:25: note: in expansion of macro 'GNU_USER_DYNAMIC_LINKER'
+       -dynamic-linker " GNU_USER_DYNAMIC_LINKER "} \
+                         ^
+/b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:884:32: note: in expansion of macro 'LINK_SPEC'
+ static const char *link_spec = LINK_SPEC;
+                                ^
+<command-line>:0:27: warning: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
+/b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:1295:48: note: in expansion of macro 'STANDARD_STARTFILE_PREFIX'
+ static char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+
+Upstream-Status: Pending
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ gcc/config/nios2/linux.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
+index f43f655..5587ab3 100644
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
 @@ -30,6 +30,7 @@
  #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
  
@@ -9,3 +48,6 @@ diff -Naru gcc-5.3.0.orig/gcc/config/nios2/linux.h gcc-5.3.0/gcc/config/nios2/li
  
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0048-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch b/meta/recipes-devtools/gcc/gcc-5.3/0048-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch
new file mode 100644
index 0000000..c18f40e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0048-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch
@@ -0,0 +1,307 @@
+From 536b8318974495cde2b42c3c2742748e2b271be0 Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 27 May 2015 13:25:01 +0000
+Subject: [PATCH] PR target/65358 Avoid clobbering partial argument during
+ sibcall
+
+	PR target/65358
+	* expr.c (memory_load_overlap): New function.
+	(emit_push_insn): When pushing partial args to the stack would
+	clobber the register part load the overlapping part into a pseudo
+	and put it into the hard reg after pushing.  Change return type
+	to bool.  Add bool argument.
+	* expr.h (emit_push_insn): Change return type to bool.
+	Add bool argument.
+	* calls.c (expand_call): Cancel sibcall optimization when encountering
+	partial argument on targets with ARGS_GROW_DOWNWARD and
+	!STACK_GROWS_DOWNWARD.
+	(emit_library_call_value_1): Update callsite of emit_push_insn.
+	(store_one_arg): Likewise.
+
+	PR target/65358
+	* gcc.dg/pr65358.c: New test.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@223753 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport from 6.0
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ gcc/calls.c                    | 17 ++++++--
+ gcc/expr.c                     | 90 +++++++++++++++++++++++++++++++++++++-----
+ gcc/expr.h                     |  4 +-
+ gcc/testsuite/gcc.dg/pr65358.c | 33 ++++++++++++++++
+ 4 files changed, 129 insertions(+), 15 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/pr65358.c
+
+diff --git a/gcc/calls.c b/gcc/calls.c
+index ee8ea5f..2334381 100644
+--- a/gcc/calls.c
++++ b/gcc/calls.c
+@@ -3236,6 +3236,14 @@ expand_call (tree exp, rtx target, int ignore)
+ 	    {
+ 	      rtx_insn *before_arg = get_last_insn ();
+ 
++	     /* On targets with weird calling conventions (e.g. PA) it's
++		hard to ensure that all cases of argument overlap between
++		stack and registers work.  Play it safe and bail out.  */
++#if defined(ARGS_GROW_DOWNWARD) && !defined(STACK_GROWS_DOWNWARD)
++		  sibcall_failure = 1;
++		  break;
++#endif
++
+ 	      if (store_one_arg (&args[i], argblock, flags,
+ 				 adjusted_args_size.var != 0,
+ 				 reg_parm_stack_space)
+@@ -4279,7 +4287,7 @@ emit_library_call_value_1 (int retval, rtx orgfun, rtx value,
+ 			  partial, reg, 0, argblock,
+ 			  GEN_INT (argvec[argnum].locate.offset.constant),
+ 			  reg_parm_stack_space,
+-			  ARGS_SIZE_RTX (argvec[argnum].locate.alignment_pad));
++			  ARGS_SIZE_RTX (argvec[argnum].locate.alignment_pad), false);
+ 
+ 	  /* Now mark the segment we just used.  */
+ 	  if (ACCUMULATE_OUTGOING_ARGS)
+@@ -4886,10 +4894,11 @@ store_one_arg (struct arg_data *arg, rtx argblock, int flags,
+ 
+       /* This isn't already where we want it on the stack, so put it there.
+ 	 This can either be done with push or copy insns.  */
+-      emit_push_insn (arg->value, arg->mode, TREE_TYPE (pval), NULL_RTX,
++      if (!emit_push_insn (arg->value, arg->mode, TREE_TYPE (pval), NULL_RTX,
+ 		      parm_align, partial, reg, used - size, argblock,
+ 		      ARGS_SIZE_RTX (arg->locate.offset), reg_parm_stack_space,
+-		      ARGS_SIZE_RTX (arg->locate.alignment_pad));
++		      ARGS_SIZE_RTX (arg->locate.alignment_pad), true))
++	sibcall_failure = 1;
+ 
+       /* Unless this is a partially-in-register argument, the argument is now
+ 	 in the stack.  */
+@@ -5001,7 +5010,7 @@ store_one_arg (struct arg_data *arg, rtx argblock, int flags,
+       emit_push_insn (arg->value, arg->mode, TREE_TYPE (pval), size_rtx,
+ 		      parm_align, partial, reg, excess, argblock,
+ 		      ARGS_SIZE_RTX (arg->locate.offset), reg_parm_stack_space,
+-		      ARGS_SIZE_RTX (arg->locate.alignment_pad));
++		      ARGS_SIZE_RTX (arg->locate.alignment_pad), false);
+ 
+       /* Unless this is a partially-in-register argument, the argument is now
+ 	 in the stack.
+diff --git a/gcc/expr.c b/gcc/expr.c
+index 5c09550..24a6293 100644
+--- a/gcc/expr.c
++++ b/gcc/expr.c
+@@ -4121,12 +4121,35 @@ emit_single_push_insn (machine_mode mode, rtx x, tree type)
+ }
+ #endif
+ 
++/* If reading SIZE bytes from X will end up reading from
++   Y return the number of bytes that overlap.  Return -1
++   if there is no overlap or -2 if we can't determine
++   (for example when X and Y have different base registers).  */
++
++static int
++memory_load_overlap (rtx x, rtx y, HOST_WIDE_INT size)
++{
++  rtx tmp = plus_constant (Pmode, x, size);
++  rtx sub = simplify_gen_binary (MINUS, Pmode, tmp, y);
++
++  if (!CONST_INT_P (sub))
++    return -2;
++
++  HOST_WIDE_INT val = INTVAL (sub);
++
++  return IN_RANGE (val, 1, size) ? val : -1;
++}
++
+ /* Generate code to push X onto the stack, assuming it has mode MODE and
+    type TYPE.
+    MODE is redundant except when X is a CONST_INT (since they don't
+    carry mode info).
+    SIZE is an rtx for the size of data to be copied (in bytes),
+    needed only if X is BLKmode.
++   Return true if successful.  May return false if asked to push a
++   partial argument during a sibcall optimization (as specified by
++   SIBCALL_P) and the incoming and outgoing pointers cannot be shown
++   to not overlap.
+ 
+    ALIGN (in bits) is maximum alignment we can assume.
+ 
+@@ -4152,11 +4175,11 @@ emit_single_push_insn (machine_mode mode, rtx x, tree type)
+    for arguments passed in registers.  If nonzero, it will be the number
+    of bytes required.  */
+ 
+-void
++bool
+ emit_push_insn (rtx x, machine_mode mode, tree type, rtx size,
+ 		unsigned int align, int partial, rtx reg, int extra,
+ 		rtx args_addr, rtx args_so_far, int reg_parm_stack_space,
+-		rtx alignment_pad)
++		rtx alignment_pad, bool sibcall_p)
+ {
+   rtx xinner;
+   enum direction stack_direction
+@@ -4179,6 +4202,10 @@ emit_push_insn (rtx x, machine_mode mode, tree type, rtx size,
+ 
+   xinner = x;
+ 
++  int nregs = partial / UNITS_PER_WORD;
++  rtx *tmp_regs = NULL;
++  int overlapping = 0;
++
+   if (mode == BLKmode
+       || (STRICT_ALIGNMENT && align < GET_MODE_ALIGNMENT (mode)))
+     {
+@@ -4309,6 +4336,43 @@ emit_push_insn (rtx x, machine_mode mode, tree type, rtx size,
+ 	     PARM_BOUNDARY.  Assume the caller isn't lying.  */
+ 	  set_mem_align (target, align);
+ 
++	  /* If part should go in registers and pushing to that part would
++	     overwrite some of the values that need to go into regs, load the
++	     overlapping values into temporary pseudos to be moved into the hard
++	     regs at the end after the stack pushing has completed.
++	     We cannot load them directly into the hard regs here because
++	     they can be clobbered by the block move expansions.
++	     See PR 65358.  */
++
++	  if (partial > 0 && reg != 0 && mode == BLKmode
++	      && GET_CODE (reg) != PARALLEL)
++	    {
++	      overlapping = memory_load_overlap (XEXP (x, 0), temp, partial);
++	      if (overlapping > 0)
++	        {
++		  gcc_assert (overlapping % UNITS_PER_WORD == 0);
++		  overlapping /= UNITS_PER_WORD;
++
++		  tmp_regs = XALLOCAVEC (rtx, overlapping);
++
++		  for (int i = 0; i < overlapping; i++)
++		    tmp_regs[i] = gen_reg_rtx (word_mode);
++
++		  for (int i = 0; i < overlapping; i++)
++		    emit_move_insn (tmp_regs[i],
++				    operand_subword_force (target, i, mode));
++	        }
++	      else if (overlapping == -1)
++		overlapping = 0;
++	      /* Could not determine whether there is overlap.
++	         Fail the sibcall.  */
++	      else
++		{
++		  overlapping = 0;
++		  if (sibcall_p)
++		    return false;
++		}
++	    }
+ 	  emit_block_move (target, xinner, size, BLOCK_OP_CALL_PARM);
+ 	}
+     }
+@@ -4363,12 +4427,13 @@ emit_push_insn (rtx x, machine_mode mode, tree type, rtx size,
+ 	 has a size a multiple of a word.  */
+       for (i = size - 1; i >= not_stack; i--)
+ 	if (i >= not_stack + offset)
+-	  emit_push_insn (operand_subword_force (x, i, mode),
++	  if (!emit_push_insn (operand_subword_force (x, i, mode),
+ 			  word_mode, NULL_TREE, NULL_RTX, align, 0, NULL_RTX,
+ 			  0, args_addr,
+ 			  GEN_INT (args_offset + ((i - not_stack + skip)
+ 						  * UNITS_PER_WORD)),
+-			  reg_parm_stack_space, alignment_pad);
++			  reg_parm_stack_space, alignment_pad, sibcall_p))
++	    return false;
+     }
+   else
+     {
+@@ -4411,9 +4476,8 @@ emit_push_insn (rtx x, machine_mode mode, tree type, rtx size,
+ 	}
+     }
+ 
+-  /* If part should go in registers, copy that part
+-     into the appropriate registers.  Do this now, at the end,
+-     since mem-to-mem copies above may do function calls.  */
++  /* Move the partial arguments into the registers and any overlapping
++     values that we moved into the pseudos in tmp_regs.  */
+   if (partial > 0 && reg != 0)
+     {
+       /* Handle calls that pass values in multiple non-contiguous locations.
+@@ -4421,9 +4485,15 @@ emit_push_insn (rtx x, machine_mode mode, tree type, rtx size,
+       if (GET_CODE (reg) == PARALLEL)
+ 	emit_group_load (reg, x, type, -1);
+       else
+-	{
++        {
+ 	  gcc_assert (partial % UNITS_PER_WORD == 0);
+-	  move_block_to_reg (REGNO (reg), x, partial / UNITS_PER_WORD, mode);
++	  move_block_to_reg (REGNO (reg), x, nregs - overlapping, mode);
++
++	  for (int i = 0; i < overlapping; i++)
++	    emit_move_insn (gen_rtx_REG (word_mode, REGNO (reg)
++						    + nregs - overlapping + i),
++			    tmp_regs[i]);
++
+ 	}
+     }
+ 
+@@ -4432,6 +4502,8 @@ emit_push_insn (rtx x, machine_mode mode, tree type, rtx size,
+ 
+   if (alignment_pad && args_addr == 0)
+     anti_adjust_stack (alignment_pad);
++
++  return true;
+ }
+ 
+ /* Return X if X can be used as a subtarget in a sequence of arithmetic
+diff --git a/gcc/expr.h b/gcc/expr.h
+index 867852e..5fcc13f 100644
+--- a/gcc/expr.h
++++ b/gcc/expr.h
+@@ -218,8 +218,8 @@ extern rtx emit_move_resolve_push (machine_mode, rtx);
+ extern rtx push_block (rtx, int, int);
+ 
+ /* Generate code to push something onto the stack, given its mode and type.  */
+-extern void emit_push_insn (rtx, machine_mode, tree, rtx, unsigned int,
+-			    int, rtx, int, rtx, rtx, int, rtx);
++extern bool emit_push_insn (rtx, machine_mode, tree, rtx, unsigned int,
++			    int, rtx, int, rtx, rtx, int, rtx, bool);
+ 
+ /* Expand an assignment that stores the value of FROM into TO.  */
+ extern void expand_assignment (tree, tree, bool);
+diff --git a/gcc/testsuite/gcc.dg/pr65358.c b/gcc/testsuite/gcc.dg/pr65358.c
+new file mode 100644
+index 0000000..ba89fd4
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/pr65358.c
+@@ -0,0 +1,33 @@
++/* { dg-do run } */
++/* { dg-options "-O2" } */
++
++struct pack
++{
++  int fine;
++  int victim;
++  int killer;
++};
++
++int __attribute__ ((__noinline__, __noclone__))
++bar (int a, int b, struct pack p)
++{
++  if (a != 20 || b != 30)
++    __builtin_abort ();
++  if (p.fine != 40 || p.victim != 50 || p.killer != 60)
++    __builtin_abort ();
++  return 0;
++}
++
++int __attribute__ ((__noinline__, __noclone__))
++foo (int arg1, int arg2, int arg3, struct pack p)
++{
++  return bar (arg2, arg3, p);
++}
++
++int main (void)
++{
++  struct pack p = { 40, 50, 60 };
++
++  (void) foo (10, 20, 30, p);
++  return 0;
++}
+-- 
+2.7.0
+
-- 
2.7.0


