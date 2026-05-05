Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC66BFF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:58:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1072.1778000325180759221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3D5n0hUN;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so53160865e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000323; x=1778605123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElyNiWKJqqyxk/BSChtZrpcJkO8+HR6oMS+yVDz9Zts=;
        b=3D5n0hUN8/MCKmnwoHPUptZoG3BV1a1XDc9lzk+UOK1SXaIe0Hg2x+arEXPzKTR3pc
         2DyT/uT0xfiYaiiIDgMw2Bk6hH+E9SoSwEOQSgabvzo91LFdOV31KvI8I4kbfspPWwFZ
         T3u57ImKrvMVQrO8Bn1BbebuHmMcWacWDrxig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000323; x=1778605123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElyNiWKJqqyxk/BSChtZrpcJkO8+HR6oMS+yVDz9Zts=;
        b=J5AlyqdCgaJkzihit8mRMcgpLzB7ykpQP1qNJpKWxYRJlzS6n+GGWxJVWlj0rmf+wv
         UpG2xswxboTc9Uidts34a2LviuOF5apMaMcxbQd0as2u9RP2waAL5OB0FSVoWSJ2kSUc
         9oXb+8c527wTUpuDcUmITKZDIHllbLl0XburgKzNiAWFIXp3TQgyps7oyQ4cSkafMq7u
         iGOPbWyxcgtRAyfgSS330PLqBJU8n4XI324jkl4R7yVAzzeL7nAQuAyrXs55vOK4cxr4
         F24dkwCF1ZvIpjXa5UhFKPm8xyJF9PTm5n78iC+YlF5cgejwK/4g1LKJ0a0n0SuDd7ah
         fZtQ==
X-Gm-Message-State: AOJu0YyFQtU+Mq17AqlAU620rfgbL7Gujmkjyyfciz9GTCj4jfi5+wI8
	/Y/dUdVn7l3DYO1RUpEhfZWWNV7NpJS6VoX/x3kG9V0/qVZt2OqhOyyH1Hgv8m7AzRjsKPWAefP
	IbI9AZQo=
X-Gm-Gg: AeBDievEaHajqGOSGdjWZaMzkYY3sOvyRf3/zgPXayzPrBzLK8ZRTfQSlToNzabJiA2
	h7ldEpI1MjcJ8CeRmS4SQQls2csJQinaCOliRBvIhBPN8Lpv1mkc+O4SIaQcCp26wQrU4le3eT3
	5gQTkD/f5T/2hvEkWpLeX6/36KPeFMDZarFxOc5E49HobanjInQbO9bijpCb9vdv9qDX7xdcbzH
	zD2Pva0jG1mPIDkp8pITZAFg7D2LvIo1u89dH4V5VPRiUnfzWTBBN/xmiTejZdDnJvHC8+Z4+MJ
	JeKbCSRClr1mxhFfHg5SceZn+vyXvhVY/3kchcvq1VSPJ6235+P5k1zq8rnoow/+A4co0cAEHQ5
	JXj+oGbqR8/ld7LlR1nm2yM13lF9gKyt8ICW3B62EuhejPApBuD2n+nylqvTe3qF1gY5JfmB04A
	vr0q23pyW3VTIq7mYlc8CN2lRsOrWJKTdqrLySAcZfsjA3iEC/sx26FiQYqgWFHD2q3VnbC5bEc
	tj0yyGtfmcDgwC5eXayJHWUxw==
X-Received: by 2002:a05:600c:4e0c:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48e51e16e58mr1834665e9.9.1778000323117;
        Tue, 05 May 2026 09:58:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:42 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/23] binutils: fix CVE-2025-69647
Date: Tue,  5 May 2026 18:57:19 +0200
Message-ID: <a15dfc1a05ba26ae9f806b0f4c5273bb7c484a04.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236492

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport upstream fix for CVE-2025-69647 [1].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-69647.patch    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 096ccf42c2..fcbe7fbfab 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -72,5 +72,6 @@ SRC_URI = "\
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
+     file://CVE-2025-69647.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
new file mode 100644
index 0000000000..8e3c1c79e7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
@@ -0,0 +1,85 @@
+From c87ed59208e1ce665f08ae2b2d8c1cdc2a653ea2 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2025-69647
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ binutils/dwarf.c | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 72bc9d7497a..06d68074046 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -7221,8 +7221,6 @@ display_loclists_unit_header (struct dwarf_section *  section,
+   bool is_64bit;
+   uint32_t i;
+ 
+-  printf (_("Table at Offset %#" PRIx64 "\n"), header_offset);
+-
+   SAFE_BYTE_GET_AND_INC (length, start, 4, end);
+   if (length == 0xffffffff)
+     {
+@@ -7231,6 +7229,11 @@ display_loclists_unit_header (struct dwarf_section *  section,
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
+@@ -7243,15 +7246,21 @@ display_loclists_unit_header (struct dwarf_section *  section,
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
+@@ -7268,8 +7277,7 @@ display_loclists_unit_header (struct dwarf_section *  section,
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
+2.34.1
+

