Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECADF8D76F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:10:56 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23315.1776366653760154268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=KVHkZMw6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260416191051f4a5e0e78000020763-xwvo1_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260416191051f4a5e0e78000020763
        for <openembedded-core@lists.openembedded.org>;
        Thu, 16 Apr 2026 21:10:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=q+OwFZLSUeJSdN6CB7y9esZcMUaMJdsN37MdhbwlUWo=;
 b=KVHkZMw6tg/D2IlLGrDAfEr9GCtm/JRCL2748bmP8jWt+zI2ZcmuMSkRFmYU34LMlmff3N
 mYlXM3mQMSj5XlK/nzAlnxkCtGPvGoKhUm0qifo3NLTJC0Gjk/tcGQGbqSdYQPQblvE7NMN1
 gYFF5fBZCsPC6kOqNu74ogPQwu93qCshCeyKOHkp2x2bj/pxYrv3Vgy/9K7YS+WGvZb+2p95
 QSeAYsFo3Ak/LpFoe8XROMFc5M4pLpRvvKjUC90UBy9eXIdjj59hLSCsb8A64AaHg2Bv9tqb
 JGmizFdUMK7KB6b0DLI4PJ0Gk7yOBpUxjRj1FOkzmglcXWiVKnsYWmaA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] binutils: patch CVE-2026-4647
Date: Thu, 16 Apr 2026 21:10:33 +0200
Message-ID: <20260416191033.921922-2-peter.marko@siemens.com>
In-Reply-To: <20260416191033.921922-1-peter.marko@siemens.com>
References: <20260416191033.921922-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 19:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235416

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-4647

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../binutils/binutils-2.46.inc                |   1 +
 .../binutils/binutils/CVE-2026-4647.patch     | 223 ++++++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index 6ae6cef352..4948e9b576 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -38,4 +38,5 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://CVE-2026-4647.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
new file mode 100644
index 0000000000..5a51ea2d45
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
@@ -0,0 +1,223 @@
+From 9e99dbc1f19ffaf18d0250788951706066ebe7f2 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 13 Mar 2026 17:28:28 +1030
+Subject: [PATCH] PR33919 Out-of-bounds read in XCOFF relocation processing
+
+	PR 33919
+	* coff-rs6000.c (xcoff_calculate_relocation): Don't use explicit
+	array size.
+	(xcoff_complain_overflow): Likewise.
+	(xcoff_rtype2howto): Return a NULL howto rather than aborting.
+	(_bfd_xcoff_reloc_name_lookup): Use ARRAY_SIZE.
+	(xcoff_ppc_relocate_section): Sanity check reloc r_type before
+	accessing xcoff_howto_table.  Print r_type using %#x.  Remove
+	now redundant later reloc r_type sanity check.
+	* coff64-rs6000.c: Similarly.
+	* libxcoff.h (XCOFF_MAX_CALCULATE_RELOCATION): Don't define.
+	(XCOFF_MAX_COMPLAIN_OVERFLOW): Don't define.
+
+CVE: CVE-2026-4647
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9e99dbc1f19ffaf18d0250788951706066ebe7f2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/coff-rs6000.c   | 36 +++++++++++++++++++++---------------
+ bfd/coff64-rs6000.c | 33 ++++++++++++++++++++-------------
+ bfd/libxcoff.h      |  3 ---
+ 3 files changed, 41 insertions(+), 31 deletions(-)
+
+diff --git a/bfd/coff-rs6000.c b/bfd/coff-rs6000.c
+index 62caae64f4e..00e0f5442f7 100644
+--- a/bfd/coff-rs6000.c
++++ b/bfd/coff-rs6000.c
+@@ -155,8 +155,7 @@ static xcoff_complain_function xcoff_complain_overflow_bitfield_func;
+ static xcoff_complain_function xcoff_complain_overflow_signed_func;
+ static xcoff_complain_function xcoff_complain_overflow_unsigned_func;
+ 
+-xcoff_reloc_function *const
+-xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
++xcoff_reloc_function *const xcoff_calculate_relocation[] =
+ {
+   xcoff_reloc_type_pos,  /* R_POS   (0x00) */
+   xcoff_reloc_type_neg,  /* R_NEG   (0x01) */
+@@ -210,8 +209,7 @@ xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
+   xcoff_reloc_type_toc,  /* R_TOCL    (0x31) */
+ };
+ 
+-xcoff_complain_function *const
+-xcoff_complain_overflow[XCOFF_MAX_COMPLAIN_OVERFLOW] =
++xcoff_complain_function *const xcoff_complain_overflow[] =
+ {
+   xcoff_complain_overflow_dont_func,
+   xcoff_complain_overflow_bitfield_func,
+@@ -1158,8 +1156,11 @@ reloc_howto_type xcoff_howto_table[] =
+ void
+ xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
+ {
+-  if (internal->r_type > R_TOCL)
+-    abort ();
++  if (internal->r_type >= ARRAY_SIZE (xcoff_howto_table))
++    {
++      relent->howto = NULL;
++      return;
++    }
+ 
+   /* Default howto layout works most of the time */
+   relent->howto = &xcoff_howto_table[internal->r_type];
+@@ -1183,7 +1184,7 @@ xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
+   if (relent->howto->dst_mask != 0
+       && (relent->howto->bitsize
+ 	  != ((unsigned int) internal->r_size & 0x1f) + 1))
+-    abort ();
++    relent->howto = NULL;
+ }
+ 
+ reloc_howto_type *
+@@ -1236,9 +1237,7 @@ _bfd_xcoff_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNUSED,
+ {
+   unsigned int i;
+ 
+-  for (i = 0;
+-       i < sizeof (xcoff_howto_table) / sizeof (xcoff_howto_table[0]);
+-       i++)
++  for (i = 0; i < ARRAY_SIZE (xcoff_howto_table); i++)
+     if (xcoff_howto_table[i].name != NULL
+ 	&& strcasecmp (xcoff_howto_table[i].name, r_name) == 0)
+       return &xcoff_howto_table[i];
+@@ -3763,6 +3762,14 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 	 the csect including the symbol which it references.  */
+       if (rel->r_type == R_REF)
+ 	continue;
++      if (rel->r_type >= ARRAY_SIZE (xcoff_howto_table))
++	{
++	  /* xgettext:c-format */
++	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
++			      input_bfd, rel->r_type);
++	  bfd_set_error (bfd_error_bad_value);
++	  return false;
++	}
+ 
+       /* Retrieve default value in HOWTO table and fix up according
+ 	 to r_size field, if it can be different.
+@@ -3782,7 +3789,7 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 
+ 	    default:
+ 	      _bfd_error_handler
+-		(_("%pB: relocation (%d) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
++		(_("%pB: relocation (%#x) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
+ 		 input_bfd, rel->r_type, (uint64_t) rel->r_vaddr, rel->r_size);
+ 	      return false;
+ 	    }
+@@ -3858,10 +3865,9 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 	    }
+ 	}
+ 
+-      if (rel->r_type >= XCOFF_MAX_CALCULATE_RELOCATION
+-	  || !((*xcoff_calculate_relocation[rel->r_type])
+-	       (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
+-		addend, &relocation, contents, info)))
++      if (!((*xcoff_calculate_relocation[rel->r_type])
++	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
++	     addend, &relocation, contents, info)))
+ 	return false;
+ 
+       /* address */
+diff --git a/bfd/coff64-rs6000.c b/bfd/coff64-rs6000.c
+index fa1759b5925..f6a60433e62 100644
+--- a/bfd/coff64-rs6000.c
++++ b/bfd/coff64-rs6000.c
+@@ -177,8 +177,7 @@ static bool xcoff64_bad_format_hook
+ /* Relocation functions */
+ static xcoff_reloc_function xcoff64_reloc_type_br;
+ 
+-xcoff_reloc_function *const
+-xcoff64_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
++xcoff_reloc_function *const xcoff64_calculate_relocation[] =
+ {
+   xcoff_reloc_type_pos,  /* R_POS     (0x00) */
+   xcoff_reloc_type_neg,  /* R_NEG     (0x01) */
+@@ -1439,8 +1438,11 @@ reloc_howto_type xcoff64_howto_table[] =
+ void
+ xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
+ {
+-  if (internal->r_type > R_TOCL)
+-    abort ();
++  if (internal->r_type >= ARRAY_SIZE (xcoff64_howto_table))
++    {
++      relent->howto = NULL;
++      return;
++    }
+ 
+   /* Default howto layout works most of the time */
+   relent->howto = &xcoff64_howto_table[internal->r_type];
+@@ -1473,7 +1475,7 @@ xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
+   if (relent->howto->dst_mask != 0
+       && (relent->howto->bitsize
+ 	  != ((unsigned int) internal->r_size & 0x3f) + 1))
+-    abort ();
++    relent->howto = NULL;
+ }
+ 
+ reloc_howto_type *
+@@ -1528,9 +1530,7 @@ xcoff64_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNUSED,
+ {
+   unsigned int i;
+ 
+-  for (i = 0;
+-       i < sizeof (xcoff64_howto_table) / sizeof (xcoff64_howto_table[0]);
+-       i++)
++  for (i = 0; i < ARRAY_SIZE (xcoff64_howto_table); i++)
+     if (xcoff64_howto_table[i].name != NULL
+ 	&& strcasecmp (xcoff64_howto_table[i].name, r_name) == 0)
+       return &xcoff64_howto_table[i];
+@@ -1574,6 +1574,14 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 	 the csect including the symbol which it references.  */
+       if (rel->r_type == R_REF)
+ 	continue;
++      if (rel->r_type >= ARRAY_SIZE (xcoff64_howto_table))
++	{
++	  /* xgettext:c-format */
++	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
++			      input_bfd, rel->r_type);
++	  bfd_set_error (bfd_error_bad_value);
++	  return false;
++	}
+ 
+       /* Retrieve default value in HOWTO table and fix up according
+ 	 to r_size field, if it can be different.
+@@ -1595,7 +1603,7 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 
+ 	    default:
+ 	      _bfd_error_handler
+-		(_("%pB: relocation (%d) at (0x%" PRIx64 ") has wrong"
++		(_("%pB: relocation (%#x) at (0x%" PRIx64 ") has wrong"
+ 		   " r_rsize (0x%x)\n"),
+ 		 input_bfd, rel->r_type, rel->r_vaddr, rel->r_size);
+ 	      return false;
+@@ -1668,10 +1676,9 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 	    }
+ 	}
+ 
+-      if (rel->r_type >= XCOFF_MAX_CALCULATE_RELOCATION
+-	  || !((*xcoff64_calculate_relocation[rel->r_type])
+-	      (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
+-	       addend, &relocation, contents, info)))
++      if (!((*xcoff64_calculate_relocation[rel->r_type])
++	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
++	     addend, &relocation, contents, info)))
+ 	return false;
+ 
+       /* address */
+diff --git a/bfd/libxcoff.h b/bfd/libxcoff.h
+index c116d9b795f..e6b87975ff6 100644
+--- a/bfd/libxcoff.h
++++ b/bfd/libxcoff.h
+@@ -217,9 +217,6 @@ struct xcoff_backend_data_rec
+ #define bfd_xcoff_text_align_power(a) ((xcoff_data (a)->text_align_power))
+ #define bfd_xcoff_data_align_power(a) ((xcoff_data (a)->data_align_power))
+ 
+-/* xcoff*_ppc_relocate_section macros  */
+-#define XCOFF_MAX_CALCULATE_RELOCATION (0x32)
+-#define XCOFF_MAX_COMPLAIN_OVERFLOW (4)
+ /* N_ONES produces N one bits, without overflowing machine arithmetic.  */
+ #ifdef N_ONES
+ #undef N_ONES

