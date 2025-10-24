Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49C8CCD193
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 02:24:56 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web11.719.1761272693378804229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 19:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mUv7Rs10;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63e0c6f0adfso1577091d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 19:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761272692; x=1761877492; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PTR628qoxT0gyIGUebpOwc+pUmWJH23wAN5mJZN51E=;
        b=mUv7Rs10AAimc30LGvxGhWNDLkQuJZnsMILr9I8KFQBU1AKA4hjoX6Qi3s/ig0f3KA
         V+6TJ6WT0vZcZmacy1NG1uiUNQ2btaRo15912cjGbJVus8tLD5bQDNAm0ZctLOibqjTi
         IEnYYGBhlLB3MN6neybPtupSiBQCn5NGm2WaphA6q2JrPS6eFmS6wfXxZxtmGs2gLnN2
         8JHYDbd4n1APWsjuT9pmPOxzmAx6ho2VYs2v4kpZSHpSi0nHrmKC5RS5cJSEirFpurtd
         4YuvQ0v1xV518fl1UdwHpQK3DI+qeBqabYJKO/gPErEg+iHdSEWaPpIdUjrCQUc58PuJ
         gAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761272692; x=1761877492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PTR628qoxT0gyIGUebpOwc+pUmWJH23wAN5mJZN51E=;
        b=VrLVkJIM9Swly1vXbNYWPfZOd2KLyVJA0xh0DDJB5JPMm/8d8dDEgatdcITA9oCvGc
         GQWRbd2AocN5I/B0JPlQT1XjCrbIlwQ1qCQDwo1GEZV2541PKwqYkOHM1RNloU3MMWjO
         VcHLgx7i9QBnEu+nYUiQuaRwgO+UJCbUtuJVi8vhrPEFsxTtwbpL36JZ7V8nuyRR+72G
         Ya3KtQpEwzSr4yuCXEzSe7fPJwPXKXSwPs4c898l62xvyciwq1Pc1i/w79mhyKSWrrnn
         Xe72Lt57EfLc8HgupgnvYMFp/LRZ06XVkRA/gOx7KqCRdATWx26wrA05iaGK2lrXOlVw
         pHeA==
X-Gm-Message-State: AOJu0YyU7YkbcyUqCRpU0OUAt/Lws5BWudm3u+3crz7IBIpZhvt811HP
	Q8BRNZvO+0Y5c9ErymbSLRCYXXhoDByn2xisk88mmLuz8ScChqKQfwN5XfIBQQBsMH0HoNk5aa0
	IKYUd7goiF9v7oS1FAb0v38MKpwzN22g=
X-Gm-Gg: ASbGnctT4bGGszRLFbkgK5kOjaZHOPRbQ2SYjZu5ymxFSC9KgcHN/ng+ERM1pyQ8Dek
	ad/98OsmYiOs+TFzTuWHSdEo6MFcxWyY0RzuBFOuefKfpNFmwzMgkt34e2Ofjyct+6q0OI6i4gI
	RjqXA1VKL/lmzd1czujTLw+u94gqTrQFFXOQ63/cBpRKtmxShhL+Atq/a0vM3S3l7hpCKRbqbqx
	ONKw64nzalAxoqyrKMoj9uwRd/l6K2iXV8M01nSeeB/ZXoSnIz/fKAmCfcYwFzw1kVtwyWt4OSD
	sJ5k5OhKXaXrVRaVLjPgfBqXUu/xgraMmZ1YZcTnIDz4AHa8xk+veOt2nnUYwJWD1qfeadinBZH
	5uckEFyKCLJY=
X-Google-Smtp-Source: AGHT+IG/2lc+UBU3z8l3CC+jFNjcCdLxgUzsMVjuxS6q5ZEt8xYkrA0kNoJyRzZiL5oZgYko0JFWkvqKYa52Rk0Zr3U=
X-Received: by 2002:a05:690e:dc1:b0:63e:2906:e7f7 with SMTP id
 956f58d0204a3-63f434d579emr531171d50.8.1761272692498; Thu, 23 Oct 2025
 19:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251022050810.1572184-1-raj.khem@gmail.com> <20251022050810.1572184-4-raj.khem@gmail.com>
 <7220B7D5-A1C4-4677-A22B-68BBA3621700@arm.com>
In-Reply-To: <7220B7D5-A1C4-4677-A22B-68BBA3621700@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Oct 2025 19:24:26 -0700
X-Gm-Features: AS18NWDjNV9w3N28JPvwm8rlfHRBzSeJJG4TdLpiZVsMYn0uDRIQw2u6sOVpSI4
Message-ID: <CAMKF1sp4OdTUnwnCQbzLW-ZB0OdmcoU2R1Uw0jnEeVKMVMn6rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] pkgconfig: Always use gcc for native compiler
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 02:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225276

On Thu, Oct 23, 2025 at 5:17=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 22 Oct 2025, at 06:08, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > It has build errors with clang especially on native builds.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/re=
cipes-devtools/pkgconfig/pkgconfig_git.bb
> > index f537c635ef2..103b3e042a0 100644
> > --- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> > +++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> > @@ -20,6 +20,8 @@ SRC_URI =3D "git://gitlab.freedesktop.org/pkg-config/=
pkg-config.git;branch=3Dmaster;
> >
> > inherit autotools
> >
> > +TOOLCHAIN_NATIVE =3D "gcc"
>
> How does target pkgconfig build with clang, but not pkgconfig-native?

We do not build them the same way, e.g. native is built with
--with-internal-glib and that causes additional sources to compile
I did not note down the compiler error which I should have noted the
error messages but the build is not gone. I will re-create the env.

>
> Ross
>

