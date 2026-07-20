Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DE3C44533
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2885.1784568210843168990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=v/uKK0L7;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso13778155e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568209; x=1785173009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PsW6Sfb8LaCJr5IPnq11VaXoxQdSt6l788orTKIuY1k=;
        b=v/uKK0L7J0dF+7lW7fdq+pz06FBePn0n7ycyzQRbI9MNAc89aKpnyGCYhhjKGlexoT
         FWnu7AI2ivOJtBrUm9XGRtkGV5rTpSSVS2wWWCfOu7rocILK5KA/tautuDcdshAe3NXw
         EaTDekpeegM46hwhFIrnSEdqS1j7XxLt4nyKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568209; x=1785173009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PsW6Sfb8LaCJr5IPnq11VaXoxQdSt6l788orTKIuY1k=;
        b=RM74/VI7ADmqdGKfPYEMCGchX9jFtRVMUf/76w+k2BZELrjeKk6u64CP8rKkL7BVBv
         fjzyW6OxqYPDwSIJTXCGMKwcyZ7fhztCUlLS9y57pnBdEAYKPpRTPzogigPdxMoGfXI5
         cjxrzzWylGGaztHuDgYN1m+fLtdDcyyF5woKbLMst8hed/+gqvGP8nxPGPpg/zvvyzRe
         rmUnnFLn2L6jOs3dDdsjcTQa8v6g3KD9YNM9TK16O4esZlxHnRmxuH9zkDt/7QGQ78oE
         56JrmWMenChnxXqXGsncazoCxrPXdge51s7yb4nmnnc9CXDIq4I3zpLpriAuX/hc8icz
         8u1g==
X-Gm-Message-State: AOJu0Yy6Sljl3M4RXsFzq7ttAPVFGynv2zG+zKKo8p0hwi5+vv0j8LHw
	1M5pl/sXTb/MZb8CBBnXC/nzzRcJeP5WABtbYCHzOJUKgiRFFz4XocfzmL3b5/N5hkl67Gr6eZz
	CvSPwdmE=
X-Gm-Gg: AfdE7cncy/QVPo8s4pkUEK67WT1w6ftDb7zp05H6ZBuobcDpP3eCNe1vQdNotmcIGLW
	teWM4KHjpOyxw+koCTgmCkE5P2UsFwXaO/tLwJFks7hbljmLftaQ2zHS6+5FqLygGtd/5sm2YIT
	TEve0LjWM3aEEtBjWGG6VgK7Tlaxnj75+WPqHmsrXBboIKvwIJP5zNs5Yjcv56c5D6JLDnhw0UY
	XIWPPiZNdiIYL5MMaTBMPfTOh6QyZae/HTrwiKqmD7rXtJ3i+4sR9ZlsdX9u8sAuAIObSmiYDi8
	X5QlJ0cJkdBTXpqxCJ3hd+gbebmZzttPPLKygwui4cZD+XO/TBG22Li66G1yS5V6pY5g/Lqd0sy
	MxG0NTr4taGWFg348lyJoK43pco9XR1cKKC0OOGDtwKpOTBi9SGxi/gy3rZ6l0HpQIfWC3MD0dJ
	b6ZztA4SFRgpgCmQmUmpQALidXcg8Z51RxgBAdxO3PVoehJYeh09TiWy9bi53w0Z73hxeZinehq
	rzX00zv
X-Received: by 2002:a05:600c:b96:b0:495:4b00:1bab with SMTP id 5b1f17b1804b1-4954b001c39mr163910245e9.21.1784568209022;
        Mon, 20 Jul 2026 10:23:29 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/33] binutils: fix CVE-2025-69649, and CVE-2025-69652
Date: Mon, 20 Jul 2026 19:22:37 +0200
Message-ID: <86dd1306e350c4cd3b36a39254d6f17587960a60.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241438

From: Roland Kovacs <roland.kovacs@est.tech>

CVE-2025-69649:
  Null pointer dereference in readelf before 2.46 results in segfault when
  processing a crafted ELF binary with malformed header fields.
  No evidence of memory corruption beyond the null pointer dereference, nor
  any possibility of code execution, was observed.

CVE-2025-69652:
  Null pointer dereference in readelf when processing a crafted ELF binary
  with malformed DWARF abbrev or debug information which leads to SIGABORT.
  No evidence of memory corruption or code execution was observed; the impact
  is limited to denial of service.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
[YC: patches are referenced in the NVD database:
     https://nvd.nist.gov/vuln/detail/CVE-2025-69649
     https://nvd.nist.gov/vuln/detail/CVE-2025-69652 ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.42.inc                |  2 +
 .../binutils/binutils/CVE-2025-69649.patch    | 44 +++++++++++++++++++
 .../binutils/binutils/CVE-2025-69652.patch    | 39 ++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 3ed80a82924..c93f51e3ee2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,6 +74,8 @@ SRC_URI = "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69644-CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
      file://CVE-2026-6846.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 00000000000..8852ba4cb58
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,44 @@
+From 37c8055eed3178a46417045dda63db7af21fd046 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+	PR 33697
+	* readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+Note:
+  The difference between this patch on v2.42 and upstream v2.46 is due to
+  the loop body printing the relocations in-line, which then in commit
+  8e8d0b63ff15896cc2c228c01f18dfcf2a4a9305 have been factored out to a
+  separate 'display_relocations()' function.
+
+  See: [https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff;f=binutils/readelf.c;h=fa0de3a7e0d9c2acc18fe047a7019e09f1ce3894;hp=c1006480b7bc3e83dd87fb20d215342375614af9;hb=8e8d0b63ff15896cc2c228c01f18dfcf2a4a9305;hpb=31c21e2c13d85793b525f74aa911eb28700ed89c]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ binutils/readelf.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 5e4ad6ea6ad..8c1987ffaec 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -8961,9 +8961,9 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found = false;
+ 
+-      for (i = 0, section = filedata->section_headers;
+-	   i < filedata->file_header.e_shnum;
+-	   i++, section++)
++      section = filedata->section_headers;
++      if (section != NULL)
++	for (i = 0; i < filedata->file_header.e_shnum; i++, section++)
+ 	{
+ 	  if (   section->sh_type != SHT_RELA
+ 	      && section->sh_type != SHT_REL
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 00000000000..a3380ae4206
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,39 @@
+From cb4f8fe24cc86a9f050be4cf9c619940f632ea6a Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+	PR 33701
+	* dwarf.c (process_debug_info): Set debug_info_p NULL when
+	DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 615e051b2bf..13b11b46e41 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4222,9 +4222,11 @@ process_debug_info (struct dwarf_section * section,
+ 	      break;
+ 	    }
+ 
+-	  debug_info *debug_info_p =
+-	    (debug_information && unit < alloc_num_debug_info_entries)
+-	    ? debug_information + unit : NULL;
++	  debug_info *debug_info_p = NULL;
++	  if (debug_information
++	      && num_debug_info_entries != DEBUG_INFO_UNAVAILABLE
++	      && unit < alloc_num_debug_info_entries)
++	    debug_info_p = debug_information + unit;
+ 
+ 	  assert (!debug_info_p
+ 		  || (debug_info_p->num_loc_offsets
+-- 
+2.34.1
+

