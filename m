Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16760C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 19:15:42 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.19207.1721848538206483842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 12:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRtuEkli;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-261112c303bso52425fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 12:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721848537; x=1722453337; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5a4A8UyZpm2bqzp5FUOPWfF7xzskX351sfV/nVzF8s=;
        b=CRtuEkliFoynr4q4Lwnog3j1mLj7+Ei7BdYdjgmU66ZIFjASTsq0sKs/kbXysPSzaC
         1IV1CTpDzKQ/ybRXezd/eNj8UFwWUhomVJWhXylP72kGL23pmfCv1fYqVVcWzyvAhK9u
         jjD4gaEHinIOUUjjUxItsz49mJH5/TgPR6fp9X16/i+dVCcqGJ450l4jfKXJI5tY4beF
         3X7ponWecsn+csAMN3S2CRL6Em2QOp0QtQlD7x+1adUhpkgF/2lH5YmEmId7tlS+5/g8
         V2ZcMcDWnMkxXauncZcMRd+Obv9wE3l44cEJtpiunEm2XYGwDZuaGmYsSfYJ+e7dqA7B
         pcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848537; x=1722453337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5a4A8UyZpm2bqzp5FUOPWfF7xzskX351sfV/nVzF8s=;
        b=R+zpmsnY7+wQtdpDgq2+VFGLCSIuIknq9KXM1zcbftERXr4RXO/boDjhRMK7Clr85H
         8kcGdS//tafcisuReQWcak4Ox3wG8wkEfPKNo8Get6u0y8LI15BZuSSwZjsUb/CIIhiP
         NDwHDZG62CJsCVK/rhrG0kV6/hep15xvP5C+fYDppJejK3uhwge0PHbgAQOXGyuHwlfi
         qlsfVHVuDoiu5k/R2f/RMDo7Ii60hBlFmndnqcIqjXcEpt+6E4AOjpMd9jgNHnsuxbkP
         L/N8JyxAgRwew8C4wVKssJDXuuoMa1gQUTKBNvDqE7JWOzX1AVlxj5HpVBnAuEGEqwII
         Xdkg==
X-Gm-Message-State: AOJu0Yza+qobM/OAK8xVI4GAkzVmdW0vgGXpOLNfUOg2JRMCNSGIt1Of
	L5dHy0OyoehfaT0YLiJ+2Ioz2lNbVM2vtXPnleeqA3Texvw7bVOi3tdVHc5kS5F2IVCVMh0RIvg
	AdX5WQbG4iYRQ+IUTysZQPStg8eM=
X-Google-Smtp-Source: AGHT+IGinXLSQY+6YNhnyX1LndCxsaUgdM3kd9X9pYZuCl8285qYWdpIlKqFkLozthvTfMbhVFeVKHwmvIPREkGGgmg=
X-Received: by 2002:a05:6870:8998:b0:259:8805:b634 with SMTP id
 586e51a60fabf-264a0fa788bmr638005fac.49.1721848537403; Wed, 24 Jul 2024
 12:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240724160832.2384962-1-ross.burton@arm.com> <20240724160832.2384962-2-ross.burton@arm.com>
In-Reply-To: <20240724160832.2384962-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2024 12:15:12 -0700
Message-ID: <CAMKF1soh-sFFHQwSw6uRffFjg_rb-+4Cnhef=6AVZRpRT8tJZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] python3-cffi: generalise RDEPENDS
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 19:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202480

On Wed, Jul 24, 2024 at 9:08=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> There's no need to mark these RDEPENDS as target-only.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-cffi_1.16.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb b/meta/r=
ecipes-devtools/python/python3-cffi_1.16.0.bb
> index 8e829794a56..dfe32c604bd 100644
> --- a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
> +++ b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
> @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "bcb3ef43e58665bbda2fb198698fcae67=
76483e0c4a631aa5647806c25
>
>  inherit pypi python_setuptools_build_meta
>
> -RDEPENDS:${PN}:class-target =3D " \
> +RDEPENDS:${PN} =3D " \
>      python3-ctypes \
>      python3-io \
>      python3-pycparser \

I hope the native version is not in the critical dependency chain.

> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202460): https://lists.openembedded.org/g/openembedde=
d-core/message/202460
> Mute This Topic: https://lists.openembedded.org/mt/107526225/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

