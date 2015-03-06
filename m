Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EB7446017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 12:43:43 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Fri, 6 Mar 2015
	13:43:44 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 13:43:36 +0100
Message-ID: <1425645816-14470-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Cc: sona@enea.se
Subject: [daisy][PATCH] binutils: several security fixes
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
X-List-Received-Date: Fri, 06 Mar 2015 12:43:45 -0000
Content-Type: text/plain

From: Armin Kuster <akuster808@gmail.com>

CVE-2014-8484
CVE-2014-8485
CVE-2014-8501
CVE-2014-8502
CVE-2014-8503
CVE-2014-8504
CVE-2014-8737

and one supporting patch.

[Yocto # 7084]

(From OE-Core rev: 859fb4d9ec6974be9ce755e4ffefd9b199f3604c)

(From OE-Core rev: d2b2d8c9ce3ef16ab053bd19a5705b01402b76ba)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils-2.24.inc   |   8 +
 .../binutils/binutils/binutils_CVE-2014-8484.patch |  67 +++
 .../binutils/binutils/binutils_CVE-2014-8485.patch | 102 ++++
 .../binutils/binutils/binutils_CVE-2014-8501.patch |  60 +++
 .../binutils/binutils/binutils_CVE-2014-8502.patch |  89 ++++
 .../binutils/binutils_CVE-2014-8502_1.patch        | 523 +++++++++++++++++++++
 .../binutils/binutils/binutils_CVE-2014-8503.patch |  47 ++
 .../binutils/binutils/binutils_CVE-2014-8504.patch |  75 +++
 .../binutils/binutils/binutils_CVE-2014-8737.patch | 177 +++++++
 9 files changed, 1148 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc b/meta/recipes-devtools/binutils/binutils-2.24.inc
index 8f3216f..63c9287 100644
--- a/meta/recipes-devtools/binutils/binutils-2.24.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
@@ -32,6 +32,14 @@ SRC_URI = "\
      file://replace_macros_with_static_inline.patch \
      file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch \
      file://binutils-uninitialised-warning.patch \
+     file://binutils_CVE-2014-8484.patch \
+     file://binutils_CVE-2014-8485.patch \
+     file://binutils_CVE-2014-8501.patch \
+     file://binutils_CVE-2014-8502_1.patch \
+     file://binutils_CVE-2014-8502.patch \
+     file://binutils_CVE-2014-8503.patch \
+     file://binutils_CVE-2014-8504.patch \
+     file://binutils_CVE-2014-8737.patch \
      "
 
 SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
new file mode 100644
index 0000000..e789499
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
@@ -0,0 +1,67 @@
+Upstream-Status: Backport
+
+CVE-2014-8484 fix.
+
+[YOCTO #7084]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+From bd25671c6f202c4a5108883caa2adb24ff6f361f Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 29 Aug 2014 10:36:29 +0930
+Subject: [PATCH] Report an error for S-records with less than the miniumum
+ size
+
+	* srec.c (srec_scan): Revert last change.  Report an error for
+	S-records with less than the miniumum byte count.
+---
+ bfd/ChangeLog |  5 +++++
+ bfd/srec.c    | 18 +++++++++++++++---
+ 2 files changed, 20 insertions(+), 3 deletions(-)
+
+Index: binutils-2.24/bfd/srec.c
+===================================================================
+--- binutils-2.24.orig/bfd/srec.c
++++ binutils-2.24/bfd/srec.c
+@@ -455,7 +455,7 @@ srec_scan (bfd *abfd)
+ 	  {
+ 	    file_ptr pos;
+ 	    char hdr[3];
+-	    unsigned int bytes;
++	    unsigned int bytes, min_bytes;
+ 	    bfd_vma address;
+ 	    bfd_byte *data;
+ 	    unsigned char check_sum;
+@@ -478,6 +478,19 @@ srec_scan (bfd *abfd)
+ 	      }
+ 
+ 	    check_sum = bytes = HEX (hdr + 1);
++	    min_bytes = 3;
++	    if (hdr[0] == '2' || hdr[0] == '8')
++	      min_bytes = 4;
++	    else if (hdr[0] == '3' || hdr[0] == '7')
++	      min_bytes = 5;
++	    if (bytes < min_bytes)
++	      {
++		(*_bfd_error_handler) (_("%B:%d: byte count %d too small\n"),
++				       abfd, lineno, bytes);
++		bfd_set_error (bfd_error_bad_value);
++		goto error_return;
++	      }
++
+ 	    if (bytes * 2 > bufsize)
+ 	      {
+ 		if (buf != NULL)
+Index: binutils-2.24/bfd/ChangeLog
+===================================================================
+--- binutils-2.24.orig/bfd/ChangeLog
++++ binutils-2.24/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2014-08-29  Alan Modra  <amodra@gmail.com>
++
++       * srec.c (srec_scan): Revert last change.  Report an error for
++       S-records with less than the miniumum byte count.
++
+ 2013-12-02  Tristan Gingold  <gingold@adacore.com>
+ 
+ 	* configure.in: Bump version to 2.24
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
new file mode 100644
index 0000000..ec3308b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
@@ -0,0 +1,102 @@
+Upstream-Status: Backport
+
+CVE-2014-8485 fix.
+
+[YOCTO #7084]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+From 493a33860c71cac998f1a56d6d87d6faa801fbaa Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 27 Oct 2014 12:43:16 +0000
+Subject: [PATCH] This patch closes a potential security hole in applications
+ that use the bfd library to parse binaries containing maliciously corrupt
+ section group headers.
+
+	PR binutils/17510
+	* elf.c (setup_group): Improve handling of corrupt group
+	sections.
+---
+ bfd/ChangeLog |  6 ++++++
+ bfd/elf.c     | 34 ++++++++++++++++++++++++++++++----
+ 2 files changed, 36 insertions(+), 4 deletions(-)
+
+Index: binutils-2.24/bfd/elf.c
+===================================================================
+--- binutils-2.24.orig/bfd/elf.c
++++ binutils-2.24/bfd/elf.c
+@@ -608,9 +608,10 @@ setup_group (bfd *abfd, Elf_Internal_Shd
+ 		  if (shdr->contents == NULL)
+ 		    {
+ 		      _bfd_error_handler
+-			(_("%B: Corrupt size field in group section header: 0x%lx"), abfd, shdr->sh_size);
++			(_("%B: corrupt size field in group section header: 0x%lx"), abfd, shdr->sh_size);
+ 		      bfd_set_error (bfd_error_bad_value);
+-		      return FALSE;
++		      -- num_group;
++		      continue;
+ 		    }
+ 
+ 		  memset (shdr->contents, 0, amt);
+@@ -618,7 +619,16 @@ setup_group (bfd *abfd, Elf_Internal_Shd
+ 		  if (bfd_seek (abfd, shdr->sh_offset, SEEK_SET) != 0
+ 		      || (bfd_bread (shdr->contents, shdr->sh_size, abfd)
+ 			  != shdr->sh_size))
+-		    return FALSE;
++		    {
++		      _bfd_error_handler
++			(_("%B: invalid size field in group section header: 0x%lx"), abfd, shdr->sh_size);
++		      bfd_set_error (bfd_error_bad_value);
++		      -- num_group;
++		      /* PR 17510: If the group contents are even partially
++			 corrupt, do not allow any of the contents to be used.  */
++		      memset (shdr->contents, 0, amt);
++		      continue;
++		    }
+ 
+ 		  /* Translate raw contents, a flag word followed by an
+ 		     array of elf section indices all in target byte order,
+@@ -651,6 +661,21 @@ setup_group (bfd *abfd, Elf_Internal_Shd
+ 		    }
+ 		}
+ 	    }
++
++	  /* PR 17510: Corrupt binaries might contain invalid groups.  */
++	  if (num_group != (unsigned) elf_tdata (abfd)->num_group)
++	    {
++	      elf_tdata (abfd)->num_group = num_group;
++
++	      /* If all groups are invalid then fail.  */
++	      if (num_group == 0)
++		{
++		  elf_tdata (abfd)->group_sect_ptr = NULL;
++		  elf_tdata (abfd)->num_group = num_group = -1;
++		  (*_bfd_error_handler) (_("%B: no valid group sections found"), abfd);
++		  bfd_set_error (bfd_error_bad_value);
++		}
++	    }
+ 	}
+     }
+ 
+@@ -716,6 +741,7 @@ setup_group (bfd *abfd, Elf_Internal_Shd
+     {
+       (*_bfd_error_handler) (_("%B: no group info for section %A"),
+ 			     abfd, newsect);
++      return FALSE;
+     }
+   return TRUE;
+ }
+Index: binutils-2.24/bfd/ChangeLog
+===================================================================
+--- binutils-2.24.orig/bfd/ChangeLog
++++ binutils-2.24/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2014-10-27  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/17510
++       * elf.c (setup_group): Improve handling of corrupt group
++       sections.
++
+ 2014-08-29  Alan Modra  <amodra@gmail.com>
+ 
+        * srec.c (srec_scan): Revert last change.  Report an error for
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
new file mode 100644
index 0000000..a48fe9b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+
+CVE-2014-8501 fix.
+
+[YOCTO #7084]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+From 7e1e19887abd24aeb15066b141cdff5541e0ec8e Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 27 Oct 2014 14:45:06 +0000
+Subject: [PATCH] Fix a seg-fault in strings and other binutuils when parsing a
+ corrupt PE executable with an invalid value in the NumberOfRvaAndSizes field
+ of the AOUT header.
+
+	PR binutils/17512
+	* peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handle corrupt binaries
+	with an invalid value for NumberOfRvaAndSizes.
+---
+ bfd/ChangeLog  |  4 ++++
+ bfd/peXXigen.c | 12 ++++++++++++
+ 2 files changed, 16 insertions(+)
+
+Index: binutils-2.24/bfd/peXXigen.c
+===================================================================
+--- binutils-2.24.orig/bfd/peXXigen.c
++++ binutils-2.24/bfd/peXXigen.c
+@@ -460,6 +460,18 @@ _bfd_XXi_swap_aouthdr_in (bfd * abfd,
+   {
+     int idx;
+ 
++    /* PR 17512: Corrupt PE binaries can cause seg-faults.  */
++    if (a->NumberOfRvaAndSizes > 16)
++      {
++	(*_bfd_error_handler)
++	  (_("%B: aout header specifies an invalid number of data-directory entries: %d"),
++	   abfd, a->NumberOfRvaAndSizes);
++	/* Paranoia: If the number is corrupt, then assume that the
++	   actual entries themselves might be corrupt as well.  */
++	a->NumberOfRvaAndSizes = 0;
++      }
++
++
+     for (idx = 0; idx < a->NumberOfRvaAndSizes; idx++)
+       {
+         /* If data directory is empty, rva also should be 0.  */
+Index: binutils-2.24/bfd/ChangeLog
+===================================================================
+--- binutils-2.24.orig/bfd/ChangeLog
++++ binutils-2.24/bfd/ChangeLog
+@@ -1,5 +1,9 @@
+ 2014-10-27  Nick Clifton  <nickc@redhat.com>
+ 
++       PR binutils/17512
++       * peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handle corrupt binaries
++       with an invalid value for NumberOfRvaAndSizes.
++
+        PR binutils/17510
+        * elf.c (setup_group): Improve handling of corrupt group
+        sections.
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
new file mode 100644
index 0000000..05af65b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
@@ -0,0 +1,89 @@
+Upstream-Status: Backport
+
+CVE-2014-8502 fix.
+
+[YOCTO #7084]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+From 5a4b0ccc20ba30caef53b01bee2c0aaa5b855339 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 28 Oct 2014 15:42:56 +0000
+Subject: [PATCH] More fixes for corrupt binaries crashing the binutils.
+
+	PR binutils/17512
+	* elf.c (bfd_section_from_shdr): Allocate and free the recursion
+	detection table on a per-bfd basis.
+	* peXXigen.c (pe_print_edata): Handle binaries with a truncated
+	export table.
+---
+ bfd/ChangeLog  |  8 ++++++++
+ bfd/elf.c      | 16 +++++++++++++---
+ bfd/peXXigen.c |  9 +++++++++
+ 3 files changed, 30 insertions(+), 3 deletions(-)
+
+Index: binutils-2.24/bfd/peXXigen.c
+===================================================================
+--- binutils-2.24.orig/bfd/peXXigen.c
++++ binutils-2.24/bfd/peXXigen.c
+@@ -1438,6 +1438,15 @@ pe_print_edata (bfd * abfd, void * vfile
+ 	}
+     }
+ 
++  /* PR 17512: Handle corrupt PE binaries.  */
++  if (datasize < 36)
++    {
++      fprintf (file,
++	       _("\nThere is an export table in %s, but it is too small (%d)\n"),
++	       section->name, (int) datasize);
++      return TRUE;
++    }
++
+   fprintf (file, _("\nThere is an export table in %s at 0x%lx\n"),
+ 	   section->name, (unsigned long) addr);
+ 
+Index: binutils-2.24/bfd/elf.c
+===================================================================
+--- binutils-2.24.orig/bfd/elf.c
++++ binutils-2.24/bfd/elf.c
+@@ -1576,6 +1576,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
+   const char *name;
+   bfd_boolean ret = TRUE;
+   static bfd_boolean * sections_being_created = NULL;
++  static bfd * sections_being_created_abfd = NULL;
+   static unsigned int nesting = 0;
+ 
+   if (shindex >= elf_numsections (abfd))
+@@ -1588,13 +1589,20 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	 loop.  Detect this here, by refusing to load a section that we are
+ 	 already in the process of loading.  We only trigger this test if
+ 	 we have nested at least three sections deep as normal ELF binaries
+-	 can expect to recurse at least once.  */
++	 can expect to recurse at least once.  
++     
++     FIXME: It would be better if this array was attached to the bfd,
++     rather than being held in a static pointer.  */
++     
++      if (sections_being_created_abfd != abfd)
++        sections_being_created = NULL;
+       
+       if (sections_being_created == NULL)
+ 	{
+ 	  /* FIXME: It would be more efficient to attach this array to the bfd somehow.  */
+ 	  sections_being_created = (bfd_boolean *)
+ 	    bfd_zalloc (abfd, elf_numsections (abfd) * sizeof (bfd_boolean));
++        sections_being_created_abfd = abfd;
+ 	}
+       if (sections_being_created [shindex])
+ 	{
+@@ -2098,7 +2106,10 @@ bfd_section_from_shdr (bfd *abfd, unsign
+   if (sections_being_created)
+     sections_being_created [shindex] = FALSE;
+   if (-- nesting == 0)
++  {
+     sections_being_created = NULL;
++    sections_being_created_abfd = abfd;
++  }
+   return ret;
+ }
+ 
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
new file mode 100644
index 0000000..9e0c9c8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
@@ -0,0 +1,523 @@
+Upstream-Status: Backport
+
+CVE-2014-8502 supporting patch.
+
+[YOCTO #7084]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+From bf67003b4567600ed3022a439207ac8f26454f91 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 27 Oct 2014 18:05:37 +0000
+Subject: [PATCH] This fixes more seg-faults in tools like "strings" and
+ "objdump" when presented with corrupt binaries.
+
+	PR binutils/17512
+	* elf.c (bfd_section_from_shdr): Detect and warn about ELF
+	binaries with a group of sections linked by the string table
+	indicies.
+	* peXXigen.c (pe_print_edata): Detect out of range rvas and
+	entry counts for the Export Address table, Name Pointer table
+	 and Ordinal table.
+---
+ bfd/ChangeLog  |   5 ++
+ bfd/elf.c      | 194 ++++++++++++++++++++++++++++++++++++++-------------------
+ bfd/peXXigen.c |  18 +++++-
+ 3 files changed, 150 insertions(+), 67 deletions(-)
+
+Index: binutils-2.24/bfd/elf.c
+===================================================================
+--- binutils-2.24.orig/bfd/elf.c
++++ binutils-2.24/bfd/elf.c
+@@ -1574,38 +1574,67 @@ bfd_section_from_shdr (bfd *abfd, unsign
+   Elf_Internal_Ehdr *ehdr;
+   const struct elf_backend_data *bed;
+   const char *name;
++  bfd_boolean ret = TRUE;
++  static bfd_boolean * sections_being_created = NULL;
++  static unsigned int nesting = 0;
+ 
+   if (shindex >= elf_numsections (abfd))
+     return FALSE;
+ 
++  if (++ nesting > 3)
++    {
++      /* PR17512: A corrupt ELF binary might contain a recursive group of
++	 sections, each the string indicies pointing to the next in the
++	 loop.  Detect this here, by refusing to load a section that we are
++	 already in the process of loading.  We only trigger this test if
++	 we have nested at least three sections deep as normal ELF binaries
++	 can expect to recurse at least once.  */
++      
++      if (sections_being_created == NULL)
++	{
++	  /* FIXME: It would be more efficient to attach this array to the bfd somehow.  */
++	  sections_being_created = (bfd_boolean *)
++	    bfd_zalloc (abfd, elf_numsections (abfd) * sizeof (bfd_boolean));
++	}
++      if (sections_being_created [shindex])
++	{
++	  (*_bfd_error_handler)
++	    (_("%B: warning: loop in section dependencies detected"), abfd);
++	  return FALSE;
++	}
++      sections_being_created [shindex] = TRUE;
++    }
++
+   hdr = elf_elfsections (abfd)[shindex];
+   ehdr = elf_elfheader (abfd);
+   name = bfd_elf_string_from_elf_section (abfd, ehdr->e_shstrndx,
+ 					  hdr->sh_name);
+   if (name == NULL)
+-    return FALSE;
++    goto fail;
+ 
+   bed = get_elf_backend_data (abfd);
+   switch (hdr->sh_type)
+     {
+     case SHT_NULL:
+       /* Inactive section. Throw it away.  */
+-      return TRUE;
++      goto success;
+ 
+-    case SHT_PROGBITS:	/* Normal section with contents.  */
+-    case SHT_NOBITS:	/* .bss section.  */
+-    case SHT_HASH:	/* .hash section.  */
+-    case SHT_NOTE:	/* .note section.  */
++    case SHT_PROGBITS:		/* Normal section with contents.  */
++    case SHT_NOBITS:		/* .bss section.  */
++    case SHT_HASH:		/* .hash section.  */
++    case SHT_NOTE:		/* .note section.  */
+     case SHT_INIT_ARRAY:	/* .init_array section.  */
+     case SHT_FINI_ARRAY:	/* .fini_array section.  */
+     case SHT_PREINIT_ARRAY:	/* .preinit_array section.  */
+     case SHT_GNU_LIBLIST:	/* .gnu.liblist section.  */
+     case SHT_GNU_HASH:		/* .gnu.hash section.  */
+-      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      goto success;
+ 
+     case SHT_DYNAMIC:	/* Dynamic linking information.  */
+       if (! _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex))
+-	return FALSE;
++	goto fail;
++
+       if (hdr->sh_link > elf_numsections (abfd))
+ 	{
+ 	  /* PR 10478: Accept Solaris binaries with a sh_link
+@@ -1619,11 +1648,11 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 		break;
+ 	      /* Otherwise fall through.  */
+ 	    default:
+-	      return FALSE;
++	      goto fail;
+ 	    }
+ 	}
+       else if (elf_elfsections (abfd)[hdr->sh_link] == NULL)
+-	return FALSE;
++	goto fail;
+       else if (elf_elfsections (abfd)[hdr->sh_link]->sh_type != SHT_STRTAB)
+ 	{
+ 	  Elf_Internal_Shdr *dynsymhdr;
+@@ -1652,24 +1681,26 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 		}
+ 	    }
+ 	}
+-      break;
++      goto success;
+ 
+-    case SHT_SYMTAB:		/* A symbol table */
++    case SHT_SYMTAB:		/* A symbol table.  */
+       if (elf_onesymtab (abfd) == shindex)
+-	return TRUE;
++	goto success;
+ 
+       if (hdr->sh_entsize != bed->s->sizeof_sym)
+-	return FALSE;
++	goto fail;
++
+       if (hdr->sh_info * hdr->sh_entsize > hdr->sh_size)
+ 	{
+ 	  if (hdr->sh_size != 0)
+-	    return FALSE;
++	    goto fail;
+ 	  /* Some assemblers erroneously set sh_info to one with a
+ 	     zero sh_size.  ld sees this as a global symbol count
+ 	     of (unsigned) -1.  Fix it here.  */
+ 	  hdr->sh_info = 0;
+-	  return TRUE;
++	  goto success;
+ 	}
++
+       BFD_ASSERT (elf_onesymtab (abfd) == 0);
+       elf_onesymtab (abfd) = shindex;
+       elf_tdata (abfd)->symtab_hdr = *hdr;
+@@ -1686,7 +1717,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	  && (abfd->flags & DYNAMIC) != 0
+ 	  && ! _bfd_elf_make_section_from_shdr (abfd, hdr, name,
+ 						shindex))
+-	return FALSE;
++	goto fail;
+ 
+       /* Go looking for SHT_SYMTAB_SHNDX too, since if there is one we
+ 	 can't read symbols without that section loaded as well.  It
+@@ -1712,26 +1743,29 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 		  break;
+ 	      }
+ 	  if (i != shindex)
+-	    return bfd_section_from_shdr (abfd, i);
++	    ret = bfd_section_from_shdr (abfd, i);
+ 	}
+-      return TRUE;
++      goto success;
+ 
+-    case SHT_DYNSYM:		/* A dynamic symbol table */
++    case SHT_DYNSYM:		/* A dynamic symbol table.  */
+       if (elf_dynsymtab (abfd) == shindex)
+-	return TRUE;
++	goto success;
+ 
+       if (hdr->sh_entsize != bed->s->sizeof_sym)
+-	return FALSE;
++	goto fail;
++
+       if (hdr->sh_info * hdr->sh_entsize > hdr->sh_size)
+ 	{
+ 	  if (hdr->sh_size != 0)
+-	    return FALSE;
++	    goto fail;
++
+ 	  /* Some linkers erroneously set sh_info to one with a
+ 	     zero sh_size.  ld sees this as a global symbol count
+ 	     of (unsigned) -1.  Fix it here.  */
+ 	  hdr->sh_info = 0;
+-	  return TRUE;
++	  goto success;
+ 	}
++
+       BFD_ASSERT (elf_dynsymtab (abfd) == 0);
+       elf_dynsymtab (abfd) = shindex;
+       elf_tdata (abfd)->dynsymtab_hdr = *hdr;
+@@ -1740,34 +1774,38 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 
+       /* Besides being a symbol table, we also treat this as a regular
+ 	 section, so that objcopy can handle it.  */
+-      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      goto success;
+ 
+-    case SHT_SYMTAB_SHNDX:	/* Symbol section indices when >64k sections */
++    case SHT_SYMTAB_SHNDX:	/* Symbol section indices when >64k sections.  */
+       if (elf_symtab_shndx (abfd) == shindex)
+-	return TRUE;
++	goto success;
+ 
+       BFD_ASSERT (elf_symtab_shndx (abfd) == 0);
+       elf_symtab_shndx (abfd) = shindex;
+       elf_tdata (abfd)->symtab_shndx_hdr = *hdr;
+       elf_elfsections (abfd)[shindex] = &elf_tdata (abfd)->symtab_shndx_hdr;
+-      return TRUE;
++      goto success;
+ 
+-    case SHT_STRTAB:		/* A string table */
++    case SHT_STRTAB:		/* A string table.  */
+       if (hdr->bfd_section != NULL)
+-	return TRUE;
++	goto success;
++
+       if (ehdr->e_shstrndx == shindex)
+ 	{
+ 	  elf_tdata (abfd)->shstrtab_hdr = *hdr;
+ 	  elf_elfsections (abfd)[shindex] = &elf_tdata (abfd)->shstrtab_hdr;
+-	  return TRUE;
++	  goto success;
+ 	}
++
+       if (elf_elfsections (abfd)[elf_onesymtab (abfd)]->sh_link == shindex)
+ 	{
+ 	symtab_strtab:
+ 	  elf_tdata (abfd)->strtab_hdr = *hdr;
+ 	  elf_elfsections (abfd)[shindex] = &elf_tdata (abfd)->strtab_hdr;
+-	  return TRUE;
++	  goto success;
+ 	}
++
+       if (elf_elfsections (abfd)[elf_dynsymtab (abfd)]->sh_link == shindex)
+ 	{
+ 	dynsymtab_strtab:
+@@ -1776,8 +1814,9 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	  elf_elfsections (abfd)[shindex] = hdr;
+ 	  /* We also treat this as a regular section, so that objcopy
+ 	     can handle it.  */
+-	  return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
+-						  shindex);
++	  ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
++						 shindex);
++	  goto success;
+ 	}
+ 
+       /* If the string table isn't one of the above, then treat it as a
+@@ -1795,9 +1834,9 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 		{
+ 		  /* Prevent endless recursion on broken objects.  */
+ 		  if (i == shindex)
+-		    return FALSE;
++		    goto fail;
+ 		  if (! bfd_section_from_shdr (abfd, i))
+-		    return FALSE;
++		    goto fail;
+ 		  if (elf_onesymtab (abfd) == i)
+ 		    goto symtab_strtab;
+ 		  if (elf_dynsymtab (abfd) == i)
+@@ -1805,7 +1844,8 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 		}
+ 	    }
+ 	}
+-      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      goto success;
+ 
+     case SHT_REL:
+     case SHT_RELA:
+@@ -1820,7 +1860,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	if (hdr->sh_entsize
+ 	    != (bfd_size_type) (hdr->sh_type == SHT_REL
+ 				? bed->s->sizeof_rel : bed->s->sizeof_rela))
+-	  return FALSE;
++	  goto fail;
+ 
+ 	/* Check for a bogus link to avoid crashing.  */
+ 	if (hdr->sh_link >= num_sec)
+@@ -1828,8 +1868,9 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	    ((*_bfd_error_handler)
+ 	     (_("%B: invalid link %lu for reloc section %s (index %u)"),
+ 	      abfd, hdr->sh_link, name, shindex));
+-	    return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
+-						    shindex);
++	    ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
++						   shindex);
++	    goto success;
+ 	  }
+ 
+ 	/* For some incomprehensible reason Oracle distributes
+@@ -1870,7 +1911,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	if ((elf_elfsections (abfd)[hdr->sh_link]->sh_type == SHT_SYMTAB
+ 	     || elf_elfsections (abfd)[hdr->sh_link]->sh_type == SHT_DYNSYM)
+ 	    && ! bfd_section_from_shdr (abfd, hdr->sh_link))
+-	  return FALSE;
++	  goto fail;
+ 
+ 	/* If this reloc section does not use the main symbol table we
+ 	   don't treat it as a reloc section.  BFD can't adequately
+@@ -1885,14 +1926,18 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	    || hdr->sh_info >= num_sec
+ 	    || elf_elfsections (abfd)[hdr->sh_info]->sh_type == SHT_REL
+ 	    || elf_elfsections (abfd)[hdr->sh_info]->sh_type == SHT_RELA)
+-	  return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
+-						  shindex);
++	  {
++	    ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
++						   shindex);
++	    goto success;
++	  }
+ 
+ 	if (! bfd_section_from_shdr (abfd, hdr->sh_info))
+-	  return FALSE;
++	  goto fail;
++
+ 	target_sect = bfd_section_from_elf_index (abfd, hdr->sh_info);
+ 	if (target_sect == NULL)
+-	  return FALSE;
++	  goto fail;
+ 
+ 	esdt = elf_section_data (target_sect);
+ 	if (hdr->sh_type == SHT_RELA)
+@@ -1904,7 +1949,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	amt = sizeof (*hdr2);
+ 	hdr2 = (Elf_Internal_Shdr *) bfd_alloc (abfd, amt);
+ 	if (hdr2 == NULL)
+-	  return FALSE;
++	  goto fail;
+ 	*hdr2 = *hdr;
+ 	*p_hdr = hdr2;
+ 	elf_elfsections (abfd)[shindex] = hdr2;
+@@ -1920,34 +1965,40 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	      target_sect->use_rela_p = 1;
+ 	  }
+ 	abfd->flags |= HAS_RELOC;
+-	return TRUE;
++	goto success;
+       }
+ 
+     case SHT_GNU_verdef:
+       elf_dynverdef (abfd) = shindex;
+       elf_tdata (abfd)->dynverdef_hdr = *hdr;
+-      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      goto success;
+ 
+     case SHT_GNU_versym:
+       if (hdr->sh_entsize != sizeof (Elf_External_Versym))
+-	return FALSE;
++	goto fail;
++
+       elf_dynversym (abfd) = shindex;
+       elf_tdata (abfd)->dynversym_hdr = *hdr;
+-      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      goto success;
+ 
+     case SHT_GNU_verneed:
+       elf_dynverref (abfd) = shindex;
+       elf_tdata (abfd)->dynverref_hdr = *hdr;
+-      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++      goto success;
+ 
+     case SHT_SHLIB:
+-      return TRUE;
++      goto success;
+ 
+     case SHT_GROUP:
+       if (! IS_VALID_GROUP_SECTION_HEADER (hdr, GRP_ENTRY_SIZE))
+-	return FALSE;
++	goto fail;
++
+       if (!_bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex))
+-	return FALSE;
++	goto fail;
++
+       if (hdr->contents != NULL)
+ 	{
+ 	  Elf_Internal_Group *idx = (Elf_Internal_Group *) hdr->contents;
+@@ -1973,7 +2024,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 		}
+ 	    }
+ 	}
+-      break;
++      goto success;
+ 
+     default:
+       /* Possibly an attributes section.  */
+@@ -1981,14 +2032,14 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	  || hdr->sh_type == bed->obj_attrs_section_type)
+ 	{
+ 	  if (! _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex))
+-	    return FALSE;
++	    goto fail;
+ 	  _bfd_elf_parse_attributes (abfd, hdr);
+-	  return TRUE;
++	  goto success;
+ 	}
+ 
+       /* Check for any processor-specific section types.  */
+       if (bed->elf_backend_section_from_shdr (abfd, hdr, name, shindex))
+-	return TRUE;
++	goto success;
+ 
+       if (hdr->sh_type >= SHT_LOUSER && hdr->sh_type <= SHT_HIUSER)
+ 	{
+@@ -2000,9 +2051,12 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 		 "specific section `%s' [0x%8x]"),
+ 	       abfd, name, hdr->sh_type);
+ 	  else
+-	    /* Allow sections reserved for applications.  */
+-	    return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
+-						    shindex);
++	    {
++	      /* Allow sections reserved for applications.  */
++	      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
++						     shindex);
++	      goto success;
++	    }
+ 	}
+       else if (hdr->sh_type >= SHT_LOPROC
+ 	       && hdr->sh_type <= SHT_HIPROC)
+@@ -2023,8 +2077,11 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 		 "`%s' [0x%8x]"),
+ 	       abfd, name, hdr->sh_type);
+ 	  else
+-	    /* Otherwise it should be processed.  */
+-	    return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++	    {
++	      /* Otherwise it should be processed.  */
++	      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
++	      goto success;
++	    }
+ 	}
+       else
+ 	/* FIXME: We should handle this section.  */
+@@ -2032,10 +2089,17 @@ bfd_section_from_shdr (bfd *abfd, unsign
+ 	  (_("%B: don't know how to handle section `%s' [0x%8x]"),
+ 	   abfd, name, hdr->sh_type);
+ 
+-      return FALSE;
++      goto fail;
+     }
+ 
+-  return TRUE;
++ fail:
++  ret = FALSE;
++ success:
++  if (sections_being_created)
++    sections_being_created [shindex] = FALSE;
++  if (-- nesting == 0)
++    sections_being_created = NULL;
++  return ret;
+ }
+ 
+ /* Return the local symbol specified by ABFD, R_SYMNDX.  */
+Index: binutils-2.24/bfd/peXXigen.c
+===================================================================
+--- binutils-2.24.orig/bfd/peXXigen.c
++++ binutils-2.24/bfd/peXXigen.c
+@@ -1528,7 +1528,12 @@ pe_print_edata (bfd * abfd, void * vfile
+ 	  _("\nExport Address Table -- Ordinal Base %ld\n"),
+ 	  edt.base);
+ 
+-  for (i = 0; i < edt.num_functions; ++i)
++  /* PR 17512: Handle corrupt PE binaries.  */
++  if (edt.eat_addr + (edt.num_functions * 4) - adj >= datasize)
++    fprintf (file, _("\tInvalid Export Address Table rva (0x%lx) or entry count (0x%lx)\n"),
++	     (long) edt.eat_addr,
++	     (long) edt.num_functions);
++  else for (i = 0; i < edt.num_functions; ++i)
+     {
+       bfd_vma eat_member = bfd_get_32 (abfd,
+ 				       data + edt.eat_addr + (i * 4) - adj);
+@@ -1564,7 +1569,16 @@ pe_print_edata (bfd * abfd, void * vfile
+   fprintf (file,
+ 	   _("\n[Ordinal/Name Pointer] Table\n"));
+ 
+-  for (i = 0; i < edt.num_names; ++i)
++  /* PR 17512: Handle corrupt PE binaries.  */
++  if (edt.npt_addr + (edt.num_names * 4) - adj >= datasize)
++    fprintf (file, _("\tInvalid Name Pointer Table rva (0x%lx) or entry count (0x%lx)\n"),
++	     (long) edt.npt_addr,
++	     (long) edt.num_names);
++  else if (edt.ot_addr + (edt.num_names * 2) - adj >= datasize)
++    fprintf (file, _("\tInvalid Ordinal Table rva (0x%lx) or entry count (0x%lx)\n"),
++	     (long) edt.ot_addr,
++	     (long) edt.num_names);
++  else for (i = 0; i < edt.num_names; ++i)
+     {
+       bfd_vma name_ptr = bfd_get_32 (abfd,
+ 				    data +
+Index: binutils-2.24/bfd/ChangeLog
+===================================================================
+--- binutils-2.24.orig/bfd/ChangeLog
++++ binutils-2.24/bfd/ChangeLog
+@@ -1,8 +1,13 @@
+ 2014-10-27  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/17512
++       * elf.c (bfd_section_from_shdr): Detect and warn about ELF
++       binaries with a group of sections linked by the string table
++       indicies.
+        * peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handle corrupt binaries
+        with an invalid value for NumberOfRvaAndSizes.
++       (pe_print_edata): Detect out of range rvas and entry counts for
++       the Export Address table, Name Pointer table and Ordinal table.
+ 
+        PR binutils/17510
+        * elf.c (setup_group): Improve handling of corrupt group
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
new file mode 100644
index 0000000..2dd3354
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Backport
+
+CVE-2014-8503 fix.
+
+[YOCTO #7084]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+From 0102ea8cec5fc509bba6c91df61b7ce23a799d32 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 30 Oct 2014 17:16:17 +0000
+Subject: [PATCH] Fixes a seg-fault in the ihex parser when it encounters a
+ malformed ihex file.
+
+	PR binutils/17512
+	* ihex.c (ihex_scan): Fix typo in invocation of ihex_bad_byte.
+---
+ bfd/ChangeLog | 1 +
+ bfd/ihex.c    | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+Index: binutils-2.24/bfd/ihex.c
+===================================================================
+--- binutils-2.24.orig/bfd/ihex.c
++++ binutils-2.24/bfd/ihex.c
+@@ -322,7 +322,7 @@ ihex_scan (bfd *abfd)
+ 	    {
+ 	      if (! ISHEX (buf[i]))
+ 		{
+-		  ihex_bad_byte (abfd, lineno, hdr[i], error);
++		  ihex_bad_byte (abfd, lineno, buf[i], error);
+ 		  goto error_return;
+ 		}
+ 	    }
+Index: binutils-2.24/bfd/ChangeLog
+===================================================================
+--- binutils-2.24.orig/bfd/ChangeLog
++++ binutils-2.24/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2014-10-30  Nick Clifton  <nickc@redhat.com>
++
++    PR binutils/17512
++    * ihex.c (ihex_scan): Fix typo in invocation of ihex_bad_byte.
++
+ 2014-10-27  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/17512
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
new file mode 100644
index 0000000..b4d1d1f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
@@ -0,0 +1,75 @@
+Upstream-Status: Backport
+
+CVE-2014-8504 fix.
+
+[YOCTO #7084]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+From 708d7d0d11f0f2d776171979aa3479e8e12a38a0 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 28 Oct 2014 10:48:14 +0000
+Subject: [PATCH] This patch fixes a flaw in the SREC parser which could cause
+ a stack overflow and potential secuiryt breach.
+
+	PR binutils/17510
+	* srec.c (srec_bad_byte): Increase size of buf to allow for
+	negative values.
+	(srec_scan): Use an unsigned char buffer to hold header bytes.
+---
+ bfd/ChangeLog  | 8 ++++++++
+ bfd/elf.c      | 2 +-
+ bfd/peXXigen.c | 1 -
+ bfd/srec.c     | 4 ++--
+ 4 files changed, 11 insertions(+), 4 deletions(-)
+
+Index: binutils-2.24/bfd/ChangeLog
+===================================================================
+--- binutils-2.24.orig/bfd/ChangeLog
++++ binutils-2.24/bfd/ChangeLog
+@@ -1,3 +1,11 @@
++2014-10-28  Andreas Schwab  <schwab@suse.de>
++       Nick Clifton  <nickc@redhat.com>
++
++   PR binutils/17510
++   * srec.c (srec_bad_byte): Increase size of buf to allow for
++   negative values.
++   (srec_scan): Use an unsigned char buffer to hold header bytes.
++
+ 2014-10-30  Nick Clifton  <nickc@redhat.com>
+ 
+     PR binutils/17512
+Index: binutils-2.24/bfd/peXXigen.c
+===================================================================
+--- binutils-2.24.orig/bfd/peXXigen.c
++++ binutils-2.24/bfd/peXXigen.c
+@@ -471,7 +471,6 @@ _bfd_XXi_swap_aouthdr_in (bfd * abfd,
+ 	a->NumberOfRvaAndSizes = 0;
+       }
+ 
+-
+     for (idx = 0; idx < a->NumberOfRvaAndSizes; idx++)
+       {
+         /* If data directory is empty, rva also should be 0.  */
+Index: binutils-2.24/bfd/srec.c
+===================================================================
+--- binutils-2.24.orig/bfd/srec.c
++++ binutils-2.24/bfd/srec.c
+@@ -248,7 +248,7 @@ srec_bad_byte (bfd *abfd,
+     }
+   else
+     {
+-      char buf[10];
++      char buf[40];
+ 
+       if (! ISPRINT (c))
+ 	sprintf (buf, "\\%03o", (unsigned int) c);
+@@ -454,7 +454,7 @@ srec_scan (bfd *abfd)
+ 	case 'S':
+ 	  {
+ 	    file_ptr pos;
+-	    char hdr[3];
++	    unsigned char hdr[3];
+ 	    unsigned int bytes, min_bytes;
+ 	    bfd_vma address;
+ 	    bfd_byte *data;
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
new file mode 100644
index 0000000..4a84562
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
@@ -0,0 +1,177 @@
+Upstream-Status: Backport
+
+CVE-2014-8737 fix.
+
+[YOCTO #7084]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+From dd9b91de2149ee81d47f708e7b0bbf57da10ad42 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 6 Nov 2014 14:49:10 +0000
+Subject: [PATCH] Prevent archive memebers with illegal pathnames from being
+ extracted from an archive.
+
+	PR binutils/17552, binutils/17533
+	* bucomm.c (is_valid_archive_path): New function.  Returns false
+	for absolute pathnames and pathnames that include /../.
+	* bucomm.h (is_valid_archive_path): Add prototype.
+	* ar.c (extract_file): Use new function to check for valid
+	pathnames when extracting files from an archive.
+	* objcopy.c (copy_archive): Likewise.
+	* doc/binutils.texi: Update documentation to mention the
+	limitation on pathname of archive members.
+---
+ binutils/ChangeLog         | 16 ++++++++++++++--
+ binutils/ar.c              |  9 +++++++++
+ binutils/bucomm.c          | 26 ++++++++++++++++++++++++++
+ binutils/bucomm.h          | 12 ++++++++----
+ binutils/doc/binutils.texi |  3 ++-
+ binutils/objcopy.c         |  6 ++++++
+ 6 files changed, 65 insertions(+), 7 deletions(-)
+
+Index: binutils-2.24/binutils/ar.c
+===================================================================
+--- binutils-2.24.orig/binutils/ar.c
++++ binutils-2.24/binutils/ar.c
+@@ -1031,6 +1031,15 @@ extract_file (bfd *abfd)
+   bfd_size_type size;
+   struct stat buf;
+ 
++  /* PR binutils/17533: Do not allow directory traversal
++     outside of the current directory tree.  */
++  if (! is_valid_archive_path (bfd_get_filename (abfd)))
++    {
++      non_fatal (_("illegal pathname found in archive member: %s"),
++		 bfd_get_filename (abfd));
++      return;
++    }
++
+   if (bfd_stat_arch_elt (abfd, &buf) != 0)
+     /* xgettext:c-format */
+     fatal (_("internal stat error on %s"), bfd_get_filename (abfd));
+Index: binutils-2.24/binutils/bucomm.c
+===================================================================
+--- binutils-2.24.orig/binutils/bucomm.c
++++ binutils-2.24/binutils/bucomm.c
+@@ -624,3 +624,29 @@ bfd_get_archive_filename (const bfd *abf
+ 	   bfd_get_filename (abfd));
+   return buf;
+ }
++
++/* Returns TRUE iff PATHNAME, a filename of an archive member,
++   is valid for writing.  For security reasons absolute paths
++   and paths containing /../ are not allowed.  See PR 17533.  */
++
++bfd_boolean
++is_valid_archive_path (char const * pathname)
++{
++  const char * n = pathname;
++
++  if (IS_ABSOLUTE_PATH (n))
++    return FALSE;
++
++  while (*n)
++    {
++      if (*n == '.' && *++n == '.' && ( ! *++n || IS_DIR_SEPARATOR (*n)))
++	return FALSE;
++
++      while (*n && ! IS_DIR_SEPARATOR (*n))
++	n++;
++      while (IS_DIR_SEPARATOR (*n))
++	n++;
++    }
++
++  return TRUE;
++}
+Index: binutils-2.24/binutils/bucomm.h
+===================================================================
+--- binutils-2.24.orig/binutils/bucomm.h
++++ binutils-2.24/binutils/bucomm.h
+@@ -23,6 +23,8 @@
+ #ifndef _BUCOMM_H
+ #define _BUCOMM_H
+ 
++/* In bucomm.c.  */
++
+ /* Return the filename in a static buffer.  */
+ const char *bfd_get_archive_filename (const bfd *);
+ 
+@@ -58,20 +60,22 @@ bfd_vma parse_vma (const char *, const c
+ 
+ off_t get_file_size (const char *);
+ 
++bfd_boolean is_valid_archive_path (char const *);
++
+ extern char *program_name;
+ 
+-/* filemode.c */
++/* In filemode.c.  */
+ void mode_string (unsigned long, char *);
+ 
+-/* version.c */
++/* In version.c.  */
+ extern void print_version (const char *);
+ 
+-/* rename.c */
++/* In rename.c.  */
+ extern void set_times (const char *, const struct stat *);
+ 
+ extern int smart_rename (const char *, const char *, int);
+ 
+-/* libiberty.  */
++/* In libiberty.  */
+ void *xmalloc (size_t);
+ 
+ void *xrealloc (void *, size_t);
+Index: binutils-2.24/binutils/doc/binutils.texi
+===================================================================
+--- binutils-2.24.orig/binutils/doc/binutils.texi
++++ binutils-2.24/binutils/doc/binutils.texi
+@@ -234,7 +234,8 @@ a normal archive.  Instead the elements
+ individually to the second archive.
+ 
+ The paths to the elements of the archive are stored relative to the
+-archive itself.
++archive itself.  For security reasons absolute paths and paths with a
++@code{/../} component are not allowed.
+ 
+ @cindex compatibility, @command{ar}
+ @cindex @command{ar} compatibility
+Index: binutils-2.24/binutils/objcopy.c
+===================================================================
+--- binutils-2.24.orig/binutils/objcopy.c
++++ binutils-2.24/binutils/objcopy.c
+@@ -2206,6 +2206,12 @@ copy_archive (bfd *ibfd, bfd *obfd, cons
+       bfd_boolean del = TRUE;
+       bfd_boolean ok_object;
+ 
++      /* PR binutils/17533: Do not allow directory traversal
++	 outside of the current directory tree by archive members.  */
++      if (! is_valid_archive_path (bfd_get_filename (this_element)))
++	fatal (_("illegal pathname found in archive member: %s"),
++	       bfd_get_filename (this_element));
++
+       /* Create an output file for this member.  */
+       output_name = concat (dir, "/",
+ 			    bfd_get_filename (this_element), (char *) 0);
+Index: binutils-2.24/binutils/ChangeLog
+===================================================================
+--- binutils-2.24.orig/binutils/ChangeLog
++++ binutils-2.24/binutils/ChangeLog
+@@ -1,3 +1,15 @@
++2014-11-06  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/17552, binutils/17533
++       * bucomm.c (is_valid_archive_path): New function.  Returns false
++       for absolute pathnames and pathnames that include /../.
++       * bucomm.h (is_valid_archive_path): Add prototype.
++       * ar.c (extract_file): Use new function to check for valid
++       pathnames when extracting files from an archive.
++       * objcopy.c (copy_archive): Likewise.
++       * doc/binutils.texi: Update documentation to mention the
++       limitation on pathname of archive members.
++
+ 2013-11-22  Cory Fields  <cory@coryfields.com>
+ 
+ 	* windres.c (define_resource): Use zero for timestamp, making
-- 
1.9.1


