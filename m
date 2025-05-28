Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E11C5B552
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:34:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.939.1748446436646597600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jlCaYyzP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74019695377so2997972b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446436; x=1749051236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybMbNofQKljkNBoVEJ312U4PsH2LLqFKXLZ3GJZvGHw=;
        b=jlCaYyzPxDE/H7hmz4L5HWtT4vEdhF1sPhTIrmbY+vTjEDqjXr5haw+nIRQ4Zzsxij
         rMrVBAjU60J4keGsJ/kJaybKZmVe6oSMKCvmeFiwhv1vVOQQOShTqRDoMrtGNB71TRH2
         RPa/LsWrhcLRiQqgl8KV0NYvEwbBcLJVv65jfCoCfAgqeC40+J7AsBf3Glh/4BxZ2s9P
         znOQnUPwjsAJ8PNvqT+/5FjR6bmLmHI7w7pz6Aolr10G/P29/+1GxgZZ3hWPUHEXov+K
         H8998AkSBgpyYbhl7+LEvhH7P03MjnCghqR5AA3OopTpZb0z4Bi70ZNdma+zBa4emdUM
         nQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446436; x=1749051236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybMbNofQKljkNBoVEJ312U4PsH2LLqFKXLZ3GJZvGHw=;
        b=GnCr39lUboicbrh7imQyZ6IzKI3i4DoZGH/IK1VSs3hUefhXDOcQJ+9Zu4KM57LN6F
         9qclkam3ZKQtzEOSWrPXi7DlZydoxKvs/D/fTUlc4uCzFbRr/gRLfL/P6bRNSfWM6Uu+
         M75K7D9SaX5JcyXYp24p1jnSAQ8wggTKIIyVMYNZeIOpVTyq72IOL08ld8ZNsU1VUhEy
         d8mB0S8znS7/iJS+oYeNMbY9xMEtuO6sDGU8cOwUl0wXVOo1qwZkqP8Ftvef2KJz/c4E
         ct9FYCr4WSb9PE35pKnYDd6QyW4xg9uiyJVNjTuKguEJgl547IHqlfWKQEoRSG9C7o62
         apww==
X-Gm-Message-State: AOJu0YzgUlQi/VDDcqkCXy6L3xygfQMEevwb/VQ+LOL8NRVQNBsnwnUO
	sMUx7ICGUouy7K3KaAEfdup/5X9DXriZoeaWAhOJ6hCWr7bMCz69tqX0k76YtjphEQgyjEsz8kW
	WMYUY
X-Gm-Gg: ASbGncuXBj061S2UT8V3JbVtVZ3pJ/5XnnpalkWQsSVJw4sKG6g7Aj9bRzwRCy98mzq
	5LU4T03uYjQQXTLCsZgvGzK+yf+NKY486U0Kz+selR9wzmxeW8FuXshEPX/SWh87svNphrLvhbs
	J4nODmTfbrJ6jluaViipqWj4Cni8bzdE+TBwDGCf/zHSGF6to9otcZibHgCOza1tShv8IPX2/HV
	mZpPEE8/v4cU+cO0uQALoSWfXQCOroOgP4EKXKHaNqM+5SA/W/PyHu8X3ElNN25SNGnG/SlNUxQ
	CEvYwK0kFf4AKpObS5+opnuQVVRF7+PhjM9WBmGMJIE=
X-Google-Smtp-Source: AGHT+IFGNMl5XuFse985u87VPIXs7eK1NlndCUTD5N09qdcl82HOjGEAGnSTQFHPOK6JVm49Z95AUA==
X-Received: by 2002:a05:6a21:6d93:b0:210:1c3a:6804 with SMTP id adf61e73a8af0-2188c370aabmr29723035637.31.1748446434858;
        Wed, 28 May 2025 08:33:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/14] binutils: Fix CVE-2025-1180
Date: Wed, 28 May 2025 08:33:18 -0700
Message-ID: <d3c7b8e15a7be8238969f9eb010bde95a2b6c5ca.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217373

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
CVE: CVE-2025-1180

cherry picked from upstream commit:
https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |   1 +
 .../binutils/binutils/CVE-2025-1180.patch     | 165 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 681b42fc3c..6906ab3efb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -36,5 +36,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-CVE-2025-1178.patch \
+     file://CVE-2025-1180.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
new file mode 100644
index 0000000000..073361cf19
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
@@ -0,0 +1,165 @@
+From 509c5afcd71afd36cd6496f8c84733b11bd5e9e5 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 22 May 2025 01:56:17 -0700
+Subject: [PATCH] Backport fix for PR 32642(CVE-2025-1180)
+
+Backporting the fix from PR 32636 to fix PR 32642 (ld SEGV (illegal read access)
+in _bfd_elf_write_section_eh_frame (bfd/elf-eh-frame.c:2234:29) with
+ --gc-sections --gc-keep-exported option)
+
+https://nvd.nist.gov/vuln/detail/CVE-2025-1180 is associated with
+PR32642 which will get fixed with commit from PR 32636.
+
+(cherry picked from commit: f9978defb6fab0bd8583942d97c112b0932ac814)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
+CVE: CVE-2025-1180
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 88 +++++++++++++++++++++++++--------------------------
+ 1 file changed, 44 insertions(+), 44 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 6346d7e2b4b..d765b688801 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,22 +96,37 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
+   return true;
+ }
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
+-    {
+-      struct elf_link_hash_entry *h;
++  struct elf_link_hash_entry *h = NULL;
+ 
++  if ((r_symndx >= cookie->locsymcount
++       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      && r_symndx >= cookie->extsymoff)
++    {
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
++    }
++
++  return h;
++}
+ 
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
+@@ -119,21 +134,20 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
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
+@@ -13994,22 +14008,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
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
+-	  info->callbacks->fatal (_("%F%P: corrupt input: %pB\n"),
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
+@@ -15064,17 +15068,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+       if (r_symndx == STN_UNDEF)
+ 	return true;
+ 
+-      if (r_symndx >= rcookie->locsymcount
+-	  || ELF_ST_BIND (rcookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-	{
+-	  struct elf_link_hash_entry *h;
+-
+-	  h = rcookie->sym_hashes[r_symndx - rcookie->extsymoff];
++      struct elf_link_hash_entry *h;
+ 
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++      h = get_ext_sym_hash (rcookie, r_symndx);
+ 
++      if (h != NULL)
++	{
+ 	  if ((h->root.type == bfd_link_hash_defined
+ 	       || h->root.type == bfd_link_hash_defweak)
+ 	      && (h->root.u.def.section->owner != rcookie->abfd
+@@ -15098,6 +15097,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
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


