Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF1AC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 14:09:33 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.89648.1684159767779099685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 07:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gLEMqWx0;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50bcb00a4c2so19668290a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684159766; x=1686751766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvxHgo+SeNbeCkJMZLKyhSZB6YtUd3IcU9Lkvx+AaSg=;
        b=gLEMqWx0sVB1WQ94JUK+qmG6HgY/Z2eorVJKLM4Xf9atOsj0Rbx9Sn/M+vO50rbDsp
         i4HR68KnJrB9lpLfqb8drktw6oPrAxyEdlE2g9ALMwBq2fKxFJfHwx2pdpwLN8A62fBF
         4+KmDW3P+LKJwV+Woxf9r0TBA05tBGCJ5YqQk9wuICo/z97odSrCs7qxz/renDL7hmjB
         UIolP22s4P6PMLPuP9kkqYaiUK9wlazE4+JewXz6SdAKNKcYAPAuUBwt3Y5bqLHgOACX
         EVD+FWeqTfPtXN6ekDZZKXzDjECrGcKA/A0g4DC7lTCxIl0rT7s0dRcZNoTHGvry7PmB
         Q0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684159766; x=1686751766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvxHgo+SeNbeCkJMZLKyhSZB6YtUd3IcU9Lkvx+AaSg=;
        b=C3XpjvxRQ1im8WhuR4m+zmL9Pv5+86degYYB6SQqFundV4RXf9imVsqaPyk/ZAJ8oH
         f+dEW/jFIjgH0cgYqJQVdtxoH373shqXzFhIvMhXGRC+aPhH27iU+W+nbIQyKA/3zwi/
         YWr00rW+yz1b1LZGgC/z+xQ24Ga8DAKzON+4qDAUfshXqVKfEd0IsEAEE+wcbSKH7cgf
         YLGUF+bHouQxBMYmOKu9TU2kdVUKZPO/+EMkoKFZs0aL/JWxxxNC7+ko5oNGS3kkl8c3
         DhOW1S+3XqHKltIDxo8kBjM8YgPuoO7/rfQ9stCAW6j+zQAWMRyKixrL1V7AWoTncwPX
         n89A==
X-Gm-Message-State: AC+VfDz+XOdtVjNyS3R6tMdgkQ8dPbVFx7gpRJyvylBkF9VawuZgIFjL
	CYQmh1VCpqZLyTHN5F8P+ttwdjGn4xXvVZDMf6lNng==
X-Google-Smtp-Source: ACHHUZ7FZapbc2kA6soWHV46v5d8/V0G5z9m+61F1wL/S1tjhwVrBETevLLXyYigCJ0EcILrLuA6puJ4rSTKtPXuqis=
X-Received: by 2002:a17:907:a412:b0:96a:863c:46a9 with SMTP id
 sg18-20020a170907a41200b0096a863c46a9mr12621550ejc.71.1684159765925; Mon, 15
 May 2023 07:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230515065418.1439677-1-deepadeepthi98@gmail.com>
In-Reply-To: <20230515065418.1439677-1-deepadeepthi98@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 15 May 2023 04:09:15 -1000
Message-ID: <CAOSpxdbCS1F+Xh-tj8bDROBKz6JXeneX2j7PBNnDtFX0as+kpw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] binutils : Fix CVE-2023-25584
To: Deepthi Hemraj <deepadeepthi98@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com, 
	sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 14:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181262

On Sun, May 14, 2023 at 8:54=E2=80=AFPM Deepthi Hemraj <deepadeepthi98@gmai=
l.com> wrote:
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff_plain;h=3Dc9178f285acf19e066be8367185d52837161b0a2]
>
> CVE-2023-25584
>
> Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
> ---
>  .../binutils/binutils-2.38.inc                |   9 +-
>  .../binutils/0027-CVE-2023-25584-1.patch      |  56 ++
>  .../binutils/0027-CVE-2023-25584-2.patch      |  33 ++
>  .../binutils/0027-CVE-2023-25584-3.patch      | 533 ++++++++++++++++++
>  4 files changed, 625 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2023=
-25584-1.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2023=
-25584-2.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2023=
-25584-3.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> index 5c3ff3d93a..9a54071ed4 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -50,11 +50,8 @@ SRC_URI =3D "\
>       file://0021-CVE-2023-1579-2.patch \
>       file://0021-CVE-2023-1579-3.patch \
>       file://0021-CVE-2023-1579-4.patch \
> -     file://0022-CVE-2023-25584-1.patch \
> -     file://0022-CVE-2023-25584-2.patch \
> -     file://0022-CVE-2023-25584-3.patch \
> -     file://0023-CVE-2023-25585.patch \
> -     file://0026-CVE-2023-1972.patch \
> -     file://0025-CVE-2023-25588.patch \
> +     file://0027-CVE-2023-25584-1.patch \
> +     file://0027-CVE-2023-25584-2.patch \
> +     file://0027-CVE-2023-25584-3.patch \

I can't make sense of what you are trying to accomplish with this
patch either!  We already have a patch for CVE-2023-25584.  And you
don't explain why you are removing the patches for 3 other CVEs.

Steve

>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-=
1.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-1.pat=
ch
> new file mode 100644
> index 0000000000..8d4b670829
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-1.patch
> @@ -0,0 +1,56 @@
> +From: Alan Modra <amodra@gmail.com>
> +Date: Thu, 17 Mar 2022 09:35:39 +0000 (+1030)
> +Subject: ubsan: Null dereference in parse_module
> +X-Git-Tag: gdb-12.1-release~59
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3Dc9178f285acf19e066be8367185d52837161b0a2
> +
> +ubsan: Null dereference in parse_module
> +
> +       * vms-alpha.c (parse_module): Sanity check that DST__K_RTNBEG
> +       has set module->func_table for DST__K_RTNEND.  Check return
> +       of bfd_zalloc.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3Dc9178f285acf19e066be8367185d52837161b0a2]
> +
> +CVE-2023-25584
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +
> +---
> +
> +diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
> +index 4a92574c850..1129c98f0e2 100644
> +--- a/bfd/vms-alpha.c
> ++++ b/bfd/vms-alpha.c
> +@@ -4352,9 +4352,13 @@ parse_module (bfd *abfd, struct module *module, u=
nsigned char *ptr,
> +
> +   /* Initialize tables with zero element.  */
> +   curr_srec =3D (struct srecinfo *) bfd_zalloc (abfd, sizeof (struct sr=
ecinfo));
> ++  if (!curr_srec)
> ++    return false;
> +   module->srec_table =3D curr_srec;
> +
> +   curr_line =3D (struct lineinfo *) bfd_zalloc (abfd, sizeof (struct li=
neinfo));
> ++  if (!curr_line)
> ++    return false;
> +   module->line_table =3D curr_line;
> +
> +   while (length =3D=3D -1 || ptr < maxptr)
> +@@ -4389,6 +4393,8 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +       case DST__K_RTNBEG:
> +         funcinfo =3D (struct funcinfo *)
> +           bfd_zalloc (abfd, sizeof (struct funcinfo));
> ++        if (!funcinfo)
> ++          return false;
> +         funcinfo->name
> +           =3D _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_=
NAME,
> +                                           maxptr - (ptr + DST_S_B_RTNBE=
G_NAME));
> +@@ -4401,6 +4407,8 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +         break;
> +
> +       case DST__K_RTNEND:
> ++        if (!module->func_table)
> ++          return false;
> +         module->func_table->high =3D module->func_table->low
> +           + bfd_getl32 (ptr + DST_S_L_RTNEND_SIZE) - 1;
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-=
2.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-2.pat=
ch
> new file mode 100644
> index 0000000000..399519cbf8
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-2.patch
> @@ -0,0 +1,33 @@
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Mon, 5 Dec 2022 11:11:44 +0000 (+0000)
> +Subject: Fix an illegal memory access when parsing a corrupt VMS Alpha f=
ile.
> +X-Git-Tag: gdb-13-branchpoint~160
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3D942fa4fb32738ecbb447546d54f1e5f0312d2ed4
> +
> +Fix an illegal memory access when parsing a corrupt VMS Alpha file.
> +
> +       PR 29848
> +       * vms-alpha.c (parse_module): Fix potential out of bounds memory
> +       access.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3D942fa4fb32738ecbb447546d54f1e5f0312d2ed4]
> +
> +CVE-2023-25584
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +
> +---
> +
> +diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
> +index 9531953bb6d..c0eb5bc5a2a 100644
> +--- a/bfd/vms-alpha.c
> ++++ b/bfd/vms-alpha.c
> +@@ -4366,7 +4366,7 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +     return false;
> +   module->line_table =3D curr_line;
> +
> +-  while (length =3D=3D -1 || ptr < maxptr)
> ++  while (length =3D=3D -1 || (ptr + 3) < maxptr)
> +     {
> +       /* The first byte is not counted in the recorded length.  */
> +       int rec_length =3D bfd_getl16 (ptr) + 1;
> diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-=
3.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-3.pat=
ch
> new file mode 100644
> index 0000000000..5e9da47206
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-3.patch
> @@ -0,0 +1,533 @@
> +From: Alan Modra <amodra@gmail.com>
> +Date: Mon, 12 Dec 2022 07:58:49 +0000 (+1030)
> +Subject: Lack of bounds checking in vms-alpha.c parse_module
> +X-Git-Tag: gdb-13-branchpoint~87
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3D77c225bdeb410cf60da804879ad41622f5f1aa44
> +
> +Lack of bounds checking in vms-alpha.c parse_module
> +
> +       PR 29873
> +       PR 29874
> +       PR 29875
> +       PR 29876
> +       PR 29877
> +       PR 29878
> +       PR 29879
> +       PR 29880
> +       PR 29881
> +       PR 29882
> +       PR 29883
> +       PR 29884
> +       PR 29885
> +       PR 29886
> +       PR 29887
> +       PR 29888
> +       PR 29889
> +       PR 29890
> +       PR 29891
> +       * vms-alpha.c (parse_module): Make length param bfd_size_type.
> +       Delete length =3D=3D -1 checks.  Sanity check record_length.
> +       Sanity check DST__K_MODBEG, DST__K_RTNBEG, DST__K_RTNEND lengths.
> +       Sanity check DST__K_SOURCE and DST__K_LINE_NUM elements
> +       before accessing.
> +       (build_module_list): Pass dst_section size to parse_module.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3D77c225bdeb410cf60da804879ad41622f5f1aa44]
> +
> +CVE-2023-25584
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +---
> +
> +diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
> +index c0eb5bc5a2a..3b63259cc81 100644
> +--- a/bfd/vms-alpha.c
> ++++ b/bfd/vms-alpha.c
> +@@ -4345,7 +4345,7 @@ new_module (bfd *abfd)
> +
> + static bool
> + parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> +-            int length)
> ++            bfd_size_type length)
> + {
> +   unsigned char *maxptr =3D ptr + length;
> +   unsigned char *src_ptr, *pcl_ptr;
> +@@ -4366,7 +4366,7 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +     return false;
> +   module->line_table =3D curr_line;
> +
> +-  while (length =3D=3D -1 || (ptr + 3) < maxptr)
> ++  while (ptr + 3 < maxptr)
> +     {
> +       /* The first byte is not counted in the recorded length.  */
> +       int rec_length =3D bfd_getl16 (ptr) + 1;
> +@@ -4374,15 +4374,19 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +
> +       vms_debug2 ((2, "DST record: leng %d, type %d\n", rec_length, rec=
_type));
> +
> +-      if (length =3D=3D -1 && rec_type =3D=3D DST__K_MODEND)
> ++      if (rec_length > maxptr - ptr)
> ++      break;
> ++      if (rec_type =3D=3D DST__K_MODEND)
> +       break;
> +
> +       switch (rec_type)
> +       {
> +       case DST__K_MODBEG:
> ++        if (rec_length <=3D DST_S_B_MODBEG_NAME)
> ++          break;
> +         module->name
> +           =3D _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_MODBEG_=
NAME,
> +-                                          maxptr - (ptr + DST_S_B_MODBE=
G_NAME));
> ++                                          rec_length - DST_S_B_MODBEG_N=
AME);
> +
> +         curr_pc =3D 0;
> +         prev_pc =3D 0;
> +@@ -4396,13 +4400,15 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +         break;
> +
> +       case DST__K_RTNBEG:
> ++        if (rec_length <=3D DST_S_B_RTNBEG_NAME)
> ++          break;
> +         funcinfo =3D (struct funcinfo *)
> +           bfd_zalloc (abfd, sizeof (struct funcinfo));
> +         if (!funcinfo)
> +           return false;
> +         funcinfo->name
> +           =3D _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_=
NAME,
> +-                                          maxptr - (ptr + DST_S_B_RTNBE=
G_NAME));
> ++                                          rec_length - DST_S_B_RTNBEG_N=
AME);
> +         funcinfo->low =3D bfd_getl32 (ptr + DST_S_L_RTNBEG_ADDRESS);
> +         funcinfo->next =3D module->func_table;
> +         module->func_table =3D funcinfo;
> +@@ -4412,6 +4418,8 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +         break;
> +
> +       case DST__K_RTNEND:
> ++        if (rec_length < DST_S_L_RTNEND_SIZE + 4)
> ++          break;
> +         if (!module->func_table)
> +           return false;
> +         module->func_table->high =3D module->func_table->low
> +@@ -4444,10 +4452,63 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +
> +         vms_debug2 ((3, "source info\n"));
> +
> +-        while (src_ptr < ptr + rec_length)
> ++        while (src_ptr - ptr < rec_length)
> +           {
> +             int cmd =3D src_ptr[0], cmd_length, data;
> +
> ++            switch (cmd)
> ++              {
> ++              case DST__K_SRC_DECLFILE:
> ++                if (src_ptr - ptr + DST_S_B_SRC_DF_LENGTH >=3D rec_leng=
th)
> ++                  cmd_length =3D 0x10000;
> ++                else
> ++                  cmd_length =3D src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
> ++                break;
> ++
> ++              case DST__K_SRC_DEFLINES_B:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SRC_DEFLINES_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SRC_INCRLNUM_B:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SRC_SETFILE:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SRC_SETLNUM_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SRC_SETLNUM_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SRC_SETREC_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SRC_SETREC_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SRC_FORMFEED:
> ++                cmd_length =3D 1;
> ++                break;
> ++
> ++              default:
> ++                cmd_length =3D 2;
> ++                break;
> ++              }
> ++
> ++            if (src_ptr - ptr + cmd_length > rec_length)
> ++              break;
> ++
> +             switch (cmd)
> +               {
> +               case DST__K_SRC_DECLFILE:
> +@@ -4472,7 +4533,6 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +
> +                   module->file_table [fileid].name =3D filename;
> +                   module->file_table [fileid].srec =3D 1;
> +-                  cmd_length =3D src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
> +                   vms_debug2 ((4, "DST_S_C_SRC_DECLFILE: %d, %s\n",
> +                                fileid, module->file_table [fileid].name=
));
> +                 }
> +@@ -4489,7 +4549,6 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +                 srec->sfile =3D curr_srec->sfile;
> +                 curr_srec->next =3D srec;
> +                 curr_srec =3D srec;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_B: %d\n", data));
> +                 break;
> +
> +@@ -4504,14 +4563,12 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +                 srec->sfile =3D curr_srec->sfile;
> +                 curr_srec->next =3D srec;
> +                 curr_srec =3D srec;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_W: %d\n", data));
> +                 break;
> +
> +               case DST__K_SRC_INCRLNUM_B:
> +                 data =3D src_ptr[DST_S_B_SRC_UNSBYTE];
> +                 curr_srec->line +=3D data;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST_S_C_SRC_INCRLNUM_B: %d\n", data));
> +                 break;
> +
> +@@ -4519,21 +4576,18 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +                 data =3D bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> +                 curr_srec->sfile =3D data;
> +                 curr_srec->srec =3D module->file_table[data].srec;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETFILE: %d\n", data));
> +                 break;
> +
> +               case DST__K_SRC_SETLNUM_L:
> +                 data =3D bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
> +                 curr_srec->line =3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_SRC_SETLNUM_W:
> +                 data =3D bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> +                 curr_srec->line =3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_W: %d\n", data));
> +                 break;
> +
> +@@ -4541,7 +4595,6 @@ parse_module (bfd *abfd, struct module *module, un=
signed char *ptr,
> +                 data =3D bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
> +                 curr_srec->srec =3D data;
> +                 module->file_table[curr_srec->sfile].srec =3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETREC_L: %d\n", data));
> +                 break;
> +
> +@@ -4549,19 +4602,16 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +                 data =3D bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> +                 curr_srec->srec =3D data;
> +                 module->file_table[curr_srec->sfile].srec =3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST_S_C_SRC_SETREC_W: %d\n", data));
> +                 break;
> +
> +               case DST__K_SRC_FORMFEED:
> +-                cmd_length =3D 1;
> +                 vms_debug2 ((4, "DST_S_C_SRC_FORMFEED\n"));
> +                 break;
> +
> +               default:
> +                 _bfd_error_handler (_("unknown source command %d"),
> +                                     cmd);
> +-                cmd_length =3D 2;
> +                 break;
> +               }
> +
> +@@ -4574,18 +4624,114 @@ parse_module (bfd *abfd, struct module *module,=
 unsigned char *ptr,
> +
> +         vms_debug2 ((3, "line info\n"));
> +
> +-        while (pcl_ptr < ptr + rec_length)
> ++        while (pcl_ptr - ptr < rec_length)
> +           {
> +             /* The command byte is signed so we must sign-extend it.  *=
/
> +             int cmd =3D ((signed char *)pcl_ptr)[0], cmd_length, data;
> +
> ++            switch (cmd)
> ++              {
> ++              case DST__K_DELTA_PC_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_DELTA_PC_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_INCR_LINUM:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_INCR_LINUM_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_INCR_LINUM_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM_INCR:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM_INCR_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_RESET_LINUM_INCR:
> ++                cmd_length =3D 1;
> ++                break;
> ++
> ++              case DST__K_BEG_STMT_MODE:
> ++                cmd_length =3D 1;
> ++                break;
> ++
> ++              case DST__K_END_STMT_MODE:
> ++                cmd_length =3D 1;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM_B:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SET_LINUM_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SET_PC:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_SET_PC_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_SET_PC_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SET_STMTNUM:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_TERM:
> ++                cmd_length =3D 2;
> ++                break;
> ++
> ++              case DST__K_TERM_W:
> ++                cmd_length =3D 3;
> ++                break;
> ++
> ++              case DST__K_TERM_L:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              case DST__K_SET_ABS_PC:
> ++                cmd_length =3D 5;
> ++                break;
> ++
> ++              default:
> ++                if (cmd <=3D 0)
> ++                  cmd_length =3D 1;
> ++                else
> ++                  cmd_length =3D 2;
> ++                break;
> ++              }
> ++
> ++            if (pcl_ptr - ptr + cmd_length > rec_length)
> ++              break;
> ++
> +             switch (cmd)
> +               {
> +               case DST__K_DELTA_PC_W:
> +                 data =3D bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> +                 curr_pc +=3D data;
> +                 curr_linenum +=3D 1;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST__K_DELTA_PC_W: %d\n", data));
> +                 break;
> +
> +@@ -4593,131 +4739,111 @@ parse_module (bfd *abfd, struct module *module=
, unsigned char *ptr,
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_pc +=3D data;
> +                 curr_linenum +=3D 1;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_DELTA_PC_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_INCR_LINUM:
> +                 data =3D pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> +                 curr_linenum +=3D data;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST__K_INCR_LINUM: %d\n", data));
> +                 break;
> +
> +               case DST__K_INCR_LINUM_W:
> +                 data =3D bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> +                 curr_linenum +=3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST__K_INCR_LINUM_W: %d\n", data));
> +                 break;
> +
> +               case DST__K_INCR_LINUM_L:
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_linenum +=3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_INCR_LINUM_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_LINUM_INCR:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_LINUM_INCR");
> +-                cmd_length =3D 2;
> +                 break;
> +
> +               case DST__K_SET_LINUM_INCR_W:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_LINUM_INCR_W");
> +-                cmd_length =3D 3;
> +                 break;
> +
> +               case DST__K_RESET_LINUM_INCR:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_RESET_LINUM_INCR");
> +-                cmd_length =3D 1;
> +                 break;
> +
> +               case DST__K_BEG_STMT_MODE:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_BEG_STMT_MODE");
> +-                cmd_length =3D 1;
> +                 break;
> +
> +               case DST__K_END_STMT_MODE:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_END_STMT_MODE");
> +-                cmd_length =3D 1;
> +                 break;
> +
> +               case DST__K_SET_LINUM_B:
> +                 data =3D pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> +                 curr_linenum =3D data;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST__K_SET_LINUM_B: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_LINUM:
> +                 data =3D bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> +                 curr_linenum =3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST__K_SET_LINE_NUM: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_LINUM_L:
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_linenum =3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_SET_LINUM_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_PC:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_PC");
> +-                cmd_length =3D 2;
> +                 break;
> +
> +               case DST__K_SET_PC_W:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_PC_W");
> +-                cmd_length =3D 3;
> +                 break;
> +
> +               case DST__K_SET_PC_L:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_PC_L");
> +-                cmd_length =3D 5;
> +                 break;
> +
> +               case DST__K_SET_STMTNUM:
> +                 _bfd_error_handler
> +                   (_("%s not implemented"), "DST__K_SET_STMTNUM");
> +-                cmd_length =3D 2;
> +                 break;
> +
> +               case DST__K_TERM:
> +                 data =3D pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> +                 curr_pc +=3D data;
> +-                cmd_length =3D 2;
> +                 vms_debug2 ((4, "DST__K_TERM: %d\n", data));
> +                 break;
> +
> +               case DST__K_TERM_W:
> +                 data =3D bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> +                 curr_pc +=3D data;
> +-                cmd_length =3D 3;
> +                 vms_debug2 ((4, "DST__K_TERM_W: %d\n", data));
> +                 break;
> +
> +               case DST__K_TERM_L:
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_pc +=3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_TERM_L: %d\n", data));
> +                 break;
> +
> +               case DST__K_SET_ABS_PC:
> +                 data =3D bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> +                 curr_pc =3D data;
> +-                cmd_length =3D 5;
> +                 vms_debug2 ((4, "DST__K_SET_ABS_PC: 0x%x\n", data));
> +                 break;
> +
> +@@ -4726,15 +4852,11 @@ parse_module (bfd *abfd, struct module *module, =
unsigned char *ptr,
> +                   {
> +                     curr_pc -=3D cmd;
> +                     curr_linenum +=3D 1;
> +-                    cmd_length =3D 1;
> +                     vms_debug2 ((4, "bump pc to 0x%lx and line to %d\n"=
,
> +                                  (unsigned long)curr_pc, curr_linenum))=
;
> +                   }
> +                 else
> +-                  {
> +-                    _bfd_error_handler (_("unknown line command %d"), c=
md);
> +-                    cmd_length =3D 2;
> +-                  }
> ++                  _bfd_error_handler (_("unknown line command %d"), cmd=
);
> +                 break;
> +               }
> +
> +@@ -4864,7 +4986,8 @@ build_module_list (bfd *abfd)
> +       return NULL;
> +
> +       module =3D new_module (abfd);
> +-      if (!parse_module (abfd, module, PRIV (dst_section)->contents, -1=
))
> ++      if (!parse_module (abfd, module, PRIV (dst_section)->contents,
> ++                       PRIV (dst_section)->size))
> +       return NULL;
> +       list =3D module;
> +     }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181230): https://lists.openembedded.org/g/openembedde=
d-core/message/181230
> Mute This Topic: https://lists.openembedded.org/mt/98898390/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

