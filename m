Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A47EC5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 15:40:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.8799.1748619606290596045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 08:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S8BKq8Ww;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234d2d914bcso15798945ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748619605; x=1749224405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vtX63IAO7esInJhyzUKByfPlrElW7+z5a4VEoC3mrM=;
        b=S8BKq8WwpoTzEo84D5TPcC/uEBecjblsItwNcArV7yLQfV8aSjzPYWojCCKXmt2pQm
         O+oY/xuQ2TgMho7zGsaMnykFubgLlR+j5o0bkY+RGEncW0Bv0ULPp+gMacfS7OBvvcKR
         8xYncHHwus8EeiT8m8S1D/bBNjBYAqFuKjs0JpCGErWmC9pK7b+MXZCGm778q6GmeLd5
         yDJclDbZK7G0z3bSG0jLP1XRUSq6y8/75lYwgI9bVUfG2h2qmqOZRq3N+IgcQ6l2HXU9
         OVarAnUKXXmlPBMZF32hm9+x7YL9rMTv/BLpLess2rIldKCnOJS6XILtXVbqbXK5uZP+
         zTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619605; x=1749224405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vtX63IAO7esInJhyzUKByfPlrElW7+z5a4VEoC3mrM=;
        b=Nc9R74Krw6n12NJIDSZARjQCHeH1LCqqKTNbVpLilpJNw++kZbZKJzjl9bPo0YBXrL
         POfM9c0+ur0mAlcV0UhaZW0Ilm+4Y4rkJDYPy3PLGLczt2i/pW1kHoAkbgVZDHh7ih5+
         bRhbzoWSN3T6+KirRUVnYC2ofV1HRWovhmxJCws3sJPmK3hwBeUpJmuqBBd4MWREY0TA
         f2vWhGR3OWE4S1DYikMt241inJBcFnjWe21C1vi3czGvzMeJ1xQTql5pYlpN3bmQ+tD0
         ps3itGVHtoCCHO7e3Bn6ZrLkOZdPhsDbBaGCp+AZ9R7ZQlOxKWVgd7ad6DVDUqJGlVNJ
         fB2w==
X-Gm-Message-State: AOJu0YwQRuGBeZ5neplYDKU15+P9RY6vsNeYd48tyK4Q8sXaiJhXd0x6
	UUfk95iP4E/QjdQ4xgVn20X2LxCRfErq61sNd7TH79s+dqLVRt3mTbozIs4Y4a7rViD33UXQVbP
	iHaWb
X-Gm-Gg: ASbGncttYp8V+zBbkBLVGzICvmAxkZdqZFFjL0jNtqoeS8xo3uCp06K62Obyo5ZsNYo
	Z6Q1e1NvnD3FeLRWYnIKtL8ZuS2lT3fkt0+b2QYeqahZl8j4HGFP4UETDLV5Phu/0ma9WyWLsW9
	w/4QNXTyDHNxIgjknVV5geXzQcuwIVqe5HxlJU2KtCVZ8/yX5Zz3S2OYRjgGXauuO0spe5towDC
	4D81lReRZ82xFMk2C0WgnUnLqZOejMge3VJjcH/9EW/9VIdHz7rPD0vk/tGxnlKBZlSwa9+2zjh
	mK++yK+8h9bC70kmNqwjGLwo4CjA43V2yUwgd/fZF/0=
X-Google-Smtp-Source: AGHT+IGEOqndxr0bou4WD/mGtsVqvpNW1KNruaxjAgaARxzXR6EvkgWNsNx3i2v6Eh6fSwhbtCS1KA==
X-Received: by 2002:a17:903:1c9:b0:234:a139:1210 with SMTP id d9443c01a7336-23529b46870mr60752265ad.53.1748619605470;
        Fri, 30 May 2025 08:40:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9116sm29903075ad.200.2025.05.30.08.40.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:40:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] binutils: fix CVE-2025-1180
Date: Fri, 30 May 2025 08:39:46 -0700
Message-ID: <8178f44f18777b2c8acc0afb9fd43921a9a8e76e.1748619488.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748619488.git.steve@sakoman.com>
References: <cover.1748619488.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217512

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Backporting the fix from PR 32636 to fix PR 32642 (ld SEGV (illegal read access)
in _bfd_elf_write_section_eh_frame (bfd/elf-eh-frame.c:2234:29) with
 --gc-sections --gc-keep-exported option)

https://nvd.nist.gov/vuln/detail/CVE-2025-1180 is associated with
PR32642 which will get fixed with commit from PR 32636.

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814]
CVE: CVE-2025-1180

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0040-CVE-2025-1180.patch         | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 82dd5c9eb6..01fd03d2f4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -74,5 +74,6 @@ SRC_URI = "\
      file://0037-CVE-2024-53589.patch \
      file://0038-CVE-2025-0840.patch \
      file://0039-CVE-2025-1178.patch \
+     file://0040-CVE-2025-1180.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch
new file mode 100644
index 0000000000..a422f9d1ae
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch
@@ -0,0 +1,164 @@
+From 82670cebd1fcecfc16c075c1bd9ec404e3f9af41 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 29 May 2025 02:41:27 -0700
+Subject: [PATCH] Prevent illegal memory access when indexing into the 
+ sym_hashes array of the elf bfd cookie structure.
+
+PR 32636
+
+(cherry picked from commit: f9978defb6fab0bd8583942d97c112b0932ac814)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814]
+CVE: CVE-2025-1180
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 90 ++++++++++++++++++++++++++-------------------------
+ 1 file changed, 46 insertions(+), 44 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index f8521426cad..4c21a0229e7 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
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
+@@ -78,6 +79,22 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
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
+@@ -85,21 +102,20 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
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
+@@ -13642,22 +13658,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
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
+@@ -14703,17 +14709,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
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
+@@ -14737,6 +14738,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 		  || discarded_section (isec)))
+ 	    return true;
+ 	}
++
+       return false;
+     }
+   return false;
+-- 
+2.49.0
+
-- 
2.43.0


