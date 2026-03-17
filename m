Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D582FB5EAF
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 04:12:57 +0000 (UTC)
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69129.1773720774652137113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 21:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=L3aKDETJ;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4347; q=dns/txt;
  s=iport01; t=1773720775; x=1774930375;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=J5i3eVlAdevPWpzAHn7xks2ZA6J7XGSghCLqbuCZy0o=;
  b=L3aKDETJXFMJt3QGc7ijkVSG4uFPgfwKPW9c4OZrTR/CdAWD8Y/dnOvO
   mxJyZzy08KCPjD622vM7cgD1FcE7/O5ZbpqOrSAXqpdIcqY4smL/CrUAM
   jyHZgtCEzRGo/dx1W0g19cmL+3vkLYEwDqMqkI8bt8s0NKDkg44bjisEr
   ItyGiePePqtCSSTLgwhWFGWaGQI1bU4V7Ajl5Iikt34K4OFE8DLI3vU1d
   8aXRQ/+LYCWdQSyRQYDWJ7jWAA1RZBLa8EVs785kEtPL+q4i9h1B8uJsf
   cuUcFRkVDvBfwHJX40Ad3OyUpcZit4S8D0+opvkTJzPi8LVDrXwcD8jHk
   w==;
X-CSE-ConnectionGUID: aMi3Yue2R1SSayf4w9cJrA==
X-CSE-MsgGUID: N2iQ4uiiSVKMWwvH92GI2A==
X-IPAS-Result: =?us-ascii?q?A0BxCwBd07hp/85K/pBaHgEBCxIMgWsQDwuCRA9xX0JJl?=
 =?us-ascii?q?CqCJItkkjaBfw8BAQEPRA0EAQGFBwKNIgImNAkOAQIEAQEBAQMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBVhwDAQIvIAsjCBEIg?=
 =?us-ascii?q?wIBgjoDNgMRt2yBeTOBAYNoAkNPsikNglIBBQYUAYE4hTyCeYUgWxgBhHonG?=
 =?us-ascii?q?xuBcoJQgi2BBYEaQgEDGIEehmwEgiKBDoFhkSNIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQsbBwWEJA+IbXRtgRODXAMLGA1IESw3FBsEPm4HjU08g?=
 =?us-ascii?q?jR7Eyylf4IeoCBxCiiDdIwejz6FfBozhASUFZJSC5h7gliLMYQJkkeEaIFoP?=
 =?us-ascii?q?IFHCwdwFYMiUhkPjjiFaIMUwRU7NQIJMwEHAgcOAoFzkAGBfAEB?=
IronPort-Data: A9a23:R3kbL67WXHxIP32EEKgHQAxRtIPFchMFZxGqfqrLsTDasY5as4F+v
 mBNCmHXafaNNDehf49xa4i1/EIF75TdyoJrQARvqHxmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOO/9xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlNtPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fOBHnkgNGelXefSEDl0vsyExA9H5cxr7Mf7WFmr
 ZT0KRgEYwrGg6e9x6i2D7ExwM8iN8LseogYvxmMzxmAUapgG82fBfqWo4UAgl/chegWdRraT
 8YUZCBmcBTHSxZOIVwQTpk5mY9Eg1GiKmcH+QLE+MLb5UD1lg1IjKXsMeHrWfm1Wtt1zxy3h
 zjvqjGR7hYycYb3JSC+2nW0i+nCmCn2VI4fGPiz8eRnqFmS3XAIThoOWF22pPO0hkKzV5RYM
 UN8x8Y1haE/7gmvC9L6RRD9+CPCtR8HUN0WGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7afamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:7vTYBauBQwV1VGa0Qm3RT6pc7skDd9V00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5SXzLbLfD5HZQGQ2njeL+od
X-Talos-CUID: 9a23:zLT22mMLDoIlou5DUQxmr38JF5ofK0bmxWbef1DpAkRzYejA
X-Talos-MUID: =?us-ascii?q?9a23=3AgfQYXQ0bv45xYt4vVSlisLgzBDUjxf6vMRwQkJQ?=
 =?us-ascii?q?9heqhCjNuG2bHoxXta9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,125,1770595200"; 
   d="scan'208";a="51279895"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Mar 2026 04:12:52 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 44B29180003A6
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:12:52 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 089EECC12B5; Tue, 17 Mar 2026 09:42:51 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v2 2/4] binutils: Fix CVE-2025-69644 CVE-2025-69647
Date: Tue, 17 Mar 2026 09:42:27 +0530
Message-Id: <20260317041229.2932275-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260317041229.2932275-1-deeratho@cisco.com>
References: <20260317041229.2932275-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233293

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2] and [3].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69644
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69647

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes from v1 -> v2:
- Rephrase the patch on top of CVE-2025-69648 patch
- Update the commit message to include both CVE-2025-69644 and CVE-2025-69647
- Update the CVE-ID patch name to include both CVE-2025-69644 and CVE-2025-69647
- Add CVE-2025-69647 in the CVE field in the commit message

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index b6d7b3d60f..48579b3602 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -47,4 +47,5 @@ SRC_URI = "\
      file://0019-CVE-2025-11839.patch \
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2025-69644_CVE-2025-69647.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69644_CVE-2025-69647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644_CVE-2025-69647.patch
new file mode 100644
index 0000000000..b20e9adec2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644_CVE-2025-69647.patch
@@ -0,0 +1,84 @@
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
+
+CVE: CVE-2025-69644 CVE-2025-69647
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


