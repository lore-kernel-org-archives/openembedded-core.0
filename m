Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766F9C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 12:50:15 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.28040.1744548612044202403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 05:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VOH+CVNg;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7376dd56f60so2362157b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744548611; x=1745153411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3ZoP3WMXGuilTL7gVXf7YLRgHOe5IooBR9WCPGSoKs=;
        b=VOH+CVNgitnUomlCzLfOSbigYaFBFJaCrLTdiJ5Wb2aMjzVPFZeomPtQbVjQsegQDN
         5/Taqv+F6SCA2oAqGQ+Xd1aJxGrKoGxA+JkSMmgBTnLK6S28gmVcm1tgyVxD0Wvxsodb
         zVT/Nw+uS34Yn35owfecDvlQ2YWNtBUSS8XE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744548611; x=1745153411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3ZoP3WMXGuilTL7gVXf7YLRgHOe5IooBR9WCPGSoKs=;
        b=Lc6zpIoggR1jDxPg8nJpB0KIUhhn/QB0pLG3Ci3tT/Nji1Om5IayQVMYzhcLAkRWc9
         TiU2CydSOtGmTsOm+jRFJDpZ9I82c6xz/rWZhoqC5OcDF7y0QZE0vGKpQBqw8XeuSp7H
         3XSL6tYxJ6kgSRpxnB+X+m2tm0nLcjjF+kclnsgeiDYMFDu5lGq3FPD6fFE5qnKaJncM
         Ey4G8fQqgF4P4ZG446oxivvSWwyMxu6k3S9sNL3j6OwATeKV3Vgp4evC78o8ThSq+M36
         AsmA/jsXZJQxei8nQFJCHGcPPje20PLiVCAA5k1vhVbUtSz43bqWyKsoI42UXuMhVr8H
         P72A==
X-Gm-Message-State: AOJu0YyaeOOSjcBt1H5lIvdvNT5reLLGvEd6RSHH7QJwll0m8WqoJwfm
	tAoSu1DMKTFDJohwswQ2OhS93ck2ebuKCsDVQVWhV8qgpeGLZBI2TNLoIXpMXt90o80YOtADAa/
	u1Ys=
X-Gm-Gg: ASbGncuNNqM27ApLfs5dkK0+GIOxu5MAMpV4av17whU6KtOW9N6vf4IacLy1MKEPjdA
	o84ech+Pftamh2nRY0zUlm7xFe+f//GnoR28A+X3YSrSlHvyq/Yh97kutaHGgqdmzAe09mwZg9J
	qn04T8Yng2D0SZx2UfWb3TWpYg03NPioPGRYnbzdQRc84y09Y67eNrcmpERveh20DdX/nh8XY28
	HiLJwux+hJn+Br774F3W+LOcg7GlXR0cx4FTHsz/P6YSHyU/BclAtZCj44SDoS7GgOq9RlfAd6O
	WK7VWisXn5nfYksMo46pe0HKcDskarJTAAjNsA==
X-Google-Smtp-Source: AGHT+IEeGCLEH9mA8W3EsSdbR7AvUvO2lyAbjs7xEeEgl4mVgLUYuyzSRegAW0jni1Wyjjs91Lk5Ag==
X-Received: by 2002:a05:6a00:1152:b0:736:4ebd:e5a with SMTP id d2e1a72fcca58-73bd12beebamr12511732b3a.20.1744548610665;
        Sun, 13 Apr 2025 05:50:10 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c31:8d4d:1d6b:b6f:7983:b315])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd1fe6b4esm4910681b3a.0.2025.04.13.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 05:50:10 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Sun, 13 Apr 2025 18:20:04 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] binutils: Fix CVE-2025-1176
Date: Sun, 13 Apr 2025 18:20:03 +0530
Message-Id: <20250413125003.1166518-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 12:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214787

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/binutils/plain/debian/patches/CVE-2025-1176.patch?h=applied/ubuntu/jammy-security
Upstream commit https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2025-1176.patch     | 156 ++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1176.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 809c4207d4..0ca00552ce 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -39,5 +39,6 @@ SRC_URI = "\
      file://0016-CVE-2024-53589.patch \
      file://0017-dlltool-file-name-too-long.patch \
      file://0018-CVE-2025-0840.patch \
+     file://CVE-2025-1176.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1176.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1176.patch
new file mode 100644
index 0000000000..1ecf09569d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1176.patch
@@ -0,0 +1,156 @@
+From f9978defb6fab0bd8583942d97c112b0932ac814 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 11:15:11 +0000
+Subject: [PATCH] Prevent illegal memory access when indexing into the
+ sym_hashes array of the elf bfd cookie structure.
+
+PR 32636
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/binutils/plain/debian/patches/CVE-2025-1176.patch?h=applied/ubuntu/jammy-security&id=62a5cc5a49f4be036cf98d2b8fc7d618620ba672
+Upstream commit https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814]
+CVE: CVE-2025-1176
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+Index: binutils-2.38/bfd/elflink.c
+===================================================================
+--- binutils-2.38.orig/bfd/elflink.c
++++ binutils-2.38/bfd/elflink.c
+@@ -62,15 +62,16 @@ struct elf_find_verdep_info
+ static bool _bfd_elf_fix_symbol_flags
+   (struct elf_link_hash_entry *, struct elf_info_failed *);
+ 
+-asection *
+-_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+-			     unsigned long r_symndx,
+-			     bool discard)
++static struct elf_link_hash_entry *
++get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ {
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++  struct elf_link_hash_entry *h = NULL;
++
++  if ((r_symndx >= cookie->locsymcount
++       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      && r_symndx >= cookie->extsymoff)
+     {
+-      struct elf_link_hash_entry *h;
+ 
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
+@@ -78,6 +79,22 @@ _bfd_elf_section_for_symbol (struct elf_
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+ 
++    }
++
++  return h;
++}
++ 
++asection *
++_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
++			     unsigned long r_symndx,
++			     bool discard)
++{
++  struct elf_link_hash_entry *h;
++
++  h = get_ext_sym_hash (cookie, r_symndx);
++  
++  if (h != NULL)
++    {
+       if ((h->root.type == bfd_link_hash_defined
+ 	   || h->root.type == bfd_link_hash_defweak)
+ 	   && discarded_section (h->root.u.def.section))
+@@ -85,21 +102,20 @@ _bfd_elf_section_for_symbol (struct elf_
+       else
+ 	return NULL;
+     }
+-  else
+-    {
+-      /* It's not a relocation against a global symbol,
+-	 but it could be a relocation against a local
+-	 symbol for a discarded section.  */
+-      asection *isec;
+-      Elf_Internal_Sym *isym;
+ 
+-      /* Need to: get the symbol; get the section.  */
+-      isym = &cookie->locsyms[r_symndx];
+-      isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
+-      if (isec != NULL
+-	  && discard ? discarded_section (isec) : 1)
+-	return isec;
+-     }
++  /* It's not a relocation against a global symbol,
++     but it could be a relocation against a local
++     symbol for a discarded section.  */
++  asection *isec;
++  Elf_Internal_Sym *isym;
++
++  /* Need to: get the symbol; get the section.  */
++  isym = &cookie->locsyms[r_symndx];
++  isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
++  if (isec != NULL
++      && discard ? discarded_section (isec) : 1)
++    return isec;
++
+   return NULL;
+ }
+ 
+@@ -13642,22 +13658,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_i
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++  h = get_ext_sym_hash (cookie, r_symndx);
++  
++  if (h != NULL)
+     {
+       bool was_marked;
+ 
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+-      if (h == NULL)
+-	{
+-	  info->callbacks->einfo (_("%F%P: corrupt input: %pB\n"),
+-				  sec->owner);
+-	  return NULL;
+-	}
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-
+       was_marked = h->mark;
+       h->mark = 1;
+       /* Keep all aliases of the symbol too.  If an object symbol
+@@ -14703,17 +14709,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma
+       if (r_symndx == STN_UNDEF)
+ 	return true;
+ 
+-      if (r_symndx >= rcookie->locsymcount
+-	  || ELF_ST_BIND (rcookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-	{
+-	  struct elf_link_hash_entry *h;
+-
+-	  h = rcookie->sym_hashes[r_symndx - rcookie->extsymoff];
+-
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++      struct elf_link_hash_entry *h;
+ 
++      h = get_ext_sym_hash (rcookie, r_symndx);
++      
++      if (h != NULL)
++	{
+ 	  if ((h->root.type == bfd_link_hash_defined
+ 	       || h->root.type == bfd_link_hash_defweak)
+ 	      && (h->root.u.def.section->owner != rcookie->abfd
+@@ -14737,6 +14738,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma
+ 		  || discarded_section (isec)))
+ 	    return true;
+ 	}
++
+       return false;
+     }
+   return false;
-- 
2.34.1


