Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A96AC02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:09 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.121473.1738688704259496781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 09:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ieAtrHxL;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f2b21a0784so1498124eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 09:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738688703; x=1739293503; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m38PTLrD6e+XavDCOMymGiM0h07hByX6+HsfLmaooo4=;
        b=ieAtrHxL77tr1/xTKJ4+QWmLDvjcsG43V0dnyk8ZD9W68ZD5yYhBmFS1ZxCZadSWA3
         3/mDF8ZRA6SAkVfj9oqSBiRQO5dBtRwuK4qSv8yHuXPKTs6D3vqP1GMd4CDmjxzAafQf
         qU6ZcmLIJssp9TpPTu/v8U0CyRqCidytqZ2AAFCvZpa7AqfdBddmXjVH/D76Qoyxq1RV
         B5n7vjaV8xS/d/GWItjXh9FfHokByuXhamrSu9XnjSi7UYNouMDzTu694u8NGXhBDlVY
         nMFaU88UeO5PnWBUh8f3tH+mTmmuW3uwVnxxldnMoEzw2P58GQHp19qdVa0+i2OtN6t5
         +ZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688703; x=1739293503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m38PTLrD6e+XavDCOMymGiM0h07hByX6+HsfLmaooo4=;
        b=NcGN2MvS9nDf44w9CvZBkOLlfdvFE1KwLl0YzQlVxEibs1Z6zc08UtbSdowTNxQ9qs
         GkNuolgoB8yd1XR+k67pubVkQKs08PsIrAGDZtbu9jsGyid4lAMCR85KlhS7sx8C0GU6
         Fm0UWNiH1J0AamosrJN7uuOXfHDWpLYqWNhd4h24QYeEzAxQ57FUHsXQkMcaPYYf8skI
         zXHOihUAyLyI3U/HUUUB/LFC+Wm/HQMXsHU20a9QQQyIipwO5ZPUE0gjZivrqntb1B7w
         wKlLYg7kBSpJy9cnaZogUqrxrPIBmwibF+btAJsVBNmy1r+Oisvtsh7rSdGXWGgw5u/n
         mZZg==
X-Gm-Message-State: AOJu0Ywy/B3vnWZ73qCnJ9mDOpLcIbr70ZJ6vwRQMMJOT8RZojsOx/CU
	ExsYRXaD6PwsdJfagBgsuIF/NgOnrNkY0J3NqupkoQVqxAZId2jgrVbf4UywOT2kr1jKs96h4yM
	19FbmHRlZQaINgFNfjjQ2opmG/7w=
X-Gm-Gg: ASbGncs16y3iW2wP1QKT9xY1Svw7czimdzDaqC/Y+Ha4qJlLFgBZHXpRp/PBnC11/mN
	O/CQg3pIQt5J4T+8kEEcmUAmM8TPSP4V9GxLXprlFMiknG8clN9J9PeSLaS0ntvEycaViXNisej
	1+EAovZrJZF+fDEr0wB4g6yC9lSxfHIg==
X-Google-Smtp-Source: AGHT+IEIylpnJ/kvuMbzw/7omUBRrNHAqPtcjYVrdEy2t9j9SbKLtb47xufuwnMsyr47UjsF3pcpo5MXSDxR77f3Njo=
X-Received: by 2002:a05:6870:6190:b0:29e:2422:49f9 with SMTP id
 586e51a60fabf-2b32f28f374mr15700026fac.25.1738688701774; Tue, 04 Feb 2025
 09:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20250130165359.137315-1-raj.khem@gmail.com> <CA+chaQc834fd6cdX5NrxZ+7TzJ0KmG0jeuTTYbMmmPrxy90yuA@mail.gmail.com>
In-Reply-To: <CA+chaQc834fd6cdX5NrxZ+7TzJ0KmG0jeuTTYbMmmPrxy90yuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Feb 2025 09:04:35 -0800
X-Gm-Features: AWEUYZlf1zhbZOZxFXlUxSRhL27hRnVG3jeKlXEqxYRkPC_tA7xFJaprWRGe04s
Message-ID: <CAMKF1spVZiAWyd9n0N4cGVvmw3k4Y=mkOjhmGFF0EFuQ2sSj0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.41 release
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 17:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210814

On Tue, Feb 4, 2025 at 4:22=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> On Thu, Jan 30, 2025 at 5:54=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> ...
> > diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/met=
a/recipes-devtools/libmodulemd/libmodulemd_git.bb
> > index d3bef833062..82749d94cde 100644
> > --- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> > +++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> > @@ -22,3 +22,5 @@ BBCLASSEXTEND =3D "native nativesdk"
> >  GIR_MESON_OPTION =3D 'skip_introspection'
> >  GIR_MESON_ENABLE_FLAG =3D 'false'
> >  GIR_MESON_DISABLE_FLAG =3D 'true'
> > +
> > +GI_DATA_ENABLED:toolchain-clang =3D "False"
>
> Is this libmodulemd_git.bb part included by accident?

Indeed. it is needed but it can be a separate commit. I can send a v2

