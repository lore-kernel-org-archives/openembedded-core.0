Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A24FB5EB0
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 04:12:57 +0000 (UTC)
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69128.1773720768626620768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 21:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ArnzINEd;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7604; q=dns/txt;
  s=iport01; t=1773720768; x=1774930368;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ax2LODINZYjs6gvNR5pQAVo5iKWWgXeQJyV2PFlH8WI=;
  b=ArnzINEdqWKGc8+TCOQyMYqBf04KVl713P/fbcc1SeVRioyOlmTL52Ny
   J52h7MVcERLdqpEurqLiliMEevg/Hs2bda3W947Fp3XIYLwDaz2sxuV+O
   056oVFDGOEiOV9kgpTcaOxjQArqFCqFXrH6FpQ2BmVhA2eQ9pSoZwW+vx
   B6SVvNDHTGK92J1DXrKVd5c7owBgOXDR1N3Hty/miU6n4wtXmPDm2nvBL
   VAP0GX+e3EQxWoOe9TesF7bjSB+rUL3yJYapLfl5fhVJLwwWwqFhTCtpK
   quTlA3UezZP0HHb3o6BTyjCeZqAGIcHUzSlwc5Y9XXCOXRuQqJ3wBvze/
   w==;
X-CSE-ConnectionGUID: okSa7gW9QCeZQcGYVHZxUg==
X-CSE-MsgGUID: Lqgn49DXTaaf3RcXE9U3Qw==
X-IPAS-Result: =?us-ascii?q?A0BbCwCW07hp/89K/pBaHgEBCxIMggULgkgPcV9CSZQqg?=
 =?us-ascii?q?iGLZ5I2FIFrDwEBAQ9EDQQBAZIrAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAS0LAXIDAQJPCyMZCIMCAYI6AzYDEbJ6g?=
 =?us-ascii?q?XkzgQGDaAJDT9hHDYJSAQUGFAGBOIU8gnmFIFsYAYR6JxsbgXKCUIItgQWBG?=
 =?us-ascii?q?kIBAxiBHg6GXgSCIoEOgWGRI0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBCxsHBYQkD4htdG2BE4NcAwsYDUgRLDcUGwQ+bgeNTTyBQlIOEgF6ExQYg?=
 =?us-ascii?q?mYRknSQFIIeoCBxCiiDdIwejjSBCoV8GjOEBE2TSJJSC5h7jgmECZFtIzeEa?=
 =?us-ascii?q?IFoPIFHCwdwFYMiUhkPjioOC4VdgxTCRDs1AgkzAQcCBw4CgXOQAYF8AQE?=
IronPort-Data: A9a23:M0OwFqo/nBeFVwhiviE+77hNiH1eBmJMZBIvgKrLsJaIsI4StFCzt
 garIBnTPK2KazP0edFwPtnk9EwCuZWGzt5iHVQ9qS88Enwb8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrY8Uw35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uF0OmgR+
 sNJERsAXCmIqNOI4ICrd+Y506zPLOGzVG8eknht13TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9IYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHWHJUNwx7Fz
 o7A10DgDRdGZfCv9TOM/CmWjd/izB6gYZ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cEHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:EtDb7qAS8gu2Gj3lHem555DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEGmnhrGSpwEJ3EbFh4tg6Z
 s=
X-Talos-CUID: 9a23:7XZjsG6yy8NwR3Hvcdss800vE58qTSzk53riGkSXOFhJeq2oRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3ATgNTlwzbUjP2qNr0aQc5HpsbUAKaqIC3B0ZRwLk?=
 =?us-ascii?q?2h8CNO3dKMAew3Qnse5Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,124,1770595200"; 
   d="scan'208";a="54180505"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Mar 2026 04:12:46 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 2F953180004AB
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:12:46 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id C5EB0CC12B5; Tue, 17 Mar 2026 09:42:44 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH 1/4] binutils: Fix CVE-2025-69648
Date: Tue, 17 Mar 2026 09:42:26 +0530
Message-Id: <20260317041229.2932275-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233292

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69648

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 16a63cabc5..b6d7b3d60f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -46,4 +46,5 @@ SRC_URI = "\
      file://0018-CVE-2025-11494.patch \
      file://0019-CVE-2025-11839.patch \
      file://0020-CVE-2025-11840.patch \
+     file://CVE-2025-69648.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
new file mode 100644
index 0000000000..a247bc0fe7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
@@ -0,0 +1,188 @@
+From da5460f518952684a8c774d9b202a395676ff85f Mon Sep 17 00:00:00 2001
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
+index d9f514180de..0d88ea94619 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -8292,7 +8292,7 @@ display_debug_rnglists_list (unsigned char * start,
+   return start;
+ }
+
+-static int
++static bool
+ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+				    uint64_t *              unit_offset,
+				    unsigned char *         poffset_size)
+@@ -8300,7 +8300,8 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+   uint64_t        start_offset = *unit_offset;
+   unsigned char * p = section->start + start_offset;
+   unsigned char * finish = section->start + section->size;
+-  uint64_t        initial_length;
++  unsigned char * hdr;
++  uint64_t        length;
+   unsigned char   segment_selector_size;
+   unsigned int    offset_entry_count;
+   unsigned int    i;
+@@ -8309,66 +8310,59 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
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
+	      "unsupported segment selector size: %d.\n"),
+	    section->name, segment_selector_size);
+-      return 0;
++      return false;
+     }
+
+   if (version < 5)
+     {
+       warn (_("Only DWARF version 5+ debug_rnglists info "
+	      "is currently supported.\n"));
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
+@@ -8382,7 +8376,7 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+	}
+     }
+
+-  return 1;
++  return true;
+ }
+
+ static bool
+@@ -8414,6 +8408,7 @@ display_debug_ranges (struct dwarf_section *section,
+   uint64_t last_offset = 0;
+   uint64_t next_rnglists_cu_offset = 0;
+   unsigned char offset_size;
++  bool ok_header = true;
+
+   if (bytes == 0)
+     {
+@@ -8503,8 +8498,12 @@ display_debug_ranges (struct dwarf_section *section,
+       /* If we've moved on to the next compile unit in the rnglists section - dump the unit header(s).  */
+       if (is_rnglists && next_rnglists_cu_offset < offset)
+	{
+-	  while (next_rnglists_cu_offset < offset)
+-	    display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
++	  while (ok_header && next_rnglists_cu_offset < offset)
++	    ok_header = display_debug_rnglists_unit_header (section,
++							    &next_rnglists_cu_offset,
++							    &offset_size);
++	  if (!ok_header)
++	    break;
+	  printf (_("    Offset   Begin    End\n"));
+	}
+
+@@ -8558,10 +8557,12 @@ display_debug_ranges (struct dwarf_section *section,
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
-- 
2.35.6


