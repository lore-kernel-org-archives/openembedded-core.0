Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE5FD35169
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:01:39 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9566.1775037692550006352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZsNos+Zx;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16133; q=dns/txt;
  s=iport01; t=1775037692; x=1776247292;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d8RvFP7/OxxY2+xe/5nc/zprRk7itbuq4NSNN4I8USU=;
  b=ZsNos+Zx+lbvzMqb0ouA64a10g83I/H2YnuOUoRBYIIPuom9GB1aM94U
   VftZIHGmPgIfcEzRieaahxmo7yjbBQZIhKNnijiu0448JbPjbBN5oh+SK
   pLI+FgzXtieXjcVMIUMPVGTe2CA2dSZIpkgqD1IwpBwwV2qXBhbLOkp5k
   5f/oLvD/1c2D6Vq6C7X97lN/MjxbLvHupDXT8j57/mq8EAZ+tJzTlbDIy
   bVnFPmJps9Dq+ZiOWCXP53D0Wim57z1XYE4QH/nBn7CxWvI0CTqtaChzQ
   n+KYKXalRNI63x0dbIuN5/ecuIy/4CpriCA+Uni9BdoQGhnll+wNvTPzw
   Q==;
X-CSE-ConnectionGUID: W99GglumRL6m7TFq3hefoA==
X-CSE-MsgGUID: /MRVmDflQs2nuih/rb6HOQ==
X-IPAS-Result: =?us-ascii?q?A0AkCQBX68xp/5H/Ja1aglmCSA9xX0JJlCqCIQOLZJI2F?=
 =?us-ascii?q?IFrDwEBAQ9EDQQBAYUHAo0lAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLAVYcAwECLyALIwgZgwIBgjoDNgIBE?=
 =?us-ascii?q?bRfgXkzgQGDaAJDT9hHDYJSAQUGFAGBOIU+gnmFI1sYAYR6JxsbgXKCUIItg?=
 =?us-ascii?q?QWBGkIBAxiBHg6GXgSCIoEOgWGPC0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYFLh1x0bYETg35FAwsYDUgRLDcUGwQ+bgeLaymBQ1IOEgF6E?=
 =?us-ascii?q?wETGIJmEZJ0kBSCIaAdcQoog3SMHo40gQqFfBozhARNk0iSUguYe44JhAmRb?=
 =?us-ascii?q?SM3hGiBaDyBRwsHcBWDIlIZD44qDguFXYMUv2UjNQIJMwEHAgcOAoFzkAGBf?=
 =?us-ascii?q?AEB?=
IronPort-Data: A9a23:DMrmCKCNRCrngBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDtz3zJTn
 2IZWmuPPKnfZjb0et90b42/pBsB7J7VyoQ3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAP9gmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE/KQ/I04yIIgi3rhyXl1g7
 KcYJT4KR0XW7w626OrTpuhEnM8vKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYyBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FMpjeKyaYqOJLRmQ+0Su3ymo
 07I+13iWBcHNdzY0zDb0lWV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:axqSJKlG5h0qJ4Laj5TH50yUjeLpDfIt3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNDU1ZmIK6/oTJ2KDYrEd/OU=
X-Talos-CUID: 9a23:9NPkEm+JGJC9MfQD8K+Vv3FFS+8qdmDY9lOOJhCEJ38ySLCbTnbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AiT7HHQyLBAKgi6TFTT/hZA/hdRGaqOOLMn4IvZs?=
 =?us-ascii?q?CgtLeMzFxO3CHhmqXZbZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,153,1770595200"; 
   d="scan'208";a="705271836"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Apr 2026 10:01:31 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 4A98B180001D1
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 10:01:31 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id E30CBCC12B5; Wed,  1 Apr 2026 03:01:30 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v2 1/4] binutils: Fix CVE-2025-69648
Date: Wed,  1 Apr 2026 03:00:22 -0700
Message-Id: <20260401100022.1173083-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260317041229.2932275-1-deeratho@cisco.com>
References: <20260317041229.2932275-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 10:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234335

From: Deepak Rathore <deeratho@cisco.com>

pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69648

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/0001-pick-the-patch-1-as-mentioned-in-2.patch b/meta/recipes-devtools/binutils/0001-pick-the-patch-1-as-mentioned-in-2.patch
new file mode 100644
index 0000000000..70866fd7da
--- /dev/null
+++ b/meta/recipes-devtools/binutils/0001-pick-the-patch-1-as-mentioned-in-2.patch
@@ -0,0 +1,222 @@
+From 507f05eb8f3a132a536c593e232fdc7878fb9bba Mon Sep 17 00:00:00 2001
+From: Deepak Rathore <deeratho@cisco.com>
+Date: Tue, 31 Mar 2026 11:25:32 +0000
+Subject: [PATCH] pick the patch [1] as mentioned in [2].
+
+[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33
+[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69648
+
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../binutils/binutils-2.45.inc                |   1 +
+ .../binutils/binutils/CVE-2025-69648.patch    | 188 ++++++++++++++++++
+ 2 files changed, 189 insertions(+)
+ create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+
+diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
+index 16a63cabc5..b6d7b3d60f 100644
+--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
++++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
+@@ -46,4 +46,5 @@ SRC_URI = "\
+      file://0018-CVE-2025-11494.patch \
+      file://0019-CVE-2025-11839.patch \
+      file://0020-CVE-2025-11840.patch \
++     file://CVE-2025-69648.patch \
+ "
+diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+new file mode 100644
+index 0000000000..2346b18f01
+--- /dev/null
++++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+@@ -0,0 +1,188 @@
++From 7df481dd76c05c89782721e9df5468be829c356b Mon Sep 17 00:00:00 2001
++From: Alan Modra <amodra@gmail.com>
++Date: Sat, 22 Nov 2025 09:22:10 +1030
++Subject: [PATCH] PR 33638, debug_rnglists output
++
++The fuzzed testcase in this PR continuously outputs an error about
++the debug_rnglists header.  Fixed by taking notice of the error and
++stopping output.  The patch also limits the length in all cases, not
++just when a relocation is present, and limits the offset entry count
++read from the header.  I removed the warning and the test for relocs
++because the code can't work reliably with unresolved relocs in the
++length field.
++
++	PR 33638
++	* dwarf.c (display_debug_rnglists_list): Return bool.  Rename
++	"inital_length" to plain "length".  Verify length is large
++	enough to read header.  Limit length to rest of section.
++	Similarly limit offset_entry_count.
++	(display_debug_ranges): Check display_debug_rnglists_unit_header
++	return status.  Stop output on error.
++
++CVE: CVE-2025-69648
++Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
++
++(cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
++Signed-off-by: Deepak Rathore <deeratho@cisco.com>
++---
++ binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
++ 1 file changed, 34 insertions(+), 33 deletions(-)
++
++diff --git a/binutils/dwarf.c b/binutils/dwarf.c
++index f4bcb677761..b4fb56351ec 100644
++--- a/binutils/dwarf.c
+++++ b/binutils/dwarf.c
++@@ -8282,7 +8282,7 @@ display_debug_rnglists_list (unsigned char * start,
++   return start;
++ }
++
++-static int
+++static bool
++ display_debug_rnglists_unit_header (struct dwarf_section *  section,
++				    uint64_t *              unit_offset,
++				    unsigned char *         poffset_size)
++@@ -8290,7 +8290,8 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
++   uint64_t        start_offset = *unit_offset;
++   unsigned char * p = section->start + start_offset;
++   unsigned char * finish = section->start + section->size;
++-  uint64_t        initial_length;
+++  unsigned char * hdr;
+++  uint64_t        length;
++   unsigned char   segment_selector_size;
++   unsigned int    offset_entry_count;
++   unsigned int    i;
++@@ -8299,66 +8300,59 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
++   unsigned char   offset_size;
++
++   /* Get and check the length of the block.  */
++-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
+++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
++
++-  if (initial_length == 0xffffffff)
+++  if (length == 0xffffffff)
++     {
++       /* This section is 64-bit DWARF 3.  */
++-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
+++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
++       *poffset_size = offset_size = 8;
++     }
++   else
++     *poffset_size = offset_size = 4;
++
++-  if (initial_length > (size_t) (finish - p))
++-    {
++-      /* If the length field has a relocation against it, then we should
++-	 not complain if it is inaccurate (and probably negative).
++-	 It is copied from .debug_line handling code.  */
++-      if (reloc_at (section, (p - section->start) - offset_size))
++-	initial_length = finish - p;
++-      else
++-	{
++-	  warn (_("The length field (%#" PRIx64
++-		  ") in the debug_rnglists header is wrong"
++-		  " - the section is too small\n"),
++-		initial_length);
++-	  return 0;
++-	}
++-    }
++-
++-  /* Report the next unit offset to the caller.  */
++-  *unit_offset = (p - section->start) + initial_length;
+++  if (length < 8)
+++    return false;
++
++   /* Get the other fields in the header.  */
+++  hdr = p;
++   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
++   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
++   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
++   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
++
++   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
++-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
+++  printf (_("  Length:          %#" PRIx64 "\n"), length);
++   printf (_("  DWARF version:   %u\n"), version);
++   printf (_("  Address size:    %u\n"), address_size);
++   printf (_("  Segment size:    %u\n"), segment_selector_size);
++   printf (_("  Offset entries:  %u\n"), offset_entry_count);
++
+++  if (length > (size_t) (finish - hdr))
+++    length = finish - hdr;
+++
+++  /* Report the next unit offset to the caller.  */
+++  *unit_offset = (hdr - section->start) + length;
+++
++   /* Check the fields.  */
++   if (segment_selector_size != 0)
++     {
++       warn (_("The %s section contains "
++	      "unsupported segment selector size: %d.\n"),
++	    section->name, segment_selector_size);
++-      return 0;
+++      return false;
++     }
++
++   if (version < 5)
++     {
++       warn (_("Only DWARF version 5+ debug_rnglists info "
++	      "is currently supported.\n"));
++-      return 0;
+++      return false;
++     }
++
+++  uint64_t max_off_count = (length - 8) / offset_size;
+++  if (offset_entry_count > max_off_count)
+++    offset_entry_count = max_off_count;
++   if (offset_entry_count != 0)
++     {
++       printf (_("\n   Offsets starting at %#tx:\n"), p - section->start);
++@@ -8372,7 +8366,7 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
++	}
++     }
++
++-  return 1;
+++  return true;
++ }
++
++ static bool
++@@ -8404,6 +8398,7 @@ display_debug_ranges (struct dwarf_section *section,
++   uint64_t last_offset = 0;
++   uint64_t next_rnglists_cu_offset = 0;
++   unsigned char offset_size;
+++  bool ok_header = true;
++
++   if (bytes == 0)
++     {
++@@ -8493,8 +8488,12 @@ display_debug_ranges (struct dwarf_section *section,
++       /* If we've moved on to the next compile unit in the rnglists section - dump the unit header(s).  */
++       if (is_rnglists && next_rnglists_cu_offset < offset)
++	{
++-	  while (next_rnglists_cu_offset < offset)
++-	    display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
+++	  while (ok_header && next_rnglists_cu_offset < offset)
+++	    ok_header = display_debug_rnglists_unit_header (section,
+++							    &next_rnglists_cu_offset,
+++							    &offset_size);
+++	  if (!ok_header)
+++	    break;
++	  printf (_("    Offset   Begin    End\n"));
++	}
++
++@@ -8548,10 +8547,12 @@ display_debug_ranges (struct dwarf_section *section,
++     }
++
++   /* Display trailing empty (or unreferenced) compile units, if any.  */
++-  if (is_rnglists)
+++  if (is_rnglists && ok_header)
++     while (next_rnglists_cu_offset < section->size)
++-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
++-
+++      if (!display_debug_rnglists_unit_header (section,
+++					       &next_rnglists_cu_offset,
+++					       &offset_size))
+++	break;
++   putchar ('\n');
++
++   free (range_entries);
++--
++2.35.6
+-- 
+2.51.0
+
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
index 0000000000..ce0e764762
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
-- 
2.35.6


