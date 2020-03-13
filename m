Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A3CA160FCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 01:09:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2020 18:09:47 -0700
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; d="scan'208";a="322652360"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.74.239])
	by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2020 18:09:45 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 09:09:39 +0800
Message-Id: <20200313010939.586772-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313010939.586772-1-anuj.mittal@intel.com>
References: <20200313010939.586772-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] binutils: fix CVE-2020-0551
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
X-List-Received-Date: Fri, 13 Mar 2020 01:09:45 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2020-0551.patch     | 549 ++++++++++++++++++
 2 files changed, 550 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index eaaa5ed2ac..ed9f902fd2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -40,6 +40,7 @@ SRC_URI = "\
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
+     file://CVE-2020-0551.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch
new file mode 100644
index 0000000000..53e3caf445
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch
@@ -0,0 +1,549 @@
+From ae531041c7c5956672342f89c486a011c84f027f Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Wed, 11 Mar 2020 09:46:19 -0700
+Subject: [PATCH 1/1] i386: Generate lfence with load/indirect branch/ret
+ [CVE-2020-0551]
+
+Add 3 command-line options to generate lfence for load, indirect near
+branch and ret to help mitigate:
+
+https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00334.html
+http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-0551
+
+1. -mlfence-after-load=[no|yes]:
+  -mlfence-after-load=yes generates lfence after load instructions.
+2. -mlfence-before-indirect-branch=[none|all|memory|register]:
+  a. -mlfence-before-indirect-branch=all generates lfence before indirect
+  near branches via register and a warning before indirect near branches
+  via memory.
+  b. -mlfence-before-indirect-branch=memory issue a warning before
+  indirect near branches via memory.
+  c. -mlfence-before-indirect-branch=register generates lfence before
+  indirect near branches via register.
+Note that lfence won't be generated before indirect near branches via
+register with -mlfence-after-load=yes since lfence will be generated
+after loading branch target register.
+3. -mlfence-before-ret=[none|or|not]
+  a. -mlfence-before-ret=or generates or with lfence before ret.
+  b. -mlfence-before-ret=not generates not with lfence before ret.
+
+A warning will be issued and lfence won't be generated before indirect
+near branch and ret if the previous item is a prefix or a constant
+directive, which may be used to hardcode an instruction, since there
+is no clear instruction boundary.
+
+	* config/tc-i386.c (lfence_after_load): New.
+	(lfence_before_indirect_branch_kind): New.
+	(lfence_before_indirect_branch): New.
+	(lfence_before_ret_kind): New.
+	(lfence_before_ret): New.
+	(last_insn): New.
+	(load_insn_p): New.
+	(insert_lfence_after): New.
+	(insert_lfence_before): New.
+	(md_assemble): Call insert_lfence_before and insert_lfence_after.
+	Set last_insn.
+	(OPTION_MLFENCE_AFTER_LOAD): New.
+	(OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH): New.
+	(OPTION_MLFENCE_BEFORE_RET): New.
+	(md_longopts): Add -mlfence-after-load=,
+	-mlfence-before-indirect-branch= and -mlfence-before-ret=.
+	(md_parse_option): Handle -mlfence-after-load=,
+	-mlfence-before-indirect-branch= and -mlfence-before-ret=.
+	(md_show_usage): Display -mlfence-after-load=,
+	-mlfence-before-indirect-branch= and -mlfence-before-ret=.
+	(i386_cons_align): New.
+	* config/tc-i386.h (i386_cons_align): New.
+	(md_cons_align): New.
+	* doc/c-i386.texi: Document -mlfence-after-load=,
+	-mlfence-before-indirect-branch= and -mlfence-before-ret=.
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ae531041c7c5956672342f89c486a011c84f027f]
+CVE: CVE-2020-0551
+---
+diff --git a/gas/config/tc-i386.c b/gas/config/tc-i386.c
+index b020f39c863..09063f784b7 100644
+--- a/gas/config/tc-i386.c
++++ b/gas/config/tc-i386.c
+@@ -629,7 +629,29 @@ static int omit_lock_prefix = 0;
+    "lock addl $0, (%{re}sp)".  */
+ static int avoid_fence = 0;
+ 
+-/* Type of the previous instruction.  */
++/* 1 if lfence should be inserted after every load.  */
++static int lfence_after_load = 0;
++
++/* Non-zero if lfence should be inserted before indirect branch.  */
++static enum lfence_before_indirect_branch_kind
++  {
++    lfence_branch_none = 0,
++    lfence_branch_register,
++    lfence_branch_memory,
++    lfence_branch_all
++  }
++lfence_before_indirect_branch;
++
++/* Non-zero if lfence should be inserted before ret.  */
++static enum lfence_before_ret_kind
++  {
++    lfence_before_ret_none = 0,
++    lfence_before_ret_not,
++    lfence_before_ret_or
++  }
++lfence_before_ret;
++
++/* Types of previous instruction is .byte or prefix.  */
+ static struct
+   {
+     segT seg;
+@@ -4311,6 +4333,283 @@ optimize_encoding (void)
+     }
+ }
+ 
++/* Return non-zero for load instruction.  */
++
++static int
++load_insn_p (void)
++{
++  unsigned int dest;
++  int any_vex_p = is_any_vex_encoding (&i.tm);
++  unsigned int base_opcode = i.tm.base_opcode | 1;
++
++  if (!any_vex_p)
++    {
++      /* lea  */
++      if (i.tm.base_opcode == 0x8d)
++	return 0;
++
++      /* pop  */
++      if ((i.tm.base_opcode & ~7) == 0x58
++	  || (i.tm.base_opcode == 0x8f && i.tm.extension_opcode == 0))
++	return 1;
++
++      /* movs, cmps, lods, scas.  */
++      if ((i.tm.base_opcode | 0xb) == 0xaf)
++	return 1;
++
++      /* outs */
++      if (base_opcode == 0x6f)
++	return 1;
++    }
++
++  /* No memory operand.  */
++  if (!i.mem_operands)
++    return 0;
++
++  if (any_vex_p)
++    {
++      /* vldmxcsr.  */
++      if (i.tm.base_opcode == 0xae
++	  && i.tm.opcode_modifier.vex
++	  && i.tm.opcode_modifier.vexopcode == VEX0F
++	  && i.tm.extension_opcode == 2)
++	return 1;
++    }
++  else
++    {
++      /* test, not, neg, mul, imul, div, idiv.  */
++      if ((i.tm.base_opcode == 0xf6 || i.tm.base_opcode == 0xf7)
++	  && i.tm.extension_opcode != 1)
++	return 1;
++
++      /* inc, dec.  */
++      if (base_opcode == 0xff && i.tm.extension_opcode <= 1)
++	return 1;
++
++      /* add, or, adc, sbb, and, sub, xor, cmp.  */
++      if (i.tm.base_opcode >= 0x80 && i.tm.base_opcode <= 0x83)
++	return 1;
++
++      /* bt, bts, btr, btc.  */
++      if (i.tm.base_opcode == 0xfba
++	  && (i.tm.extension_opcode >= 4 && i.tm.extension_opcode <= 7))
++	return 1;
++
++      /* rol, ror, rcl, rcr, shl/sal, shr, sar. */
++      if ((base_opcode == 0xc1
++	   || (i.tm.base_opcode >= 0xd0 && i.tm.base_opcode <= 0xd3))
++	  && i.tm.extension_opcode != 6)
++	return 1;
++
++      /* cmpxchg8b, cmpxchg16b, xrstors.  */
++      if (i.tm.base_opcode == 0xfc7
++	  && (i.tm.extension_opcode == 1 || i.tm.extension_opcode == 3))
++	return 1;
++
++      /* fxrstor, ldmxcsr, xrstor.  */
++      if (i.tm.base_opcode == 0xfae
++	  && (i.tm.extension_opcode == 1
++	      || i.tm.extension_opcode == 2
++	      || i.tm.extension_opcode == 5))
++	return 1;
++
++      /* lgdt, lidt, lmsw.  */
++      if (i.tm.base_opcode == 0xf01
++	  && (i.tm.extension_opcode == 2
++	      || i.tm.extension_opcode == 3
++	      || i.tm.extension_opcode == 6))
++	return 1;
++
++      /* vmptrld */
++      if (i.tm.base_opcode == 0xfc7
++	  && i.tm.extension_opcode == 6)
++	return 1;
++
++      /* Check for x87 instructions.  */
++      if (i.tm.base_opcode >= 0xd8 && i.tm.base_opcode <= 0xdf)
++	{
++	  /* Skip fst, fstp, fstenv, fstcw.  */
++	  if (i.tm.base_opcode == 0xd9
++	      && (i.tm.extension_opcode == 2
++		  || i.tm.extension_opcode == 3
++		  || i.tm.extension_opcode == 6
++		  || i.tm.extension_opcode == 7))
++	    return 0;
++
++	  /* Skip fisttp, fist, fistp, fstp.  */
++	  if (i.tm.base_opcode == 0xdb
++	      && (i.tm.extension_opcode == 1
++		  || i.tm.extension_opcode == 2
++		  || i.tm.extension_opcode == 3
++		  || i.tm.extension_opcode == 7))
++	    return 0;
++
++	  /* Skip fisttp, fst, fstp, fsave, fstsw.  */
++	  if (i.tm.base_opcode == 0xdd
++	      && (i.tm.extension_opcode == 1
++		  || i.tm.extension_opcode == 2
++		  || i.tm.extension_opcode == 3
++		  || i.tm.extension_opcode == 6
++		  || i.tm.extension_opcode == 7))
++	    return 0;
++
++	  /* Skip fisttp, fist, fistp, fbstp, fistp.  */
++	  if (i.tm.base_opcode == 0xdf
++	      && (i.tm.extension_opcode == 1
++		  || i.tm.extension_opcode == 2
++		  || i.tm.extension_opcode == 3
++		  || i.tm.extension_opcode == 6
++		  || i.tm.extension_opcode == 7))
++	    return 0;
++
++	  return 1;
++	}
++    }
++
++  dest = i.operands - 1;
++
++  /* Check fake imm8 operand and 3 source operands.  */
++  if ((i.tm.opcode_modifier.immext
++       || i.tm.opcode_modifier.vexsources == VEX3SOURCES)
++      && i.types[dest].bitfield.imm8)
++    dest--;
++
++  /* add, or, adc, sbb, and, sub, xor, cmp, test, xchg, xadd  */
++  if (!any_vex_p
++      && (base_opcode == 0x1
++	  || base_opcode == 0x9
++	  || base_opcode == 0x11
++	  || base_opcode == 0x19
++	  || base_opcode == 0x21
++	  || base_opcode == 0x29
++	  || base_opcode == 0x31
++	  || base_opcode == 0x39
++	  || (i.tm.base_opcode >= 0x84 && i.tm.base_opcode <= 0x87)
++	  || base_opcode == 0xfc1))
++    return 1;
++
++  /* Check for load instruction.  */
++  return (i.types[dest].bitfield.class != ClassNone
++	  || i.types[dest].bitfield.instance == Accum);
++}
++
++/* Output lfence, 0xfaee8, after instruction.  */
++
++static void
++insert_lfence_after (void)
++{
++  if (lfence_after_load && load_insn_p ())
++    {
++      char *p = frag_more (3);
++      *p++ = 0xf;
++      *p++ = 0xae;
++      *p = 0xe8;
++    }
++}
++
++/* Output lfence, 0xfaee8, before instruction.  */
++
++static void
++insert_lfence_before (void)
++{
++  char *p;
++
++  if (is_any_vex_encoding (&i.tm))
++    return;
++
++  if (i.tm.base_opcode == 0xff
++      && (i.tm.extension_opcode == 2 || i.tm.extension_opcode == 4))
++    {
++      /* Insert lfence before indirect branch if needed.  */
++
++      if (lfence_before_indirect_branch == lfence_branch_none)
++	return;
++
++      if (i.operands != 1)
++	abort ();
++
++      if (i.reg_operands == 1)
++	{
++	  /* Indirect branch via register.  Don't insert lfence with
++	     -mlfence-after-load=yes.  */
++	  if (lfence_after_load
++	      || lfence_before_indirect_branch == lfence_branch_memory)
++	    return;
++	}
++      else if (i.mem_operands == 1
++	       && lfence_before_indirect_branch != lfence_branch_register)
++	{
++	  as_warn (_("indirect `%s` with memory operand should be avoided"),
++		   i.tm.name);
++	  return;
++	}
++      else
++	return;
++
++      if (last_insn.kind != last_insn_other
++	  && last_insn.seg == now_seg)
++	{
++	  as_warn_where (last_insn.file, last_insn.line,
++			 _("`%s` skips -mlfence-before-indirect-branch on `%s`"),
++			 last_insn.name, i.tm.name);
++	  return;
++	}
++
++      p = frag_more (3);
++      *p++ = 0xf;
++      *p++ = 0xae;
++      *p = 0xe8;
++      return;
++    }
++
++  /* Output or/not and lfence before ret.  */
++  if (lfence_before_ret != lfence_before_ret_none
++      && (i.tm.base_opcode == 0xc2
++	  || i.tm.base_opcode == 0xc3
++	  || i.tm.base_opcode == 0xca
++	  || i.tm.base_opcode == 0xcb))
++    {
++      if (last_insn.kind != last_insn_other
++	  && last_insn.seg == now_seg)
++	{
++	  as_warn_where (last_insn.file, last_insn.line,
++			 _("`%s` skips -mlfence-before-ret on `%s`"),
++			 last_insn.name, i.tm.name);
++	  return;
++	}
++      if (lfence_before_ret == lfence_before_ret_or)
++	{
++	  /* orl: 0x830c2400.  */
++	  p = frag_more ((flag_code == CODE_64BIT ? 1 : 0) + 4 + 3);
++	  if (flag_code == CODE_64BIT)
++	    *p++ = 0x48;
++	  *p++ = 0x83;
++	  *p++ = 0xc;
++	  *p++ = 0x24;
++	  *p++ = 0x0;
++	}
++      else
++	{
++	  p = frag_more ((flag_code == CODE_64BIT ? 2 : 0) + 6 + 3);
++	  /* notl: 0xf71424.  */
++	  if (flag_code == CODE_64BIT)
++	    *p++ = 0x48;
++	  *p++ = 0xf7;
++	  *p++ = 0x14;
++	  *p++ = 0x24;
++	  /* notl: 0xf71424.  */
++	  if (flag_code == CODE_64BIT)
++	    *p++ = 0x48;
++	  *p++ = 0xf7;
++	  *p++ = 0x14;
++	  *p++ = 0x24;
++	}
++      *p++ = 0xf;
++      *p++ = 0xae;
++      *p = 0xe8;
++    }
++}
++
+ /* This is the guts of the machine-dependent assembler.  LINE points to a
+    machine dependent instruction.  This function is supposed to emit
+    the frags/bytes it assembles to.  */
+@@ -4628,9 +4927,13 @@ md_assemble (char *line)
+   if (i.rex != 0)
+     add_prefix (REX_OPCODE | i.rex);
+ 
++  insert_lfence_before ();
++
+   /* We are ready to output the insn.  */
+   output_insn ();
+ 
++  insert_lfence_after ();
++
+   last_insn.seg = now_seg;
+ 
+   if (i.tm.opcode_modifier.isprefix)
+@@ -12250,6 +12553,9 @@ const char *md_shortopts = "qnO::";
+ #define OPTION_MALIGN_BRANCH_PREFIX_SIZE (OPTION_MD_BASE + 28)
+ #define OPTION_MALIGN_BRANCH (OPTION_MD_BASE + 29)
+ #define OPTION_MBRANCHES_WITH_32B_BOUNDARIES (OPTION_MD_BASE + 30)
++#define OPTION_MLFENCE_AFTER_LOAD (OPTION_MD_BASE + 31)
++#define OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH (OPTION_MD_BASE + 32)
++#define OPTION_MLFENCE_BEFORE_RET (OPTION_MD_BASE + 33)
+ 
+ struct option md_longopts[] =
+ {
+@@ -12289,6 +12595,10 @@ struct option md_longopts[] =
+   {"malign-branch-prefix-size", required_argument, NULL, OPTION_MALIGN_BRANCH_PREFIX_SIZE},
+   {"malign-branch", required_argument, NULL, OPTION_MALIGN_BRANCH},
+   {"mbranches-within-32B-boundaries", no_argument, NULL, OPTION_MBRANCHES_WITH_32B_BOUNDARIES},
++  {"mlfence-after-load", required_argument, NULL, OPTION_MLFENCE_AFTER_LOAD},
++  {"mlfence-before-indirect-branch", required_argument, NULL,
++   OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH},
++  {"mlfence-before-ret", required_argument, NULL, OPTION_MLFENCE_BEFORE_RET},
+   {"mamd64", no_argument, NULL, OPTION_MAMD64},
+   {"mintel64", no_argument, NULL, OPTION_MINTEL64},
+   {NULL, no_argument, NULL, 0}
+@@ -12668,6 +12978,41 @@ md_parse_option (int c, const char *arg)
+         as_fatal (_("invalid -mfence-as-lock-add= option: `%s'"), arg);
+       break;
+ 
++    case OPTION_MLFENCE_AFTER_LOAD:
++      if (strcasecmp (arg, "yes") == 0)
++	lfence_after_load = 1;
++      else if (strcasecmp (arg, "no") == 0)
++	lfence_after_load = 0;
++      else
++        as_fatal (_("invalid -mlfence-after-load= option: `%s'"), arg);
++      break;
++
++    case OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH:
++      if (strcasecmp (arg, "all") == 0)
++	lfence_before_indirect_branch = lfence_branch_all;
++      else if (strcasecmp (arg, "memory") == 0)
++	lfence_before_indirect_branch = lfence_branch_memory;
++      else if (strcasecmp (arg, "register") == 0)
++	lfence_before_indirect_branch = lfence_branch_register;
++      else if (strcasecmp (arg, "none") == 0)
++	lfence_before_indirect_branch = lfence_branch_none;
++      else
++        as_fatal (_("invalid -mlfence-before-indirect-branch= option: `%s'"),
++		  arg);
++      break;
++
++    case OPTION_MLFENCE_BEFORE_RET:
++      if (strcasecmp (arg, "or") == 0)
++	lfence_before_ret = lfence_before_ret_or;
++      else if (strcasecmp (arg, "not") == 0)
++	lfence_before_ret = lfence_before_ret_not;
++      else if (strcasecmp (arg, "none") == 0)
++	lfence_before_ret = lfence_before_ret_none;
++      else
++        as_fatal (_("invalid -mlfence-before-ret= option: `%s'"),
++		  arg);
++      break;
++
+     case OPTION_MRELAX_RELOCATIONS:
+       if (strcasecmp (arg, "yes") == 0)
+         generate_relax_relocations = 1;
+@@ -13025,6 +13370,15 @@ md_show_usage (FILE *stream)
+   -mbranches-within-32B-boundaries\n\
+                           align branches within 32 byte boundary\n"));
+   fprintf (stream, _("\
++  -mlfence-after-load=[no|yes] (default: no)\n\
++                          generate lfence after load\n"));
++  fprintf (stream, _("\
++  -mlfence-before-indirect-branch=[none|all|register|memory] (default: none)\n\
++                          generate lfence before indirect near branch\n"));
++  fprintf (stream, _("\
++  -mlfence-before-ret=[none|or|not] (default: none)\n\
++                          generate lfence before ret\n"));
++  fprintf (stream, _("\
+   -mamd64                 accept only AMD64 ISA [default]\n"));
+   fprintf (stream, _("\
+   -mintel64               accept only Intel64 ISA\n"));
+@@ -13254,6 +13608,16 @@ i386_cons_align (int ignore ATTRIBUTE_UNUSED)
+       last_insn.kind = last_insn_directive;
+       last_insn.name = "constant directive";
+       last_insn.file = as_where (&last_insn.line);
++      if (lfence_before_ret != lfence_before_ret_none)
++	{
++	  if (lfence_before_indirect_branch != lfence_branch_none)
++	    as_warn (_("constant directive skips -mlfence-before-ret "
++		       "and -mlfence-before-indirect-branch"));
++	  else
++	    as_warn (_("constant directive skips -mlfence-before-ret"));
++	}
++      else if (lfence_before_indirect_branch != lfence_branch_none)
++	as_warn (_("constant directive skips -mlfence-before-indirect-branch"));
+     }
+ }
+ 
+diff --git a/gas/doc/c-i386.texi b/gas/doc/c-i386.texi
+index c536759cb38..1dd99f91bb0 100644
+--- a/gas/doc/c-i386.texi
++++ b/gas/doc/c-i386.texi
+@@ -464,6 +464,49 @@ on an instruction.  It is equivalent to
+ @option{-malign-branch-prefix-size=5}.
+ The default doesn't align branches.
+ 
++@cindex @samp{-mlfence-after-load=} option, i386
++@cindex @samp{-mlfence-after-load=} option, x86-64
++@item -mlfence-after-load=@var{no}
++@itemx -mlfence-after-load=@var{yes}
++These options control whether the assembler should generate lfence
++after load instructions.  @option{-mlfence-after-load=@var{yes}} will
++generate lfence.  @option{-mlfence-after-load=@var{no}} will not generate
++lfence, which is the default.
++
++@cindex @samp{-mlfence-before-indirect-branch=} option, i386
++@cindex @samp{-mlfence-before-indirect-branch=} option, x86-64
++@item -mlfence-before-indirect-branch=@var{none}
++@item -mlfence-before-indirect-branch=@var{all}
++@item -mlfence-before-indirect-branch=@var{register}
++@itemx -mlfence-before-indirect-branch=@var{memory}
++These options control whether the assembler should generate lfence
++after indirect near branch instructions.
++@option{-mlfence-before-indirect-branch=@var{all}} will generate lfence
++after indirect near branch via register and issue a warning before
++indirect near branch via memory.
++@option{-mlfence-before-indirect-branch=@var{register}} will generate
++lfence after indirect near branch via register.
++@option{-mlfence-before-indirect-branch=@var{memory}} will issue a
++warning before indirect near branch via memory.
++@option{-mlfence-before-indirect-branch=@var{none}} will not generate
++lfence nor issue warning, which is the default.  Note that lfence won't
++be generated before indirect near branch via register with
++@option{-mlfence-after-load=@var{yes}} since lfence will be generated
++after loading branch target register.
++
++@cindex @samp{-mlfence-before-ret=} option, i386
++@cindex @samp{-mlfence-before-ret=} option, x86-64
++@item -mlfence-before-ret=@var{none}
++@item -mlfence-before-ret=@var{or}
++@itemx -mlfence-before-ret=@var{not}
++These options control whether the assembler should generate lfence
++before ret.  @option{-mlfence-before-ret=@var{or}} will generate
++generate or instruction with lfence.
++@option{-mlfence-before-ret=@var{not}} will generate not instruction
++with lfence.
++@option{-mlfence-before-ret=@var{none}} will not generate lfence,
++which is the default.
++
+ @cindex @samp{-mx86-used-note=} option, i386
+ @cindex @samp{-mx86-used-note=} option, x86-64
+ @item -mx86-used-note=@var{no}
+-- 
+2.18.2
-- 
2.24.1


