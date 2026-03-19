Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA701091936
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 23:57:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2111.1773964618810117698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 16:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mRM9nvoG;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so521895e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773964617; x=1774569417; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPZPOllSEiVNo/7omzvh+wndfnVSh0stB7SZf47JMBI=;
        b=mRM9nvoGTQnbL/vWIzZ0SJ8Kvk9ldagP+gkWdOk/0Uy7BCpktKYRlWG0gTTeQ5aR+d
         cuVlHea+MzbBX28pGVf78ModamdL/ki/gWDfROjWWqVZwXTJ03D5chER9bnjKpem6wJw
         Cp/ugiGzwPxQA4GA5/NCDsZ4nSVZZPodaaZaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773964617; x=1774569417;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPZPOllSEiVNo/7omzvh+wndfnVSh0stB7SZf47JMBI=;
        b=g/ylxAZTcO2h2Cl4n7PSvgtNdn5kyTI1dyNvx95A3XmGYAJnh47G1/IP8SOnCef/PE
         6f+r4fEM6mosflYDTVANas9bXtrBj6nXnKFO5wCVBmS4OhPcXuG4B50Irf+NGrP4A4Sh
         3WUf1vjEzbZXmoltYo3ZxEyk63xkgKUdJjIadcBJDspWWO5InXo7HKYXB/0SGiHlEc/y
         wD/XQ0mWh0CSwIDzzwvgUOdX5pHvTpZK5fdN4ZtpwKMSE4MGdvk7IUEqr1lG08Gla779
         /Nyo3c+lrwIWYesfaL8xP5icwE63UxiOuwc0nNu5TvmvP+uyLPf3XchVRsTkNp3ChStK
         /WVg==
X-Forwarded-Encrypted: i=1; AJvYcCUSAquRevL+6gexVWGOyM9sl0RAzHibwQb7dlKeH7PZjsAnwzuqjaUw4r8YPsfUNQCcKlmSqB3erk5lki24+qGFew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzIShtCK+DcVdVo7pEszwOUpYB+Ks3FoilGxT7lf61S0gJBmQn7
	xIr6MJtf4AieXmpynoH/SaZNR7OTdIqPc9BVefFQFu+5mfc+li3eELMe9T2p73u1TcYMdGomRXq
	12p52
X-Gm-Gg: ATEYQzx+WDt94x0uayms5tbnP8CJiejl/zPiW6rh16mk+2QHbL8Sp6V7GmoY+RIgXOo
	hU3ultALVwX8PB5bI9oKxKBq5WHrNLAltqP6fKepO4Wt8DE8hJ6SxrWq5DgdLvgeEl0H811LRa0
	SyRBH3gSrim+bhn7FnFHAb+S95cE01nucqZ4WGpQGBJR1WPx1mj2fFuZvhmomBjDl35VJJ9E77F
	jXNZwnLJvAtByFVb+osA5MNzI8sIqN0pFWkXKFBOLOMetYxywRE2FypBaWA4f6+VLK3W1hwVJ54
	npIV1U8Vq/UQgJi3GAmFg38JAUcEThg2NeR4HjlsrvfbrPifQPTqoV37xtl0ytvFprYK3t0bVV8
	ktuWOqdBhVpOG5m1YLd2xwJVczayQj9q8yhiyv5uaWOIlnu59M4MmqpnTN+dg5pzqKjIC2CWmTQ
	uxgdy/+pSafnCDFojXqfrnbf6mtoTQP++FDN3zQow53mRzPCHe97QDoqCu14M+4j3KSph1Hnkl5
	Ad5Ox/VBjRV+l18LrC9nGobfg==
X-Received: by 2002:a05:600c:3546:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-486fee29536mr13893985e9.25.1773964616908;
        Thu, 19 Mar 2026 16:56:56 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fa35b147sm83775395e9.15.2026.03.19.16.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 16:56:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 00:56:56 +0100
Message-Id: <DH75Z2970Q68.2IIP1XOVZ2EPX@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH 1/4] binutils: Fix CVE-2025-69648
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260317041229.2932275-1-deeratho@cisco.com>
In-Reply-To: <20260317041229.2932275-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 23:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233559

On Tue Mar 17, 2026 at 5:12 AM CET, Deepak Rathore via lists.openembedded.o=
rg wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> Pick the patch [1] as mentioned in [2].
>
> [1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D598704=
a00cbac5e85c2bedd363357b5bf6fcee33
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-69648
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index 16a63cabc5..b6d7b3d60f 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -46,4 +46,5 @@ SRC_URI =3D "\
>       file://0018-CVE-2025-11494.patch \
>       file://0019-CVE-2025-11839.patch \
>       file://0020-CVE-2025-11840.patch \
> +     file://CVE-2025-69648.patch \
>  "
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> new file mode 100644
> index 0000000000..a247bc0fe7
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> @@ -0,0 +1,188 @@
> +From da5460f518952684a8c774d9b202a395676ff85f Mon Sep 17 00:00:00 2001
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
> +CVE: CVE-2025-69648
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33]
> +
> +(cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
> + 1 file changed, 34 insertions(+), 33 deletions(-)
> +
> +diff --git a/binutils/dwarf.c b/binutils/dwarf.c
> +index d9f514180de..0d88ea94619 100644
> +--- a/binutils/dwarf.c
> ++++ b/binutils/dwarf.c
> +@@ -8292,7 +8292,7 @@ display_debug_rnglists_list (unsigned char * start=
,
> +   return start;
> + }
> +
> +-static int
> ++static bool
> + display_debug_rnglists_unit_header (struct dwarf_section *  section,
> +				    uint64_t *              unit_offset,

Hello,

This patch and other in the whole series has a weird format. The context
lines starts with tabs and not a single space as usual. While it seems
like it passes tests, I'm afraid it will break something down the line
and I'd rather not take this like this.

Can you please check?

Thanks!

> +				    unsigned char *         poffset_size)
> +@@ -8300,7 +8300,8 @@ display_debug_rnglists_unit_header (struct dwarf_s=
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
> +@@ -8309,66 +8310,59 @@ display_debug_rnglists_unit_header (struct dwarf=
_section *  section,
> +   unsigned char   offset_size;
> +
> +   /* Get and check the length of the block.  */
> +-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
> ++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
> +
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
> +
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
> +
> +   /* Get the other fields in the header.  */
> ++  hdr =3D p;
> +   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
> +   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
> +   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
> +   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
> +
> +   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
> +-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
> ++  printf (_("  Length:          %#" PRIx64 "\n"), length);
> +   printf (_("  DWARF version:   %u\n"), version);
> +   printf (_("  Address size:    %u\n"), address_size);
> +   printf (_("  Segment size:    %u\n"), segment_selector_size);
> +   printf (_("  Offset entries:  %u\n"), offset_entry_count);
> +
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
> +	      "unsupported segment selector size: %d.\n"),
> +	    section->name, segment_selector_size);
> +-      return 0;
> ++      return false;
> +     }
> +
> +   if (version < 5)
> +     {
> +       warn (_("Only DWARF version 5+ debug_rnglists info "
> +	      "is currently supported.\n"));
> +-      return 0;
> ++      return false;
> +     }
> +
> ++  uint64_t max_off_count =3D (length - 8) / offset_size;
> ++  if (offset_entry_count > max_off_count)
> ++    offset_entry_count =3D max_off_count;
> +   if (offset_entry_count !=3D 0)
> +     {
> +       printf (_("\n   Offsets starting at %#tx:\n"), p - section->start=
);
> +@@ -8382,7 +8376,7 @@ display_debug_rnglists_unit_header (struct dwarf_s=
ection *  section,
> +	}
> +     }
> +
> +-  return 1;
> ++  return true;
> + }
> +
> + static bool
> +@@ -8414,6 +8408,7 @@ display_debug_ranges (struct dwarf_section *sectio=
n,
> +   uint64_t last_offset =3D 0;
> +   uint64_t next_rnglists_cu_offset =3D 0;
> +   unsigned char offset_size;
> ++  bool ok_header =3D true;
> +
> +   if (bytes =3D=3D 0)
> +     {
> +@@ -8503,8 +8498,12 @@ display_debug_ranges (struct dwarf_section *secti=
on,
> +       /* If we've moved on to the next compile unit in the rnglists sec=
tion - dump the unit header(s).  */
> +       if (is_rnglists && next_rnglists_cu_offset < offset)
> +	{
> +-	  while (next_rnglists_cu_offset < offset)
> +-	    display_debug_rnglists_unit_header (section, &next_rnglists_cu_off=
set, &offset_size);
> ++	  while (ok_header && next_rnglists_cu_offset < offset)
> ++	    ok_header =3D display_debug_rnglists_unit_header (section,
> ++							    &next_rnglists_cu_offset,
> ++							    &offset_size);
> ++	  if (!ok_header)
> ++	    break;
> +	  printf (_("    Offset   Begin    End\n"));
> +	}
> +
> +@@ -8558,10 +8557,12 @@ display_debug_ranges (struct dwarf_section *sect=
ion,
> +     }
> +
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
> +
> +   free (range_entries);
> +--
> +2.35.6


--=20
Yoann Congal
Smile ECS


