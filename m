Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EED596FB80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:28:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4S8S6k7007011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 01:28:06 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 01:28:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 16:27:55 +0800
Message-ID: <f179429496d22c8409430c1b46a22b649ca75937.1401265145.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401265145.git.hongxu.jia@windriver.com>
References: <cover.1401265145.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/3] elfutils: backport from debian
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
X-List-Received-Date: Wed, 28 May 2014 08:28:08 -0000
Content-Type: text/plain

Pick patches from debian:
http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.158-2.debian.tar.xz

We could not directly add elfutils_0.158-2.debian.tar.xz to SRC_URI, because it
contains other souce codes which are not pathces.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../elfutils/elfutils-0.158/CVE-2014-0172.patch    |   35 +
 .../elfutils/elfutils-0.158/arm_backend.diff       |  603 +++++++
 .../elfutils/elfutils-0.158/core_filename.patch    |   27 +
 .../elfutils/elfutils-0.158/hppa_backend.diff      |  800 +++++++++
 .../elfutils/elfutils-0.158/m68k_backend.diff      |  493 ++++++
 .../elfutils/elfutils-0.158/mips_backend.diff      |  712 ++++++++
 .../elfutils/elfutils-0.158/mips_readelf_w.patch   |   22 +
 .../elfutils-0.158/redhat-portability.diff         | 1814 ++++++++++++++++++++
 .../elfutils/elfutils-0.158/redhat-robustify.diff  | 1756 +++++++++++++++++++
 .../elfutils/elfutils-0.158/scanf-format.patch     |   40 +
 .../elfutils-0.158/testsuite-ignore-elflint.diff   |   39 +
 .../elfutils/elfutils-0.158/unwind_non_linux.patch |  256 +++
 meta/recipes-devtools/elfutils/elfutils_0.158.bb   |   17 +
 13 files changed, 6614 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/arm_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/hppa_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/m68k_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/mips_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/mips_readelf_w.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/scanf-format.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/testsuite-ignore-elflint.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch
new file mode 100644
index 0000000..6c44314
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch
@@ -0,0 +1,35 @@
+From 7f1eec317db79627b473c5b149a22a1b20d1f68f Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mjw@redhat.com>
+Date: Wed, 9 Apr 2014 11:33:23 +0200
+Subject: [PATCH] CVE-2014-0172 Check for overflow before calling malloc to
+ uncompress data.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1085663
+
+Reported-by: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: Mark Wielaard <mjw@redhat.com>
+
+Index: elfutils-0.158/libdw/dwarf_begin_elf.c
+===================================================================
+--- elfutils-0.158.orig/libdw/dwarf_begin_elf.c	2014-05-01 17:10:01.928213292 +0000
++++ elfutils-0.158/libdw/dwarf_begin_elf.c	2014-05-01 17:10:01.924213375 +0000
+@@ -1,5 +1,5 @@
+ /* Create descriptor from ELF descriptor for processing file.
+-   Copyright (C) 2002-2011 Red Hat, Inc.
++   Copyright (C) 2002-2011, 2014 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2002.
+ 
+@@ -289,6 +289,12 @@
+ 	    memcpy (&size, data->d_buf + 4, sizeof size);
+ 	    size = be64toh (size);
+ 
++	    /* Check for unsigned overflow so malloc always allocated
++	       enough memory for both the Elf_Data header and the
++	       uncompressed section data.  */
++	    if (unlikely (sizeof (Elf_Data) + size < size))
++	      break;
++
+ 	    Elf_Data *zdata = malloc (sizeof (Elf_Data) + size);
+ 	    if (unlikely (zdata == NULL))
+ 	      break;
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/arm_backend.diff
new file mode 100644
index 0000000..fc3d6dc
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/arm_backend.diff
@@ -0,0 +1,603 @@
+Index: elfutils-0.158/backends/arm_init.c
+===================================================================
+--- elfutils-0.158.orig/backends/arm_init.c	2014-04-21 11:13:24.378519252 +0000
++++ elfutils-0.158/backends/arm_init.c	2014-04-21 11:13:24.374519343 +0000
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
+@@ -61,7 +72,10 @@
+   HOOK (eh, core_note);
+   HOOK (eh, auxv_info);
+   HOOK (eh, check_object_attribute);
+-  HOOK (eh, return_value_location);
++  if (soft_float)
++    eh->return_value_location = arm_return_value_location_soft;
++  else
++    eh->return_value_location = arm_return_value_location_hard;
+   HOOK (eh, abi_cfi);
+ 
+   return MODVERSION;
+Index: elfutils-0.158/backends/arm_regs.c
+===================================================================
+--- elfutils-0.158.orig/backends/arm_regs.c	2014-04-21 11:13:24.378519252 +0000
++++ elfutils-0.158/backends/arm_regs.c	2014-04-21 11:13:24.374519343 +0000
+@@ -31,6 +31,7 @@
+ #endif
+ 
+ #include <string.h>
++#include <stdio.h>
+ #include <dwarf.h>
+ 
+ #define BACKEND arm_
+@@ -76,6 +77,9 @@
+       break;
+ 
+     case 16 + 0 ... 16 + 7:
++      /* AADWARF says that there are no registers in that range,
++       * but gcc maps FPA registers here
++       */
+       regno += 96 - 16;
+       /* Fall through.  */
+     case 96 + 0 ... 96 + 7:
+@@ -87,11 +91,139 @@
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
++      *setname = "state";
+       *type = DW_ATE_unsigned;
+       return stpcpy (name, "spsr") + 1 - name;
+ 
++    case 129:
++      *setname = "state";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_fiq") + 1 - name;
++
++    case 130:
++      *setname = "state";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_irq") + 1 - name;
++
++    case 131:
++      *setname = "state";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_abt") + 1 - name;
++
++    case 132:
++      *setname = "state";
++      *type = DW_ATE_unsigned;
++      return stpcpy(name, "spsr_und") + 1 - name;
++
++    case 133:
++      *setname = "state";
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
+Index: elfutils-0.158/backends/arm_retval.c
+===================================================================
+--- elfutils-0.158.orig/backends/arm_retval.c	2014-04-21 11:13:24.378519252 +0000
++++ elfutils-0.158/backends/arm_retval.c	2014-04-21 11:13:24.374519343 +0000
+@@ -48,6 +48,13 @@
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
+@@ -58,8 +65,9 @@
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
+@@ -112,14 +120,31 @@
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
+@@ -138,3 +163,18 @@
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
+Index: elfutils-0.158/libelf/elf.h
+===================================================================
+--- elfutils-0.158.orig/libelf/elf.h	2014-04-21 11:13:24.378519252 +0000
++++ elfutils-0.158/libelf/elf.h	2014-04-21 11:13:24.374519343 +0000
+@@ -2318,6 +2318,9 @@
+ #define EF_ARM_EABI_VER4	0x04000000
+ #define EF_ARM_EABI_VER5	0x05000000
+ 
++/* EI_OSABI values */
++#define ELFOSABI_ARM_AEABI    64      /* Contains symbol versioning. */
++
+ /* Additional symbol types for Thumb.  */
+ #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
+ #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
+@@ -2335,12 +2338,19 @@
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
+ /* AArch64 relocs.  */
+ 
+@@ -2619,6 +2629,7 @@
+ 					   TLS block (LDR, STR).  */
+ #define R_ARM_TLS_IE12GP	111	/* 12 bit GOT entry relative
+ 					   to GOT origin (LDR).  */
++/* 112 - 127 private range */
+ #define R_ARM_ME_TOO		128	/* Obsolete.  */
+ #define R_ARM_THM_TLS_DESCSEQ	129
+ #define R_ARM_THM_TLS_DESCSEQ16	129
+Index: elfutils-0.158/backends/libebl_arm.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/libebl_arm.h	2014-04-21 11:13:24.374519343 +0000
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
+Index: elfutils-0.158/tests/run-allregs.sh
+===================================================================
+--- elfutils-0.158.orig/tests/run-allregs.sh	2014-04-21 11:13:24.378519252 +0000
++++ elfutils-0.158/tests/run-allregs.sh	2014-04-21 11:13:24.378519252 +0000
+@@ -2671,7 +2671,28 @@
+ 	 13: sp (sp), address 32 bits
+ 	 14: lr (lr), address 32 bits
+ 	 15: pc (pc), address 32 bits
+-	128: spsr (spsr), unsigned 32 bits
++	144: r8_usr (r8_usr), signed 32 bits
++	145: r9_usr (r9_usr), signed 32 bits
++	146: r10_usr (r10_usr), signed 32 bits
++	147: r11_usr (r11_usr), signed 32 bits
++	148: r12_usr (r12_usr), signed 32 bits
++	149: r13_usr (r13_usr), signed 32 bits
++	150: r14_usr (r14_usr), signed 32 bits
++	151: r8_fiq (r8_fiq), signed 32 bits
++	152: r9_fiq (r9_fiq), signed 32 bits
++	153: r10_fiq (r10_fiq), signed 32 bits
++	154: r11_fiq (r11_fiq), signed 32 bits
++	155: r12_fiq (r12_fiq), signed 32 bits
++	156: r13_fiq (r13_fiq), signed 32 bits
++	157: r14_fiq (r14_fiq), signed 32 bits
++	158: r13_irq (r13_irq), signed 32 bits
++	159: r14_irq (r14_irq), signed 32 bits
++	160: r13_abt (r13_abt), signed 32 bits
++	161: r14_abt (r14_abt), signed 32 bits
++	162: r13_und (r13_und), signed 32 bits
++	163: r14_und (r14_und), signed 32 bits
++	164: r13_svc (r13_svc), signed 32 bits
++	165: r14_svc (r14_svc), signed 32 bits
+ FPA registers:
+ 	 16: f0 (f0), float 96 bits
+ 	 17: f1 (f1), float 96 bits
+@@ -2689,7 +2710,72 @@
+ 	101: f5 (f5), float 96 bits
+ 	102: f6 (f6), float 96 bits
+ 	103: f7 (f7), float 96 bits
++MMX registers:
++	104: wcgr0 (wcgr0), unsigned 32 bits
++	105: wcgr1 (wcgr1), unsigned 32 bits
++	106: wcgr2 (wcgr2), unsigned 32 bits
++	107: wcgr3 (wcgr3), unsigned 32 bits
++	108: wcgr4 (wcgr4), unsigned 32 bits
++	109: wcgr5 (wcgr5), unsigned 32 bits
++	110: wcgr6 (wcgr6), unsigned 32 bits
++	111: wcgr7 (wcgr7), unsigned 32 bits
++	112: wr0 (wr0), unsigned 64 bits
++	113: wr1 (wr1), unsigned 64 bits
++	114: wr2 (wr2), unsigned 64 bits
++	115: wr3 (wr3), unsigned 64 bits
++	116: wr4 (wr4), unsigned 64 bits
++	117: wr5 (wr5), unsigned 64 bits
++	118: wr6 (wr6), unsigned 64 bits
++	119: wr7 (wr7), unsigned 64 bits
++	120: wr8 (wr8), unsigned 64 bits
++	121: wr9 (wr9), unsigned 64 bits
++	122: wr10 (wr10), unsigned 64 bits
++	123: wr11 (wr11), unsigned 64 bits
++	124: wr12 (wr12), unsigned 64 bits
++	125: wr13 (wr13), unsigned 64 bits
++	126: wr14 (wr14), unsigned 64 bits
++	127: wr15 (wr15), unsigned 64 bits
++	192: wc0 (wc0), unsigned 32 bits
++	193: wc1 (wc1), unsigned 32 bits
++	194: wc2 (wc2), unsigned 32 bits
++	195: wc3 (wc3), unsigned 32 bits
++	196: wc4 (wc4), unsigned 32 bits
++	197: wc5 (wc5), unsigned 32 bits
++	198: wc6 (wc6), unsigned 32 bits
++	199: wc7 (wc7), unsigned 32 bits
+ VFP registers:
++	 64: s0 (s0), float 32 bits
++	 65: s1 (s1), float 32 bits
++	 66: s2 (s2), float 32 bits
++	 67: s3 (s3), float 32 bits
++	 68: s4 (s4), float 32 bits
++	 69: s5 (s5), float 32 bits
++	 70: s6 (s6), float 32 bits
++	 71: s7 (s7), float 32 bits
++	 72: s8 (s8), float 32 bits
++	 73: s9 (s9), float 32 bits
++	 74: s10 (s10), float 32 bits
++	 75: s11 (s11), float 32 bits
++	 76: s12 (s12), float 32 bits
++	 77: s13 (s13), float 32 bits
++	 78: s14 (s14), float 32 bits
++	 79: s15 (s15), float 32 bits
++	 80: s16 (s16), float 32 bits
++	 81: s17 (s17), float 32 bits
++	 82: s18 (s18), float 32 bits
++	 83: s19 (s19), float 32 bits
++	 84: s20 (s20), float 32 bits
++	 85: s21 (s21), float 32 bits
++	 86: s22 (s22), float 32 bits
++	 87: s23 (s23), float 32 bits
++	 88: s24 (s24), float 32 bits
++	 89: s25 (s25), float 32 bits
++	 90: s26 (s26), float 32 bits
++	 91: s27 (s27), float 32 bits
++	 92: s28 (s28), float 32 bits
++	 93: s29 (s29), float 32 bits
++	 94: s30 (s30), float 32 bits
++	 95: s31 (s31), float 32 bits
+ 	256: d0 (d0), float 64 bits
+ 	257: d1 (d1), float 64 bits
+ 	258: d2 (d2), float 64 bits
+@@ -2722,6 +2808,13 @@
+ 	285: d29 (d29), float 64 bits
+ 	286: d30 (d30), float 64 bits
+ 	287: d31 (d31), float 64 bits
++state registers:
++	128: spsr (spsr), unsigned 32 bits
++	129: spsr_fiq (spsr_fiq), unsigned 32 bits
++	130: spsr_irq (spsr_irq), unsigned 32 bits
++	131: spsr_abt (spsr_abt), unsigned 32 bits
++	132: spsr_und (spsr_und), unsigned 32 bits
++	133: spsr_svc (spsr_svc), unsigned 32 bits
+ EOF
+ 
+ # See run-readelf-mixed-corenote.sh for instructions to regenerate
+Index: elfutils-0.158/tests/run-readelf-mixed-corenote.sh
+===================================================================
+--- elfutils-0.158.orig/tests/run-readelf-mixed-corenote.sh	2014-04-21 11:13:24.378519252 +0000
++++ elfutils-0.158/tests/run-readelf-mixed-corenote.sh	2014-04-21 11:13:24.378519252 +0000
+@@ -30,12 +30,11 @@
+     pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
+     utime: 0.000000, stime: 0.010000, cutime: 0.000000, cstime: 0.000000
+     orig_r0: -1, fpvalid: 1
+-    r0:             1  r1:   -1091672508  r2:   -1091672500
+-    r3:             0  r4:             0  r5:             0
+-    r6:         33728  r7:             0  r8:             0
+-    r9:             0  r10:  -1225703496  r11:  -1091672844
+-    r12:            0  sp:    0xbeee64f4  lr:    0xb6dc3f48
+-    pc:    0x00008500  spsr:  0x60000010
++    r0:            1  r1:  -1091672508  r2:  -1091672500  r3:            0
++    r4:            0  r5:            0  r6:        33728  r7:            0
++    r8:            0  r9:            0  r10: -1225703496  r11: -1091672844
++    r12:           0  sp:   0xbeee64f4  lr:   0xb6dc3f48  pc:   0x00008500
++    spsr:  0x60000010
+   CORE                 124  PRPSINFO
+     state: 0, sname: R, zomb: 0, nice: 0, flag: 0x00400500
+     uid: 0, gid: 0, pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
+Index: elfutils-0.158/tests/run-addrcfi.sh
+===================================================================
+--- elfutils-0.158.orig/tests/run-addrcfi.sh	2014-04-21 11:13:24.378519252 +0000
++++ elfutils-0.158/tests/run-addrcfi.sh	2014-04-21 11:13:24.378519252 +0000
+@@ -2530,6 +2530,38 @@
+ 	FPA reg21 (f5): undefined
+ 	FPA reg22 (f6): undefined
+ 	FPA reg23 (f7): undefined
++	VFP reg64 (s0): undefined
++	VFP reg65 (s1): undefined
++	VFP reg66 (s2): undefined
++	VFP reg67 (s3): undefined
++	VFP reg68 (s4): undefined
++	VFP reg69 (s5): undefined
++	VFP reg70 (s6): undefined
++	VFP reg71 (s7): undefined
++	VFP reg72 (s8): undefined
++	VFP reg73 (s9): undefined
++	VFP reg74 (s10): undefined
++	VFP reg75 (s11): undefined
++	VFP reg76 (s12): undefined
++	VFP reg77 (s13): undefined
++	VFP reg78 (s14): undefined
++	VFP reg79 (s15): undefined
++	VFP reg80 (s16): undefined
++	VFP reg81 (s17): undefined
++	VFP reg82 (s18): undefined
++	VFP reg83 (s19): undefined
++	VFP reg84 (s20): undefined
++	VFP reg85 (s21): undefined
++	VFP reg86 (s22): undefined
++	VFP reg87 (s23): undefined
++	VFP reg88 (s24): undefined
++	VFP reg89 (s25): undefined
++	VFP reg90 (s26): undefined
++	VFP reg91 (s27): undefined
++	VFP reg92 (s28): undefined
++	VFP reg93 (s29): undefined
++	VFP reg94 (s30): undefined
++	VFP reg95 (s31): undefined
+ 	FPA reg96 (f0): undefined
+ 	FPA reg97 (f1): undefined
+ 	FPA reg98 (f2): undefined
+@@ -2538,7 +2570,66 @@
+ 	FPA reg101 (f5): undefined
+ 	FPA reg102 (f6): undefined
+ 	FPA reg103 (f7): undefined
+-	integer reg128 (spsr): undefined
++	MMX reg104 (wcgr0): undefined
++	MMX reg105 (wcgr1): undefined
++	MMX reg106 (wcgr2): undefined
++	MMX reg107 (wcgr3): undefined
++	MMX reg108 (wcgr4): undefined
++	MMX reg109 (wcgr5): undefined
++	MMX reg110 (wcgr6): undefined
++	MMX reg111 (wcgr7): undefined
++	MMX reg112 (wr0): undefined
++	MMX reg113 (wr1): undefined
++	MMX reg114 (wr2): undefined
++	MMX reg115 (wr3): undefined
++	MMX reg116 (wr4): undefined
++	MMX reg117 (wr5): undefined
++	MMX reg118 (wr6): undefined
++	MMX reg119 (wr7): undefined
++	MMX reg120 (wr8): undefined
++	MMX reg121 (wr9): undefined
++	MMX reg122 (wr10): undefined
++	MMX reg123 (wr11): undefined
++	MMX reg124 (wr12): undefined
++	MMX reg125 (wr13): undefined
++	MMX reg126 (wr14): undefined
++	MMX reg127 (wr15): undefined
++	state reg128 (spsr): undefined
++	state reg129 (spsr_fiq): undefined
++	state reg130 (spsr_irq): undefined
++	state reg131 (spsr_abt): undefined
++	state reg132 (spsr_und): undefined
++	state reg133 (spsr_svc): undefined
++	integer reg144 (r8_usr): undefined
++	integer reg145 (r9_usr): undefined
++	integer reg146 (r10_usr): undefined
++	integer reg147 (r11_usr): undefined
++	integer reg148 (r12_usr): undefined
++	integer reg149 (r13_usr): undefined
++	integer reg150 (r14_usr): undefined
++	integer reg151 (r8_fiq): undefined
++	integer reg152 (r9_fiq): undefined
++	integer reg153 (r10_fiq): undefined
++	integer reg154 (r11_fiq): undefined
++	integer reg155 (r12_fiq): undefined
++	integer reg156 (r13_fiq): undefined
++	integer reg157 (r14_fiq): undefined
++	integer reg158 (r13_irq): undefined
++	integer reg159 (r14_irq): undefined
++	integer reg160 (r13_abt): undefined
++	integer reg161 (r14_abt): undefined
++	integer reg162 (r13_und): undefined
++	integer reg163 (r14_und): undefined
++	integer reg164 (r13_svc): undefined
++	integer reg165 (r14_svc): undefined
++	MMX reg192 (wc0): undefined
++	MMX reg193 (wc1): undefined
++	MMX reg194 (wc2): undefined
++	MMX reg195 (wc3): undefined
++	MMX reg196 (wc4): undefined
++	MMX reg197 (wc5): undefined
++	MMX reg198 (wc6): undefined
++	MMX reg199 (wc7): undefined
+ 	VFP reg256 (d0): undefined
+ 	VFP reg257 (d1): undefined
+ 	VFP reg258 (d2): undefined
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch
new file mode 100644
index 0000000..e2f0576
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch
@@ -0,0 +1,27 @@
+From: Matthias Klose <doko@ubuntu.com>
+Date: Tue, 7 Jan 2014 10:25:29 +0100
+Subject: [PATCH] tests: backtrace-subr.sh (check_native_core) should check
+ core file name.
+
+Needed when /proc/sys/kernel/core_uses_pid is set to 0. Try to rename
+the core file, and if it does still fail, skip the test.
+
+diff --git a/tests/backtrace-subr.sh b/tests/backtrace-subr.sh
+index e7ece91..62b873c 100644
+--- a/tests/backtrace-subr.sh
++++ b/tests/backtrace-subr.sh
+@@ -111,6 +111,11 @@ check_native_core()
+ 
+   # Skip the test if we cannot adjust core ulimit.
+   core="core.`ulimit -c unlimited || exit 77; set +ex; testrun ${abs_builddir}/$child --gencore; true`"
++  # see if /proc/sys/kernel/core_uses_pid is set to 0
++  if [ -f core ]; then
++    mv core "$core"
++  fi
++  if [ ! -f "$core" ]; then exit 77; fi
+ 
+   if [ "x$SAVED_VALGRIND_CMD" != "x" ]; then
+     VALGRIND_CMD="$SAVED_VALGRIND_CMD"
+-- 
+1.9.2
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/hppa_backend.diff
new file mode 100644
index 0000000..6c19d17
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/hppa_backend.diff
@@ -0,0 +1,800 @@
+Index: elfutils-0.158/backends/parisc_init.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/parisc_init.c	2014-04-21 11:12:12.228150280 +0000
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
+Index: elfutils-0.158/backends/parisc_regs.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/parisc_regs.c	2014-04-21 11:12:12.228150280 +0000
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
+Index: elfutils-0.158/backends/parisc_reloc.def
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/parisc_reloc.def	2014-04-21 11:12:12.228150280 +0000
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
+Index: elfutils-0.158/backends/parisc_retval.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/parisc_retval.c	2014-04-21 11:12:12.228150280 +0000
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
+Index: elfutils-0.158/backends/parisc_symbol.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/parisc_symbol.c	2014-04-21 11:12:12.228150280 +0000
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
+Index: elfutils-0.158/backends/libebl_parisc.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/libebl_parisc.h	2014-04-21 11:12:12.228150280 +0000
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
+Index: elfutils-0.158/backends/Makefile.am
+===================================================================
+--- elfutils-0.158.orig/backends/Makefile.am	2014-04-21 11:12:12.252149737 +0000
++++ elfutils-0.158/backends/Makefile.am	2014-04-21 11:13:11.910801105 +0000
+@@ -33,11 +33,12 @@
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx
++	  tilegx parisc
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+-	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a
++	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
++	     libebl_parisc_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -116,6 +117,9 @@
+ libebl_tilegx_pic_a_SOURCES = $(tilegx_SRCS)
+ am_libebl_tilegx_pic_a_OBJECTS = $(tilegx_SRCS:.c=.os)
+ 
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+Index: elfutils-0.158/libelf/elf.h
+===================================================================
+--- elfutils-0.158.orig/libelf/elf.h	2014-04-21 11:12:12.252149737 +0000
++++ elfutils-0.158/libelf/elf.h	2014-04-21 11:12:12.228150280 +0000
+@@ -1814,16 +1814,24 @@
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
+@@ -1832,6 +1840,7 @@
+ #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
+ #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
+ #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
++#define R_PARISC_PCREL22C	73
+ #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
+ #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
+ #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
+@@ -1857,6 +1866,8 @@
+ #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
+ #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
+ #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
++#define R_PARISC_BASEREL14WR	107
++#define R_PARISC_BASEREL14DR	108
+ #define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
+ #define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
+ #define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/m68k_backend.diff
new file mode 100644
index 0000000..48bffda
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/m68k_backend.diff
@@ -0,0 +1,493 @@
+From: Kurt Roeckx <kurt@roeckx.be>
+From: Thorsten Glaser <tg@mirbsd.de>
+Subject: m68k support
+
+Written by Kurt Roeckx, except for the retval support which was written
+by Thorsten Glaser
+
+
+Index: elfutils-0.158/backends/m68k_init.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/m68k_init.c	2014-04-21 11:14:23.813175704 +0000
+@@ -0,0 +1,50 @@
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
++  HOOK (eh, return_value_location);
++  HOOK (eh, register_info);
++
++  return MODVERSION;
++}
+Index: elfutils-0.158/backends/m68k_regs.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/m68k_regs.c	2014-04-21 11:14:23.813175704 +0000
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
+Index: elfutils-0.158/backends/m68k_reloc.def
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/m68k_reloc.def	2014-04-21 11:14:23.813175704 +0000
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
+Index: elfutils-0.158/libelf/elf.h
+===================================================================
+--- elfutils-0.158.orig/libelf/elf.h	2014-04-21 11:14:23.813175704 +0000
++++ elfutils-0.158/libelf/elf.h	2014-04-21 11:14:23.813175704 +0000
+@@ -1157,6 +1157,9 @@
+ #define R_68K_GLOB_DAT	20		/* Create GOT entry */
+ #define R_68K_JMP_SLOT	21		/* Create PLT entry */
+ #define R_68K_RELATIVE	22		/* Adjust by program base */
++/* The next 2 are GNU extensions to enable C++ vtable garbage collection.  */
++#define R_68K_GNU_VTINHERIT 23
++#define R_68K_GNU_VTENTRY   24
+ #define R_68K_TLS_GD32      25          /* 32 bit GOT offset for GD */
+ #define R_68K_TLS_GD16      26          /* 16 bit GOT offset for GD */
+ #define R_68K_TLS_GD8       27          /* 8 bit GOT offset for GD */
+Index: elfutils-0.158/backends/Makefile.am
+===================================================================
+--- elfutils-0.158.orig/backends/Makefile.am	2014-04-21 11:14:23.813175704 +0000
++++ elfutils-0.158/backends/Makefile.am	2014-04-21 11:14:48.344621167 +0000
+@@ -33,12 +33,12 @@
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx parisc mips
++	  tilegx parisc mips m68k
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+-	     libebl_parisc_pic.a libebl_mips_pic.a
++	     libebl_parisc_pic.a libebl_mips_pic.a libebl_m68k_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -125,6 +125,10 @@
+ libebl_mips_pic_a_SOURCES = $(mips_SRCS)
+ am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
+ 
++m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c m68k_retval.c
++libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
++am_libebl_m68k_pic_a_OBJECTS = $(m68k_SRCS:.c=.os)
++
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+ 	echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+Index: elfutils-0.158/backends/m68k_symbol.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/m68k_symbol.c	2014-04-21 11:14:23.813175704 +0000
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
+Index: elfutils-0.158/backends/m68k_retval.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/m68k_retval.c	2014-04-21 11:14:23.813175704 +0000
+@@ -0,0 +1,172 @@
++/* Function return value location for Linux/m68k ABI.
++   Copyright (C) 2005-2010 Red Hat, Inc.
++   Copyright (c) 2011 Thorsten Glaser, Debian.
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
++#define BACKEND m68k_
++#include "libebl_CPU.h"
++
++
++/* %d0, or pair %d0, %d1, or %a0 */
++static const Dwarf_Op loc_intreg[] =
++  {
++    { .atom = DW_OP_reg0 }, { .atom = DW_OP_piece, .number = 4 },
++    { .atom = DW_OP_reg1 }, { .atom = DW_OP_piece, .number = 4 },
++  };
++static const Dwarf_Op loc_ptrreg[] =
++  {
++    { .atom = DW_OP_reg8 },
++  };
++#define nloc_intreg	1
++#define nloc_intregpair	4
++#define nloc_ptrreg	1
++
++/* %f0 */
++static const Dwarf_Op loc_fpreg[] =
++  {
++    { .atom = DW_OP_reg16 }
++  };
++#define nloc_fpreg	1
++
++/* Structures are a bit more complicated - small structures are returned
++   in %d0 / %d1 (-freg-struct-return which is enabled by default), large
++   structures use %a1 (in constrast to the SYSV psABI which says %a0) as
++   reentrant storage space indicator.  */
++static const Dwarf_Op loc_aggregate[] =
++  {
++    { .atom = DW_OP_breg9, .number = 0 }
++  };
++#define nloc_aggregate 1
++
++int
++m68k_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
++{
++  Dwarf_Word size;
++
++  /* Start with the function's type, and get the DW_AT_type attribute,
++     which is the type of the return value.  */
++
++  Dwarf_Attribute attr_mem;
++  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type,
++						&attr_mem);
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
++      if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
++						 &attr_mem), &size) != 0)
++	{
++	  if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
++	    size = 4;
++	  else
++	    return -1;
++	}
++      if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
++	{
++	  *locp = loc_ptrreg;
++          return nloc_ptrreg;
++	}
++      if (tag == DW_TAG_base_type)
++	{
++	  Dwarf_Word encoding;
++	  if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
++						     &attr_mem),
++			       &encoding) != 0)
++	    return -1;
++	  if (encoding == DW_ATE_float)
++	    {
++	      /* XXX really 10? */
++              if (size > 10)
++                return -2;
++              *locp = loc_fpreg;
++              return nloc_fpreg;
++	    }
++	}
++      if (size <= 8)
++	{
++	intreg:
++	  /* XXX check endianness of dword pair, int64 vs aggregate */
++	  *locp = loc_intreg;
++	  return size <= 4 ? nloc_intreg : nloc_intregpair;
++	}
++
++    aggregate:
++      *locp = loc_aggregate;
++      return nloc_aggregate;
++
++    case DW_TAG_structure_type:
++    case DW_TAG_class_type:
++    case DW_TAG_union_type:
++    case DW_TAG_array_type:
++      if (dwarf_aggregate_size (typedie, &size) == 0
++	  && size > 0 && size <= 8)
++	/* not accurate for a struct whose only member is a float */
++	goto intreg;
++      goto aggregate;
++    }
++
++  /* XXX We don't have a good way to return specific errors from ebl calls.
++     This value means we do not understand the type, but it is well-formed
++     DWARF and might be valid.  */
++  return -2;
++}
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/mips_backend.diff
new file mode 100644
index 0000000..b188927
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/mips_backend.diff
@@ -0,0 +1,712 @@
+Index: elfutils-0.158/backends/mips_init.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/mips_init.c	2014-04-21 11:13:36.910235965 +0000
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
+Index: elfutils-0.158/backends/mips_regs.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/mips_regs.c	2014-04-21 11:13:36.910235965 +0000
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
+Index: elfutils-0.158/backends/mips_reloc.def
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/mips_reloc.def	2014-04-21 11:13:36.910235965 +0000
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
+Index: elfutils-0.158/backends/mips_retval.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/mips_retval.c	2014-04-21 11:13:36.910235965 +0000
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
+Index: elfutils-0.158/backends/mips_symbol.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ elfutils-0.158/backends/mips_symbol.c	2014-04-21 11:13:36.910235965 +0000
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
+Index: elfutils-0.158/libebl/eblopenbackend.c
+===================================================================
+--- elfutils-0.158.orig/libebl/eblopenbackend.c	2014-04-21 11:13:36.914235875 +0000
++++ elfutils-0.158/libebl/eblopenbackend.c	2014-04-21 11:13:36.910235965 +0000
+@@ -71,6 +71,8 @@
+   { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
+   { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
+   { "s390", "ebl_s390", "s390", 4, EM_S390, 0, 0 },
++  { "mips", "elf_mips", "mips", 4, EM_MIPS, 0, 0 },
++  { "mips", "elf_mipsel", "mipsel", 4, EM_MIPS_RS3_LE, 0, 0 },
+ 
+   { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
+   { "m68k", "elf_m68k", "m68k", 4, EM_68K, 0, 0 },
+Index: elfutils-0.158/backends/common-reloc.c
+===================================================================
+--- elfutils-0.158.orig/backends/common-reloc.c	2014-04-21 11:13:36.914235875 +0000
++++ elfutils-0.158/backends/common-reloc.c	2014-04-21 11:13:36.910235965 +0000
+@@ -112,11 +112,13 @@
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
+@@ -138,7 +140,9 @@
+   ebl->reloc_type_name = EBLHOOK(reloc_type_name);
+   ebl->reloc_type_check = EBLHOOK(reloc_type_check);
+   ebl->reloc_valid_use = EBLHOOK(reloc_valid_use);
++#ifndef NO_COPY_RELOC
+   ebl->copy_reloc_p = EBLHOOK(copy_reloc_p);
++#endif
+   ebl->none_reloc_p = EBLHOOK(none_reloc_p);
+ #ifndef NO_RELATIVE_RELOC
+   ebl->relative_reloc_p = EBLHOOK(relative_reloc_p);
+Index: elfutils-0.158/backends/Makefile.am
+===================================================================
+--- elfutils-0.158.orig/backends/Makefile.am	2014-04-21 11:13:36.914235875 +0000
++++ elfutils-0.158/backends/Makefile.am	2014-04-21 11:14:10.841468934 +0000
+@@ -33,12 +33,12 @@
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx parisc
++	  tilegx parisc mips
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+-	     libebl_parisc_pic.a
++	     libebl_parisc_pic.a libebl_mips_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -121,6 +121,10 @@
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
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/mips_readelf_w.patch
new file mode 100644
index 0000000..8e669e7
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/mips_readelf_w.patch
@@ -0,0 +1,22 @@
+From: Kurt Roeckx <kurt@roeckx.be>
+Subject: Make readelf -w output debug information on mips
+Bug-Debian: http://bugs.debian.org/662041
+Forwarded: not-needed
+
+Upstreams wants a change where this is handled by a hook that needs
+to be filled in by the backend for the arch.
+
+Index: elfutils-0.153/src/readelf.c
+===================================================================
+--- elfutils-0.153.orig/src/readelf.c	2012-08-10 22:01:55.000000000 +0200
++++ elfutils-0.153/src/readelf.c	2012-09-18 21:46:27.000000000 +0200
+@@ -7364,7 +7364,8 @@
+       GElf_Shdr shdr_mem;
+       GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
+ 
+-      if (shdr != NULL && shdr->sh_type == SHT_PROGBITS)
++      if (shdr != NULL && (
++	 (shdr->sh_type == SHT_PROGBITS) || (shdr->sh_type == SHT_MIPS_DWARF)))
+ 	{
+ 	  static const struct
+ 	  {
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff
new file mode 100644
index 0000000..a34ba29
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff
@@ -0,0 +1,1814 @@
+--- elfutils/backends/ChangeLog
++++ elfutils/backends/ChangeLog
+@@ -292,6 +292,10 @@
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
+@@ -619,6 +623,11 @@
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
+@@ -641,6 +650,9 @@
+ 	* Makefile.am (uninstall): Don't try to remove $(pkgincludedir).
+ 	(CLEANFILES): Add libebl_$(m).so.
+ 
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 	* ppc_reloc.def: Update bits per Alan Modra <amodra@bigpond.net.au>.
+ 	* ppc64_reloc.def: Likewise.
+ 
+--- elfutils/backends/Makefile.am
++++ elfutils/backends/Makefile.am
+@@ -124,7 +124,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a
+ 	$(LINK) -shared -o $(@:.map=.so) \
+ 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
+ 		-Wl,--version-script,$(@:.so=.map) \
+-		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
++		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
+ 	$(textrel_check)
+ 
+ libebl_i386.so: $(cpu_i386)
+--- elfutils/backends/Makefile.in
++++ elfutils/backends/Makefile.in
+@@ -83,7 +83,8 @@ host_triplet = @host@
+ DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
+ 	$(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
+ 	$(noinst_HEADERS) ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ subdir = backends
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
+@@ -284,6 +285,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -315,6 +317,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -378,10 +381,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
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
+@@ -888,7 +890,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a
+ 	$(LINK) -shared -o $(@:.map=.so) \
+ 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
+ 		-Wl,--version-script,$(@:.so=.map) \
+-		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
++		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
+ 	$(textrel_check)
+ 
+ libebl_i386.so: $(cpu_i386)
+--- elfutils/ChangeLog
++++ elfutils/ChangeLog
+@@ -118,6 +118,8 @@
+ 
+ 2012-01-24  Mark Wielaard  <mjw@redhat.com>
+ 
++	* configure.ac: Wrap AC_COMPILE_IFELSE sources in AC_LANG_SOURCE.
++
+ 	* COPYING: Fix address. Updated version from gnulib.
+ 
+ 2012-01-23  Mark Wielaard  <mjw@redhat.com>
+@@ -136,6 +138,9 @@
+ 
+ 2011-10-08  Mike Frysinger  <vapier@gentoo.org>
+ 
++	* configure.ac (--disable-werror): Handle it, controlling BUILD_WERROR
++	automake option.
++
+ 	* configure.ac: Fix use of AC_ARG_ENABLE to handle $enableval correctly.
+ 
+ 2011-10-02  Ulrich Drepper  <drepper@gmail.com>
+@@ -157,6 +162,10 @@
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
+@@ -165,6 +174,10 @@
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
+@@ -176,6 +189,8 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* configure.ac: Check for __builtin_popcount.
++
+ 	* configure.ac (zlib check): Check for gzdirect, need zlib >= 1.2.2.3.
+ 
+ 	* configure.ac (__thread check): Use AC_LINK_IFELSE, in case of
+@@ -256,6 +271,10 @@
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
+@@ -303,6 +322,17 @@
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
+--- elfutils/config/ChangeLog
++++ elfutils/config/ChangeLog
+@@ -44,6 +44,10 @@
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
+--- elfutils/config/eu.am
++++ elfutils/config/eu.am
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
+ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
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
+--- elfutils/config/Makefile.in
++++ elfutils/config/Makefile.in
+@@ -146,6 +146,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -177,6 +178,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+--- elfutils/config.h.in
++++ elfutils/config.h.in
+@@ -6,6 +6,9 @@
+ /* Defined if libdw should support GNU ref_alt FORM, dwz multi files. */
+ #undef ENABLE_DWZ
+ 
++/* Have __builtin_popcount. */
++#undef HAVE_BUILTIN_POPCOUNT
++
+ /* Define to 1 if you have the <inttypes.h> header file. */
+ #undef HAVE_INTTYPES_H
+ 
+@@ -102,4 +105,7 @@
+ /* Define for large files, on AIX-style hosts. */
+ #undef _LARGE_FILES
+ 
++/* Stubbed out if missing compiler support. */
++#undef __thread
++
+ #include <eu-config.h>
+--- elfutils/configure
++++ elfutils/configure
+@@ -661,6 +661,8 @@ ZLIB_TRUE
+ LIBEBL_SUBDIR
+ TESTS_RPATH_FALSE
+ TESTS_RPATH_TRUE
++BUILD_WERROR_FALSE
++BUILD_WERROR_TRUE
+ BUILD_STATIC_FALSE
+ BUILD_STATIC_TRUE
+ USE_VALGRIND_FALSE
+@@ -678,6 +680,8 @@ NEVER_TRUE
+ base_cpu
+ NATIVE_LD_FALSE
+ NATIVE_LD_TRUE
++LD_AS_NEEDED
++WEXTRA
+ NM
+ READELF
+ ac_ct_AR
+@@ -802,6 +806,7 @@ enable_debugpred
+ enable_gprof
+ enable_gcov
+ enable_valgrind
++enable_werror
+ enable_tests_rpath
+ enable_libebl_subdir
+ with_zlib
+@@ -1461,6 +1466,7 @@ Optional Features:
+   --enable-gprof          build binaries with gprof support
+   --enable-gcov           build binaries with gcov support
+   --enable-valgrind       run all tests under valgrind
++  --disable-werror        do not build with -Werror
+   --enable-tests-rpath    build $ORIGIN-using rpath into tests
+   --enable-libebl-subdir=DIR
+                           install libebl_CPU modules in $(libdir)/DIR
+@@ -4709,6 +4715,130 @@ if test "x$ac_cv_c99" != xyes; then :
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
+@@ -4745,7 +4875,13 @@ fi
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
+@@ -5155,6 +5291,22 @@ else
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
+@@ -5875,7 +6027,7 @@ case "$eu_version" in
+ esac
+ 
+ # Round up to the next release API (x.y) version.
+-eu_version=$(( (eu_version + 999) / 1000 ))
++eu_version=`expr \( $eu_version + 999 \) / 1000`
+ 
+ ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+@@ -6613,6 +6765,10 @@ if test -z "${BUILD_STATIC_TRUE}" && tes
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
+--- elfutils/configure.ac
++++ elfutils/configure.ac
+@@ -99,6 +99,54 @@ CFLAGS="$old_CFLAGS"])
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
+@@ -114,7 +162,10 @@ static __thread int a; int foo (int b) {
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
+@@ -213,6 +264,11 @@ AM_CONDITIONAL(USE_VALGRIND, test "$use_
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
+@@ -324,7 +380,7 @@ case "$eu_version" in
+ esac
+ 
+ # Round up to the next release API (x.y) version.
+-eu_version=$(( (eu_version + 999) / 1000 ))
++eu_version=`expr \( $eu_version + 999 \) / 1000`
+ 
+ AC_CHECK_SIZEOF(long)
+ 
+--- elfutils/lib/ChangeLog
++++ elfutils/lib/ChangeLog
+@@ -61,6 +61,9 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* eu-config.h [! HAVE_BUILTIN_POPCOUNT]
++	(__builtin_popcount): New inline function.
++
+ 	* eu-config.h: Add multiple inclusion protection.
+ 
+ 2009-01-17  Ulrich Drepper  <drepper@redhat.com>
+@@ -117,6 +120,11 @@
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
+--- elfutils/lib/eu-config.h
++++ elfutils/lib/eu-config.h
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
+--- elfutils/lib/Makefile.in
++++ elfutils/lib/Makefile.in
+@@ -82,7 +82,8 @@ host_triplet = @host@
+ DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
+ 	$(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
+ 	$(noinst_HEADERS) ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ subdir = lib
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
+@@ -198,6 +199,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -229,6 +231,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -291,10 +294,9 @@ zip_LIBS = @zip_LIBS@
+ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. \
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
+--- elfutils/libasm/ChangeLog
++++ elfutils/libasm/ChangeLog
+@@ -75,6 +75,11 @@
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
+--- elfutils/libasm/Makefile.in
++++ elfutils/libasm/Makefile.in
+@@ -83,10 +83,11 @@ host_triplet = @host@
+ DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
+ 	$(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
+ 	$(noinst_HEADERS) $(pkginclude_HEADERS) ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ @MUDFLAP_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
+ @MUDFLAP_TRUE@am_libasm_pic_a_OBJECTS =
+-@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_2 = -lpthread
++@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_3 = -lpthread
+ subdir = libasm
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
+@@ -250,6 +251,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -281,6 +283,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -344,10 +347,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
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
+@@ -376,7 +378,7 @@ libasm_a_SOURCES = asm_begin.c asm_abort
+ 
+ @MUDFLAP_FALSE@libasm_pic_a_SOURCES = 
+ @MUDFLAP_FALSE@am_libasm_pic_a_OBJECTS = $(libasm_a_SOURCES:.c=.os)
+-@MUDFLAP_FALSE@libasm_so_LDLIBS = $(am__append_2)
++@MUDFLAP_FALSE@libasm_so_LDLIBS = $(am__append_3)
+ @MUDFLAP_FALSE@libasm_so_SOURCES = 
+ noinst_HEADERS = libasmP.h symbolhash.h
+ EXTRA_DIST = libasm.map
+--- elfutils/libcpu/ChangeLog
++++ elfutils/libcpu/ChangeLog
+@@ -47,6 +47,9 @@
+ 
+ 2009-01-23  Roland McGrath  <roland@redhat.com>
+ 
++	* i386_disasm.c (i386_disasm): Add abort after assert-constant for old
++	compilers that don't realize it's noreturn.
++
+ 	* Makefile.am (i386_parse_CFLAGS): Use quotes around command
+ 	substitution that can produce leading whitespace.
+ 
+@@ -376,6 +379,11 @@
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
+--- elfutils/libcpu/i386_disasm.c
++++ elfutils/libcpu/i386_disasm.c
+@@ -822,6 +822,7 @@ i386_disasm (const uint8_t **startp, con
+ 
+ 			default:
+ 			  assert (! "INVALID not handled");
++			  abort ();
+ 			}
+ 		    }
+ 		  else
+--- elfutils/libcpu/Makefile.in
++++ elfutils/libcpu/Makefile.in
+@@ -84,7 +84,8 @@ DIST_COMMON = $(top_srcdir)/config/eu.am
+ 	$(srcdir)/Makefile.am i386_lex.c i386_parse.c \
+ 	$(top_srcdir)/config/depcomp $(top_srcdir)/config/ylwrap \
+ 	$(am__noinst_HEADERS_DIST) ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ @MAINTAINER_MODE_TRUE@noinst_PROGRAMS = i386_gendis$(EXEEXT)
+ subdir = libcpu
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+@@ -225,6 +226,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = lex.$(<F:lex.l=)
+@@ -256,6 +258,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -319,10 +322,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
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
+--- elfutils/libdw/ChangeLog
++++ elfutils/libdw/ChangeLog
+@@ -346,6 +346,10 @@
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
+@@ -705,6 +709,10 @@
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
+@@ -1473,6 +1481,11 @@
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
+--- elfutils/libdw/dwarf_begin_elf.c
++++ elfutils/libdw/dwarf_begin_elf.c
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
+--- elfutils/libdw/libdw.h
++++ elfutils/libdw/libdw.h
+@@ -879,7 +879,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (
+ 
+ 
+ /* Inline optimizations.  */
+-#ifdef __OPTIMIZE__
++#if defined __OPTIMIZE__ && !(__GNUC__ == 4 && __GNUC_MINOR__ == 2)
+ /* Return attribute code of given attribute.  */
+ __libdw_extern_inline unsigned int
+ dwarf_whatattr (Dwarf_Attribute *attr)
+--- elfutils/libdw/Makefile.in
++++ elfutils/libdw/Makefile.in
+@@ -84,8 +84,9 @@ DIST_COMMON = $(top_srcdir)/config/eu.am
+ 	$(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
+ 	$(include_HEADERS) $(noinst_HEADERS) $(pkginclude_HEADERS) \
+ 	ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
+-@BUILD_STATIC_TRUE@am__append_2 = -fpic
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
++@BUILD_STATIC_TRUE@am__append_3 = -fpic
+ @MUDFLAP_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
+ @MUDFLAP_TRUE@am_libdw_pic_a_OBJECTS =
+ subdir = libdw
+@@ -295,6 +296,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -326,6 +328,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -388,10 +391,9 @@ zip_LIBS = @zip_LIBS@
+ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. \
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
+--- elfutils/libdwfl/ChangeLog
++++ elfutils/libdwfl/ChangeLog
+@@ -283,6 +283,21 @@
+ 	(dwfl_module_addrsym) (i_to_symfile): New function.
+ 	(dwfl_module_addrsym) (search_table): Use it.
+ 
++2013-11-09  Jan Kratochvil  <jan.kratochvil@redhat.com>
++
++	Older OS compatibility bits.
++	* linux-core-attach.c (be64toh, le64toh, be32toh, le32toh): Provide
++	fallbacks if not defined by system.
++
++2013-11-09  Jan Kratochvil  <jan.kratochvil@redhat.com>
++
++	Handle T-stopped detach for old kernels.
++	* linux-pid-attach.c (struct pid_arg): New field stopped.
++	(ptrace_attach): New parameter stoppedp.  Set it appropriately.
++	(pid_set_initial_registers): Pass the new field.
++	(pid_thread_detach): Handle the case of STOPPED for old kernels.
++	(__libdwfl_attach_state_for_pid): Initialize STOPPED.
++
+ 2013-11-07  Jan Kratochvil  <jan.kratochvil@redhat.com>
+ 	    Mark Wielaard  <mjw@redhat.com>
+ 
+@@ -2048,6 +2063,11 @@
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
+--- elfutils/libdwfl/linux-core-attach.c
++++ elfutils/libdwfl/linux-core-attach.c
+@@ -29,6 +29,35 @@
+ #include "libdwflP.h"
+ #include <fcntl.h>
+ #include "system.h"
++#include <endian.h>
++#include <byteswap.h>
++#if __BYTE_ORDER == __LITTLE_ENDIAN
++# ifndef be64toh
++#  define be64toh(x) bswap_64 (x)
++# endif
++# ifndef le64toh
++#  define le64toh(x) (x)
++# endif
++# ifndef be32toh
++#  define be32toh(x) bswap_32 (x)
++# endif
++# ifndef le32toh
++#  define le32toh(x) (x)
++# endif
++#else
++# ifndef be64toh
++#  define be64toh(x) (x)
++# endif
++# ifndef le64toh
++#  define le64toh(x) bswap_64 (x)
++# endif
++# ifndef be32toh
++#  define be32toh(x) (x)
++# endif
++# ifndef le32toh
++#  define le32toh(x) bswap_32 (x)
++# endif
++#endif
+ 
+ #ifndef MIN
+ # define MIN(a, b) ((a) < (b) ? (a) : (b))
+--- elfutils/libdwfl/linux-pid-attach.c
++++ elfutils/libdwfl/linux-pid-attach.c
+@@ -268,13 +268,24 @@ pid_thread_detach (Dwfl_Thread *thread,
+   pid_arg->tid_attached = 0;
+   if (! pid_arg->assume_ptrace_stopped)
+     {
++      // Older kernels (tested kernel-2.6.18-348.12.1.el5.x86_64) need special
++      // handling of the detachment to keep the process State: T (stopped).
++      if (pid_arg->tid_was_stopped)
++	syscall (__NR_tkill, tid, SIGSTOP);
+       /* This handling is needed only on older Linux kernels such as
+-         2.6.32-358.23.2.el6.ppc64.  Later kernels such as
+-         3.11.7-200.fc19.x86_64 remember the T (stopped) state
+-         themselves and no longer need to pass SIGSTOP during
+-         PTRACE_DETACH.  */
++         2.6.32-358.23.2.el6.ppc64.  Later kernels such as 3.11.7-200.fc19.x86_64
++         remember the T (stopped) state themselves and no longer need to pass
++         SIGSTOP during PTRACE_DETACH.  */
+       ptrace (PTRACE_DETACH, tid, NULL,
+ 	      (void *) (intptr_t) (pid_arg->tid_was_stopped ? SIGSTOP : 0));
++      if (pid_arg->tid_was_stopped)
++	{
++	  // Wait till the SIGSTOP settles down.
++	  int i;
++	  for (i = 0; i < 100000; i++)
++	    if (linux_proc_pid_is_stopped (tid))
++	      break;
++	}
+     }
+ }
+ 
+--- elfutils/libdwfl/Makefile.in
++++ elfutils/libdwfl/Makefile.in
+@@ -82,11 +82,12 @@ host_triplet = @host@
+ DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
+ 	$(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
+ 	$(noinst_HEADERS) $(pkginclude_HEADERS) ChangeLog
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
+@@ -289,6 +290,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -320,6 +322,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -383,10 +386,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
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
+@@ -394,7 +396,7 @@ COMPILE.os = $(filter-out -fprofile-arcs
+ 
+ CLEANFILES = *.gcno *.gcda $(am_libdwfl_pic_a_OBJECTS)
+ textrel_check = if $(READELF) -d $@ | fgrep -q TEXTREL; then exit 1; fi
+-noinst_LIBRARIES = libdwfl.a $(am__append_2)
++noinst_LIBRARIES = libdwfl.a $(am__append_3)
+ pkginclude_HEADERS = libdwfl.h
+ libdwfl_a_SOURCES = dwfl_begin.c dwfl_end.c dwfl_error.c \
+ 	dwfl_version.c dwfl_module.c dwfl_report_elf.c relocate.c \
+@@ -417,8 +419,8 @@ libdwfl_a_SOURCES = dwfl_begin.c dwfl_en
+ 	dwfl_module_register_names.c dwfl_segment_report_module.c \
+ 	link_map.c core-file.c open.c image-header.c dwfl_frame.c \
+ 	frame_unwind.c dwfl_frame_pc.c linux-pid-attach.c \
+-	linux-core-attach.c dwfl_frame_regs.c $(am__append_3) \
+-	$(am__append_4) $(am__append_5)
++	linux-core-attach.c dwfl_frame_regs.c $(am__append_4) \
++	$(am__append_5) $(am__append_6)
+ @MUDFLAP_FALSE@libdwfl = $(libdw)
+ @MUDFLAP_TRUE@libdwfl = libdwfl.a $(libdw) $(libebl) $(libelf) $(libeu)
+ @MUDFLAP_FALSE@libdw = ../libdw/libdw.so
+--- elfutils/libebl/ChangeLog
++++ elfutils/libebl/ChangeLog
+@@ -738,6 +738,11 @@
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
+--- elfutils/libebl/Makefile.in
++++ elfutils/libebl/Makefile.in
+@@ -82,7 +82,8 @@ host_triplet = @host@
+ DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
+ 	$(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
+ 	$(noinst_HEADERS) $(pkginclude_HEADERS) ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ subdir = libebl
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
+@@ -249,6 +250,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -280,6 +282,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -343,10 +346,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
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
+--- elfutils/libelf/ChangeLog
++++ elfutils/libelf/ChangeLog
+@@ -85,6 +85,11 @@
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
+@@ -762,6 +767,11 @@
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
+--- elfutils/libelf/common.h
++++ elfutils/libelf/common.h
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
+--- elfutils/libelf/gnuhash_xlate.h
++++ elfutils/libelf/gnuhash_xlate.h
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
+--- elfutils/libelf/Makefile.in
++++ elfutils/libelf/Makefile.in
+@@ -84,11 +84,12 @@ DIST_COMMON = $(top_srcdir)/config/eu.am
+ 	$(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
+ 	$(include_HEADERS) $(noinst_HEADERS) $(pkginclude_HEADERS) \
+ 	ChangeLog
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
+ am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
+@@ -293,6 +294,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -324,6 +326,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = 1
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -385,10 +388,9 @@ top_srcdir = @top_srcdir@
+ zip_LIBS = @zip_LIBS@
+ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
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
+@@ -453,7 +455,7 @@ libelf_a_SOURCES = elf_version.c elf_has
+ 
+ @MUDFLAP_FALSE@libelf_pic_a_SOURCES = 
+ @MUDFLAP_FALSE@am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
+-@MUDFLAP_FALSE@libelf_so_LDLIBS = $(am__append_3)
++@MUDFLAP_FALSE@libelf_so_LDLIBS = $(am__append_4)
+ @MUDFLAP_FALSE@libelf_so_SOURCES = 
+ noinst_HEADERS = elf.h abstract.h common.h exttypes.h gelf_xlate.h libelfP.h \
+ 		 version_xlate.h gnuhash_xlate.h note_xlate.h dl-hash.h
+--- elfutils/m4/Makefile.in
++++ elfutils/m4/Makefile.in
+@@ -145,6 +145,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -176,6 +177,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+--- elfutils/Makefile.in
++++ elfutils/Makefile.in
+@@ -263,6 +263,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -294,6 +295,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+--- elfutils/src/addr2line.c
++++ elfutils/src/addr2line.c
+@@ -540,10 +540,10 @@ handle_address (const char *string, Dwfl
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
+--- elfutils/src/ChangeLog
++++ elfutils/src/ChangeLog
+@@ -964,8 +964,16 @@
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
+@@ -1129,6 +1137,8 @@
+ 	* readelf.c (print_debug_frame_section): Use t instead of j formats
+ 	for ptrdiff_t OFFSET.
+ 
++	* addr2line.c (handle_address): Use %a instead of %m for compatibility.
++
+ 2009-01-21  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* elflint.c (check_program_header): Fix typo in .eh_frame_hdr section
+@@ -1312,6 +1322,11 @@
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
+@@ -1563,6 +1578,8 @@
+ 
+ 	* readelf.c (hex_dump): Fix rounding error in whitespace calculation.
+ 
++	* Makefile.am (readelf_no_Werror): New variable.
++
+ 2007-10-15  Roland McGrath  <roland@redhat.com>
+ 
+ 	* make-debug-archive.in: New file.
+@@ -2002,6 +2019,10 @@
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
+@@ -2078,6 +2099,10 @@
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
+@@ -2426,6 +2451,11 @@
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
+--- elfutils/src/findtextrel.c
++++ elfutils/src/findtextrel.c
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
+--- elfutils/src/ld.h
++++ elfutils/src/ld.h
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
+--- elfutils/src/Makefile.am
++++ elfutils/src/Makefile.am
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
+--- elfutils/src/Makefile.in
++++ elfutils/src/Makefile.in
+@@ -85,7 +85,8 @@ DIST_COMMON = $(top_srcdir)/config/eu.am
+ 	$(srcdir)/Makefile.am ldlex.c ldscript.c \
+ 	$(top_srcdir)/config/depcomp $(top_srcdir)/config/ylwrap \
+ 	$(noinst_HEADERS) ChangeLog
+-@MUDFLAP_TRUE@am__append_1 = -fmudflap
++@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
++@MUDFLAP_TRUE@am__append_2 = -fmudflap
+ bin_PROGRAMS = readelf$(EXEEXT) nm$(EXEEXT) size$(EXEEXT) \
+ 	strip$(EXEEXT) ld$(EXEEXT) elflint$(EXEEXT) \
+ 	findtextrel$(EXEEXT) addr2line$(EXEEXT) elfcmp$(EXEEXT) \
+@@ -94,9 +95,9 @@ bin_PROGRAMS = readelf$(EXEEXT) nm$(EXEE
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
+@@ -164,7 +165,7 @@ am_ld_OBJECTS = ld.$(OBJEXT) ldgeneric.$
+ 	versionhash.$(OBJEXT)
+ ld_OBJECTS = $(am_ld_OBJECTS)
+ ld_DEPENDENCIES = $(libebl) $(libelf) $(libeu) $(am__DEPENDENCIES_1) \
+-	$(am__append_3)
++	$(am__append_4)
+ ld_LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(ld_LDFLAGS) $(LDFLAGS) -o \
+ 	$@
+ am_libld_elf_i386_so_OBJECTS =
+@@ -347,6 +348,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -378,6 +380,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -442,10 +445,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
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
+@@ -461,8 +463,8 @@ AM_LFLAGS = -Pld -olex.yy.c
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
+@@ -491,6 +493,9 @@ strings_no_Wformat = yes
+ addr2line_no_Wformat = yes
+ # XXX While the file is not finished, don't warn about this
+ ldgeneric_no_Wunused = yes
++
++# Buggy old compilers.
++readelf_no_Werror = yes
+ readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
+ 	   $(demanglelib)
+@@ -498,7 +503,7 @@ nm_LDADD = $(libdw) $(libebl) $(libelf)
+ size_LDADD = $(libelf) $(libeu) $(libmudflap)
+ strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
+-	$(am__append_3)
++	$(am__append_4)
+ ld_LDFLAGS = -rdynamic
+ elflint_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+ findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap)
+--- elfutils/src/readelf.c
++++ elfutils/src/readelf.c
+@@ -4171,10 +4171,12 @@ listptr_base (struct listptr *p)
+   return base;
+ }
+ 
++static const char *listptr_name;
++
+ static int
+-compare_listptr (const void *a, const void *b, void *arg)
++compare_listptr (const void *a, const void *b)
+ {
+-  const char *name = arg;
++  const char *const name = listptr_name;
+   struct listptr *p1 = (void *) a;
+   struct listptr *p2 = (void *) b;
+ 
+@@ -4263,8 +4265,11 @@ static void
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
+@@ -9151,7 +9156,7 @@ dump_archive_index (Elf *elf, const char
+ 	  if (unlikely (elf_rand (elf, as_off) == 0)
+ 	      || unlikely ((subelf = elf_begin (-1, ELF_C_READ_MMAP, elf))
+ 			   == NULL))
+-#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 7)
++#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 7) || __GNUC__ < 4
+ 	    while (1)
+ #endif
+ 	      error (EXIT_FAILURE, 0,
+--- elfutils/src/strings.c
++++ elfutils/src/strings.c
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
+--- elfutils/src/strip.c
++++ elfutils/src/strip.c
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
+@@ -2060,7 +2076,7 @@ while computing checksum for debug infor
+   /* If requested, preserve the timestamp.  */
+   if (tvp != NULL)
+     {
+-      if (futimes (fd, tvp) != 0)
++      if (FUTIMES (fd, output_fname, tvp) != 0)
+ 	{
+ 	  error (0, errno, gettext ("\
+ cannot set access and modification date of '%s'"),
+@@ -2117,7 +2133,7 @@ handle_ar (int fd, Elf *elf, const char
+ 
+   if (tvp != NULL)
+     {
+-      if (unlikely (futimes (fd, tvp) != 0))
++      if (unlikely (FUTIMES (fd, fname, tvp) != 0))
+ 	{
+ 	  error (0, errno, gettext ("\
+ cannot set access and modification date of '%s'"), fname);
+--- elfutils/tests/backtrace.c
++++ elfutils/tests/backtrace.c
+@@ -36,6 +36,7 @@
+ #include <fcntl.h>
+ #include <string.h>
+ #include <argp.h>
++#include <sys/syscall.h>
+ #include ELFUTILS_HEADER(dwfl)
+ 
+ static int
+--- elfutils/tests/ChangeLog
++++ elfutils/tests/ChangeLog
+@@ -123,6 +123,13 @@
+ 
+ 2013-12-02  Jan Kratochvil  <jan.kratochvil@redhat.com>
+ 
++	Handle T-stopped detach for old kernels.
++	* backtrace.c: Include sys/syscall.h.
++	(linux_proc_pid_is_stopped): New function.
++	(ptrace_detach_stopped): Handle old kernels.
++
++2013-12-02  Jan Kratochvil  <jan.kratochvil@redhat.com>
++
+ 	* Makefile.am (check_PROGRAMS): Add backtrace, backtrace-child,
+ 	backtrace-data and backtrace-dwarf.
+ 	(BUILT_SOURCES, clean-local, backtrace-child-biarch): New.
+@@ -987,6 +994,8 @@
+ 
+ 2008-01-21  Roland McGrath  <roland@redhat.com>
+ 
++	* line2addr.c (main): Revert last change.
++
+ 	* testfile45.S.bz2: Add tests for cltq, cqto.
+ 	* testfile45.expect.bz2: Adjust.
+ 
+@@ -1695,6 +1704,11 @@
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
+--- elfutils/tests/line2addr.c
++++ elfutils/tests/line2addr.c
+@@ -124,7 +124,7 @@ main (int argc, char *argv[])
+     {
+       struct args a = { .arg = argv[cnt] };
+ 
+-      switch (sscanf (a.arg, "%m[^:]:%d", &a.file, &a.line))
++      switch (sscanf (a.arg, "%a[^:]:%d", &a.file, &a.line))
+ 	{
+ 	default:
+ 	case 0:
+--- elfutils/tests/Makefile.in
++++ elfutils/tests/Makefile.in
+@@ -80,14 +80,15 @@ host_triplet = @host@
+ DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
+ 	$(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
+ 	$(top_srcdir)/config/test-driver ChangeLog
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
+@@ -111,7 +112,7 @@ check_PROGRAMS = arextract$(EXEEXT) arsy
+ 	varlocs$(EXEEXT) backtrace$(EXEEXT) backtrace-child$(EXEEXT) \
+ 	backtrace-data$(EXEEXT) backtrace-dwarf$(EXEEXT) \
+ 	$(am__EXEEXT_1) $(am__EXEEXT_2) $(am__EXEEXT_4)
+-@BIARCH_TRUE@am__append_5 = backtrace-child-biarch
++@BIARCH_TRUE@am__append_6 = backtrace-child-biarch
+ TESTS = run-arextract.sh run-arsymtest.sh newfile$(EXEEXT) \
+ 	test-nlist$(EXEEXT) update1$(EXEEXT) update2$(EXEEXT) \
+ 	update3$(EXEEXT) update4$(EXEEXT) run-show-die-info.sh \
+@@ -151,14 +152,14 @@ TESTS = run-arextract.sh run-arsymtest.s
+ 	run-backtrace-native-core-biarch.sh \
+ 	run-backtrace-core-x86_64.sh run-backtrace-core-i386.sh \
+ 	run-backtrace-core-ppc.sh run-backtrace-core-s390x.sh \
+-	run-backtrace-core-s390.sh $(am__EXEEXT_2) $(am__append_8) \
+-	$(am__EXEEXT_4) $(am__append_11)
+-@STANDALONE_FALSE@am__append_6 = msg_tst md5-sha1-test
++	run-backtrace-core-s390.sh $(am__EXEEXT_2) $(am__append_9) \
++	$(am__EXEEXT_4) $(am__append_12)
+ @STANDALONE_FALSE@am__append_7 = msg_tst md5-sha1-test
+-@LZMA_TRUE@am__append_8 = run-readelf-s.sh run-dwflsyms.sh
+-@HAVE_LIBASM_TRUE@am__append_9 = $(asm_TESTS)
++@STANDALONE_FALSE@am__append_8 = msg_tst md5-sha1-test
++@LZMA_TRUE@am__append_9 = run-readelf-s.sh run-dwflsyms.sh
+ @HAVE_LIBASM_TRUE@am__append_10 = $(asm_TESTS)
+-@ENABLE_DWZ_TRUE@am__append_11 = run-readelf-dwz-multi.sh run-allfcts-multi.sh
++@HAVE_LIBASM_TRUE@am__append_11 = $(asm_TESTS)
++@ENABLE_DWZ_TRUE@am__append_12 = run-readelf-dwz-multi.sh run-allfcts-multi.sh
+ subdir = tests
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
+@@ -780,6 +781,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
+ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LDFLAGS = @LDFLAGS@
++LD_AS_NEEDED = @LD_AS_NEEDED@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
+@@ -811,6 +813,7 @@ SHELL = @SHELL@
+ STRIP = @STRIP@
+ USE_NLS = @USE_NLS@
+ VERSION = @VERSION@
++WEXTRA = @WEXTRA@
+ XGETTEXT = @XGETTEXT@
+ XGETTEXT_015 = @XGETTEXT_015@
+ XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
+@@ -870,12 +873,11 @@ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+ zip_LIBS = @zip_LIBS@
+-AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. $(am__append_2)
++AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. $(am__append_3)
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
+@@ -885,7 +887,7 @@ CLEANFILES = *.gcno *.gcda
+ textrel_check = if $(READELF) -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ @MUDFLAP_FALSE@BUILD_RPATH = \$$ORIGIN/../libasm:\$$ORIGIN/../libdw:\$$ORIGIN/../backends:\$$ORIGIN/../libelf
+ @MUDFLAP_TRUE@BUILD_RPATH = \$$ORIGIN/../backends
+-AM_LDFLAGS = $(am__append_3) $(am__append_4)
++AM_LDFLAGS = $(am__append_4) $(am__append_5)
+ @TESTS_RPATH_FALSE@tests_rpath = no
+ @TESTS_RPATH_TRUE@tests_rpath = yes
+ asm_TESTS = asm-tst1 asm-tst2 asm-tst3 asm-tst4 asm-tst5 \
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff
new file mode 100644
index 0000000..f358a85
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff
@@ -0,0 +1,1756 @@
+--- elfutils/libdwfl/ChangeLog
++++ elfutils/libdwfl/ChangeLog
+@@ -680,6 +680,11 @@
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
+@@ -456,7 +456,10 @@ relocate_section (Dwfl_Module *mod, Elf
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
+@@ -558,7 +561,7 @@ relocate_section (Dwfl_Module *mod, Elf
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
+@@ -754,10 +754,53 @@
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
+@@ -183,6 +183,9 @@ elf_getarsym (elf, ptr)
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
+@@ -702,6 +702,12 @@
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
+@@ -2414,6 +2420,16 @@
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
+@@ -2459,6 +2475,19 @@
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
+@@ -1040,9 +1050,11 @@ is_rel_dyn (Ebl *ebl, const GElf_Ehdr *e
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
+@@ -1052,7 +1064,9 @@ is_rel_dyn (Ebl *ebl, const GElf_Ehdr *e
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
+@@ -1066,7 +1080,9 @@ section [%2d] '%s': DT_RELCOUNT used for
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
+@@ -1226,7 +1242,8 @@ section [%2d] '%s': no relocations for m
+ 	}
+     }
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext (reltype == ELF_T_RELA ? "\
+ section [%2d] '%s': section entry size does not match ElfXX_Rela\n" : "\
+ section [%2d] '%s': section entry size does not match ElfXX_Rel\n"),
+@@ -1449,7 +1466,8 @@ check_rela (Ebl *ebl, GElf_Ehdr *ehdr, G
+   Elf_Data *symdata = elf_getdata (symscn, NULL);
+   enum load_state state = state_undecided;
+ 
+-  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
++  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Rela rela_mem;
+       GElf_Rela *rela = gelf_getrela (data, cnt, &rela_mem);
+@@ -1499,7 +1517,8 @@ check_rel (Ebl *ebl, GElf_Ehdr *ehdr, GE
+   Elf_Data *symdata = elf_getdata (symscn, NULL);
+   enum load_state state = state_undecided;
+ 
+-  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
++  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Rel rel_mem;
+       GElf_Rel *rel = gelf_getrel (data, cnt, &rel_mem);
+@@ -1598,7 +1617,8 @@ section [%2d] '%s': referenced as string
+ 	   shdr->sh_link, section_name (ebl, shdr->sh_link),
+ 	   idx, section_name (ebl, idx));
+ 
+-  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT))
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT);
++  if (shdr->sh_entsize != sh_entsize)
+     ERROR (gettext ("\
+ section [%2d] '%s': section entry size does not match ElfXX_Dyn\n"),
+ 	   idx, section_name (ebl, idx));
+@@ -1608,7 +1628,7 @@ section [%2d] '%s': section entry size d
+ 	   idx, section_name (ebl, idx));
+ 
+   bool non_null_warned = false;
+-  for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
++  for (cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
+     {
+       GElf_Dyn dyn_mem;
+       GElf_Dyn *dyn = gelf_getdyn (data, cnt, &dyn_mem);
+@@ -1880,6 +1900,8 @@ section [%2d] '%s': entry size does not
+ 	   idx, section_name (ebl, idx));
+ 
+   if (symshdr != NULL
++      && shdr->sh_entsize
++      && symshdr->sh_entsize
+       && (shdr->sh_size / shdr->sh_entsize
+ 	  < symshdr->sh_size / symshdr->sh_entsize))
+     ERROR (gettext ("\
+@@ -1906,6 +1928,12 @@ section [%2d] '%s': extended section ind
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
+@@ -1948,7 +1976,7 @@ section [%2d] '%s': hash table section i
+ 
+   size_t maxidx = nchain;
+ 
+-  if (symshdr != NULL)
++  if (symshdr != NULL && symshdr->sh_entsize != 0)
+     {
+       size_t symsize = symshdr->sh_size / symshdr->sh_entsize;
+ 
+@@ -1959,18 +1987,28 @@ section [%2d] '%s': hash table section i
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
+@@ -2000,18 +2038,28 @@ section [%2d] '%s': hash table section i
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
+@@ -2036,7 +2084,7 @@ section [%2d] '%s': bitmask size not pow
+   if (shdr->sh_size < (4 + bitmask_words + nbuckets) * sizeof (Elf32_Word))
+     {
+       ERROR (gettext ("\
+-section [%2d] '%s': hash table section is too small (is %ld, expected at least%ld)\n"),
++section [%2d] '%s': hash table section is too small (is %ld, expected at least %ld)\n"),
+ 	     idx, section_name (ebl, idx), (long int) shdr->sh_size,
+ 	     (long int) ((4 + bitmask_words + nbuckets) * sizeof (Elf32_Word)));
+       return;
+@@ -2708,8 +2756,9 @@ section [%2d] '%s' refers in sh_link to
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
+@@ -1364,6 +1364,8 @@ handle_scngrp (Ebl *ebl, Elf_Scn *scn, G
+   Elf32_Word *grpref = (Elf32_Word *) data->d_buf;
+ 
+   GElf_Sym sym_mem;
++  GElf_Sym *sym = gelf_getsym (symdata, shdr->sh_info, &sym_mem);
++
+   printf ((grpref[0] & GRP_COMDAT)
+ 	  ? ngettext ("\
+ \nCOMDAT section group [%2zu] '%s' with signature '%s' contains %zu entry:\n",
+@@ -1376,8 +1378,8 @@ handle_scngrp (Ebl *ebl, Elf_Scn *scn, G
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
+@@ -1528,10 +1530,12 @@ static void
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
+@@ -1543,21 +1547,26 @@ handle_dynamic (Ebl *ebl, Elf_Scn *scn,
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
+@@ -1706,7 +1715,8 @@ static void
+ handle_relocs_rel (Ebl *ebl, GElf_Ehdr *ehdr, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  int nentries = shdr->sh_size / shdr->sh_entsize;
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
++  int nentries = shdr->sh_size / sh_entsize;
+ 
+   /* Get the data of the section.  */
+   Elf_Data *data = elf_getdata (scn, NULL);
+@@ -1892,7 +1902,8 @@ static void
+ handle_relocs_rela (Ebl *ebl, GElf_Ehdr *ehdr, Elf_Scn *scn, GElf_Shdr *shdr)
+ {
+   int class = gelf_getclass (ebl->elf);
+-  int nentries = shdr->sh_size / shdr->sh_entsize;
++  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
++  int nentries = shdr->sh_size / sh_entsize;
+ 
+   /* Get the data of the section.  */
+   Elf_Data *data = elf_getdata (scn, NULL);
+@@ -2139,6 +2150,13 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, G
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
+@@ -2149,15 +2167,12 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, G
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
+@@ -2393,7 +2408,13 @@ handle_verneed (Ebl *ebl, Elf_Scn *scn,
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
+@@ -2404,9 +2425,7 @@ handle_verneed (Ebl *ebl, Elf_Scn *scn,
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
+@@ -2459,8 +2478,14 @@ handle_verdef (Ebl *ebl, Elf_Scn *scn, G
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
+@@ -2472,9 +2497,7 @@ handle_verdef (Ebl *ebl, Elf_Scn *scn, G
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
+@@ -2736,25 +2759,30 @@ handle_versym (Ebl *ebl, Elf_Scn *scn, G
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
+@@ -2803,7 +2831,17 @@ print_hash_info (Ebl *ebl, Elf_Scn *scn,
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
+@@ -2816,9 +2854,7 @@ print_hash_info (Ebl *ebl, Elf_Scn *scn,
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
+@@ -3078,7 +3114,8 @@ print_liblist (Ebl *ebl)
+ 
+       if (shdr != NULL && shdr->sh_type == SHT_GNU_LIBLIST)
+ 	{
+-	  int nentries = shdr->sh_size / shdr->sh_entsize;
++	  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_LIB, 1, EV_CURRENT);
++	  int nentries = shdr->sh_size / sh_entsize;
+ 	  printf (ngettext ("\
+ \nLibrary list section [%2zu] '%s' at offset %#0" PRIx64 " contains %d entry:\n",
+ 			    "\
+@@ -4398,6 +4435,16 @@ print_decoded_aranges_section (Ebl *ebl,
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
+@@ -565,6 +565,11 @@ handle_elf (int fd, Elf *elf, const char
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
+@@ -586,7 +591,7 @@ handle_elf (int fd, Elf *elf, const char
+     {
+       /* This should always be true (i.e., there should not be any
+ 	 holes in the numbering).  */
+-      assert (elf_ndxscn (scn) == cnt);
++      elf_assert (elf_ndxscn (scn) == cnt);
+ 
+       shdr_info[cnt].scn = scn;
+ 
+@@ -599,6 +604,7 @@ handle_elf (int fd, Elf *elf, const char
+ 					shdr_info[cnt].shdr.sh_name);
+       if (shdr_info[cnt].name == NULL)
+ 	{
++	illformed:
+ 	  error (0, 0, gettext ("illformed file '%s'"), fname);
+ 	  goto fail_close;
+ 	}
+@@ -608,6 +614,8 @@ handle_elf (int fd, Elf *elf, const char
+ 
+       /* Remember the shdr.sh_link value.  */
+       shdr_info[cnt].old_sh_link = shdr_info[cnt].shdr.sh_link;
++      if (shdr_info[cnt].old_sh_link >= shnum)
++	goto illformed;
+ 
+       /* Sections in files other than relocatable object files which
+ 	 are not loaded can be freely moved by us.  In relocatable
+@@ -620,7 +628,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	 appropriate reference.  */
+       if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB_SHNDX))
+ 	{
+-	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
++	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
+ 	  shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx = cnt;
+ 	}
+       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GROUP))
+@@ -637,7 +645,12 @@ handle_elf (int fd, Elf *elf, const char
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
+@@ -648,7 +661,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	}
+       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GNU_versym))
+ 	{
+-	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
++	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
+ 	  shdr_info[shdr_info[cnt].shdr.sh_link].version_idx = cnt;
+ 	}
+ 
+@@ -656,7 +669,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	 discarded right away.  */
+       if ((shdr_info[cnt].shdr.sh_flags & SHF_GROUP) != 0)
+ 	{
+-	  assert (shdr_info[cnt].group_idx != 0);
++	  elf_assert (shdr_info[cnt].group_idx != 0);
+ 
+ 	  if (shdr_info[shdr_info[cnt].group_idx].idx == 0)
+ 	    {
+@@ -732,10 +745,14 @@ handle_elf (int fd, Elf *elf, const char
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
+@@ -779,7 +796,7 @@ handle_elf (int fd, Elf *elf, const char
+ 		  if (shdr_info[cnt].symtab_idx != 0
+ 		      && shdr_info[shdr_info[cnt].symtab_idx].data == NULL)
+ 		    {
+-		      assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
++		      elf_assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
+ 
+ 		      shdr_info[shdr_info[cnt].symtab_idx].data
+ 			= elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
+@@ -819,6 +836,9 @@ handle_elf (int fd, Elf *elf, const char
+ 		      else if (scnidx == SHN_XINDEX)
+ 			scnidx = xndx;
+ 
++		      if (scnidx >= shnum)
++			goto illformed;
++
+ 		      if (shdr_info[scnidx].idx == 0)
+ 			/* This symbol table has a real symbol in
+ 			   a discarded section.  So preserve the
+@@ -849,12 +869,16 @@ handle_elf (int fd, Elf *elf, const char
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
+@@ -995,7 +1019,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	  error (EXIT_FAILURE, 0, gettext ("while generating output file: %s"),
+ 		 elf_errmsg (-1));
+ 
+-	assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
++	elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
+ 
+ 	/* Add this name to the section header string table.  */
+ 	shdr_info[cnt].se = ebl_strtabadd (shst, shdr_info[cnt].name, 0);
+@@ -1032,7 +1056,7 @@ handle_elf (int fd, Elf *elf, const char
+ 	error (EXIT_FAILURE, 0,
+ 	       gettext ("while create section header section: %s"),
+ 	       elf_errmsg (-1));
+-      assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
++      elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
+ 
+       shdr_info[cnt].data = elf_newdata (shdr_info[cnt].newscn);
+       if (shdr_info[cnt].data == NULL)
+@@ -1089,7 +1113,7 @@ handle_elf (int fd, Elf *elf, const char
+     error (EXIT_FAILURE, 0,
+ 	   gettext ("while create section header section: %s"),
+ 	   elf_errmsg (-1));
+-  assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
++  elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
+ 
+   /* Finalize the string table and fill in the correct indices in the
+      section headers.  */
+@@ -1179,20 +1203,20 @@ handle_elf (int fd, Elf *elf, const char
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
+@@ -1247,7 +1271,7 @@ handle_elf (int fd, Elf *elf, const char
+ 		      sec = shdr_info[sym->st_shndx].idx;
+ 		    else
+ 		      {
+-			assert (shndxdata != NULL);
++			elf_assert (shndxdata != NULL);
+ 
+ 			sec = shdr_info[xshndx].idx;
+ 		      }
+@@ -1268,7 +1292,7 @@ handle_elf (int fd, Elf *elf, const char
+ 			    nxshndx = sec;
+ 			  }
+ 
+-			assert (sec < SHN_LORESERVE || shndxdata != NULL);
++			elf_assert (sec < SHN_LORESERVE || shndxdata != NULL);
+ 
+ 			if ((inner != destidx || nshndx != sym->st_shndx
+ 			     || (shndxdata != NULL && nxshndx != xshndx))
+@@ -1295,9 +1319,11 @@ handle_elf (int fd, Elf *elf, const char
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
+@@ -1485,11 +1511,11 @@ handle_elf (int fd, Elf *elf, const char
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
+@@ -1508,8 +1534,8 @@ handle_elf (int fd, Elf *elf, const char
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
+@@ -1539,11 +1565,11 @@ handle_elf (int fd, Elf *elf, const char
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
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/scanf-format.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/scanf-format.patch
new file mode 100644
index 0000000..c08519c
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/scanf-format.patch
@@ -0,0 +1,40 @@
+From: Kurt Roeckx <kurt@roeckx.be>
+Subject: Use %m[ instead of %a[ in scanf()
+
+%a was a gnu extention, but C99 made this a float.  So it got
+changed to %m (supported by glibc 2.7), but %a[ and %as are
+still supported by glibc.  The portability branch changed this
+from %m to %a again since that's supported by more versions of
+glibc.  However gcc gives a warning about this using -Wformat
+and we have a new enough libc to use %m.
+
+Index: elfutils-0.153/src/addr2line.c
+===================================================================
+--- elfutils-0.153.orig/src/addr2line.c	2012-02-24 22:29:50.000000000 +0000
++++ elfutils-0.153/src/addr2line.c	2012-02-24 22:29:52.000000000 +0000
+@@ -455,10 +455,10 @@
+       bool parsed = false;
+       int i, j;
+       char *name = NULL;
+-      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
++      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
+ 	  && string[i] == '\0')
+ 	parsed = adjust_to_section (name, &addr, dwfl);
+-      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
++      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
+ 	{
+ 	default:
+ 	  break;
+Index: elfutils-0.153/tests/line2addr.c
+===================================================================
+--- elfutils-0.153.orig/tests/line2addr.c	2012-02-24 22:29:50.000000000 +0000
++++ elfutils-0.153/tests/line2addr.c	2012-02-24 22:29:52.000000000 +0000
+@@ -132,7 +132,7 @@
+     {
+       struct args a = { .arg = argv[cnt] };
+ 
+-      switch (sscanf (a.arg, "%a[^:]:%d", &a.file, &a.line))
++      switch (sscanf (a.arg, "%m[^:]:%d", &a.file, &a.line))
+ 	{
+ 	default:
+ 	case 0:
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/testsuite-ignore-elflint.diff
new file mode 100644
index 0000000..eae5796
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/testsuite-ignore-elflint.diff
@@ -0,0 +1,39 @@
+On many architectures this test fails because binaries/libs produced by
+binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
+
+So we run the tests on all archs to see what breaks, but if it breaks we ignore
+the result (exitcode 77 means: this test was skipped).
+
+Index: elfutils-0.156/tests/run-elflint-self.sh
+===================================================================
+--- elfutils-0.156.orig/tests/run-elflint-self.sh	2013-07-28 14:35:36.000000000 +0200
++++ elfutils-0.156/tests/run-elflint-self.sh	2013-07-28 14:36:10.000000000 +0200
+@@ -18,4 +18,4 @@
+ 
+ . $srcdir/test-subr.sh
+ 
+-testrun_on_self ${abs_top_builddir}/src/elflint --quiet --gnu-ld
++testrun_on_self_skip ${abs_top_builddir}/src/elflint --quiet --gnu-ld
+Index: elfutils-0.156/tests/test-subr.sh
+===================================================================
+--- elfutils-0.156.orig/tests/test-subr.sh	2013-07-28 14:35:36.000000000 +0200
++++ elfutils-0.156/tests/test-subr.sh	2013-07-28 14:35:36.000000000 +0200
+@@ -149,3 +149,18 @@
+   # Only exit if something failed
+   if test $exit_status != 0; then exit $exit_status; fi
+ }
++
++# Same as testrun_on_self(), but skip on failure.
++testrun_on_self_skip()
++{
++  exit_status=0
++
++  for file in $self_test_files; do
++      testrun $* $file \
++	  || { echo "*** failure in $* $file"; exit_status=77; }
++  done
++
++  # Only exit if something failed
++  if test $exit_status != 0; then exit $exit_status; fi
++}
++
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch
new file mode 100644
index 0000000..870ec23
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch
@@ -0,0 +1,256 @@
+From 02cefdaa6429e620d6457fdb3ad9934f194c5a93 Mon Sep 17 00:00:00 2001
+From: Kurt Roeckx <kurt@roeckx.be>
+Date: Tue, 22 Apr 2014 21:46:22 +0200
+Subject: [PATCH] Unwinding is only supported on Linux
+
+Index: elfutils-0.158/backends/i386_initreg.c
+===================================================================
+--- elfutils-0.158.orig/backends/i386_initreg.c	2014-05-01 17:11:18.870616302 +0000
++++ elfutils-0.158/backends/i386_initreg.c	2014-05-01 17:11:18.866616384 +0000
+@@ -44,7 +44,7 @@
+ 			  ebl_tid_registers_t *setfunc __attribute__ ((unused)),
+ 				void *arg __attribute__ ((unused)))
+ {
+-#if !defined __i386__ && !defined __x86_64__
++#if (!defined __i386__ && !defined __x86_64__) || !defined(__linux__)
+   return false;
+ #else /* __i386__ || __x86_64__ */
+   struct user_regs_struct user_regs;
+Index: elfutils-0.158/backends/x86_64_initreg.c
+===================================================================
+--- elfutils-0.158.orig/backends/x86_64_initreg.c	2014-05-01 17:11:18.870616302 +0000
++++ elfutils-0.158/backends/x86_64_initreg.c	2014-05-01 17:11:18.866616384 +0000
+@@ -44,7 +44,7 @@
+ 			  ebl_tid_registers_t *setfunc __attribute__ ((unused)),
+ 				  void *arg __attribute__ ((unused)))
+ {
+-#ifndef __x86_64__
++#if !defined(__x86_64__) || !defined(__linux__)
+   return false;
+ #else /* __x86_64__ */
+   struct user_regs_struct user_regs;
+Index: elfutils-0.158/libdwfl/linux-pid-attach.c
+===================================================================
+--- elfutils-0.158.orig/libdwfl/linux-pid-attach.c	2014-05-01 17:11:18.870616302 +0000
++++ elfutils-0.158/libdwfl/linux-pid-attach.c	2014-05-01 17:12:47.980766442 +0000
+@@ -37,6 +37,8 @@
+ # define MAX(a, b) ((a) > (b) ? (a) : (b))
+ #endif
+ 
++#ifdef __linux__
++
+ struct pid_arg
+ {
+   DIR *dir;
+@@ -358,3 +360,87 @@
+   return 0;
+ }
+ INTDEF (dwfl_linux_proc_attach)
++
++#else	/* __linux__ */
++
++static pid_t
++pid_next_thread (Dwfl *dwfl __attribute__ ((unused)),
++	         void *dwfl_arg __attribute__ ((unused)),
++		 void **thread_argp __attribute__ ((unused)))
++{
++  errno = ENOSYS;
++  __libdwfl_seterrno (DWFL_E_ERRNO);
++  return -1;
++}
++
++static bool
++pid_getthread (Dwfl *dwfl __attribute__ ((unused)),
++	       pid_t tid __attribute__ ((unused)),
++	       void *dwfl_arg __attribute__ ((unused)),
++	       void **thread_argp __attribute__ ((unused)))
++{
++  errno = ENOSYS;
++  __libdwfl_seterrno (DWFL_E_ERRNO);
++  return false;
++}
++
++static bool
++pid_memory_read (Dwfl *dwfl __attribute__ ((unused)),
++                 Dwarf_Addr addr __attribute__ ((unused)),
++	         Dwarf_Word *result __attribute__ ((unused)),
++	         void *arg __attribute__ ((unused)))
++{
++  errno = ENOSYS;
++  __libdwfl_seterrno (DWFL_E_ERRNO);
++  return false;
++}
++
++static bool
++pid_set_initial_registers (Dwfl_Thread *thread __attribute__ ((unused)),
++			   void *thread_arg __attribute__ ((unused)))
++{
++  errno = ENOSYS;
++  __libdwfl_seterrno (DWFL_E_ERRNO);
++  return false;
++}
++
++static void
++pid_detach (Dwfl *dwfl __attribute__ ((unused)),
++	    void *dwfl_arg __attribute__ ((unused)))
++{
++}
++
++static void
++pid_thread_detach (Dwfl_Thread *thread __attribute__ ((unused)),
++		  void *thread_arg __attribute__ ((unused)))
++{
++}
++
++static const Dwfl_Thread_Callbacks pid_thread_callbacks =
++{
++  pid_next_thread,
++  pid_getthread,
++  pid_memory_read,
++  pid_set_initial_registers,
++  pid_detach,
++  pid_thread_detach,
++};
++
++int
++dwfl_linux_proc_attach (Dwfl *dwfl __attribute__ ((unused)),
++			pid_t pid __attribute__ ((unused)),
++			bool assume_ptrace_stopped __attribute__ ((unused)))
++{
++  return ENOSYS;
++}
++INTDEF (dwfl_linux_proc_attach)
++
++struct __libdwfl_pid_arg *
++internal_function
++__libdwfl_get_pid_arg (Dwfl *dwfl __attribute__ ((unused)))
++{
++  return NULL;
++}
++
++#endif /* ! __linux __ */
++
+Index: elfutils-0.158/tests/backtrace-child.c
+===================================================================
+--- elfutils-0.158.orig/tests/backtrace-child.c	2014-05-01 17:11:18.870616302 +0000
++++ elfutils-0.158/tests/backtrace-child.c	2014-05-01 17:11:18.866616384 +0000
+@@ -79,6 +79,18 @@
+ #include <stdio.h>
+ #include <unistd.h>
+ 
++#ifndef __linux__
++
++int
++main (int argc __attribute__ ((unused)), char **argv)
++{
++  fprintf (stderr, "%s: Unwinding not supported for this architecture\n",
++           argv[0]);
++  return 77;
++}
++
++#else /* __linux__ */
++
+ #if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5)
+ #define NOINLINE_NOCLONE __attribute__ ((noinline, noclone))
+ #else
+@@ -221,3 +233,6 @@
+   /* Not reached.  */
+   abort ();
+ }
++
++#endif /* ! __linux__ */
++
+Index: elfutils-0.158/tests/backtrace-data.c
+===================================================================
+--- elfutils-0.158.orig/tests/backtrace-data.c	2014-05-01 17:11:18.870616302 +0000
++++ elfutils-0.158/tests/backtrace-data.c	2014-05-01 17:11:18.866616384 +0000
+@@ -40,7 +40,7 @@
+ #include <string.h>
+ #include ELFUTILS_HEADER(dwfl)
+ 
+-#ifndef __x86_64__
++#if !defined(__x86_64__) || !defined(__linux__)
+ 
+ int
+ main (int argc __attribute__ ((unused)), char **argv)
+@@ -50,7 +50,7 @@
+   return 77;
+ }
+ 
+-#else /* __x86_64__ */
++#else /* __x86_64__ && __linux__ */
+ 
+ /* The only arch specific code is set_initial_registers.  */
+ 
+Index: elfutils-0.158/tests/backtrace-dwarf.c
+===================================================================
+--- elfutils-0.158.orig/tests/backtrace-dwarf.c	2014-05-01 17:11:18.870616302 +0000
++++ elfutils-0.158/tests/backtrace-dwarf.c	2014-05-01 17:11:18.866616384 +0000
+@@ -25,6 +25,18 @@
+ #include <sys/ptrace.h>
+ #include ELFUTILS_HEADER(dwfl)
+ 
++#ifndef __linux__
++
++int
++main (int argc __attribute__ ((unused)), char **argv)
++{
++  fprintf (stderr, "%s: Unwinding not supported for this architecture\n",
++           argv[0]);
++  return 77;
++}
++
++#else /* __linux__ */
++
+ static void cleanup_13_abort (void);
+ #define main cleanup_13_main
+ #include "cleanup-13.c"
+@@ -148,3 +160,6 @@
+   /* There is an exit (0) call if we find the "main" frame,  */
+   error (1, 0, "dwfl_getthreads: %s", dwfl_errmsg (-1));
+ }
++
++#endif /* ! __linux__ */
++
+Index: elfutils-0.158/tests/backtrace-subr.sh
+===================================================================
+--- elfutils-0.158.orig/tests/backtrace-subr.sh	2014-05-01 17:11:18.870616302 +0000
++++ elfutils-0.158/tests/backtrace-subr.sh	2014-05-01 17:11:18.866616384 +0000
+@@ -84,6 +84,7 @@
+   echo ./backtrace ./backtrace.$arch.{exec,core}
+   testrun ${abs_builddir}/backtrace -e ./backtrace.$arch.exec --core=./backtrace.$arch.core 1>backtrace.$arch.bt 2>backtrace.$arch.err || true
+   cat backtrace.$arch.{bt,err}
++  check_unsupported backtrace.$arch.err backtrace.$arch.core
+   check_all backtrace.$arch.{bt,err} backtrace.$arch.core
+ }
+ 
+Index: elfutils-0.158/tests/backtrace.c
+===================================================================
+--- elfutils-0.158.orig/tests/backtrace.c	2014-05-01 17:11:18.870616302 +0000
++++ elfutils-0.158/tests/backtrace.c	2014-05-01 17:11:18.866616384 +0000
+@@ -39,6 +39,18 @@
+ #include <sys/syscall.h>
+ #include ELFUTILS_HEADER(dwfl)
+ 
++#ifndef __linux__
++
++int
++main (int argc __attribute__ ((unused)), char **argv)
++{
++  fprintf (stderr, "%s: Unwinding not supported for this architecture\n",
++	   argv[0]);
++  return 77;
++}
++
++#else /* __linux__ */
++
+ static int
+ dump_modules (Dwfl_Module *mod, void **userdata __attribute__ ((unused)),
+ 	      const char *name, Dwarf_Addr start,
+@@ -452,3 +464,6 @@
+   dwfl_end (dwfl);
+   return 0;
+ }
++
++#endif /* ! __linux__ */
++
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.158.bb b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
index c97be74..e425364 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.158.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
@@ -10,6 +10,23 @@ SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/elfutils-${PV}.t
 SRC_URI[md5sum] = "050a4909e452d01ab4747fd69d4036e0"
 SRC_URI[sha256sum] = "be27af5c21352f53e010342bf1c68e0b9e18232dbf3adec7e2f9b41f6bbe397d"
 
+# Pick patches from debian
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.158-2.debian.tar.xz
+SRC_URI += "\
+        file://redhat-portability.diff \
+        file://redhat-robustify.diff \
+        file://hppa_backend.diff \
+        file://arm_backend.diff \
+        file://mips_backend.diff \
+        file://m68k_backend.diff \
+        file://testsuite-ignore-elflint.diff \
+        file://scanf-format.patch \
+        file://mips_readelf_w.patch \
+        file://core_filename.patch \
+        file://CVE-2014-0172.patch \
+        file://unwind_non_linux.patch \
+"
+
 SRC_URI += " \
 	file://elf_additions.diff \
 	file://mempcpy.patch \
-- 
1.8.1.2


