Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A76C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 17:16:44 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.113493.1692033399610502609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 10:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=H1Lg305z;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99d937b83efso268254266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692033398; x=1692638198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDPx1COtSVaJ4XIgAc2MFPOw60gfpqmKmloMSiFsjII=;
        b=H1Lg305zks4bfM3n/7JBD6b5wdGN+CbEDoM9Ec5J0viLNrzFv9fygey5vMZypzF1Ao
         EhaKaynUGfcFjFADnJIeiItAJgU9DDlC3fXxaTIJU7LzH7Ccv40oLsWAR8PrDFV69lpS
         4c/9JrBEbiAoqxdPBBIWfxsTI5rJvV9werYe9vgcwuuFJeS1PdteM7wRcwkBRzfGhDmy
         5cGS6nnuMU8ljQgQxUtscbC68HRWQbuUMypG8/8AnPetoj4lIi/6Evm49vOdDoffQKMv
         1B+s+XfJtljc/DKmobX2JjtDCZfPFkaASt9buAQWX/vBZ8DqKGcQ4Iz/NawgAdpg3xbi
         anEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692033398; x=1692638198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDPx1COtSVaJ4XIgAc2MFPOw60gfpqmKmloMSiFsjII=;
        b=lmmpxtLTf3huhcRbM7AiJvQHwTzrOZQTIAsNM0IpD0R8CAJd8sBPAOVDGlzQ9jsTBi
         UvXZfsynwWn8zXiRUZszSnfsaa3KccDW9naInGLKVC3RGRexYiK/1RCCxlTPn59123HW
         n/p7cdB1x6gIeNJ7XqLqBGEKBb6mEH3X5xwmyri9ds31zZc5zNWqtntDgCg0IZlFsPTA
         pI6jDF+tmP8QI8uZwlTyjEJ836d92LeEuO42C0jNz0ZrI2dR4SLRDaOEiyo7dYTvYb2C
         0nEEfW21HTDH8FrkxQx7btVfqpZDU+CUeH5dLe8Y83HFWC7QNHBAByDQSztSLgEW9kWV
         2LeQ==
X-Gm-Message-State: AOJu0Yxmf7xVwA5tXOndYa5dcV6FH4QwIYVwpV+FJ/Ba68SlfWzHDVFh
	qDQ5+8f9EW1fou7pzadD/AKhtcMcExkVdSxiwLifCA==
X-Google-Smtp-Source: AGHT+IFYDAsCuNUgpk4U+XiVRT92WH9G4U2Npz6uMyWVIFMOY9FYG7AxygleJWRU38rXYWhdNQfdiQStBGYEk07zUbo=
X-Received: by 2002:a17:906:518d:b0:99c:5728:aeb6 with SMTP id
 y13-20020a170906518d00b0099c5728aeb6mr7425039ejk.52.1692033397661; Mon, 14
 Aug 2023 10:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230812014712.6117-1-karn.jye.lau@intel.com>
In-Reply-To: <20230812014712.6117-1-karn.jye.lau@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Aug 2023 07:16:26 -1000
Message-ID: <CAOSpxdaTGvn6rNAD_MkJLVdi2sH9gvqkuS77pGiHJ_82gPpT-Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] Fix kirkstone dmidedecode smbios3_decode
To: "Lau, Karn Jye" <karn.jye.lau@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 17:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185941

Thanks for the patch.  Unfortunately there is an issue:

Applying patch 0002-Fix-smbios3_decode-in-kirkstone-dmidecode.patch
patching file dmidecode.c
Hunk #1 succeeded at 3513 (offset -1 lines).
Hunk #2 succeeded at 5443 (offset -51 lines).
Hunk #3 succeeded at 5461 with fuzz 2 (offset -48 lines).


Applying patch CVE-2023-30630_1.patch
patching file dmidecode.c
Hunk #1 succeeded at 5196 (offset -231 lines).
Hunk #2 succeeded at 5421 (offset -272 lines).
Hunk #3 succeeded at 5456 (offset -272 lines).
Hunk #4 succeeded at 5497 with fuzz 2 (offset -269 lines).
Hunk #5 succeeded at 5514 (offset -261 lines).
Hunk #6 succeeded at 5565 (offset -261 lines).
Hunk #7 succeeded at 5573 (offset -261 lines).
Hunk #8 succeeded at 5594 (offset -261 lines).
patching file util.c
patching file util.h

Could you please fix the fuzz error and submit a v2?

Also, a more standard shortlog would be something like:

dmidecode: fix smbios3_decode

Could you fix this also with v2?

Thanks again!

Steve

On Fri, Aug 11, 2023 at 3:50=E2=80=AFPM Lau, Karn Jye <karn.jye.lau@intel.c=
om> wrote:
>
> From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
>
> Recent CVE fixes in kirkstone dmidecode broke it
> functionality, this issue is only observed in kirkstone
> version of dmidecode(v3.3).Update smbios3_decode to address
> the broken functionality.
>
> Signed-off-by: Lau, Karn Jye <karn.jye.lau@intel.com>
> ---
>  ...mbios3_decode-in-kirkstone-dmidecode.patch | 125 ++++++++++++++++++
>  .../dmidecode/dmidecode_3.3.bb                |   1 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/0002-Fix-sm=
bios3_decode-in-kirkstone-dmidecode.patch
>
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode/0002-Fix-smbios3_d=
ecode-in-kirkstone-dmidecode.patch b/meta/recipes-devtools/dmidecode/dmidec=
ode/0002-Fix-smbios3_decode-in-kirkstone-dmidecode.patch
> new file mode 100644
> index 0000000000..00ffb90ce2
> --- /dev/null
> +++ b/meta/recipes-devtools/dmidecode/dmidecode/0002-Fix-smbios3_decode-i=
n-kirkstone-dmidecode.patch
> @@ -0,0 +1,125 @@
> +From 8a395982d6f350d0744666cffe42c4a486656c6f Mon Sep 17 00:00:00 2001
> +From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
> +Date: Sat, 12 Aug 2023 08:41:58 +0800
> +Subject: [PATCH 2/2] Fix smbios3_decode in kirkstone dmidecode
> +
> +Recent CVE fix broke dmidecode functionality,
> +port upstream changes to fix smbios3_decodein
> +function.
> +
> +Reference:https://github.com/mirror/dmidecode/commit/39b2dd7b6ab719b920e=
96ed832cfb4bdd664e808
> +
> +Signed-off-by: Lau, Karn Jye <karn.jye.lau@intel.com>
> +---
> + dmidecode.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++--
> + 1 file changed, 79 insertions(+), 2 deletions(-)
> +
> +diff --git a/dmidecode.c b/dmidecode.c
> +index f826f6c..91e1a32 100644
> +--- a/dmidecode.c
> ++++ b/dmidecode.c
> +@@ -3514,6 +3514,72 @@ static const char *dmi_power_supply_range_switchi=
ng(u8 code)
> +       return out_of_spec;
> + }
> +
> ++/* Allocates a buffer for the table, must be freed by the caller */
> ++static u8 *dmi_table_get(off_t base, u32 *len, u16 num, u32 ver,
> ++                       const char *devmem, u32 flags)
> ++{
> ++      u8 *buf;
> ++
> ++      if (ver > SUPPORTED_SMBIOS_VER && !(opt.flags & FLAG_QUIET))
> ++      {
> ++              pr_comment("SMBIOS implementations newer than version %u.=
%u.%u are not",
> ++                         SUPPORTED_SMBIOS_VER >> 16,
> ++                         (SUPPORTED_SMBIOS_VER >> 8) & 0xFF,
> ++                         SUPPORTED_SMBIOS_VER & 0xFF);
> ++              pr_comment("fully supported by this version of dmidecode.=
");
> ++      }
> ++
> ++      if (!(opt.flags & FLAG_QUIET))
> ++      {
> ++              if (opt.type =3D=3D NULL)
> ++              {
> ++                      if (num)
> ++                              pr_info("%u structures occupying %u bytes=
.",
> ++                                      num, *len);
> ++                      if (!(opt.flags & FLAG_FROM_DUMP))
> ++                              pr_info("Table at 0x%08llX.",
> ++                                      (unsigned long long)base);
> ++              }
> ++              pr_sep();
> ++      }
> ++
> ++      if ((flags & FLAG_NO_FILE_OFFSET) || (opt.flags & FLAG_FROM_DUMP)=
)
> ++      {
> ++              /*
> ++               * When reading from sysfs or from a dump file, the file =
may be
> ++               * shorter than announced. For SMBIOS v3 this is expcted,=
 as we
> ++               * only know the maximum table size, not the actual table=
 size.
> ++               * For older implementations (and for SMBIOS v3 too), thi=
s
> ++               * would be the result of the kernel truncating the table=
 on
> ++               * parse error.
> ++               */
> ++              size_t size =3D *len;
> ++              buf =3D read_file(flags & FLAG_NO_FILE_OFFSET ? 0 : base,
> ++                      &size, devmem);
> ++              if (!(opt.flags & FLAG_QUIET) && num && size !=3D (size_t=
)*len)
> ++              {
> ++                      fprintf(stderr, "Wrong DMI structures length: %u =
bytes "
> ++                              "announced, only %lu bytes available.\n",
> ++                              *len, (unsigned long)size);
> ++              }
> ++              *len =3D size;
> ++      }
> ++      else
> ++              buf =3D mem_chunk(base, *len, devmem);
> ++
> ++      if (buf =3D=3D NULL)
> ++      {
> ++              fprintf(stderr, "Failed to read table, sorry.\n");
> ++#ifndef USE_MMAP
> ++              if (!(flags & FLAG_NO_FILE_OFFSET))
> ++                      fprintf(stderr,
> ++                              "Try compiling dmidecode with -DUSE_MMAP.=
\n");
> ++#endif
> ++      }
> ++
> ++      return buf;
> ++}
> ++
> + /*
> +  * 7.41 Additional Information (Type 40)
> +  *
> +@@ -5428,8 +5494,11 @@ static int smbios3_decode(u8 *buf, size_t buf_len=
, const char *devmem, u32 flags
> +               return 0;
> +       }
> +
> +-      dmi_table(((off_t)offset.h << 32) | offset.l,
> +-                DWORD(buf + 0x0C), 0, ver, devmem, flags | FLAG_STOP_AT=
_EOT);
> ++      /* Maximum length, may get trimmed */
> ++
> ++    len =3D DWORD(buf + 0x0C);
> ++
> ++    table =3D dmi_table_get(((off_t)offset.h << 32) | offset.l, &len, 0=
, ver,devmem, flags | FLAG_STOP_AT_EOT);
> +
> +       if (opt.flags & FLAG_DUMP_BIN)
> +       {
> +@@ -5440,6 +5509,14 @@ static int smbios3_decode(u8 *buf, size_t buf_len=
, const char *devmem, u32 flags
> +
> +               dmi_table_dump(crafted, crafted[0x06], table, len);
> +       }
> ++      else
> ++    {
> ++        dmi_table_decode(table, len, 0, ver >> 8,flags | FLAG_STOP_AT_E=
OT);
> ++    }
> ++
> ++
> ++
> ++    free(table);
> +
> +       return 1;
> + }
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb b/meta/reci=
pes-devtools/dmidecode/dmidecode_3.3.bb
> index b99c2ea99d..fab7a9ec97 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
> +++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>
>  SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
>             file://0001-Committing-changes-from-do_unpack_extra.patch \
> +           file://0002-Fix-smbios3_decode-in-kirkstone-dmidecode.patch \
>             file://CVE-2023-30630_1.patch \
>             file://CVE-2023-30630_2.patch \
>             file://CVE-2023-30630_3.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185854): https://lists.openembedded.org/g/openembedde=
d-core/message/185854
> Mute This Topic: https://lists.openembedded.org/mt/100696063/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

