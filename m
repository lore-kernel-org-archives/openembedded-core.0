Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB14C47074
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 02:30:36 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.94151.1703644233394844058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 18:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WyzXAMn6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3772419a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 18:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703644232; x=1704249032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8cxxd+BE5qAzUQpPi0BSoK64qMNTo+4ZPLGLPdzKRc=;
        b=WyzXAMn6WuBdggUrUApZZTOnd0M1G2LAiWmyQgEHpCWhmT0uZmRpuVxpaT44bPopDn
         CBSPBhTpiMSH6ddRpT2JHETIFLHKhsrnsw8zX08E+zKC5qC0jfI28Tg0zlZKfF747bR3
         EKnf1uH9m8zdkDhc5yAlnP1I+9Bd0avpMBiyzJstePZvfKtA3jrV5ZrG6dJ3B6YYHm+Q
         qvzN1QdSlUIum2gDkzQyuqxpw4E4FVa8hgTN09bGVWJQEhaat7V/1lSTBsj+zK4Do2YY
         V8pQUS6VH6rcqKaUiW4/SuposFqSDIFs1/m5cPOv7X010c6nUTSHy3ch3FrgzpqSDBnV
         +oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644232; x=1704249032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8cxxd+BE5qAzUQpPi0BSoK64qMNTo+4ZPLGLPdzKRc=;
        b=E9xLWP8Na9lY/PKIeidLKS0bGQDqf68pykUaHlcnLzS/hRzL8tbBAoSyH8mLHUZDqN
         AQ7djuy078WHzKW4xu3ix8+amQ7eaN4bnbLaHFygeTq/oS4OSv+OgGKJW9zzjNCxGv+D
         F8/7Ip/2p9A1iyjyp9ip6sZ84RV9npIcwKAFlWD9xeKG0NM0pluFrFBaDJ8FfYWPFd6x
         fyuXTsV08JCL6k+KqhVm44yQv7lkXEFgdma/CCZdn2izlabFWOtiv0l/qeYtev9uoX6M
         mB64ubR9Sg3YDluMXSl4feJ6WrOL0gIKT6cw9A+oykCS1VRUkj+ya7QteTZm9PwljC0y
         Cxcg==
X-Gm-Message-State: AOJu0Yx9+Kh1z98bME+WnFjHoBBFDAx+KIlazh3LEfbCwvOFYKTLWlkw
	kOMVsOcV4M/OkTfp6lkeBmK01WJTT9Q3xdsyWTL2FKFrGGymPQ==
X-Google-Smtp-Source: AGHT+IFmJaXA+6AP0m3mGpwnnsxrjPppZqdyjxC068r1iiQHCKsCxfi+r3DAVRk1H9jSUf6BADWzfw==
X-Received: by 2002:a05:6a20:734b:b0:18f:e389:f65c with SMTP id v11-20020a056a20734b00b0018fe389f65cmr11509194pzc.75.1703644231807;
        Tue, 26 Dec 2023 18:30:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id z188-20020a6265c5000000b006d095553f2asm10982400pfb.81.2023.12.26.18.30.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:30:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] binutils: fix multiple cve
Date: Tue, 26 Dec 2023 16:30:18 -1000
Message-Id: <873163936937a583278e3cd97c6226935f2faa0c.1703644078.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703644078.git.steve@sakoman.com>
References: <cover.1703644078.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 02:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192918

From: Virendra Thakur <virendrak@kpit.com>

Fix below CVE's
CVE-2022-47007
CVE-2022-47008
CVE-2022-47010
CVE-2022-47011
CVE-2022-48063
CVE-2022-47695

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


