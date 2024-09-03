Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28756CD3420
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:36:49 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.18575.1725352608174163934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9vVGH1u;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-533488ffaf7so6861726e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 01:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725352606; x=1725957406; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9M4vp+FQH8oX4tv1Ba45Rz8P5Zzi6aTarhH5418jWM=;
        b=Q9vVGH1uBcfxepBat/HkTZexsgk0j/xSr0F60QeyN9V5qvv34bGyHzGWRhb21N5rul
         s9LTUrtN1kbSVXbeRw6jkFtpTOtP0FLeXR2pQQcgZbhjcddck65bmAe43sLljnZtrlG7
         zisFImJkt2XgPPa/IoCtEBDmikga3QZY89s2beq2dVkgPRFIoWBLdzX1iD3etFuA8a3p
         QHu12C/X5bsuWfYKoQx40V2Df+qFY95L17ikDO0j5m+5+Es0nObtsA1XoDqeHe24wf9q
         10RKYhLfpO1Yd8J0hKG+h+QnrWRyVzmhOtULpUnYCraauJVmbEdHHAaws2QL+HuBKvCC
         /lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725352606; x=1725957406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9M4vp+FQH8oX4tv1Ba45Rz8P5Zzi6aTarhH5418jWM=;
        b=IMduxQuINO9P+cE6aQ5UYm8fR/s/xC72NwB+ykZ7r51eVzpPrQm7LOVfd2o3HEGOqa
         m2o9S5J1F65FlYcnNAyqR0qLJfvOpTs1jfdD1UQifJSpdoBdF6N4Y2RL5FiCYMYh0b91
         lZD5E3jgGcGIeqzaFn1azdHsfPMWykpbYmkGLlvLBtfkk0OzsvMKf91G6U5qavINjfMk
         ZT3JuS25c5OGF0u3oFh3eAfIlpE3l5Dt8ZH4ysbgi6Lv+GGew531/NTdTcauLpuon2fE
         L0oLYQTkRzLRLZOQ3jA/Lld8QedzGj5ihQWN1+KEQnVX0TDHPKOWuwF0poo+1IO2ewLI
         Fe/w==
X-Gm-Message-State: AOJu0YwjKUYl9T6Xd/Wj6I49mwAYRpLTN6PKqMqBddNgI3bjxzYUT8vu
	ZeHNbowBXdTmO1GOjtwQ5p+7wq5x0qg4UxAaelkJTURDHeLpBgmBRE3VKZqv6Zcko9cTlK0AqRg
	442Mzc0ABnCj02eUBJgmUDIUgDrI=
X-Google-Smtp-Source: AGHT+IFAYLZ5DrH7aemnw7SC12U+HFgX/BjyVC2KGqfUsLXHDDs243TAK4Tn0CLYPM6C81/ugHWGcBuoSegCB1g1Qww=
X-Received: by 2002:a05:6512:3ba5:b0:530:ad8b:de11 with SMTP id
 2adb3069b0e04-53546afd8dfmr8084404e87.9.1725352605465; Tue, 03 Sep 2024
 01:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
 <1724136703-20023-19-git-send-email-wangmy@fujitsu.com> <CA+chaQdfxzWNuunL94xXwctvsuUVvhTq6wsOtbmt=KAzEZcgng@mail.gmail.com>
In-Reply-To: <CA+chaQdfxzWNuunL94xXwctvsuUVvhTq6wsOtbmt=KAzEZcgng@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Sep 2024 10:36:32 +0200
Message-ID: <CA+chaQf+XuPscFri7L51F473X5rikRH5sKPrU882eAbAM0grcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 -> 72.2.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204150

Hello Wang,

did you have a look at this regression (with ccache) from the
setuptools upgrade?

Regards,

On Thu, Aug 22, 2024 at 6:30=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
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
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#203537): https://lists.openembedded.org/g/openembed=
ded-core/message/203537
> > Mute This Topic: https://lists.openembedded.org/mt/107996505/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

