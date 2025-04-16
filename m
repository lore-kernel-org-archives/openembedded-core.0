Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FF1C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:08:13 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.14676.1744794489609664217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EFVqOzpS;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so5074313a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744794488; x=1745399288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQPLJr1jM60onLhzQej5HZqglUBAYztAd0kUPTWTKuU=;
        b=EFVqOzpSb1QlTjldWgb4gIB7C554qL4eCQOPriSDAxFEuth6hV5iOjFvvXnHSuCLnc
         Bui7Q27uH+zLQO5D0QF4pwy7ljmqkmimbRtMxoMM8gqa0ssCbF+NexY1u/Akm8JwAb17
         NCCbyY2Vci3Q+o9NaspyFLhZwI930gMVRbJe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794488; x=1745399288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQPLJr1jM60onLhzQej5HZqglUBAYztAd0kUPTWTKuU=;
        b=wk++LBtjzxzhKd6Ew6vessXvIKwHBOe90VJ9viruIRqrZp7Mq80/7SQMnBEh60ZktY
         Vf4MTK7aVhBpSyyOAr2Kz6zuyNzVvUSfIYQRKp2JBXpAyrhSmSa2kvGgIxpaGqOHC3qM
         jme9/4Jy5p1fD/iaL2/Nf6Pl6Jb6J6SUkFF0DxEGTZ0oK536u38NeKbMgWwDxFWVy0LW
         t1yjH+Pj8o5qcu7yfa0U1DADeoRnqLS4kGHFQT6yWI2Et8MylHQkPZE+IFvhsjQvSEkg
         HbjfQqcs8Eo2gwbFq3dd608/s8PTEspVy2E9RMXs8m6VMDCpGTW0v+IcBBAA5vwFNzGE
         F1+A==
X-Gm-Message-State: AOJu0YxxFMq6hR0pNR2HyOQp6qvwREL+PSW/5jIF89e48OyKywMCMX9a
	nvOzSnQJ/yQdt5IbzSSFGWOkpVlZBFdft7mSXs+Ev6Y8GEl/vI8gIc//Wg1VDe/cE/+L4FuhgqS
	lI/E=
X-Gm-Gg: ASbGncv0NS5NxHK6QSVUuxwCzfaL81EAs93l9LoKVdzH4OC3ciWNoRY9OAcNkmrGN7k
	br2dLsuZzNfHg3Zdo54B5a/bvorvbTyQ7m8IV2S80BNXO92YKJDZghhNZbRbkPQk8ku/bMydS0L
	KXTB0llSMP0TAaRA1KL1izd+6u+nISIcVuLE2OogBOr6TGsjI/4I+0APLZmXgmVP68Z8DGwCirZ
	wjz7Hfbexhv7/iryHseVonWxUl/DzO22Y1i10WRpuINMOjKos2D8OKvmEmcfFoUS2H4wEXnUFTY
	R0eLPeie4rpzeX45dfPipMWI7jRpgRFF2GcKFg==
X-Google-Smtp-Source: AGHT+IGAwUZ6ENc555HKsmTqSa9VK0MxlH8wCXOrnTBO7sKYus+QoiJUBM16teaPIQ3lXhCUj1uqxg==
X-Received: by 2002:a17:90b:2547:b0:305:5f32:d9f0 with SMTP id 98e67ed59e1d1-30863f300c7mr1589076a91.19.1744794488302;
        Wed, 16 Apr 2025 02:08:08 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c31:8d4d:603b:3076:e232:176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086122a8absm1056826a91.35.2025.04.16.02.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:08:07 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Wed, 16 Apr 2025 14:38:02 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] binutils: patch CVE-2025-1181
Date: Wed, 16 Apr 2025 14:38:01 +0530
Message-Id: <20250416090801.2460048-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214984

Import patches from ubuntu:

Upstream-Status: Backport [ https://git.launchpad.net/ubuntu/+source/binutils/plain/debian/patches/CVE-2025-1181-pre.patch?h=applied/ubuntu/noble-security&id=d6b5bf57cf048c42e4bcd3a4ab32116d0b809774 &&
https://git.launchpad.net/ubuntu/+source/binutils/plain/debian/patches/CVE-2025-1181.patch?h=applied/ubuntu/noble-security&id=d6b5bf57cf048c42e4bcd3a4ab32116d0b809774

Upstream commit: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=931494c9a89558acb36a03a340c01726545eef24 ]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../binutils/binutils-2.42.inc                |   2 +
 .../binutils/binutils/CVE-2025-1181-pre.patch | 151 ++++++++
 .../binutils/binutils/CVE-2025-1181.patch     | 345 ++++++++++++++++++
 3 files changed, 498 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index d366350556..758bd8dcce 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -42,5 +42,7 @@ SRC_URI = "\
      file://CVE-2025-1176.patch \
      file://CVE-2025-1178.patch \
      file://CVE-2024-57360.patch \
+     file://CVE-2025-1181-pre.patch \
+     file://CVE-2025-1181.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
new file mode 100644
index 0000000000..280e522a28
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
@@ -0,0 +1,151 @@
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/binutils/plain/debian/patches/CVE-2025-1181-pre.patch?h=applied/ubuntu/noble-security&id=d6b5bf57cf048c42e4bcd3a4ab32116d0b809774]
+Upstream commit [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=931494c9a89558acb36a03a340c01726545eef24]
+
+CVE: CVE-2025-1181
+
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ bfd/elf-bfd.h      |  3 +++
+ bfd/elf64-x86-64.c | 10 +++++-----
+ bfd/elflink.c      | 24 ++++++++++++++++++++++++
+ bfd/elfxx-x86.c    | 20 +++++++-------------
+ 4 files changed, 39 insertions(+), 18 deletions(-)
+diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
+index 3ed22fa6..07add7d0 100644
+--- a/bfd/elf-bfd.h
++++ b/bfd/elf-bfd.h
+@@ -3126,6 +3126,9 @@ extern bool _bfd_elf_maybe_set_textrel
+ extern bool _bfd_elf_add_dynamic_tags
+   (bfd *, struct bfd_link_info *, bool);
+ 
++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *);
++
+ /* Large common section.  */
+ extern asection _bfd_elf_large_com_section;
+ 
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index d0d3b0e5..c3fb375c 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1665,7 +1665,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
+   bool to_reloc_pc32;
+   bool abs_symbol;
+   bool local_ref;
+-  asection *tsec;
++  asection *tsec = NULL;
+   bfd_signed_vma raddend;
+   unsigned int opcode;
+   unsigned int modrm;
+@@ -1831,6 +1831,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
+ 	return true;
+     }
+ 
++  if (tsec == NULL)
++    return false;
++
+   /* Don't convert GOTPCREL relocation against large section.  */
+   if (elf_section_data (tsec) !=  NULL
+       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) != 0)
+@@ -2127,10 +2130,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link_info *info,
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
+index 11ec6bd9..e5521d7b 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -49,6 +49,27 @@ struct elf_info_failed
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
+@@ -62,6 +83,9 @@ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ 
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
++      if (h == NULL)
++	return NULL;
++
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 508fd771..8c261cf8 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -972,15 +972,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
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
+@@ -1205,10 +1197,12 @@ _bfd_x86_elf_link_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
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
index 0000000000..70b7485777
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
@@ -0,0 +1,345 @@
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/binutils/plain/debian/patches/CVE-2025-1181.patch?h=applied/ubuntu/noble-security&id=d6b5bf57cf048c42e4bcd3a4ab32116d0b809774]
+Upstream commit [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=931494c9a89558acb36a03a340c01726545eef24]
+
+CVE: CVE-2025-1181
+
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index e5521d7b..ff84229c 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -49,15 +49,17 @@ struct elf_info_failed
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
+@@ -70,29 +72,28 @@ _bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
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
+@@ -102,7 +103,7 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+ {
+   struct elf_link_hash_entry *h;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
+   
+   if (h != NULL)
+     {
+@@ -8906,7 +8907,6 @@ set_symbol_value (bfd *bfd_with_globals,
+ 		  size_t symidx,
+ 		  bfd_vma val)
+ {
+-  struct elf_link_hash_entry **sym_hashes;
+   struct elf_link_hash_entry *h;
+   size_t extsymoff = locsymcount;
+ 
+@@ -8929,12 +8929,12 @@ set_symbol_value (bfd *bfd_with_globals,
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
+@@ -11405,10 +11405,19 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
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
+@@ -11542,7 +11551,7 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
+ 		  || (elf_bad_symtab (input_bfd)
+ 		      && flinfo->sections[r_symndx] == NULL))
+ 		{
+-		  h = sym_hashes[r_symndx - extsymoff];
++		  h = get_link_hash_entry (sym_hashes, r_symndx, extsymoff);
+ 
+ 		  /* Badly formatted input files can contain relocs that
+ 		     reference non-existant symbols.  Check here so that
+@@ -11551,17 +11560,13 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
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
+@@ -11777,7 +11782,6 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
+ 			  && flinfo->sections[r_symndx] == NULL))
+ 		    {
+ 		      struct elf_link_hash_entry *rh;
+-		      unsigned long indx;
+ 
+ 		      /* This is a reloc against a global symbol.  We
+ 			 have not yet output all the local symbols, so
+@@ -11786,15 +11790,16 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
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
+@@ -13758,25 +13763,21 @@ _bfd_elf_gc_mark_hook (asection *sec,
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
+@@ -13825,46 +13826,49 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
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
+@@ -14878,7 +14882,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 
+       struct elf_link_hash_entry *h;
+ 
+-      h = get_ext_sym_hash (rcookie, r_symndx);
++      h = get_ext_sym_hash_from_cookie (rcookie, r_symndx);
+       
+       if (h != NULL)
+ 	{
-- 
2.34.1


