Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6339C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:26:21 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.86358.1677489973761016081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bj0DZaog;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id s20so7596220lfb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 01:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677489972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUHaXT7XNBZW9IBfut/O6CUhdIAFn0dFbyWD+vciy4Q=;
        b=Bj0DZaog9O4UR31Ev9N2FVQHCsUoPN85D50Px2hxRV79BdAebhxYIljgMSIP7KWifL
         olIXKR02AwT11HxLtLG/PyaxKA35uvkO1PJmQKDeox+e8cCMpJsAnsNtKxS9osepiIwU
         Fw1+VLwiOqjcwQySjJFfAOI8UY05EsH2DQQAo9AidoX7D+GGkR0cf56hTSWfFzzluT3B
         7B+AFVrNKaiPxf85wl4W0BqH3azf0X4djBM7NBHDi9ODaoXXDy0AnzVB1gTOhsYIumUA
         h64eBMfyLUoEI/rCWzkeFtnHhBUUV8/om8maKu9Huu6Zoh0aQjILppGeNsHmAtix80C6
         QMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677489972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUHaXT7XNBZW9IBfut/O6CUhdIAFn0dFbyWD+vciy4Q=;
        b=V1Tg+dMKGJIDkLPBKLdKYRsjP/71wk3+8nvpD7ni7wpkmsp+La2qWEU1QqjnVPTNtj
         5uv02hqKvuZi2kMoRk98U/rZAQc6+365e1sYKVgIPNbFKGlIYEC83HOv89BUKjfQqc1j
         9lchObdJJ6W4fY9PXK6Nu+0FG7uKC5obn8ylnqMCKVeGWx4JuZk0KUmwHef+NnDlezU3
         uG4uBtGY5J1UMv1eMlOXHVAcsLY2O9Ef62oTMwlzXnvTdRhmzd2grdwrr1qXFnjaRodB
         IJOgf7vNzJQBIUSqvYq6beHqH8aCJ1mkFaiRwReaK3j/+2RYTTPJegIxqdg8vxIsbI7L
         4qTw==
X-Gm-Message-State: AO0yUKVhJxPhbkVrcM/7iW1sIRSIeNlwvO1GueDSMUBzXs1opGjZ8B5+
	yWkJFJU9CRj+gm0Da8EpvwAFm9uvNLctG8lsT1K40d6N
X-Google-Smtp-Source: AK7set+PKAG7UjskSVpF2m8KuU0JQnvi48RlhUZ1UQOMlnU065U8sZGQjk+ViEKZh9sP5CR9A8fjUEP92cPSYztGypU=
X-Received: by 2002:ac2:53ba:0:b0:4db:5133:59a6 with SMTP id
 j26-20020ac253ba000000b004db513359a6mr7266865lfh.13.1677489971971; Mon, 27
 Feb 2023 01:26:11 -0800 (PST)
MIME-Version: 1.0
References: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
 <1677206695-16822-2-git-send-email-wangmy@fujitsu.com> <cdfcc4e555f8093eb7672e167af45933ac27730e.camel@linuxfoundation.org>
 <OSBPR01MB184582912E60125C5135B509DCAF9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB184582912E60125C5135B509DCAF9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Feb 2023 10:26:00 +0100
Message-ID: <CANNYZj-hgt35ierBtGbKXRCnVp21hoGqMETXZ7C30oBHv7DybQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] vala: Fix install conflict when enable multilib.
To: wangmy <wangmy@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 09:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177782

You might want to look into why this item gets installed in the first
place. Multilib as its name says is meant for multiple sets of
libraries, but not executables.

Alex

On Mon, 27 Feb 2023 at 07:51, wangmy <wangmy@fujitsu.com> wrote:
>
> > This looks a bit odd since crossscripts wouldn't be installed on the ta=
rget?
> I also feel a little strange. It seems that this file should not be insta=
lled on target. But I'm not sure, so I didn't delete this file from target
>
> > Also, when posting these kinds of changes, can you show a diff of the t=
wo files
> Compare the contents of the two files as follows:
> diff -r armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-vala/0.56.4-r0/imag=
e/usr/bin/vala-gen-introspect-0.56 cortexa57-poky-linux/vala/0.56.4-r0/imag=
e/usr/bin/vala-gen-introspect-0.56:
>
> <libdir=3D/usr/lib
> >libdir=3D/usr/lib64
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: Friday, February 24, 2023 6:16 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/4] vala: Fix install conflict when enab=
le multilib.
> >
> > On Fri, 2023-02-24 at 10:44 +0800, wangmy wrote:
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Error: Transaction test error:
> > >   file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted =
installs
> > of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
> > >   file /usr/bin/vapigen-wrapper conflicts between attempted installs
> > > of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  meta/recipes-devtools/vala/vala.inc | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/vala/vala.inc
> > > b/meta/recipes-devtools/vala/vala.inc
> > > index d3daee37dc..90689662cb 100644
> > > --- a/meta/recipes-devtools/vala/vala.inc
> > > +++ b/meta/recipes-devtools/vala/vala.inc
> > > @@ -66,3 +66,6 @@ PACKAGE_PREPROCESS_FUNCS +=3D
> > "vala_package_preprocess"
> > >  vala_package_preprocess () {
> > >     sed -i -e 's:${RECIPE_SYSROOT}::g;'
> > > ${PKGD}${bindir_crossscripts}/vapigen-wrapper
> > >  }
> > > +
> > > +inherit multilib_script
> > > +MULTILIB_SCRIPTS =3D "${PN}:${bindir}/crossscripts/vapigen-wrapper
> > ${PN}:${bindir}/vala-gen-introspect-0.56"
> >
> > This looks a bit odd since crossscripts wouldn't be installed on the ta=
rget?
> >
> > Also, when posting these kinds of changes, can you show a diff of the t=
wo files
> > please?
> >
> > Sometimes we can tweak the files so that they can become the same but i=
t is
> > hard to know without context.
> >
> > Cheers,
> >
> > Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177774): https://lists.openembedded.org/g/openembedde=
d-core/message/177774
> Mute This Topic: https://lists.openembedded.org/mt/97198850/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

