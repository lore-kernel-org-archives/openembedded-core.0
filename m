Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6B7D4A5EE
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 03:11:03 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69.1768533059211287488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 19:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AiQUlWa8;
 spf=pass (domain: mvista.com, ip: 209.85.218.51, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b86f69bbe60so230379166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1768533057; x=1769137857; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5xUQqsi0EnUgj9qX5E/9ya9CBMNStH2ohP4Twtr+2H4=;
        b=AiQUlWa8VHgcHeSGh0Kaprc8CdfyQLZBS7y0+6H66CtrX3oXj8cwPHozcV1EXQRetp
         3XfEQeNisAdKzEwbgV5vUYsfkPO12RYHIZmTwP0H1XtLGcjRPqUixxAAewVUyc1WoBKM
         WXyylHH2iOU7icpVG1AoHaRduEEbBcnxZRTso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768533057; x=1769137857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xUQqsi0EnUgj9qX5E/9ya9CBMNStH2ohP4Twtr+2H4=;
        b=YMzaL8dfAkg0ZACdbgqYENaV7f6DwNUMMCHMpkeWLm01dq2GqlBSxMMq4TZbEoV3lT
         BgqzwgiAwkFJwSIu+ek50/KWnLXXIRYmIfAB8CAITadISb1703HwEcwl1fhPbZ9tYrd6
         S1wMC2rtajJna3u3pyn8hOkY8D5W3pspVW7WgRuCBh42vL6kxikq/iniOonkNfkT3t+D
         bJc5GKuCdeoklxVZWUhHrKMvBXnBXeOMVyWg/ryUYySedSlUkAclFUAWdvK297IGEzRA
         +9EudHQc3P9+MkuCu7xa32oDeLPcvi8/gc1dDr/79Lde86oZH5ZGQkkay0wcwiHDtCEf
         4XSQ==
X-Gm-Message-State: AOJu0Ywv+Dqq7aOIGzLITf2ijqaY5+SjX+gM+BWUPFvN+mqLidirGSn+
	uB2N/0RpUGgRMQDqGKD3YC/g3/cAJMb+3Vr06ghdqDOkCKDnbdy03kwurqi8YviaTvWQuLzirl4
	k0M5tzP+3jET8LDD3P/TvyZRh1Ahsd3F7HnLkgEq5irH8DCSEg8J7DP6KdQ==
X-Gm-Gg: AY/fxX59whJD2Ov14icvP4WalIMj+/kns2660XKwEEqgLgRQsDC24dSu0j2fVWYAVyQ
	dHkLElX/65RwbOnbId6CLCdKs92NrBa63T0xeAWHboNfkhaOz/lUxLxVV+Jp+sxZYvBLkxDPMX2
	ZZw/4/cZAyqRE1zDxKhB0yGjk1Co3tWO108cW+ZVJDBTH6+oIQRdFJxrJHPjqDVFSmmhB/z1yCS
	wiOFMHnJGe9XuIr/IGOaPZGj72MluyVl7TPdAePHIc5JGrGz3k2D7Pt3TXJe20Kc64vbtC7i2ZN
	Kx8TLIGlsZNzro1nv25j8zmtLQ==
X-Received: by 2002:a17:906:6a28:b0:b73:544d:b963 with SMTP id
 a640c23a62f3a-b87968b6aa4mr84194266b.13.1768533057229; Thu, 15 Jan 2026
 19:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20260114132213.1865341-1-vanusuri@mvista.com> <CAMSfU+6zQpwAO9V=qrUFvOkwpN9qsSPEzOh2kA90oVr=64tu3Q@mail.gmail.com>
In-Reply-To: <CAMSfU+6zQpwAO9V=qrUFvOkwpN9qsSPEzOh2kA90oVr=64tu3Q@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 16 Jan 2026 08:40:45 +0530
X-Gm-Features: AZwV_QhcpxjNemH8BYK0ABjfHT9z0BxkpqYe7qVekM4wsn80SBn2krx0t5KqlQE
Message-ID: <CANQUz18LEBeGqS6E1UW7yHN8qcRM=OFxD-Bz=hnpCqZhHEgydA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] binutils: Fix CVE-2025-1181
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a66a19064878b0d5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 03:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229519

--000000000000a66a19064878b0d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

My apologies for the oversight.
Thanks for taking care of this.

Thanks & Regards,
Vijay

On Fri, Jan 16, 2026 at 5:12=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> Hello,
>
> Le mer. 14 janv. 2026 =C3=A0 14:22, Vijay Anusuri via lists.openembedded.=
org
> <vanusuri=3Dmvista.com@lists.openembedded.org> a =C3=A9crit :
>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> import patch from ubuntu to fix
>>  CVE-2025-1181
>>
>> Upstream-Status: Backport [import from ubuntu
>> https://git.launchpad.net/ubuntu/+source/binutils/tree/debian/patches?h=
=3Dubuntu/jammy-security
>> Upstream commit
>>
>> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D931494c9a=
89558acb36a03a340c01726545eef24
>> &
>> <https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D931494c9=
a89558acb36a03a340c01726545eef24&>
>>
>> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D931494c9a=
89558acb36a03a340c01726545eef24
>> ]
>>
>
> This is twice the same link, second link should be :
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D18cc11a277=
1d9e40180485da9a4fb660c03efac3
>
>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../binutils/binutils-2.38.inc                |   2 +
>>  .../binutils/binutils/CVE-2025-1181-pre.patch | 149 ++++++++
>>  .../binutils/binutils/CVE-2025-1181.patch     | 342 ++++++++++++++++++
>>  3 files changed, 493 insertions(+)
>>  create mode 100644
>> meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
>>  create mode 100644
>> meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc
>> b/meta/recipes-devtools/binutils/binutils-2.38.inc
>> index d5ad3c0ecb..63bd65c59c 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
>> @@ -86,5 +86,7 @@ SRC_URI =3D "\
>>       file://0047-CVE-2025-8225.patch \
>>       file://CVE-2025-11412.patch \
>>       file://CVE-2025-11413.patch \
>> +     file://CVE-2025-1181-pre.patch \
>> +     file://CVE-2025-1181.patch \
>>  "
>>  S  =3D "${WORKDIR}/git"
>> diff --git
>> a/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
>> b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
>> new file mode 100644
>> index 0000000000..dc9e9b624e
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
>> @@ -0,0 +1,149 @@
>> +Backported of:
>> +
>> +From 18cc11a2771d9e40180485da9a4fb660c03efac3 Mon Sep 17 00:00:00 2001
>> +From: Nick Clifton <nickc@redhat.com>
>> +Date: Wed, 5 Feb 2025 14:31:10 +0000
>> +Subject: [PATCH] Prevent illegal memory access when checking relocs in =
a
>> + corrupt ELF binary.
>> +
>> +PR 32641
>> +
>> +Upstream-Status: Backport [import from ubuntu
>> https://git.launchpad.net/ubuntu/+source/binutils/tree/debian/patches/CV=
E-2025-1181-pre.patch?h=3Dubuntu/jammy-security
>> +Upstream commit
>> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D931494c9a=
89558acb36a03a340c01726545eef24
>> ]
>>
> Upstream commit of this patch is
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D18cc11a277=
1d9e40180485da9a4fb660c03efac3
>
> Since this is not a major issue, I have fixed both in my branch :
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/kirkstone-nut&id=3Dc673f64e4e6f856c7b76d8cee190c2103151105f
>
> Cheers,
>
>
>> +CVE: CVE-2025-1181
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + bfd/elf-bfd.h      |  3 +++
>> + bfd/elf64-x86-64.c | 10 +++++-----
>> + bfd/elflink.c      | 24 ++++++++++++++++++++++++
>> + bfd/elfxx-x86.c    | 20 +++++++-------------
>> + 4 files changed, 39 insertions(+), 18 deletions(-)
>> +Index: binutils-2.38/bfd/elf-bfd.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- binutils-2.38.orig/bfd/elf-bfd.h
>> ++++ binutils-2.38/bfd/elf-bfd.h
>> +@@ -3007,6 +3007,9 @@ extern bool _bfd_elf_maybe_set_textrel
>> + extern bool _bfd_elf_add_dynamic_tags
>> +   (bfd *, struct bfd_link_info *, bool);
>> +
>> ++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
>> ++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *);
>> ++
>> + /* Large common section.  */
>> + extern asection _bfd_elf_large_com_section;
>> +
>> +Index: binutils-2.38/bfd/elf64-x86-64.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- binutils-2.38.orig/bfd/elf64-x86-64.c
>> ++++ binutils-2.38/bfd/elf64-x86-64.c
>> +@@ -1484,7 +1484,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd
>> +   bool to_reloc_pc32;
>> +   bool abs_symbol;
>> +   bool local_ref;
>> +-  asection *tsec;
>> ++  asection *tsec =3D NULL;
>> +   bfd_signed_vma raddend;
>> +   unsigned int opcode;
>> +   unsigned int modrm;
>> +@@ -1639,6 +1639,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd
>> +       return true;
>> +     }
>> +
>> ++  if (tsec =3D=3D NULL)
>> ++    return false;
>> ++
>> +   /* Don't convert GOTPCREL relocation against large section.  */
>> +   if (elf_section_data (tsec) !=3D  NULL
>> +       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) !=3D 0)
>> +@@ -1915,10 +1918,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struc
>> +       else
>> +       {
>> +         isym =3D NULL;
>> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
>> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-               || h->root.type =3D=3D bfd_link_hash_warning)
>> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++        h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx,
>> symtab_hdr);
>> +       }
>> +
>> +       /* Check invalid x32 relocations.  */
>> +Index: binutils-2.38/bfd/elflink.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- binutils-2.38.orig/bfd/elflink.c
>> ++++ binutils-2.38/bfd/elflink.c
>> +@@ -62,6 +62,27 @@ struct elf_find_verdep_info
>> + static bool _bfd_elf_fix_symbol_flags
>> +   (struct elf_link_hash_entry *, struct elf_info_failed *);
>> +
>> ++struct elf_link_hash_entry *
>> ++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashe=
s,
>> ++                            unsigned int                   symndx,
>> ++                            Elf_Internal_Shdr *            symtab_hdr)
>> ++{
>> ++  if (symndx < symtab_hdr->sh_info)
>> ++    return NULL;
>> ++
>> ++  struct elf_link_hash_entry *h =3D sym_hashes[symndx -
>> symtab_hdr->sh_info];
>> ++
>> ++  /* The hash might be empty.  See PR 32641 for an example of this.  *=
/
>> ++  if (h =3D=3D NULL)
>> ++    return NULL;
>> ++
>> ++  while (h->root.type =3D=3D bfd_link_hash_indirect
>> ++       || h->root.type =3D=3D bfd_link_hash_warning)
>> ++    h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++
>> ++  return h;
>> ++}
>> ++
>> + static struct elf_link_hash_entry *
>> + get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long
>> r_symndx)
>> + {
>> +@@ -75,6 +96,9 @@ get_ext_sym_hash (struct elf_reloc_cooki
>> +
>> +       h =3D cookie->sym_hashes[r_symndx - cookie->extsymoff];
>> +
>> ++      if (h =3D=3D NULL)
>> ++      return NULL;
>> ++
>> +       while (h->root.type =3D=3D bfd_link_hash_indirect
>> +            || h->root.type =3D=3D bfd_link_hash_warning)
>> +       h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> +Index: binutils-2.38/bfd/elfxx-x86.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- binutils-2.38.orig/bfd/elfxx-x86.c
>> ++++ binutils-2.38/bfd/elfxx-x86.c
>> +@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
>> +         goto error_return;
>> +       }
>> +
>> +-      if (r_symndx < symtab_hdr->sh_info)
>> +-      h =3D NULL;
>> +-      else
>> +-      {
>> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
>> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-               || h->root.type =3D=3D bfd_link_hash_warning)
>> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> +-      }
>> ++      h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx,
>> symtab_hdr);
>> +
>> +       if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r_type)
>> +         && NEED_DYNAMIC_RELOCATION_P (is_x86_64, info, true, h, sec,
>> +@@ -1200,10 +1192,12 @@ _bfd_x86_elf_link_relax_section (bfd *ab
>> +       else
>> +       {
>> +         /* Get H and SEC for GENERATE_DYNAMIC_RELOCATION_P below.  */
>> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
>> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-               || h->root.type =3D=3D bfd_link_hash_warning)
>> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++        h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx,
>> symtab_hdr);
>> ++        if (h =3D=3D NULL)
>> ++          {
>> ++            /* FIXMEL: Issue an error message ?  */
>> ++            continue;
>> ++          }
>> +
>> +         if (h->root.type =3D=3D bfd_link_hash_defined
>> +             || h->root.type =3D=3D bfd_link_hash_defweak)
>> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
>> b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
>> new file mode 100644
>> index 0000000000..2bcd55795d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
>> @@ -0,0 +1,342 @@
>> +Backported of:
>> +
>> +From 931494c9a89558acb36a03a340c01726545eef24 Mon Sep 17 00:00:00 2001
>> +From: Nick Clifton <nickc@redhat.com>
>> +Date: Wed, 5 Feb 2025 15:43:04 +0000
>> +Subject: [PATCH] Add even more checks for corrupt input when processing
>> + relocations for ELF files.
>> +
>> +PR 32643
>> +
>> +Upstream-Status: Backport [import from ubuntu
>> https://git.launchpad.net/ubuntu/+source/binutils/tree/debian/patches/CV=
E-2025-1181.patch?h=3Dubuntu/jammy-security
>> +Upstream commit
>> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D931494c9a=
89558acb36a03a340c01726545eef24
>> ]
>> +CVE: CVE-2025-1181
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +
>> +Index: binutils-2.38/bfd/elflink.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- binutils-2.38.orig/bfd/elflink.c
>> ++++ binutils-2.38/bfd/elflink.c
>> +@@ -62,15 +62,17 @@ struct elf_find_verdep_info
>> + static bool _bfd_elf_fix_symbol_flags
>> +   (struct elf_link_hash_entry *, struct elf_info_failed *);
>> +
>> +-struct elf_link_hash_entry *
>> +-_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashe=
s,
>> +-                            unsigned int                   symndx,
>> +-                            Elf_Internal_Shdr *            symtab_hdr)
>> ++static struct elf_link_hash_entry *
>> ++get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
>> ++                   unsigned int                   symndx,
>> ++                   unsigned int                   ext_sym_start)
>> + {
>> +-  if (symndx < symtab_hdr->sh_info)
>> ++  if (sym_hashes =3D=3D NULL
>> ++      /* Guard against corrupt input.  See PR 32636 for an example.  *=
/
>> ++      || symndx < ext_sym_start)
>> +     return NULL;
>> +
>> +-  struct elf_link_hash_entry *h =3D sym_hashes[symndx -
>> symtab_hdr->sh_info];
>> ++  struct elf_link_hash_entry *h =3D sym_hashes[symndx - ext_sym_start]=
;
>> +
>> +   /* The hash might be empty.  See PR 32641 for an example of this.  *=
/
>> +   if (h =3D=3D NULL)
>> +@@ -83,29 +85,28 @@ _bfd_elf_get_link_hash_entry (struct elf
>> +   return h;
>> + }
>> +
>> +-static struct elf_link_hash_entry *
>> +-get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long
>> r_symndx)
>> ++struct elf_link_hash_entry *
>> ++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashe=
s,
>> ++                            unsigned int                   symndx,
>> ++                            Elf_Internal_Shdr *            symtab_hdr)
>> + {
>> +-  struct elf_link_hash_entry *h =3D NULL;
>> +-
>> +-  if ((r_symndx >=3D cookie->locsymcount
>> +-       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) !=3D STB_LOC=
AL)
>> +-      /* Guard against corrupt input.  See PR 32636 for an example.  *=
/
>> +-      && r_symndx >=3D cookie->extsymoff)
>> +-    {
>> +-
>> +-      h =3D cookie->sym_hashes[r_symndx - cookie->extsymoff];
>> +-
>> +-      if (h =3D=3D NULL)
>> +-      return NULL;
>> ++  if (symtab_hdr =3D=3D NULL)
>> ++    return NULL;
>> +
>> +-      while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-           || h->root.type =3D=3D bfd_link_hash_warning)
>> +-      h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_info)=
;
>> ++}
>> +
>> +-    }
>> ++static struct elf_link_hash_entry *
>> ++get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsigne=
d
>> long r_symndx)
>> ++{
>> ++  if (cookie =3D=3D NULL || cookie->sym_hashes =3D=3D NULL)
>> ++    return NULL;
>> ++
>> ++  if (r_symndx >=3D cookie->locsymcount
>> ++      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) !=3D STB_LOCA=
L)
>> ++    return get_link_hash_entry (cookie->sym_hashes, r_symndx,
>> cookie->extsymoff);
>> +
>> +-  return h;
>> ++  return NULL;
>> + }
>> +
>> + asection *
>> +@@ -115,7 +116,7 @@ _bfd_elf_section_for_symbol (struct elf_
>> + {
>> +   struct elf_link_hash_entry *h;
>> +
>> +-  h =3D get_ext_sym_hash (cookie, r_symndx);
>> ++  h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);
>> +
>> +   if (h !=3D NULL)
>> +     {
>> +@@ -8783,7 +8784,6 @@ set_symbol_value (bfd *bfd_with_globals,
>> +                 size_t symidx,
>> +                 bfd_vma val)
>> + {
>> +-  struct elf_link_hash_entry **sym_hashes;
>> +   struct elf_link_hash_entry *h;
>> +   size_t extsymoff =3D locsymcount;
>> +
>> +@@ -8806,12 +8806,12 @@ set_symbol_value (bfd *bfd_with_globals,
>> +
>> +   /* It is a global symbol: set its link type
>> +      to "defined" and give it a value.  */
>> +-
>> +-  sym_hashes =3D elf_sym_hashes (bfd_with_globals);
>> +-  h =3D sym_hashes [symidx - extsymoff];
>> +-  while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-       || h->root.type =3D=3D bfd_link_hash_warning)
>> +-    h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++  h =3D get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symidx=
,
>> extsymoff);
>> ++  if (h =3D=3D NULL)
>> ++    {
>> ++      /* FIXMEL What should we do ?  */
>> ++      return;
>> ++    }
>> +   h->root.type =3D bfd_link_hash_defined;
>> +   h->root.u.def.value =3D val;
>> +   h->root.u.def.section =3D bfd_abs_section_ptr;
>> +@@ -11281,10 +11281,19 @@ elf_link_input_bfd (struct elf_final_lin
>> +             || (elf_bad_symtab (input_bfd)
>> +                 && flinfo->sections[symndx] =3D=3D NULL))
>> +           {
>> +-            struct elf_link_hash_entry *h =3D sym_hashes[symndx -
>> extsymoff];
>> +-            while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-                   || h->root.type =3D=3D bfd_link_hash_warning)
>> +-              h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
>> ++            struct elf_link_hash_entry *h;
>> ++
>> ++            h =3D get_link_hash_entry (sym_hashes, symndx, extsymoff);
>> ++            if (h =3D=3D NULL)
>> ++              {
>> ++                _bfd_error_handler
>> ++                  /* xgettext:c-format */
>> ++                  (_("error: %pB: unable to create group section
>> symbol"),
>> ++                   input_bfd);
>> ++                bfd_set_error (bfd_error_bad_value);
>> ++                return false;
>> ++              }
>> ++
>> +             /* Arrange for symbol to be output.  */
>> +             h->indx =3D -2;
>> +             elf_section_data (osec)->this_hdr.sh_info =3D -2;
>> +@@ -11411,7 +11420,7 @@ elf_link_input_bfd (struct elf_final_lin
>> +                 || (elf_bad_symtab (input_bfd)
>> +                     && flinfo->sections[r_symndx] =3D=3D NULL))
>> +               {
>> +-                h =3D sym_hashes[r_symndx - extsymoff];
>> ++                h =3D get_link_hash_entry (sym_hashes, r_symndx,
>> extsymoff);
>> +
>> +                 /* Badly formatted input files can contain relocs that
>> +                    reference non-existant symbols.  Check here so that
>> +@@ -11420,17 +11429,13 @@ elf_link_input_bfd (struct elf_final_lin
>> +                   {
>> +                     _bfd_error_handler
>> +                       /* xgettext:c-format */
>> +-                      (_("error: %pB contains a reloc (%#" PRIx64 ")
>> for section %pA "
>> ++                      (_("error: %pB contains a reloc (%#" PRIx64 ")
>> for section '%pA' "
>> +                          "that references a non-existent global
>> symbol"),
>> +                        input_bfd, (uint64_t) rel->r_info, o);
>> +                     bfd_set_error (bfd_error_bad_value);
>> +                     return false;
>> +                   }
>> +
>> +-                while (h->root.type =3D=3D bfd_link_hash_indirect
>> +-                       || h->root.type =3D=3D bfd_link_hash_warning)
>> +-                  h =3D (struct elf_link_hash_entry *) h->root.u.i.lin=
k;
>> +-
>> +                 s_type =3D h->type;
>> +
>> +                 /* If a plugin symbol is referenced from a non-IR file=
,
>> +@@ -11646,7 +11651,6 @@ elf_link_input_bfd (struct elf_final_lin
>> +                         && flinfo->sections[r_symndx] =3D=3D NULL))
>> +                   {
>> +                     struct elf_link_hash_entry *rh;
>> +-                    unsigned long indx;
>> +
>> +                     /* This is a reloc against a global symbol.  We
>> +                        have not yet output all the local symbols, so
>> +@@ -11655,15 +11659,16 @@ elf_link_input_bfd (struct elf_final_lin
>> +                        reloc to point to the global hash table entry
>> +                        for this symbol.  The symbol index is then
>> +                        set at the end of bfd_elf_final_link.  */
>> +-                    indx =3D r_symndx - extsymoff;
>> +-                    rh =3D elf_sym_hashes (input_bfd)[indx];
>> +-                    while (rh->root.type =3D=3D bfd_link_hash_indirect
>> +-                           || rh->root.type =3D=3D bfd_link_hash_warni=
ng)
>> +-                      rh =3D (struct elf_link_hash_entry *)
>> rh->root.u.i.link;
>> +-
>> +-                    /* Setting the index to -2 tells
>> +-                       elf_link_output_extsym that this symbol is
>> +-                       used by a reloc.  */
>> ++                    rh =3D get_link_hash_entry (elf_sym_hashes
>> (input_bfd),
>> ++                                              r_symndx, extsymoff);
>> ++                    if (rh =3D=3D NULL)
>> ++                      {
>> ++                        /* FIXME: Generate an error ?  */
>> ++                        continue;
>> ++                      }
>> ++
>> ++                    /* Setting the index to -2 tells
>> elf_link_output_extsym
>> ++                       that this symbol is used by a reloc.  */
>> +                     BFD_ASSERT (rh->indx < 0);
>> +                     rh->indx =3D -2;
>> +                     *rel_hash =3D rh;
>> +@@ -13615,25 +13620,21 @@ _bfd_elf_gc_mark_hook (asection *sec,
>> +                      struct elf_link_hash_entry *h,
>> +                      Elf_Internal_Sym *sym)
>> + {
>> +-  if (h !=3D NULL)
>> ++  if (h =3D=3D NULL)
>> ++    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
>> ++
>> ++  switch (h->root.type)
>> +     {
>> +-      switch (h->root.type)
>> +-      {
>> +-      case bfd_link_hash_defined:
>> +-      case bfd_link_hash_defweak:
>> +-        return h->root.u.def.section;
>> ++    case bfd_link_hash_defined:
>> ++    case bfd_link_hash_defweak:
>> ++      return h->root.u.def.section;
>> +
>> +-      case bfd_link_hash_common:
>> +-        return h->root.u.c.p->section;
>> ++    case bfd_link_hash_common:
>> ++      return h->root.u.c.p->section;
>> +
>> +-      default:
>> +-        break;
>> +-      }
>> ++    default:
>> ++      return NULL;
>> +     }
>> +-  else
>> +-    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
>> +-
>> +-  return NULL;
>> + }
>> +
>> + /* Return the debug definition section.  */
>> +@@ -13682,46 +13683,49 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_i
>> +   if (r_symndx =3D=3D STN_UNDEF)
>> +     return NULL;
>> +
>> +-  h =3D get_ext_sym_hash (cookie, r_symndx);
>> +-
>> +-  if (h !=3D NULL)
>> ++  h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);
>> ++  if (h =3D=3D NULL)
>> +     {
>> +-      bool was_marked;
>> ++      /* A corrup tinput file can lead to a situation where the index
>> ++       does not reference either a local or an external symbol.  */
>> ++      if (r_symndx >=3D cookie->locsymcount)
>> ++      return NULL;
>> +
>> +-      was_marked =3D h->mark;
>> +-      h->mark =3D 1;
>> +-      /* Keep all aliases of the symbol too.  If an object symbol
>> +-       needs to be copied into .dynbss then all of its aliases
>> +-       should be present as dynamic symbols, not just the one used
>> +-       on the copy relocation.  */
>> +-      hw =3D h;
>> +-      while (hw->is_weakalias)
>> +-      {
>> +-        hw =3D hw->u.alias;
>> +-        hw->mark =3D 1;
>> +-      }
>> ++      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
>> ++                            &cookie->locsyms[r_symndx]);
>> ++    }
>> +
>> +-      if (!was_marked && h->start_stop && !h->root.ldscript_def)
>> +-      {
>> +-        if (info->start_stop_gc)
>> +-          return NULL;
>> ++  bool was_marked =3D h->mark;
>> +
>> +-        /* To work around a glibc bug, mark XXX input sections
>> +-           when there is a reference to __start_XXX or __stop_XXX
>> +-           symbols.  */
>> +-        else if (start_stop !=3D NULL)
>> +-          {
>> +-            asection *s =3D h->u2.start_stop_section;
>> +-            *start_stop =3D true;
>> +-            return s;
>> +-          }
>> +-      }
>> ++  h->mark =3D 1;
>> ++  /* Keep all aliases of the symbol too.  If an object symbol
>> ++     needs to be copied into .dynbss then all of its aliases
>> ++     should be present as dynamic symbols, not just the one used
>> ++     on the copy relocation.  */
>> ++  hw =3D h;
>> ++  while (hw->is_weakalias)
>> ++    {
>> ++      hw =3D hw->u.alias;
>> ++      hw->mark =3D 1;
>> ++    }
>> +
>> +-      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
>> ++  if (!was_marked && h->start_stop && !h->root.ldscript_def)
>> ++    {
>> ++      if (info->start_stop_gc)
>> ++      return NULL;
>> ++
>> ++      /* To work around a glibc bug, mark XXX input sections
>> ++       when there is a reference to __start_XXX or __stop_XXX
>> ++       symbols.  */
>> ++      else if (start_stop !=3D NULL)
>> ++      {
>> ++        asection *s =3D h->u2.start_stop_section;
>> ++        *start_stop =3D true;
>> ++        return s;
>> ++      }
>> +     }
>> +
>> +-  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
>> +-                        &cookie->locsyms[r_symndx]);
>> ++  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
>> + }
>> +
>> + /* COOKIE->rel describes a relocation against section SEC, which is
>> +@@ -14735,7 +14739,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma
>> +
>> +       struct elf_link_hash_entry *h;
>> +
>> +-      h =3D get_ext_sym_hash (rcookie, r_symndx);
>> ++      h =3D get_ext_sym_hash_from_cookie (rcookie, r_symndx);
>> +
>> +       if (h !=3D NULL)
>> +       {
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#229329):
>> https://lists.openembedded.org/g/openembedded-core/message/229329
>> Mute This Topic: https://lists.openembedded.org/mt/117260475/4316185
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>

--000000000000a66a19064878b0d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Yoann,<br><br><span>My apologies for the over=
sight.</span><br><span>Thanks for taking care of this.<br><br></span></div>=
<span>Thanks &amp; Regards,<br></span></div><span>Vijay</span></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Jan 16, 2026 at 5:12=E2=80=AFAM Yoann Congal &lt;<a href=
=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v>Hello,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Le=C2=A0mer. 14 janv. 2026 =C3=A0=C2=A014:22, Vijay Anusuri via <a =
href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded=
.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembedded.org=
" target=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Vi=
jay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">va=
nusuri@mvista.com</a>&gt;<br>
<br>
import patch from ubuntu to fix<br>
=C2=A0CVE-2025-1181<br>
<br>
Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launch=
pad.net/ubuntu/+source/binutils/tree/debian/patches?h=3Dubuntu/jammy-securi=
ty" rel=3D"noreferrer" target=3D"_blank">https://git.launchpad.net/ubuntu/+=
source/binutils/tree/debian/patches?h=3Dubuntu/jammy-security</a><br>
Upstream commit<br>
<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D9=
31494c9a89558acb36a03a340c01726545eef24&amp;" rel=3D"noreferrer" target=3D"=
_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D9314=
94c9a89558acb36a03a340c01726545eef24<br>
&amp;</a><br>
<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D9=
31494c9a89558acb36a03a340c01726545eef24" rel=3D"noreferrer" target=3D"_blan=
k">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D931494c9a=
89558acb36a03a340c01726545eef24</a>]<br></blockquote><div><br></div><div>Th=
is is twice the same link, second link should be :=C2=A0<a href=3D"https://=
sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D18cc11a2771d9e401804=
85da9a4fb660c03efac3" target=3D"_blank">https://sourceware.org/git/gitweb.c=
gi?p=3Dbinutils-gdb.git;h=3D18cc11a2771d9e40180485da9a4fb660c03efac3</a></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../binutils/binutils-2.38.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../binutils/binutils/CVE-2025-1181-pre.patch | 149 ++++++++<br>
=C2=A0.../binutils/binutils/CVE-2025-1181.patch=C2=A0 =C2=A0 =C2=A0| 342 ++=
++++++++++++++++<br>
=C2=A03 files changed, 493 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1=
181-pre.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1=
181.patch<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipe=
s-devtools/binutils/binutils-2.38.inc<br>
index d5ad3c0ecb..63bd65c59c 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc<br>
@@ -86,5 +86,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 file://0047-CVE-2025-8225.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://CVE-2025-11412.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://CVE-2025-11413.patch \<br>
+=C2=A0 =C2=A0 =C2=A0file://CVE-2025-1181-pre.patch \<br>
+=C2=A0 =C2=A0 =C2=A0file://CVE-2025-1181.patch \<br>
=C2=A0&quot;<br>
=C2=A0S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patc=
h b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch<br>
new file mode 100644<br>
index 0000000000..dc9e9b624e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch<br>
@@ -0,0 +1,149 @@<br>
+Backported of:<br>
+<br>
+From 18cc11a2771d9e40180485da9a4fb660c03efac3 Mon Sep 17 00:00:00 2001<br>
+From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com" target=3D"_blan=
k">nickc@redhat.com</a>&gt;<br>
+Date: Wed, 5 Feb 2025 14:31:10 +0000<br>
+Subject: [PATCH] Prevent illegal memory access when checking relocs in a<b=
r>
+ corrupt ELF binary.<br>
+<br>
+PR 32641<br>
+<br>
+Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launc=
hpad.net/ubuntu/+source/binutils/tree/debian/patches/CVE-2025-1181-pre.patc=
h?h=3Dubuntu/jammy-security" rel=3D"noreferrer" target=3D"_blank">https://g=
it.launchpad.net/ubuntu/+source/binutils/tree/debian/patches/CVE-2025-1181-=
pre.patch?h=3Dubuntu/jammy-security</a><br>
+Upstream commit <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D931494c9a89558acb36a03a340c01726545eef24" rel=3D"noreferrer=
" target=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.=
git;h=3D931494c9a89558acb36a03a340c01726545eef24</a>]<br></blockquote><div>=
Upstream commit of this patch is=C2=A0<a href=3D"https://sourceware.org/git=
/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D18cc11a2771d9e40180485da9a4fb660c03efa=
c3" target=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gd=
b.git;h=3D18cc11a2771d9e40180485da9a4fb660c03efac3</a></div><div><br></div>=
<div>Since this is not a major issue, I have fixed both in my branch :=C2=
=A0<a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit=
/?h=3Dstable/kirkstone-nut&amp;id=3Dc673f64e4e6f856c7b76d8cee190c2103151105=
f" target=3D"_blank">https://git.openembedded.org/openembedded-core-contrib=
/commit/?h=3Dstable/kirkstone-nut&amp;id=3Dc673f64e4e6f856c7b76d8cee190c210=
3151105f</a></div><div><br></div><div>Cheers,</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+CVE: CVE-2025-1181<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ bfd/elf-bfd.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
+ bfd/elf64-x86-64.c | 10 +++++-----<br>
+ bfd/elflink.c=C2=A0 =C2=A0 =C2=A0 | 24 ++++++++++++++++++++++++<br>
+ bfd/elfxx-x86.c=C2=A0 =C2=A0 | 20 +++++++-------------<br>
+ 4 files changed, 39 insertions(+), 18 deletions(-)<br>
+Index: binutils-2.38/bfd/elf-bfd.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- binutils-2.38.orig/bfd/elf-bfd.h<br>
++++ binutils-2.38/bfd/elf-bfd.h<br>
+@@ -3007,6 +3007,9 @@ extern bool _bfd_elf_maybe_set_textrel<br>
+ extern bool _bfd_elf_add_dynamic_tags<br>
+=C2=A0 =C2=A0(bfd *, struct bfd_link_info *, bool);<br>
+ <br>
++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry<br>
++=C2=A0 (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *)=
;<br>
++<br>
+ /* Large common section.=C2=A0 */<br>
+ extern asection _bfd_elf_large_com_section;<br>
+ <br>
+Index: binutils-2.38/bfd/elf64-x86-64.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- binutils-2.38.orig/bfd/elf64-x86-64.c<br>
++++ binutils-2.38/bfd/elf64-x86-64.c<br>
+@@ -1484,7 +1484,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd<br>
+=C2=A0 =C2=A0bool to_reloc_pc32;<br>
+=C2=A0 =C2=A0bool abs_symbol;<br>
+=C2=A0 =C2=A0bool local_ref;<br>
+-=C2=A0 asection *tsec;<br>
++=C2=A0 asection *tsec =3D NULL;<br>
+=C2=A0 =C2=A0bfd_signed_vma raddend;<br>
+=C2=A0 =C2=A0unsigned int opcode;<br>
+=C2=A0 =C2=A0unsigned int modrm;<br>
+@@ -1639,6 +1639,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 if (tsec =3D=3D NULL)<br>
++=C2=A0 =C2=A0 return false;<br>
++<br>
+=C2=A0 =C2=A0/* Don&#39;t convert GOTPCREL relocation against large sectio=
n.=C2=A0 */<br>
+=C2=A0 =C2=A0if (elf_section_data (tsec) !=3D=C2=A0 NULL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (elf_section_flags (tsec) &amp; SHF_=
X86_64_LARGE) !=3D 0)<br>
+@@ -1915,10 +1918,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isym =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D sym_hashes[r_symndx - symtab_hdr-&gt;sh=
_info];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (h-&gt;root.type =3D=3D bfd_link_hash_i=
ndirect<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| h-&gt;root.type=
 =3D=3D bfd_link_hash_warning)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D (struct elf_link_hash_entry *) h=
-&gt;root.u.i.link;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D _bfd_elf_get_link_hash_entry (sym_hashe=
s, r_symndx, symtab_hdr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check invalid x32 relocations.=C2=A0 */<br>
+Index: binutils-2.38/bfd/elflink.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- binutils-2.38.orig/bfd/elflink.c<br>
++++ binutils-2.38/bfd/elflink.c<br>
+@@ -62,6 +62,27 @@ struct elf_find_verdep_info<br>
+ static bool _bfd_elf_fix_symbol_flags<br>
+=C2=A0 =C2=A0(struct elf_link_hash_entry *, struct elf_info_failed *);<br>
+ <br>
++struct elf_link_hash_entry *<br>
++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **=C2=A0 sym_has=
hes,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symndx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Elf_Internal_Shdr *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 symtab_hdr)<br>
++{<br>
++=C2=A0 if (symndx &lt; symtab_hdr-&gt;sh_info)<br>
++=C2=A0 =C2=A0 return NULL;<br>
++<br>
++=C2=A0 struct elf_link_hash_entry *h =3D sym_hashes[symndx - symtab_hdr-&=
gt;sh_info];<br>
++<br>
++=C2=A0 /* The hash might be empty.=C2=A0 See PR 32641 for an example of t=
his.=C2=A0 */<br>
++=C2=A0 if (h =3D=3D NULL)<br>
++=C2=A0 =C2=A0 return NULL;<br>
++<br>
++=C2=A0 while (h-&gt;root.type =3D=3D bfd_link_hash_indirect<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0|| h-&gt;root.type =3D=3D bfd_link_hash_warnin=
g)<br>
++=C2=A0 =C2=A0 h =3D (struct elf_link_hash_entry *) h-&gt;root.u.i.link;<b=
r>
++<br>
++=C2=A0 return h;<br>
++}<br>
++<br>
+ static struct elf_link_hash_entry *<br>
+ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx=
)<br>
+ {<br>
+@@ -75,6 +96,9 @@ get_ext_sym_hash (struct elf_reloc_cooki<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0h =3D cookie-&gt;sym_hashes[r_symndx - cookie-&=
gt;extsymoff];<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 if (h =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (h-&gt;root.type =3D=3D bfd_link_hash_ind=
irect<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || h-&gt;root.type =3D=3D bfd_li=
nk_hash_warning)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0h =3D (struct elf_link_hash_entry *) h-&gt;root=
.u.i.link;<br>
+Index: binutils-2.38/bfd/elfxx-x86.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- binutils-2.38.orig/bfd/elfxx-x86.c<br>
++++ binutils-2.38/bfd/elfxx-x86.c<br>
+@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if (r_symndx &lt; symtab_hdr-&gt;sh_info)<br>
+-=C2=A0 =C2=A0 =C2=A0 h =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D sym_hashes[r_symndx - symtab_hdr-&gt;sh=
_info];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (h-&gt;root.type =3D=3D bfd_link_hash_i=
ndirect<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| h-&gt;root.type=
 =3D=3D bfd_link_hash_warning)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D (struct elf_link_hash_entry *) h=
-&gt;root.u.i.link;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_sy=
mndx, symtab_hdr);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r=
_type)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; NEED_DYNAMIC_RELOCATION_P (is=
_x86_64, info, true, h, sec,<br>
+@@ -1200,10 +1192,12 @@ _bfd_x86_elf_link_relax_section (bfd *ab<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get H and SEC for GENERATE_DYNAMIC_RE=
LOCATION_P below.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D sym_hashes[r_symndx - symtab_hdr-&gt;sh=
_info];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (h-&gt;root.type =3D=3D bfd_link_hash_i=
ndirect<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| h-&gt;root.type=
 =3D=3D bfd_link_hash_warning)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D (struct elf_link_hash_entry *) h=
-&gt;root.u.i.link;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D _bfd_elf_get_link_hash_entry (sym_hashe=
s, r_symndx, symtab_hdr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (h =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXMEL: Issue an error messa=
ge ?=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (h-&gt;root.type =3D=3D bfd_link_hash=
_defined<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| h-&gt;root.type =3D=3D =
bfd_link_hash_defweak)<br>
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch b/=
meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch<br>
new file mode 100644<br>
index 0000000000..2bcd55795d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch<br>
@@ -0,0 +1,342 @@<br>
+Backported of:<br>
+<br>
+From 931494c9a89558acb36a03a340c01726545eef24 Mon Sep 17 00:00:00 2001<br>
+From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com" target=3D"_blan=
k">nickc@redhat.com</a>&gt;<br>
+Date: Wed, 5 Feb 2025 15:43:04 +0000<br>
+Subject: [PATCH] Add even more checks for corrupt input when processing<br=
>
+ relocations for ELF files.<br>
+<br>
+PR 32643<br>
+<br>
+Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launc=
hpad.net/ubuntu/+source/binutils/tree/debian/patches/CVE-2025-1181.patch?h=
=3Dubuntu/jammy-security" rel=3D"noreferrer" target=3D"_blank">https://git.=
launchpad.net/ubuntu/+source/binutils/tree/debian/patches/CVE-2025-1181.pat=
ch?h=3Dubuntu/jammy-security</a><br>
+Upstream commit <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D931494c9a89558acb36a03a340c01726545eef24" rel=3D"noreferrer=
" target=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.=
git;h=3D931494c9a89558acb36a03a340c01726545eef24</a>]<br>
+CVE: CVE-2025-1181<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+<br>
+Index: binutils-2.38/bfd/elflink.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- binutils-2.38.orig/bfd/elflink.c<br>
++++ binutils-2.38/bfd/elflink.c<br>
+@@ -62,15 +62,17 @@ struct elf_find_verdep_info<br>
+ static bool _bfd_elf_fix_symbol_flags<br>
+=C2=A0 =C2=A0(struct elf_link_hash_entry *, struct elf_info_failed *);<br>
+ <br>
+-struct elf_link_hash_entry *<br>
+-_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **=C2=A0 sym_has=
hes,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symndx,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Elf_Internal_Shdr *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 symtab_hdr)<br>
++static struct elf_link_hash_entry *<br>
++get_link_hash_entry (struct elf_link_hash_entry **=C2=A0 sym_hashes,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsi=
gned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0symndx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsi=
gned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ext_sym_start)<br>
+ {<br>
+-=C2=A0 if (symndx &lt; symtab_hdr-&gt;sh_info)<br>
++=C2=A0 if (sym_hashes =3D=3D NULL<br>
++=C2=A0 =C2=A0 =C2=A0 /* Guard against corrupt input.=C2=A0 See PR 32636 f=
or an example.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 || symndx &lt; ext_sym_start)<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+ <br>
+-=C2=A0 struct elf_link_hash_entry *h =3D sym_hashes[symndx - symtab_hdr-&=
gt;sh_info];<br>
++=C2=A0 struct elf_link_hash_entry *h =3D sym_hashes[symndx - ext_sym_star=
t];<br>
+ <br>
+=C2=A0 =C2=A0/* The hash might be empty.=C2=A0 See PR 32641 for an example=
 of this.=C2=A0 */<br>
+=C2=A0 =C2=A0if (h =3D=3D NULL)<br>
+@@ -83,29 +85,28 @@ _bfd_elf_get_link_hash_entry (struct elf<br>
+=C2=A0 =C2=A0return h;<br>
+ }<br>
+ <br>
+-static struct elf_link_hash_entry *<br>
+-get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx=
)<br>
++struct elf_link_hash_entry *<br>
++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **=C2=A0 sym_has=
hes,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symndx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Elf_Internal_Shdr *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 symtab_hdr)<br>
+ {<br>
+-=C2=A0 struct elf_link_hash_entry *h =3D NULL;<br>
+-<br>
+-=C2=A0 if ((r_symndx &gt;=3D cookie-&gt;locsymcount<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0|| ELF_ST_BIND (cookie-&gt;locsyms[r_symndx].s=
t_info) !=3D STB_LOCAL)<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Guard against corrupt input.=C2=A0 See PR 32636 f=
or an example.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 &amp;&amp; r_symndx &gt;=3D cookie-&gt;extsymoff)<br=
>
+-=C2=A0 =C2=A0 {<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 h =3D cookie-&gt;sym_hashes[r_symndx - cookie-&gt;ex=
tsymoff];<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (h =3D=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 if (symtab_hdr =3D=3D NULL)<br>
++=C2=A0 =C2=A0 return NULL;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 while (h-&gt;root.type =3D=3D bfd_link_hash_indirect=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| h-&gt;root.type =3D=3D bfd_li=
nk_hash_warning)<br>
+-=C2=A0 =C2=A0 =C2=A0 h =3D (struct elf_link_hash_entry *) h-&gt;root.u.i.=
link;<br>
++=C2=A0 return get_link_hash_entry (sym_hashes, symndx, symtab_hdr-&gt;sh_=
info);<br>
++}<br>
+ <br>
+-=C2=A0 =C2=A0 }<br>
++static struct elf_link_hash_entry *<br>
++get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsigned l=
ong r_symndx)<br>
++{<br>
++=C2=A0 if (cookie =3D=3D NULL || cookie-&gt;sym_hashes =3D=3D NULL)<br>
++=C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 <br>
++=C2=A0 if (r_symndx &gt;=3D cookie-&gt;locsymcount<br>
++=C2=A0 =C2=A0 =C2=A0 || ELF_ST_BIND (cookie-&gt;locsyms[r_symndx].st_info=
) !=3D STB_LOCAL)<br>
++=C2=A0 =C2=A0 return get_link_hash_entry (cookie-&gt;sym_hashes, r_symndx=
, cookie-&gt;extsymoff);<br>
+ <br>
+-=C2=A0 return h;<br>
++=C2=A0 return NULL;<br>
+ }<br>
+=C2=A0 <br>
+ asection *<br>
+@@ -115,7 +116,7 @@ _bfd_elf_section_for_symbol (struct elf_<br>
+ {<br>
+=C2=A0 =C2=A0struct elf_link_hash_entry *h;<br>
+ <br>
+-=C2=A0 h =3D get_ext_sym_hash (cookie, r_symndx);<br>
++=C2=A0 h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);<br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0if (h !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -8783,7 +8784,6 @@ set_symbol_value (bfd *bfd_with_globals,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t symid=
x,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_vma val)=
<br>
+ {<br>
+-=C2=A0 struct elf_link_hash_entry **sym_hashes;<br>
+=C2=A0 =C2=A0struct elf_link_hash_entry *h;<br>
+=C2=A0 =C2=A0size_t extsymoff =3D locsymcount;<br>
+ <br>
+@@ -8806,12 +8806,12 @@ set_symbol_value (bfd *bfd_with_globals,<br>
+ <br>
+=C2=A0 =C2=A0/* It is a global symbol: set its link type<br>
+=C2=A0 =C2=A0 =C2=A0 to &quot;defined&quot; and give it a value.=C2=A0 */<=
br>
+-<br>
+-=C2=A0 sym_hashes =3D elf_sym_hashes (bfd_with_globals);<br>
+-=C2=A0 h =3D sym_hashes [symidx - extsymoff];<br>
+-=C2=A0 while (h-&gt;root.type =3D=3D bfd_link_hash_indirect<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0|| h-&gt;root.type =3D=3D bfd_link_hash_warnin=
g)<br>
+-=C2=A0 =C2=A0 h =3D (struct elf_link_hash_entry *) h-&gt;root.u.i.link;<b=
r>
++=C2=A0 h =3D get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symi=
dx, extsymoff);<br>
++=C2=A0 if (h =3D=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* FIXMEL What should we do ?=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0h-&gt;root.type =3D bfd_link_hash_defined;<br>
+=C2=A0 =C2=A0h-&gt;root.u.def.value =3D val;<br>
+=C2=A0 =C2=A0h-&gt;root.u.def.section =3D bfd_abs_section_ptr;<br>
+@@ -11281,10 +11281,19 @@ elf_link_input_bfd (struct elf_final_lin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (elf_bad_symtab (input_=
bfd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; f=
linfo-&gt;sections[symndx] =3D=3D NULL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct elf_link_hash_entry *h =
=3D sym_hashes[symndx - extsymoff];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (h-&gt;root.type =3D=3D b=
fd_link_hash_indirect<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| h=
-&gt;root.type =3D=3D bfd_link_hash_warning)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D (struct elf_link_h=
ash_entry *) h-&gt;root.u.i.link;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct elf_link_hash_entry *h;<=
br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D get_link_hash_entry (sym_=
hashes, symndx, extsymoff);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (h =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _bfd_error_handle=
r<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* xgettex=
t:c-format */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_(&quot;e=
rror: %pB: unable to create group section symbol&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inpu=
t_bfd);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd_set_error (bf=
d_error_bad_value);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Arrange for symbol to b=
e output.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h-&gt;indx =3D -2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_section_data (osec)-&g=
t;this_hdr.sh_info =3D -2;<br>
+@@ -11411,7 +11420,7 @@ elf_link_input_bfd (struct elf_final_lin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (elf_bad_=
symtab (input_bfd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;&amp; flinfo-&gt;sections[r_symndx] =3D=3D NULL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D sym_hashes[=
r_symndx - extsymoff];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D get_link_ha=
sh_entry (sym_hashes, r_symndx, extsymoff);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Badly for=
matted input files can contain relocs that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 refe=
rence non-existant symbols.=C2=A0 Check here so that<br>
+@@ -11420,17 +11429,13 @@ elf_link_input_bfd (struct elf_final_lin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0_bfd_error_handler<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* xgettext:c-format */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (_(&quot;error: %pB contains a reloc (%#&quot; PRIx64 &quot;) for secti=
on %pA &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (_(&quot;error: %pB contains a reloc (%#&quot; PRIx64 &quot;) for secti=
on &#39;%pA&#39; &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;that references a non-existent global symbol&quot;)=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 input_bfd, (uint64_t) rel-&gt;r_info, o);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bfd_set_error (bfd_error_bad_value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (h-&gt;root=
.type =3D=3D bfd_link_hash_indirect<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|| h-&gt;root.type =3D=3D bfd_link_hash_warning)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D (str=
uct elf_link_hash_entry *) h-&gt;root.u.i.link;<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s_type =3D h=
-&gt;type;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If a plug=
in symbol is referenced from a non-IR file,<br>
+@@ -11646,7 +11651,6 @@ elf_link_input_bfd (struct elf_final_lin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;&amp; flinfo-&gt;sections[r_symndx] =3D=3D NULL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct elf_link_hash_entry *rh;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uns=
igned long indx;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* This is a reloc against a global symbol.=C2=A0 We<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 have not yet output all the local symbols, so<br>
+@@ -11655,15 +11659,16 @@ elf_link_input_bfd (struct elf_final_lin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 reloc to point to the global hash table entry<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for this symbol.=C2=A0 The symbol index is then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 set at the end of bfd_elf_final_link.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ind=
x =3D r_symndx - extsymoff;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rh =
=3D elf_sym_hashes (input_bfd)[indx];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 whi=
le (rh-&gt;root.type =3D=3D bfd_link_hash_indirect<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|| rh-&gt;root.type =3D=3D bfd_link_hash_warning)<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rh =3D (struct elf_link_hash_entry *) rh-&gt;root.u.i.link;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Setting the index to -2 tells<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0elf_link_output_extsym that this symbol is<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0used by a reloc.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rh =
=3D get_link_hash_entry (elf_sym_hashes (input_bfd),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 r_symndx, extsymoff);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(rh =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* FIXME: Generate an error ?=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Setting the index to -2 tells elf_link_output_extsym<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0that this symbol is used by a reloc.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BFD_ASSERT (rh-&gt;indx &lt; 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rh-&gt;indx =3D -2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*rel_hash =3D rh;<br>
+@@ -13615,25 +13620,21 @@ _bfd_elf_gc_mark_hook (asection *sec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct elf_link_hash_entry *h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Elf_Internal_Sym *sym)<br>
+ {<br>
+-=C2=A0 if (h !=3D NULL)<br>
++=C2=A0 if (h =3D=3D NULL)<br>
++=C2=A0 =C2=A0 return bfd_section_from_elf_index (sec-&gt;owner, sym-&gt;s=
t_shndx);<br>
++<br>
++=C2=A0 switch (h-&gt;root.type)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 switch (h-&gt;root.type)<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 case bfd_link_hash_defined:<br>
+-=C2=A0 =C2=A0 =C2=A0 case bfd_link_hash_defweak:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return h-&gt;root.u.def.section;<br>
++=C2=A0 =C2=A0 case bfd_link_hash_defined:<br>
++=C2=A0 =C2=A0 case bfd_link_hash_defweak:<br>
++=C2=A0 =C2=A0 =C2=A0 return h-&gt;root.u.def.section;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 case bfd_link_hash_common:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return h-&gt;root.u.c.p-&gt;section;<br>
++=C2=A0 =C2=A0 case bfd_link_hash_common:<br>
++=C2=A0 =C2=A0 =C2=A0 return h-&gt;root.u.c.p-&gt;section;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 default:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 else<br>
+-=C2=A0 =C2=A0 return bfd_section_from_elf_index (sec-&gt;owner, sym-&gt;s=
t_shndx);<br>
+-<br>
+-=C2=A0 return NULL;<br>
+ }<br>
+ <br>
+ /* Return the debug definition section.=C2=A0 */<br>
+@@ -13682,46 +13683,49 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_i<br>
+=C2=A0 =C2=A0if (r_symndx =3D=3D STN_UNDEF)<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+ <br>
+-=C2=A0 h =3D get_ext_sym_hash (cookie, r_symndx);<br>
+-=C2=A0 <br>
+-=C2=A0 if (h !=3D NULL)<br>
++=C2=A0 h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);<br>
++=C2=A0 if (h =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 bool was_marked;<br>
++=C2=A0 =C2=A0 =C2=A0 /* A corrup tinput file can lead to a situation wher=
e the index<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0does not reference either a local or an extern=
al symbol.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (r_symndx &gt;=3D cookie-&gt;locsymcount)<br>
++=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 was_marked =3D h-&gt;mark;<br>
+-=C2=A0 =C2=A0 =C2=A0 h-&gt;mark =3D 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Keep all aliases of the symbol too.=C2=A0 If an o=
bject symbol<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0needs to be copied into .dynbss then all of it=
s aliases<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0should be present as dynamic symbols, not just=
 the one used<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0on the copy relocation.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 hw =3D h;<br>
+-=C2=A0 =C2=A0 =C2=A0 while (hw-&gt;is_weakalias)<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw =3D hw-&gt;u.alias;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw-&gt;mark =3D 1;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return (*gc_mark_hook) (sec, info, cookie-&gt;rel, N=
ULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;cookie-&gt;locsyms[r_symndx]);<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if (!was_marked &amp;&amp; h-&gt;start_stop &amp;&am=
p; !h-&gt;root.ldscript_def)<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;start_stop_gc)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 bool was_marked =3D h-&gt;mark;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* To work around a glibc bug, mark XXX input=
 sections<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0when there is a reference to __s=
tart_XXX or __stop_XXX<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symbols.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (start_stop !=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asection *s =3D h-&gt;u2.start_=
stop_section;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *start_stop =3D true;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 h-&gt;mark =3D 1;<br>
++=C2=A0 /* Keep all aliases of the symbol too.=C2=A0 If an object symbol<b=
r>
++=C2=A0 =C2=A0 =C2=A0needs to be copied into .dynbss then all of its alias=
es<br>
++=C2=A0 =C2=A0 =C2=A0should be present as dynamic symbols, not just the on=
e used<br>
++=C2=A0 =C2=A0 =C2=A0on the copy relocation.=C2=A0 */<br>
++=C2=A0 hw =3D h;<br>
++=C2=A0 while (hw-&gt;is_weakalias)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 hw =3D hw-&gt;u.alias;<br>
++=C2=A0 =C2=A0 =C2=A0 hw-&gt;mark =3D 1;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 return (*gc_mark_hook) (sec, info, cookie-&gt;rel, h=
, NULL);<br>
++=C2=A0 if (!was_marked &amp;&amp; h-&gt;start_stop &amp;&amp; !h-&gt;root=
.ldscript_def)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (info-&gt;start_stop_gc)<br>
++=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* To work around a glibc bug, mark XXX input sectio=
ns<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0when there is a reference to __start_XXX or __=
stop_XXX<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0symbols.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 else if (start_stop !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 asection *s =3D h-&gt;u2.start_stop_section;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *start_stop =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 return (*gc_mark_hook) (sec, info, cookie-&gt;rel, NULL,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;cookie-&gt;locsyms[r_symndx]);<br>
++=C2=A0 return (*gc_mark_hook) (sec, info, cookie-&gt;rel, h, NULL);<br>
+ }<br>
+ <br>
+ /* COOKIE-&gt;rel describes a relocation against section SEC, which is<br=
>
+@@ -14735,7 +14739,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct elf_link_hash_entry *h;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 h =3D get_ext_sym_hash (rcookie, r_symndx);<br>
++=C2=A0 =C2=A0 =C2=A0 h =3D get_ext_sym_hash_from_cookie (rcookie, r_symnd=
x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (h !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229329): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229329" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229329</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117260475/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117260475/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div>

--000000000000a66a19064878b0d5--

