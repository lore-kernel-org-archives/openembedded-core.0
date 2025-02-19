Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC29C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 13:29:13 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.22101.1739971747021988255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 05:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mPz09Vgx;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6dd01781b56so81372626d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 05:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739971746; x=1740576546; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xB7QlR9rDmATtNgIiVf1Dmp0IGEBS3VlHe6f5tvBe7k=;
        b=mPz09VgxTfFuiuus5jXR9yApmaf0i4zetLKjwRQ3LHkzWH4SYAZTSqxgslaDBp8TU3
         InIFvl9UhmgloJomiB0a0NiBywAPR8hhtKWvF3kUtsq12/5DUj0z169tm507U9VScHXw
         bgA1nwYRHz5Tamlpn35NUeLlfslgLVzdndwsXx/u+8BHnpQjHPBvrGfLD0KL15BXCNG7
         6yrodLDu1cQ8EnsLDhnIwT+a1Q7/JLEQ6FTZMvDOmtcL/hAk8Aa8shVD4VxWnqTFLmLA
         1pwohSBrwKrwxCuNHBLavbEVrk0ga9GOy3RjYFb2pJvCX8rtbjXbUyvOfsr8P28aCxo9
         P+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971746; x=1740576546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xB7QlR9rDmATtNgIiVf1Dmp0IGEBS3VlHe6f5tvBe7k=;
        b=EyxfgDCg46gOO7m6tvgJwUSeiEEzWLyC6G+ZUpaJhEsoisHdn9+Dpvv+ugmsg8t3bM
         lS6gY3fealobF0YbSA2fvtMvGf6bMuGT9MN82l55BmhDrDzBoOVWFRNloKc5LdAF50M8
         2kBypBMs16ktBVMOL0Lahp+rZPCAD3+K9hV4egyWHDbYa+Of1SY7BtoX/WnVNVM1VhIs
         JShptM4pS97Z+hY0kno9FPHH7bWXVO47UTEs6CYqeWh6JCEdB2Ig+KIwodawQwkiOA/+
         zlnqsKGcZU3+iD7wY3iLT7jIYyBN2SvxS5ocIhf3sJZjm1FenY/wdVqOQ7YN+UIXFLTZ
         WJkg==
X-Gm-Message-State: AOJu0YyPih9jHzs4ciAkWrO5h35Ia2uFwfrTLEHlGXYp4IrrVSxVzCjC
	4NutWF6PsjCrDx6lASALXfWDdsALuTX48aKL06RQjuuvSNkrSGoT3zcmUEx7IFZ7/qTDdMjSpT4
	XK/f+MSgaAeV4H/MQYXNM9tGmnVu/2g==
X-Gm-Gg: ASbGncuaNm1aQ6VfAXJSPMzbjd+gxmPrwQmaLm8GlrnmEmF0QSDlhyYTJ8BRWZJoE/n
	coNlTQoa3gw8cpFX2WyDKoTmuhRzzo9TddcH2tXp+rQxbM5dqbyx2i6Tz3UQorB67muBTcM8=
X-Google-Smtp-Source: AGHT+IGcPVbfvwzRPTRVIaI7myYZaH5/PYWtgrYx94J64PsirX3VY2zZBRvYfvEaqwihw27Dw8p8QYTVno0BG4GSPXo=
X-Received: by 2002:a05:6214:2025:b0:6e2:4e1a:bc82 with SMTP id
 6a1803df08f44-6e66cd0907dmr275500126d6.35.1739971745933; Wed, 19 Feb 2025
 05:29:05 -0800 (PST)
MIME-Version: 1.0
References: <GV0P278MB0516B168ACC6F3595C48BFE88BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB0516B168ACC6F3595C48BFE88BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2025 14:28:55 +0100
X-Gm-Features: AWEUYZmVfshDjRkFigPaLifqGbPnYOdJGyowaU23AzD81Brs8hWbJ3FEupWeQWc
Message-ID: <CANNYZj-CjpPU5=4Gcc2S1-CLwn2MJ8qHn1Pdu5zP_Rza=rjBbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconfigdata
To: Jorge.SanjuanGarcia@duagon.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 13:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211708

We're not seeing the problem on the autobuilder (which has checks for
host paths leaking into target installations). And I'm not seeing it
in my local build.

Can you show an example of this happening? So that it's clear what
isn't being correctly removed without this fix.

Alex


On Wed, 19 Feb 2025 at 14:03, Sanju=C3=A1n Garc=C3=ADa, Jorge via
lists.openembedded.org
<Jorge.SanjuanGarcia=3Dduagon.com@lists.openembedded.org> wrote:
>
> Paths in DEBUG_PREFIX_MAP are not being removed from sysconfigdata
> files correctly as they are split into line separated values. Update
> the sed command so that it uses any matching patern from
> DEBUG_PREFIX_MAP instead an exact match of the full variable.
>
> Signed-off-by: Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
> ---
>  meta/recipes-devtools/python/python3_3.13.2.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipe=
s-devtools/python/python3_3.13.2.bb
> index 52fac76c00..656a73f501 100644
> --- a/meta/recipes-devtools/python/python3_3.13.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.2.bb
> @@ -291,10 +291,12 @@ SSTATE_HASHEQUIV_FILEMAP =3D " \
>      "
>  PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
>
> +DEBUG_PREFIX_MAP_REGEX =3D "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').s=
plit())}"
> +
>  py_package_preprocess () {
>          # Remove references to buildmachine paths in target Makefile and=
 _sysconfigdata
>          sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-=
libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \
> -                -e 's|${DEBUG_PREFIX_MAP}||g' \
> +                -e 's:${DEBUG_PREFIX_MAP_REGEX}::g' \
>                  -e 's:${HOSTTOOLS_DIR}/::g' \
>                  -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
>                  -e 's:${RECIPE_SYSROOT}::g' \
> --
> 2.43.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211707): https://lists.openembedded.org/g/openembedde=
d-core/message/211707
> Mute This Topic: https://lists.openembedded.org/mt/111268642/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

