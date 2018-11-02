Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38E8C79EFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 09:09:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA298VJh031907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Nov 2018 02:08:41 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 2 Nov 2018 02:08:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 2 Nov 2018 17:18:37 +0800
Message-ID: <1541150317-10093-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] elfutils: CVE-2018-18520 & CVE-2018-18521 & CVE-2018-18310
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
X-List-Received-Date: Fri, 02 Nov 2018 09:09:07 -0000
Content-Type: text/plain

These CVE fixes come from upstream master branch and no
new version released, so backport rather than upgrade.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.174.bb   |  3 ++
 ...01-arlib-Check-that-sh_entsize-isn-t-zero.patch | 36 +++++++++++++
 ...Sanity-check-partial-core-file-data-reads.patch | 60 ++++++++++++++++++++++
 .../0001-size-Handle-recursive-ELF-ar-files.patch  | 40 +++++++++++++++
 4 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.174.bb b/meta/recipes-devtools/elfutils/elfutils_0.174.bb
index 88add7b..c30265b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.174.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.174.bb
@@ -17,6 +17,9 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
+           file://0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch \
+           file://0001-size-Handle-recursive-ELF-ar-files.patch \
+           file://0001-arlib-Check-that-sh_entsize-isn-t-zero.patch \
            file://debian/0001-hppa_backend.patch \
            file://debian/0001-arm_backend.patch \
            file://debian/0001-mips_backend.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch b/meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch
new file mode 100644
index 0000000..86cf7c8
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch
@@ -0,0 +1,36 @@
+From b518841fbc1431d7c5baa016e35f10fb647b5958 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 18 Oct 2018 19:01:52 +0200
+Subject: [PATCH] arlib: Check that sh_entsize isn't zero.
+
+A bogus ELF file could have sh_entsize as zero. Don't divide by zero,
+but just assume there are no symbols in the section.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=23786
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2018-18521
+Upstream-Status: Backport [http://sourceware.org/git/elfutils.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/arlib.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/arlib.c b/src/arlib.c
+index 778e087..a6521e3 100644
+--- a/src/arlib.c
++++ b/src/arlib.c
+@@ -252,6 +252,9 @@ arlib_add_symbols (Elf *elf, const char *arfname, const char *membername,
+       if (data == NULL)
+ 	continue;
+ 
++      if (shdr->sh_entsize == 0)
++	continue;
++
+       int nsyms = shdr->sh_size / shdr->sh_entsize;
+       for (int ndx = shdr->sh_info; ndx < nsyms; ++ndx)
+ 	{
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch b/meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
new file mode 100644
index 0000000..2c74a8d
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
@@ -0,0 +1,60 @@
+From 8cbb2f8de89d65ca52d4242f213a6206b48d2c8d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 2 Nov 2018 14:22:31 +0800
+Subject: [PATCH] libdwfl: Sanity check partial core file data reads.
+
+There were two issues when reading note data from a core file.
+We didn't check if the data we already had in a buffer was big
+enough. And if we did get the data, we should check if we got
+everything, or just a part of the data.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=23752
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2018-18310
+Upstream-Status: Backport [http://sourceware.org/git/elfutils.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libdwfl/dwfl_segment_report_module.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/libdwfl/dwfl_segment_report_module.c b/libdwfl/dwfl_segment_report_module.c
+index 36e5c82..8749884 100644
+--- a/libdwfl/dwfl_segment_report_module.c
++++ b/libdwfl/dwfl_segment_report_module.c
+@@ -1,5 +1,5 @@
+ /* Sniff out modules from ELF headers visible in memory segments.
+-   Copyright (C) 2008-2012, 2014, 2015 Red Hat, Inc.
++   Copyright (C) 2008-2012, 2014, 2015, 2018 Red Hat, Inc.
+    This file is part of elfutils.
+ 
+    This file is free software; you can redistribute it and/or modify
+@@ -301,7 +301,10 @@ dwfl_segment_report_module (Dwfl *dwfl, int ndx, const char *name,
+   inline bool read_portion (void **data, size_t *data_size,
+ 			    GElf_Addr vaddr, size_t filesz)
+   {
+-    if (vaddr - start + filesz > buffer_available
++    /* Check whether we will have to read the segment data, or if it
++       can be returned from the existing buffer.  */
++    if (filesz > buffer_available
++	|| vaddr - start > buffer_available - filesz
+ 	/* If we're in string mode, then don't consider the buffer we have
+ 	   sufficient unless it contains the terminator of the string.  */
+ 	|| (filesz == 0 && memchr (vaddr - start + buffer, '\0',
+@@ -459,6 +462,12 @@ dwfl_segment_report_module (Dwfl *dwfl, int ndx, const char *name,
+     if (read_portion (&data, &data_size, vaddr, filesz))
+       return;
+ 
++    /* data_size will be zero if we got everything from the initial
++       buffer, otherwise it will be the size of the new buffer that
++       could be read.  */
++    if (data_size != 0)
++      filesz = data_size;
++
+     assert (sizeof (Elf32_Nhdr) == sizeof (Elf64_Nhdr));
+ 
+     void *notes;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch b/meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch
new file mode 100644
index 0000000..6fed826
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch
@@ -0,0 +1,40 @@
+From 440d34d0ee37964453245895d38d7fc31bcf3d7d Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 18 Oct 2018 23:15:48 +0200
+Subject: [PATCH] size: Handle recursive ELF ar files.
+
+eu-size didn't handle an ELF ar file that contained an ar file itself
+correctly. handle_ar would recursively call itself but close the ELF
+file before returning. Only close the ELF file at the top-level.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=23787
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2018-18520
+Upstream-Status: Backport [http://sourceware.org/git/elfutils.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/size.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/size.c b/src/size.c
+index 5ff3f2a..f01fd88 100644
+--- a/src/size.c
++++ b/src/size.c
+@@ -374,8 +374,10 @@ handle_ar (int fd, Elf *elf, const char *prefix, const char *fname)
+ 	INTERNAL_ERROR (fname);
+     }
+ 
+-  if (unlikely (elf_end (elf) != 0))
+-    INTERNAL_ERROR (fname);
++  /* Only close ELF handle if this was a "top level" ar file.  */
++  if (prefix == NULL)
++    if (unlikely (elf_end (elf) != 0))
++      INTERNAL_ERROR (fname);
+ 
+   return result;
+ }
+-- 
+2.7.4
+
-- 
2.7.4


