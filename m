Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69487FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 13:03:04 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12888.1777381379062246868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 06:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HWAotJzT;
 spf=pass (domain: smile.fr, ip: 209.85.218.43, mailfrom: fabien.thomas@smile.fr)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba922426c5cso902205266b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777381377; x=1777986177; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRLWmorG6gVa5aCw5dX9qTruT6ZSpb3s1/NIYS/mitQ=;
        b=HWAotJzTOUdtNtRBiHOZZZVS29FSRvVDSAiBtZyOJDya9XnOdyF6c1xHENmowSE4+i
         WPWAvtmRXwbXjhdlCEUVs1EyYEay/nWwbZDMI6N3PJULK3Yka1+lXqEkMOGzjMPrEzkM
         xmY4KZ5oDvibrxcchGT3LrCvq2wcifXEUN5/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381377; x=1777986177;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRLWmorG6gVa5aCw5dX9qTruT6ZSpb3s1/NIYS/mitQ=;
        b=oypB678nFn2AxaWc75sYDFhwKdqiZED+gOp5kgG5i8QLSRwltkBLZ0T1+lJI6fMaVc
         MojaqCK4GHjLmDz17rg7LxnrmP71Kg/CQWPCq7J3OEn0RVRT6Ci3JT0wnpP0BolIOLh0
         uWbRmI/Q7YQ92QLPoyPuL0sMcMHkluelI5M1dF2TaKnwe2QgnmDYZwlklld82U/oYXYR
         EACpm6TrVOt7Zx/mpJsjbwN0KY8/nnqbCmJzQIscz1CGC8w0niUTnz26P91GtGvAB+2K
         wEc0DIMuuKrQIdN3ZFhnzHW9H7Xet02joPH96U7dkvMP4o/Qx1GCYd4CqRNPLBzc8Ei5
         jimQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cBGKO2H34pyOXK0V0o/DkXrQF20N4N8wTJnk67B730Bz/1ABOYJ2kj9jWuvfcYo64cJyzr6LMBIdfiNAuKc2aWg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8N6ZZ6WK6RsUuEai9dMinKYYTts8Mfp47dmCUcGHxhBOKtxcI
	8O+X0hVIxGQi+Ga6BIB1G6KVX1wEa0iwD00qF6Rxsr2ImZ1VIKXMng7Xcl7G2+unpSE=
X-Gm-Gg: AeBDieta9XlHnx68D36aaHeFv/fgiXtWUgn0xsK5mdHwpabWDdKTlx7cVbNkX0+XC/J
	S+PWxqPstsniWpeVF9NHDYKUGS61oaXTCa3UiXjIWyVJmMg50kb2uXm5b+YcDaLWSLm//o7LpQF
	A79PEiek48KbPEddD1MeUXtL1a963elduucc+qMyLsPvRXEL8SbhmGOvx3fzzRmC6B/s95Lu/N3
	Z4qOHyK+3vSuvqTb7TN3IN/VszR3clkoWDg8v7tFRAAh/wsI45KI8Qx5GWxYTiS4c/UBovgL5Vx
	i1l3iaqdYAOX8sn+T51ibMajF+rAT8t1df+98iTsyvQil8Ej1ImvZLUrZM/H+KkLajfBrV5dVGY
	Brmrh4bswzOtwLg4jsuvRrTcCAVGqTIzQCbxjrqEtg6baWwz+oPototjit5+eOv9PplXeqwqRgW
	KBBA0qpdaqTE/OGfl1zZ6TNJ/zkhgqyKxg0tyES1eX+6R9GiqBVqRTs0TWCXvb59tAZn5PTV2BM
	HeVfL1EG9+TsN9iRZS9yYczNhmytEACXIbS2VEeZMG0IK5W6sIHZi5JNq2N43IjEo+U7+3D1zA6
	OIyw1wRt
X-Received: by 2002:a17:907:15c6:b0:ba7:8dd9:cede with SMTP id a640c23a62f3a-bb801dd77b2mr126385466b.13.1777381375409;
        Tue, 28 Apr 2026 06:02:55 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d5ee9ecsm7021754f8f.16.2026.04.28.06.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:02:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 15:02:54 +0200
Message-Id: <DI4T4359V95C.2VSQMQ7B8OIEY@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 2/4] binutils: fix CVE-2025-69648
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>, "Fabien
 Thomas" <fabien.thomas@smile.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260422130342.386379-1-adarsh.jagadish.kamini@est.tech>
 <DI41OMP4G56B.27ZI7H01HB7KW@smile.fr>
 <AS8P189MB167210CB6211A28587E8EAA5B3372@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P189MB167210CB6211A28587E8EAA5B3372@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 13:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236062

On Tue Apr 28, 2026 at 10:42 AM CEST, Adarsh Jagadish Kamini wrote:
> Hi,
> The original patch was submitted to whinlatter by Deepak. So, I kept it t=
o pass the credits.

Oh, right, good point.
Noted, thanks.

>
> Thanks!
> ________________________________
> From: Fabien Thomas <fabien.thomas@smile.fr>
> Sent: Monday, April 27, 2026 17:33
> To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedde=
d-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core][scarthgap][PATCH 2/4] binutils: fix CVE-2025-69648
>
> On Wed Apr 22, 2026 at 3:03 PM CEST, Adarsh Jagadish Kamini via lists.ope=
nembedded.org wrote:
>> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>>
>> Backport upstream fix for CVE-2025-69648 [1].
>>
>> [1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D59870=
4a00cbac5e85c2bedd363357b5bf6fcee33
>>
>> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>> ---
>>  .../binutils/binutils-2.42.inc                |   1 +
>>  .../binutils/binutils/CVE-2025-69648.patch    | 190 ++++++++++++++++++
>>  2 files changed, 191 insertions(+)
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-696=
48.patch
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/rec=
ipes-devtools/binutils/binutils-2.42.inc
>> index a337a3e850..6c1f9dc870 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
>> @@ -72,5 +72,6 @@ SRC_URI =3D "\
>>       file://0029-CVE-2025-11839.patch \
>>       file://0030-CVE-2025-11840.patch \
>>       file://CVE-2025-69647.patch \
>> +     file://CVE-2025-69648.patch \
>>  "
>>  S  =3D "${WORKDIR}/git"
>> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patc=
h b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
>> new file mode 100644
>> index 0000000000..e04d7ed6c2
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
>> @@ -0,0 +1,190 @@
>> +From 7df481dd76c05c89782721e9df5468be829c356b Mon Sep 17 00:00:00 2001
>> +From: Alan Modra <amodra@gmail.com>
>> +Date: Sat, 22 Nov 2025 09:22:10 +1030
>> +Subject: [PATCH] PR 33638, debug_rnglists output
>> +
>> +The fuzzed testcase in this PR continuously outputs an error about
>> +the debug_rnglists header.  Fixed by taking notice of the error and
>> +stopping output.  The patch also limits the length in all cases, not
>> +just when a relocation is present, and limits the offset entry count
>> +read from the header.  I removed the warning and the test for relocs
>> +because the code can't work reliably with unresolved relocs in the
>> +length field.
>> +
>> +     PR 33638
>> +     * dwarf.c (display_debug_rnglists_list): Return bool.  Rename
>> +     "inital_length" to plain "length".  Verify length is large
>> +     enough to read header.  Limit length to rest of section.
>> +     Similarly limit offset_entry_count.
>> +     (display_debug_ranges): Check display_debug_rnglists_unit_header
>> +     return status.  Stop output on error.
>> +
>> +CVE: CVE-2025-69648
>> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbi=
nutils-gdb.git;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33]
>> +
>> +(cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
>> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>> +---
>> + binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
>> + 1 file changed, 34 insertions(+), 33 deletions(-)
>> +
>> +diff --git a/binutils/dwarf.c b/binutils/dwarf.c
>> +index f4bcb677761..b4fb56351ec 100644
>> +--- a/binutils/dwarf.c
>> ++++ b/binutils/dwarf.c
>> +@@ -8282,7 +8282,7 @@ display_debug_rnglists_list (unsigned char * star=
t,
>> +   return start;
>> + }
>> +
>> +-static int
>> ++static bool
>> + display_debug_rnglists_unit_header (struct dwarf_section *  section,
>> +                                  uint64_t *              unit_offset,
>> +                                  unsigned char *         poffset_size)
>> +@@ -8290,7 +8290,8 @@ display_debug_rnglists_unit_header (struct dwarf_=
section *  section,
>> +   uint64_t        start_offset =3D *unit_offset;
>> +   unsigned char * p =3D section->start + start_offset;
>> +   unsigned char * finish =3D section->start + section->size;
>> +-  uint64_t        initial_length;
>> ++  unsigned char * hdr;
>> ++  uint64_t        length;
>> +   unsigned char   segment_selector_size;
>> +   unsigned int    offset_entry_count;
>> +   unsigned int    i;
>> +@@ -8299,66 +8300,59 @@ display_debug_rnglists_unit_header (struct dwar=
f_section *  section,
>> +   unsigned char   offset_size;
>> +
>> +   /* Get and check the length of the block.  */
>> +-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
>> ++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
>> +
>> +-  if (initial_length =3D=3D 0xffffffff)
>> ++  if (length =3D=3D 0xffffffff)
>> +     {
>> +       /* This section is 64-bit DWARF 3.  */
>> +-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
>> ++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
>> +       *poffset_size =3D offset_size =3D 8;
>> +     }
>> +   else
>> +     *poffset_size =3D offset_size =3D 4;
>> +
>> +-  if (initial_length > (size_t) (finish - p))
>> +-    {
>> +-      /* If the length field has a relocation against it, then we shou=
ld
>> +-     not complain if it is inaccurate (and probably negative).
>> +-     It is copied from .debug_line handling code.  */
>> +-      if (reloc_at (section, (p - section->start) - offset_size))
>> +-    initial_length =3D finish - p;
>> +-      else
>> +-    {
>> +-      warn (_("The length field (%#" PRIx64
>> +-              ") in the debug_rnglists header is wrong"
>> +-              " - the section is too small\n"),
>> +-            initial_length);
>> +-      return 0;
>> +-    }
>> +-    }
>> +-
>> +-  /* Report the next unit offset to the caller.  */
>> +-  *unit_offset =3D (p - section->start) + initial_length;
>> ++  if (length < 8)
>> ++    return false;
>> +
>> +   /* Get the other fields in the header.  */
>> ++  hdr =3D p;
>> +   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
>> +   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
>> +   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
>> +   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
>> +
>> +   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
>> +-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
>> ++  printf (_("  Length:          %#" PRIx64 "\n"), length);
>> +   printf (_("  DWARF version:   %u\n"), version);
>> +   printf (_("  Address size:    %u\n"), address_size);
>> +   printf (_("  Segment size:    %u\n"), segment_selector_size);
>> +   printf (_("  Offset entries:  %u\n"), offset_entry_count);
>> +
>> ++  if (length > (size_t) (finish - hdr))
>> ++    length =3D finish - hdr;
>> ++
>> ++  /* Report the next unit offset to the caller.  */
>> ++  *unit_offset =3D (hdr - section->start) + length;
>> ++
>> +   /* Check the fields.  */
>> +   if (segment_selector_size !=3D 0)
>> +     {
>> +       warn (_("The %s section contains "
>> +            "unsupported segment selector size: %d.\n"),
>> +          section->name, segment_selector_size);
>> +-      return 0;
>> ++      return false;
>> +     }
>> +
>> +   if (version < 5)
>> +     {
>> +       warn (_("Only DWARF version 5+ debug_rnglists info "
>> +            "is currently supported.\n"));
>> +-      return 0;
>> ++      return false;
>> +     }
>> +
>> ++  uint64_t max_off_count =3D (length - 8) / offset_size;
>> ++  if (offset_entry_count > max_off_count)
>> ++    offset_entry_count =3D max_off_count;
>> +   if (offset_entry_count !=3D 0)
>> +     {
>> +       printf (_("\n   Offsets starting at %#tx:\n"), p - section->star=
t);
>> +@@ -8372,7 +8366,7 @@ display_debug_rnglists_unit_header (struct dwarf_=
section *  section,
>> +      }
>> +     }
>> +
>> +-  return 1;
>> ++  return true;
>> + }
>> +
>> + static bool
>> +@@ -8404,6 +8398,7 @@ display_debug_ranges (struct dwarf_section *secti=
on,
>> +   uint64_t last_offset =3D 0;
>> +   uint64_t next_rnglists_cu_offset =3D 0;
>> +   unsigned char offset_size;
>> ++  bool ok_header =3D true;
>> +
>> +   if (bytes =3D=3D 0)
>> +     {
>> +@@ -8493,8 +8488,12 @@ display_debug_ranges (struct dwarf_section *sect=
ion,
>> +       /* If we've moved on to the next compile unit in the rnglists se=
ction - dump the unit header(s).  */
>> +       if (is_rnglists && next_rnglists_cu_offset < offset)
>> +      {
>> +-      while (next_rnglists_cu_offset < offset)
>> +-        display_debug_rnglists_unit_header (section, &next_rnglists_cu=
_offset, &offset_size);
>> ++      while (ok_header && next_rnglists_cu_offset < offset)
>> ++        ok_header =3D display_debug_rnglists_unit_header (section,
>> ++                                                        &next_rnglists=
_cu_offset,
>> ++                                                        &offset_size);
>> ++      if (!ok_header)
>> ++        break;
>> +        printf (_("    Offset   Begin    End\n"));
>> +      }
>> +
>> +@@ -8548,10 +8547,12 @@ display_debug_ranges (struct dwarf_section *sec=
tion,
>> +     }
>> +
>> +   /* Display trailing empty (or unreferenced) compile units, if any.  =
*/
>> +-  if (is_rnglists)
>> ++  if (is_rnglists && ok_header)
>> +     while (next_rnglists_cu_offset < section->size)
>> +-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_o=
ffset, &offset_size);
>> +-
>> ++      if (!display_debug_rnglists_unit_header (section,
>> ++                                           &next_rnglists_cu_offset,
>> ++                                           &offset_size))
>> ++    break;
>> +   putchar ('\n');
>> +
>> +   free (range_entries);
>> +--
>> +2.35.6
>> +
>
> Hello Adarsh,
>
> I'm filling in for Yoann while he's on leave.
>
> Thank you for these pathes. A few notes, however: for future binutils pro=
jects,
> please include links to the CVE (ideally NVD or NIST), as well as the lin=
k
> to the Bugzilla entry mentioned in the patch that indicates that the patc=
h
> is resolved and in which version (especially when there are =E2=80=9Cdupl=
icates=E2=80=9D).
>
> All of these elements make it easier for us to validate the patch.
>
> And for this second patch, I see a Signed-off-by: Deepak Rathore <deerath=
o@cisco.com>
> Are there two of you from different companies who made this backport,
> or is this a mistake?
>
> Thank for your reply.
> --
> Fabien Thomas
> Smile ECS




--=20
Fabien Thomas
Smile ECS

