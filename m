Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84731CCD1A2
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 22:09:34 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.4882.1760998166653454265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 15:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hCZMACgh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025102022092024b1f9180100020755-fqlqwt@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025102022092024b1f9180100020755
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Oct 2025 00:09:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q/qP2esf9vs6dC7a1q81RvnyqX2yqC0WE60BfS4AdRM=;
 b=hCZMACgh2AUzASjniL+qJePDjTihEWC1J9aWax7J0mDwHYo+AHvHinDeGfZOo80hHUG4L3
 rsUVrtqYC86I+TDjeMDZLhQ0a90KelQ8Fd54S87/+MDUz/f4hx3oMZfC5GS61ALeXekaR4w3
 y6LSIzfxc5pwhmjhE50bv9IlFFxHp/0yJHFlbtgQSKXLpYXEhUDGG8OfmD8wm+nqdj8dzwrh
 M6UOm4wAL10l1c5ZqXZLUNA3PJYXvHnQAQtwCt2zMysLRsEB3IutgJkiRW5ZuofT4oYSqjou
 5TDYybFFr5dFKv+Pb4z58apst34z3v/cLQKNkJkcPWjJFBSAuH4egzzQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/5] binutils: patch CVE-2025-11414
Date: Tue, 21 Oct 2025 00:09:08 +0200
Message-Id: <20251020220912.483748-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 22:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225135

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/binutils/CVE-2025-11414.patch    | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 391b0157d3a..2adff3c4562 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -39,4 +39,5 @@ SRC_URI = "\
      file://0015-CVE-2025-11081.patch \
      file://0016-CVE-2025-11082.patch \
      file://0017-CVE-2025-11083.patch \
+     file://CVE-2025-11414.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch
new file mode 100644
index 00000000000..21f98f075ed
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch
@@ -0,0 +1,84 @@
+From aeaaa9af6359c8e394ce9cf24911fec4f4d23703 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 23 Sep 2025 08:52:26 +0800
+Subject: [PATCH] elf: Return error on unsorted symbol table if not allowed
+
+Normally ELF symbol table should be sorted, i.e., local symbols precede
+global symbols.  Irix 6 is an exception and its elf_bad_symtab is set
+to true.  Issue an error if elf_bad_symtab is false and symbol table is
+unsorted.
+
+	PR ld/33450
+	* elflink.c (set_symbol_value): Change return type to bool and
+	return false on error.  Issue an error on unsorted symbol table
+	if not allowed.
+	(elf_link_input_bfd): Return false if set_symbol_value reurns
+	false.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11414
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=aeaaa9af6359c8e394ce9cf24911fec4f4d23703]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elflink.c | 21 +++++++++++++++------
+ 1 file changed, 15 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 66982f82b94..54f0d6e957e 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -9127,7 +9127,7 @@ struct elf_outext_info
+    <binary-operator> := as in C
+    <unary-operator> := as in C, plus "0-" for unambiguous negation.  */
+ 
+-static void
++static bool
+ set_symbol_value (bfd *bfd_with_globals,
+ 		  Elf_Internal_Sym *isymbuf,
+ 		  size_t locsymcount,
+@@ -9148,9 +9148,15 @@ set_symbol_value (bfd *bfd_with_globals,
+ 	     "absolute" section and give it a value.  */
+ 	  sym->st_shndx = SHN_ABS;
+ 	  sym->st_value = val;
+-	  return;
++	  return true;
++	}
++      if (!elf_bad_symtab (bfd_with_globals))
++	{
++	  _bfd_error_handler (_("%pB: corrupt symbol table"),
++			      bfd_with_globals);
++	  bfd_set_error (bfd_error_bad_value);
++	  return false;
+ 	}
+-      BFD_ASSERT (elf_bad_symtab (bfd_with_globals));
+       extsymoff = 0;
+     }
+ 
+@@ -9160,11 +9166,12 @@ set_symbol_value (bfd *bfd_with_globals,
+   if (h == NULL)
+     {
+       /* FIXMEL What should we do ?  */
+-      return;
++      return false;
+     }
+   h->root.type = bfd_link_hash_defined;
+   h->root.u.def.value = val;
+   h->root.u.def.section = bfd_abs_section_ptr;
++  return true;
+ }
+ 
+ static bool
+@@ -11862,8 +11869,10 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
+ 		    return false;
+ 
+ 		  /* Symbol evaluated OK.  Update to absolute value.  */
+-		  set_symbol_value (input_bfd, isymbuf, locsymcount,
+-				    r_symndx, val);
++		  if (!set_symbol_value (input_bfd, isymbuf, locsymcount, r_symndx,
++					 val))
++		    return false;
++
+ 		  continue;
+ 		}
+ 

