Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF35CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 21:09:23 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30634.1780520956733522644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 14:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BqhGSccW;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45efa80e0afso3915089f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780520955; x=1781125755; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB7+JDre6KTIco9GMMC2Anb7LQieHnn0bspdJdjnxgw=;
        b=BqhGSccWNVYe4Dctqh4nmkRaPlcqAmMy+5q8XT/BTi6BkvNCLwosOAjS9RV+7dHVjL
         E7hutIJMcCAIa576d1ku7ARR49LV3zu86CMoSZCqCrnaBsH62p90fi4kxYKAywogt2YR
         qBGoVo+5HdwW+P/c2Kym/gz6ANt8lSkwJEPrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780520955; x=1781125755;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JB7+JDre6KTIco9GMMC2Anb7LQieHnn0bspdJdjnxgw=;
        b=Gjpuozkw6H9M8/fe/grY1RrFw9dtBvHKRCKvvSmxBkjxnvPlfhp4E3REbx2ZxabuWd
         lzD6SfwZoZghi2ZztPHDqJZvpYrynJHOCKDft9Zg4QayXwhATMOx3V/dFy5SbjXKys3X
         hIc+j2Zfn8Ff3Ba/bgI+SHLiwin9pPhr5oeeFmJIzoPi5ew79zUpdoGxDR9dGQJRzC6t
         E57FaKHz+YfNNAS3HY+e2fuvVRtVBEiPPV2tOvFeQOAAR8fPPxhtyTwxfj6InA5EeEQw
         oMhr5hpquZ4M89bSJkxMWh4jbPmAm9mPqj8n6a/RNfLtSBqHsLJEvP0QdhFGiX8/D7Go
         /bbA==
X-Forwarded-Encrypted: i=1; AFNElJ9aLqWbiaDzbxBtUdy9xj1YF/CEE4HmKSoBcnC6qT4Dmc6xyhDNtfESnm13mrS3VOEFlvMq4pMtQia6YisYawSOTA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2GNk3e7NqYAkn+EQALev6fevVo2m6gbFcf1lOCSa6fuwxdRcZ
	l+WTmzUNKYMJ0Cqff628ysWZvikknwvMxkhKeqlBAXAR3pfkuugdTcB4YSULjqYlym30PrzQ4Ah
	7ZbBF
X-Gm-Gg: Acq92OFNiFYLpCva5Vz9QZ/+nfQwSRQVyZnBvNP/Qod2qlm9b6mbkddyKbVkqdiyPJZ
	U7pFO8EEfCKmG1sf4eVspfVVLK1y2wqlHY4b0lPOFqL7xRd7xbOV/itlkoLD7V0mLfrE4J3DWsX
	epHqyJb386SBsHwtq3U/qfNoyNgSzVFLZ1aCiN7T25U5JaQzV0M3/BhMHJtL7runjtwNZwdmTgC
	tfrkRr1YudnMJUvexNH3ucyD5sa+O1mawHF9YOKz4ah1Za+xmiAfefsXX3dol0IIo3n4EINNKTo
	SKZUVna6g+6lHz6+GF4yRIRHc+vINRBlCDCdO5Zfem0jDmSw5MZ8Su8EC7XDoyMsVFCYd2dH+e/
	mtm2GRP5swF6WrUhUH7GRjWm9YAlljpSHCN1M7ue5wHTY0pgVvtIcO5NuEJwi/dFqNN4lPPKmvz
	7rLQ/rl4R0C3E3p6JXRDJkGY9BPBqDnH4XaETPPyUvPGx9OZYe46r3F3tJxZ2tQTArMClolDQe4
	cqqsDKPn5AvvAyQ3GGvQQ4YrQ==
X-Received: by 2002:a05:6000:652:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-46021726637mr5885631f8f.22.1780520954921;
        Wed, 03 Jun 2026 14:09:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm10620959f8f.0.2026.06.03.14.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:09:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 23:09:14 +0200
Message-Id: <DIZQ028FNO2G.2274D51E2O012@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 2/2] binutils: fix CVE-2026-4647
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
 <20260513172734.3995341-1-sudumbha@cisco.com>
 <20260513172734.3995341-2-sudumbha@cisco.com>
In-Reply-To: <20260513172734.3995341-2-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 21:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238111

On Wed May 13, 2026 at 7:27 PM CEST, Sudhir Dumbhare -X (sudumbha - E INFOC=
HIPS PRIVATE LIMITED at Cisco) wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1], which addresses an out-of-bounds
> read issue in XCOFF relocation processing, as described in [2].
>
> [1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D9e99db=
c1f19ffaf18d0250788951706066ebe7f2
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D33919
>
> Reference:
> https://bugzilla.suse.com/show_bug.cgi?id=3D1260338
> https://www.suse.com/security/cve/CVE-2026-4647.html
> https://nvd.nist.gov/vuln/detail/CVE-2026-4647
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---

Hello,

Same as 1/2, this look like it's needed on master/wrynose. Can you send
the fix there and ping back here?

Thanks!

> Changes v1 -> v2:
> - fixed tab issue around context lines
>
>  .../binutils/binutils-2.42.inc                |   1 +
>  .../binutils/binutils/CVE-2026-4647.patch     | 228 ++++++++++++++++++
>  2 files changed, 229 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647=
.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 1a91792b13..3296573baf 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -75,5 +75,6 @@ SRC_URI =3D "\
>       file://CVE-2025-69647.patch \
>       file://CVE-2025-69648.patch \
>       file://CVE-2026-3441_CVE-2026-3442.patch \
> +     file://CVE-2026-4647.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch =
b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
> new file mode 100644
> index 0000000000..564c435692
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
> @@ -0,0 +1,228 @@
> +From a0df757a2ad6728da209fa7fcc9f3a598183999b Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Fri, 13 Mar 2026 17:28:28 +1030
> +Subject: [PATCH] PR33919 Out-of-bounds read in XCOFF relocation processi=
ng
> +
> +	PR 33919
> +	* coff-rs6000.c (xcoff_calculate_relocation): Don't use explicit
> +	array size.
> +	(xcoff_complain_overflow): Likewise.
> +	(xcoff_rtype2howto): Return a NULL howto rather than aborting.
> +	(_bfd_xcoff_reloc_name_lookup): Use ARRAY_SIZE.
> +	(xcoff_ppc_relocate_section): Sanity check reloc r_type before
> +	accessing xcoff_howto_table.  Print r_type using %#x.  Remove
> +	now redundant later reloc r_type sanity check.
> +	* coff64-rs6000.c: Similarly.
> +	* libxcoff.h (XCOFF_MAX_CALCULATE_RELOCATION): Don't define.
> +	(XCOFF_MAX_COMPLAIN_OVERFLOW): Don't define.
> +
> +CVE: CVE-2026-4647
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3D9e99dbc1f19ffaf18d0250788951706066ebe7f2]
> +
> +(cherry picked from commit 9e99dbc1f19ffaf18d0250788951706066ebe7f2)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + bfd/coff-rs6000.c   | 36 +++++++++++++++++++++---------------
> + bfd/coff64-rs6000.c | 33 ++++++++++++++++++++-------------
> + bfd/libxcoff.h      |  3 ---
> + 3 files changed, 41 insertions(+), 31 deletions(-)
> +
> +diff --git a/bfd/coff-rs6000.c b/bfd/coff-rs6000.c
> +index 87feb672bf1..0f2cc496b63 100644
> +--- a/bfd/coff-rs6000.c
> ++++ b/bfd/coff-rs6000.c
> +@@ -155,8 +155,7 @@ static xcoff_complain_function xcoff_complain_overfl=
ow_bitfield_func;
> + static xcoff_complain_function xcoff_complain_overflow_signed_func;
> + static xcoff_complain_function xcoff_complain_overflow_unsigned_func;
> +=20
> +-xcoff_reloc_function *const
> +-xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =3D
> ++xcoff_reloc_function *const xcoff_calculate_relocation[] =3D
> + {
> +   xcoff_reloc_type_pos,  /* R_POS   (0x00) */
> +   xcoff_reloc_type_neg,  /* R_NEG   (0x01) */
> +@@ -210,8 +209,7 @@ xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOC=
ATION] =3D
> +   xcoff_reloc_type_toc,  /* R_TOCL    (0x31) */
> + };
> +=20
> +-xcoff_complain_function *const
> +-xcoff_complain_overflow[XCOFF_MAX_COMPLAIN_OVERFLOW] =3D
> ++xcoff_complain_function *const xcoff_complain_overflow[] =3D
> + {
> +   xcoff_complain_overflow_dont_func,
> +   xcoff_complain_overflow_bitfield_func,
> +@@ -1158,8 +1156,11 @@ reloc_howto_type xcoff_howto_table[] =3D
> + void
> + xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
> + {
> +-  if (internal->r_type > R_TOCL)
> +-    abort ();
> ++  if (internal->r_type >=3D ARRAY_SIZE (xcoff_howto_table))
> ++    {
> ++      relent->howto =3D NULL;
> ++      return;
> ++    }
> +=20
> +   /* Default howto layout works most of the time */
> +   relent->howto =3D &xcoff_howto_table[internal->r_type];
> +@@ -1183,7 +1184,7 @@ xcoff_rtype2howto (arelent *relent, struct interna=
l_reloc *internal)
> +   if (relent->howto->dst_mask !=3D 0
> +       && (relent->howto->bitsize
> + 	  !=3D ((unsigned int) internal->r_size & 0x1f) + 1))
> +-    abort ();
> ++    relent->howto =3D NULL;
> + }
> +=20
> + reloc_howto_type *
> +@@ -1236,9 +1237,7 @@ _bfd_xcoff_reloc_name_lookup (bfd *abfd ATTRIBUTE_=
UNUSED,
> + {
> +   unsigned int i;
> +=20
> +-  for (i =3D 0;
> +-       i < sizeof (xcoff_howto_table) / sizeof (xcoff_howto_table[0]);
> +-       i++)
> ++  for (i =3D 0; i < ARRAY_SIZE (xcoff_howto_table); i++)
> +     if (xcoff_howto_table[i].name !=3D NULL
> + 	&& strcasecmp (xcoff_howto_table[i].name, r_name) =3D=3D 0)
> +       return &xcoff_howto_table[i];
> +@@ -3776,6 +3775,14 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
> + 	 the csect including the symbol which it references.  */
> +       if (rel->r_type =3D=3D R_REF)
> + 	continue;
> ++      if (rel->r_type >=3D ARRAY_SIZE (xcoff_howto_table))
> ++	{
> ++	  /* xgettext:c-format */
> ++	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
> ++			      input_bfd, rel->r_type);
> ++	  bfd_set_error (bfd_error_bad_value);
> ++	  return false;
> ++	}
> +=20
> +       /* Retrieve default value in HOWTO table and fix up according
> + 	 to r_size field, if it can be different.
> +@@ -3795,7 +3802,7 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
> +=20
> + 	    default:
> + 	      _bfd_error_handler
> +-		(_("%pB: relocation (%d) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"=
),
> ++		(_("%pB: relocation (%#x) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n=
"),
> + 		 input_bfd, rel->r_type, (uint64_t) rel->r_vaddr, rel->r_size);
> + 	      return false;
> + 	    }
> +@@ -3871,10 +3878,9 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
> + 	    }
> + 	}
> +=20
> +-      if (rel->r_type >=3D XCOFF_MAX_CALCULATE_RELOCATION
> +-	  || !((*xcoff_calculate_relocation[rel->r_type])
> +-	       (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
> +-		addend, &relocation, contents, info)))
> ++      if (!((*xcoff_calculate_relocation[rel->r_type])
> ++	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
> ++	     addend, &relocation, contents, info)))
> + 	return false;
> +=20
> +       /* address */
> +diff --git a/bfd/coff64-rs6000.c b/bfd/coff64-rs6000.c
> +index 0f8d9e08783..c74698070d5 100644
> +--- a/bfd/coff64-rs6000.c
> ++++ b/bfd/coff64-rs6000.c
> +@@ -177,8 +177,7 @@ static bool xcoff64_bad_format_hook
> + /* Relocation functions */
> + static xcoff_reloc_function xcoff64_reloc_type_br;
> +=20
> +-xcoff_reloc_function *const
> +-xcoff64_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =3D
> ++xcoff_reloc_function *const xcoff64_calculate_relocation[] =3D
> + {
> +   xcoff_reloc_type_pos,  /* R_POS     (0x00) */
> +   xcoff_reloc_type_neg,  /* R_NEG     (0x01) */
> +@@ -1439,8 +1438,11 @@ reloc_howto_type xcoff64_howto_table[] =3D
> + void
> + xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
> + {
> +-  if (internal->r_type > R_TOCL)
> +-    abort ();
> ++  if (internal->r_type >=3D ARRAY_SIZE (xcoff64_howto_table))
> ++    {
> ++      relent->howto =3D NULL;
> ++      return;
> ++    }
> +=20
> +   /* Default howto layout works most of the time */
> +   relent->howto =3D &xcoff64_howto_table[internal->r_type];
> +@@ -1473,7 +1475,7 @@ xcoff64_rtype2howto (arelent *relent, struct inter=
nal_reloc *internal)
> +   if (relent->howto->dst_mask !=3D 0
> +       && (relent->howto->bitsize
> + 	  !=3D ((unsigned int) internal->r_size & 0x3f) + 1))
> +-    abort ();
> ++    relent->howto =3D NULL;
> + }
> +=20
> + reloc_howto_type *
> +@@ -1528,9 +1530,7 @@ xcoff64_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNU=
SED,
> + {
> +   unsigned int i;
> +=20
> +-  for (i =3D 0;
> +-       i < sizeof (xcoff64_howto_table) / sizeof (xcoff64_howto_table[0=
]);
> +-       i++)
> ++  for (i =3D 0; i < ARRAY_SIZE (xcoff64_howto_table); i++)
> +     if (xcoff64_howto_table[i].name !=3D NULL
> + 	&& strcasecmp (xcoff64_howto_table[i].name, r_name) =3D=3D 0)
> +       return &xcoff64_howto_table[i];
> +@@ -1574,6 +1574,14 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
> + 	 the csect including the symbol which it references.  */
> +       if (rel->r_type =3D=3D R_REF)
> + 	continue;
> ++      if (rel->r_type >=3D ARRAY_SIZE (xcoff64_howto_table))
> ++	{
> ++	  /* xgettext:c-format */
> ++	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
> ++			      input_bfd, rel->r_type);
> ++	  bfd_set_error (bfd_error_bad_value);
> ++	  return false;
> ++	}
> +=20
> +       /* Retrieve default value in HOWTO table and fix up according
> + 	 to r_size field, if it can be different.
> +@@ -1595,7 +1603,7 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
> +=20
> + 	    default:
> + 	      _bfd_error_handler
> +-		(_("%pB: relocation (%d) at (0x%" PRIx64 ") has wrong"
> ++		(_("%pB: relocation (%#x) at (0x%" PRIx64 ") has wrong"
> + 		   " r_rsize (0x%x)\n"),
> + 		 input_bfd, rel->r_type, rel->r_vaddr, rel->r_size);
> + 	      return false;
> +@@ -1668,10 +1676,9 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
> + 	    }
> + 	}
> +=20
> +-      if (rel->r_type >=3D XCOFF_MAX_CALCULATE_RELOCATION
> +-	  || !((*xcoff64_calculate_relocation[rel->r_type])
> +-	      (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
> +-	       addend, &relocation, contents, info)))
> ++      if (!((*xcoff64_calculate_relocation[rel->r_type])
> ++	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
> ++	     addend, &relocation, contents, info)))
> + 	return false;
> +=20
> +       /* address */
> +diff --git a/bfd/libxcoff.h b/bfd/libxcoff.h
> +index 81c4e205e06..ca716a9ef3a 100644
> +--- a/bfd/libxcoff.h
> ++++ b/bfd/libxcoff.h
> +@@ -215,9 +215,6 @@ struct xcoff_backend_data_rec
> + #define bfd_xcoff_text_align_power(a) ((xcoff_data (a)->text_align_powe=
r))
> + #define bfd_xcoff_data_align_power(a) ((xcoff_data (a)->data_align_powe=
r))
> +=20
> +-/* xcoff*_ppc_relocate_section macros  */
> +-#define XCOFF_MAX_CALCULATE_RELOCATION (0x32)
> +-#define XCOFF_MAX_COMPLAIN_OVERFLOW (4)
> + /* N_ONES produces N one bits, without overflowing machine arithmetic. =
 */
> + #ifdef N_ONES
> + #undef N_ONES
> +--=20
> +2.35.6
> +


--=20
Yoann Congal
Smile ECS


