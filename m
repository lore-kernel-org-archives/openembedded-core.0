Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B028D3516C
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:02:29 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9510.1775037746479805237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=f8THCWp6;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4046; q=dns/txt;
  s=iport01; t=1775037746; x=1776247346;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SdI1y2Q3qXkQWyNsNXAhvMhVsAAW11QosdlnEMCaJQY=;
  b=f8THCWp6uvIVcW+OmyU/WdVrtj9nGgjhPBhwVo0sI8c97QmR9Cx+zW6N
   KJT1RqWZ53kl0rawyIxdm69zehG6oXVk8wkVKiyVAoo+av6fxq4lBuzGQ
   gE89Uvux4wCYBdltfq9ElmzWBV3DE2ObdTW1ZkvVbLYVIIusfFzPz4YVc
   H37iMcAswJEF9zJKxN6ZENaH82TQuHzRA5hQFTPFoLfU+F20b992dAlPU
   kr7t/hFlTCjh1erLU1oaHA9lwfOay3OkG1IZqvyeBSLcNvwVJs4S2rrcY
   vLO/B4rPRDYRKr7VnYPJgu1FjThzx6dWEYzb5QSEJ2j6jGmAtsjVgcFBB
   g==;
X-CSE-ConnectionGUID: /AOKy736TWqa1Ro5I3m8Gw==
X-CSE-MsgGUID: /LEl3x6ATRCyd7Bh/mxlDw==
X-IPAS-Result: =?us-ascii?q?A0AgCQDa7Mxp/5T/Ja1aglmCSA9xX0JJlCqCJItkkjaBf?=
 =?us-ascii?q?w8BAQEPRA0EAQGFBwKNJQImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMnCwFWHAMBAi8gCyMIGYMCAYI6AzYCARG0b?=
 =?us-ascii?q?oF5M4EBg2gCQ0/YRw2CUgEFBhQBgTiFPoJ5hSNbGAGEeicbG4FyglCCLYEFg?=
 =?us-ascii?q?RpCAQMYgR6GbASCIoEOgWGPC0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYFLh1x0bYETg35FAwsYDUgRLDcUGwQ+bgeLaymCNXsTLKV/giGgH?=
 =?us-ascii?q?XEKKIN0jB6PPoV8GjOEBJQVklILmHuOCYQJkkeEaIFoPIFHCwdwFYMiUhkPj?=
 =?us-ascii?q?jiFaIMUv2MjNQIJMwEHAgcOAoFzkAGBfAEB?=
IronPort-Data: A9a23:bhogTah5u73uBvJXn1ULGhAyX161MREKZh0ujC45NGQN5FlHY01je
 htvUW6Oa/+NNDGgc9xxPYSwoxtSsZbTx9NkHQpk+31kQyxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMt/ra8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVf08FUED4Vq
 8AnMTlUVBfeprmzkJ2kH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JYTUGpkMwRrAz
 o7A1yPdLxVBJIK29QCu437zrO+ImDP/dJ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:ysy3kqim5BM5jIOvErTwUvwVV3BQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: 9a23:8htvX2+ORIgZrT4+fbKVvwk9PeM0LSaD8EjJKhaCDjtIE7jFZkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Ad9xlbA5oLmhkImfUcIQXX/mjxowvx4mqU1BTuKk?=
 =?us-ascii?q?8kNiIagZwfDKNiBioF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,153,1770595200"; 
   d="scan'208";a="706741740"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Apr 2026 10:02:25 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 9249518000271
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 10:02:25 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 3E886CC12B5; Wed,  1 Apr 2026 03:02:25 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v3 2/4] binutils: Fix CVE-2025-69644 CVE-2025-69647
Date: Wed,  1 Apr 2026 03:02:15 -0700
Message-Id: <20260401100215.1174602-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260313062532.3247430-1-deeratho@cisco.com>
References: <20260313062532.3247430-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 10:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234336

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2] and [3].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69644
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69647

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

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
index 0000000000..78c3899af9
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644_CVE-2025-69647.patch
@@ -0,0 +1,85 @@
+From 46efc6c469c85aefd6321150e702081823ca815c Mon Sep 17 00:00:00 2001
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
+index b4fb56351ec..2462e6540a7 100644
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
+ 	      "unsupported segment selector size: %d.\n"),
+ 	    section->name, segment_selector_size);
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
+ 	      start - section->start);
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
+2.35.6
+
-- 
2.35.6


