Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CD0CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 02:54:54 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.35.1761706491188511454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 19:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ri2DpTtw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b8aa14e5ed9so271929a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 19:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761706490; x=1762311290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxMWwjw5HizvErksd0GPrmSu/wB5Faj+mhuwphN4FFg=;
        b=ri2DpTtwfwb5ZE1SEPdtXymSEn59Ib9VvDOiT+WtSZNyMNl03HrnTjnzVHoJKObFCb
         KNLPtHI/21KfOmRGLXT7hlGAJq8ORQwiK9GUCMGbdyVE9T5cX0OgpBRCZdrjSYEVoC+3
         1/PX844olg94nYSt7fsx3JqkGfofacl0kdu8MczE4g4yZALuBHz5O+sRT46+NJ4uQq3q
         n9VZIdTiZbXO14RrIcSTh1NHQcah2tiB/hBfIj9mM8qhKAnwu8A0DnUrgTs9WYk131BA
         P7wWIa2+G1ghcnk5s0RGpJ6WdxzL3FdYt0o7QKadZ81n5JLmnsjS5RSMtT0LFt8JbeVL
         MifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706490; x=1762311290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxMWwjw5HizvErksd0GPrmSu/wB5Faj+mhuwphN4FFg=;
        b=MSOxhXVvut5hsgPULLaEwtRNDIcdSIp/oEfY9AUPYe6638NK/YjoBoTVOBaxwKd3Q6
         UXbYgJdIXrhM/mffahlja5OlcHFj8Phn9l5NDuWFlNLhLk42cLD5YR14dPczI8fkXU6p
         DoMG0bA3weC8L4BMnd2wCzCnA+uqOZjJmsd2wNzsJJQtVqNBrqxlVsTz0DAW2fru8JGC
         etJ/tCQy3s48KLuIw5Scm3TM13T2HwloRlHOrMAd3TF5N9eyDEgWuEJgTVbidzsikTY4
         pCop14SmllG8h9Bi4zQejaPDaLIMSA/BpjIhI58j/qI2lNLdiOUpc3tYQTWLnx60yZ5t
         68Hw==
X-Gm-Message-State: AOJu0YxKr1NGELmbrR0Q3SmzAXe7jLlC65YbW67Jo/zUPHBbD/62QrAZ
	8hVuAhjxv4YkQ4GzZKf+TK+6+RVcpUmSNmbDIMnmrSlmlkMa6sUra5VZyp2+/Q+3L64llLRl0vz
	e17jsonw=
X-Gm-Gg: ASbGncvzDszYiGBVn2KL9JSqLBGT51wnc87fczh2tI/QEWHmUcEgeKzd2fEBry4ENkl
	+W13VPqQsHadv+9dCUENdfgw2r47jQIHea9uEV07Oz20CiwtO89qh+SZAwyzzxV5pUxQWJq2Gqg
	nzj0cnwgh5WQcTVjVPDb1LMBSZITul1xzOMMkFEVxnIWto79ASQJbii0GKmBz/rIz4MEaUa3jEg
	QmR83AP6nHUzGJ6+FwnKiC188Qzk/5+REpxbM01dh1hIedFkzWx22lDX8zoQl+/rwb8CH/J80Au
	N7xi4VXatZA0jLsXPtzm1/qcpLfb2fLcOFeWBwLPwF/n5lwHmOzgbUCPsqUD8eUwjE4peh3DcX1
	fl4liiCF580ozIor4i9Ddbws6R9hzqYeiMB/NhDsYmaq1WW9tjN+9ROeOW8zkEP9jVSw=
X-Google-Smtp-Source: AGHT+IGg+myovbnT8i24g39rCLjCYheWFqlHPnauaSjd0pKT1aaNdzwSE+pphab8gYmfRTuYg4pnxw==
X-Received: by 2002:a17:902:b696:b0:24c:caab:dfd2 with SMTP id d9443c01a7336-294def53dd5mr9313115ad.61.1761706490261;
        Tue, 28 Oct 2025 19:54:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d27345sm131058945ad.54.2025.10.28.19.54.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:54:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] binutils: fix CVE-2025-11081
Date: Tue, 28 Oct 2025 19:54:27 -0700
Message-ID: <a7d39d40ec867bbcc36d71cf98858a34c619c9fe.1761692326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761692326.git.steve@sakoman.com>
References: <cover.1761692326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225423

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
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0046-CVE-2025-11081.patch        | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 2e978edc6f..2444a304be 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -82,5 +82,6 @@ SRC_URI = "\
      file://0043-CVE-2025-7545.patch \
      file://0044-CVE-2025-11082.patch \
      file://0045-CVE-2025-11083.patch \
+     file://0046-CVE-2025-11081.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch b/meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch
new file mode 100644
index 0000000000..31dbef52fa
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch
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


