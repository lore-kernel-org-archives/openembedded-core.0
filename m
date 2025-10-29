Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5351CCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web01.13556.1761768732892540694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZqjzxY6i;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a28c7e3577so312903b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761768732; x=1762373532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owM1nPLVYeik8s31o7qM+1c1lBRkY4mnCK0DClm3/tU=;
        b=ZqjzxY6ixFMwaVnxulwgfrResnADOkTuDtPIMLP3XQvBVKWescQl40rSJ1J521ZDoD
         J2y36RlGU61axiX/B/y5l+HY+/gnC38YRItMNQe2kEXhbrykWwJwUUnqAvBJZ5+kkmHO
         l29loOAFY7zq0y8fxgtUwXlMiZsmt7Dh2V3bAERs/8zknode5wBsbpd+DNnKrv66ISqf
         tdw4qdskOXyQwL5mBHPzYklv38pFCW/WND5/jmD1d+3YbWtRG1gEht+73L2Vby6L6u6Z
         Ba8a3NLLPEi3+K0WE/MQo6KmSUZIM4qSK7F5e3WGVkqWqsZgKHuYZnyEprYXh0nlj8wW
         QzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768732; x=1762373532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owM1nPLVYeik8s31o7qM+1c1lBRkY4mnCK0DClm3/tU=;
        b=gSIsNCK5xRaNBwsaojmcM72IV8AagacQLjkwYFUZ8NAeGFY+RY/UkpdTZt3+uiscl+
         vGCf8Q80ZDQnDv9q5dhJJ7+/V6FxWSXt1GT9vXEfx1/Qzw+GACdziRB7+Ezl+8GA9U5g
         QYQJW4RshpVdsmgGwttIlyFCbuCB4WU8P0ROPhcmhp2MPJzfKKkYlMFR9FcoWOGX7U4U
         CL0xj6cUal2Rhv4YUyjn4zkddSYwcqIdN+EiMFEZthYkVOf0lxGUze5/7AxVhypRojgl
         H8AbzfN0WV2o7LFq4g62eW7KS+rxAKPCwLDihnFobBeBq/6hRlNOETIDHDR/Wjx60g7+
         vuXg==
X-Gm-Message-State: AOJu0YzuaO0f9QQOQpnM0Qg/2dGnfAeWxRm03WYnCDCHqCecUFjOCs84
	Oh/seSMKdYIodhjeGPAVSvIyof+T+JgdKf5lNJSqiIGPb9zVSJFdUsWcPb8ppCv8JepZFB7crO2
	05nBY02U=
X-Gm-Gg: ASbGnctGQf3VwpMBRwlgyiGAj/+xymlf37wb+COag2j3iD8DPEIl4AL2zb+QInh7+f8
	RQKO4oR/+83BVuhw6givKvDSF4hSU0vp6HkBuh9+a7UHtH5JNQDfm4RxaP4J13hQ9hXnVhXPu5E
	C8aWMpfAINiLnAOkFKZjuKCV2o/G248HFgDni+xNuAprj2lnfIHv+OGcePapmuVElh7//Jg0weV
	g+hnotYf5dH1C7ngxC8aoi86CSfPmQmIeEpHlqfZN8wTKh8iohiGWWKw8FuB8+eoljlbc4TEq/m
	XYNBEGc0rqlXIMJPro4z6EkCCsSQ425Py1kC4pervZp/aoZ4ISrYWHsgAiZQSVo+MWNqk+VJqaC
	JZi75CrcydSRVh0kzhhp1VOCfUDxul3KnA8N4OwTbosKFxTx7d3sN+4hVgrwErlayUB0=
X-Google-Smtp-Source: AGHT+IHoqrifeMzEyDoLjcCPY9qnEbfGaLOc5oy1RNF3KW1w5Yd0WWh2CF4HhEKKNbOrhi2pPPSs2Q==
X-Received: by 2002:a05:6a00:94f5:b0:792:574d:b2c with SMTP id d2e1a72fcca58-7a626526543mr740717b3a.15.1761768731997;
        Wed, 29 Oct 2025 13:12:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm16522100b3a.63.2025.10.29.13.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:12:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/6] binutils: fix CVE-2025-11081
Date: Wed, 29 Oct 2025 13:11:51 -0700
Message-ID: <6ed800208a56d69faf4a1b3458caa8d412f01b89.1761768602.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761768602.git.steve@sakoman.com>
References: <cover.1761768602.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 20:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225466

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-11081

Trying to dump .sframe in a PE file results in a segfault accessing
elf_section_data.

	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
	elf_section_type without first checking the file is ELF.

PR 33406 SEGV in dump_dwarf_section
[https://sourceware.org/bugzilla/show_bug.cgi?id=33406]

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0026-CVE-2025-11081.patch        | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 3e180b6018..5447ab0da4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -61,5 +61,6 @@ SRC_URI = "\
      file://0023-CVE-2025-7545.patch \
      file://0024-CVE-2025-11082.patch \
      file://0025-CVE-2025-11083.patch \
+     file://0026-CVE-2025-11081.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch b/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch
new file mode 100644
index 0000000000..31dbef52fa
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch
@@ -0,0 +1,84 @@
+From f87a66db645caf8cc0e6fc87b0c28c78a38af59b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 9 Sep 2025 18:32:09 +0930
+Subject: [PATCH] PR 33406 SEGV in dump_dwarf_section
+
+Trying to dump .sframe in a PE file results in a segfault accessing
+elf_section_data.
+
+	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
+	elf_section_type without first checking the file is ELF.
+---
+ binutils/objdump.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]
+CVE: CVE-2025-11081
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 290f7e51f66..ee8823da05a 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -4418,6 +4418,10 @@
+   else
+     match = name;
+ 
++  if (bfd_get_flavour (abfd) == bfd_target_elf_flavour
++      && elf_section_type (section) == SHT_GNU_SFRAME)
++    match = ".sframe";
++
+   for (i = 0; i < max; i++)
+     if ((strcmp (debug_displays [i].section.uncompressed_name, match) == 0
+	 || strcmp (debug_displays [i].section.compressed_name, match) == 0
+@@ -4923,6 +4927,36 @@
+ }
+ 
++static void
++dump_sframe_section (bfd *abfd, const char *sect_name, bool is_mainfile)
++
++{
++  /* Error checking for user provided SFrame section name, if any.  */
++  if (sect_name)
++    {
++      asection *sec = bfd_get_section_by_name (abfd, sect_name);
++      if (sec == NULL)
++       {
++         printf (_("No %s section present\n\n"), sanitize_string (sect_name));
++         return;
++       }
++      /* Starting with Binutils 2.45, SFrame sections have section type
++        SHT_GNU_SFRAME.  For SFrame sections from Binutils 2.44 or earlier,
++        check explcitly for SFrame sections of type SHT_PROGBITS and name
++        ".sframe" to allow them.  */
++      else if (bfd_get_flavour (abfd) != bfd_target_elf_flavour
++              || (elf_section_type (sec) != SHT_GNU_SFRAME
++                  && !(elf_section_type (sec) == SHT_PROGBITS
++                       && strcmp (sect_name, ".sframe") == 0)))
++       {
++         printf (_("Section %s does not contain SFrame data\n\n"),
++                 sanitize_string (sect_name));
++         return;
++       }
++    }
++  dump_dwarf (abfd, is_mainfile);
++}
++
+ static void
+ dump_target_specific (bfd *abfd)
+ {
+   const struct objdump_private_desc * const *desc;
+diff --git a/include/elf/common.h b/include/elf/common.h
+--- a/include/elf/common.h
++++ b/include/elf/common.h 
+@@ -528,6 +528,8 @@
+ #define SHT_LOOS	0x60000000	/* First of OS specific semantics */
+ #define SHT_HIOS	0x6fffffff	/* Last of OS specific semantics */
+ 
++#define SHT_GNU_SFRAME	0x6ffffff4	/* SFrame stack trace information.  */
++
+ #define SHT_GNU_INCREMENTAL_INPUTS 0x6fff4700   /* incremental build data */
+ #define SHT_GNU_ATTRIBUTES 0x6ffffff5	/* Object attributes */
+ #define SHT_GNU_HASH	0x6ffffff6	/* GNU style symbol hash table */
-- 
2.43.0


