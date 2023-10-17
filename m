Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AB1CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 23:58:02 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.270773.1697587075106461035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 16:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aRJQVK1S;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-578b407045bso4700638a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 16:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697587073; x=1698191873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FSBDiHftNI7jHIgAonDjJA3bCJ8k7AIWShTK7ljJpvI=;
        b=aRJQVK1S2sm8JRg9ROSKpPTuck9ChteJvhkKaZInsUYgRP3zzbi225kGh3Rxux+74S
         diVj7vKd2GIu4TbyWLi0cXtpphICBhYpH/AcJbYpXu+EcPmPBnIbUoiL6YXSDXcw8OJj
         5S2gg474U3AbmLea1Eiw3iTslklyygrB+StEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697587073; x=1698191873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSBDiHftNI7jHIgAonDjJA3bCJ8k7AIWShTK7ljJpvI=;
        b=fDT871okvFjllQBe+FPuuiOUGOmO2ozKYi39yZFvZq2HJvQZtG05TOnMHn63zPf0QG
         slhJhd3kOQal+uQibEkxDPGpYbO3flEdgdN3ILtSS/De76yWZvUWAbQpO1cl/dHiycT3
         Z76sfHYiHof5ZXGNhq39SwIIQcXfrxh3KmrFgAZWMfhUBtXdlkAWVC8cvMjFOGx6oAXo
         Zn7G5mvCyeazsVKtRMOhIHqL336riEvqiQCUbURiGlzdxEx4lIFqDi4cIghbX/eWeNdM
         WexPbOj3JcxBfY+iv5s2N3GxAcW0Od+5aTwBNLr9di7NvioqSLYt7z/cKfKat/KKfu37
         1Auw==
X-Gm-Message-State: AOJu0Yxj92tOsH0HxJ3v+4x7QGOn/dsKEIjOqBZzcX38aZ7FHUfmHsbp
	t3RNKg+YMp2uWkb1KoJnZO3mfetmHkH1hDQvFGo=
X-Google-Smtp-Source: AGHT+IEjjbkTY5L72lHmIB79BmGa9qWzumqhhtyR1HE9QtlLR6BfB+ouCfuqX65/NrWrP7s/Iu65xA==
X-Received: by 2002:a05:6a20:7352:b0:16b:e2e5:fe55 with SMTP id v18-20020a056a20735200b0016be2e5fe55mr4074496pzc.51.1697587072966;
        Tue, 17 Oct 2023 16:57:52 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.81.145])
        by smtp.gmail.com with ESMTPSA id oa18-20020a17090b1bd200b00276e8e4f1fbsm95485pjb.1.2023.10.17.16.57.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 16:57:52 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 18 Oct 2023 05:25:36 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] binutils: Backport fix CVE-2023-25588
Date: Wed, 18 Oct 2023 05:25:34 +0530
Message-Id: <20231017235534.15937-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 23:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189365

Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]
CVE: CVE-2023-25588
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2023-25588.patch    | 146 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index f0669f421c2..3d7c7edc937 100644
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
index 00000000000..065d8e47f00
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
2.24.4


