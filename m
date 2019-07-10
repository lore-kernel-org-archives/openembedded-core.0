Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7E57ED76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 02:37:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 19:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; d="scan'208";a="170777736"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by orsmga006.jf.intel.com with ESMTP; 09 Jul 2019 19:37:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 10:37:22 +0800
Message-Id: <20190710023724.12708-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] binutils: fix CVE-2019-12972 CVE-2019-9071
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
X-List-Received-Date: Wed, 10 Jul 2019 02:37:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../binutils/binutils-2.32.inc                |   2 +
 .../binutils/binutils/CVE-2019-12972.patch    |  51 ++++++
 .../binutils/binutils/CVE-2019-9071.patch     | 164 ++++++++++++++++++
 3 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 49e6827c1f..31c24a37f5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -48,6 +48,8 @@ SRC_URI = "\
      file://CVE-2019-9075.patch \
      file://CVE-2019-9076.patch \
      file://CVE-2019-9077.patch \
+     file://CVE-2019-9071.patch \
+     file://CVE-2019-12972.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
new file mode 100644
index 0000000000..07d1d65467
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
@@ -0,0 +1,51 @@
+From 30bcc01478433a1cb05b36dc5c4beef7d2c89b5b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 21 Jun 2019 11:51:38 +0930
+Subject: [PATCH] PR24689, string table corruption
+
+The testcase in the PR had a e_shstrndx section of type SHT_GROUP.
+hdr->contents were initialized by setup_group rather than being read
+from the file, thus last byte was not zero and string dereference ran
+off the end of the buffer.
+
+	PR 24689
+	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
+
+Upstream-Status: Backport
+CVE: CVE-2019-12972
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/elfcode.h | 3 ++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 91f09e6346..e66fb40a2c 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2019-06-21  Alan Modra  <amodra@gmail.com>
++
++	PR 24689
++	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
++
+ 2019-02-20  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 24236
+diff --git a/bfd/elfcode.h b/bfd/elfcode.h
+index ec5ea766de..a35a629087 100644
+--- a/bfd/elfcode.h
++++ b/bfd/elfcode.h
+@@ -755,7 +755,8 @@ elf_object_p (bfd *abfd)
+   /* A further sanity check.  */
+   if (i_ehdrp->e_shnum != 0)
+     {
+-      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd))
++      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd)
++	  || i_shdrp[i_ehdrp->e_shstrndx].sh_type != SHT_STRTAB)
+ 	{
+ 	  /* PR 2257:
+ 	     We used to just goto got_wrong_format_error here
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
new file mode 100644
index 0000000000..26f4809cf0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
@@ -0,0 +1,164 @@
+From c1202057eb9161a86af27d867703235fee7b7555 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 10 Apr 2019 15:49:36 +0100
+Subject: [PATCH] Pull in patch for libiberty that fixes a stack exhaustion bug
+ when demangling a pathalogically constructed mangled name.
+
+	PR 89394
+	* cp-demangle.c (cplus_demangle_fill_name): Reject negative
+	lengths.
+	(d_count_templates_scopes): Replace num_templates and num_scopes
+	parameters with a struct d_print_info pointer parameter.  Adjust
+	body of the function accordingly.  Add recursion counter and check
+	that the recursion limit is not reached.
+	(d_print_init): Pass dpi parameter to d_count_templates_scopes.
+	Reset recursion counter afterwards, unless the recursion limit was
+	reached.
+
+CVE: CVE-2019-9071
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ ChangeLog               | 16 ++++++++++++++
+ libiberty/cp-demangle.c | 48 ++++++++++++++++++++++-------------------
+ 2 files changed, 42 insertions(+), 22 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index cd631a15b6..4df3aaa62c 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,19 @@
++2019-04-10  Nick Clifton  <nickc@redhat.com>
++
++	* libiberty: Sync with gcc.  Bring in:
++	2019-04-10  Nick Clifton  <nickc@redhat.com>
++
++	PR 89394
++	* cp-demangle.c (cplus_demangle_fill_name): Reject negative
++	lengths.
++	(d_count_templates_scopes): Replace num_templates and num_scopes
++	parameters with a struct d_print_info pointer parameter.  Adjust
++	body of the function accordingly.  Add recursion counter and check
++	that the recursion limit is not reached.
++	(d_print_init): Pass dpi parameter to d_count_templates_scopes.
++	Reset recursion counter afterwards, unless the recursion limit was
++	reached.
++
+ 2018-06-24  Nick Clifton  <nickc@redhat.com>
+ 
+ 	2.32 branch created.
+diff --git a/libiberty/cp-demangle.c b/libiberty/cp-demangle.c
+index b34b485692..779b4e763a 100644
+--- a/libiberty/cp-demangle.c
++++ b/libiberty/cp-demangle.c
+@@ -861,7 +861,7 @@ CP_STATIC_IF_GLIBCPP_V3
+ int
+ cplus_demangle_fill_name (struct demangle_component *p, const char *s, int len)
+ {
+-  if (p == NULL || s == NULL || len == 0)
++  if (p == NULL || s == NULL || len <= 0)
+     return 0;
+   p->d_printing = 0;
+   p->type = DEMANGLE_COMPONENT_NAME;
+@@ -4061,7 +4061,7 @@ d_growable_string_callback_adapter (const char *s, size_t l, void *opaque)
+    are larger than the actual numbers encountered.  */
+ 
+ static void
+-d_count_templates_scopes (int *num_templates, int *num_scopes,
++d_count_templates_scopes (struct d_print_info *dpi,
+ 			  const struct demangle_component *dc)
+ {
+   if (dc == NULL)
+@@ -4081,13 +4081,13 @@ d_count_templates_scopes (int *num_templates, int *num_scopes,
+       break;
+ 
+     case DEMANGLE_COMPONENT_TEMPLATE:
+-      (*num_templates)++;
++      dpi->num_copy_templates++;
+       goto recurse_left_right;
+ 
+     case DEMANGLE_COMPONENT_REFERENCE:
+     case DEMANGLE_COMPONENT_RVALUE_REFERENCE:
+       if (d_left (dc)->type == DEMANGLE_COMPONENT_TEMPLATE_PARAM)
+-	(*num_scopes)++;
++	dpi->num_saved_scopes++;
+       goto recurse_left_right;
+ 
+     case DEMANGLE_COMPONENT_QUAL_NAME:
+@@ -4152,42 +4152,42 @@ d_count_templates_scopes (int *num_templates, int *num_scopes,
+     case DEMANGLE_COMPONENT_TAGGED_NAME:
+     case DEMANGLE_COMPONENT_CLONE:
+     recurse_left_right:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				d_left (dc));
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				d_right (dc));
++      /* PR 89394 - Check for too much recursion.  */
++      if (dpi->recursion > DEMANGLE_RECURSION_LIMIT)
++	/* FIXME: There ought to be a way to report to the
++	   user that the recursion limit has been reached.  */
++	return;
++
++      ++ dpi->recursion;
++      d_count_templates_scopes (dpi, d_left (dc));
++      d_count_templates_scopes (dpi, d_right (dc));
++      -- dpi->recursion;
+       break;
+ 
+     case DEMANGLE_COMPONENT_CTOR:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				dc->u.s_ctor.name);
++      d_count_templates_scopes (dpi, dc->u.s_ctor.name);
+       break;
+ 
+     case DEMANGLE_COMPONENT_DTOR:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				dc->u.s_dtor.name);
++      d_count_templates_scopes (dpi, dc->u.s_dtor.name);
+       break;
+ 
+     case DEMANGLE_COMPONENT_EXTENDED_OPERATOR:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				dc->u.s_extended_operator.name);
++      d_count_templates_scopes (dpi, dc->u.s_extended_operator.name);
+       break;
+ 
+     case DEMANGLE_COMPONENT_FIXED_TYPE:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-                                dc->u.s_fixed.length);
++      d_count_templates_scopes (dpi, dc->u.s_fixed.length);
+       break;
+ 
+     case DEMANGLE_COMPONENT_GLOBAL_CONSTRUCTORS:
+     case DEMANGLE_COMPONENT_GLOBAL_DESTRUCTORS:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				d_left (dc));
++      d_count_templates_scopes (dpi, d_left (dc));
+       break;
+ 
+     case DEMANGLE_COMPONENT_LAMBDA:
+     case DEMANGLE_COMPONENT_DEFAULT_ARG:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				dc->u.s_unary_num.sub);
++      d_count_templates_scopes (dpi, dc->u.s_unary_num.sub);
+       break;
+     }
+ }
+@@ -4222,8 +4222,12 @@ d_print_init (struct d_print_info *dpi, demangle_callbackref callback,
+   dpi->next_copy_template = 0;
+   dpi->num_copy_templates = 0;
+ 
+-  d_count_templates_scopes (&dpi->num_copy_templates,
+-			    &dpi->num_saved_scopes, dc);
++  d_count_templates_scopes (dpi, dc);
++  /* If we did not reach the recursion limit, then reset the
++     current recursion value back to 0, so that we can print
++     the templates.  */
++  if (dpi->recursion < DEMANGLE_RECURSION_LIMIT)
++    dpi->recursion = 0;
+   dpi->num_copy_templates *= dpi->num_saved_scopes;
+ 
+   dpi->current_template = NULL;
+-- 
+2.20.1
+
-- 
2.20.1


