Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A96C41513
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 07:35:20 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.13059.1713857714109121886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 00:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b++MOOZi;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2a54fb929c8so3604149a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713857713; x=1714462513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHvmOfBHzs82Cpmxs1l5ET+27qvb3hPRdurg9lbw414=;
        b=b++MOOZiQAVG6CT5wWEIBAxNq5e1fZu/xSUVKFAQELbJ+J4UGaBSOyHvTE+7cEW1DS
         e6WgCekjxSZo77SSS+ym7tfMGa/HchjX2VwGu0Qv66/nafult7CgE9NoASICaRhNJ+Qu
         F5rOPFLZThKEztbpfeH++QhTs8S2bxV0abfklWoy/oEygKhe3wX1BZ3WnC4WpGdBll/s
         HKR+CjHijCchcmRiQNilpctIydnmmqy839BVdxsU5B1JwHx2ZYR8rR9E/2R28DiGFSz6
         0FdT97qh8Zm471Mo5z+4WsS6yTjo5cB8g5ONuKEeG+uOsowMoL2zCUPgOOi06W53Hzrs
         YKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713857713; x=1714462513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHvmOfBHzs82Cpmxs1l5ET+27qvb3hPRdurg9lbw414=;
        b=rALqBvzVaM97cD7u7jXkmOqlftlYwT6UYeG7GlY1wMKRQEzHWSYIW81lTO9tDgJx3i
         OMdrM2lVKnOvjNycXoQLv/TPccsX0BMjN22yHnFMdo9kATHs+J5pa/a1R/sn6jyLOPFL
         zCNGnOhSYhGEs8SXHL4Ean3vxMW6iWyksQI1mnbRBHjBz7IQZQn5RMPjgRZL23+5vCqb
         9+ihdoHu7LJDsVfYU0juCJFKmFhke8CFjme7ImFjcYincTNCGleL2Q3IR9XU0MIbyucK
         I3KbN3VBMBJyACSUQ+VwHmaHs5rDM8Wp+vLZ/fGlAZVGA+Y4Qb8vizQmbn9wxKt8vKbt
         Q24w==
X-Gm-Message-State: AOJu0YwQ+iuQLXcu4QvU56iJgeWjow/YLTIWQv7dqeEL46GLePH076Sn
	PMs92vFeoG+A9JjNWfeCP1Shq1A9uvFV6EpIxVhR+JCDCAURdGCu5jev2A==
X-Google-Smtp-Source: AGHT+IHUv7IZe5Z5y9RgiroGzUrQMcq8YtM4aAgrfmdJo2JbrB6cYPB+Ca/jLoB/uGC5/mNCK+K0jg==
X-Received: by 2002:a17:90a:d683:b0:2ac:86c6:d5 with SMTP id x3-20020a17090ad68300b002ac86c600d5mr10204290pju.27.1713857712713;
        Tue, 23 Apr 2024 00:35:12 -0700 (PDT)
Received: from L-18076.kpit.com ([223.233.81.5])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090ad50d00b002a5dbfca370sm10539761pju.48.2024.04.23.00.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:35:12 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Subject: [OE-core][dunfell][PATCH 3/4] binutils: Fix CVE-2022-48065
Date: Tue, 23 Apr 2024 13:04:41 +0530
Message-Id: <20240423073442.48274-3-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423073442.48274-1-virendrak@kpit.com>
References: <20240423073442.48274-1-virendrak@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 07:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198608

Add patch file to fix CVE-2022-48065

Reference: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/binutils/2.34-6ubuntu1.9/binutils_2.34-6ubuntu1.9.debian.tar.xz

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2022-48065.patch    | 115 ++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-48065.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index fd6138be1e..5ebc7c6f34 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -61,6 +61,7 @@ SRC_URI = "\
      file://CVE-2022-47010.patch \
      file://CVE-2022-47011.patch \
      file://CVE-2022-48063.patch \
+     file://CVE-2022-48065.patch \
      file://CVE-2022-47695.patch \
      file://CVE-2022-44840.patch \
      file://CVE-2022-45703-0.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-48065.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-48065.patch
new file mode 100644
index 0000000000..c157a6144c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-48065.patch
@@ -0,0 +1,115 @@
+From: Nick Galanis <nick.galanis@canonical.com>
+Subject: [SECURITY UPDATE] Memory leak in find_abstract_instance (CVE-2022-48065)
+Description:
+
+ Origin: backport, https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=d28fbc7197ba0e021a43f873eff90b05dcdcff6a
+
+ [Canonical note: (nickgalanis) Minor backports were needed for almost every hunk
+  in order to apply to current code. Those backports do not change the functionality
+  of the code or alter the patch, whose goal is to not use the `name` var.
+  Moreover, in scan_unit_for_symbols(), the if statement originally present in the
+  patch was removed, as its introudction by PR28691 needed an intrusive backport
+  to apply. Again, the nature of the fix is not changed, as its goal is to free the 
+  variables before their re-assignment, something that is being achieved]
+
+ From d28fbc7197ba0e021a43f873eff90b05dcdcff6a Mon Sep 17 00:00:00 2001
+ From: Alan Modra <amodra@gmail.com>
+ Date: Wed, 21 Dec 2022 21:40:12 +1030
+ Subject: [PATCH] PR29925, Memory leak in find_abstract_instance
+ 
+ The testcase in the PR had a variable with both DW_AT_decl_file and
+ DW_AT_specification, where the DW_AT_specification also specified
+ DW_AT_decl_file.  This leads to a memory leak as the file name is
+ malloced and duplicates are not expected.
+
+ I've also changed find_abstract_instance to not use a temp for "name",
+ because that can result in a change in behaviour from the usual last
+ of duplicate attributes wins.
+
+ 	PR 29925 
+ 	* dwarf2.c (find_abstract_instance): Delete "name" variable.
+	Free *filename_ptr before assigning new file name.
+	(scan_unit_for_symbols): Similarly free func->file and
+	var->file before assigning.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=d28fbc7197ba0e021a43f873eff90b05dcdcff6a]
+
+CVE: CVE-2022-48065
+
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+ ---
+  bfd/dwarf2.c | 31 +++++++++++++++++++------------
+  1 file changed, 19 insertions(+), 12 deletions(-)
+
+Index: binutils-2.34/bfd/dwarf2.c
+===================================================================
+--- binutils-2.34.orig/bfd/dwarf2.c
++++ binutils-2.34/bfd/dwarf2.c
+@@ -2910,7 +2910,6 @@ find_abstract_instance (struct comp_unit
+   struct abbrev_info *abbrev;
+   bfd_uint64_t die_ref = attr_ptr->u.val;
+   struct attribute attr;
+-  const char *name = NULL;
+ 
+   if (recur_count == 100)
+     {
+@@ -3077,16 +3076,16 @@ find_abstract_instance (struct comp_unit
+ 		case DW_AT_name:
+ 		  /* Prefer DW_AT_MIPS_linkage_name or DW_AT_linkage_name
+ 		     over DW_AT_name.  */
+-		  if (name == NULL && is_str_attr (attr.form))
++		  if (*pname == NULL && is_str_attr (attr.form))
+ 		    {
+-		      name = attr.u.str;
++		      *pname = attr.u.str;
+ 		      if (non_mangled (unit->lang))
+ 			*is_linkage = TRUE;
+ 		    }
+ 		  break;
+ 		case DW_AT_specification:
+ 		  if (!find_abstract_instance (unit, &attr, recur_count + 1,
+-					       &name, is_linkage,
++					       pname, is_linkage,
+ 					       filename_ptr, linenumber_ptr))
+ 		    return FALSE;
+ 		  break;
+@@ -3096,13 +3095,14 @@ find_abstract_instance (struct comp_unit
+ 		     non-string forms into these attributes.  */
+ 		  if (is_str_attr (attr.form))
+ 		    {
+-		      name = attr.u.str;
++		      *pname = attr.u.str;
+ 		      *is_linkage = TRUE;
+ 		    }
+ 		  break;
+ 		case DW_AT_decl_file:
+ 		  if (!comp_unit_maybe_decode_line_info (unit))
+ 		    return FALSE;
++         free (*filename_ptr);
+ 		  *filename_ptr = concat_filename (unit->line_table,
+ 						   attr.u.val);
+ 		  break;
+@@ -3115,7 +3115,6 @@ find_abstract_instance (struct comp_unit
+ 	    }
+ 	}
+     }
+-  *pname = name;
+   return TRUE;
+ }
+ 
+@@ -3346,6 +3345,7 @@ scan_unit_for_symbols (struct comp_unit
+ 		  break;
+ 
+ 		case DW_AT_decl_file:
++         free (func->file);
+ 		  func->file = concat_filename (unit->line_table,
+ 						attr.u.val);
+ 		  break;
+@@ -3368,6 +3368,7 @@ scan_unit_for_symbols (struct comp_unit
+ 		  break;
+ 
+ 		case DW_AT_decl_file:
++         free (var->file);
+ 		  var->file = concat_filename (unit->line_table,
+ 					       attr.u.val);
+ 		  break;
-- 
2.25.1


