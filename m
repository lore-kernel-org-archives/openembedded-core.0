Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA7DC07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 07:15:24 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.7432.1664435722733868169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NMv0GKxw;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id s26so690441pgv.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=CzkqJz0VXGcfb+UZuoZsk/ccL7LMiPDJwy9Prlm7DuA=;
        b=NMv0GKxw95c2z3ugsqwXuPKLZ5kSJbRVD1K66V2Xz3RssSX6r7vTi6Yzrt0lQKLjlT
         V6ZWeileDwzDPYvgwX2YOhEYhm2y/ppzD7NqRydP9IzsL3kCFVJ0iP2XWdS/nE2pgzi7
         q60MODDAKH+cVWr6hoW3dfTcJfMxBuKhA8MW1q+cU7gzBoKBhlbIdcRMHVv6RdHaFiKG
         DKz09Ub73vp3oKp1SERCFv7EeXwPFABHYa+6BRR9vr176OQFXhgv/JTznC+xIbPKDTXu
         hCG8a/SfUUR45QyWTiVFCiyoejc5vVa9pb9AiZ90XouMvCpRRcrq8Z2WTyZ0wrISU3dt
         qLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=CzkqJz0VXGcfb+UZuoZsk/ccL7LMiPDJwy9Prlm7DuA=;
        b=MmyRjvsQ37kIDEMTVEYTj53IPGZd/gP6Vi5w7P8Qj38aysGOrYfo5lfbTQMPguszk+
         EHO+HngtksSRYEPrgYUa4tCkb/oBD8yzsGebZvoQ+aEDaz0/nOzhNPnZS0mVysXqY/7m
         vF8iGXxUS2hNSaDHOaAC482X/QT9224s+oMLK+Gb2sZztGsNN9A0oBC1REru8RHha1ra
         AYRR1wMUhfKoAV5pW8egOksyp+gCmuJm3WzFHVa3A7/+ukxrMd+s7dM0aH8Vq13Misq3
         E36agV5YGlB3mUv2pjfY2ZhUUCk5kEy4PSvGKHvr1yMZ+3RHobfdwQ9pDC0Qk77a+XeM
         F6gw==
X-Gm-Message-State: ACrzQf32aH4RFN4ddeQWtQgqTiSSzYEfsQ7umo+Yk8fc/SgUPzTF3ydF
	8+4i0NtD7U/V+sPTlNOXgYUfwAQeZfQ=
X-Google-Smtp-Source: 
 AMsMyM7s2PtbkxId/beNWChbA6o0CLeU2/zyrqiUev0ehM5W65al2I9WE38AW2zhCVLI29C5xYb1Zg==
X-Received: by 2002:a05:6a00:22cb:b0:543:7003:21a1 with SMTP id
 f11-20020a056a0022cb00b00543700321a1mr1863919pfj.3.1664435720684;
        Thu, 29 Sep 2022 00:15:20 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 u6-20020a17090341c600b00174fa8cbf31sm5060506ple.303.2022.09.29.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:15:20 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [kirkstone][PATCH] binutils : Fix CVE-2022-38127
Date: Thu, 29 Sep 2022 12:45:14 +0530
Message-Id: <20220929071514.637014-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:15:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171169

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=19c26da69d68d5d863f37c06ad73ab6292d02ffa]
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ec41dd75c866599fc03c390c6afb5736c159c0ff]
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f18acc9c4e5d18f4783f3a7d59e3ec95d7af0199]
Upstream-Status: Backport
[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e98e7d9a70dcc987bff0e925f20b78cd4a2979ed]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.38.inc                |    4 +
 .../binutils/0017-CVE-2022-38127-1.patch      | 1224 +++++++++++++++++
 .../binutils/0017-CVE-2022-38127-2.patch      |  188 +++
 .../binutils/0017-CVE-2022-38127-3.patch      |  211 +++
 .../binutils/0017-CVE-2022-38127-4.patch      |   43 +
 5 files changed, 1670 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-4.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 2ddeb0ed39..fc88d4a79e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -35,5 +35,9 @@ SRC_URI = "\
      file://0014-CVE-2019-1010204.patch \
      file://0015-CVE-2022-38533.patch \
      file://0016-CVE-2022-38126.patch \
+     file://0017-CVE-2022-38127-1.patch \
+     file://0017-CVE-2022-38127-2.patch \
+     file://0017-CVE-2022-38127-3.patch \
+     file://0017-CVE-2022-38127-4.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-1.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-1.patch
new file mode 100644
index 0000000000..9bbf1d6453
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-1.patch
@@ -0,0 +1,1224 @@
+From 19c26da69d68d5d863f37c06ad73ab6292d02ffa Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 6 Apr 2022 14:43:37 +0100
+Subject: [PATCH] Add code to display the contents of .debug_loclists sections
+ which contain offset entry tables.
+
+	PR 28981
+	* dwarf.c (fetch_indexed_value): Rename to fecth_indexed_addr and
+	return the address, rather than a string.
+	(fetch_indexed_value): New function - returns a value indexed by a
+	DW_FORM_loclistx or DW_FORM_rnglistx form.
+	(read_and_display_attr_value): Add support for DW_FORM_loclistx
+	and DW_FORM_rnglistx.
+	(process_debug_info): Load the loclists and rnglists sections.
+	(display_loclists_list): Add support for DW_LLE_base_addressx,
+	DW_LLE_startx_endx, DW_LLE_startx_length and
+	DW_LLE_default_location.
+	(display_offset_entry_loclists): New function.  Displays a
+	.debug_loclists section that contains offset entry tables.
+	(display_debug_loc): Call the new function.
+	(display_debug_rnglists_list): Add support for
+	DW_RLE_base_addressx, DW_RLE_startx_endx and DW_RLE_startx_length.
+	(display_debug_ranges): Display the contents of the section's
+	header.
+	* dwarf.h (struct debug_info): Add loclists_base field.
+	* testsuite/binutils-all/dw5.W: Update expected output.
+	* testsuite/binutils-all/x86-64/pr26808.dump: Likewise.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=19c26da69d68d5d863f37c06ad73ab6292d02ffa]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/ChangeLog                            |  24 +
+ binutils/dwarf.c                              | 513 +++++++++++++++---
+ binutils/dwarf.h                              |   4 +
+ binutils/testsuite/binutils-all/dw5.W         |   2 +-
+ .../binutils-all/x86-64/pr26808.dump          |  82 +--
+ gas/ChangeLog                                 |   5 +
+ gas/testsuite/gas/elf/dwarf-5-irp.d           |   2 +-
+ 7 files changed, 517 insertions(+), 115 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 15b3c81a138..bc862f77c04 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -240,7 +240,7 @@ static const char *
+ dwarf_vmatoa_1 (const char *fmtch, dwarf_vma value, unsigned num_bytes)
+ {
+   /* As dwarf_vmatoa is used more then once in a printf call
+-     for output, we are cycling through an fixed array of pointers
++     for output, we are cycling through a fixed array of pointers
+      for return address.  */
+   static int buf_pos = 0;
+   static struct dwarf_vmatoa_buf
+@@ -796,24 +796,70 @@ fetch_indexed_string (dwarf_vma idx, str
+   return ret;
+ }
+ 
+-static const char *
+-fetch_indexed_value (dwarf_vma offset, dwarf_vma bytes)
++static dwarf_vma
++fetch_indexed_addr (dwarf_vma offset, uint32_t num_bytes)
+ {
+   struct dwarf_section *section = &debug_displays [debug_addr].section;
+ 
+   if (section->start == NULL)
+-    return (_("<no .debug_addr section>"));
++    {
++      warn (_("<no .debug_addr section>"));
++      return 0;
++    }
+ 
+-  if (offset + bytes > section->size)
++  if (offset + num_bytes > section->size)
+     {
+       warn (_("Offset into section %s too big: 0x%s\n"),
+ 	    section->name, dwarf_vmatoa ("x", offset));
+-      return "<offset too big>";
++      return 0;
+     }
+ 
+-  return dwarf_vmatoa ("x", byte_get (section->start + offset, bytes));
++  return byte_get (section->start + offset, num_bytes);
+ }
+ 
++/* Fetch a value from a debug section that has been indexed by
++   something in another section (eg DW_FORM_loclistx).
++   Returns 0 if the value could not be found.  */
++
++static dwarf_vma
++fetch_indexed_value (dwarf_vma                        index,
++		     enum dwarf_section_display_enum  sec_enum)
++{
++  struct dwarf_section *section = &debug_displays [sec_enum].section;
++
++  if (section->start == NULL)
++    {
++      warn (_("Unable to locate %s section\n"), section->uncompressed_name);
++      return 0;
++    }
++
++  uint32_t pointer_size, bias;
++
++  if (byte_get (section->start, 4) == 0xffffffff)
++    {
++      pointer_size = 8;
++      bias = 20;
++    }
++  else
++    {
++      pointer_size = 4;
++      bias = 12;
++    }
++ 
++  dwarf_vma offset = index * pointer_size;
++
++  /* Offsets are biased by the size of the section header.  */
++  offset += bias;
++
++  if (offset + pointer_size > section->size)
++    {
++      warn (_("Offset into section %s too big: 0x%s\n"),
++	    section->name, dwarf_vmatoa ("x", offset));
++      return 0;
++    }
++
++  return byte_get (section->start + offset, pointer_size);
++}
+ 
+ /* FIXME:  There are better and more efficient ways to handle
+    these structures.  For now though, I just want something that
+@@ -1999,6 +2045,8 @@ skip_attr_bytes (unsigned long form,
+     case DW_FORM_strx:
+     case DW_FORM_GNU_addr_index:
+     case DW_FORM_addrx:
++    case DW_FORM_loclistx:
++    case DW_FORM_rnglistx:
+       READ_ULEB (uvalue, data, end);
+       break;
+ 
+@@ -2410,9 +2458,6 @@ read_and_display_attr_value (unsigned lo
+ 
+   switch (form)
+     {
+-    default:
+-      break;
+-
+     case DW_FORM_ref_addr:
+       if (dwarf_version == 2)
+ 	SAFE_BYTE_GET_AND_INC (uvalue, data, pointer_size, end);
+@@ -2496,6 +2541,8 @@ read_and_display_attr_value (unsigned lo
+     case DW_FORM_udata:
+     case DW_FORM_GNU_addr_index:
+     case DW_FORM_addrx:
++    case DW_FORM_loclistx:
++    case DW_FORM_rnglistx:
+       READ_ULEB (uvalue, data, end);
+       break;
+ 
+@@ -2515,6 +2562,9 @@ read_and_display_attr_value (unsigned lo
+     case DW_FORM_implicit_const:
+       uvalue = implicit_const;
+       break;
++
++    default:
++      break;
+     }
+ 
+   switch (form)
+@@ -2710,6 +2760,8 @@ read_and_display_attr_value (unsigned lo
+     case DW_FORM_addrx2:
+     case DW_FORM_addrx3:
+     case DW_FORM_addrx4:
++    case DW_FORM_loclistx:
++    case DW_FORM_rnglistx:
+       if (!do_loc)
+ 	{
+ 	  dwarf_vma base;
+@@ -2728,11 +2780,11 @@ read_and_display_attr_value (unsigned lo
+ 	    /* We have already displayed the form name.  */
+ 	    printf (_("%c(index: 0x%s): %s"), delimiter,
+ 		    dwarf_vmatoa ("x", uvalue),
+-		    fetch_indexed_value (offset, pointer_size));
++		    dwarf_vmatoa ("x", fetch_indexed_addr (offset, pointer_size)));
+ 	  else
+ 	    printf (_("%c(addr_index: 0x%s): %s"), delimiter,
+ 		    dwarf_vmatoa ("x", uvalue),
+-		    fetch_indexed_value (offset, pointer_size));
++		    dwarf_vmatoa ("x", fetch_indexed_addr (offset, pointer_size)));
+ 	}
+       break;
+ 
+@@ -2754,6 +2806,13 @@ read_and_display_attr_value (unsigned lo
+     {
+       switch (attribute)
+ 	{
++	case DW_AT_loclists_base:
++	  if (debug_info_p->loclists_base)
++	    warn (_("CU @ 0x%s has multiple loclists_base values"),
++		  dwarf_vmatoa ("x", debug_info_p->cu_offset));
++	  debug_info_p->loclists_base = uvalue;
++	  break;
++
+ 	case DW_AT_frame_base:
+ 	  have_frame_base = 1;
+ 	  /* Fall through.  */
+@@ -2776,7 +2835,8 @@ read_and_display_attr_value (unsigned lo
+ 	case DW_AT_GNU_call_site_target_clobbered:
+ 	  if ((dwarf_version < 4
+ 	       && (form == DW_FORM_data4 || form == DW_FORM_data8))
+-	      || form == DW_FORM_sec_offset)
++	      || form == DW_FORM_sec_offset
++	      || form == DW_FORM_loclistx)
+ 	    {
+ 	      /* Process location list.  */
+ 	      unsigned int lmax = debug_info_p->max_loc_offsets;
+@@ -2796,11 +2856,17 @@ read_and_display_attr_value (unsigned lo
+ 			       lmax, sizeof (*debug_info_p->have_frame_base));
+ 		  debug_info_p->max_loc_offsets = lmax;
+ 		}
+-	      if (this_set != NULL)
++
++	      if (form == DW_FORM_loclistx)
++		uvalue = fetch_indexed_value (uvalue, loclists);
++	      else if (this_set != NULL)
+ 		uvalue += this_set->section_offsets [DW_SECT_LOC];
++
+ 	      debug_info_p->have_frame_base [num] = have_frame_base;
+ 	      if (attribute != DW_AT_GNU_locviews)
+ 		{
++		  uvalue += debug_info_p->loclists_base;
++
+ 		  /* Corrupt DWARF info can produce more offsets than views.
+ 		     See PR 23062 for an example.  */
+ 		  if (debug_info_p->num_loc_offsets
+@@ -2844,7 +2910,8 @@ read_and_display_attr_value (unsigned lo
+ 	case DW_AT_ranges:
+ 	  if ((dwarf_version < 4
+ 	       && (form == DW_FORM_data4 || form == DW_FORM_data8))
+-	      || form == DW_FORM_sec_offset)
++	      || form == DW_FORM_sec_offset
++	      || form == DW_FORM_rnglistx)
+ 	    {
+ 	      /* Process range list.  */
+ 	      unsigned int lmax = debug_info_p->max_range_lists;
+@@ -2858,6 +2925,10 @@ read_and_display_attr_value (unsigned lo
+ 			       lmax, sizeof (*debug_info_p->range_lists));
+ 		  debug_info_p->max_range_lists = lmax;
+ 		}
++
++	      if (form == DW_FORM_rnglistx)
++		uvalue = fetch_indexed_value (uvalue, rnglists);
++
+ 	      debug_info_p->range_lists [num] = uvalue;
+ 	      debug_info_p->num_range_lists++;
+ 	    }
+@@ -3231,6 +3302,7 @@ read_and_display_attr_value (unsigned lo
+       have_frame_base = 1;
+       /* Fall through.  */
+     case DW_AT_location:
++    case DW_AT_loclists_base:
+     case DW_AT_string_length:
+     case DW_AT_return_addr:
+     case DW_AT_data_member_location:
+@@ -3248,7 +3320,8 @@ read_and_display_attr_value (unsigned lo
+     case DW_AT_GNU_call_site_target_clobbered:
+       if ((dwarf_version < 4
+ 	   && (form == DW_FORM_data4 || form == DW_FORM_data8))
+-	  || form == DW_FORM_sec_offset)
++	  || form == DW_FORM_sec_offset
++	  || form == DW_FORM_loclistx)
+ 	printf (_(" (location list)"));
+       /* Fall through.  */
+     case DW_AT_allocated:
+@@ -3517,6 +3590,9 @@ process_debug_info (struct dwarf_section
+     }
+ 
+   load_debug_section_with_follow (abbrev_sec, file);
++  load_debug_section_with_follow (loclists, file);
++  load_debug_section_with_follow (rnglists, file);
++  
+   if (debug_displays [abbrev_sec].section.start == NULL)
+     {
+       warn (_("Unable to locate %s section!\n"),
+@@ -3729,6 +3805,7 @@ process_debug_info (struct dwarf_section
+ 	  debug_information [unit].have_frame_base = NULL;
+ 	  debug_information [unit].max_loc_offsets = 0;
+ 	  debug_information [unit].num_loc_offsets = 0;
++	  debug_information [unit].loclists_base = 0;
+ 	  debug_information [unit].range_lists = NULL;
+ 	  debug_information [unit].max_range_lists= 0;
+ 	  debug_information [unit].num_range_lists = 0;
+@@ -6465,20 +6542,21 @@ display_loc_list (struct dwarf_section *
+ /* Display a location list from a normal (ie, non-dwo) .debug_loclists section.  */
+ 
+ static void
+-display_loclists_list (struct dwarf_section *section,
+-		       unsigned char **start_ptr,
+-		       unsigned int debug_info_entry,
+-		       dwarf_vma offset,
+-		       dwarf_vma base_address,
+-		       unsigned char **vstart_ptr,
+-		       int has_frame_base)
+-{
+-  unsigned char *start = *start_ptr, *vstart = *vstart_ptr;
+-  unsigned char *section_end = section->start + section->size;
+-  dwarf_vma    cu_offset;
+-  unsigned int pointer_size;
+-  unsigned int offset_size;
+-  int dwarf_version;
++display_loclists_list (struct dwarf_section *  section,
++		       unsigned char **        start_ptr,
++		       unsigned int            debug_info_entry,
++		       dwarf_vma               offset,
++		       dwarf_vma               base_address,
++		       unsigned char **        vstart_ptr,
++		       int                     has_frame_base)
++{
++  unsigned char *  start = *start_ptr;
++  unsigned char *  vstart = *vstart_ptr;
++  unsigned char *  section_end = section->start + section->size;
++  dwarf_vma        cu_offset;
++  unsigned int     pointer_size;
++  unsigned int     offset_size;
++  unsigned int     dwarf_version;
+ 
+   /* Initialize it due to a false compiler warning.  */
+   dwarf_vma begin = -1, vbegin = -1;
+@@ -6544,27 +6622,59 @@ display_loclists_list (struct dwarf_sect
+ 	case DW_LLE_end_of_list:
+ 	  printf (_("<End of list>\n"));
+ 	  break;
++
++	case DW_LLE_base_addressx:
++	  READ_ULEB (base_address, start, section_end);
++	  print_dwarf_vma (base_address, pointer_size);
++	  printf (_("(index into .debug_addr) "));
++	  base_address = fetch_indexed_addr (base_address, pointer_size);
++	  print_dwarf_vma (base_address, pointer_size);
++	  printf (_("(base address)\n"));
++	  break;
++
++	case DW_LLE_startx_endx:
++	  READ_ULEB (begin, start, section_end);
++	  begin = fetch_indexed_addr (begin, pointer_size);
++	  READ_ULEB (end, start, section_end);
++	  end = fetch_indexed_addr (end, pointer_size);
++	  break;
++
++	case DW_LLE_startx_length:
++	  READ_ULEB (begin, start, section_end);
++	  begin = fetch_indexed_addr (begin, pointer_size);
++	  READ_ULEB (end, start, section_end);
++	  end += begin;
++	  break;
++
++	case DW_LLE_default_location:
++	  begin = end = 0;
++	  break;
++	  
+ 	case DW_LLE_offset_pair:
+ 	  READ_ULEB (begin, start, section_end);
+ 	  begin += base_address;
+ 	  READ_ULEB (end, start, section_end);
+ 	  end += base_address;
+ 	  break;
++
++	case DW_LLE_base_address:
++	  SAFE_BYTE_GET_AND_INC (base_address, start, pointer_size,
++				 section_end);
++	  print_dwarf_vma (base_address, pointer_size);
++	  printf (_("(base address)\n"));
++	  break;
++
+ 	case DW_LLE_start_end:
+ 	  SAFE_BYTE_GET_AND_INC (begin, start, pointer_size, section_end);
+ 	  SAFE_BYTE_GET_AND_INC (end, start, pointer_size, section_end);
+ 	  break;
++
+ 	case DW_LLE_start_length:
+ 	  SAFE_BYTE_GET_AND_INC (begin, start, pointer_size, section_end);
+ 	  READ_ULEB (end, start, section_end);
+ 	  end += begin;
+ 	  break;
+-	case DW_LLE_base_address:
+-	  SAFE_BYTE_GET_AND_INC (base_address, start, pointer_size,
+-				 section_end);
+-	  print_dwarf_vma (base_address, pointer_size);
+-	  printf (_("(base address)\n"));
+-	  break;
++
+ #ifdef DW_LLE_view_pair
+ 	case DW_LLE_view_pair:
+ 	  if (vstart)
+@@ -6578,15 +6688,17 @@ display_loclists_list (struct dwarf_sect
+ 	  printf (_("views for:\n"));
+ 	  continue;
+ #endif
++
+ 	default:
+ 	  error (_("Invalid location list entry type %d\n"), llet);
+ 	  return;
+ 	}
++
+       if (llet == DW_LLE_end_of_list)
+ 	break;
+-      if (llet != DW_LLE_offset_pair
+-	  && llet != DW_LLE_start_end
+-	  && llet != DW_LLE_start_length)
++
++      if (llet == DW_LLE_base_address
++	  || llet == DW_LLE_base_addressx)
+ 	continue;
+ 
+       if (start == section_end)
+@@ -6828,6 +6940,218 @@ loc_offsets_compar (const void *ap, cons
+ }
+ 
+ static int
++display_offset_entry_loclists (struct dwarf_section *section)
++{
++  unsigned char *  start = section->start;
++  unsigned char * const end = start + section->size;
++
++  introduce (section, false);  
++
++  do
++    {
++      dwarf_vma        length;
++      unsigned short   version;
++      unsigned char    address_size;
++      unsigned char    segment_selector_size;
++      uint32_t         offset_entry_count;
++      uint32_t         i;
++      bool             is_64bit;
++
++      printf (_("Table at Offset 0x%lx\n"), (long)(start - section->start));
++
++      SAFE_BYTE_GET_AND_INC (length, start, 4, end);
++      if (length == 0xffffffff)
++	{
++	  is_64bit = true;
++	  SAFE_BYTE_GET_AND_INC (length, start, 8, end);
++	}
++      else
++	is_64bit = false;
++
++      SAFE_BYTE_GET_AND_INC (version, start, 2, end);
++      SAFE_BYTE_GET_AND_INC (address_size, start, 1, end);
++      SAFE_BYTE_GET_AND_INC (segment_selector_size, start, 1, end);
++      SAFE_BYTE_GET_AND_INC (offset_entry_count, start, 4, end);
++
++      printf (_("  Length:          0x%s\n"), dwarf_vmatoa ("x", length));
++      printf (_("  DWARF version:   %u\n"), version);
++      printf (_("  Address size:    %u\n"), address_size);
++      printf (_("  Segment size:    %u\n"), segment_selector_size);
++      printf (_("  Offset entries:  %u\n"), offset_entry_count);
++
++      if (version < 5)
++	{
++	  warn (_("The %s section contains a corrupt or "
++		  "unsupported version number: %d.\n"),
++		section->name, version);
++	  return 0;
++	}
++
++      if (segment_selector_size != 0)
++	{
++	  warn (_("The %s section contains an "
++		  "unsupported segment selector size: %d.\n"),
++		section->name, segment_selector_size);
++	  return 0;
++	}
++      
++      if (offset_entry_count == 0)
++	{
++	  warn (_("The %s section contains a table without offset\n"),
++		section->name);
++	  return 0;
++	}
++  
++      printf (_("\n   Offset Entries starting at 0x%lx:\n"),
++	      (long)(start - section->start));
++
++      if (is_64bit)
++	{
++	  for (i = 0; i < offset_entry_count; i++)
++	    {
++	      dwarf_vma entry;
++
++	      SAFE_BYTE_GET_AND_INC (entry, start, 8, end);
++	      printf (_("    [%6u] 0x%s\n"), i, dwarf_vmatoa ("x", entry));
++	    }
++	}
++      else
++	{
++	  for (i = 0; i < offset_entry_count; i++)
++	    {
++	      uint32_t entry;
++
++	      SAFE_BYTE_GET_AND_INC (entry, start, 4, end);
++	      printf (_("    [%6u] 0x%x\n"), i, entry);
++	    }
++	}
++
++      putchar ('\n');
++
++      uint32_t j;
++
++      for (j = 1, i = 0; i < offset_entry_count;)
++	{
++	  unsigned char  lle;
++	  dwarf_vma      base_address = 0;
++	  dwarf_vma      begin;
++	  dwarf_vma      finish;
++	  dwarf_vma      off = start - section->start;
++
++	  if (j != i)
++	    {
++	      printf (_("   Offset Entry %u\n"), i);
++	      j = i;
++	    }
++
++	  printf ("    ");
++	  print_dwarf_vma (off, 4);
++
++	  SAFE_BYTE_GET_AND_INC (lle, start, 1, end);
++
++	  switch (lle)
++	    {
++	    case DW_LLE_end_of_list:
++	      printf (_("<End of list>\n\n"));
++	      i ++;
++	      continue;
++
++	    case DW_LLE_base_addressx:
++	      READ_ULEB (base_address, start, end);
++	      print_dwarf_vma (base_address, address_size);
++	      printf (_("(index into .debug_addr) "));
++	      base_address = fetch_indexed_addr (base_address, address_size);
++	      print_dwarf_vma (base_address, address_size);
++	      printf (_("(base address)\n"));
++	      continue;
++
++	    case DW_LLE_startx_endx:
++	      READ_ULEB (begin, start, end);
++	      begin = fetch_indexed_addr (begin, address_size);
++	      READ_ULEB (finish, start, end);
++	      finish = fetch_indexed_addr (finish, address_size);
++	      break;
++
++	    case DW_LLE_startx_length:
++	      READ_ULEB (begin, start, end);
++	      begin = fetch_indexed_addr (begin, address_size);
++	      READ_ULEB (finish, start, end);
++	      finish += begin;
++	      break;
++
++	    case DW_LLE_offset_pair:
++	      READ_ULEB (begin, start, end);
++	      begin += base_address;
++	      READ_ULEB (finish, start, end);
++	      finish += base_address;
++	      break;
++
++	    case DW_LLE_default_location:
++	      begin = finish = 0;
++	      break;
++
++	    case DW_LLE_base_address:
++	      SAFE_BYTE_GET_AND_INC (base_address, start, address_size, end);
++	      print_dwarf_vma (base_address, address_size);
++	      printf (_("(base address)\n"));
++	      continue;
++
++	    case DW_LLE_start_end:
++	      SAFE_BYTE_GET_AND_INC (begin,  start, address_size, end);
++	      SAFE_BYTE_GET_AND_INC (finish, start, address_size, end);
++	      break;
++
++	    case DW_LLE_start_length:
++	      SAFE_BYTE_GET_AND_INC (begin, start, address_size, end);
++	      READ_ULEB (finish, start, end);
++	      finish += begin;
++	      break;
++
++	    default:
++	      error (_("Invalid location list entry type %d\n"), lle);
++	      return 0;
++	    }
++
++	  if (start == end)
++	    {
++	      warn (_("Location list starting at offset 0x%lx is not terminated.\n"),
++		    (unsigned long) off);
++	      break;
++	    }
++
++	  print_dwarf_vma (begin, address_size);
++	  print_dwarf_vma (finish, address_size);
++
++	  if (begin == finish)
++	    fputs (_(" (start == end)"), stdout);
++	  else if (begin > finish)
++	    fputs (_(" (start > end)"), stdout);
++
++	  /* Read the counted location descriptions.  */
++	  READ_ULEB (length, start, end);
++
++	  if (length > (size_t) (end - start))
++	    {
++	      warn (_("Location list starting at offset 0x%lx is not terminated.\n"),
++		    (unsigned long) off);
++	      break;
++	    }
++
++	  putchar (' ');
++	  (void) decode_location_expression (start, address_size, address_size,
++					     version, length, 0, section);
++	  start += length;
++	  putchar ('\n');
++	}
++
++      putchar ('\n');
++    }
++  while (start < end);
++
++  return 1;
++}
++
++static int
+ display_debug_loc (struct dwarf_section *section, void *file)
+ {
+   unsigned char *start = section->start, *vstart = NULL;
+@@ -6893,13 +7217,9 @@ display_debug_loc (struct dwarf_section
+ 	}
+ 
+       SAFE_BYTE_GET_AND_INC (offset_entry_count, hdrptr, 4, end);
++
+       if (offset_entry_count != 0)
+-	{
+-	  warn (_("The %s section contains "
+-		  "unsupported offset entry count: %d.\n"),
+-		section->name, offset_entry_count);
+-	  return 0;
+-	}
++	return display_offset_entry_loclists (section);
+ 
+       expected_start = hdrptr - section_begin;
+     }
+@@ -6959,9 +7279,10 @@ display_debug_loc (struct dwarf_section
+   if (debug_information [first].num_loc_offsets > 0
+       && debug_information [first].loc_offsets [0] != expected_start
+       && debug_information [first].loc_views [0] != expected_start)
+-    warn (_("Location lists in %s section start at 0x%s\n"),
++    warn (_("Location lists in %s section start at 0x%s rather than 0x%s\n"),
+ 	  section->name,
+-	  dwarf_vmatoa ("x", debug_information [first].loc_offsets [0]));
++	  dwarf_vmatoa ("x", debug_information [first].loc_offsets [0]),
++	  dwarf_vmatoa ("x", expected_start));
+ 
+   if (!locs_sorted)
+     array = (unsigned int *) xcmalloc (num_loc_list, sizeof (unsigned int));
+@@ -7639,24 +7960,44 @@ display_debug_rnglists_list (unsigned ch
+ 	case DW_RLE_end_of_list:
+ 	  printf (_("<End of list>\n"));
+ 	  break;
+-	case DW_RLE_base_address:
+-	  SAFE_BYTE_GET_AND_INC (base_address, start, pointer_size, finish);
++	case DW_RLE_base_addressx:
++	  READ_ULEB (base_address, start, finish);
++	  print_dwarf_vma (base_address, pointer_size);
++	  printf (_("(base address index) "));
++	  base_address = fetch_indexed_addr (base_address, pointer_size);
+ 	  print_dwarf_vma (base_address, pointer_size);
+ 	  printf (_("(base address)\n"));
+ 	  break;
+-	case DW_RLE_start_length:
+-	  SAFE_BYTE_GET_AND_INC (begin, start, pointer_size, finish);
++	case DW_RLE_startx_endx:
++	  READ_ULEB (begin, start, finish);
++	  READ_ULEB (end, start, finish);
++	  begin = fetch_indexed_addr (begin, pointer_size);
++	  end   = fetch_indexed_addr (begin, pointer_size);
++	  break;
++	case DW_RLE_startx_length:
++	  READ_ULEB (begin, start, finish);
+ 	  READ_ULEB (length, start, finish);
++	  begin = fetch_indexed_addr (begin, pointer_size);
+ 	  end = begin + length;
+ 	  break;
+ 	case DW_RLE_offset_pair:
+ 	  READ_ULEB (begin, start, finish);
+ 	  READ_ULEB (end, start, finish);
+ 	  break;
++	case DW_RLE_base_address:
++	  SAFE_BYTE_GET_AND_INC (base_address, start, pointer_size, finish);
++	  print_dwarf_vma (base_address, pointer_size);
++	  printf (_("(base address)\n"));
++	  break;
+ 	case DW_RLE_start_end:
+ 	  SAFE_BYTE_GET_AND_INC (begin, start, pointer_size, finish);
+ 	  SAFE_BYTE_GET_AND_INC (end, start, pointer_size, finish);
+ 	  break;
++	case DW_RLE_start_length:
++	  SAFE_BYTE_GET_AND_INC (begin, start, pointer_size, finish);
++	  READ_ULEB (length, start, finish);
++	  end = begin + length;
++	  break;
+ 	default:
+ 	  error (_("Invalid range list entry type %d\n"), rlet);
+ 	  rlet = DW_RLE_end_of_list;
+@@ -7664,7 +8005,7 @@ display_debug_rnglists_list (unsigned ch
+ 	}
+       if (rlet == DW_RLE_end_of_list)
+ 	break;
+-      if (rlet == DW_RLE_base_address)
++      if (rlet == DW_RLE_base_address || rlet == DW_RLE_base_addressx)
+ 	continue;
+ 
+       /* Only a DW_RLE_offset_pair needs the base address added.  */
+@@ -7709,6 +8050,8 @@ display_debug_ranges (struct dwarf_secti
+       return 0;
+     }
+ 
++  introduce (section, false);
++
+   if (is_rnglists)
+     {
+       dwarf_vma initial_length;
+@@ -7745,19 +8088,19 @@ display_debug_ranges (struct dwarf_secti
+ 	    }
+ 	}
+ 
+-      /* Get and check the version number.  */
++      /* Get the other fields in the header.  */
+       SAFE_BYTE_GET_AND_INC (version, start, 2, finish);
+-
+-      if (version != 5)
+-	{
+-	  warn (_("Only DWARF version 5 debug_rnglists info "
+-		  "is currently supported.\n"));
+-	  return 0;
+-	}
+-
+       SAFE_BYTE_GET_AND_INC (address_size, start, 1, finish);
+-
+       SAFE_BYTE_GET_AND_INC (segment_selector_size, start, 1, finish);
++      SAFE_BYTE_GET_AND_INC (offset_entry_count, start, 4, finish);
++
++      printf (_("  Length:          0x%s\n"), dwarf_vmatoa ("x", initial_length));
++      printf (_("  DWARF version:   %u\n"), version);
++      printf (_("  Address size:    %u\n"), address_size);
++      printf (_("  Segment size:    %u\n"), segment_selector_size);
++      printf (_("  Offset entries:  %u\n"), offset_entry_count);
++
++      /* Check the fields.  */
+       if (segment_selector_size != 0)
+ 	{
+ 	  warn (_("The %s section contains "
+@@ -7766,16 +8109,39 @@ display_debug_ranges (struct dwarf_secti
+ 	  return 0;
+ 	}
+ 
+-      SAFE_BYTE_GET_AND_INC (offset_entry_count, start, 4, finish);
+-      if (offset_entry_count != 0)
++      if (version < 5)
+ 	{
+-	  warn (_("The %s section contains "
+-		  "unsupported offset entry count: %u.\n"),
+-		section->name, offset_entry_count);
++	  warn (_("Only DWARF version 5+ debug_rnglists info "
++		  "is currently supported.\n"));
+ 	  return 0;
+ 	}
+-    }
+ 
++      if (offset_entry_count != 0)
++	{
++	  printf (_("\n   Offsets starting at 0x%lx:\n"), (long)(start - section->start));
++	  if (offset_size == 8)
++	    {
++	      for (i = 0; i < offset_entry_count; i++)
++		{
++		  dwarf_vma entry;
++
++		  SAFE_BYTE_GET_AND_INC (entry, start, 8, finish);
++		  printf (_("    [%6u] 0x%s\n"), i, dwarf_vmatoa ("x", entry));
++		}
++	    }
++	  else
++	    {
++	      for (i = 0; i < offset_entry_count; i++)
++		{
++		  uint32_t entry;
++
++		  SAFE_BYTE_GET_AND_INC (entry, start, 4, finish);
++		  printf (_("    [%6u] 0x%x\n"), i, entry);
++		}
++	    }
++	}
++    }
++  
+   if (load_debug_info (file) == 0)
+     {
+       warn (_("Unable to load/parse the .debug_info section, so cannot interpret the %s section.\n"),
+@@ -7834,8 +8200,7 @@ display_debug_ranges (struct dwarf_secti
+     warn (_("Range lists in %s section start at 0x%lx\n"),
+ 	  section->name, (unsigned long) range_entries[0].ranges_offset);
+ 
+-  introduce (section, false);
+-
++  putchar ('\n');
+   printf (_("    Offset   Begin    End\n"));
+ 
+   for (i = 0; i < num_range_list; i++)
+@@ -7895,8 +8260,12 @@ display_debug_ranges (struct dwarf_secti
+       start = next;
+       last_start = next;
+ 
+-      (is_rnglists ? display_debug_rnglists_list : display_debug_ranges_list)
+-	(start, finish, pointer_size, offset, base_address);
++      if (is_rnglists)
++	display_debug_rnglists_list
++	  (start, finish, pointer_size, offset, base_address);
++      else
++	display_debug_ranges_list
++	  (start, finish, pointer_size, offset, base_address);
+     }
+   putchar ('\n');
+ 
+diff --git a/binutils/dwarf.h b/binutils/dwarf.h
+index 4fc62abfa4c..ccce2461c81 100644
+--- a/binutils/dwarf.h
++++ b/binutils/dwarf.h
+@@ -181,9 +181,13 @@ typedef struct
+   /* This is an array of offsets to the location view table.  */
+   dwarf_vma *    loc_views;
+   int *          have_frame_base;
++
++  /* Information for associating location lists with CUs.  */
+   unsigned int   num_loc_offsets;
+   unsigned int   max_loc_offsets;
+   unsigned int   num_loc_views;
++  dwarf_vma      loclists_base;
++
+   /* List of .debug_ranges offsets seen in this .debug_info.  */
+   dwarf_vma *    range_lists;
+   unsigned int   num_range_lists;
+diff --git a/binutils/testsuite/binutils-all/dw5.W b/binutils/testsuite/binutils-all/dw5.W
+index ebab8b7d3b0..bfcdac175ba 100644
+--- a/binutils/testsuite/binutils-all/dw5.W
++++ b/binutils/testsuite/binutils-all/dw5.W
+@@ -281,7 +281,7 @@ Contents of the .debug_loclists section:
+     00000039 <End of list>
+ 
+ Contents of the .debug_rnglists section:
+-
++#...
+     Offset   Begin    End
+     0000000c 0000000000001234 0000000000001236 
+     00000016 0000000000001234 0000000000001239 
+diff --git a/binutils/testsuite/binutils-all/x86-64/pr26808.dump b/binutils/testsuite/binutils-all/x86-64/pr26808.dump
+index f64f9d008f9..7ef73b24dc9 100644
+--- a/binutils/testsuite/binutils-all/x86-64/pr26808.dump
++++ b/binutils/testsuite/binutils-all/x86-64/pr26808.dump
+@@ -30,13 +30,13 @@ Contents of the .debug_info.dwo section:
+     <a5>   DW_AT_decl_file   : 1
+     <a6>   DW_AT_decl_line   : 30
+     <a7>   DW_AT_type        : <0x90>
+-    <ab>   DW_AT_low_pc      : (addr_index: 0x0): <no .debug_addr section>
++    <ab>   DW_AT_low_pc      : (addr_index: 0x0): 0
+     <ac>   DW_AT_high_pc     : 0x304
+     <b4>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <b6>   DW_AT_GNU_all_tail_call_sites: 1
+     <b6>   DW_AT_sibling     : <0x11b>
+  <2><ba>: Abbrev Number: 14 (DW_TAG_lexical_block)
+-    <bb>   DW_AT_low_pc      : (addr_index: 0x1): <no .debug_addr section>
++    <bb>   DW_AT_low_pc      : (addr_index: 0x1): 0
+     <bc>   DW_AT_high_pc     : 0x2fa
+  <3><c4>: Abbrev Number: 15 (DW_TAG_variable)
+     <c5>   DW_AT_name        : c1
+@@ -56,7 +56,7 @@ Contents of the .debug_info.dwo section:
+     <ff>   DW_AT_artificial  : 1
+     <ff>   DW_AT_location    : 2 byte block: fb 2 	(DW_OP_GNU_addr_index <0x2>)
+  <3><102>: Abbrev Number: 14 (DW_TAG_lexical_block)
+-    <103>   DW_AT_low_pc      : (addr_index: 0x3): <no .debug_addr section>
++    <103>   DW_AT_low_pc      : (addr_index: 0x3): 0
+     <104>   DW_AT_high_pc     : 0x2f
+  <4><10c>: Abbrev Number: 17 (DW_TAG_variable)
+     <10d>   DW_AT_name        : i
+@@ -274,7 +274,7 @@ Contents of the .debug_info.dwo section:
+     <2dd>   DW_AT_decl_file   : 1
+     <2de>   DW_AT_decl_line   : 70
+     <2df>   DW_AT_linkage_name: _Z4f13iv
+-    <2e8>   DW_AT_low_pc      : (addr_index: 0x0): <no .debug_addr section>
++    <2e8>   DW_AT_low_pc      : (addr_index: 0x0): 0
+     <2e9>   DW_AT_high_pc     : 0x6
+     <2f1>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <2f3>   DW_AT_GNU_all_call_sites: 1
+@@ -282,7 +282,7 @@ Contents of the .debug_info.dwo section:
+     <2f4>   DW_AT_specification: <0x219>
+     <2f8>   DW_AT_decl_file   : 2
+     <2f9>   DW_AT_decl_line   : 30
+-    <2fa>   DW_AT_low_pc      : (addr_index: 0x1): <no .debug_addr section>
++    <2fa>   DW_AT_low_pc      : (addr_index: 0x1): 0
+     <2fb>   DW_AT_high_pc     : 0x20
+     <303>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <305>   DW_AT_object_pointer: <0x30d>
+@@ -300,7 +300,7 @@ Contents of the .debug_info.dwo section:
+     <31d>   DW_AT_specification: <0x223>
+     <321>   DW_AT_decl_file   : 2
+     <322>   DW_AT_decl_line   : 38
+-    <323>   DW_AT_low_pc      : (addr_index: 0x2): <no .debug_addr section>
++    <323>   DW_AT_low_pc      : (addr_index: 0x2): 0
+     <324>   DW_AT_high_pc     : 0x18
+     <32c>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <32e>   DW_AT_object_pointer: <0x336>
+@@ -316,7 +316,7 @@ Contents of the .debug_info.dwo section:
+     <341>   DW_AT_specification: <0x22d>
+     <345>   DW_AT_decl_file   : 2
+     <346>   DW_AT_decl_line   : 46
+-    <347>   DW_AT_low_pc      : (addr_index: 0x3): <no .debug_addr section>
++    <347>   DW_AT_low_pc      : (addr_index: 0x3): 0
+     <348>   DW_AT_high_pc     : 0x18
+     <350>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <352>   DW_AT_object_pointer: <0x35a>
+@@ -332,7 +332,7 @@ Contents of the .debug_info.dwo section:
+     <365>   DW_AT_specification: <0x237>
+     <369>   DW_AT_decl_file   : 2
+     <36a>   DW_AT_decl_line   : 54
+-    <36b>   DW_AT_low_pc      : (addr_index: 0x4): <no .debug_addr section>
++    <36b>   DW_AT_low_pc      : (addr_index: 0x4): 0
+     <36c>   DW_AT_high_pc     : 0x16
+     <374>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <376>   DW_AT_object_pointer: <0x37e>
+@@ -348,7 +348,7 @@ Contents of the .debug_info.dwo section:
+     <389>   DW_AT_specification: <0x26b>
+     <38d>   DW_AT_decl_file   : 2
+     <38e>   DW_AT_decl_line   : 62
+-    <38f>   DW_AT_low_pc      : (addr_index: 0x5): <no .debug_addr section>
++    <38f>   DW_AT_low_pc      : (addr_index: 0x5): 0
+     <390>   DW_AT_high_pc     : 0x16
+     <398>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <39a>   DW_AT_object_pointer: <0x3a2>
+@@ -366,7 +366,7 @@ Contents of the .debug_info.dwo section:
+     <3b2>   DW_AT_specification: <0x275>
+     <3b6>   DW_AT_decl_file   : 2
+     <3b7>   DW_AT_decl_line   : 72
+-    <3b8>   DW_AT_low_pc      : (addr_index: 0x6): <no .debug_addr section>
++    <3b8>   DW_AT_low_pc      : (addr_index: 0x6): 0
+     <3b9>   DW_AT_high_pc     : 0x1b
+     <3c1>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <3c3>   DW_AT_object_pointer: <0x3cb>
+@@ -382,7 +382,7 @@ Contents of the .debug_info.dwo section:
+     <3d6>   DW_AT_specification: <0x27f>
+     <3da>   DW_AT_decl_file   : 2
+     <3db>   DW_AT_decl_line   : 82
+-    <3dc>   DW_AT_low_pc      : (addr_index: 0x7): <no .debug_addr section>
++    <3dc>   DW_AT_low_pc      : (addr_index: 0x7): 0
+     <3dd>   DW_AT_high_pc     : 0x1b
+     <3e5>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <3e7>   DW_AT_object_pointer: <0x3ef>
+@@ -398,7 +398,7 @@ Contents of the .debug_info.dwo section:
+     <3fa>   DW_AT_specification: <0x289>
+     <3fe>   DW_AT_decl_file   : 2
+     <3ff>   DW_AT_decl_line   : 92
+-    <400>   DW_AT_low_pc      : (addr_index: 0x8): <no .debug_addr section>
++    <400>   DW_AT_low_pc      : (addr_index: 0x8): 0
+     <401>   DW_AT_high_pc     : 0x19
+     <409>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <40b>   DW_AT_object_pointer: <0x413>
+@@ -414,7 +414,7 @@ Contents of the .debug_info.dwo section:
+     <41e>   DW_AT_specification: <0x2ae>
+     <422>   DW_AT_decl_file   : 2
+     <423>   DW_AT_decl_line   : 102
+-    <424>   DW_AT_low_pc      : (addr_index: 0x9): <no .debug_addr section>
++    <424>   DW_AT_low_pc      : (addr_index: 0x9): 0
+     <425>   DW_AT_high_pc     : 0x19
+     <42d>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <42f>   DW_AT_object_pointer: <0x437>
+@@ -432,7 +432,7 @@ Contents of the .debug_info.dwo section:
+     <447>   DW_AT_specification: <0x2b8>
+     <44b>   DW_AT_decl_file   : 2
+     <44c>   DW_AT_decl_line   : 112
+-    <44d>   DW_AT_low_pc      : (addr_index: 0xa): <no .debug_addr section>
++    <44d>   DW_AT_low_pc      : (addr_index: 0xa): 0
+     <44e>   DW_AT_high_pc     : 0x1f
+     <456>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <458>   DW_AT_object_pointer: <0x460>
+@@ -451,7 +451,7 @@ Contents of the .debug_info.dwo section:
+     <471>   DW_AT_decl_line   : 120
+     <472>   DW_AT_linkage_name: _Z4f11av
+     <47b>   DW_AT_type        : <0x242>
+-    <47f>   DW_AT_low_pc      : (addr_index: 0xb): <no .debug_addr section>
++    <47f>   DW_AT_low_pc      : (addr_index: 0xb): 0
+     <480>   DW_AT_high_pc     : 0xb
+     <488>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <48a>   DW_AT_GNU_all_call_sites: 1
+@@ -459,7 +459,7 @@ Contents of the .debug_info.dwo section:
+     <48b>   DW_AT_specification: <0x2c2>
+     <48f>   DW_AT_decl_file   : 2
+     <490>   DW_AT_decl_line   : 126
+-    <491>   DW_AT_low_pc      : (addr_index: 0xc): <no .debug_addr section>
++    <491>   DW_AT_low_pc      : (addr_index: 0xc): 0
+     <492>   DW_AT_high_pc     : 0x20
+     <49a>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <49c>   DW_AT_object_pointer: <0x4a4>
+@@ -478,7 +478,7 @@ Contents of the .debug_info.dwo section:
+     <4b4>   DW_AT_decl_line   : 134
+     <4b5>   DW_AT_linkage_name: _Z3t12v
+     <4bd>   DW_AT_type        : <0x249>
+-    <4c1>   DW_AT_low_pc      : (addr_index: 0xd): <no .debug_addr section>
++    <4c1>   DW_AT_low_pc      : (addr_index: 0xd): 0
+     <4c2>   DW_AT_high_pc     : 0x19
+     <4ca>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <4cc>   DW_AT_GNU_all_tail_call_sites: 1
+@@ -489,7 +489,7 @@ Contents of the .debug_info.dwo section:
+     <4d2>   DW_AT_decl_line   : 142
+     <4d3>   DW_AT_linkage_name: _Z3t13v
+     <4db>   DW_AT_type        : <0x249>
+-    <4df>   DW_AT_low_pc      : (addr_index: 0xe): <no .debug_addr section>
++    <4df>   DW_AT_low_pc      : (addr_index: 0xe): 0
+     <4e0>   DW_AT_high_pc     : 0x14
+     <4e8>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <4ea>   DW_AT_GNU_all_tail_call_sites: 1
+@@ -500,13 +500,13 @@ Contents of the .debug_info.dwo section:
+     <4f0>   DW_AT_decl_line   : 150
+     <4f1>   DW_AT_linkage_name: _Z3t14v
+     <4f9>   DW_AT_type        : <0x249>
+-    <4fd>   DW_AT_low_pc      : (addr_index: 0xf): <no .debug_addr section>
++    <4fd>   DW_AT_low_pc      : (addr_index: 0xf): 0
+     <4fe>   DW_AT_high_pc     : 0x61
+     <506>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <508>   DW_AT_GNU_all_tail_call_sites: 1
+     <508>   DW_AT_sibling     : <0x532>
+  <2><50c>: Abbrev Number: 24 (DW_TAG_lexical_block)
+-    <50d>   DW_AT_low_pc      : (addr_index: 0x10): <no .debug_addr section>
++    <50d>   DW_AT_low_pc      : (addr_index: 0x10): 0
+     <50e>   DW_AT_high_pc     : 0x57
+  <3><516>: Abbrev Number: 25 (DW_TAG_variable)
+     <517>   DW_AT_name        : s1
+@@ -538,13 +538,13 @@ Contents of the .debug_info.dwo section:
+     <54b>   DW_AT_decl_line   : 163
+     <54c>   DW_AT_linkage_name: _Z3t15v
+     <554>   DW_AT_type        : <0x249>
+-    <558>   DW_AT_low_pc      : (addr_index: 0x11): <no .debug_addr section>
++    <558>   DW_AT_low_pc      : (addr_index: 0x11): 0
+     <559>   DW_AT_high_pc     : 0x5d
+     <561>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <563>   DW_AT_GNU_all_tail_call_sites: 1
+     <563>   DW_AT_sibling     : <0x58d>
+  <2><567>: Abbrev Number: 24 (DW_TAG_lexical_block)
+-    <568>   DW_AT_low_pc      : (addr_index: 0x12): <no .debug_addr section>
++    <568>   DW_AT_low_pc      : (addr_index: 0x12): 0
+     <569>   DW_AT_high_pc     : 0x53
+  <3><571>: Abbrev Number: 25 (DW_TAG_variable)
+     <572>   DW_AT_name        : s1
+@@ -576,7 +576,7 @@ Contents of the .debug_info.dwo section:
+     <5a9>   DW_AT_decl_line   : 176
+     <5aa>   DW_AT_linkage_name: _Z3t16v
+     <5b2>   DW_AT_type        : <0x249>
+-    <5b6>   DW_AT_low_pc      : (addr_index: 0x13): <no .debug_addr section>
++    <5b6>   DW_AT_low_pc      : (addr_index: 0x13): 0
+     <5b7>   DW_AT_high_pc     : 0x13
+     <5bf>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <5c1>   DW_AT_GNU_all_tail_call_sites: 1
+@@ -587,13 +587,13 @@ Contents of the .debug_info.dwo section:
+     <5c7>   DW_AT_decl_line   : 184
+     <5c8>   DW_AT_linkage_name: _Z3t17v
+     <5d0>   DW_AT_type        : <0x249>
+-    <5d4>   DW_AT_low_pc      : (addr_index: 0x14): <no .debug_addr section>
++    <5d4>   DW_AT_low_pc      : (addr_index: 0x14): 0
+     <5d5>   DW_AT_high_pc     : 0x5f
+     <5dd>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <5df>   DW_AT_GNU_all_call_sites: 1
+     <5df>   DW_AT_sibling     : <0x612>
+  <2><5e3>: Abbrev Number: 24 (DW_TAG_lexical_block)
+-    <5e4>   DW_AT_low_pc      : (addr_index: 0x15): <no .debug_addr section>
++    <5e4>   DW_AT_low_pc      : (addr_index: 0x15): 0
+     <5e5>   DW_AT_high_pc     : 0x59
+  <3><5ed>: Abbrev Number: 25 (DW_TAG_variable)
+     <5ee>   DW_AT_name        : c
+@@ -602,7 +602,7 @@ Contents of the .debug_info.dwo section:
+     <5f2>   DW_AT_type        : <0x53d>
+     <5f6>   DW_AT_location    : 2 byte block: 91 6f 	(DW_OP_fbreg: -17)
+  <3><5f9>: Abbrev Number: 24 (DW_TAG_lexical_block)
+-    <5fa>   DW_AT_low_pc      : (addr_index: 0x16): <no .debug_addr section>
++    <5fa>   DW_AT_low_pc      : (addr_index: 0x16): 0
+     <5fb>   DW_AT_high_pc     : 0x50
+  <4><603>: Abbrev Number: 25 (DW_TAG_variable)
+     <604>   DW_AT_name        : i
+@@ -620,13 +620,13 @@ Contents of the .debug_info.dwo section:
+     <618>   DW_AT_decl_line   : 199
+     <619>   DW_AT_linkage_name: _Z3t18v
+     <621>   DW_AT_type        : <0x249>
+-    <625>   DW_AT_low_pc      : (addr_index: 0x17): <no .debug_addr section>
++    <625>   DW_AT_ow_pc      : (addr_index: 0x17): 0
+     <626>   DW_AT_high_pc     : 0x5f
+     <62e>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <630>   DW_AT_GNU_all_tail_call_sites: 1
+     <630>   DW_AT_sibling     : <0x67a>
+  <2><634>: Abbrev Number: 24 (DW_TAG_lexical_block)
+-    <635>   DW_AT_low_pc      : (addr_index: 0x18): <no .debug_addr section>
++    <635>   DW_AT_low_pc      : (addr_index: 0x18): 0
+     <636>   DW_AT_high_pc     : 0x55
+  <3><63e>: Abbrev Number: 25 (DW_TAG_variable)
+     <63f>   DW_AT_name        : c
+@@ -635,7 +635,7 @@ Contents of the .debug_info.dwo section:
+     <643>   DW_AT_type        : <0x53d>
+     <647>   DW_AT_location    : 2 byte block: 91 6f 	(DW_OP_fbreg: -17)
+  <3><64a>: Abbrev Number: 24 (DW_TAG_lexical_block)
+-    <64b>   DW_AT_low_pc      : (addr_index: 0x19): <no .debug_addr section>
++    <64b>   DW_AT_low_pc      : (addr_index: 0x19): 0
+     <64c>   DW_AT_high_pc     : 0x4c
+  <4><654>: Abbrev Number: 25 (DW_TAG_variable)
+     <655>   DW_AT_name        : i
+@@ -644,7 +644,7 @@ Contents of the .debug_info.dwo section:
+     <659>   DW_AT_type        : <0x242>
+     <65d>   DW_AT_location    : 2 byte block: 91 68 	(DW_OP_fbreg: -24)
+  <4><660>: Abbrev Number: 24 (DW_TAG_lexical_block)
+-    <661>   DW_AT_low_pc      : (addr_index: 0x1a): <no .debug_addr section>
++    <661>   DW_AT_low_pc      : (addr_index: 0x1a): 0
+     <662>   DW_AT_high_pc     : 0x34
+  <5><66a>: Abbrev Number: 25 (DW_TAG_variable)
+     <66b>   DW_AT_name        : s
+@@ -786,7 +786,7 @@ Contents of the .debug_info.dwo section:
+     <7d3>   DW_AT_decl_line   : 32
+     <7d4>   DW_AT_linkage_name: _Z4t16av
+     <7dd>   DW_AT_type        : <0x7c4>
+-    <7e1>   DW_AT_low_pc      : (addr_index: 0x0): <no .debug_addr section>
++    <7e1>   DW_AT_low_pc      : (addr_index: 0x0): 0
+     <7e2>   DW_AT_high_pc     : 0x13
+     <7ea>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <7ec>   DW_AT_GNU_all_tail_call_sites: 1
+@@ -878,14 +878,14 @@ Contents of the .debug_info.dwo section:
+     <908>   DW_AT_decl_file   : 1
+     <909>   DW_AT_decl_line   : 70
+     <90a>   DW_AT_linkage_name: _Z4f13iv
+-    <913>   DW_AT_low_pc      : (addr_index: 0x0): <no .debug_addr section>
++    <913>   DW_AT_low_pc      : (addr_index: 0x0): 0
+     <914>   DW_AT_high_pc     : 0x6
+     <91c>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <91e>   DW_AT_GNU_all_call_sites: 1
+  <1><91e>: Abbrev Number: 17 (DW_TAG_subprogram)
+     <91f>   DW_AT_specification: <0x8a8>
+     <923>   DW_AT_decl_file   : 2
+-    <924>   DW_AT_low_pc      : (addr_index: 0x1): <no .debug_addr section>
++    <924>   DW_AT_low_pc      : (addr_index: 0x1): 0
+     <925>   DW_AT_high_pc     : 0xf
+     <92d>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <92f>   DW_AT_object_pointer: <0x937>
+@@ -903,7 +903,7 @@ Contents of the .debug_info.dwo section:
+     <94b>   DW_AT_specification: <0x89b>
+     <94f>   DW_AT_decl_file   : 2
+     <950>   DW_AT_decl_line   : 36
+-    <951>   DW_AT_low_pc      : (addr_index: 0x2): <no .debug_addr section>
++    <951>   DW_AT_low_pc      : (addr_index: 0x2): 0
+     <952>   DW_AT_high_pc     : 0x20
+     <95a>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <95c>   DW_AT_object_pointer: <0x964>
+@@ -922,7 +922,7 @@ Contents of the .debug_info.dwo section:
+     <978>   DW_AT_decl_line   : 72
+     <979>   DW_AT_linkage_name: _Z3f10v
+     <981>   DW_AT_type        : <0x8b7>
+-    <985>   DW_AT_low_pc      : (addr_index: 0x3): <no .debug_addr section>
++    <985>   DW_AT_low_pc      : (addr_index: 0x3): 0
+     <986>   DW_AT_high_pc     : 0xb
+     <98e>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <990>   DW_AT_GNU_all_call_sites: 1
+@@ -933,7 +933,7 @@ Contents of the .debug_info.dwo section:
+     <997>   DW_AT_decl_line   : 80
+     <998>   DW_AT_linkage_name: _Z4f11bPFivE
+     <9a5>   DW_AT_type        : <0x8b7>
+-    <9a9>   DW_AT_low_pc      : (addr_index: 0x4): <no .debug_addr section>
++    <9a9>   DW_AT_low_pc      : (addr_index: 0x4): 0
+     <9aa>   DW_AT_high_pc     : 0x14
+     <9b2>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <9b4>   DW_AT_GNU_all_tail_call_sites: 1
+@@ -954,7 +954,7 @@ Contents of the .debug_info.dwo section:
+     <9d3>   DW_AT_specification: <0x8e0>
+     <9d7>   DW_AT_decl_file   : 2
+     <9d8>   DW_AT_decl_line   : 88
+-    <9d9>   DW_AT_low_pc      : (addr_index: 0x5): <no .debug_addr section>
++    <9d9>   DW_AT_low_pc      : (addr_index: 0x5): 0
+     <9da>   DW_AT_high_pc     : 0xf
+     <9e2>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <9e4>   DW_AT_object_pointer: <0x9ec>
+@@ -976,7 +976,7 @@ Contents of the .debug_info.dwo section:
+     <a06>   DW_AT_decl_line   : 96
+     <a07>   DW_AT_linkage_name: _Z3f13v
+     <a0f>   DW_AT_type        : <0xa1e>
+-    <a13>   DW_AT_low_pc      : (addr_index: 0x6): <no .debug_addr section>
++    <a13>   DW_AT_low_pc      : (addr_index: 0x6): 0
+     <a14>   DW_AT_high_pc     : 0xb
+     <a1c>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <a1e>   DW_AT_GNU_all_call_sites: 1
+@@ -990,7 +990,7 @@ Contents of the .debug_info.dwo section:
+     <a2a>   DW_AT_decl_line   : 104
+     <a2b>   DW_AT_linkage_name: _Z3f14v
+     <a33>   DW_AT_type        : <0xa42>
+-    <a37>   DW_AT_low_pc      : (addr_index: 0x7): <no .debug_addr section>
++    <a37>   DW_AT_low_pc      : (addr_index: 0x7): 0
+     <a38>   DW_AT_high_pc     : 0xb
+     <a40>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <a42>   DW_AT_GNU_all_call_sites: 1
+@@ -1010,7 +1010,7 @@ Contents of the .debug_info.dwo section:
+     <a5b>   DW_AT_decl_line   : 112
+     <a5c>   DW_AT_linkage_name: _Z3f15v
+     <a64>   DW_AT_type        : <0xa73>
+-    <a68>   DW_AT_low_pc      : (addr_index: 0x8): <no .debug_addr section>
++    <a68>   DW_AT_low_pc      : (addr_index: 0x8): 0
+     <a69>   DW_AT_high_pc     : 0xb
+     <a71>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <a73>   DW_AT_GNU_all_call_sites: 1
+@@ -1030,7 +1030,7 @@ Contents of the .debug_info.dwo section:
+     <a8f>   DW_AT_decl_line   : 127
+     <a90>   DW_AT_linkage_name: _Z3f18i
+     <a98>   DW_AT_type        : <0xa42>
+-    <a9c>   DW_AT_low_pc      : (addr_index: 0x9): <no .debug_addr section>
++    <a9c>   DW_AT_low_pc      : (addr_index: 0x9): 0
+     <a9d>   DW_AT_high_pc     : 0x44
+     <aa5>   DW_AT_frame_base  : 1 byte block: 9c 	(DW_OP_call_frame_cfa)
+     <aa7>   DW_AT_GNU_all_call_sites: 1
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-2.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-2.patch
new file mode 100644
index 0000000000..0583bfcfab
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-2.patch
@@ -0,0 +1,188 @@
+From ec41dd75c866599fc03c390c6afb5736c159c0ff Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 21 Jun 2022 16:37:27 +0100
+Subject: [PATCH] Binutils support for dwarf-5 (location and range lists
+ related)
+
+	* dwarf.h (struct debug_info): Add rnglists_base field.
+	* dwarf.c (read_and_display_attr_value): Read attribute DW_AT_rnglists_base.
+	(display_debug_rnglists_list): While handling DW_RLE_base_addressx,
+  	DW_RLE_startx_endx, DW_RLE_startx_length items, pass the proper parameter
+	value to fetch_indexed_addr(), i.e. fetch the proper entry in .debug_addr section.
+	(display_debug_ranges): Add rnglists_base to the .debug_rnglists base address.
+	(load_separate_debug_files): Load .debug_addr section, if exists.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ec41dd75c866599fc03c390c6afb5736c159c0ff]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/ChangeLog | 10 +++++++++
+ binutils/dwarf.c   | 53 ++++++++++++++++++++++++++++++++++------------
+ binutils/dwarf.h   |  1 +
+ 3 files changed, 51 insertions(+), 13 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index cb2523af1f3..30b64ac68a8 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -2812,7 +2812,12 @@ read_and_display_attr_value (unsigned lo
+ 		  dwarf_vmatoa ("x", debug_info_p->cu_offset));
+ 	  debug_info_p->loclists_base = uvalue;
+ 	  break;
+-
++	case DW_AT_rnglists_base:
++	  if (debug_info_p->rnglists_base)
++	    warn (_("CU @ 0x%s has multiple rnglists_base values"),
++	          dwarf_vmatoa ("x", debug_info_p->cu_offset));
++	  debug_info_p->rnglists_base = uvalue;
++	  break;
+ 	case DW_AT_frame_base:
+ 	  have_frame_base = 1;
+ 	  /* Fall through.  */
+@@ -3303,6 +3308,7 @@ read_and_display_attr_value (unsigned lo
+       /* Fall through.  */
+     case DW_AT_location:
+     case DW_AT_loclists_base:
++    case DW_AT_rnglists_base:
+     case DW_AT_string_length:
+     case DW_AT_return_addr:
+     case DW_AT_data_member_location:
+@@ -3322,7 +3328,10 @@ read_and_display_attr_value (unsigned lo
+ 	   && (form == DW_FORM_data4 || form == DW_FORM_data8))
+ 	  || form == DW_FORM_sec_offset
+ 	  || form == DW_FORM_loclistx)
+-	printf (_(" (location list)"));
++	{
++	  if (attribute != DW_AT_rnglists_base)
++	    printf (_(" (location list)"));
++	}
+       /* Fall through.  */
+     case DW_AT_allocated:
+     case DW_AT_associated:
+@@ -3809,6 +3818,7 @@ process_debug_info (struct dwarf_section
+ 	  debug_information [unit].range_lists = NULL;
+ 	  debug_information [unit].max_range_lists= 0;
+ 	  debug_information [unit].num_range_lists = 0;
++	  debug_information [unit].rnglists_base = 0;
+ 	}
+ 
+       if (!do_loc && dwarf_start_die == 0)
+@@ -7932,9 +7942,16 @@ display_debug_rnglists_list (unsigned ch
+ 			     unsigned char * finish,
+ 			     unsigned int    pointer_size,
+ 			     dwarf_vma       offset,
+-			     dwarf_vma       base_address)
++			     dwarf_vma       base_address,
++			     unsigned int    offset_size)
+ {
+   unsigned char *next = start;
++  unsigned int debug_addr_section_hdr_len;
++
++  if (offset_size == 4)
++    debug_addr_section_hdr_len = 8;
++  else
++    debug_addr_section_hdr_len = 16;
+ 
+   while (1)
+     {
+@@ -7964,20 +7981,24 @@ display_debug_rnglists_list (unsigned ch
+ 	  READ_ULEB (base_address, start, finish);
+ 	  print_dwarf_vma (base_address, pointer_size);
+ 	  printf (_("(base address index) "));
+-	  base_address = fetch_indexed_addr (base_address, pointer_size);
++	  base_address = fetch_indexed_addr ((base_address * pointer_size)
++			                     + debug_addr_section_hdr_len, pointer_size);
+ 	  print_dwarf_vma (base_address, pointer_size);
+ 	  printf (_("(base address)\n"));
+ 	  break;
+ 	case DW_RLE_startx_endx:
+ 	  READ_ULEB (begin, start, finish);
+ 	  READ_ULEB (end, start, finish);
+-	  begin = fetch_indexed_addr (begin, pointer_size);
+-	  end   = fetch_indexed_addr (begin, pointer_size);
++	  begin = fetch_indexed_addr ((begin * pointer_size)
++			              + debug_addr_section_hdr_len, pointer_size);
++	  end   = fetch_indexed_addr ((begin * pointer_size)
++			              + debug_addr_section_hdr_len, pointer_size);
+ 	  break;
+ 	case DW_RLE_startx_length:
+ 	  READ_ULEB (begin, start, finish);
+ 	  READ_ULEB (length, start, finish);
+-	  begin = fetch_indexed_addr (begin, pointer_size);
++	  begin = fetch_indexed_addr ((begin * pointer_size)
++			              + debug_addr_section_hdr_len, pointer_size);
+ 	  end = begin + length;
+ 	  break;
+ 	case DW_RLE_offset_pair:
+@@ -8003,6 +8024,7 @@ display_debug_rnglists_list (unsigned ch
+ 	  rlet = DW_RLE_end_of_list;
+ 	  break;
+ 	}
++
+       if (rlet == DW_RLE_end_of_list)
+ 	break;
+       if (rlet == DW_RLE_base_address || rlet == DW_RLE_base_addressx)
+@@ -8043,6 +8065,7 @@ display_debug_ranges (struct dwarf_secti
+   /* Initialize it due to a false compiler warning.  */
+   unsigned char         address_size = 0;
+   dwarf_vma             last_offset = 0;
++  unsigned int          offset_size = 0;
+ 
+   if (bytes == 0)
+     {
+@@ -8054,10 +8077,10 @@ display_debug_ranges (struct dwarf_secti
+ 
+   if (is_rnglists)
+     {
+-      dwarf_vma initial_length;
+-      unsigned char segment_selector_size;
+-      unsigned int offset_size, offset_entry_count;
+-      unsigned short version;
++      dwarf_vma       initial_length;
++      unsigned char   segment_selector_size;
++      unsigned int    offset_entry_count;
++      unsigned short  version;
+ 
+       /* Get and check the length of the block.  */
+       SAFE_BYTE_GET_AND_INC (initial_length, start, 4, finish);
+@@ -8230,7 +8253,8 @@ display_debug_ranges (struct dwarf_secti
+ 		(unsigned long) offset, i);
+ 	  continue;
+ 	}
+-      next = section_begin + offset;
++
++      next = section_begin + offset + debug_info_p->rnglists_base;
+ 
+       /* If multiple DWARF entities reference the same range then we will
+          have multiple entries in the `range_entries' list for the same
+@@ -8262,7 +8286,7 @@ display_debug_ranges (struct dwarf_secti
+ 
+       if (is_rnglists)
+ 	display_debug_rnglists_list
+-	  (start, finish, pointer_size, offset, base_address);
++	  (start, finish, pointer_size, offset, base_address, offset_size);
+       else
+ 	display_debug_ranges_list
+ 	  (start, finish, pointer_size, offset, base_address);
+@@ -11911,6 +11935,9 @@ load_separate_debug_files (void * file,
+       && load_debug_section (abbrev, file)
+       && load_debug_section (info, file))
+     {
++      /* Load the .debug_addr section, if it exists.  */
++      load_debug_section (debug_addr, file);
++
+       free_dwo_info ();
+ 
+       if (process_debug_info (& debug_displays[info].section, file, abbrev,
+diff --git a/binutils/dwarf.h b/binutils/dwarf.h
+index 040e674c6ce..8a89c08e7c2 100644
+--- a/binutils/dwarf.h
++++ b/binutils/dwarf.h
+@@ -192,6 +192,7 @@ typedef struct
+   dwarf_vma *    range_lists;
+   unsigned int   num_range_lists;
+   unsigned int   max_range_lists;
++  dwarf_vma      rnglists_base;
+ }
+ debug_info;
+ 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-3.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-3.patch
new file mode 100644
index 0000000000..56331b1128
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-3.patch
@@ -0,0 +1,211 @@
+From f18acc9c4e5d18f4783f3a7d59e3ec95d7af0199 Mon Sep 17 00:00:00 2001
+From: "Kumar N, Bhuvanendra" <Kavitha.Natarajan@amd.com>
+Date: Wed, 22 Jun 2022 17:07:25 +0100
+Subject: [PATCH] Binutils support for split-dwarf and dwarf-5
+
+	* dwarf.c (fetch_indexed_string): Added new parameter
+	str_offsets_base to calculate the string offset.
+	(read_and_display_attr_value): Read DW_AT_str_offsets_base
+	attribute.
+	(process_debug_info): While allocating memory and initializing
+	debug_information, do it for do_debug_info also, if its true.
+	(load_separate_debug_files): Load .debug_str_offsets if exists.
+	* dwarf.h (struct debug_info): Add str_offsets_base field.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f18acc9c4e5d18f4783f3a7d59e3ec95d7af0199]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/ChangeLog | 13 ++++++++++-
+ binutils/dwarf.c   | 57 ++++++++++++++++++++++++++++++++++------------
+ binutils/dwarf.h   |  1 +
+ 3 files changed, 56 insertions(+), 15 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index f9c46cf54dd..d9a3144023c 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -687,8 +687,11 @@ fetch_indirect_line_string (dwarf_vma of
+ }
+ 
+ static const char *
+-fetch_indexed_string (dwarf_vma idx, struct cu_tu_set *this_set,
+-		      dwarf_vma offset_size, bool dwo)
++fetch_indexed_string (dwarf_vma           idx,
++		      struct cu_tu_set *  this_set,
++		      dwarf_vma           offset_size,
++		      bool                dwo,
++		      dwarf_vma           str_offsets_base)
+ {
+   enum dwarf_section_display_enum str_sec_idx = dwo ? str_dwo : str;
+   enum dwarf_section_display_enum idx_sec_idx = dwo ? str_index_dwo : str_index;
+@@ -776,7 +779,15 @@ fetch_indexed_string (dwarf_vma idx, str
+       return _("<index offset is too big>");
+     }
+ 
+-  str_offset = byte_get (curr + index_offset, offset_size);
++  if (str_offsets_base > 0)
++    {
++      if (offset_size == 8)
++        str_offsets_base -= 16;
++      else
++        str_offsets_base -= 8;
++    }
++
++  str_offset = byte_get (curr + index_offset + str_offsets_base, offset_size);
+   str_offset -= str_section->address;
+   if (str_offset >= str_section->size)
+     {
+@@ -2721,11 +2732,13 @@ read_and_display_attr_value (unsigned lo
+ 	    /* We have already displayed the form name.  */
+ 	    printf (_("%c(offset: 0x%s): %s"), delimiter,
+ 		    dwarf_vmatoa ("x", uvalue),
+-		    fetch_indexed_string (uvalue, this_set, offset_size, dwo));
++		    fetch_indexed_string (uvalue, this_set, offset_size, dwo,
++	                                  debug_info_p->str_offsets_base));
+ 	  else
+ 	    printf (_("%c(indexed string: 0x%s): %s"), delimiter,
+ 		    dwarf_vmatoa ("x", uvalue),
+-		    fetch_indexed_string (uvalue, this_set, offset_size, dwo));
++		    fetch_indexed_string (uvalue, this_set, offset_size, dwo,
++	                                  debug_info_p->str_offsets_base));
+ 	}
+       break;
+ 
+@@ -2800,7 +2813,7 @@ read_and_display_attr_value (unsigned lo
+       break;
+     }
+ 
+-  if ((do_loc || do_debug_loc || do_debug_ranges)
++  if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+       && num_debug_info_entries == 0
+       && debug_info_p != NULL)
+     {
+@@ -2818,6 +2831,13 @@ read_and_display_attr_value (unsigned lo
+ 	          dwarf_vmatoa ("x", debug_info_p->cu_offset));
+ 	  debug_info_p->rnglists_base = uvalue;
+ 	  break;
++	case DW_AT_str_offsets_base:
++	  if (debug_info_p->str_offsets_base)
++	    warn (_("CU @ 0x%s has multiple str_offsets_base values"),
++		  dwarf_vmatoa ("x", debug_info_p->cu_offset));
++	  debug_info_p->str_offsets_base = uvalue;
++	  break;
++
+ 	case DW_AT_frame_base:
+ 	  have_frame_base = 1;
+ 	  /* Fall through.  */
+@@ -2956,7 +2976,9 @@ read_and_display_attr_value (unsigned lo
+ 	      case DW_FORM_strx2:
+ 	      case DW_FORM_strx3:
+ 	      case DW_FORM_strx4:
+-		add_dwo_name (fetch_indexed_string (uvalue, this_set, offset_size, false), cu_offset);
++		add_dwo_name (fetch_indexed_string (uvalue, this_set, offset_size, false,
++		                                    debug_info_p->str_offsets_base),
++			      cu_offset);
+ 		break;
+ 	      case DW_FORM_string:
+ 		add_dwo_name ((const char *) orig_data, cu_offset);
+@@ -2988,7 +3010,9 @@ read_and_display_attr_value (unsigned lo
+ 	      case DW_FORM_strx2:
+ 	      case DW_FORM_strx3:
+ 	      case DW_FORM_strx4:
+-		add_dwo_dir (fetch_indexed_string (uvalue, this_set, offset_size, false), cu_offset);
++		add_dwo_dir (fetch_indexed_string (uvalue, this_set, offset_size, false,
++		                                   debug_info_p->str_offsets_base),
++			     cu_offset);
+ 		break;
+ 	      case DW_FORM_string:
+ 		add_dwo_dir ((const char *) orig_data, cu_offset);
+@@ -3309,6 +3333,7 @@ read_and_display_attr_value (unsigned lo
+     case DW_AT_location:
+     case DW_AT_loclists_base:
+     case DW_AT_rnglists_base:
++    case DW_AT_str_offsets_base:
+     case DW_AT_string_length:
+     case DW_AT_return_addr:
+     case DW_AT_data_member_location:
+@@ -3329,7 +3354,8 @@ read_and_display_attr_value (unsigned lo
+ 	  || form == DW_FORM_sec_offset
+ 	  || form == DW_FORM_loclistx)
+ 	{
+-	  if (attribute != DW_AT_rnglists_base)
++	  if (attribute != DW_AT_rnglists_base
++	      && attribute != DW_AT_str_offsets_base)
+ 	    printf (_(" (location list)"));
+ 	}
+       /* Fall through.  */
+@@ -3562,7 +3588,7 @@ process_debug_info (struct dwarf_section
+       return false;
+     }
+ 
+-  if ((do_loc || do_debug_loc || do_debug_ranges)
++  if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+       && num_debug_info_entries == 0
+       && ! do_types)
+     {
+@@ -3797,7 +3823,7 @@ process_debug_info (struct dwarf_section
+ 	  continue;
+ 	}
+ 
+-      if ((do_loc || do_debug_loc || do_debug_ranges)
++      if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+ 	  && num_debug_info_entries == 0
+ 	  && alloc_num_debug_info_entries > unit
+ 	  && ! do_types)
+@@ -3819,6 +3845,7 @@ process_debug_info (struct dwarf_section
+ 	  debug_information [unit].max_range_lists= 0;
+ 	  debug_information [unit].num_range_lists = 0;
+ 	  debug_information [unit].rnglists_base = 0;
++	  debug_information [unit].str_offsets_base = 0;
+ 	}
+ 
+       if (!do_loc && dwarf_start_die == 0)
+@@ -4089,7 +4116,7 @@ process_debug_info (struct dwarf_section
+ 
+   /* Set num_debug_info_entries here so that it can be used to check if
+      we need to process .debug_loc and .debug_ranges sections.  */
+-  if ((do_loc || do_debug_loc || do_debug_ranges)
++  if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+       && num_debug_info_entries == 0
+       && ! do_types)
+     {
+@@ -6237,7 +6264,7 @@ display_debug_macro (struct dwarf_sectio
+ 	      READ_ULEB (lineno, curr, end);
+ 	      READ_ULEB (offset, curr, end);
+ 	      string = (const unsigned char *)
+-		fetch_indexed_string (offset, NULL, offset_size, false);
++		fetch_indexed_string (offset, NULL, offset_size, false, 0);
+ 	      if (op == DW_MACRO_define_strx)
+ 		printf (" DW_MACRO_define_strx ");
+ 	      else
+@@ -7851,7 +7878,7 @@ display_debug_str_offsets (struct dwarf_
+ 	  SAFE_BYTE_GET_AND_INC (offset, curr, entry_length, entries_end);
+ 	  if (dwo)
+ 	    string = (const unsigned char *)
+-	      fetch_indexed_string (idx, NULL, entry_length, dwo);
++	      fetch_indexed_string (idx, NULL, entry_length, dwo, 0);
+ 	  else
+ 	    string = fetch_indirect_string (offset);
+ 
+@@ -11937,6 +11964,8 @@ load_separate_debug_files (void * file,
+     {
+       /* Load the .debug_addr section, if it exists.  */
+       load_debug_section (debug_addr, file);
++      /* Load the .debug_str_offsets section, if it exists.  */
++      load_debug_section (str_index, file);
+ 
+       free_dwo_info ();
+ 
+diff --git a/binutils/dwarf.h b/binutils/dwarf.h
+index 8a89c08e7c2..adbf20f9a28 100644
+--- a/binutils/dwarf.h
++++ b/binutils/dwarf.h
+@@ -193,6 +193,7 @@ typedef struct
+   unsigned int   num_range_lists;
+   unsigned int   max_range_lists;
+   dwarf_vma      rnglists_base;
++  dwarf_vma      str_offsets_base;
+ }
+ debug_info;
+ 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-4.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-4.patch
new file mode 100644
index 0000000000..e59b19c184
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-4.patch
@@ -0,0 +1,43 @@
+From e98e7d9a70dcc987bff0e925f20b78cd4a2979ed Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 27 Jun 2022 13:30:35 +0100
+Subject: [PATCH] Fix NULL pointer indirection when parsing corrupt DWARF data.
+
+	PR 29290
+	* dwarf.c (read_and_display_attr_value): Check that debug_info_p
+	is set before dereferencing it.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e98e7d9a70dcc987bff0e925f20b78cd4a2979ed]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/dwarf.c   | 11 +++++------
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index bcabb61b871..37b477b886d 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -2727,18 +2727,17 @@ read_and_display_attr_value (unsigned lo
+ 	{
+ 	  const char *suffix = strrchr (section->name, '.');
+ 	  bool dwo = suffix && strcmp (suffix, ".dwo") == 0;
++	  const char *strng;
+ 
++	  strng = fetch_indexed_string (uvalue, this_set, offset_size, dwo,
++					debug_info_p ? debug_info_p->str_offsets_base : 0);
+ 	  if (do_wide)
+ 	    /* We have already displayed the form name.  */
+ 	    printf (_("%c(offset: 0x%s): %s"), delimiter,
+-		    dwarf_vmatoa ("x", uvalue),
+-		    fetch_indexed_string (uvalue, this_set, offset_size, dwo,
+-	                                  debug_info_p->str_offsets_base));
++		    dwarf_vmatoa ("x", uvalue), strng);
+ 	  else
+ 	    printf (_("%c(indexed string: 0x%s): %s"), delimiter,
+-		    dwarf_vmatoa ("x", uvalue),
+-		    fetch_indexed_string (uvalue, this_set, offset_size, dwo,
+-	                                  debug_info_p->str_offsets_base));
++		    dwarf_vmatoa ("x", uvalue), strng);
+ 	}
+       break;
+ 
-- 
2.25.1


