Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716AFC54E4A
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:34 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.7448.1708898012255657696
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Nqt/+65A;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.42, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59fc4d05861so1461409eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708898011; x=1709502811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSkOpZxvPEgnx94Jip1NaJXMmnjmsEk+RsfaHJ4MWuw=;
        b=Nqt/+65APFLUU+8dqXYpDUF6lswE0j+m8Dl45uwO0UvG97JpjpXnGtagUBoyCb+AIH
         aK3GU7gT7KFLM5JCyNvdsLt8vV4g9m/DxhE5PnhV6rwdF7k97mIy0GGv+SQWPXbEHtbs
         za9KAcNxAcnrS0kuz3bKYXF6K2OVwg5yKEI7oZIeAnSsk7BF1i6C5gi0Oj0i2KiU2D6N
         tz/ltsq4gUEbAb8KaR9GlG82Wt4ftMjWGwaLkgeYf5eVEUPptyApO3tE6/NAkjgN+TA9
         y2wbF/Ri55O+hsAvdWQm0fWBSjAshbHvFf0WjA4Ifho7IKR56RwgNKiMR5mF5UVJnJBp
         IFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898011; x=1709502811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSkOpZxvPEgnx94Jip1NaJXMmnjmsEk+RsfaHJ4MWuw=;
        b=HQiLVMksbGHLShIkp1jqEElZABpj/RYN/6vB47fA9rUyEDAHzoFO2F0j2np/Hl5+5Q
         AiaD1vAKgt+IEY+Sfx3hDde6AaNPZaxNprQm52t2Hk/KVgu/VAkojg646rcKcMBiA39X
         15pRS6RI9f7BTWT1WfFiCkjxZ9lSuLbCsWRnXGJF2KnVGANbvRPBMFQ3P4RQdHaJF6Yv
         Mm6ci/wBqzbVWc+btVGUkw5qdKgr5FhkIJKIusXtUbQh2VmrK1JlwZ4im6wbyTxxVOHs
         gC/wKCNfFBwqsIYMSI6h/pQLQ9z52YV0uZqDBnsSkPKJLqa5sPt1NJNirH4yLOa16iHR
         WToA==
X-Gm-Message-State: AOJu0Yx8AJ07YgOHkv63LnkHwNSPd9VI/nl2GVuZZgpYpFe9pnI8MC1l
	l26jGZmlRqlcmocSNgx5pzEI2BBVBzcNOjgjyhjvSdJ3K+JX14tLlPk4Y3oNMRIZCbI6kXsxaFF
	mIxY5Ng==
X-Google-Smtp-Source: AGHT+IHlJORgvu+7MQnrLfC7KYqYD40Kgi+dki/M+mWNIu2aXrCQe236/EallIKkv0vJmgbGarzSRw==
X-Received: by 2002:a05:6358:590a:b0:17b:56f5:e with SMTP id g10-20020a056358590a00b0017b56f5000emr7019994rwf.0.1708898011260;
        Sun, 25 Feb 2024 13:53:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/22] ldconfig-native: Fix to point correctly on the DT_NEEDED entries in an ELF file
Date: Sun, 25 Feb 2024 11:52:39 -1000
Message-Id: <602ccc57360f85e55b1455b93ba9b7e7bf23799e.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196172

From: Fabien Mahot <fabien.mahot@external.desouttertools.com>

When ldconfig-native reads an ELF file, it computes an offset from a LOAD
segment, to point on DT NEEDED entries of dynstr section.
Without this patch, ldconfig-native uses only the first LOAD segment, even if
the offset is incorrect.
This patch adds conditions to compute the offset by parsing all LOAD segments,
one by one.

This is a backport from [0], ported to support endianness and 32/64 bits.

[0]: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=58e8f5fd2ba47b6dc47fd4d0a35e4175c7c87aaa

Signed-off-by: Fabien Mahot <fabien.mahot@external.desouttertools.com>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-.dynstr-located-in-separate-segment.patch | 178 ++++++++++++++++++
 .../glibc/ldconfig-native_2.12.1.bb           |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-handle-.dynstr-located-in-separate-segment.patch

diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-handle-.dynstr-located-in-separate-segment.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-handle-.dynstr-located-in-separate-segment.patch
new file mode 100644
index 0000000000..36f04adfde
--- /dev/null
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-handle-.dynstr-located-in-separate-segment.patch
@@ -0,0 +1,178 @@
+From 864054a6cb971688a181316b8227ae0361b4d69e Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Wed, 9 Oct 2019 17:46:47 +0200
+Subject: [PATCH] ldconfig: handle .dynstr located in separate segment (bug
+ 25087)
+
+To determine the load offset of the DT_STRTAB section search for the
+segment containing it, instead of using the load offset of the first
+segment.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=58e8f5fd2ba47b6dc47fd4d0a35e4175c7c87aaa]
+
+Backported: ported to support endianness and 32/64 bits.
+Signed-off-by: Fabien Mahot <fabien.mahot@external.desouttertools.com>
+---
+ readelflib.c | 86 +++++++++++++++++++++++++++++++---------------------
+ 1 file changed, 52 insertions(+), 34 deletions(-)
+
+diff --git a/readelflib.c b/readelflib.c
+index a01e1cede3..380aed563d 100644
+--- a/readelflib.c
++++ b/readelflib.c
+@@ -80,7 +80,6 @@ process_elf_file32 (const char *file_name, const char *lib, int *flag,
+ {
+   int i;
+   unsigned int j;
+-  Elf32_Addr loadaddr;
+   unsigned int dynamic_addr;
+   size_t dynamic_size;
+   char *program_interpreter;
+@@ -110,7 +109,6 @@ process_elf_file32 (const char *file_name, const char *lib, int *flag,
+      libc5/libc6.  */
+   *flag = FLAG_ELF;
+ 
+-  loadaddr = -1;
+   dynamic_addr = 0;
+   dynamic_size = 0;
+   program_interpreter = NULL;
+@@ -121,11 +119,6 @@ process_elf_file32 (const char *file_name, const char *lib, int *flag,
+ 
+       switch (read32(segment->p_type, be))
+ 	{
+-	case PT_LOAD:
+-	  if (loadaddr == (Elf32_Addr) -1)
+-	    loadaddr = read32(segment->p_vaddr, be) - read32(segment->p_offset, be);
+-	  break;
+-
+ 	case PT_DYNAMIC:
+ 	  if (dynamic_addr)
+ 	    error (0, 0, _("more than one dynamic segment\n"));
+@@ -188,11 +181,6 @@ process_elf_file32 (const char *file_name, const char *lib, int *flag,
+ 	}
+ 
+     }
+-  if (loadaddr == (Elf32_Addr) -1)
+-    {
+-      /* Very strange. */
+-      loadaddr = 0;
+-    }
+ 
+   /* Now we can read the dynamic sections.  */
+   if (dynamic_size == 0)
+@@ -208,11 +196,32 @@ process_elf_file32 (const char *file_name, const char *lib, int *flag,
+     {
+       check_ptr (dyn_entry);
+       if (read32(dyn_entry->d_tag, be) == DT_STRTAB)
+-	{
+-	  dynamic_strings = (char *) (file_contents + read32(dyn_entry->d_un.d_val, be) - loadaddr);
+-	  check_ptr (dynamic_strings);
+-	  break;
+-	}
++        {
++          /* Find the file offset of the segment containing the dynamic
++             string table.  */
++          Elf32_Off loadoff = -1;
++          for (i = 0, segment = elf_pheader;
++               i < read16(elf_header->e_phnum, be); i++, segment++)
++            {
++              if (read32(segment->p_type, be) == PT_LOAD
++                  && read32(dyn_entry->d_un.d_val, be) >= read32(segment->p_vaddr, be)
++                  && (read32(dyn_entry->d_un.d_val, be) - read32(segment->p_vaddr, be)
++                      < read32(segment->p_filesz, be)))
++                {
++                  loadoff = read32(segment->p_vaddr, be) - read32(segment->p_offset, be);
++                  break;
++                }
++            }
++          if (loadoff == (Elf32_Off) -1)
++            {
++              /* Very strange. */
++              loadoff = 0;
++            }
++
++          dynamic_strings = (char *) (file_contents + read32(dyn_entry->d_un.d_val, be) - loadoff);
++          check_ptr (dynamic_strings);
++          break;
++        }
+     }
+ 
+   if (dynamic_strings == NULL)
+@@ -269,7 +278,6 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+ {
+   int i;
+   unsigned int j;
+-  Elf64_Addr loadaddr;
+   Elf64_Addr dynamic_addr;
+   Elf64_Xword dynamic_size;
+   char *program_interpreter;
+@@ -347,7 +355,6 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+       break;
+     }
+ 
+-  loadaddr = -1;
+   dynamic_addr = 0;
+   dynamic_size = 0;
+   program_interpreter = NULL;
+@@ -358,11 +365,6 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+ 
+       switch (read32(segment->p_type, be))
+ 	{
+-	case PT_LOAD:
+-	  if (loadaddr == (Elf64_Addr) -1)
+-	    loadaddr = read64(segment->p_vaddr, be) - read64(segment->p_offset, be);
+-	  break;
+-
+ 	case PT_DYNAMIC:
+ 	  if (dynamic_addr)
+ 	    error (0, 0, _("more than one dynamic segment\n"));
+@@ -426,11 +428,6 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+ 	}
+ 
+     }
+-  if (loadaddr == (Elf64_Addr) -1)
+-    {
+-      /* Very strange. */
+-      loadaddr = 0;
+-    }
+ 
+   /* Now we can read the dynamic sections.  */
+   if (dynamic_size == 0)
+@@ -446,11 +443,32 @@ process_elf_file64 (const char *file_name, const char *lib, int *flag,
+     {
+       check_ptr (dyn_entry);
+       if (read64(dyn_entry->d_tag, be) == DT_STRTAB)
+-	{
+-	  dynamic_strings = (char *) (file_contents + read64(dyn_entry->d_un.d_val, be) - loadaddr);
+-	  check_ptr (dynamic_strings);
+-	  break;
+-	}
++        {
++          /* Find the file offset of the segment containing the dynamic
++             string table.  */
++          Elf64_Off loadoff = -1;
++          for (i = 0, segment = elf_pheader;
++               i < read16(elf_header->e_phnum, be); i++, segment++)
++            {
++              if (read64(segment->p_type, be) == PT_LOAD
++                  && read64(dyn_entry->d_un.d_val, be) >= read64(segment->p_vaddr, be)
++                  && (read64(dyn_entry->d_un.d_val, be) - read64(segment->p_vaddr, be)
++                      < read64(segment->p_filesz, be)))
++                {
++                  loadoff = read64(segment->p_vaddr, be) - read64(segment->p_offset, be);
++                  break;
++                }
++            }
++          if (loadoff == (Elf32_Off) -1)
++            {
++              /* Very strange. */
++              loadoff = 0;
++            }
++
++          dynamic_strings = (char *) (file_contents + read64(dyn_entry->d_un.d_val, be) - loadoff);
++          check_ptr (dynamic_strings);
++          break;
++        }
+     }
+ 
+   if (dynamic_strings == NULL)
diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
index e867ceb3ec..665a3d324c 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://add-64-bit-flag-for-ELF64-entries.patch \
            file://no-aux-cache.patch \
            file://add-riscv-support.patch \
+           file://ldconfig-handle-.dynstr-located-in-separate-segment.patch \
 "
 
 PR = "r2"
-- 
2.34.1


