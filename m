Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE801745F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 06:28:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA66SAl7015609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Nov 2018 22:28:40 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 5 Nov 2018 22:27:59 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Nov 2018 22:27:59 -0800
Message-ID: <20181106062759.120481-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] binutils: fix four CVE issues
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
X-List-Received-Date: Tue, 06 Nov 2018 06:28:50 -0000
Content-Type: text/plain

Backport the CVE patches from the binutils upstream.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../binutils/binutils-2.31.inc                |   4 +
 .../binutils/binutils/CVE-2018-18309.patch    | 304 ++++++++++++++++++
 .../binutils/binutils/CVE-2018-18605.patch    |  47 +++
 .../binutils/binutils/CVE-2018-18606.patch    |  70 ++++
 .../binutils/binutils/CVE-2018-18607.patch    |  77 +++++
 5 files changed, 502 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 27a643d765..0c9d4cef21 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -43,6 +43,10 @@ SRC_URI = "\
      file://0021-PLT-information-was-still-being-generated-when-symbo.patch \
      file://CVE-2018-17358.patch \
      file://CVE-2018-17360.patch \
+     file://CVE-2018-18309.patch \
+     file://CVE-2018-18605.patch \
+     file://CVE-2018-18606.patch \
+     file://CVE-2018-18607.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
new file mode 100644
index 0000000000..183a6829ed
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
@@ -0,0 +1,304 @@
+From 0930cb3021b8078b34cf216e79eb8608d017864f Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 13 Oct 2018 22:03:02 +1030
+Subject: [PATCH] _bfd_clear_contents bounds checking
+
+This PR shows a fuzzed binary triggering a segfault via a bad
+relocation in .debug_line.  It turns out that unlike normal
+relocations applied to a section, the linker applies those with
+symbols from discarded sections via _bfd_clear_contents without
+checking that the relocation is within the section bounds.  The same
+thing now happens when reading debug sections since commit
+a4cd947aca23, the PR23425 fix.
+
+	PR 23770
+	PR 23425
+	* reloc.c (_bfd_clear_contents): Replace "location" param with
+	"buf" and "off".  Bounds check "off".  Return status.
+	* cofflink.c (_bfd_coff_generic_relocate_section): Update
+	_bfd_clear_contents call.
+	* elf-bfd.h (RELOC_AGAINST_DISCARDED_SECTION): Likewise.
+	* elf32-arc.c (elf_arc_relocate_section): Likewise.
+	* elf32-i386.c (elf_i386_relocate_section): Likewise.
+	* elf32-metag.c (metag_final_link_relocate): Likewise.
+	* elf32-nds32.c (nds32_elf_get_relocated_section_contents): Likewise.
+	* elf32-ppc.c (ppc_elf_relocate_section): Likewise.
+	* elf32-visium.c (visium_elf_relocate_section): Likewise.
+	* elf64-ppc.c (ppc64_elf_relocate_section): Likewise.
+	* elf64-x86-64.c *(elf_x86_64_relocate_section): Likewise.
+	* libbfd-in.h (_bfd_clear_contents): Update prototype.
+	* libbfd.h: Regenerate.
+---
+ bfd/ChangeLog      | 20 ++++++++++++++++++++
+ bfd/cofflink.c     |  2 +-
+ bfd/elf-bfd.h      |  2 +-
+ bfd/elf32-arc.c    |  2 +-
+ bfd/elf32-i386.c   |  2 +-
+ bfd/elf32-metag.c  |  2 +-
+ bfd/elf32-nds32.c  |  8 ++++----
+ bfd/elf32-ppc.c    |  2 +-
+ bfd/elf32-visium.c |  2 +-
+ bfd/elf64-ppc.c    |  2 +-
+ bfd/elf64-x86-64.c |  2 +-
+ bfd/libbfd-in.h    |  4 ++--
+ bfd/libbfd.h       |  4 ++--
+ bfd/reloc.c        | 19 +++++++++++++------
+ 14 files changed, 50 insertions(+), 23 deletions(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 68c1ff665b..e9696ee314 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,23 @@
++2018-10-13  Alan Modra  <amodra@gmail.com>
++
++	PR 23770
++	PR 23425
++	* reloc.c (_bfd_clear_contents): Replace "location" param with
++	"buf" and "off".  Bounds check "off".  Return status.
++	* cofflink.c (_bfd_coff_generic_relocate_section): Update
++	_bfd_clear_contents call.
++	* elf-bfd.h (RELOC_AGAINST_DISCARDED_SECTION): Likewise.
++	* elf32-arc.c (elf_arc_relocate_section): Likewise.
++	* elf32-i386.c (elf_i386_relocate_section): Likewise.
++	* elf32-metag.c (metag_final_link_relocate): Likewise.
++	* elf32-nds32.c (nds32_elf_get_relocated_section_contents): Likewise.
++	* elf32-ppc.c (ppc_elf_relocate_section): Likewise.
++	* elf32-visium.c (visium_elf_relocate_section): Likewise.
++	* elf64-ppc.c (ppc64_elf_relocate_section): Likewise.
++	* elf64-x86-64.c *(elf_x86_64_relocate_section): Likewise.
++	* libbfd-in.h (_bfd_clear_contents): Update prototype.
++	* libbfd.h: Regenerate.
++
+ 2018-09-20  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 23685
+diff --git a/bfd/cofflink.c b/bfd/cofflink.c
+index 2f73f72e31..b7ea69b7f9 100644
+--- a/bfd/cofflink.c
++++ b/bfd/cofflink.c
+@@ -3080,7 +3080,7 @@ _bfd_coff_generic_relocate_section (bfd *output_bfd,
+       if (sec != NULL && discarded_section (sec))
+ 	{
+ 	  _bfd_clear_contents (howto, input_bfd, input_section,
+-			       contents + (rel->r_vaddr - input_section->vma));
++			       contents, rel->r_vaddr - input_section->vma);
+ 	  continue;
+ 	}
+ 
+diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
+index cf256f70e0..3374f411f9 100644
+--- a/bfd/elf-bfd.h
++++ b/bfd/elf-bfd.h
+@@ -2811,7 +2811,7 @@ extern asection _bfd_elf_large_com_section;
+   {									\
+     int i_;								\
+     _bfd_clear_contents (howto, input_bfd, input_section,		\
+-			 contents + rel[index].r_offset);		\
++			 contents, rel[index].r_offset);		\
+ 									\
+     if (bfd_link_relocatable (info)					\
+ 	&& (input_section->flags & SEC_DEBUGGING))			\
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 7a1b3042ae..30f47a5b22 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -1549,7 +1549,7 @@ elf_arc_relocate_section (bfd *			  output_bfd,
+       if (sec != NULL && discarded_section (sec))
+ 	{
+ 	  _bfd_clear_contents (howto, input_bfd, input_section,
+-			       contents + rel->r_offset);
++			       contents, rel->r_offset);
+ 	  rel->r_info = 0;
+ 	  rel->r_addend = 0;
+ 
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index 49797dcbfa..177471777d 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -2197,7 +2197,7 @@ elf_i386_relocate_section (bfd *output_bfd,
+       if (sec != NULL && discarded_section (sec))
+ 	{
+ 	  _bfd_clear_contents (howto, input_bfd, input_section,
+-			       contents + rel->r_offset);
++			       contents, rel->r_offset);
+ 	  wrel->r_offset = rel->r_offset;
+ 	  wrel->r_info = 0;
+ 	  wrel->r_addend = 0;
+diff --git a/bfd/elf32-metag.c b/bfd/elf32-metag.c
+index efe95bddff..7f96246e5d 100644
+--- a/bfd/elf32-metag.c
++++ b/bfd/elf32-metag.c
+@@ -1396,7 +1396,7 @@ metag_final_link_relocate (reloc_howto_type *howto,
+ 					      rel, relend, howto, contents) \
+   {									\
+     _bfd_clear_contents (howto, input_bfd, input_section,		\
+-			 contents + rel->r_offset);			\
++			 contents, rel->r_offset);			\
+ 									\
+     if (bfd_link_relocatable (info)					\
+ 	&& (input_section->flags & SEC_DEBUGGING))			\
+diff --git a/bfd/elf32-nds32.c b/bfd/elf32-nds32.c
+index 0d86e5b865..184cf320f7 100644
+--- a/bfd/elf32-nds32.c
++++ b/bfd/elf32-nds32.c
+@@ -12582,14 +12582,14 @@ nds32_elf_get_relocated_section_contents (bfd *abfd,
+ 	  symbol = *(*parent)->sym_ptr_ptr;
+ 	  if (symbol->section && discarded_section (symbol->section))
+ 	    {
+-	      bfd_byte *p;
++	      bfd_vma off;
+ 	      static reloc_howto_type none_howto
+ 		= HOWTO (0, 0, 0, 0, FALSE, 0, complain_overflow_dont, NULL,
+ 			 "unused", FALSE, 0, 0, FALSE);
+ 
+-	      p = data + (*parent)->address * bfd_octets_per_byte (input_bfd);
+-	      _bfd_clear_contents ((*parent)->howto, input_bfd, input_section,
+-				   p);
++	      off = (*parent)->address * bfd_octets_per_byte (input_bfd);
++	      _bfd_clear_contents ((*parent)->howto, input_bfd,
++				   input_section, data, off);
+ 	      (*parent)->sym_ptr_ptr = bfd_abs_section_ptr->symbol_ptr_ptr;
+ 	      (*parent)->addend = 0;
+ 	      (*parent)->howto = &none_howto;
+diff --git a/bfd/elf32-ppc.c b/bfd/elf32-ppc.c
+index 61f70de12e..c31e26efd7 100644
+--- a/bfd/elf32-ppc.c
++++ b/bfd/elf32-ppc.c
+@@ -8232,7 +8232,7 @@ ppc_elf_relocate_section (bfd *output_bfd,
+ 	    howto = ppc_elf_howto_table[r_type];
+ 
+ 	  _bfd_clear_contents (howto, input_bfd, input_section,
+-			       contents + rel->r_offset);
++			       contents, rel->r_offset);
+ 	  wrel->r_offset = rel->r_offset;
+ 	  wrel->r_info = 0;
+ 	  wrel->r_addend = 0;
+diff --git a/bfd/elf32-visium.c b/bfd/elf32-visium.c
+index e8f1c4c9e4..961366cd87 100644
+--- a/bfd/elf32-visium.c
++++ b/bfd/elf32-visium.c
+@@ -621,7 +621,7 @@ visium_elf_relocate_section (bfd *output_bfd,
+ 	     or sections discarded by a linker script, we just want the
+ 	     section contents zeroed.  Avoid any special processing.  */
+ 	  _bfd_clear_contents (howto, input_bfd, input_section,
+-			       contents + rel->r_offset);
++			       contents, rel->r_offset);
+ 
+ 	  rel->r_info = 0;
+ 	  rel->r_addend = 0;
+diff --git a/bfd/elf64-ppc.c b/bfd/elf64-ppc.c
+index eadde17615..7c3534ac65 100644
+--- a/bfd/elf64-ppc.c
++++ b/bfd/elf64-ppc.c
+@@ -14073,7 +14073,7 @@ ppc64_elf_relocate_section (bfd *output_bfd,
+ 	{
+ 	  _bfd_clear_contents (ppc64_elf_howto_table[r_type],
+ 			       input_bfd, input_section,
+-			       contents + rel->r_offset);
++			       contents, rel->r_offset);
+ 	  wrel->r_offset = rel->r_offset;
+ 	  wrel->r_info = 0;
+ 	  wrel->r_addend = 0;
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index c3a6c31ed2..4dcab43478 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -2490,7 +2490,7 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+       if (sec != NULL && discarded_section (sec))
+ 	{
+ 	  _bfd_clear_contents (howto, input_bfd, input_section,
+-			       contents + rel->r_offset);
++			       contents, rel->r_offset);
+ 	  wrel->r_offset = rel->r_offset;
+ 	  wrel->r_info = 0;
+ 	  wrel->r_addend = 0;
+diff --git a/bfd/libbfd-in.h b/bfd/libbfd-in.h
+index e53b255dad..f6d9565f03 100644
+--- a/bfd/libbfd-in.h
++++ b/bfd/libbfd-in.h
+@@ -696,8 +696,8 @@ extern bfd_reloc_status_type _bfd_relocate_contents
+   (reloc_howto_type *, bfd *, bfd_vma, bfd_byte *) ATTRIBUTE_HIDDEN;
+ 
+ /* Clear a given location using a given howto.  */
+-extern void _bfd_clear_contents
+-  (reloc_howto_type *, bfd *, asection *, bfd_byte *) ATTRIBUTE_HIDDEN;
++extern bfd_reloc_status_type _bfd_clear_contents
++  (reloc_howto_type *, bfd *, asection *, bfd_byte *, bfd_vma) ATTRIBUTE_HIDDEN;
+ 
+ /* Link stabs in sections in the first pass.  */
+ 
+diff --git a/bfd/libbfd.h b/bfd/libbfd.h
+index a8851c8026..1189e63358 100644
+--- a/bfd/libbfd.h
++++ b/bfd/libbfd.h
+@@ -701,8 +701,8 @@ extern bfd_reloc_status_type _bfd_relocate_contents
+   (reloc_howto_type *, bfd *, bfd_vma, bfd_byte *) ATTRIBUTE_HIDDEN;
+ 
+ /* Clear a given location using a given howto.  */
+-extern void _bfd_clear_contents
+-  (reloc_howto_type *, bfd *, asection *, bfd_byte *) ATTRIBUTE_HIDDEN;
++extern bfd_reloc_status_type _bfd_clear_contents
++  (reloc_howto_type *, bfd *, asection *, bfd_byte *, bfd_vma) ATTRIBUTE_HIDDEN;
+ 
+ /* Link stabs in sections in the first pass.  */
+ 
+diff --git a/bfd/reloc.c b/bfd/reloc.c
+index 8dbb8896d3..1686780669 100644
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -1613,16 +1613,22 @@ _bfd_relocate_contents (reloc_howto_type *howto,
+    relocations against discarded symbols, to make ignorable debug or unwind
+    information more obvious.  */
+ 
+-void
++bfd_reloc_status_type
+ _bfd_clear_contents (reloc_howto_type *howto,
+ 		     bfd *input_bfd,
+ 		     asection *input_section,
+-		     bfd_byte *location)
++		     bfd_byte *buf,
++		     bfd_vma off)
+ {
+   int size;
+   bfd_vma x = 0;
++  bfd_byte *location;
++
++  if (!bfd_reloc_offset_in_range (howto, input_bfd, input_section, off))
++    return bfd_reloc_outofrange;
+ 
+   /* Get the value we are going to relocate.  */
++  location = buf + off;
+   size = bfd_get_reloc_size (howto);
+   switch (size)
+     {
+@@ -1687,6 +1693,7 @@ _bfd_clear_contents (reloc_howto_type *howto,
+ #endif
+       break;
+     }
++  return bfd_reloc_ok;
+ }
+ 
+ /*
+@@ -8275,14 +8282,14 @@ bfd_generic_get_relocated_section_contents (bfd *abfd,
+ 
+ 	  if (symbol->section && discarded_section (symbol->section))
+ 	    {
+-	      bfd_byte *p;
++	      bfd_vma off;
+ 	      static reloc_howto_type none_howto
+ 		= HOWTO (0, 0, 0, 0, FALSE, 0, complain_overflow_dont, NULL,
+ 			 "unused", FALSE, 0, 0, FALSE);
+ 
+-	      p = data + (*parent)->address * bfd_octets_per_byte (input_bfd);
+-	      _bfd_clear_contents ((*parent)->howto, input_bfd, input_section,
+-				   p);
++	      off = (*parent)->address * bfd_octets_per_byte (input_bfd);
++	      _bfd_clear_contents ((*parent)->howto, input_bfd,
++				   input_section, data, off);
+ 	      (*parent)->sym_ptr_ptr = bfd_abs_section_ptr->symbol_ptr_ptr;
+ 	      (*parent)->addend = 0;
+ 	      (*parent)->howto = &none_howto;
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
new file mode 100644
index 0000000000..d6c7067715
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
@@ -0,0 +1,47 @@
+From ab419ddbb2cdd17ca83618990f2cacf904ce1d61 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 23 Oct 2018 18:29:24 +1030
+Subject: [PATCH] PR23804, buffer overflow in sec_merge_hash_lookup
+
+	PR 23804
+	* merge.c (_bfd_add_merge_section): Don't attempt to merge
+	sections where size is not a multiple of entsize.
+
+Upstream-Status: Backport
+CVE: CVE-2018-18605
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/merge.c   | 3 +++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 31ff3d6..da423b1 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2018-10-23  Alan Modra  <amodra@gmail.com>
++
++	PR 23804
++	* merge.c (_bfd_add_merge_section): Don't attempt to merge
++	sections where size is not a multiple of entsize.
++
+ 2018-10-13  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 23770
+diff --git a/bfd/merge.c b/bfd/merge.c
+index 7904552..5e3bba0 100644
+--- a/bfd/merge.c
++++ b/bfd/merge.c
+@@ -376,6 +376,9 @@ _bfd_add_merge_section (bfd *abfd, void **psinfo, asection *sec,
+       || sec->entsize == 0)
+     return TRUE;
+ 
++  if (sec->size % sec->entsize != 0)
++    return TRUE;
++
+   if ((sec->flags & SEC_RELOC) != 0)
+     {
+       /* We aren't prepared to handle relocations in merged sections.  */
+-- 
+2.9.3
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
new file mode 100644
index 0000000000..35cf328a14
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
@@ -0,0 +1,70 @@
+From 45a0eaf77022963d639d6d19871dbab7b79703fc Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 23 Oct 2018 19:02:06 +1030
+Subject: [PATCH] PR23806, NULL pointer dereference in merge_strings
+
+	PR 23806
+	* merge.c (_bfd_add_merge_section): Don't attempt to merge
+	sections with ridiculously large alignments.
+
+Upstream-Status: Backport
+CVE: CVE-2018-18606
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ bfd/ChangeLog |  6 ++++++
+ bfd/merge.c   | 15 +++++++++++----
+ 2 files changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 1f3fc1c..c5f7ec7 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,5 +1,11 @@
+ 2018-10-23  Alan Modra  <amodra@gmail.com>
+ 
++	PR 23806
++	* merge.c (_bfd_add_merge_section): Don't attempt to merge
++	sections with ridiculously large alignments.
++
++2018-10-23  Alan Modra  <amodra@gmail.com>
++
+ 	PR 23804
+ 	* merge.c (_bfd_add_merge_section): Don't attempt to merge
+ 	sections where size is not a multiple of entsize.
+diff --git a/bfd/merge.c b/bfd/merge.c
+index 5e3bba0..7de0c88 100644
+--- a/bfd/merge.c
++++ b/bfd/merge.c
+@@ -24,6 +24,7 @@
+    as used in ELF SHF_MERGE.  */
+ 
+ #include "sysdep.h"
++#include <limits.h>
+ #include "bfd.h"
+ #include "elf-bfd.h"
+ #include "libbfd.h"
+@@ -385,12 +386,18 @@ _bfd_add_merge_section (bfd *abfd, void **psinfo, asection *sec,
+       return TRUE;
+     }
+ 
+-  align = sec->alignment_power;
+-  if ((sec->entsize < (unsigned) 1 << align
++#ifndef CHAR_BIT
++#define CHAR_BIT 8
++#endif
++  if (sec->alignment_power >= sizeof (align) * CHAR_BIT)
++    return TRUE;
++
++  align = 1u << sec->alignment_power;
++  if ((sec->entsize < align
+        && ((sec->entsize & (sec->entsize - 1))
+ 	   || !(sec->flags & SEC_STRINGS)))
+-      || (sec->entsize > (unsigned) 1 << align
+-	  && (sec->entsize & (((unsigned) 1 << align) - 1))))
++      || (sec->entsize > align
++	  && (sec->entsize & (align - 1))))
+     {
+       /* Sanity check.  If string character size is smaller than
+ 	 alignment, then we require character size to be a power
+-- 
+2.9.3
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch
new file mode 100644
index 0000000000..38225d171e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch
@@ -0,0 +1,77 @@
+From 102def4da826b3d9e169741421e5e67e8731909a Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 23 Oct 2018 18:30:22 +1030
+Subject: [PATCH] PR23805, NULL pointer dereference in elf_link_input_bfd
+
+	PR 23805
+	* elflink.c (elf_link_input_bfd): Don't segfault on finding
+	STT_TLS symbols without any TLS sections.  Instead, change the
+	symbol type to STT_NOTYPE.
+
+Upstream-Status: Backport
+CVE: CVE-2018-18606
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ bfd/ChangeLog |  7 +++++++
+ bfd/elflink.c | 20 ++++++++++++++------
+ 2 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index da423b1..1f3fc1c 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,5 +1,12 @@
+ 2018-10-23  Alan Modra  <amodra@gmail.com>
+ 
++	PR 23805
++	* elflink.c (elf_link_input_bfd): Don't segfault on finding
++	STT_TLS symbols without any TLS sections.  Instead, change the
++	symbol type to STT_NOTYPE.
++
++2018-10-23  Alan Modra  <amodra@gmail.com>
++
+ 	PR 23806
+ 	* merge.c (_bfd_add_merge_section): Don't attempt to merge
+ 	sections with ridiculously large alignments.
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index c3876cb..87440db 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -10489,8 +10489,11 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
+ 	  if (ELF_ST_TYPE (osym.st_info) == STT_TLS)
+ 	    {
+ 	      /* STT_TLS symbols are relative to PT_TLS segment base.  */
+-	      BFD_ASSERT (elf_hash_table (flinfo->info)->tls_sec != NULL);
+-	      osym.st_value -= elf_hash_table (flinfo->info)->tls_sec->vma;
++	      if (elf_hash_table (flinfo->info)->tls_sec != NULL)
++		osym.st_value -= elf_hash_table (flinfo->info)->tls_sec->vma;
++	      else
++		osym.st_info = ELF_ST_INFO (ELF_ST_BIND (osym.st_info),
++					    STT_NOTYPE);
+ 	    }
+ 	}
+ 
+@@ -11046,12 +11049,17 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
+ 			      sym.st_value += osec->vma;
+ 			      if (ELF_ST_TYPE (sym.st_info) == STT_TLS)
+ 				{
++				  struct elf_link_hash_table *htab
++				    = elf_hash_table (flinfo->info);
++
+ 				  /* STT_TLS symbols are relative to PT_TLS
+ 				     segment base.  */
+-				  BFD_ASSERT (elf_hash_table (flinfo->info)
+-					      ->tls_sec != NULL);
+-				  sym.st_value -= (elf_hash_table (flinfo->info)
+-						   ->tls_sec->vma);
++				  if (htab->tls_sec != NULL)
++				    sym.st_value -= htab->tls_sec->vma;
++				  else
++				    sym.st_info
++				      = ELF_ST_INFO (ELF_ST_BIND (sym.st_info),
++						     STT_NOTYPE);
+ 				}
+ 			    }
+ 
+-- 
+2.9.3
-- 
2.17.1


