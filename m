Return-Path: <radu.moisan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 256BD6AD81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 14:56:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2013 07:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="360532276"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2013 07:57:03 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 17:57:46 +0300
Message-Id: <9cbdde6a3686e150de6cb583d5be7f47408258a0.1372947733.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
In-Reply-To: <cover.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
Subject: [PATCH 03/11] elfutils: Upgrade to v0.155
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
X-List-Received-Date: Thu, 04 Jul 2013 14:56:12 -0000

*license changed to GPLv3
*several patches were absolete so I removed them
*redhat-portability & redhat-robustify backported from
 latest elfutils-portability & elfutils-robustify from
 upstream

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../elfutils/elfutils-0.155/arm_backend.diff       |  450 +++++
 .../elfutils/elfutils-0.155/do-autoreconf.diff     |  215 +++
 .../elfutils/elfutils-0.155/dso-link-change.patch  |   32 +
 .../elfutils/elfutils-0.155/elf_additions.diff     |   61 +
 .../elfutils-ar-c-fix-num-passed-to-memset.patch   |   23 +
 .../elfutils-0.155/elfutils-robustify.patch        | 1756 +++++++++++++++++++
 .../elfutils/elfutils-0.155/hppa_backend.diff      |  796 +++++++++
 .../elfutils/elfutils-0.155/i386_dis.h             | 1657 ++++++++++++++++++
 .../elfutils/elfutils-0.155/m68k_backend.diff      |  303 ++++
 .../elfutils/elfutils-0.155/mempcpy.patch          |   24 +
 .../elfutils/elfutils-0.155/mips_backend.diff      |  708 ++++++++
 ...ssed-to-snprintf-for-invalid-sh_name-case.patch |   27 +
 .../elfutils-0.155/redhat-portability.diff         | 1775 +++++++++++++++++++
 .../elfutils/elfutils-0.155/redhat-robustify.diff  | 1824 ++++++++++++++++++++
 .../elfutils/elfutils-0.155/uclibc-support.patch   |   91 +
 .../elfutils/elfutils-0.155/x86_64_dis.h           | 1632 ++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.155.bb   |   84 +
 17 files changed, 11458 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/arm_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/do-autoreconf.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/dso-link-change.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/elf_additions.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-ar-c-fix-num-passed-to-memset.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-robustify.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/i386_dis.h
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/mempcpy.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/redhat-robustify.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/uclibc-support.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/x86_64_dis.h
 create mode 100644 meta/recipes-devtools/elfutils/elfutils_0.155.bb

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/arm_backend.diff
new file mode 100644
index 0000000..46d42fa
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/arm_backend.diff
@@ -0,0 +1,450 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.155/backends/arm_init.c
+===================================================================
+--- elfutils-0.155.orig/backends/arm_init.c
++++ elfutils-0.155/backends/arm_init.c
+@@ -35,21 +35,32 @@
+ #define RELOC_PREFIX	R_ARM_
+ #include "libebl_CPU.h"
+ 
++#include "libebl_arm.h"
++
+ /* This defines the common reloc hooks based on arm_reloc.def.  */
+ #include "common-reloc.c"
+ 
+ 
+ const char *
+ arm_init (elf, machine, eh, ehlen)
+-     Elf *elf __attribute__ ((unused));
++     Elf *elf;
+      GElf_Half machine __attribute__ ((unused));
+      Ebl *eh;
+      size_t ehlen;
+ {
++  int soft_float = 0;
++
+   /* Check whether the Elf_BH object has a sufficent size.  */
+   if (ehlen < sizeof (Ebl))
+     return NULL;
+ 
++  if (elf) {
++    GElf_Ehdr ehdr_mem;
++    GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
++    if (ehdr && (ehdr->e_flags & EF_ARM_SOFT_FLOAT))
++      soft_float = 1;
++  }
++
+   /* We handle it.  */
+   eh->name = "ARM";
+   arm_init_reloc (eh);
+@@ -61,7 +72,10 @@ arm_init (elf, machine, eh, ehlen)
+   HOOK (eh, core_note);
+   HOOK (eh, auxv_info);
+   HOOK (eh, check_object_attribute);
+-  HOOK (eh, return_value_location);
++  if (soft_float)
++    eh->return_value_location = arm_return_value_location_soft;
++  else
++    eh->return_value_location = arm_return_value_location_hard;
+ 
+   return MODVERSION;
+ }
+Index: elfutils-0.155/backends/arm_regs.c
+===================================================================
+--- elfutils-0.155.orig/backends/arm_regs.c
++++ elfutils-0.155/backends/arm_regs.c
+@@ -31,6 +31,7 @@
+ #endif
+ 
+ #include <string.h>
++#include <stdio.h>
+ #include <dwarf.h>
+ 
+ #define BACKEND arm_
+@@ -61,7 +62,15 @@ arm_register_info (Ebl *ebl __attribute_
+       namelen = 2;
+       break;
+ 
+-    case 10 ... 12:
++    case 10 ... 11:
++      name[0] = 'r';
++      name[1] = '1';
++      name[2] = regno % 10 + '0';
++      namelen = 3;
++      break;
++
++    case 12:
++      *type = DW_ATE_unsigned;
+       name[0] = 'r';
+       name[1] = '1';
+       name[2] = regno % 10 + '0';
+@@ -76,6 +85,9 @@ arm_register_info (Ebl *ebl __attribute_
+       break;
+ 
+     case 16 + 0 ... 16 + 7:
++      /* AADWARF says that there are no registers in that range,
++       * but gcc maps FPA registers here
++       */
+       regno += 96 - 16;
+       /* Fall through.  */
+     case 96 + 0 ... 96 + 7:
+@@ -87,11 +99,139 @@ arm_register_info (Ebl *ebl __attribute_
+       namelen = 2;
+       break;
+ 
++    case 64 + 0 ... 64 + 9:
++      *setname = "VFP";
++      *bits = 32;
++      *type = DW_ATE_float;
++      name[0] = 's';
++      name[1] = regno - 64 + '0';
++      namelen = 2;
++      break;
++
++    case 64 + 10 ... 64 + 31:
++      *setname = "VFP";
++      *bits = 32;
++      *type = DW_ATE_float;
++      name[0] = 's';
++      name[1] = (regno - 64) / 10 + '0';
++      name[2] = (regno - 64) % 10 + '0';
++      namelen = 3;
++      break;
++
++    case 104 + 0 ... 104 + 7:
++      /* XXX TODO:
++       * This can be either intel wireless MMX general purpose/control
++       * registers or xscale accumulator, which have different usage.
++       * We only have the intel wireless MMX here now.
++       * The name needs to be changed for the xscale accumulator too. */
++      *setname = "MMX";
++      *type = DW_ATE_unsigned;
++      *bits = 32;
++      memcpy(name, "wcgr", 4);
++      name[4] = regno - 104 + '0';
++      namelen = 5;
++      break;
++
++    case 112 + 0 ... 112 + 9:
++      *setname = "MMX";
++      *type = DW_ATE_unsigned;
++      *bits = 64;
++      name[0] = 'w';
++      name[1] = 'r';
++      name[2] = regno - 112 + '0';
++      namelen = 3;
++      break;
++
++    case 112 + 10 ... 112 + 15:
++      *setname = "MMX";
++      *type = DW_ATE_unsigned;
++      *bits = 64;
++      name[0] = 'w';
++      name[1] = 'r';
++      name[2] = '1';
++      name[3] = regno - 112 - 10 + '0';
++      namelen = 4;
++      break;
++
+     case 128:
++      *setname = "special";
+       *type = DW_ATE_unsigned;
+       return stpcpy (name, "spsr") + 1 - name;
+ 
++    case 129:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_fiq") + 1 - name;
++
++    case 130:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_irq") + 1 - name;
++
++    case 131:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_abt") + 1 - name;
++
++    case 132:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_und") + 1 - name;
++
++    case 133:
++      *setname = "special";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_svc") + 1 - name;
++
++    case 144 ... 150:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_usr", regno - 144 + 8) + 1;
++
++    case 151 ... 157:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_fiq", regno - 151 + 8) + 1;
++
++    case 158 ... 159:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_irq", regno - 158 + 13) + 1;
++
++    case 160 ... 161:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_abt", regno - 160 + 13) + 1;
++
++    case 162 ... 163:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_und", regno - 162 + 13) + 1;
++
++    case 164 ... 165:
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      return sprintf(name, "r%d_svc", regno - 164 + 13) + 1;
++
++    case 192 ... 199:
++     *setname = "MMX";
++      *bits = 32;
++      *type = DW_ATE_unsigned;
++      name[0] = 'w';
++      name[1] = 'c';
++      name[2] = regno - 192 + '0';
++      namelen = 3;
++      break;
++
+     case 256 + 0 ... 256 + 9:
++      /* XXX TODO: Neon also uses those registers and can contain
++       * both float and integers */
+       *setname = "VFP";
+       *type = DW_ATE_float;
+       *bits = 64;
+Index: elfutils-0.155/backends/arm_retval.c
+===================================================================
+--- elfutils-0.155.orig/backends/arm_retval.c
++++ elfutils-0.155/backends/arm_retval.c
+@@ -48,6 +48,13 @@ static const Dwarf_Op loc_intreg[] =
+ #define nloc_intreg	1
+ #define nloc_intregs(n)	(2 * (n))
+ 
++/* f1  */ /* XXX TODO: f0 can also have number 96 if program was compiled with -mabi=aapcs */
++static const Dwarf_Op loc_fpreg[] =
++  {
++    { .atom = DW_OP_reg16 },
++  };
++#define nloc_fpreg  1
++
+ /* The return value is a structure and is actually stored in stack space
+    passed in a hidden argument by the caller.  But, the compiler
+    helpfully returns the address of that space in r0.  */
+@@ -58,8 +65,9 @@ static const Dwarf_Op loc_aggregate[] =
+ #define nloc_aggregate 1
+ 
+ 
+-int
+-arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++static int
++arm_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp,
++		            int soft_float)
+ {
+   /* Start with the function's type, and get the DW_AT_type attribute,
+      which is the type of the return value.  */
+@@ -112,14 +120,31 @@ arm_return_value_location (Dwarf_Die *fu
+ 	  else
+ 	    return -1;
+ 	}
++      if (tag == DW_TAG_base_type)
++	{
++	  Dwarf_Word encoding;
++	  if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
++	                       &attr_mem), &encoding) != 0)
++	    return -1;
++
++	  if ((encoding == DW_ATE_float) && !soft_float)
++	    {
++	      *locp = loc_fpreg;
++	      if (size <= 8)
++		return nloc_fpreg;
++	      goto aggregate;
++	    }
++	}
+       if (size <= 16)
+ 	{
+ 	intreg:
+ 	  *locp = loc_intreg;
+ 	  return size <= 4 ? nloc_intreg : nloc_intregs ((size + 3) / 4);
+ 	}
++      /* fall through. */
+ 
+     aggregate:
++      /* XXX TODO sometimes aggregates are returned in r0 (-mabi=aapcs) */
+       *locp = loc_aggregate;
+       return nloc_aggregate;
+ 
+@@ -138,3 +163,18 @@ arm_return_value_location (Dwarf_Die *fu
+      DWARF and might be valid.  */
+   return -2;
+ }
++
++/* return location for -mabi=apcs-gnu -msoft-float */
++int
++arm_return_value_location_soft (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++   return arm_return_value_location_ (functypedie, locp, 1);
++}
++
++/* return location for -mabi=apcs-gnu -mhard-float (current default) */
++int
++arm_return_value_location_hard (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++   return arm_return_value_location_ (functypedie, locp, 0);
++}
++
+Index: elfutils-0.155/libelf/elf.h
+===================================================================
+--- elfutils-0.155.orig/libelf/elf.h
++++ elfutils-0.155/libelf/elf.h
+@@ -2281,6 +2281,9 @@ typedef Elf32_Addr Elf32_Conflict;
+ #define EF_ARM_EABI_VER4	0x04000000
+ #define EF_ARM_EABI_VER5	0x05000000
+ 
++/* EI_OSABI values */
++#define ELFOSABI_ARM_AEABI    64      /* Contains symbol versioning. */
++
+ /* Additional symbol types for Thumb.  */
+ #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
+ #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
+@@ -2298,12 +2301,19 @@ typedef Elf32_Addr Elf32_Conflict;
+ 
+ /* Processor specific values for the Phdr p_type field.  */
+ #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
++#define PT_ARM_UNWIND		PT_ARM_EXIDX
+ 
+ /* Processor specific values for the Shdr sh_type field.  */
+ #define SHT_ARM_EXIDX		(SHT_LOPROC + 1) /* ARM unwind section.  */
+ #define SHT_ARM_PREEMPTMAP	(SHT_LOPROC + 2) /* Preemption details.  */
+ #define SHT_ARM_ATTRIBUTES	(SHT_LOPROC + 3) /* ARM attributes section.  */
+ 
++/* Processor specific values for the Dyn d_tag field.  */
++#define DT_ARM_RESERVED1	(DT_LOPROC + 0)
++#define DT_ARM_SYMTABSZ		(DT_LOPROC + 1)
++#define DT_ARM_PREEMTMAB	(DT_LOPROC + 2)
++#define DT_ARM_RESERVED2	(DT_LOPROC + 3)
++#define DT_ARM_NUM		4
+ 
+ /* ARM relocs.  */
+ 
+@@ -2336,12 +2346,75 @@ typedef Elf32_Addr Elf32_Conflict;
+ #define R_ARM_GOTPC		25	/* 32 bit PC relative offset to GOT */
+ #define R_ARM_GOT32		26	/* 32 bit GOT entry */
+ #define R_ARM_PLT32		27	/* 32 bit PLT address */
++#define R_ARM_CALL		28
++#define R_ARM_JUMP24	29
++#define R_ARM_THM_JUMP24	30
++#define R_ARM_BASE_ABS		31
+ #define R_ARM_ALU_PCREL_7_0	32
+ #define R_ARM_ALU_PCREL_15_8	33
+ #define R_ARM_ALU_PCREL_23_15	34
+ #define R_ARM_LDR_SBREL_11_0	35
+ #define R_ARM_ALU_SBREL_19_12	36
+ #define R_ARM_ALU_SBREL_27_20	37
++#define R_ARM_TARGET1	38
++#define R_ARM_SBREL31	39
++#define R_ARM_V4BX	40
++#define R_ARM_TARGET2	41
++#define R_ARM_PREL31	42
++#define R_ARM_MOVW_ABS_NC	43
++#define R_ARM_MOVT_ABS	44
++#define R_ARM_MOVW_PREL_NC	45
++#define R_ARM_MOVT_PREL	46
++#define R_ARM_THM_MOVW_ABS_NC	47
++#define R_ARM_THM_MOVT_ABS	48
++#define R_ARM_THM_MOVW_PREL_NC	49
++#define R_ARM_THM_MOVT_PREL	50
++#define R_ARM_THM_JUMP19	51
++#define R_ARM_THM_JUMP6	52
++#define R_ARM_THM_ALU_PREL_11_0	53
++#define R_ARM_THM_PC12	54
++#define R_ARM_ABS32_NO	55
++#define R_ARM_REL32_NO	56
++#define R_ARM_ALU_PC_G0_NC	57
++#define R_ARM_ALU_PC_G0	58
++#define R_ARM_ALU_PC_G1_NC	59
++#define R_ARM_ALU_PC_G1	60
++#define R_ARM_ALU_PC_G2	61
++#define R_ARM_LDR_PC_G1	62
++#define R_ARM_LDR_PC_G2	63
++#define R_ARM_LDRS_PC_G0	64
++#define R_ARM_LDRS_PC_G1	65
++#define R_ARM_LDRS_PC_G2	66
++#define R_ARM_LDC_PC_G0	67
++#define R_ARM_LDC_PC_G1	68
++#define R_ARM_LDC_PC_G2	69
++#define R_ARM_ALU_SB_G0_NC	70
++#define R_ARM_ALU_SB_G0	71
++#define R_ARM_ALU_SB_G1_NC	72
++#define R_ARM_ALU_SB_G1	73
++#define R_ARM_ALU_SB_G2	74
++#define R_ARM_LDR_SB_G0	75
++#define R_ARM_LDR_SB_G1	76
++#define R_ARM_LDR_SB_G2	77
++#define R_ARM_LDRS_SB_G0	78
++#define R_ARM_LDRS_SB_G1	79
++#define R_ARM_LDRS_SB_G2	80
++#define R_ARM_LDC_G0	81
++#define R_ARM_LDC_G1	82
++#define R_ARM_LDC_G2	83
++#define R_ARM_MOVW_BREL_NC	84
++#define R_ARM_MOVT_BREL	85
++#define R_ARM_MOVW_BREL	86
++#define R_ARM_THM_MOVW_BREL_NC	87
++#define R_ARM_THM_MOVT_BREL	88
++#define R_ARM_THM_MOVW_BREL	89
++/* 90-93 unallocated */
++#define R_ARM_PLT32_ABS	94
++#define R_ARM_GOT_ABS	95
++#define R_ARM_GOT_PREL	96
++#define R_ARM_GOT_BREL12	97
++#define R_ARM_GOTOFF12	98
++#define R_ARM_GOTRELAX	99
+ #define R_ARM_TLS_GOTDESC	90
+ #define R_ARM_TLS_CALL		91
+ #define R_ARM_TLS_DESCSEQ	92
+@@ -2360,6 +2433,13 @@ typedef Elf32_Addr Elf32_Conflict;
+ 					   static TLS block offset */
+ #define R_ARM_TLS_LE32		108	/* 32 bit offset relative to static
+ 					   TLS block */
++#define R_ARM_TLS_LDO12	109
++#define R_ARM_TLS_LE12		110
++#define R_ARM_TLS_IE12GP	111
++/* 112 - 127 private range */
++#define R_ARM_ME_TOO		128|/* obsolete */
++
++
+ #define	R_ARM_THM_TLS_DESCSEQ	129
+ #define R_ARM_IRELATIVE		160
+ #define R_ARM_RXPC25		249
+Index: elfutils-0.155/backends/libebl_arm.h
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/libebl_arm.h
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_ARM_H
++#define _LIBEBL_ARM_H 1
++
++#include <libdw.h>
++
++extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
++extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/do-autoreconf.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/do-autoreconf.diff
new file mode 100644
index 0000000..c601f40
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/do-autoreconf.diff
@@ -0,0 +1,215 @@
+Upstream-Status: Backport
+
+Generated by copying the whole dir, running `sh debian/autogen.sh` and diffing.
+
+Index: elfutils-0.155/backends/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/backends/Makefile.in
++++ elfutils-0.155/backends/Makefile.in
+@@ -78,39 +78,54 @@ libebl_ia64_pic_a_LIBADD =
+ am__objects_4 = ia64_init.$(OBJEXT) ia64_symbol.$(OBJEXT) \
+ 	ia64_regs.$(OBJEXT) ia64_retval.$(OBJEXT)
+ libebl_ia64_pic_a_OBJECTS = $(am_libebl_ia64_pic_a_OBJECTS)
++libebl_m68k_pic_a_AR = $(AR) $(ARFLAGS)
++libebl_m68k_pic_a_LIBADD =
++am__objects_5 = m68k_init.$(OBJEXT) m68k_symbol.$(OBJEXT) \
++	m68k_regs.$(OBJEXT)
++libebl_m68k_pic_a_OBJECTS = $(am_libebl_m68k_pic_a_OBJECTS)
++libebl_mips_pic_a_AR = $(AR) $(ARFLAGS)
++libebl_mips_pic_a_LIBADD =
++am__objects_6 = mips_init.$(OBJEXT) mips_symbol.$(OBJEXT) \
++	mips_regs.$(OBJEXT) mips_retval.$(OBJEXT)
++libebl_mips_pic_a_OBJECTS = $(am_libebl_mips_pic_a_OBJECTS)
++libebl_parisc_pic_a_AR = $(AR) $(ARFLAGS)
++libebl_parisc_pic_a_LIBADD =
++am__objects_7 = parisc_init.$(OBJEXT) parisc_symbol.$(OBJEXT) \
++	parisc_regs.$(OBJEXT) parisc_retval.$(OBJEXT)
++libebl_parisc_pic_a_OBJECTS = $(am_libebl_parisc_pic_a_OBJECTS)
+ libebl_ppc64_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_ppc64_pic_a_LIBADD =
+-am__objects_5 = ppc64_init.$(OBJEXT) ppc64_symbol.$(OBJEXT) \
++am__objects_8 = ppc64_init.$(OBJEXT) ppc64_symbol.$(OBJEXT) \
+ 	ppc64_retval.$(OBJEXT) ppc64_corenote.$(OBJEXT) \
+ 	ppc_regs.$(OBJEXT) ppc_auxv.$(OBJEXT) ppc_attrs.$(OBJEXT) \
+ 	ppc_syscall.$(OBJEXT)
+ libebl_ppc64_pic_a_OBJECTS = $(am_libebl_ppc64_pic_a_OBJECTS)
+ libebl_ppc_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_ppc_pic_a_LIBADD =
+-am__objects_6 = ppc_init.$(OBJEXT) ppc_symbol.$(OBJEXT) \
++am__objects_9 = ppc_init.$(OBJEXT) ppc_symbol.$(OBJEXT) \
+ 	ppc_retval.$(OBJEXT) ppc_regs.$(OBJEXT) ppc_corenote.$(OBJEXT) \
+ 	ppc_auxv.$(OBJEXT) ppc_attrs.$(OBJEXT) ppc_syscall.$(OBJEXT)
+ libebl_ppc_pic_a_OBJECTS = $(am_libebl_ppc_pic_a_OBJECTS)
+ libebl_s390_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_s390_pic_a_LIBADD =
+-am__objects_7 = s390_init.$(OBJEXT) s390_symbol.$(OBJEXT) \
++am__objects_10 = s390_init.$(OBJEXT) s390_symbol.$(OBJEXT) \
+ 	s390_regs.$(OBJEXT) s390_retval.$(OBJEXT)
+ libebl_s390_pic_a_OBJECTS = $(am_libebl_s390_pic_a_OBJECTS)
+ libebl_sh_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_sh_pic_a_LIBADD =
+-am__objects_8 = sh_init.$(OBJEXT) sh_symbol.$(OBJEXT) \
++am__objects_11 = sh_init.$(OBJEXT) sh_symbol.$(OBJEXT) \
+ 	sh_corenote.$(OBJEXT) sh_regs.$(OBJEXT) sh_retval.$(OBJEXT)
+ libebl_sh_pic_a_OBJECTS = $(am_libebl_sh_pic_a_OBJECTS)
+ libebl_sparc_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_sparc_pic_a_LIBADD =
+-am__objects_9 = sparc_init.$(OBJEXT) sparc_symbol.$(OBJEXT) \
++am__objects_12 = sparc_init.$(OBJEXT) sparc_symbol.$(OBJEXT) \
+ 	sparc_regs.$(OBJEXT) sparc_retval.$(OBJEXT) \
+ 	sparc_corenote.$(OBJEXT) sparc64_corenote.$(OBJEXT) \
+ 	sparc_auxv.$(OBJEXT)
+ libebl_sparc_pic_a_OBJECTS = $(am_libebl_sparc_pic_a_OBJECTS)
+ libebl_tilegx_pic_a_AR = $(AR) $(ARFLAGS)
+ libebl_tilegx_pic_a_LIBADD =
+-am__objects_10 = tilegx_init.$(OBJEXT) tilegx_symbol.$(OBJEXT) \
++am__objects_13 = x86_64_init.$(OBJEXT) x86_64_symbol.$(OBJEXT) \
+ 	tilegx_regs.$(OBJEXT) tilegx_retval.$(OBJEXT) \
+ 	tilegx_corenote.$(OBJEXT)
+ libebl_tilegx_pic_a_OBJECTS = $(am_libebl_tilegx_pic_a_OBJECTS)
+@@ -131,16 +146,18 @@ CCLD = $(CC)
+ LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+ SOURCES = $(libebl_alpha_pic_a_SOURCES) $(libebl_arm_pic_a_SOURCES) \
+ 	$(libebl_i386_pic_a_SOURCES) $(libebl_ia64_pic_a_SOURCES) \
+-	$(libebl_ppc64_pic_a_SOURCES) $(libebl_ppc_pic_a_SOURCES) \
+-	$(libebl_s390_pic_a_SOURCES) $(libebl_sh_pic_a_SOURCES) \
+-	$(libebl_sparc_pic_a_SOURCES) $(libebl_tilegx_pic_a_SOURCES) \
++	$(libebl_m68k_pic_a_SOURCES) $(libebl_mips_pic_a_SOURCES) \
++	$(libebl_parisc_pic_a_SOURCES) $(libebl_ppc64_pic_a_SOURCES) \
++	$(libebl_ppc_pic_a_SOURCES) $(libebl_s390_pic_a_SOURCES) \
++	$(libebl_sh_pic_a_SOURCES) $(libebl_sparc_pic_a_SOURCES) \
+ 	$(libebl_x86_64_pic_a_SOURCES)
+ DIST_SOURCES = $(libebl_alpha_pic_a_SOURCES) \
+ 	$(libebl_arm_pic_a_SOURCES) $(libebl_i386_pic_a_SOURCES) \
+-	$(libebl_ia64_pic_a_SOURCES) $(libebl_ppc64_pic_a_SOURCES) \
+-	$(libebl_ppc_pic_a_SOURCES) $(libebl_s390_pic_a_SOURCES) \
+-	$(libebl_sh_pic_a_SOURCES) $(libebl_sparc_pic_a_SOURCES) \
+-	$(libebl_tilegx_pic_a_SOURCES) $(libebl_x86_64_pic_a_SOURCES)
++	$(libebl_ia64_pic_a_SOURCES) $(libebl_m68k_pic_a_SOURCES) \
++	$(libebl_mips_pic_a_SOURCES) $(libebl_parisc_pic_a_SOURCES) \
++	$(libebl_ppc64_pic_a_SOURCES) $(libebl_ppc_pic_a_SOURCES) \
++	$(libebl_s390_pic_a_SOURCES) $(libebl_sh_pic_a_SOURCES) \
++	$(libebl_sparc_pic_a_SOURCES) $(libebl_x86_64_pic_a_SOURCES)
+ DATA = $(noinst_DATA)
+ HEADERS = $(noinst_HEADERS)
+ ETAGS = etags
+@@ -277,11 +294,12 @@ COMPILE.os = $(filter-out -fprofile-arcs
+ CLEANFILES = *.gcno *.gcda $(foreach m,$(modules), libebl_$(m).map \
+ 	libebl_$(m).so $(am_libebl_$(m)_pic_a_OBJECTS))
+ textrel_check = if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+-modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 tilegx
++modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 tilegx parisc mips m68k
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
+ 	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
+-	     libebl_s390_pic.a libebl_tilegx_pic.a
++	     libebl_s390_pic.a libebl_parisc_pic.a libebl_mips_pic.a \
++	     libebl_tilegx_pic.a libebl_m68k_pic.a
+ 
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+@@ -298,46 +316,60 @@ am_libebl_i386_pic_a_OBJECTS = $(i386_SR
+ sh_SRCS = sh_init.c sh_symbol.c sh_corenote.c sh_regs.c sh_retval.c
+ libebl_sh_pic_a_SOURCES = $(sh_SRCS)
+ am_libebl_sh_pic_a_OBJECTS = $(sh_SRCS:.c=.os)
++
+ x86_64_SRCS = x86_64_init.c x86_64_symbol.c x86_64_corenote.c x86_64_cfi.c \
+ 	      x86_64_retval.c x86_64_regs.c i386_auxv.c x86_64_syscall.c
+-
+ cpu_x86_64 = ../libcpu/libcpu_x86_64.a
+ libebl_x86_64_pic_a_SOURCES = $(x86_64_SRCS)
+ am_libebl_x86_64_pic_a_OBJECTS = $(x86_64_SRCS:.c=.os)
++
+ ia64_SRCS = ia64_init.c ia64_symbol.c ia64_regs.c ia64_retval.c
+ libebl_ia64_pic_a_SOURCES = $(ia64_SRCS)
+ am_libebl_ia64_pic_a_OBJECTS = $(ia64_SRCS:.c=.os)
++
+ alpha_SRCS = alpha_init.c alpha_symbol.c alpha_retval.c alpha_regs.c \
+ 	     alpha_corenote.c alpha_auxv.c
+-
+ libebl_alpha_pic_a_SOURCES = $(alpha_SRCS)
+ am_libebl_alpha_pic_a_OBJECTS = $(alpha_SRCS:.c=.os)
++
+ arm_SRCS = arm_init.c arm_symbol.c arm_regs.c arm_corenote.c \
+ 	   arm_auxv.c arm_attrs.c arm_retval.c
+-
+ libebl_arm_pic_a_SOURCES = $(arm_SRCS)
+ am_libebl_arm_pic_a_OBJECTS = $(arm_SRCS:.c=.os)
++
+ sparc_SRCS = sparc_init.c sparc_symbol.c sparc_regs.c sparc_retval.c \
+ 	     sparc_corenote.c sparc64_corenote.c sparc_auxv.c
+-
+ libebl_sparc_pic_a_SOURCES = $(sparc_SRCS)
+ am_libebl_sparc_pic_a_OBJECTS = $(sparc_SRCS:.c=.os)
++
+ ppc_SRCS = ppc_init.c ppc_symbol.c ppc_retval.c ppc_regs.c \
+ 	   ppc_corenote.c ppc_auxv.c ppc_attrs.c ppc_syscall.c
+-
+ libebl_ppc_pic_a_SOURCES = $(ppc_SRCS)
+ am_libebl_ppc_pic_a_OBJECTS = $(ppc_SRCS:.c=.os)
++
+ ppc64_SRCS = ppc64_init.c ppc64_symbol.c ppc64_retval.c \
+ 	     ppc64_corenote.c ppc_regs.c ppc_auxv.c ppc_attrs.c ppc_syscall.c
+-
+ libebl_ppc64_pic_a_SOURCES = $(ppc64_SRCS)
+ am_libebl_ppc64_pic_a_OBJECTS = $(ppc64_SRCS:.c=.os)
++
+ s390_SRCS = s390_init.c s390_symbol.c s390_regs.c s390_retval.c
+ libebl_s390_pic_a_SOURCES = $(s390_SRCS)
+ am_libebl_s390_pic_a_OBJECTS = $(s390_SRCS:.c=.os)
++
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
++
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++libebl_mips_pic_a_SOURCES = $(mips_SRCS)
++am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
++
++m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c
++libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
++am_libebl_m68k_pic_a_OBJECTS = $(m68k_SRCS:.c=.os)
++
+ tilegx_SRCS = tilegx_init.c tilegx_symbol.c tilegx_regs.c \
+               tilegx_retval.c tilegx_corenote.c
+-
+ libebl_tilegx_pic_a_SOURCES = $(tilegx_SRCS)
+ am_libebl_tilegx_pic_a_OBJECTS = $(tilegx_SRCS:.c=.os)
+ noinst_HEADERS = libebl_CPU.h common-reloc.c linux-core-note.c x86_corenote.c
+@@ -396,6 +428,18 @@ libebl_ia64_pic.a: $(libebl_ia64_pic_a_O
+ 	-rm -f libebl_ia64_pic.a
+ 	$(libebl_ia64_pic_a_AR) libebl_ia64_pic.a $(libebl_ia64_pic_a_OBJECTS) $(libebl_ia64_pic_a_LIBADD)
+ 	$(RANLIB) libebl_ia64_pic.a
++libebl_m68k_pic.a: $(libebl_m68k_pic_a_OBJECTS) $(libebl_m68k_pic_a_DEPENDENCIES)
++	-rm -f libebl_m68k_pic.a
++	$(libebl_m68k_pic_a_AR) libebl_m68k_pic.a $(libebl_m68k_pic_a_OBJECTS) $(libebl_m68k_pic_a_LIBADD)
++	$(RANLIB) libebl_m68k_pic.a
++libebl_mips_pic.a: $(libebl_mips_pic_a_OBJECTS) $(libebl_mips_pic_a_DEPENDENCIES)
++	-rm -f libebl_mips_pic.a
++	$(libebl_mips_pic_a_AR) libebl_mips_pic.a $(libebl_mips_pic_a_OBJECTS) $(libebl_mips_pic_a_LIBADD)
++	$(RANLIB) libebl_mips_pic.a
++libebl_parisc_pic.a: $(libebl_parisc_pic_a_OBJECTS) $(libebl_parisc_pic_a_DEPENDENCIES)
++	-rm -f libebl_parisc_pic.a
++	$(libebl_parisc_pic_a_AR) libebl_parisc_pic.a $(libebl_parisc_pic_a_OBJECTS) $(libebl_parisc_pic_a_LIBADD)
++	$(RANLIB) libebl_parisc_pic.a
+ libebl_ppc64_pic.a: $(libebl_ppc64_pic_a_OBJECTS) $(libebl_ppc64_pic_a_DEPENDENCIES) $(EXTRA_libebl_ppc64_pic_a_DEPENDENCIES) 
+ 	-rm -f libebl_ppc64_pic.a
+ 	$(libebl_ppc64_pic_a_AR) libebl_ppc64_pic.a $(libebl_ppc64_pic_a_OBJECTS) $(libebl_ppc64_pic_a_LIBADD)
+@@ -456,6 +500,17 @@ distclean-compile:
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ia64_regs.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ia64_retval.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ia64_symbol.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/m68k_init.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/m68k_regs.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/m68k_symbol.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mips_init.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mips_regs.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mips_retval.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mips_symbol.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/parisc_init.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/parisc_regs.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/parisc_retval.Po@am__quote@
++@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/parisc_symbol.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ppc64_corenote.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ppc64_init.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ppc64_retval.Po@am__quote@
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/dso-link-change.patch b/meta/recipes-devtools/elfutils/elfutils-0.155/dso-link-change.patch
new file mode 100644
index 0000000..f375a8a
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/dso-link-change.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+
+# This patch makes the link to the dependencies of libdw explicit, as recent
+# ld no longer implicitly links them. See
+# http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
+# a similar example of the error message you can encounter without this patch,
+# and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
+# https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for more
+# details.
+
+--- elfutils-0.155.orig/src/Makefile.am
++++ elfutils-0.155/src/Makefile.am
+@@ -86,7 +86,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
+ libelf = ../libelf/libelf.a
+ else
+ libasm = ../libasm/libasm.so
+-libdw = ../libdw/libdw.so
++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ endif
+ libebl = ../libebl/libebl.a
+--- elfutils-0.155.orig/tests/Makefile.am
++++ elfutils-0.155/tests/Makefile.am
+@@ -172,7 +172,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
+ libelf = ../libelf/libelf.a
+ libasm = ../libasm/libasm.a
+ else
+-libdw = ../libdw/libdw.so
++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ libasm = ../libasm/libasm.so
+ endif
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/elf_additions.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/elf_additions.diff
new file mode 100644
index 0000000..7c7f8a1
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/elf_additions.diff
@@ -0,0 +1,61 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.155/libelf/elf.h
+===================================================================
+--- elfutils-0.155.orig/libelf/elf.h
++++ elfutils-0.155/libelf/elf.h
+@@ -149,8 +149,13 @@ typedef struct
+ #define ELFOSABI_TRU64		10	/* Compaq TRU64 UNIX.  */
+ #define ELFOSABI_MODESTO	11	/* Novell Modesto.  */
+ #define ELFOSABI_OPENBSD	12	/* OpenBSD.  */
++#define ELFOSABI_OPENVMS	13	/* OpenVMS */
++#define ELFOSABI_NSK		14	/* Hewlett-Packard Non-Stop Kernel */
++#define ELFOSABI_AROS		15	/* Amiga Research OS */
++/* 64-255 Architecture-specific value range */
+ #define ELFOSABI_ARM_AEABI	64	/* ARM EABI */
+ #define ELFOSABI_ARM		97	/* ARM */
++/* This is deprecated? It's not in the latest version anymore. */
+ #define ELFOSABI_STANDALONE	255	/* Standalone (embedded) application */
+ 
+ #define EI_ABIVERSION	8		/* ABI version */
+@@ -205,7 +210,7 @@ typedef struct
+ #define EM_H8_300H	47		/* Hitachi H8/300H */
+ #define EM_H8S		48		/* Hitachi H8S */
+ #define EM_H8_500	49		/* Hitachi H8/500 */
+-#define EM_IA_64	50		/* Intel Merced */
++#define EM_IA_64	50		/* Intel IA64 */
+ #define EM_MIPS_X	51		/* Stanford MIPS-X */
+ #define EM_COLDFIRE	52		/* Motorola Coldfire */
+ #define EM_68HC12	53		/* Motorola M68HC12 */
+@@ -219,7 +224,8 @@ typedef struct
+ #define EM_TINYJ	61		/* Advanced Logic Corp. Tinyj emb.fam*/
+ #define EM_X86_64	62		/* AMD x86-64 architecture */
+ #define EM_PDSP		63		/* Sony DSP Processor */
+-
++#define	EM_PDP10	64		/* Digital Equipment Corp. PDP-10 */
++#define EM_PDP11	65		/* Digital Equipment Corp. PDP-11 */
+ #define EM_FX66		66		/* Siemens FX66 microcontroller */
+ #define EM_ST9PLUS	67		/* STMicroelectronics ST9+ 8/16 mc */
+ #define EM_ST7		68		/* STmicroelectronics ST7 8 bit mc */
+@@ -249,6 +255,21 @@ typedef struct
+ #define EM_OPENRISC	92		/* OpenRISC 32-bit embedded processor */
+ #define EM_ARC_A5	93		/* ARC Cores Tangent-A5 */
+ #define EM_XTENSA	94		/* Tensilica Xtensa Architecture */
++#define	EM_VIDEOCORE	95		/* Alphamosaic VideoCore processor */
++#define	EM_TMM_GPP	96		/* Thompson Multimedia General Purpose Processor */
++#define	EM_NS32K	97		/* National Semiconductor 32000 series */
++#define	EM_TPC		98		/* Tenor Network TPC processor */
++#define	EM_SNP1K	99		/* Trebia SNP 1000 processor */
++#define	EM_ST200	100		/* STMicroelectronics (www.st.com) ST200 microcontroller */
++#define EM_IP2K         101		/* Ubicom IP2XXX microcontroller family */
++#define	EM_MAX		102		/* MAX Processor */
++#define EM_CR           103		/* National Semiconductor CompactRISC */
++#define	EM_F2MC16	104		/* Fujitsu F2MC16 */
++#define EM_MSP430       105		/* TI msp430 micro controller */
++#define EM_BLACKFIN     106		/* Analog Devices Blackfin (DSP) processor */
++#define EM_SE_C33	107		/* S1C33 Family of Seiko Epson processors */
++#define	EM_SEP		108		/* Sharp embedded microprocessor */
++#define EM_ARCA		109		/* Arca RISC Microprocessor */
+ #define EM_TILEPRO	188		/* Tilera TILEPro */
+ #define EM_TILEGX	191		/* Tilera TILE-Gx */
+ #define EM_NUM		192
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-ar-c-fix-num-passed-to-memset.patch b/meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-ar-c-fix-num-passed-to-memset.patch
new file mode 100644
index 0000000..dd4f06b
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-ar-c-fix-num-passed-to-memset.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport
+
+ar.c (do_oper_delete): Fix num passed to memset
+native build failed as following on Fedora18+: 
+ar.c: In function 'do_oper_delete':
+ar.c:918:31: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
+   memset (found, '\0', sizeof (found));
+                                ^
+The original commit is http://git.fedorahosted.org/cgit/elfutils.git/commit/src/ar.c?id=1a4d0668d18bf1090c5c08cdb5cb3ba2b8eb5410
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- elfutils-0.155/src/ar.c.org	2013-03-12 21:12:17.928281375 -0500
++++ elfutils-0.155/src/ar.c	2013-03-12 21:15:30.053285271 -0500
+@@ -915,7 +915,7 @@
+ 		long int instance)
+ {
+   bool *found = alloca (sizeof (bool) * argc);
+-  memset (found, '\0', sizeof (found));
++  memset (found, '\0', sizeof (bool) * argc);
+ 
+   /* List of the files we keep.  */
+   struct armem *to_copy = NULL;
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-robustify.patch b/meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-robustify.patch
new file mode 100644
index 0000000..9eee984
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-robustify.patch
@@ -0,0 +1,1756 @@
+--- elfutils/libdwfl/ChangeLog
++++ elfutils/libdwfl/ChangeLog
+@@ -52,6 +52,11 @@
+ 	* dwfl_module_getdwarf.c (open_elf): Clear errno before CBFAIL.
+ 	Reported by Kurt Roeckx <kurt@roeckx.be>.
+ 
++2011-03-23  Petr Machata  <pmachata@redhat.com>
++
++	* relocate.c (relocate_section): Use gelf_fsize instead of relying
++	on shdr->sh_entsize.
++
+ 2011-02-11  Roland McGrath  <roland@redhat.com>
+ 
+ 	* linux-kernel-modules.c (try_kernel_name): Try .gz, .bz2, .xz
+--- elfutils/libdwfl/relocate.c
++++ elfutils/libdwfl/relocate.c
+@@ -1,5 +1,5 @@
+ /* Relocate debug information.
+-   Copyright (C) 2005-2010 Red Hat, Inc.
++   Copyright (C) 2005-2011 Red Hat, Inc.
+    This file is part of elfutils.
+ 
+    This file is free software; you can redistribute it and/or modify
+@@ -457,7 +457,10 @@ relocate_section (Dwfl_Module *mod, Elf
+       }
+   }
+ 
+-  size_t nrels = shdr->sh_size / shdr->sh_entsize;
++  size_t sh_entsize
++    = gelf_fsize (relocated, shdr->sh_type == SHT_REL ? ELF_T_REL : ELF_T_RELA,
++		  1, EV_CURRENT);
++  size_t nrels = shdr->sh_size / sh_entsize;
+   size_t complete = 0;
+   if (shdr->sh_type == SHT_REL)
+     for (size_t relidx = 0; !result && relidx < nrels; ++relidx)
+@@ -559,7 +562,7 @@ relocate_section (Dwfl_Module *mod, Elf
+ 	  nrels = next;
+ 	}
+ 
+-      shdr->sh_size = reldata->d_size = nrels * shdr->sh_entsize;
++      shdr->sh_size = reldata->d_size = nrels * sh_entsize;
+       gelf_update_shdr (scn, shdr);
+     }
+ 
+--- elfutils/libelf/ChangeLog
++++ elfutils/libelf/ChangeLog
+@@ -703,10 +703,53 @@
+ 	If section content hasn't been read yet, do it before looking for the
+ 	block size.  If no section data present, infer size of section header.
+ 
++2005-05-14  Jakub Jelinek  <jakub@redhat.com>
++
++	* libelfP.h (INVALID_NDX): Define.
++	* gelf_getdyn.c (gelf_getdyn): Use it.  Remove ndx < 0 test if any.
++	* gelf_getlib.c (gelf_getlib): Likewise.
++	* gelf_getmove.c (gelf_getmove): Likewise.
++	* gelf_getrel.c (gelf_getrel): Likewise.
++	* gelf_getrela.c (gelf_getrela): Likewise.
++	* gelf_getsym.c (gelf_getsym): Likewise.
++	* gelf_getsyminfo.c (gelf_getsyminfo): Likewise.
++	* gelf_getsymshndx.c (gelf_getsymshndx): Likewise.
++	* gelf_getversym.c (gelf_getversym): Likewise.
++	* gelf_update_dyn.c (gelf_update_dyn): Likewise.
++	* gelf_update_lib.c (gelf_update_lib): Likewise.
++	* gelf_update_move.c (gelf_update_move): Likewise.
++	* gelf_update_rel.c (gelf_update_rel): Likewise.
++	* gelf_update_rela.c (gelf_update_rela): Likewise.
++	* gelf_update_sym.c (gelf_update_sym): Likewise.
++	* gelf_update_syminfo.c (gelf_update_syminfo): Likewise.
++	* gelf_update_symshndx.c (gelf_update_symshndx): Likewise.
++	* gelf_update_versym.c (gelf_update_versym): Likewise.
++	* elf_newscn.c (elf_newscn): Check for overflow.
++	* elf32_updatefile.c (__elfw2(LIBELFBITS,updatemmap)): Likewise.
++	(__elfw2(LIBELFBITS,updatefile)): Likewise.
++	* elf_begin.c (file_read_elf): Likewise.
++	* elf32_newphdr.c (elfw2(LIBELFBITS,newphdr)): Likewise.
++	* elf_getarsym.c (elf_getarsym): Likewise.
++	* elf32_getshdr.c (elfw2(LIBELFBITS,getshdr)): Likewise.
+ 2005-05-11  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elf.h: Update again.
+ 
++2005-05-17  Jakub Jelinek  <jakub@redhat.com>
++
++	* elf32_getphdr.c (elfw2(LIBELFBITS,getphdr)): Check if program header
++	table fits into object's bounds.
++	* elf_getshstrndx.c (elf_getshstrndx): Add elf->start_offset to
++	elf->map_address.  Check if first section header fits into object's
++	bounds.
++	* elf32_getshdr.c (elfw2(LIBELFBITS,getshdr)):
++	Check if section header table fits into object's bounds.
++	* elf_begin.c (get_shnum): Ensure section headers fits into
++	object's bounds.
++	(file_read_elf): Make sure scncnt is small enough to allocate both
++	ElfXX_Shdr and Elf_Scn array.  Make sure section and program header
++	tables fit into object's bounds.  Avoid memory leak on failure.
++
+ 2005-05-09  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elf.h: Update from glibc.
+--- elfutils/libelf/elf32_getphdr.c
++++ elfutils/libelf/elf32_getphdr.c
+@@ -93,6 +93,16 @@ __elfw2(LIBELFBITS,getphdr_wrlock) (elf)
+ 
+       if (elf->map_address != NULL)
+ 	{
++	  /* First see whether the information in the ELF header is
++	     valid and it does not ask for too much.  */
++	  if (unlikely (ehdr->e_phoff >= elf->maximum_size)
++	      || unlikely (elf->maximum_size - ehdr->e_phoff < size))
++	    {
++	      /* Something is wrong.  */
++	      __libelf_seterrno (ELF_E_INVALID_PHDR);
++	      goto out;
++	    }
++
+ 	  /* All the data is already mapped.  Use it.  */
+ 	  void *file_phdr = ((char *) elf->map_address
+ 			     + elf->start_offset + ehdr->e_phoff);
+--- elfutils/libelf/elf32_getshdr.c
++++ elfutils/libelf/elf32_getshdr.c
+@@ -60,7 +60,8 @@ load_shdr_wrlock (Elf_Scn *scn)
+     goto out;
+ 
+   size_t shnum;
+-  if (__elf_getshdrnum_rdlock (elf, &shnum) != 0)
++  if (__elf_getshdrnum_rdlock (elf, &shnum) != 0
++      || shnum > SIZE_MAX / sizeof (ElfW2(LIBELFBITS,Shdr)))
+     goto out;
+   size_t size = shnum * sizeof (ElfW2(LIBELFBITS,Shdr));
+ 
+@@ -77,6 +78,16 @@ load_shdr_wrlock (Elf_Scn *scn)
+ 
+   if (elf->map_address != NULL)
+     {
++      /* First see whether the information in the ELF header is
++	 valid and it does not ask for too much.  */
++      if (unlikely (ehdr->e_shoff >= elf->maximum_size)
++	  || unlikely (elf->maximum_size - ehdr->e_shoff < size))
++	{
++	  /* Something is wrong.  */
++	  __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++	  goto free_and_out;
++	}
++
+       ElfW2(LIBELFBITS,Shdr) *notcvt;
+ 
+       /* All the data is already mapped.  If we could use it
+--- elfutils/libelf/elf32_newphdr.c
++++ elfutils/libelf/elf32_newphdr.c
+@@ -114,6 +114,12 @@ elfw2(LIBELFBITS,newphdr) (elf, count)
+ 	   || count == PN_XNUM
+ 	   || elf->state.ELFW(elf,LIBELFBITS).phdr == NULL)
+     {
++      if (unlikely (count > SIZE_MAX / sizeof (ElfW2(LIBELFBITS,Phdr))))
++	{
++	  result = NULL;
++	  goto out;
++	}
++
+       /* Allocate a new program header with the appropriate number of
+ 	 elements.  */
+       result = (ElfW2(LIBELFBITS,Phdr) *)
+--- elfutils/libelf/elf32_updatefile.c
++++ elfutils/libelf/elf32_updatefile.c
+@@ -202,6 +202,9 @@ __elfw2(LIBELFBITS,updatemmap) (Elf *elf
+   /* Write all the sections.  Well, only those which are modified.  */
+   if (shnum > 0)
+     {
++      if (unlikely (shnum > SIZE_MAX / sizeof (Elf_Scn *)))
++ 	return 1;
++
+       Elf_ScnList *list = &elf->state.ELFW(elf,LIBELFBITS).scns;
+       Elf_Scn **scns = (Elf_Scn **) alloca (shnum * sizeof (Elf_Scn *));
+       char *const shdr_start = ((char *) elf->map_address + elf->start_offset
+@@ -624,6 +627,10 @@ __elfw2(LIBELFBITS,updatefile) (Elf *elf
+   /* Write all the sections.  Well, only those which are modified.  */
+   if (shnum > 0)
+     {
++      if (unlikely (shnum > SIZE_MAX / (sizeof (Elf_Scn *)
++					+ sizeof (ElfW2(LIBELFBITS,Shdr)))))
++	return 1;
++
+       off_t shdr_offset = elf->start_offset + ehdr->e_shoff;
+ #if EV_NUM != 2
+       xfct_t shdr_fctp = __elf_xfctstom[__libelf_version - 1][EV_CURRENT - 1][ELFW(ELFCLASS, LIBELFBITS) - 1][ELF_T_SHDR];
+--- elfutils/libelf/elf_begin.c
++++ elfutils/libelf/elf_begin.c
+@@ -144,7 +144,8 @@ get_shnum (void *map_address, unsigned c
+ 
+       if (unlikely (result == 0) && ehdr.e32->e_shoff != 0)
+ 	{
+-	  if (ehdr.e32->e_shoff + sizeof (Elf32_Shdr) > maxsize)
++	  if (unlikely (ehdr.e32->e_shoff >= maxsize)
++	      || unlikely (maxsize - ehdr.e32->e_shoff < sizeof (Elf32_Shdr)))
+ 	    /* Cannot read the first section header.  */
+ 	    return 0;
+ 
+@@ -192,7 +193,8 @@ get_shnum (void *map_address, unsigned c
+ 
+       if (unlikely (result == 0) && ehdr.e64->e_shoff != 0)
+ 	{
+-	  if (ehdr.e64->e_shoff + sizeof (Elf64_Shdr) > maxsize)
++	  if (unlikely (ehdr.e64->e_shoff >= maxsize)
++	      || unlikely (ehdr.e64->e_shoff + sizeof (Elf64_Shdr) > maxsize))
+ 	    /* Cannot read the first section header.  */
+ 	    return 0;
+ 
+@@ -264,6 +266,15 @@ file_read_elf (int fildes, void *map_add
+     /* Could not determine the number of sections.  */
+     return NULL;
+ 
++  /* Check for too many sections.  */
++  if (e_ident[EI_CLASS] == ELFCLASS32)
++    {
++      if (scncnt > SIZE_MAX / (sizeof (Elf_Scn) + sizeof (Elf32_Shdr)))
++	return NULL;
++    }
++  else if (scncnt > SIZE_MAX / (sizeof (Elf_Scn) + sizeof (Elf64_Shdr)))
++    return NULL;
++
+   /* We can now allocate the memory.  Even if there are no section headers,
+      we allocate space for a zeroth section in case we need it later.  */
+   const size_t scnmax = (scncnt ?: (cmd == ELF_C_RDWR || cmd == ELF_C_RDWR_MMAP)
+@@ -303,6 +314,16 @@ file_read_elf (int fildes, void *map_add
+ 	{
+ 	  /* We can use the mmapped memory.  */
+ 	  elf->state.elf32.ehdr = ehdr;
++
++	  if (unlikely (ehdr->e_shoff >= maxsize)
++	      || unlikely (maxsize - ehdr->e_shoff
++			   < scncnt * sizeof (Elf32_Shdr)))
++	    {
++	    free_and_out:
++	      free (elf);
++	      __libelf_seterrno (ELF_E_INVALID_FILE);
++	      return NULL;
++	    }
+ 	  elf->state.elf32.shdr
+ 	    = (Elf32_Shdr *) ((char *) ehdr + ehdr->e_shoff);
+ 
+@@ -389,6 +410,11 @@ file_read_elf (int fildes, void *map_add
+ 	{
+ 	  /* We can use the mmapped memory.  */
+ 	  elf->state.elf64.ehdr = ehdr;
++
++	  if (unlikely (ehdr->e_shoff >= maxsize)
++	      || unlikely (ehdr->e_shoff
++			   + scncnt * sizeof (Elf32_Shdr) > maxsize))
++	    goto free_and_out;
+ 	  elf->state.elf64.shdr
+ 	    = (Elf64_Shdr *) ((char *) ehdr + ehdr->e_shoff);
+ 
+--- elfutils/libelf/elf_getarsym.c
++++ elfutils/libelf/elf_getarsym.c
+@@ -181,6 +181,9 @@ elf_getarsym (elf, ptr)
+       size_t index_size = atol (tmpbuf);
+ 
+       if (SARMAG + sizeof (struct ar_hdr) + index_size > elf->maximum_size
++#if SIZE_MAX <= 4294967295U
++	  || n >= SIZE_MAX / sizeof (Elf_Arsym)
++#endif
+ 	  || n * w > index_size)
+ 	{
+ 	  /* This index table cannot be right since it does not fit into
+--- elfutils/libelf/elf_getshdrstrndx.c
++++ elfutils/libelf/elf_getshdrstrndx.c
+@@ -104,10 +104,25 @@ elf_getshdrstrndx (elf, dst)
+ 	      if (elf->map_address != NULL
+ 		  && elf->state.elf32.ehdr->e_ident[EI_DATA] == MY_ELFDATA
+ 		  && (ALLOW_UNALIGNED
+-		      || (((size_t) ((char *) elf->map_address + offset))
++		      || (((size_t) ((char *) elf->map_address
++			   + elf->start_offset + offset))
+ 			  & (__alignof__ (Elf32_Shdr) - 1)) == 0))
+-		/* We can directly access the memory.  */
+-		num = ((Elf32_Shdr *) (elf->map_address + offset))->sh_link;
++		{
++		  /* First see whether the information in the ELF header is
++		     valid and it does not ask for too much.  */
++		  if (unlikely (elf->maximum_size - offset
++				< sizeof (Elf32_Shdr)))
++		    {
++		      /* Something is wrong.  */
++		      __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++		      result = -1;
++		      goto out;
++		    }
++
++		  /* We can directly access the memory.  */
++		  num = ((Elf32_Shdr *) (elf->map_address + elf->start_offset
++					 + offset))->sh_link;
++		}
+ 	      else
+ 		{
+ 		  /* We avoid reading in all the section headers.  Just read
+@@ -142,10 +157,25 @@ elf_getshdrstrndx (elf, dst)
+ 	      if (elf->map_address != NULL
+ 		  && elf->state.elf64.ehdr->e_ident[EI_DATA] == MY_ELFDATA
+ 		  && (ALLOW_UNALIGNED
+-		      || (((size_t) ((char *) elf->map_address + offset))
++		      || (((size_t) ((char *) elf->map_address
++			   + elf->start_offset + offset))
+ 			  & (__alignof__ (Elf64_Shdr) - 1)) == 0))
+-		/* We can directly access the memory.  */
+-		num = ((Elf64_Shdr *) (elf->map_address + offset))->sh_link;
++		{
++		  /* First see whether the information in the ELF header is
++		     valid and it does not ask for too much.  */
++		  if (unlikely (elf->maximum_size - offset
++				< sizeof (Elf64_Shdr)))
++		    {
++		      /* Something is wrong.  */
++		      __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++		      result = -1;
++		      goto out;
++		    }
++
++		  /* We can directly access the memory.  */
++		  num = ((Elf64_Shdr *) (elf->map_address + elf->start_offset
++					 + offset))->sh_link;
++		}
+ 	      else
+ 		{
+ 		  /* We avoid reading in all the section headers.  Just read
+--- elfutils/libelf/elf_newscn.c
++++ elfutils/libelf/elf_newscn.c
+@@ -83,10 +83,18 @@ elf_newscn (elf)
+   else
+     {
+       /* We must allocate a new element.  */
+-      Elf_ScnList *newp;
++      Elf_ScnList *newp = NULL;
+ 
+       assert (elf->state.elf.scnincr > 0);
+ 
++      if (
++#if SIZE_MAX <= 4294967295U
++	  likely (elf->state.elf.scnincr
++		  < SIZE_MAX / 2 / sizeof (Elf_Scn) - sizeof (Elf_ScnList))
++#else
++	  1
++#endif
++	  )
+       newp = (Elf_ScnList *) calloc (sizeof (Elf_ScnList)
+ 				     + ((elf->state.elf.scnincr *= 2)
+ 					* sizeof (Elf_Scn)), 1);
+--- elfutils/libelf/gelf_getdyn.c
++++ elfutils/libelf/gelf_getdyn.c
+@@ -1,5 +1,5 @@
+ /* Get information from dynamic table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -72,7 +72,7 @@ gelf_getdyn (data, ndx, dst)
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -93,7 +93,7 @@ gelf_getdyn (data, ndx, dst)
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, GElf_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+--- elfutils/libelf/gelf_getlib.c
++++ elfutils/libelf/gelf_getlib.c
+@@ -1,5 +1,5 @@
+ /* Get library from table at the given index.
+-   Copyright (C) 2004 Red Hat, Inc.
++   Copyright (C) 2004-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2004.
+ 
+@@ -65,7 +65,7 @@ gelf_getlib (data, ndx, dst)
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+   GElf_Lib *result = NULL;
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Lib) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Lib, data))
+     __libelf_seterrno (ELF_E_INVALID_INDEX);
+   else
+     {
+--- elfutils/libelf/gelf_getmove.c
++++ elfutils/libelf/gelf_getmove.c
+@@ -1,5 +1,5 @@
+ /* Get move structure at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -62,7 +62,7 @@ gelf_getmove (data, ndx, dst)
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Move) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Move, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+--- elfutils/libelf/gelf_getrela.c
++++ elfutils/libelf/gelf_getrela.c
+@@ -1,5 +1,5 @@
+ /* Get RELA relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -50,12 +50,6 @@ gelf_getrela (data, ndx, dst)
+   if (data_scn == NULL)
+     return NULL;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return NULL;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_RELA))
+     {
+       __libelf_seterrno (ELF_E_INVALID_HANDLE);
+@@ -72,7 +66,7 @@ gelf_getrela (data, ndx, dst)
+   if (scn->elf->class == ELFCLASS32)
+     {
+       /* We have to convert the data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+@@ -93,7 +87,7 @@ gelf_getrela (data, ndx, dst)
+     {
+       /* Simply copy the data after we made sure we are actually getting
+ 	 correct data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+--- elfutils/libelf/gelf_getrel.c
++++ elfutils/libelf/gelf_getrel.c
+@@ -1,5 +1,5 @@
+ /* Get REL relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -50,12 +50,6 @@ gelf_getrel (data, ndx, dst)
+   if (data_scn == NULL)
+     return NULL;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return NULL;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_REL))
+     {
+       __libelf_seterrno (ELF_E_INVALID_HANDLE);
+@@ -72,7 +66,7 @@ gelf_getrel (data, ndx, dst)
+   if (scn->elf->class == ELFCLASS32)
+     {
+       /* We have to convert the data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+@@ -92,7 +86,7 @@ gelf_getrel (data, ndx, dst)
+     {
+       /* Simply copy the data after we made sure we are actually getting
+ 	 correct data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+--- elfutils/libelf/gelf_getsym.c
++++ elfutils/libelf/gelf_getsym.c
+@@ -1,5 +1,5 @@
+ /* Get symbol information from symbol table at the given index.
+-   Copyright (C) 1999, 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 1999-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 1999.
+ 
+@@ -69,7 +69,7 @@ gelf_getsym (data, ndx, dst)
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > data->d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, data))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -98,7 +98,7 @@ gelf_getsym (data, ndx, dst)
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Sym) > data->d_size))
++      if (INVALID_NDX (ndx, GElf_Sym, data))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+--- elfutils/libelf/gelf_getsyminfo.c
++++ elfutils/libelf/gelf_getsyminfo.c
+@@ -1,5 +1,5 @@
+ /* Get additional symbol information from symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -63,7 +63,7 @@ gelf_getsyminfo (data, ndx, dst)
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Syminfo) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Syminfo, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+--- elfutils/libelf/gelf_getsymshndx.c
++++ elfutils/libelf/gelf_getsymshndx.c
+@@ -1,6 +1,6 @@
+ /* Get symbol information and separate section index from symbol table
+    at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -69,7 +69,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
+      section index table.  */
+   if (likely (shndxdata_scn != NULL))
+     {
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Word) > shndxdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Word, &shndxdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -89,7 +89,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > symdata->d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, symdata))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -118,7 +118,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Sym) > symdata->d_size))
++      if (INVALID_NDX (ndx, GElf_Sym, symdata))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+--- elfutils/libelf/gelf_getversym.c
++++ elfutils/libelf/gelf_getversym.c
+@@ -1,5 +1,5 @@
+ /* Get symbol version information at the given index.
+-   Copyright (C) 1999, 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 1999-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 1999.
+ 
+@@ -71,7 +71,7 @@ gelf_getversym (data, ndx, dst)
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Versym) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Versym, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       result = NULL;
+--- elfutils/libelf/gelf_update_dyn.c
++++ elfutils/libelf/gelf_update_dyn.c
+@@ -1,5 +1,5 @@
+ /* Update information in dynamic table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -50,12 +50,6 @@ gelf_update_dyn (data, ndx, src)
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_DYN))
+     {
+       /* The type of the data better should match.  */
+@@ -81,7 +75,7 @@ gelf_update_dyn (data, ndx, src)
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -95,7 +89,7 @@ gelf_update_dyn (data, ndx, src)
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+--- elfutils/libelf/gelf_update_lib.c
++++ elfutils/libelf/gelf_update_lib.c
+@@ -1,5 +1,5 @@
+ /* Update library in table at the given index.
+-   Copyright (C) 2004 Red Hat, Inc.
++   Copyright (C) 2004-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2004.
+ 
+@@ -47,12 +47,6 @@ gelf_update_lib (data, ndx, src)
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   Elf_Data_Scn *data_scn = (Elf_Data_Scn *) data;
+   if (unlikely (data_scn->d.d_type != ELF_T_LIB))
+     {
+@@ -66,7 +60,7 @@ gelf_update_lib (data, ndx, src)
+ 
+   /* Check whether we have to resize the data buffer.  */
+   int result = 0;
+-  if (unlikely ((ndx + 1) * sizeof (Elf64_Lib) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, Elf64_Lib, &data_scn->d))
+     __libelf_seterrno (ELF_E_INVALID_INDEX);
+   else
+     {
+--- elfutils/libelf/gelf_update_move.c
++++ elfutils/libelf/gelf_update_move.c
+@@ -1,5 +1,5 @@
+ /* Update move structure at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -54,8 +54,7 @@ gelf_update_move (data, ndx, src)
+   assert (sizeof (GElf_Move) == sizeof (Elf64_Move));
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely (ndx < 0)
+-      || unlikely ((ndx + 1) * sizeof (GElf_Move) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Move, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       return 0;
+--- elfutils/libelf/gelf_update_rela.c
++++ elfutils/libelf/gelf_update_rela.c
+@@ -1,5 +1,5 @@
+ /* Update RELA relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -47,12 +47,6 @@ gelf_update_rela (Elf_Data *dst, int ndx
+   if (dst == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_RELA))
+     {
+       /* The type of the data better should match.  */
+@@ -80,7 +74,7 @@ gelf_update_rela (Elf_Data *dst, int ndx
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -96,7 +90,7 @@ gelf_update_rela (Elf_Data *dst, int ndx
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+--- elfutils/libelf/gelf_update_rel.c
++++ elfutils/libelf/gelf_update_rel.c
+@@ -1,5 +1,5 @@
+ /* Update REL relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -47,12 +47,6 @@ gelf_update_rel (Elf_Data *dst, int ndx,
+   if (dst == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_REL))
+     {
+       /* The type of the data better should match.  */
+@@ -78,7 +72,7 @@ gelf_update_rel (Elf_Data *dst, int ndx,
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -93,7 +87,7 @@ gelf_update_rel (Elf_Data *dst, int ndx,
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+--- elfutils/libelf/gelf_update_sym.c
++++ elfutils/libelf/gelf_update_sym.c
+@@ -1,5 +1,5 @@
+ /* Update symbol information in symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -51,12 +51,6 @@ gelf_update_sym (data, ndx, src)
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_SYM))
+     {
+       /* The type of the data better should match.  */
+@@ -81,7 +75,7 @@ gelf_update_sym (data, ndx, src)
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -104,7 +98,7 @@ gelf_update_sym (data, ndx, src)
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Sym) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Sym, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+--- elfutils/libelf/gelf_update_syminfo.c
++++ elfutils/libelf/gelf_update_syminfo.c
+@@ -1,5 +1,5 @@
+ /* Update additional symbol information in symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -51,12 +51,6 @@ gelf_update_syminfo (data, ndx, src)
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_SYMINFO))
+     {
+       /* The type of the data better should match.  */
+@@ -72,7 +66,7 @@ gelf_update_syminfo (data, ndx, src)
+   rwlock_wrlock (scn->elf->lock);
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Syminfo) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Syminfo, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+--- elfutils/libelf/gelf_update_symshndx.c
++++ elfutils/libelf/gelf_update_symshndx.c
+@@ -1,6 +1,6 @@
+ /* Update symbol information and section index in symbol table at the
+    given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -56,12 +56,6 @@ gelf_update_symshndx (symdata, shndxdata
+   if (symdata == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (symdata_scn->d.d_type != ELF_T_SYM))
+     {
+       /* The type of the data better should match.  */
+@@ -107,7 +101,7 @@ gelf_update_symshndx (symdata, shndxdata
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > symdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, &symdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -130,7 +124,7 @@ gelf_update_symshndx (symdata, shndxdata
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Sym) > symdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Sym, &symdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+--- elfutils/libelf/gelf_update_versym.c
++++ elfutils/libelf/gelf_update_versym.c
+@@ -1,5 +1,5 @@
+ /* Update symbol version information.
+-   Copyright (C) 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2001-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2001.
+ 
+@@ -54,8 +54,7 @@ gelf_update_versym (data, ndx, src)
+   assert (sizeof (GElf_Versym) == sizeof (Elf64_Versym));
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely (ndx < 0)
+-      || unlikely ((ndx + 1) * sizeof (GElf_Versym) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Versym, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       return 0;
+--- elfutils/libelf/libelfP.h
++++ elfutils/libelf/libelfP.h
+@@ -587,4 +587,8 @@ extern uint32_t __libelf_crc32 (uint32_t
+ /* Align offset to 4 bytes as needed for note name and descriptor data.  */
+ #define NOTE_ALIGN(n)	(((n) + 3) & -4U)
+ 
++/* Convenience macro.  */
++#define INVALID_NDX(ndx, type, data) \
++  unlikely ((data)->d_size / sizeof (type) <= (unsigned int) (ndx))
++
+ #endif  /* libelfP.h */
+--- elfutils/src/ChangeLog
++++ elfutils/src/ChangeLog
+@@ -344,6 +344,12 @@
+ 
+ 	* readelf.c (dwarf_attr_string): Grok DW_AT_GNU_odr_signature.
+ 
++2011-03-23  Petr Machata  <pmachata@redhat.com>
++
++	* readelf.c (handle_dynamic, handle_relocs_rel)
++	(handle_relocs_rela, handle_versym, print_liblist):
++	Use gelf_fsize instead of relying on shdr->sh_entsize.
++
+ 2011-02-11  Roland McGrath  <roland@redhat.com>
+ 
+ 	* elfcmp.c (verbose): New variable.
+@@ -2056,6 +2062,16 @@
+ 	object symbols or symbols with unknown type.
+ 	(check_rel): Likewise.
+ 
++2005-06-09  Roland McGrath  <roland@redhat.com>
++
++	* readelf.c (handle_dynamic, handle_symtab): Check for bogus sh_link.
++	(handle_verneed, handle_verdef, handle_versym, handle_hash): Likewise.
++	(handle_scngrp): Check for bogus sh_info.
++
++	* strip.c (handle_elf): Check for bogus values in sh_link, sh_info,
++	st_shndx, e_shstrndx, and SHT_GROUP or SHT_SYMTAB_SHNDX data.
++	Don't use assert on input values, instead bail with "illformed" error.
++
+ 2005-06-08  Roland McGrath  <roland@redhat.com>
+ 
+ 	* readelf.c (print_ops): Add consts.
+@@ -2101,6 +2117,19 @@
+ 
+ 	* readelf.c (dwarf_tag_string): Add new tags.
+ 
++2005-05-17  Jakub Jelinek  <jakub@redhat.com>
++
++	* elflint.c (check_hash): Don't check entries beyond end of section.
++	(check_note): Don't crash if gelf_rawchunk fails.
++	(section_name): Return <invalid> if gelf_getshdr returns NULL.
++
++2005-05-14  Jakub Jelinek  <jakub@redhat.com>
++
++	* elflint.c (section_name): Return "<invalid>" instead of
++	crashing on invalid section name.
++	(check_symtab, is_rel_dyn, check_rela, check_rel, check_dynamic,
++	check_symtab_shndx, check_hash, check_versym): Robustify.
++
+ 2005-05-08  Roland McGrath  <roland@redhat.com>
+ 
+ 	* strip.c (handle_elf): Don't translate hash and versym data formats,
+--- elfutils/src/elflint.c
++++ elfutils/src/elflint.c
+@@ -123,6 +123,10 @@ static uint32_t shstrndx;
+ /* Array to count references in section groups.  */
+ static int *scnref;
+ 
++/* Numbers of sections and program headers.  */
++static unsigned int shnum;
++static unsigned int phnum;
++
+ 
+ int
+ main (int argc, char *argv[])
+@@ -311,10 +315,19 @@ section_name (Ebl *ebl, int idx)
+ {
+   GElf_Shdr shdr_mem;
+   GElf_Shdr *shdr;
++  const char *ret;
++
++  if ((unsigned int) idx > shnum)
++    return "<invalid>";
+ 
+   shdr = gelf_getshdr (elf_getscn (ebl->elf, idx), &shdr_mem);
++  if (shdr == NULL)
++    return "<invalid>";
+ 
+-  return elf_strptr (ebl->elf, shstrndx, shdr->sh_name);
++  ret = elf_strptr (ebl->elf, shstrndx, shdr->sh_name);
++  if (ret == NULL)
++    return "<invalid>";
++  return ret;
+ }
+ 
+ 
+@@ -337,11 +350,6 @@ static const int valid_e_machine[] =
+   (sizeof (valid_e_machine) / sizeof (valid_e_machine[0]))
+ 
+ 
+-/* Numbers of sections and program headers.  */
+-static unsigned int shnum;
+-static unsigned int phnum;
+-
+-
+ static void
+ check_elf_header (Ebl *ebl, GElf_Ehdr *ehdr, size_t size)
+ {
+@@ -625,7 +633,8 @@ section [%2d] '%s': symbol table cannot
+ 	  }
+       }
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_SYM, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_SYM, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext ("\
+ section [%2u] '%s': entry size is does not match ElfXX_Sym\n"),
+ 	   idx, section_name (ebl, idx));
+@@ -663,7 +672,7 @@ section [%2d] '%s': XINDEX for zeroth en
+ 	       xndxscnidx, section_name (ebl, xndxscnidx));
+     }
+ 
+-  for (size_t cnt = 1; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (size_t cnt = 1; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       sym = gelf_getsymshndx (data, xndxdata, cnt, &sym_mem, &xndx);
+       if (sym == NULL)
+@@ -683,7 +692,8 @@ section [%2d] '%s': symbol %zu: invalid
+       else
+ 	{
+ 	  name = elf_strptr (ebl->elf, shdr->sh_link, sym->st_name);
+-	  assert (name != NULL);
++	  assert (name != NULL
++		  || strshdr->sh_type != SHT_STRTAB);
+ 	}
+ 
+       if (sym->st_shndx == SHN_XINDEX)
+@@ -1032,9 +1042,11 @@ is_rel_dyn (Ebl *ebl, const GElf_Ehdr *e
+     {
+       GElf_Shdr rcshdr_mem;
+       const GElf_Shdr *rcshdr = gelf_getshdr (scn, &rcshdr_mem);
+-      assert (rcshdr != NULL);
+ 
+-      if (rcshdr->sh_type == SHT_DYNAMIC)
++      if (rcshdr == NULL)
++	break;
++
++      if (rcshdr->sh_type == SHT_DYNAMIC && rcshdr->sh_entsize)
+ 	{
+ 	  /* Found the dynamic section.  Look through it.  */
+ 	  Elf_Data *d = elf_getdata (scn, NULL);
+@@ -1044,7 +1056,9 @@ is_rel_dyn (Ebl *ebl, const GElf_Ehdr *e
+ 	    {
+ 	      GElf_Dyn dyn_mem;
+ 	      GElf_Dyn *dyn = gelf_getdyn (d, cnt, &dyn_mem);
+-	      assert (dyn != NULL);
++
++	      if (dyn == NULL)
++		break;
+ 
+ 	      if (dyn->d_tag == DT_RELCOUNT)
+ 		{
+@@ -1058,7 +1072,9 @@ section [%2d] '%s': DT_RELCOUNT used for
+ 		      /* Does the number specified number of relative
+ 			 relocations exceed the total number of
+ 			 relocations?  */
+-		      if (dyn->d_un.d_val > shdr->sh_size / shdr->sh_entsize)
++		      if (shdr->sh_entsize != 0
++			  && dyn->d_un.d_val > (shdr->sh_size
++						/ shdr->sh_entsize))
+ 			ERROR (gettext ("\
+ section [%2d] '%s': DT_RELCOUNT value %d too high for this section\n"),
+ 			       idx, section_name (ebl, idx),
+@@ -1218,7 +1234,8 @@ section [%2d] '%s': no relocations for m
+ 	}
+     }
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext (reltype == ELF_T_RELA ? "\
+ section [%2d] '%s': section entry size does not match ElfXX_Rela\n" : "\
+ section [%2d] '%s': section entry size does not match ElfXX_Rel\n"),
+@@ -1441,7 +1458,8 @@ check_rela (Ebl *ebl, GElf_Ehdr *ehdr, G
+   Elf_Data *symdata = elf_getdata (symscn, NULL);
+   enum load_state state = state_undecided;
+ 
+-  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
++  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Rela rela_mem;
+       GElf_Rela *rela = gelf_getrela (data, cnt, &rela_mem);
+@@ -1491,7 +1509,8 @@ check_rel (Ebl *ebl, GElf_Ehdr *ehdr, GE
+   Elf_Data *symdata = elf_getdata (symscn, NULL);
+   enum load_state state = state_undecided;
+ 
+-  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
++  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Rel rel_mem;
+       GElf_Rel *rel = gelf_getrel (data, cnt, &rel_mem);
+@@ -1590,7 +1609,8 @@ section [%2d] '%s': referenced as string
+ 	   shdr->sh_link, section_name (ebl, shdr->sh_link),
+ 	   idx, section_name (ebl, idx));
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext ("\
+ section [%2d] '%s': section entry size does not match ElfXX_Dyn\n"),
+ 	   idx, section_name (ebl, idx));
+@@ -1600,7 +1620,7 @@ section [%2d] '%s': section entry size d
+ 	   idx, section_name (ebl, idx));
+ 
+   bool non_null_warned = false;
+-  for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Dyn dyn_mem;
+       GElf_Dyn *dyn = gelf_getdyn (data, cnt, &dyn_mem);
+@@ -1872,6 +1892,8 @@ section [%2d] '%s': entry size does not
+ 	   idx, section_name (ebl, idx));
+ 
+   if (symshdr != NULL
++      && shdr->sh_entsize
++      && symshdr->sh_entsize
+       && (shdr->sh_size / shdr->sh_entsize
+ 	  < symshdr->sh_size / symshdr->sh_entsize))
+     ERROR (gettext ("\
+@@ -1898,6 +1920,12 @@ section [%2d] '%s': extended section ind
+     }
+ 
+   Elf_Data *data = elf_getdata (elf_getscn (ebl->elf, idx), NULL);
++  if (data == NULL)
++    {
++      ERROR (gettext ("section [%2d] '%s': cannot get section data\n"),
++ 	     idx, section_name (ebl, idx));
++      return;
++    }
+ 
+   if (*((Elf32_Word *) data->d_buf) != 0)
+     ERROR (gettext ("symbol 0 should have zero extended section index\n"));
+@@ -1940,7 +1968,7 @@ section [%2d] '%s': hash table section i
+ 
+   size_t maxidx = nchain;
+ 
+-  if (symshdr != NULL)
++  if (symshdr != NULL && symshdr->sh_entsize != 0)
+     {
+       size_t symsize = symshdr->sh_size / symshdr->sh_entsize;
+ 
+@@ -1951,18 +1979,28 @@ section [%2d] '%s': hash table section i
+       maxidx = symsize;
+     }
+ 
++  Elf32_Word *buf = (Elf32_Word *) data->d_buf;
++  Elf32_Word *end = (Elf32_Word *) ((char *) data->d_buf + shdr->sh_size);
+   size_t cnt;
+   for (cnt = 2; cnt < 2 + nbucket; ++cnt)
+-    if (((Elf32_Word *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash bucket reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2);
++    }
+ 
+   for (; cnt < 2 + nbucket + nchain; ++cnt)
+-    if (((Elf32_Word *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash chain reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2 - nbucket);
++    }
+ }
+ 
+ 
+@@ -1992,18 +2030,28 @@ section [%2d] '%s': hash table section i
+       maxidx = symsize;
+     }
+ 
++  Elf64_Xword *buf = (Elf64_Xword *) data->d_buf;
++  Elf64_Xword *end = (Elf64_Xword *) ((char *) data->d_buf + shdr->sh_size);
+   size_t cnt;
+   for (cnt = 2; cnt < 2 + nbucket; ++cnt)
+-    if (((Elf64_Xword *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash bucket reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2);
++    }
+ 
+   for (; cnt < 2 + nbucket + nchain; ++cnt)
+-    if (((Elf64_Xword *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash chain reference %" PRIu64 " out of bounds\n"),
+-	     idx, section_name (ebl, idx), (uint64_t) (cnt - 2 - nbucket));
++	       idx, section_name (ebl, idx), (uint64_t) cnt - 2 - nbucket);
++    }
+ }
+ 
+ 
+@@ -2028,7 +2076,7 @@ section [%2d] '%s': bitmask size not pow
+   if (shdr->sh_size < (4 + bitmask_words + nbuckets) * sizeof (Elf32_Word))
+     {
+       ERROR (gettext ("\
+-section [%2d] '%s': hash table section is too small (is %ld, expected at least%ld)\n"),
++section [%2d] '%s': hash table section is too small (is %ld, expected at least %ld)\n"),
+ 	     idx, section_name (ebl, idx), (long int) shdr->sh_size,
+ 	     (long int) ((4 + bitmask_words + nbuckets) * sizeof (Elf32_Word)));
+       return;
+@@ -2700,8 +2748,9 @@ section [%2d] '%s' refers in sh_link to
+ 
+   /* The number of elements in the version symbol table must be the
+      same as the number of symbols.  */
+-  if (shdr->sh_size / shdr->sh_entsize
+-      != symshdr->sh_size / symshdr->sh_entsize)
++  if (shdr->sh_entsize && symshdr->sh_entsize
++      && (shdr->sh_size / shdr->sh_entsize
++	  != symshdr->sh_size / symshdr->sh_entsize))
+     ERROR (gettext ("\
+ section [%2d] '%s' has different number of entries than symbol table [%2d] '%s'\n"),
+ 	   idx, section_name (ebl, idx),
+--- elfutils/src/readelf.c
++++ elfutils/src/readelf.c
+@@ -1189,6 +1189,8 @@ handle_scngrp (Ebl *ebl, Elf_Scn *scn, G
+   Elf32_Word *grpref = (Elf32_Word *) data->d_buf;
+ 
+   GElf_Sym sym_mem;
++  GElf_Sym *sym = gelf_getsym (symdata, shdr->sh_info, &sym_mem);
++
+   printf ((grpref[0] & GRP_COMDAT)
+ 	  ? ngettext ("\
+ \nCOMDAT section group [%2zu] '%s' with signature '%s' contains %zu entry:\n",
+@@ -1201,8 +1203,8 @@ handle_scngrp (Ebl *ebl, Elf_Scn *scn, G
+ 		      data->d_size / sizeof (Elf32_Word) - 1),
+ 	  elf_ndxscn (scn),
+ 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name),
+-	  elf_strptr (ebl->elf, symshdr->sh_link,
+-		      gelf_getsym (symdata, shdr->sh_info, &sym_mem)->st_name)
++	  (sym == NULL ? NULL
++	   : elf_strptr (ebl->elf, symshdr->sh_link, sym->st_name))
+ 	  ?: gettext ("<INVALID SYMBOL>"),
+ 	  data->d_size / sizeof (Elf32_Word) - 1);
+ 
+@@ -1353,10 +1355,12 @@ static void
+ handle_dynamic (Ebl *ebl, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink;
+   Elf_Data *data;
+   size_t cnt;
+   size_t shstrndx;
++  size_t sh_entsize;
+ 
+   /* Get the data of the section.  */
+   data = elf_getdata (scn, NULL);
+@@ -1368,21 +1372,26 @@ handle_dynamic (Ebl *ebl, Elf_Scn *scn,
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  sh_entsize = gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT);
++
++  glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link), &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   printf (ngettext ("\
+ \nDynamic segment contains %lu entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+ \nDynamic segment contains %lu entries:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+-		    shdr->sh_size / shdr->sh_entsize),
+-	  (unsigned long int) (shdr->sh_size / shdr->sh_entsize),
++		    shdr->sh_size / sh_entsize),
++	  (unsigned long int) (shdr->sh_size / sh_entsize),
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+   fputs_unlocked (gettext ("  Type              Value\n"), stdout);
+ 
+-  for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Dyn dynmem;
+       GElf_Dyn *dyn = gelf_getdyn (data, cnt, &dynmem);
+@@ -1531,7 +1540,8 @@ static void
+ handle_relocs_rel (Ebl *ebl, GElf_Ehdr *ehdr, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  int nentries = shdr->sh_size / shdr->sh_entsize;
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
++  int nentries = shdr->sh_size / sh_entsize;
+ 
+   /* Get the data of the section.  */
+   Elf_Data *data = elf_getdata (scn, NULL);
+@@ -1717,7 +1727,8 @@ static void
+ handle_relocs_rela (Ebl *ebl, GElf_Ehdr *ehdr, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  int nentries = shdr->sh_size / shdr->sh_entsize;
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
++  int nentries = shdr->sh_size / sh_entsize;
+ 
+   /* Get the data of the section.  */
+   Elf_Data *data = elf_getdata (scn, NULL);
+@@ -1964,6 +1975,13 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, G
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   /* Now we can compute the number of entries in the section.  */
+   unsigned int nsyms = data->d_size / (class == ELFCLASS32
+ 				       ? sizeof (Elf32_Sym)
+@@ -1974,15 +1992,12 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, G
+ 		    nsyms),
+ 	  (unsigned int) elf_ndxscn (scn),
+ 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name), nsyms);
+-  GElf_Shdr glink;
+   printf (ngettext (" %lu local symbol  String table: [%2u] '%s'\n",
+ 		    " %lu local symbols  String table: [%2u] '%s'\n",
+ 		    shdr->sh_info),
+ 	  (unsigned long int) shdr->sh_info,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   fputs_unlocked (class == ELFCLASS32
+ 		  ? gettext ("\
+@@ -2218,7 +2233,13 @@ handle_verneed (Ebl *ebl, Elf_Scn *scn,
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   printf (ngettext ("\
+ \nVersion needs section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2229,9 +2250,7 @@ handle_verneed (Ebl *ebl, Elf_Scn *scn,
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   unsigned int offset = 0;
+   for (int cnt = shdr->sh_info; --cnt >= 0; )
+@@ -2284,8 +2303,14 @@ handle_verdef (Ebl *ebl, Elf_Scn *scn, G
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   int class = gelf_getclass (ebl->elf);
+-  GElf_Shdr glink;
+   printf (ngettext ("\
+ \nVersion definition section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2297,9 +2322,7 @@ handle_verdef (Ebl *ebl, Elf_Scn *scn, G
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   unsigned int offset = 0;
+   for (int cnt = shdr->sh_info; --cnt >= 0; )
+@@ -2561,25 +2584,30 @@ handle_versym (Ebl *ebl, Elf_Scn *scn, G
+       filename = NULL;
+     }
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_HALF, 1, EV_CURRENT);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   /* Print the header.  */
+-  GElf_Shdr glink;
+   printf (ngettext ("\
+ \nVersion symbols section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'",
+ 		    "\
+ \nVersion symbols section [%2u] '%s' contains %d entries:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'",
+-		    shdr->sh_size / shdr->sh_entsize),
++		    shdr->sh_size / sh_entsize),
+ 	  (unsigned int) elf_ndxscn (scn),
+ 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name),
+-	  (int) (shdr->sh_size / shdr->sh_entsize),
++	  (int) (shdr->sh_size / sh_entsize),
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   /* Now we can finally look at the actual contents of this section.  */
+-  for (unsigned int cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (unsigned int cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       if (cnt % 2 == 0)
+ 	printf ("\n %4d:", cnt);
+@@ -2628,7 +2656,17 @@ print_hash_info (Ebl *ebl, Elf_Scn *scn,
+   for (Elf32_Word cnt = 0; cnt < nbucket; ++cnt)
+     ++counts[lengths[cnt]];
+ 
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf,
++					       shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    {
++      error (0, 0, gettext ("invalid sh_link value in section %Zu"),
++	     elf_ndxscn (scn));
++      return;
++    }
++
+   printf (ngettext ("\
+ \nHistogram for bucket list length in section [%2u] '%s' (total of %d bucket):\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2641,9 +2679,7 @@ print_hash_info (Ebl *ebl, Elf_Scn *scn,
+ 	  shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   if (extrastr != NULL)
+     fputs (extrastr, stdout);
+@@ -2903,7 +2939,8 @@ print_liblist (Ebl *ebl)
+ 
+       if (shdr != NULL && shdr->sh_type == SHT_GNU_LIBLIST)
+ 	{
+-	  int nentries = shdr->sh_size / shdr->sh_entsize;
++	  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_LIB, 1, EV_CURRENT);
++	  int nentries = shdr->sh_size / sh_entsize;
+ 	  printf (ngettext ("\
+ \nLibrary list section [%2zu] '%s' at offset %#0" PRIx64 " contains %d entry:\n",
+ 			    "\
+@@ -4164,6 +4201,16 @@ print_debug_aranges_section (Dwfl_Module
+       return;
+     }
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink;
++  glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link), &glink_mem);
++  if (glink == NULL)
++    {
++      error (0, 0, gettext ("invalid sh_link value in section %Zu"),
++	     elf_ndxscn (scn));
++      return;
++    }
++
+   printf (ngettext ("\
+ \nDWARF section [%2zu] '%s' at offset %#" PRIx64 " contains %zu entry:\n",
+ 		    "\
+--- elfutils/src/strip.c
++++ elfutils/src/strip.c
+@@ -564,6 +564,11 @@ handle_elf (int fd, Elf *elf, const char
+       goto fail_close;
+     }
+ 
++  if (shstrndx >= shnum)
++    goto illformed;
++
++#define elf_assert(test) do { if (!(test)) goto illformed; } while (0)
++
+   /* Storage for section information.  We leave room for two more
+      entries since we unconditionally create a section header string
+      table.  Maybe some weird tool created an ELF file without one.
+@@ -585,7 +590,7 @@ handle_elf (int fd, Elf *elf, const char
+     {
+       /* This should always be true (i.e., there should not be any
+ 	 holes in the numbering).  */
+-      assert (elf_ndxscn (scn) == cnt);
++      elf_assert (elf_ndxscn (scn) == cnt);
+ 
+       shdr_info[cnt].scn = scn;
+ 
+@@ -598,6 +603,7 @@ handle_elf (int fd, Elf *elf, const char
+ 					shdr_info[cnt].shdr.sh_name);
+       if (shdr_info[cnt].name == NULL)
+ 	{
++	illformed:
+ 	  error (0, 0, gettext ("illformed file '%s'"), fname);
+ 	  goto fail_close;
+ 	}
+@@ -607,6 +613,8 @@ handle_elf (int fd, Elf *elf, const char
+ 
+       /* Remember the shdr.sh_link value.  */
+       shdr_info[cnt].old_sh_link = shdr_info[cnt].shdr.sh_link;
++      if (shdr_info[cnt].old_sh_link >= shnum)
++	goto illformed;
+ 
+       /* Sections in files other than relocatable object files which
+ 	 are not loaded can be freely moved by us.  In relocatable
+@@ -619,7 +627,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	 appropriate reference.  */
+       if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB_SHNDX))
+ 	{
+-	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
++	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
+ 	  shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx = cnt;
+ 	}
+       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GROUP))
+@@ -636,7 +644,12 @@ handle_elf (int fd, Elf *elf, const char
+ 	  for (inner = 1;
+ 	       inner < shdr_info[cnt].data->d_size / sizeof (Elf32_Word);
+ 	       ++inner)
++	    {
++	      if (grpref[inner] < shnum)
+ 	    shdr_info[grpref[inner]].group_idx = cnt;
++	      else
++		goto illformed;
++	    }
+ 
+ 	  if (inner == 1 || (inner == 2 && (grpref[0] & GRP_COMDAT) == 0))
+ 	    /* If the section group contains only one element and this
+@@ -647,7 +660,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	}
+       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GNU_versym))
+ 	{
+-	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
++	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
+ 	  shdr_info[shdr_info[cnt].shdr.sh_link].version_idx = cnt;
+ 	}
+ 
+@@ -655,7 +668,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	 discarded right away.  */
+       if ((shdr_info[cnt].shdr.sh_flags & SHF_GROUP) != 0)
+ 	{
+-	  assert (shdr_info[cnt].group_idx != 0);
++	  elf_assert (shdr_info[cnt].group_idx != 0);
+ 
+ 	  if (shdr_info[shdr_info[cnt].group_idx].idx == 0)
+ 	    {
+@@ -731,10 +744,14 @@ handle_elf (int fd, Elf *elf, const char
+ 	    {
+ 	      /* If a relocation section is marked as being removed make
+ 		 sure the section it is relocating is removed, too.  */
+-	      if ((shdr_info[cnt].shdr.sh_type == SHT_REL
++	      if (shdr_info[cnt].shdr.sh_type == SHT_REL
+ 		   || shdr_info[cnt].shdr.sh_type == SHT_RELA)
+-		  && shdr_info[shdr_info[cnt].shdr.sh_info].idx != 0)
+-		shdr_info[cnt].idx = 1;
++		{
++		  if (shdr_info[cnt].shdr.sh_info >= shnum)
++		    goto illformed;
++		  else if (shdr_info[shdr_info[cnt].shdr.sh_info].idx != 0)
++		    shdr_info[cnt].idx = 1;
++		}
+ 
+ 	      /* If a group section is marked as being removed make
+ 		 sure all the sections it contains are being removed, too.  */
+@@ -778,7 +795,7 @@ handle_elf (int fd, Elf *elf, const char
+ 		  if (shdr_info[cnt].symtab_idx != 0
+ 		      && shdr_info[shdr_info[cnt].symtab_idx].data == NULL)
+ 		    {
+-		      assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
++		      elf_assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
+ 
+ 		      shdr_info[shdr_info[cnt].symtab_idx].data
+ 			= elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
+@@ -818,6 +835,9 @@ handle_elf (int fd, Elf *elf, const char
+ 		      else if (scnidx == SHN_XINDEX)
+ 			scnidx = xndx;
+ 
++		      if (scnidx >= shnum)
++			goto illformed;
++
+ 		      if (shdr_info[scnidx].idx == 0)
+ 			/* This symbol table has a real symbol in
+ 			   a discarded section.  So preserve the
+@@ -848,12 +868,16 @@ handle_elf (int fd, Elf *elf, const char
+ 		}
+ 
+ 	      /* Handle references through sh_info.  */
+-	      if (SH_INFO_LINK_P (&shdr_info[cnt].shdr)
+-		  && shdr_info[shdr_info[cnt].shdr.sh_info].idx == 0)
++	      if (SH_INFO_LINK_P (&shdr_info[cnt].shdr))
++		{
++		  if (shdr_info[cnt].shdr.sh_info >= shnum)
++		    goto illformed;
++		  else if ( shdr_info[shdr_info[cnt].shdr.sh_info].idx == 0)
+ 		{
+ 		  shdr_info[shdr_info[cnt].shdr.sh_info].idx = 1;
+ 		  changes |= shdr_info[cnt].shdr.sh_info < cnt;
+ 		}
++		}
+ 
+ 	      /* Mark the section as investigated.  */
+ 	      shdr_info[cnt].idx = 2;
+@@ -994,7 +1018,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	  error (EXIT_FAILURE, 0, gettext ("while generating output file: %s"),
+ 		 elf_errmsg (-1));
+ 
+-	assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
++	elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
+ 
+ 	/* Add this name to the section header string table.  */
+ 	shdr_info[cnt].se = ebl_strtabadd (shst, shdr_info[cnt].name, 0);
+@@ -1031,7 +1055,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	error (EXIT_FAILURE, 0,
+ 	       gettext ("while create section header section: %s"),
+ 	       elf_errmsg (-1));
+-      assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
++      elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
+ 
+       shdr_info[cnt].data = elf_newdata (shdr_info[cnt].newscn);
+       if (shdr_info[cnt].data == NULL)
+@@ -1087,7 +1111,7 @@ handle_elf (int fd, Elf *elf, const char
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("while create section header section: %s"),
+ 	   elf_errmsg (-1));
+-  assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
++  elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
+ 
+   /* Finalize the string table and fill in the correct indices in the
+      section headers.  */
+@@ -1177,20 +1201,20 @@ handle_elf (int fd, Elf *elf, const char
+ 		    shndxdata = elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
+ 					     NULL);
+ 
+-		    assert ((versiondata->d_size / sizeof (Elf32_Word))
++		    elf_assert ((versiondata->d_size / sizeof (Elf32_Word))
+ 			    >= shdr_info[cnt].data->d_size / elsize);
+ 		  }
+ 
+ 		if (shdr_info[cnt].version_idx != 0)
+ 		  {
+-		    assert (shdr_info[cnt].shdr.sh_type == SHT_DYNSYM);
++		    elf_assert (shdr_info[cnt].shdr.sh_type == SHT_DYNSYM);
+ 		    /* This section has associated version
+ 		       information.  We have to modify that
+ 		       information, too.  */
+ 		    versiondata = elf_getdata (shdr_info[shdr_info[cnt].version_idx].scn,
+ 					       NULL);
+ 
+-		    assert ((versiondata->d_size / sizeof (GElf_Versym))
++		    elf_assert ((versiondata->d_size / sizeof (GElf_Versym))
+ 			    >= shdr_info[cnt].data->d_size / elsize);
+ 		  }
+ 
+@@ -1245,7 +1269,7 @@ handle_elf (int fd, Elf *elf, const char
+ 		      sec = shdr_info[sym->st_shndx].idx;
+ 		    else
+ 		      {
+-			assert (shndxdata != NULL);
++			elf_assert (shndxdata != NULL);
+ 
+ 			sec = shdr_info[xshndx].idx;
+ 		      }
+@@ -1266,7 +1290,7 @@ handle_elf (int fd, Elf *elf, const char
+ 			    nxshndx = sec;
+ 			  }
+ 
+-			assert (sec < SHN_LORESERVE || shndxdata != NULL);
++			elf_assert (sec < SHN_LORESERVE || shndxdata != NULL);
+ 
+ 			if ((inner != destidx || nshndx != sym->st_shndx
+ 			     || (shndxdata != NULL && nxshndx != xshndx))
+@@ -1293,9 +1317,11 @@ handle_elf (int fd, Elf *elf, const char
+ 		      {
+ 			size_t sidx = (sym->st_shndx != SHN_XINDEX
+ 					? sym->st_shndx : xshndx);
+-			assert (GELF_ST_TYPE (sym->st_info) == STT_SECTION
+-				|| (shdr_info[sidx].shdr.sh_type == SHT_GROUP
+-				    && shdr_info[sidx].shdr.sh_info == inner));
++			elf_assert (GELF_ST_TYPE (sym->st_info) == STT_SECTION
++				    || ((shdr_info[sidx].shdr.sh_type
++					 == SHT_GROUP)
++					&& (shdr_info[sidx].shdr.sh_info
++					    == inner)));
+ 		      }
+ 		  }
+ 
+@@ -1483,11 +1509,11 @@ handle_elf (int fd, Elf *elf, const char
+ 		  {
+ 		    GElf_Sym sym_mem;
+ 		    GElf_Sym *sym = gelf_getsym (symd, inner, &sym_mem);
+-		    assert (sym != NULL);
++		    elf_assert (sym != NULL);
+ 
+ 		    const char *name = elf_strptr (elf, strshndx,
+ 						   sym->st_name);
+-		    assert (name != NULL);
++		    elf_assert (name != NULL);
+ 		    size_t hidx = elf_hash (name) % nbucket;
+ 
+ 		    if (bucket[hidx] == 0)
+@@ -1506,8 +1532,8 @@ handle_elf (int fd, Elf *elf, const char
+ 	    else
+ 	      {
+ 		/* Alpha and S390 64-bit use 64-bit SHT_HASH entries.  */
+-		assert (shdr_info[cnt].shdr.sh_entsize
+-			== sizeof (Elf64_Xword));
++		elf_assert (shdr_info[cnt].shdr.sh_entsize
++                            == sizeof (Elf64_Xword));
+ 
+ 		Elf64_Xword *bucket = (Elf64_Xword *) hashd->d_buf;
+ 
+@@ -1537,11 +1563,11 @@ handle_elf (int fd, Elf *elf, const char
+ 		  {
+ 		    GElf_Sym sym_mem;
+ 		    GElf_Sym *sym = gelf_getsym (symd, inner, &sym_mem);
+-		    assert (sym != NULL);
++		    elf_assert (sym != NULL);
+ 
+ 		    const char *name = elf_strptr (elf, strshndx,
+ 						   sym->st_name);
+-		    assert (name != NULL);
++		    elf_assert (name != NULL);
+ 		    size_t hidx = elf_hash (name) % nbucket;
+ 
+ 		    if (bucket[hidx] == 0)
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff
new file mode 100644
index 0000000..e8d8df5
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff
@@ -0,0 +1,796 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.155/backends/parisc_init.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/parisc_init.c
+@@ -0,0 +1,74 @@
++/* Initialization of PA-RISC specific backend library.
++   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++   Written by Ulrich Drepper <drepper@redhat.com>, 2002.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#define BACKEND		parisc_
++#define RELOC_PREFIX	R_PARISC_
++#include "libebl_CPU.h"
++#include "libebl_parisc.h"
++
++/* This defines the common reloc hooks based on parisc_reloc.def.  */
++#include "common-reloc.c"
++
++
++const char *
++parisc_init (elf, machine, eh, ehlen)
++     Elf *elf __attribute__ ((unused));
++     GElf_Half machine __attribute__ ((unused));
++     Ebl *eh;
++     size_t ehlen;
++{
++  int pa64 = 0;
++
++  /* Check whether the Elf_BH object has a sufficent size.  */
++  if (ehlen < sizeof (Ebl))
++    return NULL;
++
++  if (elf) {
++    GElf_Ehdr ehdr_mem;
++    GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
++    if (ehdr && (ehdr->e_flags & EF_PARISC_WIDE))
++      pa64 = 1;
++  }
++  /* We handle it.  */
++  eh->name = "PA-RISC";
++  parisc_init_reloc (eh);
++  HOOK (eh, reloc_simple_type);
++  HOOK (eh, machine_flag_check);
++  HOOK (eh, symbol_type_name);
++  HOOK (eh, segment_type_name);
++  HOOK (eh, section_type_name);
++  HOOK (eh, register_info);
++  if (pa64)
++    eh->return_value_location = parisc_return_value_location_64;
++  else
++    eh->return_value_location = parisc_return_value_location_32;
++
++  return MODVERSION;
++}
+Index: elfutils-0.155/backends/parisc_regs.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/parisc_regs.c
+@@ -0,0 +1,159 @@
++/* Register names and numbers for PA-RISC DWARF.
++   Copyright (C) 2005, 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <string.h>
++#include <dwarf.h>
++
++#define BACKEND parisc_
++#include "libebl_CPU.h"
++
++ssize_t
++parisc_register_info (Ebl *ebl, int regno, char *name, size_t namelen,
++		     const char **prefix, const char **setname,
++		     int *bits, int *type)
++{
++  int pa64 = 0;
++
++  if (ebl->elf) {
++    GElf_Ehdr ehdr_mem;
++    GElf_Ehdr *ehdr = gelf_getehdr (ebl->elf, &ehdr_mem);
++    if (ehdr->e_flags & EF_PARISC_WIDE)
++      pa64 = 1;
++  }
++
++  int nregs = pa64 ? 127 : 128;
++
++  if (name == NULL)
++    return nregs;
++
++  if (regno < 0 || regno >= nregs || namelen < 6)
++    return -1;
++
++  *prefix = "%";
++
++  if (regno < 32)
++  {
++    *setname = "integer";
++    *type = DW_ATE_signed;
++    if (pa64)
++    {
++	*bits = 64;
++    }
++    else
++    {
++    	*bits = 32;
++    }
++  }
++  else if (regno == 32)
++  {
++    *setname = "special";
++    if (pa64)
++    {
++	*bits = 6;
++    }
++    else
++    {
++    	*bits = 5;
++    }
++    *type = DW_ATE_unsigned;
++  }
++  else
++  {
++    *setname = "FPU";
++    *type = DW_ATE_float;
++    if (pa64)
++    {
++	*bits = 64;
++    }
++    else
++    {
++    	*bits = 32;
++    }
++  }
++
++  if (regno < 33) {
++    switch (regno)
++      {
++      case 0 ... 9:
++        name[0] = 'r';
++        name[1] = regno + '0';
++        namelen = 2;
++        break;
++      case 10 ... 31:
++        name[0] = 'r';
++        name[1] = regno / 10 + '0';
++        name[2] = regno % 10 + '0';
++        namelen = 3;
++        break;
++      case 32:
++	*prefix = NULL;
++	name[0] = 'S';
++	name[1] = 'A';
++	name[2] = 'R';
++	namelen = 3;
++	break;
++      }
++  }
++  else {
++    if (pa64 && ((regno - 72) % 2)) {
++      *setname = NULL;
++      return 0;
++    }
++
++    switch (regno)
++      {
++      case 72 + 0 ... 72 + 11:
++        name[0] = 'f';
++	name[1] = 'r';
++        name[2] = (regno + 8 - 72) / 2 + '0';
++        namelen = 3;
++        if ((regno + 8 - 72) % 2) {
++	  name[3] = 'R';
++	  namelen++;
++        }
++        break;
++      case 72 + 12 ... 72 + 55:
++        name[0] = 'f';
++	name[1] = 'r';
++        name[2] = (regno + 8 - 72) / 2 / 10 + '0';
++        name[3] = (regno + 8 - 72) / 2 % 10 + '0';
++        namelen = 4;
++        if ((regno + 8 - 72) % 2) {
++	  name[4] = 'R';
++	  namelen++;
++        }
++        break;
++      default:
++        *setname = NULL;
++        return 0;
++      }
++  }
++  name[namelen++] = '\0';
++  return namelen;
++}
+Index: elfutils-0.155/backends/parisc_reloc.def
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/parisc_reloc.def
+@@ -0,0 +1,128 @@
++/* List the relocation types for PA-RISC.  -*- C -*-
++   Copyright (C) 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++/*	    NAME,		REL|EXEC|DYN	*/
++
++RELOC_TYPE (NONE,		EXEC|DYN)
++RELOC_TYPE (DIR32,		REL|EXEC|DYN)
++RELOC_TYPE (DIR21L,		REL|EXEC|DYN)
++RELOC_TYPE (DIR17R,		REL)
++RELOC_TYPE (DIR17F,		REL)
++RELOC_TYPE (DIR14R,		REL|DYN)
++RELOC_TYPE (PCREL32,		REL)
++RELOC_TYPE (PCREL21L,		REL)
++RELOC_TYPE (PCREL17R,		REL)
++RELOC_TYPE (PCREL17F,		REL)
++RELOC_TYPE (PCREL14R,		REL|EXEC)
++RELOC_TYPE (DPREL21L,		REL)
++RELOC_TYPE (DPREL14WR,		REL)
++RELOC_TYPE (DPREL14DR,          REL)
++RELOC_TYPE (DPREL14R,		REL)
++RELOC_TYPE (GPREL21L,		0)
++RELOC_TYPE (GPREL14R,		0)
++RELOC_TYPE (LTOFF21L,		REL)
++RELOC_TYPE (LTOFF14R,		REL)
++RELOC_TYPE (DLTIND14F,		0)
++RELOC_TYPE (SETBASE,		0)
++RELOC_TYPE (SECREL32,		REL)
++RELOC_TYPE (BASEREL21L,		0)
++RELOC_TYPE (BASEREL17R,		0)
++RELOC_TYPE (BASEREL14R,		0)
++RELOC_TYPE (SEGBASE,		0)
++RELOC_TYPE (SEGREL32,		REL)
++RELOC_TYPE (PLTOFF21L,		0)
++RELOC_TYPE (PLTOFF14R,		0)
++RELOC_TYPE (PLTOFF14F,		0)
++RELOC_TYPE (LTOFF_FPTR32,	0)
++RELOC_TYPE (LTOFF_FPTR21L,	0)
++RELOC_TYPE (LTOFF_FPTR14R,	0)
++RELOC_TYPE (FPTR64,		0)
++RELOC_TYPE (PLABEL32,		REL|DYN)
++RELOC_TYPE (PCREL64,		0)
++RELOC_TYPE (PCREL22C,		0)
++RELOC_TYPE (PCREL22F,		0)
++RELOC_TYPE (PCREL14WR,		0)
++RELOC_TYPE (PCREL14DR,		0)
++RELOC_TYPE (PCREL16F,		0)
++RELOC_TYPE (PCREL16WF,		0)
++RELOC_TYPE (PCREL16DF,		0)
++RELOC_TYPE (DIR64,		REL|DYN)
++RELOC_TYPE (DIR14WR,		REL)
++RELOC_TYPE (DIR14DR,		REL)
++RELOC_TYPE (DIR16F,		REL)
++RELOC_TYPE (DIR16WF,		REL)
++RELOC_TYPE (DIR16DF,		REL)
++RELOC_TYPE (GPREL64,		0)
++RELOC_TYPE (GPREL14WR,		0)
++RELOC_TYPE (GPREL14DR,		0)
++RELOC_TYPE (GPREL16F,		0)
++RELOC_TYPE (GPREL16WF,		0)
++RELOC_TYPE (GPREL16DF,		0)
++RELOC_TYPE (LTOFF64,		0)
++RELOC_TYPE (LTOFF14WR,		0)
++RELOC_TYPE (LTOFF14DR,		0)
++RELOC_TYPE (LTOFF16F,		0)
++RELOC_TYPE (LTOFF16WF,		0)
++RELOC_TYPE (LTOFF16DF,		0)
++RELOC_TYPE (SECREL64,		0)
++RELOC_TYPE (BASEREL14WR,	0)
++RELOC_TYPE (BASEREL14DR,	0)
++RELOC_TYPE (SEGREL64,		0)
++RELOC_TYPE (PLTOFF14WR,		0)
++RELOC_TYPE (PLTOFF14DR,		0)
++RELOC_TYPE (PLTOFF16F,		0)
++RELOC_TYPE (PLTOFF16WF,		0)
++RELOC_TYPE (PLTOFF16DF,		0)
++RELOC_TYPE (LTOFF_FPTR64,	0)
++RELOC_TYPE (LTOFF_FPTR14WR,	0)
++RELOC_TYPE (LTOFF_FPTR14DR,	0)
++RELOC_TYPE (LTOFF_FPTR16F,	0)
++RELOC_TYPE (LTOFF_FPTR16WF,	0)
++RELOC_TYPE (LTOFF_FPTR16DF,	0)
++RELOC_TYPE (COPY,		EXEC)
++RELOC_TYPE (IPLT,		EXEC|DYN)
++RELOC_TYPE (EPLT,		0)
++RELOC_TYPE (TPREL32,		DYN)
++RELOC_TYPE (TPREL21L,		0)
++RELOC_TYPE (TPREL14R,		0)
++RELOC_TYPE (LTOFF_TP21L,	0)
++RELOC_TYPE (LTOFF_TP14R,	0)
++RELOC_TYPE (LTOFF_TP14F,	0)
++RELOC_TYPE (TPREL64,		0)
++RELOC_TYPE (TPREL14WR,		0)
++RELOC_TYPE (TPREL14DR,		0)
++RELOC_TYPE (TPREL16F,		0)
++RELOC_TYPE (TPREL16WF,		0)
++RELOC_TYPE (TPREL16DF,		0)
++RELOC_TYPE (LTOFF_TP64,		0)
++RELOC_TYPE (LTOFF_TP14WR,	0)
++RELOC_TYPE (LTOFF_TP14DR,	0)
++RELOC_TYPE (LTOFF_TP16F,	0)
++RELOC_TYPE (LTOFF_TP16WF,	0)
++RELOC_TYPE (LTOFF_TP16DF,	0)
++RELOC_TYPE (TLS_DTPMOD32,	DYN)
++RELOC_TYPE (TLS_DTPMOD64,	DYN)
++
++#define NO_RELATIVE_RELOC       1
+Index: elfutils-0.155/backends/parisc_retval.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/parisc_retval.c
+@@ -0,0 +1,213 @@
++/* Function return value location for Linux/PA-RISC ABI.
++   Copyright (C) 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <assert.h>
++#include <dwarf.h>
++
++#define BACKEND parisc_
++#include "libebl_CPU.h"
++#include "libebl_parisc.h"
++
++/* %r28, or pair %r28, %r29.  */
++static const Dwarf_Op loc_intreg32[] =
++  {
++    { .atom = DW_OP_reg28 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_reg29 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++
++static const Dwarf_Op loc_intreg[] =
++  {
++    { .atom = DW_OP_reg28 }, { .atom = DW_OP_piece, .number = 8 },
++    { .atom = DW_OP_reg29 }, { .atom = DW_OP_piece, .number = 8 },
++  };
++#define nloc_intreg	1
++#define nloc_intregpair	4
++
++/* %fr4L, or pair %fr4L, %fr4R on pa-32 */
++static const Dwarf_Op loc_fpreg32[] =
++  {
++    { .atom = DW_OP_regx, .number = 72 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_regx, .number = 73 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++#define nloc_fpreg32 2
++#define nloc_fpregpair32 4
++
++/* $fr4 */
++static const Dwarf_Op loc_fpreg[] =
++  {
++    { .atom = DW_OP_regx, .number = 72 },
++  };
++#define nloc_fpreg  1
++
++#if 0
++/* The return value is a structure and is actually stored in stack space
++   passed in a hidden argument by the caller. Address of the location is stored
++   in %r28 before function call, but it may be changed by function. */
++static const Dwarf_Op loc_aggregate[] =
++  {
++    { .atom = DW_OP_breg28 },
++  };
++#define nloc_aggregate 1
++#endif
++
++static int
++parisc_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp, int pa64)
++{
++  Dwarf_Word regsize = pa64 ? 8 : 4;
++
++  /* Start with the function's type, and get the DW_AT_type attribute,
++     which is the type of the return value.  */
++
++  Dwarf_Attribute attr_mem;
++  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type, &attr_mem);
++  if (attr == NULL)
++    /* The function has no return value, like a `void' function in C.  */
++    return 0;
++
++  Dwarf_Die die_mem;
++  Dwarf_Die *typedie = dwarf_formref_die (attr, &die_mem);
++  int tag = dwarf_tag (typedie);
++
++  /* Follow typedefs and qualifiers to get to the actual type.  */
++  while (tag == DW_TAG_typedef
++	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
++	 || tag == DW_TAG_restrict_type || tag == DW_TAG_mutable_type)
++    {
++      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
++      typedie = dwarf_formref_die (attr, &die_mem);
++      tag = dwarf_tag (typedie);
++    }
++
++  switch (tag)
++    {
++    case -1:
++      return -1;
++
++    case DW_TAG_subrange_type:
++      if (! dwarf_hasattr_integrate (typedie, DW_AT_byte_size))
++	{
++	  attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
++	  typedie = dwarf_formref_die (attr, &die_mem);
++	  tag = dwarf_tag (typedie);
++	}
++      /* Fall through.  */
++
++    case DW_TAG_base_type:
++    case DW_TAG_enumeration_type:
++    case DW_TAG_pointer_type:
++    case DW_TAG_ptr_to_member_type:
++      {
++        Dwarf_Word size;
++	if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
++					 &attr_mem), &size) != 0)
++	  {
++	    if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
++	      size = 4;
++	    else
++	      return -1;
++	  }
++	if (tag == DW_TAG_base_type)
++	  {
++	    Dwarf_Word encoding;
++	    if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
++					     &attr_mem), &encoding) != 0)
++	      return -1;
++
++	    if (encoding == DW_ATE_float)
++	      {
++		if (pa64) {
++		  *locp = loc_fpreg;
++		  if (size <= 8)
++		      return nloc_fpreg;
++		}
++		else {
++		  *locp = loc_fpreg32;
++		  if (size <= 4)
++		    return nloc_fpreg32;
++		  else if (size <= 8)
++		    return nloc_fpregpair32;
++		}
++		goto aggregate;
++	      }
++	  }
++	if (pa64)
++	  *locp = loc_intreg;
++	else
++	  *locp = loc_intreg32;
++	if (size <= regsize)
++	  return nloc_intreg;
++	if (size <= 2 * regsize)
++	  return nloc_intregpair;
++
++	/* Else fall through.  */
++      }
++
++    case DW_TAG_structure_type:
++    case DW_TAG_class_type:
++    case DW_TAG_union_type:
++    case DW_TAG_array_type:
++    aggregate: {
++        Dwarf_Word size;
++	if (dwarf_aggregate_size (typedie, &size) != 0)
++	  return -1;
++	if (pa64)
++          *locp = loc_intreg;
++	else
++	  *locp = loc_intreg32;
++        if (size <= regsize)
++	  return nloc_intreg;
++        if (size <= 2 * regsize)
++	  return nloc_intregpair;
++#if 0
++	/* there should be some way to know this location... But I do not see it. */
++        *locp = loc_aggregate;
++        return nloc_aggregate;
++#endif
++	/* fall through.  */
++      }
++    }
++
++  /* XXX We don't have a good way to return specific errors from ebl calls.
++     This value means we do not understand the type, but it is well-formed
++     DWARF and might be valid.  */
++  return -2;
++}
++
++int
++parisc_return_value_location_32 (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++  return parisc_return_value_location_ (functypedie, locp, 0);
++}
++
++int
++parisc_return_value_location_64 (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++  return parisc_return_value_location_ (functypedie, locp, 1);
++}
++
+Index: elfutils-0.155/backends/parisc_symbol.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/parisc_symbol.c
+@@ -0,0 +1,112 @@
++/* PA-RISC specific symbolic name handling.
++   Copyright (C) 2002, 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++   Written by Ulrich Drepper <drepper@redhat.com>, 2002.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <elf.h>
++#include <stddef.h>
++
++#define BACKEND		parisc_
++#include "libebl_CPU.h"
++
++const char *
++parisc_segment_type_name (int segment, char *buf __attribute__ ((unused)),
++			size_t len __attribute__ ((unused)))
++{
++  switch (segment)
++    {
++    case PT_PARISC_ARCHEXT:
++      return "PARISC_ARCHEXT";
++    case PT_PARISC_UNWIND:
++      return "PARISC_UNWIND";
++    default:
++      break;
++    }
++  return NULL;
++}
++
++/* Return symbolic representation of symbol type.  */
++const char *
++parisc_symbol_type_name(int symbol, char *buf __attribute__ ((unused)),
++    size_t len __attribute__ ((unused)))
++{
++	if (symbol == STT_PARISC_MILLICODE)
++	  return "PARISC_MILLI";
++	return NULL;
++}
++
++/* Return symbolic representation of section type.  */
++const char *
++parisc_section_type_name (int type,
++			char *buf __attribute__ ((unused)),
++			size_t len __attribute__ ((unused)))
++{
++  switch (type)
++    {
++    case SHT_PARISC_EXT:
++      return "PARISC_EXT";
++    case SHT_PARISC_UNWIND:
++      return "PARISC_UNWIND";
++    case SHT_PARISC_DOC:
++      return "PARISC_DOC";
++    }
++
++  return NULL;
++}
++
++/* Check whether machine flags are valid.  */
++bool
++parisc_machine_flag_check (GElf_Word flags)
++{
++  if (flags &~ (EF_PARISC_TRAPNIL | EF_PARISC_EXT | EF_PARISC_LSB |
++	EF_PARISC_WIDE | EF_PARISC_NO_KABP |
++	EF_PARISC_LAZYSWAP | EF_PARISC_ARCH))
++    return 0;
++
++  GElf_Word arch = flags & EF_PARISC_ARCH;
++
++  return ((arch == EFA_PARISC_1_0) || (arch == EFA_PARISC_1_1) ||
++      (arch == EFA_PARISC_2_0));
++}
++
++/* Check for the simple reloc types.  */
++Elf_Type
++parisc_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
++{
++  switch (type)
++    {
++    case R_PARISC_DIR64:
++    case R_PARISC_SECREL64:
++      return ELF_T_XWORD;
++    case R_PARISC_DIR32:
++    case R_PARISC_SECREL32:
++      return ELF_T_WORD;
++    default:
++      return ELF_T_NUM;
++    }
++}
+Index: elfutils-0.155/backends/libebl_parisc.h
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/libebl_parisc.h
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_HPPA_H
++#define _LIBEBL_HPPA_H 1
++
++#include <libdw.h>
++
++extern int parisc_return_value_location_32(Dwarf_Die *, const Dwarf_Op **locp);
++extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
+Index: elfutils-0.155/backends/Makefile.am
+===================================================================
+--- elfutils-0.155.orig/backends/Makefile.am
++++ elfutils-0.155/backends/Makefile.am
+@@ -32,7 +32,7 @@ INCLUDES += -I$(top_srcdir)/libebl -I$(t
+ 	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
+ 
+ 
+-modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 tilegx
++modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 tilegx parisc
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
+ 	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
+@@ -103,6 +103,9 @@ tilegx_SRCS = tilegx_init.c tilegx_symbo
+ libebl_tilegx_pic_a_SOURCES = $(tilegx_SRCS)
+ am_libebl_tilegx_pic_a_OBJECTS = $(tilegx_SRCS:.c=.os)
+ 
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+Index: elfutils-0.155/libelf/elf.h
+===================================================================
+--- elfutils-0.155.orig/libelf/elf.h
++++ elfutils-0.155/libelf/elf.h
+@@ -1780,16 +1780,24 @@ typedef Elf32_Addr Elf32_Conflict;
+ #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
+ #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
+ #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
++#define R_PARISC_DPREL14WR	19
++#define R_PARISC_DPREL14DR	20
+ #define R_PARISC_DPREL14R	22	/* Right 14 bits of rel. address.  */
+ #define R_PARISC_GPREL21L	26	/* GP-relative, left 21 bits.  */
+ #define R_PARISC_GPREL14R	30	/* GP-relative, right 14 bits.  */
+ #define R_PARISC_LTOFF21L	34	/* LT-relative, left 21 bits.  */
+ #define R_PARISC_LTOFF14R	38	/* LT-relative, right 14 bits.  */
++#define R_PARISC_DLTIND14F	39
++#define R_PARISC_SETBASE	40
+ #define R_PARISC_SECREL32	41	/* 32 bits section rel. address.  */
++#define R_PARISC_BASEREL21L	42
++#define R_PARISC_BASEREL17R	43
++#define R_PARISC_BASEREL14R	46
+ #define R_PARISC_SEGBASE	48	/* No relocation, set segment base.  */
+ #define R_PARISC_SEGREL32	49	/* 32 bits segment rel. address.  */
+ #define R_PARISC_PLTOFF21L	50	/* PLT rel. address, left 21 bits.  */
+ #define R_PARISC_PLTOFF14R	54	/* PLT rel. address, right 14 bits.  */
++#define R_PARISC_PLTOFF14F	55
+ #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
+ #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
+ #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
+@@ -1798,6 +1806,7 @@ typedef Elf32_Addr Elf32_Conflict;
+ #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
+ #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
+ #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
++#define R_PARISC_PCREL22C	73
+ #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
+ #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
+ #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
+@@ -1823,6 +1832,8 @@ typedef Elf32_Addr Elf32_Conflict;
+ #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
+ #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
+ #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
++#define R_PARISC_BASEREL14WR	107
++#define R_PARISC_BASEREL14DR	108
+ #define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
+ #define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
+ #define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/i386_dis.h b/meta/recipes-devtools/elfutils/elfutils-0.155/i386_dis.h
new file mode 100644
index 0000000..a5cc01f
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/i386_dis.h
@@ -0,0 +1,1657 @@
+#define MNEMONIC_BITS 10
+#define SUFFIX_BITS 3
+#define FCT1_BITS 7
+#define STR1_BITS 4
+#define OFF1_1_BITS 7
+#define OFF1_1_BIAS 3
+#define OFF1_2_BITS 7
+#define OFF1_2_BIAS 4
+#define OFF1_3_BITS 1
+#define OFF1_3_BIAS 7
+#define FCT2_BITS 6
+#define STR2_BITS 2
+#define OFF2_1_BITS 7
+#define OFF2_1_BIAS 5
+#define OFF2_2_BITS 7
+#define OFF2_2_BIAS 4
+#define OFF2_3_BITS 4
+#define OFF2_3_BIAS 7
+#define FCT3_BITS 4
+#define STR3_BITS 1
+#define OFF3_1_BITS 6
+#define OFF3_1_BIAS 10
+#define OFF3_2_BITS 1
+#define OFF3_2_BIAS 21
+
+#include <i386_data.h>
+
+#define suffix_none 0
+#define suffix_w 1
+#define suffix_w0 2
+#define suffix_W 3
+#define suffix_tttn 4
+#define suffix_D 7
+#define suffix_w1 5
+#define suffix_W1 6
+
+static const opfct_t op1_fct[] =
+{
+  NULL,
+  FCT_MOD$R_M,
+  FCT_Mod$R_m,
+  FCT_abs,
+  FCT_ax,
+  FCT_ax$w,
+  FCT_ccc,
+  FCT_ddd,
+  FCT_disp8,
+  FCT_ds_bx,
+  FCT_ds_si,
+  FCT_dx,
+  FCT_es_di,
+  FCT_freg,
+  FCT_imm$s,
+  FCT_imm$w,
+  FCT_imm16,
+  FCT_imm8,
+  FCT_imms8,
+  FCT_mmxreg,
+  FCT_mod$16r_m,
+  FCT_mod$64r_m,
+  FCT_mod$8r_m,
+  FCT_mod$r_m,
+  FCT_mod$r_m$w,
+  FCT_reg,
+  FCT_reg$w,
+  FCT_reg16,
+  FCT_reg64,
+  FCT_rel,
+  FCT_sel,
+  FCT_sreg2,
+  FCT_sreg3,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op1_str[] =
+  "%ax\0"
+  "%cl\0"
+  "%eax\0"
+  "%st\0"
+  "%xmm0\0"
+  "*";
+static const uint8_t op1_str_idx[] = {
+  0,
+  4,
+  8,
+  13,
+  17,
+  23,
+};
+static const opfct_t op2_fct[] =
+{
+  NULL,
+  FCT_MOD$R_M,
+  FCT_Mod$R_m,
+  FCT_abs,
+  FCT_absval,
+  FCT_ax$w,
+  FCT_ccc,
+  FCT_ddd,
+  FCT_ds_si,
+  FCT_dx,
+  FCT_es_di,
+  FCT_freg,
+  FCT_imm8,
+  FCT_mmxreg,
+  FCT_mod$64r_m,
+  FCT_mod$r_m,
+  FCT_mod$r_m$w,
+  FCT_moda$r_m,
+  FCT_reg,
+  FCT_reg$w,
+  FCT_reg64,
+  FCT_sreg3,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op2_str[] =
+  "%ecx\0"
+  "%st";
+static const uint8_t op2_str_idx[] = {
+  0,
+  5,
+};
+static const opfct_t op3_fct[] =
+{
+  NULL,
+  FCT_mmxreg,
+  FCT_mod$r_m,
+  FCT_reg,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op3_str[] =
+  "%edx";
+static const uint8_t op3_str_idx[] = {
+  0,
+};
+static const struct instr_enc instrtab[] =
+{
+  { .mnemonic = MNE_aaa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_aad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_aam, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_aas, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsubpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsubps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_arpl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bound, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 17, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bsf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bswap, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bt, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bts, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bts, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_call, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_call, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 21, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lcall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 30, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 4, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lcall, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 21, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cli, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_syscall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clts, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysenter, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysexit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmov, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmps, .rep = 0, .repe = 1, .suffix = 1, .modrm = 0, .fct1 = 12, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 8, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpxchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 11, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 8, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpxchg8b, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cpuid, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtdq2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttpd2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_daa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_das, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_dec, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_dec, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_div, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_emms, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_enter, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 12, .str2 = 0, .off2_1 = 19, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fchs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fabs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ftst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxam, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldl2t, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldl2e, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldpi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldlg2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldln2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldz, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_f2xm1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fyl2x, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fptan, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fpatan, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxtract, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fprem1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdecstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fincstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fprem, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fyl2xp1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsqrt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsincos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_frndint, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fscale, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsin, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fst, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstp, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldenv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldcw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstenv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstcw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_faddp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fiadd, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmove, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmulp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fimul, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisub, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisubr, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 1, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fbld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fbstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fchs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fclex, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_finit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fwait, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnclex, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmove, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovne, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcom, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcom, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomp, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcompp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdecstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivrl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ffree, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ficom, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ficomp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fild, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fildl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fildll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fincstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fninit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fist, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fistp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fistpll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisttp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisttpll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstpt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucom, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_frstor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnsave, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hlt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_idiv, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 14, .str1 = 0, .off1_1 = 13, .off1_2 = 2, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_in, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_in, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 11, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_inc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_inc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ins, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 11, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_int, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_int3, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_into, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_invd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_swapgs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_invlpg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_iret, .rep = 0, .repe = 0, .suffix = 6, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_j, .rep = 0, .repe = 0, .suffix = 4, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_j, .rep = 0, .repe = 0, .suffix = 4, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_set, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 21, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ljmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 30, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 4, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ljmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 21, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lahf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lar, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lds, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lea, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_leave, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_les, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lfs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lgs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lgdt, .rep = 0, .repe = 0, .suffix = 2, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lidt, .rep = 0, .repe = 0, .suffix = 2, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lmsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lock, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lods, .rep = 1, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loope, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loopne, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lsl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ltr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 3, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 35, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 37, .off1_2 = 3, .off1_3 = 0, .fct2 = 3, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 6, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 6, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 7, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 7, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movs, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsbl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movswl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movzbl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movzwl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mul, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_neg, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pause, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_nop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popcnt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_not, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_out, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 12, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_out, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 9, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_outs, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 9, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popf, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 25, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 14, .str1 = 0, .off1_1 = 5, .off1_2 = 2, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 31, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pusha, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popa, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pushf, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdmsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdpmc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdtsc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ret, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ret, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sahf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_scas, .rep = 0, .repe = 1, .suffix = 0, .modrm = 0, .fct1 = 12, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_set, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_vmcall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmlaunch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmresume, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmxoff, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmread, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 28, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 14, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmwrite, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sgdtl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_monitor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 3, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 1, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 4, .str3 = 1, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mwait, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 3, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 22, .str2 = 1, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sidtl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_smsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_std, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sti, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stos, .rep = 1, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_str, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ud2a, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_verr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_verw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_wbinvd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetchw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetchnta, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht0, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_nop, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_wrmsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 11, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 8, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 4, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xlat, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 9, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_emms, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pand, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pand, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pandn, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pandn, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_por, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_por, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pxor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pxor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpeqps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpltps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpleps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpunordps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpneqps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnltps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnleps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpordps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpeqss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpltss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpless, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpunordss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpneqss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnltss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnless, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpordss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxrstor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxsave, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ldmxcsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stmxcsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movupd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movups, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movupd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movups, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movddup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsldup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpcklpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpcklps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpckhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpckhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movshdup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movapd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movaps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movapd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movaps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsi2sd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsi2ss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpi2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpi2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttsd2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttss2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttpd2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttps2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsd2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtss2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ucomisd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ucomiss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_comisd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_comiss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_getsec, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movmskpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movmskps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsqrtss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsqrtps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcpss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcpps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_orpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_orps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xorpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xorps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsd2ss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtss2sd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttps2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtdq2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packsswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packsswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packuswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packuswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packssdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packssdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklqdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhqdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshuflw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_haddpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_haddps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hsubpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hsubps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movnti, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_pextrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pextrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_shufpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_shufps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmullw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmullw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdq2q, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 19, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovmskb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovmskb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 19, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lddqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuludq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuludq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maskmovdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maskmovq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 19, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhrsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhrsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_palignr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_palignr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_vmclear, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmxon, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmptrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmptrst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clflush, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_blendps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendvps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendvpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_dpps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_dppd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_insertps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_movntdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mpsadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_packusdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pblendvb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pblendw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpestri, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpestrm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpistri, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpistrm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phminposuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxud, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminud, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxwq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxwq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ptest, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 23, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_roundps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 17, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 31, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+};
+static const uint8_t match_data[] =
+{
+  0x11, 0x37,
+  0x22, 0xd5, 0xa,
+  0x22, 0xd4, 0xa,
+  0x11, 0x3f,
+  0x1, 0xfe, 0x14,
+  0x2, 0xfe, 0x80, 0x38, 0x10,
+  0x2, 0xfe, 0x82, 0x38, 0x10,
+  0x2, 0xfe, 0x10, 0, 0,
+  0x2, 0xfe, 0x12, 0, 0,
+  0x1, 0xfe, 0x4,
+  0x2, 0xfe, 0x80, 0x38, 0,
+  0x12, 0x83, 0x38, 0,
+  0x2, 0xfe, 0, 0, 0,
+  0x2, 0xfe, 0x2, 0, 0,
+  0x34, 0x66, 0xf, 0xd0, 0, 0,
+  0x34, 0xf2, 0xf, 0xd0, 0, 0,
+  0x1, 0xfe, 0x24,
+  0x2, 0xfe, 0x80, 0x38, 0x20,
+  0x2, 0xfe, 0x82, 0x38, 0x20,
+  0x2, 0xfe, 0x20, 0, 0,
+  0x2, 0xfe, 0x22, 0, 0,
+  0x34, 0x66, 0xf, 0x54, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x34, 0x66, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x12, 0x63, 0, 0,
+  0x12, 0x62, 0, 0,
+  0x23, 0xf, 0xbc, 0, 0,
+  0x23, 0xf, 0xbd, 0, 0,
+  0x12, 0xf, 0xf8, 0xc8,
+  0x23, 0xf, 0xa3, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x20,
+  0x23, 0xf, 0xbb, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x38,
+  0x23, 0xf, 0xb3, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x30,
+  0x23, 0xf, 0xab, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x28,
+  0x11, 0xe8,
+  0x12, 0xff, 0x38, 0x10,
+  0x11, 0x9a,
+  0x12, 0xff, 0x38, 0x18,
+  0x11, 0x98,
+  0x11, 0x99,
+  0x11, 0xf8,
+  0x11, 0xfc,
+  0x11, 0xfa,
+  0x22, 0xf, 0x5,
+  0x22, 0xf, 0x6,
+  0x22, 0xf, 0x7,
+  0x22, 0xf, 0x34,
+  0x22, 0xf, 0x35,
+  0x11, 0xf5,
+  0x13, 0xf, 0xf0, 0x40, 0, 0,
+  0x1, 0xfe, 0x3c,
+  0x2, 0xfe, 0x80, 0x38, 0x38,
+  0x12, 0x83, 0x38, 0x38,
+  0x2, 0xfe, 0x38, 0, 0,
+  0x2, 0xfe, 0x3a, 0, 0,
+  0x34, 0xf2, 0xf, 0xc2, 0, 0,
+  0x34, 0xf3, 0xf, 0xc2, 0, 0,
+  0x34, 0x66, 0xf, 0xc2, 0, 0,
+  0x23, 0xf, 0xc2, 0, 0,
+  0x1, 0xfe, 0xa6,
+  0x13, 0xf, 0xfe, 0xb0, 0, 0,
+  0x23, 0xf, 0xc7, 0x38, 0x8,
+  0x22, 0xf, 0xa2,
+  0x34, 0xf3, 0xf, 0xe6, 0, 0,
+  0x34, 0xf2, 0xf, 0xe6, 0, 0,
+  0x34, 0x66, 0xf, 0xe6, 0, 0,
+  0x11, 0x27,
+  0x11, 0x2f,
+  0x2, 0xfe, 0xfe, 0x38, 0x8,
+  0x1, 0xf8, 0x48,
+  0x2, 0xfe, 0xf6, 0x38, 0x30,
+  0x22, 0xf, 0x77,
+  0x11, 0xc8,
+  0x22, 0xd9, 0xd0,
+  0x22, 0xd9, 0xe0,
+  0x22, 0xd9, 0xe1,
+  0x22, 0xd9, 0xe4,
+  0x22, 0xd9, 0xe5,
+  0x22, 0xd9, 0xe8,
+  0x22, 0xd9, 0xe9,
+  0x22, 0xd9, 0xea,
+  0x22, 0xd9, 0xeb,
+  0x22, 0xd9, 0xec,
+  0x22, 0xd9, 0xed,
+  0x22, 0xd9, 0xee,
+  0x22, 0xd9, 0xf0,
+  0x22, 0xd9, 0xf1,
+  0x22, 0xd9, 0xf2,
+  0x22, 0xd9, 0xf3,
+  0x22, 0xd9, 0xf4,
+  0x22, 0xd9, 0xf5,
+  0x22, 0xd9, 0xf6,
+  0x22, 0xd9, 0xf7,
+  0x22, 0xd9, 0xf8,
+  0x22, 0xd9, 0xf9,
+  0x22, 0xd9, 0xfa,
+  0x22, 0xd9, 0xfb,
+  0x22, 0xd9, 0xfc,
+  0x22, 0xd9, 0xfd,
+  0x22, 0xd9, 0xfe,
+  0x22, 0xd9, 0xff,
+  0x12, 0xd8, 0xf8, 0xc0,
+  0x12, 0xdc, 0xf8, 0xc0,
+  0x2, 0xfb, 0xd8, 0x38, 0,
+  0x12, 0xd8, 0xf8, 0xc8,
+  0x12, 0xdc, 0xf8, 0xc8,
+  0x2, 0xfb, 0xd8, 0x38, 0x8,
+  0x12, 0xd8, 0xf8, 0xe0,
+  0x12, 0xdc, 0xf8, 0xe0,
+  0x2, 0xfb, 0xd8, 0x38, 0x20,
+  0x12, 0xd8, 0xf8, 0xe8,
+  0x12, 0xdc, 0xf8, 0xe8,
+  0x2, 0xfb, 0xd8, 0x38, 0x28,
+  0x12, 0xdd, 0xf8, 0xd0,
+  0x2, 0xfb, 0xd9, 0x38, 0x10,
+  0x12, 0xdd, 0xf8, 0xd8,
+  0x2, 0xfb, 0xd9, 0x38, 0x18,
+  0x12, 0xd9, 0x38, 0x20,
+  0x12, 0xd9, 0x38, 0x28,
+  0x12, 0xd9, 0x38, 0x30,
+  0x12, 0xd9, 0x38, 0x38,
+  0x12, 0xd9, 0xf8, 0xc8,
+  0x12, 0xde, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xc0,
+  0x2, 0xfb, 0xda, 0x38, 0,
+  0x12, 0xda, 0xf8, 0xc8,
+  0x12, 0xde, 0xf8, 0xc8,
+  0x2, 0xfb, 0xda, 0x38, 0x8,
+  0x12, 0xde, 0xf8, 0xe0,
+  0x2, 0xfb, 0xda, 0x38, 0x20,
+  0x12, 0xde, 0xf8, 0xe8,
+  0x2, 0xfb, 0xda, 0x38, 0x28,
+  0x22, 0xdf, 0xe0,
+  0x12, 0xdf, 0x38, 0x20,
+  0x12, 0xdf, 0xf8, 0xf0,
+  0x12, 0xdf, 0x38, 0x30,
+  0x22, 0xd9, 0xe0,
+  0x33, 0x9b, 0xdb, 0xe2,
+  0x33, 0x9b, 0xdb, 0xe3,
+  0x11, 0x9b,
+  0x22, 0xdb, 0xe2,
+  0x12, 0xda, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xc8,
+  0x12, 0xda, 0xf8, 0xd0,
+  0x12, 0xda, 0xf8, 0xd8,
+  0x12, 0xdb, 0xf8, 0xc0,
+  0x12, 0xdb, 0xf8, 0xc8,
+  0x12, 0xdb, 0xf8, 0xd0,
+  0x12, 0xdb, 0xf8, 0xd8,
+  0x12, 0xd8, 0xf8, 0xd0,
+  0x2, 0xfb, 0xd8, 0x38, 0x10,
+  0x12, 0xd8, 0xf8, 0xd8,
+  0x2, 0xfb, 0xd8, 0x38, 0x18,
+  0x22, 0xde, 0xd9,
+  0x12, 0xdb, 0xf8, 0xf0,
+  0x12, 0xdf, 0xf8, 0xf0,
+  0x12, 0xdb, 0xf8, 0xe8,
+  0x12, 0xdf, 0xf8, 0xe8,
+  0x22, 0xd9, 0xff,
+  0x22, 0xd9, 0xf6,
+  0x12, 0xd8, 0xf8, 0xf0,
+  0x12, 0xdc, 0xf8, 0xf0,
+  0x2, 0xfb, 0xd8, 0x38, 0x30,
+  0x12, 0xda, 0x38, 0x30,
+  0x12, 0xde, 0xf8, 0xf0,
+  0x12, 0xde, 0x38, 0x30,
+  0x12, 0xde, 0xf8, 0xf8,
+  0x12, 0xd8, 0xf8, 0xf8,
+  0x12, 0xdc, 0xf8, 0xf8,
+  0x2, 0xfb, 0xd8, 0x38, 0x38,
+  0x12, 0xda, 0x38, 0x38,
+  0x12, 0xde, 0x38, 0x38,
+  0x12, 0xde, 0xf8, 0xf0,
+  0x12, 0xdd, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xd0,
+  0x2, 0xfb, 0xda, 0x38, 0x10,
+  0x12, 0xda, 0xf8, 0xd8,
+  0x2, 0xfb, 0xda, 0x38, 0x18,
+  0x12, 0xdf, 0x38, 0,
+  0x12, 0xdb, 0x38, 0,
+  0x12, 0xdf, 0x38, 0x28,
+  0x22, 0xd9, 0xf7,
+  0x22, 0xdb, 0xe3,
+  0x2, 0xfb, 0xdb, 0x38, 0x10,
+  0x2, 0xfb, 0xdb, 0x38, 0x18,
+  0x12, 0xdf, 0x38, 0x38,
+  0x2, 0xfb, 0xdb, 0x38, 0x8,
+  0x12, 0xdd, 0x38, 0x8,
+  0x12, 0xdb, 0x38, 0x28,
+  0x12, 0xdb, 0x38, 0x38,
+  0x12, 0xd9, 0xf8, 0xc0,
+  0x2, 0xfb, 0xd9, 0x38, 0,
+  0x12, 0xdd, 0xf8, 0xe0,
+  0x12, 0xdd, 0x38, 0x20,
+  0x12, 0xdd, 0xf8, 0xe8,
+  0x12, 0xdd, 0x38, 0x30,
+  0x12, 0xdd, 0x38, 0x38,
+  0x11, 0xf4,
+  0x2, 0xfe, 0xf6, 0x38, 0x38,
+  0x2, 0xfe, 0xf6, 0x38, 0x28,
+  0x23, 0xf, 0xaf, 0, 0,
+  0x2, 0xfd, 0x69, 0, 0,
+  0x1, 0xfe, 0xe4,
+  0x1, 0xfe, 0xec,
+  0x2, 0xfe, 0xfe, 0x38, 0,
+  0x1, 0xf8, 0x40,
+  0x1, 0xfe, 0x6c,
+  0x11, 0xcd,
+  0x11, 0xcc,
+  0x11, 0xce,
+  0x22, 0xf, 0x8,
+  0x33, 0xf, 0x1, 0xf8,
+  0x23, 0xf, 0x1, 0x38, 0x38,
+  0x11, 0xcf,
+  0x1, 0xf0, 0x70,
+  0x12, 0xf, 0xf0, 0x80,
+  0x13, 0xf, 0xf0, 0x90, 0x38, 0,
+  0x11, 0xe3,
+  0x11, 0xeb,
+  0x11, 0xe9,
+  0x12, 0xff, 0x38, 0x20,
+  0x11, 0xea,
+  0x12, 0xff, 0x38, 0x28,
+  0x11, 0x9f,
+  0x23, 0xf, 0x2, 0, 0,
+  0x12, 0xc5, 0, 0,
+  0x12, 0x8d, 0, 0,
+  0x11, 0xc9,
+  0x12, 0xc4, 0, 0,
+  0x23, 0xf, 0xb4, 0, 0,
+  0x23, 0xf, 0xb5, 0, 0,
+  0x23, 0xf, 0x1, 0x38, 0x10,
+  0x23, 0xf, 0x1, 0x38, 0x18,
+  0x23, 0xf, 0, 0x38, 0x10,
+  0x23, 0xf, 0x1, 0x38, 0x30,
+  0x11, 0xf0,
+  0x1, 0xfe, 0xac,
+  0x11, 0xe2,
+  0x11, 0xe1,
+  0x11, 0xe0,
+  0x23, 0xf, 0x3, 0, 0,
+  0x23, 0xf, 0xb2, 0, 0,
+  0x23, 0xf, 0, 0x38, 0x18,
+  0x2, 0xfe, 0x88, 0, 0,
+  0x2, 0xfe, 0x8a, 0, 0,
+  0x2, 0xfe, 0xc6, 0x38, 0,
+  0x1, 0xf0, 0xb0,
+  0x1, 0xfe, 0xa0,
+  0x1, 0xfe, 0xa2,
+  0x23, 0xf, 0x20, 0xc0, 0xc0,
+  0x23, 0xf, 0x22, 0xc0, 0xc0,
+  0x23, 0xf, 0x21, 0xc0, 0xc0,
+  0x23, 0xf, 0x23, 0xc0, 0xc0,
+  0x12, 0x8c, 0, 0,
+  0x12, 0x8e, 0, 0,
+  0x1, 0xfe, 0xa4,
+  0x23, 0xf, 0xbe, 0, 0,
+  0x23, 0xf, 0xbf, 0, 0,
+  0x23, 0xf, 0xb6, 0, 0,
+  0x23, 0xf, 0xb7, 0, 0,
+  0x2, 0xfe, 0xf6, 0x38, 0x20,
+  0x2, 0xfe, 0xf6, 0x38, 0x18,
+  0x22, 0xf3, 0x90,
+  0x11, 0x90,
+  0x34, 0xf3, 0xf, 0xb8, 0, 0,
+  0x2, 0xfe, 0xf6, 0x38, 0x10,
+  0x2, 0xfe, 0x8, 0, 0,
+  0x2, 0xfe, 0xa, 0, 0,
+  0x2, 0xfe, 0x80, 0x38, 0x8,
+  0x2, 0xfe, 0x82, 0x38, 0x8,
+  0x1, 0xfe, 0xc,
+  0x1, 0xfe, 0xe6,
+  0x1, 0xfe, 0xee,
+  0x1, 0xfe, 0x6e,
+  0x12, 0x8f, 0x38, 0,
+  0x12, 0xf, 0xc7, 0x81,
+  0x11, 0x9d,
+  0x12, 0xff, 0x38, 0x30,
+  0x1, 0xf8, 0x50,
+  0x1, 0xf8, 0x58,
+  0x1, 0xfd, 0x68,
+  0x1, 0xe7, 0x6,
+  0x12, 0xf, 0xc7, 0x80,
+  0x11, 0x60,
+  0x11, 0x61,
+  0x11, 0x9c,
+  0x2, 0xfe, 0xd0, 0x38, 0x10,
+  0x2, 0xfe, 0xd2, 0x38, 0x10,
+  0x2, 0xfe, 0xc0, 0x38, 0x10,
+  0x2, 0xfe, 0xd0, 0x38, 0x18,
+  0x2, 0xfe, 0xd2, 0x38, 0x18,
+  0x2, 0xfe, 0xc0, 0x38, 0x18,
+  0x22, 0xf, 0x32,
+  0x22, 0xf, 0x33,
+  0x22, 0xf, 0x31,
+  0x11, 0xc3,
+  0x11, 0xc2,
+  0x11, 0xcb,
+  0x11, 0xca,
+  0x2, 0xfe, 0xd0, 0x38, 0,
+  0x2, 0xfe, 0xd2, 0x38, 0,
+  0x2, 0xfe, 0xc0, 0x38, 0,
+  0x2, 0xfe, 0xd0, 0x38, 0x8,
+  0x2, 0xfe, 0xd2, 0x38, 0x8,
+  0x2, 0xfe, 0xc0, 0x38, 0x8,
+  0x22, 0xf, 0xaa,
+  0x11, 0x9e,
+  0x2, 0xfe, 0xd0, 0x38, 0x38,
+  0x2, 0xfe, 0xd2, 0x38, 0x38,
+  0x2, 0xfe, 0xc0, 0x38, 0x38,
+  0x2, 0xfe, 0x18, 0, 0,
+  0x2, 0xfe, 0x1a, 0, 0,
+  0x1, 0xfe, 0x1c,
+  0x2, 0xfe, 0x80, 0x38, 0x18,
+  0x2, 0xfe, 0x82, 0x38, 0x18,
+  0x1, 0xfe, 0xae,
+  0x13, 0xf, 0xf0, 0x90, 0x38, 0,
+  0x2, 0xfe, 0xd0, 0x38, 0x20,
+  0x2, 0xfe, 0xd2, 0x38, 0x20,
+  0x2, 0xfe, 0xc0, 0x38, 0x20,
+  0x2, 0xfe, 0xd0, 0x38, 0x28,
+  0x23, 0xf, 0xa4, 0, 0,
+  0x23, 0xf, 0xa5, 0, 0,
+  0x2, 0xfe, 0xd2, 0x38, 0x28,
+  0x2, 0xfe, 0xc0, 0x38, 0x28,
+  0x23, 0xf, 0xac, 0, 0,
+  0x23, 0xf, 0xad, 0, 0,
+  0x33, 0xf, 0x1, 0xc1,
+  0x33, 0xf, 0x1, 0xc2,
+  0x33, 0xf, 0x1, 0xc3,
+  0x33, 0xf, 0x1, 0xc4,
+  0x23, 0xf, 0x78, 0, 0,
+  0x23, 0xf, 0x79, 0, 0,
+  0x23, 0xf, 0x1, 0x38, 0,
+  0x33, 0xf, 0x1, 0xc8,
+  0x33, 0xf, 0x1, 0xc9,
+  0x23, 0xf, 0x1, 0x38, 0x8,
+  0x23, 0xf, 0, 0x38, 0,
+  0x23, 0xf, 0x1, 0x38, 0x20,
+  0x11, 0xf9,
+  0x11, 0xfd,
+  0x11, 0xfb,
+  0x1, 0xfe, 0xaa,
+  0x23, 0xf, 0, 0x38, 0x8,
+  0x2, 0xfe, 0x28, 0, 0,
+  0x2, 0xfe, 0x2a, 0, 0,
+  0x1, 0xfe, 0x2c,
+  0x2, 0xfe, 0x80, 0x38, 0x28,
+  0x2, 0xfe, 0x82, 0x38, 0x28,
+  0x2, 0xfe, 0x84, 0, 0,
+  0x1, 0xfe, 0xa8,
+  0x2, 0xfe, 0xf6, 0x38, 0,
+  0x22, 0xf, 0xb,
+  0x23, 0xf, 0, 0x38, 0x20,
+  0x23, 0xf, 0, 0x38, 0x28,
+  0x22, 0xf, 0x9,
+  0x23, 0xf, 0xd, 0x38, 0,
+  0x23, 0xf, 0xd, 0x38, 0x8,
+  0x23, 0xf, 0x18, 0x38, 0,
+  0x23, 0xf, 0x18, 0x38, 0x8,
+  0x23, 0xf, 0x18, 0x38, 0x10,
+  0x23, 0xf, 0x18, 0x38, 0x18,
+  0x23, 0xf, 0x1f, 0, 0,
+  0x22, 0xf, 0x30,
+  0x13, 0xf, 0xfe, 0xc0, 0, 0,
+  0x2, 0xfe, 0x86, 0, 0,
+  0x1, 0xf8, 0x90,
+  0x11, 0xd7,
+  0x2, 0xfe, 0x30, 0, 0,
+  0x2, 0xfe, 0x32, 0, 0,
+  0x1, 0xfe, 0x34,
+  0x2, 0xfe, 0x80, 0x38, 0x30,
+  0x2, 0xfe, 0x82, 0x38, 0x30,
+  0x22, 0xf, 0x77,
+  0x34, 0x66, 0xf, 0xdb, 0, 0,
+  0x23, 0xf, 0xdb, 0, 0,
+  0x34, 0x66, 0xf, 0xdf, 0, 0,
+  0x23, 0xf, 0xdf, 0, 0,
+  0x34, 0x66, 0xf, 0xf5, 0, 0,
+  0x23, 0xf, 0xf5, 0, 0,
+  0x34, 0x66, 0xf, 0xeb, 0, 0,
+  0x23, 0xf, 0xeb, 0, 0,
+  0x34, 0x66, 0xf, 0xef, 0, 0,
+  0x23, 0xf, 0xef, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x1,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x2,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x3,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x4,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x5,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x6,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x7,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x1,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x2,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x3,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x4,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x5,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x6,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x7,
+  0x23, 0xf, 0xae, 0x38, 0x8,
+  0x23, 0xf, 0xae, 0x38, 0,
+  0x23, 0xf, 0xae, 0x38, 0x10,
+  0x23, 0xf, 0xae, 0x38, 0x18,
+  0x34, 0xf2, 0xf, 0x10, 0, 0,
+  0x34, 0xf3, 0xf, 0x10, 0, 0,
+  0x34, 0x66, 0xf, 0x10, 0, 0,
+  0x23, 0xf, 0x10, 0, 0,
+  0x34, 0xf2, 0xf, 0x11, 0, 0,
+  0x34, 0xf3, 0xf, 0x11, 0, 0,
+  0x34, 0x66, 0xf, 0x11, 0, 0,
+  0x23, 0xf, 0x11, 0, 0,
+  0x34, 0xf2, 0xf, 0x12, 0, 0,
+  0x34, 0xf3, 0xf, 0x12, 0, 0,
+  0x34, 0x66, 0xf, 0x12, 0, 0,
+  0x23, 0xf, 0x12, 0xc0, 0xc0,
+  0x23, 0xf, 0x12, 0, 0,
+  0x34, 0x66, 0xf, 0x13, 0xc0, 0xc0,
+  0x23, 0xf, 0x13, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x13, 0, 0,
+  0x23, 0xf, 0x13, 0, 0,
+  0x34, 0x66, 0xf, 0x14, 0, 0,
+  0x23, 0xf, 0x14, 0, 0,
+  0x34, 0x66, 0xf, 0x15, 0, 0,
+  0x23, 0xf, 0x15, 0, 0,
+  0x34, 0xf3, 0xf, 0x16, 0, 0,
+  0x34, 0x66, 0xf, 0x16, 0, 0,
+  0x23, 0xf, 0x16, 0xc0, 0xc0,
+  0x23, 0xf, 0x16, 0, 0,
+  0x34, 0x66, 0xf, 0x17, 0xc0, 0xc0,
+  0x23, 0xf, 0x17, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x17, 0, 0,
+  0x23, 0xf, 0x17, 0, 0,
+  0x34, 0x66, 0xf, 0x28, 0, 0,
+  0x23, 0xf, 0x28, 0, 0,
+  0x34, 0x66, 0xf, 0x29, 0, 0,
+  0x23, 0xf, 0x29, 0, 0,
+  0x34, 0xf2, 0xf, 0x2a, 0, 0,
+  0x34, 0xf3, 0xf, 0x2a, 0, 0,
+  0x34, 0x66, 0xf, 0x2a, 0, 0,
+  0x23, 0xf, 0x2a, 0, 0,
+  0x34, 0x66, 0xf, 0x2b, 0, 0,
+  0x23, 0xf, 0x2b, 0, 0,
+  0x34, 0xf2, 0xf, 0x2c, 0, 0,
+  0x34, 0xf3, 0xf, 0x2c, 0, 0,
+  0x34, 0x66, 0xf, 0x2c, 0, 0,
+  0x23, 0xf, 0x2c, 0, 0,
+  0x34, 0x66, 0xf, 0x2d, 0, 0,
+  0x34, 0xf2, 0xf, 0x2d, 0, 0,
+  0x34, 0xf3, 0xf, 0x2d, 0, 0,
+  0x23, 0xf, 0x2d, 0, 0,
+  0x34, 0x66, 0xf, 0x2e, 0, 0,
+  0x23, 0xf, 0x2e, 0, 0,
+  0x34, 0x66, 0xf, 0x2f, 0, 0,
+  0x23, 0xf, 0x2f, 0, 0,
+  0x22, 0xf, 0x37,
+  0x34, 0x66, 0xf, 0x50, 0xc0, 0xc0,
+  0x23, 0xf, 0x50, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x51, 0, 0,
+  0x34, 0xf2, 0xf, 0x51, 0, 0,
+  0x34, 0xf3, 0xf, 0x51, 0, 0,
+  0x23, 0xf, 0x51, 0, 0,
+  0x34, 0xf3, 0xf, 0x52, 0, 0,
+  0x23, 0xf, 0x52, 0, 0,
+  0x34, 0xf3, 0xf, 0x53, 0, 0,
+  0x23, 0xf, 0x53, 0, 0,
+  0x34, 0x66, 0xf, 0x54, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x34, 0x66, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x34, 0x66, 0xf, 0x56, 0, 0,
+  0x23, 0xf, 0x56, 0, 0,
+  0x34, 0x66, 0xf, 0x57, 0, 0,
+  0x23, 0xf, 0x57, 0, 0,
+  0x34, 0xf2, 0xf, 0x58, 0, 0,
+  0x34, 0xf3, 0xf, 0x58, 0, 0,
+  0x34, 0x66, 0xf, 0x58, 0, 0,
+  0x23, 0xf, 0x58, 0, 0,
+  0x34, 0xf2, 0xf, 0x59, 0, 0,
+  0x34, 0xf3, 0xf, 0x59, 0, 0,
+  0x34, 0x66, 0xf, 0x59, 0, 0,
+  0x23, 0xf, 0x59, 0, 0,
+  0x34, 0xf2, 0xf, 0x5a, 0, 0,
+  0x34, 0xf3, 0xf, 0x5a, 0, 0,
+  0x34, 0x66, 0xf, 0x5a, 0, 0,
+  0x23, 0xf, 0x5a, 0, 0,
+  0x34, 0x66, 0xf, 0x5b, 0, 0,
+  0x34, 0xf3, 0xf, 0x5b, 0, 0,
+  0x23, 0xf, 0x5b, 0, 0,
+  0x34, 0xf2, 0xf, 0x5c, 0, 0,
+  0x34, 0xf3, 0xf, 0x5c, 0, 0,
+  0x34, 0x66, 0xf, 0x5c, 0, 0,
+  0x23, 0xf, 0x5c, 0, 0,
+  0x34, 0xf2, 0xf, 0x5d, 0, 0,
+  0x34, 0xf3, 0xf, 0x5d, 0, 0,
+  0x34, 0x66, 0xf, 0x5d, 0, 0,
+  0x23, 0xf, 0x5d, 0, 0,
+  0x34, 0xf2, 0xf, 0x5e, 0, 0,
+  0x34, 0xf3, 0xf, 0x5e, 0, 0,
+  0x34, 0x66, 0xf, 0x5e, 0, 0,
+  0x23, 0xf, 0x5e, 0, 0,
+  0x34, 0xf2, 0xf, 0x5f, 0, 0,
+  0x34, 0xf3, 0xf, 0x5f, 0, 0,
+  0x34, 0x66, 0xf, 0x5f, 0, 0,
+  0x23, 0xf, 0x5f, 0, 0,
+  0x34, 0x66, 0xf, 0x60, 0, 0,
+  0x23, 0xf, 0x60, 0, 0,
+  0x34, 0x66, 0xf, 0x61, 0, 0,
+  0x23, 0xf, 0x61, 0, 0,
+  0x34, 0x66, 0xf, 0x62, 0, 0,
+  0x23, 0xf, 0x62, 0, 0,
+  0x34, 0x66, 0xf, 0x63, 0, 0,
+  0x23, 0xf, 0x63, 0, 0,
+  0x34, 0x66, 0xf, 0x64, 0, 0,
+  0x23, 0xf, 0x64, 0, 0,
+  0x34, 0x66, 0xf, 0x65, 0, 0,
+  0x23, 0xf, 0x65, 0, 0,
+  0x34, 0x66, 0xf, 0x66, 0, 0,
+  0x23, 0xf, 0x66, 0, 0,
+  0x34, 0x66, 0xf, 0x67, 0, 0,
+  0x23, 0xf, 0x67, 0, 0,
+  0x34, 0x66, 0xf, 0x68, 0, 0,
+  0x23, 0xf, 0x68, 0, 0,
+  0x34, 0x66, 0xf, 0x69, 0, 0,
+  0x23, 0xf, 0x69, 0, 0,
+  0x34, 0x66, 0xf, 0x6a, 0, 0,
+  0x23, 0xf, 0x6a, 0, 0,
+  0x34, 0x66, 0xf, 0x6b, 0, 0,
+  0x23, 0xf, 0x6b, 0, 0,
+  0x34, 0x66, 0xf, 0x6c, 0, 0,
+  0x34, 0x66, 0xf, 0x6d, 0, 0,
+  0x34, 0x66, 0xf, 0x6e, 0, 0,
+  0x23, 0xf, 0x6e, 0, 0,
+  0x34, 0x66, 0xf, 0x6f, 0, 0,
+  0x34, 0xf3, 0xf, 0x6f, 0, 0,
+  0x23, 0xf, 0x6f, 0, 0,
+  0x34, 0x66, 0xf, 0x70, 0, 0,
+  0x34, 0xf2, 0xf, 0x70, 0, 0,
+  0x34, 0xf3, 0xf, 0x70, 0, 0,
+  0x23, 0xf, 0x70, 0, 0,
+  0x34, 0x66, 0xf, 0x74, 0, 0,
+  0x23, 0xf, 0x74, 0, 0,
+  0x34, 0x66, 0xf, 0x75, 0, 0,
+  0x23, 0xf, 0x75, 0, 0,
+  0x34, 0x66, 0xf, 0x76, 0, 0,
+  0x23, 0xf, 0x76, 0, 0,
+  0x34, 0x66, 0xf, 0x7c, 0, 0,
+  0x34, 0xf2, 0xf, 0x7c, 0, 0,
+  0x34, 0x66, 0xf, 0x7d, 0, 0,
+  0x34, 0xf2, 0xf, 0x7d, 0, 0,
+  0x34, 0x66, 0xf, 0x7e, 0, 0,
+  0x34, 0xf3, 0xf, 0x7e, 0, 0,
+  0x23, 0xf, 0x7e, 0, 0,
+  0x34, 0x66, 0xf, 0x7f, 0, 0,
+  0x34, 0xf3, 0xf, 0x7f, 0, 0,
+  0x23, 0xf, 0x7f, 0, 0,
+  0x23, 0xf, 0xc3, 0, 0,
+  0x34, 0x66, 0xf, 0xc4, 0, 0,
+  0x23, 0xf, 0xc4, 0, 0,
+  0x34, 0x66, 0xf, 0xc5, 0xc0, 0xc0,
+  0x23, 0xf, 0xc5, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xc6, 0, 0,
+  0x23, 0xf, 0xc6, 0, 0,
+  0x34, 0x66, 0xf, 0xd1, 0, 0,
+  0x23, 0xf, 0xd1, 0, 0,
+  0x34, 0x66, 0xf, 0xd2, 0, 0,
+  0x23, 0xf, 0xd2, 0, 0,
+  0x34, 0x66, 0xf, 0xd3, 0, 0,
+  0x23, 0xf, 0xd3, 0, 0,
+  0x34, 0x66, 0xf, 0xd4, 0, 0,
+  0x23, 0xf, 0xd4, 0, 0,
+  0x34, 0x66, 0xf, 0xd5, 0, 0,
+  0x23, 0xf, 0xd5, 0, 0,
+  0x34, 0x66, 0xf, 0xd6, 0, 0,
+  0x34, 0xf2, 0xf, 0xd6, 0xc0, 0xc0,
+  0x34, 0xf3, 0xf, 0xd6, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xd7, 0xc0, 0xc0,
+  0x23, 0xf, 0xd7, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xd8, 0, 0,
+  0x23, 0xf, 0xd8, 0, 0,
+  0x34, 0x66, 0xf, 0xd9, 0, 0,
+  0x23, 0xf, 0xd9, 0, 0,
+  0x34, 0x66, 0xf, 0xda, 0, 0,
+  0x23, 0xf, 0xda, 0, 0,
+  0x34, 0x66, 0xf, 0xdc, 0, 0,
+  0x23, 0xf, 0xdc, 0, 0,
+  0x34, 0x66, 0xf, 0xdd, 0, 0,
+  0x23, 0xf, 0xdd, 0, 0,
+  0x34, 0x66, 0xf, 0xde, 0, 0,
+  0x23, 0xf, 0xde, 0, 0,
+  0x34, 0x66, 0xf, 0xe0, 0, 0,
+  0x23, 0xf, 0xe0, 0, 0,
+  0x34, 0x66, 0xf, 0xe1, 0, 0,
+  0x23, 0xf, 0xe1, 0, 0,
+  0x34, 0x66, 0xf, 0xe2, 0, 0,
+  0x23, 0xf, 0xe2, 0, 0,
+  0x34, 0x66, 0xf, 0xe3, 0, 0,
+  0x23, 0xf, 0xe3, 0, 0,
+  0x34, 0x66, 0xf, 0xe4, 0, 0,
+  0x23, 0xf, 0xe4, 0, 0,
+  0x34, 0x66, 0xf, 0xe5, 0, 0,
+  0x23, 0xf, 0xe5, 0, 0,
+  0x34, 0x66, 0xf, 0xe7, 0, 0,
+  0x23, 0xf, 0xe7, 0, 0,
+  0x34, 0x66, 0xf, 0xe8, 0, 0,
+  0x23, 0xf, 0xe8, 0, 0,
+  0x34, 0x66, 0xf, 0xe9, 0, 0,
+  0x23, 0xf, 0xe9, 0, 0,
+  0x34, 0x66, 0xf, 0xea, 0, 0,
+  0x23, 0xf, 0xea, 0, 0,
+  0x34, 0x66, 0xf, 0xec, 0, 0,
+  0x23, 0xf, 0xec, 0, 0,
+  0x34, 0x66, 0xf, 0xed, 0, 0,
+  0x23, 0xf, 0xed, 0, 0,
+  0x34, 0x66, 0xf, 0xee, 0, 0,
+  0x23, 0xf, 0xee, 0, 0,
+  0x34, 0xf2, 0xf, 0xf0, 0, 0,
+  0x34, 0x66, 0xf, 0xf1, 0, 0,
+  0x23, 0xf, 0xf1, 0, 0,
+  0x34, 0x66, 0xf, 0xf2, 0, 0,
+  0x23, 0xf, 0xf2, 0, 0,
+  0x34, 0x66, 0xf, 0xf3, 0, 0,
+  0x23, 0xf, 0xf3, 0, 0,
+  0x34, 0x66, 0xf, 0xf4, 0, 0,
+  0x23, 0xf, 0xf4, 0, 0,
+  0x34, 0x66, 0xf, 0xf6, 0, 0,
+  0x23, 0xf, 0xf6, 0, 0,
+  0x34, 0x66, 0xf, 0xf7, 0xc0, 0xc0,
+  0x23, 0xf, 0xf7, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xf8, 0, 0,
+  0x23, 0xf, 0xf8, 0, 0,
+  0x34, 0x66, 0xf, 0xf9, 0, 0,
+  0x23, 0xf, 0xf9, 0, 0,
+  0x34, 0x66, 0xf, 0xfa, 0, 0,
+  0x23, 0xf, 0xfa, 0, 0,
+  0x34, 0x66, 0xf, 0xfb, 0, 0,
+  0x23, 0xf, 0xfb, 0, 0,
+  0x34, 0x66, 0xf, 0xfc, 0, 0,
+  0x23, 0xf, 0xfc, 0, 0,
+  0x34, 0x66, 0xf, 0xfd, 0, 0,
+  0x23, 0xf, 0xfd, 0, 0,
+  0x34, 0x66, 0xf, 0xfe, 0, 0,
+  0x23, 0xf, 0xfe, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0, 0, 0,
+  0x34, 0xf, 0x38, 0, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1, 0, 0,
+  0x34, 0xf, 0x38, 0x1, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2, 0, 0,
+  0x34, 0xf, 0x38, 0x2, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3, 0, 0,
+  0x34, 0xf, 0x38, 0x3, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x4, 0, 0,
+  0x34, 0xf, 0x38, 0x4, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x5, 0, 0,
+  0x34, 0xf, 0x38, 0x5, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x6, 0, 0,
+  0x34, 0xf, 0x38, 0x6, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x7, 0, 0,
+  0x34, 0xf, 0x38, 0x7, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x8, 0, 0,
+  0x34, 0xf, 0x38, 0x8, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x9, 0, 0,
+  0x34, 0xf, 0x38, 0x9, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0xa, 0, 0,
+  0x34, 0xf, 0x38, 0xa, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0xb, 0, 0,
+  0x34, 0xf, 0x38, 0xb, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1c, 0, 0,
+  0x34, 0xf, 0x38, 0x1c, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1d, 0, 0,
+  0x34, 0xf, 0x38, 0x1d, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1e, 0, 0,
+  0x34, 0xf, 0x38, 0x1e, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xf, 0, 0,
+  0x34, 0xf, 0x3a, 0xf, 0, 0,
+  0x34, 0x66, 0xf, 0xc7, 0x38, 0x30,
+  0x34, 0xf3, 0xf, 0xc7, 0x38, 0x30,
+  0x23, 0xf, 0xc7, 0x38, 0x30,
+  0x23, 0xf, 0xc7, 0x38, 0x38,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xd0,
+  0x23, 0xf, 0x71, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xe0,
+  0x23, 0xf, 0x71, 0xf8, 0xe0,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xf0,
+  0x23, 0xf, 0x71, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xd0,
+  0x23, 0xf, 0x72, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xe0,
+  0x23, 0xf, 0x72, 0xf8, 0xe0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xf0,
+  0x23, 0xf, 0x72, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xd0,
+  0x23, 0xf, 0x73, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xd8,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xf0,
+  0x23, 0xf, 0x73, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xf8,
+  0x33, 0xf, 0xae, 0xe8,
+  0x33, 0xf, 0xae, 0xf0,
+  0x33, 0xf, 0xae, 0xf8,
+  0x23, 0xf, 0xae, 0x38, 0x38,
+  0x23, 0xf, 0xf, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xc, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xd, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x14, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x15, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x40, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x41, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x21, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2a, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x42, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2b, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x10, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xe, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x29, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x61, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x60, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x63, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x62, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x37, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x41, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x20, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x22, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3c, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3d, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3f, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3e, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x38, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x39, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3b, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3a, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x20, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x21, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x22, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x23, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x24, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x25, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x30, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x31, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x32, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x33, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x34, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x35, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x28, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x40, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x17, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x8, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x9, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xa, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xb, 0, 0,
+  0x1, 0xe7, 0x7,
+};
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff
new file mode 100644
index 0000000..e9b5c40
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff
@@ -0,0 +1,303 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.155/backends/m68k_init.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/m68k_init.c
+@@ -0,0 +1,49 @@
++/* Initialization of m68k specific backend library.
++   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
++
++   This software is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   This softare is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with this software; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++*/
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#define BACKEND		m68k_
++#define RELOC_PREFIX	R_68K_
++#include "libebl_CPU.h"
++
++/* This defines the common reloc hooks based on m68k_reloc.def.  */
++#include "common-reloc.c"
++
++
++const char *
++m68k_init (elf, machine, eh, ehlen)
++     Elf *elf __attribute__ ((unused));
++     GElf_Half machine __attribute__ ((unused));
++     Ebl *eh;
++     size_t ehlen;
++{
++  /* Check whether the Elf_BH object has a sufficent size.  */
++  if (ehlen < sizeof (Ebl))
++    return NULL;
++
++  /* We handle it.  */
++  eh->name = "m68k";
++  m68k_init_reloc (eh);
++  HOOK (eh, reloc_simple_type);
++  HOOK (eh, register_info);
++
++  return MODVERSION;
++}
+Index: elfutils-0.155/backends/m68k_regs.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/m68k_regs.c
+@@ -0,0 +1,106 @@
++/* Register names and numbers for m68k DWARF.
++   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
++
++   This software is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   This software is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with this software; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <string.h>
++#include <dwarf.h>
++
++#define BACKEND m68k_
++#include "libebl_CPU.h"
++
++ssize_t
++m68k_register_info (Ebl *ebl __attribute__ ((unused)),
++		   int regno, char *name, size_t namelen,
++		   const char **prefix, const char **setname,
++		   int *bits, int *type)
++{
++	if (name == NULL)
++		return 25;
++
++	if (regno < 0 || regno > 24 || namelen < 5)
++		return -1;
++
++	*prefix = "%";
++	*bits = 32;
++	*type = (regno < 8 ? DW_ATE_signed
++		: regno < 16 ? DW_ATE_address : DW_ATE_float);
++
++	if (regno < 8)
++	{
++		*setname = "integer";
++	}
++	else if (regno < 16)
++	{
++		*setname = "address";
++	}
++	else if (regno < 24)
++	{
++		*setname = "FPU";
++	}
++	else
++	{
++		*setname = "address";
++		*type = DW_ATE_address;
++	}
++
++	switch (regno)
++	{
++	case 0 ... 7:
++		name[0] = 'd';
++		name[1] = regno + '0';
++		namelen = 2;
++		break;
++
++	case 8 ... 13:
++		name[0] = 'a';
++		name[1] = regno - 8 + '0';
++		namelen = 2;
++		break;
++
++	case 14:
++		name[0] = 'f';
++		name[1] = 'p';
++   		namelen = 2;
++		break;
++
++	case 15:
++		name[0] = 's';
++		name[1] = 'p';
++   		namelen = 2;
++		break;
++
++	case 16 ... 23:
++		name[0] = 'f';
++		name[1] = 'p';
++		name[2] = regno - 16 + '0';
++   		namelen = 3;
++		break;
++
++	case 24:
++		name[0] = 'p';
++		name[1] = 'c';
++		namelen = 2;
++	}
++
++	name[namelen++] = '\0';
++	return namelen;
++}
++
+Index: elfutils-0.155/backends/m68k_reloc.def
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/m68k_reloc.def
+@@ -0,0 +1,45 @@
++/* List the relocation types for m68k.  -*- C -*-
++   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
++
++   This software is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   This software is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with this software; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++*/
++
++/* 	    NAME,		REL|EXEC|DYN	*/
++
++RELOC_TYPE (NONE,		0)
++RELOC_TYPE (32,			REL|EXEC|DYN)
++RELOC_TYPE (16,			REL)
++RELOC_TYPE (8,			REL)
++RELOC_TYPE (PC32,		REL|EXEC|DYN)
++RELOC_TYPE (PC16,		REL)
++RELOC_TYPE (PC8,		REL)
++RELOC_TYPE (GOT32,		REL)
++RELOC_TYPE (GOT16,		REL)
++RELOC_TYPE (GOT8,		REL)
++RELOC_TYPE (GOT32O,		REL)
++RELOC_TYPE (GOT16O,		REL)
++RELOC_TYPE (GOT8O,		REL)
++RELOC_TYPE (PLT32,		REL)
++RELOC_TYPE (PLT16,		REL)
++RELOC_TYPE (PLT8,		REL)
++RELOC_TYPE (PLT32O,		REL)
++RELOC_TYPE (PLT16O,		REL)
++RELOC_TYPE (PLT8O,		REL)
++RELOC_TYPE (COPY,		EXEC)
++RELOC_TYPE (GLOB_DAT,		EXEC|DYN)
++RELOC_TYPE (JMP_SLOT,		EXEC|DYN)
++RELOC_TYPE (RELATIVE,		EXEC|DYN)
++RELOC_TYPE (GNU_VTINHERIT,	REL)
++RELOC_TYPE (GNU_VTENTRY,	REL)
++
+Index: elfutils-0.155/libelf/elf.h
+===================================================================
+--- elfutils-0.155.orig/libelf/elf.h
++++ elfutils-0.155/libelf/elf.h
+@@ -1126,6 +1126,9 @@ typedef struct
+ #define R_68K_GLOB_DAT	20		/* Create GOT entry */
+ #define R_68K_JMP_SLOT	21		/* Create PLT entry */
+ #define R_68K_RELATIVE	22		/* Adjust by program base */
++/* The next 2 are GNU extensions to enable C++ vtable garbage collection.  */
++#define R_68K_GNU_VTINHERIT 23
++#define R_68K_GNU_VTENTRY   24
+ #define R_68K_TLS_GD32      25          /* 32 bit GOT offset for GD */
+ #define R_68K_TLS_GD16      26          /* 16 bit GOT offset for GD */
+ #define R_68K_TLS_GD8       27          /* 8 bit GOT offset for GD */
+Index: elfutils-0.155/backends/Makefile.am
+===================================================================
+--- elfutils-0.155.orig/backends/Makefile.am
++++ elfutils-0.155/backends/Makefile.am
+@@ -32,7 +32,7 @@ INCLUDES += -I$(top_srcdir)/libebl -I$(t
+ 	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
+ 
+ 
+-modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 tilegx parisc mips
++modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 tilegx parisc mips m68k
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
+ 	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
+@@ -111,6 +111,10 @@ mips_SRCS = mips_init.c mips_symbol.c mi
+ libebl_mips_pic_a_SOURCES = $(mips_SRCS)
+ am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
+ 
++m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c
++libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
++am_libebl_m68k_pic_a_OBJECTS = $(m68k_SRCS:.c=.os)
++
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+ 	echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+Index: elfutils-0.155/backends/m68k_symbol.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/m68k_symbol.c
+@@ -0,0 +1,43 @@
++/* m68k specific symbolic name handling.
++   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
++
++   This software is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   This software distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with this software; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++*/
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <elf.h>
++#include <stddef.h>
++
++#define BACKEND		m68k_
++#include "libebl_CPU.h"
++
++/* Check for the simple reloc types.  */
++Elf_Type
++m68k_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
++{
++  switch (type)
++    {
++    case R_68K_32:
++      return ELF_T_SWORD;
++    case R_68K_16:
++      return ELF_T_HALF;
++    case R_68K_8:
++      return ELF_T_BYTE;
++    default:
++      return ELF_T_NUM;
++    }
++}
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils-0.155/mempcpy.patch
new file mode 100644
index 0000000..1d5a37e
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/mempcpy.patch
@@ -0,0 +1,24 @@
+
+uclibc does not export __mempcpy like glibc so we alias it here.
+This patch may make sense for upstream but elfutils uses more
+glibc specific features like obstack_printf which are missing in
+uclibc they need to be fixed along to make it work all the way
+
+Upstream-Status: Inappropriate[Elfutils uses more glibc specific features]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: elfutils-0.155/libelf/elf_begin.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf_begin.c
++++ elfutils-0.155/libelf/elf_begin.c
+@@ -68,6 +68,9 @@
+ #include "libelfP.h"
+ #include "common.h"
+ 
++#ifdef __UCLIBC__
++#define __mempcpy mempcpy
++#endif
+ 
+ /* Create descriptor for archive in memory.  */
+ static inline Elf *
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff
new file mode 100644
index 0000000..8e07c33
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff
@@ -0,0 +1,708 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.155/backends/mips_init.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/mips_init.c
+@@ -0,0 +1,60 @@
++/* Initialization of mips specific backend library.
++   Copyright (C) 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#define BACKEND		mips_
++#define RELOC_PREFIX	R_MIPS_
++#include "libebl_CPU.h"
++
++/* This defines the common reloc hooks based on mips_reloc.def.  */
++#include "common-reloc.c"
++
++const char *
++mips_init (elf, machine, eh, ehlen)
++     Elf *elf __attribute__ ((unused));
++     GElf_Half machine __attribute__ ((unused));
++     Ebl *eh;
++     size_t ehlen;
++{
++  /* Check whether the Elf_BH object has a sufficent size.  */
++  if (ehlen < sizeof (Ebl))
++    return NULL;
++
++  /* We handle it.  */
++  if (machine == EM_MIPS)
++    eh->name = "MIPS R3000 big-endian";
++  else if (machine == EM_MIPS_RS3_LE)
++    eh->name = "MIPS R3000 little-endian";
++
++  mips_init_reloc (eh);
++  HOOK (eh, reloc_simple_type);
++  HOOK (eh, return_value_location);
++  HOOK (eh, register_info);
++
++  return MODVERSION;
++}
+Index: elfutils-0.155/backends/mips_regs.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/mips_regs.c
+@@ -0,0 +1,104 @@
++/* Register names and numbers for MIPS DWARF.
++   Copyright (C) 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <string.h>
++#include <dwarf.h>
++
++#define BACKEND mips_
++#include "libebl_CPU.h"
++
++ssize_t
++mips_register_info (Ebl *ebl __attribute__((unused)),
++		    int regno, char *name, size_t namelen,
++		    const char **prefix, const char **setname,
++		    int *bits, int *type)
++{
++  if (name == NULL)
++    return 66;
++
++  if (regno < 0 || regno > 65 || namelen < 4)
++    return -1;
++
++  *prefix = "$";
++
++  if (regno < 32)
++    {
++      *setname = "integer";
++      *type = DW_ATE_signed;
++      *bits = 32;
++      if (regno < 32 + 10)
++        {
++          name[0] = regno + '0';
++          namelen = 1;
++        }
++      else
++        {
++          name[0] = (regno / 10) + '0';
++          name[1] = (regno % 10) + '0';
++          namelen = 2;
++        }
++    }
++  else if (regno < 64)
++    {
++      *setname = "FPU";
++      *type = DW_ATE_float;
++      *bits = 32;
++      name[0] = 'f';
++      if (regno < 32 + 10)
++	{
++	  name[1] = (regno - 32) + '0';
++	  namelen = 2;
++	}
++      else
++	{
++	  name[1] = (regno - 32) / 10 + '0';
++	  name[2] = (regno - 32) % 10 + '0';
++	  namelen = 3;
++	}
++    }
++  else if (regno == 64)
++    {
++      *type = DW_ATE_signed;
++      *bits = 32;
++      name[0] = 'h';
++      name[1] = 'i';
++      namelen = 2;
++    }
++  else
++    {
++      *type = DW_ATE_signed;
++      *bits = 32;
++      name[0] = 'l';
++      name[1] = 'o';
++      namelen = 2;
++    }
++
++  name[namelen++] = '\0';
++  return namelen;
++}
+Index: elfutils-0.155/backends/mips_reloc.def
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/mips_reloc.def
+@@ -0,0 +1,79 @@
++/* List the relocation types for mips.  -*- C -*-
++   Copyright (C) 2006 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++/* 	    NAME,		REL|EXEC|DYN	*/
++
++RELOC_TYPE (NONE,               0)
++RELOC_TYPE (16,                 0)
++RELOC_TYPE (32,                 0)
++RELOC_TYPE (REL32,              0)
++RELOC_TYPE (26,                 0)
++RELOC_TYPE (HI16,               0)
++RELOC_TYPE (LO16,               0)
++RELOC_TYPE (GPREL16,            0)
++RELOC_TYPE (LITERAL,            0)
++RELOC_TYPE (GOT16,              0)
++RELOC_TYPE (PC16,               0)
++RELOC_TYPE (CALL16,             0)
++RELOC_TYPE (GPREL32,            0)
++
++RELOC_TYPE (SHIFT5,             0)
++RELOC_TYPE (SHIFT6,             0)
++RELOC_TYPE (64,                 0)
++RELOC_TYPE (GOT_DISP,           0)
++RELOC_TYPE (GOT_PAGE,           0)
++RELOC_TYPE (GOT_OFST,           0)
++RELOC_TYPE (GOT_HI16,           0)
++RELOC_TYPE (GOT_LO16,           0)
++RELOC_TYPE (SUB,                0)
++RELOC_TYPE (INSERT_A,           0)
++RELOC_TYPE (INSERT_B,           0)
++RELOC_TYPE (DELETE,             0)
++RELOC_TYPE (HIGHER,             0)
++RELOC_TYPE (HIGHEST,            0)
++RELOC_TYPE (CALL_HI16,          0)
++RELOC_TYPE (CALL_LO16,          0)
++RELOC_TYPE (SCN_DISP,           0)
++RELOC_TYPE (REL16,              0)
++RELOC_TYPE (ADD_IMMEDIATE,      0)
++RELOC_TYPE (PJUMP,              0)
++RELOC_TYPE (RELGOT,             0)
++RELOC_TYPE (JALR,               0)
++RELOC_TYPE (TLS_DTPMOD32,       0)
++RELOC_TYPE (TLS_DTPREL32,       0)
++RELOC_TYPE (TLS_DTPMOD64,       0)
++RELOC_TYPE (TLS_DTPREL64,       0)
++RELOC_TYPE (TLS_GD,             0)
++RELOC_TYPE (TLS_LDM,            0)
++RELOC_TYPE (TLS_DTPREL_HI16,    0)
++RELOC_TYPE (TLS_DTPREL_LO16,    0)
++RELOC_TYPE (TLS_GOTTPREL,       0)
++RELOC_TYPE (TLS_TPREL32,        0)
++RELOC_TYPE (TLS_TPREL64,        0)
++RELOC_TYPE (TLS_TPREL_HI16,     0)
++RELOC_TYPE (TLS_TPREL_LO16,     0)
++
++#define NO_COPY_RELOC 1
++#define NO_RELATIVE_RELOC 1
+Index: elfutils-0.155/backends/mips_retval.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/mips_retval.c
+@@ -0,0 +1,321 @@
++/* Function return value location for Linux/mips ABI.
++   Copyright (C) 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <string.h>
++#include <assert.h>
++#include <dwarf.h>
++#include <elf.h>
++
++#include "../libebl/libeblP.h"
++#include "../libdw/libdwP.h"
++
++#define BACKEND mips_
++#include "libebl_CPU.h"
++
++/* The ABI of the file.  Also see EF_MIPS_ABI2 above. */
++#define EF_MIPS_ABI		0x0000F000
++
++/* The original o32 abi. */
++#define E_MIPS_ABI_O32          0x00001000
++
++/* O32 extended to work on 64 bit architectures */
++#define E_MIPS_ABI_O64          0x00002000
++
++/* EABI in 32 bit mode */
++#define E_MIPS_ABI_EABI32       0x00003000
++
++/* EABI in 64 bit mode */
++#define E_MIPS_ABI_EABI64       0x00004000
++
++/* All the possible MIPS ABIs. */
++enum mips_abi
++  {
++    MIPS_ABI_UNKNOWN = 0,
++    MIPS_ABI_N32,
++    MIPS_ABI_O32,
++    MIPS_ABI_N64,
++    MIPS_ABI_O64,
++    MIPS_ABI_EABI32,
++    MIPS_ABI_EABI64,
++    MIPS_ABI_LAST
++  };
++
++/* Find the mips ABI of the current file */
++enum mips_abi find_mips_abi(Elf *elf)
++{
++  GElf_Ehdr ehdr_mem;
++  GElf_Ehdr *ehdr = gelf_getehdr (elf, &ehdr_mem);
++
++  if (ehdr == NULL)
++    return MIPS_ABI_LAST;
++
++  GElf_Word elf_flags = ehdr->e_flags;
++
++  /* Check elf_flags to see if it specifies the ABI being used.  */
++  switch ((elf_flags & EF_MIPS_ABI))
++    {
++    case E_MIPS_ABI_O32:
++      return MIPS_ABI_O32;
++    case E_MIPS_ABI_O64:
++      return MIPS_ABI_O64;
++    case E_MIPS_ABI_EABI32:
++      return MIPS_ABI_EABI32;
++    case E_MIPS_ABI_EABI64:
++      return MIPS_ABI_EABI64;
++    default:
++      if ((elf_flags & EF_MIPS_ABI2))
++	return MIPS_ABI_N32;
++    }
++
++  /* GCC creates a pseudo-section whose name describes the ABI.  */
++  size_t shstrndx;
++  if (elf_getshdrstrndx (elf, &shstrndx) < 0)
++    return MIPS_ABI_LAST;
++
++  const char *name;
++  Elf_Scn *scn = NULL;
++  while ((scn = elf_nextscn (elf, scn)) != NULL)
++    {
++      GElf_Shdr shdr_mem;
++      GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
++      if (shdr == NULL)
++        return MIPS_ABI_LAST;
++
++      name = elf_strptr (elf, shstrndx, shdr->sh_name) ?: "";
++      if (strncmp (name, ".mdebug.", 8) != 0)
++        continue;
++
++      if (strcmp (name, ".mdebug.abi32") == 0)
++        return MIPS_ABI_O32;
++      else if (strcmp (name, ".mdebug.abiN32") == 0)
++        return MIPS_ABI_N32;
++      else if (strcmp (name, ".mdebug.abi64") == 0)
++        return MIPS_ABI_N64;
++      else if (strcmp (name, ".mdebug.abiO64") == 0)
++        return MIPS_ABI_O64;
++      else if (strcmp (name, ".mdebug.eabi32") == 0)
++        return MIPS_ABI_EABI32;
++      else if (strcmp (name, ".mdebug.eabi64") == 0)
++        return MIPS_ABI_EABI64;
++      else
++        return MIPS_ABI_UNKNOWN;
++    }
++
++  return MIPS_ABI_UNKNOWN;
++}
++
++unsigned int
++mips_abi_regsize (enum mips_abi abi)
++{
++  switch (abi)
++    {
++    case MIPS_ABI_EABI32:
++    case MIPS_ABI_O32:
++      return 4;
++    case MIPS_ABI_N32:
++    case MIPS_ABI_N64:
++    case MIPS_ABI_O64:
++    case MIPS_ABI_EABI64:
++      return 8;
++    case MIPS_ABI_UNKNOWN:
++    case MIPS_ABI_LAST:
++    default:
++      return 0;
++    }
++}
++
++
++/* $v0 or pair $v0, $v1 */
++static const Dwarf_Op loc_intreg_o32[] =
++  {
++    { .atom = DW_OP_reg2 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_reg3 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++
++static const Dwarf_Op loc_intreg[] =
++  {
++    { .atom = DW_OP_reg2 }, { .atom = DW_OP_piece, .number = 8 },
++    { .atom = DW_OP_reg3 }, { .atom = DW_OP_piece, .number = 8 },
++  };
++#define nloc_intreg	1
++#define nloc_intregpair	4
++
++/* $f0 (float), or pair $f0, $f1 (double).
++ * f2/f3 are used for COMPLEX (= 2 doubles) returns in Fortran */
++static const Dwarf_Op loc_fpreg_o32[] =
++  {
++    { .atom = DW_OP_regx, .number = 32 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_regx, .number = 33 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_regx, .number = 34 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_regx, .number = 35 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++
++/* $f0, or pair $f0, $f2.  */
++static const Dwarf_Op loc_fpreg[] =
++  {
++    { .atom = DW_OP_regx, .number = 32 }, { .atom = DW_OP_piece, .number = 8 },
++    { .atom = DW_OP_regx, .number = 34 }, { .atom = DW_OP_piece, .number = 8 },
++  };
++#define nloc_fpreg  1
++#define nloc_fpregpair 4
++#define nloc_fpregquad 8
++
++/* The return value is a structure and is actually stored in stack space
++   passed in a hidden argument by the caller.  But, the compiler
++   helpfully returns the address of that space in $v0.  */
++static const Dwarf_Op loc_aggregate[] =
++  {
++    { .atom = DW_OP_breg2, .number = 0 }
++  };
++#define nloc_aggregate 1
++
++int
++mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++  /* First find the ABI used by the elf object */
++  enum mips_abi abi = find_mips_abi(functypedie->cu->dbg->elf);
++
++  /* Something went seriously wrong while trying to figure out the ABI */
++  if (abi == MIPS_ABI_LAST)
++    return -1;
++
++  /* We couldn't identify the ABI, but the file seems valid */
++  if (abi == MIPS_ABI_UNKNOWN)
++    return -2;
++
++  /* Can't handle EABI variants */
++  if ((abi == MIPS_ABI_EABI32) || (abi == MIPS_ABI_EABI64))
++    return -2;
++
++  unsigned int regsize = mips_abi_regsize (abi);
++  if (!regsize)
++    return -2;
++
++  /* Start with the function's type, and get the DW_AT_type attribute,
++     which is the type of the return value.  */
++
++  Dwarf_Attribute attr_mem;
++  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type, &attr_mem);
++  if (attr == NULL)
++    /* The function has no return value, like a `void' function in C.  */
++    return 0;
++
++  Dwarf_Die die_mem;
++  Dwarf_Die *typedie = dwarf_formref_die (attr, &die_mem);
++  int tag = dwarf_tag (typedie);
++
++  /* Follow typedefs and qualifiers to get to the actual type.  */
++  while (tag == DW_TAG_typedef
++	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
++	 || tag == DW_TAG_restrict_type || tag == DW_TAG_mutable_type)
++    {
++      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
++      typedie = dwarf_formref_die (attr, &die_mem);
++      tag = dwarf_tag (typedie);
++    }
++
++  switch (tag)
++    {
++    case -1:
++      return -1;
++
++    case DW_TAG_subrange_type:
++      if (! dwarf_hasattr_integrate (typedie, DW_AT_byte_size))
++	{
++	  attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
++	  typedie = dwarf_formref_die (attr, &die_mem);
++	  tag = dwarf_tag (typedie);
++	}
++      /* Fall through.  */
++
++    case DW_TAG_base_type:
++    case DW_TAG_enumeration_type:
++    case DW_TAG_pointer_type:
++    case DW_TAG_ptr_to_member_type:
++      {
++        Dwarf_Word size;
++	if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
++					 &attr_mem), &size) != 0)
++	  {
++	    if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
++	      size = regsize;
++	    else
++	      return -1;
++	  }
++	if (tag == DW_TAG_base_type)
++	  {
++	    Dwarf_Word encoding;
++	    if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
++					     &attr_mem), &encoding) != 0)
++	      return -1;
++
++#define ABI_LOC(loc, regsize) ((regsize) == 4 ? (loc ## _o32) : (loc))
++
++	    if (encoding == DW_ATE_float)
++	      {
++		*locp = ABI_LOC(loc_fpreg, regsize);
++		if (size <= regsize)
++		    return nloc_fpreg;
++
++		if (size <= 2*regsize)
++                  return nloc_fpregpair;
++
++		if (size <= 4*regsize && abi == MIPS_ABI_O32)
++                  return nloc_fpregquad;
++
++		goto aggregate;
++	      }
++	  }
++	*locp = ABI_LOC(loc_intreg, regsize);
++	if (size <= regsize)
++	  return nloc_intreg;
++	if (size <= 2*regsize)
++	  return nloc_intregpair;
++
++	/* Else fall through. Shouldn't happen though (at least with gcc) */
++      }
++
++    case DW_TAG_structure_type:
++    case DW_TAG_class_type:
++    case DW_TAG_union_type:
++    case DW_TAG_array_type:
++    aggregate:
++      /* XXX TODO: Can't handle structure return with other ABI's yet :-/ */
++      if ((abi != MIPS_ABI_O32) && (abi != MIPS_ABI_O64))
++        return -2;
++
++      *locp = loc_aggregate;
++      return nloc_aggregate;
++    }
++
++  /* XXX We don't have a good way to return specific errors from ebl calls.
++     This value means we do not understand the type, but it is well-formed
++     DWARF and might be valid.  */
++  return -2;
++}
+Index: elfutils-0.155/backends/mips_symbol.c
+===================================================================
+--- /dev/null
++++ elfutils-0.155/backends/mips_symbol.c
+@@ -0,0 +1,52 @@
++/* MIPS specific symbolic name handling.
++   Copyright (C) 2002, 2003, 2005 Red Hat, Inc.
++   This file is part of Red Hat elfutils.
++   Written by Jakub Jelinek <jakub@redhat.com>, 2002.
++
++   Red Hat elfutils is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by the
++   Free Software Foundation; version 2 of the License.
++
++   Red Hat elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License along
++   with Red Hat elfutils; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
++
++   Red Hat elfutils is an included package of the Open Invention Network.
++   An included package of the Open Invention Network is a package for which
++   Open Invention Network licensees cross-license their patents.  No patent
++   license is granted, either expressly or impliedly, by designation as an
++   included package.  Should you wish to participate in the Open Invention
++   Network licensing program, please visit www.openinventionnetwork.com
++   <http://www.openinventionnetwork.com>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <elf.h>
++#include <stddef.h>
++
++#define BACKEND		mips_
++#include "libebl_CPU.h"
++
++/* Check for the simple reloc types.  */
++Elf_Type
++mips_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
++{
++  switch (type)
++    {
++    case R_MIPS_16:
++      return ELF_T_HALF;
++    case R_MIPS_32:
++      return ELF_T_WORD;
++    case R_MIPS_64:
++      return ELF_T_XWORD;
++    default:
++      return ELF_T_NUM;
++    }
++}
+Index: elfutils-0.155/libebl/eblopenbackend.c
+===================================================================
+--- elfutils-0.155.orig/libebl/eblopenbackend.c
++++ elfutils-0.155/libebl/eblopenbackend.c
+@@ -71,6 +71,8 @@ static const struct
+   { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
+   { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
+   { "s390", "ebl_s390", "s390", 4, EM_S390, 0, 0 },
++  { "mips", "elf_mips", "mips", 4, EM_MIPS, 0, 0 },
++  { "mips", "elf_mipsel", "mipsel", 4, EM_MIPS_RS3_LE, 0, 0 },
+ 
+   { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
+   { "m68k", "elf_m68k", "m68k", 4, EM_68K, 0, 0 },
+Index: elfutils-0.155/backends/common-reloc.c
+===================================================================
+--- elfutils-0.155.orig/backends/common-reloc.c
++++ elfutils-0.155/backends/common-reloc.c
+@@ -112,11 +112,13 @@ EBLHOOK(reloc_valid_use) (Elf *elf, int
+ }
+ 
+ 
++#ifndef NO_COPY_RELOC
+ bool
+ EBLHOOK(copy_reloc_p) (int reloc)
+ {
+   return reloc == R_TYPE (COPY);
+ }
++#endif
+ 
+ bool
+ EBLHOOK(none_reloc_p) (int reloc)
+@@ -138,7 +140,9 @@ EBLHOOK(init_reloc) (Ebl *ebl)
+   ebl->reloc_type_name = EBLHOOK(reloc_type_name);
+   ebl->reloc_type_check = EBLHOOK(reloc_type_check);
+   ebl->reloc_valid_use = EBLHOOK(reloc_valid_use);
++#ifndef NO_COPY_RELOC
+   ebl->copy_reloc_p = EBLHOOK(copy_reloc_p);
++#endif
+   ebl->none_reloc_p = EBLHOOK(none_reloc_p);
+ #ifndef NO_RELATIVE_RELOC
+   ebl->relative_reloc_p = EBLHOOK(relative_reloc_p);
+Index: elfutils-0.155/backends/Makefile.am
+===================================================================
+--- elfutils-0.155.orig/backends/Makefile.am
++++ elfutils-0.155/backends/Makefile.am
+@@ -32,7 +32,7 @@ INCLUDES += -I$(top_srcdir)/libebl -I$(t
+ 	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
+ 
+ 
+-modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 tilegx parisc
++modules = i386 sh x86_64 ia64 alpha arm sparc ppc ppc64 s390 tilegx parisc mips
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
+ 	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
+@@ -107,6 +107,10 @@ parisc_SRCS = parisc_init.c parisc_symbo
+ libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
+ am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++libebl_mips_pic_a_SOURCES = $(mips_SRCS)
++am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
++
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+ 	echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch b/meta/recipes-devtools/elfutils/elfutils-0.155/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
new file mode 100644
index 0000000..9a400da
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+
+nm: Fix size passed to snprintf for invalid sh_name case.
+native build failed as following on Fedora18:
+nm.c: In function 'show_symbols_sysv':
+nm.c:756:27: error: argument to 'sizeof' in 'snprintf' call is the same expression as the destination; did you mean to provide an explicit length? [-Werror=sizeof-pointer-memaccess]
+    snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
+                           ^
+
+The original commit is http://git.fedorahosted.org/cgit/elfutils.git/commit/src/nm.c?id=57bd66cabf6e6b9ecf622cdbf350804897a8df58
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- elfutils-0.155/src/nm.c.org	2013-03-11 22:36:11.000000000 -0500
++++ elfutils-0.155/src/nm.c	2013-03-11 22:46:09.000000000 -0500
+@@ -752,8 +752,9 @@
+ 			       gelf_getshdr (scn, &shdr_mem)->sh_name);
+       if (unlikely (name == NULL))
+ 	{
+-	  name = alloca (sizeof "[invalid sh_name 0x12345678]");
+-	  snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
++	  const size_t bufsz = sizeof "[invalid sh_name 0x12345678]";
++	  name = alloca (bufsz);
++	  snprintf (name, bufsz, "[invalid sh_name %#" PRIx32 "]",
+ 		    gelf_getshdr (scn, &shdr_mem)->sh_name);
+ 	}
+       scnnames[elf_ndxscn (scn)] = name;
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff
new file mode 100644
index 0000000..bf47ade
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff
@@ -0,0 +1,1775 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.155/backends/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/backends/ChangeLog
++++ elfutils-0.155/backends/ChangeLog
+@@ -135,6 +135,10 @@
+ 	* ppc_attrs.c (ppc_check_object_attribute): Handle tag
+ 	GNU_Power_ABI_Struct_Return.
+ 
++2009-01-23  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (libebl_%.so): Use $(LD_AS_NEEDED).
++
+ 2008-10-04  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* i386_reloc.def: Fix entries for TLS_GOTDESC, TLS_DESC_CALL, and
+@@ -462,6 +466,11 @@
+ 	* sparc_init.c: Likewise.
+ 	* x86_64_init.c: Likewise.
+ 
++2005-11-22  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (LD_AS_NEEDED): New variable, substituted by configure.
++	(libebl_%.so rule): Use it in place of -Wl,--as-needed.
++
+ 2005-11-19  Roland McGrath  <roland@redhat.com>
+ 
+ 	* ppc64_reloc.def: REL30 -> ADDR30.
+@@ -484,6 +493,9 @@
+ 	* Makefile.am (uninstall): Don't try to remove $(pkgincludedir).
+ 	(CLEANFILES): Add libebl_$(m).so.
+ 
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 	* ppc_reloc.def: Update bits per Alan Modra <amodra@bigpond.net.au>.
+ 	* ppc64_reloc.def: Likewise.
+ 
+Index: elfutils-0.155/backends/Makefile.am
+===================================================================
+--- elfutils-0.155.orig/backends/Makefile.am
++++ elfutils-0.155/backends/Makefile.am
+@@ -111,7 +111,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a
+ 	$(LINK) -shared -o $(@:.map=.so) \
+ 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
+ 		-Wl,--version-script,$(@:.so=.map) \
+-		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
++		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
+ 	$(textrel_check)
+ 
+ libebl_i386.so: $(cpu_i386)
+Index: elfutils-0.155/backends/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/backends/Makefile.in
++++ elfutils-0.155/backends/Makefile.in
+@@ -38,7 +38,8 @@ build_triplet = @build@
+ host_triplet = @host@
+ DIST_COMMON = $(noinst_HEADERS) $(srcdir)/Makefile.am \
+ 	$(srcdir)/Makefile.in $(top_srcdir)/config/eu.am ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ subdir = backends
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/nls.m4 $(top_srcdir)/m4/po.m4 \
+@@ -172,6 +173,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -201,6 +203,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -263,10 +266,9 @@ INCLUDES = -I. -I$(srcdir) -I$(top_srcdi
+ 	-I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
+ 	-I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1)
++	$(am__append_1) $(am__append_2)
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+@@ -725,7 +727,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a
+ 	$(LINK) -shared -o $(@:.map=.so) \
+ 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
+ 		-Wl,--version-script,$(@:.so=.map) \
+-		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
++		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
+ 	$(textrel_check)
+ 
+ libebl_i386.so: $(cpu_i386)
+Index: elfutils-0.155/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/ChangeLog
++++ elfutils-0.155/ChangeLog
+@@ -16,6 +16,8 @@
+ 
+ 2012-01-24  Mark Wielaard  <mjw@redhat.com>
+ 
++	* configure.ac: Wrap AC_COMPILE_IFELSE sources in AC_LANG_SOURCE.
++
+ 	* COPYING: Fix address. Updated version from gnulib.
+ 
+ 2012-01-23  Mark Wielaard  <mjw@redhat.com>
+@@ -34,6 +36,9 @@
+ 
+ 2011-10-08  Mike Frysinger  <vapier@gentoo.org>
+ 
++	* configure.ac (--disable-werror): Handle it, controlling BUILD_WERROR
++	automake option.
++
+ 	* configure.ac: Fix use of AC_ARG_ENABLE to handle $enableval correctly.
+ 
+ 2011-10-02  Ulrich Drepper  <drepper@gmail.com>
+@@ -55,6 +60,10 @@
+ 
+ 	* configure.ac (LOCALEDIR, DATADIRNAME): Removed.
+ 
++2009-11-22  Roland McGrath  <roland@redhat.com>
++
++	* configure.ac: Use sed and expr instead of modern bash extensions.
++
+ 2009-09-21  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* configure.ac: Update for more modern autoconf.
+@@ -63,6 +72,10 @@
+ 
+ 	* configure.ac (zip_LIBS): Check for liblzma too.
+ 
++2009-08-17  Roland McGrath  <roland@redhat.com>
++
++	* configure.ac: Check for -fgnu89-inline; add it to WEXTRA if it works.
++
+ 2009-04-19  Roland McGrath  <roland@redhat.com>
+ 
+ 	* configure.ac (eu_version): Round down here, not in version.h macros.
+@@ -74,6 +87,8 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* configure.ac: Check for __builtin_popcount.
++
+ 	* configure.ac (zlib check): Check for gzdirect, need zlib >= 1.2.2.3.
+ 
+ 	* configure.ac (__thread check): Use AC_LINK_IFELSE, in case of
+@@ -154,6 +169,10 @@
+ 	* configure.ac: Add dummy automake conditional to get dependencies
+ 	for non-generic linker right.  See src/Makefile.am.
+ 
++2005-11-22  Roland McGrath  <roland@redhat.com>
++
++	* configure.ac: Check for --as-needed linker option.
++
+ 2005-11-18  Roland McGrath  <roland@redhat.com>
+ 
+ 	* Makefile.am (DISTCHECK_CONFIGURE_FLAGS): New variable.
+@@ -201,6 +220,17 @@
+ 	* Makefile.am (all_SUBDIRS): Add libdwfl.
+ 	* configure.ac: Write libdwfl/Makefile.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* configure.ac (WEXTRA): Check for -Wextra and set this substitution.
++
++	* configure.ac: Check for struct stat st_?tim members.
++	* src/strip.c (process_file): Use st_?time if st_?tim are not there.
++
++	* configure.ac: Check for futimes function.
++	* src/strip.c (handle_elf) [! HAVE_FUTIMES]: Use utimes instead.
++	(handle_ar) [! HAVE_FUTIMES]: Likewise.
++
+ 2005-05-19  Roland McGrath  <roland@redhat.com>
+ 
+ 	* configure.ac [AH_BOTTOM] (INTDECL, _INTDECL): New macros.
+Index: elfutils-0.155/config/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/config/ChangeLog
++++ elfutils-0.155/config/ChangeLog
+@@ -19,6 +19,10 @@
+ 
+ 	* known-dwarf.awk: Use gawk.
+ 
++2011-10-08  Mike Frysinger  <vapier@gentoo.org>
++
++	* eu.am [BUILD_WERROR]: Conditionalize -Werror use on this.
++
+ 2010-07-02  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elfutils.spec.in: Add more BuildRequires.
+Index: elfutils-0.155/config/eu.am
+===================================================================
+--- elfutils-0.155.orig/config/eu.am
++++ elfutils-0.155/config/eu.am
+@@ -1,6 +1,6 @@
+ ## Common automake fragments for elfutils subdirectory makefiles.
+ ##
+-## Copyright (C) 2010 Red Hat, Inc.
++## Copyright (C) 2010-2011 Red Hat, Inc.
+ ##
+ ## This file is part of elfutils.
+ ##
+@@ -29,14 +29,20 @@
+ ## not, see <http://www.gnu.org/licenses/>.
+ ##
+ 
++WEXTRA = @WEXTRA@
++LD_AS_NEEDED = @LD_AS_NEEDED@
++
+ DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
+ INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
+-	    $(if $($(*F)_no_Werror),,-Werror) \
+-	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
++	    $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
+ 	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
+ 	    $($(*F)_CFLAGS)
+ 
++if BUILD_WERROR
++AM_CFLAGS += $(if $($(*F)_no_Werror),,-Werror)
++endif
++
+ if MUDFLAP
+ AM_CFLAGS += -fmudflap
+ libmudflap = -lmudflap
+Index: elfutils-0.155/config/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/config/Makefile.in
++++ elfutils-0.155/config/Makefile.in
+@@ -76,6 +76,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -105,6 +106,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+Index: elfutils-0.155/config.h.in
+===================================================================
+--- elfutils-0.155.orig/config.h.in
++++ elfutils-0.155/config.h.in
+@@ -6,6 +6,9 @@
+ /* Defined if libdw should support GNU ref_alt FORM, dwz multi files. */
+ #undef ENABLE_DWZ
+ 
++/* Have __builtin_popcount. */
++#undef HAVE_BUILTIN_POPCOUNT
++
+ /* $libdir subdirectory containing libebl modules. */
+ #undef LIBEBL_SUBDIR
+ 
+@@ -64,4 +67,7 @@
+ /* Define for large files, on AIX-style hosts. */
+ #undef _LARGE_FILES
+ 
++/* Stubbed out if missing compiler support. */
++#undef __thread
++
+ #include <eu-config.h>
+Index: elfutils-0.155/configure
+===================================================================
+--- elfutils-0.155.orig/configure
++++ elfutils-0.155/configure
+@@ -598,6 +598,8 @@ ZLIB_TRUE
+ LIBEBL_SUBDIR
+ TESTS_RPATH_FALSE
+ TESTS_RPATH_TRUE
++BUILD_WERROR_FALSE
++BUILD_WERROR_TRUE
+ BUILD_STATIC_FALSE
+ BUILD_STATIC_TRUE
+ GCOV_FALSE
+@@ -612,6 +614,8 @@ NEVER_TRUE
+ base_cpu
+ NATIVE_LD_FALSE
+ NATIVE_LD_TRUE
++LD_AS_NEEDED
++WEXTRA
+ LEXLIB
+ LEX_OUTPUT_ROOT
+ LEX
+@@ -725,6 +729,7 @@ enable_mudflap
+ enable_debugpred
+ enable_gprof
+ enable_gcov
++enable_werror
+ enable_tests_rpath
+ enable_libebl_subdir
+ with_zlib
+@@ -1378,6 +1383,7 @@ Optional Features:
+                           prediction
+   --enable-gprof          build binaries with gprof support
+   --enable-gcov           build binaries with gcov support
++  --disable-werror        do not build with -Werror
+   --enable-tests-rpath    build $ORIGIN-using rpath into tests
+   --enable-libebl-subdir=DIR
+                           install libebl_CPU modules in $(libdir)/DIR
+@@ -3917,6 +3923,130 @@ if test "x$ac_cv_c99" != xyes; then :
+   as_fn_error $? "gcc with C99 support required" "$LINENO" 5
+ fi
+ 
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for -Wextra option to $CC" >&5
++$as_echo_n "checking for -Wextra option to $CC... " >&6; }
++if ${ac_cv_cc_wextra+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -Wextra"
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++void foo (void) { }
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  ac_cv_cc_wextra=yes
++else
++  ac_cv_cc_wextra=no
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++CFLAGS="$old_CFLAGS"
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_cc_wextra" >&5
++$as_echo "$ac_cv_cc_wextra" >&6; }
++
++if test "x$ac_cv_cc_wextra" = xyes; then :
++  WEXTRA=-Wextra
++else
++  WEXTRA=-W
++fi
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for -fgnu89-inline option to $CC" >&5
++$as_echo_n "checking for -fgnu89-inline option to $CC... " >&6; }
++if ${ac_cv_cc_gnu89_inline+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -fgnu89-inline -Werror"
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++void foo (void)
++{
++  inline void bar (void) {}
++  bar ();
++}
++extern inline void baz (void) {}
++
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  ac_cv_cc_gnu89_inline=yes
++else
++  ac_cv_cc_gnu89_inline=no
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++CFLAGS="$old_CFLAGS"
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_cc_gnu89_inline" >&5
++$as_echo "$ac_cv_cc_gnu89_inline" >&6; }
++if test "x$ac_cv_cc_gnu89_inline" = xyes; then :
++  WEXTRA="${WEXTRA:+$WEXTRA }-fgnu89-inline"
++fi
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for --as-needed linker option" >&5
++$as_echo_n "checking for --as-needed linker option... " >&6; }
++if ${ac_cv_as_needed+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  cat > conftest.c <<EOF
++int main (void) { return 0; }
++EOF
++if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS
++			    -fPIC -shared -o conftest.so conftest.c
++			    -Wl,--as-needed 1>&5'
++  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
++  test $ac_status = 0; }; }
++then
++  ac_cv_as_needed=yes
++else
++  ac_cv_as_needed=no
++fi
++rm -f conftest*
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_as_needed" >&5
++$as_echo "$ac_cv_as_needed" >&6; }
++if test "x$ac_cv_as_needed" = xyes; then :
++  LD_AS_NEEDED=-Wl,--as-needed
++else
++  LD_AS_NEEDED=
++fi
++
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for __builtin_popcount" >&5
++$as_echo_n "checking for __builtin_popcount... " >&6; }
++if ${ac_cv_popcount+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++int
++main ()
++{
++exit (__builtin_popcount (127));
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_link "$LINENO"; then :
++  ac_cv_popcount=yes
++else
++  ac_cv_popcount=no
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_popcount" >&5
++$as_echo "$ac_cv_popcount" >&6; }
++if test "x$ac_cv_popcount" = xyes; then :
++
++$as_echo "#define HAVE_BUILTIN_POPCOUNT 1" >>confdefs.h
++
++fi
++
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for __thread support" >&5
+ $as_echo_n "checking for __thread support... " >&6; }
+ if ${ac_cv_tls+:} false; then :
+@@ -3953,7 +4083,13 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_tls" >&5
+ $as_echo "$ac_cv_tls" >&6; }
+ if test "x$ac_cv_tls" != xyes; then :
+-  as_fn_error $? "__thread support required" "$LINENO" 5
++  if test "$use_locks" = yes; then :
++  as_fn_error $? "--enable-thread-safety requires __thread support" "$LINENO" 5
++else
++
++$as_echo "#define __thread /* empty: no multi-thread support */" >>confdefs.h
++
++fi
+ fi
+ 
+ # Check whether --enable-largefile was given.
+@@ -4302,6 +4438,22 @@ else
+ fi
+ 
+ 
++# Check whether --enable-werror was given.
++if test "${enable_werror+set}" = set; then :
++  enableval=$enable_werror; enable_werror=$enableval
++else
++  enable_werror=yes
++fi
++
++ if test "$enable_werror" = yes; then
++  BUILD_WERROR_TRUE=
++  BUILD_WERROR_FALSE='#'
++else
++  BUILD_WERROR_TRUE='#'
++  BUILD_WERROR_FALSE=
++fi
++
++
+ # Check whether --enable-tests-rpath was given.
+ if test "${enable_tests_rpath+set}" = set; then :
+   enableval=$enable_tests_rpath; tests_use_rpath=$enableval
+@@ -5022,7 +5174,7 @@ case "$eu_version" in
+ esac
+ 
+ # Round up to the next release API (x.y) version.
+-eu_version=$(( (eu_version + 999) / 1000 ))
++eu_version=`expr \( $eu_version + 999 \) / 1000`
+ 
+ cat >confcache <<\_ACEOF
+ # This file is a shell script that caches the results of configure
+@@ -5185,6 +5337,10 @@ if test -z "${BUILD_STATIC_TRUE}" && tes
+   as_fn_error $? "conditional \"BUILD_STATIC\" was never defined.
+ Usually this means the macro was only invoked conditionally." "$LINENO" 5
+ fi
++if test -z "${BUILD_WERROR_TRUE}" && test -z "${BUILD_WERROR_FALSE}"; then
++  as_fn_error $? "conditional \"BUILD_WERROR\" was never defined.
++Usually this means the macro was only invoked conditionally." "$LINENO" 5
++fi
+ if test -z "${TESTS_RPATH_TRUE}" && test -z "${TESTS_RPATH_FALSE}"; then
+   as_fn_error $? "conditional \"TESTS_RPATH\" was never defined.
+ Usually this means the macro was only invoked conditionally." "$LINENO" 5
+
+Index: elfutils-0.155/configure.ac
+===================================================================
+--- elfutils-0.155.orig/configure.ac
++++ elfutils-0.155/configure.ac
+@@ -90,6 +90,54 @@ CFLAGS="$old_CFLAGS"])
+ AS_IF([test "x$ac_cv_c99" != xyes],
+       AC_MSG_ERROR([gcc with C99 support required]))
+ 
++AC_CACHE_CHECK([for -Wextra option to $CC], ac_cv_cc_wextra, [dnl
++old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -Wextra"
++AC_COMPILE_IFELSE([AC_LANG_SOURCE([void foo (void) { }])],
++		  ac_cv_cc_wextra=yes, ac_cv_cc_wextra=no)
++CFLAGS="$old_CFLAGS"])
++AC_SUBST(WEXTRA)
++AS_IF([test "x$ac_cv_cc_wextra" = xyes], [WEXTRA=-Wextra], [WEXTRA=-W])
++
++AC_CACHE_CHECK([for -fgnu89-inline option to $CC], ac_cv_cc_gnu89_inline, [dnl
++old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -fgnu89-inline -Werror"
++AC_COMPILE_IFELSE([AC_LANG_SOURCE([
++void foo (void)
++{
++  inline void bar (void) {}
++  bar ();
++}
++extern inline void baz (void) {}
++])], ac_cv_cc_gnu89_inline=yes, ac_cv_cc_gnu89_inline=no)
++CFLAGS="$old_CFLAGS"])
++AS_IF([test "x$ac_cv_cc_gnu89_inline" = xyes],
++      [WEXTRA="${WEXTRA:+$WEXTRA }-fgnu89-inline"])
++
++AC_CACHE_CHECK([for --as-needed linker option],
++	       ac_cv_as_needed, [dnl
++cat > conftest.c <<EOF
++int main (void) { return 0; }
++EOF
++if AC_TRY_COMMAND([${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS
++			    -fPIC -shared -o conftest.so conftest.c
++			    -Wl,--as-needed 1>&AS_MESSAGE_LOG_FD])
++then
++  ac_cv_as_needed=yes
++else
++  ac_cv_as_needed=no
++fi
++rm -f conftest*])
++AS_IF([test "x$ac_cv_as_needed" = xyes],
++      [LD_AS_NEEDED=-Wl,--as-needed], [LD_AS_NEEDED=])
++AC_SUBST(LD_AS_NEEDED)
++
++AC_CACHE_CHECK([for __builtin_popcount], ac_cv_popcount, [dnl
++AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[exit (__builtin_popcount (127));]])],
++	       ac_cv_popcount=yes, ac_cv_popcount=no)])
++AS_IF([test "x$ac_cv_popcount" = xyes],
++      [AC_DEFINE([HAVE_BUILTIN_POPCOUNT], [1], [Have __builtin_popcount.])])
++
+ AC_CACHE_CHECK([for __thread support], ac_cv_tls, [dnl
+ # Use the same flags that we use for our DSOs, so the test is representative.
+ # Some old compiler/linker/libc combinations fail some ways and not others.
+@@ -105,7 +153,10 @@ static __thread int a; int foo (int b) {
+ CFLAGS="$save_CFLAGS"
+ LDFLAGS="$save_LDFLAGS"])
+ AS_IF([test "x$ac_cv_tls" != xyes],
+-      AC_MSG_ERROR([__thread support required]))
++      [AS_IF([test "$use_locks" = yes],
++	     [AC_MSG_ERROR([--enable-thread-safety requires __thread support])],
++	     [AC_DEFINE([__thread], [/* empty: no multi-thread support */],
++			[Stubbed out if missing compiler support.])])])
+ 
+ dnl This test must come as early as possible after the compiler configuration
+ dnl tests, because the choice of the file model can (in principle) affect
+@@ -193,6 +244,11 @@ AM_CONDITIONAL(GCOV, test "$use_gcov" =
+ AM_CONDITIONAL(BUILD_STATIC, [dnl
+ test "$use_mudflap" = yes -o "$use_gprof" = yes -o "$use_gcov" = yes])
+ 
++AC_ARG_ENABLE([werror],
++AS_HELP_STRING([--disable-werror],[do not build with -Werror]),
++	       [enable_werror=$enableval], [enable_werror=yes])
++AM_CONDITIONAL(BUILD_WERROR, test "$enable_werror" = yes)
++
+ AC_ARG_ENABLE([tests-rpath],
+ AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
+ 	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
+@@ -304,6 +360,6 @@ case "$eu_version" in
+ esac
+ 
+ # Round up to the next release API (x.y) version.
+-eu_version=$(( (eu_version + 999) / 1000 ))
++eu_version=`expr \( $eu_version + 999 \) / 1000`
+ 
+ AC_OUTPUT
+Index: elfutils-0.155/lib/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/lib/ChangeLog
++++ elfutils-0.155/lib/ChangeLog
+@@ -35,6 +35,9 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* eu-config.h [! HAVE_BUILTIN_POPCOUNT]
++	(__builtin_popcount): New inline function.
++
+ 	* eu-config.h: Add multiple inclusion protection.
+ 
+ 2009-01-17  Ulrich Drepper  <drepper@redhat.com>
+@@ -91,6 +94,11 @@
+ 	* Makefile.am (libeu_a_SOURCES): Add it.
+ 	* system.h: Declare crc32_file.
+ 
++2005-02-07  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-04-30  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* Makefile.am: Use -ffunction-sections for xmalloc.c.
+Index: elfutils-0.155/lib/eu-config.h
+===================================================================
+--- elfutils-0.155.orig/lib/eu-config.h
++++ elfutils-0.155/lib/eu-config.h
+@@ -162,6 +162,17 @@ asm (".section predict_data, \"aw\"; .pr
+ /* This macro is used by the tests conditionalize for standalone building.  */
+ #define ELFUTILS_HEADER(name) <lib##name.h>
+ 
++#ifndef HAVE_BUILTIN_POPCOUNT
++# define __builtin_popcount hakmem_popcount
++static inline unsigned int __attribute__ ((unused))
++hakmem_popcount (unsigned int x)
++{
++  /* HAKMEM 169 */
++  unsigned int n = x - ((x >> 1) & 033333333333) - ((x >> 2) & 011111111111);
++  return ((n + (n >> 3)) & 030707070707) % 63;
++}
++#endif	/* HAVE_BUILTIN_POPCOUNT */
++
+ 
+ #ifdef SHARED
+ # define OLD_VERSION(name, version) \
+Index: elfutils-0.155/lib/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/lib/Makefile.in
++++ elfutils-0.155/lib/Makefile.in
+@@ -37,7 +37,8 @@ build_triplet = @build@
+ host_triplet = @host@
+ DIST_COMMON = $(noinst_HEADERS) $(srcdir)/Makefile.am \
+ 	$(srcdir)/Makefile.in $(top_srcdir)/config/eu.am ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ subdir = lib
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/nls.m4 $(top_srcdir)/m4/po.m4 \
+@@ -100,6 +101,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -129,6 +131,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -190,10 +193,9 @@ zip_LIBS = @zip_LIBS@
+ INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. \
+ 	-I$(srcdir)/../libelf
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1) -fpic
++	$(am__append_1) $(am__append_2) -fpic
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+Index: elfutils-0.155/libasm/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/libasm/ChangeLog
++++ elfutils-0.155/libasm/ChangeLog
+@@ -71,6 +71,11 @@
+ 	* asm_error.c: Add new error ASM_E_IOERROR.
+ 	* libasmP.h: Add ASM_E_IOERROR definition.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-02-15  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* Makefile.am (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
+Index: elfutils-0.155/libasm/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/libasm/Makefile.in
++++ elfutils-0.155/libasm/Makefile.in
+@@ -39,10 +39,11 @@ host_triplet = @host@
+ DIST_COMMON = $(noinst_HEADERS) $(pkginclude_HEADERS) \
+ 	$(srcdir)/Makefile.am $(srcdir)/Makefile.in \
+ 	$(top_srcdir)/config/eu.am ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ @MUDFLAP_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
+ @MUDFLAP_TRUE@am_libasm_pic_a_OBJECTS =
+-@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_2 = -lpthread
++@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_3 = -lpthread
+ subdir = libasm
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/nls.m4 $(top_srcdir)/m4/po.m4 \
+@@ -153,6 +154,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -182,6 +184,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -244,10 +247,9 @@ INCLUDES = -I. -I$(srcdir) -I$(top_srcdi
+ 	-I$(top_srcdir)/libelf -I$(top_srcdir)/libebl \
+ 	-I$(top_srcdir)/libdw
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1)
++	$(am__append_1) $(am__append_2)
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+@@ -276,7 +278,7 @@ libasm_a_SOURCES = asm_begin.c asm_abort
+ 
+ @MUDFLAP_FALSE@libasm_pic_a_SOURCES = 
+ @MUDFLAP_FALSE@am_libasm_pic_a_OBJECTS = $(libasm_a_SOURCES:.c=.os)
+-@MUDFLAP_FALSE@libasm_so_LDLIBS = $(am__append_2)
++@MUDFLAP_FALSE@libasm_so_LDLIBS = $(am__append_3)
+ @MUDFLAP_FALSE@libasm_so_SOURCES = 
+ noinst_HEADERS = libasmP.h symbolhash.h
+ EXTRA_DIST = libasm.map
+Index: elfutils-0.155/libcpu/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/libcpu/ChangeLog
++++ elfutils-0.155/libcpu/ChangeLog
+@@ -38,6 +38,9 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* i386_disasm.c (i386_disasm): Add abort after assert-constant for old
++	compilers that don't realize it's noreturn.
++
+ 	* Makefile.am (i386_parse_CFLAGS): Use quotes around command
+ 	substitution that can produce leading whitespace.
+ 
+@@ -367,6 +370,11 @@
+ 	* defs/i386.doc: New file.
+ 	* defs/x86_64: New file.
+ 
++2005-04-04  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it instead of -Wextra.
++
+ 2005-02-15  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* Makefile (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
+Index: elfutils-0.155/libcpu/i386_disasm.c
+===================================================================
+--- elfutils-0.155.orig/libcpu/i386_disasm.c
++++ elfutils-0.155/libcpu/i386_disasm.c
+@@ -822,6 +822,7 @@ i386_disasm (const uint8_t **startp, con
+ 
+ 			default:
+ 			  assert (! "INVALID not handled");
++			  abort ();
+ 			}
+ 		    }
+ 		  else
+Index: elfutils-0.155/libcpu/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/libcpu/Makefile.in
++++ elfutils-0.155/libcpu/Makefile.in
+@@ -39,7 +39,8 @@ host_triplet = @host@
+ DIST_COMMON = $(am__noinst_HEADERS_DIST) $(srcdir)/Makefile.am \
+ 	$(srcdir)/Makefile.in $(top_srcdir)/config/eu.am ChangeLog \
+ 	i386_lex.c i386_parse.c
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ @MAINTAINER_MODE_TRUE@noinst_PROGRAMS = i386_gendis$(EXEEXT)
+ subdir = libcpu
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+@@ -117,6 +118,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = lex.$(<F:lex.l=)
+@@ -146,6 +148,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -208,10 +211,9 @@ INCLUDES = -I. -I$(srcdir) -I$(top_srcdi
+ 	-I$(srcdir)/../libelf -I$(srcdir)/../libebl \
+ 	-I$(srcdir)/../libdw -I$(srcdir)/../libasm
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1) -fpic -fdollars-in-identifiers
++	$(am__append_1) $(am__append_2) -fpic -fdollars-in-identifiers
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+Index: elfutils-0.155/libdw/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/libdw/ChangeLog
++++ elfutils-0.155/libdw/ChangeLog
+@@ -82,6 +82,10 @@
+ 
+ 	* Makefile.am (known-dwarf.h): Run gawk on config/known-dwarf.awk.
+ 
++2011-07-20  Mark Wielaard  <mjw@redhat.com>
++
++	* dwarf_begin_elf.c: Add fallback for be64toh if not defined.
++
+ 2011-07-14  Mark Wielaard  <mjw@redhat.com>
+ 
+ 	* libdw.h (dwarf_offdie): Fix documentation to mention .debug_info.
+@@ -441,6 +445,10 @@
+ 
+ 	* dwarf_hasattr_integrate.c: Integrate DW_AT_specification too.
+ 
++2009-08-17  Roland McGrath  <roland@redhat.com>
++
++	* libdw.h: Disable extern inlines for GCC 4.2.
++
+ 2009-08-10  Roland McGrath  <roland@redhat.com>
+ 
+ 	* dwarf_getscopevar.c: Use dwarf_diename.
+@@ -1209,6 +1217,11 @@
+ 
+ 2005-05-31  Roland McGrath  <roland@redhat.com>
+ 
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
+ 	* dwarf_formref_die.c (dwarf_formref_die): Add CU header offset to
+ 	formref offset.
+ 
+Index: elfutils-0.155/libdw/dwarf_begin_elf.c
+===================================================================
+--- elfutils-0.155.orig/libdw/dwarf_begin_elf.c
++++ elfutils-0.155/libdw/dwarf_begin_elf.c
+@@ -48,6 +48,14 @@
+ #if USE_ZLIB
+ # include <endian.h>
+ # define crc32		loser_crc32
++# ifndef be64toh
++#  include <byteswap.h>
++#  if __BYTE_ORDER == __LITTLE_ENDIAN
++#   define be64toh(x) bswap_64 (x)
++#  else
++#   define be64toh(x) (x)
++#  endif
++# endif
+ # include <zlib.h>
+ # undef crc32
+ #endif
+Index: elfutils-0.155/libdw/libdw.h
+===================================================================
+--- elfutils-0.155.orig/libdw/libdw.h
++++ elfutils-0.155/libdw/libdw.h
+@@ -831,7 +831,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (
+ 
+ 
+ /* Inline optimizations.  */
+-#ifdef __OPTIMIZE__
++#if defined __OPTIMIZE__ && !(__GNUC__ == 4 && __GNUC_MINOR__ == 2)
+ /* Return attribute code of given attribute.  */
+ __libdw_extern_inline unsigned int
+ dwarf_whatattr (Dwarf_Attribute *attr)
+Index: elfutils-0.155/libdw/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/libdw/Makefile.in
++++ elfutils-0.155/libdw/Makefile.in
+@@ -39,8 +39,9 @@ host_triplet = @host@
+ DIST_COMMON = $(include_HEADERS) $(noinst_HEADERS) \
+ 	$(pkginclude_HEADERS) $(srcdir)/Makefile.am \
+ 	$(srcdir)/Makefile.in $(top_srcdir)/config/eu.am ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
+-@BUILD_STATIC_TRUE@am__append_2 = -fpic
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
++@BUILD_STATIC_TRUE@am__append_3 = -fpic
+ @MUDFLAP_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
+ @MUDFLAP_TRUE@am_libdw_pic_a_OBJECTS =
+ subdir = libdw
+@@ -198,6 +199,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -227,6 +229,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -288,10 +291,9 @@ zip_LIBS = @zip_LIBS@
+ INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. \
+ 	-I$(srcdir)/../libelf
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1) $(am__append_2)
++	$(am__append_1) $(am__append_2) $(am__append_3)
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+Index: elfutils-0.155/libdwfl/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/libdwfl/ChangeLog
++++ elfutils-0.155/libdwfl/ChangeLog
+@@ -1420,6 +1420,11 @@
+ 
+ 2005-07-21  Roland McGrath  <roland@redhat.com>
+ 
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
++2005-07-21  Roland McGrath  <roland@redhat.com>
++
+ 	* Makefile.am (noinst_HEADERS): Add loc2c.c.
+ 
+ 	* test2.c (main): Check sscanf result to quiet warning.
+Index: elfutils-0.155/libdwfl/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/libdwfl/Makefile.in
++++ elfutils-0.155/libdwfl/Makefile.in
+@@ -38,11 +38,12 @@ host_triplet = @host@
+ DIST_COMMON = $(noinst_HEADERS) $(pkginclude_HEADERS) \
+ 	$(srcdir)/Makefile.am $(srcdir)/Makefile.in \
+ 	$(top_srcdir)/config/eu.am ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
+-@MUDFLAP_FALSE@am__append_2 = libdwfl_pic.a
+-@ZLIB_TRUE@am__append_3 = gzip.c
+-@BZLIB_TRUE@am__append_4 = bzip2.c
+-@LZMA_TRUE@am__append_5 = lzma.c
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
++@MUDFLAP_FALSE@am__append_3 = libdwfl_pic.a
++@ZLIB_TRUE@am__append_4 = gzip.c
++@BZLIB_TRUE@am__append_5 = bzip2.c
++@LZMA_TRUE@am__append_6 = lzma.c
+ @MUDFLAP_TRUE@am_libdwfl_pic_a_OBJECTS =
+ subdir = libdwfl
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+@@ -188,6 +189,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -217,6 +219,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -279,10 +282,9 @@ INCLUDES = -I. -I$(srcdir) -I$(top_srcdi
+ 	-I$(srcdir)/../libelf -I$(srcdir)/../libebl \
+ 	-I$(srcdir)/../libdw
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1)
++	$(am__append_1) $(am__append_2)
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+@@ -290,7 +292,7 @@ COMPILE.os = $(filter-out -fprofile-arcs
+ 
+ CLEANFILES = *.gcno *.gcda $(am_libdwfl_pic_a_OBJECTS)
+ textrel_check = if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+-noinst_LIBRARIES = libdwfl.a $(am__append_2)
++noinst_LIBRARIES = libdwfl.a $(am__append_3)
+ pkginclude_HEADERS = libdwfl.h
+ libdwfl_a_SOURCES = dwfl_begin.c dwfl_end.c dwfl_error.c \
+ 	dwfl_version.c dwfl_module.c dwfl_report_elf.c relocate.c \
+@@ -311,8 +313,8 @@ libdwfl_a_SOURCES = dwfl_begin.c dwfl_en
+ 	dwfl_module_getsym.c dwfl_module_addrname.c \
+ 	dwfl_module_addrsym.c dwfl_module_return_value_location.c \
+ 	dwfl_module_register_names.c dwfl_segment_report_module.c \
+-	link_map.c core-file.c open.c image-header.c $(am__append_3) \
+-	$(am__append_4) $(am__append_5)
++	link_map.c core-file.c open.c image-header.c $(am__append_4) \
++	$(am__append_5) $(am__append_6)
+ @MUDFLAP_FALSE@libdwfl = $(libdw)
+ @MUDFLAP_TRUE@libdwfl = libdwfl.a $(libdw) $(libebl) $(libelf) $(libeu)
+ @MUDFLAP_FALSE@libdw = ../libdw/libdw.so
+Index: elfutils-0.155/libebl/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/libebl/ChangeLog
++++ elfutils-0.155/libebl/ChangeLog
+@@ -658,6 +658,11 @@
+ 	* Makefile.am (libebl_*_so_SOURCES): Set to $(*_SRCS) so dependency
+ 	tracking works right.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-05-21  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* libebl_x86_64.map: Add x86_64_core_note.
+Index: elfutils-0.155/libebl/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/libebl/Makefile.in
++++ elfutils-0.155/libebl/Makefile.in
+@@ -38,7 +38,8 @@ host_triplet = @host@
+ DIST_COMMON = $(noinst_HEADERS) $(pkginclude_HEADERS) \
+ 	$(srcdir)/Makefile.am $(srcdir)/Makefile.in \
+ 	$(top_srcdir)/config/eu.am ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ subdir = libebl
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/nls.m4 $(top_srcdir)/m4/po.m4 \
+@@ -150,6 +151,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -179,6 +181,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -241,10 +244,9 @@ INCLUDES = -I. -I$(srcdir) -I$(top_srcdi
+ 	-I$(srcdir)/../libelf -I$(srcdir)/../libdw \
+ 	-I$(srcdir)/../libasm
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1) -fpic
++	$(am__append_1) $(am__append_2) -fpic
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+Index: elfutils-0.155/libelf/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/libelf/ChangeLog
++++ elfutils-0.155/libelf/ChangeLog
+@@ -34,6 +34,11 @@
+ 
+ 	* elf-knowledge.h (SECTION_STRIP_P): Remove < SHT_NUM check.
+ 
++2011-03-10  Roland McGrath  <roland@redhat.com>
++
++	* gnuhash_xlate.h (elf_cvt_gnuhash): Avoid post-increment in bswap_32
++	argument, since some implementations are buggy macros.
++
+ 2011-02-26  Mark Wielaard  <mjw@redhat.com>
+ 
+ 	* elf_end.c (elf_end): Call rwlock_unlock before rwlock_fini.
+@@ -711,6 +716,11 @@
+ 
+ 	* elf.h: Update from glibc.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-05-08  Roland McGrath  <roland@redhat.com>
+ 
+ 	* elf_begin.c (read_file) [_MUDFLAP]: Don't use mmap for now.
+Index: elfutils-0.155/libelf/common.h
+===================================================================
+--- elfutils-0.155.orig/libelf/common.h
++++ elfutils-0.155/libelf/common.h
+@@ -139,7 +139,7 @@ libelf_release_all (Elf *elf)
+   (Var) = (sizeof (Var) == 1						      \
+ 	   ? (unsigned char) (Var)					      \
+ 	   : (sizeof (Var) == 2						      \
+-	      ? bswap_16 (Var)						      \
++	      ? (unsigned short int) bswap_16 (Var)			      \
+ 	      : (sizeof (Var) == 4					      \
+ 		 ? bswap_32 (Var)					      \
+ 		 : bswap_64 (Var))))
+@@ -148,7 +148,7 @@ libelf_release_all (Elf *elf)
+   (Dst) = (sizeof (Var) == 1						      \
+ 	   ? (unsigned char) (Var)					      \
+ 	   : (sizeof (Var) == 2						      \
+-	      ? bswap_16 (Var)						      \
++	      ? (unsigned short int) bswap_16 (Var)			      \
+ 	      : (sizeof (Var) == 4					      \
+ 		 ? bswap_32 (Var)					      \
+ 		 : bswap_64 (Var))))
+Index: elfutils-0.155/libelf/gnuhash_xlate.h
+===================================================================
+--- elfutils-0.155.orig/libelf/gnuhash_xlate.h
++++ elfutils-0.155/libelf/gnuhash_xlate.h
+@@ -1,5 +1,5 @@
+ /* Conversion functions for versioning information.
+-   Copyright (C) 2006, 2007 Red Hat, Inc.
++   Copyright (C) 2006-2011 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2006.
+ 
+@@ -68,7 +68,9 @@ elf_cvt_gnuhash (void *dest, const void
+   dest32 = (Elf32_Word *) &dest64[bitmask_words];
+   while (len >= 4)
+     {
+-      *dest32++ = bswap_32 (*src32++);
++      *dest32 = bswap_32 (*src32);
++      ++dest32;
++      ++src32;
+       len -= 4;
+     }
+ }
+Index: elfutils-0.155/libelf/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/libelf/Makefile.in
++++ elfutils-0.155/libelf/Makefile.in
+@@ -39,11 +39,12 @@ host_triplet = @host@
+ DIST_COMMON = $(include_HEADERS) $(noinst_HEADERS) \
+ 	$(pkginclude_HEADERS) $(srcdir)/Makefile.am \
+ 	$(srcdir)/Makefile.in $(top_srcdir)/config/eu.am ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
+-@BUILD_STATIC_TRUE@am__append_2 = -fpic
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
++@BUILD_STATIC_TRUE@am__append_3 = -fpic
+ @MUDFLAP_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
+ @MUDFLAP_TRUE@am_libelf_pic_a_OBJECTS =
+-@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_3 = -lpthread
++@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_4 = -lpthread
+ subdir = libelf
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/nls.m4 $(top_srcdir)/m4/po.m4 \
+@@ -195,6 +196,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -224,6 +226,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -284,10 +287,9 @@ top_srcdir = @top_srcdir@
+ zip_LIBS = @zip_LIBS@
+ INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1) $(am__append_2)
++	$(am__append_1) $(am__append_2) $(am__append_3)
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+@@ -352,7 +354,7 @@ libelf_a_SOURCES = elf_version.c elf_has
+ 
+ @MUDFLAP_FALSE@libelf_pic_a_SOURCES = 
+ @MUDFLAP_FALSE@am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
+-@MUDFLAP_FALSE@libelf_so_LDLIBS = $(am__append_3)
++@MUDFLAP_FALSE@libelf_so_LDLIBS = $(am__append_4)
+ @MUDFLAP_FALSE@libelf_so_SOURCES = 
+ noinst_HEADERS = elf.h abstract.h common.h exttypes.h gelf_xlate.h libelfP.h \
+ 		 version_xlate.h gnuhash_xlate.h note_xlate.h dl-hash.h
+Index: elfutils-0.155/m4/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/m4/Makefile.in
++++ elfutils-0.155/m4/Makefile.in
+@@ -75,6 +75,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -104,6 +105,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+Index: elfutils-0.155/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/Makefile.in
++++ elfutils-0.155/Makefile.in
+@@ -165,6 +165,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -194,6 +195,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+Index: elfutils-0.155/src/addr2line.c
+===================================================================
+--- elfutils-0.155.orig/src/addr2line.c
++++ elfutils-0.155/src/addr2line.c
+@@ -447,10 +447,10 @@ handle_address (const char *string, Dwfl
+       bool parsed = false;
+       int i, j;
+       char *name = NULL;
+-      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
++      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
+ 	  && string[i] == '\0')
+ 	parsed = adjust_to_section (name, &addr, dwfl);
+-      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
++      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
+ 	{
+ 	default:
+ 	  break;
+Index: elfutils-0.155/src/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/src/ChangeLog
++++ elfutils-0.155/src/ChangeLog
+@@ -606,8 +606,16 @@
+ 	* readelf.c (attr_callback): Use print_block only when we don't use
+ 	print_ops.
+ 
++2009-08-17  Roland McGrath  <roland@redhat.com>
++
++	* ld.h: Disable extern inlines for GCC 4.2.
++
+ 2009-08-14  Roland McGrath  <roland@redhat.com>
+ 
++	* strings.c (read_block): Conditionalize posix_fadvise use
++	on [POSIX_FADV_SEQUENTIAL].
++	From Petr Salinger <Petr.Salinger@seznam.cz>.
++
+ 	* ar.c (do_oper_extract): Use pathconf instead of statfs.
+ 
+ 2009-08-01  Ulrich Drepper  <drepper@redhat.com>
+@@ -771,6 +779,8 @@
+ 	* readelf.c (print_debug_frame_section): Use t instead of j formats
+ 	for ptrdiff_t OFFSET.
+ 
++	* addr2line.c (handle_address): Use %a instead of %m for compatibility.
++
+ 2009-01-21  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elflint.c (check_program_header): Fix typo in .eh_frame_hdr section
+@@ -954,6 +964,11 @@
+ 	that matches its PT_LOAD's p_flags &~ PF_W.  On sparc, PF_X really
+ 	is valid in RELRO.
+ 
++2008-03-01  Roland McGrath  <roland@redhat.com>
++
++	* readelf.c (dump_archive_index): Tweak portability hack
++	to match [__GNUC__ < 4] too.
++
+ 2008-02-29  Roland McGrath  <roland@redhat.com>
+ 
+ 	* readelf.c (print_attributes): Add a cast.
+@@ -1205,6 +1220,8 @@
+ 
+ 	* readelf.c (hex_dump): Fix rounding error in whitespace calculation.
+ 
++	* Makefile.am (readelf_no_Werror): New variable.
++
+ 2007-10-15  Roland McGrath  <roland@redhat.com>
+ 
+ 	* make-debug-archive.in: New file.
+@@ -1644,6 +1661,10 @@
+ 	* elflint.c (valid_e_machine): Add EM_ALPHA.
+ 	Reported by Christian Aichinger <Greek0@gmx.net>.
+ 
++	* strings.c (map_file): Define POSIX_MADV_SEQUENTIAL to
++	MADV_SEQUENTIAL if undefined.  	Don't call posix_madvise
++	if neither is defined.
++
+ 2006-08-08  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elflint.c (check_dynamic): Don't require DT_HASH for DT_SYMTAB.
+@@ -1720,6 +1741,10 @@
+ 	* Makefile.am: Add hacks to create dependency files for non-generic
+ 	linker.
+ 
++2006-04-05  Roland McGrath  <roland@redhat.com>
++
++	* strings.c (MAP_POPULATE): Define to 0 if undefined.
++
+ 2006-06-12  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* ldgeneric.c (ld_generic_generate_sections): Don't create .interp
+@@ -2068,6 +2093,11 @@
+ 	* readelf.c (print_debug_loc_section): Fix indentation for larger
+ 	address size.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-05-30  Roland McGrath  <roland@redhat.com>
+ 
+ 	* readelf.c (print_debug_line_section): Print section offset of each
+Index: elfutils-0.155/src/findtextrel.c
+===================================================================
+--- elfutils-0.155.orig/src/findtextrel.c
++++ elfutils-0.155/src/findtextrel.c
+@@ -496,7 +496,11 @@ ptrcompare (const void *p1, const void *
+ 
+ 
+ static void
+-check_rel (size_t nsegments, struct segments segments[nsegments],
++check_rel (size_t nsegments, struct segments segments[
++#if __GNUC__ >= 4
++						      nsegments
++#endif
++	   ],
+ 	   GElf_Addr addr, Elf *elf, Elf_Scn *symscn, Dwarf *dw,
+ 	   const char *fname, bool more_than_one, void **knownsrcs)
+ {
+Index: elfutils-0.155/src/ld.h
+===================================================================
+--- elfutils-0.155.orig/src/ld.h
++++ elfutils-0.155/src/ld.h
+@@ -1114,6 +1114,7 @@ extern bool dynamically_linked_p (void);
+ 
+ /* Checked whether the symbol is undefined and referenced from a DSO.  */
+ extern bool linked_from_dso_p (struct scninfo *scninfo, size_t symidx);
++#if defined __OPTIMIZE__ && !(__GNUC__ == 4 && __GNUC_MINOR__ == 2)
+ #ifdef __GNUC_STDC_INLINE__
+ __attribute__ ((__gnu_inline__))
+ #endif
+@@ -1131,5 +1132,6 @@ linked_from_dso_p (struct scninfo *scnin
+ 
+   return sym->defined && sym->in_dso;
+ }
++#endif	/* Optimizing and not GCC 4.2.  */
+ 
+ #endif	/* ld.h */
+Index: elfutils-0.155/src/Makefile.am
+===================================================================
+--- elfutils-0.155.orig/src/Makefile.am
++++ elfutils-0.155/src/Makefile.am
+@@ -95,6 +95,9 @@ addr2line_no_Wformat = yes
+ # XXX While the file is not finished, don't warn about this
+ ldgeneric_no_Wunused = yes
+ 
++# Buggy old compilers.
++readelf_no_Werror = yes
++
+ readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
+ 	   $(demanglelib)
+Index: elfutils-0.155/src/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/src/Makefile.in
++++ elfutils-0.155/src/Makefile.in
+@@ -40,7 +40,8 @@ host_triplet = @host@
+ DIST_COMMON = $(noinst_HEADERS) $(srcdir)/Makefile.am \
+ 	$(srcdir)/Makefile.in $(top_srcdir)/config/eu.am ChangeLog \
+ 	ldlex.c ldscript.c
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ bin_PROGRAMS = readelf$(EXEEXT) nm$(EXEEXT) size$(EXEEXT) \
+ 	strip$(EXEEXT) ld$(EXEEXT) elflint$(EXEEXT) \
+ 	findtextrel$(EXEEXT) addr2line$(EXEEXT) elfcmp$(EXEEXT) \
+@@ -49,9 +50,9 @@ bin_PROGRAMS = readelf$(EXEEXT) nm$(EXEE
+ @NATIVE_LD_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
+ # We never build this library but we need to get the dependency files
+ # of all the linker backends that might be used in a non-generic linker.
+-@NEVER_TRUE@am__append_2 = libdummy.a
++@NEVER_TRUE@am__append_3 = libdummy.a
+ # -ldl is always needed for libebl.
+-@NATIVE_LD_TRUE@am__append_3 = libld_elf.a
++@NATIVE_LD_TRUE@am__append_4 = libld_elf.a
+ @NATIVE_LD_TRUE@am_libld_elf_i386_pic_a_OBJECTS =
+ subdir = src
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+@@ -115,7 +116,7 @@ am_ld_OBJECTS = ld.$(OBJEXT) ldgeneric.$
+ 	versionhash.$(OBJEXT)
+ ld_OBJECTS = $(am_ld_OBJECTS)
+ ld_DEPENDENCIES = $(libebl) $(libelf) $(libeu) $(am__DEPENDENCIES_1) \
+-	$(am__append_3)
++	$(am__append_4)
+ ld_LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(ld_LDFLAGS) $(LDFLAGS) -o \
+ 	$@
+ am_libld_elf_i386_so_OBJECTS =
+@@ -235,6 +236,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -264,6 +266,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -327,10 +330,9 @@ INCLUDES = -I. -I$(srcdir) -I$(top_srcdi
+ 	-I$(srcdir)/../libdw -I$(srcdir)/../libdwfl \
+ 	-I$(srcdir)/../libasm
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1)
++	$(am__append_1) $(am__append_2)
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+@@ -346,8 +348,8 @@ AM_LFLAGS = -Pld -olex.yy.c
+ native_ld = @native_ld@
+ ld_dsos = libld_elf_i386_pic.a
+ @NATIVE_LD_FALSE@noinst_LIBRARIES = libld_elf.a libar.a $(ld_dsos) \
+-@NATIVE_LD_FALSE@	$(am__append_2)
+-@NATIVE_LD_TRUE@noinst_LIBRARIES = libld_elf.a libar.a $(am__append_2)
++@NATIVE_LD_FALSE@	$(am__append_3)
++@NATIVE_LD_TRUE@noinst_LIBRARIES = libld_elf.a libar.a $(am__append_3)
+ @NATIVE_LD_TRUE@native_ld_cflags = -DBASE_ELF_NAME=elf_$(base_cpu)
+ @NEVER_TRUE@libdummy_a_SOURCES = i386_ld.c
+ ld_SOURCES = ld.c ldgeneric.c ldlex.l ldscript.y symbolhash.c sectionhash.c \
+@@ -376,6 +378,9 @@ strings_no_Wformat = yes
+ addr2line_no_Wformat = yes
+ # XXX While the file is not finished, don't warn about this
+ ldgeneric_no_Wunused = yes
++
++# Buggy old compilers.
++readelf_no_Werror = yes
+ readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
+ 	   $(demanglelib)
+@@ -383,7 +388,7 @@ nm_LDADD = $(libdw) $(libebl) $(libelf)
+ size_LDADD = $(libelf) $(libeu) $(libmudflap)
+ strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
+-	$(am__append_3)
++	$(am__append_4)
+ ld_LDFLAGS = -rdynamic
+ elflint_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap)
+Index: elfutils-0.155/src/readelf.c
+===================================================================
+--- elfutils-0.155.orig/src/readelf.c
++++ elfutils-0.155/src/readelf.c
+@@ -3949,10 +3949,11 @@ struct listptr
+ #define listptr_offset_size(p)	((p)->dwarf64 ? 8 : 4)
+ #define listptr_address_size(p)	((p)->addr64 ? 8 : 4)
+ 
++static const char *listptr_name;
+ static int
+-compare_listptr (const void *a, const void *b, void *arg)
++compare_listptr (const void *a, const void *b)
+ {
+-  const char *name = arg;
++  const char *const name = listptr_name;
+   struct listptr *p1 = (void *) a;
+   struct listptr *p2 = (void *) b;
+ 
+@@ -4033,8 +4034,11 @@ static void
+ sort_listptr (struct listptr_table *table, const char *name)
+ {
+   if (table->n > 0)
+-    qsort_r (table->table, table->n, sizeof table->table[0],
+-	     &compare_listptr, (void *) name);
++    {
++      listptr_name = name;
++      qsort (table->table, table->n, sizeof table->table[0],
++	     &compare_listptr);
++    }
+ }
+ 
+ static bool
+@@ -8442,7 +8446,7 @@ dump_archive_index (Elf *elf, const char
+ 	  if (unlikely (elf_rand (elf, as_off) == 0)
+ 	      || unlikely ((subelf = elf_begin (-1, ELF_C_READ_MMAP, elf))
+ 			   == NULL))
+-#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 7)
++#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 7) || __GNUC__ < 4
+ 	    while (1)
+ #endif
+ 	      error (EXIT_FAILURE, 0,
+Index: elfutils-0.155/src/strings.c
+===================================================================
+--- elfutils-0.155.orig/src/strings.c
++++ elfutils-0.155/src/strings.c
+@@ -43,6 +43,10 @@
+ 
+ #include <system.h>
+ 
++#ifndef MAP_POPULATE
++# define MAP_POPULATE 0
++#endif
++
+ 
+ /* Prototypes of local functions.  */
+ static int read_fd (int fd, const char *fname, off64_t fdlen);
+@@ -483,8 +487,13 @@ map_file (int fd, off64_t start_off, off
+ 		    fd, start_off);
+       if (mem != MAP_FAILED)
+ 	{
++#if !defined POSIX_MADV_SEQUENTIAL && defined MADV_SEQUENTIAL
++# define POSIX_MADV_SEQUENTIAL MADV_SEQUENTIAL
++#endif
++#ifdef POSIX_MADV_SEQUENTIAL
+ 	  /* We will go through the mapping sequentially.  */
+ 	  (void) posix_madvise (mem, map_size, POSIX_MADV_SEQUENTIAL);
++#endif
+ 	  break;
+ 	}
+       if (errno != EINVAL && errno != ENOMEM)
+@@ -576,9 +585,11 @@ read_block (int fd, const char *fname, o
+       elfmap_off = from & ~(ps - 1);
+       elfmap_base = elfmap = map_file (fd, elfmap_off, fdlen, &elfmap_size);
+ 
++#ifdef POSIX_FADV_SEQUENTIAL
+       if (unlikely (elfmap == MAP_FAILED))
+ 	/* Let the kernel know we are going to read everything in sequence.  */
+ 	(void) posix_fadvise (fd, 0, 0, POSIX_FADV_SEQUENTIAL);
++#endif
+     }
+ 
+   if (unlikely (elfmap == MAP_FAILED))
+Index: elfutils-0.155/src/strip.c
+===================================================================
+--- elfutils-0.155.orig/src/strip.c
++++ elfutils-0.155/src/strip.c
+@@ -45,6 +45,12 @@
+ #include <libebl.h>
+ #include <system.h>
+ 
++#ifdef HAVE_FUTIMES
++# define FUTIMES(fd, fname, tvp) futimes (fd, tvp)
++#else
++# define FUTIMES(fd, fname, tvp) utimes (fname, tvp)
++#endif
++
+ typedef uint8_t GElf_Byte;
+ 
+ /* Name and version of program.  */
+@@ -318,8 +324,18 @@ process_file (const char *fname)
+ 
+       /* If we have to preserve the timestamp, we need it in the
+ 	 format utimes() understands.  */
++#ifdef HAVE_STRUCT_STAT_ST_ATIM
+       TIMESPEC_TO_TIMEVAL (&tv[0], &pre_st.st_atim);
++#else
++      tv[0].tv_sec = pre_st.st_atime;
++      tv[0].tv_usec = 0;
++#endif
++#ifdef HAVE_STRUCT_STAT_ST_MTIM
+       TIMESPEC_TO_TIMEVAL (&tv[1], &pre_st.st_mtim);
++#else
++      tv[1].tv_sec = pre_st.st_atime;
++      tv[1].tv_usec = 0;
++#endif
+     }
+ 
+   /* Open the file.  */
+@@ -2055,7 +2071,7 @@ while computing checksum for debug infor
+   /* If requested, preserve the timestamp.  */
+   if (tvp != NULL)
+     {
+-      if (futimes (fd, tvp) != 0)
++      if (FUTIMES (fd, output_fname, tvp) != 0)
+ 	{
+ 	  error (0, errno, gettext ("\
+ cannot set access and modification date of '%s'"),
+@@ -2112,7 +2128,7 @@ handle_ar (int fd, Elf *elf, const char
+ 
+   if (tvp != NULL)
+     {
+-      if (unlikely (futimes (fd, tvp) != 0))
++      if (unlikely (FUTIMES (fd, fname, tvp) != 0))
+ 	{
+ 	  error (0, errno, gettext ("\
+ cannot set access and modification date of '%s'"), fname);
+Index: elfutils-0.155/tests/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/tests/ChangeLog
++++ elfutils-0.155/tests/ChangeLog
+@@ -439,6 +439,8 @@
+ 
+ 2008-01-21  Roland McGrath  <roland@redhat.com>
+ 
++	* line2addr.c (main): Revert last change.
++
+ 	* testfile45.S.bz2: Add tests for cltq, cqto.
+ 	* testfile45.expect.bz2: Adjust.
+ 
+@@ -1147,6 +1149,11 @@
+ 	* Makefile.am (TESTS): Add run-elflint-test.sh.
+ 	(EXTRA_DIST): Add run-elflint-test.sh and testfile18.bz2.
+ 
++2005-05-31  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 2005-05-24  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* get-files.c (main): Use correct format specifier.
+Index: elfutils-0.155/tests/line2addr.c
+===================================================================
+--- elfutils-0.155.orig/tests/line2addr.c
++++ elfutils-0.155/tests/line2addr.c
+@@ -124,7 +124,7 @@ main (int argc, char *argv[])
+     {
+       struct args a = { .arg = argv[cnt] };
+ 
+-      switch (sscanf (a.arg, "%m[^:]:%d", &a.file, &a.line))
++      switch (sscanf (a.arg, "%a[^:]:%d", &a.file, &a.line))
+ 	{
+ 	default:
+ 	case 0:
+Index: elfutils-0.155/tests/Makefile.in
+===================================================================
+--- elfutils-0.155.orig/tests/Makefile.in
++++ elfutils-0.155/tests/Makefile.in
+@@ -35,14 +35,15 @@ build_triplet = @build@
+ host_triplet = @host@
+ DIST_COMMON = $(srcdir)/Makefile.am $(srcdir)/Makefile.in \
+ 	$(top_srcdir)/config/eu.am ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
+-@STANDALONE_FALSE@am__append_2 = -I$(top_srcdir)/libasm -I$(top_srcdir)/libdw \
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
++@STANDALONE_FALSE@am__append_3 = -I$(top_srcdir)/libasm -I$(top_srcdir)/libdw \
+ @STANDALONE_FALSE@	    -I$(top_srcdir)/libdwfl \
+ @STANDALONE_FALSE@	    -I$(top_srcdir)/libebl -I$(top_srcdir)/libelf \
+ @STANDALONE_FALSE@	    -I$(top_srcdir)/lib -I..
+ 
+-@STANDALONE_FALSE@am__append_3 = -Wl,-rpath-link,../libasm:../libdw:../libelf
+-@TESTS_RPATH_TRUE@am__append_4 = -Wl,-rpath,$(BUILD_RPATH)
++@STANDALONE_FALSE@am__append_4 = -Wl,-rpath-link,../libasm:../libdw:../libelf
++@TESTS_RPATH_TRUE@am__append_5 = -Wl,-rpath,$(BUILD_RPATH)
+ check_PROGRAMS = arextract$(EXEEXT) arsymtest$(EXEEXT) \
+ 	newfile$(EXEEXT) saridx$(EXEEXT) scnnames$(EXEEXT) \
+ 	sectiondump$(EXEEXT) showptable$(EXEEXT) update1$(EXEEXT) \
+@@ -92,12 +93,12 @@ TESTS = run-arextract.sh run-arsymtest.s
+ 	run-readelf-gdb_index.sh run-unstrip-n.sh run-low_high_pc.sh \
+ 	run-macro-test.sh run-elf_cntl_gelf_getshdr.sh \
+ 	run-test-archive64.sh $(am__EXEEXT_1) $(am__EXEEXT_3) \
+-	$(am__append_9)
+-@STANDALONE_FALSE@am__append_5 = msg_tst md5-sha1-test
++	$(am__append_10)
+ @STANDALONE_FALSE@am__append_6 = msg_tst md5-sha1-test
+-@HAVE_LIBASM_TRUE@am__append_7 = $(asm_TESTS)
++@STANDALONE_FALSE@am__append_7 = msg_tst md5-sha1-test
+ @HAVE_LIBASM_TRUE@am__append_8 = $(asm_TESTS)
+-@ENABLE_DWZ_TRUE@am__append_9 = run-readelf-dwz-multi.sh
++@HAVE_LIBASM_TRUE@am__append_9 = $(asm_TESTS)
++@ENABLE_DWZ_TRUE@am__append_10 = run-readelf-dwz-multi.sh
+ subdir = tests
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/nls.m4 $(top_srcdir)/m4/po.m4 \
+@@ -412,6 +413,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -441,6 +443,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -499,12 +502,11 @@ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+ zip_LIBS = @zip_LIBS@
+-INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. $(am__append_2)
++INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. $(am__append_3)
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
+-	$($(*F)_no_Werror),,-Werror) $(if \
+-	$($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
++	$($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
+ 	$($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
+-	$(am__append_1)
++	$(am__append_1) $(am__append_2)
+ @MUDFLAP_FALSE@libmudflap = 
+ @MUDFLAP_TRUE@libmudflap = -lmudflap
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
+@@ -514,7 +516,7 @@ CLEANFILES = *.gcno *.gcda
+ textrel_check = if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ @MUDFLAP_FALSE@BUILD_RPATH = \$$ORIGIN/../libasm:\$$ORIGIN/../libdw:\$$ORIGIN/../backends:\$$ORIGIN/../libelf
+ @MUDFLAP_TRUE@BUILD_RPATH = \$$ORIGIN/../backends
+-AM_LDFLAGS = $(am__append_3) $(am__append_4)
++AM_LDFLAGS = $(am__append_4) $(am__append_5)
+ @TESTS_RPATH_FALSE@tests_rpath = no
+ @TESTS_RPATH_TRUE@tests_rpath = yes
+ asm_TESTS = asm-tst1 asm-tst2 asm-tst3 asm-tst4 asm-tst5 \
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-robustify.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-robustify.diff
new file mode 100644
index 0000000..8636998
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-robustify.diff
@@ -0,0 +1,1824 @@
+Upstream-Status: Backport
+
+Index: elfutils-0.155/libelf/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/libdwfl/ChangeLog
++++ elfutils-0.155/libdwfl/ChangeLog
+@@ -52,6 +52,11 @@
+ 	* dwfl_module_getdwarf.c (open_elf): Clear errno before CBFAIL.
+ 	Reported by Kurt Roeckx <kurt@roeckx.be>.
+ 
++2011-03-23  Petr Machata  <pmachata@redhat.com>
++
++	* relocate.c (relocate_section): Use gelf_fsize instead of relying
++	on shdr->sh_entsize.
++
+ 2011-02-11  Roland McGrath  <roland@redhat.com>
+ 
+ 	* linux-kernel-modules.c (try_kernel_name): Try .gz, .bz2, .xz
+--- elfutils/libdwfl/relocate.c
++++ elfutils/libdwfl/relocate.c
+@@ -1,5 +1,5 @@
+ /* Relocate debug information.
+-   Copyright (C) 2005-2010 Red Hat, Inc.
++   Copyright (C) 2005-2011 Red Hat, Inc.
+    This file is part of elfutils.
+ 
+    This file is free software; you can redistribute it and/or modify
+@@ -457,7 +457,10 @@ relocate_section (Dwfl_Module *mod, Elf
+       }
+   }
+ 
+-  size_t nrels = shdr->sh_size / shdr->sh_entsize;
++  size_t sh_entsize
++    = gelf_fsize (relocated, shdr->sh_type == SHT_REL ? ELF_T_REL : ELF_T_RELA,
++		  1, EV_CURRENT);
++  size_t nrels = shdr->sh_size / sh_entsize;
+   size_t complete = 0;
+   if (shdr->sh_type == SHT_REL)
+     for (size_t relidx = 0; !result && relidx < nrels; ++relidx)
+@@ -559,7 +562,7 @@ relocate_section (Dwfl_Module *mod, Elf
+ 	  nrels = next;
+ 	}
+ 
+-      shdr->sh_size = reldata->d_size = nrels * shdr->sh_entsize;
++      shdr->sh_size = reldata->d_size = nrels * sh_entsize;
+       gelf_update_shdr (scn, shdr);
+     }
+ 
+Index: elfutils-0.155/libelf/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/libelf/ChangeLog	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.155/libelf/ChangeLog	2010-07-03 13:07:11.000000000 +0000
+@@ -703,10 +703,53 @@
+ 	If section content hasn't been read yet, do it before looking for the
+ 	block size.  If no section data present, infer size of section header.
+ 
++2005-05-14  Jakub Jelinek  <jakub@redhat.com>
++
++	* libelfP.h (INVALID_NDX): Define.
++	* gelf_getdyn.c (gelf_getdyn): Use it.  Remove ndx < 0 test if any.
++	* gelf_getlib.c (gelf_getlib): Likewise.
++	* gelf_getmove.c (gelf_getmove): Likewise.
++	* gelf_getrel.c (gelf_getrel): Likewise.
++	* gelf_getrela.c (gelf_getrela): Likewise.
++	* gelf_getsym.c (gelf_getsym): Likewise.
++	* gelf_getsyminfo.c (gelf_getsyminfo): Likewise.
++	* gelf_getsymshndx.c (gelf_getsymshndx): Likewise.
++	* gelf_getversym.c (gelf_getversym): Likewise.
++	* gelf_update_dyn.c (gelf_update_dyn): Likewise.
++	* gelf_update_lib.c (gelf_update_lib): Likewise.
++	* gelf_update_move.c (gelf_update_move): Likewise.
++	* gelf_update_rel.c (gelf_update_rel): Likewise.
++	* gelf_update_rela.c (gelf_update_rela): Likewise.
++	* gelf_update_sym.c (gelf_update_sym): Likewise.
++	* gelf_update_syminfo.c (gelf_update_syminfo): Likewise.
++	* gelf_update_symshndx.c (gelf_update_symshndx): Likewise.
++	* gelf_update_versym.c (gelf_update_versym): Likewise.
++	* elf_newscn.c (elf_newscn): Check for overflow.
++	* elf32_updatefile.c (__elfw2(LIBELFBITS,updatemmap)): Likewise.
++	(__elfw2(LIBELFBITS,updatefile)): Likewise.
++	* elf_begin.c (file_read_elf): Likewise.
++	* elf32_newphdr.c (elfw2(LIBELFBITS,newphdr)): Likewise.
++	* elf_getarsym.c (elf_getarsym): Likewise.
++	* elf32_getshdr.c (elfw2(LIBELFBITS,getshdr)): Likewise.
+ 2005-05-11  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elf.h: Update again.
+ 
++2005-05-17  Jakub Jelinek  <jakub@redhat.com>
++
++	* elf32_getphdr.c (elfw2(LIBELFBITS,getphdr)): Check if program header
++	table fits into object's bounds.
++	* elf_getshstrndx.c (elf_getshstrndx): Add elf->start_offset to
++	elf->map_address.  Check if first section header fits into object's
++	bounds.
++	* elf32_getshdr.c (elfw2(LIBELFBITS,getshdr)):
++	Check if section header table fits into object's bounds.
++	* elf_begin.c (get_shnum): Ensure section headers fits into
++	object's bounds.
++	(file_read_elf): Make sure scncnt is small enough to allocate both
++	ElfXX_Shdr and Elf_Scn array.  Make sure section and program header
++	tables fit into object's bounds.  Avoid memory leak on failure.
++
+ 2005-05-09  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elf.h: Update from glibc.
+Index: elfutils-0.155/libelf/elf32_getphdr.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf32_getphdr.c	2010-04-21 14:26:40.000000000 +0000
++++ elfutils-0.155/libelf/elf32_getphdr.c	2010-07-03 13:07:11.000000000 +0000
+@@ -93,6 +93,16 @@ __elfw2(LIBELFBITS,getphdr_wrlock) (elf)
+ 
+       if (elf->map_address != NULL)
+ 	{
++	  /* First see whether the information in the ELF header is
++	     valid and it does not ask for too much.  */
++	  if (unlikely (ehdr->e_phoff >= elf->maximum_size)
++	      || unlikely (elf->maximum_size - ehdr->e_phoff < size))
++	    {
++	      /* Something is wrong.  */
++	      __libelf_seterrno (ELF_E_INVALID_PHDR);
++	      goto out;
++	    }
++
+ 	  /* All the data is already mapped.  Use it.  */
+ 	  void *file_phdr = ((char *) elf->map_address
+ 			     + elf->start_offset + ehdr->e_phoff);
+Index: elfutils-0.155/libelf/elf32_getshdr.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf32_getshdr.c	2009-06-13 22:41:42.000000000 +0000
++++ elfutils-0.155/libelf/elf32_getshdr.c	2010-07-03 13:07:11.000000000 +0000
+@@ -60,7 +60,8 @@ load_shdr_wrlock (Elf_Scn *scn)
+     goto out;
+ 
+   size_t shnum;
+-  if (__elf_getshdrnum_rdlock (elf, &shnum) != 0)
++  if (__elf_getshdrnum_rdlock (elf, &shnum) != 0
++      || shnum > SIZE_MAX / sizeof (ElfW2(LIBELFBITS,Shdr)))
+     goto out;
+   size_t size = shnum * sizeof (ElfW2(LIBELFBITS,Shdr));
+ 
+@@ -77,6 +78,16 @@ load_shdr_wrlock (Elf_Scn *scn)
+ 
+   if (elf->map_address != NULL)
+     {
++      /* First see whether the information in the ELF header is
++	 valid and it does not ask for too much.  */
++      if (unlikely (ehdr->e_shoff >= elf->maximum_size)
++	  || unlikely (elf->maximum_size - ehdr->e_shoff < size))
++	{
++	  /* Something is wrong.  */
++	  __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++	  goto free_and_out;
++	}
++
+       ElfW2(LIBELFBITS,Shdr) *notcvt;
+ 
+       /* All the data is already mapped.  If we could use it
+Index: elfutils-0.155/libelf/elf32_newphdr.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf32_newphdr.c	2010-01-12 16:57:54.000000000 +0000
++++ elfutils-0.155/libelf/elf32_newphdr.c	2010-07-03 13:07:11.000000000 +0000
+@@ -114,6 +114,12 @@ elfw2(LIBELFBITS,newphdr) (elf, count)
+ 	   || count == PN_XNUM
+ 	   || elf->state.ELFW(elf,LIBELFBITS).phdr == NULL)
+     {
++      if (unlikely (count > SIZE_MAX / sizeof (ElfW2(LIBELFBITS,Phdr))))
++	{
++	  result = NULL;
++	  goto out;
++	}
++
+       /* Allocate a new program header with the appropriate number of
+ 	 elements.  */
+       result = (ElfW2(LIBELFBITS,Phdr) *)
+Index: elfutils-0.155/libelf/elf32_updatefile.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf32_updatefile.c	2010-01-12 16:57:54.000000000 +0000
++++ elfutils-0.155/libelf/elf32_updatefile.c	2010-07-03 13:07:11.000000000 +0000
+@@ -202,6 +202,9 @@ __elfw2(LIBELFBITS,updatemmap) (Elf *elf
+   /* Write all the sections.  Well, only those which are modified.  */
+   if (shnum > 0)
+     {
++      if (unlikely (shnum > SIZE_MAX / sizeof (Elf_Scn *)))
++ 	return 1;
++
+       Elf_ScnList *list = &elf->state.ELFW(elf,LIBELFBITS).scns;
+       Elf_Scn **scns = (Elf_Scn **) alloca (shnum * sizeof (Elf_Scn *));
+       char *const shdr_start = ((char *) elf->map_address + elf->start_offset
+@@ -624,6 +627,10 @@ __elfw2(LIBELFBITS,updatefile) (Elf *elf
+   /* Write all the sections.  Well, only those which are modified.  */
+   if (shnum > 0)
+     {
++      if (unlikely (shnum > SIZE_MAX / (sizeof (Elf_Scn *)
++					+ sizeof (ElfW2(LIBELFBITS,Shdr)))))
++	return 1;
++
+       off_t shdr_offset = elf->start_offset + ehdr->e_shoff;
+ #if EV_NUM != 2
+       xfct_t shdr_fctp = __elf_xfctstom[__libelf_version - 1][EV_CURRENT - 1][ELFW(ELFCLASS, LIBELFBITS) - 1][ELF_T_SHDR];
+Index: elfutils-0.155/libelf/elf_begin.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf_begin.c	2010-04-21 14:26:40.000000000 +0000
++++ elfutils-0.155/libelf/elf_begin.c	2010-07-03 13:07:11.000000000 +0000
+@@ -144,7 +144,8 @@ get_shnum (void *map_address, unsigned c
+ 
+       if (unlikely (result == 0) && ehdr.e32->e_shoff != 0)
+ 	{
+-	  if (ehdr.e32->e_shoff + sizeof (Elf32_Shdr) > maxsize)
++	  if (unlikely (ehdr.e32->e_shoff >= maxsize)
++	      || unlikely (maxsize - ehdr.e32->e_shoff < sizeof (Elf32_Shdr)))
+ 	    /* Cannot read the first section header.  */
+ 	    return 0;
+ 
+@@ -192,7 +193,8 @@ get_shnum (void *map_address, unsigned c
+ 
+       if (unlikely (result == 0) && ehdr.e64->e_shoff != 0)
+ 	{
+-	  if (ehdr.e64->e_shoff + sizeof (Elf64_Shdr) > maxsize)
++	  if (unlikely (ehdr.e64->e_shoff >= maxsize)
++	      || unlikely (ehdr.e64->e_shoff + sizeof (Elf64_Shdr) > maxsize))
+ 	    /* Cannot read the first section header.  */
+ 	    return 0;
+ 
+@@ -264,6 +266,15 @@ file_read_elf (int fildes, void *map_add
+     /* Could not determine the number of sections.  */
+     return NULL;
+ 
++  /* Check for too many sections.  */
++  if (e_ident[EI_CLASS] == ELFCLASS32)
++    {
++      if (scncnt > SIZE_MAX / (sizeof (Elf_Scn) + sizeof (Elf32_Shdr)))
++	return NULL;
++    }
++  else if (scncnt > SIZE_MAX / (sizeof (Elf_Scn) + sizeof (Elf64_Shdr)))
++    return NULL;
++
+   /* We can now allocate the memory.  Even if there are no section headers,
+      we allocate space for a zeroth section in case we need it later.  */
+   const size_t scnmax = (scncnt ?: (cmd == ELF_C_RDWR || cmd == ELF_C_RDWR_MMAP)
+@@ -303,6 +314,16 @@ file_read_elf (int fildes, void *map_add
+ 	{
+ 	  /* We can use the mmapped memory.  */
+ 	  elf->state.elf32.ehdr = ehdr;
++
++	  if (unlikely (ehdr->e_shoff >= maxsize)
++	      || unlikely (maxsize - ehdr->e_shoff
++			   < scncnt * sizeof (Elf32_Shdr)))
++	    {
++	    free_and_out:
++	      free (elf);
++	      __libelf_seterrno (ELF_E_INVALID_FILE);
++	      return NULL;
++	    }
+ 	  elf->state.elf32.shdr
+ 	    = (Elf32_Shdr *) ((char *) ehdr + ehdr->e_shoff);
+ 
+@@ -389,6 +410,11 @@ file_read_elf (int fildes, void *map_add
+ 	{
+ 	  /* We can use the mmapped memory.  */
+ 	  elf->state.elf64.ehdr = ehdr;
++
++	  if (unlikely (ehdr->e_shoff >= maxsize)
++	      || unlikely (ehdr->e_shoff
++			   + scncnt * sizeof (Elf32_Shdr) > maxsize))
++	    goto free_and_out;
+ 	  elf->state.elf64.shdr
+ 	    = (Elf64_Shdr *) ((char *) ehdr + ehdr->e_shoff);
+ 
+Index: elfutils-0.155/libelf/elf_getarsym.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf_getarsym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/elf_getarsym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -181,6 +181,9 @@ elf_getarsym (elf, ptr)
+       size_t index_size = atol (tmpbuf);
+ 
+       if (SARMAG + sizeof (struct ar_hdr) + index_size > elf->maximum_size
++#if SIZE_MAX <= 4294967295U
++	  || n >= SIZE_MAX / sizeof (Elf_Arsym)
++#endif
+ 	  || n * w > index_size)
+ 	{
+ 	  /* This index table cannot be right since it does not fit into
+Index: elfutils-0.155/libelf/elf_getshdrstrndx.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf_getshdrstrndx.c	2009-06-13 22:31:35.000000000 +0000
++++ elfutils-0.155/libelf/elf_getshdrstrndx.c	2010-07-03 13:07:11.000000000 +0000
+@@ -104,10 +104,25 @@ elf_getshdrstrndx (elf, dst)
+ 	      if (elf->map_address != NULL
+ 		  && elf->state.elf32.ehdr->e_ident[EI_DATA] == MY_ELFDATA
+ 		  && (ALLOW_UNALIGNED
+-		      || (((size_t) ((char *) elf->map_address + offset))
++		      || (((size_t) ((char *) elf->map_address
++			   + elf->start_offset + offset))
+ 			  & (__alignof__ (Elf32_Shdr) - 1)) == 0))
+-		/* We can directly access the memory.  */
+-		num = ((Elf32_Shdr *) (elf->map_address + offset))->sh_link;
++		{
++		  /* First see whether the information in the ELF header is
++		     valid and it does not ask for too much.  */
++		  if (unlikely (elf->maximum_size - offset
++				< sizeof (Elf32_Shdr)))
++		    {
++		      /* Something is wrong.  */
++		      __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++		      result = -1;
++		      goto out;
++		    }
++
++		  /* We can directly access the memory.  */
++		  num = ((Elf32_Shdr *) (elf->map_address + elf->start_offset
++					 + offset))->sh_link;
++		}
+ 	      else
+ 		{
+ 		  /* We avoid reading in all the section headers.  Just read
+@@ -142,10 +157,25 @@ elf_getshdrstrndx (elf, dst)
+ 	      if (elf->map_address != NULL
+ 		  && elf->state.elf64.ehdr->e_ident[EI_DATA] == MY_ELFDATA
+ 		  && (ALLOW_UNALIGNED
+-		      || (((size_t) ((char *) elf->map_address + offset))
++		      || (((size_t) ((char *) elf->map_address
++			   + elf->start_offset + offset))
+ 			  & (__alignof__ (Elf64_Shdr) - 1)) == 0))
+-		/* We can directly access the memory.  */
+-		num = ((Elf64_Shdr *) (elf->map_address + offset))->sh_link;
++		{
++		  /* First see whether the information in the ELF header is
++		     valid and it does not ask for too much.  */
++		  if (unlikely (elf->maximum_size - offset
++				< sizeof (Elf64_Shdr)))
++		    {
++		      /* Something is wrong.  */
++		      __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
++		      result = -1;
++		      goto out;
++		    }
++
++		  /* We can directly access the memory.  */
++		  num = ((Elf64_Shdr *) (elf->map_address + elf->start_offset
++					 + offset))->sh_link;
++		}
+ 	      else
+ 		{
+ 		  /* We avoid reading in all the section headers.  Just read
+Index: elfutils-0.155/libelf/elf_newscn.c
+===================================================================
+--- elfutils-0.155.orig/libelf/elf_newscn.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/elf_newscn.c	2010-07-03 13:07:11.000000000 +0000
+@@ -83,10 +83,18 @@ elf_newscn (elf)
+   else
+     {
+       /* We must allocate a new element.  */
+-      Elf_ScnList *newp;
++      Elf_ScnList *newp = NULL;
+ 
+       assert (elf->state.elf.scnincr > 0);
+ 
++      if (
++#if SIZE_MAX <= 4294967295U
++	  likely (elf->state.elf.scnincr
++		  < SIZE_MAX / 2 / sizeof (Elf_Scn) - sizeof (Elf_ScnList))
++#else
++	  1
++#endif
++	  )
+       newp = (Elf_ScnList *) calloc (sizeof (Elf_ScnList)
+ 				     + ((elf->state.elf.scnincr *= 2)
+ 					* sizeof (Elf_Scn)), 1);
+Index: elfutils-0.155/libelf/gelf_getdyn.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getdyn.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getdyn.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get information from dynamic table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -72,7 +72,7 @@ gelf_getdyn (data, ndx, dst)
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -93,7 +93,7 @@ gelf_getdyn (data, ndx, dst)
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, GElf_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.155/libelf/gelf_getlib.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getlib.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getlib.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get library from table at the given index.
+-   Copyright (C) 2004 Red Hat, Inc.
++   Copyright (C) 2004-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2004.
+ 
+@@ -65,7 +65,7 @@ gelf_getlib (data, ndx, dst)
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+   GElf_Lib *result = NULL;
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Lib) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Lib, data))
+     __libelf_seterrno (ELF_E_INVALID_INDEX);
+   else
+     {
+Index: elfutils-0.155/libelf/gelf_getmove.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getmove.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getmove.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get move structure at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -62,7 +62,7 @@ gelf_getmove (data, ndx, dst)
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Move) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Move, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+Index: elfutils-0.155/libelf/gelf_getrela.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getrela.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getrela.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get RELA relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -50,12 +50,6 @@ gelf_getrela (data, ndx, dst)
+   if (data_scn == NULL)
+     return NULL;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return NULL;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_RELA))
+     {
+       __libelf_seterrno (ELF_E_INVALID_HANDLE);
+@@ -72,7 +66,7 @@ gelf_getrela (data, ndx, dst)
+   if (scn->elf->class == ELFCLASS32)
+     {
+       /* We have to convert the data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+@@ -93,7 +87,7 @@ gelf_getrela (data, ndx, dst)
+     {
+       /* Simply copy the data after we made sure we are actually getting
+ 	 correct data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+Index: elfutils-0.155/libelf/gelf_getrel.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getrel.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getrel.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get REL relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -50,12 +50,6 @@ gelf_getrel (data, ndx, dst)
+   if (data_scn == NULL)
+     return NULL;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return NULL;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_REL))
+     {
+       __libelf_seterrno (ELF_E_INVALID_HANDLE);
+@@ -72,7 +66,7 @@ gelf_getrel (data, ndx, dst)
+   if (scn->elf->class == ELFCLASS32)
+     {
+       /* We have to convert the data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+@@ -92,7 +86,7 @@ gelf_getrel (data, ndx, dst)
+     {
+       /* Simply copy the data after we made sure we are actually getting
+ 	 correct data.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  result = NULL;
+Index: elfutils-0.155/libelf/gelf_getsym.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getsym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getsym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get symbol information from symbol table at the given index.
+-   Copyright (C) 1999, 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 1999-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 1999.
+ 
+@@ -69,7 +69,7 @@ gelf_getsym (data, ndx, dst)
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > data->d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, data))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -98,7 +98,7 @@ gelf_getsym (data, ndx, dst)
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Sym) > data->d_size))
++      if (INVALID_NDX (ndx, GElf_Sym, data))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.155/libelf/gelf_getsyminfo.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getsyminfo.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getsyminfo.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get additional symbol information from symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -63,7 +63,7 @@ gelf_getsyminfo (data, ndx, dst)
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Syminfo) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Syminfo, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+Index: elfutils-0.155/libelf/gelf_getsymshndx.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getsymshndx.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getsymshndx.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,6 +1,6 @@
+ /* Get symbol information and separate section index from symbol table
+    at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -69,7 +69,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
+      section index table.  */
+   if (likely (shndxdata_scn != NULL))
+     {
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Word) > shndxdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Word, &shndxdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -89,7 +89,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
+ 	 table entries has to be adopted.  The user better has provided
+ 	 a buffer where we can store the information.  While copying the
+ 	 data we are converting the format.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > symdata->d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, symdata))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -118,7 +118,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
+ 
+       /* The data is already in the correct form.  Just make sure the
+ 	 index is OK.  */
+-      if (unlikely ((ndx + 1) * sizeof (GElf_Sym) > symdata->d_size))
++      if (INVALID_NDX (ndx, GElf_Sym, symdata))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.155/libelf/gelf_getversym.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_getversym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_getversym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Get symbol version information at the given index.
+-   Copyright (C) 1999, 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 1999-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 1999.
+ 
+@@ -71,7 +71,7 @@ gelf_getversym (data, ndx, dst)
+ 
+   /* The data is already in the correct form.  Just make sure the
+      index is OK.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Versym) > data->d_size))
++  if (INVALID_NDX (ndx, GElf_Versym, data))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       result = NULL;
+Index: elfutils-0.155/libelf/gelf_update_dyn.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_dyn.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_dyn.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update information in dynamic table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -50,12 +50,6 @@ gelf_update_dyn (data, ndx, src)
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_DYN))
+     {
+       /* The type of the data better should match.  */
+@@ -81,7 +75,7 @@ gelf_update_dyn (data, ndx, src)
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -95,7 +89,7 @@ gelf_update_dyn (data, ndx, src)
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Dyn) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Dyn, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.155/libelf/gelf_update_lib.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_lib.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_lib.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update library in table at the given index.
+-   Copyright (C) 2004 Red Hat, Inc.
++   Copyright (C) 2004-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2004.
+ 
+@@ -47,12 +47,6 @@ gelf_update_lib (data, ndx, src)
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   Elf_Data_Scn *data_scn = (Elf_Data_Scn *) data;
+   if (unlikely (data_scn->d.d_type != ELF_T_LIB))
+     {
+@@ -66,7 +60,7 @@ gelf_update_lib (data, ndx, src)
+ 
+   /* Check whether we have to resize the data buffer.  */
+   int result = 0;
+-  if (unlikely ((ndx + 1) * sizeof (Elf64_Lib) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, Elf64_Lib, &data_scn->d))
+     __libelf_seterrno (ELF_E_INVALID_INDEX);
+   else
+     {
+Index: elfutils-0.155/libelf/gelf_update_move.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_move.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_move.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update move structure at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -54,8 +54,7 @@ gelf_update_move (data, ndx, src)
+   assert (sizeof (GElf_Move) == sizeof (Elf64_Move));
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely (ndx < 0)
+-      || unlikely ((ndx + 1) * sizeof (GElf_Move) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Move, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       return 0;
+Index: elfutils-0.155/libelf/gelf_update_rela.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_rela.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_rela.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update RELA relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -47,12 +47,6 @@ gelf_update_rela (Elf_Data *dst, int ndx
+   if (dst == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_RELA))
+     {
+       /* The type of the data better should match.  */
+@@ -80,7 +74,7 @@ gelf_update_rela (Elf_Data *dst, int ndx
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -96,7 +90,7 @@ gelf_update_rela (Elf_Data *dst, int ndx
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rela) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.155/libelf/gelf_update_rel.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_rel.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_rel.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update REL relocation information at given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -47,12 +47,6 @@ gelf_update_rel (Elf_Data *dst, int ndx,
+   if (dst == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_REL))
+     {
+       /* The type of the data better should match.  */
+@@ -78,7 +72,7 @@ gelf_update_rel (Elf_Data *dst, int ndx,
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -93,7 +87,7 @@ gelf_update_rel (Elf_Data *dst, int ndx,
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Rel) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.155/libelf/gelf_update_sym.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_sym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_sym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update symbol information in symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -51,12 +51,6 @@ gelf_update_sym (data, ndx, src)
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_SYM))
+     {
+       /* The type of the data better should match.  */
+@@ -81,7 +75,7 @@ gelf_update_sym (data, ndx, src)
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -104,7 +98,7 @@ gelf_update_sym (data, ndx, src)
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Sym) > data_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Sym, &data_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.155/libelf/gelf_update_syminfo.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_syminfo.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_syminfo.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update additional symbol information in symbol table at the given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -51,12 +51,6 @@ gelf_update_syminfo (data, ndx, src)
+   if (data == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (data_scn->d.d_type != ELF_T_SYMINFO))
+     {
+       /* The type of the data better should match.  */
+@@ -72,7 +66,7 @@ gelf_update_syminfo (data, ndx, src)
+   rwlock_wrlock (scn->elf->lock);
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely ((ndx + 1) * sizeof (GElf_Syminfo) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Syminfo, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       goto out;
+Index: elfutils-0.155/libelf/gelf_update_symshndx.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_symshndx.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_symshndx.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,6 +1,6 @@
+ /* Update symbol information and section index in symbol table at the
+    given index.
+-   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2000-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
+ 
+@@ -56,12 +56,6 @@ gelf_update_symshndx (symdata, shndxdata
+   if (symdata == NULL)
+     return 0;
+ 
+-  if (unlikely (ndx < 0))
+-    {
+-      __libelf_seterrno (ELF_E_INVALID_INDEX);
+-      return 0;
+-    }
+-
+   if (unlikely (symdata_scn->d.d_type != ELF_T_SYM))
+     {
+       /* The type of the data better should match.  */
+@@ -107,7 +101,7 @@ gelf_update_symshndx (symdata, shndxdata
+ 	}
+ 
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > symdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf32_Sym, &symdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+@@ -130,7 +124,7 @@ gelf_update_symshndx (symdata, shndxdata
+   else
+     {
+       /* Check whether we have to resize the data buffer.  */
+-      if (unlikely ((ndx + 1) * sizeof (Elf64_Sym) > symdata_scn->d.d_size))
++      if (INVALID_NDX (ndx, Elf64_Sym, &symdata_scn->d))
+ 	{
+ 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
+ 	  goto out;
+Index: elfutils-0.155/libelf/gelf_update_versym.c
+===================================================================
+--- elfutils-0.155.orig/libelf/gelf_update_versym.c	2009-01-08 20:56:37.000000000 +0000
++++ elfutils-0.155/libelf/gelf_update_versym.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1,5 +1,5 @@
+ /* Update symbol version information.
+-   Copyright (C) 2001, 2002 Red Hat, Inc.
++   Copyright (C) 2001-2009 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2001.
+ 
+@@ -54,8 +54,7 @@ gelf_update_versym (data, ndx, src)
+   assert (sizeof (GElf_Versym) == sizeof (Elf64_Versym));
+ 
+   /* Check whether we have to resize the data buffer.  */
+-  if (unlikely (ndx < 0)
+-      || unlikely ((ndx + 1) * sizeof (GElf_Versym) > data_scn->d.d_size))
++  if (INVALID_NDX (ndx, GElf_Versym, &data_scn->d))
+     {
+       __libelf_seterrno (ELF_E_INVALID_INDEX);
+       return 0;
+Index: elfutils-0.155/libelf/libelfP.h
+===================================================================
+--- elfutils-0.155.orig/libelf/libelfP.h	2010-01-12 16:57:54.000000000 +0000
++++ elfutils-0.155/libelf/libelfP.h	2010-07-03 13:07:11.000000000 +0000
+@@ -608,4 +608,8 @@
+ /* Align offset to 4 bytes as needed for note name and descriptor data.  */
+ #define NOTE_ALIGN(n)	(((n) + 3) & -4U)
+ 
++/* Convenience macro.  */
++#define INVALID_NDX(ndx, type, data) \
++  unlikely ((data)->d_size / sizeof (type) <= (unsigned int) (ndx))
++
+ #endif  /* libelfP.h */
+Index: elfutils-0.155/src/ChangeLog
+===================================================================
+--- elfutils-0.155.orig/src/ChangeLog	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.155/src/ChangeLog	2010-07-03 13:07:11.000000000 +0000
+@@ -344,6 +344,12 @@
+ 
+ 	* readelf.c (dwarf_attr_string): Grok DW_AT_GNU_odr_signature.
+ 
++2011-03-23  Petr Machata  <pmachata@redhat.com>
++
++	* readelf.c (handle_dynamic, handle_relocs_rel)
++	(handle_relocs_rela, handle_versym, print_liblist):
++	Use gelf_fsize instead of relying on shdr->sh_entsize.
++
+ 2011-02-11  Roland McGrath  <roland@redhat.com>
+ 
+ 	* elfcmp.c (verbose): New variable.
+@@ -2056,6 +2062,16 @@
+ 	object symbols or symbols with unknown type.
+ 	(check_rel): Likewise.
+ 
++2005-06-09  Roland McGrath  <roland@redhat.com>
++
++	* readelf.c (handle_dynamic, handle_symtab): Check for bogus sh_link.
++	(handle_verneed, handle_verdef, handle_versym, handle_hash): Likewise.
++	(handle_scngrp): Check for bogus sh_info.
++
++	* strip.c (handle_elf): Check for bogus values in sh_link, sh_info,
++	st_shndx, e_shstrndx, and SHT_GROUP or SHT_SYMTAB_SHNDX data.
++	Don't use assert on input values, instead bail with "illformed" error.
++
+ 2005-06-08  Roland McGrath  <roland@redhat.com>
+ 
+ 	* readelf.c (print_ops): Add consts.
+@@ -2101,6 +2117,19 @@
+ 
+ 	* readelf.c (dwarf_tag_string): Add new tags.
+ 
++2005-05-17  Jakub Jelinek  <jakub@redhat.com>
++
++	* elflint.c (check_hash): Don't check entries beyond end of section.
++	(check_note): Don't crash if gelf_rawchunk fails.
++	(section_name): Return <invalid> if gelf_getshdr returns NULL.
++
++2005-05-14  Jakub Jelinek  <jakub@redhat.com>
++
++	* elflint.c (section_name): Return "<invalid>" instead of
++	crashing on invalid section name.
++	(check_symtab, is_rel_dyn, check_rela, check_rel, check_dynamic,
++	check_symtab_shndx, check_hash, check_versym): Robustify.
++
+ 2005-05-08  Roland McGrath  <roland@redhat.com>
+ 
+ 	* strip.c (handle_elf): Don't translate hash and versym data formats,
+Index: elfutils-0.155/src/elflint.c
+===================================================================
+--- elfutils-0.155.orig/src/elflint.c	2010-04-13 20:08:02.000000000 +0000
++++ elfutils-0.155/src/elflint.c	2010-07-03 13:07:11.000000000 +0000
+@@ -123,6 +123,10 @@ static uint32_t shstrndx;
+ /* Array to count references in section groups.  */
+ static int *scnref;
+ 
++/* Numbers of sections and program headers.  */
++static unsigned int shnum;
++static unsigned int phnum;
++
+ 
+ int
+ main (int argc, char *argv[])
+@@ -311,10 +315,19 @@ section_name (Ebl *ebl, int idx)
+ {
+   GElf_Shdr shdr_mem;
+   GElf_Shdr *shdr;
++  const char *ret;
++
++  if ((unsigned int) idx > shnum)
++    return "<invalid>";
+ 
+   shdr = gelf_getshdr (elf_getscn (ebl->elf, idx), &shdr_mem);
++  if (shdr == NULL)
++    return "<invalid>";
+ 
+-  return elf_strptr (ebl->elf, shstrndx, shdr->sh_name);
++  ret = elf_strptr (ebl->elf, shstrndx, shdr->sh_name);
++  if (ret == NULL)
++    return "<invalid>";
++  return ret;
+ }
+ 
+ 
+@@ -337,11 +350,6 @@ static const int valid_e_machine[] =
+   (sizeof (valid_e_machine) / sizeof (valid_e_machine[0]))
+ 
+ 
+-/* Numbers of sections and program headers.  */
+-static unsigned int shnum;
+-static unsigned int phnum;
+-
+-
+ static void
+ check_elf_header (Ebl *ebl, GElf_Ehdr *ehdr, size_t size)
+ {
+@@ -625,7 +633,8 @@ section [%2d] '%s': symbol table cannot
+ 	  }
+       }
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_SYM, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_SYM, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext ("\
+ section [%2u] '%s': entry size is does not match ElfXX_Sym\n"),
+ 	   idx, section_name (ebl, idx));
+@@ -663,7 +672,7 @@ section [%2d] '%s': XINDEX for zeroth en
+ 	       xndxscnidx, section_name (ebl, xndxscnidx));
+     }
+ 
+-  for (size_t cnt = 1; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (size_t cnt = 1; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       sym = gelf_getsymshndx (data, xndxdata, cnt, &sym_mem, &xndx);
+       if (sym == NULL)
+@@ -683,7 +692,8 @@ section [%2d] '%s': symbol %zu: invalid
+       else
+ 	{
+ 	  name = elf_strptr (ebl->elf, shdr->sh_link, sym->st_name);
+-	  assert (name != NULL);
++	  assert (name != NULL
++		  || strshdr->sh_type != SHT_STRTAB);
+ 	}
+ 
+       if (sym->st_shndx == SHN_XINDEX)
+@@ -1032,9 +1042,11 @@ is_rel_dyn (Ebl *ebl, const GElf_Ehdr *e
+     {
+       GElf_Shdr rcshdr_mem;
+       const GElf_Shdr *rcshdr = gelf_getshdr (scn, &rcshdr_mem);
+-      assert (rcshdr != NULL);
+ 
+-      if (rcshdr->sh_type == SHT_DYNAMIC)
++      if (rcshdr == NULL)
++	break;
++
++      if (rcshdr->sh_type == SHT_DYNAMIC && rcshdr->sh_entsize)
+ 	{
+ 	  /* Found the dynamic section.  Look through it.  */
+ 	  Elf_Data *d = elf_getdata (scn, NULL);
+@@ -1044,7 +1056,9 @@ is_rel_dyn (Ebl *ebl, const GElf_Ehdr *e
+ 	    {
+ 	      GElf_Dyn dyn_mem;
+ 	      GElf_Dyn *dyn = gelf_getdyn (d, cnt, &dyn_mem);
+-	      assert (dyn != NULL);
++
++	      if (dyn == NULL)
++		break;
+ 
+ 	      if (dyn->d_tag == DT_RELCOUNT)
+ 		{
+@@ -1058,7 +1072,9 @@ section [%2d] '%s': DT_RELCOUNT used for
+ 		      /* Does the number specified number of relative
+ 			 relocations exceed the total number of
+ 			 relocations?  */
+-		      if (dyn->d_un.d_val > shdr->sh_size / shdr->sh_entsize)
++		      if (shdr->sh_entsize != 0
++			  && dyn->d_un.d_val > (shdr->sh_size
++						/ shdr->sh_entsize))
+ 			ERROR (gettext ("\
+ section [%2d] '%s': DT_RELCOUNT value %d too high for this section\n"),
+ 			       idx, section_name (ebl, idx),
+@@ -1218,7 +1234,8 @@ section [%2d] '%s': no relocations for m
+ 	}
+     }
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext (reltype == ELF_T_RELA ? "\
+ section [%2d] '%s': section entry size does not match ElfXX_Rela\n" : "\
+ section [%2d] '%s': section entry size does not match ElfXX_Rel\n"),
+@@ -1441,7 +1458,8 @@ check_rela (Ebl *ebl, GElf_Ehdr *ehdr, G
+   Elf_Data *symdata = elf_getdata (symscn, NULL);
+   enum load_state state = state_undecided;
+ 
+-  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
++  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Rela rela_mem;
+       GElf_Rela *rela = gelf_getrela (data, cnt, &rela_mem);
+@@ -1491,7 +1509,8 @@ check_rel (Ebl *ebl, GElf_Ehdr *ehdr, GE
+   Elf_Data *symdata = elf_getdata (symscn, NULL);
+   enum load_state state = state_undecided;
+ 
+-  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
++  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Rel rel_mem;
+       GElf_Rel *rel = gelf_getrel (data, cnt, &rel_mem);
+@@ -1590,7 +1609,8 @@ section [%2d] '%s': referenced as string
+ 	   shdr->sh_link, section_name (ebl, shdr->sh_link),
+ 	   idx, section_name (ebl, idx));
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext ("\
+ section [%2d] '%s': section entry size does not match ElfXX_Dyn\n"),
+ 	   idx, section_name (ebl, idx));
+@@ -1600,7 +1620,7 @@ section [%2d] '%s': section entry size d
+ 	   idx, section_name (ebl, idx));
+ 
+   bool non_null_warned = false;
+-  for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Dyn dyn_mem;
+       GElf_Dyn *dyn = gelf_getdyn (data, cnt, &dyn_mem);
+@@ -1872,6 +1892,8 @@ section [%2d] '%s': entry size does not
+ 	   idx, section_name (ebl, idx));
+ 
+   if (symshdr != NULL
++      && shdr->sh_entsize
++      && symshdr->sh_entsize
+       && (shdr->sh_size / shdr->sh_entsize
+ 	  < symshdr->sh_size / symshdr->sh_entsize))
+     ERROR (gettext ("\
+@@ -1898,6 +1920,12 @@ section [%2d] '%s': extended section ind
+     }
+ 
+   Elf_Data *data = elf_getdata (elf_getscn (ebl->elf, idx), NULL);
++  if (data == NULL)
++    {
++      ERROR (gettext ("section [%2d] '%s': cannot get section data\n"),
++ 	     idx, section_name (ebl, idx));
++      return;
++    }
+ 
+   if (*((Elf32_Word *) data->d_buf) != 0)
+     ERROR (gettext ("symbol 0 should have zero extended section index\n"));
+@@ -1940,7 +1968,7 @@ section [%2d] '%s': hash table section i
+ 
+   size_t maxidx = nchain;
+ 
+-  if (symshdr != NULL)
++  if (symshdr != NULL && symshdr->sh_entsize != 0)
+     {
+       size_t symsize = symshdr->sh_size / symshdr->sh_entsize;
+ 
+@@ -1951,18 +1979,28 @@ section [%2d] '%s': hash table section i
+       maxidx = symsize;
+     }
+ 
++  Elf32_Word *buf = (Elf32_Word *) data->d_buf;
++  Elf32_Word *end = (Elf32_Word *) ((char *) data->d_buf + shdr->sh_size);
+   size_t cnt;
+   for (cnt = 2; cnt < 2 + nbucket; ++cnt)
+-    if (((Elf32_Word *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash bucket reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2);
++    }
+ 
+   for (; cnt < 2 + nbucket + nchain; ++cnt)
+-    if (((Elf32_Word *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash chain reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2 - nbucket);
++    }
+ }
+ 
+ 
+@@ -1992,18 +2030,28 @@ section [%2d] '%s': hash table section i
+       maxidx = symsize;
+     }
+ 
++  Elf64_Xword *buf = (Elf64_Xword *) data->d_buf;
++  Elf64_Xword *end = (Elf64_Xword *) ((char *) data->d_buf + shdr->sh_size);
+   size_t cnt;
+   for (cnt = 2; cnt < 2 + nbucket; ++cnt)
+-    if (((Elf64_Xword *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash bucket reference %zu out of bounds\n"),
+ 	     idx, section_name (ebl, idx), cnt - 2);
++    }
+ 
+   for (; cnt < 2 + nbucket + nchain; ++cnt)
+-    if (((Elf64_Xword *) data->d_buf)[cnt] >= maxidx)
++    {
++      if (buf + cnt >= end)
++	break;
++      else if (buf[cnt] >= maxidx)
+       ERROR (gettext ("\
+ section [%2d] '%s': hash chain reference %" PRIu64 " out of bounds\n"),
+-	     idx, section_name (ebl, idx), (uint64_t) (cnt - 2 - nbucket));
++	       idx, section_name (ebl, idx), (uint64_t) cnt - 2 - nbucket);
++    }
+ }
+ 
+ 
+@@ -2028,7 +2076,7 @@ section [%2d] '%s': bitmask size not pow
+   if (shdr->sh_size < (4 + bitmask_words + nbuckets) * sizeof (Elf32_Word))
+     {
+       ERROR (gettext ("\
+-section [%2d] '%s': hash table section is too small (is %ld, expected at least%ld)\n"),
++section [%2d] '%s': hash table section is too small (is %ld, expected at least %ld)\n"),
+ 	     idx, section_name (ebl, idx), (long int) shdr->sh_size,
+ 	     (long int) ((4 + bitmask_words + nbuckets) * sizeof (Elf32_Word)));
+       return;
+@@ -2700,8 +2748,9 @@ section [%2d] '%s' refers in sh_link to
+ 
+   /* The number of elements in the version symbol table must be the
+      same as the number of symbols.  */
+-  if (shdr->sh_size / shdr->sh_entsize
+-      != symshdr->sh_size / symshdr->sh_entsize)
++  if (shdr->sh_entsize && symshdr->sh_entsize
++      && (shdr->sh_size / shdr->sh_entsize
++	  != symshdr->sh_size / symshdr->sh_entsize))
+     ERROR (gettext ("\
+ section [%2d] '%s' has different number of entries than symbol table [%2d] '%s'\n"),
+ 	   idx, section_name (ebl, idx),
+Index: elfutils-0.155/src/readelf.c
+===================================================================
+--- elfutils-0.155.orig/src/readelf.c	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.155/src/readelf.c	2010-07-03 13:07:11.000000000 +0000
+@@ -1189,6 +1189,8 @@ handle_scngrp (Ebl *ebl, Elf_Scn *scn, G
+   Elf32_Word *grpref = (Elf32_Word *) data->d_buf;
+ 
+   GElf_Sym sym_mem;
++  GElf_Sym *sym = gelf_getsym (symdata, shdr->sh_info, &sym_mem);
++
+   printf ((grpref[0] & GRP_COMDAT)
+ 	  ? ngettext ("\
+ \nCOMDAT section group [%2zu] '%s' with signature '%s' contains %zu entry:\n",
+@@ -1201,8 +1203,8 @@ handle_scngrp (Ebl *ebl, Elf_Scn *scn, G
+ 		      data->d_size / sizeof (Elf32_Word) - 1),
+ 	  elf_ndxscn (scn),
+ 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name),
+-	  elf_strptr (ebl->elf, symshdr->sh_link,
+-		      gelf_getsym (symdata, shdr->sh_info, &sym_mem)->st_name)
++	  (sym == NULL ? NULL
++	   : elf_strptr (ebl->elf, symshdr->sh_link, sym->st_name))
+ 	  ?: gettext ("<INVALID SYMBOL>"),
+ 	  data->d_size / sizeof (Elf32_Word) - 1);
+ 
+@@ -1353,10 +1355,12 @@ static void
+ handle_dynamic (Ebl *ebl, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink;
+   Elf_Data *data;
+   size_t cnt;
+   size_t shstrndx;
++  size_t sh_entsize;
+ 
+   /* Get the data of the section.  */
+   data = elf_getdata (scn, NULL);
+@@ -1368,21 +1372,26 @@ handle_dynamic (Ebl *ebl, Elf_Scn *scn,
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  sh_entsize = gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT);
++
++  glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link), &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   printf (ngettext ("\
+ \nDynamic segment contains %lu entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+ \nDynamic segment contains %lu entries:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+-		    shdr->sh_size / shdr->sh_entsize),
+-	  (unsigned long int) (shdr->sh_size / shdr->sh_entsize),
++		    shdr->sh_size / sh_entsize),
++	  (unsigned long int) (shdr->sh_size / sh_entsize),
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+   fputs_unlocked (gettext ("  Type              Value\n"), stdout);
+ 
+-  for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Dyn dynmem;
+       GElf_Dyn *dyn = gelf_getdyn (data, cnt, &dynmem);
+@@ -1531,7 +1540,8 @@ static void
+ handle_relocs_rel (Ebl *ebl, GElf_Ehdr *ehdr, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  int nentries = shdr->sh_size / shdr->sh_entsize;
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
++  int nentries = shdr->sh_size / sh_entsize;
+ 
+   /* Get the data of the section.  */
+   Elf_Data *data = elf_getdata (scn, NULL);
+@@ -1717,7 +1727,8 @@ static void
+ handle_relocs_rela (Ebl *ebl, GElf_Ehdr *ehdr, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  int nentries = shdr->sh_size / shdr->sh_entsize;
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
++  int nentries = shdr->sh_size / sh_entsize;
+ 
+   /* Get the data of the section.  */
+   Elf_Data *data = elf_getdata (scn, NULL);
+@@ -1964,6 +1975,13 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, G
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   /* Now we can compute the number of entries in the section.  */
+   unsigned int nsyms = data->d_size / (class == ELFCLASS32
+ 				       ? sizeof (Elf32_Sym)
+@@ -1974,15 +1992,12 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, G
+ 		    nsyms),
+ 	  (unsigned int) elf_ndxscn (scn),
+ 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name), nsyms);
+-  GElf_Shdr glink;
+   printf (ngettext (" %lu local symbol  String table: [%2u] '%s'\n",
+ 		    " %lu local symbols  String table: [%2u] '%s'\n",
+ 		    shdr->sh_info),
+ 	  (unsigned long int) shdr->sh_info,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   fputs_unlocked (class == ELFCLASS32
+ 		  ? gettext ("\
+@@ -2218,7 +2233,13 @@ handle_verneed (Ebl *ebl, Elf_Scn *scn,
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   printf (ngettext ("\
+ \nVersion needs section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2229,9 +2250,7 @@ handle_verneed (Ebl *ebl, Elf_Scn *scn,
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   unsigned int offset = 0;
+   for (int cnt = shdr->sh_info; --cnt >= 0; )
+@@ -2284,8 +2303,14 @@ handle_verdef (Ebl *ebl, Elf_Scn *scn, G
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("cannot get section header string table index"));
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   int class = gelf_getclass (ebl->elf);
+-  GElf_Shdr glink;
+   printf (ngettext ("\
+ \nVersion definition section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2297,9 +2322,7 @@ handle_verdef (Ebl *ebl, Elf_Scn *scn, G
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   unsigned int offset = 0;
+   for (int cnt = shdr->sh_info; --cnt >= 0; )
+@@ -2561,25 +2584,30 @@ handle_versym (Ebl *ebl, Elf_Scn *scn, G
+       filename = NULL;
+     }
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
++				   &glink_mem);
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_HALF, 1, EV_CURRENT);
++  if (glink == NULL)
++    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
++	   elf_ndxscn (scn));
++
+   /* Print the header.  */
+-  GElf_Shdr glink;
+   printf (ngettext ("\
+ \nVersion symbols section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'",
+ 		    "\
+ \nVersion symbols section [%2u] '%s' contains %d entries:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'",
+-		    shdr->sh_size / shdr->sh_entsize),
++		    shdr->sh_size / sh_entsize),
+ 	  (unsigned int) elf_ndxscn (scn),
+ 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name),
+-	  (int) (shdr->sh_size / shdr->sh_entsize),
++	  (int) (shdr->sh_size / sh_entsize),
+ 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   /* Now we can finally look at the actual contents of this section.  */
+-  for (unsigned int cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (unsigned int cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       if (cnt % 2 == 0)
+ 	printf ("\n %4d:", cnt);
+@@ -2628,7 +2656,17 @@ print_hash_info (Ebl *ebl, Elf_Scn *scn,
+   for (Elf32_Word cnt = 0; cnt < nbucket; ++cnt)
+     ++counts[lengths[cnt]];
+ 
+-  GElf_Shdr glink;
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf,
++					       shdr->sh_link),
++				   &glink_mem);
++  if (glink == NULL)
++    {
++      error (0, 0, gettext ("invalid sh_link value in section %Zu"),
++	     elf_ndxscn (scn));
++      return;
++    }
++
+   printf (ngettext ("\
+ \nHistogram for bucket list length in section [%2u] '%s' (total of %d bucket):\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
+ 		    "\
+@@ -2641,9 +2679,7 @@ print_hash_info (Ebl *ebl, Elf_Scn *scn,
+ 	  shdr->sh_addr,
+ 	  shdr->sh_offset,
+ 	  (unsigned int) shdr->sh_link,
+-	  elf_strptr (ebl->elf, shstrndx,
+-		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
+-				    &glink)->sh_name));
++	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
+ 
+   if (extrastr != NULL)
+     fputs (extrastr, stdout);
+@@ -2903,7 +2939,8 @@ print_liblist (Ebl *ebl)
+ 
+       if (shdr != NULL && shdr->sh_type == SHT_GNU_LIBLIST)
+ 	{
+-	  int nentries = shdr->sh_size / shdr->sh_entsize;
++	  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_LIB, 1, EV_CURRENT);
++	  int nentries = shdr->sh_size / sh_entsize;
+ 	  printf (ngettext ("\
+ \nLibrary list section [%2zu] '%s' at offset %#0" PRIx64 " contains %d entry:\n",
+ 			    "\
+@@ -4164,6 +4201,16 @@ print_debug_aranges_section (Dwfl_Module
+       return;
+     }
+ 
++  GElf_Shdr glink_mem;
++  GElf_Shdr *glink;
++  glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link), &glink_mem);
++  if (glink == NULL)
++    {
++      error (0, 0, gettext ("invalid sh_link value in section %Zu"),
++	     elf_ndxscn (scn));
++      return;
++    }
++
+   printf (ngettext ("\
+ \nDWARF section [%2zu] '%s' at offset %#" PRIx64 " contains %zu entry:\n",
+ 		    "\
+Index: elfutils-0.155/src/strip.c
+===================================================================
+--- elfutils-0.155.orig/src/strip.c	2010-07-03 13:07:10.000000000 +0000
++++ elfutils-0.155/src/strip.c	2010-07-03 13:07:11.000000000 +0000
+@@ -564,6 +564,11 @@ handle_elf (int fd, Elf *elf, const char
+       goto fail_close;
+     }
+ 
++  if (shstrndx >= shnum)
++    goto illformed;
++
++#define elf_assert(test) do { if (!(test)) goto illformed; } while (0)
++
+   /* Storage for section information.  We leave room for two more
+      entries since we unconditionally create a section header string
+      table.  Maybe some weird tool created an ELF file without one.
+@@ -585,7 +590,7 @@ handle_elf (int fd, Elf *elf, const char
+     {
+       /* This should always be true (i.e., there should not be any
+ 	 holes in the numbering).  */
+-      assert (elf_ndxscn (scn) == cnt);
++      elf_assert (elf_ndxscn (scn) == cnt);
+ 
+       shdr_info[cnt].scn = scn;
+ 
+@@ -598,6 +603,7 @@ handle_elf (int fd, Elf *elf, const char
+ 					shdr_info[cnt].shdr.sh_name);
+       if (shdr_info[cnt].name == NULL)
+ 	{
++	illformed:
+ 	  error (0, 0, gettext ("illformed file '%s'"), fname);
+ 	  goto fail_close;
+ 	}
+@@ -607,6 +613,8 @@ handle_elf (int fd, Elf *elf, const char
+ 
+       /* Remember the shdr.sh_link value.  */
+       shdr_info[cnt].old_sh_link = shdr_info[cnt].shdr.sh_link;
++      if (shdr_info[cnt].old_sh_link >= shnum)
++	goto illformed;
+ 
+       /* Sections in files other than relocatable object files which
+ 	 are not loaded can be freely moved by us.  In relocatable
+@@ -619,7 +627,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	 appropriate reference.  */
+       if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB_SHNDX))
+ 	{
+-	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
++	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
+ 	  shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx = cnt;
+ 	}
+       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GROUP))
+@@ -636,7 +644,12 @@ handle_elf (int fd, Elf *elf, const char
+ 	  for (inner = 1;
+ 	       inner < shdr_info[cnt].data->d_size / sizeof (Elf32_Word);
+ 	       ++inner)
++	    {
++	      if (grpref[inner] < shnum)
+ 	    shdr_info[grpref[inner]].group_idx = cnt;
++	      else
++		goto illformed;
++	    }
+ 
+ 	  if (inner == 1 || (inner == 2 && (grpref[0] & GRP_COMDAT) == 0))
+ 	    /* If the section group contains only one element and this
+@@ -647,7 +660,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	}
+       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GNU_versym))
+ 	{
+-	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
++	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
+ 	  shdr_info[shdr_info[cnt].shdr.sh_link].version_idx = cnt;
+ 	}
+ 
+@@ -655,7 +668,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	 discarded right away.  */
+       if ((shdr_info[cnt].shdr.sh_flags & SHF_GROUP) != 0)
+ 	{
+-	  assert (shdr_info[cnt].group_idx != 0);
++	  elf_assert (shdr_info[cnt].group_idx != 0);
+ 
+ 	  if (shdr_info[shdr_info[cnt].group_idx].idx == 0)
+ 	    {
+@@ -731,10 +744,14 @@ handle_elf (int fd, Elf *elf, const char
+ 	    {
+ 	      /* If a relocation section is marked as being removed make
+ 		 sure the section it is relocating is removed, too.  */
+-	      if ((shdr_info[cnt].shdr.sh_type == SHT_REL
++	      if (shdr_info[cnt].shdr.sh_type == SHT_REL
+ 		   || shdr_info[cnt].shdr.sh_type == SHT_RELA)
+-		  && shdr_info[shdr_info[cnt].shdr.sh_info].idx != 0)
+-		shdr_info[cnt].idx = 1;
++		{
++		  if (shdr_info[cnt].shdr.sh_info >= shnum)
++		    goto illformed;
++		  else if (shdr_info[shdr_info[cnt].shdr.sh_info].idx != 0)
++		    shdr_info[cnt].idx = 1;
++		}
+ 
+ 	      /* If a group section is marked as being removed make
+ 		 sure all the sections it contains are being removed, too.  */
+@@ -778,7 +795,7 @@ handle_elf (int fd, Elf *elf, const char
+ 		  if (shdr_info[cnt].symtab_idx != 0
+ 		      && shdr_info[shdr_info[cnt].symtab_idx].data == NULL)
+ 		    {
+-		      assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
++		      elf_assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
+ 
+ 		      shdr_info[shdr_info[cnt].symtab_idx].data
+ 			= elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
+@@ -818,6 +835,9 @@ handle_elf (int fd, Elf *elf, const char
+ 		      else if (scnidx == SHN_XINDEX)
+ 			scnidx = xndx;
+ 
++		      if (scnidx >= shnum)
++			goto illformed;
++
+ 		      if (shdr_info[scnidx].idx == 0)
+ 			/* This symbol table has a real symbol in
+ 			   a discarded section.  So preserve the
+@@ -848,12 +868,16 @@ handle_elf (int fd, Elf *elf, const char
+ 		}
+ 
+ 	      /* Handle references through sh_info.  */
+-	      if (SH_INFO_LINK_P (&shdr_info[cnt].shdr)
+-		  && shdr_info[shdr_info[cnt].shdr.sh_info].idx == 0)
++	      if (SH_INFO_LINK_P (&shdr_info[cnt].shdr))
++		{
++		  if (shdr_info[cnt].shdr.sh_info >= shnum)
++		    goto illformed;
++		  else if ( shdr_info[shdr_info[cnt].shdr.sh_info].idx == 0)
+ 		{
+ 		  shdr_info[shdr_info[cnt].shdr.sh_info].idx = 1;
+ 		  changes |= shdr_info[cnt].shdr.sh_info < cnt;
+ 		}
++		}
+ 
+ 	      /* Mark the section as investigated.  */
+ 	      shdr_info[cnt].idx = 2;
+@@ -994,7 +1018,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	  error (EXIT_FAILURE, 0, gettext ("while generating output file: %s"),
+ 		 elf_errmsg (-1));
+ 
+-	assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
++	elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
+ 
+ 	/* Add this name to the section header string table.  */
+ 	shdr_info[cnt].se = ebl_strtabadd (shst, shdr_info[cnt].name, 0);
+@@ -1031,7 +1055,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	error (EXIT_FAILURE, 0,
+ 	       gettext ("while create section header section: %s"),
+ 	       elf_errmsg (-1));
+-      assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
++      elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
+ 
+       shdr_info[cnt].data = elf_newdata (shdr_info[cnt].newscn);
+       if (shdr_info[cnt].data == NULL)
+@@ -1087,7 +1111,7 @@ handle_elf (int fd, Elf *elf, const char
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("while create section header section: %s"),
+ 	   elf_errmsg (-1));
+-  assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
++  elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
+ 
+   /* Finalize the string table and fill in the correct indices in the
+      section headers.  */
+@@ -1177,20 +1201,20 @@ handle_elf (int fd, Elf *elf, const char
+ 		    shndxdata = elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
+ 					     NULL);
+ 
+-		    assert ((versiondata->d_size / sizeof (Elf32_Word))
++		    elf_assert ((versiondata->d_size / sizeof (Elf32_Word))
+ 			    >= shdr_info[cnt].data->d_size / elsize);
+ 		  }
+ 
+ 		if (shdr_info[cnt].version_idx != 0)
+ 		  {
+-		    assert (shdr_info[cnt].shdr.sh_type == SHT_DYNSYM);
++		    elf_assert (shdr_info[cnt].shdr.sh_type == SHT_DYNSYM);
+ 		    /* This section has associated version
+ 		       information.  We have to modify that
+ 		       information, too.  */
+ 		    versiondata = elf_getdata (shdr_info[shdr_info[cnt].version_idx].scn,
+ 					       NULL);
+ 
+-		    assert ((versiondata->d_size / sizeof (GElf_Versym))
++		    elf_assert ((versiondata->d_size / sizeof (GElf_Versym))
+ 			    >= shdr_info[cnt].data->d_size / elsize);
+ 		  }
+ 
+@@ -1245,7 +1269,7 @@ handle_elf (int fd, Elf *elf, const char
+ 		      sec = shdr_info[sym->st_shndx].idx;
+ 		    else
+ 		      {
+-			assert (shndxdata != NULL);
++			elf_assert (shndxdata != NULL);
+ 
+ 			sec = shdr_info[xshndx].idx;
+ 		      }
+@@ -1266,7 +1290,7 @@ handle_elf (int fd, Elf *elf, const char
+ 			    nxshndx = sec;
+ 			  }
+ 
+-			assert (sec < SHN_LORESERVE || shndxdata != NULL);
++			elf_assert (sec < SHN_LORESERVE || shndxdata != NULL);
+ 
+ 			if ((inner != destidx || nshndx != sym->st_shndx
+ 			     || (shndxdata != NULL && nxshndx != xshndx))
+@@ -1293,9 +1317,11 @@ handle_elf (int fd, Elf *elf, const char
+ 		      {
+ 			size_t sidx = (sym->st_shndx != SHN_XINDEX
+ 					? sym->st_shndx : xshndx);
+-			assert (GELF_ST_TYPE (sym->st_info) == STT_SECTION
+-				|| (shdr_info[sidx].shdr.sh_type == SHT_GROUP
+-				    && shdr_info[sidx].shdr.sh_info == inner));
++			elf_assert (GELF_ST_TYPE (sym->st_info) == STT_SECTION
++				    || ((shdr_info[sidx].shdr.sh_type
++					 == SHT_GROUP)
++					&& (shdr_info[sidx].shdr.sh_info
++					    == inner)));
+ 		      }
+ 		  }
+ 
+@@ -1483,11 +1509,11 @@ handle_elf (int fd, Elf *elf, const char
+ 		  {
+ 		    GElf_Sym sym_mem;
+ 		    GElf_Sym *sym = gelf_getsym (symd, inner, &sym_mem);
+-		    assert (sym != NULL);
++		    elf_assert (sym != NULL);
+ 
+ 		    const char *name = elf_strptr (elf, strshndx,
+ 						   sym->st_name);
+-		    assert (name != NULL);
++		    elf_assert (name != NULL);
+ 		    size_t hidx = elf_hash (name) % nbucket;
+ 
+ 		    if (bucket[hidx] == 0)
+@@ -1506,8 +1532,8 @@ handle_elf (int fd, Elf *elf, const char
+ 	    else
+ 	      {
+ 		/* Alpha and S390 64-bit use 64-bit SHT_HASH entries.  */
+-		assert (shdr_info[cnt].shdr.sh_entsize
+-			== sizeof (Elf64_Xword));
++		elf_assert (shdr_info[cnt].shdr.sh_entsize
++                            == sizeof (Elf64_Xword));
+ 
+ 		Elf64_Xword *bucket = (Elf64_Xword *) hashd->d_buf;
+ 
+@@ -1537,11 +1563,11 @@ handle_elf (int fd, Elf *elf, const char
+ 		  {
+ 		    GElf_Sym sym_mem;
+ 		    GElf_Sym *sym = gelf_getsym (symd, inner, &sym_mem);
+-		    assert (sym != NULL);
++		    elf_assert (sym != NULL);
+ 
+ 		    const char *name = elf_strptr (elf, strshndx,
+ 						   sym->st_name);
+-		    assert (name != NULL);
++		    elf_assert (name != NULL);
+ 		    size_t hidx = elf_hash (name) % nbucket;
+ 
+ 		    if (bucket[hidx] == 0)
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/uclibc-support.patch b/meta/recipes-devtools/elfutils/elfutils-0.155/uclibc-support.patch
new file mode 100644
index 0000000..fbaf1e9
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/uclibc-support.patch
@@ -0,0 +1,91 @@
+on uclibc systems libintl and libuargp are separate from libc.
+so they need to be specified on commandline when we use proxy-libintl
+then libintl is a static archive so it should be listed last since
+elfutils does not respect disable-nls we need to link in libintl
+
+We add a new option --enable-uclibc which will be used to control
+the uclibc specific configurations during build.
+
+Signed-off-by: Khem Raj <raj.khem>
+
+Upstream-Status: Inappropriate [uclibc specific]
+
+Index: elfutils-0.155/configure.ac
+===================================================================
+--- elfutils-0.155.orig/configure.ac
++++ elfutils-0.155/configure.ac
+@@ -55,9 +55,16 @@ AS_IF([test "$use_locks" = yes], [AC_DEF
+ 
+ AH_TEMPLATE([USE_LOCKS], [Defined if libraries should be thread-safe.])
+ 
++AC_ARG_ENABLE([uclibc],
++AS_HELP_STRING([--enable-uclibc], [Use uclibc for system libraries]),
++use_uclibc=yes, use_uclibc=no)
++AM_CONDITIONAL(USE_UCLIBC, test "$use_uclibc" = yes)
++AS_IF([test "$use_uclibc" = yes], [AC_DEFINE(USE_UCLIBC)])
++
++AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
++
+ dnl Add all the languages for which translations are available.
+ ALL_LINGUAS=
+-
+ AC_PROG_CC
+ AC_PROG_RANLIB
+ AC_PROG_YACC
+Index: elfutils-0.155/libelf/Makefile.am
+===================================================================
+--- elfutils-0.155.orig/libelf/Makefile.am
++++ elfutils-0.155/libelf/Makefile.am
+@@ -93,7 +93,12 @@ if !MUDFLAP
+ libelf_pic_a_SOURCES =
+ am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
+ 
++
+ libelf_so_LDLIBS =
++if USE_UCLIBC
++libelf_so_LDLIBS += -lintl -luargp
++endif
++
+ if USE_LOCKS
+ libelf_so_LDLIBS += -lpthread
+ endif
+Index: elfutils-0.155/libdw/Makefile.am
+===================================================================
+--- elfutils-0.155.orig/libdw/Makefile.am
++++ elfutils-0.155/libdw/Makefile.am
+@@ -98,6 +98,11 @@ if !MUDFLAP
+ libdw_pic_a_SOURCES =
+ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
+ 
++libdw_so_LDLIBS =
++if USE_UCLIBC
++libdw_so_LDLIBS += -lintl -luargp
++endif
++
+ libdw_so_SOURCES =
+ libdw.so: $(srcdir)/libdw.map libdw_pic.a \
+ 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
+@@ -108,7 +113,7 @@ libdw.so: $(srcdir)/libdw.map libdw_pic.
+ 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
+ 		-Wl,--version-script,$<,--no-undefined \
+ 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
+-		-ldl $(zip_LIBS)
++		-ldl $(zip_LIBS) $(libdw_so_LDLIBS)
+ 	if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ 	ln -fs $@ $@.$(VERSION)
+ 
+Index: elfutils-0.155/libcpu/Makefile.am
+===================================================================
+--- elfutils-0.155.orig/libcpu/Makefile.am
++++ elfutils-0.155/libcpu/Makefile.am
+@@ -63,6 +63,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i3
+ i386_lex.o: i386_parse.h
+ i386_gendis_LDADD = $(libeu) -lm $(libmudflap)
+ 
++if USE_UCLIBC
++i386_gendis_LDADD += -luargp -lintl
++endif
++
+ i386_parse.h: i386_parse.c ;
+ 
+ noinst_HEADERS = memory-access.h i386_parse.h i386_data.h
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/x86_64_dis.h b/meta/recipes-devtools/elfutils/elfutils-0.155/x86_64_dis.h
new file mode 100644
index 0000000..a0198be
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/x86_64_dis.h
@@ -0,0 +1,1632 @@
+#define MNEMONIC_BITS 10
+#define SUFFIX_BITS 3
+#define FCT1_BITS 7
+#define STR1_BITS 4
+#define OFF1_1_BITS 7
+#define OFF1_1_BIAS 3
+#define OFF1_2_BITS 7
+#define OFF1_2_BIAS 4
+#define OFF1_3_BITS 1
+#define OFF1_3_BIAS 7
+#define FCT2_BITS 6
+#define STR2_BITS 2
+#define OFF2_1_BITS 7
+#define OFF2_1_BIAS 5
+#define OFF2_2_BITS 7
+#define OFF2_2_BIAS 4
+#define OFF2_3_BITS 4
+#define OFF2_3_BIAS 7
+#define FCT3_BITS 4
+#define STR3_BITS 1
+#define OFF3_1_BITS 6
+#define OFF3_1_BIAS 10
+#define OFF3_2_BITS 1
+#define OFF3_2_BIAS 21
+
+#include <i386_data.h>
+
+#define suffix_none 0
+#define suffix_w 1
+#define suffix_w0 2
+#define suffix_W 3
+#define suffix_tttn 4
+#define suffix_D 7
+#define suffix_w1 5
+#define suffix_W1 6
+
+static const opfct_t op1_fct[] =
+{
+  NULL,
+  FCT_MOD$R_M,
+  FCT_Mod$R_m,
+  FCT_abs,
+  FCT_ax,
+  FCT_ax$w,
+  FCT_ccc,
+  FCT_ddd,
+  FCT_disp8,
+  FCT_ds_bx,
+  FCT_ds_si,
+  FCT_dx,
+  FCT_es_di,
+  FCT_freg,
+  FCT_imm$s,
+  FCT_imm$w,
+  FCT_imm16,
+  FCT_imm64$w,
+  FCT_imm8,
+  FCT_imms8,
+  FCT_mmxreg,
+  FCT_mod$16r_m,
+  FCT_mod$64r_m,
+  FCT_mod$8r_m,
+  FCT_mod$r_m,
+  FCT_mod$r_m$w,
+  FCT_reg,
+  FCT_reg$w,
+  FCT_reg64,
+  FCT_rel,
+  FCT_sel,
+  FCT_sreg2,
+  FCT_sreg3,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op1_str[] =
+  "%ax\0"
+  "%cl\0"
+  "%rax\0"
+  "%st\0"
+  "%xmm0\0"
+  "*";
+static const uint8_t op1_str_idx[] = {
+  0,
+  4,
+  8,
+  13,
+  17,
+  23,
+};
+static const opfct_t op2_fct[] =
+{
+  NULL,
+  FCT_MOD$R_M,
+  FCT_Mod$R_m,
+  FCT_abs,
+  FCT_absval,
+  FCT_ax$w,
+  FCT_ccc,
+  FCT_ddd,
+  FCT_ds_si,
+  FCT_dx,
+  FCT_es_di,
+  FCT_freg,
+  FCT_imm8,
+  FCT_mmxreg,
+  FCT_mod$64r_m,
+  FCT_mod$r_m,
+  FCT_mod$r_m$w,
+  FCT_oreg,
+  FCT_oreg$w,
+  FCT_reg,
+  FCT_reg$w,
+  FCT_reg64,
+  FCT_sreg3,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op2_str[] =
+  "%rcx\0"
+  "%st";
+static const uint8_t op2_str_idx[] = {
+  0,
+  5,
+};
+static const opfct_t op3_fct[] =
+{
+  NULL,
+  FCT_mmxreg,
+  FCT_mod$r_m,
+  FCT_reg,
+  FCT_string,
+  FCT_xmmreg,
+};
+static const char op3_str[] =
+  "%rdx";
+static const uint8_t op3_str_idx[] = {
+  0,
+};
+static const struct instr_enc instrtab[] =
+{
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_adc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_add, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsubpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsubps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_and, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movslq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bsf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bswap, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 26, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bt, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_btr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bts, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_bts, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_call, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_call, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 22, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lcall, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 22, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cli, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_syscall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clts, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysenter, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sysexit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmov, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmps, .rep = 0, .repe = 1, .suffix = 1, .modrm = 0, .fct1 = 12, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 8, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpxchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 15, .off1_2 = 11, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 8, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cpuid, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtdq2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttpd2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_dec, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_div, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_emms, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_enter, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 12, .str2 = 0, .off2_1 = 19, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fchs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fabs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ftst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxam, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldl2t, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldl2e, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldpi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldlg2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldln2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldz, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_f2xm1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fyl2x, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fptan, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fpatan, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxtract, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fprem1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdecstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fincstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fprem, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fyl2xp1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsqrt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsincos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_frndint, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fscale, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsin, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fadd, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmul, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsub, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubr, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fst, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstp, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldenv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldcw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstenv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstcw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_faddp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fiadd, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmove, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fmulp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fimul, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisub, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fsubrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisubr, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 1, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fbld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fbstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fchs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fclex, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_finit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fwait, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnclex, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmove, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovne, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovnu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcom, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcom, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomp, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcompp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomip, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcos, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdecstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdiv, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidiv, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 2, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivr, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivrl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fidivr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fdivrp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 4, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 11, .str2 = 0, .off2_1 = 8, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ffree, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovbe, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ficom, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fcmovu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ficomp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fild, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fildl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fildll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fincstp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fninit, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fist, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fistp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fistpll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisttp, .rep = 0, .repe = 0, .suffix = 5, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fisttpll, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fstpt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fld, .rep = 0, .repe = 0, .suffix = 7, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucom, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_frstor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fucomp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 13, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnsave, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fnstsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hlt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_idiv, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_imul, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 14, .str1 = 0, .off1_1 = 13, .off1_2 = 2, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_in, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_in, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 11, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_inc, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ins, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 11, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_int, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_int3, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_invd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_swapgs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_invlpg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_iret, .rep = 0, .repe = 0, .suffix = 6, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_j, .rep = 0, .repe = 0, .suffix = 4, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_j, .rep = 0, .repe = 0, .suffix = 4, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_set, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 29, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_jmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 22, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ljmp, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 30, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 4, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ljmp, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 22, .str1 = 6, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lahf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lar, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lea, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_leave, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lfs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lgs, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lgdt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lidt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lmsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lock, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lods, .rep = 1, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loope, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_loopne, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 8, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lsl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ltr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 17, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 18, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 3, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 35, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 37, .off1_2 = 3, .off1_3 = 0, .fct2 = 3, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 6, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 6, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 7, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 7, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mov, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 22, .str2 = 0, .off2_1 = 5, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movs, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsbl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movswl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movzbl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movzwl, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mul, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_neg, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pause, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popcnt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_not, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_or, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_out, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 12, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_out, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 9, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_outs, .rep = 1, .repe = 0, .suffix = 1, .modrm = 0, .fct1 = 10, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 9, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 3, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_popf, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 10, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pushq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 28, .str1 = 0, .off1_1 = 2, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 14, .str1 = 0, .off1_1 = 5, .off1_2 = 2, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 31, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_push, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 32, .str1 = 0, .off1_1 = 7, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pushf, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdmsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdpmc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rdtsc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ret, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ret, .rep = 0, .repe = 0, .suffix = 3, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lret, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 16, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rol, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ror, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sahf, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sar, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sbb, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_scas, .rep = 0, .repe = 1, .suffix = 0, .modrm = 0, .fct1 = 12, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 3, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_set, .rep = 0, .repe = 0, .suffix = 4, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shl, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shr, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_shrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_shrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 2, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 2, .str3 = 0, .off3_1 = 6, .off3_2 = 0, },
+  { .mnemonic = MNE_vmcall, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmlaunch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmresume, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmxoff, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmread, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 28, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 14, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmwrite, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 22, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 21, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sgdt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_monitor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 3, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 1, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 4, .str3 = 1, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mwait, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 33, .str1 = 3, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 23, .str2 = 1, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sidt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sldt, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_smsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stc, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_std, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sti, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stos, .rep = 1, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 5, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 10, .str2 = 0, .off2_1 = 3, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_str, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sub, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_test, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ud2a, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_verr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_verw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 21, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_wbinvd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetch, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetchw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 23, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetchnta, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht0, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht1, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_prefetcht2, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_nop, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_wrmsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xadd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 15, .off1_2 = 11, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 8, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xchg, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 4, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 17, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xlat, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 9, .str1 = 0, .off1_1 = 5, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 27, .str1 = 0, .off1_1 = 7, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 25, .str1 = 0, .off1_1 = 5, .off1_2 = 9, .off1_3 = 0, .fct2 = 20, .str2 = 0, .off2_1 = 5, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 15, .str1 = 0, .off1_1 = 5, .off1_2 = 3, .off1_3 = 0, .fct2 = 5, .str2 = 0, .off2_1 = 11, .off2_2 = 3, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 15, .str1 = 0, .off1_1 = 13, .off1_2 = 3, .off1_3 = 0, .fct2 = 16, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xor, .rep = 0, .repe = 0, .suffix = 1, .modrm = 1, .fct1 = 19, .str1 = 0, .off1_1 = 13, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 3, .off2_2 = 9, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_emms, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pand, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pand, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pandn, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pandn, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_por, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_por, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pxor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pxor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpeqps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpltps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpleps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpunordps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpneqps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnltps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnleps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpordps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpeqss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpltss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpless, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpunordss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpneqss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnltss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpnless, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cmpordss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxrstor, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_fxsave, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ldmxcsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_stmxcsr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movupd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movups, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movupd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movups, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movddup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movsldup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpcklpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpcklps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpckhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_unpckhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movshdup, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movlhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movhps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movapd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movaps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movapd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movaps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsi2sd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsi2ss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpi2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpi2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttsd2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttss2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttpd2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttps2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsd2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtss2si, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2pi, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ucomisd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ucomiss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_comisd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_comiss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_getsec, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movmskpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movmskps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sqrtps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsqrtss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rsqrtps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcpss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_rcpps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_andnps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_orpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_orps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xorpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_xorps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_addps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mulps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtsd2ss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtss2sd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtpd2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2pd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtps2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvttps2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_cvtdq2ps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_subps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_minps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_divps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maxps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packsswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packsswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packuswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packuswb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packssdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_packssdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpcklqdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_punpckhqdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshuflw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_haddpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_haddps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hsubpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_hsubps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movnti, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 26, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_pextrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_pextrw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 3, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_shufpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_shufps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 8, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmullw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmullw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movdq2q, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movq2dq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 20, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovmskb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovmskb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 20, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 19, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddusw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxub, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pavgw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 34, .str1 = 0, .off1_1 = 23, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_movntq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 20, .str1 = 0, .off1_1 = 15, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 11, .off2_2 = 17, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lddqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuludq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuludq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maskmovdqu, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 34, .str1 = 0, .off1_1 = 26, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_maskmovq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 20, .str1 = 0, .off1_1 = 18, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psubq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_paddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pshufb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phaddsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaddubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phsubsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psignd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhrsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulhrsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pabsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 21, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_palignr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_palignr, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 1, .str2 = 0, .off2_1 = 19, .off2_2 = 25, .off2_3 = 0, .fct3 = 1, .str3 = 0, .off3_1 = 16, .off3_2 = 0, },
+  { .mnemonic = MNE_vmclear, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmxon, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 21, .off1_2 = 25, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmptrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_vmptrst, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psraw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrad, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrlq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psrldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_psllq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 21, .off1_2 = 0, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 16, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pslldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 18, .str1 = 0, .off1_1 = 29, .off1_2 = 0, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 24, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_lfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_sfence, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 0, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_clflush, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 24, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_INVALID, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 1, .str1 = 0, .off1_1 = 13, .off1_2 = 17, .off1_3 = 0, .fct2 = 13, .str2 = 0, .off2_1 = 13, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_blendps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendvps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_blendvpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_dpps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_dppd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_insertps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_movntdqa, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_mpsadbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_packusdw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pblendvb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 33, .str1 = 5, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pblendw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpeqq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpestri, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpestrm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpistri, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpistrm, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pcmpgtq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_phminposuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pinsrd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 15, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxud, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmaxuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsb, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminud, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pminuw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxbq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxwq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovsxdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbw, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxbq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxwd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxwq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmovzxdq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmuldq, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_pmulld, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_ptest, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 2, .str1 = 0, .off1_1 = 29, .off1_2 = 33, .off1_3 = 0, .fct2 = 24, .str2 = 0, .off2_1 = 29, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+  { .mnemonic = MNE_roundps, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundpd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundss, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_roundsd, .rep = 0, .repe = 0, .suffix = 0, .modrm = 1, .fct1 = 18, .str1 = 0, .off1_1 = 37, .off1_2 = 0, .off1_3 = 0, .fct2 = 2, .str2 = 0, .off2_1 = 27, .off2_2 = 33, .off2_3 = 0, .fct3 = 5, .str3 = 0, .off3_1 = 24, .off3_2 = 0, },
+  { .mnemonic = MNE_pop, .rep = 0, .repe = 0, .suffix = 0, .modrm = 0, .fct1 = 31, .str1 = 0, .off1_1 = 0, .off1_2 = 0, .off1_3 = 0, .fct2 = 0, .str2 = 0, .off2_1 = 0, .off2_2 = 0, .off2_3 = 0, .fct3 = 0, .str3 = 0, .off3_1 = 0, .off3_2 = 0, },
+};
+static const uint8_t match_data[] =
+{
+  0x1, 0xfe, 0x14,
+  0x2, 0xfe, 0x80, 0x38, 0x10,
+  0x2, 0xfe, 0x82, 0x38, 0x10,
+  0x2, 0xfe, 0x10, 0, 0,
+  0x2, 0xfe, 0x12, 0, 0,
+  0x1, 0xfe, 0x4,
+  0x2, 0xfe, 0x80, 0x38, 0,
+  0x12, 0x83, 0x38, 0,
+  0x2, 0xfe, 0, 0, 0,
+  0x2, 0xfe, 0x2, 0, 0,
+  0x34, 0x66, 0xf, 0xd0, 0, 0,
+  0x34, 0xf2, 0xf, 0xd0, 0, 0,
+  0x1, 0xfe, 0x24,
+  0x2, 0xfe, 0x80, 0x38, 0x20,
+  0x2, 0xfe, 0x82, 0x38, 0x20,
+  0x2, 0xfe, 0x20, 0, 0,
+  0x2, 0xfe, 0x22, 0, 0,
+  0x34, 0x66, 0xf, 0x54, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x34, 0x66, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x12, 0x63, 0, 0,
+  0x23, 0xf, 0xbc, 0, 0,
+  0x23, 0xf, 0xbd, 0, 0,
+  0x12, 0xf, 0xf8, 0xc8,
+  0x23, 0xf, 0xa3, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x20,
+  0x23, 0xf, 0xbb, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x38,
+  0x23, 0xf, 0xb3, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x30,
+  0x23, 0xf, 0xab, 0, 0,
+  0x23, 0xf, 0xba, 0x38, 0x28,
+  0x11, 0xe8,
+  0x12, 0xff, 0x38, 0x10,
+  0x12, 0xff, 0x38, 0x18,
+  0x11, 0x98,
+  0x11, 0x99,
+  0x11, 0xf8,
+  0x11, 0xfc,
+  0x11, 0xfa,
+  0x22, 0xf, 0x5,
+  0x22, 0xf, 0x6,
+  0x22, 0xf, 0x7,
+  0x22, 0xf, 0x34,
+  0x22, 0xf, 0x35,
+  0x11, 0xf5,
+  0x13, 0xf, 0xf0, 0x40, 0, 0,
+  0x1, 0xfe, 0x3c,
+  0x2, 0xfe, 0x80, 0x38, 0x38,
+  0x12, 0x83, 0x38, 0x38,
+  0x2, 0xfe, 0x38, 0, 0,
+  0x2, 0xfe, 0x3a, 0, 0,
+  0x34, 0xf2, 0xf, 0xc2, 0, 0,
+  0x34, 0xf3, 0xf, 0xc2, 0, 0,
+  0x34, 0x66, 0xf, 0xc2, 0, 0,
+  0x23, 0xf, 0xc2, 0, 0,
+  0x1, 0xfe, 0xa6,
+  0x13, 0xf, 0xfe, 0xb0, 0, 0,
+  0x23, 0xf, 0xc7, 0x38, 0x8,
+  0x22, 0xf, 0xa2,
+  0x34, 0xf3, 0xf, 0xe6, 0, 0,
+  0x34, 0xf2, 0xf, 0xe6, 0, 0,
+  0x34, 0x66, 0xf, 0xe6, 0, 0,
+  0x2, 0xfe, 0xfe, 0x38, 0x8,
+  0x2, 0xfe, 0xf6, 0x38, 0x30,
+  0x22, 0xf, 0x77,
+  0x11, 0xc8,
+  0x22, 0xd9, 0xd0,
+  0x22, 0xd9, 0xe0,
+  0x22, 0xd9, 0xe1,
+  0x22, 0xd9, 0xe4,
+  0x22, 0xd9, 0xe5,
+  0x22, 0xd9, 0xe8,
+  0x22, 0xd9, 0xe9,
+  0x22, 0xd9, 0xea,
+  0x22, 0xd9, 0xeb,
+  0x22, 0xd9, 0xec,
+  0x22, 0xd9, 0xed,
+  0x22, 0xd9, 0xee,
+  0x22, 0xd9, 0xf0,
+  0x22, 0xd9, 0xf1,
+  0x22, 0xd9, 0xf2,
+  0x22, 0xd9, 0xf3,
+  0x22, 0xd9, 0xf4,
+  0x22, 0xd9, 0xf5,
+  0x22, 0xd9, 0xf6,
+  0x22, 0xd9, 0xf7,
+  0x22, 0xd9, 0xf8,
+  0x22, 0xd9, 0xf9,
+  0x22, 0xd9, 0xfa,
+  0x22, 0xd9, 0xfb,
+  0x22, 0xd9, 0xfc,
+  0x22, 0xd9, 0xfd,
+  0x22, 0xd9, 0xfe,
+  0x22, 0xd9, 0xff,
+  0x12, 0xd8, 0xf8, 0xc0,
+  0x12, 0xdc, 0xf8, 0xc0,
+  0x2, 0xfb, 0xd8, 0x38, 0,
+  0x12, 0xd8, 0xf8, 0xc8,
+  0x12, 0xdc, 0xf8, 0xc8,
+  0x2, 0xfb, 0xd8, 0x38, 0x8,
+  0x12, 0xd8, 0xf8, 0xe0,
+  0x12, 0xdc, 0xf8, 0xe0,
+  0x2, 0xfb, 0xd8, 0x38, 0x20,
+  0x12, 0xd8, 0xf8, 0xe8,
+  0x12, 0xdc, 0xf8, 0xe8,
+  0x2, 0xfb, 0xd8, 0x38, 0x28,
+  0x12, 0xdd, 0xf8, 0xd0,
+  0x2, 0xfb, 0xd9, 0x38, 0x10,
+  0x12, 0xdd, 0xf8, 0xd8,
+  0x2, 0xfb, 0xd9, 0x38, 0x18,
+  0x12, 0xd9, 0x38, 0x20,
+  0x12, 0xd9, 0x38, 0x28,
+  0x12, 0xd9, 0x38, 0x30,
+  0x12, 0xd9, 0x38, 0x38,
+  0x12, 0xd9, 0xf8, 0xc8,
+  0x12, 0xde, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xc0,
+  0x2, 0xfb, 0xda, 0x38, 0,
+  0x12, 0xda, 0xf8, 0xc8,
+  0x12, 0xde, 0xf8, 0xc8,
+  0x2, 0xfb, 0xda, 0x38, 0x8,
+  0x12, 0xde, 0xf8, 0xe0,
+  0x2, 0xfb, 0xda, 0x38, 0x20,
+  0x12, 0xde, 0xf8, 0xe8,
+  0x2, 0xfb, 0xda, 0x38, 0x28,
+  0x22, 0xdf, 0xe0,
+  0x12, 0xdf, 0x38, 0x20,
+  0x12, 0xdf, 0xf8, 0xf0,
+  0x12, 0xdf, 0x38, 0x30,
+  0x22, 0xd9, 0xe0,
+  0x33, 0x9b, 0xdb, 0xe2,
+  0x33, 0x9b, 0xdb, 0xe3,
+  0x11, 0x9b,
+  0x22, 0xdb, 0xe2,
+  0x12, 0xda, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xc8,
+  0x12, 0xda, 0xf8, 0xd0,
+  0x12, 0xda, 0xf8, 0xd8,
+  0x12, 0xdb, 0xf8, 0xc0,
+  0x12, 0xdb, 0xf8, 0xc8,
+  0x12, 0xdb, 0xf8, 0xd0,
+  0x12, 0xdb, 0xf8, 0xd8,
+  0x12, 0xd8, 0xf8, 0xd0,
+  0x2, 0xfb, 0xd8, 0x38, 0x10,
+  0x12, 0xd8, 0xf8, 0xd8,
+  0x2, 0xfb, 0xd8, 0x38, 0x18,
+  0x22, 0xde, 0xd9,
+  0x12, 0xdb, 0xf8, 0xf0,
+  0x12, 0xdf, 0xf8, 0xf0,
+  0x12, 0xdb, 0xf8, 0xe8,
+  0x12, 0xdf, 0xf8, 0xe8,
+  0x22, 0xd9, 0xff,
+  0x22, 0xd9, 0xf6,
+  0x12, 0xd8, 0xf8, 0xf0,
+  0x12, 0xdc, 0xf8, 0xf0,
+  0x2, 0xfb, 0xd8, 0x38, 0x30,
+  0x12, 0xda, 0x38, 0x30,
+  0x12, 0xde, 0xf8, 0xf0,
+  0x12, 0xde, 0x38, 0x30,
+  0x12, 0xde, 0xf8, 0xf8,
+  0x12, 0xd8, 0xf8, 0xf8,
+  0x12, 0xdc, 0xf8, 0xf8,
+  0x2, 0xfb, 0xd8, 0x38, 0x38,
+  0x12, 0xda, 0x38, 0x38,
+  0x12, 0xde, 0x38, 0x38,
+  0x12, 0xde, 0xf8, 0xf0,
+  0x12, 0xdd, 0xf8, 0xc0,
+  0x12, 0xda, 0xf8, 0xd0,
+  0x2, 0xfb, 0xda, 0x38, 0x10,
+  0x12, 0xda, 0xf8, 0xd8,
+  0x2, 0xfb, 0xda, 0x38, 0x18,
+  0x12, 0xdf, 0x38, 0,
+  0x12, 0xdb, 0x38, 0,
+  0x12, 0xdf, 0x38, 0x28,
+  0x22, 0xd9, 0xf7,
+  0x22, 0xdb, 0xe3,
+  0x2, 0xfb, 0xdb, 0x38, 0x10,
+  0x2, 0xfb, 0xdb, 0x38, 0x18,
+  0x12, 0xdf, 0x38, 0x38,
+  0x2, 0xfb, 0xdb, 0x38, 0x8,
+  0x12, 0xdd, 0x38, 0x8,
+  0x12, 0xdb, 0x38, 0x28,
+  0x12, 0xdb, 0x38, 0x38,
+  0x12, 0xd9, 0xf8, 0xc0,
+  0x2, 0xfb, 0xd9, 0x38, 0,
+  0x12, 0xdd, 0xf8, 0xe0,
+  0x12, 0xdd, 0x38, 0x20,
+  0x12, 0xdd, 0xf8, 0xe8,
+  0x12, 0xdd, 0x38, 0x30,
+  0x12, 0xdd, 0x38, 0x38,
+  0x11, 0xf4,
+  0x2, 0xfe, 0xf6, 0x38, 0x38,
+  0x2, 0xfe, 0xf6, 0x38, 0x28,
+  0x23, 0xf, 0xaf, 0, 0,
+  0x2, 0xfd, 0x69, 0, 0,
+  0x1, 0xfe, 0xe4,
+  0x1, 0xfe, 0xec,
+  0x2, 0xfe, 0xfe, 0x38, 0,
+  0x1, 0xfe, 0x6c,
+  0x11, 0xcd,
+  0x11, 0xcc,
+  0x22, 0xf, 0x8,
+  0x33, 0xf, 0x1, 0xf8,
+  0x23, 0xf, 0x1, 0x38, 0x38,
+  0x11, 0xcf,
+  0x1, 0xf0, 0x70,
+  0x12, 0xf, 0xf0, 0x80,
+  0x13, 0xf, 0xf0, 0x90, 0x38, 0,
+  0x11, 0xe3,
+  0x11, 0xeb,
+  0x11, 0xe9,
+  0x12, 0xff, 0x38, 0x20,
+  0x11, 0xea,
+  0x12, 0xff, 0x38, 0x28,
+  0x11, 0x9f,
+  0x23, 0xf, 0x2, 0, 0,
+  0x12, 0x8d, 0, 0,
+  0x11, 0xc9,
+  0x23, 0xf, 0xb4, 0, 0,
+  0x23, 0xf, 0xb5, 0, 0,
+  0x23, 0xf, 0x1, 0x38, 0x10,
+  0x23, 0xf, 0x1, 0x38, 0x18,
+  0x23, 0xf, 0, 0x38, 0x10,
+  0x23, 0xf, 0x1, 0x38, 0x30,
+  0x11, 0xf0,
+  0x1, 0xfe, 0xac,
+  0x11, 0xe2,
+  0x11, 0xe1,
+  0x11, 0xe0,
+  0x23, 0xf, 0x3, 0, 0,
+  0x23, 0xf, 0xb2, 0, 0,
+  0x23, 0xf, 0, 0x38, 0x18,
+  0x2, 0xfe, 0x88, 0, 0,
+  0x2, 0xfe, 0x8a, 0, 0,
+  0x2, 0xfe, 0xc6, 0x38, 0,
+  0x1, 0xf0, 0xb0,
+  0x1, 0xfe, 0xa0,
+  0x1, 0xfe, 0xa2,
+  0x23, 0xf, 0x20, 0xc0, 0xc0,
+  0x23, 0xf, 0x22, 0xc0, 0xc0,
+  0x23, 0xf, 0x21, 0xc0, 0xc0,
+  0x23, 0xf, 0x23, 0xc0, 0xc0,
+  0x12, 0x8c, 0, 0,
+  0x12, 0x8e, 0, 0,
+  0x1, 0xfe, 0xa4,
+  0x23, 0xf, 0xbe, 0, 0,
+  0x23, 0xf, 0xbf, 0, 0,
+  0x23, 0xf, 0xb6, 0, 0,
+  0x23, 0xf, 0xb7, 0, 0,
+  0x2, 0xfe, 0xf6, 0x38, 0x20,
+  0x2, 0xfe, 0xf6, 0x38, 0x18,
+  0x22, 0xf3, 0x90,
+  0x11, 0x90,
+  0x34, 0xf3, 0xf, 0xb8, 0, 0,
+  0x2, 0xfe, 0xf6, 0x38, 0x10,
+  0x2, 0xfe, 0x8, 0, 0,
+  0x2, 0xfe, 0xa, 0, 0,
+  0x2, 0xfe, 0x80, 0x38, 0x8,
+  0x2, 0xfe, 0x82, 0x38, 0x8,
+  0x1, 0xfe, 0xc,
+  0x1, 0xfe, 0xe6,
+  0x1, 0xfe, 0xee,
+  0x1, 0xfe, 0x6e,
+  0x12, 0x8f, 0xf8, 0xc0,
+  0x12, 0x8f, 0x38, 0,
+  0x12, 0xf, 0xc7, 0x81,
+  0x11, 0x9d,
+  0x12, 0xff, 0xf8, 0xf0,
+  0x12, 0xff, 0x38, 0x30,
+  0x1, 0xf8, 0x50,
+  0x1, 0xf8, 0x58,
+  0x1, 0xfd, 0x68,
+  0x1, 0xe7, 0x6,
+  0x12, 0xf, 0xc7, 0x80,
+  0x11, 0x9c,
+  0x2, 0xfe, 0xd0, 0x38, 0x10,
+  0x2, 0xfe, 0xd2, 0x38, 0x10,
+  0x2, 0xfe, 0xc0, 0x38, 0x10,
+  0x2, 0xfe, 0xd0, 0x38, 0x18,
+  0x2, 0xfe, 0xd2, 0x38, 0x18,
+  0x2, 0xfe, 0xc0, 0x38, 0x18,
+  0x22, 0xf, 0x32,
+  0x22, 0xf, 0x33,
+  0x22, 0xf, 0x31,
+  0x11, 0xc3,
+  0x11, 0xc2,
+  0x11, 0xcb,
+  0x11, 0xca,
+  0x2, 0xfe, 0xd0, 0x38, 0,
+  0x2, 0xfe, 0xd2, 0x38, 0,
+  0x2, 0xfe, 0xc0, 0x38, 0,
+  0x2, 0xfe, 0xd0, 0x38, 0x8,
+  0x2, 0xfe, 0xd2, 0x38, 0x8,
+  0x2, 0xfe, 0xc0, 0x38, 0x8,
+  0x22, 0xf, 0xaa,
+  0x11, 0x9e,
+  0x2, 0xfe, 0xd0, 0x38, 0x38,
+  0x2, 0xfe, 0xd2, 0x38, 0x38,
+  0x2, 0xfe, 0xc0, 0x38, 0x38,
+  0x2, 0xfe, 0x18, 0, 0,
+  0x2, 0xfe, 0x1a, 0, 0,
+  0x1, 0xfe, 0x1c,
+  0x2, 0xfe, 0x80, 0x38, 0x18,
+  0x2, 0xfe, 0x82, 0x38, 0x18,
+  0x1, 0xfe, 0xae,
+  0x13, 0xf, 0xf0, 0x90, 0x38, 0,
+  0x2, 0xfe, 0xd0, 0x38, 0x20,
+  0x2, 0xfe, 0xd2, 0x38, 0x20,
+  0x2, 0xfe, 0xc0, 0x38, 0x20,
+  0x2, 0xfe, 0xd0, 0x38, 0x28,
+  0x23, 0xf, 0xa4, 0, 0,
+  0x23, 0xf, 0xa5, 0, 0,
+  0x2, 0xfe, 0xd2, 0x38, 0x28,
+  0x2, 0xfe, 0xc0, 0x38, 0x28,
+  0x23, 0xf, 0xac, 0, 0,
+  0x23, 0xf, 0xad, 0, 0,
+  0x33, 0xf, 0x1, 0xc1,
+  0x33, 0xf, 0x1, 0xc2,
+  0x33, 0xf, 0x1, 0xc3,
+  0x33, 0xf, 0x1, 0xc4,
+  0x23, 0xf, 0x78, 0, 0,
+  0x23, 0xf, 0x79, 0, 0,
+  0x23, 0xf, 0x1, 0x38, 0,
+  0x33, 0xf, 0x1, 0xc8,
+  0x33, 0xf, 0x1, 0xc9,
+  0x23, 0xf, 0x1, 0x38, 0x8,
+  0x23, 0xf, 0, 0x38, 0,
+  0x23, 0xf, 0x1, 0x38, 0x20,
+  0x11, 0xf9,
+  0x11, 0xfd,
+  0x11, 0xfb,
+  0x1, 0xfe, 0xaa,
+  0x23, 0xf, 0, 0x38, 0x8,
+  0x2, 0xfe, 0x28, 0, 0,
+  0x2, 0xfe, 0x2a, 0, 0,
+  0x1, 0xfe, 0x2c,
+  0x2, 0xfe, 0x80, 0x38, 0x28,
+  0x2, 0xfe, 0x82, 0x38, 0x28,
+  0x2, 0xfe, 0x84, 0, 0,
+  0x1, 0xfe, 0xa8,
+  0x2, 0xfe, 0xf6, 0x38, 0,
+  0x22, 0xf, 0xb,
+  0x23, 0xf, 0, 0x38, 0x20,
+  0x23, 0xf, 0, 0x38, 0x28,
+  0x22, 0xf, 0x9,
+  0x23, 0xf, 0xd, 0x38, 0,
+  0x23, 0xf, 0xd, 0x38, 0x8,
+  0x23, 0xf, 0x18, 0x38, 0,
+  0x23, 0xf, 0x18, 0x38, 0x8,
+  0x23, 0xf, 0x18, 0x38, 0x10,
+  0x23, 0xf, 0x18, 0x38, 0x18,
+  0x23, 0xf, 0x1f, 0, 0,
+  0x22, 0xf, 0x30,
+  0x13, 0xf, 0xfe, 0xc0, 0, 0,
+  0x2, 0xfe, 0x86, 0, 0,
+  0x1, 0xf8, 0x90,
+  0x11, 0xd7,
+  0x2, 0xfe, 0x30, 0, 0,
+  0x2, 0xfe, 0x32, 0, 0,
+  0x1, 0xfe, 0x34,
+  0x2, 0xfe, 0x80, 0x38, 0x30,
+  0x2, 0xfe, 0x82, 0x38, 0x30,
+  0x22, 0xf, 0x77,
+  0x34, 0x66, 0xf, 0xdb, 0, 0,
+  0x23, 0xf, 0xdb, 0, 0,
+  0x34, 0x66, 0xf, 0xdf, 0, 0,
+  0x23, 0xf, 0xdf, 0, 0,
+  0x34, 0x66, 0xf, 0xf5, 0, 0,
+  0x23, 0xf, 0xf5, 0, 0,
+  0x34, 0x66, 0xf, 0xeb, 0, 0,
+  0x23, 0xf, 0xeb, 0, 0,
+  0x34, 0x66, 0xf, 0xef, 0, 0,
+  0x23, 0xf, 0xef, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x1,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x2,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x3,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x4,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x5,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x6,
+  0x24, 0xf, 0xc2, 0, 0, 0xff, 0x7,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x1,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x2,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x3,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x4,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x5,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x6,
+  0x35, 0xf3, 0xf, 0xc2, 0, 0, 0xff, 0x7,
+  0x23, 0xf, 0xae, 0x38, 0x8,
+  0x23, 0xf, 0xae, 0x38, 0,
+  0x23, 0xf, 0xae, 0x38, 0x10,
+  0x23, 0xf, 0xae, 0x38, 0x18,
+  0x34, 0xf2, 0xf, 0x10, 0, 0,
+  0x34, 0xf3, 0xf, 0x10, 0, 0,
+  0x34, 0x66, 0xf, 0x10, 0, 0,
+  0x23, 0xf, 0x10, 0, 0,
+  0x34, 0xf2, 0xf, 0x11, 0, 0,
+  0x34, 0xf3, 0xf, 0x11, 0, 0,
+  0x34, 0x66, 0xf, 0x11, 0, 0,
+  0x23, 0xf, 0x11, 0, 0,
+  0x34, 0xf2, 0xf, 0x12, 0, 0,
+  0x34, 0xf3, 0xf, 0x12, 0, 0,
+  0x34, 0x66, 0xf, 0x12, 0, 0,
+  0x23, 0xf, 0x12, 0xc0, 0xc0,
+  0x23, 0xf, 0x12, 0, 0,
+  0x34, 0x66, 0xf, 0x13, 0xc0, 0xc0,
+  0x23, 0xf, 0x13, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x13, 0, 0,
+  0x23, 0xf, 0x13, 0, 0,
+  0x34, 0x66, 0xf, 0x14, 0, 0,
+  0x23, 0xf, 0x14, 0, 0,
+  0x34, 0x66, 0xf, 0x15, 0, 0,
+  0x23, 0xf, 0x15, 0, 0,
+  0x34, 0xf3, 0xf, 0x16, 0, 0,
+  0x34, 0x66, 0xf, 0x16, 0, 0,
+  0x23, 0xf, 0x16, 0xc0, 0xc0,
+  0x23, 0xf, 0x16, 0, 0,
+  0x34, 0x66, 0xf, 0x17, 0xc0, 0xc0,
+  0x23, 0xf, 0x17, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x17, 0, 0,
+  0x23, 0xf, 0x17, 0, 0,
+  0x34, 0x66, 0xf, 0x28, 0, 0,
+  0x23, 0xf, 0x28, 0, 0,
+  0x34, 0x66, 0xf, 0x29, 0, 0,
+  0x23, 0xf, 0x29, 0, 0,
+  0x34, 0xf2, 0xf, 0x2a, 0, 0,
+  0x34, 0xf3, 0xf, 0x2a, 0, 0,
+  0x34, 0x66, 0xf, 0x2a, 0, 0,
+  0x23, 0xf, 0x2a, 0, 0,
+  0x34, 0x66, 0xf, 0x2b, 0, 0,
+  0x23, 0xf, 0x2b, 0, 0,
+  0x34, 0xf2, 0xf, 0x2c, 0, 0,
+  0x34, 0xf3, 0xf, 0x2c, 0, 0,
+  0x34, 0x66, 0xf, 0x2c, 0, 0,
+  0x23, 0xf, 0x2c, 0, 0,
+  0x34, 0x66, 0xf, 0x2d, 0, 0,
+  0x34, 0xf2, 0xf, 0x2d, 0, 0,
+  0x34, 0xf3, 0xf, 0x2d, 0, 0,
+  0x23, 0xf, 0x2d, 0, 0,
+  0x34, 0x66, 0xf, 0x2e, 0, 0,
+  0x23, 0xf, 0x2e, 0, 0,
+  0x34, 0x66, 0xf, 0x2f, 0, 0,
+  0x23, 0xf, 0x2f, 0, 0,
+  0x22, 0xf, 0x37,
+  0x34, 0x66, 0xf, 0x50, 0xc0, 0xc0,
+  0x23, 0xf, 0x50, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0x51, 0, 0,
+  0x34, 0xf2, 0xf, 0x51, 0, 0,
+  0x34, 0xf3, 0xf, 0x51, 0, 0,
+  0x23, 0xf, 0x51, 0, 0,
+  0x34, 0xf3, 0xf, 0x52, 0, 0,
+  0x23, 0xf, 0x52, 0, 0,
+  0x34, 0xf3, 0xf, 0x53, 0, 0,
+  0x23, 0xf, 0x53, 0, 0,
+  0x34, 0x66, 0xf, 0x54, 0, 0,
+  0x23, 0xf, 0x54, 0, 0,
+  0x34, 0x66, 0xf, 0x55, 0, 0,
+  0x23, 0xf, 0x55, 0, 0,
+  0x34, 0x66, 0xf, 0x56, 0, 0,
+  0x23, 0xf, 0x56, 0, 0,
+  0x34, 0x66, 0xf, 0x57, 0, 0,
+  0x23, 0xf, 0x57, 0, 0,
+  0x34, 0xf2, 0xf, 0x58, 0, 0,
+  0x34, 0xf3, 0xf, 0x58, 0, 0,
+  0x34, 0x66, 0xf, 0x58, 0, 0,
+  0x23, 0xf, 0x58, 0, 0,
+  0x34, 0xf2, 0xf, 0x59, 0, 0,
+  0x34, 0xf3, 0xf, 0x59, 0, 0,
+  0x34, 0x66, 0xf, 0x59, 0, 0,
+  0x23, 0xf, 0x59, 0, 0,
+  0x34, 0xf2, 0xf, 0x5a, 0, 0,
+  0x34, 0xf3, 0xf, 0x5a, 0, 0,
+  0x34, 0x66, 0xf, 0x5a, 0, 0,
+  0x23, 0xf, 0x5a, 0, 0,
+  0x34, 0x66, 0xf, 0x5b, 0, 0,
+  0x34, 0xf3, 0xf, 0x5b, 0, 0,
+  0x23, 0xf, 0x5b, 0, 0,
+  0x34, 0xf2, 0xf, 0x5c, 0, 0,
+  0x34, 0xf3, 0xf, 0x5c, 0, 0,
+  0x34, 0x66, 0xf, 0x5c, 0, 0,
+  0x23, 0xf, 0x5c, 0, 0,
+  0x34, 0xf2, 0xf, 0x5d, 0, 0,
+  0x34, 0xf3, 0xf, 0x5d, 0, 0,
+  0x34, 0x66, 0xf, 0x5d, 0, 0,
+  0x23, 0xf, 0x5d, 0, 0,
+  0x34, 0xf2, 0xf, 0x5e, 0, 0,
+  0x34, 0xf3, 0xf, 0x5e, 0, 0,
+  0x34, 0x66, 0xf, 0x5e, 0, 0,
+  0x23, 0xf, 0x5e, 0, 0,
+  0x34, 0xf2, 0xf, 0x5f, 0, 0,
+  0x34, 0xf3, 0xf, 0x5f, 0, 0,
+  0x34, 0x66, 0xf, 0x5f, 0, 0,
+  0x23, 0xf, 0x5f, 0, 0,
+  0x34, 0x66, 0xf, 0x60, 0, 0,
+  0x23, 0xf, 0x60, 0, 0,
+  0x34, 0x66, 0xf, 0x61, 0, 0,
+  0x23, 0xf, 0x61, 0, 0,
+  0x34, 0x66, 0xf, 0x62, 0, 0,
+  0x23, 0xf, 0x62, 0, 0,
+  0x34, 0x66, 0xf, 0x63, 0, 0,
+  0x23, 0xf, 0x63, 0, 0,
+  0x34, 0x66, 0xf, 0x64, 0, 0,
+  0x23, 0xf, 0x64, 0, 0,
+  0x34, 0x66, 0xf, 0x65, 0, 0,
+  0x23, 0xf, 0x65, 0, 0,
+  0x34, 0x66, 0xf, 0x66, 0, 0,
+  0x23, 0xf, 0x66, 0, 0,
+  0x34, 0x66, 0xf, 0x67, 0, 0,
+  0x23, 0xf, 0x67, 0, 0,
+  0x34, 0x66, 0xf, 0x68, 0, 0,
+  0x23, 0xf, 0x68, 0, 0,
+  0x34, 0x66, 0xf, 0x69, 0, 0,
+  0x23, 0xf, 0x69, 0, 0,
+  0x34, 0x66, 0xf, 0x6a, 0, 0,
+  0x23, 0xf, 0x6a, 0, 0,
+  0x34, 0x66, 0xf, 0x6b, 0, 0,
+  0x23, 0xf, 0x6b, 0, 0,
+  0x34, 0x66, 0xf, 0x6c, 0, 0,
+  0x34, 0x66, 0xf, 0x6d, 0, 0,
+  0x34, 0x66, 0xf, 0x6e, 0, 0,
+  0x23, 0xf, 0x6e, 0, 0,
+  0x34, 0x66, 0xf, 0x6f, 0, 0,
+  0x34, 0xf3, 0xf, 0x6f, 0, 0,
+  0x23, 0xf, 0x6f, 0, 0,
+  0x34, 0x66, 0xf, 0x70, 0, 0,
+  0x34, 0xf2, 0xf, 0x70, 0, 0,
+  0x34, 0xf3, 0xf, 0x70, 0, 0,
+  0x23, 0xf, 0x70, 0, 0,
+  0x34, 0x66, 0xf, 0x74, 0, 0,
+  0x23, 0xf, 0x74, 0, 0,
+  0x34, 0x66, 0xf, 0x75, 0, 0,
+  0x23, 0xf, 0x75, 0, 0,
+  0x34, 0x66, 0xf, 0x76, 0, 0,
+  0x23, 0xf, 0x76, 0, 0,
+  0x34, 0x66, 0xf, 0x7c, 0, 0,
+  0x34, 0xf2, 0xf, 0x7c, 0, 0,
+  0x34, 0x66, 0xf, 0x7d, 0, 0,
+  0x34, 0xf2, 0xf, 0x7d, 0, 0,
+  0x34, 0x66, 0xf, 0x7e, 0, 0,
+  0x34, 0xf3, 0xf, 0x7e, 0, 0,
+  0x23, 0xf, 0x7e, 0, 0,
+  0x34, 0x66, 0xf, 0x7f, 0, 0,
+  0x34, 0xf3, 0xf, 0x7f, 0, 0,
+  0x23, 0xf, 0x7f, 0, 0,
+  0x23, 0xf, 0xc3, 0, 0,
+  0x34, 0x66, 0xf, 0xc4, 0, 0,
+  0x23, 0xf, 0xc4, 0, 0,
+  0x34, 0x66, 0xf, 0xc5, 0xc0, 0xc0,
+  0x23, 0xf, 0xc5, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xc6, 0, 0,
+  0x23, 0xf, 0xc6, 0, 0,
+  0x34, 0x66, 0xf, 0xd1, 0, 0,
+  0x23, 0xf, 0xd1, 0, 0,
+  0x34, 0x66, 0xf, 0xd2, 0, 0,
+  0x23, 0xf, 0xd2, 0, 0,
+  0x34, 0x66, 0xf, 0xd3, 0, 0,
+  0x23, 0xf, 0xd3, 0, 0,
+  0x34, 0x66, 0xf, 0xd4, 0, 0,
+  0x23, 0xf, 0xd4, 0, 0,
+  0x34, 0x66, 0xf, 0xd5, 0, 0,
+  0x23, 0xf, 0xd5, 0, 0,
+  0x34, 0x66, 0xf, 0xd6, 0, 0,
+  0x34, 0xf2, 0xf, 0xd6, 0xc0, 0xc0,
+  0x34, 0xf3, 0xf, 0xd6, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xd7, 0xc0, 0xc0,
+  0x23, 0xf, 0xd7, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xd8, 0, 0,
+  0x23, 0xf, 0xd8, 0, 0,
+  0x34, 0x66, 0xf, 0xd9, 0, 0,
+  0x23, 0xf, 0xd9, 0, 0,
+  0x34, 0x66, 0xf, 0xda, 0, 0,
+  0x23, 0xf, 0xda, 0, 0,
+  0x34, 0x66, 0xf, 0xdc, 0, 0,
+  0x23, 0xf, 0xdc, 0, 0,
+  0x34, 0x66, 0xf, 0xdd, 0, 0,
+  0x23, 0xf, 0xdd, 0, 0,
+  0x34, 0x66, 0xf, 0xde, 0, 0,
+  0x23, 0xf, 0xde, 0, 0,
+  0x34, 0x66, 0xf, 0xe0, 0, 0,
+  0x23, 0xf, 0xe0, 0, 0,
+  0x34, 0x66, 0xf, 0xe1, 0, 0,
+  0x23, 0xf, 0xe1, 0, 0,
+  0x34, 0x66, 0xf, 0xe2, 0, 0,
+  0x23, 0xf, 0xe2, 0, 0,
+  0x34, 0x66, 0xf, 0xe3, 0, 0,
+  0x23, 0xf, 0xe3, 0, 0,
+  0x34, 0x66, 0xf, 0xe4, 0, 0,
+  0x23, 0xf, 0xe4, 0, 0,
+  0x34, 0x66, 0xf, 0xe5, 0, 0,
+  0x23, 0xf, 0xe5, 0, 0,
+  0x34, 0x66, 0xf, 0xe7, 0, 0,
+  0x23, 0xf, 0xe7, 0, 0,
+  0x34, 0x66, 0xf, 0xe8, 0, 0,
+  0x23, 0xf, 0xe8, 0, 0,
+  0x34, 0x66, 0xf, 0xe9, 0, 0,
+  0x23, 0xf, 0xe9, 0, 0,
+  0x34, 0x66, 0xf, 0xea, 0, 0,
+  0x23, 0xf, 0xea, 0, 0,
+  0x34, 0x66, 0xf, 0xec, 0, 0,
+  0x23, 0xf, 0xec, 0, 0,
+  0x34, 0x66, 0xf, 0xed, 0, 0,
+  0x23, 0xf, 0xed, 0, 0,
+  0x34, 0x66, 0xf, 0xee, 0, 0,
+  0x23, 0xf, 0xee, 0, 0,
+  0x34, 0xf2, 0xf, 0xf0, 0, 0,
+  0x34, 0x66, 0xf, 0xf1, 0, 0,
+  0x23, 0xf, 0xf1, 0, 0,
+  0x34, 0x66, 0xf, 0xf2, 0, 0,
+  0x23, 0xf, 0xf2, 0, 0,
+  0x34, 0x66, 0xf, 0xf3, 0, 0,
+  0x23, 0xf, 0xf3, 0, 0,
+  0x34, 0x66, 0xf, 0xf4, 0, 0,
+  0x23, 0xf, 0xf4, 0, 0,
+  0x34, 0x66, 0xf, 0xf6, 0, 0,
+  0x23, 0xf, 0xf6, 0, 0,
+  0x34, 0x66, 0xf, 0xf7, 0xc0, 0xc0,
+  0x23, 0xf, 0xf7, 0xc0, 0xc0,
+  0x34, 0x66, 0xf, 0xf8, 0, 0,
+  0x23, 0xf, 0xf8, 0, 0,
+  0x34, 0x66, 0xf, 0xf9, 0, 0,
+  0x23, 0xf, 0xf9, 0, 0,
+  0x34, 0x66, 0xf, 0xfa, 0, 0,
+  0x23, 0xf, 0xfa, 0, 0,
+  0x34, 0x66, 0xf, 0xfb, 0, 0,
+  0x23, 0xf, 0xfb, 0, 0,
+  0x34, 0x66, 0xf, 0xfc, 0, 0,
+  0x23, 0xf, 0xfc, 0, 0,
+  0x34, 0x66, 0xf, 0xfd, 0, 0,
+  0x23, 0xf, 0xfd, 0, 0,
+  0x34, 0x66, 0xf, 0xfe, 0, 0,
+  0x23, 0xf, 0xfe, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0, 0, 0,
+  0x34, 0xf, 0x38, 0, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1, 0, 0,
+  0x34, 0xf, 0x38, 0x1, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2, 0, 0,
+  0x34, 0xf, 0x38, 0x2, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3, 0, 0,
+  0x34, 0xf, 0x38, 0x3, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x4, 0, 0,
+  0x34, 0xf, 0x38, 0x4, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x5, 0, 0,
+  0x34, 0xf, 0x38, 0x5, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x6, 0, 0,
+  0x34, 0xf, 0x38, 0x6, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x7, 0, 0,
+  0x34, 0xf, 0x38, 0x7, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x8, 0, 0,
+  0x34, 0xf, 0x38, 0x8, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x9, 0, 0,
+  0x34, 0xf, 0x38, 0x9, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0xa, 0, 0,
+  0x34, 0xf, 0x38, 0xa, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0xb, 0, 0,
+  0x34, 0xf, 0x38, 0xb, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1c, 0, 0,
+  0x34, 0xf, 0x38, 0x1c, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1d, 0, 0,
+  0x34, 0xf, 0x38, 0x1d, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x1e, 0, 0,
+  0x34, 0xf, 0x38, 0x1e, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xf, 0, 0,
+  0x34, 0xf, 0x3a, 0xf, 0, 0,
+  0x34, 0x66, 0xf, 0xc7, 0x38, 0x30,
+  0x34, 0xf3, 0xf, 0xc7, 0x38, 0x30,
+  0x23, 0xf, 0xc7, 0x38, 0x30,
+  0x23, 0xf, 0xc7, 0x38, 0x38,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xd0,
+  0x23, 0xf, 0x71, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xe0,
+  0x23, 0xf, 0x71, 0xf8, 0xe0,
+  0x34, 0x66, 0xf, 0x71, 0xf8, 0xf0,
+  0x23, 0xf, 0x71, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xd0,
+  0x23, 0xf, 0x72, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xe0,
+  0x23, 0xf, 0x72, 0xf8, 0xe0,
+  0x34, 0x66, 0xf, 0x72, 0xf8, 0xf0,
+  0x23, 0xf, 0x72, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xd0,
+  0x23, 0xf, 0x73, 0xf8, 0xd0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xd8,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xf0,
+  0x23, 0xf, 0x73, 0xf8, 0xf0,
+  0x34, 0x66, 0xf, 0x73, 0xf8, 0xf8,
+  0x33, 0xf, 0xae, 0xe8,
+  0x33, 0xf, 0xae, 0xf0,
+  0x33, 0xf, 0xae, 0xf8,
+  0x23, 0xf, 0xae, 0x38, 0x38,
+  0x23, 0xf, 0xf, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xc, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xd, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x14, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x15, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x40, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x41, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x21, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2a, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x42, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x2b, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x10, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xe, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x29, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x61, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x60, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x63, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x62, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x37, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x41, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x20, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x22, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3c, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3d, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3f, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3e, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x38, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x39, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3b, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x3a, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x20, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x21, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x22, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x23, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x24, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x25, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x30, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x31, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x32, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x33, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x34, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x35, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x28, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x40, 0, 0,
+  0x45, 0x66, 0xf, 0x38, 0x17, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x8, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0x9, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xa, 0, 0,
+  0x45, 0x66, 0xf, 0x3a, 0xb, 0, 0,
+  0x1, 0xe7, 0x7,
+};
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.155.bb b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
new file mode 100644
index 0000000..6291d11
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
@@ -0,0 +1,84 @@
+DESCRIPTION = "A collection of utilities and DSOs to handle compiled objects."
+HOMEPAGE = "https://fedorahosted.org/elfutils"
+SECTION = "base"
+LICENSE = "(GPLv3 & Elfutils-Exception)"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "libtool bzip2 zlib virtual/libintl"
+
+PR = "r0"
+
+SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/elfutils-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "163a5712b86f6bdfebdf233cc6e2192d"
+SRC_URI[sha256sum] = "68444a4526416ffd68852ec3c6a40ceddcca46538297322405319884c5d30ed8"
+
+SRC_URI += "\
+        file://redhat-portability.diff \
+        file://redhat-robustify.diff \
+        file://hppa_backend.diff \
+        file://arm_backend.diff \
+        file://mips_backend.diff \
+        file://m68k_backend.diff \
+        file://do-autoreconf.diff \
+        file://elf_additions.diff \
+        file://mempcpy.patch \
+	file://dso-link-change.patch \
+	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
+	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
+"
+# Only apply when building uclibc based target recipe
+SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
+
+# The buildsystem wants to generate 2 .h files from source using a binary it just built,
+# which can not pass the cross compiling, so let's work around it by adding 2 .h files
+# along with the do_configure_prepend()
+
+SRC_URI += "\
+        file://i386_dis.h \
+        file://x86_64_dis.h \
+"
+inherit autotools gettext
+
+EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
+EXTRA_OECONF_append_class-native = " --without-bzlib"
+EXTRA_OECONF_append_libc-uclibc = " --enable-uclibc"
+
+do_configure_prepend() {
+	sed -i '/^i386_dis.h:/,+4 {/.*/d}' ${S}/libcpu/Makefile.am
+
+	cp ${WORKDIR}/*dis.h ${S}/libcpu
+}
+
+# we can not build complete elfutils when using uclibc
+# but some recipes e.g. gcc 4.5 depends on libelf so we
+# build only libelf for uclibc case
+
+EXTRA_OEMAKE_libc-uclibc = "-C libelf"
+EXTRA_OEMAKE_class-native = ""
+EXTRA_OEMAKE_class-nativesdk = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+# Package utilities separately
+PACKAGES =+ "${PN}-binutils libelf libasm libdw libdw-dev libasm-dev libelf-dev"
+FILES_${PN}-binutils = "\
+    ${bindir}/eu-addr2line \
+    ${bindir}/eu-ld \
+    ${bindir}/eu-nm \
+    ${bindir}/eu-readelf \
+    ${bindir}/eu-size \
+    ${bindir}/eu-strip"
+
+FILES_libelf = "${libdir}/libelf-${PV}.so ${libdir}/libelf.so.*"
+FILES_libasm = "${libdir}/libasm-${PV}.so ${libdir}/libasm.so.*"
+FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils/lib*"
+FILES_libelf-dev = "${libdir}/libelf.so ${includedir}"
+FILES_libasm-dev = "${libdir}/libasm.so ${includedir}/elfutils/libasm.h"
+FILES_libdw-dev  = "${libdir}/libdw.so  ${includedir}/dwarf.h ${includedir}/elfutils/libdw*.h"
+# Some packages have the version preceeding the .so instead properly
+# versioned .so.<version>, so we need to reorder and repackage.
+#FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
+#FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
+
+# The package contains symlinks that trip up insane
+INSANE_SKIP_${MLPREFIX}libdw = "dev-so"
-- 
1.7.9.5


