Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10A8CD37A9
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 17:01:21 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.28746.1725382873870585848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 10:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+oWgXLN;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-26fda13f898so3255990fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 10:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725382873; x=1725987673; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQryhvpfi/61FD3Yn1byUAVHNHpZnLx+AMkyAWgNooc=;
        b=U+oWgXLN6xiKd/ONC904w7WZzyHNzk/g1aDROoganPwpSm1vLi4iRQV+sABx/Se/Im
         QQQGgD+DU9YquNXm08c1EZBKD96ndcWDZV7f0UmFykEBqw6FTorO8aUBd0i8uuaO60VS
         vjE6OwEWoPjKbejFPrJr6hDDkmOvURkvYl8m4xTYMAAl91GmE21diZls4jTVKG0v/OQ0
         jx68M7jQfuc2gevBzYB4bRtywrZJ7V62H1/90JWkolFdP5EqWYFR2jRNBmQgfxlUiiNo
         9QuOKy5b1/LKz4g55jl6+s/U3tONnw0GdhkWlMWgqswPa7vA4/CS2KF2muXwDKxRhDmb
         EY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725382873; x=1725987673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQryhvpfi/61FD3Yn1byUAVHNHpZnLx+AMkyAWgNooc=;
        b=DSbq26n63/YqS6Tmuj1ruYW6SWBW8ptRG1bS9CnRS05vY9g1ZhFwUQvgKIfrTwVYeX
         4bdU+SZ/+MoJrE0yUGJA2z8G3l79Fm0g27smjOwxVhkQYRizSOwP9l8m54xtsWKYfm2e
         V1lJNJkuXOAnCjeYYCUB3oZi5FTn6PaJSB5xrRQgjY8CeknRjvVRhzc8Qlq3l3h2lAX6
         H+3LIMutGJfDBKiAMrB66y1QjiAuuVmXj/drFe1D+I+dE65I27WE8szYBFQpawLMkR/t
         GeUYzCSIz16TVVycGxOhtFOQLk5Q1LMcOQc4alOqakzDqWr1oz/KYL2zeL4zc5DB0v9A
         Oozw==
X-Forwarded-Encrypted: i=1; AJvYcCUXAnnsaIeE+0LlKOpzQaw8GCC5MnrqikA0EWuOy9ZeKq69lxeuOn5EAqcpeeqgsq6wizQViH/0gvfC3MW/sHA83w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxxV7IWbvQ+a0TNEyWH3qxKAZdYWkTH/vJfjE5/GmPOGoXBvgn
	BmeJMsQ5kxrNpiVtej1dK3Ougnpk6J0VjHWnruliKZ55UZzvf0gNhXrqyl0/axFQ1wE0VVR/tbl
	uy1en7bQ9x0nxVqDNLFayPpRonPc=
X-Google-Smtp-Source: AGHT+IHd3zc7BPI78z9ai2v4DC50PirgV5hZj1jk8VFDx4Pwc68MvT5EYikdaJK19TjeSsPmWvguopdiiIeRFfIOdok=
X-Received: by 2002:a05:6870:548e:b0:277:e457:6057 with SMTP id
 586e51a60fabf-27810da763cmr4774839fac.44.1725382872951; Tue, 03 Sep 2024
 10:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-19-git-send-email-wangmy@fujitsu.com> <CA+chaQdfxzWNuunL94xXwctvsuUVvhTq6wsOtbmt=KAzEZcgng@mail.gmail.com>
 <CA+chaQf+XuPscFri7L51F473X5rikRH5sKPrU882eAbAM0grcg@mail.gmail.com>
In-Reply-To: <CA+chaQf+XuPscFri7L51F473X5rikRH5sKPrU882eAbAM0grcg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Sep 2024 10:00:46 -0700
Message-ID: <CAMKF1spAoPsJp0yiUxjQhvm=hj+2p8_fOzwf=71ehv6UyuU8rQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 -> 72.2.0
To: martin.jansa@gmail.com
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 17:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204174

Hi Martin

Can you try reverting this patch

https://github.com/pypa/setuptools/commit/2c937116cc0dcd9b26b6070e89a3dc5dc=
bedc2ae

and see if it helps ?

On Tue, Sep 3, 2024 at 1:36=E2=80=AFAM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hello Wang,
>
> did you have a look at this regression (with ccache) from the
> setuptools upgrade?
>
> Regards,
>
> On Thu, Aug 22, 2024 at 6:30=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > This seems to break python3-numpy build.
> >
> > I guess it can be resolved by upgrading numpy as in:
> > https://lists.openembedded.org/g/openembedded-core/message/203231
> > which switches from setuptools3 to python_mesonpy
> >
> > Comparing the failing command line it looks like CXX and some other
> > flags are included twice:
> >
> > with: setuptools-72.2.0:
> >
> > ccache \
> > aarch64-oe-linux-g++ \
> > -fstack-protector-all \
> > -O2 \
> > -D_FORTIFY_SOURCE=3D2 \
> > -Wformat \
> > -Wformat-security \
> > -Werror=3Dformat-security \
> > -Werror=3Dreturn-type \
> > -funwind-tables \
> > --sysroot=3DWORKDIR/recipe-sysroot \
> > -O2 \
> > -g \
> > -fcanon-prefix-map \
> > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > -pipe \
> > -fvisibility-inlines-hidden \
> > aarch64-oe-linux-g++ \
> > -fstack-protector-all \
> > -O2 \
> > -D_FORTIFY_SOURCE=3D2 \
> > -Wformat \
> > -Wformat-security \
> > -Werror=3Dformat-security \
> > -Werror=3Dreturn-type \
> > -funwind-tables \
> > --sysroot=3DWORKDIR/recipe-sysroot \
> > -shared \
> > -Wl,-O1 \
> > -Wl,--hash-style=3Dgnu \
> > -Wl,--as-needed \
> > -fcanon-prefix-map \
> > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > -Wl,-z,relro,-z,now \
> > -O2 \
> > -g \
> > -fcanon-prefix-map \
> > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-nump=
y/1.26.4 \
> > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > -pipe \
> > -fvisibility-inlines-hidden \
> > build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy/c=
ore/src/multiarray/_multiarray_tests.o
> > \
> > build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap.o=
 \
> > build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argparse.=
o \
> > build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_hashtable=
.o \
> > -LWORKDIR/recipe-sysroot/usr/lib \
> > -Lbuild/temp.linux-x86_64-cpython-312 \
> > -lnpymath \
> > -o \
> > build/lib.linux-x86_64-cpython-312/numpy/core/_multiarray_tests.cpython=
-312-aarch64-linux-gnu.so
> >
> > --- setuptools-72.1.0   2024-08-22 18:17:36.941146726 +0200
> > +++ setuptools-72.2.0   2024-08-22 18:17:27.208147768 +0200
> > @@ -9,6 +9,28 @@
> >  -Werror=3Dreturn-type \
> >  -funwind-tables \
> >  --sysroot=3DWORKDIR/recipe-sysroot \
> > +-O2 \
> > +-g \
> > +-fcanon-prefix-map \
> > +-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-num=
py/1.26.4 \
> > +-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-num=
py/1.26.4 \
> > +-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-num=
py/1.26.4 \
> > +-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-num=
py/1.26.4 \
> > +-fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > +-fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> > +-fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> > +-pipe \
> > +-fvisibility-inlines-hidden \
> > +aarch64-oe-linux-g++ \
> > +-fstack-protector-all \
> > +-O2 \
> > +-D_FORTIFY_SOURCE=3D2 \
> > +-Wformat \
> > +-Wformat-security \
> > +-Werror=3Dformat-security \
> > +-Werror=3Dreturn-type \
> > +-funwind-tables \
> > +--sysroot=3DWORKDIR/recipe-sysroot \
> >  -shared \
> >  -Wl,-O1 \
> >  -Wl,--hash-style=3Dgnu \
> > @@ -33,6 +55,7 @@
> >  -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> >  -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> >  -pipe \
> > +-fvisibility-inlines-hidden \
> >  build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy/=
core/src/multiarray/_multiarray_tests.o
> > \
> >  build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap.=
o \
> >  build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argparse=
.o \
> >
> > failing with:
> > WORKDIR/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aa=
rch64-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld:
> > cannot find aarch64-oe-linux-g++: No such file or directory
> > collect2: error: ld returned 1 exit status
> >
> > On Tue, Aug 20, 2024 at 8:52=E2=80=AFAM wangmy via lists.openembedded.o=
rg
> > <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Changelog:
> > > - Support for Pathlike objects in data files and extensions
> > > - native support for C++ compilers
> > > - removed unused get_msvcr()
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...ython3-setuptools_72.1.0.bb =3D> python3-setuptools_72.2.0.bb} | =
2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb =
=3D> python3-setuptools_72.2.0.bb} (94%)
> > >
> > > diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.b=
b b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > > similarity index 94%
> > > rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> > > rename to meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > > index 945d443aff..63ea999960 100644
> > > --- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> > > +++ b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > > @@ -11,7 +11,7 @@ SRC_URI:append:class-native =3D " file://0001-condi=
tionally-do-not-fetch-code-by-e
> > >  SRC_URI +=3D " \
> > >              file://0001-_distutils-sysconfig.py-make-it-possible-to-=
substite.patch"
> > >
> > > -SRC_URI[sha256sum] =3D "8d243eff56d095e5817f796ede6ae32941278f542e0f=
941867cc05ae52b162ec"
> > > +SRC_URI[sha256sum] =3D "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9e4=
042c13d3bcef91ac2ef9"
> > >
> > >  DEPENDS +=3D "python3"
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204150): https://lists.openembedded.org/g/openembedde=
d-core/message/204150
> Mute This Topic: https://lists.openembedded.org/mt/107996505/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

