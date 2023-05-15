Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7EBC7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 14:06:42 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.89564.1684159597522358325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 07:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rM4NjZRo;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-953343581a4so2008687366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684159596; x=1686751596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erdzZa3qefRuqZeIPK0fA4uwDl+pG74I+O0/1OqL1JM=;
        b=rM4NjZRoZEhf5OcCUa1DE1eypv5Nkt6iyLVKW5I0K+fQnIfIfzzL9JXRlG/3PH49Td
         44bjEAhWpF288XJZ0GDfvEfVjqQnAhJUzu/Bx4gFXkH2Pj55TARoaCWOBzmJZ+V8HFyI
         F8fHrYMeSZimXA3/JCbbrqbww3OMQ4GW4zUlSt27EkqG7FRAg/7fNxqT77DmVMen8eNH
         /WSkM0tKGnVgzm/n0+aYRcPrVdeNLrO8DGtUVgN1Z9w5hHqPtwo9Km1PnIMcrkQah55t
         SGoZQpQ1SeAfzGKxBadloigf/jGO43qAcwMuZhWaif7lA7Qxtr+dsU9oaiK1vSPUbRaE
         kv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684159596; x=1686751596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erdzZa3qefRuqZeIPK0fA4uwDl+pG74I+O0/1OqL1JM=;
        b=HJKkGTO4xGEswOahFN+z9p+LjVHaI3CCiJeP0IS9npw6bFVT1Znsh1cFTOUJ3AZPGr
         KSNTJnwJpdgwssAw4x3f2fYHj1YUr0HL1shGbNJDsrBcIehlzdNtHHniUcIfk4DHLX0n
         jKTHR/MqN+XVCsv953w/aeZLwPpwaQbTHQ1cQXBQVKVIb3V3jS4plWgvlyQgG9GTurnF
         o5GuV+y/jMoOPsF7pn6rQxwgOmWD/tJOiGKXarq0pPEInA6iTawYrzt9vWDmbKipZ8u/
         S4kmiTEgPTaGD1mfasUFTfLXR1La7XIwUaTGqHs9PFUWgOi4dxN3Otre9TKnhSEe5B1v
         7oMg==
X-Gm-Message-State: AC+VfDxD4nI2QirZiIGJr+OGTI2jtMUHsETkJa0hq9p/BzWZFb1cNaiJ
	gVED10vHgr26RQbSRL/QPD9/2xWnKL9qI4O/g9YbLg==
X-Google-Smtp-Source: ACHHUZ4b8M8/9c03PpjzDVE4GgVgfrSKeeoyTNKeqDo888BlTfs6RFZJIKnnpw10G7LSfty+r4XVzE6pUN937znaDQk=
X-Received: by 2002:a17:907:a4b:b0:958:514f:d88a with SMTP id
 be11-20020a1709070a4b00b00958514fd88amr27900630ejc.34.1684159595678; Mon, 15
 May 2023 07:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230515055805.1439114-1-deepadeepthi98@gmail.com>
In-Reply-To: <20230515055805.1439114-1-deepadeepthi98@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 15 May 2023 04:06:24 -1000
Message-ID: <CAOSpxdbgUD0GTmkjgUkXM4oteQLtjSSESEx-+WxS6eh3dvqupg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] binutils : Fix CVE-2023-25588
To: Deepthi Hemraj <deepadeepthi98@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com, 
	sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 14:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181261

On Sun, May 14, 2023 at 7:58=E2=80=AFPM Deepthi Hemraj <deepadeepthi98@gmai=
l.com> wrote:
>
> Upstream-Status: Backport[https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff_plain;h=3Dd12f8998d2d086f0a6606589e5aedb7147e6f2f1]
>
> CVE: CVE-2023-25588
>
> Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
> ---
>  .../binutils/binutils-2.38.inc                |   7 +-
>  .../binutils/0028-CVE-2023-25588.patch        | 147 ++++++++++++++++++
>  2 files changed, 148 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2023=
-25588.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> index 5c3ff3d93a..e51c65d638 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -50,11 +50,6 @@ SRC_URI =3D "\
>       file://0021-CVE-2023-1579-2.patch \
>       file://0021-CVE-2023-1579-3.patch \
>       file://0021-CVE-2023-1579-4.patch \
> -     file://0022-CVE-2023-25584-1.patch \
> -     file://0022-CVE-2023-25584-2.patch \
> -     file://0022-CVE-2023-25584-3.patch \
> -     file://0023-CVE-2023-25585.patch \
> -     file://0026-CVE-2023-1972.patch \
> -     file://0025-CVE-2023-25588.patch \
> +     file://0028-CVE-2023-25588.patch \

I can't make sense of what you are trying to accomplish with this
patch!  We already have a patch for CVE-2023-25588.  And you don't
explain why you are removing the patches for 3 other CVEs.

Steve

>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0028-CVE-2023-25588.=
patch b/meta/recipes-devtools/binutils/binutils/0028-CVE-2023-25588.patch
> new file mode 100644
> index 0000000000..c019004a02
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0028-CVE-2023-25588.patch
> @@ -0,0 +1,147 @@
> +From: Alan Modra <amodra@gmail.com>
> +Date: Fri, 14 Oct 2022 00:00:21 +0000 (+1030)
> +Subject: PR29677, Field `the_bfd` of `asymbol` is uninitialised
> +X-Git-Tag: gdb-13-branchpoint~871
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3Dd12f8998d2d086f0a6606589e5aedb7147e6f2f1
> +
> +PR29677, Field `the_bfd` of `asymbol` is uninitialised
> +
> +Besides not initialising the_bfd of synthetic symbols, counting
> +symbols when sizing didn't match symbols created if there were any
> +dynsyms named "".  We don't want synthetic symbols without names
> +anyway, so get rid of them.  Also, simplify and correct sanity checks.
> +
> +       PR 29677
> +       * mach-o.c (bfd_mach_o_get_synthetic_symtab): Rewrite.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3Dd12f8998d2d086f0a6606589e5aedb7147e6f2f1]
> +
> +CVE: CVE-2023-25588
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +
> +---
> +
> +diff --git a/bfd/mach-o.c b/bfd/mach-o.c
> +index acb35e7f0c6..5279343768c 100644
> +--- a/bfd/mach-o.c
> ++++ b/bfd/mach-o.c
> +@@ -938,11 +938,9 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
> +   bfd_mach_o_symtab_command *symtab =3D mdata->symtab;
> +   asymbol *s;
> +   char * s_start;
> +-  char * s_end;
> +   unsigned long count, i, j, n;
> +   size_t size;
> +   char *names;
> +-  char *nul_name;
> +   const char stub [] =3D "$stub";
> +
> +   *ret =3D NULL;
> +@@ -955,27 +953,27 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
> +   /* We need to allocate a bfd symbol for every indirect symbol and to
> +      allocate the memory for its name.  */
> +   count =3D dysymtab->nindirectsyms;
> +-  size =3D count * sizeof (asymbol) + 1;
> +-
> ++  size =3D 0;
> +   for (j =3D 0; j < count; j++)
> +     {
> +-      const char * strng;
> +       unsigned int isym =3D dysymtab->indirect_syms[j];
> ++      const char *str;
> +
> +       /* Some indirect symbols are anonymous.  */
> +-      if (isym < symtab->nsyms && (strng =3D symtab->symbols[isym].symb=
ol.name))
> +-      /* PR 17512: file: f5b8eeba.  */
> +-      size +=3D strnlen (strng, symtab->strsize - (strng - symtab->strt=
ab)) + sizeof (stub);
> ++      if (isym < symtab->nsyms
> ++        && (str =3D symtab->symbols[isym].symbol.name) !=3D NULL)
> ++      {
> ++        /* PR 17512: file: f5b8eeba.  */
> ++        size +=3D strnlen (str, symtab->strsize - (str - symtab->strtab=
));
> ++        size +=3D sizeof (stub);
> ++      }
> +     }
> +
> +-  s_start =3D bfd_malloc (size);
> ++  s_start =3D bfd_malloc (size + count * sizeof (asymbol));
> +   s =3D *ret =3D (asymbol *) s_start;
> +   if (s =3D=3D NULL)
> +     return -1;
> +   names =3D (char *) (s + count);
> +-  nul_name =3D names;
> +-  *names++ =3D 0;
> +-  s_end =3D s_start + size;
> +
> +   n =3D 0;
> +   for (i =3D 0; i < mdata->nsects; i++)
> +@@ -997,47 +995,39 @@ bfd_mach_o_get_synthetic_symtab (bfd *abfd,
> +         entry_size =3D bfd_mach_o_section_get_entry_size (abfd, sec);
> +
> +         /* PR 17512: file: 08e15eec.  */
> +-        if (first >=3D count || last >=3D count || first > last)
> ++        if (first >=3D count || last > count || first > last)
> +           goto fail;
> +
> +         for (j =3D first; j < last; j++)
> +           {
> +             unsigned int isym =3D dysymtab->indirect_syms[j];
> +-
> +-            /* PR 17512: file: 04d64d9b.  */
> +-            if (((char *) s) + sizeof (* s) > s_end)
> +-              goto fail;
> +-
> +-            s->flags =3D BSF_GLOBAL | BSF_SYNTHETIC;
> +-            s->section =3D sec->bfdsection;
> +-            s->value =3D addr - sec->addr;
> +-            s->udata.p =3D NULL;
> ++            const char *str;
> ++            size_t len;
> +
> +             if (isym < symtab->nsyms
> +-                && symtab->symbols[isym].symbol.name)
> ++                && (str =3D symtab->symbols[isym].symbol.name) !=3D NUL=
L)
> +               {
> +-                const char *sym =3D symtab->symbols[isym].symbol.name;
> +-                size_t len;
> +-
> +-                s->name =3D names;
> +-                len =3D strlen (sym);
> +-                /* PR 17512: file: 47dfd4d2.  */
> +-                if (names + len >=3D s_end)
> ++                /* PR 17512: file: 04d64d9b.  */
> ++                if (n >=3D count)
> +                   goto fail;
> +-                memcpy (names, sym, len);
> +-                names +=3D len;
> +-                /* PR 17512: file: 18f340a4.  */
> +-                if (names + sizeof (stub) >=3D s_end)
> ++                len =3D strnlen (str, symtab->strsize - (str - symtab->=
strtab));
> ++                /* PR 17512: file: 47dfd4d2, 18f340a4.  */
> ++                if (size < len + sizeof (stub))
> +                   goto fail;
> +-                memcpy (names, stub, sizeof (stub));
> +-                names +=3D sizeof (stub);
> ++                memcpy (names, str, len);
> ++                memcpy (names + len, stub, sizeof (stub));
> ++                s->name =3D names;
> ++                names +=3D len + sizeof (stub);
> ++                size -=3D len + sizeof (stub);
> ++                s->the_bfd =3D symtab->symbols[isym].symbol.the_bfd;
> ++                s->flags =3D BSF_GLOBAL | BSF_SYNTHETIC;
> ++                s->section =3D sec->bfdsection;
> ++                s->value =3D addr - sec->addr;
> ++                s->udata.p =3D NULL;
> ++                s++;
> ++                n++;
> +               }
> +-            else
> +-              s->name =3D nul_name;
> +-
> +             addr +=3D entry_size;
> +-            s++;
> +-            n++;
> +           }
> +         break;
> +       default:
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181229): https://lists.openembedded.org/g/openembedde=
d-core/message/181229
> Mute This Topic: https://lists.openembedded.org/mt/98897943/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

