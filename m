Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BC2C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 00:16:45 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.37959.1747959395596743411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 17:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJGWAlFc;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-310cf7f12e8so756959a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747959395; x=1748564195; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWt+if5arte9EFBXIk4MHUH0nJK6KufcKh+EkuSRqMc=;
        b=IJGWAlFcBZgiKwb+eTjp6SBohdFtRmtafPHacKUlxL8rdGili0Ac9tIgyzCwpRcLmX
         BR+zmrJaKp7GaBAHUznkNuQ6umJBOT6HeHe0HGPz3+TVdcApT/hGjFlbhjKS9tEGUGHe
         r6UyYNvpOocJkou07f63iMGvi5vkd2VY1GE4JOfSVmlOlqUNECnEGlavQI1qWtagmz1W
         Oy70SjPqDYe8Ts1hxuzeajGbkOiRvhdPsDPrOY1s9FQyyNv67nYloH7DOp1RRUjd+X3x
         caH/iYnoWNrpuWcRMQTZr/yL+jicRFW0Bbiy+pMmloGnsPKsM3mEKYKglIOfJnEj8cd3
         fT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959395; x=1748564195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWt+if5arte9EFBXIk4MHUH0nJK6KufcKh+EkuSRqMc=;
        b=NULiOqtDUoMOJ6boIzQxG4+DaUxBHkDe76isp8ZHVxvQ3h7Ylje5K1OG0FKm4hH1v+
         rAzKVZZ5X/SFhOvhuUkNKHbd9Q7duKdUsEIctYLw6AZM9AoUEnUQkBzK0s+gXxdlAKSq
         cQZjdZY/i9Xznp2gcXVuQOppQcvGHlffcrdwm1xxb/+Vv6/ZiH/R1tmWSwiI/VYpFyIM
         TWItNwGpAeULZIMMoshYuNLMYRcRq6ZgZzaxUk6Nq/NRYg74bcoctDKnjQzO7yHmNVDj
         gpZ9JrxlP6NZGzcdrOFG7b8NER24OgG0N24BRdU0ZjliPRCgU8YSsNS2ytq4a0sZpbyH
         jAqw==
X-Forwarded-Encrypted: i=1; AJvYcCU+BStK10CAEv4CD/4k1MyhxIlH5jF9rbdIWNRuMge/Yx7tXIhFDqOa0z9G4izSBJwgQlr4jA3ROWoIuX9HmZTpnQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxVTgWGrl1zh/hIYOTvyINcWM2OPc4Rp5LqLjYwk5MftaQpfFOs
	7YjcrZlVi3b4E6+J87gqnhFi6L0swVA3afXuHiyrp7JLTMbq7SxQvs35
X-Gm-Gg: ASbGnctnJtFNd7L7ULZcDxZYuGTpQeAaqxp0KquIulddN4VZEnf6wErF5q+RH/A2RFs
	lUyML5ZjqI/uue2A+1Tmi9r14cQJCJZs//5ZkU1Db5DRDhGm67fT6grPsRReURAo6dBVRI5bMH0
	jwsqSytHpDPfCV6g5S3bkpS+QpkxZylnoNv5sZLO1SP/DhahGhRvAm2LLstW9iCGNtPuki8KROZ
	PaZnSka3vtiuIjtzk+Md10xqqP18nMMNA5ikqPbbTMJkxqCKlQ/nRWU7wk79Ou63EfqGc8C7O+Z
	cjvtXVSUyChRkekGvkrYpljx2KO2bIslyHhURxm2x4ixPCkiWX03dGAcTgzT5d0lhFyi4G9PefE
	Bpoae3uk9R+wc8JQBit8qNsyJea5XQ7esBDH+C6yHrEoX1fGG4IKK5Nlih8H2guKdvw==
X-Google-Smtp-Source: AGHT+IGCPdgNMQ7ZUTuYEvnZ2zdkr47RWTsTebmVACVUucM30VzrzxSnijPyxIqGtm1yyNC7f69LGw==
X-Received: by 2002:a17:90b:134b:b0:30a:a38f:f78b with SMTP id 98e67ed59e1d1-310e96c9550mr1762336a91.9.1747959394835;
        Thu, 22 May 2025 17:16:34 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:7444:5952:9108:1ddc? ([2601:646:8201:fd20:7444:5952:9108:1ddc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365f3487sm6084430a91.42.2025.05.22.17.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 17:16:34 -0700 (PDT)
Message-ID: <c8872756-9150-410b-9dee-01a0248ceeb3@gmail.com>
Date: Thu, 22 May 2025 17:16:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] binutils: Fix CVE-2025-1180
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250522121710.3923755-1-Harish.Sadineni@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250522121710.3923755-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 00:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217155



On 5/22/25 5:17 AM, Sadineni, Harish via lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> 
> Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
> CVE: CVE-2025-1180
> 
> cherry picked from upstream commit:
> https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814
> 
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>   .../binutils/binutils-2.44.inc                |   1 +
>   .../binutils/binutils/CVE-2025-1180.patch     | 165 ++++++++++++++++++
>   2 files changed, 166 insertions(+)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
> index 6bc65a0fea..256d408018 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
> @@ -35,5 +35,6 @@ SRC_URI = "\
>        file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
>        file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
>        file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
> +     file://CVE-2025-1180.patch \
>   "
>   S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
> new file mode 100644
> index 0000000000..073361cf19
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
> @@ -0,0 +1,165 @@
> +From 509c5afcd71afd36cd6496f8c84733b11bd5e9e5 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Thu, 22 May 2025 01:56:17 -0700
> +Subject: [PATCH] Backport fix for PR 32642(CVE-2025-1180)
> +
> +Backporting the fix from PR 32636 to fix PR 32642 (ld SEGV (illegal read access)
> +in _bfd_elf_write_section_eh_frame (bfd/elf-eh-frame.c:2234:29) with
> + --gc-sections --gc-keep-exported option)
> +
> +https://nvd.nist.gov/vuln/detail/CVE-2025-1180 is associated with
> +PR32642 which will get fixed with commit from PR 32636.
> +
> +(cherry picked from commit: f9978defb6fab0bd8583942d97c112b0932ac814)
> +Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
> +CVE: CVE-2025-1180
> +

Looks ok to me.

Have we run binutils tests with this patch applied ? I would recommend 
we do that, and I would also wait for backport response upstream meanwhile.

> +Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> +---
> + bfd/elflink.c | 88 +++++++++++++++++++++++++--------------------------
> + 1 file changed, 44 insertions(+), 44 deletions(-)
> +
> +diff --git a/bfd/elflink.c b/bfd/elflink.c
> +index 6346d7e2b4b..d765b688801 100644
> +--- a/bfd/elflink.c
> ++++ b/bfd/elflink.c
> +@@ -96,22 +96,37 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
> +   return true;
> + }
> +
> +-asection *
> +-_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
> +-			     unsigned long r_symndx,
> +-			     bool discard)
> ++static struct elf_link_hash_entry *
> ++get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
> + {
> +-  if (r_symndx >= cookie->locsymcount
> +-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
> +-    {
> +-      struct elf_link_hash_entry *h;
> ++  struct elf_link_hash_entry *h = NULL;
> +
> ++  if ((r_symndx >= cookie->locsymcount
> ++       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
> ++      /* Guard against corrupt input.  See PR 32636 for an example.  */
> ++      && r_symndx >= cookie->extsymoff)
> ++    {
> +       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
> +
> +       while (h->root.type == bfd_link_hash_indirect
> + 	     || h->root.type == bfd_link_hash_warning)
> + 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
> ++    }
> ++
> ++  return h;
> ++}
> +
> ++asection *
> ++_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
> ++			     unsigned long r_symndx,
> ++			     bool discard)
> ++{
> ++  struct elf_link_hash_entry *h;
> ++
> ++  h = get_ext_sym_hash (cookie, r_symndx);
> ++
> ++  if (h != NULL)
> ++    {
> +       if ((h->root.type == bfd_link_hash_defined
> + 	   || h->root.type == bfd_link_hash_defweak)
> + 	   && discarded_section (h->root.u.def.section))
> +@@ -119,21 +134,20 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
> +       else
> + 	return NULL;
> +     }
> +-  else
> +-    {
> +-      /* It's not a relocation against a global symbol,
> +-	 but it could be a relocation against a local
> +-	 symbol for a discarded section.  */
> +-      asection *isec;
> +-      Elf_Internal_Sym *isym;
> +
> +-      /* Need to: get the symbol; get the section.  */
> +-      isym = &cookie->locsyms[r_symndx];
> +-      isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
> +-      if (isec != NULL
> +-	  && discard ? discarded_section (isec) : 1)
> +-	return isec;
> +-     }
> ++  /* It's not a relocation against a global symbol,
> ++     but it could be a relocation against a local
> ++     symbol for a discarded section.  */
> ++  asection *isec;
> ++  Elf_Internal_Sym *isym;
> ++
> ++  /* Need to: get the symbol; get the section.  */
> ++  isym = &cookie->locsyms[r_symndx];
> ++  isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
> ++  if (isec != NULL
> ++      && discard ? discarded_section (isec) : 1)
> ++    return isec;
> ++
> +   return NULL;
> + }
> +
> +@@ -13994,22 +14008,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
> +   if (r_symndx == STN_UNDEF)
> +     return NULL;
> +
> +-  if (r_symndx >= cookie->locsymcount
> +-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
> ++  h = get_ext_sym_hash (cookie, r_symndx);
> ++
> ++  if (h != NULL)
> +     {
> +       bool was_marked;
> +
> +-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
> +-      if (h == NULL)
> +-	{
> +-	  info->callbacks->fatal (_("%F%P: corrupt input: %pB\n"),
> +-				  sec->owner);
> +-	  return NULL;
> +-	}
> +-      while (h->root.type == bfd_link_hash_indirect
> +-	     || h->root.type == bfd_link_hash_warning)
> +-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
> +-
> +       was_marked = h->mark;
> +       h->mark = 1;
> +       /* Keep all aliases of the symbol too.  If an object symbol
> +@@ -15064,17 +15068,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
> +       if (r_symndx == STN_UNDEF)
> + 	return true;
> +
> +-      if (r_symndx >= rcookie->locsymcount
> +-	  || ELF_ST_BIND (rcookie->locsyms[r_symndx].st_info) != STB_LOCAL)
> +-	{
> +-	  struct elf_link_hash_entry *h;
> +-
> +-	  h = rcookie->sym_hashes[r_symndx - rcookie->extsymoff];
> ++      struct elf_link_hash_entry *h;
> +
> +-	  while (h->root.type == bfd_link_hash_indirect
> +-		 || h->root.type == bfd_link_hash_warning)
> +-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
> ++      h = get_ext_sym_hash (rcookie, r_symndx);
> +
> ++      if (h != NULL)
> ++	{
> + 	  if ((h->root.type == bfd_link_hash_defined
> + 	       || h->root.type == bfd_link_hash_defweak)
> + 	      && (h->root.u.def.section->owner != rcookie->abfd
> +@@ -15098,6 +15097,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
> + 		  || discarded_section (isec)))
> + 	    return true;
> + 	}
> ++
> +       return false;
> +     }
> +   return false;
> +--
> +2.49.0
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217093): https://lists.openembedded.org/g/openembedded-core/message/217093
> Mute This Topic: https://lists.openembedded.org/mt/113245812/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


