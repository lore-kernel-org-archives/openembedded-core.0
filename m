Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD7ACFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:47:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22807.1764262028267402350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emCBzW1Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2956d816c10so12263115ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 08:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764262027; x=1764866827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/EAiBc1SnaiazvEgqkenJePLTALU6U2AgbQt7EnRXM=;
        b=emCBzW1Y8irPZJYrAd0Z3A+X1fiqaPPHH/1q5i+O6IlINAe11hgFgdMYzOcVqs4E5D
         r+188VVLuWOm1uLqIKGzal+5EtfLKKPrg/p1uHysie8ices1dzXMBSBg0NXtXAIaJAjd
         OrGJZO/ytIKkNUGxZtWhidSAjdtHin8wcOcCYkpqTgeT1h/w3CwPsAgHW5GjmG5NPzjF
         XRaCqRcrycwcW5ExMFQP81MmffZi0SrUYubj1hQCXGT7oYq7Hgkn+6XUDqcc9s/EUf1A
         xEzINZDACkSm7ZeBpFsP5DeQmKGgZsFOC6ASrrqSJaqZNpHUjYYFjuIVyIxl7PB4mchQ
         GM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262027; x=1764866827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/EAiBc1SnaiazvEgqkenJePLTALU6U2AgbQt7EnRXM=;
        b=HYF17kEvwdiFB/lvlyLSRJR3VwLOZuzdE34Y4wXxVZzH/R8IiUY6B01R6jo1wiItjk
         l+6IZXeQYEDpP7lrXtQAxna595XxxDGbJFp/qORNhcIIdJ1jkfBI9d3MUlfqTIeQ1SXi
         aE9LLMYDvP66Yr/K1F1D6wfJ+xaD6LJkDmPTKSZVyBGsYHWOHjjIRj8T7S+hziO9d8jT
         bKaN7UBLcY/Gu5+Zct0Ilf0U7H/GP3CjIrdBRA9azrBArRclQw1ftoOqm3e5oueKW2US
         dbayAhRPlAeQhVBTk0HoHjrwql4y1BavgT9EVzVV28GMYhw0iXvIZbRRWZ3EcybEIjI0
         VZqA==
X-Gm-Message-State: AOJu0YwlIBUYtktFR73a0y6R257/GgdLxNLXcLHeMps26nte5gybfH7T
	PDoQvlSCbDMu8HzSiGRTntzfXdVldDPi5aDRs2P5aV/TFSVfMJNYPRBBMCdcFA==
X-Gm-Gg: ASbGnct2rtKc6meCs9gRH1SV+m6cCYPREfKkCuZBuL0FEFTkDkfbH4F1qXtqFDvvGSn
	kLDGTiskpxkw2E4jUH/HSUcpSUdsQnyKUyJVQA7b0bsH1FGZDbUNQ3DlNhN22kaNKUoYCv7vkxY
	z1A2sGADhlzwcV1+RmVE8k5/+fMNTcoXFJ3mUOXCViEqEXXcXm47SVxfQfNOzNm/J345D9IfNO1
	qgokOB45Km0GmeeKKNFoHx/nbYwryqTpSM8w1qqaWtI6rhyaQvPG+I21vanYDlLuesXcYPhEbSi
	cTu3cSJbk7HKzle88mlVgJ9xYcywTIq2mApW2NyrttOuhZiNQ9IgM+s8LlyGPrMg3Ttr3JlYAYI
	9cEhZWoj4MLT33G8AAo3mpu8M+TFRVOgAVUhrKq4ypO337t/lpUUof42HmGoHTcz3RTTNaZR9Oo
	9C0dtZdpTCuRttbGH381fCUJ+mEIXhpnoo4p8AfaM7e74+N0e3rIXY/D6/Es7GvmJDwYo9X2lUx
	JYxY6hUGR6uuV3V8Bnhpzo+DVhVyY5t
X-Google-Smtp-Source: AGHT+IFEyMbkIsrVHjx5W4j8F1HcTbBOpdIv/etC+w+Zqf7IBmjKS3U11TybcrT5mBoKG7yNglF3sQ==
X-Received: by 2002:a05:7023:b16:b0:119:e56c:189f with SMTP id a92af1059eb24-11c9d60ec70mr17042162c88.7.1764262027150;
        Thu, 27 Nov 2025 08:47:07 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm7483741eec.4.2025.11.27.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:47:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Fix aarch64 BTI/GCS build issue with glibc 2.43
Date: Thu, 27 Nov 2025 08:47:04 -0800
Message-ID: <20251127164704.2290563-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 16:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226851

Backport a patch to use BTI and GCS functions with
const qualifier

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 ...onstify-BTI-and-GCS-report-functions.patch | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-aarch64-constify-BTI-and-GCS-report-functions.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index acc3f17dc13..77c11b687e6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -36,6 +36,7 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+	 file://0001-aarch64-constify-BTI-and-GCS-report-functions.patch \
      file://0015-CVE-2025-11081.patch \
      file://0016-CVE-2025-11082.patch \
      file://0017-CVE-2025-11083.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0001-aarch64-constify-BTI-and-GCS-report-functions.patch b/meta/recipes-devtools/binutils/binutils/0001-aarch64-constify-BTI-and-GCS-report-functions.patch
new file mode 100644
index 00000000000..adbcdb08dde
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-aarch64-constify-BTI-and-GCS-report-functions.patch
@@ -0,0 +1,74 @@
+From 0b5fa602e8a06293da734b80b0bc0a3421ed3bd4 Mon Sep 17 00:00:00 2001
+From: Matthieu Longo <matthieu.longo@arm.com>
+Date: Wed, 19 Nov 2025 17:01:56 +0000
+Subject: [PATCH] aarch64: constify BTI and GCS report functions
+
+This patch consitifies the arguments of the functions used to report BTI
+and GCS errors, and also renames the argument "ebfd" to "abfd" as this
+naming is confusing and inconsistent with others places.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=12856136986380efff1dcba2ecd3be80e482ff15]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ bfd/elfxx-aarch64.c | 13 ++++++++-----
+ bfd/elfxx-aarch64.h |  4 ++--
+ 2 files changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/bfd/elfxx-aarch64.c b/bfd/elfxx-aarch64.c
+index 551f74e3373..cb4566386ce 100644
+--- a/bfd/elfxx-aarch64.c
++++ b/bfd/elfxx-aarch64.c
+@@ -1098,7 +1098,8 @@ _bfd_aarch64_elf_link_fixup_gnu_properties
+
+ /* Check AArch64 BTI report.  */
+ void
+-_bfd_aarch64_elf_check_bti_report (struct bfd_link_info *info, bfd *ebfd)
++_bfd_aarch64_elf_check_bti_report (const struct bfd_link_info *info,
++				   const bfd *abfd)
+ {
+   struct elf_aarch64_obj_tdata *tdata = elf_aarch64_tdata (info->output_bfd);
+
+@@ -1117,14 +1118,16 @@ _bfd_aarch64_elf_check_bti_report (struct bfd_link_info *info, bfd *ebfd)
+     : _("%X%pB: error: BTI is required by -z force-bti, but this input object "
+ 	"file lacks the necessary property note.\n");
+
+-  info->callbacks->einfo (msg, ebfd);
++  info->callbacks->einfo (msg, abfd);
+ }
+
++/* Check AArch64 GCS report.  */
+ void
+-_bfd_aarch64_elf_check_gcs_report (struct bfd_link_info *info, bfd *ebfd)
++_bfd_aarch64_elf_check_gcs_report (const struct bfd_link_info *info,
++				   const bfd *abfd)
+ {
+   struct elf_aarch64_obj_tdata *tdata = elf_aarch64_tdata (info->output_bfd);
+-  bool dynamic_obj = (ebfd->flags & DYNAMIC) != 0;
++  bool dynamic_obj = (abfd->flags & DYNAMIC) != 0;
+
+   if (dynamic_obj)
+     {
+@@ -1161,5 +1164,5 @@ _bfd_aarch64_elf_check_gcs_report (struct bfd_link_info *info, bfd *ebfd)
+       : _("%X%pB: error: GCS is required by -z gcs, but this input object file "
+ 	  "lacks the necessary property note.\n");
+
+-  info->callbacks->einfo (msg, ebfd);
++  info->callbacks->einfo (msg, abfd);
+ }
+diff --git a/bfd/elfxx-aarch64.h b/bfd/elfxx-aarch64.h
+index bd3642cbefe..35033059299 100644
+--- a/bfd/elfxx-aarch64.h
++++ b/bfd/elfxx-aarch64.h
+@@ -247,10 +247,10 @@ _bfd_aarch64_elf_merge_gnu_properties (struct bfd_link_info *, bfd *,
+ 				       uint32_t);
+
+ extern void
+-_bfd_aarch64_elf_check_bti_report (struct bfd_link_info *, bfd *);
++_bfd_aarch64_elf_check_bti_report (const struct bfd_link_info *, const bfd *);
+
+ extern void
+-_bfd_aarch64_elf_check_gcs_report (struct bfd_link_info *, bfd *);
++_bfd_aarch64_elf_check_gcs_report (const struct bfd_link_info *, const bfd *);
+
+ extern void
+ _bfd_aarch64_elf_link_fixup_gnu_properties (struct bfd_link_info *,

