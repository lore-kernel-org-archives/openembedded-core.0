Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F41C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:01:16 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16168.1787576474235174311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PIFeqnKa;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-476a130c138so3401275f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576472; x=1788181272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iiTdBuFC0jW72uZXKlmO/Ai4IsFeJMxK5PcnD4MiNuk=;
        b=PIFeqnKaWMU2JnwiarePwW7gt7AA0k4qtpue+slETJk4zNlD6Gl1/YzdYJYRcSTMrn
         ypt/T5i2hmez4WEJarQqTHIdh1fhPc6PPQZUyNlRvJRvqEpVg9Ok3OTM5oSJlxKsSYPo
         Hwm/TXq+cWC9muA/GixN0xbJ12YF4RTrViL2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576472; x=1788181272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iiTdBuFC0jW72uZXKlmO/Ai4IsFeJMxK5PcnD4MiNuk=;
        b=XflQDmzPgGdiaumlhlUQlPTChQlO4pxUkdoWeaUGJifv1IXouz+ACR+NRjbtlnKaZo
         AHc9EmrR1Xd2dTObIzUS/2OvA9EaGkiDBh+ZKPJgqatmj2gkNh+EFxzuAnmimm8i8c7T
         6vXXp3/TVjXNFUn9QslxtsygkRDBTO4X87Fsv5pJ9iC4AiHZw2HjqIt4F9dv39Ln2m1w
         uo/NelCynI10MekS6n68TRkamnPl/wsIpIHrukb98xwQLleFC6/YVSolwaIRp0D7AwIO
         imiQXVv2HNKV5052Y1yJmHY0Bowp9FlNVTtRs3rwN2YjD1i77/Jrbco8NNPI7fvX4Zoa
         /WgQ==
X-Gm-Message-State: AFuF++k6n9S96Il8xTvkKHpDNy8wrIUG7yFsU0vvRXLohp/FY+x56PQu
	EMOmGYg96Xzly8yuyNad7sL6sCijeILlMhNMqSd7PIWZRlNSDKiNN/jWK0bmjPyEpQejHsgu8YX
	INNrsvE8=
X-Gm-Gg: AR+sD13eNhgQ3SjIsCRLQD2dcajOPgRITyPgh7fP4cPfxedh9plfnbwoofJBS3GeQq+
	RiqpJ748PDc9ovMNsnyYWOoV38uBuu8Y0bDkW3b1K7rMdjL3cAl7llGZml1TGbPaZGuqHTIaSOS
	1Nl8FsNmOuum0D1EL3fqRT2NPX5Bl1iz6HB5dwaG5UwYkdXk0Irkvtlhkj0d6PSHJfTuDXJS6ru
	t66je6ROJy/usD9UhGobpPVjbg56BEjWcwL2qG74wDWX3aG6gvvog6WI71C53wTQKJMnzWrKNCD
	y8DEEFOMdQayY53EC719vQ4Gp5ssqpJI2Jm2OWuyp/uComV1ae8Zf1+AfpssLQvnbi8+TewV6b8
	IrAncVKiSXepl/is7MfKTFvlhD/jihyZLmfOC+WSOy1ATklK2zDr+MlmKiwqOcfMkUFPemNfLTv
	zamJ/Hs8LnHdq8AccjO3DH+yxv2P6FiRP2Avmbfs8J4IgFpsCons+pKKvt7Y26qovFi2Thi5CLG
	ENXCGPwBEL9EDfhb8mEqW7o07t3rFywGs8aG9hFcauRDckAlfj5XZQRBmaqNuWqhbIqisI=
X-Received: by 2002:a05:600c:5486:b0:499:a0f3:9d5c with SMTP id 5b1f17b1804b1-499b82f412amr310146465e9.3.1787576445875;
        Mon, 24 Aug 2026 06:00:45 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/19] binutils: Patch for CVE-2026-15003
Date: Mon, 24 Aug 2026 14:59:51 +0200
Message-ID: <711c77071762f53fe124a78d5049c56d70ad48f1.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244118

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-15003
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=23acf2f003f81b2f8d9d1997ea45d822d33d386c

Test results:
  binutils-testsuite 2.46.1 (x86_64-oe-linux) - All tests PASSED

  binutils: 327 passed, 5 untested, 9 unsupported
  gas:      2091 passed, 4 unsupported
  ld:       1899 passed, 7 expected failures, 20 untested, 109 unsupported

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=23acf2f003f81b2f8d9d1997ea45d822d33d386c]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../binutils/binutils-2.46.inc                |   1 +
 .../binutils/binutils/CVE-2026-15003.patch    | 402 ++++++++++++++++++
 2 files changed, 403 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index cab270cea5d..177ae04ee3f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -40,4 +40,5 @@ SRC_URI = "\
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://CVE-2026-4647.patch \
      file://CVE-2026-6846.patch \
+     file://CVE-2026-15003.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
new file mode 100644
index 00000000000..016b342c875
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
@@ -0,0 +1,402 @@
+From 8552afe151ef0513d4afe90f809408509ce77d20 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 9 Apr 2026 09:06:27 +0930
+Subject: [PATCH] PR 34053 buffer overflow in xcoff_link_add_symbols
+
+This patch adds two sanity checks with error reporting in
+xcoff_link_add_symbols before reading symbol aux entries, add extends
+assertions in later functions.  A whole lot of unnecessary casts are
+also tidied.
+
+	PR 34053
+	* xcofflink.c: Remove unnecessary casts throughout.
+	(xcoff_link_add_symbols): Sanity check aux entries are within
+	symbol buffer.
+	(bfd_xcoff_build_dynamic_sections): Assert the above is true.
+	(xcoff_link_input_bfd): Likewise.
+
+(cherry picked from commit 23acf2f003f81b2f8d9d1997ea45d822d33d386c)
+
+CVE: CVE-2026-15003
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=23acf2f003f81b2f8d9d1997ea45d822d33d386c]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/xcofflink.c | 132 +++++++++++++++++++++++-------------------------
+ 1 file changed, 62 insertions(+), 70 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 691acc854ae..cb279b9db9d 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -371,7 +371,7 @@ _bfd_xcoff_canonicalize_dynamic_symtab (bfd *abfd, asymbol **psyms)
+ 	{
+ 	  char *c;
+ 
+-	  c = bfd_alloc (abfd, (bfd_size_type) SYMNMLEN + 1);
++	  c = bfd_alloc (abfd, SYMNMLEN + 1);
+ 	  if (c == NULL)
+ 	    return -1;
+ 	  memcpy (c, ldsym._l._l_name, SYMNMLEN);
+@@ -1038,7 +1038,7 @@ xcoff_link_add_dynamic_symbols (bfd *abfd, struct bfd_link_info *info)
+ 	    {
+ 	      char *dsnm;
+ 
+-	      dsnm = bfd_malloc ((bfd_size_type) strlen (name) + 2);
++	      dsnm = bfd_malloc (strlen (name) + 2);
+ 	      if (dsnm == NULL)
+ 		return false;
+ 	      dsnm[0] = '.';
+@@ -1081,7 +1081,7 @@ xcoff_link_add_dynamic_symbols (bfd *abfd, struct bfd_link_info *info)
+   coff_section_data (abfd, lsec)->contents = NULL;
+ 
+   /* Record this file in the import files.  */
+-  n = bfd_alloc (abfd, (bfd_size_type) sizeof (struct xcoff_import_file));
++  n = bfd_alloc (abfd, sizeof (*n));
+   if (n == NULL)
+     return false;
+   n->next = NULL;
+@@ -1464,7 +1464,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+       bfd_vma value;
+       struct xcoff_link_hash_entry *set_toc;
+ 
+-      bfd_coff_swap_sym_in (abfd, (void *) esym, (void *) &sym);
++      bfd_coff_swap_sym_in (abfd, esym, &sym);
+ 
+       /* In this pass we are only interested in symbols with csect
+ 	 information.  */
+@@ -1510,9 +1510,12 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 	{
+ 	  union internal_auxent auxlin;
+ 
+-	  bfd_coff_swap_aux_in (abfd, (void *) (esym + symesz),
++	  if (symesz >= (size_t) (esym_end - esym))
++	    goto badaux;
++
++	  bfd_coff_swap_aux_in (abfd, esym + symesz,
+ 				sym.n_type, sym.n_sclass,
+-				0, sym.n_numaux, (void *) &auxlin);
++				0, sym.n_numaux, &auxlin);
+ 
+ 	  if (auxlin.x_sym.x_fcnary.x_fcn.x_lnnoptr != 0)
+ 	    {
+@@ -1539,7 +1542,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 
+ 		  linpstart = (reloc_info[enclosing->target_index].linenos
+ 			       + linoff);
+-		  bfd_coff_swap_lineno_in (abfd, (void *) linpstart, (void *) &lin);
++		  bfd_coff_swap_lineno_in (abfd, linpstart, &lin);
+ 		  if (lin.l_lnno == 0
+ 		      && ((bfd_size_type) lin.l_addr.l_symndx
+ 			  == ((esym
+@@ -1554,8 +1557,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 			   linp < linpend;
+ 			   linp += linesz)
+ 			{
+-			  bfd_coff_swap_lineno_in (abfd, (void *) linp,
+-						   (void *) &lin);
++			  bfd_coff_swap_lineno_in (abfd, linp, &lin);
+ 			  if (lin.l_lnno == 0)
+ 			    break;
+ 			}
+@@ -1576,21 +1578,21 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+       visibility = sym.n_type & SYM_V_MASK;
+ 
+       /* Pick up the csect auxiliary information.  */
+-      if (sym.n_numaux == 0)
++      if (sym.n_numaux < 1
++	  || sym.n_numaux * symesz >= (size_t) (esym_end - esym))
+ 	{
++	badaux:
+ 	  _bfd_error_handler
+ 	    /* xgettext:c-format */
+-	    (_("%pB: class %d symbol `%s' has no aux entries"),
++	    (_("%pB: class %d symbol '%s' has missing aux entries"),
+ 	     abfd, sym.n_sclass, name);
+ 	  bfd_set_error (bfd_error_bad_value);
+ 	  goto error_return;
+ 	}
+ 
+-      bfd_coff_swap_aux_in (abfd,
+-			    (void *) (esym + symesz * sym.n_numaux),
++      bfd_coff_swap_aux_in (abfd, esym + symesz * sym.n_numaux,
+ 			    sym.n_type, sym.n_sclass,
+-			    sym.n_numaux - 1, sym.n_numaux,
+-			    (void *) &aux);
++			    sym.n_numaux - 1, sym.n_numaux, &aux);
+ 
+       smtyp = SMTYP_SMTYP (aux.x_csect.x_smtyp);
+ 
+@@ -1713,7 +1715,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 
+ 		  erelsym = ((bfd_byte *) obj_coff_external_syms (abfd)
+ 			     + rel->r_symndx * symesz);
+-		  bfd_coff_swap_sym_in (abfd, (void *) erelsym, (void *) &relsym);
++		  bfd_coff_swap_sym_in (abfd, erelsym, &relsym);
+ 		  if (EXTERN_SYM_P (relsym.n_sclass))
+ 		    {
+ 		      const char *relname;
+@@ -2496,7 +2498,7 @@ xcoff_link_check_ar_symbols (bfd *abfd,
+     {
+       struct internal_syment sym;
+ 
+-      bfd_coff_swap_sym_in (abfd, (void *) esym, (void *) &sym);
++      bfd_coff_swap_sym_in (abfd, esym, &sym);
+       esym += (sym.n_numaux + 1) * symesz;
+ 
+       if (EXTERN_SYM_P (sym.n_sclass) && sym.n_scnum != N_UNDEF)
+@@ -3989,7 +3991,7 @@ bfd_xcoff_size_dynamic_sections (bfd *output_bfd,
+     return true;
+ 
+   xcoff_link_hash_traverse (xcoff_hash_table (info), xcoff_post_gc_symbol,
+-			    (void *) ldinfo);
++			    ldinfo);
+   if (ldinfo->failed)
+     goto error_return;
+ 
+@@ -4200,7 +4202,8 @@ bfd_xcoff_build_dynamic_sections (bfd *output_bfd,
+ 	  /* Read in the csect information, if any.  */
+ 	  if (CSECT_SYM_P (sym.n_sclass))
+ 	    {
+-	      BFD_ASSERT (sym.n_numaux > 0);
++	      BFD_ASSERT (sym.n_numaux > 0
++			  && symesz * sym.n_numaux < (size_t) (esymend - esym));
+ 	      bfd_coff_swap_aux_in (sub, esym + symesz * sym.n_numaux,
+ 				    sym.n_type, sym.n_sclass,
+ 				    sym.n_numaux - 1, sym.n_numaux, &aux);
+@@ -4291,7 +4294,7 @@ bfd_xcoff_link_generate_rtinit (bfd *abfd,
+ {
+   struct bfd_in_memory *bim;
+ 
+-  bim = bfd_malloc ((bfd_size_type) sizeof (* bim));
++  bim = bfd_malloc (sizeof (*bim));
+   if (bim == NULL)
+     return false;
+ 
+@@ -4300,7 +4303,7 @@ bfd_xcoff_link_generate_rtinit (bfd *abfd,
+ 
+   abfd->link.next = 0;
+   abfd->format = bfd_object;
+-  abfd->iostream = (void *) bim;
++  abfd->iostream = bim;
+   abfd->flags = BFD_IN_MEMORY;
+   abfd->iovec = &_bfd_memory_iovec;
+   abfd->direction = write_direction;
+@@ -4860,8 +4863,8 @@ bfd_xcoff_size_stubs (struct bfd_link_info *info)
+ 			}
+ 
+ 		      bfd_coff_swap_sym_in (input_bfd,
+-					    (void *) esyms + irel->r_symndx * symesz,
+-					    (void *) &sym);
++					    esyms + irel->r_symndx * symesz,
++					    &sym);
+ 
+ 		      sym_sec = xcoff_data (input_bfd)->csects[irel->r_symndx];
+ 		      sym_value = sym.n_value - sym_sec->vma;
+@@ -5234,17 +5237,16 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+       int smtyp = 0;
+       int add;
+ 
+-      bfd_coff_swap_sym_in (input_bfd, (void *) esym, (void *) isymp);
++      bfd_coff_swap_sym_in (input_bfd, esym, isymp);
+ 
+       /* Read in the csect information, if any.  */
+       if (CSECT_SYM_P (isymp->n_sclass))
+ 	{
+-	  BFD_ASSERT (isymp->n_numaux > 0);
+-	  bfd_coff_swap_aux_in (input_bfd,
+-				(void *) (esym + isymesz * isymp->n_numaux),
++	  BFD_ASSERT (isymp->n_numaux > 0
++		      && isymesz * isymp->n_numaux < (size_t) (esym_end - esym));
++	  bfd_coff_swap_aux_in (input_bfd, esym + isymesz * isymp->n_numaux,
+ 				isymp->n_type, isymp->n_sclass,
+-				isymp->n_numaux - 1, isymp->n_numaux,
+-				(void *) &aux);
++				isymp->n_numaux - 1, isymp->n_numaux, &aux);
+ 
+ 	  smtyp = SMTYP_SMTYP (aux.x_csect.x_smtyp);
+ 	}
+@@ -5459,12 +5461,10 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+ 		  if ((bfd_size_type) flinfo->last_file_index >= syment_base)
+ 		    {
+ 		      /* The last C_FILE symbol is in this input file.  */
+-		      bfd_coff_swap_sym_out (output_bfd,
+-					     (void *) &flinfo->last_file,
+-					     (void *) (flinfo->outsyms
+-						    + ((flinfo->last_file_index
+-							- syment_base)
+-						       * osymesz)));
++		      bfd_coff_swap_sym_out
++			(output_bfd, &flinfo->last_file,
++			 flinfo->outsyms + (flinfo->last_file_index
++					    - syment_base) * osymesz);
+ 		    }
+ 		  else
+ 		    {
+@@ -5473,9 +5473,8 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+ 			 borrow *outsym temporarily.  */
+ 		      file_ptr pos;
+ 
+-		      bfd_coff_swap_sym_out (output_bfd,
+-					     (void *) &flinfo->last_file,
+-					     (void *) outsym);
++		      bfd_coff_swap_sym_out (output_bfd, &flinfo->last_file,
++					     outsym);
+ 
+ 		      pos = obj_sym_filepos (output_bfd);
+ 		      pos += flinfo->last_file_index * osymesz;
+@@ -5541,7 +5540,7 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+ 	    }
+ 
+ 	  /* Output the symbol.  */
+-	  bfd_coff_swap_sym_out (output_bfd, (void *) &isym, (void *) outsym);
++	  bfd_coff_swap_sym_out (output_bfd, &isym, outsym);
+ 
+ 	  esym += isymesz;
+ 	  outsym += osymesz;
+@@ -5550,9 +5549,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+ 	    {
+ 	      union internal_auxent aux;
+ 
+-	      bfd_coff_swap_aux_in (input_bfd, (void *) esym, isymp->n_type,
+-				    isymp->n_sclass, i, isymp->n_numaux,
+-				    (void *) &aux);
++	      bfd_coff_swap_aux_in (input_bfd, esym,
++				    isymp->n_type, isymp->n_sclass, i,
++				    isymp->n_numaux, &aux);
+ 
+ 	      if (isymp->n_sclass == C_FILE)
+ 		{
+@@ -5780,9 +5779,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+ 		    }
+ 		}
+ 
+-	      bfd_coff_swap_aux_out (output_bfd, (void *) &aux, isymp->n_type,
++	      bfd_coff_swap_aux_out (output_bfd, &aux, isymp->n_type,
+ 				     isymp->n_sclass, i, isymp->n_numaux,
+-				     (void *) outsym);
++				     outsym);
+ 	      outsym += osymesz;
+ 	      esym += isymesz;
+ 	    }
+@@ -5804,10 +5803,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+       && (bfd_size_type) flinfo->last_file_index >= syment_base)
+     {
+       flinfo->last_file.n_value = output_index;
+-      bfd_coff_swap_sym_out (output_bfd, (void *) &flinfo->last_file,
+-			     (void *) (flinfo->outsyms
+-				    + ((flinfo->last_file_index - syment_base)
+-				       * osymesz)));
++      bfd_coff_swap_sym_out (output_bfd, &flinfo->last_file,
++			     flinfo->outsyms + (flinfo->last_file_index
++						- syment_base) * osymesz);
+     }
+ 
+   /* Write the modified symbols to the output file.  */
+@@ -6020,16 +6018,13 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+ 			      void * auxptr;
+ 			      union internal_auxent aux;
+ 
+-			      auxptr = ((void *)
+-					(((bfd_byte *)
+-					  obj_coff_external_syms (input_bfd))
+-					 + ((r_symndx + is->n_numaux)
+-					    * isymesz)));
++			      auxptr = ((bfd_byte *)
++					obj_coff_external_syms (input_bfd)
++					+ (r_symndx + is->n_numaux) * isymesz);
+ 			      bfd_coff_swap_aux_in (input_bfd, auxptr,
+ 						    is->n_type, is->n_sclass,
+ 						    is->n_numaux - 1,
+-						    is->n_numaux,
+-						    (void *) &aux);
++						    is->n_numaux, &aux);
+ 			      if (SMTYP_SMTYP (aux.x_csect.x_smtyp) == XTY_SD
+ 				  && aux.x_csect.x_smclas == XMC_TC0)
+ 				indx = flinfo->toc_symindx;
+@@ -6548,12 +6543,12 @@ xcoff_write_global_symbol (struct bfd_hash_entry *bh, void * inf)
+ 	  irsym.n_type = T_NULL;
+ 	  irsym.n_numaux = 1;
+ 
+-	  bfd_coff_swap_sym_out (output_bfd, (void *) &irsym, (void *) outsym);
++	  bfd_coff_swap_sym_out (output_bfd, &irsym, outsym);
+ 	  outsym += bfd_coff_symesz (output_bfd);
+ 
+ 	  /* Note : iraux is initialized above.  */
+-	  bfd_coff_swap_aux_out (output_bfd, (void *) &iraux, T_NULL, C_HIDEXT,
+-				 0, 1, (void *) outsym);
++	  bfd_coff_swap_aux_out (output_bfd, &iraux, T_NULL, C_HIDEXT,
++				 0, 1, outsym);
+ 	  outsym += bfd_coff_auxesz (output_bfd);
+ 
+ 	  if (h->indx >= 0)
+@@ -6791,12 +6786,11 @@ xcoff_write_global_symbol (struct bfd_hash_entry *bh, void * inf)
+   isym.n_type = T_NULL;
+   isym.n_numaux = 1;
+ 
+-  bfd_coff_swap_sym_out (output_bfd, (void *) &isym, (void *) outsym);
++  bfd_coff_swap_sym_out (output_bfd, &isym, outsym);
+   outsym += bfd_coff_symesz (output_bfd);
+ 
+   aux.x_csect.x_smclas = h->smclas;
+-  bfd_coff_swap_aux_out (output_bfd, (void *) &aux, T_NULL, isym.n_sclass, 0, 1,
+-			 (void *) outsym);
++  bfd_coff_swap_aux_out (output_bfd, &aux, T_NULL, isym.n_sclass, 0, 1, outsym);
+   outsym += bfd_coff_auxesz (output_bfd);
+ 
+   if ((h->root.type == bfd_link_hash_defined
+@@ -6811,13 +6805,12 @@ xcoff_write_global_symbol (struct bfd_hash_entry *bh, void * inf)
+ 	isym.n_sclass = C_WEAKEXT;
+       else
+ 	isym.n_sclass = C_EXT;
+-      bfd_coff_swap_sym_out (output_bfd, (void *) &isym, (void *) outsym);
++      bfd_coff_swap_sym_out (output_bfd, &isym, outsym);
+       outsym += bfd_coff_symesz (output_bfd);
+ 
+       aux.x_csect.x_smtyp = XTY_LD;
+       aux.x_csect.x_scnlen.u64 = obj_raw_syment_count (output_bfd);
+-      bfd_coff_swap_aux_out (output_bfd, (void *) &aux, T_NULL, C_EXT, 0, 1,
+-			     (void *) outsym);
++      bfd_coff_swap_aux_out (output_bfd, &aux, T_NULL, C_EXT, 0, 1, outsym);
+       outsym += bfd_coff_auxesz (output_bfd);
+     }
+ 
+@@ -6913,8 +6906,8 @@ xcoff_reloc_link_order (bfd *output_bfd,
+ 	     howto->name, addend, NULL, NULL, (bfd_vma) 0);
+ 	  break;
+ 	}
+-      ok = bfd_set_section_contents (output_bfd, output_section, (void *) buf,
+-				     (file_ptr) link_order->offset, size);
++      ok = bfd_set_section_contents (output_bfd, output_section, buf,
++				     link_order->offset, size);
+       free (buf);
+       if (! ok)
+ 	return false;
+@@ -7379,8 +7372,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_link_info *info)
+   if (flinfo.last_file_index != -1)
+     {
+       flinfo.last_file.n_value = -(bfd_vma) 1;
+-      bfd_coff_swap_sym_out (abfd, (void *) &flinfo.last_file,
+-			     (void *) flinfo.outsyms);
++      bfd_coff_swap_sym_out (abfd, &flinfo.last_file, flinfo.outsyms);
+       pos = obj_sym_filepos (abfd) + flinfo.last_file_index * symesz;
+       if (bfd_seek (abfd, pos, SEEK_SET) != 0
+ 	  || bfd_write (flinfo.outsyms, symesz, abfd) != symesz)
+@@ -7464,7 +7456,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_link_info *info)
+ 	 appear in the symbol table, which is not necessarily by
+ 	 address.  So we sort them here.  There may be a better way to
+ 	 do this.  */
+-      qsort ((void *) flinfo.section_info[o->target_index].relocs,
++      qsort (flinfo.section_info[o->target_index].relocs,
+ 	     o->reloc_count, sizeof (struct internal_reloc),
+ 	     xcoff_sort_relocs);
+ 
+@@ -7472,7 +7464,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_link_info *info)
+       irelend = irel + o->reloc_count;
+       erel = external_relocs;
+       for (; irel < irelend; irel++, rel_hash++, erel += relsz)
+-	bfd_coff_swap_reloc_out (abfd, (void *) irel, (void *) erel);
++	bfd_coff_swap_reloc_out (abfd, irel, erel);
+ 
+       rel_size = relsz * o->reloc_count;
+       if (bfd_seek (abfd, o->rel_filepos, SEEK_SET) != 0

