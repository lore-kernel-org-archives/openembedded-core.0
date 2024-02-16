Return-Path: <fabien.mahot@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41490C48BEB
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 09:36:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.15273.1708076214409891969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 01:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=l+T5qTNy;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: fabien.mahot@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4124907f6fcso2395445e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 01:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708076212; x=1708681012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=He2MnO6XSRP/6yExgVwbYX6pB+Lek5rK+gc1guFGAIM=;
        b=l+T5qTNyPQQ0Q3h2KjgU5FeK9sHx1LyTXJ0IS84P7B0OoSMeCiZUCrBTaOLHJboXCN
         8Kerz8rlPVHessJFeHvLo9MjMTS920hgz4TU4L56B0Zx3482vl0uX9NCStMZxjCwDKv9
         X99d+PWgFh8cDuofglQNnjQSiGT9b64GmCiOOedeBt5Q1L8KE3vKkoLnwOakWKdHY7A+
         s9FYJWEQP+zi28mvi6pz6Hx1rNip18LX9kTJDT07uOH/2nRNR/1nXq6UWLxlBaIQwlVG
         NLKLcO2tPqM4EuMv8Hc/RdQL8XnzZND1n6yMWz5Nf2tTM2CrhM0hZT2VVhGEHmlHHXUk
         2q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708076212; x=1708681012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=He2MnO6XSRP/6yExgVwbYX6pB+Lek5rK+gc1guFGAIM=;
        b=QhNCGG4fFc1U3wNgWOB5WIxJzFqqr7yUht1Rln5G0EWk0g6J/5W6HwkSvIH3MvZqt7
         v593EI+ekrhY1iD6IyzCeU9k19lUI8YtV8AbcJmhXbcENpupYEJT6e3DIirACxbJcYSJ
         L5OecH6WO7q5Ij8FkDu3i6aAa+ClwDb+VZgURc0OK5hYDsyKbIwc+gz7jDeBdrHo+mz6
         w/kTAF2qap+NhwVmOnM9TZUx5qgpYI2KQz8UfAjj6W2JdVc7wPQ6TFYpavj5lO5q9pPC
         5yiAEBSgNMAABMtMojykSbn1Rbs/G/oRFKSnoKgDk26+EbxnUEcqKU2L5R5BwKM8IqOQ
         umUw==
X-Gm-Message-State: AOJu0YyzLYKtE2zDTXlfymEODPQEmX5EesbhHVDZzk31xgopDbFD5Skv
	nmIqE0uOQ076nfxCPUUsZW+7vYA9otzU6n/EC/D8g1kyGM39xNooHPNZzCY9T9Ts15T8aHEWcnV
	J
X-Google-Smtp-Source: AGHT+IG2iNsDTpE3mPsoLDpZvLovYZm6zJny1GcPgpAPosfsQALu+UXOf4PGanWqpO2qqthqks7WRg==
X-Received: by 2002:a05:600c:1e05:b0:412:528a:fcdf with SMTP id ay5-20020a05600c1e0500b00412528afcdfmr306330wmb.30.1708076212257;
        Fri, 16 Feb 2024 01:36:52 -0800 (PST)
Received: from P-NAN-AMETHYSTE.. (2a01cb06b87193dcfbd85fd41f231a43.ipv6.abo.wanadoo.fr. [2a01:cb06:b871:93dc:fbd8:5fd4:1f23:1a43])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c4fd500b00410ab50f70fsm1749882wmq.15.2024.02.16.01.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 01:36:52 -0800 (PST)
From: Fabien Mahot <fabien.mahot@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fabien Mahot <fabien.mahot@external.desouttertools.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] ldconfig-native: Fix to point correctly on the DT_NEEDED entries in an ELF file
Date: Fri, 16 Feb 2024 10:36:44 +0100
Message-Id: <20240216093644.6610-1-fabien.mahot@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 09:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195742

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
index 4db67c3ad4..9ca95d1e52 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://add-64-bit-flag-for-ELF64-entries.patch \
            file://no-aux-cache.patch \
            file://add-riscv-support.patch \
+           file://ldconfig-handle-.dynstr-located-in-separate-segment.patch \
 "
 
 
-- 
2.34.1


