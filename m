Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630F6D37E33
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:22:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10063.1768396944713815101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DGE4A35X;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so2342843b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1768396944; x=1769001744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmenmTuB9Fccbk5DJdplfkrjKXUdZtCTOrnYwc+xe54=;
        b=DGE4A35XAM289DNeubK+ZZA2BiA96pBRRbO0iiR1K+/J2STohoHibBxIlDk/Ovrb2f
         uJL5g4rcINSDLSy/0dLAl1fQXt85lC8juyFxbmk2sDe04MVKLZLnbXFwvxHixp7dJIh2
         1T99Khxu5YXOdB/4SiRltly1+J9YcYfnUs8sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396944; x=1769001744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmenmTuB9Fccbk5DJdplfkrjKXUdZtCTOrnYwc+xe54=;
        b=rZeCMTvDW8CPKAuP8Uawj4RAkOJ2NvImXC7aef+WUQ4vn1BwX9T1FLNDMXR9vMRa4y
         C3QOY4SrHlLuthYbtppRhBetgWUTQrRd/sUI7NqBkbNijCCtWMo+FlWt0YtmrnMB0R2t
         k4uhjTkqCLEcyT9806HvjQxmGl9WkYQQvjTLlEprhmjyRih0+uNQhvyfSN1IY51xFC8e
         3rOg55wtFfcuqTbOxc0lT7mjNeScbH97vZz5EzZyC/8GGxkzhCoT/4BRLzurMKHZjUGv
         yARIxnxhlqfLZ21rve8trBVLCrTaw/0nuPgYEuDvkLV/LvPgWuu1Hk02J1miGiqafS+L
         N5Bg==
X-Gm-Message-State: AOJu0Yyy89Zqn26Ca24NIOczQ/nandgmuimmMcDiGFwLMSpVmxyOUryO
	gdMyTpQfHAt9WLGAPDsant1nEV/Jtt//hoqZhjwC4Mk3SIVoUgI7EQHD6sM1VjRIJ4zQxjRfTMT
	e8ECx7xo=
X-Gm-Gg: AY/fxX48Bkz7hRd7MMu7kiyvD9/4Wz0n086FYkdH0soomyxqnZCTbdnaO6A4nnBLtAH
	ln1SrL4vASnQImJcdsuZzmrqPj+YDpk9U+smtvLhTaaP0juUln0JdqzETi/x+xiIG4qN2CJXtpG
	03AfwVM547otudGnbfWXG6vI2NC80Aq7zm24R2VktBfFx3NxQ3Gd33aoTU++nCzc+9+GJzK+68i
	TzLGOvuoZZGMBUVcyagM5cU/dI0OFL/KC1rx3sXXepS77BZnhReuypB6lbIWCvNCK+01zoVIb92
	3ew9cmwr0Co2e81t18Th1VuNhteiYPhVB3Ziz+SogAV1jyB7stXPBWx7rx5PGsgdzWq+3a0brIM
	ofIa/tANHUb+QWXm0PrCwUv9iu8UEcAy+bomhWr0FzR36Ls96sNRzZzMK9pb19jO/ChPRahOtZt
	gw/O0yGjBLWplZnm239CJWSeVn
X-Received: by 2002:a05:6a00:419a:b0:81c:717b:9d29 with SMTP id d2e1a72fcca58-81f8200e4d5mr2558616b3a.51.1768396943419;
        Wed, 14 Jan 2026 05:22:23 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:f9ef:128c:d5ce:723a:f9dc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5de6405sm23325714b3a.61.2026.01.14.05.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:22:22 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] binutils: Fix CVE-2025-1181
Date: Wed, 14 Jan 2026 18:52:13 +0530
Message-Id: <20260114132213.1865341-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229329

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2025-1181

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/binutils/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=931494c9a89558acb36a03a340c01726545eef24
&
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=931494c9a89558acb36a03a340c01726545eef24]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../binutils/binutils-2.38.inc                |   2 +
 .../binutils/binutils/CVE-2025-1181-pre.patch | 149 ++++++++
 .../binutils/binutils/CVE-2025-1181.patch     | 342 ++++++++++++++++++
 3 files changed, 493 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index d5ad3c0ecb..63bd65c59c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -86,5 +86,7 @@ SRC_URI = "\
      file://0047-CVE-2025-8225.patch \
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
+     file://CVE-2025-1181-pre.patch \
+     file://CVE-2025-1181.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
new file mode 100644
index 0000000000..dc9e9b624e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
@@ -0,0 +1,149 @@
+Backported of:
+
+From 18cc11a2771d9e40180485da9a4fb660c03efac3 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 14:31:10 +0000
+Subject: [PATCH] Prevent illegal memory access when checking relocs in a
+ corrupt ELF binary.
+
+PR 32641
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/binutils/tree/debian/patches/CVE-2025-1181-pre.patch?h=ubuntu/jammy-security
+Upstream commit https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=931494c9a89558acb36a03a340c01726545eef24]
+CVE: CVE-2025-1181
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ bfd/elf-bfd.h      |  3 +++
+ bfd/elf64-x86-64.c | 10 +++++-----
+ bfd/elflink.c      | 24 ++++++++++++++++++++++++
+ bfd/elfxx-x86.c    | 20 +++++++-------------
+ 4 files changed, 39 insertions(+), 18 deletions(-)
+Index: binutils-2.38/bfd/elf-bfd.h
+===================================================================
+--- binutils-2.38.orig/bfd/elf-bfd.h
++++ binutils-2.38/bfd/elf-bfd.h
+@@ -3007,6 +3007,9 @@ extern bool _bfd_elf_maybe_set_textrel
+ extern bool _bfd_elf_add_dynamic_tags
+   (bfd *, struct bfd_link_info *, bool);
+ 
++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *);
++
+ /* Large common section.  */
+ extern asection _bfd_elf_large_com_section;
+ 
+Index: binutils-2.38/bfd/elf64-x86-64.c
+===================================================================
+--- binutils-2.38.orig/bfd/elf64-x86-64.c
++++ binutils-2.38/bfd/elf64-x86-64.c
+@@ -1484,7 +1484,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd
+   bool to_reloc_pc32;
+   bool abs_symbol;
+   bool local_ref;
+-  asection *tsec;
++  asection *tsec = NULL;
+   bfd_signed_vma raddend;
+   unsigned int opcode;
+   unsigned int modrm;
+@@ -1639,6 +1639,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd
+ 	return true;
+     }
+ 
++  if (tsec == NULL)
++    return false;
++
+   /* Don't convert GOTPCREL relocation against large section.  */
+   if (elf_section_data (tsec) !=  NULL
+       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) != 0)
+@@ -1915,10 +1918,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struc
+       else
+ 	{
+ 	  isym = NULL;
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	  h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
+ 	}
+ 
+       /* Check invalid x32 relocations.  */
+Index: binutils-2.38/bfd/elflink.c
+===================================================================
+--- binutils-2.38.orig/bfd/elflink.c
++++ binutils-2.38/bfd/elflink.c
+@@ -62,6 +62,27 @@ struct elf_find_verdep_info
+ static bool _bfd_elf_fix_symbol_flags
+   (struct elf_link_hash_entry *, struct elf_info_failed *);
+ 
++struct elf_link_hash_entry *
++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++			      unsigned int                   symndx,
++			      Elf_Internal_Shdr *            symtab_hdr)
++{
++  if (symndx < symtab_hdr->sh_info)
++    return NULL;
++
++  struct elf_link_hash_entry *h = sym_hashes[symndx - symtab_hdr->sh_info];
++
++  /* The hash might be empty.  See PR 32641 for an example of this.  */
++  if (h == NULL)
++    return NULL;
++
++  while (h->root.type == bfd_link_hash_indirect
++	 || h->root.type == bfd_link_hash_warning)
++    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++
++  return h;
++}
++
+ static struct elf_link_hash_entry *
+ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ {
+@@ -75,6 +96,9 @@ get_ext_sym_hash (struct elf_reloc_cooki
+ 
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
++      if (h == NULL)
++	return NULL;
++
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+Index: binutils-2.38/bfd/elfxx-x86.c
+===================================================================
+--- binutils-2.38.orig/bfd/elfxx-x86.c
++++ binutils-2.38/bfd/elfxx-x86.c
+@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
+ 	  goto error_return;
+ 	}
+ 
+-      if (r_symndx < symtab_hdr->sh_info)
+-	h = NULL;
+-      else
+-	{
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-	}
++      h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
+ 
+       if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r_type)
+ 	  && NEED_DYNAMIC_RELOCATION_P (is_x86_64, info, true, h, sec,
+@@ -1200,10 +1192,12 @@ _bfd_x86_elf_link_relax_section (bfd *ab
+       else
+ 	{
+ 	  /* Get H and SEC for GENERATE_DYNAMIC_RELOCATION_P below.  */
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	  h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
++	  if (h == NULL)
++	    {
++	      /* FIXMEL: Issue an error message ?  */
++	      continue;
++	    }
+ 
+ 	  if (h->root.type == bfd_link_hash_defined
+ 	      || h->root.type == bfd_link_hash_defweak)
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
new file mode 100644
index 0000000000..2bcd55795d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
@@ -0,0 +1,342 @@
+Backported of:
+
+From 931494c9a89558acb36a03a340c01726545eef24 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 15:43:04 +0000
+Subject: [PATCH] Add even more checks for corrupt input when processing
+ relocations for ELF files.
+
+PR 32643
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/binutils/tree/debian/patches/CVE-2025-1181.patch?h=ubuntu/jammy-security
+Upstream commit https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=931494c9a89558acb36a03a340c01726545eef24]
+CVE: CVE-2025-1181
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+
+Index: binutils-2.38/bfd/elflink.c
+===================================================================
+--- binutils-2.38.orig/bfd/elflink.c
++++ binutils-2.38/bfd/elflink.c
+@@ -62,15 +62,17 @@ struct elf_find_verdep_info
+ static bool _bfd_elf_fix_symbol_flags
+   (struct elf_link_hash_entry *, struct elf_info_failed *);
+ 
+-struct elf_link_hash_entry *
+-_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
+-			      unsigned int                   symndx,
+-			      Elf_Internal_Shdr *            symtab_hdr)
++static struct elf_link_hash_entry *
++get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++		     unsigned int                   symndx,
++		     unsigned int                   ext_sym_start)
+ {
+-  if (symndx < symtab_hdr->sh_info)
++  if (sym_hashes == NULL
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      || symndx < ext_sym_start)
+     return NULL;
+ 
+-  struct elf_link_hash_entry *h = sym_hashes[symndx - symtab_hdr->sh_info];
++  struct elf_link_hash_entry *h = sym_hashes[symndx - ext_sym_start];
+ 
+   /* The hash might be empty.  See PR 32641 for an example of this.  */
+   if (h == NULL)
+@@ -83,29 +85,28 @@ _bfd_elf_get_link_hash_entry (struct elf
+   return h;
+ }
+ 
+-static struct elf_link_hash_entry *
+-get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
++struct elf_link_hash_entry *
++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++			      unsigned int                   symndx,
++			      Elf_Internal_Shdr *            symtab_hdr)
+ {
+-  struct elf_link_hash_entry *h = NULL;
+-
+-  if ((r_symndx >= cookie->locsymcount
+-       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-      /* Guard against corrupt input.  See PR 32636 for an example.  */
+-      && r_symndx >= cookie->extsymoff)
+-    {
+-
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+-
+-      if (h == NULL)
+-	return NULL;
++  if (symtab_hdr == NULL)
++    return NULL;
+ 
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
++  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_info);
++}
+ 
+-    }
++static struct elf_link_hash_entry *
++get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
++{
++  if (cookie == NULL || cookie->sym_hashes == NULL)
++    return NULL;
++  
++  if (r_symndx >= cookie->locsymcount
++      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++    return get_link_hash_entry (cookie->sym_hashes, r_symndx, cookie->extsymoff);
+ 
+-  return h;
++  return NULL;
+ }
+  
+ asection *
+@@ -115,7 +116,7 @@ _bfd_elf_section_for_symbol (struct elf_
+ {
+   struct elf_link_hash_entry *h;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
+   
+   if (h != NULL)
+     {
+@@ -8783,7 +8784,6 @@ set_symbol_value (bfd *bfd_with_globals,
+ 		  size_t symidx,
+ 		  bfd_vma val)
+ {
+-  struct elf_link_hash_entry **sym_hashes;
+   struct elf_link_hash_entry *h;
+   size_t extsymoff = locsymcount;
+ 
+@@ -8806,12 +8806,12 @@ set_symbol_value (bfd *bfd_with_globals,
+ 
+   /* It is a global symbol: set its link type
+      to "defined" and give it a value.  */
+-
+-  sym_hashes = elf_sym_hashes (bfd_with_globals);
+-  h = sym_hashes [symidx - extsymoff];
+-  while (h->root.type == bfd_link_hash_indirect
+-	 || h->root.type == bfd_link_hash_warning)
+-    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++  h = get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symidx, extsymoff);
++  if (h == NULL)
++    {
++      /* FIXMEL What should we do ?  */
++      return;
++    }
+   h->root.type = bfd_link_hash_defined;
+   h->root.u.def.value = val;
+   h->root.u.def.section = bfd_abs_section_ptr;
+@@ -11281,10 +11281,19 @@ elf_link_input_bfd (struct elf_final_lin
+ 	      || (elf_bad_symtab (input_bfd)
+ 		  && flinfo->sections[symndx] == NULL))
+ 	    {
+-	      struct elf_link_hash_entry *h = sym_hashes[symndx - extsymoff];
+-	      while (h->root.type == bfd_link_hash_indirect
+-		     || h->root.type == bfd_link_hash_warning)
+-		h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	      struct elf_link_hash_entry *h;
++
++	      h = get_link_hash_entry (sym_hashes, symndx, extsymoff);
++	      if (h == NULL)
++		{
++		  _bfd_error_handler
++		    /* xgettext:c-format */
++		    (_("error: %pB: unable to create group section symbol"),
++		     input_bfd);
++		  bfd_set_error (bfd_error_bad_value);
++		  return false;
++		}	      
++
+ 	      /* Arrange for symbol to be output.  */
+ 	      h->indx = -2;
+ 	      elf_section_data (osec)->this_hdr.sh_info = -2;
+@@ -11411,7 +11420,7 @@ elf_link_input_bfd (struct elf_final_lin
+ 		  || (elf_bad_symtab (input_bfd)
+ 		      && flinfo->sections[r_symndx] == NULL))
+ 		{
+-		  h = sym_hashes[r_symndx - extsymoff];
++		  h = get_link_hash_entry (sym_hashes, r_symndx, extsymoff);
+ 
+ 		  /* Badly formatted input files can contain relocs that
+ 		     reference non-existant symbols.  Check here so that
+@@ -11420,17 +11429,13 @@ elf_link_input_bfd (struct elf_final_lin
+ 		    {
+ 		      _bfd_error_handler
+ 			/* xgettext:c-format */
+-			(_("error: %pB contains a reloc (%#" PRIx64 ") for section %pA "
++			(_("error: %pB contains a reloc (%#" PRIx64 ") for section '%pA' "
+ 			   "that references a non-existent global symbol"),
+ 			 input_bfd, (uint64_t) rel->r_info, o);
+ 		      bfd_set_error (bfd_error_bad_value);
+ 		      return false;
+ 		    }
+ 
+-		  while (h->root.type == bfd_link_hash_indirect
+-			 || h->root.type == bfd_link_hash_warning)
+-		    h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-
+ 		  s_type = h->type;
+ 
+ 		  /* If a plugin symbol is referenced from a non-IR file,
+@@ -11646,7 +11651,6 @@ elf_link_input_bfd (struct elf_final_lin
+ 			  && flinfo->sections[r_symndx] == NULL))
+ 		    {
+ 		      struct elf_link_hash_entry *rh;
+-		      unsigned long indx;
+ 
+ 		      /* This is a reloc against a global symbol.  We
+ 			 have not yet output all the local symbols, so
+@@ -11655,15 +11659,16 @@ elf_link_input_bfd (struct elf_final_lin
+ 			 reloc to point to the global hash table entry
+ 			 for this symbol.  The symbol index is then
+ 			 set at the end of bfd_elf_final_link.  */
+-		      indx = r_symndx - extsymoff;
+-		      rh = elf_sym_hashes (input_bfd)[indx];
+-		      while (rh->root.type == bfd_link_hash_indirect
+-			     || rh->root.type == bfd_link_hash_warning)
+-			rh = (struct elf_link_hash_entry *) rh->root.u.i.link;
+-
+-		      /* Setting the index to -2 tells
+-			 elf_link_output_extsym that this symbol is
+-			 used by a reloc.  */
++		      rh = get_link_hash_entry (elf_sym_hashes (input_bfd),
++						r_symndx, extsymoff);
++		      if (rh == NULL)
++			{
++			  /* FIXME: Generate an error ?  */
++			  continue;
++			}
++
++		      /* Setting the index to -2 tells elf_link_output_extsym
++			 that this symbol is used by a reloc.  */
+ 		      BFD_ASSERT (rh->indx < 0);
+ 		      rh->indx = -2;
+ 		      *rel_hash = rh;
+@@ -13615,25 +13620,21 @@ _bfd_elf_gc_mark_hook (asection *sec,
+ 		       struct elf_link_hash_entry *h,
+ 		       Elf_Internal_Sym *sym)
+ {
+-  if (h != NULL)
++  if (h == NULL)
++    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
++
++  switch (h->root.type)
+     {
+-      switch (h->root.type)
+-	{
+-	case bfd_link_hash_defined:
+-	case bfd_link_hash_defweak:
+-	  return h->root.u.def.section;
++    case bfd_link_hash_defined:
++    case bfd_link_hash_defweak:
++      return h->root.u.def.section;
+ 
+-	case bfd_link_hash_common:
+-	  return h->root.u.c.p->section;
++    case bfd_link_hash_common:
++      return h->root.u.c.p->section;
+ 
+-	default:
+-	  break;
+-	}
++    default:
++      return NULL;
+     }
+-  else
+-    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
+-
+-  return NULL;
+ }
+ 
+ /* Return the debug definition section.  */
+@@ -13682,46 +13683,49 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_i
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
+-  
+-  if (h != NULL)
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
++  if (h == NULL)
+     {
+-      bool was_marked;
++      /* A corrup tinput file can lead to a situation where the index
++	 does not reference either a local or an external symbol.  */
++      if (r_symndx >= cookie->locsymcount)
++	return NULL;
+ 
+-      was_marked = h->mark;
+-      h->mark = 1;
+-      /* Keep all aliases of the symbol too.  If an object symbol
+-	 needs to be copied into .dynbss then all of its aliases
+-	 should be present as dynamic symbols, not just the one used
+-	 on the copy relocation.  */
+-      hw = h;
+-      while (hw->is_weakalias)
+-	{
+-	  hw = hw->u.alias;
+-	  hw->mark = 1;
+-	}
++      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
++			      &cookie->locsyms[r_symndx]);
++    }
+ 
+-      if (!was_marked && h->start_stop && !h->root.ldscript_def)
+-	{
+-	  if (info->start_stop_gc)
+-	    return NULL;
++  bool was_marked = h->mark;
+ 
+-	  /* To work around a glibc bug, mark XXX input sections
+-	     when there is a reference to __start_XXX or __stop_XXX
+-	     symbols.  */
+-	  else if (start_stop != NULL)
+-	    {
+-	      asection *s = h->u2.start_stop_section;
+-	      *start_stop = true;
+-	      return s;
+-	    }
+-	}
++  h->mark = 1;
++  /* Keep all aliases of the symbol too.  If an object symbol
++     needs to be copied into .dynbss then all of its aliases
++     should be present as dynamic symbols, not just the one used
++     on the copy relocation.  */
++  hw = h;
++  while (hw->is_weakalias)
++    {
++      hw = hw->u.alias;
++      hw->mark = 1;
++    }
+ 
+-      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
++  if (!was_marked && h->start_stop && !h->root.ldscript_def)
++    {
++      if (info->start_stop_gc)
++	return NULL;
++
++      /* To work around a glibc bug, mark XXX input sections
++	 when there is a reference to __start_XXX or __stop_XXX
++	 symbols.  */
++      else if (start_stop != NULL)
++	{
++	  asection *s = h->u2.start_stop_section;
++	  *start_stop = true;
++	  return s;
++	}
+     }
+ 
+-  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
+-			  &cookie->locsyms[r_symndx]);
++  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
+ }
+ 
+ /* COOKIE->rel describes a relocation against section SEC, which is
+@@ -14735,7 +14739,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma
+ 
+       struct elf_link_hash_entry *h;
+ 
+-      h = get_ext_sym_hash (rcookie, r_symndx);
++      h = get_ext_sym_hash_from_cookie (rcookie, r_symndx);
+       
+       if (h != NULL)
+ 	{
-- 
2.25.1


