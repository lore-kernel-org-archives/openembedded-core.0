Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8A8C4829E
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:47:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.24765.1707234442094733437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 07:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mtGyv5tW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29661facbd0so584102a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707234441; x=1707839241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpFpzm3RctOee82Y7PfcUxY9oke1WbFI4oWsXAbUYn8=;
        b=mtGyv5tWyhhbCrqZ8qiutou9C+xCZ2Ir6CbbyDVqY+JL5lA1Mkdqh47D6qRKce8S8Y
         7oIdPkSXvLCkqn/blT9dW4pS/PWE3Nj7v+Mk4k37S8XYkGTVgdDhortDONAar8mefxlG
         wtOAux4wEXWZNECZkDjtO+xvFF7pyggVK2THX43v8xW3ZXB1s2jLUwc6GFUy8Fu/y8Wt
         +AdCZCRtIdkJT+QTXnIVAr5igE+6yDiNkGnnU/SGlF+cwEfrC1CRcYr085pBjRRQ3VlE
         4YJ19URbz/lIXp71REsJVmpoZBd2IPggZtOjfOyAeNKqpUapELTpagOU48Y7ecYWGhCS
         TeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707234441; x=1707839241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpFpzm3RctOee82Y7PfcUxY9oke1WbFI4oWsXAbUYn8=;
        b=t5NpEif6C9LLZJso4OnkwEm8J1lroS8xaZx2nmU/nHs+GZnd6Pbj8Ia3ktuyFtXk5C
         XClmoXQbQH4rDGqi+0UwIFGNYN+C+swfgyhU7zKifUxwbe5omSgLjoJ+YdEl2K3GUrNn
         apaSZkSNmN0Q0SJGbRaDoKl6jTi6WQ7spdghBxErXhaIABYyZzODzcOWXLYHleO2WHwu
         bRZMNzV7dLphXy3uZWmS3hkEfRLSzkX72DF5p008zYAKuegdjE2iNIiSE8bXyBgM93Nm
         Z40PpAZ5v6BwiJr8HGC2bQ7MoZL41k69sfAWGCpM3q/HQi2ImJBL5FhoADiSV7Z3FEm0
         fr1Q==
X-Gm-Message-State: AOJu0YzpuBMSKvdEq4qWHCxTm+WouIoFRKqULbUnbNgHwWDditAxk5w/
	eC4Jy1FyoaeccdYW5CcUZwmMUcxXf3LQiZFzsJO8eMphsUBY2p/LVE7KNXNiMUXeKcKpeXcH746
	vcRo=
X-Google-Smtp-Source: AGHT+IFHXSpYp5403vSwpJjd7r+KqQlPzxaX4MBISPYT97wpzqMzogCfJkjTcr+QXl3tOT+pooIX8A==
X-Received: by 2002:a17:90b:3646:b0:296:316b:9e87 with SMTP id nh6-20020a17090b364600b00296316b9e87mr13094336pjb.6.1707234440410;
        Tue, 06 Feb 2024 07:47:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id kx18-20020a17090b229200b0029454cca5c3sm1811452pjb.39.2024.02.06.07.47.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:47:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] binutils: internal gdb: Fix CVE-2023-39130
Date: Tue,  6 Feb 2024 05:45:21 -1000
Message-Id: <97b5bf2505d68bea6d1c2a66318cfbc51335463a.1707234215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707234215.git.steve@sakoman.com>
References: <cover.1707234215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195002

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE: CVE-2023-39130
Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0036-CVE-2023-39130.patch        | 326 ++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 83dff20855..bbe7bb57b2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -70,5 +70,6 @@ SRC_URI = "\
      file://0033-CVE-2022-47007.patch \
      file://0034-CVE-2022-48064.patch \
      file://0035-CVE-2023-39129.patch \
+     file://0036-CVE-2023-39130.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch b/meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch
new file mode 100644
index 0000000000..bfd5b18d7d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch
@@ -0,0 +1,326 @@
+From 2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Aug 2023 09:58:36 +0930
+Subject: [PATCH] gdb: warn unused result for bfd IO functions
+
+This fixes the compilation warnings introduced by my bfdio.c patch.
+
+The removed bfd_seeks in coff_symfile_read date back to 1994, commit
+7f4c859520, prior to which the file used stdio rather than bfd to read
+symbols.  Since it now uses bfd to read the file there should be no
+need to synchronise to bfd's idea of the file position.  I also fixed
+a potential uninitialised memory access.
+
+Approved-By: Andrew Burgess <aburgess@redhat.com>
+
+Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80]
+CVE: CVE-2023-39130
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+ gdb/coff-pe-read.c | 114 +++++++++++++++++++++++++++++----------------
+ gdb/coffread.c     |  27 ++---------
+ gdb/dbxread.c      |   7 +--
+ gdb/xcoffread.c    |   5 +-
+ 4 files changed, 85 insertions(+), 68 deletions(-)
+
+diff --git a/gdb/coff-pe-read.c b/gdb/coff-pe-read.c
+--- a/gdb/coff-pe-read.c
++++ b/gdb/coff-pe-read.c
+@@ -291,23 +291,31 @@ read_pe_truncate_name (char *dll_name)
+ 
+ /* Low-level support functions, direct from the ld module pe-dll.c.  */
+ static unsigned int
+-pe_get16 (bfd *abfd, int where)
++pe_get16 (bfd *abfd, int where, bool *fail)
+ {
+   unsigned char b[2];
+ 
+-  bfd_seek (abfd, (file_ptr) where, SEEK_SET);
+-  bfd_bread (b, (bfd_size_type) 2, abfd);
++  if (bfd_seek (abfd, where, SEEK_SET) != 0
++      || bfd_bread (b, 2, abfd) != 2)
++    {
++      *fail = true;
++      return 0;
++    }
+   return b[0] + (b[1] << 8);
+ }
+ 
+ static unsigned int
+-pe_get32 (bfd *abfd, int where)
++pe_get32 (bfd *abfd, int where, bool *fail)
+ {
+   unsigned char b[4];
+ 
+-  bfd_seek (abfd, (file_ptr) where, SEEK_SET);
+-  bfd_bread (b, (bfd_size_type) 4, abfd);
+-  return b[0] + (b[1] << 8) + (b[2] << 16) + (b[3] << 24);
++  if (bfd_seek (abfd, where, SEEK_SET) != 0
++      || bfd_bread (b, 4, abfd) != 4)
++    {
++      *fail = true;
++      return 0;
++    }
++  return b[0] + (b[1] << 8) + (b[2] << 16) + ((unsigned) b[3] << 24);
+ }
+ 
+ static unsigned int
+@@ -323,7 +331,7 @@ pe_as32 (void *ptr)
+ {
+   unsigned char *b = (unsigned char *) ptr;
+ 
+-  return b[0] + (b[1] << 8) + (b[2] << 16) + (b[3] << 24);
++  return b[0] + (b[1] << 8) + (b[2] << 16) + ((unsigned) b[3] << 24);
+ }
+ 
+ /* Read the (non-debug) export symbol table from a portable
+@@ -376,37 +384,50 @@ read_pe_exported_syms (minimal_symbol_re
+ 	     || strcmp (target, "pei-i386") == 0
+ 	     || strcmp (target, "pe-arm-wince-little") == 0
+ 	     || strcmp (target, "pei-arm-wince-little") == 0);
++
++  /* Possibly print a debug message about DLL not having a valid format.  */
++  auto maybe_print_debug_msg = [&] () -> void {
++    if (debug_coff_pe_read)
++      fprintf_unfiltered (gdb_stdlog, _("%s doesn't appear to be a DLL\n"),
++					bfd_get_filename (dll));
++  };
++
+   if (!is_pe32 && !is_pe64)
+-    {
+-      /* This is not a recognized PE format file.  Abort now, because
+-	 the code is untested on anything else.  *FIXME* test on
+-	 further architectures and loosen or remove this test.  */
+-      return;
+-    }
++    return maybe_print_debug_msg ();
+ 
+   /* Get pe_header, optional header and numbers of export entries.  */
+-  pe_header_offset = pe_get32 (dll, 0x3c);
++  bool fail = false;
++  pe_header_offset = pe_get32 (dll, 0x3c, &fail);
++  if (fail)
++    return maybe_print_debug_msg ();
+   opthdr_ofs = pe_header_offset + 4 + 20;
+   if (is_pe64)
+-    num_entries = pe_get32 (dll, opthdr_ofs + 108);
++    num_entries = pe_get32 (dll, opthdr_ofs + 108, &fail);
+   else
+-    num_entries = pe_get32 (dll, opthdr_ofs + 92);
++    num_entries = pe_get32 (dll, opthdr_ofs + 92, &fail);
++  if (fail)
++    return maybe_print_debug_msg ();
+ 
+   if (num_entries < 1)		/* No exports.  */
+     return;
+   if (is_pe64)
+     {
+-      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 112);
+-      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 116);
++      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 112, &fail);
++      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 116, &fail);
+     }
+   else
+     {
+-      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 96);
+-      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 100);
++      export_opthdrrva = pe_get32 (dll, opthdr_ofs + 96, &fail);
++      export_opthdrsize = pe_get32 (dll, opthdr_ofs + 100, &fail);
+     }
+-  nsections = pe_get16 (dll, pe_header_offset + 4 + 2);
++  if (fail)
++    return maybe_print_debug_msg ();
++
++  nsections = pe_get16 (dll, pe_header_offset + 4 + 2, &fail);
+   secptr = (pe_header_offset + 4 + 20 +
+-	    pe_get16 (dll, pe_header_offset + 4 + 16));
++	    pe_get16 (dll, pe_header_offset + 4 + 16, &fail));
++  if (fail)
++    return maybe_print_debug_msg ();
+   expptr = 0;
+   export_size = 0;
+ 
+@@ -415,12 +436,13 @@ read_pe_exported_syms (minimal_symbol_re
+     {
+       char sname[8];
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
+-      unsigned long vsize = pe_get32 (dll, secptr1 + 16);
+-      unsigned long fptr = pe_get32 (dll, secptr1 + 20);
+-
+-      bfd_seek (dll, (file_ptr) secptr1, SEEK_SET);
+-      bfd_bread (sname, (bfd_size_type) sizeof (sname), dll);
++      unsigned long vaddr = pe_get32 (dll, secptr1 + 12, &fail);
++      unsigned long vsize = pe_get32 (dll, secptr1 + 16, &fail);
++      unsigned long fptr = pe_get32 (dll, secptr1 + 20, &fail);
++
++      if (fail
++	  || bfd_seek (dll, secptr1, SEEK_SET) != 0
++	  || bfd_bread (sname, sizeof (sname), dll) != sizeof (sname))
+ 
+       if ((strcmp (sname, ".edata") == 0)
+ 	  || (vaddr <= export_opthdrrva && export_opthdrrva < vaddr + vsize))
+@@ -461,16 +483,18 @@ read_pe_exported_syms (minimal_symbol_re
+   for (i = 0; i < nsections; i++)
+     {
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vsize = pe_get32 (dll, secptr1 + 8);
+-      unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
+-      unsigned long characteristics = pe_get32 (dll, secptr1 + 36);
++      unsigned long vsize = pe_get32 (dll, secptr1 + 8, &fail);
++      unsigned long vaddr = pe_get32 (dll, secptr1 + 12, &fail);
++      unsigned long characteristics = pe_get32 (dll, secptr1 + 36, &fail);
+       char sec_name[SCNNMLEN + 1];
+       int sectix;
+       unsigned int bfd_section_index;
+       asection *section;
+ 
+-      bfd_seek (dll, (file_ptr) secptr1 + 0, SEEK_SET);
+-      bfd_bread (sec_name, (bfd_size_type) SCNNMLEN, dll);
++      if (fail
++	  || bfd_seek (dll, secptr1 + 0, SEEK_SET) != 0
++	  || bfd_bread (sec_name, SCNNMLEN, dll) != SCNNMLEN)
++	return maybe_print_debug_msg ();
+       sec_name[SCNNMLEN] = '\0';
+ 
+       sectix = read_pe_section_index (sec_name);
+@@ -509,8 +533,9 @@ read_pe_exported_syms (minimal_symbol_re
+   gdb::def_vector<unsigned char> expdata_storage (export_size);
+   expdata = expdata_storage.data ();
+ 
+-  bfd_seek (dll, (file_ptr) expptr, SEEK_SET);
+-  bfd_bread (expdata, (bfd_size_type) export_size, dll);
++  if (bfd_seek (dll, expptr, SEEK_SET) != 0
++      || bfd_bread (expdata, export_size, dll) != export_size)
++    return maybe_print_debug_msg ();
+   erva = expdata - export_rva;
+ 
+   nexp = pe_as32 (expdata + 24);
+@@ -658,20 +683,27 @@ pe_text_section_offset (struct bfd *abfd
+     }
+ 
+   /* Get pe_header, optional header and numbers of sections.  */
+-  pe_header_offset = pe_get32 (abfd, 0x3c);
+-  nsections = pe_get16 (abfd, pe_header_offset + 4 + 2);
++  bool fail = false;
++  pe_header_offset = pe_get32 (abfd, 0x3c, &fail);
++  if (fail)
++    return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
++  nsections = pe_get16 (abfd, pe_header_offset + 4 + 2, &fail);
+   secptr = (pe_header_offset + 4 + 20 +
+-	    pe_get16 (abfd, pe_header_offset + 4 + 16));
++	    pe_get16 (abfd, pe_header_offset + 4 + 16, &fail));
++  if (fail)
++    return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
+ 
+   /* Get the rva and size of the export section.  */
+   for (i = 0; i < nsections; i++)
+     {
+       char sname[SCNNMLEN + 1];
+       unsigned long secptr1 = secptr + 40 * i;
+-      unsigned long vaddr = pe_get32 (abfd, secptr1 + 12);
++      unsigned long vaddr = pe_get32 (abfd, secptr1 + 12, &fail);
+ 
+-      bfd_seek (abfd, (file_ptr) secptr1, SEEK_SET);
+-      bfd_bread (sname, (bfd_size_type) SCNNMLEN, abfd);
++      if (fail
++	  || bfd_seek (abfd, secptr1, SEEK_SET) != 0
++	  || bfd_bread (sname, SCNNMLEN, abfd) != SCNNMLEN)
++	return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
+       sname[SCNNMLEN] = '\0';
+       if (strcmp (sname, ".text") == 0)
+ 	return vaddr;
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -690,8 +690,6 @@ coff_symfile_read (struct objfile *objfi
+ 
+       /* FIXME: dubious.  Why can't we use something normal like
+ 	 bfd_get_section_contents?  */
+-      bfd_seek (abfd, abfd->where, 0);
+-
+       stabstrsize = bfd_section_size (info->stabstrsect);
+ 
+       coffstab_build_psymtabs (objfile,
+@@ -780,22 +778,6 @@ coff_symtab_read (minimal_symbol_reader
+ 
+   scoped_free_pendings free_pending;
+ 
+-  /* Work around a stdio bug in SunOS4.1.1 (this makes me nervous....
+-     it's hard to know I've really worked around it.  The fix should
+-     be harmless, anyway).  The symptom of the bug is that the first
+-     fread (in read_one_sym), will (in my example) actually get data
+-     from file offset 268, when the fseek was to 264 (and ftell shows
+-     264).  This causes all hell to break loose.  I was unable to
+-     reproduce this on a short test program which operated on the same
+-     file, performing (I think) the same sequence of operations.
+-
+-     It stopped happening when I put in this (former) rewind().
+-
+-     FIXME: Find out if this has been reported to Sun, whether it has
+-     been fixed in a later release, etc.  */
+-
+-  bfd_seek (objfile->obfd, 0, 0);
+-
+   /* Position to read the symbol table.  */
+   val = bfd_seek (objfile->obfd, symtab_offset, 0);
+   if (val < 0)
+@@ -1285,12 +1267,13 @@ init_stringtab (bfd *abfd, file_ptr offs
+   if (bfd_seek (abfd, offset, 0) < 0)
+     return -1;
+ 
+-  val = bfd_bread ((char *) lengthbuf, sizeof lengthbuf, abfd);
+-  length = bfd_h_get_32 (symfile_bfd, lengthbuf);
+-
++  val = bfd_bread (lengthbuf, sizeof lengthbuf, abfd);
+   /* If no string table is needed, then the file may end immediately
+      after the symbols.  Just return with `stringtab' set to null.  */
+-  if (val != sizeof lengthbuf || length < sizeof lengthbuf)
++  if (val != sizeof lengthbuf)
++    return 0;
++  length = bfd_h_get_32 (symfile_bfd, lengthbuf);
++  if (length < sizeof lengthbuf)
+     return 0;
+ 
+   storage->reset ((char *) xmalloc (length));
+diff --git a/gdb/dbxread.c b/gdb/dbxread.c
+--- a/gdb/dbxread.c
++++ b/gdb/dbxread.c
+@@ -812,7 +812,8 @@ stabs_seek (int sym_offset)
+       symbuf_left -= sym_offset;
+     }
+   else
+-    bfd_seek (symfile_bfd, sym_offset, SEEK_CUR);
++    if (bfd_seek (symfile_bfd, sym_offset, SEEK_CUR) != 0)
++      perror_with_name (bfd_get_filename (symfile_bfd));
+ }
+ 
+ #define INTERNALIZE_SYMBOL(intern, extern, abfd)			\
+@@ -2095,8 +2096,8 @@ dbx_expand_psymtab (legacy_psymtab *pst,
+       symbol_size = SYMBOL_SIZE (pst);
+ 
+       /* Read in this file's symbols.  */
+-      bfd_seek (objfile->obfd, SYMBOL_OFFSET (pst), SEEK_SET);
+-      read_ofile_symtab (objfile, pst);
++      if (bfd_seek (objfile->obfd, SYMBOL_OFFSET (pst), SEEK_SET) == 0)
++	read_ofile_symtab (objfile, pst);
+     }
+ 
+   pst->readin = true;
+diff --git a/gdb/xcoffread.c b/gdb/xcoffread.c
+--- a/gdb/xcoffread.c
++++ b/gdb/xcoffread.c
+@@ -865,8 +865,9 @@ enter_line_range (struct subfile *subfil
+ 
+   while (curoffset <= limit_offset)
+     {
+-      bfd_seek (abfd, curoffset, SEEK_SET);
+-      bfd_bread (ext_lnno, linesz, abfd);
++      if (bfd_seek (abfd, curoffset, SEEK_SET) != 0
++	  || bfd_bread (ext_lnno, linesz, abfd) != linesz)
++	return;
+       bfd_coff_swap_lineno_in (abfd, ext_lnno, &int_lnno);
+ 
+       /* Find the address this line represents.  */
+-- 
+2.39.3
-- 
2.34.1


