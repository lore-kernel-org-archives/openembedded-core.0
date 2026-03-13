Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFCE106FD8C
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 06:26:21 +0000 (UTC)
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10009.1773383164609012158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 23:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EwjgJUFp;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3908; q=dns/txt;
  s=iport01; t=1773383164; x=1774592764;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lpvAVJuj8/whJW5aC+sEmKCLc/gQo/+qJxIacby3dmY=;
  b=EwjgJUFpQkr12OC4XOyrzV0B6rhk6Jgv1lBhAAOfSqw/OTHaZzahvGwK
   TeCv2WYvr0SOMaDqXU3McVuwyzB8GjXnb/MYor0NA4Xu2QNOGXGZWXi0k
   /CwUW9eKmVVdQcAshM4jER7jlSxdtDNjtcAyGfWDBjbtmbcfSn57zkDtD
   f+7DgQbXYHE2q4+BDlBBxDA2FnbZjv1c/N7aD7qBZ2Qz8o7P/ROK7+WpS
   kg6Azbt8leLnTKj4fAhBq3XdEpwOrCG3TcTwrlYEFtMPpxbZltUsRSRQo
   jNM4cUy/1ejD7h6gzgl85gVMAr20ZyWp2b+Ccri9fee834GYSQbmFNxoa
   Q==;
X-CSE-ConnectionGUID: LDSzqtiLTi+umMpZCKuf0w==
X-CSE-MsgGUID: H7Tw2rMuTTSmgVgjZqSJDg==
X-IPAS-Result: =?us-ascii?q?A0BzAACPrbNp/8xK/pBaHQEBAQEJARIBBQUBgWsQBggBC?=
 =?us-ascii?q?wGCQw9xX0JJjHOHN44IkjaBfw8BAQEPRA0EAQGSKwImNAkOAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NhloBLQsBcgMBAk8LIxkIg?=
 =?us-ascii?q?wIBgjoDNgMRsmuBeTOBAYNoAkNPsikNglIBBQYUAYE4AYU7gnmFIFsYAYR6J?=
 =?us-ascii?q?xsbgXKCUIItgQWBGkIBAxiBHoZsBIIigQ6BYZFLSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4ELGwcFhRoPiHB0bYETgygDCxgNSBEsNxQbBD5uB414P?=
 =?us-ascii?q?YI0exMspX+CHqAgcQoog3SMHo8+hXwaM4QElBWSUguYe44JhAmSR4RogWg8g?=
 =?us-ascii?q?UcLB3AVgyJSGQ+OOIVogxTBFTs1AgkxAgcLAQEDCZFrgXwBAQ?=
IronPort-Data: A9a23:Z4Wn16KTTfFnsynjFE+RapclxSXFcZb7ZxGr2PjKsXjdYENS0TZUz
 GEfDG6Ab/7ZM2CgL9FxYdzloUMPvZGAnIBiGwAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea/Un3WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGcuaj58B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKmWDNrfnL
 wpr5OjRElLxp3/BOPv8+lrIWhFirorpAOS7oiE+t55OLfR1jndaPq4TbJLwYKrM4tmDt4gZJ
 N5l7fRcReq1V0HBsLx1bvVWL81xFYlqw63ePXmbjc3Q0kjja0nH4OhgVF5jaOX0+s4vaY1P3
 fUVMnUJKxuEne/zmOn9Qeh3jcNlJ87uVG8dkig8kXeDUKpgHsyFGf2WjTNb9G9YasRmEfvTf
 cMFaT1HZxXbaBoJMVASYH47tLrx3iikLGwGwL6TjYpo33eJ1ils7ITWNdXrdd64XP53sknN8
 woq+Ey8WHn2Lue3ziKI9H+pjOLDkS73HYkVDrCQ8v9xnEbVwXQeDhATX1a3rfS1zEmkVLpix
 1c88yc06Kx3/0uxQ5ylBFuzoWWPuVgXXN84//AG1TxhA5H8u26xblXohBYYADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:JUv+Gqkh1jYgTxcJvdIJnms3CYLpDfI53DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJ8U7ndQtsZ
 uJtMNFebjNMWQ=
X-Talos-CUID: =?us-ascii?q?9a23=3Aa18d6GpRPmjtK2PPT0I4bpzmUeQJSW/E0Hb0H07?=
 =?us-ascii?q?7FGNMUI++akKeoLwxxg=3D=3D?=
X-Talos-MUID: 9a23:UL221gjbBQVszxCROb1ER8MpFJhU/P60LV0xra4DtPeLNx5pABWxg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,117,1770595200"; 
   d="scan'208";a="51093796"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Mar 2026 06:25:48 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id B83CD1800020F
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:25:47 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id F0874CC12B5; Fri, 13 Mar 2026 11:55:45 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 1/3] binutils: CVE-2025-69644
Date: Fri, 13 Mar 2026 11:55:30 +0530
Message-Id: <20260313062532.3247430-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233026

From: Deepak Rathore <deeratho@cisco.com>

pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69644

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 16a63cabc5..cdbe12c97f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -46,4 +46,5 @@ SRC_URI = "\
      file://0018-CVE-2025-11494.patch \
      file://0019-CVE-2025-11839.patch \
      file://0020-CVE-2025-11840.patch \
+     file://CVE-2025-69644.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69644.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644.patch
new file mode 100644
index 0000000000..f314a4da67
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644.patch
@@ -0,0 +1,83 @@
+From ba49416855d61189ef1d8c422ad2815b8702871e Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 22 Nov 2025 09:52:18 +1030
+Subject: [PATCH] PR 33639 .debug_loclists output
+
+The fuzzed testcase in this PR prints an almost endless table of
+offsets, due to a bogus offset count.  Limit that count, and the total
+length too.
+
+	PR 33639
+	* dwarf.c (display_loclists_unit_header): Return error on
+	length too small to read header.  Limit length to section
+	size.  Limit offset count similarly.
+CVE: CVE-2025-69644
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=455446bbdc8675f34808187de2bbad4682016ff7]
+
+(cherry picked from commit 455446bbdc8675f34808187de2bbad4682016ff7)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/dwarf.c | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index f4bcb677761..3c53821149c 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -7257,8 +7257,6 @@ display_loclists_unit_header (struct dwarf_section *  section,
+   bool is_64bit;
+   uint32_t i;
+
+-  printf (_("Table at Offset %#" PRIx64 "\n"), header_offset);
+-
+   SAFE_BYTE_GET_AND_INC (length, start, 4, end);
+   if (length == 0xffffffff)
+     {
+@@ -7267,6 +7265,11 @@ display_loclists_unit_header (struct dwarf_section *  section,
+     }
+   else
+     is_64bit = false;
++  if (length < 8)
++    return (uint64_t) -1;
++
++  printf (_("Table at Offset %#" PRIx64 "\n"), header_offset);
++  header_offset = start - section->start;
+
+   SAFE_BYTE_GET_AND_INC (version, start, 2, end);
+   SAFE_BYTE_GET_AND_INC (address_size, start, 1, end);
+@@ -7279,15 +7282,21 @@ display_loclists_unit_header (struct dwarf_section *  section,
+   printf (_("  Segment size:    %u\n"), segment_selector_size);
+   printf (_("  Offset entries:  %u\n"), *offset_count);
+
++  if (length > section->size - header_offset)
++    length = section->size - header_offset;
++
+   if (segment_selector_size != 0)
+     {
+       warn (_("The %s section contains an "
+	      "unsupported segment selector size: %d.\n"),
+	    section->name, segment_selector_size);
+-      return (uint64_t)-1;
++      return (uint64_t) -1;
+     }
+
+-  if ( *offset_count)
++  uint64_t max_off_count = length >> (is_64bit ? 3 : 2);
++  if (*offset_count > max_off_count)
++    *offset_count = max_off_count;
++  if (*offset_count)
+     {
+       printf (_("\n   Offset Entries starting at %#tx:\n"),
+	      start - section->start);
+@@ -7304,8 +7313,7 @@ display_loclists_unit_header (struct dwarf_section *  section,
+   putchar ('\n');
+   *loclists_start = start;
+
+-  /* The length field doesn't include the length field itself.  */
+-  return header_offset + length + (is_64bit ? 12 : 4);
++  return header_offset + length;
+ }
+
+ static int
+--
+2.44.1
-- 
2.35.6


