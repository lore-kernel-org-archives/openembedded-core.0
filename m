Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986D0C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18281.1787652437992656828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MCCD/4kZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so3180324f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652436; x=1788257236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ygFD0dtLycSLXx5aJAPetaaQ9RdjHBSdb9ouPzVcTZc=;
        b=MCCD/4kZnjQS+p27I7fwM7GYTjanv1Dqe2iKIyPTZb0fEPQptnGt5j6cdmUjJdZSsX
         eCerG5cYLFl0smRv+yqTUgQ7rSBBfSKNGxOlhdZLPLl7Dp8wRJ2y8I3t61VAjCUCU3tn
         PJBk1xV9GL0BiNxZZLFpg6FmZRJWNrg1QO+HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652436; x=1788257236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ygFD0dtLycSLXx5aJAPetaaQ9RdjHBSdb9ouPzVcTZc=;
        b=o7ZPrgD/tqdeimTXcKkHBKIvqYglOZCJoP/JWiSPqGBfjcFG6UcdPvxZFnFY8A6PBp
         C8c5zV7dDN89JxafojF15jp/+spUGVoyI2MmCJ3caqyPs3oiDAJ5VpkGq51l+ptBMBOs
         uSmCBl7cowMEZGYMuphZcNBFlvdHCHzil0aZGFUkYyh9zvl5nHIvyGT9vrNjd9xdqXIL
         /ugSLHY2fjYEZoredlXg0mpEvUT6+tE9ETutuMhREaGRj+Ix9WzNm2BNyl5HTO+hTU3O
         4YtnoCk1GVJfF9tlTTlwa/WoPddxIrgVJnvtnF2reT/6JCk1gK1hBSkww/hp40zYp1CN
         Xu4g==
X-Gm-Message-State: AFuF++nEgBSjKVCiX9y82M6NEsq2DyL8dKwzDXT+RDpwrZJLViEE8Dlf
	g3O5asmURKyt7GjpPGqElENxh3HSC89ZcEGlkpf48jsRygShQs7B6VNNS2tsLRut9/iXA7JJHVZ
	Uihot7CE=
X-Gm-Gg: AR+sD13Aue2KICQDiJ4L5C1dJdqLa+oDqGxQVONkS5vKk29KQs2VTqm80ke7KH+MyM0
	mwv54Hk7J0ZMgvYTsfyMRmCLxaNBbd3HS4QD5DjF+48Q2aVbv0J9BYyEwMcK71ZI0+p3OfouoOB
	3UAt8CMtG43R223cPIba78rD5Vfrpn+FGW1/JvDoM51llPD1tROv4miggYRZgowS6d0Bdes7ta/
	UNvD1B3WSHabe482w0LmgcPZkBcV4Fslwxb587l1PMuTWTypUuWfN7G9l6E8fDbKMoqlYqi4K3F
	816LB0VFoLAABUqlUjcGJXtAtZztneL76I5Sc5HIAO1D1B9cLds5RvoC1vpw/Y5nD6pzQhnW6Zu
	hRon4BNSDYKiUPeJPcEegxjeKIAkUyPf+FMgi+WVmA9Jd5XK2SLi09ie14RzrHe31Hu1g0LTH/X
	dgOadZR9phmnWVJuaroJegR81NX5PkkIZ657+cx9PrMl9ioBgx6l/z328A8vC/299GnNY5Tfy8e
	7ZEGN2HEuGkkApZiL7Mx0o1Jn7PV1mdwGRjAxdkR3Pa7Hq3PMMjEWwmLBcsFFSXP8Pg96c=
X-Received: by 2002:a05:6000:4909:b0:482:552f:ef68 with SMTP id ffacd0b85a97d-482d9f272b8mr7286332f8f.19.1787652436107;
        Tue, 25 Aug 2026 03:07:16 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] binutils: fix CVE-2026-15003
Date: Tue, 25 Aug 2026 12:06:42 +0200
Message-ID: <b4675cb889edb4de1f53d9c6c883d0d5d622e49b.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244218

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-15003
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=23acf2f003f81b2f8d9d1997ea45d822d33d386c

Test results:
  binutils-cross-testsuite 2.42 (x86_64-oe-linux):

  Before:
  binutils: 302 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unresolved, 20 untested, 99 unsupported

  After:
  binutils: 304 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unresolved, 20 untested, 99 unsupported

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=23acf2f003f81b2f8d9d1997ea45d822d33d386c]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2026-15003.patch    | 400 ++++++++++++++++++
 2 files changed, 401 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 5534ce577f9..447529ffa95 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -80,5 +80,6 @@ SRC_URI = "\
      file://CVE-2025-69645.patch \
      file://CVE-2025-1147.patch \
      file://CVE-2025-8224.patch \
+     file://CVE-2026-15003.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
new file mode 100644
index 00000000000..2f5c42e1b93
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
@@ -0,0 +1,400 @@
+From 23acf2f003f81b2f8d9d1997ea45d822d33d386c Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-15003
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=23acf2f003f81b2f8d9d1997ea45d822d33d386c]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/xcofflink.c | 132 +++++++++++++++++++++++-------------------------
+ 1 file changed, 62 insertions(+), 70 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 7f1c0df760f..cf3b33e7202 100644
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
+@@ -1477,7 +1477,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+       bfd_vma value;
+       struct xcoff_link_hash_entry *set_toc;
+ 
+-      bfd_coff_swap_sym_in (abfd, (void *) esym, (void *) &sym);
++      bfd_coff_swap_sym_in (abfd, esym, &sym);
+ 
+       /* In this pass we are only interested in symbols with csect
+ 	 information.  */
+@@ -1523,9 +1523,12 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
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
+@@ -1552,7 +1555,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 
+ 		  linpstart = (reloc_info[enclosing->target_index].linenos
+ 			       + linoff);
+-		  bfd_coff_swap_lineno_in (abfd, (void *) linpstart, (void *) &lin);
++		  bfd_coff_swap_lineno_in (abfd, linpstart, &lin);
+ 		  if (lin.l_lnno == 0
+ 		      && ((bfd_size_type) lin.l_addr.l_symndx
+ 			  == ((esym
+@@ -1567,8 +1570,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 			   linp < linpend;
+ 			   linp += linesz)
+ 			{
+-			  bfd_coff_swap_lineno_in (abfd, (void *) linp,
+-						   (void *) &lin);
++			  bfd_coff_swap_lineno_in (abfd, linp, &lin);
+ 			  if (lin.l_lnno == 0)
+ 			    break;
+ 			}
+@@ -1589,21 +1591,21 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
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
+@@ -1726,7 +1728,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 
+ 		  erelsym = ((bfd_byte *) obj_coff_external_syms (abfd)
+ 			     + rel->r_symndx * symesz);
+-		  bfd_coff_swap_sym_in (abfd, (void *) erelsym, (void *) &relsym);
++		  bfd_coff_swap_sym_in (abfd, erelsym, &relsym);
+ 		  if (EXTERN_SYM_P (relsym.n_sclass))
+ 		    {
+ 		      const char *relname;
+@@ -2507,7 +2509,7 @@ xcoff_link_check_ar_symbols (bfd *abfd,
+     {
+       struct internal_syment sym;
+ 
+-      bfd_coff_swap_sym_in (abfd, (void *) esym, (void *) &sym);
++      bfd_coff_swap_sym_in (abfd, esym, &sym);
+       esym += (sym.n_numaux + 1) * symesz;
+ 
+       if (EXTERN_SYM_P (sym.n_sclass) && sym.n_scnum != N_UNDEF)
+@@ -4005,7 +4007,7 @@ bfd_xcoff_size_dynamic_sections (bfd *output_bfd,
+     return true;
+ 
+   xcoff_link_hash_traverse (xcoff_hash_table (info), xcoff_post_gc_symbol,
+-			    (void *) ldinfo);
++			    ldinfo);
+   if (ldinfo->failed)
+     goto error_return;
+ 
+@@ -4216,7 +4218,8 @@ bfd_xcoff_build_dynamic_sections (bfd *output_bfd,
+ 	  /* Read in the csect information, if any.  */
+ 	  if (CSECT_SYM_P (sym.n_sclass))
+ 	    {
+-	      BFD_ASSERT (sym.n_numaux > 0);
++	      BFD_ASSERT (sym.n_numaux > 0
++			  && symesz * sym.n_numaux < (size_t) (esymend - esym));
+ 	      bfd_coff_swap_aux_in (sub, esym + symesz * sym.n_numaux,
+ 				    sym.n_type, sym.n_sclass,
+ 				    sym.n_numaux - 1, sym.n_numaux, &aux);
+@@ -4307,7 +4310,7 @@ bfd_xcoff_link_generate_rtinit (bfd *abfd,
+ {
+   struct bfd_in_memory *bim;
+ 
+-  bim = bfd_malloc ((bfd_size_type) sizeof (* bim));
++  bim = bfd_malloc (sizeof (*bim));
+   if (bim == NULL)
+     return false;
+ 
+@@ -4316,7 +4319,7 @@ bfd_xcoff_link_generate_rtinit (bfd *abfd,
+ 
+   abfd->link.next = 0;
+   abfd->format = bfd_object;
+-  abfd->iostream = (void *) bim;
++  abfd->iostream = bim;
+   abfd->flags = BFD_IN_MEMORY;
+   abfd->iovec = &_bfd_memory_iovec;
+   abfd->direction = write_direction;
+@@ -4876,8 +4879,8 @@ bfd_xcoff_size_stubs (struct bfd_link_info *info)
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
+@@ -5250,17 +5253,16 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
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
+@@ -5475,12 +5477,10 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
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
+@@ -5489,9 +5489,8 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
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
+@@ -5557,7 +5556,7 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
+ 	    }
+ 
+ 	  /* Output the symbol.  */
+-	  bfd_coff_swap_sym_out (output_bfd, (void *) &isym, (void *) outsym);
++	  bfd_coff_swap_sym_out (output_bfd, &isym, outsym);
+ 
+ 	  esym += isymesz;
+ 	  outsym += osymesz;
+@@ -5566,9 +5565,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
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
+@@ -5796,9 +5795,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
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
+@@ -5820,10 +5819,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
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
+@@ -6036,16 +6034,13 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *flinfo,
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
+@@ -6564,12 +6559,12 @@ xcoff_write_global_symbol (struct bfd_hash_entry *bh, void * inf)
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
+@@ -6807,12 +6802,11 @@ xcoff_write_global_symbol (struct bfd_hash_entry *bh, void * inf)
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
+@@ -6827,13 +6821,12 @@ xcoff_write_global_symbol (struct bfd_hash_entry *bh, void * inf)
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
+@@ -6929,8 +6922,8 @@ xcoff_reloc_link_order (bfd *output_bfd,
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
+@@ -7395,8 +7388,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_link_info *info)
+   if (flinfo.last_file_index != -1)
+     {
+       flinfo.last_file.n_value = -(bfd_vma) 1;
+-      bfd_coff_swap_sym_out (abfd, (void *) &flinfo.last_file,
+-			     (void *) flinfo.outsyms);
++      bfd_coff_swap_sym_out (abfd, &flinfo.last_file, flinfo.outsyms);
+       pos = obj_sym_filepos (abfd) + flinfo.last_file_index * symesz;
+       if (bfd_seek (abfd, pos, SEEK_SET) != 0
+ 	  || bfd_write (flinfo.outsyms, symesz, abfd) != symesz)
+@@ -7480,7 +7472,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_link_info *info)
+ 	 appear in the symbol table, which is not necessarily by
+ 	 address.  So we sort them here.  There may be a better way to
+ 	 do this.  */
+-      qsort ((void *) flinfo.section_info[o->target_index].relocs,
++      qsort (flinfo.section_info[o->target_index].relocs,
+ 	     o->reloc_count, sizeof (struct internal_reloc),
+ 	     xcoff_sort_relocs);
+ 
+@@ -7488,7 +7480,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_link_info *info)
+       irelend = irel + o->reloc_count;
+       erel = external_relocs;
+       for (; irel < irelend; irel++, rel_hash++, erel += relsz)
+-	bfd_coff_swap_reloc_out (abfd, (void *) irel, (void *) erel);
++	bfd_coff_swap_reloc_out (abfd, irel, erel);
+ 
+       rel_size = relsz * o->reloc_count;
+       if (bfd_seek (abfd, o->rel_filepos, SEEK_SET) != 0

