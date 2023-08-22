Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C392EE49A4
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 17:04:25 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.1626.1692723855027435351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 10:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GNIJVXju;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1c11d53221cso3049585fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692723854; x=1693328654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGoZ6Xx3Oa5KF7BAG3h7rBsIKh6ZuDETsXkbNW7yAOg=;
        b=GNIJVXjuVr6r3F2PGwEWsrr0oBcsUIss3ZUE8yynfLJosmRi+pK6dRH5Wf1nCuMREv
         eaAeqmzjCwEAk1vSn/aIISylCFboktkC2yOxxe2tUDTX0SKxhyajxVt/b7W/yv5DXWf0
         UVQlptZ2DVWXoBE4scd+lX++QiSUxg94njKRIc6Tf/ohzmeFrAjhBNGf2YyGvbxo5+bD
         TaRPb2aT0Qnsze9bnIQT6mDhXq9KnODOdcqupF4Uf+N9W60fbhPXN37XqjnyiopK53HX
         9C+KkiLOVK/cI/03UOMvpApy5jf9Q/FtwoBr222vZVRrQHRxy+8PKkIbwN1syO/Znii3
         ODwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692723854; x=1693328654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGoZ6Xx3Oa5KF7BAG3h7rBsIKh6ZuDETsXkbNW7yAOg=;
        b=J+X+4aM/2auFWmlLAH/IS3NhtG70a2WMpBWKyfDXvQ4vQbn1G9DVuHYzguRKa4eWw4
         p4ZNiS+pYmqzCFf3tymeAn7xd6j2NEgss8SlsjhQUAU72HIR1oV1Es9M83yp1SIncau0
         xbJKqmCEYX91PLnw8eEoWaJt8EgtQElJjEzpl+9Bx/tOSe1EQ+TP8GOAiL9VQ2O9tsPo
         n+GAnZwe55FmsxTdkCzm8NOvCSsvnPYQim7zcGx+4khBL/+LI8Oa4CDxLcL9AqvdggRy
         80VICxALC2PHsStpOd3HM2ozTazMISY8gkqrxECX+FqtSqFgzExuPhEgVLwIi/Y2Abuz
         0JQQ==
X-Gm-Message-State: AOJu0YyeuCoXdfwAGqI3PPt0HguQXZjPXkqIcZusSJkNObt81eF2Ntk9
	Ko95jeWJEGAIeRrE3g58KaZ1cUxzxKSNUzxOALbuAz0mq4IYxw==
X-Google-Smtp-Source: AGHT+IHxj2CMQvwdcoPVJoIdBfxNAvBozGI9n1nP01jniN0R9hDcVZJxlqT0guGLrhZfGaKBjhPZfoXs8aBaV+MwyUk=
X-Received: by 2002:a05:6870:9687:b0:1bf:42b9:e8a1 with SMTP id
 o7-20020a056870968700b001bf42b9e8a1mr12245154oaq.29.1692723854197; Tue, 22
 Aug 2023 10:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
 <20230817124612.1043464-2-p.lobacz@welotec.com> <CAMKF1so7HY+kgEgg6oEU9j0thdPuv-7qtjk3RvOkDEHT07nHwA@mail.gmail.com>
In-Reply-To: <CAMKF1so7HY+kgEgg6oEU9j0thdPuv-7qtjk3RvOkDEHT07nHwA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2023 10:03:48 -0700
Message-ID: <CAMKF1sp0R3i5Tq_3AJ38BnBA8bij7BqTPxv1pDs2=cjOxpNzyg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v13 2/8] package_ipk.bbclass: add support for
 ACLs and xattr
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 17:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186518

On Tue, Aug 22, 2023 at 8:58=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Thu, Aug 17, 2023 at 5:47=E2=80=AFAM Piotr =C5=81obacz <p.lobacz@welot=
ec.com> wrote:
> >
> > Extend OPKGBUILDCMD variable, with additional parameters, depending
> > on target distro features, in order to support ACLs and xattr.
> >
> > With fix pushed to the opkg-devel:
> > https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
> > opkg-build is able to create tar archives with ACLs and xattr.
> >
> > Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > ---
> >  meta/classes-global/package_ipk.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-glo=
bal/package_ipk.bbclass
> > index b4b7bc9ac2..a0f106e4ad 100644
> > --- a/meta/classes-global/package_ipk.bbclass
> > +++ b/meta/classes-global/package_ipk.bbclass
> > @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.c=
onf"
> >  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
> >
> >  # Program to be used to build opkg packages
> > -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> > +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.c=
ontains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTR=
O_FEATURES', 'xattr', '-X', '', d)}'
>
> I wonder if it should be an append instead, because these are
> dependent on DISTRO_FEATURES anyway and it does not work if distro
> features are
> enabled and these options are removed from opkg-build cmdline. So
> these are required if distro features are enabled. It will also help
> the distros overriding OPKGBUILDCMD
>

btw. I am encountering packaging failures in several packages using
zstd compression instead of xz e.g.
https://snips.sh/f/R42MbTZryH

 Here is my OPKGBUILDCMD

OPKGBUILDCMD =3D 'opkg-build -Z zstd -a "--threads=3D${ZSTD_THREADS}"
${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}
${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'


> >
> >  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
> >  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMM=
ENDATIONS") =3D=3D "1"]}"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186307): https://lists.openembedded.org/g/openembed=
ded-core/message/186307
> > Mute This Topic: https://lists.openembedded.org/mt/100799493/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

