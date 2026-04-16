Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B332F8DFDB
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:05 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28251.1776378781887264229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uerXjt1f;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so721995e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378780; x=1776983580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6XAEGQClgddjeaNto+n8UoU6NIcYBseFMsbVOFt2VU=;
        b=uerXjt1ftIsEU4hdnN+JDoQV9y7cjVOSeEwKjRZB8PIPKwBRvTwHAfu75cK707XtcZ
         LyIzrB7Dw+VqEyrus/hbVGsoBhu1A/pQdqFfID3HHLXMQ7LC96wJtg6W67FAgHwb5PzM
         mYPDLH0aTdxO0QUSDSjEfOzUE5a1raRsya6vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378780; x=1776983580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d6XAEGQClgddjeaNto+n8UoU6NIcYBseFMsbVOFt2VU=;
        b=hZu3s2+S7uteRoCHzYhUbPyWv5gDZAkR9UOTgKFRKbCceLU8eocYbWP7hIWeB+LqL/
         LAuFyJIqBsAdcNn0GT4DhXlNBfYO/fPcBZnXxTLFmRGd96U9FbErWAst7zKGsoQgiZBN
         TjjSrMi5NBdZzPEs6MS39WHv6Q8dp8PyCt+UVKatxbP98usBETjyKck7mbCykRNsa61B
         XsN4NOM0h23m4VVqi6j93C3G+FL1l0qSv/KWwg0tGV+SqkTHvMt2gKwlnGxqasTQf9ao
         R3aikeLyYB/fulRX4kohcob9bF2yRdV31VSQiVn+0UhDgHRvGBg1W0Cfww16LJd9C+dY
         7tGQ==
X-Gm-Message-State: AOJu0YyIPBhUzqQ65KPSEwW+TT0rSSYCoB904fDDDV+yuRHOYVnKsICp
	7fvuDhz038YV7AmBXOERFqhML1xpF7mpE+1Hr/mXj9xt8M6/a2cYqmIdoKokMwjmQVUnE/MZ5eh
	jmOmF6DQZVUxs
X-Gm-Gg: AeBDiet4sTxD4It5PPyvnQ8hSniCGQCqnGxZ4qLSLBrD3YEQvklOfX97UYfYm/sy8HF
	8ypi5i+eoK1xLpGf+eIPQRSmrbOdMaWy97GbgxQD51v4GoL6umsV8XdknCz1N09l45uGABjWX05
	92u2ygBUdo7TPgA71Kgvh6IxywjgNi46J3FkBVsi9LsT8PWcwyZOBNu35G7pdu1X+bFztNBmzrM
	L87dzcXMbDrEn/dI9kSSdp42W9XZu2MYfsfu7KlH5GLcqAp2tij5ncrbYrIWRT/+pPB17eRqix9
	NDQRE0IcPFeY0v5WjDd69uyDtoM5SjoVKLc6nEEeEh+oP6GPcbIpqYjv8N/qD+icVmlhEKHNFJ2
	7Qg3k8vmBjq4IZ1nCarhe5MgdrTw7cNe18Vc0+xpOlYxkik5ux4D0ovObufizPANxt2K5mWzRKs
	oFPwsNJb+rnMPbBd9P7L4jYJ1y3wh2SBVyc2I9ByaKRfdqsPkOfY3Ds/eUx4ICXxRhoE1sPqkqD
	eqvJbIhe9HdvJm7F6CKACijLaRYL+SzbDYKbw==
X-Received: by 2002:a05:600c:4fd2:b0:488:e192:6fbd with SMTP id 5b1f17b1804b1-488fb790869mr5170455e9.30.1776378780002;
        Thu, 16 Apr 2026 15:33:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.32.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:32:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 03/51] binutils: Fix CVE-2025-69644 CVE-2025-69647
Date: Fri, 17 Apr 2026 00:29:46 +0200
Message-ID: <27bf3c1db29d874bb01cd84c6827010664b8a61e.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235432

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2] and [3].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69644
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69647

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../CVE-2025-69644_CVE-2025-69647.patch       | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69644_CVE-2025-69647.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 83907f24afa..a2bb278b438 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -49,4 +49,5 @@ SRC_URI = "\
      file://0019-CVE-2025-11839.patch \
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2025-69644_CVE-2025-69647.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69644_CVE-2025-69647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644_CVE-2025-69647.patch
new file mode 100644
index 00000000000..78c3899af91
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

