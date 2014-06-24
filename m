Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACBA65ECB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 22:56:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5OMurmU000952 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:56:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cVzDnfiNAXk6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:56:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5OMunSu000949
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:56:50 +0100
Message-ID: <1403650602.2104.182.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 23:56:42 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] binutils: Apply the proper fix for PR 16428
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
X-List-Received-Date: Tue, 24 Jun 2014 22:56:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: "H.J. Lu" <hjl.tools@gmail.com>

It is fixed by

commit 4199e3b8669d0a36448687850374fdc2ad7240b6
Author: Alan Modra <amodra@gmail.com>
Date:   Wed Jan 15 21:50:55 2014 +1030

    non-PIC references to __ehdr_start in pie and shared

    Rather than hacking every backend to not discard dynamic relocations
    against an undefined hidden __ehdr_start, make it appear to be defined
    early.  We want __ehdr_start hidden before size_dynamic_sections so
    that it isn't put in .dynsym, but we do need the dynamic relocations
    for a PIE or shared library with a non-PIC reference.  Defining it
    early is wrong if we don't actually define the symbol later to its
    proper value.  (In some cases we want to leave the symbol undefined,
    for example, when the ELF header isn't loaded, and we don't have this
    infomation available in before_allocation.)

So replace the existing patches with this one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc b/meta/recipes-devtools/binutils/binutils-2.24.inc
index 2a9297b..ef6a4eb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.24.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
@@ -28,8 +28,7 @@ SRC_URI = "\
      file://fix-pr15815.patch \
      file://fix-pr2404.patch \
      file://fix-pr16476.patch \
-     file://fix-pr16428a.patch \
-     file://fix-pr16428b.patch \
+     file://fix-pr16428.patch \
      file://replace_macros_with_static_inline.patch \
      file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch \
      "
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16428.patch b/meta/recipes-devtools/binutils/binutils/fix-pr16428.patch
new file mode 100644
index 0000000..1e2b889
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/fix-pr16428.patch
@@ -0,0 +1,121 @@
+commit 4199e3b8669d0a36448687850374fdc2ad7240b6
+Author: Alan Modra <amodra@gmail.com>
+Date:   Wed Jan 15 21:50:55 2014 +1030
+
+    non-PIC references to __ehdr_start in pie and shared
+    
+    Rather than hacking every backend to not discard dynamic relocations
+    against an undefined hidden __ehdr_start, make it appear to be defined
+    early.  We want __ehdr_start hidden before size_dynamic_sections so
+    that it isn't put in .dynsym, but we do need the dynamic relocations
+    for a PIE or shared library with a non-PIC reference.  Defining it
+    early is wrong if we don't actually define the symbol later to its
+    proper value.  (In some cases we want to leave the symbol undefined,
+    for example, when the ELF header isn't loaded, and we don't have this
+    infomation available in before_allocation.)
+    
+    ld/
+    	* emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation): Define
+    	__ehdr_start before size_dynamic_sections and restore afterwards.
+    ld/testsuite/
+    	* ld-elf/ehdr_start-shared.d: New.
+    	* ld-elf/ehdr_start-userdef.d: xfail frv.
+    	* ld-elf/ehdr_start-weak.d: Likewise.
+    	* ld-elf/ehdr_start.d: Likewise.
+
+diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
+index 9a2fe89..13f86f0 100644
+--- a/ld/emultempl/elf32.em
++++ b/ld/emultempl/elf32.em
+@@ -1480,6 +1480,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+   const char *rpath;
+   asection *sinterp;
+   bfd *abfd;
++  struct elf_link_hash_entry *ehdr_start = NULL;
++  struct bfd_link_hash_entry ehdr_start_save;
+ 
+   if (is_elf_hash_table (link_info.hash))
+     {
+@@ -1504,6 +1506,16 @@ gld${EMULATION_NAME}_before_allocation (void)
+              _bfd_elf_link_hash_hide_symbol (&link_info, h, TRUE);
+              if (ELF_ST_VISIBILITY (h->other) != STV_INTERNAL)
+                h->other = (h->other & ~ELF_ST_VISIBILITY (-1)) | STV_HIDDEN;
++	     /* Don't leave the symbol undefined.  Undefined hidden
++		symbols typically won't have dynamic relocations, but
++		we most likely will need dynamic relocations for
++		__ehdr_start if we are building a PIE or shared
++		library.  */
++	     ehdr_start = h;
++	     ehdr_start_save = h->root;
++	     h->root.type = bfd_link_hash_defined;
++	     h->root.u.def.section = bfd_abs_section_ptr;
++	     h->root.u.def.value = 0;
+            }
+        }
+ 
+@@ -1620,6 +1632,14 @@ ${ELF_INTERPRETER_SET_DEFAULT}
+ 
+   if (!bfd_elf_size_dynsym_hash_dynstr (link_info.output_bfd, &link_info))
+     einfo ("%P%F: failed to set dynamic section sizes: %E\n");
++
++  if (ehdr_start != NULL)
++    {
++      /* If we twiddled __ehdr_start to defined earlier, put it back
++	 as it was.  */
++      ehdr_start->root.type = ehdr_start_save.type;
++      ehdr_start->root.u = ehdr_start_save.u;
++    }
+ }
+ 
+ EOF
+diff --git a/ld/testsuite/ld-elf/ehdr_start-shared.d b/ld/testsuite/ld-elf/ehdr_start-shared.d
+new file mode 100644
+index 0000000..c17516a
+--- /dev/null
++++ b/ld/testsuite/ld-elf/ehdr_start-shared.d
+@@ -0,0 +1,9 @@
++#source: ehdr_start.s
++#ld: -e _start -shared
++#nm: -n
++#target: *-*-linux* *-*-gnu* *-*-nacl*
++#xfail: cris*-*-* frv-*-*
++
++#...
++[0-9a-f]*000 [Adrt] __ehdr_start
++#pass
+diff --git a/ld/testsuite/ld-elf/ehdr_start-userdef.d b/ld/testsuite/ld-elf/ehdr_start-userdef.d
+index 2a88e98..b58ae3f 100644
+--- a/ld/testsuite/ld-elf/ehdr_start-userdef.d
++++ b/ld/testsuite/ld-elf/ehdr_start-userdef.d
+@@ -2,6 +2,7 @@
+ #ld: -e _start -T ehdr_start-userdef.t
+ #readelf: -Ws
+ #target: *-*-linux* *-*-gnu* *-*-nacl*
++#xfail: frv-*-*
+ 
+ #...
+ Symbol table '\.symtab' contains [0-9]+ entries:
+diff --git a/ld/testsuite/ld-elf/ehdr_start-weak.d b/ld/testsuite/ld-elf/ehdr_start-weak.d
+index 8bd9035..24ae34c 100644
+--- a/ld/testsuite/ld-elf/ehdr_start-weak.d
++++ b/ld/testsuite/ld-elf/ehdr_start-weak.d
+@@ -2,6 +2,7 @@
+ #ld: -e _start -T ehdr_start-missing.t
+ #nm: -n
+ #target: *-*-linux* *-*-gnu* *-*-nacl*
++#xfail: frv-*-*
+ 
+ #...
+ \s+[wU] __ehdr_start
+diff --git a/ld/testsuite/ld-elf/ehdr_start.d b/ld/testsuite/ld-elf/ehdr_start.d
+index 52e5b54..d538b66 100644
+--- a/ld/testsuite/ld-elf/ehdr_start.d
++++ b/ld/testsuite/ld-elf/ehdr_start.d
+@@ -2,6 +2,7 @@
+ #ld: -e _start
+ #nm: -n
+ #target: *-*-linux* *-*-gnu* *-*-nacl*
++#xfail: frv-*-*
+ 
+ #...
+ [0-9a-f]*000 [Adrt] __ehdr_start
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16428a.patch b/meta/recipes-devtools/binutils/binutils/fix-pr16428a.patch
deleted file mode 100644
index 5b3edfb..0000000
--- a/meta/recipes-devtools/binutils/binutils/fix-pr16428a.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From d1ec1e40b5b457c92aaa23f7af40e026e4596a99 Mon Sep 17 00:00:00 2001
-From: H.J. Lu <hjl.tools@gmail.com>
-Date: Tue, 14 Jan 2014 10:48:39 -0800
-Subject: [PATCH 1/1] Don't update reloc count if there are any non pc-relative relocs
-
-	PR ld/16428
-	* elf32-i386.c (elf_i386_allocate_dynrelocs): Don't update reloc
-	count if there are any non pc-relative relocs.
-	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
----
- bfd/ChangeLog      |    7 +++++++
- bfd/elf32-i386.c   |    9 +++++++--
- bfd/elf64-x86-64.c |    9 +++++++--
- 3 files changed, 21 insertions(+), 4 deletions(-)
-
-Upstream-Status: Backport
-
-#diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-#index a8f1f94..7a49fd1 100644
-#--- a/bfd/ChangeLog
-#+++ b/bfd/ChangeLog
-#@@ -1,3 +1,10 @@
-#+2014-01-14  H.J. Lu  <hongjiu.lu@intel.com>
-#+
-#+	PR ld/16428
-#+	* elf32-i386.c (elf_i386_allocate_dynrelocs): Don't update reloc
-#+	count if there are any non pc-relative relocs.
-#+	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
-#+
-# 2014-01-14  Michael Hudson-Doyle  <michael.hudson@linaro.org>
-# 	    Kugan Vivekanandarajah  <kugan.vivekanandarajah@linaro.org>
-# 
-diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
-index 4d391e1..d7f59e5 100644
---- a/bfd/elf32-i386.c
-+++ b/bfd/elf32-i386.c
-@@ -2368,8 +2368,13 @@ elf_i386_allocate_dynrelocs (struct elf_link_hash_entry *h, void *inf)
- 
- 	  for (pp = &eh->dyn_relocs; (p = *pp) != NULL; )
- 	    {
--	      p->count -= p->pc_count;
--	      p->pc_count = 0;
-+	      /* Don't update reloc count if there are any non
-+		 pc-relative relocs.  */
-+	      if (!h->pointer_equality_needed)
-+		{
-+		  p->count -= p->pc_count;
-+		  p->pc_count = 0;
-+		}
- 	      if (p->count == 0)
- 		*pp = p->next;
- 	      else
-diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
-index edee8ec..999011b 100644
---- a/bfd/elf64-x86-64.c
-+++ b/bfd/elf64-x86-64.c
-@@ -2463,8 +2463,13 @@ elf_x86_64_allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
- 
- 	  for (pp = &eh->dyn_relocs; (p = *pp) != NULL; )
- 	    {
--	      p->count -= p->pc_count;
--	      p->pc_count = 0;
-+	      /* Don't update reloc count if there are any non
-+		 pc-relative relocs.  */
-+	      if (!h->pointer_equality_needed)
-+		{
-+		  p->count -= p->pc_count;
-+		  p->pc_count = 0;
-+		}
- 	      if (p->count == 0)
- 		*pp = p->next;
- 	      else
--- 
-1.7.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16428b.patch b/meta/recipes-devtools/binutils/binutils/fix-pr16428b.patch
deleted file mode 100644
index 35aa7b5..0000000
--- a/meta/recipes-devtools/binutils/binutils/fix-pr16428b.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 818d220a6fe3d0512a226188e9164245a02c9185 Mon Sep 17 00:00:00 2001
-From: H.J. Lu <hjl.tools@gmail.com>
-Date: Tue, 14 Jan 2014 16:42:35 -0800
-Subject: [PATCH] Don't discard relocs against __ehdr_start
-
-__ehdr_start will be defined by assign_file_positions_for_non_load_sections
-later.
-
-	PR ld/16428
-	* elf32-i386.c (elf_i386_allocate_dynrelocs): Don't discard relocs
-	against __ehdr_start.
-	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
----
- bfd/ChangeLog      |    7 +++++++
- bfd/elf32-i386.c   |    7 +++++--
- bfd/elf64-x86-64.c |    7 +++++--
- 3 files changed, 17 insertions(+), 4 deletions(-)
-
-Upstream-Status: Backport
-
-#diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-#index 7d13a35..f4acda0 100644
-#--- a/bfd/ChangeLog
-#+++ b/bfd/ChangeLog
-#@@ -1,5 +1,12 @@
-# 2014-01-14  H.J. Lu  <hongjiu.lu@intel.com>
-# 
-#+	PR ld/16428
-#+	* elf32-i386.c (elf_i386_allocate_dynrelocs): Don't discard relocs
-#+	against __ehdr_start.
-#+	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
-#+
-#+2014-01-14  H.J. Lu  <hongjiu.lu@intel.com>
-#+
-# 	* elf32-i386.c (elf_i386_allocate_dynrelocs): Revert the last
-# 	change.
-# 	* elf64-x86-64.c (elf_x86_64_allocate_dynrelocs): Likewise.
-Index: binutils-2.24/bfd/elf32-i386.c
-===================================================================
---- binutils-2.24.orig/bfd/elf32-i386.c	2014-03-25 10:26:54.818385608 +0000
-+++ binutils-2.24/bfd/elf32-i386.c	2014-03-25 10:26:54.814385607 +0000
-@@ -2395,9 +2395,12 @@
- 	}
- 
-       /* Also discard relocs on undefined weak syms with non-default
--    	 visibility.  */
-+    	 visibility.   Don't discard relocs against __ehdr_start which
-+	 will be defined by assign_file_positions_for_non_load_sections
-+	 later.  */
-       if (eh->dyn_relocs != NULL
--	  && h->root.type == bfd_link_hash_undefweak)
-+	  && h->root.type == bfd_link_hash_undefweak
-+	  && strcmp (h->root.root.string, "__ehdr_start") != 0)
- 	{
- 	  if (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT)
- 	    eh->dyn_relocs = NULL;
-Index: binutils-2.24/bfd/elf64-x86-64.c
-===================================================================
---- binutils-2.24.orig/bfd/elf64-x86-64.c	2014-03-25 10:26:54.818385608 +0000
-+++ binutils-2.24/bfd/elf64-x86-64.c	2014-03-25 10:26:54.814385607 +0000
-@@ -2478,9 +2478,12 @@
- 	}
- 
-       /* Also discard relocs on undefined weak syms with non-default
--	 visibility.  */
-+    	 visibility.   Don't discard relocs against __ehdr_start which
-+	 will be defined by assign_file_positions_for_non_load_sections
-+	 later.  */
-       if (eh->dyn_relocs != NULL
--	  && h->root.type == bfd_link_hash_undefweak)
-+	  && h->root.type == bfd_link_hash_undefweak
-+	  && strcmp (h->root.root.string, "__ehdr_start") != 0)
- 	{
- 	  if (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT)
- 	    eh->dyn_relocs = NULL;



