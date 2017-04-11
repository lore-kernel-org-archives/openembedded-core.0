Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45CEC65D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:00:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3B70PH2008848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 00:00:25 -0700
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 00:00:24 -0700
From: Yuanjie Huang <yuanjie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 00:00:24 -0700
Message-ID: <20170411070024.305499-1-yuanjie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <79336d8d-845d-b4ef-7eb5-acc8f10f675d@windriver.com>
References: <79336d8d-845d-b4ef-7eb5-acc8f10f675d@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] binutils: Fix CVE-2017-6965 and CVE-2017-6966
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
X-List-Received-Date: Tue, 11 Apr 2017 07:00:25 -0000
Content-Type: text/plain

Backport upstream commit to address vulnerabilities:

CVE: CVE-2017-6965
[BZ 21137] -- https://sourceware.org/bugzilla/show_bug.cgi?id=21137

Fix readelf writing to illegal addresses whilst processing corrupt input
files containing symbol-difference relocations.

	PR binutils/21137
	* readelf.c (target_specific_reloc_handling): Add end parameter.
	Check for buffer overflow before writing relocated values.
	(apply_relocations): Pass end to target_specific_reloc_handling.

CVE: CVE-2017-6966
[BZ 21139] -- https://sourceware.org/bugzilla/show_bug.cgi?id=21139

Fix read-after-free error in readelf when processing multiple, relocated
sections in an MSP430 binary.

	PR binutils/21139
	* readelf.c (target_specific_reloc_handling): Add num_syms
	parameter.  Check for symbol table overflow before accessing
	symbol value.  If reloc pointer is NULL, discard all saved state.
	(apply_relocations): Pass num_syms to target_specific_reloc_handling.
	Call target_specific_reloc_handling with a NULL reloc pointer
	after processing all of the relocs.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   2 +
 .../binutils/binutils/CVE-2017-6965.patch          | 124 +++++++++++
 .../binutils/binutils/CVE-2017-6966.patch          | 241 +++++++++++++++++++++
 3 files changed, 367 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 76b81b04ca..7585da1ca9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -35,6 +35,8 @@ SRC_URI = "\
      file://0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Detect-64-bit-MIPS-targets.patch \
+     file://CVE-2017-6965.patch \
+     file://CVE-2017-6966.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
new file mode 100644
index 0000000000..1334c9444d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
@@ -0,0 +1,124 @@
+From bdc5166c274b842f83f8328e7cfaaf80fd29934e Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 13 Feb 2017 13:08:32 +0000
+Subject: [PATCH 1/2] Fix readelf writing to illegal addresses whilst
+ processing corrupt input files containing symbol-difference relocations.
+
+	PR binutils/21137
+	* readelf.c (target_specific_reloc_handling): Add end parameter.
+	Check for buffer overflow before writing relocated values.
+	(apply_relocations): Pass end to target_specific_reloc_handling.
+
+(cherry pick from commit 03f7786e2f440b9892b1c34a58fb26222ce1b493)
+Upstream-Status: Backport [master]
+CVE: CVE-2017-6965
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ binutils/ChangeLog |  7 +++++++
+ binutils/readelf.c | 30 +++++++++++++++++++++++++-----
+ 2 files changed, 32 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index f21867f98c..e789a3b99b 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,10 @@
++2017-02-13  Nick Clifton  <nickc@redhat.com>
++
++	PR binutils/21137
++	* readelf.c (target_specific_reloc_handling): Add end parameter.
++	Check for buffer overflow before writing relocated values.
++	(apply_relocations): Pass end to target_specific_reloc_handling.
++
+ 2017-03-02  Tristan Gingold  <gingold@adacore.com>
+ 
+ 	* configure: Regenerate.
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index b5f577f5a1..8cdaae3b8c 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -11585,6 +11585,7 @@ process_syminfo (FILE * file ATTRIBUTE_UNUSED)
+ static bfd_boolean
+ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 				unsigned char *     start,
++				unsigned char *     end,
+ 				Elf_Internal_Sym *  symtab)
+ {
+   unsigned int reloc_type = get_reloc_type (reloc->r_info);
+@@ -11625,13 +11626,19 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 	  handle_sym_diff:
+ 	    if (saved_sym != NULL)
+ 	      {
++		int reloc_size = reloc_type == 1 ? 4 : 2;
+ 		bfd_vma value;
+ 
+ 		value = reloc->r_addend
+ 		  + (symtab[get_reloc_symindex (reloc->r_info)].st_value
+ 		     - saved_sym->st_value);
+ 
+-		byte_put (start + reloc->r_offset, value, reloc_type == 1 ? 4 : 2);
++		if (start + reloc->r_offset + reloc_size >= end)
++		  /* PR 21137 */
++		  error (_("MSP430 sym diff reloc writes past end of section (%p vs %p)\n"),
++			 start + reloc->r_offset + reloc_size, end);
++		else
++		  byte_put (start + reloc->r_offset, value, reloc_size);
+ 
+ 		saved_sym = NULL;
+ 		return TRUE;
+@@ -11662,13 +11669,18 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 	  case 2: /* R_MN10300_16 */
+ 	    if (saved_sym != NULL)
+ 	      {
++		int reloc_size = reloc_type == 1 ? 4 : 2;
+ 		bfd_vma value;
+ 
+ 		value = reloc->r_addend
+ 		  + (symtab[get_reloc_symindex (reloc->r_info)].st_value
+ 		     - saved_sym->st_value);
+ 
+-		byte_put (start + reloc->r_offset, value, reloc_type == 1 ? 4 : 2);
++		if (start + reloc->r_offset + reloc_size >= end)
++		  error (_("MN10300 sym diff reloc writes past end of section (%p vs %p)\n"),
++			 start + reloc->r_offset + reloc_size, end);
++		else
++		  byte_put (start + reloc->r_offset, value, reloc_size);
+ 
+ 		saved_sym = NULL;
+ 		return TRUE;
+@@ -11703,12 +11715,20 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 	    break;
+ 
+ 	  case 0x41: /* R_RL78_ABS32.  */
+-	    byte_put (start + reloc->r_offset, value, 4);
++	    if (start + reloc->r_offset + 4 >= end)
++	      error (_("RL78 sym diff reloc writes past end of section (%p vs %p)\n"),
++		     start + reloc->r_offset + 2, end);
++	    else
++	      byte_put (start + reloc->r_offset, value, 4);
+ 	    value = 0;
+ 	    return TRUE;
+ 
+ 	  case 0x43: /* R_RL78_ABS16.  */
+-	    byte_put (start + reloc->r_offset, value, 2);
++	    if (start + reloc->r_offset + 2 >= end)
++	      error (_("RL78 sym diff reloc writes past end of section (%p vs %p)\n"),
++		     start + reloc->r_offset + 2, end);
++	    else
++	      byte_put (start + reloc->r_offset, value, 2);
+ 	    value = 0;
+ 	    return TRUE;
+ 
+@@ -12325,7 +12345,7 @@ apply_relocations (void *                     file,
+ 
+ 	  reloc_type = get_reloc_type (rp->r_info);
+ 
+-	  if (target_specific_reloc_handling (rp, start, symtab))
++	  if (target_specific_reloc_handling (rp, start, end, symtab))
+ 	    continue;
+ 	  else if (is_none_reloc (reloc_type))
+ 	    continue;
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
new file mode 100644
index 0000000000..dd58df5fbf
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
@@ -0,0 +1,241 @@
+From 383ec757d27652448d1511169e1133f486abf54f Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 13 Feb 2017 14:03:22 +0000
+Subject: [PATCH] Fix read-after-free error in readelf when processing
+ multiple, relocated sections in an MSP430 binary.
+
+	PR binutils/21139
+	* readelf.c (target_specific_reloc_handling): Add num_syms
+	parameter.  Check for symbol table overflow before accessing
+	symbol value.  If reloc pointer is NULL, discard all saved state.
+	(apply_relocations): Pass num_syms to target_specific_reloc_handling.
+	Call target_specific_reloc_handling with a NULL reloc pointer
+	after processing all of the relocs.
+
+(cherry pick from commit f84ce13b6708801ca1d6289b7c4003e2f5a6d7f9)
+Upstream-Status: Backport [master]
+CVE: CVE-2017-6966
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ binutils/ChangeLog |  10 +++++
+ binutils/readelf.c | 109 +++++++++++++++++++++++++++++++++++++++++------------
+ 2 files changed, 94 insertions(+), 25 deletions(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index e789a3b99b..bd63c8a0d8 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,5 +1,15 @@
+ 2017-02-13  Nick Clifton  <nickc@redhat.com>
+ 
++	PR binutils/21139
++	* readelf.c (target_specific_reloc_handling): Add num_syms
++	parameter.  Check for symbol table overflow before accessing
++	symbol value.  If reloc pointer is NULL, discard all saved state.
++	(apply_relocations): Pass num_syms to target_specific_reloc_handling.
++	Call target_specific_reloc_handling with a NULL reloc pointer
++	after processing all of the relocs.
++
++2017-02-13  Nick Clifton  <nickc@redhat.com>
++
+ 	PR binutils/21137
+ 	* readelf.c (target_specific_reloc_handling): Add end parameter.
+ 	Check for buffer overflow before writing relocated values.
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 8cdaae3b8c..7c158c6342 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -11580,15 +11580,27 @@ process_syminfo (FILE * file ATTRIBUTE_UNUSED)
+ 
+ /* Check to see if the given reloc needs to be handled in a target specific
+    manner.  If so then process the reloc and return TRUE otherwise return
+-   FALSE.  */
++   FALSE.
++
++   If called with reloc == NULL, then this is a signal that reloc processing
++   for the current section has finished, and any saved state should be
++   discarded.  */
+ 
+ static bfd_boolean
+ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 				unsigned char *     start,
+ 				unsigned char *     end,
+-				Elf_Internal_Sym *  symtab)
++				Elf_Internal_Sym *  symtab,
++				unsigned long       num_syms)
+ {
+-  unsigned int reloc_type = get_reloc_type (reloc->r_info);
++  unsigned int reloc_type = 0;
++  unsigned long sym_index = 0;
++
++  if (reloc)
++    {
++      reloc_type = get_reloc_type (reloc->r_info);
++      sym_index = get_reloc_symindex (reloc->r_info);
++    }
+ 
+   switch (elf_header.e_machine)
+     {
+@@ -11597,6 +11609,12 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+       {
+ 	static Elf_Internal_Sym * saved_sym = NULL;
+ 
++	if (reloc == NULL)
++	  {
++	    saved_sym = NULL;
++	    return TRUE;
++	  }
++
+ 	switch (reloc_type)
+ 	  {
+ 	  case 10: /* R_MSP430_SYM_DIFF */
+@@ -11604,7 +11622,12 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 	      break;
+ 	    /* Fall through.  */
+ 	  case 21: /* R_MSP430X_SYM_DIFF */
+-	    saved_sym = symtab + get_reloc_symindex (reloc->r_info);
++	    /* PR 21139.  */
++	    if (sym_index >= num_syms)
++	      error (_("MSP430 SYM_DIFF reloc contains invalid symbol index %lu\n"),
++		     sym_index);
++	    else
++	      saved_sym = symtab + sym_index;
+ 	    return TRUE;
+ 
+ 	  case 1: /* R_MSP430_32 or R_MSP430_ABS32 */
+@@ -11629,16 +11652,21 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 		int reloc_size = reloc_type == 1 ? 4 : 2;
+ 		bfd_vma value;
+ 
+-		value = reloc->r_addend
+-		  + (symtab[get_reloc_symindex (reloc->r_info)].st_value
+-		     - saved_sym->st_value);
+-
+-		if (start + reloc->r_offset + reloc_size >= end)
+-		  /* PR 21137 */
+-		  error (_("MSP430 sym diff reloc writes past end of section (%p vs %p)\n"),
+-			 start + reloc->r_offset + reloc_size, end);
++		if (sym_index >= num_syms)
++		  error (_("MSP430 reloc contains invalid symbol index %lu\n"),
++			 sym_index);
+ 		else
+-		  byte_put (start + reloc->r_offset, value, reloc_size);
++		  {
++		    value = reloc->r_addend + (symtab[sym_index].st_value
++					       - saved_sym->st_value);
++
++		    if (start + reloc->r_offset + reloc_size >= end)
++		      /* PR 21137 */
++		      error (_("MSP430 sym diff reloc writes past end of section (%p vs %p)\n"),
++			     start + reloc->r_offset + reloc_size, end);
++		    else
++		      byte_put (start + reloc->r_offset, value, reloc_size);
++		  }
+ 
+ 		saved_sym = NULL;
+ 		return TRUE;
+@@ -11658,13 +11686,24 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+       {
+ 	static Elf_Internal_Sym * saved_sym = NULL;
+ 
++	if (reloc == NULL)
++	  {
++	    saved_sym = NULL;
++	    return TRUE;
++	  }
++
+ 	switch (reloc_type)
+ 	  {
+ 	  case 34: /* R_MN10300_ALIGN */
+ 	    return TRUE;
+ 	  case 33: /* R_MN10300_SYM_DIFF */
+-	    saved_sym = symtab + get_reloc_symindex (reloc->r_info);
++	    if (sym_index >= num_syms)
++	      error (_("MN10300_SYM_DIFF reloc contains invalid symbol index %lu\n"),
++		     sym_index);
++	    else
++	      saved_sym = symtab + sym_index;
+ 	    return TRUE;
++
+ 	  case 1: /* R_MN10300_32 */
+ 	  case 2: /* R_MN10300_16 */
+ 	    if (saved_sym != NULL)
+@@ -11672,15 +11711,20 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 		int reloc_size = reloc_type == 1 ? 4 : 2;
+ 		bfd_vma value;
+ 
+-		value = reloc->r_addend
+-		  + (symtab[get_reloc_symindex (reloc->r_info)].st_value
+-		     - saved_sym->st_value);
+-
+-		if (start + reloc->r_offset + reloc_size >= end)
+-		  error (_("MN10300 sym diff reloc writes past end of section (%p vs %p)\n"),
+-			 start + reloc->r_offset + reloc_size, end);
++		if (sym_index >= num_syms)
++		  error (_("MN10300 reloc contains invalid symbol index %lu\n"),
++			 sym_index);
+ 		else
+-		  byte_put (start + reloc->r_offset, value, reloc_size);
++		  {
++		    value = reloc->r_addend + (symtab[sym_index].st_value
++					       - saved_sym->st_value);
++
++		    if (start + reloc->r_offset + reloc_size >= end)
++		      error (_("MN10300 sym diff reloc writes past end of section (%p vs %p)\n"),
++			     start + reloc->r_offset + reloc_size, end);
++		    else
++		      byte_put (start + reloc->r_offset, value, reloc_size);
++		  }
+ 
+ 		saved_sym = NULL;
+ 		return TRUE;
+@@ -11700,12 +11744,24 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
+ 	static bfd_vma saved_sym2 = 0;
+ 	static bfd_vma value;
+ 
++	if (reloc == NULL)
++	  {
++	    saved_sym1 = saved_sym2 = 0;
++	    return TRUE;
++	  }
++
+ 	switch (reloc_type)
+ 	  {
+ 	  case 0x80: /* R_RL78_SYM.  */
+ 	    saved_sym1 = saved_sym2;
+-	    saved_sym2 = symtab[get_reloc_symindex (reloc->r_info)].st_value;
+-	    saved_sym2 += reloc->r_addend;
++	    if (sym_index >= num_syms)
++	      error (_("RL78_SYM reloc contains invalid symbol index %lu\n"),
++		     sym_index);
++	    else
++	      {
++		saved_sym2 = symtab[sym_index].st_value;
++		saved_sym2 += reloc->r_addend;
++	      }
+ 	    return TRUE;
+ 
+ 	  case 0x83: /* R_RL78_OPsub.  */
+@@ -12345,7 +12401,7 @@ apply_relocations (void *                     file,
+ 
+ 	  reloc_type = get_reloc_type (rp->r_info);
+ 
+-	  if (target_specific_reloc_handling (rp, start, end, symtab))
++	  if (target_specific_reloc_handling (rp, start, end, symtab, num_syms))
+ 	    continue;
+ 	  else if (is_none_reloc (reloc_type))
+ 	    continue;
+@@ -12441,6 +12497,9 @@ apply_relocations (void *                     file,
+ 	}
+ 
+       free (symtab);
++      /* Let the target specific reloc processing code know that
++	 we have finished with these relocs.  */
++      target_specific_reloc_handling (NULL, NULL, NULL, NULL, 0);
+ 
+       if (relocs_return)
+ 	{
+-- 
+2.11.0
+
-- 
2.11.0


