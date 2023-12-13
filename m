Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D8AC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:45:45 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.48105.1702500343701341514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIlEZYkY;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d852e06b07so3813666a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702500343; x=1703105143; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1JP6DfbGhE4Bs2JcdAEgUpyi1/E1Q0TLYuAxsibH1I=;
        b=WIlEZYkYGg9SUFYCVqW8gUF6DbVjLO64NKd9b5SIahOeVOizxqQaF6a49gO3FkP7Wl
         aS1uppc5NktlUQ13HLS+o4sEp7fyGnhgnhzyd8+0hdxKmzob1Xm2Qfy6xjGe/L5a7dQc
         KjdvNumDUKo+oJ5r1WJwVLhofv0Y3VwjyJMmX8hSE1jyyJEZt9IaQHBxk+vus7bTC5kH
         HUmvk1vzM796GTBI6AWcuoxLv2nDdpDLe0QZxfQD360iXXoSSw5tN+rzMGTulKIZ6JUJ
         UnP2Yt2Rssz9Y1ilQiQ83MQAgFPOqlkw0gMJLeHNTwbhCJ3DAIFwbOERHUUbRD1O/Vbw
         RVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702500343; x=1703105143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1JP6DfbGhE4Bs2JcdAEgUpyi1/E1Q0TLYuAxsibH1I=;
        b=VecvOjNNUsxuuZWZpnP3jASXknaMUxlB7q9ezOvh7I1KdY8WHOVwsInIxbkMwpb9tE
         ECKDjgFPcB8sbex4oZI4jABFkerjaSNqV6rpwhjHQjimyMcFXs+HjRnz5VWzdtZ9wHhX
         UsZHmauSkCLrTK3mJOv7G56AGbzFqDmFnabqUU4B5imgOumn6kTIZiFBlQvfHVWTXUz3
         4Tm0IWnyFcQbFHr3qqRR0Q3xNc+jft2obAol6+hw55XVa3llk6KapdDoKdeOSxSnSQtE
         NHOTJR6wJWXTDne91nHuQvqbBKXTMH7TMXREcc+g5G5MkcO49jvJooLwQQcBpKws7Rxt
         yKVA==
X-Gm-Message-State: AOJu0Yyn/CO9ccYhxC/bvwmRvN5lIy1KHJ9s05p0f8jJjmQYxyTEuvpb
	DGTyvWZkr3AnUpQNV5by1UripcmyK9QFqdYEyIzcK8NS
X-Google-Smtp-Source: AGHT+IFBm8Gtp9rbLWVUmAX9XDH1obcHXB/Z+WzWHplA0QI1UfC/eCE1u7GmnQAGccOGJBbRwLzFnaq+01gIor5EmN4=
X-Received: by 2002:a05:6871:453:b0:1fa:ea88:9b9a with SMTP id
 e19-20020a056871045300b001faea889b9amr5631435oag.43.1702500342783; Wed, 13
 Dec 2023 12:45:42 -0800 (PST)
MIME-Version: 1.0
References: <CXNASYPMN4HU.28KB1ZM3347U5@joggee.fr> <CXNASYPMNU9N.2AKRQ4ODCZYTH@joggee.fr>
In-Reply-To: <CXNASYPMNU9N.2AKRQ4ODCZYTH@joggee.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Dec 2023 12:45:16 -0800
Message-ID: <CAMKF1sqUzNwDkevyhYvFdCgTMWOagqzhA=s4P9qXrSn2+_c05w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] lib/oe/package: add LOCALEEXTRADIRS to
 define extra locations for locales
To: Jonathan GUILLOT <jonathan@joggee.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192320

On Wed, Dec 13, 2023 at 7:07=E2=80=AFAM Jonathan GUILLOT <jonathan@joggee.f=
r> wrote:
>
> Some packages may contain localized files not located in
> /usr/share/locale. This new variables allows to add these directories in
> dedicated locale packages.

I think using _ to separate the words would make it more readable so
call it LOCALE_EXTRA_PATHS or something.
secondly, it needs to be documented as well.

>
> Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
> ---
>  meta/lib/oe/package.py | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 2f7a50e144..fc8b20324e 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -653,24 +653,37 @@ def split_locales(d):
>      except ValueError:
>          locale_index =3D len(packages)
>
> -    localedir =3D os.path.join(dvar + datadir, 'locale')
> +    localedirs =3D [os.path.join(dvar + datadir, 'locale')]
>
> -    if not cpath.isdir(localedir):
> +    for localedir in (d.getVar('LOCALEEXTRADIRS') or "").split():
> +        localedirs.append(dvar + localedir)
> +
> +    locales =3D set()
> +    locale_found =3D False
> +    for localedir in localedirs:
> +        if cpath.isdir(localedir):
> +            locale_found =3D True
> +            locales.update(os.listdir(localedir))
> +
> +    if not locale_found:
>          bb.debug(1, "No locale files in this package")
>          return
>
> -    locales =3D os.listdir(localedir)
> -
>      summary =3D d.getVar('SUMMARY') or pn
>      description =3D d.getVar('DESCRIPTION') or ""
>      locale_section =3D d.getVar('LOCALE_SECTION')
>      mlprefix =3D d.getVar('MLPREFIX') or ""
> +    dvar_len =3D len(dvar)
>      for l in sorted(locales):
>          ln =3D legitimize_package_name(l)
>          pkg =3D pn + '-locale-' + ln
>          packages.insert(locale_index, pkg)
>          locale_index +=3D 1
> -        d.setVar('FILES:' + pkg, os.path.join(datadir, 'locale', l))
> +        files =3D []
> +        for localedir in localedirs:
> +            # Remove dvar prefix
> +            files.append(os.path.join(localedir[dvar_len:], l))
> +        d.setVar('FILES:' + pkg, " ".join(files))
>          d.setVar('RRECOMMENDS:' + pkg, '%svirtual-locale-%s' % (mlprefix=
, ln))
>          d.setVar('RPROVIDES:' + pkg, '%s-locale %s%s-translation' % (pn,=
 mlprefix, ln))
>          d.setVar('SUMMARY:' + pkg, '%s - %s translations' % (summary, l)=
)
> --
> 2.43.0
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192302): https://lists.openembedded.org/g/openembedde=
d-core/message/192302
> Mute This Topic: https://lists.openembedded.org/mt/103150560/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

