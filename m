Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D545DC369C5
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:14:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.29950.1744834466092055578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qfYbKt0r;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7396f13b750so3327b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744834465; x=1745439265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gu7SOM6eN2G0ZRRx+s3B0205DCLMLf5iwMoGremxa4s=;
        b=qfYbKt0rrLcazZ595zO8pjk15MRJbrYM6zYnKLbM1sKos3r13FQ3NLWf35ORkEOU0C
         K2EYkel6JPKaHnxfuH0AaOcjGjbZa0H8iTGcioQ8DnzOGe8wGYPQIq0h1YAxSaT/SLSd
         ZW7n6XUHHm8J+LW4unu2aCyXu9FJslJWkepx1zJN4n5G/6BolccYDKQO2098YaiYKsIT
         EOj5DkStyQPIPc8jjvwObKqXbw4HffBrG9Ux4hIPWOtbZozm+6TLlulM1/KU+92b73ii
         xrV6uLcNeJto4UNdtOPUovMyBhJBMOZNnb5fkU5V7BxnR5SuFHkCi1nqY9BHZ7kuWQIO
         uoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834465; x=1745439265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gu7SOM6eN2G0ZRRx+s3B0205DCLMLf5iwMoGremxa4s=;
        b=Abtw/ZP/tbyTyh6+2z2PSFw5XrveFQJBT5m/pH6aXTZFKNElH8zTrVSYLRb4xDvbRs
         ES4k/qUe0ICQyweqssycuM5eI9/JPF+TyETvRjP/JRSpbBrwFrTy2fdXrNQe4b/drwdb
         jQv8iDG30EY+krP9GBt8oBQn7AHTduWVzcPjhpHcv80kOMpQ9ZcvzpVt8LSD3jDm1AQP
         xcosEcDOcucPUsSVn12u+U/sLCBzRMGiBpvQHWh/u0n1pyf0rVGGNBe8gK0MHb9qr3iO
         94MQOYY8cxDE/x4n2NC6W1/DUqWogQl7Rm6lxvYK1nFcLahIwLyd/CLDL6Bsl43hOcLY
         +RLg==
X-Gm-Message-State: AOJu0YxzX6862H8tGkKVUB8bQrYKa7hEhGvpZDxvenOS4DB4f8BlgJuL
	wS+yxLJyXLFkQhlGzvMWNemXDyPHlDfa8J8z8kz1oGOcddGPYQUuElUrUL7TgGC1hdIEi374zSm
	8
X-Gm-Gg: ASbGncvnytAPhmpMmcxqxwq2w+HjXT7j4YBiXDTHazIsqtMpBTshVMzNh18WYVMTO+O
	BnvT9EBfD2JNx6ZE93mRqVoCfrDZ1qXN8jpp9s3WGo1cOZdt0+bPcuaH0YaBSQ2xV3+GicFxQiA
	tWWp0QcCMSTCchAwBtFA2u37B6BlaJSFlsGR0p2Ww2QikeoDemoeK57p5oyutnq7453odT5SUQw
	MZ+iCZv0ebwqicE5OauP5yfbDVxUEsD6Eo3xAQNaxgtUtuaeCAmqguCnF7WdKm5xW++I0oIB0rX
	zLvSggpZ4LOehw7QzpdQYvJOK8b/c0xZ
X-Google-Smtp-Source: AGHT+IGCxCRlcCria91gybMdycD/XgtlOtFOgyImguqNNPZ4a5YjA3sodOnbCVbddfww6g1WO2kK7w==
X-Received: by 2002:a05:6a21:6d8c:b0:1ee:d687:c39b with SMTP id adf61e73a8af0-203b3e6affdmr4613313637.7.1744834465308;
        Wed, 16 Apr 2025 13:14:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aeb8:30c6:2c5c:85aa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b222029ccsm1703880a12.62.2025.04.16.13.14.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:14:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/6] binutils: Fix CVE-2025-1176
Date: Wed, 16 Apr 2025 13:14:11 -0700
Message-ID: <9273daf22d251221e5bcac1de21713e28149ad1d.1744834364.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744834364.git.steve@sakoman.com>
References: <cover.1744834364.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215009

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/binutils/plain/debian/patches/CVE-2025-1176.patch?h=applied/ubuntu/jammy-security
Upstream commit https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


