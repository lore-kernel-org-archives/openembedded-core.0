Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98726CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 08:44:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.149735.1781599435098245912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 01:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yMrs5u+E;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cdae130cso20743295e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 01:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781599433; x=1782204233; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNyr/xJB6NOqT4Ts9/V2mTMW/v6pSDInJ3aED3932vE=;
        b=yMrs5u+EFKFORAyHJokJcYG/Pl9wTFSr2ba7HqNy6DDZIJUxX9J4oDodwncysRgu4V
         NIhdNNIfHiSvbOQ3ujW5Q2vOYybUjynX6ZJcvNon/bavFioAK4U6h4tDLmb1oI5SL7nz
         1xll4gifR0st6P7dk7IKRVow1BYWoCxcekB+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599433; x=1782204233;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rNyr/xJB6NOqT4Ts9/V2mTMW/v6pSDInJ3aED3932vE=;
        b=qHfNnj6hS87ngVzm5uYB8edtqMEES1/z2qEBtBOQsjBI7etuBhPM8a3A7nrZfip7/x
         7kFUK886IkPEEFSdHgDVIcAIU4qno0AiDHLyHJZxb7smf/Pc/Ig5aKYyf2LoQeI04lqh
         LRYTMtmcdgya1hBngaGj5g6eUdSYGeW0Bo7+f2D0Zlkv9OHpRL4NZvwy/i6JUpQnMsNw
         VsfZwCU5MbFgK5/scuMeBjLSBX4P/MkcSTOzwohdp03MwWEgVNRLdopK7p3kigPJLqFr
         dOjeM6X86p1e+NFnnTt57D1sU5P32dDi0tFjdoIiGMTfqNznTxZMz4AT99SIabLcs+YO
         /Yhw==
X-Forwarded-Encrypted: i=1; AFNElJ+BR4mi1loYVM7V9WwHp4e0RoVRWUO3wWvrdlmXTt7tPE+BhLE9TsJro+ijCYVLybASnJQmysrSKsCbQt8/bd/h7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxZRZzpCfJikt7Z9Rmqb3IDywIvuBMDk9UP5nJOxDDhnekcf+p
	NFKK7VViwb6OnhoZb+Ht3Uc5zEOcBKtfVPEzMi4cq/jzI79mHQAwgjyRDZ3gsBr/w/hf1nrl2dz
	W/6Zz
X-Gm-Gg: Acq92OF8giKWTehh2f0eCsLvDZDDEcYHHRDbPmJ7VOk2hfgu7EXxV/TfMz5942UcyfA
	FVx972ItLPkznk69YXlIt7N9ve/TRFbxlkzMpxTPzZZb3PxG5t0XupmyLXwYhi2A8tg2AXxwN56
	2crGwXMLTOaaWHunnGCufrKHiXQGNXxYKtsYQHnOkcVSkjQ1jSwtFiu8mFqdQonSYSq0aiIjBWG
	OX8Z3QuJxI4zN1G/2xlwj7h6cf6CYpl7cU4TQz/W65RiaFWPE+kbi0ZQE0CfyMdtxDwoKftHxHZ
	3oJW9XPMerUvTrS2XZjJvoeEFfckZXWYscrmN9NJKU3/GqnEqLQYcK6paA8KWlvWerqQ4AyCK5+
	U7k0Fd0X5zkTq/AZaODBWjzw6CvSpoh+bphYVpH1u0PGoboNMQDIUjFE2E7zG9qpA8Qvtw3Q+ZJ
	LQ/tukRlksrDbxTLPHLup+2y3oSbdvbM27i/TiHTCXgQyldgnqwx9uJhN8LkF5M7VJQR7XAFgHL
	BqR4VkfG7JY6KGd
X-Received: by 2002:a05:600c:3b02:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-4922f3cd1a2mr52338225e9.30.1781599433093;
        Tue, 16 Jun 2026 01:43:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619a041986sm18517218f8f.23.2026.06.16.01.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 01:43:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 10:43:52 +0200
Message-Id: <DJACAG7CMC18.3FXGQ7XY58UM4@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: Fix CVE-2025-69646
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260420042409.1727728-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260420042409.1727728-1-Harish.Sadineni@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 08:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238880

On Mon Apr 20, 2026 at 6:24 AM CEST, Harish via lists.openembedded.org Sadi=
neni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> CVE: CVE-2025-69646
>
> PR 33638
> * dwarf.c (display_debug_rnglists_list): Return bool.  Rename
> "inital_length" to plain "length".  Verify length is large
> enough to read header.  Limit length to rest of section.
> Similarly limit offset_entry_count.
> (display_debug_ranges): Check display_debug_rnglists_unit_header
> return status.  Stop output on error.
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dpatch;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33]
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---

Hello Harish,

This patch was lost for a time, my fault, sorry.

Now, when I try to apply it, do_patch fails for binutils. Could you
rebase on the latest scarthgap and send a v2?

Thanks!

>  .../binutils/binutils-2.42.inc                |   1 +
>  .../binutils/0031-CVE-2025-69646.patch        | 187 ++++++++++++++++++
>  2 files changed, 188 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2025=
-69646.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 839d31242e..beeb758b64 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -69,5 +69,6 @@ SRC_URI =3D "\
>       file://0028-CVE-2025-11494.patch \
>       file://0029-CVE-2025-11839.patch \
>       file://0030-CVE-2025-11840.patch \
> +     file://0031-CVE-2025-69646.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.=
patch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch
> new file mode 100644
> index 0000000000..42b0b858cc
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch
> @@ -0,0 +1,187 @@
> +From 598704a00cbac5e85c2bedd363357b5bf6fcee33 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Sat, 22 Nov 2025 09:22:10 +1030
> +Subject: [PATCH] PR 33638, debug_rnglists output
> +
> +The fuzzed testcase in this PR continuously outputs an error about
> +the debug_rnglists header.  Fixed by taking notice of the error and
> +stopping output.  The patch also limits the length in all cases, not
> +just when a relocation is present, and limits the offset entry count
> +read from the header.  I removed the warning and the test for relocs
> +because the code can't work reliably with unresolved relocs in the
> +length field.
> +
> +	PR 33638
> +	* dwarf.c (display_debug_rnglists_list): Return bool.  Rename
> +	"inital_length" to plain "length".  Verify length is large
> +	enough to read header.  Limit length to rest of section.
> +	Similarly limit offset_entry_count.
> +	(display_debug_ranges): Check display_debug_rnglists_unit_header
> +	return status.  Stop output on error.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dpatch;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33]
> +CVE: CVE-2025-69646
> +
> +Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> +---
> + binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
> + 1 file changed, 34 insertions(+), 33 deletions(-)
> +
> +diff --git a/binutils/dwarf.c b/binutils/dwarf.c
> +index 615e051b2bf..d718d97c771 100644
> +--- a/binutils/dwarf.c
> ++++ b/binutils/dwarf.c
> +@@ -8206,7 +8206,7 @@ display_debug_rnglists_list (unsigned char * start=
,
> +   return start;
> + }
> +=20
> +-static int
> ++static bool
> + display_debug_rnglists_unit_header (struct dwarf_section *  section,
> + 				    uint64_t *              unit_offset,
> + 				    unsigned char *         poffset_size)
> +@@ -8214,7 +8214,8 @@ display_debug_rnglists_unit_header (struct dwarf_s=
ection *  section,
> +   uint64_t        start_offset =3D *unit_offset;
> +   unsigned char * p =3D section->start + start_offset;
> +   unsigned char * finish =3D section->start + section->size;
> +-  uint64_t        initial_length;
> ++  unsigned char * hdr;
> ++  uint64_t        length;
> +   unsigned char   segment_selector_size;
> +   unsigned int    offset_entry_count;
> +   unsigned int    i;
> +@@ -8223,66 +8224,59 @@ display_debug_rnglists_unit_header (struct dwarf=
_section *  section,
> +   unsigned char   offset_size;
> +=20
> +   /* Get and check the length of the block.  */
> +-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
> ++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
> +=20
> +-  if (initial_length =3D=3D 0xffffffff)
> ++  if (length =3D=3D 0xffffffff)
> +     {
> +       /* This section is 64-bit DWARF 3.  */
> +-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
> ++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
> +       *poffset_size =3D offset_size =3D 8;
> +     }
> +   else
> +     *poffset_size =3D offset_size =3D 4;
> +=20
> +-  if (initial_length > (size_t) (finish - p))
> +-    {
> +-      /* If the length field has a relocation against it, then we shoul=
d
> +-	 not complain if it is inaccurate (and probably negative).
> +-	 It is copied from .debug_line handling code.  */
> +-      if (reloc_at (section, (p - section->start) - offset_size))
> +-	initial_length =3D finish - p;
> +-      else
> +-	{
> +-	  warn (_("The length field (%#" PRIx64
> +-		  ") in the debug_rnglists header is wrong"
> +-		  " - the section is too small\n"),
> +-		initial_length);
> +-	  return 0;
> +-	}
> +-    }
> +-
> +-  /* Report the next unit offset to the caller.  */
> +-  *unit_offset =3D (p - section->start) + initial_length;
> ++  if (length < 8)
> ++    return false;
> +=20
> +   /* Get the other fields in the header.  */
> ++  hdr =3D p;
> +   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
> +   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
> +   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
> +   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
> +=20
> +   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
> +-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
> ++  printf (_("  Length:          %#" PRIx64 "\n"), length);
> +   printf (_("  DWARF version:   %u\n"), version);
> +   printf (_("  Address size:    %u\n"), address_size);
> +   printf (_("  Segment size:    %u\n"), segment_selector_size);
> +   printf (_("  Offset entries:  %u\n"), offset_entry_count);
> +=20
> ++  if (length > (size_t) (finish - hdr))
> ++    length =3D finish - hdr;
> ++
> ++  /* Report the next unit offset to the caller.  */
> ++  *unit_offset =3D (hdr - section->start) + length;
> ++
> +   /* Check the fields.  */
> +   if (segment_selector_size !=3D 0)
> +     {
> +       warn (_("The %s section contains "
> + 	      "unsupported segment selector size: %d.\n"),
> + 	    section->name, segment_selector_size);
> +-      return 0;
> ++      return false;
> +     }
> +=20
> +   if (version < 5)
> +     {
> +       warn (_("Only DWARF version 5+ debug_rnglists info "
> + 	      "is currently supported.\n"));
> +-      return 0;
> ++      return false;
> +     }
> +=20
> ++  uint64_t max_off_count =3D (length - 8) / offset_size;
> ++  if (offset_entry_count > max_off_count)
> ++    offset_entry_count =3D max_off_count;
> +   if (offset_entry_count !=3D 0)
> +     {
> +       printf (_("\n   Offsets starting at %#tx:\n"), p - section->start=
);
> +@@ -8296,7 +8290,7 @@ display_debug_rnglists_unit_header (struct dwarf_s=
ection *  section,
> + 	}
> +     }
> +=20
> +-  return 1;
> ++  return true;
> + }
> +=20
> + static bool
> +@@ -8327,6 +8321,7 @@ display_debug_ranges (struct dwarf_section *sectio=
n,
> +   uint64_t last_offset =3D 0;
> +   uint64_t next_rnglists_cu_offset =3D 0;
> +   unsigned char offset_size;
> ++  bool ok_header =3D true;
> +=20
> +   if (bytes =3D=3D 0)
> +     {
> +@@ -8419,8 +8414,12 @@ display_debug_ranges (struct dwarf_section *secti=
on,
> +       /* If we've moved on to the next compile unit in the rnglists sec=
tion - dump the unit header(s).  */
> +       if (is_rnglists && next_rnglists_cu_offset < offset)
> + 	{
> +-	  while (next_rnglists_cu_offset < offset)
> +-	    display_debug_rnglists_unit_header (section, &next_rnglists_cu_off=
set, &offset_size);
> ++	  while (ok_header && next_rnglists_cu_offset < offset)
> ++	    ok_header =3D display_debug_rnglists_unit_header (section,
> ++							    &next_rnglists_cu_offset,
> ++							    &offset_size);
> ++	  if (!ok_header)
> ++	    break;
> + 	  printf (_("    Offset   Begin    End\n"));
> + 	}
> +=20
> +@@ -8461,10 +8460,12 @@ display_debug_ranges (struct dwarf_section *sect=
ion,
> +     }
> +=20
> +   /* Display trailing empty (or unreferenced) compile units, if any.  *=
/
> +-  if (is_rnglists)
> ++  if (is_rnglists && ok_header)
> +     while (next_rnglists_cu_offset < section->size)
> +-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_of=
fset, &offset_size);
> +-
> ++      if (!display_debug_rnglists_unit_header (section,
> ++					       &next_rnglists_cu_offset,
> ++					       &offset_size))
> ++	break;
> +   putchar ('\n');
> +=20
> +   free (range_entries);
> +--=20
> +2.49.0


--=20
Yoann Congal
Smile ECS


