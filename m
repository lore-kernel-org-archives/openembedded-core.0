Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BFFF8DFD9
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:05 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28249.1776378781341104032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CEm9acwH;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso523035e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378779; x=1776983579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dt1M0hjFPQy+nrXXcZjpbAN1WP3yljs53m7NcGDM1Ek=;
        b=CEm9acwHXhrw3+cIyGCsi5RrkjRa8ibDmXAW7aMime1fqc7Esfzo0gMbc/JOr0MDTw
         rezZs3EwCpzUtSy7Qpr64mN01S3MIrojYrJcbew9ffrjaZ91ZU8mBieliFDZEcSroYcT
         wcdc9VdRxoY85vBWAD7ARyNVWGzUk8bpFANIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378779; x=1776983579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dt1M0hjFPQy+nrXXcZjpbAN1WP3yljs53m7NcGDM1Ek=;
        b=Z6DDrDMZC5b+WRL3trVYS2owse6dk9XxYLCTgY0bS7PO3HVA4ybT9+4ljY/asjQ96K
         71Jqb54pLCrLMlkoZCHIzaaDUKv/tir6G27nJrtqTACCKs0pHxjLKSwf2IumLGEDMKW7
         GKNDfIfPaGitnBuUYfsqv7Mlu+kFNfzbh7g1sCzEPrOb6A+7MFcwOOMhHst6JM5/v9Fm
         9waADXxzg7B2ObkkAx6HRbqpqg74OswAeHXQBI5VRNWvSbygfupd3ka+Qtm0zRKxq0A/
         eN7tTbhkWbBCLJgSPSQHFp0BEe0Qh6PCXlmnlzB9T6fJScpA/+OXcGxbf29QrvHwI9dy
         F7JQ==
X-Gm-Message-State: AOJu0Yxxnwp2/J58QvOs9jr0Kt+UzhBi5mYJwTRvLGZAPScqrrjHnImN
	o695gPpu2vkbjTt+Cif/g/t6wmDuooQw/XpdiR9ul3xzDxQyFPfzfbWEj8cNpfWEzBXE5Gu6bHn
	jD5VQR1KdEIxd
X-Gm-Gg: AeBDiesANSJRCjDbKe3vb9vVZpaUVhGMQzwDah3TRThY+b3L0RiLNk/YflblHPSR/HA
	HS1OkDMEHLncaQ4iPHXkIxP9KUlp2qSpxZH7CJptybzrzLFuAMBcTdf/f3t/lVwB0xIJB4znVdz
	9cRPMnpq6E9tX6vVOfwcs3acqorMVpyp1DuPhSNZTkB3UsF0aMGOZobmSXuHFfNwIfDabjUYBn9
	d6wFvYQsn79jukClCIHFx2pQtdJdSl51wMeAgl5vmtCDK3k5s8WavMao07lJAn/wCQNZ0G8nK07
	COZy6AjGwei897n+JDoV+3n7zFalMS2yuADakaEO54dm8EotBABsWgwg+NHv8i5lkkHf+WQPHBW
	YkjG/dIDAkofJN6g64AharaXR0dxuT4wZbFakOmqrgraUTvlsz3wObUdvZEYErXKDe43ScKza2r
	KGp77PplvbgiQ+PdeqiM48VKq0ZTBZ14FVoBSXAhTwJMS/Owazy4VFmEWPhuAzh+u7pdOUtddxt
	yuSztBiedK7fDf+PXM1XTYqaUEnXgHQGPz+5w==
X-Received: by 2002:a05:600c:5252:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-488fb768483mr6002495e9.18.1776378779260;
        Thu, 16 Apr 2026 15:32:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.32.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:32:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 02/51] binutils: Fix CVE-2025-69648
Date: Fri, 17 Apr 2026 00:29:45 +0200
Message-ID: <4fe1e54ace667e91929ec66bc3e6d7d03db981da.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235431

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69648

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.45.inc                |   1 +
 .../binutils/binutils/CVE-2025-69648.patch    | 189 ++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 5cd4d185ac1..83907f24afa 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -48,4 +48,5 @@ SRC_URI = "\
      file://0018-CVE-2025-11494.patch \
      file://0019-CVE-2025-11839.patch \
      file://0020-CVE-2025-11840.patch \
+     file://CVE-2025-69648.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
new file mode 100644
index 00000000000..ce0e764762f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
@@ -0,0 +1,189 @@
+From 7df481dd76c05c89782721e9df5468be829c356b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 22 Nov 2025 09:22:10 +1030
+Subject: [PATCH] PR 33638, debug_rnglists output
+
+The fuzzed testcase in this PR continuously outputs an error about
+the debug_rnglists header.  Fixed by taking notice of the error and
+stopping output.  The patch also limits the length in all cases, not
+just when a relocation is present, and limits the offset entry count
+read from the header.  I removed the warning and the test for relocs
+because the code can't work reliably with unresolved relocs in the
+length field.
+
+	PR 33638
+	* dwarf.c (display_debug_rnglists_list): Return bool.  Rename
+	"inital_length" to plain "length".  Verify length is large
+	enough to read header.  Limit length to rest of section.
+	Similarly limit offset_entry_count.
+	(display_debug_ranges): Check display_debug_rnglists_unit_header
+	return status.  Stop output on error.
+
+CVE: CVE-2025-69648
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
+
+(cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
+ 1 file changed, 34 insertions(+), 33 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index f4bcb677761..b4fb56351ec 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -8282,7 +8282,7 @@ display_debug_rnglists_list (unsigned char * start,
+   return start;
+ }
+ 
+-static int
++static bool
+ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+ 				    uint64_t *              unit_offset,
+ 				    unsigned char *         poffset_size)
+@@ -8290,7 +8290,8 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+   uint64_t        start_offset = *unit_offset;
+   unsigned char * p = section->start + start_offset;
+   unsigned char * finish = section->start + section->size;
+-  uint64_t        initial_length;
++  unsigned char * hdr;
++  uint64_t        length;
+   unsigned char   segment_selector_size;
+   unsigned int    offset_entry_count;
+   unsigned int    i;
+@@ -8299,66 +8300,59 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+   unsigned char   offset_size;
+ 
+   /* Get and check the length of the block.  */
+-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
+ 
+-  if (initial_length == 0xffffffff)
++  if (length == 0xffffffff)
+     {
+       /* This section is 64-bit DWARF 3.  */
+-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
+       *poffset_size = offset_size = 8;
+     }
+   else
+     *poffset_size = offset_size = 4;
+ 
+-  if (initial_length > (size_t) (finish - p))
+-    {
+-      /* If the length field has a relocation against it, then we should
+-	 not complain if it is inaccurate (and probably negative).
+-	 It is copied from .debug_line handling code.  */
+-      if (reloc_at (section, (p - section->start) - offset_size))
+-	initial_length = finish - p;
+-      else
+-	{
+-	  warn (_("The length field (%#" PRIx64
+-		  ") in the debug_rnglists header is wrong"
+-		  " - the section is too small\n"),
+-		initial_length);
+-	  return 0;
+-	}
+-    }
+-
+-  /* Report the next unit offset to the caller.  */
+-  *unit_offset = (p - section->start) + initial_length;
++  if (length < 8)
++    return false;
+ 
+   /* Get the other fields in the header.  */
++  hdr = p;
+   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
+   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
+   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
+   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
+ 
+   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
+-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
++  printf (_("  Length:          %#" PRIx64 "\n"), length);
+   printf (_("  DWARF version:   %u\n"), version);
+   printf (_("  Address size:    %u\n"), address_size);
+   printf (_("  Segment size:    %u\n"), segment_selector_size);
+   printf (_("  Offset entries:  %u\n"), offset_entry_count);
+ 
++  if (length > (size_t) (finish - hdr))
++    length = finish - hdr;
++
++  /* Report the next unit offset to the caller.  */
++  *unit_offset = (hdr - section->start) + length;
++
+   /* Check the fields.  */
+   if (segment_selector_size != 0)
+     {
+       warn (_("The %s section contains "
+ 	      "unsupported segment selector size: %d.\n"),
+ 	    section->name, segment_selector_size);
+-      return 0;
++      return false;
+     }
+ 
+   if (version < 5)
+     {
+       warn (_("Only DWARF version 5+ debug_rnglists info "
+ 	      "is currently supported.\n"));
+-      return 0;
++      return false;
+     }
+ 
++  uint64_t max_off_count = (length - 8) / offset_size;
++  if (offset_entry_count > max_off_count)
++    offset_entry_count = max_off_count;
+   if (offset_entry_count != 0)
+     {
+       printf (_("\n   Offsets starting at %#tx:\n"), p - section->start);
+@@ -8372,7 +8366,7 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+ 	}
+     }
+ 
+-  return 1;
++  return true;
+ }
+ 
+ static bool
+@@ -8404,6 +8398,7 @@ display_debug_ranges (struct dwarf_section *section,
+   uint64_t last_offset = 0;
+   uint64_t next_rnglists_cu_offset = 0;
+   unsigned char offset_size;
++  bool ok_header = true;
+ 
+   if (bytes == 0)
+     {
+@@ -8493,8 +8488,12 @@ display_debug_ranges (struct dwarf_section *section,
+       /* If we've moved on to the next compile unit in the rnglists section - dump the unit header(s).  */
+       if (is_rnglists && next_rnglists_cu_offset < offset)
+ 	{
+-	  while (next_rnglists_cu_offset < offset)
+-	    display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
++	  while (ok_header && next_rnglists_cu_offset < offset)
++	    ok_header = display_debug_rnglists_unit_header (section,
++							    &next_rnglists_cu_offset,
++							    &offset_size);
++	  if (!ok_header)
++	    break;
+ 	  printf (_("    Offset   Begin    End\n"));
+ 	}
+ 
+@@ -8548,10 +8547,12 @@ display_debug_ranges (struct dwarf_section *section,
+     }
+ 
+   /* Display trailing empty (or unreferenced) compile units, if any.  */
+-  if (is_rnglists)
++  if (is_rnglists && ok_header)
+     while (next_rnglists_cu_offset < section->size)
+-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
+-
++      if (!display_debug_rnglists_unit_header (section,
++					       &next_rnglists_cu_offset,
++					       &offset_size))
++	break;
+   putchar ('\n');
+ 
+   free (range_entries);
+-- 
+2.35.6
+

