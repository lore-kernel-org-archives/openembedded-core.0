Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E2DC07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 02:29:44 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.35672.1698200979322306659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 19:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RA3t6iIV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-27cfb84432aso3597289a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 19:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698200978; x=1698805778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIiAMD4T6PfH/yzAX8fLIh4tyVAKYf3yu7BxCVFnP9o=;
        b=RA3t6iIVjdbcqTxZNXWtQoc/6ip4vmUutl9FOwMaR8pENRnjKs1v/CEDYZ864Upm3I
         jXho5oBTdEUrLVkGZjjvfwerFfZgK50r8vOou9ESFc2qGYUL3InzGvDahwE9tZ8bmNZr
         D3EAu18ug9p2uqAQCepAf6wJoybPTw7b3zcD9I3S8ocvzLaTYjnOUFkYKe870DupSckc
         yCCcUYviaWzPVLRQHckZcOEIbAa7RQaZ5wiVFay1WhvEhTjcQFZaEQTGpISXkiDA2zJy
         8iQC/r07F7ZniPfXhOM7B2s2j/x1gYN4Qw77e15lumpa59pGXWdGM1XiV76krlmAJEAw
         VRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698200978; x=1698805778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIiAMD4T6PfH/yzAX8fLIh4tyVAKYf3yu7BxCVFnP9o=;
        b=F+A3AGk7mdUxxOO1Ipo1opyntj2RyRsuk0Vv5+OzNf54SCqV7/J9a/uZ0rAVfIDGaR
         L+gTupGPe/u9AeqwJqniFnN453fULdrPncgT1pwurpHt83WKze3VwbNXm2j+2uOq8Arq
         ESz7/PcVehw4yRE3Vs9OfTu2+cdcDLZR9kYg42l73UTDouWelpd5l+oMOpK2ugFT/3KL
         5QioGjZq7PJYCVYXQQ38Ra0KBk1mNofzww6B8bTjARPGRwC17Um1WjEgRLaHtVe3xcV3
         v81Q9/+8FN0l+EznlwqWwpOs+G/KG4X1kDDpJA+r7GTA60NJNegfSjYL2DEhwol5eGEJ
         9QGg==
X-Gm-Message-State: AOJu0YzCd9+2dskg0fx8FHjcCRp/0jJ+dR0/uf/GgROOwAlKS4zSP79A
	VO1JcoLbJ5CzsXBZ+NeptLsD3HxEzx4HIDNx8wU=
X-Google-Smtp-Source: AGHT+IHHjZFP/gyABwc6aPIkILeWf435GYY0GStePq9yQVO2FCYIGTQh7NBKt/D/KgTdho5NIJZ+JQ==
X-Received: by 2002:a17:90a:5b11:b0:27d:1571:f683 with SMTP id o17-20020a17090a5b1100b0027d1571f683mr10472943pji.44.1698200978249;
        Tue, 24 Oct 2023 19:29:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a388200b0027d0d4d4128sm8538615pjb.25.2023.10.24.19.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 19:29:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] binutils: Backport fix CVE-2023-25588
Date: Tue, 24 Oct 2023 16:29:24 -1000
Message-Id: <6ffbb78f63e5adaadfaa9f5d5e9871ce3cfe7abf.1698200772.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698200772.git.steve@sakoman.com>
References: <cover.1698200772.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189661

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]
CVE: CVE-2023-25588
Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2023-25588.patch    | 146 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 713e428a3e..a9a2bf332f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -53,5 +53,6 @@ SRC_URI = "\
      file://CVE-2020-16593.patch \
      file://0001-CVE-2021-45078.patch \
      file://CVE-2022-38533.patch \
+     file://CVE-2023-25588.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch b/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
new file mode 100644
index 0000000000..065d8e47f0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
@@ -0,0 +1,146 @@
+From d12f8998d2d086f0a6606589e5aedb7147e6f2f1 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 14 Oct 2022 10:30:21 +1030
+Subject: [PATCH] PR29677, Field `the_bfd` of `asymbol` is uninitialised
+
+Besides not initialising the_bfd of synthetic symbols, counting
+symbols when sizing didn't match symbols created if there were any
+dynsyms named "".  We don't want synthetic symbols without names
+anyway, so get rid of them.  Also, simplify and correct sanity checks.
+
+	PR 29677
+	* mach-o.c (bfd_mach_o_get_synthetic_symtab): Rewrite.
+---
+Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]
+CVE: CVE-2023-25588
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ bfd/mach-o.c | 72 ++++++++++++++++++++++------------------------------
+ 1 file changed, 31 insertions(+), 41 deletions(-)
+
+diff --git a/bfd/mach-o.c b/bfd/mach-o.c
+index acb35e7f0c6..5279343768c 100644
+--- a/bfd/mach-o.c
++++ b/bfd/mach-o.c
+@@ -938,11 +938,9 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
+   bfd_mach_o_symtab_command *symtab = mdata->symtab;
+   asymbol *s;
+   char * s_start;
+-  char * s_end;
+   unsigned long count, i, j, n;
+   size_t size;
+   char *names;
+-  char *nul_name;
+   const char stub [] = "$stub";
+ 
+   *ret = NULL;
+@@ -955,27 +953,27 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
+   /* We need to allocate a bfd symbol for every indirect symbol and to
+      allocate the memory for its name.  */
+   count = dysymtab->nindirectsyms;
+-  size = count * sizeof (asymbol) + 1;
+-
++  size = 0;
+   for (j = 0; j < count; j++)
+     {
+-      const char * strng;
+       unsigned int isym = dysymtab->indirect_syms[j];
++      const char *str;
+ 
+       /* Some indirect symbols are anonymous.  */
+-      if (isym < symtab->nsyms && (strng = symtab->symbols[isym].symbol.name))
+-	/* PR 17512: file: f5b8eeba.  */
+-	size += strnlen (strng, symtab->strsize - (strng - symtab->strtab)) + sizeof (stub);
++      if (isym < symtab->nsyms
++	  && (str = symtab->symbols[isym].symbol.name) != NULL)
++	{
++	  /* PR 17512: file: f5b8eeba.  */
++	  size += strnlen (str, symtab->strsize - (str - symtab->strtab));
++	  size += sizeof (stub);
++	}
+     }
+ 
+-  s_start = bfd_malloc (size);
++  s_start = bfd_malloc (size + count * sizeof (asymbol));
+   s = *ret = (asymbol *) s_start;
+   if (s == NULL)
+     return -1;
+   names = (char *) (s + count);
+-  nul_name = names;
+-  *names++ = 0;
+-  s_end = s_start + size;
+ 
+   n = 0;
+   for (i = 0; i < mdata->nsects; i++)
+@@ -997,47 +995,39 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
+ 	  entry_size = bfd_mach_o_section_get_entry_size (abfd, sec);
+ 
+ 	  /* PR 17512: file: 08e15eec.  */
+-	  if (first >= count || last >= count || first > last)
++	  if (first >= count || last > count || first > last)
+ 	    goto fail;
+ 
+ 	  for (j = first; j < last; j++)
+ 	    {
+ 	      unsigned int isym = dysymtab->indirect_syms[j];
+-
+-	      /* PR 17512: file: 04d64d9b.  */
+-	      if (((char *) s) + sizeof (* s) > s_end)
+-		goto fail;
+-
+-	      s->flags = BSF_GLOBAL | BSF_SYNTHETIC;
+-	      s->section = sec->bfdsection;
+-	      s->value = addr - sec->addr;
+-	      s->udata.p = NULL;
++	      const char *str;
++	      size_t len;
+ 
+ 	      if (isym < symtab->nsyms
+-		  && symtab->symbols[isym].symbol.name)
++		  && (str = symtab->symbols[isym].symbol.name) != NULL)
+ 		{
+-		  const char *sym = symtab->symbols[isym].symbol.name;
+-		  size_t len;
+-
+-		  s->name = names;
+-		  len = strlen (sym);
+-		  /* PR 17512: file: 47dfd4d2.  */
+-		  if (names + len >= s_end)
++		  /* PR 17512: file: 04d64d9b.  */
++		  if (n >= count)
+ 		    goto fail;
+-		  memcpy (names, sym, len);
+-		  names += len;
+-		  /* PR 17512: file: 18f340a4.  */
+-		  if (names + sizeof (stub) >= s_end)
++		  len = strnlen (str, symtab->strsize - (str - symtab->strtab));
++		  /* PR 17512: file: 47dfd4d2, 18f340a4.  */
++		  if (size < len + sizeof (stub))
+ 		    goto fail;
+-		  memcpy (names, stub, sizeof (stub));
+-		  names += sizeof (stub);
++		  memcpy (names, str, len);
++		  memcpy (names + len, stub, sizeof (stub));
++		  s->name = names;
++		  names += len + sizeof (stub);
++		  size -= len + sizeof (stub);
++		  s->the_bfd = symtab->symbols[isym].symbol.the_bfd;
++		  s->flags = BSF_GLOBAL | BSF_SYNTHETIC;
++		  s->section = sec->bfdsection;
++		  s->value = addr - sec->addr;
++		  s->udata.p = NULL;
++		  s++;
++		  n++;
+ 		}
+-	      else
+-		s->name = nul_name;
+-
+ 	      addr += entry_size;
+-	      s++;
+-	      n++;
+ 	    }
+ 	  break;
+ 	default:
+-- 
+2.39.3
+
-- 
2.34.1


