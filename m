Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C909DC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 18:27:10 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.20564.1724351229853598573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 11:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WVmXNVTm;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5334e41c30bso1216762e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724351228; x=1724956028; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWABP07Z/rATXHdqeX4NA2yeTLEwG7pyFHmvWdroUwU=;
        b=WVmXNVTm+DrjPyJfpmYGqJCSTdkYun+MeUJ4BsoLruAz5Nalfv/j9DtDF8grb75zVY
         7Yi6PMinsIyuPal8LwlWx4TZz76uuRs67xYI7xnDfM7C66Vnan30l+vz1yHgyATvaCbt
         mao3d6rAurKkfTNtuAbwBq9lg5AcboN/NpWipJ6tdvwOJp0nuT8Lq2CkRKgbsABFUIsY
         5dwL5MyB4mejh5D6DO9BMjHlksGsVPsi4yK//tcDT1Z7yAVRhuxJT8nEtZ+vuxbfvhhr
         A4/C6SunOHTk0FmQFH0fUr7CbcAizEZCX4/c3txfJ0n4J4nffFpGLab9m9HWhvVicop1
         ROZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724351228; x=1724956028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWABP07Z/rATXHdqeX4NA2yeTLEwG7pyFHmvWdroUwU=;
        b=QbBYUrAGB354Vbcvt9i9Df43r+6FTvobjFOptlceBOjbzNjjXcbPJ0JBZWpo8m1tA5
         VlMfxiJHt5wLL9/keK9+KLwFssv0wr/YDVmRpt4AQ0Sbghy8orLNT2MFWzYW9P3fpSZI
         VUSYn9a3Dx8gQb9SsKrXQm5i26dQkjQ1IOtj7MFc+Mk8H8CxXRJHS0NKljaFiOtOQYKp
         Izt/QEWpnz22hyE6HNdz4rQI8dpFnGHAqkUEXWPFS6+8E6KEDMdVtltD0En1po/RBlgL
         ujkyrgEhP8Ix6OaFiiVO2g92PjBpPlXmVhoOMwnt0rrS4hB5Ow2ilx41Qm0vbMhoPGiw
         HMnA==
X-Forwarded-Encrypted: i=1; AJvYcCUqNccn7HdLm2a23YT2W4aQGNHIYV8JegGEW8k7HxYfs4JDEbsJEKgAdZAlvfRQxXa9mCyTqqdY8BEgZ27LeUSpig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YymErCzzwioNrkYYFqOWMKZ9h94+y7hhQbnldJvMytqNmUYn5V3
	bJ/Ah0WVO+1cFL/zt/XsJXCRf1dM652FwHroxvUOOSzG+8Dc33Q12vEi7M1uoANA7a3wHIYEQDx
	8qh5nm1RsdIL6yo6AzCauijQCdFc=
X-Google-Smtp-Source: AGHT+IFqYAhcCVpWtb15J9wNftwOthtAiBzs7MC8+FmkoO1dzHeEI3WbZnRGO4oUc5WbOqtlM/KCX/MU/q8hXopHPrQ=
X-Received: by 2002:a05:6512:3c97:b0:52c:812b:6e72 with SMTP id
 2adb3069b0e04-5334854a461mr3726414e87.1.1724351227259; Thu, 22 Aug 2024
 11:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-19-git-send-email-wangmy@fujitsu.com> <17EE19F35A1C7F50.9439@lists.openembedded.org>
In-Reply-To: <17EE19F35A1C7F50.9439@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Aug 2024 20:26:44 +0200
Message-ID: <CA+chaQeUkj4dX8rSkxK49_7m3ZbFGhLb27zcGDyuhOZdxy_9bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 -> 72.2.0
To: martin.jansa@gmail.com
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203661

It seems to fail only when ccache is enabled, I'll send patch to add
CCACHE_DISABLE to numpy recipe to work around this issue for now.

On Thu, Aug 22, 2024 at 6:30=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This seems to break python3-numpy build.
>
> I guess it can be resolved by upgrading numpy as in:
> https://lists.openembedded.org/g/openembedded-core/message/203231
> which switches from setuptools3 to python_mesonpy
>
> Comparing the failing command line it looks like CXX and some other
> flags are included twice:
>
> with: setuptools-72.2.0:
>
> ccache \
> aarch64-oe-linux-g++ \
> -fstack-protector-all \
> -O2 \
> -D_FORTIFY_SOURCE=3D2 \
> -Wformat \
> -Wformat-security \
> -Werror=3Dformat-security \
> -Werror=3Dreturn-type \
> -funwind-tables \
> --sysroot=3DWORKDIR/recipe-sysroot \
> -O2 \
> -g \
> -fcanon-prefix-map \
> -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> -pipe \
> -fvisibility-inlines-hidden \
> aarch64-oe-linux-g++ \
> -fstack-protector-all \
> -O2 \
> -D_FORTIFY_SOURCE=3D2 \
> -Wformat \
> -Wformat-security \
> -Werror=3Dformat-security \
> -Werror=3Dreturn-type \
> -funwind-tables \
> --sysroot=3DWORKDIR/recipe-sysroot \
> -shared \
> -Wl,-O1 \
> -Wl,--hash-style=3Dgnu \
> -Wl,--as-needed \
> -fcanon-prefix-map \
> -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> -Wl,-z,relro,-z,now \
> -O2 \
> -g \
> -fcanon-prefix-map \
> -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy/=
1.26.4 \
> -fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> -pipe \
> -fvisibility-inlines-hidden \
> build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy/cor=
e/src/multiarray/_multiarray_tests.o
> \
> build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap.o \
> build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argparse.o =
\
> build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_hashtable.o=
 \
> -LWORKDIR/recipe-sysroot/usr/lib \
> -Lbuild/temp.linux-x86_64-cpython-312 \
> -lnpymath \
> -o \
> build/lib.linux-x86_64-cpython-312/numpy/core/_multiarray_tests.cpython-3=
12-aarch64-linux-gnu.so
>
> --- setuptools-72.1.0   2024-08-22 18:17:36.941146726 +0200
> +++ setuptools-72.2.0   2024-08-22 18:17:27.208147768 +0200
> @@ -9,6 +9,28 @@
>  -Werror=3Dreturn-type \
>  -funwind-tables \
>  --sysroot=3DWORKDIR/recipe-sysroot \
> +-O2 \
> +-g \
> +-fcanon-prefix-map \
> +-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy=
/1.26.4 \
> +-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy=
/1.26.4 \
> +-fmacro-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy=
/1.26.4 \
> +-fdebug-prefix-map=3DWORKDIR/numpy-1.26.4=3D/usr/src/debug/python3-numpy=
/1.26.4 \
> +-fdebug-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> +-fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
> +-fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
> +-pipe \
> +-fvisibility-inlines-hidden \
> +aarch64-oe-linux-g++ \
> +-fstack-protector-all \
> +-O2 \
> +-D_FORTIFY_SOURCE=3D2 \
> +-Wformat \
> +-Wformat-security \
> +-Werror=3Dformat-security \
> +-Werror=3Dreturn-type \
> +-funwind-tables \
> +--sysroot=3DWORKDIR/recipe-sysroot \
>  -shared \
>  -Wl,-O1 \
>  -Wl,--hash-style=3Dgnu \
> @@ -33,6 +55,7 @@
>  -fmacro-prefix-map=3DWORKDIR/recipe-sysroot=3D \
>  -fdebug-prefix-map=3DWORKDIR/recipe-sysroot-native=3D \
>  -pipe \
> +-fvisibility-inlines-hidden \
>  build/temp.linux-x86_64-cpython-312/build/src.linux-x86_64-3.12/numpy/co=
re/src/multiarray/_multiarray_tests.o
> \
>  build/temp.linux-x86_64-cpython-312/numpy/core/src/common/mem_overlap.o =
\
>  build/temp.linux-x86_64-cpython-312/numpy/core/src/common/npy_argparse.o=
 \
>
> failing with:
> WORKDIR/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarc=
h64-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld:
> cannot find aarch64-oe-linux-g++: No such file or directory
> collect2: error: ld returned 1 exit status
>
> On Tue, Aug 20, 2024 at 8:52=E2=80=AFAM wangmy via lists.openembedded.org
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Changelog:
> > - Support for Pathlike objects in data files and extensions
> > - native support for C++ compilers
> > - removed unused get_msvcr()
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  ...ython3-setuptools_72.1.0.bb =3D> python3-setuptools_72.2.0.bb} | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb =3D>=
 python3-setuptools_72.2.0.bb} (94%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb =
b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > similarity index 94%
> > rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> > rename to meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > index 945d443aff..63ea999960 100644
> > --- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> > +++ b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> > @@ -11,7 +11,7 @@ SRC_URI:append:class-native =3D " file://0001-conditi=
onally-do-not-fetch-code-by-e
> >  SRC_URI +=3D " \
> >              file://0001-_distutils-sysconfig.py-make-it-possible-to-su=
bstite.patch"
> >
> > -SRC_URI[sha256sum] =3D "8d243eff56d095e5817f796ede6ae32941278f542e0f94=
1867cc05ae52b162ec"
> > +SRC_URI[sha256sum] =3D "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9e404=
2c13d3bcef91ac2ef9"
> >
> >  DEPENDS +=3D "python3"
> >
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203658): https://lists.openembedded.org/g/openembedde=
d-core/message/203658
> Mute This Topic: https://lists.openembedded.org/mt/107996505/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

