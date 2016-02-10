Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4F49E731A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 00:04:15 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q0Lt64nrVz3hjBH;
	Wed, 10 Feb 2016 01:04:14 +0100 (CET)
X-Auth-Info: H0UloRaHh+GTb3etTjzFrGneKrYjm2duhNlsV5l3e/k=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3q0Lt62rv5zvdWt;
	Wed, 10 Feb 2016 01:04:14 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 01:04:01 +0100
Message-Id: <1455062646-12311-2-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455062646-12311-1-git-send-email-marex@denx.de>
References: <1455062646-12311-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH V2 2/7] binutils: Repair nios2 PLT and GP handling
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
X-List-Received-Date: Wed, 10 Feb 2016 00:04:19 -0000

Repair corner cases in nios2 PLT and GP handling. See the patches
themselves for extensive detailed explanation.

The patches don't contain the ChangeLog entries, since the changelog
entries often cause trouble when applying the patch.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
V2: Add SoB lines to the backported patches
    Update to binutils 2.26
---
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   2 +
 ...ress-computations-in-initial-PLT-entries-.patch |  72 ++++++++++++++
 ...014-Correct-nios2-_gp-address-computation.patch | 106 +++++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-Correct-nios2-_gp-address-computation.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
index c955471..dd5c8ca 100644
--- a/meta/recipes-devtools/binutils/binutils-2.26.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -32,6 +32,8 @@ SRC_URI = "\
      file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0011-Change-default-emulation-for-mips64-linux.patch \
      file://0012-Add-XLP-instructions-support.patch \
+     file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
+     file://0014-Correct-nios2-_gp-address-computation.patch \
      "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch b/meta/recipes-devtools/binutils/binutils/0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch
new file mode 100644
index 0000000..a62b519
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch
@@ -0,0 +1,72 @@
+From 45490ccc18bbb518550209c38b2278b04703c183 Mon Sep 17 00:00:00 2001
+From: Sandra Loosemore <sandra@codesourcery.com>
+Date: Wed, 9 Dec 2015 16:13:58 -0800
+Subject: [PATCH 1/2] Fix GOT address computations in initial PLT entries for
+ nios2.
+
+2015-12-09  Sandra Loosemore  <sandra@codesourcery.com>
+
+	bfd/
+	* elf32-nios2.c (nios2_elf32_finish_dynamic_sections): Correct
+	%hiadj/%lo computations for _GLOBAL_OFFSET_TABLE_ in initial
+	PLT entries.  Assert alignment requirements.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Backport
+---
+ bfd/elf32-nios2.c | 23 ++++++++++++++++-------
+ 1 file changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/bfd/elf32-nios2.c b/bfd/elf32-nios2.c
+index 6b29d8b..1c54320 100644
+--- a/bfd/elf32-nios2.c
++++ b/bfd/elf32-nios2.c
+@@ -5383,12 +5383,17 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 				 + sgotplt->output_offset);
+ 	  if (bfd_link_pic (info))
+ 	    {
+-	      bfd_vma corrected = got_address - (splt->output_section->vma
+-						 + splt->output_offset + 4);
++	      bfd_vma got_pcrel = got_address - (splt->output_section->vma
++						 + splt->output_offset);
++	      /* Both GOT and PLT must be aligned to a 16-byte boundary
++		 for the two loads to share the %hiadj part.  The 4-byte
++		 offset for nextpc is accounted for in the %lo offsets
++		 on the loads.  */
++	      BFD_ASSERT ((got_pcrel & 0xf) == 0);
+ 	      nios2_elf32_install_data (splt, nios2_so_plt0_entry, 0, 6);
+-	      nios2_elf32_install_imm16 (splt, 4, hiadj (corrected));
+-	      nios2_elf32_install_imm16 (splt, 12, (corrected & 0xffff) + 4);
+-	      nios2_elf32_install_imm16 (splt, 16, (corrected & 0xffff) + 8);
++	      nios2_elf32_install_imm16 (splt, 4, hiadj (got_pcrel));
++	      nios2_elf32_install_imm16 (splt, 12, got_pcrel & 0xffff);
++	      nios2_elf32_install_imm16 (splt, 16, (got_pcrel + 4) & 0xffff);
+ 	    }
+ 	  else
+ 	    {
+@@ -5404,6 +5409,10 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 			    6 | ((res_size - (res_offset + 4)) << 6),
+ 			    splt->contents + res_offset);
+ 
++	      /* The GOT must be aligned to a 16-byte boundary for the
++		 two loads to share the same %hiadj part.  */
++	      BFD_ASSERT ((got_address & 0xf) == 0);
++
+ 	      nios2_elf32_install_data (splt, nios2_plt0_entry, res_size, 7);
+ 	      nios2_elf32_install_imm16 (splt, res_size, hiadj (res_start));
+ 	      nios2_elf32_install_imm16 (splt, res_size + 4,
+@@ -5411,9 +5420,9 @@ nios2_elf32_finish_dynamic_sections (bfd *output_bfd,
+ 	      nios2_elf32_install_imm16 (splt, res_size + 12,
+ 					 hiadj (got_address));
+ 	      nios2_elf32_install_imm16 (splt, res_size + 16,
+-					 (got_address & 0xffff) + 4);
++					 (got_address + 4) & 0xffff);
+ 	      nios2_elf32_install_imm16 (splt, res_size + 20,
+-					 (got_address & 0xffff) + 8);
++					 (got_address + 8) & 0xffff);
+ 	    }
+ 	}
+     }
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Correct-nios2-_gp-address-computation.patch b/meta/recipes-devtools/binutils/binutils/0014-Correct-nios2-_gp-address-computation.patch
new file mode 100644
index 0000000..7a4c1db
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0014-Correct-nios2-_gp-address-computation.patch
@@ -0,0 +1,106 @@
+From fcf984ae68c89e5495e65fe6456650cc014b5ea7 Mon Sep 17 00:00:00 2001
+From: Sandra Loosemore <sandra@codesourcery.com>
+Date: Sun, 27 Dec 2015 12:30:26 -0800
+Subject: [PATCH 2/2] Correct nios2 _gp address computation.
+
+2015-12-27  Sandra Loosemore  <sandra@codesourcery.com>
+
+	bfd/
+	* elf32-nios2.c (nios2_elf_assign_gp): Correct computation of _gp
+	address.
+	(nios2_elf32_relocate_section): Tidy code for R_NIOS2_GPREL error
+	messages.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Backport
+---
+ bfd/elf32-nios2.c | 31 +++++++++++++++++++++----------
+ 1 file changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/bfd/elf32-nios2.c b/bfd/elf32-nios2.c
+index 1c54320..babecf3 100644
+--- a/bfd/elf32-nios2.c
++++ b/bfd/elf32-nios2.c
+@@ -3086,7 +3086,15 @@ lookup:
+ 	case bfd_link_hash_defined:
+ 	case bfd_link_hash_defweak:
+ 	  gp_found = TRUE;
+-	  *pgp = lh->u.def.value;
++	  {
++	    asection *sym_sec = lh->u.def.section;
++	    bfd_vma sym_value = lh->u.def.value;
++
++	    if (sym_sec->output_section)
++	      sym_value = (sym_value + sym_sec->output_offset
++			   + sym_sec->output_section->vma);
++	    *pgp = sym_value;
++	  }
+ 	  break;
+ 	case bfd_link_hash_indirect:
+ 	case bfd_link_hash_warning:
+@@ -3719,7 +3727,6 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+       struct elf32_nios2_link_hash_entry *eh;
+       bfd_vma relocation;
+       bfd_vma gp;
+-      bfd_vma reloc_address;
+       bfd_reloc_status_type r = bfd_reloc_ok;
+       const char *name = NULL;
+       int r_type;
+@@ -3762,12 +3769,6 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+       if (bfd_link_relocatable (info))
+ 	continue;
+ 
+-      if (sec && sec->output_section)
+-	reloc_address = (sec->output_section->vma + sec->output_offset
+-			 + rel->r_offset);
+-      else
+-	reloc_address = 0;
+-
+       if (howto)
+ 	{
+ 	  switch (howto->type)
+@@ -3816,6 +3817,15 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+ 	      /* Turns an absolute address into a gp-relative address.  */
+ 	      if (!nios2_elf_assign_gp (output_bfd, &gp, info))
+ 		{
++		  bfd_vma reloc_address;
++
++		  if (sec && sec->output_section)
++		    reloc_address = (sec->output_section->vma
++				     + sec->output_offset
++				     + rel->r_offset);
++		  else
++		    reloc_address = 0;
++
+ 		  format = _("global pointer relative relocation at address "
+ 			     "0x%08x when _gp not defined\n");
+ 		  sprintf (msgbuf, format, reloc_address);
+@@ -3825,7 +3835,7 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+ 	      else
+ 		{
+ 		  bfd_vma symbol_address = rel->r_addend + relocation;
+-		  relocation = relocation + rel->r_addend - gp;
++		  relocation = symbol_address - gp;
+ 		  rel->r_addend = 0;
+ 		  if (((signed) relocation < -32768
+ 		       || (signed) relocation > 32767)
+@@ -3833,6 +3843,8 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+ 			  || h->root.type == bfd_link_hash_defined
+ 			  || h->root.type == bfd_link_hash_defweak))
+ 		    {
++		      if (h)
++			name = h->root.root.string;
+ 		      format = _("Unable to reach %s (at 0x%08x) from the "
+ 				 "global pointer (at 0x%08x) because the "
+ 				 "offset (%d) is out of the allowed range, "
+@@ -3848,7 +3860,6 @@ nios2_elf32_relocate_section (bfd *output_bfd,
+ 						  rel->r_offset, relocation,
+ 						  rel->r_addend);
+ 		}
+-
+ 	      break;
+ 	    case R_NIOS2_UJMP:
+ 	      r = nios2_elf32_do_ujmp_relocate (input_bfd, howto,
+-- 
+2.7.0
+
-- 
2.1.4


