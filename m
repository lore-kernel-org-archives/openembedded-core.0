Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB30878E81
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:34 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id d5-v6so1200806pll.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=grJvBpxPzTTfkoBk+PDZVI0FvmfiTGUQuAJ2HrqFX90=;
	b=tQ1YzXakoe2u7BUa33UN9XpMc27Zglip3v1nEjihL+Ywf39CrIW1EmltKCZOJXUx9a
	8+lN7ZO9aExR+1KvbamfL1EBjsuIBe8PDq+cxJi0rzU4QKpFB562fkxNBsionQvPvG9d
	36OM/3NMDW7eGc+EjeaQhwGVME9fdShYDeJfjn2c/70pJBLp9C3yywuc4t7qVYYC1Vde
	VhNeGrqUtFNucObTo2pXlXnEcmVZ4dFq8/5VjmiFwub+cYEe+hzvsfRjwg0WGZBaOyiG
	ufr8apxHaBnTOqk76ITZtFzzviAdfZf5hWJtYFXqNi1fYVU1IHFwuCFVVnEubXpbND8L
	riQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=grJvBpxPzTTfkoBk+PDZVI0FvmfiTGUQuAJ2HrqFX90=;
	b=CiJh+TwjaFHnkHuCJz5x1+PIqGuFTiYncIYsPZUmJF0b3ozt55OEIBmB41UmwR4a5v
	OZNV1r7SQfJ8w2rP/pmhEVoR8a9Tdosa2aGawcHXBYFGEu7vJ5cyvlZMMoX5VOqpQkgO
	dsy3RRiSgWkmzRsC8oTMX0jJC1Jg1DYEOrzjHtR3Ng1Ebtus/nIi+ETNFPPv9tjtv08N
	BVHpAGa9tOIV9xqyXnnYi29YTnsLENi4/bJ4HbqgCe8okTSMwTLaOe3M59pJNds+KJTU
	lBiTQtikylshmtXtuN1ZxJ29Ouaos9lpJPXQFcmpIJ80DW8HQP80JpgHaO4BngeSp9/z
	gbAg==
X-Gm-Message-State: AOUpUlE8vDVARvSyINyKU78oY5enmK0e8JU+pFWfoDd8TqWRV9KyjUJ/
	M6rg5G/lJm/facXkAwGrVQULwmF3
X-Google-Smtp-Source: AA+uWPxtao0xQoFm7BLTzVpM2Oj7wOmOyy7o+xzCNj9jrvuFaYJ65VVWi49VjvGzTUcwA64buC5/+w==
X-Received: by 2002:a17:902:8482:: with SMTP id
	c2-v6mr3093139plo.45.1533742535757; 
	Wed, 08 Aug 2018 08:35:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:07 -0700
Message-Id: <1533742522-24357-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 12/27] binutls: Security fix for CVE-2017-15024
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:35 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   1 +
 .../binutils/binutils/CVE-2017-15024.patch         | 227 +++++++++++++++++++++
 2 files changed, 228 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15024.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 08b233f..c13cb50 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -47,6 +47,7 @@ SRC_URI = "\
      file://CVE-2017-15021.patch \
      file://CVE-2017-15022.patch \
      file://CVE-2017-15023.patch \
+     file://CVE-2017-15024.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-15024.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-15024.patch
new file mode 100644
index 0000000..53b072e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-15024.patch
@@ -0,0 +1,227 @@
+From 52a93b95ec0771c97e26f0bb28630a271a667bd2 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 24 Sep 2017 14:37:16 +0930
+Subject: [PATCH] PR22187, infinite loop in find_abstract_instance_name
+
+This patch prevents the simple case of infinite recursion in
+find_abstract_instance_name by ensuring that the attributes being
+processed are not the same as the previous call.
+
+The patch also does a little cleanup, and leaves in place some changes
+to the nested_funcs array that I made when I wrongly thought looping
+might occur in scan_unit_for_symbols.
+
+	PR 22187
+	* dwarf2.c (find_abstract_instance_name): Add orig_info_ptr and
+	pname param.  Return status.  Make name const.  Don't abort,
+	return an error.  Formatting.  Exit if current info_ptr matches
+	orig_info_ptr.  Update callers.
+	(scan_unit_for_symbols): Start at nesting_level of zero.  Make
+	nested_funcs an array of structs for extensibility.  Formatting.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-15024
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 10 ++++++++
+ bfd/dwarf2.c  | 76 +++++++++++++++++++++++++++++++++++++++--------------------
+ 2 files changed, 61 insertions(+), 25 deletions(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -2823,9 +2823,11 @@ lookup_symbol_in_variable_table (struct
+   return FALSE;
+ }
+ 
+-static char *
++static bfd_boolean
+ find_abstract_instance_name (struct comp_unit *unit,
++			     bfd_byte *orig_info_ptr,
+ 			     struct attribute *attr_ptr,
++			     const char **pname,
+ 			     bfd_boolean *is_linkage)
+ {
+   bfd *abfd = unit->abfd;
+@@ -2835,7 +2837,7 @@ find_abstract_instance_name (struct comp
+   struct abbrev_info *abbrev;
+   bfd_uint64_t die_ref = attr_ptr->u.val;
+   struct attribute attr;
+-  char *name = NULL;
++  const char *name = NULL;
+ 
+   /* DW_FORM_ref_addr can reference an entry in a different CU. It
+      is an offset from the .debug_info section, not the current CU.  */
+@@ -2844,7 +2846,12 @@ find_abstract_instance_name (struct comp
+       /* We only support DW_FORM_ref_addr within the same file, so
+ 	 any relocations should be resolved already.  */
+       if (!die_ref)
+-	abort ();
++	{
++	  _bfd_error_handler
++	    (_("Dwarf Error: Abstract instance DIE ref zero."));
++	  bfd_set_error (bfd_error_bad_value);
++	  return FALSE;
++	}
+ 
+       info_ptr = unit->sec_info_ptr + die_ref;
+       info_ptr_end = unit->end_ptr;
+@@ -2879,9 +2886,10 @@ find_abstract_instance_name (struct comp
+ 	  _bfd_error_handler
+ 	    (_("Dwarf Error: Unable to read alt ref %u."), die_ref);
+ 	  bfd_set_error (bfd_error_bad_value);
+-	  return NULL;
++	  return FALSE;
+ 	}
+-      info_ptr_end = unit->stash->alt_dwarf_info_buffer + unit->stash->alt_dwarf_info_size;
++      info_ptr_end = (unit->stash->alt_dwarf_info_buffer
++		      + unit->stash->alt_dwarf_info_size);
+ 
+       /* FIXME: Do we need to locate the correct CU, in a similar
+ 	 fashion to the code in the DW_FORM_ref_addr case above ?  */
+@@ -2904,6 +2912,7 @@ find_abstract_instance_name (struct comp
+ 	  _bfd_error_handler
+ 	    (_("Dwarf Error: Could not find abbrev number %u."), abbrev_number);
+ 	  bfd_set_error (bfd_error_bad_value);
++	  return FALSE;
+ 	}
+       else
+ 	{
+@@ -2913,6 +2922,15 @@ find_abstract_instance_name (struct comp
+ 					 info_ptr, info_ptr_end);
+ 	      if (info_ptr == NULL)
+ 		break;
++	      /* It doesn't ever make sense for DW_AT_specification to
++		 refer to the same DIE.  Stop simple recursion.  */
++	      if (info_ptr == orig_info_ptr)
++		{
++		  _bfd_error_handler
++		    (_("Dwarf Error: Abstract instance recursion detected."));
++		  bfd_set_error (bfd_error_bad_value);
++		  return FALSE;
++		}
+ 	      switch (attr.name)
+ 		{
+ 		case DW_AT_name:
+@@ -2926,7 +2944,9 @@ find_abstract_instance_name (struct comp
+ 		    }
+ 		  break;
+ 		case DW_AT_specification:
+-		  name = find_abstract_instance_name (unit, &attr, is_linkage);
++		  if (!find_abstract_instance_name (unit, info_ptr, &attr,
++						    pname, is_linkage))
++		    return FALSE;
+ 		  break;
+ 		case DW_AT_linkage_name:
+ 		case DW_AT_MIPS_linkage_name:
+@@ -2944,7 +2964,8 @@ find_abstract_instance_name (struct comp
+ 	    }
+ 	}
+     }
+-  return name;
++  *pname = name;
++  return TRUE;
+ }
+ 
+ static bfd_boolean
+@@ -3005,20 +3026,22 @@ scan_unit_for_symbols (struct comp_unit
+   bfd *abfd = unit->abfd;
+   bfd_byte *info_ptr = unit->first_child_die_ptr;
+   bfd_byte *info_ptr_end = unit->stash->info_ptr_end;
+-  int nesting_level = 1;
+-  struct funcinfo **nested_funcs;
++  int nesting_level = 0;
++  struct nest_funcinfo {
++    struct funcinfo *func;
++  } *nested_funcs;
+   int nested_funcs_size;
+ 
+   /* Maintain a stack of in-scope functions and inlined functions, which we
+      can use to set the caller_func field.  */
+   nested_funcs_size = 32;
+-  nested_funcs = (struct funcinfo **)
+-    bfd_malloc (nested_funcs_size * sizeof (struct funcinfo *));
++  nested_funcs = (struct nest_funcinfo *)
++    bfd_malloc (nested_funcs_size * sizeof (*nested_funcs));
+   if (nested_funcs == NULL)
+     return FALSE;
+-  nested_funcs[nesting_level] = 0;
++  nested_funcs[nesting_level].func = 0;
+ 
+-  while (nesting_level)
++  while (nesting_level >= 0)
+     {
+       unsigned int abbrev_number, bytes_read, i;
+       struct abbrev_info *abbrev;
+@@ -3076,13 +3099,13 @@ scan_unit_for_symbols (struct comp_unit
+ 	  BFD_ASSERT (!unit->cached);
+ 
+ 	  if (func->tag == DW_TAG_inlined_subroutine)
+-	    for (i = nesting_level - 1; i >= 1; i--)
+-	      if (nested_funcs[i])
++	    for (i = nesting_level; i-- != 0; )
++	      if (nested_funcs[i].func)
+ 		{
+-		  func->caller_func = nested_funcs[i];
++		  func->caller_func = nested_funcs[i].func;
+ 		  break;
+ 		}
+-	  nested_funcs[nesting_level] = func;
++	  nested_funcs[nesting_level].func = func;
+ 	}
+       else
+ 	{
+@@ -3102,12 +3125,13 @@ scan_unit_for_symbols (struct comp_unit
+ 	    }
+ 
+ 	  /* No inline function in scope at this nesting level.  */
+-	  nested_funcs[nesting_level] = 0;
++	  nested_funcs[nesting_level].func = 0;
+ 	}
+ 
+       for (i = 0; i < abbrev->num_attrs; ++i)
+ 	{
+-	  info_ptr = read_attribute (&attr, &abbrev->attrs[i], unit, info_ptr, info_ptr_end);
++	  info_ptr = read_attribute (&attr, &abbrev->attrs[i],
++				     unit, info_ptr, info_ptr_end);
+ 	  if (info_ptr == NULL)
+ 	    goto fail;
+ 
+@@ -3126,8 +3150,10 @@ scan_unit_for_symbols (struct comp_unit
+ 
+ 		case DW_AT_abstract_origin:
+ 		case DW_AT_specification:
+-		  func->name = find_abstract_instance_name (unit, &attr,
+-							    &func->is_linkage);
++		  if (!find_abstract_instance_name (unit, info_ptr, &attr,
++						    &func->name,
++						    &func->is_linkage))
++		    goto fail;
+ 		  break;
+ 
+ 		case DW_AT_name:
+@@ -3254,17 +3280,17 @@ scan_unit_for_symbols (struct comp_unit
+ 
+ 	  if (nesting_level >= nested_funcs_size)
+ 	    {
+-	      struct funcinfo **tmp;
++	      struct nest_funcinfo *tmp;
+ 
+ 	      nested_funcs_size *= 2;
+-	      tmp = (struct funcinfo **)
++	      tmp = (struct nest_funcinfo *)
+ 		bfd_realloc (nested_funcs,
+-			     nested_funcs_size * sizeof (struct funcinfo *));
++			     nested_funcs_size * sizeof (*nested_funcs));
+ 	      if (tmp == NULL)
+ 		goto fail;
+ 	      nested_funcs = tmp;
+ 	    }
+-	  nested_funcs[nesting_level] = 0;
++	  nested_funcs[nesting_level].func = 0;
+ 	}
+     }
+ 
-- 
2.7.4


