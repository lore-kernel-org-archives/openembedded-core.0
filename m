Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE53CD5BD7
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3176.1695249069115020352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2Cbitr7l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-690d8c05784so222800b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249068; x=1695853868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk2Um/PePAid57hjX/gKPa7s9764H29v2grPWuwmRDs=;
        b=2Cbitr7li6xIhS1n8cJYDJtcLoGQaAQf8sRNXORe0jv3GL7V4W7+328acb2LLYRkNN
         s5igvc9gy3hpmbYhRSbppzSBTsxgl9fPuqg97QG7hJH7IXTQYaeehIhl1fVISR2f40Ft
         EHE4JtJDlvgAEwSbhWTPiGxcxdAzFYz5fD+npdH3RprgDMYtf6q+owHNAXbZdIfyXxvG
         20HMYS/Skym9za5Fk5DgVcDa+wTzaO+xb8udkWzdnFnUmYyWYwHupLKTGg7JfBnmB+7x
         KKpr/d26KF+Qq+SVP3wxk9FrxtiI4ie8Aqawd8DZ8OATQPdXZlLjgfZ8zBLJT4U/VWNf
         rZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249068; x=1695853868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk2Um/PePAid57hjX/gKPa7s9764H29v2grPWuwmRDs=;
        b=KTBQjbpyO8pCBkjPdSIeghFog4P7N6HAskZAUq9ss3SvyUqlxlhPip9tkgFIv6hcq4
         lIpr76TNc4uV251c9ZEEymTlGo7mL6ZVaPpYfXQKVSbuG+wPR2XHZLPAS2U0OeuFRUBT
         YRxiWwvPUJWY0Hi2L9WHG41vGdYxb/IL04wPqarNetBrLm8eSm/K8XEHlzj8J65aEZTY
         cXEfl3EA7X3q0YNq3xp5h0ZswiJb08BddlR++fHDy6xDfPm1AnSZG+zudnsjyDIaPNoI
         Bh120wv9iQ7Domd/MXXwpQjD36MgJuvOwiVTIdpWGLkKx7GJDAIAHuEW7oFA/8meOTh5
         UbTQ==
X-Gm-Message-State: AOJu0Yz2vv62PnOsxKBsbS6qOiIuKgEmzOcuaHxoqbzu3TMYQG0/CbAG
	YRlu4VdaP+CYomuklgRFBtG6VJiUACdx8MUb8SE=
X-Google-Smtp-Source: AGHT+IECE92Clp8ZCWpRlhzgvy9q5XMPzL73QAhZUrIIRFNsG59OleOK6SMuv42gt62yJ3UdLJ1CUg==
X-Received: by 2002:a05:6a20:4408:b0:14e:429e:b0e3 with SMTP id ce8-20020a056a20440800b0014e429eb0e3mr4531672pzb.52.1695249067979;
        Wed, 20 Sep 2023 15:31:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/20] binutils: Fix CVE-2022-48065
Date: Wed, 20 Sep 2023 12:30:40 -1000
Message-Id: <860ecdbbf5cfd8737c914522af16dbc8bee0f72f.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187951

From: Sanjana <sanjanasanju1608@gmail.com>

Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


