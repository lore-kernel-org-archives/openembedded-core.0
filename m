Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED9CF46139
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:57:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19169.1774277145091742446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qA6uiZDB;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2418D60130
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C555EC2BC9E
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774277143;
	bh=v8vyUurJyxQAM213g9wP40DLkgp7mdSSkZ2DsGKYNuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qA6uiZDBWE1i0cLK2s96/t/bKZZRG4+RisKI9ajOm8lZmELXA6g+rI9tPRVMk9qmG
	 6tJhfbj3olHXXybTMcjz84qDH6FmCZZuipKGyW8um3FjDaiOgV6zOANk6nMgx7VKBO
	 K9r0GRlBQr+jCzED/u1ITv6Z0E2TgeZGSaI0Nvfd5N8v2E1fR49PNvSyb1hZzu7E9j
	 wcab9rR6KIL1ipzpqbewkq+t3PvyEVS3N4Q6ohpA9vaSwYsPJSqJbLVkta7VlwgHPB
	 HjYfND6LM14l62QGzUOic1btNrC36jGLc71J3xmU2MRBF7Ng+zuWtGV3RPZ1FfCfJm
	 rGQZQjFiwlkjw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so3269541e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:45:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTE91lOzyfST13pqprRG3NA/nKA3UMU0iT1uvA5cgE7yvbFS9X+d0VklbZpo8UjgEGp2j+upLgvZTYEvfj7zr0xQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYNE+JGPJ3pAuk1iUbpszgHvsKsWgnkXSkJwxyOAzqRBox9F2I
	VsCGuk9zr+CxEwsQA5WS0yL0FdP5cGbLKzOu81klRnZUBQPBClrKU1sflfDMMx6B8Ll7G+EB7zH
	vfVbCLJWdcVPAgoP2iEwcDeBuhoR84fsjo/8BWIk/9w==
X-Received: by 2002:a05:6512:31cb:b0:59e:1954:1d3f with SMTP id
 2adb3069b0e04-5a285b844f0mr3572654e87.44.1774277142459; Mon, 23 Mar 2026
 07:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com> <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com> <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
 <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
In-Reply-To: <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 15:45:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc29fgKQ8vMYyTB7eHzhrbxp44o02Tq73dYhjTz45FHEQ@mail.gmail.com>
X-Gm-Features: AaiRm50f_SuQ4bGDG9P9QQn1Yk0pF-b0Lh55F87UP0AEC59g9ZuEVz7EgfOSeZQ
Message-ID: <CAMRc=Mc29fgKQ8vMYyTB7eHzhrbxp44o02Tq73dYhjTz45FHEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for free threading
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: "Zoltan Boszormenyi via lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233744

On Mon, Mar 23, 2026 at 3:40=E2=80=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2026. 03. 23. 15:34 keltez=C3=A9ssel, Bartosz Golaszewski =C3=ADrta:
> > On Mon, 23 Mar 2026 15:23:52 +0100, "Zoltan Boszormenyi via
> > lists.openembedded.org" <zboszor=3Dgmail.com@lists.openembedded.org>
> > said:
> >>> Any hints on what could be wrong? The same config builds fine without=
 the
> >>> new option. It's just a core-image-minimal on poky with a few python =
packages
> >>> from meta-openembedded.
> >> The problem is that now the directories are
> >> ${libdir}/python3.14t and ${includedir}/python3.14t
> >>
> >> Note the "t" suffix.
> >>
> >> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb
> >> b/meta/recipes-devtools/python/python3_3.14.3.bb
> >> index 7a1ad1e386..492f2f93f0 100644
> >> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
> >> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
> >> @@ -47,7 +47,7 @@ UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\=
d+)+).tar"
> >>
> >>    CVE_PRODUCT =3D "python:python python_software_foundation:python cp=
ython"
> >>
> >> -PYTHON_MAJMIN =3D "3.14"
> >> +PYTHON_MAJMIN =3D "3.14${@bb.utils.contains('PACKAGECONFIG', 'freethr=
eading', 't', '', d)}"
> >>
> >>    S =3D "${UNPACKDIR}/Python-${PV}"
> >>
> > I think it's more fine-grained, because I'm seeing this:
>
> I also see other issues popping up, first in python3-installer-native.
>
> Probably this setting ("python-freethreading") should be a
> DISTRO_FEATURE and then the python3 recipe would use that
> to enable its PACKAGECONFIG.
>
> PYTHON_DIR in python-dir.bbclass should also be set accordingly.
>
> I suspect that both native and target builds of python3 would have
> to use the same setting, i.e. DISTRO_FEATURE and DISTRO_FEATURE_NATIVE
> must contain python-freethreading. Some build helpers (skbuild, etc.)
> does not seem to distinguish correctly between host python and target.
>

But is there a config for which it ever worked?

Bart

