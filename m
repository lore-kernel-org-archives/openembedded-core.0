Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44D3C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 20:15:01 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.267.1748981695268162770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 13:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBNC6b4q;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-708d90aa8f9so55914207b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 13:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748981694; x=1749586494; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpHoN5mg6rZqVKVJdOjsIrL/g84YXoewu4gniYaEer4=;
        b=KBNC6b4qZVKYDuiHi2T9rfBOScyq2OouhqfPy8ZbYI3rWFvpt98uxCdcI0mgp7n4gy
         Y8daiapCykWuHpLU8JIWUIdrDSJoZe+kzKXQ4VXPH/PKMAF8hhi6SjJNKZbSIPhQUNNm
         I8hoHfwj2wWZKsH5BSOhN++aW7CwBzop/9YujipnL1bl2B5uelgyuaq/+PoQAOcybXlc
         641/P1vPalGWZWJ8V9eoRr9WAfbBSvUjlQnzYg5Q5IZ9V8vh05yeXc+/jj39PfzJOZjZ
         GwU1TQ841xMcgMkTIaRv5o3FFbYjgRPiy4jpj3V3G0pqLPubuts1R8HU2VfelQJNUtq6
         2zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748981694; x=1749586494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpHoN5mg6rZqVKVJdOjsIrL/g84YXoewu4gniYaEer4=;
        b=Fvh/30pdCYZFAHhFqjGJ4FEhy/asNz4asWqwvlB28pBjwdYYpRJwaYhFKu+1m/3jp9
         P1GjlnmB0U4E8/nl/IscesHLWlfi9svwhPn2uaF69Flx8p51ERgpyODODA3oWCbfcZlz
         UfSleTVufS5FdLrvAbW5w2c8/ibnxmLd3U3YyzgZItFtz2FOBgxSw1VdfZyOoiIqJK8c
         dOlQy4ULmTRNU7U0/Zt03YVyzWGoNNnRv1fNsxH4v0Hw+E9d7q4o0O2LJRkkGTNfH4A5
         1lb0staQM+OsH8XMv5WJu9vkFKPaTBOi0DnY0NGDRlRP0vzECBZFprtJe5ysSJwQ8cPN
         kghQ==
X-Gm-Message-State: AOJu0YyzxGvrRqssCONakOV0XcA8esaFaDjgn6e6qM9tPYxkKX60zaMi
	aP5Jm/USg9kYRGtVzDrHfO4i3eqwlljHxqLBtzwxDEvTQHmBhMBdYwz3xQ7kP0RW0Q7A7UoE/RC
	+qdnsVGQsAdG0Wzj24YvTCwMSqZJbN+aAWw==
X-Gm-Gg: ASbGnctm0+h4gP7XbMiQCxFOggSpiae8i4Fg5cF+N1n747lP+IW/uGpcOLi6JZBXEyJ
	+32FiZM6EtfmFysO8Fsc2FY4U82Je2EgkPDtboVu2LLFdYZIEQTt7kXVmCdBwCOvUnyihAnjDyN
	eiP/1TiqcOodjs63qBVe7CMV4Qbw5N1C0=
X-Google-Smtp-Source: AGHT+IHYOch/Kb02W/miXJRelOj+7sRgTlc+kegnN5Gc6TulbGsnP7uZLiXcW0uw1PS0CYs84w1FEn96dDYBNmjoIQ4=
X-Received: by 2002:a05:690c:4d81:b0:70f:83ef:de26 with SMTP id
 00721157ae682-710d99f463dmr2221647b3.11.1748981694095; Tue, 03 Jun 2025
 13:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250603062637.2915962-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250603062637.2915962-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jun 2025 13:14:27 -0700
X-Gm-Features: AX0GCFteqlP6QhAq_l_CYAwNtdRAkZWcwbLlkSHG_nFgv2lLSg284VpecUfiaYQ
Message-ID: <CAMKF1soy2iP-vv_CMHC0tYvT3OjHS5xSXWEW8srcbjpxhRpyEg@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] binutils: Fix CVE-2025-1181
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 20:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217822

On Mon, Jun 2, 2025 at 11:26=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> PR 32641 [https://sourceware.org/bugzilla/show_bug.cgi?id=3D32641]
> PR 32643 [https://sourceware.org/bugzilla/show_bug.cgi?id=3D32643]

LGTM, second patch does have some questions on bugzilla we should
watchout for those to resolve along side.

>
> Upstream-Status: Backport
> [https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D18cc=
11a2771d9e40180485da9a4fb660c03efac3
> && https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D93=
1494c9a89558acb36a03a340c01726545eef24]
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../binutils/binutils-2.44.inc                |   2 +
>  .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
>  .../binutils/0017-CVE-2025-1181-2.patch       | 337 ++++++++++++++++++
>  3 files changed, 480 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025=
-1181-1.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2025=
-1181-2.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/reci=
pes-devtools/binutils/binutils-2.44.inc
> index 6906ab3efb..46a95838b7 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
> @@ -37,5 +37,7 @@ SRC_URI =3D "\
>       file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
>       file://0015-CVE-2025-1178.patch \
>       file://CVE-2025-1180.patch \
> +     file://0016-CVE-2025-1181-1.patch \
> +     file://0017-CVE-2025-1181-2.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1=
.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
> new file mode 100644
> index 0000000000..d3709c7a4f
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
> @@ -0,0 +1,141 @@
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Wed, 5 Feb 2025 14:31:10 +0000
> +
> +Prevent illegal memory access when checking relocs in a corrupt ELF bina=
ry.
> +
> +PR 32641
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3D18cc11a2771d9e40180485da9a4fb660c03efac3]
> +CVE: CVE-2025-1181
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +
> +diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
> +index 785a37dd7fd..d2bf8e5cbae 100644
> +--- a/bfd/elf-bfd.h
> ++++ b/bfd/elf-bfd.h
> +@@ -3150,6 +3150,9 @@ extern bool _bfd_elf_link_mmap_section_contents
> + extern void _bfd_elf_link_munmap_section_contents
> +   (asection *);
> +
> ++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
> ++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *);
> ++
> + /* Large common section.  */
> + extern asection _bfd_elf_large_com_section;
> +
> +diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
> +index 32db254ba6c..2d82c6583c3 100644
> +--- a/bfd/elf64-x86-64.c
> ++++ b/bfd/elf64-x86-64.c
> +@@ -1744,7 +1744,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
> +   bool to_reloc_pc32;
> +   bool abs_symbol;
> +   bool local_ref;
> +-  asection *tsec;
> ++  asection *tsec =3D NULL;
> +   bfd_signed_vma raddend;
> +   unsigned int opcode;
> +   unsigned int modrm;
> +@@ -1910,6 +1910,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
> +       return true;
> +     }
> +
> ++  if (tsec =3D=3D NULL)
> ++    return false;
> ++
> +   /* Don't convert GOTPCREL relocation against large section.  */
> +   if (elf_section_data (tsec) !=3D  NULL
> +       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) !=3D 0)
> +@@ -2206,10 +2209,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_lin=
k_info *info,
> +       else
> +       {
> +         isym =3D NULL;
> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
> +-               || h->root.type =3D=3D bfd_link_hash_warning)
> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> ++        h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symta=
b_hdr);
> +       }
> +
> +       /* Check invalid x32 relocations.  */
> +diff --git a/bfd/elflink.c b/bfd/elflink.c
> +index 1f1263007c0..eafbd133ff5 100644
> +--- a/bfd/elflink.c
> ++++ b/bfd/elflink.c
> +@@ -96,6 +96,27 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info=
)
> +   return true;
> + }
> +
> ++struct elf_link_hash_entry *
> ++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes=
,
> ++                            unsigned int                   symndx,
> ++                            Elf_Internal_Shdr *            symtab_hdr)
> ++{
> ++  if (symndx < symtab_hdr->sh_info)
> ++    return NULL;
> ++
> ++  struct elf_link_hash_entry *h =3D sym_hashes[symndx - symtab_hdr->sh_=
info];
> ++
> ++  /* The hash might be empty.  See PR 32641 for an example of this.  */
> ++  if (h =3D=3D NULL)
> ++    return NULL;
> ++
> ++  while (h->root.type =3D=3D bfd_link_hash_indirect
> ++       || h->root.type =3D=3D bfd_link_hash_warning)
> ++    h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> ++
> ++  return h;
> ++}
> ++
> + static struct elf_link_hash_entry *
> + get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symn=
dx)
> + {
> +@@ -108,6 +129,9 @@ get_ext_sym_hash (struct elf_reloc_cookie *cookie, u=
nsigned long r_symndx)
> +     {
> +       h =3D cookie->sym_hashes[r_symndx - cookie->extsymoff];
> +
> ++      if (h =3D=3D NULL)
> ++      return NULL;
> ++
> +       while (h->root.type =3D=3D bfd_link_hash_indirect
> +            || h->root.type =3D=3D bfd_link_hash_warning)
> +       h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> +diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
> +index 8e5a005fd36..832a5495eb1 100644
> +--- a/bfd/elfxx-x86.c
> ++++ b/bfd/elfxx-x86.c
> +@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
> +         goto error_return;
> +       }
> +
> +-      if (r_symndx < symtab_hdr->sh_info)
> +-      h =3D NULL;
> +-      else
> +-      {
> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
> +-               || h->root.type =3D=3D bfd_link_hash_warning)
> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> +-      }
> ++      h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_=
hdr);
> +
> +       if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r_type)
> +         && NEED_DYNAMIC_RELOCATION_P (is_x86_64, info, true, h, sec,
> +@@ -1209,10 +1201,12 @@ _bfd_x86_elf_link_relax_section (bfd *abfd ATTRI=
BUTE_UNUSED,
> +       else
> +       {
> +         /* Get H and SEC for GENERATE_DYNAMIC_RELOCATION_P below.  */
> +-        h =3D sym_hashes[r_symndx - symtab_hdr->sh_info];
> +-        while (h->root.type =3D=3D bfd_link_hash_indirect
> +-               || h->root.type =3D=3D bfd_link_hash_warning)
> +-          h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> ++        h =3D _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symta=
b_hdr);
> ++        if (h =3D=3D NULL)
> ++          {
> ++            /* FIXMEL: Issue an error message ?  */
> ++            continue;
> ++          }
> +
> +         if (h->root.type =3D=3D bfd_link_hash_defined
> +             || h->root.type =3D=3D bfd_link_hash_defweak)
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2=
.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
> new file mode 100644
> index 0000000000..5af743582f
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
> @@ -0,0 +1,337 @@
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Wed, 5 Feb 2025 15:43:04 +0000
> +
> +Add even more checks for corrupt input when processing
> +relocations for ELF files.
> +
> +PR 32643
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3D931494c9a89558acb36a03a340c01726545eef24]
> +CVE: CVE-2025-1181
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +
> +diff --git a/bfd/elflink.c b/bfd/elflink.c
> +index fd423d61..91cd7c28 100644
> +--- a/bfd/elflink.c
> ++++ b/bfd/elflink.c
> +@@ -96,15 +96,17 @@
> +   return true;
> + }
> +
> +-struct elf_link_hash_entry *
> +-_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes=
,
> +-                            unsigned int                   symndx,
> +-                            Elf_Internal_Shdr *            symtab_hdr)
> ++static struct elf_link_hash_entry *
> ++get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
> ++                   unsigned int                   symndx,
> ++                   unsigned int                   ext_sym_start)
> + {
> +-  if (symndx < symtab_hdr->sh_info)
> ++  if (sym_hashes =3D=3D NULL
> ++      /* Guard against corrupt input.  See PR 32636 for an example.  */
> ++      || symndx < ext_sym_start)
> +     return NULL;
> +
> +-  struct elf_link_hash_entry *h =3D sym_hashes[symndx - symtab_hdr->sh_=
info];
> ++  struct elf_link_hash_entry *h =3D sym_hashes[symndx - ext_sym_start];
> +
> +   /* The hash might be empty.  See PR 32641 for an example of this.  */
> +   if (h =3D=3D NULL)
> +@@ -117,27 +119,28 @@
> +   return h;
> + }
> +
> +-static struct elf_link_hash_entry *
> +-get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symn=
dx)
> ++struct elf_link_hash_entry *
> ++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes=
,
> ++                            unsigned int                   symndx,
> ++                            Elf_Internal_Shdr *            symtab_hdr)
> + {
> +-  struct elf_link_hash_entry *h =3D NULL;
> +-
> +-  if ((r_symndx >=3D cookie->locsymcount
> +-       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) !=3D STB_LOCA=
L)
> +-      /* Guard against corrupt input.  See PR 32636 for an example.  */
> +-      && r_symndx >=3D cookie->extsymoff)
> +-    {
> +-      h =3D cookie->sym_hashes[r_symndx - cookie->extsymoff];
> ++  if (symtab_hdr =3D=3D NULL)
> ++    return NULL;
> +
> +-      if (h =3D=3D NULL)
> +-      return NULL;
> ++  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_info);
> ++}
> +
> +-      while (h->root.type =3D=3D bfd_link_hash_indirect
> +-           || h->root.type =3D=3D bfd_link_hash_warning)
> +-      h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> +-    }
> ++static struct elf_link_hash_entry *
> ++get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsigned=
 long r_symndx)
> ++{
> ++  if (cookie =3D=3D NULL || cookie->sym_hashes =3D=3D NULL)
> ++    return NULL;
> ++
> ++  if (r_symndx >=3D cookie->locsymcount
> ++      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) !=3D STB_LOCAL=
)
> ++    return get_link_hash_entry (cookie->sym_hashes, r_symndx, cookie->e=
xtsymoff);
> +
> +-  return h;
> ++  return NULL;
> + }
> +
> + asection *
> +@@ -147,7 +150,7 @@
> + {
> +   struct elf_link_hash_entry *h;
> +
> +-  h =3D get_ext_sym_hash (cookie, r_symndx);
> ++  h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);
> +
> +   if (h !=3D NULL)
> +     {
> +@@ -9105,7 +9108,6 @@
> +                 size_t symidx,
> +                 bfd_vma val)
> + {
> +-  struct elf_link_hash_entry **sym_hashes;
> +   struct elf_link_hash_entry *h;
> +   size_t extsymoff =3D locsymcount;
> +
> +@@ -9128,12 +9130,12 @@
> +
> +   /* It is a global symbol: set its link type
> +      to "defined" and give it a value.  */
> +-
> +-  sym_hashes =3D elf_sym_hashes (bfd_with_globals);
> +-  h =3D sym_hashes [symidx - extsymoff];
> +-  while (h->root.type =3D=3D bfd_link_hash_indirect
> +-       || h->root.type =3D=3D bfd_link_hash_warning)
> +-    h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> ++  h =3D get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symidx,=
 extsymoff);
> ++  if (h =3D=3D NULL)
> ++    {
> ++      /* FIXMEL What should we do ?  */
> ++      return;
> ++    }
> +   h->root.type =3D bfd_link_hash_defined;
> +   h->root.u.def.value =3D val;
> +   h->root.u.def.section =3D bfd_abs_section_ptr;
> +@@ -11611,10 +11613,19 @@
> +             || (elf_bad_symtab (input_bfd)
> +                 && flinfo->sections[symndx] =3D=3D NULL))
> +           {
> +-            struct elf_link_hash_entry *h =3D sym_hashes[symndx - extsy=
moff];
> +-            while (h->root.type =3D=3D bfd_link_hash_indirect
> +-                   || h->root.type =3D=3D bfd_link_hash_warning)
> +-              h =3D (struct elf_link_hash_entry *) h->root.u.i.link;
> ++            struct elf_link_hash_entry *h;
> ++
> ++            h =3D get_link_hash_entry (sym_hashes, symndx, extsymoff);
> ++            if (h =3D=3D NULL)
> ++              {
> ++                _bfd_error_handler
> ++                  /* xgettext:c-format */
> ++                  (_("error: %pB: unable to create group section symbol=
"),
> ++                   input_bfd);
> ++                bfd_set_error (bfd_error_bad_value);
> ++                return false;
> ++              }
> ++
> +             /* Arrange for symbol to be output.  */
> +             h->indx =3D -2;
> +             elf_section_data (osec)->this_hdr.sh_info =3D -2;
> +@@ -11749,7 +11760,7 @@
> +                 || (elf_bad_symtab (input_bfd)
> +                     && flinfo->sections[r_symndx] =3D=3D NULL))
> +               {
> +-                h =3D sym_hashes[r_symndx - extsymoff];
> ++                h =3D get_link_hash_entry (sym_hashes, r_symndx, extsym=
off);
> +
> +                 /* Badly formatted input files can contain relocs that
> +                    reference non-existant symbols.  Check here so that
> +@@ -11758,17 +11769,13 @@
> +                   {
> +                     _bfd_error_handler
> +                       /* xgettext:c-format */
> +-                      (_("error: %pB contains a reloc (%#" PRIx64 ") fo=
r section %pA "
> ++                      (_("error: %pB contains a reloc (%#" PRIx64 ") fo=
r section '%pA' "
> +                          "that references a non-existent global symbol"=
),
> +                        input_bfd, (uint64_t) rel->r_info, o);
> +                     bfd_set_error (bfd_error_bad_value);
> +                     return false;
> +                   }
> +
> +-                while (h->root.type =3D=3D bfd_link_hash_indirect
> +-                       || h->root.type =3D=3D bfd_link_hash_warning)
> +-                  h =3D (struct elf_link_hash_entry *) h->root.u.i.link=
;
> +-
> +                 s_type =3D h->type;
> +
> +                 /* If a plugin symbol is referenced from a non-IR file,
> +@@ -11984,7 +11991,6 @@
> +                         && flinfo->sections[r_symndx] =3D=3D NULL))
> +                   {
> +                     struct elf_link_hash_entry *rh;
> +-                    unsigned long indx;
> +
> +                     /* This is a reloc against a global symbol.  We
> +                        have not yet output all the local symbols, so
> +@@ -11993,15 +11999,16 @@
> +                        reloc to point to the global hash table entry
> +                        for this symbol.  The symbol index is then
> +                        set at the end of bfd_elf_final_link.  */
> +-                    indx =3D r_symndx - extsymoff;
> +-                    rh =3D elf_sym_hashes (input_bfd)[indx];
> +-                    while (rh->root.type =3D=3D bfd_link_hash_indirect
> +-                           || rh->root.type =3D=3D bfd_link_hash_warnin=
g)
> +-                      rh =3D (struct elf_link_hash_entry *) rh->root.u.=
i.link;
> +-
> +-                    /* Setting the index to -2 tells
> +-                       elf_link_output_extsym that this symbol is
> +-                       used by a reloc.  */
> ++                    rh =3D get_link_hash_entry (elf_sym_hashes (input_b=
fd),
> ++                                              r_symndx, extsymoff);
> ++                    if (rh =3D=3D NULL)
> ++                      {
> ++                        /* FIXME: Generate an error ?  */
> ++                        continue;
> ++                      }
> ++
> ++                    /* Setting the index to -2 tells elf_link_output_ex=
tsym
> ++                       that this symbol is used by a reloc.  */
> +                     BFD_ASSERT (rh->indx < 0);
> +                     rh->indx =3D -2;
> +                     *rel_hash =3D rh;
> +@@ -13965,25 +13972,21 @@
> +                      struct elf_link_hash_entry *h,
> +                      Elf_Internal_Sym *sym)
> + {
> +-  if (h !=3D NULL)
> ++  if (h =3D=3D NULL)
> ++    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
> ++
> ++  switch (h->root.type)
> +     {
> +-      switch (h->root.type)
> +-      {
> +-      case bfd_link_hash_defined:
> +-      case bfd_link_hash_defweak:
> +-        return h->root.u.def.section;
> ++    case bfd_link_hash_defined:
> ++    case bfd_link_hash_defweak:
> ++      return h->root.u.def.section;
> +
> +-      case bfd_link_hash_common:
> +-        return h->root.u.c.p->section;
> ++    case bfd_link_hash_common:
> ++      return h->root.u.c.p->section;
> +
> +-      default:
> +-        break;
> +-      }
> ++    default:
> ++      return NULL;
> +     }
> +-  else
> +-    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
> +-
> +-  return NULL;
> + }
> +
> + /* Return the debug definition section.  */
> +@@ -14032,46 +14035,49 @@
> +   if (r_symndx =3D=3D STN_UNDEF)
> +     return NULL;
> +
> +-  h =3D get_ext_sym_hash (cookie, r_symndx);
> ++  h =3D get_ext_sym_hash_from_cookie (cookie, r_symndx);
> ++  if (h =3D=3D NULL)
> ++    {
> ++      /* A corrup tinput file can lead to a situation where the index
> ++       does not reference either a local or an external symbol.  */
> ++      if (r_symndx >=3D cookie->locsymcount)
> ++      return NULL;
> +
> +-  if (h !=3D NULL)
> ++      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
> ++                            &cookie->locsyms[r_symndx]);
> ++    }
> ++
> ++  bool was_marked =3D h->mark;
> ++
> ++  h->mark =3D 1;
> ++  /* Keep all aliases of the symbol too.  If an object symbol
> ++     needs to be copied into .dynbss then all of its aliases
> ++     should be present as dynamic symbols, not just the one used
> ++     on the copy relocation.  */
> ++  hw =3D h;
> ++  while (hw->is_weakalias)
> +     {
> +-      bool was_marked;
> ++      hw =3D hw->u.alias;
> ++      hw->mark =3D 1;
> ++    }
> +
> +-      was_marked =3D h->mark;
> +-      h->mark =3D 1;
> +-      /* Keep all aliases of the symbol too.  If an object symbol
> +-       needs to be copied into .dynbss then all of its aliases
> +-       should be present as dynamic symbols, not just the one used
> +-       on the copy relocation.  */
> +-      hw =3D h;
> +-      while (hw->is_weakalias)
> +-      {
> +-        hw =3D hw->u.alias;
> +-        hw->mark =3D 1;
> +-      }
> ++  if (!was_marked && h->start_stop && !h->root.ldscript_def)
> ++    {
> ++      if (info->start_stop_gc)
> ++      return NULL;
> +
> +-      if (!was_marked && h->start_stop && !h->root.ldscript_def)
> ++      /* To work around a glibc bug, mark XXX input sections
> ++       when there is a reference to __start_XXX or __stop_XXX
> ++       symbols.  */
> ++      else if (start_stop !=3D NULL)
> +       {
> +-        if (info->start_stop_gc)
> +-          return NULL;
> +-
> +-        /* To work around a glibc bug, mark XXX input sections
> +-           when there is a reference to __start_XXX or __stop_XXX
> +-           symbols.  */
> +-        else if (start_stop !=3D NULL)
> +-          {
> +-            asection *s =3D h->u2.start_stop_section;
> +-            *start_stop =3D true;
> +-            return s;
> +-          }
> ++        asection *s =3D h->u2.start_stop_section;
> ++        *start_stop =3D true;
> ++        return s;
> +       }
> +-
> +-      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
> +     }
> +
> +-  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
> +-                        &cookie->locsyms[r_symndx]);
> ++  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
> + }
> +
> + /* COOKIE->rel describes a relocation against section SEC, which is
> +@@ -15094,7 +15100,7 @@
> +
> +       struct elf_link_hash_entry *h;
> +
> +-      h =3D get_ext_sym_hash (rcookie, r_symndx);
> ++      h =3D get_ext_sym_hash_from_cookie (rcookie, r_symndx);
> +
> +       if (h !=3D NULL)
> +       {
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217759): https://lists.openembedded.org/g/openembedde=
d-core/message/217759
> Mute This Topic: https://lists.openembedded.org/mt/113443237/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

