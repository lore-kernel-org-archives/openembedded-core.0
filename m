Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAD0D35172
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:19:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9781.1775038768522685215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N2iutEqV;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fe655187so87676615e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775038767; x=1775643567; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+w3aDp0vFoXmE1py2/BXqLTbHjYlg0xxAI+vflZX8Pc=;
        b=N2iutEqVdsumuuLFxSyK431K0issj4EZMOi4/47fNZFvSPqRiDZoa9DNxe/w4hoRYq
         /CFBvO3QvtB6FSlMJav2td0OvrEu1WZrUPOo2y/Gw4TmXmAgQt49mNvhVdD9ZjDqpQkG
         PB4w2bFczG5vF+3BljuSBX9c8HkFCOyhmStQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038767; x=1775643567;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+w3aDp0vFoXmE1py2/BXqLTbHjYlg0xxAI+vflZX8Pc=;
        b=ZXa8J7q3BdlOteLxX6Uk9bhvxfEcZN51t20rol6BlGzhDqCtN8AygYJ0BvBzwQCU9D
         JgcjaULgx01G/wsI9ETzNCoJ8yckyQ/uGRSno+KUmaWa9knFr4aguiw+PkOpK/3Xslw9
         TGAtGFuhWs16GvtwykBVbEYrHKMaXvVx/bdaz6kUm3JgPHQNgs+GwZNn/ipChqSXs+4e
         KwHby7HrbrTrdK1UHBSUFY+Rr1vgMzngxpAD1nn9V9KbTkQ/XgeybsgvozubmaUWIkLO
         KgyyvdetWt0l5tjSIyK+YpEVZ2v5EriqeWKcpBxRZhRrfaFdpxIMJ647+b/NP+wLNcx7
         af7A==
X-Forwarded-Encrypted: i=1; AJvYcCX6WcP+5sb5N9MmUnfkE4nZN6vwQGmY3EszBW85DTF16lOqVRSj+OqL4U5pOEpYO2ckSt8spm8Zvkd1F1Ecb35i5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwElwQOkp3wOKRtKciZomBSiOeBdWXXOnIsaktkj3uJHzrVqX0W
	l8Hdn9w9RGTO9LrkZisKU+69pvOJQpFwOaJ5mS+mZXUq8Xe0Ts+5PL18aL60o+xQec53mOgkm1b
	OPy4CRMk=
X-Gm-Gg: ATEYQzzX1is/Hngp0wCbep82JbduykZsSYdSExP0kCAbUh/xn9A+HWFCz+FkuT+bmyT
	wRTNFGEyMShm9Q8uDbFV3PQecD0te9Fst4pRz/RmBjsCGtZ9q5DDsTDwDOouYjJvrHQ3vJKATj8
	A+8qIXjbSymgtF7CrGDdYHdzHMhzEXvB0DHCf+p4wxEssGMpE02vlYMbhzXqjSv+mei9EzJUJ1U
	fNQI1FFjqy5Bz6FYLQDlMtF9ridkIzJCLb6foZFOwR+seKY/QjSZBnjfRp8dmHo3kMJVz9LPgQf
	nEXmnVmyjFCISyeP9+b5re9TFRccqMrg0Xg83P5jfTEBOCLfOQ39RK6fJ7WI62ZQ2bomvLltb6O
	rvQLYyK45UF9ALoxtYSOYR5+f80Gizemuer7onAdJH9wwz7PM9nKlrd4wEaQ6vNMEYPBp436U7X
	4JAaqrx5l0Xp9Aa7MW0dnh7HZ3P4USHNYqsOEOnYQrTFlJFcZ046eOYnpeiC1jVqKRW6vkJ0Gh0
	LLHP8ptIooGdcd3KJ7Ivg==
X-Received: by 2002:a05:600c:4f95:b0:487:2439:6266 with SMTP id 5b1f17b1804b1-4888359cfadmr49129405e9.30.1775038766620;
        Wed, 01 Apr 2026 03:19:26 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e82e669sm97965535e9.11.2026.04.01.03.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:19:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 12:19:25 +0200
Message-Id: <DHHQQ7P9WLR7.2F2R814TO910H@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH v2 1/4] binutils: Fix
 CVE-2025-69648
X-Mailer: aerc 0.20.0
References: <20260317041229.2932275-1-deeratho@cisco.com>
 <20260401100022.1173083-1-deeratho@cisco.com>
In-Reply-To: <20260401100022.1173083-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 10:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234342

On Wed Apr 1, 2026 at 12:00 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> pick the patch [1] as mentioned in [2]
>
> [1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D598704=
a00cbac5e85c2bedd363357b5bf6fcee33
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-69648
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> diff --git a/meta/recipes-devtools/binutils/0001-pick-the-patch-1-as-ment=
ioned-in-2.patch b/meta/recipes-devtools/binutils/0001-pick-the-patch-1-as-=
mentioned-in-2.patch
> new file mode 100644
> index 0000000000..70866fd7da
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/0001-pick-the-patch-1-as-mentioned-i=
n-2.patch
> @@ -0,0 +1,222 @@
> +From 507f05eb8f3a132a536c593e232fdc7878fb9bba Mon Sep 17 00:00:00 2001
> +From: Deepak Rathore <deeratho@cisco.com>
> +Date: Tue, 31 Mar 2026 11:25:32 +0000
> +Subject: [PATCH] pick the patch [1] as mentioned in [2].
> +
> +[1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D59870=
4a00cbac5e85c2bedd363357b5bf6fcee33
> +[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69648
> +
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + .../binutils/binutils-2.45.inc                |   1 +
> + .../binutils/binutils/CVE-2025-69648.patch    | 188 ++++++++++++++++++

That added patch is targeted at oe-core not binutils?
Something went wrong...

> + 2 files changed, 189 insertions(+)
> + create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-696=
48.patch
> +
> +diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/rec=
ipes-devtools/binutils/binutils-2.45.inc
> +index 16a63cabc5..b6d7b3d60f 100644
> +--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> ++++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> +@@ -46,4 +46,5 @@ SRC_URI =3D "\
> +      file://0018-CVE-2025-11494.patch \
> +      file://0019-CVE-2025-11839.patch \
> +      file://0020-CVE-2025-11840.patch \
> ++     file://CVE-2025-69648.patch \
> + "
> +diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patc=
h b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> +new file mode 100644
> +index 0000000000..2346b18f01
> +--- /dev/null
> ++++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> +@@ -0,0 +1,188 @@
> ++From 7df481dd76c05c89782721e9df5468be829c356b Mon Sep 17 00:00:00 2001
> ++From: Alan Modra <amodra@gmail.com>
> ++Date: Sat, 22 Nov 2025 09:22:10 +1030
> ++Subject: [PATCH] PR 33638, debug_rnglists output
> ++
> ++The fuzzed testcase in this PR continuously outputs an error about
> ++the debug_rnglists header.  Fixed by taking notice of the error and
> ++stopping output.  The patch also limits the length in all cases, not
> ++just when a relocation is present, and limits the offset entry count
> ++read from the header.  I removed the warning and the test for relocs
> ++because the code can't work reliably with unresolved relocs in the
> ++length field.
> ++
> ++	PR 33638
> ++	* dwarf.c (display_debug_rnglists_list): Return bool.  Rename
> ++	"inital_length" to plain "length".  Verify length is large
> ++	enough to read header.  Limit length to rest of section.
> ++	Similarly limit offset_entry_count.
> ++	(display_debug_ranges): Check display_debug_rnglists_unit_header
> ++	return status.  Stop output on error.
> ++
> ++CVE: CVE-2025-69648
> ++Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbi=
nutils-gdb.git;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33]
> ++
> ++(cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
> ++Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ++---
> ++ binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
> ++ 1 file changed, 34 insertions(+), 33 deletions(-)
> ++
> ++diff --git a/binutils/dwarf.c b/binutils/dwarf.c
> ++index f4bcb677761..b4fb56351ec 100644
> ++--- a/binutils/dwarf.c
> +++++ b/binutils/dwarf.c
> ++@@ -8282,7 +8282,7 @@ display_debug_rnglists_list (unsigned char * star=
t,
> ++   return start;
> ++ }
> ++
> ++-static int
> +++static bool
> ++ display_debug_rnglists_unit_header (struct dwarf_section *  section,
> ++				    uint64_t *              unit_offset,
> ++				    unsigned char *         poffset_size)
> ++@@ -8290,7 +8290,8 @@ display_debug_rnglists_unit_header (struct dwarf_=
section *  section,
> ++   uint64_t        start_offset =3D *unit_offset;
> ++   unsigned char * p =3D section->start + start_offset;
> ++   unsigned char * finish =3D section->start + section->size;
> ++-  uint64_t        initial_length;
> +++  unsigned char * hdr;
> +++  uint64_t        length;
> ++   unsigned char   segment_selector_size;
> ++   unsigned int    offset_entry_count;
> ++   unsigned int    i;
> ++@@ -8299,66 +8300,59 @@ display_debug_rnglists_unit_header (struct dwar=
f_section *  section,
> ++   unsigned char   offset_size;
> ++
> ++   /* Get and check the length of the block.  */
> ++-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
> +++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
> ++
> ++-  if (initial_length =3D=3D 0xffffffff)
> +++  if (length =3D=3D 0xffffffff)
> ++     {
> ++       /* This section is 64-bit DWARF 3.  */
> ++-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
> +++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
> ++       *poffset_size =3D offset_size =3D 8;
> ++     }
> ++   else
> ++     *poffset_size =3D offset_size =3D 4;
> ++
> ++-  if (initial_length > (size_t) (finish - p))
> ++-    {
> ++-      /* If the length field has a relocation against it, then we shou=
ld
> ++-	 not complain if it is inaccurate (and probably negative).
> ++-	 It is copied from .debug_line handling code.  */
> ++-      if (reloc_at (section, (p - section->start) - offset_size))
> ++-	initial_length =3D finish - p;
> ++-      else
> ++-	{
> ++-	  warn (_("The length field (%#" PRIx64
> ++-		  ") in the debug_rnglists header is wrong"
> ++-		  " - the section is too small\n"),
> ++-		initial_length);
> ++-	  return 0;
> ++-	}
> ++-    }
> ++-
> ++-  /* Report the next unit offset to the caller.  */
> ++-  *unit_offset =3D (p - section->start) + initial_length;
> +++  if (length < 8)
> +++    return false;
> ++
> ++   /* Get the other fields in the header.  */
> +++  hdr =3D p;
> ++   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
> ++   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
> ++   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
> ++   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
> ++
> ++   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
> ++-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
> +++  printf (_("  Length:          %#" PRIx64 "\n"), length);
> ++   printf (_("  DWARF version:   %u\n"), version);
> ++   printf (_("  Address size:    %u\n"), address_size);
> ++   printf (_("  Segment size:    %u\n"), segment_selector_size);
> ++   printf (_("  Offset entries:  %u\n"), offset_entry_count);
> ++
> +++  if (length > (size_t) (finish - hdr))
> +++    length =3D finish - hdr;
> +++
> +++  /* Report the next unit offset to the caller.  */
> +++  *unit_offset =3D (hdr - section->start) + length;
> +++
> ++   /* Check the fields.  */
> ++   if (segment_selector_size !=3D 0)
> ++     {
> ++       warn (_("The %s section contains "
> ++	      "unsupported segment selector size: %d.\n"),
> ++	    section->name, segment_selector_size);
> ++-      return 0;
> +++      return false;
> ++     }
> ++
> ++   if (version < 5)
> ++     {
> ++       warn (_("Only DWARF version 5+ debug_rnglists info "
> ++	      "is currently supported.\n"));
> ++-      return 0;
> +++      return false;
> ++     }
> ++
> +++  uint64_t max_off_count =3D (length - 8) / offset_size;
> +++  if (offset_entry_count > max_off_count)
> +++    offset_entry_count =3D max_off_count;
> ++   if (offset_entry_count !=3D 0)
> ++     {
> ++       printf (_("\n   Offsets starting at %#tx:\n"), p - section->star=
t);
> ++@@ -8372,7 +8366,7 @@ display_debug_rnglists_unit_header (struct dwarf_=
section *  section,
> ++	}
> ++     }
> ++
> ++-  return 1;
> +++  return true;
> ++ }
> ++
> ++ static bool
> ++@@ -8404,6 +8398,7 @@ display_debug_ranges (struct dwarf_section *secti=
on,
> ++   uint64_t last_offset =3D 0;
> ++   uint64_t next_rnglists_cu_offset =3D 0;
> ++   unsigned char offset_size;
> +++  bool ok_header =3D true;
> ++
> ++   if (bytes =3D=3D 0)
> ++     {
> ++@@ -8493,8 +8488,12 @@ display_debug_ranges (struct dwarf_section *sect=
ion,
> ++       /* If we've moved on to the next compile unit in the rnglists se=
ction - dump the unit header(s).  */
> ++       if (is_rnglists && next_rnglists_cu_offset < offset)
> ++	{
> ++-	  while (next_rnglists_cu_offset < offset)
> ++-	    display_debug_rnglists_unit_header (section, &next_rnglists_cu_of=
fset, &offset_size);
> +++	  while (ok_header && next_rnglists_cu_offset < offset)
> +++	    ok_header =3D display_debug_rnglists_unit_header (section,
> +++							    &next_rnglists_cu_offset,
> +++							    &offset_size);
> +++	  if (!ok_header)
> +++	    break;
> ++	  printf (_("    Offset   Begin    End\n"));
> ++	}
> ++
> ++@@ -8548,10 +8547,12 @@ display_debug_ranges (struct dwarf_section *sec=
tion,
> ++     }
> ++
> ++   /* Display trailing empty (or unreferenced) compile units, if any.  =
*/
> ++-  if (is_rnglists)
> +++  if (is_rnglists && ok_header)
> ++     while (next_rnglists_cu_offset < section->size)
> ++-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_o=
ffset, &offset_size);
> ++-
> +++      if (!display_debug_rnglists_unit_header (section,
> +++					       &next_rnglists_cu_offset,
> +++					       &offset_size))
> +++	break;
> ++   putchar ('\n');
> ++
> ++   free (range_entries);
> ++--
> ++2.35.6
> +--=20
> +2.51.0
> +
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
> index 0000000000..ce0e764762
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> @@ -0,0 +1,189 @@
> +From 7df481dd76c05c89782721e9df5468be829c356b Mon Sep 17 00:00:00 2001
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
> +index f4bcb677761..b4fb56351ec 100644
> +--- a/binutils/dwarf.c
> ++++ b/binutils/dwarf.c
> +@@ -8282,7 +8282,7 @@ display_debug_rnglists_list (unsigned char * start=
,
> +   return start;
> + }
> +=20
> +-static int
> ++static bool
> + display_debug_rnglists_unit_header (struct dwarf_section *  section,
> + 				    uint64_t *              unit_offset,
> + 				    unsigned char *         poffset_size)
> +@@ -8290,7 +8290,8 @@ display_debug_rnglists_unit_header (struct dwarf_s=
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
> +@@ -8299,66 +8300,59 @@ display_debug_rnglists_unit_header (struct dwarf=
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
> +@@ -8372,7 +8366,7 @@ display_debug_rnglists_unit_header (struct dwarf_s=
ection *  section,
> + 	}
> +     }
> +=20
> +-  return 1;
> ++  return true;
> + }
> +=20
> + static bool
> +@@ -8404,6 +8398,7 @@ display_debug_ranges (struct dwarf_section *sectio=
n,
> +   uint64_t last_offset =3D 0;
> +   uint64_t next_rnglists_cu_offset =3D 0;
> +   unsigned char offset_size;
> ++  bool ok_header =3D true;
> +=20
> +   if (bytes =3D=3D 0)
> +     {
> +@@ -8493,8 +8488,12 @@ display_debug_ranges (struct dwarf_section *secti=
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
> +@@ -8548,10 +8547,12 @@ display_debug_ranges (struct dwarf_section *sect=
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
> +2.35.6
> +


--=20
Yoann Congal
Smile ECS


