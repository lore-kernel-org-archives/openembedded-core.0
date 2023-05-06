Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD3AC7EE2D
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.36204.1683386711855894654
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=U8hym+TR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6434e65d808so3182754b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386711; x=1685978711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h58Aj8A8IEGflESTBmV2xMmX8M/CxUn07+SEIT/clT4=;
        b=U8hym+TRXldXwT/Cue7d4B3/u6p23yMYgLkiK/lNUSwZQTr7EMFkdO3MizbQBHHFBK
         3ACoQAdZ8b9FeVggDCcRnGmiFij6BcfGHiliBEfi3q5geym+RLKobiF9HSZHsCpW5UOr
         VYGxc5++FmGDwTChfkUZ2INaYHCYd0dqiO+ekPVVp7vmqiTS0ownVuSjors0MH/gHAu8
         hcK/xa4t60umZ0rWMcDkEBPb2WxBp/KU4Gxc3yKTeECaMqJukJ7dA88rA8ReJJ/f1OnC
         Vm678t8E2jweqloVJcDXKY3b8ec/WmS2OHzeshXm9kLfE4FODt6k5ktNDwnUGrGMqEuh
         /kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386711; x=1685978711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h58Aj8A8IEGflESTBmV2xMmX8M/CxUn07+SEIT/clT4=;
        b=GeCCJPCVVTZ6NFv743SnaehyqeBTK6mpDjSDhJAsv8orx4ejyYR/Cc29jlvlgcBIqH
         uEI1XVZ50pDkZcEfiJY4wzsOVyYL/4o6K635+qlQ9bBVD34VenOp522KTUWVJHskEmNR
         00IicztFQeP5wBIBipPEPyH/6MJsW3nIGrGkbsK1wmgnBvIFfzCK05ZHydgXvGMj6C0I
         caXQB0oC5DObdCpdsxabixYgshuGn6eb7qTKPjVAqUysezFipQTVhn7EP1zWnz1FA67G
         PhbcwG7hbQP0WgCaQ7ufHUuatkHHSV6kk0wkk/HLhPoDBOGY4vL6/eOlPea85vdnEPHd
         cBRQ==
X-Gm-Message-State: AC+VfDzBEdsLEsavMEseWPg/qiMMyN0NsKwH2vYir2q2DqfmGxBX1Omr
	RyN8LOWm04bznIGQFE8lP6pPvs8ZjHTWUoY5uzI=
X-Google-Smtp-Source: ACHHUZ6cN2jGhHOX1RHgkmmz8CNuFp/P9edNf6H8v6rZqb4XLEy6JYEAHpAvsotm6uPsLRgFduFaPA==
X-Received: by 2002:a05:6a20:3942:b0:ec:707f:7dc7 with SMTP id r2-20020a056a20394200b000ec707f7dc7mr6640385pzg.33.1683386710711;
        Sat, 06 May 2023 08:25:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] binutils : Fix CVE-2023-25588
Date: Sat,  6 May 2023 05:24:39 -1000
Message-Id: <fd0d01aca6f2aea51e9704e0ba48dc35dfd87b81.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180992

From: Deepthi Hemraj <deepadeepthi98@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0025-CVE-2023-25588.patch        | 147 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 1ea17990c8..5c3ff3d93a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -55,5 +55,6 @@ SRC_URI = "\
      file://0022-CVE-2023-25584-3.patch \
      file://0023-CVE-2023-25585.patch \
      file://0026-CVE-2023-1972.patch \
+     file://0025-CVE-2023-25588.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch b/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
new file mode 100644
index 0000000000..142d201c40
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0025-CVE-2023-25588.patch
@@ -0,0 +1,147 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 14 Oct 2022 00:00:21 +0000 (+1030)
+Subject: PR29677, Field `the_bfd` of `asymbol` is uninitialised
+X-Git-Tag: gdb-13-branchpoint~871
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1
+
+PR29677, Field `the_bfd` of `asymbol` is uninitialised
+
+Besides not initialising the_bfd of synthetic symbols, counting
+symbols when sizing didn't match symbols created if there were any
+dynsyms named "".  We don't want synthetic symbols without names
+anyway, so get rid of them.  Also, simplify and correct sanity checks.
+
+	PR 29677
+	* mach-o.c (bfd_mach_o_get_synthetic_symtab): Rewrite.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]
+
+CVE: CVE-2023-25588
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
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
+	  entry_size = bfd_mach_o_section_get_entry_size (abfd, sec);
+
+	  /* PR 17512: file: 08e15eec.  */
+-	  if (first >= count || last >= count || first > last)
++	  if (first >= count || last > count || first > last)
+	    goto fail;
+
+	  for (j = first; j < last; j++)
+	    {
+	      unsigned int isym = dysymtab->indirect_syms[j];
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
+	      if (isym < symtab->nsyms
+-		  && symtab->symbols[isym].symbol.name)
++		  && (str = symtab->symbols[isym].symbol.name) != NULL)
+		{
+-		  const char *sym = symtab->symbols[isym].symbol.name;
+-		  size_t len;
+-
+-		  s->name = names;
+-		  len = strlen (sym);
+-		  /* PR 17512: file: 47dfd4d2.  */
+-		  if (names + len >= s_end)
++		  /* PR 17512: file: 04d64d9b.  */
++		  if (n >= count)
+		    goto fail;
+-		  memcpy (names, sym, len);
+-		  names += len;
+-		  /* PR 17512: file: 18f340a4.  */
+-		  if (names + sizeof (stub) >= s_end)
++		  len = strnlen (str, symtab->strsize - (str - symtab->strtab));
++		  /* PR 17512: file: 47dfd4d2, 18f340a4.  */
++		  if (size < len + sizeof (stub))
+		    goto fail;
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
+		}
+-	      else
+-		s->name = nul_name;
+-
+	      addr += entry_size;
+-	      s++;
+-	      n++;
+	    }
+	  break;
+	default:
-- 
2.34.1


