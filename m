Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1QtEi9-0000mK-Bg
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 10:09:21 +0200
Received: by ewy5 with SMTP id 5so2191771ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=DuGrN0bseYl2XxQBMBV0T14ZazzvbFtfTrUAWyKSW0M=;
	b=c2utQTB4nwMWGpEc7x9btpoq6FuzJn97Lw8mtj0ps3KG/YWEnDrL0IxKg12UCD0iQ2
	8Jhef0zEoyk/wIvFqcJb/2ASS8cfSGWJcVLEvC+VQ0T6mUepMPj5zvt7sjDx33/HG6eE
	bBhLi5o1cpoUAb2PlWUzIHWrVRFPaGZY3ewek=
Received: by 10.213.22.212 with SMTP id o20mr265670ebb.40.1313481876796;
	Tue, 16 Aug 2011 01:04:36 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id 76sm2934167eee.42.2011.08.16.01.04.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 01:04:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 12:04:29 +0400
Message-Id: <1313481869-16652-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] binutils-2.20.1: import several patches from Debian
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
X-List-Received-Date: Tue, 16 Aug 2011 08:09:21 -0000

Import several patches from Debian to improve --no-add-needed handling
vs. weak symbols and branching to weak symbols on arm.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../binutils/.binutils_2.20.1.bb.swp               |  Bin 0 -> 4096 bytes
 .../152_arm_branches_to_weak_symbols.patch         |  240 ++++++++++++++++++++
 .../binutils-2.20.1/200_elflink_%B_fixes.patch     |   65 ++++++
 .../201_elflink_improve_noaddneeded_errors.patch   |   70 ++++++
 .../202_elflink_noaddneeded_vs_weak.patch          |   87 +++++++
 .../recipes-devtools/binutils/binutils_2.20.1.bb   |    6 +-
 6 files changed, 467 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/binutils/.binutils_2.20.1.bb.swp
 create mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
 create mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
 create mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
 create mode 100644 meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch

diff --git a/meta-oe/recipes-devtools/binutils/.binutils_2.20.1.bb.swp b/meta-oe/recipes-devtools/binutils/.binutils_2.20.1.bb.swp
new file mode 100644
index 0000000000000000000000000000000000000000..6067470179a28799e82f41a85e864e87bd170f00
GIT binary patch
literal 4096
zcmeIuu?oU45C-6T0YP+^T5)XB#=$3WP*EpcrD={5uuVu(!NrI3sT^&^!L1L_yXiQ7
zj=N8$m+c{1GXZUl0haOZID;3w_W+d+kGz}rROz%*=z3BB&+kHh+HjAdv57C7w!w36
z8dsp_6^1-97Hg~|wj0%Ng4|)DE&4>^Js5NIT<W?B`mebPCQ_C$DSOYL00|6KU<50X
hrQP$3cpgnB=YcxV+ay2&BtQZrKmsH{0wgd@fe!(PGF|`x

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
new file mode 100644
index 0000000..48523f8
--- /dev/null
+++ b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
@@ -0,0 +1,240 @@
+#!/bin/sh -e
+## 152_arm_branches_to_weak_symbols.dpatch
+##
+## DP: Description: http://sourceware.org/ml/binutils/2010-04/msg00446.html
+## DP: Description: taken from the trunk
+
+if [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+
+[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
+patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
+
+case "$1" in
+       -patch) patch $patch_opts -p0 < $0;;
+       -unpatch) patch $patch_opts -p0 -R < $0;;
+        *)
+                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+                exit 1;;
+esac
+
+exit 0
+
+gas/
+
+2010-05-04  Nick Clifton  <nickc@redhat.com>
+
+	* write.c (fixup_segment): Revert previous delta.
+	* config/tc-arm.h (TC_FORCE_RELOCATION_LOCAL): Also force the
+	generation of relocations for fixups against weak symbols.
+
+2010-04-29  Nathan Sidwell  <nathan@codesourcery.com>
+
+	* write.c (fixup_segment): Do not assume we know the section a
+	defined weak symbol is in.
+	* config/tc-arm.c (relax_adr, relax_branch, md_apply_fix): Treat
+	weak symbols as not known to be in the same section, even if they
+	are defined.
+
+gas/testsuite/
+
+2010-04-29  Nathan Sidwell  <nathan@codesourcery.com>
+
+	* gas/arm/weakdef-1.s: New.
+	* gas/arm/weakdef-1.d: New.
+	* gas/arm/weakdef-2.s: New.
+	* gas/arm/weakdef-2.d: New.
+	* gas/arm/weakdef-2.l: New.
+
+@DPATCH@
+diff -urN gas.orig/config/tc-arm.c gas/config/tc-arm.c
+--- a/gas/config/tc-arm.c	2010-02-22 08:06:52.000000000 +0000
++++ b/gas/config/tc-arm.c	2010-05-06 12:52:25.391085365 +0000
+@@ -18207,7 +18207,8 @@
+ 
+   /* Assume worst case for symbols not known to be in the same section.  */
+   if (!S_IS_DEFINED (fragp->fr_symbol)
+-      || sec != S_GET_SEGMENT (fragp->fr_symbol))
++      || sec != S_GET_SEGMENT (fragp->fr_symbol)
++      || S_IS_WEAK (fragp->fr_symbol))
+     return 4;
+ 
+   val = relaxed_symbol_addr (fragp, stretch);
+@@ -18250,7 +18251,8 @@
+ 
+   /* Assume worst case for symbols not known to be in the same section.  */
+   if (!S_IS_DEFINED (fragp->fr_symbol)
+-      || sec != S_GET_SEGMENT (fragp->fr_symbol))
++      || sec != S_GET_SEGMENT (fragp->fr_symbol)
++      || S_IS_WEAK (fragp->fr_symbol))
+     return 4;
+ 
+ #ifdef OBJ_ELF
+@@ -19463,22 +19465,23 @@
+ 	 not have a reloc for it, so tc_gen_reloc will reject it.  */
+       fixP->fx_done = 1;
+ 
+-      if (fixP->fx_addsy
+-	  && ! S_IS_DEFINED (fixP->fx_addsy))
++      if (fixP->fx_addsy)
+ 	{
+-	  as_bad_where (fixP->fx_file, fixP->fx_line,
+-			_("undefined symbol %s used as an immediate value"),
+-			S_GET_NAME (fixP->fx_addsy));
+-	  break;
+-	}
++	  const char *msg = 0;
+ 
+-      if (fixP->fx_addsy
+-	  && S_GET_SEGMENT (fixP->fx_addsy) != seg)
+-	{
+-	  as_bad_where (fixP->fx_file, fixP->fx_line,
+-			_("symbol %s is in a different section"),
+-			S_GET_NAME (fixP->fx_addsy));
+-	  break;
++	  if (! S_IS_DEFINED (fixP->fx_addsy))
++	    msg = _("undefined symbol %s used as an immediate value");
++	  else if (S_GET_SEGMENT (fixP->fx_addsy) != seg)
++	    msg = _("symbol %s is in a different section");
++	  else if (S_IS_WEAK (fixP->fx_addsy))
++	    msg = _("symbol %s is weak and may be overridden later");
++
++	  if (msg)
++	    {
++	      as_bad_where (fixP->fx_file, fixP->fx_line,
++			    msg, S_GET_NAME (fixP->fx_addsy));
++	      break;
++	    }
+ 	}
+ 
+       newimm = encode_arm_immediate (value);
+@@ -19504,24 +19507,25 @@
+ 	unsigned int highpart = 0;
+ 	unsigned int newinsn  = 0xe1a00000; /* nop.  */
+ 
+-	if (fixP->fx_addsy
+-	    && ! S_IS_DEFINED (fixP->fx_addsy))
++	if (fixP->fx_addsy)
+ 	  {
+-	    as_bad_where (fixP->fx_file, fixP->fx_line,
+-			  _("undefined symbol %s used as an immediate value"),
+-			  S_GET_NAME (fixP->fx_addsy));
+-	    break;
+-	  }
++	    const char *msg = 0;
+ 
+-	if (fixP->fx_addsy
+-	    && S_GET_SEGMENT (fixP->fx_addsy) != seg)
+-	  {
+-	    as_bad_where (fixP->fx_file, fixP->fx_line,
+-			  _("symbol %s is in a different section"),
+-			  S_GET_NAME (fixP->fx_addsy));
+-	    break;
++	    if (! S_IS_DEFINED (fixP->fx_addsy))
++	      msg = _("undefined symbol %s used as an immediate value");
++	    else if (S_GET_SEGMENT (fixP->fx_addsy) != seg)
++	      msg = _("symbol %s is in a different section");
++	    else if (S_IS_WEAK (fixP->fx_addsy))
++	      msg = _("symbol %s is weak and may be overridden later");
++
++	    if (msg)
++	      {
++		as_bad_where (fixP->fx_file, fixP->fx_line,
++			      msg, S_GET_NAME (fixP->fx_addsy));
++		break;
++	      }
+ 	  }
+-
++	
+ 	newimm = encode_arm_immediate (value);
+ 	temp = md_chars_to_number (buf, INSN_SIZE);
+ 
+diff -urN gas.orig/config/tc-arm.h gas/config/tc-arm.h
+--- a/gas/config/tc-arm.h	2009-09-01 00:24:01.000000000 +0000
++++ b/gas/config/tc-arm.h	2010-05-06 12:53:42.784835970 +0000
+@@ -183,6 +183,7 @@
+   (!(FIX)->fx_pcrel					\
+    || (FIX)->fx_r_type == BFD_RELOC_ARM_GOT32		\
+    || (FIX)->fx_r_type == BFD_RELOC_32			\
++   || ((FIX)->fx_addsy != NULL && S_IS_WEAK ((FIX)->fx_addsy))	\
+    || TC_FORCE_RELOCATION (FIX))
+ 
+ /* Force output of R_ARM_REL32 relocations against thumb function symbols.
+diff -urN gas.orig/testsuite/gas/arm/weakdef-1.d gas/testsuite/gas/arm/weakdef-1.d
+--- a/gas/testsuite/gas/arm/weakdef-1.d	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-1.d	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,20 @@
++# name: Thumb branch to weak
++# as:
++# objdump: -dr
++# This test is only valid on ELF based ports.
++#not-target: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd *-*-riscix*
++
++.*: +file format .*arm.*
++
++
++Disassembly of section .text:
++
++0+000 <Weak>:
++   0:	e7fe      	b.n	2 <Strong>
++			0: R_ARM_THM_JUMP11	Strong
++
++0+002 <Strong>:
++   2:	f7ff bffe 	b.w	0 <Random>
++			2: R_ARM_THM_JUMP24	Random
++   6:	f7ff bffe 	b.w	0 <Weak>
++			6: R_ARM_THM_JUMP24	Weak
+diff -urN gas.orig/testsuite/gas/arm/weakdef-1.s gas/testsuite/gas/arm/weakdef-1.s
+--- a/gas/testsuite/gas/arm/weakdef-1.s	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-1.s	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,18 @@
++	.syntax unified
++	.text
++	.thumb
++
++	.globl	Weak
++	.weak	Weak
++	.thumb_func
++	.type	Weak, %function
++Weak:
++	b	Strong
++	.size	Weak, .-Weak
++	
++	.globl	Strong
++	.type	Strong, %function
++Strong:
++	b	Random
++	b	Weak
++	.size	Strong, .-Strong
+diff -urN gas.orig/testsuite/gas/arm/weakdef-2.d gas/testsuite/gas/arm/weakdef-2.d
+--- a/gas/testsuite/gas/arm/weakdef-2.d	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-2.d	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,5 @@
++# name: adr of weak
++# as:
++# error-output: weakdef-2.l
++# This test is only valid on ELF based ports.
++#not-target: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd *-*-riscix*
+diff -urN gas.orig/testsuite/gas/arm/weakdef-2.l gas/testsuite/gas/arm/weakdef-2.l
+--- a/gas/testsuite/gas/arm/weakdef-2.l	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-2.l	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,3 @@
++[^:]*: Assembler messages:
++[^:]*:9: Error: symbol Weak is weak and may be overridden later
++[^:]*:10: Error: symbol Weak is weak and may be overridden later
+diff -urN gas.orig/testsuite/gas/arm/weakdef-2.s gas/testsuite/gas/arm/weakdef-2.s
+--- a/gas/testsuite/gas/arm/weakdef-2.s	1970-01-01 00:00:00.000000000 +0000
++++ b/gas/testsuite/gas/arm/weakdef-2.s	2010-05-06 12:52:25.391085365 +0000
+@@ -0,0 +1,10 @@
++	.syntax unified
++	.text
++	.globl	Strong
++Strong:	
++	adrl	r0,Strong
++	adr	r0,Strong
++	.globl	Weak
++	.weak	Weak
++Weak:	adrl	r0,Weak
++	adr	r0,Weak
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
new file mode 100644
index 0000000..ac81685
--- /dev/null
+++ b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
@@ -0,0 +1,65 @@
+#! /bin/sh /usr/share/dpatch/dpatch-run
+## 200_elflink_%B_fixes.dpatch by  <kirr@landau.phys.spbu.ru>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Description: Fixes several msgs; needed for later elflink patches
+## DP: Upstream status: submitted upstream for binutils-2_20-branch
+
+2010-08-07  Kirill Smelkov  <kirr@landau.phys.spbu.ru>
+
+	Backport from mainline:
+	2009-10-12  Roland McGrath  <roland@frob.com>
+
+	* elflink.c (elf_link_add_object_symbols, _bfd_elf_merge_symbol):
+	Fix %s that should be %B in several message formats.
+
+@DPATCH@
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index c42c6e1..4a348de 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -1110,19 +1110,19 @@ _bfd_elf_merge_symbol (bfd *abfd,
+ 
+       if (tdef && ntdef)
+ 	(*_bfd_error_handler)
+-	  (_("%s: TLS definition in %B section %A mismatches non-TLS definition in %B section %A"),
++	  (_("%B: TLS definition in %B section %A mismatches non-TLS definition in %B section %A"),
+ 	   tbfd, tsec, ntbfd, ntsec, h->root.root.string);
+       else if (!tdef && !ntdef)
+ 	(*_bfd_error_handler)
+-	  (_("%s: TLS reference in %B mismatches non-TLS reference in %B"),
++	  (_("%B: TLS reference in %B mismatches non-TLS reference in %B"),
+ 	   tbfd, ntbfd, h->root.root.string);
+       else if (tdef)
+ 	(*_bfd_error_handler)
+-	  (_("%s: TLS definition in %B section %A mismatches non-TLS reference in %B"),
++	  (_("%B: TLS definition in %B section %A mismatches non-TLS reference in %B"),
+ 	   tbfd, tsec, ntbfd, h->root.root.string);
+       else
+ 	(*_bfd_error_handler)
+-	  (_("%s: TLS reference in %B mismatches non-TLS definition in %B section %A"),
++	  (_("%B: TLS reference in %B mismatches non-TLS definition in %B section %A"),
+ 	   tbfd, ntbfd, ntsec, h->root.root.string);
+ 
+       bfd_set_error (bfd_error_bad_value);
+@@ -4437,7 +4437,7 @@ error_free_dyn:
+ 	      if ((elf_dyn_lib_class (abfd) & DYN_NO_NEEDED) != 0)
+ 		{
+ 		  (*_bfd_error_handler)
+-		    (_("%s: invalid DSO for symbol `%s' definition"),
++		    (_("%B: invalid DSO for symbol `%s' definition"),
+ 		     abfd, name);
+ 		  bfd_set_error (bfd_error_bad_value);
+ 		  goto error_free_vers;
+@@ -12495,7 +12495,7 @@ _bfd_elf_get_dynamic_reloc_section (bfd *       abfd,
+    section does not exist it is created and attached to the DYNOBJ
+    bfd and stored in the SRELOC field of SEC's elf_section_data
+    structure.
+-   
++
+    ALIGNMENT is the alignment for the newly created section and
+    IS_RELA defines whether the name should be .rela.<SEC's name>
+    or .rel.<SEC's name>.  The section name is looked up in the
+-- 
+1.7.2.1.44.g721e7
+
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
new file mode 100644
index 0000000..85675a3
--- /dev/null
+++ b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
@@ -0,0 +1,70 @@
+#! /bin/sh /usr/share/dpatch/dpatch-run
+## 201_elflink_improve_errors.dpatch by  <kirr@landau.phys.spbu.ru>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Improves error messages regarding -no-add-needed cases; needed for 
+## DP: later elflink patches
+## DP: Upstream status: submitted upstream for binutils-2_20-branch
+
+2010-08-07  Kirill Smelkov  <kirr@landau.phys.spbu.ru>
+
+	Backport from mainline:
+	2009-11-05  Nick Clifton  <nickc@redhat.com>
+
+	* elflink.c (elf_link_add_object_symbols): Improve error
+	message generated when a symbol is left unresolved because a
+	--no-add-needed command line option has prevented the
+	inclusion of the DSO defining it.
+
+@DPATCH@
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 4a348de..10eee8c 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -3866,6 +3866,7 @@ error_free_dyn:
+       bfd_boolean common;
+       unsigned int old_alignment;
+       bfd *old_bfd;
++      bfd * undef_bfd = NULL;
+ 
+       override = FALSE;
+ 
+@@ -4097,6 +4098,20 @@ error_free_dyn:
+ 	      name = newname;
+ 	    }
+ 
++	  /* If this is a definition of a previously undefined symbol
++	     make a note of the bfd that contained the reference in
++	     case we need to refer to it later on in error messages.  */
++	  if (! bfd_is_und_section (sec))
++	    {
++	      h = elf_link_hash_lookup (elf_hash_table (info), name, FALSE, FALSE, FALSE);
++
++	      if (h != NULL
++		  && (h->root.type == bfd_link_hash_undefined
++		      || h->root.type == bfd_link_hash_undefweak)
++		  && h->root.u.undef.abfd)
++		undef_bfd = h->root.u.undef.abfd;
++	    }
++
+ 	  if (!_bfd_elf_merge_symbol (abfd, info, name, isym, &sec,
+ 				      &value, &old_alignment,
+ 				      sym_hash, &skip, &override,
+@@ -4437,9 +4452,12 @@ error_free_dyn:
+ 	      if ((elf_dyn_lib_class (abfd) & DYN_NO_NEEDED) != 0)
+ 		{
+ 		  (*_bfd_error_handler)
+-		    (_("%B: invalid DSO for symbol `%s' definition"),
++		    (_("%B: undefined reference to symbol '%s'"),
++		     undef_bfd == NULL ? info->output_bfd : undef_bfd, name);
++		  (*_bfd_error_handler)
++		    (_("note: '%s' is defined in DSO %B so try adding it to the linker command line"),
+ 		     abfd, name);
+-		  bfd_set_error (bfd_error_bad_value);
++		  bfd_set_error (bfd_error_invalid_operation);
+ 		  goto error_free_vers;
+ 		}
+ 
+-- 
+1.7.2.1.44.g721e7
+
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
new file mode 100644
index 0000000..a7dbc7a
--- /dev/null
+++ b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
@@ -0,0 +1,87 @@
+#! /bin/sh /usr/share/dpatch/dpatch-run
+## 202_elflink_noaddneeded_vs_weak.dpatch by  <kirr@landau.phys.spbu.ru>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Fixes '-no-add-needed breaks linking with weak symbols'
+## DP: Upstream status: submitted upstream for binutils-2_20-branch
+
+
+2010-08-07  Kirill Smelkov  <kirr@landau.phys.spbu.ru>
+
+	Backport from mainline:
+	2010-01-21  Nick Clifton  <nickc@redhat.com>
+
+	* elflink.c (elf_link_add_object_symbols): Look up name of
+	undefined symbol both before and after versioning has been
+	applied.  Do not bother with symbols that are weakly undefined.
+
+
+@DPATCH@
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 10eee8c..e058064 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -3991,6 +3991,20 @@ error_free_dyn:
+ 	  unsigned int vernum = 0;
+ 	  bfd_boolean skip;
+ 
++	  /* If this is a definition of a symbol which was previously
++	     referenced in a non-weak manner then make a note of the bfd
++	     that contained the reference.  This is used if we need to
++	     refer to the source of the reference later on.  */
++	  if (! bfd_is_und_section (sec))
++	    {
++	      h = elf_link_hash_lookup (elf_hash_table (info), name, FALSE, FALSE, FALSE);
++
++	      if (h != NULL
++		  && h->root.type == bfd_link_hash_undefined
++		  && h->root.u.undef.abfd)
++		undef_bfd = h->root.u.undef.abfd;
++	    }
++	  
+ 	  if (ever == NULL)
+ 	    {
+ 	      if (info->default_imported_symver)
+@@ -4098,16 +4112,15 @@ error_free_dyn:
+ 	      name = newname;
+ 	    }
+ 
+-	  /* If this is a definition of a previously undefined symbol
+-	     make a note of the bfd that contained the reference in
+-	     case we need to refer to it later on in error messages.  */
+-	  if (! bfd_is_und_section (sec))
++	  /* If necessary, make a second attempt to locate the bfd
++	     containing an unresolved, non-weak reference to the
++	     current symbol.  */
++	  if (! bfd_is_und_section (sec) && undef_bfd == NULL)
+ 	    {
+ 	      h = elf_link_hash_lookup (elf_hash_table (info), name, FALSE, FALSE, FALSE);
+ 
+ 	      if (h != NULL
+-		  && (h->root.type == bfd_link_hash_undefined
+-		      || h->root.type == bfd_link_hash_undefweak)
++		  && h->root.type == bfd_link_hash_undefined
+ 		  && h->root.u.undef.abfd)
+ 		undef_bfd = h->root.u.undef.abfd;
+ 	    }
+@@ -4448,12 +4461,14 @@ error_free_dyn:
+ 	      /* A symbol from a library loaded via DT_NEEDED of some
+ 		 other library is referenced by a regular object.
+ 		 Add a DT_NEEDED entry for it.  Issue an error if
+-		 --no-add-needed is used.  */
+-	      if ((elf_dyn_lib_class (abfd) & DYN_NO_NEEDED) != 0)
++		 --no-add-needed is used and the reference was not
++		 a weak one.  */
++	      if (undef_bfd != NULL
++		  && (elf_dyn_lib_class (abfd) & DYN_NO_NEEDED) != 0)
+ 		{
+ 		  (*_bfd_error_handler)
+ 		    (_("%B: undefined reference to symbol '%s'"),
+-		     undef_bfd == NULL ? info->output_bfd : undef_bfd, name);
++		     undef_bfd, name);
+ 		  (*_bfd_error_handler)
+ 		    (_("note: '%s' is defined in DSO %B so try adding it to the linker command line"),
+ 		     abfd, name);
+-- 
+1.7.2.1.44.g721e7
+
diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
index 6961a46..2558bda 100644
--- a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
+++ b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r5"
+PR = "r6"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -30,6 +30,10 @@ SRC_URI = "\
      file://libiberty_path_fix.patch \
      file://binutils-poison.patch \
      file://libtool-rpath-fix.patch \
+     file://152_arm_branches_to_weak_symbols.patch \
+     file://200_elflink_%B_fixes.patch \
+     file://201_elflink_improve_noaddneeded_errors.patch \
+     file://202_elflink_noaddneeded_vs_weak.patch \
      "
 
 SRC_URI[md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
-- 
1.7.2.5



