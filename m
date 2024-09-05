Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3932CD5BC0
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:44:47 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.8356.1725540277685635532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNaiuPV/;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5353d0b7463so1117670e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 05:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725540276; x=1726145076; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td6gJw9JYdULyS3MDTgNyN1KKKcnHsL0Dmu0yCG9uIA=;
        b=DNaiuPV/COI7Y2LfT+VlAd9Q42YAKdq6slEMeJUI70CKzysq7EXtqAD22Hf0YvU9k+
         AfmtzN9WgZgq2ye5DQub1ZK8IH2tmEiby3dhR1rxg+vl+FB9XKcJJeetz+qpahBO558o
         jllnd14KVoXCeXbZAC4Yv6Fhv3P74KlroP/760zkpp0hiWOZY8GdJf50DHBKWHjdL+Ju
         GeLDmN5SQEeQAUQ3QMaQvV3nGOu2D1bOZazYprqGy5qYDbDUekPfEC5x04r0GheUsdFI
         CRxtdwi29Yx8THyL7j6oljtQBF5RJFzESvKVu7fNZqhBk6LEdyI+JVFTIqF03Rnzrzfx
         6ivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540276; x=1726145076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td6gJw9JYdULyS3MDTgNyN1KKKcnHsL0Dmu0yCG9uIA=;
        b=ndaxUhgMLcF9Ye6r5LWwUMLPUj9L+7UFRUi/FEFmHi+o8zydu8ZRx+Xbbx7hOhD5he
         WDk8R5m8Cwf4AvO1UalmyN9a2NwRy6hPOOdsIrRTG154xUiaT+TEI757mbKS4jyjCGhd
         6US6185/63ckhB3KRlNO9dKTcKS04q+ThrgMh2oy7K+cVx6jYNOfWMu4ya7n2077vFgr
         B3RiQGSyhhGpoT8GSi/kEhjU9NrNy5aoAg9yBnWHiON4xYaMRPFkNgJwK6T4AtlcO7p3
         jWuZgjGwx/VpbDwM+RI7Q6oqqvMQrXRIyOcHL78rEZA7WC7Y6HMszZtkMf/pzOiXpb3/
         qZMw==
X-Forwarded-Encrypted: i=1; AJvYcCXx5m5wp8+rK6rBMBjAvbvDlVstzbqeUIheKSemZU3HdKxyXc0nQcf41Wmr6fD8+J505K2IjVa5yKkwkTYaVYv6aA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyUVoyMpekYf3esY7R34o9f97RsswOz7SWLrwo8r4ROA8gvTrO
	ZcNGfY82CO8fR8Fn0zFFYwTVWQCJ/FgSOZgifvV3Sx+i0hJzQyQVgWsg/ltV+OjVdB+ce4nO9DQ
	9OIKONtqvEBXuPK27PiHPpuATN4M=
X-Google-Smtp-Source: AGHT+IGpQuYX2zTDA/O5HXkGc9q7GseTuABrXqfk1XE2fzEHNCbhe/clsjcyVgoV1VqJugrdUIl7Q37n1oEoushyTts=
X-Received: by 2002:a05:6512:3a94:b0:52e:936e:a237 with SMTP id
 2adb3069b0e04-53546b345a1mr18881558e87.16.1725540274649; Thu, 05 Sep 2024
 05:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-19-git-send-email-wangmy@fujitsu.com> <CA+chaQdfxzWNuunL94xXwctvsuUVvhTq6wsOtbmt=KAzEZcgng@mail.gmail.com>
 <CA+chaQf+XuPscFri7L51F473X5rikRH5sKPrU882eAbAM0grcg@mail.gmail.com> <CAMKF1spAoPsJp0yiUxjQhvm=hj+2p8_fOzwf=71ehv6UyuU8rQ@mail.gmail.com>
In-Reply-To: <CAMKF1spAoPsJp0yiUxjQhvm=hj+2p8_fOzwf=71ehv6UyuU8rQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Sep 2024 14:44:18 +0200
Message-ID: <CA+chaQfYaAnM+P2cucvub_NqRXvt7W0A+y+X-++atqzaoN+bOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 -> 72.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 12:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204238

Hi Khem,

it's surely related, but not a simple revert (as distutils commits are
merged into setuptools into different prefix and there were couple
commits on top), but with most of it reverted as in:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster-setuptools&id=3Dcf310822e986802b0b97a7dcac2b9022d640efab
it no longer fails (tested with python3-icu with ccache enabled).

Regards,

On Tue, Sep 3, 2024 at 7:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Martin
>
> Can you try reverting this patch
>
> https://github.com/pypa/setuptools/commit/2c937116cc0dcd9b26b6070e89a3dc5=
dcbedc2ae
>
> and see if it helps ?
>
> On Tue, Sep 3, 2024 at 1:36=E2=80=AFAM Martin Jansa via lists.openembedde=
d.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hello Wang,
> >
> > did you have a look at this regression (with ccache) from the
> > setuptools upgrade?
> >
> > Regards,
> >
> > On Thu, Aug 22, 2024 at 6:30=E2=80=AFPM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> > >
> > > This seems to break python3-numpy build.
> > >
> > > I guess it can be resolved by upgrading numpy as in:
> > > https://lists.openembedded.org/g/openembedded-core/message/203231
> > > which switches from setuptools3 to python_mesonpy
> > >
> > > Comparing the failing command line it looks like CXX and some other
> > > flags are included twice:
> > >
> > > with: setuptools-72.2.0:
> > >
> > > ccache \
> > > aarch64-oe-linux-g++ \
> > > -fstack-protector-all \
> > > -O2 \
> > > -D_FORTIFY_SOURCE=3D2 \
> > > -Wformat \
> > > -Wformat-security \
> > > -Werror=3Dformat-security \
> > > -Werror=3Dreturn-type \
> > > -funwind-tables \
> > > --sysroot=3DWORKDIR/recipe-sysroot \
> > > -O2 \
> > > -g \
> > > -fcanon-prefix-map \
> > > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > > -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > > -pipe \
> > > -fvisibility-inlines-hidden \
> > > aarch64-oe-linux-g++ \
> > > -fstack-protector-all \
> > > -O2 \
> > > -D_FORTIFY_SOURCE=3D2 \
> > > -Wformat \
> > > -Wformat-security \
> > > -Werror=3Dformat-security \
> > > -Werror=3Dreturn-type \
> > > -funwind-tables \
> > > --sysroot=3DWORKDIR/recipe-sysroot \
> > > -shared \
> > > -Wl,-O1 \
> > > -Wl,--hash-style=3Dgnu \
> > > -Wl,--as-needed \
> > > -fcanon-prefix-map \
> > > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > > -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > > -Wl,-z,relro,-z,now \
> > > -O2 \
> > > -g \
> > > -fcanon-prefix-map \
> > > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nu=
mpy/1.26.4 \
> > > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > > -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > > -pipe \
> > > -fvisibility-inlines-hidden \
> > > build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy=
/core/src/multiarray/_multiarray_tests.o
> > > \
> > > build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap=
.o \
> > > build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argpars=
e.o \
> > > build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_hashtab=
le.o \
> > > -LWORKDIR/recipe-sysroot/usr/lib \
> > > -Lbuild/temp.linux-x86_64-cpython-312 \
> > > -lnpymath \
> > > -o \
> > > build/lib.linux-x86_64-cpython-312/numpy/core/_multiarray_tests.cpyth=
on-312-aarch64-linux-gnu.so
> > >
> > > --- setuptools-72.1.0   2024-08-22 18:17:36.941146726 +0200
> > > +++ setuptools-72.2.0   2024-08-22 18:17:27.208147768 +0200
> > > @@ -9,6 +9,28 @@
> > >  -Werror=3Dreturn-type \
> > >  -funwind-tables \
> > >  --sysroot=3DWORKDIR/recipe-sysroot \
> > > +-O2 \
> > > +-g \
> > > +-fcanon-prefix-map \
> > > +-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-n=
umpy/1.26.4 \
> > > +-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-n=
umpy/1.26.4 \
> > > +-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-n=
umpy/1.26.4 \
> > > +-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-n=
umpy/1.26.4 \
> > > +-fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > > +-fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > > +-fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > > +-pipe \
> > > +-fvisibility-inlines-hidden \
> > > +aarch64-oe-linux-g++ \
> > > +-fstack-protector-all \
> > > +-O2 \
> > > +-D_FORTIFY_SOURCE=3D2 \
> > > +-Wformat \
> > > +-Wformat-security \
> > > +-Werror=3Dformat-security \
> > > +-Werror=3Dreturn-type \
> > > +-funwind-tables \
> > > +--sysroot=3DWORKDIR/recipe-sysroot \
> > >  -shared \
> > >  -Wl,-O1 \
> > >  -Wl,--hash-style=3Dgnu \
> > > @@ -33,6 +55,7 @@
> > >  -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > >  -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > >  -pipe \
> > > +-fvisibility-inlines-hidden \
> > >  build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/nump=
y/core/src/multiarray/_multiarray_tests.o
> > > \
> > >  build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overla=
p.o \
> > >  build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argpar=
se.o \
> > >
> > > failing with:
> > > WORKDIR/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/=
aarch64-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld:
> > > cannot find aarch64-oe-linux-g++: No such file or directory
> > > collect2: error: ld returned 1 exit status
> > >
> > > On Tue, Aug 20, 2024 at 8:52=E2=80=AFAM wangmy via lists.openembedded=
.org
> > > <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > > >
> > > > From: Wang Mingyu <wangmy@fujitsu.com>
> > > >
> > > > Changelog:
> > > > - Support for Pathlike objects in data files and extensions
> > > > - native support for C++ compilers
> > > > - removed unused get_msvcr()
> > > >
> > > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > > ---
> > > >  ...ython3-setuptools_72.1.0.bb =3D> python3-setuptools_72.2.0.bb} =
| 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb =
=3D> python3-setuptools_72.2.0.bb} (94%)
> > > >
> > > > diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0=
.bb b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > > > similarity index 94%
> > > > rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.=
bb
> > > > rename to meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > > > index 945d443aff..63ea999960 100644
> > > > --- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> > > > +++ b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > > > @@ -11,7 +11,7 @@ SRC_URI:append:class-native =3D " file://0001-con=
ditionally-do-not-fetch-code-by-e
> > > >  SRC_URI +=3D " \
> > > >              file://0001-_distutils-sysconfig.py-make-it-possible-t=
o-substite.patch"
> > > >
> > > > -SRC_URI[sha256sum] =3D "8d243eff56d095e5817f796ede6ae32941278f542e=
0f941867cc05ae52b162ec"
> > > > +SRC_URI[sha256sum] =3D "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9=
e4042c13d3bcef91ac2ef9"
> > > >
> > > >  DEPENDS +=3D "python3"
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> > > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204150): https://lists.openembedded.org/g/openembed=
ded-core/message/204150
> > Mute This Topic: https://lists.openembedded.org/mt/107996505/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

