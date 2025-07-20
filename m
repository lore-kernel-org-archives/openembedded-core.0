Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB4BC83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 18:54:07 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.23385.1753037643243116373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 11:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLBFRuzq;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-719728a1811so9187407b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 11:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753037642; x=1753642442; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhhFln8lp0GWSaXi05mxK0kuQWkAPD7BvnFPlriaK/4=;
        b=LLBFRuzqz2CCFP9d/aZjGAmVIqKO/m6o0V2lTA3iQc8UNKTEMDOkfS2/lPMZ4ge2sz
         T89yfy2SlC0CJ/CDPAupp53/8IQhGKLz72N22++R9fKjrnBk0Ve+tArO5Nk/6WzMS9jB
         9/UjWiFS2EcIBgMEhu6GxbIdfO3n1zJX61HmI2Fx8Pxr3KsSxx0mNieXn3KQIYQC/CKZ
         RZnNimjFyBd99jDi9/T1YPGoaxgM/Kc3dqLScfEQkf9+etnjHiMm8phdLVaKITalhIea
         dmLdUnTD0tY38vdrVN0bzbYKZN9+WCvXR+ycIrgFqHcsAWvmDhyYWWzcp1yjPazEbDyo
         F/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753037642; x=1753642442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhhFln8lp0GWSaXi05mxK0kuQWkAPD7BvnFPlriaK/4=;
        b=PmPM0wa02ktkNUDtMeavAlO8jPYJBx4V+xjBAAwpFgEU/XsnUiZ2KyPL3g3NF7Oil+
         /Xs5WvqLJ7yEkv8mYaW19EVB/zFrecEsyccqmeeGYkNATHVKOOa4NvH4DVoypG9sa5Nz
         SUjrpFC/koLTvFMzFuhmgudHoTNmV/hkrJ4ZlBenf3P5txrjXJuwJ00fqEZRRBqKxEmQ
         CFP+SzArAT2Vf5LaoxStEoGe4tYGFvLTELL7cB+1DysPTUXI0+MO7IgPTUlCF6u9UWB7
         iIE1w8bkuXqALiZmU+79v7sCiIV9PrRGQ1N6YqE4W3yuh0pA7clpLI5N2qvvTkfdSKzz
         f5jg==
X-Gm-Message-State: AOJu0Yyfnq3lX2v9IN0bh7DkVuoJG9Mmn+iyTiqG7vzNs9eDOiqP9xGL
	zwwvtvycNODxtFY+vf2PqaVA1I6W0pDNtnqH1d+63ZM6/6sxL9sbWuhv/FTtjX2w/1OTIuHqvY/
	zdSqoD0igQdnOjWSRceX0dusvg1+FDteR7my8
X-Gm-Gg: ASbGncv7NSaOpNN0xTrb6hs6hqK2fQ6uXHT/tJFIHYK/5u+aN0Rz30ePslsODHYB0Wj
	6g3/A5KJLU6Jfg4Ln6C5eXAVd3ZhqEvJ4vgbdaRvXpkanhLu/d9OznuflyChNLenIFI93zD6Ntc
	qx+NgVVEHfEXEJfojdQN2KrNbMQY27UaQSnFHKpYn6GFLR75SNPE9QRFBvNN3iy/mOQFFCIhFfH
	9/AL4Dy6jVFZXZbBXGB+egEb6Vq9kft
X-Google-Smtp-Source: AGHT+IFMFFY+mkYp+l+QnkByCDqPaNoCJI/e4DsJWA8a37LUF+0Nd2YSzUZM/drL5mGdZN4TxLRTPUGmfGpVbmhhJoQ=
X-Received: by 2002:a05:690c:3608:b0:718:38be:b3e1 with SMTP id
 00721157ae682-718a9823126mr186875437b3.41.1753037642228; Sun, 20 Jul 2025
 11:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250711064233.590809-1-raj.khem@gmail.com> <f55a9110-37ea-4a7b-9351-194a49788c1a@windriver.com>
In-Reply-To: <f55a9110-37ea-4a7b-9351-194a49788c1a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jul 2025 11:53:35 -0700
X-Gm-Features: Ac12FXxptQheN1tJT2w6NtCMsuXE3Nz9C2De-pSX_7-NOijlSIvJDfaQHJrboPU
Message-ID: <CAMKF1spoQFoVSkk+EqF1xwCBXcGVW6WXPpZjVuKJKogPFuHKXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] compiler-rt: Use clang for native compile
 as well
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 18:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220623

On Sun, Jul 20, 2025 at 4:45=E2=80=AFAM Robert Yang <liezhi.yang@windriver.=
com> wrote:
>
> Hi Khem,
>
> I got compiler-rt-native do_configure error Ubuntu 22.04.5 with this patc=
h:
>
>      /ala-lpggp71/lyang1/poky/build-u/tmp/hosttools/ld: cannot find -lstd=
c++: No
> such file or directory
>      clang++: error: linker command failed with exit code 1 (use -v to se=
e
> invocation)
>      ninja: build stopped: subcommand failed.
>
>
> I have tried:
> 1) Add libcxx-native back to compiler-rt-native's DEPENDS, there would be
> dependency loops.
>
> 2) Install libc++1 on the host, it doesn't work, get the same error.

you need to install libstdc++-devel that matches to newest gcc version
installed on the host.

>
> // Robert
>
> On 7/11/25 14:42, Khem Raj via lists.openembedded.org wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/recipes-devtools/clang/compiler-rt_git.bb | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/reci=
pes-devtools/clang/compiler-rt_git.bb
> > index 342a7b0e95e..4da85f29378 100644
> > --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> > +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> > @@ -35,9 +35,9 @@ DEPENDS:remove:class-native =3D "libcxx-native compil=
er-rt-native"
> >   UNWINDLIB:class-nativesdk =3D "--unwindlib=3Dlibgcc"
> >   COMPILER_RT:class-nativesdk =3D "-rtlib=3Dlibgcc"
> >   LIBCPLUSPLUS:class-nativesdk =3D "-stdlib=3Dlibstdc++"
> > -UNWINDLIB:class-native =3D ""
> > -COMPILER_RT:class-native =3D ""
> > -LIBCPLUSPLUS:class-native =3D ""
> > +UNWINDLIB:class-native =3D "--unwindlib=3Dlibgcc"
> > +COMPILER_RT:class-native =3D "-rtlib=3Dlibgcc"
> > +LIBCPLUSPLUS:class-native =3D "-stdlib=3Dlibstdc++"
> >   UNWINDLIB:class-target =3D "--unwindlib=3Dlibgcc"
> >   COMPILER_RT:class-target =3D "-rtlib=3Dlibgcc"
> >   LIBCPLUSPLUS:class-target =3D "-stdlib=3Dlibstdc++"
> > @@ -57,6 +57,7 @@ LDFLAGS +=3D "${COMPILER_RT} ${UNWINDLIB}"
> >   CXXFLAGS +=3D "${LIBCPLUSPLUS}"
> >
> >   TOOLCHAIN =3D "clang"
> > +TOOLCHAIN_NATIVE =3D "clang"
> >
> >   def get_compiler_rt_arch(bb, d):
> >       if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, Fa=
lse, d):
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#220135): https://lists.openembedded.org/g/openembed=
ded-core/message/220135
> > Mute This Topic: https://lists.openembedded.org/mt/114096532/7304958
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
liezhi.yang@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

