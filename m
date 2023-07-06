Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5F9EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:26:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.27101.1688657209923660589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5Qoixn0T;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-991ef0b464cso387983266b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688657208; x=1691249208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKz8TbMllunLY+Gi38Uhqlt5jwUbb29bsz+kxgGODAA=;
        b=5Qoixn0THZogYd72g30//dy9zrX+ypMwN0JaVsC2pqR3LcclXlH1Jx5XQimODsE8qi
         RaSyD8Ne2sVvWvMxk1WVYgsKGY6LFFQIHQ6FHk+f3xhfK4VvQhbwa2ki9VgK3yUobwwX
         caQ2t6pLzOaCI1IFW4THYFahM/XS5vVO1Ud9G4ZjwzqbIyADJf1uOO+W6meA5dxFDDKb
         DBlW2vyeyHMs9xNkG54+02RD33INRi365R81DIbnc3X2i6YkgTKyrkIRm/MgOwrooE1V
         M/BZLShPHrQUkS6D2+6nAg0JCFW2SQoBt2+E52RcN837Bvch4ESf5qf7Xil20oQlf6U0
         b/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688657208; x=1691249208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKz8TbMllunLY+Gi38Uhqlt5jwUbb29bsz+kxgGODAA=;
        b=AJXFfxs5LvnO4qEM2sXMiZRxXualKdC732hdg3uwftbiUMK8/VPXpKSb9/spX/xMOD
         5VqXKg3ZnLEpyavjUqQ5hUpB3tW+9YMasos+1Jx7FPe7NL9i4sTHve2rWJ7/xlf/vK75
         6f4131CzAhsG664cmeSa8+RRVqicVJl+533wXvP3qaKAeHHrork4XDWiemuBFZ7TUDQm
         gZZVLuBIfVWqTQMqyYDOKTTfIU1VlOWmWqEw3rbUCmaKzpAW+vsMfCW+GObChuN2z1fP
         9CkL/3oseU8/n8Ch/3ag+B5LmoVBVsMQGzqD/mjm/LK5c76MmlW+TvN4Xe/M74K4HJSA
         fZTA==
X-Gm-Message-State: ABy/qLZhIaIrylMPfEKfSzx8jDGtCjSh4TQ9JJuA7QJGh5UZV4uJBHXk
	zxyrQF2/Wl7E7d3/avw+o3wo5T4KqVckMuxZLAnIng==
X-Google-Smtp-Source: APBJJlGKtJVGfLbskguMqhQ7DFTClGHbXc+TVYrIBCK+oXTd+y7c+THO/bqu/paGqm0l7NXro+o3cCBKz4EK31/oZvQ=
X-Received: by 2002:a17:906:2d6:b0:993:b238:314 with SMTP id
 22-20020a17090602d600b00993b2380314mr2358359ejk.38.1688657207735; Thu, 06 Jul
 2023 08:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230706062032.124217-1-hprajapati@mvista.com>
In-Reply-To: <20230706062032.124217-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 6 Jul 2023 05:26:36 -1000
Message-ID: <CAOSpxdbPLcXdrrn6=yM=3KwCj0ohbc3t4PWkuRP1ZVudjustVQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] grub2: fix CVE-2020-27749 Stack buffer overflow
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183982

On Wed, Jul 5, 2023 at 8:20=E2=80=AFPM Hitendra Prajapati <hprajapati@mvist=
a.com> wrote:
>
> Upstream-Status: Backport [https://launchpad.net/debian/+source/grub2/2.0=
2+dfsg1-20+deb10u4/]

Hi Hitendra,

launchpad.net isn't the upstream for grub2, so please also reference
the actual upstream commits in a v2. It would be helpful to me if you
could send v2 as a patch series so I know the proper order to apply
the patches!

Thanks for helping with CVE fixes.

Steve

>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../grub/files/CVE-2020-27749.patch           | 609 ++++++++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |   1 +
>  2 files changed, 610 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27749.patch
>
> diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27749.patch b/meta/reci=
pes-bsp/grub/files/CVE-2020-27749.patch
> new file mode 100644
> index 0000000000..30ba11d882
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2020-27749.patch
> @@ -0,0 +1,609 @@
> +From 199580a4a986848f5e27586a741a7e35412cc5c6 Mon Sep 17 00:00:00 2001
> +From: Chris Coulson <chris.coulson@canonical.com>
> +Date: Thu, 7 Jan 2021 19:21:03 +0000
> +Subject: kern/parser: Fix a stack buffer overflow
> +
> +grub_parser_split_cmdline() expands variable names present in the suppli=
ed
> +command line in to their corresponding variable contents and uses a 1 ki=
B
> +stack buffer for temporary storage without sufficient bounds checking. I=
f
> +the function is called with a command line that references a variable wi=
th
> +a sufficiently large payload, it is possible to overflow the stack
> +buffer via tab completion, corrupt the stack frame and potentially
> +control execution.
> +
> +Fixes: CVE-2020-27749
> +
> +Reported-by: Chris Coulson <chris.coulson@canonical.com>
> +Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
> +Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport [https://launchpad.net/debian/+source/grub2/2.=
02+dfsg1-20+deb10u4/]
> +CVE: CVE-2020-27749
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + grub-core/Makefile.core.def |   1 +
> + grub-core/kern/buffer.c     | 117 +++++++++++++++++++++
> + grub-core/kern/parser.c     | 204 +++++++++++++++++++++++-------------
> + include/grub/buffer.h       | 144 +++++++++++++++++++++++++
> + 4 files changed, 395 insertions(+), 71 deletions(-)
> + create mode 100644 grub-core/kern/buffer.c
> + create mode 100644 include/grub/buffer.h
> +
> +diff --git a/grub-core/Makefile.core.def b/grub-core/Makefile.core.def
> +index 651ea2a..823cd57 100644
> +--- a/grub-core/Makefile.core.def
> ++++ b/grub-core/Makefile.core.def
> +@@ -123,6 +123,7 @@ kernel =3D {
> +   riscv32_efi_startup =3D kern/riscv/efi/startup.S;
> +   riscv64_efi_startup =3D kern/riscv/efi/startup.S;
> +
> ++  common =3D kern/buffer.c;
> +   common =3D kern/command.c;
> +   common =3D kern/corecmd.c;
> +   common =3D kern/device.c;
> +diff --git a/grub-core/kern/buffer.c b/grub-core/kern/buffer.c
> +new file mode 100644
> +index 0000000..9f5f8b8
> +--- /dev/null
> ++++ b/grub-core/kern/buffer.c
> +@@ -0,0 +1,117 @@
> ++/*
> ++ *  GRUB  --  GRand Unified Bootloader
> ++ *  Copyright (C) 2021  Free Software Foundation, Inc.
> ++ *
> ++ *  GRUB is free software: you can redistribute it and/or modify
> ++ *  it under the terms of the GNU General Public License as published b=
y
> ++ *  the Free Software Foundation, either version 3 of the License, or
> ++ *  (at your option) any later version.
> ++ *
> ++ *  GRUB is distributed in the hope that it will be useful,
> ++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++ *  GNU General Public License for more details.
> ++ *
> ++ *  You should have received a copy of the GNU General Public License
> ++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
> ++ */
> ++
> ++#include <grub/buffer.h>
> ++#include <grub/err.h>
> ++#include <grub/misc.h>
> ++#include <grub/mm.h>
> ++#include <grub/safemath.h>
> ++#include <grub/types.h>
> ++
> ++grub_buffer_t
> ++grub_buffer_new (grub_size_t sz)
> ++{
> ++  struct grub_buffer *ret;
> ++
> ++  ret =3D (struct grub_buffer *) grub_malloc (sizeof (*ret));
> ++  if (ret =3D=3D NULL)
> ++    return NULL;
> ++
> ++  ret->data =3D (grub_uint8_t *) grub_malloc (sz);
> ++  if (ret->data =3D=3D NULL)
> ++    {
> ++      grub_free (ret);
> ++      return NULL;
> ++    }
> ++
> ++  ret->sz =3D sz;
> ++  ret->pos =3D 0;
> ++  ret->used =3D 0;
> ++
> ++  return ret;
> ++}
> ++
> ++void
> ++grub_buffer_free (grub_buffer_t buf)
> ++{
> ++  grub_free (buf->data);
> ++  grub_free (buf);
> ++}
> ++
> ++grub_err_t
> ++grub_buffer_ensure_space (grub_buffer_t buf, grub_size_t req)
> ++{
> ++  grub_uint8_t *d;
> ++  grub_size_t newsz =3D 1;
> ++
> ++  /* Is the current buffer size adequate? */
> ++  if (buf->sz >=3D req)
> ++    return GRUB_ERR_NONE;
> ++
> ++  /* Find the smallest power-of-2 size that satisfies the request. */
> ++  while (newsz < req)
> ++    {
> ++      if (newsz =3D=3D 0)
> ++      return grub_error (GRUB_ERR_OUT_OF_RANGE,
> ++                         N_("requested buffer size is too large"));
> ++      newsz <<=3D 1;
> ++    }
> ++
> ++  d =3D (grub_uint8_t *) grub_realloc (buf->data, newsz);
> ++  if (d =3D=3D NULL)
> ++    return grub_errno;
> ++
> ++  buf->data =3D d;
> ++  buf->sz =3D newsz;
> ++
> ++  return GRUB_ERR_NONE;
> ++}
> ++
> ++void *
> ++grub_buffer_take_data (grub_buffer_t buf)
> ++{
> ++  void *data =3D buf->data;
> ++
> ++  buf->data =3D NULL;
> ++  buf->sz =3D buf->pos =3D buf->used =3D 0;
> ++
> ++  return data;
> ++}
> ++
> ++void
> ++grub_buffer_reset (grub_buffer_t buf)
> ++{
> ++  buf->pos =3D buf->used =3D 0;
> ++}
> ++
> ++grub_err_t
> ++grub_buffer_advance_read_pos (grub_buffer_t buf, grub_size_t n)
> ++{
> ++  grub_size_t newpos;
> ++
> ++  if (grub_add (buf->pos, n, &newpos))
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"=
));
> ++
> ++  if (newpos > buf->used)
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE,
> ++                     N_("new read is position beyond the end of the wri=
tten data"));
> ++
> ++  buf->pos =3D newpos;
> ++
> ++  return GRUB_ERR_NONE;
> ++}
> +diff --git a/grub-core/kern/parser.c b/grub-core/kern/parser.c
> +index d1cf061..6ab7aa4 100644
> +--- a/grub-core/kern/parser.c
> ++++ b/grub-core/kern/parser.c
> +@@ -1,7 +1,7 @@
> + /* parser.c - the part of the parser that can return partial tokens */
> + /*
> +  *  GRUB  --  GRand Unified Bootloader
> +- *  Copyright (C) 2005,2007,2009  Free Software Foundation, Inc.
> ++ *  Copyright (C) 2005,2007,2009,2021  Free Software Foundation, Inc.
> +  *
> +  *  GRUB is free software: you can redistribute it and/or modify
> +  *  it under the terms of the GNU General Public License as published b=
y
> +@@ -18,6 +18,7 @@
> +  */
> +
> + #include <grub/parser.h>
> ++#include <grub/buffer.h>
> + #include <grub/env.h>
> + #include <grub/misc.h>
> + #include <grub/mm.h>
> +@@ -107,8 +108,8 @@ check_varstate (grub_parser_state_t s)
> + }
> +
> +
> +-static void
> +-add_var (char *varname, char **bp, char **vp,
> ++static grub_err_t
> ++add_var (grub_buffer_t varname, grub_buffer_t buf,
> +        grub_parser_state_t state, grub_parser_state_t newstate)
> + {
> +   const char *val;
> +@@ -116,17 +117,74 @@ add_var (char *varname, char **bp, char **vp,
> +   /* Check if a variable was being read in and the end of the name
> +      was reached.  */
> +   if (!(check_varstate (state) && !check_varstate (newstate)))
> +-    return;
> ++    return GRUB_ERR_NONE;
> ++
> ++  if (grub_buffer_append_char (varname, '\0') !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> +
> +-  *((*vp)++) =3D '\0';
> +-  val =3D grub_env_get (varname);
> +-  *vp =3D varname;
> ++  val =3D grub_env_get ((const char *) grub_buffer_peek_data (varname))=
;
> ++  grub_buffer_reset (varname);
> +   if (!val)
> +-    return;
> ++    return GRUB_ERR_NONE;
> +
> +   /* Insert the contents of the variable in the buffer.  */
> +-  for (; *val; val++)
> +-    *((*bp)++) =3D *val;
> ++  return grub_buffer_append_data (buf, val, grub_strlen (val));
> ++}
> ++
> ++static grub_err_t
> ++terminate_arg (grub_buffer_t buffer, int *argc)
> ++{
> ++  grub_size_t unread =3D grub_buffer_get_unread_bytes (buffer);
> ++
> ++  if (unread =3D=3D 0)
> ++    return GRUB_ERR_NONE;
> ++
> ++  if (*(const char *) grub_buffer_peek_data_at (buffer, unread - 1) =3D=
=3D '\0')
> ++    return GRUB_ERR_NONE;
> ++
> ++  if (grub_buffer_append_char (buffer, '\0') !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> ++
> ++  (*argc)++;
> ++
> ++  return GRUB_ERR_NONE;
> ++}
> ++
> ++static grub_err_t
> ++process_char (char c, grub_buffer_t buffer, grub_buffer_t varname,
> ++            grub_parser_state_t state, int *argc,
> ++            grub_parser_state_t *newstate)
> ++{
> ++  char use;
> ++
> ++  *newstate =3D grub_parser_cmdline_state (state, c, &use);
> ++
> ++  /*
> ++   * If a variable was being processed and this character does
> ++   * not describe the variable anymore, write the variable to
> ++   * the buffer.
> ++   */
> ++  if (add_var (varname, buffer, state, *newstate) !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> ++
> ++  if (check_varstate (*newstate))
> ++    {
> ++      if (use)
> ++        return grub_buffer_append_char (varname, use);
> ++    }
> ++  else if (*newstate =3D=3D GRUB_PARSER_STATE_TEXT &&
> ++         state !=3D GRUB_PARSER_STATE_ESC && grub_isspace (use))
> ++    {
> ++      /*
> ++       * Don't add more than one argument if multiple
> ++       * spaces are used.
> ++       */
> ++      return terminate_arg (buffer, argc);
> ++    }
> ++  else if (use)
> ++    return grub_buffer_append_char (buffer, use);
> ++
> ++  return GRUB_ERR_NONE;
> + }
> +
> + grub_err_t
> +@@ -135,24 +193,36 @@ grub_parser_split_cmdline (const char *cmdline,
> +                          int *argc, char ***argv)
> + {
> +   grub_parser_state_t state =3D GRUB_PARSER_STATE_TEXT;
> +-  /* XXX: Fixed size buffer, perhaps this buffer should be dynamically
> +-     allocated.  */
> +-  char buffer[1024];
> +-  char *bp =3D buffer;
> ++  grub_buffer_t buffer, varname;
> +   char *rd =3D (char *) cmdline;
> +-  char varname[200];
> +-  char *vp =3D varname;
> +-  char *args;
> ++  char *rp =3D rd;
> +   int i;
> +
> +   *argc =3D 0;
> +   *argv =3D NULL;
> ++
> ++  buffer =3D grub_buffer_new (1024);
> ++  if (buffer =3D=3D NULL)
> ++    return grub_errno;
> ++
> ++  varname =3D grub_buffer_new (200);
> ++  if (varname =3D=3D NULL)
> ++    goto fail;
> ++
> +   do
> +     {
> +-      if (!rd || !*rd)
> ++      if (rp =3D=3D NULL || *rp =3D=3D '\0')
> +       {
> ++        if (rd !=3D cmdline)
> ++          {
> ++            grub_free (rd);
> ++            rd =3D rp =3D NULL;
> ++          }
> +         if (getline)
> +-          getline (&rd, 1, getline_data);
> ++          {
> ++            getline (&rd, 1, getline_data);
> ++            rp =3D rd;
> ++          }
> +         else
> +           break;
> +       }
> +@@ -160,39 +230,14 @@ grub_parser_split_cmdline (const char *cmdline,
> +       if (!rd)
> +       break;
> +
> +-      for (; *rd; rd++)
> ++      for (; *rp !=3D '\0'; rp++)
> +       {
> +         grub_parser_state_t newstate;
> +-        char use;
> +
> +-        newstate =3D grub_parser_cmdline_state (state, *rd, &use);
> ++        if (process_char (*rp, buffer, varname, state, argc,
> ++                          &newstate) !=3D GRUB_ERR_NONE)
> ++          goto fail;
> +
> +-        /* If a variable was being processed and this character does
> +-           not describe the variable anymore, write the variable to
> +-           the buffer.  */
> +-        add_var (varname, &bp, &vp, state, newstate);
> +-
> +-        if (check_varstate (newstate))
> +-          {
> +-            if (use)
> +-              *(vp++) =3D use;
> +-          }
> +-        else
> +-          {
> +-            if (newstate =3D=3D GRUB_PARSER_STATE_TEXT
> +-                && state !=3D GRUB_PARSER_STATE_ESC && grub_isspace (us=
e))
> +-              {
> +-                /* Don't add more than one argument if multiple
> +-                   spaces are used.  */
> +-                if (bp !=3D buffer && *(bp - 1))
> +-                  {
> +-                    *(bp++) =3D '\0';
> +-                    (*argc)++;
> +-                  }
> +-              }
> +-            else if (use)
> +-              *(bp++) =3D use;
> +-          }
> +         state =3D newstate;
> +       }
> +     }
> +@@ -200,43 +245,60 @@ grub_parser_split_cmdline (const char *cmdline,
> +
> +   /* A special case for when the last character was part of a
> +      variable.  */
> +-  add_var (varname, &bp, &vp, state, GRUB_PARSER_STATE_TEXT);
> ++  if (add_var (varname, buffer, state, GRUB_PARSER_STATE_TEXT) !=3D GRU=
B_ERR_NONE)
> ++    goto fail;
> +
> +-  if (bp !=3D buffer && *(bp - 1))
> +-    {
> +-      *(bp++) =3D '\0';
> +-      (*argc)++;
> +-    }
> ++  /* Ensure that the last argument is terminated. */
> ++  if (terminate_arg (buffer, argc) !=3D GRUB_ERR_NONE)
> ++    goto fail;
> +
> +   /* If there are no args, then we're done. */
> +   if (!*argc)
> +-    return 0;
> +-
> +-  /* Reserve memory for the return values.  */
> +-  args =3D grub_malloc (bp - buffer);
> +-  if (!args)
> +-    return grub_errno;
> +-  grub_memcpy (args, buffer, bp - buffer);
> ++    {
> ++      grub_errno =3D GRUB_ERR_NONE;
> ++      goto out;
> ++    }
> +
> +   *argv =3D grub_calloc (*argc + 1, sizeof (char *));
> +   if (!*argv)
> +-    {
> +-      grub_free (args);
> +-      return grub_errno;
> +-    }
> ++    goto fail;
> +
> +   /* The arguments are separated with 0's, setup argv so it points to
> +      the right values.  */
> +-  bp =3D args;
> +   for (i =3D 0; i < *argc; i++)
> +     {
> +-      (*argv)[i] =3D bp;
> +-      while (*bp)
> +-      bp++;
> +-      bp++;
> ++      char *arg;
> ++
> ++      if (i > 0)
> ++      {
> ++        if (grub_buffer_advance_read_pos (buffer, 1) !=3D GRUB_ERR_NONE=
)
> ++          goto fail;
> ++      }
> ++
> ++      arg =3D (char *) grub_buffer_peek_data (buffer);
> ++      if (arg =3D=3D NULL ||
> ++        grub_buffer_advance_read_pos (buffer, grub_strlen (arg)) !=3D G=
RUB_ERR_NONE)
> ++      goto fail;
> ++
> ++      (*argv)[i] =3D arg;
> +     }
> +
> +-  return 0;
> ++  /* Keep memory for the return values. */
> ++  grub_buffer_take_data (buffer);
> ++
> ++  grub_errno =3D GRUB_ERR_NONE;
> ++
> ++ out:
> ++  if (rd !=3D cmdline)
> ++    grub_free (rd);
> ++  grub_buffer_free (buffer);
> ++  grub_buffer_free (varname);
> ++
> ++  return grub_errno;
> ++
> ++ fail:
> ++  grub_free (*argv);
> ++  goto out;
> + }
> +
> + /* Helper for grub_parser_execute.  */
> +diff --git a/include/grub/buffer.h b/include/grub/buffer.h
> +new file mode 100644
> +index 0000000..f4b10cf
> +--- /dev/null
> ++++ b/include/grub/buffer.h
> +@@ -0,0 +1,144 @@
> ++/*
> ++ *  GRUB  --  GRand Unified Bootloader
> ++ *  Copyright (C) 2021  Free Software Foundation, Inc.
> ++ *
> ++ *  GRUB is free software: you can redistribute it and/or modify
> ++ *  it under the terms of the GNU General Public License as published b=
y
> ++ *  the Free Software Foundation, either version 3 of the License, or
> ++ *  (at your option) any later version.
> ++ *
> ++ *  GRUB is distributed in the hope that it will be useful,
> ++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++ *  GNU General Public License for more details.
> ++ *
> ++ *  You should have received a copy of the GNU General Public License
> ++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
> ++ */
> ++
> ++#ifndef GRUB_BUFFER_H
> ++#define GRUB_BUFFER_H 1
> ++
> ++#include <grub/err.h>
> ++#include <grub/misc.h>
> ++#include <grub/mm.h>
> ++#include <grub/safemath.h>
> ++#include <grub/types.h>
> ++
> ++struct grub_buffer
> ++{
> ++  grub_uint8_t *data;
> ++  grub_size_t sz;
> ++  grub_size_t pos;
> ++  grub_size_t used;
> ++};
> ++
> ++/*
> ++ * grub_buffer_t represents a simple variable sized byte buffer with
> ++ * read and write cursors. It currently only implements
> ++ * functionality required by the only user in GRUB (append byte[s],
> ++ * peeking data at a specified position and updating the read cursor.
> ++ * Some things that this doesn't do yet are:
> ++ * - Reading a portion of the buffer by copying data from the current
> ++ *   read position in to a caller supplied destination buffer and then
> ++ *   automatically updating the read cursor.
> ++ * - Dropping the read part at the start of the buffer when an append
> ++ *   requires more space.
> ++ */
> ++typedef struct grub_buffer *grub_buffer_t;
> ++
> ++/* Allocate a new buffer with the specified initial size. */
> ++extern grub_buffer_t grub_buffer_new (grub_size_t sz);
> ++
> ++/* Free the buffer and its resources. */
> ++extern void grub_buffer_free (grub_buffer_t buf);
> ++
> ++/* Return the number of unread bytes in this buffer. */
> ++static inline grub_size_t
> ++grub_buffer_get_unread_bytes (grub_buffer_t buf)
> ++{
> ++  return buf->used - buf->pos;
> ++}
> ++
> ++/*
> ++ * Ensure that the buffer size is at least the requested
> ++ * number of bytes.
> ++ */
> ++extern grub_err_t grub_buffer_ensure_space (grub_buffer_t buf, grub_siz=
e_t req);
> ++
> ++/*
> ++ * Append the specified number of bytes from the supplied
> ++ * data to the buffer.
> ++ */
> ++static inline grub_err_t
> ++grub_buffer_append_data (grub_buffer_t buf, const void *data, grub_size=
_t len)
> ++{
> ++  grub_size_t req;
> ++
> ++  if (grub_add (buf->used, len, &req))
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"=
));
> ++
> ++  if (grub_buffer_ensure_space (buf, req) !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> ++
> ++  grub_memcpy (&buf->data[buf->used], data, len);
> ++  buf->used =3D req;
> ++
> ++  return GRUB_ERR_NONE;
> ++}
> ++
> ++/* Append the supplied character to the buffer. */
> ++static inline grub_err_t
> ++grub_buffer_append_char (grub_buffer_t buf, char c)
> ++{
> ++  return grub_buffer_append_data (buf, &c, 1);
> ++}
> ++
> ++/*
> ++ * Forget and return the underlying data buffer. The caller
> ++ * becomes the owner of this buffer, and must free it when it
> ++ * is no longer required.
> ++ */
> ++extern void *grub_buffer_take_data (grub_buffer_t buf);
> ++
> ++/* Reset this buffer. Note that this does not deallocate any resources.=
 */
> ++void grub_buffer_reset (grub_buffer_t buf);
> ++
> ++/*
> ++ * Return a pointer to the underlying data buffer at the specified
> ++ * offset from the current read position. Note that this pointer may
> ++ * become invalid if the buffer is mutated further.
> ++ */
> ++static inline void *
> ++grub_buffer_peek_data_at (grub_buffer_t buf, grub_size_t off)
> ++{
> ++  if (grub_add (buf->pos, off, &off))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected."));
> ++      return NULL;
> ++    }
> ++
> ++  if (off >=3D buf->used)
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("peek out of range"));
> ++      return NULL;
> ++    }
> ++
> ++  return &buf->data[off];
> ++}
> ++
> ++/*
> ++ * Return a pointer to the underlying data buffer at the current
> ++ * read position. Note that this pointer may become invalid if the
> ++ * buffer is mutated further.
> ++ */
> ++static inline void *
> ++grub_buffer_peek_data (grub_buffer_t buf)
> ++{
> ++  return grub_buffer_peek_data_at (buf, 0);
> ++}
> ++
> ++/* Advance the read position by the specified number of bytes. */
> ++extern grub_err_t grub_buffer_advance_read_pos (grub_buffer_t buf, grub=
_size_t n);
> ++
> ++#endif /* GRUB_BUFFER_H */
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
> index d09eecd8ac..cb79f2212b 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -106,6 +106,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://font-Fix-size-overflow-in-grub_font_get_glyph_intern.p=
atch \
>             file://CVE-2022-2601.patch \
>             file://CVE-2022-3775.patch \
> +           file://CVE-2020-27749.patch \
>             "
>  SRC_URI[md5sum] =3D "5ce674ca6b2612d8939b9e6abed32934"
>  SRC_URI[sha256sum] =3D "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb4=
9b7e5031658ba6ea"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183913): https://lists.openembedded.org/g/openembedde=
d-core/message/183913
> Mute This Topic: https://lists.openembedded.org/mt/99980756/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

