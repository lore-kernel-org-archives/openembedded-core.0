Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90571F88063
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:21 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7712.1776322100838163062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WKHnLexd;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d7645adbdso2516067f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322099; x=1776926899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6XAEGQClgddjeaNto+n8UoU6NIcYBseFMsbVOFt2VU=;
        b=WKHnLexdr/nsQ/+McASU8cKED4KZx7AaM/4wwpqjPCT6VdUW7Exn9X402hHu2VAWBh
         z8FT+EXNhmIvZraFCmtSF/Ygq9StQ1yuGr5UtRKsWJ5O+pw3jnLU2YgVO15G7revqs1B
         uBTVtVYxrlEnDG5j9gcXNMCwIhx6qBbKwk/Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322099; x=1776926899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d6XAEGQClgddjeaNto+n8UoU6NIcYBseFMsbVOFt2VU=;
        b=I/WgJyvDxhzE9I3AR7Tu4yHbLA8rMY6zkQhQxHvm+zmZodU2pVft1p1O52/iy/IcwY
         AyoTMnKyF1gxnGaKX3/Sj364kanI+kb+uEbp39wSdfqGJDJdLWR9C1+d5ZPqlq+Mdsad
         vzksgQAgX9647mMgMX/Ae+e6mgJA98/YS+A+PcgG8K4TrXChaZOr0LJEewhcNWl5aiVD
         QZnQbd+nQFjlFzwpelMIgyllUQyZUFwgujFYPXTPAyWBqvE3UXZtFfwMDnvoEQg1lUFb
         sTQk2HPsigpw5uIrQIjAaWkwrMO0pcXcN/4VJdQVFi0ZbALV9ug+sulJvoHV4EeAyCtT
         05TQ==
X-Gm-Message-State: AOJu0Yy2fUFjdEl0fORBc6O+aD0izu7t2/poKyBe3jYqERJIuMq8iGnR
	mARMXDMH9NvzYzb3FQ2yU6gofdMQi9GMe8bf/4MCfRgi/oRrN6Nm6OBB+Mmw+eJw1yDgKosZO7Y
	pRCxWRNdWnGnz
X-Gm-Gg: AeBDietB7bZqgsXbZ7+TzSDs/aa7/pp2Plbb2QFA0+xTyBS0QGXmQiIFE/PkaBZ4+02
	YAyhCMMlBzsThCUB7CmWfeZggPQ9HfHa5aualQ4mrMSnArzLbmr7B1yHMDl4LexRrF8AdluncVF
	clU7m2ZRMFCry7PHzHvcjensZVkRPwr9LlysHBc+nkF7Ll1WTTuRPFslryRJoi3NPqb0hqefCWy
	NrDvcKcvXxDdGav1wGGKd3X47OcqXEB4rDsPwCOgV90LoLcYs7xWzarWnRKoXAen6bovFcW/UEb
	QyM9wJEyB+DeA+z8TFqI6/NWavoJXh1XnpzcpuBBM3QUz+l0VGw12v8xsy72jDAW7IQsZMpRfoK
	VoPnEmB4sPG8/6z+cW4Agr9mN7L8wIv2uiyvXAk00FpNLm/vT93LlrCjYSu7kFXaIajx4BLRRWH
	53AwpxkWAvC/Vfsuu/zKHpzLFzC9Ki3zAqRhBGrditotRAvjcpQLnfw5o5609kiB19yY8K0wIKg
	gSO4KDnNK/EQ5HJqJ8amDyktGKJEA4sHs2sxw==
X-Received: by 2002:a05:6000:2506:b0:43f:dc86:d61f with SMTP id ffacd0b85a97d-43fdc86e3fcmr218366f8f.14.1776322098912;
        Wed, 15 Apr 2026 23:48:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/47] binutils: Fix CVE-2025-69644 CVE-2025-69647
Date: Thu, 16 Apr 2026 08:47:04 +0200
Message-ID: <27bf3c1db29d874bb01cd84c6827010664b8a61e.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235345

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

