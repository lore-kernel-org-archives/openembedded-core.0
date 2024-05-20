Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A65EC41513
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 18:50:59 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.709.1716231051998971197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 11:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hVeyhZwM;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso28905731fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 11:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716231050; x=1716835850; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1sWMUw3B4AjVeujsjOysaK29eWJ41BB8m6msPbUa+0=;
        b=hVeyhZwMyLDEZzkHGlY8n5KBNiBnSZldh9rNUUa9KXTOukSWOrMPk+IVeF0zMsaqGH
         5zJ6++jCplK2PEaYLbkWvJE4+W/O5tRIcscKzW6lird/RVJaI2sRq7Gk+M+/Z6sK0jk1
         xFgK0BqN0TcwwvK726sFgJvWkJQXEaZoKergg7DXmsoc8PmNO8jjgkkURsyEXS1mGre0
         avp4UhmscViXRHxnQ+YqqItFnbdPAWb8QiyJ5JfphWatdDOHDLrS5XRDqd4EvGybgHyS
         CCzcrCAiDCeMpVU7rAm+lk1+RFEkJtCUpdVcDHg/f3Tk/AL+TggNHQti3xlckqkKkmLa
         8oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716231050; x=1716835850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1sWMUw3B4AjVeujsjOysaK29eWJ41BB8m6msPbUa+0=;
        b=bJ7/eYbUgtZVMW3bfke55Mu+ZOVZx6y91DlHYDE1efdlU+zni02Pz2jkEsi9itAQ/W
         55BeO3GaBe3dDWPI3kxHq0YjyyQIf6hWn88P5sitmni1+o54Vd7mwVQF8Mtaop2U827X
         6AFJLgQtOklhIXNk0AsNEN+Cz9ZFlaG7h5FH8l9yNVMjKq9nCVNFpu4/i9/g1fvwSjp6
         gbtrNPja91Po8Y1/CjtkkR7zFTiqR4ffrvdX2sUqICfVlvT514XdZhpnwp6GiEW2fUmV
         7QO7hHKR6GUUJrbsz1aZkCIYa5XzBU/ygW34UdpRT3nZql3Ebyhj9YaiT+zSIKHEI8hA
         fjJg==
X-Gm-Message-State: AOJu0YzSzWdK9fxauwJ6ZWaEVsA1Z4i166BX9JYz4oKPUn3X2IGkjgsS
	sH3ME8hm3qpVV9/FLlEkoogNsTWjYQyeHNsXwoDQBMnAP0HGwMK5H72ECgnAMjMuVoPvMVyPbbS
	pPh3/Mygnz/E0Cq0vCfWwE2GG/O0=
X-Google-Smtp-Source: AGHT+IGpA4Sfcku91+C0TVeH24sIklHfqaZsRMy4QYAr3wTMoi3wrsYcQfyhAx2KgNZwY3SCr9/TFKLyPc1IPRYtCU4=
X-Received: by 2002:a05:651c:216:b0:2e1:d48e:d5b2 with SMTP id
 38308e7fff4ca-2e7171c9dccmr18520461fa.22.1716231049878; Mon, 20 May 2024
 11:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240520143428.4168152-1-martin.jansa@gmail.com> <CAMKF1srfCuW9NATJ=dFEUt768KyxQCGc-Ha8gk+z9hsaBuaxXw@mail.gmail.com>
In-Reply-To: <CAMKF1srfCuW9NATJ=dFEUt768KyxQCGc-Ha8gk+z9hsaBuaxXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 May 2024 20:50:37 +0200
Message-ID: <CA+chaQf6DnOWxR-iixv1O6=EUV=mOG_55KHp9b4YfdYkJOrOtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cdrtools-native: fix build with gcc-14
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 18:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199602

That doesn't fix that, I did the upgrade first and Ross was already
looking for cdrtools alternatives, so I went with minimal fix for
gcc-14 on host.

On Mon, May 20, 2024 at 8:45=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> perhaps we should try to upgrade to
> https://sourceforge.net/projects/cdrtools/files/alpha/cdrtools-3.02a09.ta=
r.bz2
> this is last release of cdrtools and other distros are packaging it
> too, I am not sure if it will fix this issue but we might be
> able to share fixes. We should also explore options to replace this
> dependency for live/iso image generation.
>
> On Mon, May 20, 2024 at 7:34=E2=80=AFAM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Fixes:
> > http://errors.yoctoproject.org/Errors/Details/770525/
> > | checking whether the C compiler (gcc  -isystem/OE/build/oe-core/tmp-g=
libc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/inclu=
de -O2 -pipe ) works... no
> > | configure: error: installation or configuration problem: C compiler c=
annot create executables.
> > | RULES/rules.cnf:70: incs/amd-ryzen-threadripper-3970x-32-core-process=
or-linux-cc/rules.cnf: No such file or directory
> > | make: *** [RULES/rules.cnf:59: incs/amd-ryzen-threadripper-3970x-32-c=
ore-processor-linux-cc/rules.cnf] Error 1
> > | make: *** Waiting for unfinished jobs....
> >
> > where config.log show it's caused by gcc-14:
> >
> > configure:1189: checking whether the C compiler (gcc  -isystem/OE/build=
/oe-core/tmp-glibc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-na=
tive/usr/include -O2 -pipe ) works
> > configure:1211: gcc  -o conftest -isystem/OE/build/oe-core/tmp-glibc/wo=
rk/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include -O2 =
-pipe  -D_GNU_SOURCE  conftest.c   1>&5
> > configure:1208:1: error: return type defaults to 'int' [-Wimplicit-int]
> > configure: failed program was:
> >
> > main(){return(0);}
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/m=
eta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> > index bf8be1ad0c..239b351933 100644
> > --- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> > +++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> > @@ -19,13 +19,17 @@ SRC_URI =3D " \
> >  SRC_URI[md5sum] =3D "7d45c5b7e1f78d85d1583b361aee6e8b"
> >  SRC_URI[sha256sum] =3D "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03=
f769c4735ef5f5860f"
> >
> > -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> > +EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D CPPOPTX=3D'${CPPFLAGS}' COPTX=3D'${C=
FLAGS}' C++OPTX=3D'${CXXFLAGS}' LDOPTX=3D'${LDFLAGS}' GMAKE_NOWARN=3D'true'=
"
> >
> >  # Stop failures when 'cc' can't be found
> >  export ac_cv_prog_CC =3D "${CC}"
> >
> >  inherit native
> >
> > +# Use -std=3Dgnu89 to build with gcc-14 (https://bugs.gentoo.org/90387=
6)
> > +# this needs to be after native inherit (which sets CFLAGS to BUILD_CF=
LAGS)
> > +CFLAGS +=3D "-std=3Dgnu89"
> > +
> >  do_configure() {
> >          install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.su=
b ${S}/autoconf
> >          install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gu=
ess ${S}/autoconf
> > @@ -33,5 +37,5 @@ do_configure() {
> >  }
> >
> >  do_install() {
> > -       make install GMAKE_NOWARN=3Dtrue INS_BASE=3D${prefix} DESTDIR=
=3D${D}
> > +       oe_runmake install INS_BASE=3D${prefix} DESTDIR=3D${D}
> >  }
> > --
> > 2.45.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199594): https://lists.openembedded.org/g/openembed=
ded-core/message/199594
> > Mute This Topic: https://lists.openembedded.org/mt/106204338/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

