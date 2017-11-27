Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id D356D78382
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:37 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id b12so7594063plm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nPKlQZW+84BSnxIwJQKLt954qWqlLPzAMDWkZSP61Hk=;
	b=DXtjwZB88CkeWxieRT9Ls1M+OkTCObIdBGvTxXn1wWONGIVdD/Wm6YmY05lxFIjA2M
	qER5gjG91q+2pgstJht6cG0wDz/Ypjr9NM715WVXNaNv5UKwiXjKilNB666bWM55u0MY
	eTZ9D72HP5kVo7ZDW6ZoHmElg90uYAklbgf+JpiSbjDpcK3+SRX/eGZUEMTmZvQ54qc0
	Oko+NCsgGoqfiOGMgCjUa3adfYzbCsVcMs6QjSxeEJ4xDdU6YfE1CxLKKCrUwEPkg8Ea
	WET5HNS8GMuFgxHGV4TwLTLP4ketCiXmDoLZKDR5+HC4LwYmEmKLl1uv7TFM2qUYuy/c
	0cUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nPKlQZW+84BSnxIwJQKLt954qWqlLPzAMDWkZSP61Hk=;
	b=bTo6Jln6YIklwawnvEipakpHbsrDjFgM3lS44bvitwyPEtLnPy9tZqiKOZohYPMVEP
	eJLRQVxzq+51ro0pbT6OAoePZxlKjJj4DvvNfQlJKLvAcjRoLkFZqjAu9DPF5sI1FqzG
	g/Uf0VOu60OaMzkXxZo0KDMthWPvgCeULofICRQ5GT3ijSOsjqjPMG3aGfWZbwhpUu/M
	h9CR9bu/yR2CoYidSBMpoEmM/H+sGYsNR9FxHMqyuNAjbjVdJID9KHbC4GvTmBGJiyxh
	cOTeSB1+6kPQ0cpvU5bb/PBRWpSh/AfhQ8Ial6yJv8QRcyuwHEHBmvW82fJLPmUxqMOt
	bDhA==
X-Gm-Message-State: AJaThX7SJoToodSpSJGbQFrAqUVpZLHT5wkHNt4o9M+YdOdI0sxdd0AH
	SQrYqBO/tGc8vlrYaYT5ZKs=
X-Google-Smtp-Source: AGs4zMaP8x5dhs4NWY1inIQw+E9/vI73xLuKEi+zC0d0XLA+cH2oM/LtBwTgqG3WW+lTAzlng3Moaw==
X-Received: by 10.84.233.207 with SMTP id m15mr36107940pln.424.1511750138213; 
	Sun, 26 Nov 2017 18:35:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:12 -0800
Message-Id: <1511750112-2263-26-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 26/26] binutls: Security fix for CVE-2017-9955
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 02:35:38 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   9 +
 .../binutils/binutils/CVE-2017-9955_1.patch        | 168 ++++++++++
 .../binutils/binutils/CVE-2017-9955_2.patch        | 122 +++++++
 .../binutils/binutils/CVE-2017-9955_3.patch        |  48 +++
 .../binutils/binutils/CVE-2017-9955_4.patch        |  51 +++
 .../binutils/binutils/CVE-2017-9955_5.patch        |  89 ++++++
 .../binutils/binutils/CVE-2017-9955_6.patch        |  56 ++++
 .../binutils/binutils/CVE-2017-9955_7.patch        |  80 +++++
 .../binutils/binutils/CVE-2017-9955_8.patch        | 187 +++++++++++
 .../binutils/binutils/CVE-2017-9955_9.patch        | 356 +++++++++++++++++++++
 10 files changed, 1166 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_4.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_5.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_6.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_7.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_8.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_9.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index fe9059a..1784c52 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -68,6 +68,15 @@ SRC_URI = "\
      file://CVE-2017-9755.patch \
      file://CVE-2017-9756.patch \
      file://CVE-2017-9954.patch \
+     file://CVE-2017-9955_1.patch \
+     file://CVE-2017-9955_2.patch \
+     file://CVE-2017-9955_3.patch \
+     file://CVE-2017-9955_4.patch \
+     file://CVE-2017-9955_5.patch \
+     file://CVE-2017-9955_6.patch \
+     file://CVE-2017-9955_7.patch \
+     file://CVE-2017-9955_8.patch \
+     file://CVE-2017-9955_9.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_1.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_1.patch
new file mode 100644
index 0000000..774670f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_1.patch
@@ -0,0 +1,168 @@
+From cfd14a500e0485374596234de4db10e88ebc7618 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 26 Jun 2017 15:25:08 +0100
+Subject: [PATCH] Fix address violations when atempting to parse fuzzed
+ binaries.
+
+	PR binutils/21665
+bfd	* opncls.c (get_build_id): Check that the section is beig enough
+	to contain the whole note.
+	* compress.c (bfd_get_full_section_contents): Check for and reject
+	a section whoes size is greater than the size of the entire file.
+	* elf32-v850.c (v850_elf_copy_notes): Allow for the ouput to not
+	contain a notes section.
+
+binutils* objdump.c (disassemble_section): Skip any section that is bigger
+	than the entire file.
+
+Upstream-Status: Backport 
+CVE: CVE-2017-9955 #1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog      | 10 ++++++++++
+ bfd/compress.c     |  6 ++++++
+ bfd/elf32-v850.c   |  4 +++-
+ bfd/opncls.c       | 18 ++++++++++++++++--
+ binutils/ChangeLog |  6 ++++++
+ binutils/objdump.c |  4 ++--
+ 6 files changed, 43 insertions(+), 5 deletions(-)
+
+Index: git/bfd/compress.c
+===================================================================
+--- git.orig/bfd/compress.c
++++ git/bfd/compress.c
+@@ -239,6 +239,12 @@ bfd_get_full_section_contents (bfd *abfd
+       *ptr = NULL;
+       return TRUE;
+     }
++  else if (bfd_get_file_size (abfd) > 0
++	   && sz > (bfd_size_type) bfd_get_file_size (abfd))
++    {
++      *ptr = NULL;
++      return FALSE;
++    }
+ 
+   switch (sec->compress_status)
+     {
+Index: git/bfd/elf32-v850.c
+===================================================================
+--- git.orig/bfd/elf32-v850.c
++++ git/bfd/elf32-v850.c
+@@ -2450,7 +2450,9 @@ v850_elf_copy_notes (bfd *ibfd, bfd *obf
+ 	BFD_ASSERT (bfd_malloc_and_get_section (ibfd, inotes, & icont));
+ 
+       if ((ocont = elf_section_data (onotes)->this_hdr.contents) == NULL)
+-	BFD_ASSERT (bfd_malloc_and_get_section (obfd, onotes, & ocont));
++	/* If the output is being stripped then it is possible for
++	   the notes section to disappear.  In this case do nothing.  */
++	return;
+ 
+       /* Copy/overwrite notes from the input to the output.  */
+       memcpy (ocont, icont, bfd_section_size (obfd, onotes));
+Index: git/bfd/opncls.c
+===================================================================
+--- git.orig/bfd/opncls.c
++++ git/bfd/opncls.c
+@@ -1776,6 +1776,7 @@ get_build_id (bfd *abfd)
+   Elf_External_Note *enote;
+   bfd_byte *contents;
+   asection *sect;
++  bfd_size_type size;
+ 
+   BFD_ASSERT (abfd);
+ 
+@@ -1790,8 +1791,9 @@ get_build_id (bfd *abfd)
+       return NULL;
+     }
+ 
++  size = bfd_get_section_size (sect);
+   /* FIXME: Should we support smaller build-id notes ?  */
+-  if (bfd_get_section_size (sect) < 0x24)
++  if (size < 0x24)
+     {
+       bfd_set_error (bfd_error_invalid_operation);
+       return NULL;
+@@ -1804,6 +1806,17 @@ get_build_id (bfd *abfd)
+       return NULL;
+     }
+ 
++  /* FIXME: Paranoia - allow for compressed build-id sections.
++     Maybe we should complain if this size is different from
++     the one obtained above...  */
++  size = bfd_get_section_size (sect);
++  if (size < sizeof (Elf_External_Note))
++    {
++      bfd_set_error (bfd_error_invalid_operation);
++      free (contents);
++      return NULL;
++    }
++
+   enote = (Elf_External_Note *) contents;
+   inote.type = H_GET_32 (abfd, enote->type);
+   inote.namesz = H_GET_32 (abfd, enote->namesz);
+@@ -1815,7 +1828,8 @@ get_build_id (bfd *abfd)
+   if (inote.descsz == 0
+       || inote.type != NT_GNU_BUILD_ID
+       || inote.namesz != 4 /* sizeof "GNU"  */
+-      || strcmp (inote.namedata, "GNU") != 0)
++      || strncmp (inote.namedata, "GNU", 4) != 0
++      || size < (12 + BFD_ALIGN (inote.namesz, 4) + inote.descsz))
+     {
+       free (contents);
+       bfd_set_error (bfd_error_invalid_operation);
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -2048,7 +2048,7 @@ disassemble_section (bfd *abfd, asection
+     return;
+ 
+   datasize = bfd_get_section_size (section);
+-  if (datasize == 0)
++  if (datasize == 0 || datasize >= (bfd_size_type) bfd_get_file_size (abfd))
+     return;
+ 
+   if (start_address == (bfd_vma) -1
+@@ -2912,7 +2912,7 @@ dump_target_specific (bfd *abfd)
+ static void
+ dump_section (bfd *abfd, asection *section, void *dummy ATTRIBUTE_UNUSED)
+ {
+-  bfd_byte *data = 0;
++  bfd_byte *data = NULL;
+   bfd_size_type datasize;
+   bfd_vma addr_offset;
+   bfd_vma start_offset;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,4 +1,14 @@
+ 2017-06-26  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21665
++       * opncls.c (get_build_id): Check that the section is beig enough
++       to contain the whole note.
++       * compress.c (bfd_get_full_section_contents): Check for and reject
++       a section whoes size is greater than the size of the entire file.
++       * elf32-v850.c (v850_elf_copy_notes): Allow for the ouput to not
++       contain a notes section.
++
++2017-06-26  Nick Clifton  <nickc@redhat.com>
+  
+        PR binutils/21670
+        * tekhex.c (getvalue): Check for the source pointer exceeding the
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2017-06-26  Nick Clifton  <nickc@redhat.com>
++ 
++       PR binutils/21665
++       * objdump.c (disassemble_section): Skip any section that is bigger
++       than the entire file.
++
+ 2017-04-03  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/21345
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_2.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_2.patch
new file mode 100644
index 0000000..f95295f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_2.patch
@@ -0,0 +1,122 @@
+From 0630b49c470ca2e3c3f74da4c7e4ff63440dd71f Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 26 Jun 2017 09:24:49 -0700
+Subject: [PATCH] Check file size before getting section contents
+
+Don't check the section size in bfd_get_full_section_contents since
+the size of a decompressed section may be larger than the file size.
+Instead, check file size in _bfd_generic_get_section_contents.
+
+	PR binutils/21665
+	* compress.c (bfd_get_full_section_contents): Don't check the
+	file size here.
+	* libbfd.c (_bfd_generic_get_section_contents): Check for and
+	reject a section whoes size + offset is greater than the size
+	of the entire file.
+	(_bfd_generic_get_section_contents_in_window): Likewise.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9955 #2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog  | 10 +++++++++-
+ bfd/compress.c |  8 +-------
+ bfd/libbfd.c   | 17 ++++++++++++++++-
+ 3 files changed, 26 insertions(+), 9 deletions(-)
+
+Index: git/bfd/compress.c
+===================================================================
+--- git.orig/bfd/compress.c
++++ git/bfd/compress.c
+@@ -239,12 +239,6 @@ bfd_get_full_section_contents (bfd *abfd
+       *ptr = NULL;
+       return TRUE;
+     }
+-  else if (bfd_get_file_size (abfd) > 0
+-	   && sz > (bfd_size_type) bfd_get_file_size (abfd))
+-    {
+-      *ptr = NULL;
+-      return FALSE;
+-    }
+ 
+   switch (sec->compress_status)
+     {
+@@ -260,7 +254,7 @@ bfd_get_full_section_contents (bfd *abfd
+ 		  /* xgettext:c-format */
+ 		  (_("error: %B(%A) is too large (%#lx bytes)"),
+ 		  abfd, sec, (long) sz);
+-	    return FALSE;
++	      return FALSE;
+ 	    }
+ 	}
+ 
+Index: git/bfd/libbfd.c
+===================================================================
+--- git.orig/bfd/libbfd.c
++++ git/bfd/libbfd.c
+@@ -780,6 +780,7 @@ _bfd_generic_get_section_contents (bfd *
+ 				   bfd_size_type count)
+ {
+   bfd_size_type sz;
++  file_ptr filesz;
+   if (count == 0)
+     return TRUE;
+ 
+@@ -802,8 +803,15 @@ _bfd_generic_get_section_contents (bfd *
+     sz = section->rawsize;
+   else
+     sz = section->size;
++  filesz = bfd_get_file_size (abfd);
++  if (filesz < 0)
++    {
++      /* This should never happen.  */
++      abort ();
++    }
+   if (offset + count < count
+-      || offset + count > sz)
++      || offset + count > sz
++      || (section->filepos + offset + sz) > (bfd_size_type) filesz)
+     {
+       bfd_set_error (bfd_error_invalid_operation);
+       return FALSE;
+@@ -826,6 +834,7 @@ _bfd_generic_get_section_contents_in_win
+ {
+ #ifdef USE_MMAP
+   bfd_size_type sz;
++  file_ptr filesz;
+ 
+   if (count == 0)
+     return TRUE;
+@@ -858,7 +867,13 @@ _bfd_generic_get_section_contents_in_win
+     sz = section->rawsize;
+   else
+     sz = section->size;
++  filesz = bfd_get_file_size (abfd);
++    {
++      /* This should never happen.  */
++      abort ();
++    }
+   if (offset + count > sz
++      || (section->filepos + offset + sz) > (bfd_size_type) filesz
+       || ! bfd_get_file_window (abfd, section->filepos + offset, count, w,
+ 				TRUE))
+     return FALSE;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,13 @@
++2017-06-26  H.J. Lu  <hongjiu.lu@intel.com>
++
++       PR binutils/21665
++       * compress.c (bfd_get_full_section_contents): Don't check the
++       file size here.
++       * libbfd.c (_bfd_generic_get_section_contents): Check for and
++       reject a section whoes size + offset is greater than the size
++       of the entire file.
++       (_bfd_generic_get_section_contents_in_window): Likewise.
++
+ 2017-06-26  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/21665
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_3.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_3.patch
new file mode 100644
index 0000000..1b67c4e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_3.patch
@@ -0,0 +1,48 @@
+From 1f473e3d0ad285195934e6a077c7ed32afe66437 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 26 Jun 2017 15:47:16 -0700
+Subject: [PATCH] Add a missing line to
+ _bfd_generic_get_section_contents_in_window
+
+	PR binutils/21665
+	* libbfd.c (_bfd_generic_get_section_contents_in_window): Add
+	a missing line.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9955 #3
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/libbfd.c  | 1 +
+ 2 files changed, 7 insertions(+)
+
+Index: git/bfd/libbfd.c
+===================================================================
+--- git.orig/bfd/libbfd.c
++++ git/bfd/libbfd.c
+@@ -868,6 +868,7 @@ _bfd_generic_get_section_contents_in_win
+   else
+     sz = section->size;
+   filesz = bfd_get_file_size (abfd);
++  if (filesz < 0)
+     {
+       /* This should never happen.  */
+       abort ();
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,6 +1,12 @@
+ 2017-06-26  H.J. Lu  <hongjiu.lu@intel.com>
+ 
+        PR binutils/21665
++       * libbfd.c (_bfd_generic_get_section_contents_in_window): Add
++       a missing line.
++
++2017-06-26  H.J. Lu  <hongjiu.lu@intel.com>
++
++       PR binutils/21665
+        * compress.c (bfd_get_full_section_contents): Don't check the
+        file size here.
+        * libbfd.c (_bfd_generic_get_section_contents): Check for and
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_4.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_4.patch
new file mode 100644
index 0000000..97d529a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_4.patch
@@ -0,0 +1,51 @@
+From ab27f80c5dceaa23c4ba7f62c0d5d22a5d5dd7a1 Mon Sep 17 00:00:00 2001
+From: Pedro Alves <palves@redhat.com>
+Date: Tue, 27 Jun 2017 00:21:25 +0100
+Subject: [PATCH] Fix GDB regressions caused by previous
+ bfd_get_section_contents changes
+
+Ref: https://sourceware.org/ml/binutils/2017-06/msg00343.html
+
+bfd/ChangeLog:
+2017-06-26  Pedro Alves  <palves@redhat.com>
+
+	PR binutils/21665
+	* libbfd.c (_bfd_generic_get_section_contents): Add "count", not
+	"sz".
+
+Upstream-Status: Backport
+CVE: CVE-2017-9955 #4
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/libbfd.c  | 2 +-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-06-26  Pedro Alves  <palves@redhat.com>
++
++	PR binutils/21665
++	* libbfd.c (_bfd_generic_get_section_contents): Add "count", not
++	"sz".
++
+ 2017-06-26  H.J. Lu  <hongjiu.lu@intel.com>
+ 
+        PR binutils/21665
+Index: git/bfd/libbfd.c
+===================================================================
+--- git.orig/bfd/libbfd.c
++++ git/bfd/libbfd.c
+@@ -811,7 +811,7 @@ _bfd_generic_get_section_contents (bfd *
+     }
+   if (offset + count < count
+       || offset + count > sz
+-      || (section->filepos + offset + sz) > (bfd_size_type) filesz)
++      || (section->filepos + offset + count) > (bfd_size_type) filesz)
+     {
+       bfd_set_error (bfd_error_invalid_operation);
+       return FALSE;
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_5.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_5.patch
new file mode 100644
index 0000000..da3bd37
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_5.patch
@@ -0,0 +1,89 @@
+From 7211ae501eb0de1044983f2dfb00091a58fbd66c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 27 Jun 2017 09:45:04 +0930
+Subject: [PATCH] More fixes for bfd_get_section_contents change
+
+	PR binutils/21665
+	* libbfd.c (_bfd_generic_get_section_contents): Delete abort.
+	Use unsigned file pointer type, and remove cast.
+	* libbfd.c (_bfd_generic_get_section_contents_in_window): Likewise.
+	Add "count", not "sz".
+
+Upstream-Status: Backport
+CVE: CVE-2017-9955 #5
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  8 ++++++++
+ bfd/libbfd.c  | 18 ++++--------------
+ 2 files changed, 12 insertions(+), 14 deletions(-)
+
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,11 @@
++2017-06-27  Alan Modra  <amodra@gmail.com>
++
++	PR binutils/21665
++	* libbfd.c (_bfd_generic_get_section_contents): Delete abort.
++	Use unsigned file pointer type, and remove cast.
++	* libbfd.c (_bfd_generic_get_section_contents_in_window): Likewise.
++	Add "count", not "sz".
++
+ 2017-06-26  Pedro Alves  <palves@redhat.com>
+ 
+ 	PR binutils/21665
+Index: git/bfd/libbfd.c
+===================================================================
+--- git.orig/bfd/libbfd.c
++++ git/bfd/libbfd.c
+@@ -780,7 +780,7 @@ _bfd_generic_get_section_contents (bfd *
+ 				   bfd_size_type count)
+ {
+   bfd_size_type sz;
+-  file_ptr filesz;
++  ufile_ptr filesz;
+   if (count == 0)
+     return TRUE;
+ 
+@@ -804,14 +804,9 @@ _bfd_generic_get_section_contents (bfd *
+   else
+     sz = section->size;
+   filesz = bfd_get_file_size (abfd);
+-  if (filesz < 0)
+-    {
+-      /* This should never happen.  */
+-      abort ();
+-    }
+   if (offset + count < count
+       || offset + count > sz
+-      || (section->filepos + offset + count) > (bfd_size_type) filesz)
++      || section->filepos + offset + count > filesz)
+     {
+       bfd_set_error (bfd_error_invalid_operation);
+       return FALSE;
+@@ -834,7 +829,7 @@ _bfd_generic_get_section_contents_in_win
+ {
+ #ifdef USE_MMAP
+   bfd_size_type sz;
+-  file_ptr filesz;
++  ufile_ptr filesz;
+ 
+   if (count == 0)
+     return TRUE;
+@@ -868,13 +863,8 @@ _bfd_generic_get_section_contents_in_win
+   else
+     sz = section->size;
+   filesz = bfd_get_file_size (abfd);
+-  if (filesz < 0)
+-    {
+-      /* This should never happen.  */
+-      abort ();
+-    }
+   if (offset + count > sz
+-      || (section->filepos + offset + sz) > (bfd_size_type) filesz
++      || section->filepos + offset + count > filesz
+       || ! bfd_get_file_window (abfd, section->filepos + offset, count, w,
+ 				TRUE))
+     return FALSE;
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_6.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_6.patch
new file mode 100644
index 0000000..e36429a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_6.patch
@@ -0,0 +1,56 @@
+From ea9aafc41a764e4e2dbb88a7b031e886b481b99a Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 27 Jun 2017 14:43:49 +0930
+Subject: [PATCH] Warning fix
+
+	PR binutils/21665
+	* libbfd.c (_bfd_generic_get_section_contents): Warning fix.
+	(_bfd_generic_get_section_contents_in_window): Likewise.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9955 #6
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 12 +++++++++---
+ bfd/libbfd.c  |  4 ++--
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+Index: git/bfd/libbfd.c
+===================================================================
+--- git.orig/bfd/libbfd.c
++++ git/bfd/libbfd.c
+@@ -806,7 +806,7 @@ _bfd_generic_get_section_contents (bfd *
+   filesz = bfd_get_file_size (abfd);
+   if (offset + count < count
+       || offset + count > sz
+-      || section->filepos + offset + count > filesz)
++      || (ufile_ptr) section->filepos + offset + count > filesz)
+     {
+       bfd_set_error (bfd_error_invalid_operation);
+       return FALSE;
+@@ -864,7 +864,7 @@ _bfd_generic_get_section_contents_in_win
+     sz = section->size;
+   filesz = bfd_get_file_size (abfd);
+   if (offset + count > sz
+-      || section->filepos + offset + count > filesz
++      || (ufile_ptr) section->filepos + offset + count > filesz
+       || ! bfd_get_file_window (abfd, section->filepos + offset, count, w,
+ 				TRUE))
+     return FALSE;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,5 +1,11 @@
+ 2017-06-27  Alan Modra  <amodra@gmail.com>
+ 
++       PR binutils/21665
++       * libbfd.c (_bfd_generic_get_section_contents): Warning fix.
++       (_bfd_generic_get_section_contents_in_window): Likewise.
++
++2017-06-27  Alan Modra  <amodra@gmail.com>
++
+ 	PR binutils/21665
+ 	* libbfd.c (_bfd_generic_get_section_contents): Delete abort.
+ 	Use unsigned file pointer type, and remove cast.
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_7.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_7.patch
new file mode 100644
index 0000000..2cae63b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_7.patch
@@ -0,0 +1,80 @@
+From 60a02042bacf8d25814430080adda61ed086bca6 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 30 Jun 2017 11:03:37 +0100
+Subject: [PATCH] Fix failures in MMIX linker tests introduced by fix for PR
+ 21665.
+
+	PR binutils/21665
+	* objdump.c (disassemble_section): Move check for an overlarge
+	section to just before the allocation of memory.  Do not check
+	section size against file size, but instead use an arbitrary 2Gb
+	limit.  Issue a warning message if the section is too big.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9955 #7
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  8 ++++++++
+ binutils/objdump.c | 25 ++++++++++++++++++++++++-
+ 2 files changed, 32 insertions(+), 1 deletion(-)
+
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -2048,7 +2048,7 @@ disassemble_section (bfd *abfd, asection
+     return;
+ 
+   datasize = bfd_get_section_size (section);
+-  if (datasize == 0 || datasize >= (bfd_size_type) bfd_get_file_size (abfd))
++  if (datasize == 0)
+     return;
+ 
+   if (start_address == (bfd_vma) -1
+@@ -2112,6 +2112,29 @@ disassemble_section (bfd *abfd, asection
+     }
+   rel_ppend = rel_pp + rel_count;
+ 
++  /* PR 21665: Check for overlarge datasizes.
++     Note - we used to check for "datasize > bfd_get_file_size (abfd)" but
++     this fails when using compressed sections or compressed file formats
++     (eg MMO, tekhex).
++
++     The call to xmalloc below will fail if too much memory is requested,
++     which will catch the problem in the normal use case.  But if a memory
++     checker is in use, eg valgrind or sanitize, then an exception will
++     be still generated, so we try to catch the problem first.
++
++     Unfortunately there is no simple way to determine how much memory can
++     be allocated by calling xmalloc.  So instead we use a simple, arbitrary
++     limit of 2Gb.  Hopefully this should be enough for most users.  If
++     someone does start trying to disassemble sections larger then 2Gb in
++     size they will doubtless complain and we can increase the limit.  */
++#define MAX_XMALLOC (1024 * 1024 * 1024 * 2UL) /* 2Gb */
++  if (datasize > MAX_XMALLOC)
++    {
++      non_fatal (_("Reading section %s failed because it is too big (%#lx)"),
++		 section->name, (unsigned long) datasize);
++      return;
++    }
++
+   data = (bfd_byte *) xmalloc (datasize);
+ 
+   bfd_get_section_contents (abfd, section, data, 0, datasize);
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,11 @@
++2017-06-30  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21665
++       * objdump.c (disassemble_section): Move check for an overlarge
++       section to just before the allocation of memory.  Do not check
++       section size against file size, but instead use an arbitrary 2Gb
++       limit.  Issue a warning message if the section is too big.
++
+ 2017-06-26  Nick Clifton  <nickc@redhat.com>
+  
+        PR binutils/21665
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_8.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_8.patch
new file mode 100644
index 0000000..45dd974
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_8.patch
@@ -0,0 +1,187 @@
+From bae7501e87ab614115d9d3213b4dd18d96e604db Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 1 Jul 2017 21:58:10 +0930
+Subject: [PATCH] Use bfd_malloc_and_get_section
+
+It's nicer than xmalloc followed by bfd_get_section_contents, since
+xmalloc exits on failure and needs a check that its size_t arg doesn't
+lose high bits when converted from bfd_size_type.
+
+	PR binutils/21665
+	* objdump.c (strtab): Make var a bfd_byte*.
+	(disassemble_section): Don't limit malloc size.  Instead, use
+	bfd_malloc_and_get_section.
+	(read_section_stabs): Use bfd_malloc_and_get_section.  Return
+	bfd_byte*.
+	(find_stabs_section): Remove now unnecessary cast.
+	* objcopy.c (copy_object): Use bfd_malloc_and_get_section.  Free
+	contents on error return.
+	* nlmconv.c (copy_sections): Use bfd_malloc_and_get_section.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9955 #8
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog | 13 +++++++++++++
+ binutils/nlmconv.c |  6 ++----
+ binutils/objcopy.c |  5 +++--
+ binutils/objdump.c | 44 +++++++-------------------------------------
+ 4 files changed, 25 insertions(+), 43 deletions(-)
+
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,16 @@
++2017-07-01  Alan Modra  <amodra@gmail.com>
++
++	PR binutils/21665
++	* objdump.c (strtab): Make var a bfd_byte*.
++	(disassemble_section): Don't limit malloc size.  Instead, use
++	bfd_malloc_and_get_section.
++	(read_section_stabs): Use bfd_malloc_and_get_section.  Return
++	bfd_byte*.
++	(find_stabs_section): Remove now unnecessary cast.
++	* objcopy.c (copy_object): Use bfd_malloc_and_get_section.  Free
++	contents on error return.
++	* nlmconv.c (copy_sections): Use bfd_malloc_and_get_section.
++
+ 2017-06-30  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/21665
+Index: git/binutils/nlmconv.c
+===================================================================
+--- git.orig/binutils/nlmconv.c
++++ git/binutils/nlmconv.c
+@@ -1224,7 +1224,7 @@ copy_sections (bfd *inbfd, asection *ins
+   const char *inname;
+   asection *outsec;
+   bfd_size_type size;
+-  void *contents;
++  bfd_byte *contents;
+   long reloc_size;
+   bfd_byte buf[4];
+   bfd_size_type add;
+@@ -1240,9 +1240,7 @@ copy_sections (bfd *inbfd, asection *ins
+     contents = NULL;
+   else
+     {
+-      contents = xmalloc (size);
+-      if (! bfd_get_section_contents (inbfd, insec, contents,
+-				      (file_ptr) 0, size))
++      if (!bfd_malloc_and_get_section (inbfd, insec, &contents))
+ 	bfd_fatal (bfd_get_filename (inbfd));
+     }
+ 
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -180,7 +180,7 @@ static long dynsymcount = 0;
+ static bfd_byte *stabs;
+ static bfd_size_type stab_size;
+ 
+-static char *strtab;
++static bfd_byte *strtab;
+ static bfd_size_type stabstr_size;
+ 
+ static bfd_boolean is_relocatable = FALSE;
+@@ -2112,29 +2112,6 @@ disassemble_section (bfd *abfd, asection
+     }
+   rel_ppend = rel_pp + rel_count;
+ 
+-  /* PR 21665: Check for overlarge datasizes.
+-     Note - we used to check for "datasize > bfd_get_file_size (abfd)" but
+-     this fails when using compressed sections or compressed file formats
+-     (eg MMO, tekhex).
+-
+-     The call to xmalloc below will fail if too much memory is requested,
+-     which will catch the problem in the normal use case.  But if a memory
+-     checker is in use, eg valgrind or sanitize, then an exception will
+-     be still generated, so we try to catch the problem first.
+-
+-     Unfortunately there is no simple way to determine how much memory can
+-     be allocated by calling xmalloc.  So instead we use a simple, arbitrary
+-     limit of 2Gb.  Hopefully this should be enough for most users.  If
+-     someone does start trying to disassemble sections larger then 2Gb in
+-     size they will doubtless complain and we can increase the limit.  */
+-#define MAX_XMALLOC (1024 * 1024 * 1024 * 2UL) /* 2Gb */
+-  if (datasize > MAX_XMALLOC)
+-    {
+-      non_fatal (_("Reading section %s failed because it is too big (%#lx)"),
+-		 section->name, (unsigned long) datasize);
+-      return;
+-    }
+-
+   data = (bfd_byte *) xmalloc (datasize);
+ 
+   bfd_get_section_contents (abfd, section, data, 0, datasize);
+@@ -2652,12 +2629,11 @@ dump_dwarf (bfd *abfd)
+ /* Read ABFD's stabs section STABSECT_NAME, and return a pointer to
+    it.  Return NULL on failure.   */
+ 
+-static char *
++static bfd_byte *
+ read_section_stabs (bfd *abfd, const char *sect_name, bfd_size_type *size_ptr)
+ {
+   asection *stabsect;
+-  bfd_size_type size;
+-  char *contents;
++  bfd_byte *contents;
+ 
+   stabsect = bfd_get_section_by_name (abfd, sect_name);
+   if (stabsect == NULL)
+@@ -2666,10 +2642,7 @@ read_section_stabs (bfd *abfd, const cha
+       return FALSE;
+     }
+ 
+-  size = bfd_section_size (abfd, stabsect);
+-  contents  = (char *) xmalloc (size);
+-
+-  if (! bfd_get_section_contents (abfd, stabsect, contents, 0, size))
++  if (!bfd_malloc_and_get_section (abfd, stabsect, &contents))
+     {
+       non_fatal (_("reading %s section of %s failed: %s"),
+ 		 sect_name, bfd_get_filename (abfd),
+@@ -2679,7 +2652,7 @@ read_section_stabs (bfd *abfd, const cha
+       return NULL;
+     }
+ 
+-  *size_ptr = size;
++  *size_ptr = bfd_section_size (abfd, stabsect);
+ 
+   return contents;
+ }
+@@ -2806,8 +2779,7 @@ find_stabs_section (bfd *abfd, asection
+ 
+       if (strtab)
+ 	{
+-	  stabs = (bfd_byte *) read_section_stabs (abfd, section->name,
+-						   &stab_size);
++	  stabs = read_section_stabs (abfd, section->name, &stab_size);
+ 	  if (stabs)
+ 	    print_section_stabs (abfd, section->name, &sought->string_offset);
+ 	}
+Index: git/binutils/objcopy.c
+===================================================================
+--- git.orig/binutils/objcopy.c
++++ git/binutils/objcopy.c
+@@ -2186,14 +2186,15 @@ copy_object (bfd *ibfd, bfd *obfd, const
+ 	      continue;
+ 	    }
+ 
+-	  bfd_byte * contents = xmalloc (size);
+-	  if (bfd_get_section_contents (ibfd, sec, contents, 0, size))
++	  bfd_byte *contents;
++          if (bfd_malloc_and_get_section (ibfd, sec, &contents))
+ 	    {
+ 	      if (fwrite (contents, 1, size, f) != size)
+ 		{
+ 		  non_fatal (_("error writing section contents to %s (error: %s)"),
+ 			     pdump->filename,
+ 			     strerror (errno));
++                  free (contents);
+ 		  return FALSE;
+ 		}
+ 	    }
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_9.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_9.patch
new file mode 100644
index 0000000..1813a2a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9955_9.patch
@@ -0,0 +1,356 @@
+From 8e2f54bcee7e3e8315d4a39a302eaf8e4389e07d Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 May 2017 06:34:05 -0700
+Subject: [PATCH] Add bfd_get_file_size to get archive element size
+
+We can't use stat() to get archive element size.  Add bfd_get_file_size
+to get size for both normal files and archive elements.
+
+bfd/
+
+	PR binutils/21519
+	* bfdio.c (bfd_get_file_size): New function.
+	* bfd-in2.h: Regenerated.
+
+binutils/
+
+	PR binutils/21519
+	* objdump.c (dump_relocs_in_section): Replace get_file_size
+	with bfd_get_file_size to get archive element size.
+	* testsuite/binutils-all/objdump.exp (test_objdump_f): New
+	proc.
+	(test_objdump_h): Likewise.
+	(test_objdump_t): Likewise.
+	(test_objdump_r): Likewise.
+	(test_objdump_s): Likewise.
+	Add objdump tests on archive.
+---
+ bfd/ChangeLog                               |   6 +
+ bfd/bfd-in2.h                               |   2 +
+ bfd/bfdio.c                                 |  23 ++++
+ binutils/ChangeLog                          |  13 ++
+ binutils/objdump.c                          |   2 +-
+ binutils/testsuite/binutils-all/objdump.exp | 178 +++++++++++++++++++---------
+ 6 files changed, 170 insertions(+), 54 deletions(-)
+
+Index: git/bfd/bfd-in2.h
+===================================================================
+--- git.orig/bfd/bfd-in2.h
++++ git/bfd/bfd-in2.h
+@@ -1241,6 +1241,8 @@ long bfd_get_mtime (bfd *abfd);
+ 
+ file_ptr bfd_get_size (bfd *abfd);
+ 
++file_ptr bfd_get_file_size (bfd *abfd);
++
+ void *bfd_mmap (bfd *abfd, void *addr, bfd_size_type len,
+     int prot, int flags, file_ptr offset,
+     void **map_addr, bfd_size_type *map_len);
+Index: git/bfd/bfdio.c
+===================================================================
+--- git.orig/bfd/bfdio.c
++++ git/bfd/bfdio.c
+@@ -434,6 +434,29 @@ bfd_get_size (bfd *abfd)
+   return buf.st_size;
+ }
+ 
++/*
++FUNCTION
++	bfd_get_file_size
++
++SYNOPSIS
++	file_ptr bfd_get_file_size (bfd *abfd);
++
++DESCRIPTION
++	Return the file size (as read from file system) for the file
++	associated with BFD @var{abfd}.  It supports both normal files
++	and archive elements.
++
++*/
++
++file_ptr
++bfd_get_file_size (bfd *abfd)
++{
++  if (abfd->my_archive != NULL
++      && !bfd_is_thin_archive (abfd->my_archive))
++    return arelt_size (abfd);
++
++  return bfd_get_size (abfd);
++}
+ 
+ /*
+ FUNCTION
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -3310,7 +3310,7 @@ dump_relocs_in_section (bfd *abfd,
+     }
+ 
+   if ((bfd_get_file_flags (abfd) & (BFD_IN_MEMORY | BFD_LINKER_CREATED)) == 0
+-      && relsize > get_file_size (bfd_get_filename (abfd)))
++      && relsize > bfd_get_file_size (abfd))
+     {
+       printf (" (too many: 0x%x)\n", section->reloc_count);
+       bfd_set_error (bfd_error_file_truncated);
+Index: git/binutils/testsuite/binutils-all/objdump.exp
+===================================================================
+--- git.orig/binutils/testsuite/binutils-all/objdump.exp
++++ git/binutils/testsuite/binutils-all/objdump.exp
+@@ -64,96 +64,168 @@ if [regexp $want $got] then {
+ if {![binutils_assemble $srcdir/$subdir/bintest.s tmpdir/bintest.o]} then {
+     return
+ }
++if {![binutils_assemble $srcdir/$subdir/bintest.s tmpdir/bintest2.o]} then {
++    return
++}
+ if [is_remote host] {
+     set testfile [remote_download host tmpdir/bintest.o]
++    set testfile2 [remote_download host tmpdir/bintest2.o]
+ } else {
+     set testfile tmpdir/bintest.o
++    set testfile2 tmpdir/bintest2.o
++}
++
++if { ![istarget "alpha-*-*"] || [is_elf_format] } then {
++    remote_file host file delete tmpdir/bintest.a
++    set got [binutils_run $AR "rc tmpdir/bintest.a $testfile2"]
++    if ![string match "" $got] then {
++	fail "bintest.a"
++	remote_file host delete tmpdir/bintest.a
++    } else {
++	if [is_remote host] {
++	    set testarchive [remote_download host tmpdir/bintest.a]
++	} else {
++	    set testarchive tmpdir/bintest.a
++	}
++    }
++    remote_file host delete tmpdir/bintest2.o
+ }
+ 
+ # Test objdump -f
+ 
+-set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -f $testfile"]
++proc test_objdump_f { testfile dumpfile } {
++    global OBJDUMP
++    global OBJDUMPFLAGS
++    global cpus_regex
+ 
+-set want "$testfile:\[ 	\]*file format.*architecture:\[ 	\]*${cpus_regex}.*HAS_RELOC.*HAS_SYMS"
++    set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -f $testfile"]
+ 
+-if ![regexp $want $got] then {
+-    fail "objdump -f"
+-} else {
+-    pass "objdump -f"
++    set want "$dumpfile:\[ 	\]*file format.*architecture:\[ 	\]*${cpus_regex}.*HAS_RELOC.*HAS_SYMS"
++
++    if ![regexp $want $got] then {
++	fail "objdump -f ($testfile, $dumpfile)"
++    } else {
++	pass "objdump -f ($testfile, $dumpfile)"
++    }
++}
++
++test_objdump_f $testfile $testfile
++if { [ remote_file host exists $testarchive ] } then {
++    test_objdump_f $testarchive bintest2.o
+ }
+ 
+ # Test objdump -h
+ 
+-set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -h $testfile"]
++proc test_objdump_h { testfile dumpfile } {
++    global OBJDUMP
++    global OBJDUMPFLAGS
+ 
+-set want "$testfile:\[ 	\]*file format.*Sections.*\[0-9\]+\[ 	\]+\[^ 	\]*(text|TEXT|P|\\\$CODE\\\$)\[^ 	\]*\[ 	\]*(\[0-9a-fA-F\]+).*\[0-9\]+\[ 	\]+\[^ 	\]*(\\.data|DATA|D_1)\[^ 	\]*\[ 	\]*(\[0-9a-fA-F\]+)"
++    set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -h $testfile"]
+ 
+-if ![regexp $want $got all text_name text_size data_name data_size] then {
+-    fail "objdump -h"
+-} else {
+-    verbose "text name is $text_name size is $text_size"
+-    verbose "data name is $data_name size is $data_size"
+-    set ets 8
+-    set eds 4
+-    # The [ti]c4x target has the property sizeof(char)=sizeof(long)=1
+-    if [istarget *c4x*-*-*] then {
+-        set ets 2
+-        set eds 1
+-    }
+-    # c54x section sizes are in bytes, not octets; adjust accordingly
+-    if [istarget *c54x*-*-*] then {
+-	set ets 4
+-	set eds 2
+-    }
+-    if {[expr "0x$text_size"] < $ets || [expr "0x$data_size"] < $eds} then {
+-	send_log "sizes too small\n"
+-	fail "objdump -h"
++    set want "$dumpfile:\[ 	\]*file format.*Sections.*\[0-9\]+\[ 	\]+\[^ 	\]*(text|TEXT|P|\\\$CODE\\\$)\[^ 	\]*\[ 	\]*(\[0-9a-fA-F\]+).*\[0-9\]+\[ 	\]+\[^ 	\]*(\\.data|DATA|D_1)\[^ 	\]*\[ 	\]*(\[0-9a-fA-F\]+)"
++
++    if ![regexp $want $got all text_name text_size data_name data_size] then {
++	fail "objdump -h ($testfile, $dumpfile)"
+     } else {
+-	pass "objdump -h"
++	verbose "text name is $text_name size is $text_size"
++	verbose "data name is $data_name size is $data_size"
++	set ets 8
++	set eds 4
++	# The [ti]c4x target has the property sizeof(char)=sizeof(long)=1
++	if [istarget *c4x*-*-*] then {
++            set ets 2
++            set eds 1
++	}
++	# c54x section sizes are in bytes, not octets; adjust accordingly
++	if [istarget *c54x*-*-*] then {
++	    set ets 4
++	    set eds 2
++        }
++	if {[expr "0x$text_size"] < $ets || [expr "0x$data_size"] < $eds} then {
++	    send_log "sizes too small\n"
++	    fail "objdump -h ($testfile, $dumpfile)"
++	} else {
++	    pass "objdump -h ($testfile, $dumpfile)"
++	}
+     }
+ }
+ 
++test_objdump_h $testfile $testfile
++if { [ remote_file host exists $testarchive ] } then {
++    test_objdump_h $testarchive bintest2.o
++}
++
+ # Test objdump -t
+ 
+-set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -t $testfile"]
++proc test_objdump_t { testfile} {
++    global OBJDUMP
++    global OBJDUMPFLAGS
++
++    set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -t $testfile"]
++
++    if [info exists vars] then { unset vars }
++    while {[regexp "(\[a-z\]*_symbol)(.*)" $got all symbol rest]} {
++	set vars($symbol) 1
++	set got $rest
++    }
+ 
+-if [info exists vars] then { unset vars }
+-while {[regexp "(\[a-z\]*_symbol)(.*)" $got all symbol rest]} {
+-    set vars($symbol) 1
+-    set got $rest
++    if {![info exists vars(text_symbol)] \
++	 || ![info exists vars(data_symbol)] \
++	 || ![info exists vars(common_symbol)] \
++	 || ![info exists vars(external_symbol)]} then {
++	fail "objdump -t ($testfile)"
++    } else {
++	pass "objdump -t ($testfile)"
++    }
+ }
+ 
+-if {![info exists vars(text_symbol)] \
+-     || ![info exists vars(data_symbol)] \
+-     || ![info exists vars(common_symbol)] \
+-     || ![info exists vars(external_symbol)]} then {
+-    fail "objdump -t"
+-} else {
+-    pass "objdump -t"
++test_objdump_t $testfile
++if { [ remote_file host exists $testarchive ] } then {
++    test_objdump_t $testarchive
+ }
+ 
+ # Test objdump -r
+ 
+-set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -r $testfile"]
++proc test_objdump_r { testfile dumpfile } {
++    global OBJDUMP
++    global OBJDUMPFLAGS
+ 
+-set want "$testfile:\[ 	\]*file format.*RELOCATION RECORDS FOR \\\[\[^\]\]*(text|TEXT|P|\\\$CODE\\\$)\[^\]\]*\\\].*external_symbol"
++    set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -r $testfile"]
+ 
+-if [regexp $want $got] then {
+-    pass "objdump -r"
+-} else {
+-    fail "objdump -r"
++    set want "$dumpfile:\[ 	\]*file format.*RELOCATION RECORDS FOR \\\[\[^\]\]*(text|TEXT|P|\\\$CODE\\\$)\[^\]\]*\\\].*external_symbol"
++
++    if [regexp $want $got] then {
++	pass "objdump -r ($testfile, $dumpfile)"
++    } else {
++	fail "objdump -r ($testfile, $dumpfile)"
++    }
++}
++
++test_objdump_r $testfile $testfile
++if { [ remote_file host exists $testarchive ] } then {
++    test_objdump_r $testarchive bintest2.o
+ }
+ 
+ # Test objdump -s
+ 
+-set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -s $testfile"]
++proc test_objdump_s { testfile dumpfile } {
++    global OBJDUMP
++    global OBJDUMPFLAGS
+ 
+-set want "$testfile:\[ 	\]*file format.*Contents.*(text|TEXT|P|\\\$CODE\\\$)\[^0-9\]*\[ 	\]*\[0-9a-fA-F\]*\[ 	\]*(00000001|01000000|00000100).*Contents.*(data|DATA|D_1)\[^0-9\]*\[ 	\]*\[0-9a-fA-F\]*\[ 	\]*(00000002|02000000|00000200)"
++    set got [binutils_run $OBJDUMP "$OBJDUMPFLAGS -s $testfile"]
+ 
+-if [regexp $want $got] then {
+-    pass "objdump -s"
+-} else {
+-    fail "objdump -s"
++    set want "$dumpfile:\[ 	\]*file format.*Contents.*(text|TEXT|P|\\\$CODE\\\$)\[^0-9\]*\[ 	\]*\[0-9a-fA-F\]*\[ 	\]*(00000001|01000000|00000100).*Contents.*(data|DATA|D_1)\[^0-9\]*\[ 	\]*\[0-9a-fA-F\]*\[ 	\]*(00000002|02000000|00000200)"
++
++    if [regexp $want $got] then {
++	pass "objdump -s ($testfile, $dumpfile)"
++    } else {
++	fail "objdump -s ($testfile, $dumpfile)"
++    }
++}
++
++test_objdump_s $testfile $testfile
++if { [ remote_file host exists $testarchive ] } then {
++    test_objdump_s $testarchive bintest2.o
+ }
+ 
+ # Test objdump -s on a file that contains a compressed .debug section
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-05-30  H.J. Lu  <hongjiu.lu@intel.com>
++
++       PR binutils/21519
++       * bfdio.c (bfd_get_file_size): New function.
++       * bfd-in2.h: Regenerated.
++
+ 2017-06-27  Alan Modra  <amodra@gmail.com>
+ 
+        PR binutils/21665
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,16 @@
++2017-05-30  H.J. Lu  <hongjiu.lu@intel.com>
++
++       PR binutils/21519
++       * objdump.c (dump_relocs_in_section): Replace get_file_size
++       with bfd_get_file_size to get archive element size.
++       * testsuite/binutils-all/objdump.exp (test_objdump_f): New
++       proc.
++       (test_objdump_h): Likewise.
++       (test_objdump_t): Likewise.
++       (test_objdump_r): Likewise.
++       (test_objdump_s): Likewise.
++       Add objdump tests on archive.
++
+ 2017-07-01  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR binutils/21665
-- 
2.7.4


