Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC96C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 15:49:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.47048.1702914558587341623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 07:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yLmx4PB8;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55322dbabf6so1663695a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702914557; x=1703519357; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JI66Jq8gXUj20qVTqEUcOEGdzoiXXOEo/0SE0L1Zg2E=;
        b=yLmx4PB8lJBUfAfmhDC7l/ilhUk2gX9xm5isuRWQLMhIEt7EE0IT0WFrBH843M/vHm
         sFMPHza9Vfk50OQG7L/eP5UtNBkbUdBE9JzIlCVDyEY+DK6V3Ag9mqd9+nQOHVTqOTip
         iDoy9kleIHqhfBt7meQ/Si2w2qPifeJviN2QUXl+t4p5xHATJbhFp9eWubPbQIRkx1o+
         0ewQDx6HY995It1jD4JsAIqFBGMATviKPcibz6g2U3iLBzGAEZdW2+clplLlOzB649Dw
         /v2W34d/sxvOZQbA4w/NPFj+3Zg9CHE7JUAxGZfUoX4Cefg8oeUVyt/3BdBEXZllbgvs
         /xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702914557; x=1703519357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JI66Jq8gXUj20qVTqEUcOEGdzoiXXOEo/0SE0L1Zg2E=;
        b=wFtunkL87Ez6SzRjIY0eHZ7wro88nJ/u3G7ZrYbddb7842cB78EJ/r3K+AnIVUDQ2c
         pa+gFuhimzPcWeMWcwnhSVOLL8syndGWd2xHTJsEwT0JmmoApm6vuH1wzD98i7wS6xdh
         6XpFE5OQ0ApfX28oew+w5EY5bVP13ao+6Qepv2KtvQibVwg4nKV3O62lHVyxJB7widon
         blBcNRvbi0Eh9s0zHKxZnss/rq6w0SFeYlklBeCFFlfIBTFHFPZyufKOBwEO5l8d7+nT
         tPgX/kHjJ9OKGlpFR0wWs9yxvbqek0/d7JKzAxDv2OVH6EQ8LC93UA+/I9Tp9z5GUtB9
         gmiQ==
X-Gm-Message-State: AOJu0Yx64ewRIDV58PKRToqvkuni+ic8opPQsaHxV3lwjP2z1n9nwd9d
	iHppmTPz6MM0BzrziS01yU56PDIvGA+TK1XvsfQfIA==
X-Google-Smtp-Source: AGHT+IGnPKgIRWsxhdDZ6MGqM5AJx38rbxGbyAX9ws43pThGKZSReV7gYdTCnEUTv1QufJUUvpOk6M79zwAwtE0z5o8=
X-Received: by 2002:a17:907:845:b0:a23:f50:aca3 with SMTP id
 ww5-20020a170907084500b00a230f50aca3mr4565834ejb.25.1702914556150; Mon, 18
 Dec 2023 07:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20231218074103.2583708-1-sanjana.venkatesh@windriver.com>
In-Reply-To: <20231218074103.2583708-1-sanjana.venkatesh@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Dec 2023 05:49:04 -1000
Message-ID: <CAOSpxdbU2+wyLCRaRubd5ZCsA0nvbGEYCMLcze=J8zNUMUYW0w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gdb: Fix CVE-2023-39130
To: Sanjana.Venkatesh@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Yash.Shinde@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 15:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192659

This patch doesn't seem to take into account your previous fix for
CVE-2023-39129

I modified this patch to apply it after your CVE-2023-39129 fix, and
there seem to be conflicts:

ERROR: gdb-cross-x86_64-11.2-r0 do_patch: Applying patch
'0013-CVE-2023-39130.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/gdb-=
cross-x86_64/11.2-r0/gdb-11.2'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/gdb-c=
ross-x86_64/11.2-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch 0013-CVE-2023-39130.patch
patching file gdb/coff-pe-read.c
Hunk #1 FAILED at 254.
Hunk #2 succeeded at 323 (offset 37 lines).
Hunk #3 succeeded at 376 (offset 41 lines).
Hunk #4 FAILED at 387.
Hunk #5 FAILED at 433.
Hunk #6 FAILED at 481.
Hunk #7 FAILED at 639.
5 out of 7 hunks FAILED -- rejects in file gdb/coff-pe-read.c
patching file gdb/coffread.c
Hunk #1 succeeded at 691 (offset -20 lines).
Hunk #2 FAILED at 805.
Hunk #3 FAILED at 1306.
2 out of 3 hunks FAILED -- rejects in file gdb/coffread.c
patching file gdb/dbxread.c
Hunk #1 succeeded at 812 (offset 3 lines).
Hunk #2 FAILED at 2156.
1 out of 2 hunks FAILED -- rejects in file gdb/dbxread.c
patching file gdb/xcoffread.c
Hunk #1 FAILED at 779.
1 out of 1 hunk FAILED -- rejects in file gdb/xcoffread.c
Patch 0013-CVE-2023-39130.patch does not apply (enforce with -f)

I'm going to remove both patches from my test queue.  Please submit a
V2 as a patch series including both fixes.

Thanks,

Steve

On Sun, Dec 17, 2023 at 9:41=E2=80=AFPM Sanjana.Venkatesh via
lists.openembedded.org
<Sanjana.Venkatesh=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Sanjana <sanjana.venkatesh@windriver.com>
>
> Issue: LIN1022-4855
>
> Signed-off-by: Sanjana <sanjana.venkatesh@windriver.com>
> ---
>  meta/recipes-devtools/gdb/gdb.inc             |   1 +
>  .../gdb/gdb/0013-CVE-2023-39130.patch         | 328 ++++++++++++++++++
>  2 files changed, 329 insertions(+)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.pat=
ch
>
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
> index 099bd2d8f5..62b813d5cb 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -15,5 +15,6 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0009-Fix-invalid-sigprocmask-call.patch \
>             file://0010-gdbserver-ctrl-c-handling.patch \
>             file://0011-CVE-2023-39128.patch \
> +           file://0013-CVE-2023-39130.patch \
>             "
>  SRC_URI[sha256sum] =3D "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8=
463c3cc787152e32"
> diff --git a/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch b/me=
ta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
> new file mode 100644
> index 0000000000..9cf6645c58
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
> @@ -0,0 +1,328 @@
> +From: Alan Modra <amodra@gmail.com>
> +Date: Wed, 9 Aug 2023 00:28:36 +0000 (+0930)
> +Subject: gdb: warn unused result for bfd IO functions
> +X-Git-Tag: gdb-14-branchpoint~669
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3D2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80
> +
> +gdb: warn unused result for bfd IO functions
> +
> +This fixes the compilation warnings introduced by my bfdio.c patch.
> +
> +The removed bfd_seeks in coff_symfile_read date back to 1994, commit
> +7f4c859520, prior to which the file used stdio rather than bfd to read
> +symbols.  Since it now uses bfd to read the file there should be no
> +need to synchronise to bfd's idea of the file position.  I also fixed
> +a potential uninitialised memory access.
> +
> +Approved-By: Andrew Burgess <aburgess@redhat.com>
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3D2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80]
> +
> +CVE: CVE-2023-39130
> +
> +Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
> +
> +---
> +
> +diff --git a/gdb/coff-pe-read.c b/gdb/coff-pe-read.c
> +index b82b43c84cf..0d76ebdbfce 100644
> +--- a/gdb/coff-pe-read.c
> ++++ b/gdb/coff-pe-read.c
> +@@ -254,23 +254,31 @@ read_pe_truncate_name (char *dll_name)
> +
> + /* Low-level support functions, direct from the ld module pe-dll.c.  */
> + static unsigned int
> +-pe_get16 (bfd *abfd, int where)
> ++pe_get16 (bfd *abfd, int where, bool *fail)
> + {
> +   unsigned char b[2];
> +
> +-  bfd_seek (abfd, (file_ptr) where, SEEK_SET);
> +-  bfd_read (b, (bfd_size_type) 2, abfd);
> ++  if (bfd_seek (abfd, where, SEEK_SET) !=3D 0
> ++      || bfd_read (b, 2, abfd) !=3D 2)
> ++    {
> ++      *fail =3D true;
> ++      return 0;
> ++    }
> +   return b[0] + (b[1] << 8);
> + }
> +
> + static unsigned int
> +-pe_get32 (bfd *abfd, int where)
> ++pe_get32 (bfd *abfd, int where, bool *fail)
> + {
> +   unsigned char b[4];
> +
> +-  bfd_seek (abfd, (file_ptr) where, SEEK_SET);
> +-  bfd_read (b, (bfd_size_type) 4, abfd);
> +-  return b[0] + (b[1] << 8) + (b[2] << 16) + (b[3] << 24);
> ++  if (bfd_seek (abfd, where, SEEK_SET) !=3D 0
> ++      || bfd_read (b, 4, abfd) !=3D 4)
> ++    {
> ++      *fail =3D true;
> ++      return 0;
> ++    }
> ++  return b[0] + (b[1] << 8) + (b[2] << 16) + ((unsigned) b[3] << 24);
> + }
> +
> + static unsigned int
> +@@ -286,7 +294,7 @@ pe_as32 (void *ptr)
> + {
> +   unsigned char *b =3D (unsigned char *) ptr;
> +
> +-  return b[0] + (b[1] << 8) + (b[2] << 16) + (b[3] << 24);
> ++  return b[0] + (b[1] << 8) + (b[2] << 16) + ((unsigned) b[3] << 24);
> + }
> +
> + /* Read the (non-debug) export symbol table from a portable
> +@@ -335,37 +343,50 @@ read_pe_exported_syms (minimal_symbol_reader &read=
er,
> +            || strcmp (target, "pei-i386") =3D=3D 0
> +            || strcmp (target, "pe-arm-wince-little") =3D=3D 0
> +            || strcmp (target, "pei-arm-wince-little") =3D=3D 0);
> ++
> ++  /* Possibly print a debug message about DLL not having a valid format=
.  */
> ++  auto maybe_print_debug_msg =3D [&] () -> void {
> ++    if (debug_coff_pe_read)
> ++      gdb_printf (gdb_stdlog, _("%s doesn't appear to be a DLL\n"),
> ++                bfd_get_filename (dll));
> ++  };
> ++
> +   if (!is_pe32 && !is_pe64)
> +-    {
> +-      /* This is not a recognized PE format file.  Abort now, because
> +-       the code is untested on anything else.  *FIXME* test on
> +-       further architectures and loosen or remove this test.  */
> +-      return;
> +-    }
> ++    return maybe_print_debug_msg ();
> +
> +   /* Get pe_header, optional header and numbers of export entries.  */
> +-  pe_header_offset =3D pe_get32 (dll, 0x3c);
> ++  bool fail =3D false;
> ++  pe_header_offset =3D pe_get32 (dll, 0x3c, &fail);
> ++  if (fail)
> ++    return maybe_print_debug_msg ();
> +   opthdr_ofs =3D pe_header_offset + 4 + 20;
> +   if (is_pe64)
> +-    num_entries =3D pe_get32 (dll, opthdr_ofs + 108);
> ++    num_entries =3D pe_get32 (dll, opthdr_ofs + 108, &fail);
> +   else
> +-    num_entries =3D pe_get32 (dll, opthdr_ofs + 92);
> ++    num_entries =3D pe_get32 (dll, opthdr_ofs + 92, &fail);
> ++  if (fail)
> ++    return maybe_print_debug_msg ();
> +
> +   if (num_entries < 1)                /* No exports.  */
> +     return;
> +   if (is_pe64)
> +     {
> +-      export_opthdrrva =3D pe_get32 (dll, opthdr_ofs + 112);
> +-      export_opthdrsize =3D pe_get32 (dll, opthdr_ofs + 116);
> ++      export_opthdrrva =3D pe_get32 (dll, opthdr_ofs + 112, &fail);
> ++      export_opthdrsize =3D pe_get32 (dll, opthdr_ofs + 116, &fail);
> +     }
> +   else
> +     {
> +-      export_opthdrrva =3D pe_get32 (dll, opthdr_ofs + 96);
> +-      export_opthdrsize =3D pe_get32 (dll, opthdr_ofs + 100);
> ++      export_opthdrrva =3D pe_get32 (dll, opthdr_ofs + 96, &fail);
> ++      export_opthdrsize =3D pe_get32 (dll, opthdr_ofs + 100, &fail);
> +     }
> +-  nsections =3D pe_get16 (dll, pe_header_offset + 4 + 2);
> ++  if (fail)
> ++    return maybe_print_debug_msg ();
> ++
> ++  nsections =3D pe_get16 (dll, pe_header_offset + 4 + 2, &fail);
> +   secptr =3D (pe_header_offset + 4 + 20 +
> +-          pe_get16 (dll, pe_header_offset + 4 + 16));
> ++          pe_get16 (dll, pe_header_offset + 4 + 16, &fail));
> ++  if (fail)
> ++    return maybe_print_debug_msg ();
> +   expptr =3D 0;
> +   export_size =3D 0;
> +
> +@@ -374,12 +395,13 @@ read_pe_exported_syms (minimal_symbol_reader &read=
er,
> +     {
> +       char sname[8];
> +       unsigned long secptr1 =3D secptr + 40 * i;
> +-      unsigned long vaddr =3D pe_get32 (dll, secptr1 + 12);
> +-      unsigned long vsize =3D pe_get32 (dll, secptr1 + 16);
> +-      unsigned long fptr =3D pe_get32 (dll, secptr1 + 20);
> ++      unsigned long vaddr =3D pe_get32 (dll, secptr1 + 12, &fail);
> ++      unsigned long vsize =3D pe_get32 (dll, secptr1 + 16, &fail);
> ++      unsigned long fptr =3D pe_get32 (dll, secptr1 + 20, &fail);
> +
> +-      bfd_seek (dll, (file_ptr) secptr1, SEEK_SET);
> +-      bfd_read (sname, (bfd_size_type) sizeof (sname), dll);
> ++      if (fail
> ++        || bfd_seek (dll, secptr1, SEEK_SET) !=3D 0
> ++        || bfd_read (sname, sizeof (sname), dll) !=3D sizeof (sname))
> +
> +       if ((strcmp (sname, ".edata") =3D=3D 0)
> +         || (vaddr <=3D export_opthdrrva && export_opthdrrva < vaddr + v=
size))
> +@@ -420,16 +442,18 @@ read_pe_exported_syms (minimal_symbol_reader &read=
er,
> +   for (i =3D 0; i < nsections; i++)
> +     {
> +       unsigned long secptr1 =3D secptr + 40 * i;
> +-      unsigned long vsize =3D pe_get32 (dll, secptr1 + 8);
> +-      unsigned long vaddr =3D pe_get32 (dll, secptr1 + 12);
> +-      unsigned long characteristics =3D pe_get32 (dll, secptr1 + 36);
> ++      unsigned long vsize =3D pe_get32 (dll, secptr1 + 8, &fail);
> ++      unsigned long vaddr =3D pe_get32 (dll, secptr1 + 12, &fail);
> ++      unsigned long characteristics =3D pe_get32 (dll, secptr1 + 36, &f=
ail);
> +       char sec_name[SCNNMLEN + 1];
> +       int sectix;
> +       unsigned int bfd_section_index;
> +       asection *section;
> +
> +-      bfd_seek (dll, (file_ptr) secptr1 + 0, SEEK_SET);
> +-      bfd_read (sec_name, (bfd_size_type) SCNNMLEN, dll);
> ++      if (fail
> ++        || bfd_seek (dll, secptr1 + 0, SEEK_SET) !=3D 0
> ++        || bfd_read (sec_name, SCNNMLEN, dll) !=3D SCNNMLEN)
> ++      return maybe_print_debug_msg ();
> +       sec_name[SCNNMLEN] =3D '\0';
> +
> +       sectix =3D read_pe_section_index (sec_name);
> +@@ -468,8 +492,9 @@ read_pe_exported_syms (minimal_symbol_reader &reader=
,
> +   gdb::def_vector<unsigned char> expdata_storage (export_size);
> +   expdata =3D expdata_storage.data ();
> +
> +-  bfd_seek (dll, (file_ptr) expptr, SEEK_SET);
> +-  bfd_read (expdata, (bfd_size_type) export_size, dll);
> ++  if (bfd_seek (dll, expptr, SEEK_SET) !=3D 0
> ++      || bfd_read (expdata, export_size, dll) !=3D export_size)
> ++    return maybe_print_debug_msg ();
> +   erva =3D expdata - export_rva;
> +
> +   nexp =3D pe_as32 (expdata + 24);
> +@@ -626,20 +651,27 @@ pe_text_section_offset (struct bfd *abfd)
> +     }
> +
> +   /* Get pe_header, optional header and numbers of sections.  */
> +-  pe_header_offset =3D pe_get32 (abfd, 0x3c);
> +-  nsections =3D pe_get16 (abfd, pe_header_offset + 4 + 2);
> ++  bool fail =3D false;
> ++  pe_header_offset =3D pe_get32 (abfd, 0x3c, &fail);
> ++  if (fail)
> ++    return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
> ++  nsections =3D pe_get16 (abfd, pe_header_offset + 4 + 2, &fail);
> +   secptr =3D (pe_header_offset + 4 + 20 +
> +-          pe_get16 (abfd, pe_header_offset + 4 + 16));
> ++          pe_get16 (abfd, pe_header_offset + 4 + 16, &fail));
> ++  if (fail)
> ++    return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
> +
> +   /* Get the rva and size of the export section.  */
> +   for (i =3D 0; i < nsections; i++)
> +     {
> +       char sname[SCNNMLEN + 1];
> +       unsigned long secptr1 =3D secptr + 40 * i;
> +-      unsigned long vaddr =3D pe_get32 (abfd, secptr1 + 12);
> ++      unsigned long vaddr =3D pe_get32 (abfd, secptr1 + 12, &fail);
> +
> +-      bfd_seek (abfd, (file_ptr) secptr1, SEEK_SET);
> +-      bfd_read (sname, (bfd_size_type) SCNNMLEN, abfd);
> ++      if (fail
> ++        || bfd_seek (abfd, secptr1, SEEK_SET) !=3D 0
> ++        || bfd_read (sname, SCNNMLEN, abfd) !=3D SCNNMLEN)
> ++      return DEFAULT_COFF_PE_TEXT_SECTION_OFFSET;
> +       sname[SCNNMLEN] =3D '\0';
> +       if (strcmp (sname, ".text") =3D=3D 0)
> +       return vaddr;
> +diff --git a/gdb/coffread.c b/gdb/coffread.c
> +index 583db6bceb0..6a995ae2241 100644
> +--- a/gdb/coffread.c
> ++++ b/gdb/coffread.c
> +@@ -711,8 +711,6 @@ coff_symfile_read (struct objfile *objfile, symfile_=
add_flags symfile_flags)
> +
> +       /* FIXME: dubious.  Why can't we use something normal like
> +        bfd_get_section_contents?  */
> +-      bfd_seek (abfd, abfd->where, 0);
> +-
> +       stabstrsize =3D bfd_section_size (info->stabstrsect);
> +
> +       coffstab_build_psymtabs (objfile,
> +@@ -807,22 +805,6 @@ coff_symtab_read (minimal_symbol_reader &reader,
> +
> +   scoped_free_pendings free_pending;
> +
> +-  /* Work around a stdio bug in SunOS4.1.1 (this makes me nervous....
> +-     it's hard to know I've really worked around it.  The fix should
> +-     be harmless, anyway).  The symptom of the bug is that the first
> +-     fread (in read_one_sym), will (in my example) actually get data
> +-     from file offset 268, when the fseek was to 264 (and ftell shows
> +-     264).  This causes all hell to break loose.  I was unable to
> +-     reproduce this on a short test program which operated on the same
> +-     file, performing (I think) the same sequence of operations.
> +-
> +-     It stopped happening when I put in this (former) rewind().
> +-
> +-     FIXME: Find out if this has been reported to Sun, whether it has
> +-     been fixed in a later release, etc.  */
> +-
> +-  bfd_seek (objfile->obfd.get (), 0, 0);
> +-
> +   /* Position to read the symbol table.  */
> +   val =3D bfd_seek (objfile->obfd.get (), symtab_offset, 0);
> +   if (val < 0)
> +@@ -1308,12 +1290,13 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb:=
:unique_xmalloc_ptr<char> *stora
> +   if (bfd_seek (abfd, offset, 0) < 0)
> +     return -1;
> +
> +-  val =3D bfd_read ((char *) lengthbuf, sizeof lengthbuf, abfd);
> +-  length =3D bfd_h_get_32 (symfile_bfd, lengthbuf);
> +-
> ++  val =3D bfd_read (lengthbuf, sizeof lengthbuf, abfd);
> +   /* If no string table is needed, then the file may end immediately
> +      after the symbols.  Just return with `stringtab' set to null.  */
> +-  if (val !=3D sizeof lengthbuf || length < sizeof lengthbuf)
> ++  if (val !=3D sizeof lengthbuf)
> ++    return 0;
> ++  length =3D bfd_h_get_32 (symfile_bfd, lengthbuf);
> ++  if (length < sizeof lengthbuf)
> +     return 0;
> +
> +   storage->reset ((char *) xmalloc (length));
> +diff --git a/gdb/dbxread.c b/gdb/dbxread.c
> +index 75bbd510155..ddc61d9d539 100644
> +--- a/gdb/dbxread.c
> ++++ b/gdb/dbxread.c
> +@@ -809,7 +809,8 @@ stabs_seek (int sym_offset)
> +       symbuf_left -=3D sym_offset;
> +     }
> +   else
> +-    bfd_seek (symfile_bfd, sym_offset, SEEK_CUR);
> ++    if (bfd_seek (symfile_bfd, sym_offset, SEEK_CUR) !=3D 0)
> ++      perror_with_name (bfd_get_filename (symfile_bfd));
> + }
> +
> + #define INTERNALIZE_SYMBOL(intern, extern, abfd)                      \
> +@@ -2155,8 +2156,8 @@ dbx_expand_psymtab (legacy_psymtab *pst, struct ob=
jfile *objfile)
> +       symbol_size =3D SYMBOL_SIZE (pst);
> +
> +       /* Read in this file's symbols.  */
> +-      bfd_seek (objfile->obfd.get (), SYMBOL_OFFSET (pst), SEEK_SET);
> +-      read_ofile_symtab (objfile, pst);
> ++      if (bfd_seek (objfile->obfd.get (), SYMBOL_OFFSET (pst), SEEK_SET=
) =3D=3D 0)
> ++      read_ofile_symtab (objfile, pst);
> +     }
> +
> +   pst->readin =3D true;
> +diff --git a/gdb/xcoffread.c b/gdb/xcoffread.c
> +index 8ce4b28d133..63eb538ca05 100644
> +--- a/gdb/xcoffread.c
> ++++ b/gdb/xcoffread.c
> +@@ -779,8 +779,9 @@ enter_line_range (struct subfile *subfile, unsigned =
beginoffset,
> +
> +   while (curoffset <=3D limit_offset)
> +     {
> +-      bfd_seek (abfd, curoffset, SEEK_SET);
> +-      bfd_read (ext_lnno, linesz, abfd);
> ++      if (bfd_seek (abfd, curoffset, SEEK_SET) !=3D 0
> ++        || bfd_read (ext_lnno, linesz, abfd) !=3D linesz)
> ++      return;
> +       bfd_coff_swap_lineno_in (abfd, ext_lnno, &int_lnno);
> +
> +       /* Find the address this line represents.  */
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192608): https://lists.openembedded.org/g/openembedde=
d-core/message/192608
> Mute This Topic: https://lists.openembedded.org/mt/103238950/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

