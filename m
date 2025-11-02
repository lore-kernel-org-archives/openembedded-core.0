Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B681ECCFA03
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 11:58:44 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8505.1762084722086947715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 03:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=b8VDrGJ5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251102115837ee5bf91818000207d6-2uvp7r@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251102115837ee5bf91818000207d6
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Nov 2025 12:58:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=STz4WgBDOOPMWV6H5T7iYRy1A4ifHddQNy1i1zX8+0w=;
 b=b8VDrGJ5rbvYzygvlTBi9O4dQzxdH0qQnbKysYsqU7209LL8yZz/pPWe9xPyK7UujUEn/3
 rw/rfTF2OyaUQKh209PNWYrCm42tQRvYXSr2NFVuDJ6utvXBXNP1tuip9fMqP9zuKXO8I5lC
 c7kOkHe0QsuUY7psZOTFT4ygcMlBuuWNUMUovxFA2UvNXab6nv3uu2MTXKEG0RfnNWi9psWA
 eZdgA6PhOnd3exUMuOQIAychKNA1egbXmCO64fR6MtDtgXSwCOfuEK6ppvawN/GdAKngIsQ9
 wiHab+SYDT8hj878wewRFS/iT+sjdK2m5OFMKALNvkIf0/x4HsJ6Meig==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/3] binutils: patch CVE-2025-11414
Date: Sun,  2 Nov 2025 12:58:34 +0100
Message-Id: <20251102115836.1374458-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 11:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225577

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

(From OE-Core rev: cd7ce80fa1a99916aa2f93c4d9591c5496c3ef71)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-11414.patch    | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 3e180b60181..d358634ec58 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -61,5 +61,6 @@ SRC_URI = "\
      file://0023-CVE-2025-7545.patch \
      file://0024-CVE-2025-11082.patch \
      file://0025-CVE-2025-11083.patch \
+     file://CVE-2025-11414.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch
new file mode 100644
index 00000000000..c6e45c3091a
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
+@@ -8914,7 +8914,7 @@ struct elf_outext_info
+    <binary-operator> := as in C
+    <unary-operator> := as in C, plus "0-" for unambiguous negation.  */
+ 
+-static void
++static bool
+ set_symbol_value (bfd *bfd_with_globals,
+ 		  Elf_Internal_Sym *isymbuf,
+ 		  size_t locsymcount,
+@@ -8935,9 +8935,15 @@ set_symbol_value (bfd *bfd_with_globals,
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
+@@ -8947,11 +8953,12 @@ set_symbol_value (bfd *bfd_with_globals,
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
+@@ -11641,8 +11648,10 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
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

