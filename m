Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0B12B7FAA7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjn6blPz5d
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281278;
	bh=IdfsWKnamV2IKQLb4Q+CQN5/YksJR74sz+NX92PKbeg=;
	h=From:To:Subject:Date:From;
	b=BkBqWDZxINQNJpkvtrzx0X5q+5zvIqjZAdLAi43dd8/O9XONJOmIcBZ9PnrjaYHtf
	L+Y7HN/n97R/J0abGL0kosNhJgvKtPlydytQmZV7KkX+pYa3C0nIBlQ6jGF34AsmX6
	CN0FBecHCY6QluvSD/Z2C65ivJ36S4dMqxMJGL3ojEOUr6TUkjibDwzsT84tfGWZOp
	v+Vw6b89y3CqL6LQDjLqlo38LElQB9hUIvhalCD27wcnn5BWstV+cYaB/udKSsnMNi
	UmknVazQy4as78PvIjyAvTB06HW9kTOzWaDiVCGn4ifuDYIUcWUI/Gp11hgWDhuRdg
	4y9e1OLb/OZ5r4F9+p7glZ6hqqI/we+6zsY1sPH3v6AGBlJ+J6C/y/Q6Opj3IRJcsO
	eRCzm+HbxDY6d5e44egt7VAw9mjbxMmk/eCsB4hildcRs0Jimsrh+4LvK4CiZjUf48
	yBO3q1FwZ0RBJfjJAT2H/N2GOgnL5wYMhytBs3kkpF1zx2DTV1X3hlVdNglkqaXYhh
	24uC1HN+j4gRq9yN/nVvjWSGAHoEIpM6jSog7iueyqUh3VdQAAEOZbFFx+0phkmA5v
	zGB0EAloqKaUyTIXSDDxc273lvpXFUo67ATelw1JHW7mYxUDzP2jdgO4YiT07cCWD8
	FM/Gx08LarRo/dnbIPCyeo+s=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:22 +0200
Message-Id: <20200117171436.17131-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] binutils: fix CVE-2019-17450
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:38 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport upstream fix.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../binutils/binutils-2.32.inc                |  1 +
 .../binutils/binutils/CVE-2019-17450.patch    | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index d3c52936d1..a92bfd0354 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -52,6 +52,7 @@ SRC_URI = "\
      file://CVE-2019-12972.patch \
      file://CVE-2019-14250.patch \
      file://CVE-2019-14444.patch \
+     file://CVE-2019-17450.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
new file mode 100644
index 0000000000..a6ce0b9a8a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
@@ -0,0 +1,99 @@
+From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Oct 2019 00:07:29 +1030
+Subject: [PATCH] PR25078, stack overflow in function find_abstract_instance
+
+Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
+file. There are newer versions of binutils, but none of them contain the
+commit fixing CVE-2019-17450, so backport it to master and zeus.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=063c511bd79]
+CVE: CVE-2019-17450
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+	PR 25078
+	* dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
+	recur_count.  Error on recur_count reaching 100 rather than
+	info_ptr matching orig_info_ptr.  Adjust calls.
+
+---
+ bfd/dwarf2.c | 35 +++++++++++++++++------------------
+ 1 file changed, 17 insertions(+), 18 deletions(-)
+
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
+-- 
+2.23.0
+
-- 
2.17.1


