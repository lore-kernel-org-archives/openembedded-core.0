Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF78FF8868
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 15:33:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48222.1777303995791497994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 08:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lrYwJCzG;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cfd832155so7745277f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777303994; x=1777908794; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REmaoMTZx2yGj1NhLwa1X6aW3KHr1YFBcxMQYiG9KVo=;
        b=lrYwJCzGGe8rYf8FNNfJeQAT8K9o32J8GnhsLerlW1meveZmfXneK5e3jqrZvPpaRv
         kIlMaad5nXAENzcLO/Hzl8LxooD36NOcLgmJgdzOh47KQFH4L3GW/vscyUOHj3Mv56g3
         zl/qpCvXvMwBidTMxrvc7QtP8BIQ0aVXF2zVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303994; x=1777908794;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REmaoMTZx2yGj1NhLwa1X6aW3KHr1YFBcxMQYiG9KVo=;
        b=VnujHhKWFh0QNVYxaMVRVv64Q7dI545hFAYLTwp9uBER96Gp2k6VmDGheT0zPXVoky
         GI757w25Jqu6fPviXK0Tmzus51BB7lImeCx57btU1k7iPZCzas/HZwwkRttIDH5eOiBW
         4jYAtJnV3Hi2Iwufa6C5nl7cSHjokt1nRtDHEAPRqx8fvIXrIv53unU6YxqJVDTZHsFE
         yaDUY+rrVepzJA6GoOF2hCjp+zAwZQbGTTUJzMc5Rt67ExG8tDOB7MItpL7am2p+AY8b
         sln6CVOzqzjeU9+nRChcYZ3Yay33dQs/ojNltNaO9Wgc8m0hfzvv37s+qucRDFSTHhlE
         CMBw==
X-Forwarded-Encrypted: i=1; AFNElJ879fVtL3C556Kg9cF8zQM434vE7UDSxckyoEnrVVAjV+icNcH3zyZd0O9HQ43/g1bVz3M5NeJQPMskqqwAccM6hg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxC984fk3QtBV6Vkoy0nnQNgubew7TbUhEWxswMSgWQCmfSufWa
	ZomqO6t1Zc7vb2hwSGBNxr/ke5+BgW0iB2J+v6kc9VqpgzzZvxqsVtoBghv/tHMLe0s=
X-Gm-Gg: AeBDievQFG+gJXTb9D16m05Uigq7X8CtBP+Yo+GoBqjuLS/2gPSOO2V4K5kkGqPuhXR
	yQI+Ak5PS5Vp76S9ks/1eRLd83jy7L8/djzdLHOzEPTUNcrLGs+/HcLNzH3ZA3wC3jbcj0VxGzk
	XRBX39UK9VhL45OAuNPjtPu5FK/hAcF5t8Q/s2f8kNkGeWqvpjyIOD5TXjzRiNuGUOgdtzUXkep
	+j8wvkM57YKN/YPlexOhtMmvUIL3fR6vrtttLLUUF+fh2Sc5I1Zfp2FXUWSCus0D5KOA7riau1O
	gs5Bt2rSTWotckvC1a+W577ZFBUXI2YBWmanZZW5yZ1SKcyIRZO20DKvDSePiYT6KJ7LUHIQUye
	OfjcjyElz88MDTM+e9ZpXpnc93IiZqHzPRuFPw8TMqC2OOqupCoQ85gj1pN9KqKhSjVtX9wJ6TG
	X5cdORKR0U7Gf03H6sSa27BnU7YJyqVlhCp2jUJQJYed14sMmg6qpH5SosTZhzZDZwzXWB+3XMx
	8+zTYPZVZhxj1vxVisvARiZI5s=
X-Received: by 2002:a05:6000:4381:b0:43f:e791:a333 with SMTP id ffacd0b85a97d-43fe791a3a6mr66122680f8f.29.1777303994016;
        Mon, 27 Apr 2026 08:33:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm82547476f8f.0.2026.04.27.08.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 08:33:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 17:33:12 +0200
Message-Id: <DI41OMP4G56B.27ZI7H01HB7KW@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 2/4] binutils: fix CVE-2025-69648
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260422130342.386379-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260422130342.386379-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 15:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236019

On Wed Apr 22, 2026 at 3:03 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Backport upstream fix for CVE-2025-69648 [1].
>
> [1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D598704=
a00cbac5e85c2bedd363357b5bf6fcee33
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../binutils/binutils-2.42.inc                |   1 +
>  .../binutils/binutils/CVE-2025-69648.patch    | 190 ++++++++++++++++++
>  2 files changed, 191 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
8.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index a337a3e850..6c1f9dc870 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -72,5 +72,6 @@ SRC_URI =3D "\
>       file://0029-CVE-2025-11839.patch \
>       file://0030-CVE-2025-11840.patch \
>       file://CVE-2025-69647.patch \
> +     file://CVE-2025-69648.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> new file mode 100644
> index 0000000000..e04d7ed6c2
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> @@ -0,0 +1,190 @@
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
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
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

Hello Adarsh,

I'm filling in for Yoann while he's on leave.

Thank you for these pathes. A few notes, however: for future binutils proje=
cts,=20
please include links to the CVE (ideally NVD or NIST), as well as the link=
=20
to the Bugzilla entry mentioned in the patch that indicates that the patch=
=20
is resolved and in which version (especially when there are =E2=80=9Cduplic=
ates=E2=80=9D).

All of these elements make it easier for us to validate the patch.

And for this second patch, I see a Signed-off-by: Deepak Rathore <deeratho@=
cisco.com>
Are there two of you from different companies who made this backport,=20
or is this a mistake?

Thank for your reply.
--
Fabien Thomas
Smile ECS


