Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22137C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 12:40:11 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.13471.1741869609412979688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 05:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O7GbC+Rc;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-307bc125e2eso10737301fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 05:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741869607; x=1742474407; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IRl3ztlzgpIAq+n7pCHCV4/eygg9cZ/Hl/n/4KqvwU=;
        b=O7GbC+RcTgM7LbmaAS5bW7zmMVXZD9kH1Ichs3uNpDaSYH96NLQ9WEj+b/+LHDn2Ci
         +6Bo610XC+3L3kHRcwoC0Cxtx5oqr6o8u9yY/GtCwM6TmlJQ8tI0IOs2NXS3gcR2A/xc
         AlvwhIfABgHz3FR2UpodA6a36FDyL3WW6hwnOwNOVEC3mPHKtdhyoghNY20LD0ooZQVu
         /OqkOsy/vpBbpwW6aXhqR2zo0WejZH3mQkeyrJ2xTq7UUyBWnIoaAULGnb4FlBgjJpJ4
         67WPmdlv7zGBG/CKoKYui8+6fFt39ifB5B+NSzZ71bLGZRVZWf4ItDTiQOhyDmKknM3J
         jtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741869607; x=1742474407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IRl3ztlzgpIAq+n7pCHCV4/eygg9cZ/Hl/n/4KqvwU=;
        b=HytIe7RfzFd4jvisQXXZcxG93qV5NeRf821M4nsiFXEKJRoQ0rndTR+20hC2rMiL5u
         7NjVCfyHXpvKj9M8ON59a1dd/3qiXfmJsABxaE/c7ViA1171yRe7/YVNVDGZnD2nN2HQ
         s3vZfLD35E7BMp6jRAbPmcM2X6fTuO3c78mzCNQLKzdpnl0+asWzxYfxIBdgvubIB5gu
         pq44aDUwA7N6ZmjHMHuIE/B1Ziz+370bqDcSjyfCX+cRhcDeE+UJArzKrOdiaIRx0/uW
         JCZ34qwJ7BSfMnoQmEUIGsTmsPjE5Q6ZMeBR5RQ24v6lw8Bj937liGjOJ1C+IofJyeC0
         AnqA==
X-Gm-Message-State: AOJu0Yyx5oMXw+6wMFsHtOIJfu2YRK23hHMtuzO2tc/LE06VskInWNvf
	miaJae/aZxOtjniVl6DrVttnCBQh6njBwmRmgZF8iomVo4lr5jbZdQ6uWl71sGBhPmRASvtFw/o
	pc00Ul4VEIUeeXG5SuMMwD4QXHsM=
X-Gm-Gg: ASbGncuFRmbgiC6mbwOnYhBhwQpW2yxZ+DyHOr+02DpPWbnLFXq9/Sajf1GBjrGU5qL
	nKEwBtqEprwrdyG6djKyEfCXfgtoY2kxlHzxqlMrznxjpWc6OQLI2j3XDp4PBexvZaRLlaaa7TH
	/tGO7xguplZCGnGKxrq+7NPpZhuUJIVGeojpv+Js9iqEqhFLldqr5dwD3/MinIGwa5wQ==
X-Google-Smtp-Source: AGHT+IFqWPXWW+oXY7Xz1TtjEYSlOrp3ufTf7RGhuFvCA1ooaOdic6s8DwFuvGceO+c5iAgMvybKBDWkn8NQgJkmFWY=
X-Received: by 2002:a05:6512:1597:b0:549:9009:77c8 with SMTP id
 2adb3069b0e04-54990e2be52mr8015016e87.9.1741869607237; Thu, 13 Mar 2025
 05:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
 <20250313-upgrade-kmod-v2-2-2103ca9a26ad@gmail.com> <E977DE92-CCAE-4406-A567-09FAA1F1B25E@arm.com>
In-Reply-To: <E977DE92-CCAE-4406-A567-09FAA1F1B25E@arm.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Mar 2025 12:39:56 +0000
X-Gm-Features: AQ5f1JpAfr1O7Odaa3P9UeGUpVJrnTeo7FNhkMpFZJUwIhk_2tsqF_1BcU19egU
Message-ID: <CAO5Uq5R=psoE2GnZWpVtaY-m_owdzv5nY9k0fGh267Nv9YLcaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core v2 2/4] scdoc: Upgrade 1.11.2 -> 1.11.3
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 12:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212768

On Thu, Mar 13, 2025 at 12:26=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> =
wrote:
>
> On 13 Mar 2025, at 08:58, Alex Kiernan via lists.openembedded.org <alex.k=
iernan=3Dgmail.com@lists.openembedded.org> wrote:
> > inherit autotools-brokensep
>
> As this recipe doesn=E2=80=99t actually use autotools, this is just misle=
ading.
>
> Please emove this inherit and just implement do_install instead:
>
> do_install() {
>   oe_runmake 'DESTDIR=3D${D}' install
> }
>

ok

> > +PV .=3D "+git=E2=80=9D
>
> This is only needed if the SHA doesn=E2=80=99t match up with a release, a=
nd your patch clearly states =E2=80=9Cupgrade to 1.11.3=E2=80=9D.  But in g=
it:
>
> commit 0528bcb993cac6c412acd3ae2e09539e994c0a59 (tag: 1.11.3)
> commit 29306d8dde650f5ac2bcc067f3c1d3bcfcac7a1d (HEAD -> master, origin/m=
aster, origin/HEAD)
>
> If we=E2=80=99re adding a git snapshot of effectively an arbitrary git co=
mmit (just the current master), please make that obvious.  I=E2=80=99d pref=
er to stick with a release and apply patches unless there=E2=80=99s a good =
reason to use arbitrary commits (like, there would be tens of patches).
>

I'll pick out the patch which use that in place of the local one so it
clearly gets dropped next update - the others commits look minor

> >HOMEPAGE =3D "https://github.com/ddevault/scdoc"
> >BUGTRACKER =3D "https://github.com/ddevault/scdoc/issues"
>
> Both of these are wrong now that the repository isn=E2=80=99t on github a=
nymore, please update.
>

okay

> > +RECIPE_MAINTAINER:pn-scdoc =3D "Unassigned <unassigned@yoctoproject.or=
g>=E2=80=9D
>
> If you=E2=80=99re adding it, please consider being the maintainer.  It=E2=
=80=99s a trivial tool so the burden shouldn't be too much effort.
>

Huh, I really thought I did that, but clearly didn't.

--=20
Alex Kiernan

