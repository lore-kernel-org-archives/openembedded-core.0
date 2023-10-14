Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66187C41513
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:31 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.75716.1697319923667345946
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pmcHsHk3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c9d922c039so26741425ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319923; x=1697924723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJUngAIAmpxvuFaD7Hz7YXmPIG6HmTXB+w6ks+/GIz8=;
        b=pmcHsHk3LJX9E5BhWRx//+iwaPjMnnghXGaLCusdJhuo1zQ9FjprO6DPXdWWZ2FlMM
         fhs1ygZWzTDc59fT+Wc1HLAljSfObI6edHjmZznJsQfuU0FvFU1y7KtTUWZRY44Bgcbu
         LGzr8IqNIqnn2sI9YmMKz0A7BnXd2y5fxdDEHxHMRu5oomlwJzRXbpdC3WCB/rZ2h3ao
         KKiILop6DC5Oje0EM7dHP4zfrcytKUS3uffT8vtD73549HMIcZHt3oYzlDIiLfl7mNxV
         rHQrGW1zdkHCCDLwiDFB5t5gh+FkLLMkHhyoVF3ETcSXEvqAdg35xRKlB4n6XMyhzq7b
         Hadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319923; x=1697924723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJUngAIAmpxvuFaD7Hz7YXmPIG6HmTXB+w6ks+/GIz8=;
        b=B9ZlZivEbu3dyigU/xk3o0oQdseSdwhOEjvWC6mGXeWO9/h3N7GC729Z1C6vntuzj4
         bi3n0jTvOEIlF/vg0UI7WIEvow3zlfGR3QskD+IpICBuA3lH+5P4ymeOKZDzWV2f9AN0
         GRb9OfEkbD45vehKhlf6LZX8ydWiHQ3Gl9jx+ybTtF+zaECLty5Aro1G8Dngl7W7t7Ir
         RSKRkTpBaeoRqWNG6USLKTHScCtnUqqohGoRQY39qMx1ySJ8+Iy8Z9HlCl18fANZDSet
         06nAmBrJOGubzAq9bQ0Hf/ztkbtTYsMJu88NoHteVRI5PO2B9TJGllJkfPFl0ty3A51O
         OK+A==
X-Gm-Message-State: AOJu0YzrWPQ4YdQTlEO0xI4BXx9Eie+qLCvFJEfDW17Y0RhemQCwdcv4
	n36PQyEbFYbjuhJzg5l/u6dA5Ax4dEqY+ExFvkU=
X-Google-Smtp-Source: AGHT+IE36U6r1aUrGgM6KimZ0O4sw+DGQtP+lk14jOgzMt8OICL6pM63pTcGU70MGYsBvVbEeh60Cg==
X-Received: by 2002:a17:902:dac9:b0:1bf:4582:90d with SMTP id q9-20020a170902dac900b001bf4582090dmr37846295plx.46.1697319922817;
        Sat, 14 Oct 2023 14:45:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/13] binutils: Fix CVE-2022-45703
Date: Sat, 14 Oct 2023 11:44:49 -1000
Message-Id: <b2fa5b29462a16b238f8a6a40886b45aa483e963.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189128

From: Yash Shinde <Yash.Shinde@windriver.com>

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |   2 +
 .../binutils/0031-CVE-2022-45703-1.patch      | 147 ++++++++++++++++++
 .../binutils/0031-CVE-2022-45703-2.patch      |  31 ++++
 3 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 7c5d8f79ec..0964ab0825 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -60,5 +60,7 @@ SRC_URI = "\
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
      file://0030-CVE-2022-44840.patch \
+     file://0031-CVE-2022-45703-1.patch \
+     file://0031-CVE-2022-45703-2.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch
new file mode 100644
index 0000000000..3db4385e13
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch
@@ -0,0 +1,147 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 24 May 2022 00:02:14 +0000 (+0930)
+Subject: PR29169, invalid read displaying fuzzed .gdb_index
+X-Git-Tag: binutils-2_39~530
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=244e19c79111eed017ee38ab1d44fb2a6cd1b636
+
+PR29169, invalid read displaying fuzzed .gdb_index
+
+	PR 29169
+	* dwarf.c (display_gdb_index): Combine sanity checks.  Calculate
+	element counts, not word counts.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=244e19c79111eed017ee38ab1d44fb2a6cd1b636]
+
+CVE: CVE-2022-45703   
+
+Signed-off-by: yash shinde <yash.shinde@windriver.com>
+
+---
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 7de6f28161f..c855972a12f 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10406,7 +10406,7 @@ display_gdb_index (struct dwarf_section *section,
+   uint32_t cu_list_offset, tu_list_offset;
+   uint32_t address_table_offset, symbol_table_offset, constant_pool_offset;
+   unsigned int cu_list_elements, tu_list_elements;
+-  unsigned int address_table_size, symbol_table_slots;
++  unsigned int address_table_elements, symbol_table_slots;
+   unsigned char *cu_list, *tu_list;
+   unsigned char *address_table, *symbol_table, *constant_pool;
+   unsigned int i;
+@@ -10454,48 +10454,19 @@ display_gdb_index (struct dwarf_section *section,
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
+@@ -10504,31 +10475,25 @@ display_gdb_index (struct dwarf_section *section,
+   symbol_table = start + symbol_table_offset;
+   constant_pool = start + constant_pool_offset;
+ 
+-  if (address_table_offset + address_table_size > section->size)
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
+@@ -10536,12 +10501,11 @@ display_gdb_index (struct dwarf_section *section,
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
diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch
new file mode 100644
index 0000000000..1fac9739dd
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch
@@ -0,0 +1,31 @@
+From 69bfd1759db41c8d369f9dcc98a135c5a5d97299 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 18 Nov 2022 11:29:13 +1030
+Subject: [PATCH] PR29799 heap buffer overflow in display_gdb_index
+ dwarf.c:10548
+
+	PR 29799
+	* dwarf.c (display_gdb_index): Typo fix.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff_plain;f=binutils/dwarf.c;h=4bba8dfb81a6df49f5e61b3fae99dd545cc5c7dd;hp=7730293326ac1049451eb4a037ac86d827030700;hb=69bfd1759db41c8d369f9dcc98a135c5a5d97299;hpb=7828dfa93b210b6bbc6596e6e096cc150a9f8aa4]
+
+CVE: CVE-2022-45703
+
+Signed-off-by: yash shinde <yash.shinde@windriver.com>
+
+---
+ binutils/dwarf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 7730293326a..4bba8dfb81a 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10562,7 +10562,7 @@ display_gdb_index (struct dwarf_section
+     {
+       uint64_t low = byte_get_little_endian (address_table + i * 20, 8);
+       uint64_t high = byte_get_little_endian (address_table + i * 20 + 8, 8);
+-      uint32_t cu_index = byte_get_little_endian (address_table + i + 20 + 16, 4);
++      uint32_t cu_index = byte_get_little_endian (address_table + i * 20 + 16, 4);
+ 
+       print_dwarf_vma (low, 8);
+       print_dwarf_vma (high, 8);
-- 
2.34.1


