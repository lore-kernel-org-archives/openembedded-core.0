Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70039CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 17:32:16 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3014.1778693534086265730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 10:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jeftmsdC;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10053; q=dns/txt;
  s=iport01; t=1778693534; x=1779903134;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=joNLNBdBSS2GGbE/FH+qRzUWNI4JGzKbCYWLXnVYLTU=;
  b=jeftmsdCB6QZQHlr0LVPos+DkmEJ+e8isvW2xr+2u2e/KmSfu+7ltcRF
   cxUpB1ZjGzT4gInRT95BNhLUFICridhV95Li/XcgLAQvuBHx5jkpGyMId
   Ewz+kdQeQjoU9joZFI6oFBUGGysmKR8iIJizBu8/kEZvlD5DEHQUWoCKZ
   y2EzVTO9lGUhP2X6f6Ly4oqXmwsXvTgH4ValJ1eitBuarSWB+XSQIHAi8
   QkGJjWmEVwshku/NUzq1F+wQjP32Pdo3Wt8Tasl3880rJJRoNFF2d+Cei
   +y0mucLq4nc5I4sglRVd3QAq3lRl/m4BLEsIYn/GCKBwpv/K/j6QRzvRv
   Q==;
X-CSE-ConnectionGUID: qEOYSBmsQsme6hutLz9/mg==
X-CSE-MsgGUID: LY5XaMRtSyi+BdvJSWcBkw==
X-IPAS-Result: =?us-ascii?q?A0BIAgDstARq/5D/Ja1aHgEBCxIMggULgldyX0JJA5Qng?=
 =?us-ascii?q?iEDgROKUZI2gX8PAQEBD0QNBAEBhQYCjTICJjQJDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwFWHAMBAi8gCyMIBxKDAgGCO?=
 =?us-ascii?q?gM2AgERBrJ6gXkzgQGDWgUJAkNQ2EgNglMBBQYUAYE4hT+CeoUjWxgBhHsnG?=
 =?us-ascii?q?xuBcoEUAYE7gTd2gQWBGkIBAgEYfm6GHgSCIoEOgV0ejQ1IgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAyoLEhIYFW4yHYEjPheBCxsHBYFLggVyaoEChF94IywDToEuMgMLG?=
 =?us-ascii?q?A1IESw3FBsEPm4HikwdD4E+cgEsYQEpAiCBXRIdkz+QFIIhoB1xCiiDdIwej?=
 =?us-ascii?q?z6FfBozhASUFZJSmQYijWeECZJHhGiBaDyBRwsHcBWDIlMZD44tCwuDYIF/g?=
 =?us-ascii?q?xTDKCQ1AgkDLwEBBwIHDQMLgWiQEYFsAQE?=
IronPort-Data: A9a23:sf7GhKvrfMWxhIFwapdX4QPtCufnVDhfMUV32f8akzHdYApBsoF/q
 tZmKWzQOPiKMTDye4x2OYiy9BhV68fUmoM1TARt/yxmFXhEgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs//a80s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw48tQMFpk8
 OchMzUAMBCem8akkfW+Rbw57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoPWHJ8JxhjG+
 woq+UzdM0wqPfml1QGU8zGGivHtphzwcoENQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4O/w94QeLjKHT5QmQAkAfSz9FZZoorqcLqScCz
 FSFmZbtQDdoqrDQES3b/baPpjT0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:67NPlayeStc0qOKU+5CjKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:vFlDzmDiZhHVCS36EzBK038vMMU+S2bYwSnQPlOcGzcuTbLAHA==
X-Talos-MUID: 9a23:eV1YlAs69LXpNk4mTs2noAA/BM5N2biVGUFOu5kYmfK7PgZzJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,233,1770595200"; 
   d="scan'208";a="741240665"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 May 2026 17:32:13 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id B157A1800048A;
	Wed, 13 May 2026 17:32:12 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 57989CC12B5; Wed, 13 May 2026 10:32:12 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: yoann.congal@smile.fr,
	openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 2/2] binutils: fix CVE-2026-4647
Date: Wed, 13 May 2026 10:27:34 -0700
Message-Id: <20260513172734.3995341-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260513172734.3995341-1-sudumbha@cisco.com>
References: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
 <20260513172734.3995341-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 17:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236998

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], which addresses an out-of-bounds
read issue in XCOFF relocation processing, as described in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9e99dbc1f19ffaf18d0250788951706066ebe7f2
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=33919

Reference:
https://bugzilla.suse.com/show_bug.cgi?id=1260338
https://www.suse.com/security/cve/CVE-2026-4647.html
https://nvd.nist.gov/vuln/detail/CVE-2026-4647

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
Changes v1 -> v2:
- fixed tab issue around context lines

 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2026-4647.patch     | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 1a91792b13..3296573baf 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -75,5 +75,6 @@ SRC_URI = "\
      file://CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
      file://CVE-2026-3441_CVE-2026-3442.patch \
+     file://CVE-2026-4647.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
new file mode 100644
index 0000000000..564c435692
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
@@ -0,0 +1,228 @@
+From a0df757a2ad6728da209fa7fcc9f3a598183999b Mon Sep 17 00:00:00 2001
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
+
+(cherry picked from commit 9e99dbc1f19ffaf18d0250788951706066ebe7f2)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ bfd/coff-rs6000.c   | 36 +++++++++++++++++++++---------------
+ bfd/coff64-rs6000.c | 33 ++++++++++++++++++++-------------
+ bfd/libxcoff.h      |  3 ---
+ 3 files changed, 41 insertions(+), 31 deletions(-)
+
+diff --git a/bfd/coff-rs6000.c b/bfd/coff-rs6000.c
+index 87feb672bf1..0f2cc496b63 100644
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
+@@ -3776,6 +3775,14 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
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
+@@ -3795,7 +3802,7 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 
+ 	    default:
+ 	      _bfd_error_handler
+-		(_("%pB: relocation (%d) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
++		(_("%pB: relocation (%#x) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
+ 		 input_bfd, rel->r_type, (uint64_t) rel->r_vaddr, rel->r_size);
+ 	      return false;
+ 	    }
+@@ -3871,10 +3878,9 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
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
+index 0f8d9e08783..c74698070d5 100644
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
+index 81c4e205e06..ca716a9ef3a 100644
+--- a/bfd/libxcoff.h
++++ b/bfd/libxcoff.h
+@@ -215,9 +215,6 @@ struct xcoff_backend_data_rec
+ #define bfd_xcoff_text_align_power(a) ((xcoff_data (a)->text_align_power))
+ #define bfd_xcoff_data_align_power(a) ((xcoff_data (a)->data_align_power))
+ 
+-/* xcoff*_ppc_relocate_section macros  */
+-#define XCOFF_MAX_CALCULATE_RELOCATION (0x32)
+-#define XCOFF_MAX_COMPLAIN_OVERFLOW (4)
+ /* N_ONES produces N one bits, without overflowing machine arithmetic.  */
+ #ifdef N_ONES
+ #undef N_ONES
+-- 
+2.35.6
+
-- 
2.35.6


