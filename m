Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316B6CD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 14:50:22 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.30967.1694962214405451410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 07:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b+ImXPNh;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: sanjanasanju1608@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68bed2c786eso3132350b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694962213; x=1695567013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxsOf/cddloXW5lFDOWBMRHmG+pwZw55LPdgCwd1zfM=;
        b=b+ImXPNhg2CYSpRthq2rjHPwpRAdwxxwNCgYPfHYBdtTZFNJyrR6I3SxX/k53oofmO
         cpeKeeF28jA32QJPw3BzVFT1jc59DXiB+N18RXBai8PV/Fl0s/7qkt7A819HK99CHXh7
         Tml8QzvgltXF8Tl45Gn58fi7p7tlkXP4wvrPBtjv4CGcGV/9I+vEUpCU/HZoNbODbQJm
         o7Uk1qSrSTO52Tf61KAnAh6GV6SjVpE7lkAD4/hAyZYTfxvNOGBO8qi1XR3cGtBq5tUW
         1RQZSrvUowdErjQatOnconRbLaJknSjsdbM4aB7KXnWVhTyH4UUXmrFcfZ/wdx4S/B1P
         ZxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694962213; x=1695567013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxsOf/cddloXW5lFDOWBMRHmG+pwZw55LPdgCwd1zfM=;
        b=QnwOmQ9ShiBXyGDjwbPeJXUAIp5LyRO3MpKHx4KKNJHLGJOgg50nZ6QHj1dRU8uIU8
         3VK5JcePdT5UPMTbLKTZhNctu25OH2dQFHXCXTJfAmY0/Ev4ZV4kacFQ4Cv2DPJShGLz
         rm9DdZWsiP5iGSXpj2xQbRdz2qItTOUYcRnoiULk1H6RH2A7d7cPt2T+2Bxs6wNkuPyM
         X3fgMosQoRvFgjLCWlQhDcDWI+yyO6vlPoPQdH409Yyt5UTUlqbVlwv5jH8F7kHl6rD/
         FRYJfVIz/gwDv/8jFGSruT3N/hS5hXIRAQYI97vIsqrSwVHLvpam69a8uZoKxPbQ5bNL
         kNBg==
X-Gm-Message-State: AOJu0Yw4moHYUApTS7/R0XYza70X54Mz7DfICXSY45M7xmPL3nfXHx8D
	7zowngji6OpVuzHLNVUHT+mPuRMhB+h1ow==
X-Google-Smtp-Source: AGHT+IGfzdktZSJwgqkIHufIhGneEQjOuspdqACSj/uAfffG8gzQb4M7HRalRXc/JWyj6DHiVXaz8g==
X-Received: by 2002:a05:6a20:5611:b0:13d:5b70:17da with SMTP id ir17-20020a056a20561100b0013d5b7017damr5654732pzc.26.1694962213365;
        Sun, 17 Sep 2023 07:50:13 -0700 (PDT)
Received: from bft01.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id j16-20020aa79290000000b0068c90e1ec84sm5801030pfa.167.2023.09.17.07.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 07:50:12 -0700 (PDT)
From: Sanjana <sanjanasanju1608@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com,
	Sanjana <sanjanasanju1608@gmail.com>
Subject: [kirkstone][PATCH] binutils: Fix CVE-2022-48065
Date: Sun, 17 Sep 2023 20:19:46 +0530
Message-Id: <20230917144946.597355-1-sanjanasanju1608@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 14:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187808

Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
---
 .../binutils/binutils-2.38.inc                |   3 +
 .../binutils/0029-CVE-2022-48065-1.patch      |  31 +++++
 .../binutils/0029-CVE-2022-48065-2.patch      | 115 +++++++++++++++++
 .../binutils/0029-CVE-2022-48065-3.patch      | 122 ++++++++++++++++++
 4 files changed, 271 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-3.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 5c3ff3d93a..3bcb0cabb8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -56,5 +56,8 @@ SRC_URI = "\
      file://0023-CVE-2023-25585.patch \
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
+     file://0029-CVE-2022-48065-1.patch \
+     file://0029-CVE-2022-48065-2.patch \
+     file://0029-CVE-2022-48065-3.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-1.patch b/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-1.patch
new file mode 100644
index 0000000000..4642251f9b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-1.patch
@@ -0,0 +1,31 @@
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 29 Mar 2022 06:19:14 +0000 (+0200)
+Subject: bfd/Dwarf2: gas doesn't mangle names
+X-Git-Tag: binutils-2_39~1287
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=ddfc2f56d5782af79c696d7fef7c73bba11e8b09
+
+bfd/Dwarf2: gas doesn't mangle names
+
+Include the language identifier emitted by gas in the set of ones where
+no mangled names are expected. Even if there could be "hand-mangled"
+names, gas doesn't emit DW_AT_linkage_name in the first place.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=ddfc2f56d5782af79c696d7fef7c73bba11e8b09]    
+
+CVE: CVE-2022-48065 
+
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+---
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 8cd0ce9d425..9aa4e955a5e 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -1441,6 +1441,7 @@ non_mangled (int lang)
+     case DW_LANG_PLI:
+     case DW_LANG_UPC:
+     case DW_LANG_C11:
++    case DW_LANG_Mips_Assembler:
+       return true;
+     }
+ }
diff --git a/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-2.patch b/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-2.patch
new file mode 100644
index 0000000000..8aa21f2716
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-2.patch
@@ -0,0 +1,115 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 21 Sep 2022 05:15:44 +0000 (+0930)
+Subject: dwarf2.c: mangle_style
+X-Git-Tag: gdb-13-branchpoint~1165
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=4609af80c29db6015ce01b67c48f237c210da9b4
+
+dwarf2.c: mangle_style
+
+non_mangled incorrectly returned "true" for Ada.  Correct that, and
+add a few more non-mangled entries.  Return a value suitable for
+passing to cplus_demangle to control demangling.
+
+	* dwarf2.c: Include demangle.h.
+	(mangle_style): Rename from non_mangled.  Return DMGL_* value
+	to suit lang.  Adjust all callers.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=4609af80c29db6015ce01b67c48f237c210da9b4]
+
+CVE: CVE-2022-48065
+
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+---
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index e7c12c3e9de..138cdbb00bb 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -32,6 +32,7 @@
+ #include "sysdep.h"
+ #include "bfd.h"
+ #include "libiberty.h"
++#include "demangle.h"
+ #include "libbfd.h"
+ #include "elf-bfd.h"
+ #include "dwarf2.h"
+@@ -1711,31 +1712,52 @@ read_attribute (struct attribute *    attr,
+   return info_ptr;
+ }
+ 
+-/* Return whether DW_AT_name will return the same as DW_AT_linkage_name
+-   for a function.  */
++/* Return mangling style given LANG.  */
+ 
+-static bool
+-non_mangled (int lang)
++static int
++mangle_style (int lang)
+ {
+   switch (lang)
+     {
++    case DW_LANG_Ada83:
++    case DW_LANG_Ada95:
++      return DMGL_GNAT;
++
++    case DW_LANG_C_plus_plus:
++    case DW_LANG_C_plus_plus_03:
++    case DW_LANG_C_plus_plus_11:
++    case DW_LANG_C_plus_plus_14:
++      return DMGL_GNU_V3;
++
++    case DW_LANG_Java:
++      return DMGL_JAVA;
++
++    case DW_LANG_D:
++      return DMGL_DLANG;
++
++    case DW_LANG_Rust:
++    case DW_LANG_Rust_old:
++      return DMGL_RUST;
++
+     default:
+-      return false;
++      return DMGL_AUTO;
+ 
+     case DW_LANG_C89:
+     case DW_LANG_C:
+-    case DW_LANG_Ada83:
+     case DW_LANG_Cobol74:
+     case DW_LANG_Cobol85:
+     case DW_LANG_Fortran77:
+     case DW_LANG_Pascal83:
+-    case DW_LANG_C99:
+-    case DW_LANG_Ada95:
+     case DW_LANG_PLI:
++    case DW_LANG_C99:
+     case DW_LANG_UPC:
+     case DW_LANG_C11:
+     case DW_LANG_Mips_Assembler:
+-      return true;
++    case DW_LANG_Upc:
++    case DW_LANG_HP_Basic91:
++    case DW_LANG_HP_IMacro:
++    case DW_LANG_HP_Assembler:
++      return 0;
+     }
+ }
+ 
+@@ -3599,7 +3621,7 @@ find_abstract_instance (struct comp_unit *unit,
+ 		  if (name == NULL && is_str_form (&attr))
+ 		    {
+ 		      name = attr.u.str;
+-		      if (non_mangled (unit->lang))
++		      if (mangle_style (unit->lang) == 0)
+ 			*is_linkage = true;
+ 		    }
+ 		  break;
+@@ -4095,7 +4117,7 @@ scan_unit_for_symbols (struct comp_unit *unit)
+ 		  if (func->name == NULL && is_str_form (&attr))
+ 		    {
+ 		      func->name = attr.u.str;
+-		      if (non_mangled (unit->lang))
++		      if (mangle_style (unit->lang) == 0)
+ 			func->is_linkage = true;
+ 		    }
+ 		  break;
diff --git a/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-3.patch b/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-3.patch
new file mode 100644
index 0000000000..35a658a22c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0029-CVE-2022-48065-3.patch
@@ -0,0 +1,122 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 21 Dec 2022 11:10:12 +0000 (+1030)
+Subject: PR29925, Memory leak in find_abstract_instance
+X-Git-Tag: binutils-2_40~192
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d28fbc7197ba0e021a43f873eff90b05dcdcff6a
+
+PR29925, Memory leak in find_abstract_instance
+
+The testcase in the PR had a variable with both DW_AT_decl_file and
+DW_AT_specification, where the DW_AT_specification also specified
+DW_AT_decl_file.  This leads to a memory leak as the file name is
+malloced and duplicates are not expected.
+
+I've also changed find_abstract_instance to not use a temp for "name",
+because that can result in a change in behaviour from the usual last
+of duplicate attributes wins.
+
+	PR 29925
+	* dwarf2.c (find_abstract_instance): Delete "name" variable.
+	Free *filename_ptr before assigning new file name.
+	(scan_unit_for_symbols): Similarly free func->file and
+	var->file before assigning.
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d28fbc7197ba0e021a43f873eff90b05dcdcff6a]
+
+CVE: CVE-2022-48065
+
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+---
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 0cd8152ee6e..b608afbc0cf 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -3441,7 +3441,6 @@ find_abstract_instance (struct comp_unit *unit,
+   struct abbrev_info *abbrev;
+   uint64_t die_ref = attr_ptr->u.val;
+   struct attribute attr;
+-  const char *name = NULL;
+ 
+   if (recur_count == 100)
+     {
+@@ -3602,9 +3601,9 @@ find_abstract_instance (struct comp_unit *unit,
+ 		case DW_AT_name:
+ 		  /* Prefer DW_AT_MIPS_linkage_name or DW_AT_linkage_name
+ 		     over DW_AT_name.  */
+-		  if (name == NULL && is_str_form (&attr))
++		  if (*pname == NULL && is_str_form (&attr))
+ 		    {
+-		      name = attr.u.str;
++		      *pname = attr.u.str;
+ 		      if (mangle_style (unit->lang) == 0)
+ 			*is_linkage = true;
+ 		    }
+@@ -3612,7 +3611,7 @@ find_abstract_instance (struct comp_unit *unit,
+ 		case DW_AT_specification:
+ 		  if (is_int_form (&attr)
+ 		      && !find_abstract_instance (unit, &attr, recur_count + 1,
+-						  &name, is_linkage,
++						  pname, is_linkage,
+ 						  filename_ptr, linenumber_ptr))
+ 		    return false;
+ 		  break;
+@@ -3622,7 +3621,7 @@ find_abstract_instance (struct comp_unit *unit,
+ 		     non-string forms into these attributes.  */
+ 		  if (is_str_form (&attr))
+ 		    {
+-		      name = attr.u.str;
++		      *pname = attr.u.str;
+ 		      *is_linkage = true;
+ 		    }
+ 		  break;
+@@ -3630,8 +3629,11 @@ find_abstract_instance (struct comp_unit *unit,
+ 		  if (!comp_unit_maybe_decode_line_info (unit))
+ 		    return false;
+ 		  if (is_int_form (&attr))
+-		    *filename_ptr = concat_filename (unit->line_table,
+-						     attr.u.val);
++		    {
++		      free (*filename_ptr);
++		      *filename_ptr = concat_filename (unit->line_table,
++						       attr.u.val);
++		    }
+ 		  break;
+ 		case DW_AT_decl_line:
+ 		  if (is_int_form (&attr))
+@@ -3643,7 +3645,6 @@ find_abstract_instance (struct comp_unit *unit,
+ 	    }
+ 	}
+     }
+-  *pname = name;
+   return true;
+ }
+ 
+@@ -4139,8 +4140,11 @@ scan_unit_for_symbols (struct comp_unit *unit)
+ 
+ 		case DW_AT_decl_file:
+ 		  if (is_int_form (&attr))
+-		    func->file = concat_filename (unit->line_table,
+-						  attr.u.val);
++		    {
++		      free (func->file);
++		      func->file = concat_filename (unit->line_table,
++						    attr.u.val);
++		    }
+ 		  break;
+ 
+ 		case DW_AT_decl_line:
+@@ -4182,8 +4186,11 @@ scan_unit_for_symbols (struct comp_unit *unit)
+ 
+ 		case DW_AT_decl_file:
+ 		  if (is_int_form (&attr))
+-		    var->file = concat_filename (unit->line_table,
+-						 attr.u.val);
++		    {
++		      free (var->file);
++		      var->file = concat_filename (unit->line_table,
++						   attr.u.val);
++		    }
+ 		  break;
+ 
+ 		case DW_AT_decl_line:
-- 
2.34.1


