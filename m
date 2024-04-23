Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3D9C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 07:35:20 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.13167.1713857710533582024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 00:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WaBYINKM;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2abf9305afcso3096617a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 00:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713857709; x=1714462509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPxiT8fimCXe0Qz5HJ225MJY2uHaDog/8tI7Rkb85e8=;
        b=WaBYINKMaNvilj3Lb98oBv/E6MbSa+iTvYMrtpE0iPT/N9eWaP/GGsMs652RL0ANDv
         8hfMwnl+a8QU2CneCmljZ3jb10CDEq5KHBCzz5Qh2ABvD6Ag8+igZy5VJAtSKcFwP3Ju
         6y+g2WKoPONy6gulz8QsiiWtFFnLlKmQObXCjHLkbcetYirw6G4ABZ0tZL9G8oLVmLrE
         EdSc/LkHSBw4PpA8rV93Dtmp+5EjzXKgz3bzrDSxSdx/4r7Xpq6HOX68JBdym+JG/aMW
         nwyM4Wzk3uqqc84a/SWsWTUwXG+KmPlUuJuGA7OZ+ll/lTlJmA9O4WcsJ05Z454rSvmS
         tFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713857709; x=1714462509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPxiT8fimCXe0Qz5HJ225MJY2uHaDog/8tI7Rkb85e8=;
        b=Ej6lVfosQ8of39ODWDVevmFpvCK9j+9/1b9wQRT+yOfa4d4OZKWjQpxucCLBPB/Okn
         1iWgImOJyquqHVlbuGvB6BB6AXxoD0kuwuyptXqwP1z7sNibUhwOSU8DFSrv6IOeIBkT
         kBI8uog4xmR1myj4Jg/oqJooAbJpsj6K8YA1oHERWzX2b7SZpCDkHJ/rh9KsGls6tY+O
         O2ZBRMFeXarGhHs2GA+YMU2cPIFtJesAfRJopnZ/57mNfGAciFT5VJaYL+zk3HW8Fuan
         XbPW8C5w4MIQLcCfEvY3B93ZPJzWj0Jiyk93XDNqdS+CltVL+uK821BP+Xrbr9ycAoe4
         HiKg==
X-Gm-Message-State: AOJu0YyhU4lZ9P2oaGJ+iK92El+wbNoOC8YFA1dhdfZnKU8RsLwLjtgS
	1rFSNbqgRrvxa4rvKZRDJeuM0FcHCN4sxbk4d9QTXjw3763sltUpMRMU3A==
X-Google-Smtp-Source: AGHT+IGMqbToP/pz1VaElwkjcg4J9L2ctAuQPhIx2lX+N6uXxfeveI96WufAsCDAYK0812TxUvkOwg==
X-Received: by 2002:a17:90a:e20a:b0:2ac:5a83:b8b7 with SMTP id a10-20020a17090ae20a00b002ac5a83b8b7mr12527221pjz.0.1713857709123;
        Tue, 23 Apr 2024 00:35:09 -0700 (PDT)
Received: from L-18076.kpit.com ([223.233.81.5])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090ad50d00b002a5dbfca370sm10539761pju.48.2024.04.23.00.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:35:08 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Subject: [OE-core][dunfell][PATCH 2/4] binutils: Fix CVE-2022-45703
Date: Tue, 23 Apr 2024 13:04:40 +0530
Message-Id: <20240423073442.48274-2-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423073442.48274-1-virendrak@kpit.com>
References: <20240423073442.48274-1-virendrak@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 07:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198607

Add patch file to fix CVE-2022-45703

Reference: https://answers.launchpad.net/ubuntu/+archive/primary/+sourcefiles/binutils/2.34-6ubuntu1.8/binutils_2.34-6ubuntu1.8.debian.tar.xz

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../binutils/binutils-2.34.inc                |   2 +
 .../binutils/binutils/CVE-2022-45703-0.patch  | 148 ++++++++++++++++++
 .../binutils/binutils/CVE-2022-45703-1.patch  |  36 +++++
 3 files changed, 186 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-45703-0.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-45703-1.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 64f66a30a9..fd6138be1e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -63,5 +63,7 @@ SRC_URI = "\
      file://CVE-2022-48063.patch \
      file://CVE-2022-47695.patch \
      file://CVE-2022-44840.patch \
+     file://CVE-2022-45703-0.patch \
+     file://CVE-2022-45703-1.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-45703-0.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-45703-0.patch
new file mode 100644
index 0000000000..a89456cae4
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-45703-0.patch
@@ -0,0 +1,148 @@
+Origin: backport, https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=244e19c79111eed017ee38ab1d44fb2a6cd1b636
+
+From 244e19c79111eed017ee38ab1d44fb2a6cd1b636 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 24 May 2022 09:32:14 +0930
+Subject: [PATCH] PR29169, invalid read displaying fuzzed .gdb_index
+
+	PR 29169
+	* dwarf.c (display_gdb_index): Combine sanity checks.  Calculate
+	element counts, not word counts.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=244e19c79111eed017ee38ab1d44fb2a6cd1b636]
+
+CVE: CVE-2022-45703
+
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ binutils/dwarf.c | 80 +++++++++++++-----------------------------------
+ 1 file changed, 22 insertions(+), 58 deletions(-)
+
+Index: binutils-2.34/binutils/dwarf.c
+===================================================================
+--- binutils-2.34.orig/binutils/dwarf.c
++++ binutils-2.34/binutils/dwarf.c
+@@ -9208,7 +9208,7 @@ display_gdb_index (struct dwarf_section
+   uint32_t cu_list_offset, tu_list_offset;
+   uint32_t address_table_offset, symbol_table_offset, constant_pool_offset;
+   unsigned int cu_list_elements, tu_list_elements;
+-  unsigned int address_table_size, symbol_table_slots;
++  unsigned int address_table_elements, symbol_table_slots;
+   unsigned char *cu_list, *tu_list;
+   unsigned char *address_table, *symbol_table, *constant_pool;
+   unsigned int i;
+@@ -9256,48 +9256,19 @@ display_gdb_index (struct dwarf_section
+       || tu_list_offset > section->size
+       || address_table_offset > section->size
+       || symbol_table_offset > section->size
+-      || constant_pool_offset > section->size)
++      || constant_pool_offset > section->size
++      || tu_list_offset < cu_list_offset
++      || address_table_offset < tu_list_offset
++      || symbol_table_offset < address_table_offset
++      || constant_pool_offset < symbol_table_offset)
+     {
+       warn (_("Corrupt header in the %s section.\n"), section->name);
+       return 0;
+     }
+ 
+-  /* PR 17531: file: 418d0a8a.  */
+-  if (tu_list_offset < cu_list_offset)
+-    {
+-      warn (_("TU offset (%x) is less than CU offset (%x)\n"),
+-	    tu_list_offset, cu_list_offset);
+-      return 0;
+-    }
+-
+-  cu_list_elements = (tu_list_offset - cu_list_offset) / 8;
+-
+-  if (address_table_offset < tu_list_offset)
+-    {
+-      warn (_("Address table offset (%x) is less than TU offset (%x)\n"),
+-	    address_table_offset, tu_list_offset);
+-      return 0;
+-    }
+-
+-  tu_list_elements = (address_table_offset - tu_list_offset) / 8;
+-
+-  /* PR 17531: file: 18a47d3d.  */
+-  if (symbol_table_offset < address_table_offset)
+-    {
+-      warn (_("Symbol table offset (%x) is less then Address table offset (%x)\n"),
+-	    symbol_table_offset, address_table_offset);
+-      return 0;
+-    }
+-
+-  address_table_size = symbol_table_offset - address_table_offset;
+-
+-  if (constant_pool_offset < symbol_table_offset)
+-    {
+-      warn (_("Constant pool offset (%x) is less than symbol table offset (%x)\n"),
+-	    constant_pool_offset, symbol_table_offset);
+-      return 0;
+-    }
+-
++  cu_list_elements = (tu_list_offset - cu_list_offset) / 16;
++  tu_list_elements = (address_table_offset - tu_list_offset) / 24;
++  address_table_elements = (symbol_table_offset - address_table_offset) / 20;
+   symbol_table_slots = (constant_pool_offset - symbol_table_offset) / 8;
+ 
+   cu_list = start + cu_list_offset;
+@@ -9306,31 +9277,25 @@ display_gdb_index (struct dwarf_section
+   symbol_table = start + symbol_table_offset;
+   constant_pool = start + constant_pool_offset;
+ 
+-  if (address_table + address_table_size > section->start + section->size)
+-    {
+-      warn (_("Address table extends beyond end of section.\n"));
+-      return 0;
+-    }
+-
+   printf (_("\nCU table:\n"));
+-  for (i = 0; i < cu_list_elements; i += 2)
++  for (i = 0; i < cu_list_elements; i++)
+     {
+-      uint64_t cu_offset = byte_get_little_endian (cu_list + i * 8, 8);
+-      uint64_t cu_length = byte_get_little_endian (cu_list + i * 8 + 8, 8);
++      uint64_t cu_offset = byte_get_little_endian (cu_list + i * 16, 8);
++      uint64_t cu_length = byte_get_little_endian (cu_list + i * 16 + 8, 8);
+ 
+-      printf (_("[%3u] 0x%lx - 0x%lx\n"), i / 2,
++      printf (_("[%3u] 0x%lx - 0x%lx\n"), i,
+ 	      (unsigned long) cu_offset,
+ 	      (unsigned long) (cu_offset + cu_length - 1));
+     }
+ 
+   printf (_("\nTU table:\n"));
+-  for (i = 0; i < tu_list_elements; i += 3)
++  for (i = 0; i < tu_list_elements; i++)
+     {
+-      uint64_t tu_offset = byte_get_little_endian (tu_list + i * 8, 8);
+-      uint64_t type_offset = byte_get_little_endian (tu_list + i * 8 + 8, 8);
+-      uint64_t signature = byte_get_little_endian (tu_list + i * 8 + 16, 8);
++      uint64_t tu_offset = byte_get_little_endian (tu_list + i * 24, 8);
++      uint64_t type_offset = byte_get_little_endian (tu_list + i * 24 + 8, 8);
++      uint64_t signature = byte_get_little_endian (tu_list + i * 24 + 16, 8);
+ 
+-      printf (_("[%3u] 0x%lx 0x%lx "), i / 3,
++      printf (_("[%3u] 0x%lx 0x%lx "), i,
+ 	      (unsigned long) tu_offset,
+ 	      (unsigned long) type_offset);
+       print_dwarf_vma (signature, 8);
+@@ -9338,12 +9303,11 @@ display_gdb_index (struct dwarf_section
+     }
+ 
+   printf (_("\nAddress table:\n"));
+-  for (i = 0; i < address_table_size && i <= address_table_size - (2 * 8 + 4);
+-       i += 2 * 8 + 4)
++  for (i = 0; i < address_table_elements; i++)
+     {
+-      uint64_t low = byte_get_little_endian (address_table + i, 8);
+-      uint64_t high = byte_get_little_endian (address_table + i + 8, 8);
+-      uint32_t cu_index = byte_get_little_endian (address_table + i + 16, 4);
++      uint64_t low = byte_get_little_endian (address_table + i * 20, 8);
++      uint64_t high = byte_get_little_endian (address_table + i * 20 + 8, 8);
++      uint32_t cu_index = byte_get_little_endian (address_table + i + 20 + 16, 4);
+ 
+       print_dwarf_vma (low, 8);
+       print_dwarf_vma (high, 8);
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-45703-1.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-45703-1.patch
new file mode 100644
index 0000000000..0ed1c4e55b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-45703-1.patch
@@ -0,0 +1,36 @@
+[Ubuntu note: print_dwarf_vma was used instead of print_hex in this version of
+ the code.
+ -- Camila Camargo de Matos <camila.camargodematos@canonical.com>]
+
+Origin: backport, https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=69bfd1759db41c8d369f9dcc98a135c5a5d97299
+
+From 69bfd1759db41c8d369f9dcc98a135c5a5d97299 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 18 Nov 2022 11:29:13 +1030
+Subject: [PATCH] PR29799 heap buffer overflow in display_gdb_index
+ dwarf.c:10548
+
+	PR 29799
+	* dwarf.c (display_gdb_index): Typo fix.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=69bfd1759db41c8d369f9dcc98a135c5a5d97299]
+
+CVE: CVE-2022-45703
+
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ binutils/dwarf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: binutils-2.34/binutils/dwarf.c
+===================================================================
+--- binutils-2.34.orig/binutils/dwarf.c
++++ binutils-2.34/binutils/dwarf.c
+@@ -9307,7 +9307,7 @@ display_gdb_index (struct dwarf_section
+     {
+       uint64_t low = byte_get_little_endian (address_table + i * 20, 8);
+       uint64_t high = byte_get_little_endian (address_table + i * 20 + 8, 8);
+-      uint32_t cu_index = byte_get_little_endian (address_table + i + 20 + 16, 4);
++      uint32_t cu_index = byte_get_little_endian (address_table + i * 20 + 16, 4);
+ 
+       print_dwarf_vma (low, 8);
+       print_dwarf_vma (high, 8);
-- 
2.25.1


