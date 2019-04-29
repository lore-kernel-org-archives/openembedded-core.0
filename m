Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 129A67DA91
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:26:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2019 23:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,408,1549958400"; d="scan'208";a="146681149"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.129])
	by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2019 23:26:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 14:26:35 +0800
Message-Id: <20190429062636.2338-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429062636.2338-1-anuj.mittal@intel.com>
References: <20190429062636.2338-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] binutils: fix CVE-2019-9074 CVE-2019-9075 CVE-2019-9076 CVE-2019-9077
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
X-List-Received-Date: Mon, 29 Apr 2019 06:26:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../binutils/binutils-2.32.inc                |   4 +
 .../binutils/binutils/CVE-2019-9074.patch     |  68 ++++++++++
 .../binutils/binutils/CVE-2019-9075.patch     | 119 ++++++++++++++++++
 .../binutils/binutils/CVE-2019-9076.patch     |  49 ++++++++
 .../binutils/binutils/CVE-2019-9077.patch     |  37 ++++++
 5 files changed, 277 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 5d0c16b13e..49e6827c1f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -44,6 +44,10 @@ SRC_URI = "\
      file://0013-Detect-64-bit-MIPS-targets.patch \
      file://0014-sync-with-OE-libtool-changes.patch \
      file://0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch \
+     file://CVE-2019-9074.patch \
+     file://CVE-2019-9075.patch \
+     file://CVE-2019-9076.patch \
+     file://CVE-2019-9077.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
new file mode 100644
index 0000000000..a11a51200e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
@@ -0,0 +1,68 @@
+From e2ebb3906432dcca2727186ad79415f920730fb2 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 19 Feb 2019 22:48:44 +1030
+Subject: [PATCH] PR24235, Read memory violation in pei-x86_64.c
+
+	PR 24235
+	* pei-x86_64.c (pex64_bfd_print_pdata_section): Correct checks
+	attempting to prevent read past end of section.
+
+Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/179f2db0d9c397d7dd8a59907b84208b79f7f48c]
+CVE: CVE-2019-9074
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ bfd/ChangeLog    | 6 ++++++
+ bfd/pei-x86_64.c | 9 ++++-----
+ 2 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index dd2c741..cbf30de 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2019-02-19  Alan Modra  <amodra@gmail.com>
++
++	PR 24235
++	* pei-x86_64.c (pex64_bfd_print_pdata_section): Correct checks
++	attempting to prevent read past end of section.
++
+ 2019-02-04  Nick Clifton  <nickc@redhat.com>
+ 
+ 	* development.sh (experimental) Set to false.
+diff --git a/bfd/pei-x86_64.c b/bfd/pei-x86_64.c
+index ff1093c..7e75104 100644
+--- a/bfd/pei-x86_64.c
++++ b/bfd/pei-x86_64.c
+@@ -541,7 +541,7 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
+   /* virt_size might be zero for objects.  */
+   if (stop == 0 && strcmp (abfd->xvec->name, "pe-x86-64") == 0)
+     {
+-      stop = (datasize / onaline) * onaline;
++      stop = datasize;
+       virt_size_is_zero = TRUE;
+     }
+   else if (datasize < stop)
+@@ -551,8 +551,8 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
+ 		 _("Warning: %s section size (%ld) is smaller than virtual size (%ld)\n"),
+ 		 pdata_section->name, (unsigned long) datasize,
+ 		 (unsigned long) stop);
+-	/* Be sure not to read passed datasize.  */
+-	stop = datasize / onaline;
++	/* Be sure not to read past datasize.  */
++	stop = datasize;
+       }
+ 
+   /* Display functions table.  */
+@@ -724,8 +724,7 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
+ 	      altent += imagebase;
+ 
+ 	      if (altent >= pdata_vma
+-		  && (altent + PDATA_ROW_SIZE <= pdata_vma
+-		      + pei_section_data (abfd, pdata_section)->virt_size))
++		  && altent - pdata_vma + PDATA_ROW_SIZE <= stop)
+ 		{
+ 		  pex64_get_runtime_function
+ 		    (abfd, &arf, &pdata[altent - pdata_vma]);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
new file mode 100644
index 0000000000..bcb1310f16
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
@@ -0,0 +1,119 @@
+From 8abac8031ed369a2734b1cdb7df28a39a54b4b49 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 20 Feb 2019 08:21:24 +1030
+Subject: [PATCH] PR24236, Heap buffer overflow in
+ _bfd_archive_64_bit_slurp_armap
+
+	PR 24236
+	* archive64.c (_bfd_archive_64_bit_slurp_armap): Move code adding
+	sentinel NUL to string buffer nearer to loop where it is used.
+	Don't go past sentinel when scanning strings, and don't write
+	NUL again.
+	* archive.c (do_slurp_coff_armap): Simplify string handling to
+	archive64.c style.
+
+Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/8abac8031ed369a2734b1cdb7df28a39a54b4b49]
+CVE: CVE-2019-9075
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
+---
+ bfd/ChangeLog   | 10 ++++++++++
+ bfd/archive.c   | 17 +++++++----------
+ bfd/archive64.c | 10 +++++-----
+ 3 files changed, 22 insertions(+), 15 deletions(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 72c87c7..e39bb12 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,13 @@
++2019-02-20  Alan Modra  <amodra@gmail.com>
++
++	PR 24236
++	* archive64.c (_bfd_archive_64_bit_slurp_armap): Move code adding
++	sentinel NUL to string buffer nearer to loop where it is used.
++	Don't go past sentinel when scanning strings, and don't write
++	NUL again.
++	* archive.c (do_slurp_coff_armap): Simplify string handling to
++	archive64.c style.
++
+ 2019-02-19  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 24235
+diff --git a/bfd/archive.c b/bfd/archive.c
+index d2d9b72..68a92a3 100644
+--- a/bfd/archive.c
++++ b/bfd/archive.c
+@@ -1012,6 +1012,7 @@ do_slurp_coff_armap (bfd *abfd)
+   int *raw_armap, *rawptr;
+   struct artdata *ardata = bfd_ardata (abfd);
+   char *stringbase;
++  char *stringend;
+   bfd_size_type stringsize;
+   bfd_size_type parsed_size;
+   carsym *carsyms;
+@@ -1071,22 +1072,18 @@ do_slurp_coff_armap (bfd *abfd)
+     }
+ 
+   /* OK, build the carsyms.  */
+-  for (i = 0; i < nsymz && stringsize > 0; i++)
++  stringend = stringbase + stringsize;
++  *stringend = 0;
++  for (i = 0; i < nsymz; i++)
+     {
+-      bfd_size_type len;
+-
+       rawptr = raw_armap + i;
+       carsyms->file_offset = swap ((bfd_byte *) rawptr);
+       carsyms->name = stringbase;
+-      /* PR 17512: file: 4a1d50c1.  */
+-      len = strnlen (stringbase, stringsize);
+-      if (len < stringsize)
+-	len ++;
+-      stringbase += len;
+-      stringsize -= len;
++      stringbase += strlen (stringbase);
++      if (stringbase != stringend)
++	++stringbase;
+       carsyms++;
+     }
+-  *stringbase = 0;
+ 
+   ardata->symdef_count = nsymz;
+   ardata->first_file_filepos = bfd_tell (abfd);
+diff --git a/bfd/archive64.c b/bfd/archive64.c
+index 312bf82..42f6ed9 100644
+--- a/bfd/archive64.c
++++ b/bfd/archive64.c
+@@ -100,8 +100,6 @@ _bfd_archive_64_bit_slurp_armap (bfd *abfd)
+     return FALSE;
+   carsyms = ardata->symdefs;
+   stringbase = ((char *) ardata->symdefs) + carsym_size;
+-  stringbase[stringsize] = 0;
+-  stringend = stringbase + stringsize;
+ 
+   raw_armap = (bfd_byte *) bfd_alloc (abfd, ptrsize);
+   if (raw_armap == NULL)
+@@ -115,15 +113,17 @@ _bfd_archive_64_bit_slurp_armap (bfd *abfd)
+       goto release_raw_armap;
+     }
+ 
++  stringend = stringbase + stringsize;
++  *stringend = 0;
+   for (i = 0; i < nsymz; i++)
+     {
+       carsyms->file_offset = bfd_getb64 (raw_armap + i * 8);
+       carsyms->name = stringbase;
+-      if (stringbase < stringend)
+-	stringbase += strlen (stringbase) + 1;
++      stringbase += strlen (stringbase);
++      if (stringbase != stringend)
++	++stringbase;
+       ++carsyms;
+     }
+-  *stringbase = '\0';
+ 
+   ardata->symdef_count = nsymz;
+   ardata->first_file_filepos = bfd_tell (abfd);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
new file mode 100644
index 0000000000..ec8cde2503
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
@@ -0,0 +1,49 @@
+From 9f841c583880eb6d0194455c1583a766f853e628 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 20 Feb 2019 12:06:31 +1030
+Subject: [PATCH] PR24233, Out of memory
+
+	PR 24233
+	* objdump.c (dump_bfd_private_header): Print warning if
+	bfd_print_private_bfd_data returns false.
+
+Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/7d272a55caebfc26ab2e15d1e9439bac978b9bb7]
+CVE: CVE-2019-9076
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ binutils/ChangeLog | 6 ++++++
+ binutils/objdump.c | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index f837c37..d5dd7cb 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2019-02-20  Alan Modra  <amodra@gmail.com>
++
++	PR 24233
++	* objdump.c (dump_bfd_private_header): Print warning if
++	bfd_print_private_bfd_data returns false.
++
+ 2019-02-02  Nick Clifton  <nickc@redhat.com>
+ 
+ 	* configure: Regenerate.
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 8725390..7d0c6a4 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -3178,7 +3178,9 @@ dump_bfd_header (bfd *abfd)
+ static void
+ dump_bfd_private_header (bfd *abfd)
+ {
+-  bfd_print_private_bfd_data (abfd, stdout);
++  if (!bfd_print_private_bfd_data (abfd, stdout))
++    non_fatal (_("warning: private headers incomplete: %s"),
++	       bfd_errmsg (bfd_get_error ()));
+ }
+ 
+ static void
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
new file mode 100644
index 0000000000..11ecb71b2e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
@@ -0,0 +1,37 @@
+From f7bbc8890de45df6eda0ddef5dd04f835f54eecf Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 20 Feb 2019 17:03:47 +0000
+Subject: [PATCH] Fix a illegal memory access fault when parsing a corrupt MIPS
+ option section using readelf.
+
+	PR 24243
+	* readelf.c (process_mips_specific): Check for an options section
+	that is too small to even contain a single option.
+
+Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/7fc0c668f2aceb8582d74db1ad2528e2bba8a921]
+CVE: CVE-2019-9077
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ binutils/readelf.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 9df3742..18ab806 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -16179,6 +16179,12 @@ process_mips_specific (Filedata * filedata)
+ 	  error (_("No MIPS_OPTIONS header found\n"));
+ 	  return FALSE;
+ 	}
++      /* PR 24243  */
++      if (sect->sh_size < sizeof (* eopt))
++	{
++	  error (_("The MIPS options section is too small.\n"));
++	  return FALSE;
++	}
+ 
+       eopt = (Elf_External_Options *) get_data (NULL, filedata, options_offset, 1,
+                                                 sect->sh_size, _("options"));
+-- 
+2.7.4
+
-- 
2.20.1


