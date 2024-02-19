Return-Path: <fabien.mahot@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94980C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:35:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.218.1708364113785315716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ISlbs7Zn;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: fabien.mahot@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3392b12dd21so2670502f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708364112; x=1708968912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDG7gIX/uUU4dN3PrEC+BMktRgHHTskFrAGKsN613JU=;
        b=ISlbs7ZnGY1xBSaGsresdmTgtIIhbVKwE6S8/8B4/4IyKDBD4loqZyoGwkkQG/jibT
         3D5KZs3LUWYF8MlJlwJ7iPjFmXOOe+sMjjex08zDbG+Ehwr24X225bIJ2j6KqgJ+ZOMG
         rrpo/57xaE9vr9XEWVPTVu9QrGUG6NUhddVoiZD/o/EhNEB9ari5RJ4bkfWSerCto2/W
         rBEGZHvj0LR72Sbxvpsn8jXjIBV/yZlE1dK1fS7MfdpNvX3/bKbtELimqpgxg/CkrfH1
         3jLd+HlqmjHqESJ4WyBTBJCBpIJ9n88MsUDapOnytFPDAWJiZ1GpCfPx+QxZuINyMa7b
         Ie0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708364112; x=1708968912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDG7gIX/uUU4dN3PrEC+BMktRgHHTskFrAGKsN613JU=;
        b=RKGdmaVu+5OYYoOmqtx6k61wXY5yp0FomXtmh8yIfqKVkhYjuHSP0MER7dI97tR1fp
         rhRm3n/V37L2TNO7cAnU9Eh4gCIXAH1pyfbq+2+bz4VEHDUOgnmn7GRhzlginjI6UMNy
         vqaOe7RHbLO98sor2uQjVmkqB94R+V5nzqdUabL0EJ5Mp2s0Ws/PYSCvB0JBeJag/wcZ
         A+s6AlNFmDwS4MnnK7mYx94QCvpGWusHTY0jd0RBKEJ/p2s7l/EM81EfvOe9mnrAnJtr
         YtUV9Kic0PsxGUW9ZnSUi9mBGnO479W6/Du0iw5gDDPJNBqkjbVrlhWzCBTnqnMtXPbZ
         AXNw==
X-Gm-Message-State: AOJu0Ywu4oWzb8OPDTS9WEF//lMXKF3vo3AndxS3yuk7fuB+nf8n6bsP
	mpjreDYER3ESiwTLfHN08WDVRqRi6mVszgBo6Vno1WJkaKao5LnGGAfF5wM2+n05/15lCpoaTib
	2lDg=
X-Google-Smtp-Source: AGHT+IHycaU+9aULO9L+/VTa/3O7LynTXzI2+dLGXc2ZevaccCs+XvFQ2QKXjANrFnU48x5Zik9CEg==
X-Received: by 2002:a5d:63ca:0:b0:33d:4f6d:de84 with SMTP id c10-20020a5d63ca000000b0033d4f6dde84mr2036554wrw.6.1708364111636;
        Mon, 19 Feb 2024 09:35:11 -0800 (PST)
Received: from P-NAN-AMETHYSTE.. (2a01cb06a02ce931f668133d2b8d6042.ipv6.abo.wanadoo.fr. [2a01:cb06:a02c:e931:f668:133d:2b8d:6042])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm1550328wrf.68.2024.02.19.09.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:35:11 -0800 (PST)
From: Fabien Mahot <fabien.mahot@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Fabien Mahot <fabien.mahot@external.desouttertools.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] ldconfig-native: Fix to point correctly on the DT_NEEDED entries in an ELF file
Date: Mon, 19 Feb 2024 18:35:01 +0100
Message-Id: <20240219173501.31954-1-fabien.mahot@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 17:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195896

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


