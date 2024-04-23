Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16755C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 11:52:22 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.16342.1713873135284330360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 04:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vcinFeUP;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61b4cbb8834so29225547b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 04:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713873134; x=1714477934; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmnni4xcJgEsydIclkSS3yhp39ZcZwGHNehIdjUj5e8=;
        b=vcinFeUPINpmaoVG6V/8C2GSMvxR5KstOBTqy/KkgAyQQQKS7t0ACx1+yDW6OEOQVY
         rJr4h9btFysW+DRP2JisyFg/Pp1Rvz+Ftf8r3BxcaYDOfk+aKBiqEyD/3eWilZxpopYK
         NLrQL9D+Va6fUcMIOBMYeBDi/i/B9H6AiMZemjsuNhRk9vhM9STbH+Dgk+xl5iG4AKOO
         Jri1tyFKXu5C1P7s3w3WRrK7nhqv56rQK7wkc5MypNfPpKYE3A/EkTBFrWzb1bG09qCt
         NuBpODijyJ9QARPazRbr0eF6HWUpRxggzGVDnNNG4cg7uxaRkRuISQ72otv0xP4zNcTW
         lMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713873134; x=1714477934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pmnni4xcJgEsydIclkSS3yhp39ZcZwGHNehIdjUj5e8=;
        b=UbPJfB9H2/111Lmd/Mqqz7gAKvkLmITgOkZSYw4zx1acxdXOFB2tJ2EJBU5aNNI3Ff
         Z10TvjPd4Xd5p2EqCeerNmPsK+K/2gr/WJbIApOm722krvFUc6Buo6OnDDeH5olTMsXB
         cJnUGqOxnSkg6ReITAbWFUdDlXcJaZsD/lXEF+5udy/VhdyGgtFs2EgX4j9F3yfUFt7F
         sOBxeuCTURwbNNH0y0ICXBMjrZ7RBVrubcB9S9lpn9f22aJcllt63Py9VLcZ/YJryNDN
         6Q0OhHZQqaSF0hUMCew34cfMBCm0wbv9OdYvmdCosOT6jx7kljrlXB1E9rCSfy9WKxc5
         K8Rw==
X-Gm-Message-State: AOJu0YyRJXpLRVhmm4nh4M5Wy6nnaFaWZYTpLxlr/AQN3EnincK4k9TB
	T1fz0zjruFu7Kks/PddMv2jBOf6guCm7Nb7SU1LIGnZ7G3JJ5WpyLfqIuqIWRHbilhZsZsiZQv5
	mJfGsI4FVek4Ydi3KHaRjzihdZWJwMQIiW7uRAfHnioXuL6KMVwO++Q==
X-Google-Smtp-Source: AGHT+IGKcTFbY1L35XV0+xgct9k5FLvZLdB9EqzqKqvPbeBilpjmtCx0GesOKbAyFxpUmKe0iZOmf9JxJVhKOdCzq0s=
X-Received: by 2002:a05:690c:6e0f:b0:617:cbc7:26fe with SMTP id
 jb15-20020a05690c6e0f00b00617cbc726femr14360518ywb.16.1713873134467; Tue, 23
 Apr 2024 04:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240423073442.48274-1-virendrak@kpit.com>
In-Reply-To: <20240423073442.48274-1-virendrak@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 23 Apr 2024 04:52:03 -0700
Message-ID: <CAOSpxdbzdZziXMbzoKQwytti5C=AHUa1onaNjOkvVvymvNfkgA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH 1/4] binutils: Fix CVE-2022-44840
To: thakur.virendra1810@gmail.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 11:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198618

Dunfell has reached end of life and we are no longer taking changes.
The final build was done on April 15.

Steve

On Tue, Apr 23, 2024 at 12:35=E2=80=AFAM virendra thakur via
lists.openembedded.org
<thakur.virendra1810=3Dgmail.com@lists.openembedded.org> wrote:
>
> Add patch file to fix CVE-2022-44840
>
> Reference: https://answers.launchpad.net/ubuntu/+archive/primary/+sourcef=
iles/binutils/2.34-6ubuntu1.8/binutils_2.34-6ubuntu1.8.debian.tar.xz
>
> Signed-off-by: virendra thakur <virendrak@kpit.com>
> ---
>  .../binutils/binutils-2.34.inc                |   1 +
>  .../binutils/binutils/CVE-2022-44840.patch    | 162 ++++++++++++++++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-4484=
0.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/reci=
pes-devtools/binutils/binutils-2.34.inc
> index 032263fe63..64f66a30a9 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.34.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
> @@ -62,5 +62,6 @@ SRC_URI =3D "\
>       file://CVE-2022-47011.patch \
>       file://CVE-2022-48063.patch \
>       file://CVE-2022-47695.patch \
> +     file://CVE-2022-44840.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-44840.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2022-44840.patch
> new file mode 100644
> index 0000000000..288219871d
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-44840.patch
> @@ -0,0 +1,162 @@
> +[Ubuntu note: commit af2ddf69ab85 is not included in this version of the=
 code,
> + so adjustments had to be made to the 2nd hunk in order for it to apply
> + cleanly and in order to have the added code match correct macro usage f=
or
> + this version of binutils (SAFE_BYTE_GET64 is called with signature_high=
 and
> + signature_low in this version of the code, but not in the added lines o=
f the
> + original patch).
> + -- Camila Camargo de Matos <camila.camargodematos@canonical.com>]
> +
> +Origin: backport, https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dc=
ommit;h=3D28750e3b967da2207d51cbce9fc8be262817ee59
> +
> +From 28750e3b967da2207d51cbce9fc8be262817ee59 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Sun, 30 Oct 2022 19:08:51 +1030
> +Subject: [PATCH] Pool section entries for DWP version 1
> +
> +Ref: https://gcc.gnu.org/wiki/DebugFissionDWP?action=3Drecall&rev=3D3
> +
> +Fuzzers have found a weakness in the code stashing pool section
> +entries.  With random nonsensical values in the index entries (rather
> +than each index pointing to its own set distinct from other sets),
> +it's possible to overflow the space allocated, losing the NULL
> +terminator.  Without a terminator, find_section_in_set can run off the
> +end of the shndx_pool buffer.  Fix this by scanning the pool directly.
> +
> +binutils/
> +       * dwarf.c (add_shndx_to_cu_tu_entry): Delete range check.
> +       (end_cu_tu_entry): Likewise.
> +       (process_cu_tu_index): Fill shndx_pool by directly scanning
> +       pool, rather than indirectly from index entries.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommit;h=3D28750e3b967da2207d51cbce9fc8be262817ee59]
> +
> +CVE: CVE-2022-44840
> +
> +Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> +---
> + binutils/dwarf.c | 90 ++++++++++++++++++++++--------------------------
> + 1 file changed, 41 insertions(+), 49 deletions(-)
> +
> +Index: binutils-2.34/binutils/dwarf.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- binutils-2.34.orig/binutils/dwarf.c
> ++++ binutils-2.34/binutils/dwarf.c
> +@@ -9454,22 +9454,12 @@ prealloc_cu_tu_list (unsigned int nshndx
> + static void
> + add_shndx_to_cu_tu_entry (unsigned int shndx)
> + {
> +-  if (shndx_pool_used >=3D shndx_pool_size)
> +-    {
> +-      error (_("Internal error: out of space in the shndx pool.\n"));
> +-      return;
> +-    }
> +   shndx_pool [shndx_pool_used++] =3D shndx;
> + }
> +
> + static void
> + end_cu_tu_entry (void)
> + {
> +-  if (shndx_pool_used >=3D shndx_pool_size)
> +-    {
> +-      error (_("Internal error: out of space in the shndx pool.\n"));
> +-      return;
> +-    }
> +   shndx_pool [shndx_pool_used++] =3D 0;
> + }
> +
> +@@ -9578,54 +9568,55 @@ process_cu_tu_index (struct dwarf_sectio
> +
> +   if (version =3D=3D 1)
> +     {
> ++      unsigned char *shndx_list;
> ++      unsigned int shndx;
> ++
> +       if (!do_display)
> +-      prealloc_cu_tu_list ((limit - ppool) / 4);
> +-      for (i =3D 0; i < nslots; i++)
> +       {
> +-        unsigned char *shndx_list;
> +-        unsigned int shndx;
> +-
> +-        SAFE_BYTE_GET64 (phash, &signature_high, &signature_low, limit)=
;
> +-        if (signature_high !=3D 0 || signature_low !=3D 0)
> ++         prealloc_cu_tu_list ((limit - ppool) / 4);
> ++         for (shndx_list =3D ppool + 4; shndx_list <=3D limit - 4; shnd=
x_list +=3D 4)
> +           {
> +-            SAFE_BYTE_GET (j, pindex, 4, limit);
> +-            shndx_list =3D ppool + j * 4;
> +-            /* PR 17531: file: 705e010d.  */
> +-            if (shndx_list < ppool)
> +-              {
> +-                warn (_("Section index pool located before start of sec=
tion\n"));
> +-                return 0;
> +-              }
> +-
> +-            if (do_display)
> ++            shndx =3D byte_get (shndx_list, 4);
> ++            add_shndx_to_cu_tu_entry (shndx);
> ++          }
> ++        end_cu_tu_entry ();
> ++      }
> ++      else
> ++      for (i =3D 0; i < nslots; i++)
> ++        {
> ++          SAFE_BYTE_GET64 (phash, &signature_high, &signature_low, limi=
t);
> ++          if (signature_high !=3D 0 || signature_low !=3D 0)
> ++            {
> ++              SAFE_BYTE_GET (j, pindex, 4, limit);
> ++              shndx_list =3D ppool + j * 4;
> ++              /* PR 17531: file: 705e010d.  */
> ++              if (shndx_list < ppool)
> ++                {
> ++                  warn (_("Section index pool located before start of s=
ection\n"));
> ++                  return 0;
> ++                }
> +               printf (_("  [%3d] Signature:  0x%s  Sections: "),
> +                       i, dwarf_vmatoa64 (signature_high, signature_low,
> +                                          buf, sizeof (buf)));
> +-            for (;;)
> +-              {
> +-                if (shndx_list >=3D limit)
> +-                  {
> +-                    warn (_("Section %s too small for shndx pool\n"),
> +-                          section->name);
> +-                    return 0;
> +-                  }
> +-                SAFE_BYTE_GET (shndx, shndx_list, 4, limit);
> +-                if (shndx =3D=3D 0)
> +-                  break;
> +-                if (do_display)
> ++              for (;;)
> ++                {
> ++                  if (shndx_list >=3D limit)
> ++                    {
> ++                      warn (_("Section %s too small for shndx pool\n"),
> ++                            section->name);
> ++                      return 0;
> ++                    }
> ++                  SAFE_BYTE_GET (shndx, shndx_list, 4, limit);
> ++                  if (shndx =3D=3D 0)
> ++                    break;
> +                   printf (" %d", shndx);
> +-                else
> +-                  add_shndx_to_cu_tu_entry (shndx);
> +-                shndx_list +=3D 4;
> +-              }
> +-            if (do_display)
> ++                  shndx_list +=3D 4;
> ++                }
> +               printf ("\n");
> +-            else
> +-              end_cu_tu_entry ();
> +-          }
> +-        phash +=3D 8;
> +-        pindex +=3D 4;
> +-      }
> ++            }
> ++          phash +=3D 8;
> ++          pindex +=3D 4;
> ++        }
> +     }
> +   else if (version =3D=3D 2)
> +     {
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198606): https://lists.openembedded.org/g/openembedde=
d-core/message/198606
> Mute This Topic: https://lists.openembedded.org/mt/105685930/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

