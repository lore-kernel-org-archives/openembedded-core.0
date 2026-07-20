Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DABC44531
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2863.1784568211680527463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=33ihnpVH;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so45661465e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568210; x=1785173010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kPsPMNe0u5wdCYSACX4YP0bnD1tZ3B7jLVpoAzlzaVw=;
        b=33ihnpVHdUfOU1VNheFYXZrna4D5Z3CqKCVzY+AazxoqU1cfxorbvzqzmDVPJYMoKv
         zTlOYKhqzSQr5ALXClMp7o8EHhBuJ8s+EzXi4ldhjZ3JvzhW3SiBTIRF/vXtFgUSAzKq
         Kca1XGrEG2zFT3N+J0mnxW7n6/XAT0Txj1mQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568210; x=1785173010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kPsPMNe0u5wdCYSACX4YP0bnD1tZ3B7jLVpoAzlzaVw=;
        b=GLJjOV8i/6w8kEKSTELmrB47fmfaoF/ms58ny4AkE9w8q6WewPE1LDXMPGWJHSrjkp
         PlEv04wEwxAPs/ulXkkQ6NwML9DnKKrrYkJofrhV7KO2AxgjZfOfnc+VY4mMQDeUQHNY
         qy7IQUcn+7tKEt4SePlL9iS+rlL2YpRyxQR5Mgtgy4Y7svldfhOoHEhUlQZkW6tgMYJr
         P87GF2587s7wbc/4nK+hgusTmnpsg47jusilx+/Bl2Q+vUMQaSjzeu3oIYG1sWxbzbUj
         UWYdQItMTtc3k++qFMnYiWZ6p8rgjxqpsvdjL3+37YoSG9FiBV1DOsWtsOIjurjHDa/4
         M+dQ==
X-Gm-Message-State: AOJu0YxWD7v4JSkvTU3aCwuypzPIqwg5klrlgPEKv0MBDkQRojnoKNZE
	KLJRGIzDnHBlzO4X4YgflFC+X8FB+jykQTuRCj9LPVk64uvrD1pVEvRrTRFI0jBeGRpmT7tTm5a
	9a1A3frs=
X-Gm-Gg: AfdE7ckzi18gvtxc3htnHUsTDo15Xw6ctZGVi3qAb0OzIc5BRSY/z4FSdMjUoHaobMo
	ROW+uwbFt70zqZQrrahhltdzRjs/GZtEzie7kzS4JPaY+lC7cMx+6cWMhyRgoYQ2b14FXLVkQay
	q9G0sFxgtdKVmwdASemcEfYNLrVVYMmFX07LKXg+13EY5pLBxeH2oXbNbxsRX1gh5YT/LgkHIwu
	WLrUCijTGWW/SQsBoTgx+ftk2H+F5HEznChFA9vefWcNq0XkwBUZyscS9Sl7DI52BdkIPUzsCvf
	w6iXrJ5AZ6Fzrk2CmiDjuBpppRuooq02rq5bkAzPfagS/UQCn+1II49ndEIuAUxYcnEulWJjYt+
	1ujm2whi2G7/iNbjy98S+Jr2uDVi3qzQjk8jbE2ipFlnp9XdYU5Qy0c2NHWOGH2g+DFU+g73CWh
	yuNKgafwkf4dp5sDTLMfXlNxRZdv0/GkbwhpkyH3wnCa8A2AOJBrpU+iGP2x0Xvde7qsm4z9nyh
	kej+zFs
X-Received: by 2002:a05:600c:3506:b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-4954a3d0070mr173853315e9.6.1784568209628;
        Mon, 20 Jul 2026 10:23:29 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/33] binutils: fix CVE-2025-69645
Date: Mon, 20 Jul 2026 19:22:38 +0200
Message-ID: <ca101b2ff0b91630df25ee619c809e0621d41b21.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241439

From: Roland Kovacs <roland.kovacs@est.tech>

Binutils objdump contains a denial-of-service vulnerability when processing
a crafted binary with malformed DWARF debug information. A logic error in
the handling of DWARF compilation units can result in an invalid offset_size
value being used inside byte_get_little_endian, leading to an abort (SIGABRT).
A local attacker can trigger the crash by supplying a malicious input file.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
[YC: The patch is referenced on the NVD page:
     https://nvd.nist.gov/vuln/detail/CVE-2025-69645 ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2025-69645.patch    | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69645.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index c93f51e3ee2..d455acd7863 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -77,5 +77,6 @@ SRC_URI = "\
      file://CVE-2025-69649.patch \
      file://CVE-2025-69652.patch \
      file://CVE-2026-6846.patch \
+     file://CVE-2025-69645.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69645.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69645.patch
new file mode 100644
index 00000000000..78d2d62a507
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69645.patch
@@ -0,0 +1,135 @@
+From 3fe207e0625a76c8cba932e435762bfb5f544131 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 30 Nov 2025 12:51:54 +1030
+Subject: [PATCH] PR 33637, abort in byte_get
+
+When DWARF5 support was added to binutils in commit 77145576fadc,
+the loop over CUs in process_debug_info set do_types when finding a
+DW_UT_type unit, in order to process the signature and type offset
+entries.  Unfortunately that broke debug_information/debug_info_p
+handling, which previously was allocated and initialised for each unit
+in .debug_info.  debug_info_p was NULL when processing a DWARF4
+.debug_types section.  After the 77145576fadc change it was possible
+for debug_infp_p to be non-NULL but point to zeroed data, in
+particular a zeroed offset_size.  A zero for offset_size led to the
+byte_get_little_endian abort triggered by the fuzzer testcase.
+
+I haven't investigated whether there is any need for a valid
+offset_size when processing a non-fuzzed DWARF4 .debug_types section.
+Presumably we'd have found that out in the last 6 years if that was
+the case.  We don't want to change debug_information[] for
+.debug_types!
+
+	PR 33637
+	* dwarf.c (process_debug_info): Don't change DO_TYPES flag bit
+	depending on cu_unit_type.  Instead test cu_unit_type along
+	with DO_TYPES to handle signature and type_offset for a type
+	unit.  Move find_cu_tu_set_v2 call a little later.
+
+CVE: CVE-2025-69645
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=cdb728d4da6184631989b192f1022c219dea7677]
+
+Note:
+  Backported patch differs from upstream as commit
+  1f7e70ddd2c49dd5442b8873dd6ef29b0a10fdc3 is not cherry-picked
+  just to introduce `do_flags` instead of the separate `do_type`
+  and `do_loc` booleans for it to apply cleanly.
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ binutils/dwarf.c | 18 ++++++------------
+ 1 file changed, 6 insertions(+), 12 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 615e051b2bf..836872f1b26 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -3865,8 +3865,6 @@ process_debug_info (struct dwarf_section * section,
+ 
+       SAFE_BYTE_GET_AND_INC (compunit.cu_version, hdrptr, 2, end_cu);
+ 
+-      this_set = find_cu_tu_set_v2 (cu_offset, do_types);
+-
+       if (compunit.cu_version < 5)
+ 	{
+ 	  compunit.cu_unit_type = DW_UT_compile;
+@@ -3876,8 +3874,6 @@ process_debug_info (struct dwarf_section * section,
+       else
+ 	{
+ 	  SAFE_BYTE_GET_AND_INC (compunit.cu_unit_type, hdrptr, 1, end_cu);
+-	  do_types = (compunit.cu_unit_type == DW_UT_type);
+-
+ 	  SAFE_BYTE_GET_AND_INC (compunit.cu_pointer_size, hdrptr, 1, end_cu);
+ 	}
+ 
+@@ -3891,6 +3887,7 @@ process_debug_info (struct dwarf_section * section,
+ 	  SAFE_BYTE_GET_AND_INC (dwo_id, hdrptr, 8, end_cu);
+ 	}
+ 
++      this_set = find_cu_tu_set_v2 (cu_offset, do_types);
+       if (this_set == NULL)
+ 	{
+ 	  abbrev_base = 0;
+@@ -3947,8 +3944,6 @@ process_debug_info (struct dwarf_section * section,
+ 
+       SAFE_BYTE_GET_AND_INC (compunit.cu_version, hdrptr, 2, end_cu);
+ 
+-      this_set = find_cu_tu_set_v2 (cu_offset, do_types);
+-
+       if (compunit.cu_version < 5)
+ 	{
+ 	  compunit.cu_unit_type = DW_UT_compile;
+@@ -3958,13 +3953,12 @@ process_debug_info (struct dwarf_section * section,
+       else
+ 	{
+ 	  SAFE_BYTE_GET_AND_INC (compunit.cu_unit_type, hdrptr, 1, end_cu);
+-	  do_types = (compunit.cu_unit_type == DW_UT_type);
+-
+ 	  SAFE_BYTE_GET_AND_INC (compunit.cu_pointer_size, hdrptr, 1, end_cu);
+ 	}
+ 
+       SAFE_BYTE_GET_AND_INC (compunit.cu_abbrev_offset, hdrptr, offset_size, end_cu);
+ 
++      this_set = find_cu_tu_set_v2 (cu_offset, do_types);
+       if (this_set == NULL)
+ 	{
+ 	  abbrev_base = 0;
+@@ -3996,7 +3990,7 @@ process_debug_info (struct dwarf_section * section,
+ 	  compunit.cu_pointer_size = offset_size;
+ 	}
+ 
+-      if (do_types)
++      if (do_types || compunit.cu_unit_type == DW_UT_type)
+ 	{
+ 	  SAFE_BYTE_GET_AND_INC (signature, hdrptr, 8, end_cu);
+ 	  SAFE_BYTE_GET_AND_INC (type_offset, hdrptr, offset_size, end_cu);
+@@ -4011,7 +4005,7 @@ process_debug_info (struct dwarf_section * section,
+       if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+ 	  && num_debug_info_entries == 0
+ 	  && alloc_num_debug_info_entries > unit
+-	  && ! do_types)
++	  && !do_types)
+ 	{
+ 	  free_debug_information (&debug_information[unit]);
+ 	  memset (&debug_information[unit], 0, sizeof (*debug_information));
+@@ -4042,7 +4036,7 @@ process_debug_info (struct dwarf_section * section,
+ 	  printf (_("   Abbrev Offset: %#" PRIx64 "\n"),
+ 		  compunit.cu_abbrev_offset);
+ 	  printf (_("   Pointer Size:  %d\n"), compunit.cu_pointer_size);
+-	  if (do_types)
++	  if (do_types || compunit.cu_unit_type == DW_UT_type)
+ 	    {
+ 	      printf (_("   Signature:     %#" PRIx64 "\n"), signature);
+ 	      printf (_("   Type Offset:   %#" PRIx64 "\n"), type_offset);
+@@ -4319,7 +4313,7 @@ process_debug_info (struct dwarf_section * section,
+      we need to process .debug_loc and .debug_ranges sections.  */
+   if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+       && num_debug_info_entries == 0
+-      && ! do_types)
++      && !do_types)
+     {
+       if (num_units > alloc_num_debug_info_entries)
+ 	num_debug_info_entries = alloc_num_debug_info_entries;
+-- 
+2.34.1
+

