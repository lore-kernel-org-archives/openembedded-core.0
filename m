Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA7DC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 14:12:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.50756.1683209530460346216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 07:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Pyn8UK1X;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9659443fb56so83913366b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683209529; x=1685801529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqQODtFauXPhEAYMx4wiqIhIdH255VD1HWixs+fE/jg=;
        b=Pyn8UK1Xrnd6uWrRQvvjdhms6zkmoo1fSCMorzG3uesE6f6kbBc4M14bx8qSdRRUFx
         KrAabxRPPAhXNCPoekU4JPTl8i/QnEVM4ZnpNu302HnHtzZgyy7LbyaYXSmkRPeOxsCl
         vRGcjqvy4yBwmFKfdxH54cO6xEWVU4d1nVmMmEaXkPt0cMmxBwWrtyYJON+EUulX8BuH
         Reqnw76CucuzOerDfn5wZyGq/vZlMZoecSExSogxcvc3OzWjWrLxR9tI4X3paBB7VPCj
         JdHPNbnWgqIw6/Tw4bkpZxBjmV/Ry/cJMmNIaTylJb2D7jP1p24hwosKCARuOKYgIESG
         6G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683209529; x=1685801529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqQODtFauXPhEAYMx4wiqIhIdH255VD1HWixs+fE/jg=;
        b=Qw6tHRp53avcLjkNoWoV3IX6zptHlMgm+3l1GTyBrisOxjIEyyY7/t2lLdBFYueHtP
         PJ+YriyJf2rKuf+ByW1VLKUTFu1MgP8UHEVUyYBsS6mZB0Peh939jQGj56iAyK10EK3t
         90mT8pfDg4wjQg3dXYbEqfRjQaxkDOH2TcJscQU/igqyh5P116tY+X6f93159EiDlm+U
         beeP1T66Xt/FNI+AxtGBtoTOZ/Hgo0FO++xXzSffPsYxqxDUcDLHCKyiYIeHgx84HIx5
         lk8kTnK1yCsuqMw6pSieBqpWcfR89apYxrLcgyimF5enHu5BHye3PpQfb2tLe/8acoV9
         FTaw==
X-Gm-Message-State: AC+VfDwLLXMBEbpXrt6xSqeWYL55ZHJs4I4sOn5BGQQdshuOtJ2XdRfg
	F0UlGhqVhadD+HVIQ9CGj0GVqnQ8wCfizHnrDj4oqQ==
X-Google-Smtp-Source: ACHHUZ7az40jufI7SNkCCFCM2DJqTM+0gTVwHRASgeutm7iHjHD2pypCab/6WvtnsrDHc3QHMqvrEXPwe7UBb5m7ImM=
X-Received: by 2002:a17:907:9693:b0:953:9b27:8f00 with SMTP id
 hd19-20020a170907969300b009539b278f00mr6546569ejc.74.1683209528660; Thu, 04
 May 2023 07:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230504090355.1212654-1-deepadeepthi98@gmail.com>
In-Reply-To: <20230504090355.1212654-1-deepadeepthi98@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 4 May 2023 04:11:57 -1000
Message-ID: <CAOSpxdbf9Lhx1dwzHo=jqgrE5-E1ZZjK9ASMHxU99xKFzY0hGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] binutils : Fix CVE-2023-1972
To: Deepthi Hemraj <deepadeepthi98@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com, 
	sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 14:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180875

Thanks for helping with CVE fixes!

In the future if you are going to submit multiple patches for a recipe
it would be helpful to submit them as a series rather than individual
patches against the current top of tree. This will save me from having
to do manual fixups for each patch after the first.

Best regards,

Steve

On Wed, May 3, 2023 at 11:04=E2=80=AFPM Deepthi Hemraj <deepadeepthi98@gmai=
l.com> wrote:
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dblobdiff;f=3Dbfd/elf.c;h=3D185028cbd97ae0901c4276c8a4787b12bb75875a;=
hp=3D027d01437352555bc4ac0717cb0486c751a7775d;hb=3Dc22d38baefc5a7a1e1f5cdc9=
dbb556b1f0ec5c57;hpb=3Df2f9bde5cde7ff34ed0a4c4682a211d402aa1086]
>
> Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
> ---
>  .../binutils/binutils-2.40.inc                |  1 +
>  .../binutils/0017-CVE-2023-1972.patch         | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2023=
-1972.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/reci=
pes-devtools/binutils/binutils-2.40.inc
> index 93631ca3d7..9df8715074 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.40.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
> @@ -35,5 +35,6 @@ SRC_URI =3D "\
>       file://0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.pa=
tch \
>       file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
>       file://0016-CVE-2023-25586.patch \
> +     file://0017-CVE-2023-1972.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-1972.p=
atch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-1972.patch
> new file mode 100644
> index 0000000000..6a84936730
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-1972.patch
> @@ -0,0 +1,40 @@
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Thu, 30 Mar 2023 09:10:09 +0000 (+0100)
> +Subject: Fix an illegal memory access when an accessing a zer0-lengthver=
def table.
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3Dc22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57
> +
> +Fix an illegal memory access when an accessing a zer0-lengthverdef table=
.
> +
> +  PR 30285
> +  * elf.c (_bfd_elf_slurp_version_tables): Fail if no version definition=
s are allocated.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3Dc22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57]
> +
> +CVE: CVE-2023-1972
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +---
> +
> +diff --git a/bfd/elf.c b/bfd/elf.c
> +index 027d0143735..185028cbd97 100644
> +--- a/bfd/elf.c
> ++++ b/bfd/elf.c
> +@@ -9030,6 +9030,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool def=
ault_imported_symver)
> +         bfd_set_error (bfd_error_file_too_big);
> +         goto error_return_verdef;
> +       }
> ++
> ++      if (amt =3D=3D 0)
> ++      goto error_return_verdef;
> +       elf_tdata (abfd)->verdef =3D (Elf_Internal_Verdef *) bfd_zalloc (=
abfd, amt);
> +       if (elf_tdata (abfd)->verdef =3D=3D NULL)
> +       goto error_return_verdef;
> +@@ -9133,6 +9136,8 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool def=
ault_imported_symver)
> +         bfd_set_error (bfd_error_file_too_big);
> +         goto error_return;
> +       }
> ++      if (amt =3D=3D 0)
> ++      goto error_return;
> +       elf_tdata (abfd)->verdef =3D (Elf_Internal_Verdef *) bfd_zalloc (=
abfd, amt);
> +       if (elf_tdata (abfd)->verdef =3D=3D NULL)
> +       goto error_return;
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180857): https://lists.openembedded.org/g/openembedde=
d-core/message/180857
> Mute This Topic: https://lists.openembedded.org/mt/98680180/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

