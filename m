Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92A0C369C7
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:14:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.29951.1744834467443698620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YKt+1of2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224171d6826so1128445ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744834467; x=1745439267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DHdgkOigIHUPBIJS/nV/J/TMKCJhBORttNFAxWcYBA=;
        b=YKt+1of27343PGjVmhv5qP+ketUR7QCyqquR0hOqFAWNt4orqggqBrmdLFtpaGxG+Y
         2JzpV83tTUfGsA44OEIc38I3lRbW/KLpPOrg6aR95tDzmm4tsZzp6ibEiXvUG6Wthtcf
         memXC7U20E1iXqbTOZkmeoo56x43JMGlONKJ2CQh/jKVwAHApWg+7u0bIksLruCAcVW3
         AP6GhBoO7154NYDbOYxFvL3TNPoXlf1pM0AGlxxIt1V/JZqHvN8o6c1P7i/A4dttMhIA
         T4khUld8pvQR4C1qXWneJFgKeejX4q8sT5hQq1O5QnIJqujlh/F8du48EYx0SGA1UPNi
         zp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834467; x=1745439267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DHdgkOigIHUPBIJS/nV/J/TMKCJhBORttNFAxWcYBA=;
        b=uWX8y5EkohC5ipUGkzVxR7tfFUTrCR3NeXYM6F0AYNAPONICzUVXLgfMBPxz6LnTPq
         wewzwRdmTCYeeieOTixLys2ePFNlh14z0EqSTXqQmjvj5NX8m1l+ilGRXwd1NinBnzrZ
         jFLXHzXBWFCpAAtqpBkG5IOxrSfvw6q41S32rAbXYs5dTTLaFN+tFdQaBVui0Hm7FHbU
         wbrlVgcfXqYhsdTSw0MQ4+as6eNNmbBhdZubyATUjOxFdylxbmIBxLkBHySEkuIbw4h7
         ZhhHO2vc0lmY2sFqwx40JfhGznF9v+yEZweV7UJRAp9SPVCDQAfeKVK0wB9cvzzeqqnT
         3gSA==
X-Gm-Message-State: AOJu0Yw0FrSb0mbTFLi3JXH0858oP93A388QguxzqVDg4LbOWU3jr9sg
	c8CbaR5bPO8+lmJkqVVQxK70aDqwzGwAkoX+EgBz3rM8+qhRISYi4DDLcospuDG79nRL/Ag+d1S
	y
X-Gm-Gg: ASbGncu14+6KEi67FLNvyOLNlVYWIV1Uyihbw1C7OsywOO0IscxcbB4gGSzQnr/hXX4
	xSYiZTZNE4xRrPuYrOBn50yIbJ73NTdoOyIgWjH9T1WeWrYnyCChjBDuoQ24WEMkIDT+zz23PYU
	fhtUDuv1bvra3jJ/IpU+Rlmj6Wxb9V6dgHq3FPZMqabe5JTHQAvk0UtSQ0A1IhuKg7Mid+Pxc9r
	B0afuh9kXoZVs83djedbu5fUJYK+DugIkvyxuVrJ/GN+C0POXoCekCVhXR7GMJe6v9Lfh5EVQqj
	LJhlCv+QYLoxxvZtSbxsLOIQ0Y1tTW8RBQfAASnpG1M=
X-Google-Smtp-Source: AGHT+IES2m1uM4BXPH0+NMAAFk8W5kIbPFwCJp7JgeFyoO8aZO1Dlk2Jp9cGFeCzjx/J1TXoPj3H4g==
X-Received: by 2002:a17:902:ec83:b0:224:255b:c92e with SMTP id d9443c01a7336-22c358c5a60mr40660025ad.3.1744834466623;
        Wed, 16 Apr 2025 13:14:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aeb8:30c6:2c5c:85aa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b222029ccsm1703880a12.62.2025.04.16.13.14.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:14:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/6] binutils: patch CVE-2025-1178 & CVE-2024-57360
Date: Wed, 16 Apr 2025 13:14:12 -0700
Message-ID: <36b994258fc8546e710ddc78cbf8ff09544744e3.1744834364.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744834364.git.steve@sakoman.com>
References: <cover.1744834364.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215010

From: Ashish Sharma <asharma@mvista.com>

Backport Fixes for:

*CVE-2025-1178 - Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]

*CVE-2024-57360 - Upstream-Status: Backport from  [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=5f8987d3999edb26e757115fe87be55787d510b9]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


