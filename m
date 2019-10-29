Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 806CA7FA45
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:36:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9T2adW5010356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 19:36:39 -0700 (PDT)
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 28 Oct 2019 19:36:39 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Oct 2019 19:36:39 -0700
Message-ID: <20191029023639.145123-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] binutils: CVE-2019-17450 and CVE-2019-17451
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
X-List-Received-Date: Tue, 29 Oct 2019 02:36:38 -0000
Content-Type: text/plain

This patch fix the stack overflow issue for recursive call
and the segment fault issue.

Backport the two CVE pathces from the binutils upstream:
commit 336bfbeb1848f4b9558456fdcf283ee8a32d7fd1
commit 063c511bd79281f33fd33f0964541a73511b9e2b

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../binutils/binutils-2.32.inc                |   2 +
 .../binutils/binutils/CVE-2019-17450.patch    | 104 ++++++++++++++++++
 .../binutils/binutils/CVE-2019-17451.patch    |  54 +++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 19baf8a883..349c3e1154 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -49,6 +49,8 @@ SRC_URI = "\
      file://CVE-2019-12972.patch \
      file://CVE-2019-14250.patch \
      file://CVE-2019-14444.patch \
+     file://CVE-2019-17450.patch \
+     file://CVE-2019-17451.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
new file mode 100644
index 0000000000..e95c9f7aba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
@@ -0,0 +1,104 @@
+From 18360106e144b3584fc2f822118021086dc17da3 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Oct 2019 00:07:29 +1030
+Subject: [PATCH] PR25078, stack overflow in function find_abstract_instance
+
+	PR 25078
+	* dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
+	recur_count.  Error on recur_count reaching 100 rather than
+	info_ptr matching orig_info_ptr.  Adjust calls.
+
+---
+ bfd/ChangeLog |  7 +++++++
+ bfd/dwarf2.c  | 35 +++++++++++++++++------------------
+ 2 files changed, 24 insertions(+), 18 deletions(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index e66fb40a2c..2f568ff9bf 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2019-10-08  Alan Modra  <amodra@gmail.com>
++
++	PR 25078
++	* dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
++	recur_count.  Error on recur_count reaching 100 rather than
++	info_ptr matching orig_info_ptr.  Adjust calls.
++
+ 2019-06-21  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 24689
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 0b4e485582..20ec9e2e56 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct comp_unit *unit,
+ }
+ 
+ static bfd_boolean
+-find_abstract_instance (struct comp_unit *   unit,
+-			bfd_byte *           orig_info_ptr,
+-			struct attribute *   attr_ptr,
+-			const char **        pname,
+-			bfd_boolean *        is_linkage,
+-			char **              filename_ptr,
+-			int *                linenumber_ptr)
++find_abstract_instance (struct comp_unit *unit,
++			struct attribute *attr_ptr,
++			unsigned int recur_count,
++			const char **pname,
++			bfd_boolean *is_linkage,
++			char **filename_ptr,
++			int *linenumber_ptr)
+ {
+   bfd *abfd = unit->abfd;
+   bfd_byte *info_ptr;
+@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *   unit,
+   struct attribute attr;
+   const char *name = NULL;
+ 
++  if (recur_count == 100)
++    {
++      _bfd_error_handler
++	(_("DWARF error: abstract instance recursion detected"));
++      bfd_set_error (bfd_error_bad_value);
++      return FALSE;
++    }
++
+   /* DW_FORM_ref_addr can reference an entry in a different CU. It
+      is an offset from the .debug_info section, not the current CU.  */
+   if (attr_ptr->form == DW_FORM_ref_addr)
+@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *   unit,
+ 					 info_ptr, info_ptr_end);
+ 	      if (info_ptr == NULL)
+ 		break;
+-	      /* It doesn't ever make sense for DW_AT_specification to
+-		 refer to the same DIE.  Stop simple recursion.  */
+-	      if (info_ptr == orig_info_ptr)
+-		{
+-		  _bfd_error_handler
+-		    (_("DWARF error: abstract instance recursion detected"));
+-		  bfd_set_error (bfd_error_bad_value);
+-		  return FALSE;
+-		}
+ 	      switch (attr.name)
+ 		{
+ 		case DW_AT_name:
+@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *   unit,
+ 		    }
+ 		  break;
+ 		case DW_AT_specification:
+-		  if (!find_abstract_instance (unit, info_ptr, &attr,
++		  if (!find_abstract_instance (unit, &attr, recur_count + 1,
+ 					       &name, is_linkage,
+ 					       filename_ptr, linenumber_ptr))
+ 		    return FALSE;
+@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *unit)
+ 
+ 		case DW_AT_abstract_origin:
+ 		case DW_AT_specification:
+-		  if (!find_abstract_instance (unit, info_ptr, &attr,
++		  if (!find_abstract_instance (unit, &attr, 0,
+ 					       &func->name,
+ 					       &func->is_linkage,
+ 					       &func->file,
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
new file mode 100644
index 0000000000..f00808e229
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
@@ -0,0 +1,54 @@
+From 9b88c7910f36fbc957bc365349d6cf43cf000c24 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Oct 2019 10:47:13 +1030
+Subject: [PATCH] PR25070, SEGV in function _bfd_dwarf2_find_nearest_line
+
+Evil testcase with two debug info sections, with sizes of 2aaaabac4ec1
+and ffffd5555453b140 result in a total size of 1.  Reading the first
+section of course overflows the buffer and tramples on other memory.
+
+	PR 25070
+	* dwarf2.c (_bfd_dwarf2_slurp_debug_info): Catch overflow of
+	total_size calculation.
+
+---
+ bfd/ChangeLog |  6 ++++++
+ bfd/dwarf2.c  | 11 ++++++++++-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 2f568ff9bf..adbcc9bb84 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2019-10-09  Alan Modra  <amodra@gmail.com>
++
++	PR 25070
++	* dwarf2.c (_bfd_dwarf2_slurp_debug_info): Catch overflow of
++	total_size calculation.
++
+ 2019-10-08  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 25078
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 20ec9e2e56..9bbf2025cf 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -4425,7 +4425,16 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *debug_bfd,
+       for (total_size = 0;
+ 	   msec;
+ 	   msec = find_debug_info (debug_bfd, debug_sections, msec))
+-	total_size += msec->size;
++	{
++	  /* Catch PR25070 testcase overflowing size calculation here.  */
++	  if (total_size + msec->size < total_size
++	      || total_size + msec->size < msec->size)
++	    {
++	      bfd_set_error (bfd_error_no_memory);
++	      return FALSE;
++	    }
++	  total_size += msec->size;
++	}
+ 
+       stash->info_ptr_memory = (bfd_byte *) bfd_malloc (total_size);
+       if (stash->info_ptr_memory == NULL)
-- 
2.17.0


