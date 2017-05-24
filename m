Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1EBDA78059
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 09:55:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4O9tI1e010143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 02:55:18 -0700 (PDT)
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Wed, 24 May 2017 02:55:18 -0700
From: Yuanjie Huang <yuanjie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 May 2017 02:55:17 -0700
Message-ID: <20170524095517.168046-1-yuanjie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170524024529.275871-1-yuanjie.huang@windriver.com>
References: <20170524024529.275871-1-yuanjie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3] binutils: fix CVE-2017-6969 in readelf
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
X-List-Received-Date: Wed, 24 May 2017 09:55:17 -0000
Content-Type: text/plain

CVE: CVE-2017-6969
[BZ 21156] -- https://sourceware.org/bugzilla/show_bug.cgi?id=21156

PR binutils/21156: Fix illegal memory accesses in readelf when
ing a corrupt binary.
PR binutils/21156: Fix another memory access error in readelf when
parsing a corrupt binary.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   2 +
 .../binutils/binutils/CVE-2017-6969.patch          |  57 ++++++++++
 .../binutils/binutils/CVE-2017-6969_2.patch        | 122 +++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 7585da1ca9..fd37484dca 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -37,6 +37,8 @@ SRC_URI = "\
      file://0016-Detect-64-bit-MIPS-targets.patch \
      file://CVE-2017-6965.patch \
      file://CVE-2017-6966.patch \
+     file://CVE-2017-6969.patch \
+     file://CVE-2017-6969_2.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
new file mode 100644
index 0000000000..ed5403430c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
@@ -0,0 +1,57 @@
+From 1d9a2696903fc59d6a936f4ab4e4407ef329d066 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 17 Feb 2017 15:59:45 +0000
+Subject: Fix illegal memory accesses in readelf when parsing
+ a corrupt binary.
+
+	PR binutils/21156
+	* readelf.c (find_section_in_set): Test for invalid section
+	indicies.
+
+CVE: CVE-2017-6969
+Upstream-Status: Backport [master]
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ binutils/ChangeLog |  6 ++++++
+ binutils/readelf.c | 10 ++++++++--
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index bd63c8a0d8..1d840b42f9 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2017-02-17  Nick Clifton  <nickc@redhat.com>
++
++	PR binutils/21156
++	* readelf.c (find_section_in_set): Test for invalid section
++	indicies.
++
+ 2017-02-13  Nick Clifton  <nickc@redhat.com>
+ 
+ 	PR binutils/21139
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 7c158c6342..4960491c5c 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -675,8 +675,14 @@ find_section_in_set (const char * name, unsigned int * set)
+   if (set != NULL)
+     {
+       while ((i = *set++) > 0)
+-	if (streq (SECTION_NAME (section_headers + i), name))
+-	  return section_headers + i;
++	{
++	  /* See PR 21156 for a reproducer.  */
++	  if (i >= elf_header.e_shnum)
++	    continue; /* FIXME: Should we issue an error message ?  */
++
++	  if (streq (SECTION_NAME (section_headers + i), name))
++	    return section_headers + i;
++	}
+     }
+ 
+   return find_section (name);
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch
new file mode 100644
index 0000000000..59a5dec675
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch
@@ -0,0 +1,122 @@
+From ef81126314f67472a46db9581530fbf5ccb6b3f2 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 20 Feb 2017 14:40:39 +0000
+Subject: Fix another memory access error in readelf when
+ parsing a corrupt binary.
+
+	PR binutils/21156
+	* dwarf.c (cu_tu_indexes_read): Move into...
+	(load_cu_tu_indexes): ... here.  Change the variable into
+	tri-state.  Change the function into boolean, returning
+	false if the indicies could not be loaded.
+	(find_cu_tu_set): Return NULL if the indicies could not be
+	loaded.
+
+CVE: CVE-2017-6969
+Upstream-Status: Backport [master]
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ binutils/ChangeLog | 10 ++++++++++
+ binutils/dwarf.c   | 34 ++++++++++++++++++++--------------
+ 2 files changed, 30 insertions(+), 14 deletions(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index 1d840b42f9..53352c1801 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,13 @@
++2017-02-20  Nick Clifton  <nickc@redhat.com>
++
++	PR binutils/21156
++	* dwarf.c (cu_tu_indexes_read): Move into...
++	(load_cu_tu_indexes): ... here.  Change the variable into
++	tri-state.  Change the function into boolean, returning
++	false if the indicies could not be loaded.
++	(find_cu_tu_set): Return NULL if the indicies could not be
++	loaded.
++
+ 2017-02-17  Nick Clifton  <nickc@redhat.com>
+ 
+ 	PR binutils/21156
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 0184a7ab2e..6d879c9b61 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -76,7 +76,6 @@ int dwarf_check = 0;
+    as a zero-terminated list of section indexes comprising one set of debug
+    sections from a .dwo file.  */
+ 
+-static int cu_tu_indexes_read = 0;
+ static unsigned int *shndx_pool = NULL;
+ static unsigned int shndx_pool_size = 0;
+ static unsigned int shndx_pool_used = 0;
+@@ -99,7 +98,7 @@ static int tu_count = 0;
+ static struct cu_tu_set *cu_sets = NULL;
+ static struct cu_tu_set *tu_sets = NULL;
+ 
+-static void load_cu_tu_indexes (void *file);
++static bfd_boolean load_cu_tu_indexes (void *);
+ 
+ /* Values for do_debug_lines.  */
+ #define FLAG_DEBUG_LINES_RAW	 1
+@@ -2715,7 +2714,7 @@ load_debug_info (void * file)
+     return num_debug_info_entries;
+ 
+   /* If this is a DWARF package file, load the CU and TU indexes.  */
+-  load_cu_tu_indexes (file);
++  (void) load_cu_tu_indexes (file);
+ 
+   if (load_debug_section (info, file)
+       && process_debug_info (&debug_displays [info].section, file, abbrev, 1, 0))
+@@ -7378,21 +7377,27 @@ process_cu_tu_index (struct dwarf_section *section, int do_display)
+    section sets that we can use to associate a .debug_info.dwo section
+    with its associated .debug_abbrev.dwo section in a .dwp file.  */
+ 
+-static void
++static bfd_boolean
+ load_cu_tu_indexes (void *file)
+ {
++  static int cu_tu_indexes_read = -1; /* Tri-state variable.  */
++
+   /* If we have already loaded (or tried to load) the CU and TU indexes
+      then do not bother to repeat the task.  */
+-  if (cu_tu_indexes_read)
+-    return;
+-
+-  if (load_debug_section (dwp_cu_index, file))
+-    process_cu_tu_index (&debug_displays [dwp_cu_index].section, 0);
+-
+-  if (load_debug_section (dwp_tu_index, file))
+-    process_cu_tu_index (&debug_displays [dwp_tu_index].section, 0);
++  if (cu_tu_indexes_read == -1)
++    {
++      cu_tu_indexes_read = TRUE;
++  
++      if (load_debug_section (dwp_cu_index, file))
++	if (! process_cu_tu_index (&debug_displays [dwp_cu_index].section, 0))
++	  cu_tu_indexes_read = FALSE;
++
++      if (load_debug_section (dwp_tu_index, file))
++	if (! process_cu_tu_index (&debug_displays [dwp_tu_index].section, 0))
++	  cu_tu_indexes_read = FALSE;
++    }
+ 
+-  cu_tu_indexes_read = 1;
++  return (bfd_boolean) cu_tu_indexes_read;
+ }
+ 
+ /* Find the set of sections that includes section SHNDX.  */
+@@ -7402,7 +7407,8 @@ find_cu_tu_set (void *file, unsigned int shndx)
+ {
+   unsigned int i;
+ 
+-  load_cu_tu_indexes (file);
++  if (! load_cu_tu_indexes (file))
++    return NULL;
+ 
+   /* Find SHNDX in the shndx pool.  */
+   for (i = 0; i < shndx_pool_used; i++)
+-- 
+2.11.0
+
-- 
2.11.0


