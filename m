Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DAECC6B03
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 06:56:36 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10210.1775112986441326969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 23:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XZ24nm3l;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4046; q=dns/txt;
  s=iport01; t=1775112986; x=1776322586;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SdI1y2Q3qXkQWyNsNXAhvMhVsAAW11QosdlnEMCaJQY=;
  b=XZ24nm3lvqAfdwf/8QJGoZ/bMaQL70LrgeedDuFdBE36uSMd9iXhUsSi
   6ol7/1OF4qdz17Q6fdpu/UuN1WOItZS2vJtJbI6dotk+mtpJx2HiIXabt
   ojhDSqHu5rrYcmitdLb2jp2W1bjqzXk9l1ygHK0kAn0o8jiJbROzIMd7L
   nt8lb+W9DeH7pVI7yXMfg3XEyizgTgjPmYEAH+1m9DYCf4p+paqvdrliq
   Py719wXpokLI89NOnbScpRUNHeN/+KGeHk9NRAhDm/9RXdD33lfYZz9xI
   YUNeJD0mXCZs3DtyG72zmiAK5Ohd3x9FEjuOkWgGUFn0LNtfGc9KVQHr+
   w==;
X-CSE-ConnectionGUID: FuZkFi1zR+OC1hocQI1EJQ==
X-CSE-MsgGUID: bguy/fBKS0Ccy5ZwejNRnw==
X-IPAS-Result: =?us-ascii?q?A0CaAgA/Es5p/4z/Ja1aglmCV3FfQkmUKoIki2SSNoF/D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUHAo0nAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAycLAVYcAwECLyALIwgZgwIBgjoDNgIBEbQYg?=
 =?us-ascii?q?XkzgQGDaAJDT9hHDYJSAQUGFAGBOIU+gnmFI1sYAYR6JxsbgXKCUIItgQWBG?=
 =?us-ascii?q?kIBAxiBHoZsBIIigQ6BYY8ZSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EMGwcFgUuHXHRtgRODflcDCxgNSBEsNxQbBD5uB4tzKYI2exMspX+CIaAdc?=
 =?us-ascii?q?Qoog3SMHo8+hXwaM4QElBWSUguYe44JhAmSR4RogWg8gUcLB3AVgyJSGQ+OO?=
 =?us-ascii?q?IVogxS/FCM1AgkzAQcCBw4CgXOQAYF8AQE?=
IronPort-Data: A9a23:/G5njaM2Ce2xaP7vrR31lsFynXyQoLVcMsEvi/4bfWQNrUor0GABz
 TAXUTuCO/yJYzP1fYxxbIripkMEvpPRyIQwG3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf5g2Qsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69tzPkIYPNQKwKVQKjhO8
 vchCWkgTCnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmCS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQuiOS2bYOJIILiqcN9lEmFt
 yXI1UfCWjoRJYGt1jeH1Eiqmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMEhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:SjJtjqhGtFCY/GShm6Tl5CGEf3BQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: 9a23:DFTMcm/0dVunNqKzM+yVv2AJKMMLcyTP9jT3CBa4Dm1QaeS4a2bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AuGVz3A47f15Zy9rNr3rlM1FDxoxi7Lm/T04nsq5?=
 =?us-ascii?q?ekMKVaB5vNjW7tjKoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,155,1770595200"; 
   d="scan'208";a="704351426"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Apr 2026 06:56:23 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 539AD180005B6
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:22 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id F3E04CC12B5; Wed,  1 Apr 2026 23:56:21 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v4 2/4] binutils: Fix CVE-2025-69644 CVE-2025-69647
Date: Wed,  1 Apr 2026 23:55:57 -0700
Message-Id: <20260402065557.3783451-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260313062532.3247430-1-deeratho@cisco.com>
References: <20260313062532.3247430-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 06:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234491

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


