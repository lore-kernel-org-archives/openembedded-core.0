Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588ECC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.91298.1749571774699701210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M6HWX3wT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23539a1a421so48841535ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571774; x=1750176574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtoq2I6+ZsUHlDaAZ0PL3VR3j98t19iNV5RfhPl2ziM=;
        b=M6HWX3wTy/QCsNemhslXL1tjIpKUmJqVNPFAcS8dXdqXBGS9iN/HL/9+KEH/MXfVLn
         lIP9ckkOHxXPO0kvjoX2dORO9R8YCq3ZeuiWVo16NA7fxboC5mcJoc7WBCyIiGLSsEBR
         Sk18pVWGK5+6+0yEI8/GPJpPiv/8gIdj1xoXUdACvJyIV0fy7oSSoGFxyWnzJumk0w4l
         DvtERYHi54MCcocC6tjZRGOyLBOz8MFmR1I3BORqwMUVn3ahfw7LmI21eHzcSdZZbxtK
         UdXePao3m/y9aDnnHHxu59JZe3HY2cQo09ZxDicExUfDQYj+pybAFWrt0rBaZA7GC7xE
         KHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571774; x=1750176574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtoq2I6+ZsUHlDaAZ0PL3VR3j98t19iNV5RfhPl2ziM=;
        b=IRecgV7CyClnQADrwPQK2UnIT1SzzR3npALeyOQXnC/Vmgnavs7IgD2LhqDcv02AIY
         AMKXYX/781Dzwy09ffjPeltcjFtLYUsxvj5yArgGBfq9iMERocbRIR3LTMp7oKPV5/q+
         cgBwGWyBwWYuUcjmZWMiEyx21hEyEPrhsHeoQSThc7MJiGgKKV7mHDD54NRE2r8RQeDb
         aszAD5v/xYSr573FY5npAbabFoQuArBjzRL/eJlmzAlKWHLmhVrWB/lTbKvpMV2KRepf
         6gzqdqd+PrLSHiU7B7pv8TH+nRPLHC0PuoPMEq0OAnkaEp5/TGT258swLI32/4bUrP3y
         6QBw==
X-Gm-Message-State: AOJu0YzIoOADumUlsBpdEgoHnMvDWvGTrI0wkwAQRe/u/aDMh7nXw2R7
	pKdsWvLAzui7Llib4EcjainDUXNflpuVv4r7CcRI0tXRFFjnhPfn1VyCSEyz1cMPB6M0srYlJji
	YJx7m
X-Gm-Gg: ASbGncvcvUFMNgaQajn5Pj6aNjLvBQiiou4TDr+8iPzJP+r1C8Kha6LtvaegkC+bF2j
	oYH/rXDMIy6hkTcIXBp+jh8HhpOe/nPiEkHEXGiDU1FgkuNruwluBQeX2hXgFe0G8BwL7/uBONi
	9u+AR1nrpcKmNfEYKWLs1apx7J7eDO5FvD9cxLV1yToWxSh3nKE1RklcGWOCQ6Dsm/pW37uc1Sv
	wfm5aA0AWoC+pkllQsmt80+rhYhiE37UElyX8uEzGZaYhF+2Yc0caPwLb4lKpJci8U5/Cdnn8Ye
	+irdMvcWVBNObivh/DdvIjgCh0u5rEaC/K2Tp9uYi/O05whZJhnwnmz+pKLnZt8t
X-Google-Smtp-Source: AGHT+IEmUmbtv4W6xMTtqk3DaZhIjpFyDBfOMyF1KHMOXvj76H8k3DtDMsd3jUsBxrI1JtdGf57ADg==
X-Received: by 2002:a17:902:f647:b0:235:737:7ba with SMTP id d9443c01a7336-23601debd8fmr298435825ad.44.1749571773544;
        Tue, 10 Jun 2025 09:09:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 26/32] binutils: Fix CVE-2025-1181
Date: Tue, 10 Jun 2025 09:08:39 -0700
Message-ID: <8b9484767f49a558c442668ad9b8e86d6800819b.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218395

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR 32641 [https://sourceware.org/bugzilla/show_bug.cgi?id=32641]
PR 32643 [https://sourceware.org/bugzilla/show_bug.cgi?id=32643]

Upstream-Status: Backport
[https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=18cc11a2771d9e40180485da9a4fb660c03efac3
&& https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=931494c9a89558acb36a03a340c01726545eef24]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |   2 +
 .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
 .../binutils/0017-CVE-2025-1181-2.patch       | 337 ++++++++++++++++++
 3 files changed, 480 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index ae9ec9efa4..f3085ce2ef 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -38,5 +38,7 @@ SRC_URI = "\
      file://0015-CVE-2025-1178.patch \
      file://CVE-2025-1180.patch \
      file://CVE-2025-1182.patch \
+     file://0016-CVE-2025-1181-1.patch \
+     file://0017-CVE-2025-1181-2.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
new file mode 100644
index 0000000000..d3709c7a4f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
@@ -0,0 +1,141 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 14:31:10 +0000
+
+Prevent illegal memory access when checking relocs in a corrupt ELF binary.
+
+PR 32641
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=18cc11a2771d9e40180485da9a4fb660c03efac3]
+CVE: CVE-2025-1181
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
+index 785a37dd7fd..d2bf8e5cbae 100644
+--- a/bfd/elf-bfd.h
++++ b/bfd/elf-bfd.h
+@@ -3150,6 +3150,9 @@ extern bool _bfd_elf_link_mmap_section_contents
+ extern void _bfd_elf_link_munmap_section_contents
+   (asection *);
+ 
++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *);
++
+ /* Large common section.  */
+ extern asection _bfd_elf_large_com_section;
+ 
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 32db254ba6c..2d82c6583c3 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1744,7 +1744,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
+   bool to_reloc_pc32;
+   bool abs_symbol;
+   bool local_ref;
+-  asection *tsec;
++  asection *tsec = NULL;
+   bfd_signed_vma raddend;
+   unsigned int opcode;
+   unsigned int modrm;
+@@ -1910,6 +1910,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
+ 	return true;
+     }
+ 
++  if (tsec == NULL)
++    return false;
++
+   /* Don't convert GOTPCREL relocation against large section.  */
+   if (elf_section_data (tsec) !=  NULL
+       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) != 0)
+@@ -2206,10 +2209,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link_info *info,
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
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 1f1263007c0..eafbd133ff5 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,6 +96,27 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
+   return true;
+ }
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
+@@ -108,6 +129,9 @@ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+     {
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
++      if (h == NULL)
++	return NULL;
++
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 8e5a005fd36..832a5495eb1 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
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
+@@ -1209,10 +1201,12 @@ _bfd_x86_elf_link_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
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
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
new file mode 100644
index 0000000000..5af743582f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
@@ -0,0 +1,337 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 15:43:04 +0000
+
+Add even more checks for corrupt input when processing
+relocations for ELF files.
+
+PR 32643
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=931494c9a89558acb36a03a340c01726545eef24]
+CVE: CVE-2025-1181
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index fd423d61..91cd7c28 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,15 +96,17 @@
+   return true;
+ }
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
+@@ -117,27 +119,28 @@
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
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
++  if (symtab_hdr == NULL)
++    return NULL;
+ 
+-      if (h == NULL)
+-	return NULL;
++  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_info);
++}
+ 
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
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
+@@ -147,7 +150,7 @@
+ {
+   struct elf_link_hash_entry *h;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
+   
+   if (h != NULL)
+     {
+@@ -9105,7 +9108,6 @@
+ 		  size_t symidx,
+ 		  bfd_vma val)
+ {
+-  struct elf_link_hash_entry **sym_hashes;
+   struct elf_link_hash_entry *h;
+   size_t extsymoff = locsymcount;
+ 
+@@ -9128,12 +9130,12 @@
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
+@@ -11611,10 +11613,19 @@
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
+@@ -11749,7 +11760,7 @@
+ 		  || (elf_bad_symtab (input_bfd)
+ 		      && flinfo->sections[r_symndx] == NULL))
+ 		{
+-		  h = sym_hashes[r_symndx - extsymoff];
++		  h = get_link_hash_entry (sym_hashes, r_symndx, extsymoff);
+ 
+ 		  /* Badly formatted input files can contain relocs that
+ 		     reference non-existant symbols.  Check here so that
+@@ -11758,17 +11769,13 @@
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
+@@ -11984,7 +11991,6 @@
+ 			  && flinfo->sections[r_symndx] == NULL))
+ 		    {
+ 		      struct elf_link_hash_entry *rh;
+-		      unsigned long indx;
+ 
+ 		      /* This is a reloc against a global symbol.  We
+ 			 have not yet output all the local symbols, so
+@@ -11993,15 +11999,16 @@
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
+@@ -13965,25 +13972,21 @@
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
+@@ -14032,46 +14035,49 @@
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
++  if (h == NULL)
++    {
++      /* A corrup tinput file can lead to a situation where the index
++	 does not reference either a local or an external symbol.  */
++      if (r_symndx >= cookie->locsymcount)
++	return NULL;
+ 
+-  if (h != NULL)
++      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
++			      &cookie->locsyms[r_symndx]);
++    }
++
++  bool was_marked = h->mark;
++
++  h->mark = 1;
++  /* Keep all aliases of the symbol too.  If an object symbol
++     needs to be copied into .dynbss then all of its aliases
++     should be present as dynamic symbols, not just the one used
++     on the copy relocation.  */
++  hw = h;
++  while (hw->is_weakalias)
+     {
+-      bool was_marked;
++      hw = hw->u.alias;
++      hw->mark = 1;
++    }
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
++  if (!was_marked && h->start_stop && !h->root.ldscript_def)
++    {
++      if (info->start_stop_gc)
++	return NULL;
+ 
+-      if (!was_marked && h->start_stop && !h->root.ldscript_def)
++      /* To work around a glibc bug, mark XXX input sections
++	 when there is a reference to __start_XXX or __stop_XXX
++	 symbols.  */
++      else if (start_stop != NULL)
+ 	{
+-	  if (info->start_stop_gc)
+-	    return NULL;
+-
+-	  /* To work around a glibc bug, mark XXX input sections
+-	     when there is a reference to __start_XXX or __stop_XXX
+-	     symbols.  */
+-	  else if (start_stop != NULL)
+-	    {
+-	      asection *s = h->u2.start_stop_section;
+-	      *start_stop = true;
+-	      return s;
+-	    }
++	  asection *s = h->u2.start_stop_section;
++	  *start_stop = true;
++	  return s;
+ 	}
+-
+-      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
+     }
+ 
+-  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
+-			  &cookie->locsyms[r_symndx]);
++  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
+ }
+ 
+ /* COOKIE->rel describes a relocation against section SEC, which is
+@@ -15094,7 +15100,7 @@
+ 
+       struct elf_link_hash_entry *h;
+ 
+-      h = get_ext_sym_hash (rcookie, r_symndx);
++      h = get_ext_sym_hash_from_cookie (rcookie, r_symndx);
+ 
+       if (h != NULL)
+ 	{
-- 
2.43.0


