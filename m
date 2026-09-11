Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09468C88E5F
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:51 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50891.1789164949544431440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0a7X+cSv;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso1041835e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164948; x=1789769748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gh2cukWabGiynrkBCDNmHgCmoZrmZhSm83ModsV6vRQ=;
        b=0a7X+cSvMltYLClpgs9CMESwCMbh0qM98ETq9OQh/Talch8UTGTUmYDtHf5yJR/qhP
         j8Qu8+gG2niWkWe8L+NiyDUd8mhzX/eVGlykKETAET8jr2Lc9o1h8J6wKta5OIRn+De6
         M+m9+Z1X/ExJIWlfDkVv4TuUZzmvBBbjMhBWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164948; x=1789769748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gh2cukWabGiynrkBCDNmHgCmoZrmZhSm83ModsV6vRQ=;
        b=aQSnV3Gwwd8jiYwTXlKh/vfL6f8c7djjPTJWneaTdiDYSiImw+r4+/llkO88cVC3Ib
         9N2h9HCstDG1rC+DcC5Yi7cWR3r9n+TBtpEOS/vKE+TBaqT+0+JpXY3CGSoNU7IO1mtp
         ucraZITiwE7AoeuFiHMHAA17CewzYk+tHWZli4xhRFMiG9ePdB/t1vDSmDmT118LrPCF
         oJlHf4R7fLuq9FGHGW9zuO51NLcpjwbAyFZdIhdisoI5tgPsl1p6y2eB8gtn0zhBU/X5
         QIAiqkV8kso2tmR4eI2dM8JMUa922AfNMQIb70oZv1B1JZE+VkC8Nrqk65NGnTRWQFqL
         HHzw==
X-Gm-Message-State: AFuF++mPZMKBDt09FMr+WqTYT2KAXVoK4Wd7b9rMqfsovmn6iCwzvziR
	qJjoiXd1Kl9qrMrlRK3cXGw8rZ3XIRb8qoo+DPQ5kWTyTfzRJrx2Ky170w/firqBAdvRMvUhM9m
	RFKSo4Rg=
X-Gm-Gg: AYBFou3BmNxtd+o3LUfGwoE4P8GrKuY6MzchWycfGUpWrwvUA5RxCoVb+hF0x7ckLlX
	Y98aZ6hCj5CKJQ3DG5bZy+JBDXYVLrKLuXP+8iWfa6hDdWarnNEvafnEdA2RAK9mlBLssQcVO1b
	YGGfi6fbMFsFuBlsALbSMCMQzhpNcVHVkSWbeTaG5oPJgFoZrrTYXxty4UpQ4Hcm+QWx391VMci
	OtrMYprFpeaqrzQ9YYFtvKaHFaQ9Rd/9m+gn/TdwzNuWYdMB6LkRq64ovBfJohiW9pIzmuUXkke
	JLfnNRMnOgxtKbut7nhPbZcgYzcduHdKnTFx1t6xMhFT4wsSCpibGwOKIkb+2Uqgd1FYpAf9nRu
	7giDtz/vkKM/G1IDXuBQnQZJ9ObislfhQs5Q1W/qV6Tg9Y86HaBL2TW4bS1oyw7+QazypvNMmSA
	D6NFANU1g+CkLACTaYF5vYFF2q1aXn27LXaxkyEJ8nFcdu0jmhDG6LC7SLRqKbdGqZuD95lpYoY
	SdO5k0mRbLazxXG+SU7Pyi2dV02+8hY2Aje+WQEpTgwGrgH2nmCaft+FDoWDMZwNueuDutd7Q0u
X-Received: by 2002:a05:600c:1d01:b0:49e:6ad7:95b5 with SMTP id 5b1f17b1804b1-49e6ad79624mr21860495e9.7.1789164947712;
        Fri, 11 Sep 2026 15:15:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/13] binutils: fix CVE-2026-4647
Date: Sat, 12 Sep 2026 00:15:02 +0200
Message-ID: <eba35fba09aede76b5aea0fd93898db9e028c0dc.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245678

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix [1], which addresses an out-of-bounds
read issue in XCOFF relocation processing, as described in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9e99dbc1f19ffaf18d0250788951706066ebe7f2
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=33919

Reference:
https://bugzilla.suse.com/show_bug.cgi?id=1260338
https://www.suse.com/security/cve/CVE-2026-4647.html
https://nvd.nist.gov/vuln/detail/CVE-2026-4647

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2026-4647.patch     | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 8665a2549aa..37dce2cb3e5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -83,5 +83,6 @@ SRC_URI = "\
      file://CVE-2026-15003.patch \
      file://CVE-2026-18220.patch \
      file://CVE-2026-3441_CVE-2026-3442.patch \
+     file://CVE-2026-4647.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
new file mode 100644
index 00000000000..2152903d341
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
@@ -0,0 +1,228 @@
+From 3f02998235538f179d7884a76bd4d91e86a533b0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 13 Mar 2026 17:28:28 +1030
+Subject: [PATCH 2/2] PR33919 Out-of-bounds read in XCOFF relocation processing
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
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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
+2.44.4
+

