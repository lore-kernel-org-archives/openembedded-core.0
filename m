Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD18C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 07:15:14 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.18855.1703229307240716961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 23:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BcITTsTX;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-594178b3959so1102758eaf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 23:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703229305; x=1703834105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLEf6OQpkoXvwzEa519DT8Zgrave9liUECfEn0eAn4w=;
        b=BcITTsTXySLULZollIZEod9c96ZHkmyMTptkFzAmhhKgjrzp1bfYJhGBryN3/ozU6y
         dV2CqIJE05vfvghoUoe9Wh153tbDCer35K7ioTf1nlw0/zyFik0vo193CHuhfejUUzVm
         UOjA83eQt47ApZdyzh3fdDS6jw2uE4poGAZ4PrsHNPJjEjuBFVDhJ9JoxGSo28zwr1Hi
         ahYN6TrGVitBmo2pOcdMSzNoA6oUMl3SkFRpUcm2PWMKmlTqo9IXYWT2tE0y4WWNOFTp
         zndt/BLzlpZaSAOvdRCHDIGI2f6RW2mR9aEPoejsBoUW69jnE/CxIHJFfGZDgN0rnb3m
         txbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703229305; x=1703834105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLEf6OQpkoXvwzEa519DT8Zgrave9liUECfEn0eAn4w=;
        b=dZYVAQJZGdZIRLsgeBDB/rJOn/hPF5JHNsUh9WC3eCTYAPX+AT7bHSoXFkV+Rxa0X/
         1GyB5XyI4VaH9jbkHzPWH0UAYt8eazIb5H/815+gpzx+sz4gnZuMmxsDcpOtAqUVPUlG
         rW9qQf3S/RSpdEMGNPRryMM4Qzhq/a5ZGh4s953Z329CMLWYP/pgm3QguwWxDYQr21yE
         7Vn/S89TP3l/OdcVwy0DdyD11D3mDWUPeTKFtCa91wmO0acnkM+fiepYE1UvU35hAvl2
         mRrgnvNrmaogVljiun0vu9xzZNFMgVptjwkucSYv4fDwsl7z661+HgVAiEyU9fsYFMOV
         CMNQ==
X-Gm-Message-State: AOJu0Yz/p9V6hA14OKTwAgwlr8VwXPiFm1sS/FJGSp6AmLlJTPow4pe+
	hvWj1qNrQrqFaFHgzUGRm/yfq9EstEA=
X-Google-Smtp-Source: AGHT+IGiN7KGpm6wnuXUf1uxceSyu3rtdPR0WIxl2c7Ixly+8LhPpoCX54L78bhYWBS2bTN18RhAnw==
X-Received: by 2002:a05:6358:5110:b0:172:9d70:3441 with SMTP id 16-20020a056358511000b001729d703441mr858068rwi.54.1703229305414;
        Thu, 21 Dec 2023 23:15:05 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:1c42:9a2:7919:ad63:823a:e702])
        by smtp.gmail.com with ESMTPSA id z3-20020a170902ee0300b001d3e3a86dccsm2723276plb.84.2023.12.21.23.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 23:15:04 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [dunfell][PATCH] binutils: fix multiple cve
Date: Fri, 22 Dec 2023 12:40:41 +0530
Message-Id: <20231222071041.2925043-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 07:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192862

From: Virendra Thakur <virendrak@kpit.com>

Fix below CVE's
CVE-2022-47007
CVE-2022-47008
CVE-2022-47010
CVE-2022-47011
CVE-2022-48063
CVE-2022-47695

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../binutils/binutils-2.34.inc                |  6 ++
 .../binutils/binutils/CVE-2022-47007.patch    | 32 ++++++++++
 .../binutils/binutils/CVE-2022-47008.patch    | 64 +++++++++++++++++++
 .../binutils/binutils/CVE-2022-47010.patch    | 34 ++++++++++
 .../binutils/binutils/CVE-2022-47011.patch    | 31 +++++++++
 .../binutils/binutils/CVE-2022-47695.patch    | 57 +++++++++++++++++
 .../binutils/binutils/CVE-2022-48063.patch    | 49 ++++++++++++++
 7 files changed, 273 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47007.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47008.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47010.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47011.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-47695.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 4824db6dcf..032263fe63 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -56,5 +56,11 @@ SRC_URI = "\
      file://CVE-2023-25588.patch \
      file://CVE-2021-46174.patch \
      file://CVE-2023-25584.patch \
+     file://CVE-2022-47007.patch \
+     file://CVE-2022-47008.patch \
+     file://CVE-2022-47010.patch \
+     file://CVE-2022-47011.patch \
+     file://CVE-2022-48063.patch \
+     file://CVE-2022-47695.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-47007.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-47007.patch
new file mode 100644
index 0000000000..ddb564bc8c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-47007.patch
@@ -0,0 +1,32 @@
+From 0ebc886149c22aceaf8ed74267821a59ca9d03eb Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 17 Jun 2022 09:00:41 +0930
+Subject: [PATCH] PR29254, memory leak in stab_demangle_v3_arg
+
+	PR 29254
+	* stabs.c (stab_demangle_v3_arg): Free dt on failure path.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb]
+CVE: CVE-2022-47007
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Patch refreshed based on codebase.
+---
+ binutils/stabs.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 2b5241637c1..796ff85b86a 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -5476,7 +5476,10 @@
+ 					  dc->u.s_binary.right,
+ 					  &varargs);
+ 	if (pargs == NULL)
+-	  return NULL;
++         {
++           free (dt);
++           return NULL;
++         }
+ 
+ 	return debug_make_function_type (dhandle, dt, pargs, varargs);
+       }
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-47008.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-47008.patch
new file mode 100644
index 0000000000..9527390ccf
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-47008.patch
@@ -0,0 +1,64 @@
+From d6e1d48c83b165c129cb0aa78905f7ca80a1f682 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 17 Jun 2022 09:13:38 +0930
+Subject: [PATCH] PR29255, memory leak in make_tempdir
+
+	PR 29255
+	* bucomm.c (make_tempdir, make_tempname): Free template on all
+	failure paths.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d6e1d48c83b165c129cb0aa78905f7ca80a1f682]
+CVE: CVE-2022-47008
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Patch refreshed based on codebase.
+---
+ binutils/bucomm.c | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index fdc2209df9c..4395cb9f7f5 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -542,8 +542,9 @@
+ #else
+   tmpname = mktemp (tmpname);
+   if (tmpname == NULL)
+-    return NULL;
+-  fd = open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
++    fd = -1;
++  else
++    fd = open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
+ #endif
+   if (fd == -1)
+     {
+@@ -561,22 +562,23 @@
+ make_tempdir (const char *filename)
+ {
+   char *tmpname = template_in_dir (filename);
++  char *ret;
+ 
+ #ifdef HAVE_MKDTEMP
+-  return mkdtemp (tmpname);
++  ret = mkdtemp (tmpname);
+ #else
+-  tmpname = mktemp (tmpname);
+-  if (tmpname == NULL)
+-    return NULL;
++  ret = mktemp (tmpname);
+ #if defined (_WIN32) && !defined (__CYGWIN32__)
+   if (mkdir (tmpname) != 0)
+-    return NULL;
++    ret = NULL;
+ #else
+   if (mkdir (tmpname, 0700) != 0)
+-    return NULL;
++    ret = NULL;
+ #endif
+-  return tmpname;
+ #endif
++  if (ret == NULL)
++    free (tmpname);
++  return ret;
+ }
+ 
+ /* Parse a string into a VMA, with a fatal error if it can't be
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-47010.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-47010.patch
new file mode 100644
index 0000000000..d831ed4756
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-47010.patch
@@ -0,0 +1,34 @@
+From 0d02e70b197c786f26175b9a73f94e01d14abdab Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 20 Jun 2022 10:39:31 +0930
+Subject: [PATCH] PR29262, memory leak in pr_function_type
+
+	PR 29262
+	* prdbg.c (pr_function_type): Free "s" on failure path.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0d02e70b197c786f26175b9a73f94e01d14abdab]
+CVE: CVE-2022-47010
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Patch refreshed based on codebase.
+---
+ binutils/prdbg.c | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c1e41628d26..bb42a5b6c2d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -778,12 +778,9 @@
+ 
+   strcat (s, ")");
+ 
+-  if (! substitute_type (info, s))
+-    return FALSE;
+-
++  bfd_boolean ret = substitute_type (info, s);
+   free (s);
+-
+-  return TRUE;
++  return ret;
+ }
+ 
+ /* Turn the top type on the stack into a reference to that type.  */
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-47011.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-47011.patch
new file mode 100644
index 0000000000..250756bd38
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-47011.patch
@@ -0,0 +1,31 @@
+From 8a24927bc8dbf6beac2000593b21235c3796dc35 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 20 Jun 2022 10:39:13 +0930
+Subject: [PATCH] PR29261, memory leak in parse_stab_struct_fields
+
+	PR 29261
+	* stabs.c (parse_stab_struct_fields): Free "fields" on failure path.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8a24927bc8dbf6beac2000593b21235c3796dc35]
+CVE: CVE-2022-47011
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Patch refreshed based on codebase.
+---
+ binutils/stabs.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 796ff85b86a..bf3f578cbcc 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -2368,7 +2368,10 @@
+ 
+       if (! parse_stab_one_struct_field (dhandle, info, pp, p, fields + c,
+ 					 staticsp, p_end))
+-	return FALSE;
++       {
++         free (fields);
++         return FALSE;
++       }
+ 
+       ++c;
+     }
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-47695.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-47695.patch
new file mode 100644
index 0000000000..101a4cdb4e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-47695.patch
@@ -0,0 +1,57 @@
+From 3d3af4ba39e892b1c544d667ca241846bc3df386 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 4 Dec 2022 22:15:40 +1030
+Subject: [PATCH] PR29846, segmentation fault in objdump.c compare_symbols
+
+Fixes a fuzzed object file problem where plt relocs were manipulated
+in such a way that two synthetic symbols were generated at the same
+plt location.  Won't occur in real object files.
+
+	PR 29846
+	PR 20337
+	* objdump.c (compare_symbols): Test symbol flags to exclude
+	section and synthetic symbols before attempting to check flavour.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=3d3af4ba39e892b1c544d667ca241846bc3df386]
+CVE: CVE-2022-47695
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Patch refreshed based on codebase.
+---
+ binutils/objdump.c | 23 ++++++++++-------------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index e8481b2d928..d95c8b68bf0 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -935,20 +935,17 @@
+ 	return 1;
+     }
+ 
+-  if (bfd_get_flavour (bfd_asymbol_bfd (a)) == bfd_target_elf_flavour
++  /* Sort larger size ELF symbols before smaller.  See PR20337.  */
++  bfd_vma asz = 0;
++  if ((a->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0
++      && bfd_get_flavour (bfd_asymbol_bfd (a)) == bfd_target_elf_flavour)
++    asz = ((elf_symbol_type *) a)->internal_elf_sym.st_size;
++  bfd_vma bsz = 0;
++  if ((b->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0
+       && bfd_get_flavour (bfd_asymbol_bfd (b)) == bfd_target_elf_flavour)
+-    {
+-      bfd_vma asz, bsz;
+-
+-      asz = 0;
+-      if ((a->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0)
+-	asz = ((elf_symbol_type *) a)->internal_elf_sym.st_size;
+-      bsz = 0;
+-      if ((b->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0)
+-	bsz = ((elf_symbol_type *) b)->internal_elf_sym.st_size;
+-      if (asz != bsz)
+-	return asz > bsz ? -1 : 1;
+-    }
++    bsz = ((elf_symbol_type *) b)->internal_elf_sym.st_size;
++  if (asz != bsz)
++    return asz > bsz ? -1 : 1;
+ 
+   /* Symbols that start with '.' might be section names, so sort them
+      after symbols that don't start with '.'.  */
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch
new file mode 100644
index 0000000000..f41c02a02b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-48063.patch
@@ -0,0 +1,49 @@
+From 75393a2d54bcc40053e5262a3de9d70c5ebfbbfd Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 21 Dec 2022 11:51:23 +0000
+Subject: [PATCH] Fix an attempt to allocate an unreasonably large amount of
+ memory when parsing a corrupt ELF file.
+
+	PR  29924
+	* objdump.c (load_specific_debug_section): Check for excessively
+	large sections.
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=75393a2d54bcc40053e5262a3de9d70c5ebfbbfd]
+CVE: CVE-2022-48063
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+Comment: Patch refreshed based on codebase.
+---
+ binutils/ChangeLog | 6 ++++++
+ binutils/objdump.c | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index e7f918d3f65..020e09f3700 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2022-12-21  Nick Clifton  <nickc@redhat.com>
++
++	PR  29924
++	* objdump.c (load_specific_debug_section): Check for excessively
++	large sections.
++
+ 2021-02-11  Alan Modra  <amodra@gmail.com>
+ 
+ 	   PR 27290
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index d51abbe3858..2eb02de0e76 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -3479,7 +3479,9 @@
+   section->size = bfd_section_size (sec);
+   /* PR 24360: On 32-bit hosts sizeof (size_t) < sizeof (bfd_size_type). */
+   alloced = amt = section->size + 1;
+-  if (alloced != amt || alloced == 0)
++  if (alloced != amt
++      || alloced == 0
++      || (bfd_get_size (abfd) != 0 && alloced >= bfd_get_size (abfd)))
+     {
+       section->start = NULL;
+       free_debug_section (debug);
+
-- 
2.25.1


