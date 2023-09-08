Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5606CEE800B
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:15:48 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.39881.1694182546179348797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 07:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=itZ1C4kb;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9a64619d8fbso264589066b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 07:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694182544; x=1694787344; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y768GZHdJaid3GNqx8uxXuCnqHO1U0SxwC6WqyB7q6M=;
        b=itZ1C4kbJXIUNa2AdgvobWZYvIwi7CjZpTukRsDOThJYjhe0E9hPtDKiHg3bWsX7n6
         wf9zKrUPYUsdSdIveaSoHijcV7XtWYe+dnRMHgZ6eIf4OziuQpwuXT/om1e0oyfzcsgM
         ARoanIbyxRzW+sWnqwDXTHEXSw+PQ4TyQ7+fvCyUA4qxTDpgEN/7l3IAXJUS2YqA4vpA
         MlAFdWQAI5lqTZG3Qpp9idciCBeAmTIx3iyJm9Xi+sQhloaLD9Z0JUUuadVeTqjLup9I
         DKsFLxhYxpo7ABQpbiFE5pIwEUjzyQfAILcwqbGeqphhYIkWjBwxc8rzrB2hoo0y6rI1
         HZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694182544; x=1694787344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y768GZHdJaid3GNqx8uxXuCnqHO1U0SxwC6WqyB7q6M=;
        b=ZucgSGO5RsrNo2V6ZTqJyJKnB1MILxBDaxXDe9Ia0h5NqAkq+MOW75SUm4sqDr0FnT
         LIiLmUYP4lgIiOLRovQGa+L0fu3Z4hDREfQxjqYunSPydXm1dVrHDFofrd4LW8wo2Fhk
         Bt9NtGlwDaZWvdIrPOE9zy2sTG2SP0OHwe+Kn7MM0iOue8ROUhf6EuWA9scV/aDgvsFo
         r+sbvs0qwD80/xer8M4wqzZPuXbfBu/YpqaSsh9mzTD+4+CCgQvC5VVJZbWh9HNt3kq7
         AlPN7mgggE/Y5FCjUClGeJ/BZJM2nWE0Stp1AU80y4jvoSOaYgD8juKqkK4HOE0O4Dku
         Bp9Q==
X-Gm-Message-State: AOJu0YynSDUkKashHxTVMk/YxvIlGaWp8OXbFXhzIZG66m7s0sKBYJw/
	JCyXOQ1uxOohlkIf7qFBYc+XXqNdQ29OsE2WqJKi6g==
X-Google-Smtp-Source: AGHT+IHple7UxS7NdFc/SFm5zlD3pxJBTYFrBW329MnN88J3GYicGuAxC1i8Y9DDvNiAIT6Fxr1O1Cg3RV3wQyLUleI=
X-Received: by 2002:a17:906:7396:b0:9a1:f521:c3ff with SMTP id
 f22-20020a170906739600b009a1f521c3ffmr2205668ejl.40.1694182544198; Fri, 08
 Sep 2023 07:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230906092532.675964-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20230906092532.675964-1-Deepthi.Hemraj@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Sep 2023 04:15:30 -1000
Message-ID: <CAOSpxdZ88_gvF+oXAzzojojfo5UfdBQfit00HML22h52NZEVhw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH V2] binutils: Fix CVE-2022-47008
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Umesh.Kalappa@windriver.com, Naveen.Gowda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 14:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187434

Hi Deepthi,

Could you please submit V3 as a patch series? No ordering
works as is, the second patch in a series for the same recipe must
take the first into account.

Steve

On Tue, Sep 5, 2023 at 11:25=E2=80=AFPM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  .../binutils/binutils-2.38.inc                |  1 +
>  .../binutils/0027-CVE-2022-47008.patch        | 67 +++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2022=
-47008.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> index 5c3ff3d93a..9bcf7ad4f5 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -56,5 +56,6 @@ SRC_URI =3D "\
>       file://0023-CVE-2023-25585.patch \
>       file://0026-CVE-2023-1972.patch \
>       file://0025-CVE-2023-25588.patch \
> +     file://0027-CVE-2022-47008.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.=
patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
> new file mode 100644
> index 0000000000..a3fff65409
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
> @@ -0,0 +1,67 @@
> +From: Alan Modra <amodra@gmail.com>
> +Date: Thu, 16 Jun 2022 23:43:38 +0000 (+0930)
> +Subject: PR29255, memory leak in make_tempdir
> +X-Git-Tag: binutils-2_39~236
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3Dd6e1d48c83b165c129cb0aa78905f7ca80a1f682
> +
> +PR29255, memory leak in make_tempdir
> +
> +       PR 29255
> +       * bucomm.c (make_tempdir, make_tempname): Free template on all
> +       failure paths.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3Dd6e1d48c83b165c129cb0aa78905f7ca80a1f682]
> +
> +CVE: CVE-2022-47008
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +
> +---
> +
> +diff --git a/binutils/bucomm.c b/binutils/bucomm.c
> +index fdc2209df9c..4395cb9f7f5 100644
> +--- a/binutils/bucomm.c
> ++++ b/binutils/bucomm.c
> +@@ -537,8 +537,9 @@ make_tempname (const char *filename, int *ofd)
> + #else
> +   tmpname =3D mktemp (tmpname);
> +   if (tmpname =3D=3D NULL)
> +-    return NULL;
> +-  fd =3D open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
> ++    fd =3D -1;
> ++  else
> ++    fd =3D open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
> + #endif
> +   if (fd =3D=3D -1)
> +     {
> +@@ -556,22 +557,23 @@ char *
> + make_tempdir (const char *filename)
> + {
> +   char *tmpname =3D template_in_dir (filename);
> ++  char *ret;
> +
> + #ifdef HAVE_MKDTEMP
> +-  return mkdtemp (tmpname);
> ++  ret =3D mkdtemp (tmpname);
> + #else
> +-  tmpname =3D mktemp (tmpname);
> +-  if (tmpname =3D=3D NULL)
> +-    return NULL;
> ++  ret =3D mktemp (tmpname);
> + #if defined (_WIN32) && !defined (__CYGWIN32__)
> +   if (mkdir (tmpname) !=3D 0)
> +-    return NULL;
> ++    ret =3D NULL;
> + #else
> +   if (mkdir (tmpname, 0700) !=3D 0)
> +-    return NULL;
> ++    ret =3D NULL;
> + #endif
> +-  return tmpname;
> + #endif
> ++  if (ret =3D=3D NULL)
> ++    free (tmpname);
> ++  return ret;
> + }
> +
> + /* Parse a string into a VMA, with a fatal error if it can't be
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187288): https://lists.openembedded.org/g/openembedde=
d-core/message/187288
> Mute This Topic: https://lists.openembedded.org/mt/101189179/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

