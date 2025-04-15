Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83897C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 08:58:52 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.15520.1744707527922892414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 01:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jQ0gvgUf;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af579e46b5dso3824312a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 01:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744707527; x=1745312327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLzs1SfHd2g44vdid21jGRn2cSIS0hPk9ZgKcaFVTk0=;
        b=jQ0gvgUfbkPz6OXCwih+zWyqEHgF7qUwIdeLI9nwD6pFKZimptRlzi3fiOCPO1Vk/E
         rWgdBYJGlreNFPVgnfTsgOJ6w3z7fomd+M0rC9ELV1RXbCLHPAhby4+rWWtxKvGDMUgC
         VVLVZE4yTHpy1uw4K5YPcUYWxd/aqlCZe3NbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707527; x=1745312327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLzs1SfHd2g44vdid21jGRn2cSIS0hPk9ZgKcaFVTk0=;
        b=w6eBuMl73tw5GIycaXXrMYoNvXMy8HbqqtzyNCSBZD+EBUW2mAGQDvIqfMPPfmr8JK
         Bwd8ivlG7BGapSAPArUYx2sNuknmNKeXmnfQAO1kjdI0DDdbxy0XqHZmP1sCJLDa4fOY
         E5Sa/YH7jg5onj5nRXEyt0r8qrVGXTc0bzqTOcf0pEByJIj9CicxqGSEOHitWcASUE0i
         fRpDCl0II8fL3aAxirNnzk9Hpu8rDAUo40/JOO+SJwaXNJLZOlJxU7qzgub4d7SiInKa
         7idv0ecSBDroPEG07glGvAuGY1PaZ9l+JvxfAq5hxzcsuc1rTf8KZ6iSv/NN3qafkjFv
         3hdw==
X-Gm-Message-State: AOJu0YyJEbOz0e/G+ndZNQZDqwyXHN6sxqpDqez7boHCXNji5zOyuPrI
	odsOhYT6T7sRNO0afEgUJxt+bXkkq9dQ7In73bF+25R40Gaoa59HZ50Q/+TEsP9WHVmrIyM0/59
	x/pQ=
X-Gm-Gg: ASbGncvPHyp1w5hiFFmq6/HQs1mrHi+ne6jydb6NTuh77YMwvj1DPejDu7saE+ekJ34
	I5dWjMCgfMETXAbOm1/SlLMsH4/eZUEGtFcE7dpRwJ3uVm9YcFqZLXLKmR6huO3J+edtyuy1/0X
	9ObyKYRhPGMlTH/2+0Lbtq/yFzTuUKIJk7q+qBTkbBjBGKuHVUHPVa5/X3R9ZEKC1Z/1RVpQk1d
	SJ9MoDqUmmuZyjwAQZT0wlyfuP9ls2FfiX7s1ueE3F5DeqzcS9QOKPRquR/8r1BLYKEBWrG2JM4
	5gz1RMovhvVpqparwINiiwZJTgYA6iCZvDQKMg==
X-Google-Smtp-Source: AGHT+IHUAmp5jsGt86TBXPK0OVKv9MNrcjQTYOQ2Lj/uuYmKvVDHOt4LSAg8VaC5sHBMYGa1lD6jTA==
X-Received: by 2002:a05:6a21:32a2:b0:1f5:7007:9eb7 with SMTP id adf61e73a8af0-20179983274mr24532852637.37.1744707526603;
        Tue, 15 Apr 2025 01:58:46 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c31:8d4d:603b:3076:e232:176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a321edf6sm10495077a12.65.2025.04.15.01.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 01:58:46 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Tue, 15 Apr 2025 14:28:41 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] binutils: patch CVE-2025-1178 & CVE-2024-57360
Date: Tue, 15 Apr 2025 14:28:39 +0530
Message-Id: <20250415085839.1200820-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214831

Backport Fixes for:

*CVE-2025-1178 - Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]

*CVE-2024-57360 - Upstream-Status: Backport from  [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=5f8987d3999edb26e757115fe87be55787d510b9]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../binutils/binutils-2.42.inc                |  2 +
 .../binutils/binutils/CVE-2024-57360.patch    | 75 +++++++++++++++++++
 .../binutils/binutils/CVE-2025-1178.patch     | 38 ++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2024-57360.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1178.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 0ca00552ce..d366350556 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -40,5 +40,7 @@ SRC_URI = "\
      file://0017-dlltool-file-name-too-long.patch \
      file://0018-CVE-2025-0840.patch \
      file://CVE-2025-1176.patch \
+     file://CVE-2025-1178.patch \
+     file://CVE-2024-57360.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2024-57360.patch b/meta/recipes-devtools/binutils/binutils/CVE-2024-57360.patch
new file mode 100644
index 0000000000..6d9720414b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2024-57360.patch
@@ -0,0 +1,75 @@
+From 5f8987d3999edb26e757115fe87be55787d510b9 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 17 Dec 2024 09:18:57 +0000
+Subject: [PATCH] nm: Avoid potential segmentation fault when displaying
+ symbols without version info.
+
+PR 32467
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]
+CVE: CVE-2024-57360
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ binutils/nm.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/binutils/nm.c b/binutils/nm.c
+index faf27c59b4d..0ba7604d34f 100644
+--- a/binutils/nm.c
++++ b/binutils/nm.c
+@@ -682,7 +682,7 @@ print_symname (const char *form, struct extended_symbol_info *info,
+ 	       const char *name, bfd *abfd)
+ {
+   char *alloc = NULL;
+-  char *atver = NULL;
++  char *atname = NULL;
+ 
+   if (name == NULL)
+     name = info->sinfo->name;
+@@ -690,9 +690,19 @@ print_symname (const char *form, struct extended_symbol_info *info,
+   if (!with_symbol_versions
+       && bfd_get_flavour (abfd) == bfd_target_elf_flavour)
+     {
+-      atver = strchr (name, '@');
++      char *atver = strchr (name, '@');
++
+       if (atver)
+-	*atver = 0;
++	{
++	  /* PR 32467 - Corrupt binaries might include an @ character in a
++	     symbol name.  Since non-versioned symbol names can be in
++	     read-only memory (via memory mapping of a file's contents) we
++	     cannot just replace the @ character with a NUL.  Instead we
++	     create a truncated copy of the name.  */
++	  atname = xstrdup (name);
++	  atname [atver - name] = 0;
++	  name = atname;
++	}
+     }
+ 
+   if (do_demangle && *name)
+@@ -703,9 +713,7 @@ print_symname (const char *form, struct extended_symbol_info *info,
+     }
+ 
+   if (unicode_display != unicode_default)
+-    {
+-      name = convert_utf8 (name);
+-    }
++    name = convert_utf8 (name);
+ 
+   if (info != NULL && info->elfinfo && with_symbol_versions)
+     {
+@@ -726,8 +734,8 @@ print_symname (const char *form, struct extended_symbol_info *info,
+ 	}
+     }
+   printf (form, name);
+-  if (atver)
+-    *atver = '@';
++
++  free (atname);
+   free (alloc);
+ }
+ 
+-- 
+2.43.5
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1178.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1178.patch
new file mode 100644
index 0000000000..a68a5e1c3c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1178.patch
@@ -0,0 +1,38 @@
+From 75086e9de1707281172cc77f178e7949a4414ed0 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 13:26:51 +0000
+Subject: [PATCH] Prevent an abort in the bfd linker when attempting to
+ generate dynamic relocs for a corrupt input file.
+
+PR 32638
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]
+CVE: CVE-2025-1178
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ bfd/elf64-x86-64.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 61334c3ab04..32db254ba6c 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -5303,6 +5303,15 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 
+       if (generate_dynamic_reloc)
+ 	{
++	  /* If the relgot section has not been created, then
++	     generate an error instead of a reloc.  cf PR 32638.  */
++	  if (relgot == NULL || relgot->size == 0)
++	    {
++	      info->callbacks->einfo (_("%F%pB: Unable to generate dynamic relocs because a suitable section does not exist\n"),
++					output_bfd);
++	      return false;
++	    }
++	  
+ 	  if (relative_reloc_name != NULL
+ 	      && htab->params->report_relative_reloc)
+ 	    _bfd_x86_elf_link_report_relative_reloc
+-- 
+2.43.5
+
-- 
2.34.1


