Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2B5C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 13:53:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.20455.1708955588529879611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 05:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hYGngkAe;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d8739ddd4so2443546f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708955587; x=1709560387; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vckT446QG5b/VLoIYLFE72AAxJxDRrDcpTWEJs5GWUw=;
        b=hYGngkAe+Fmthj/GIxwvzGX6X7VLOOLVIjxiCl4OkyXbLiOHXs2/2YroNAu8OEYjEz
         b8o2CprrR3alDsRWicfKz1n7hvGTbxoh8BUP7TX0QJ62ME1Upta11DY7U2luqz9elhKL
         RR3ckzeRVKYxx1XVLANRqF/LQwq2JZCU3NDokWjQEl9BwhiMDviUIWYDMseh8c7kq6q3
         O69X67U63tguJlHuPmKEJbuFcKGlLFV70tDt83QkXBenmDIgheLIA8JDV4xRR2pSv4TC
         YZsvZJVGdC8NTYTYSBEKo0dTiG6XTYN0pHPb9c7PXFwWVC0Hx+0F2w43QJ34k1ElW4Z4
         UIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708955587; x=1709560387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vckT446QG5b/VLoIYLFE72AAxJxDRrDcpTWEJs5GWUw=;
        b=fEIglUWgb8So/sShuiM0Z8bUh0gTlh1rfRW7FWf4IC7Pqz102BbN/8hIXEirYzB9Ce
         lVqsZtvfy4d9Yb1NuHYZPdSXy6OXWgjXGir9bqiF6D+md6UKB2f4Bw1Bg3A4dxE/OiJ+
         AUsx1dm7zN9waA0KFxDhZ3Yd5kHeu01Nzu6F4YCy7X36VO/yUCKVwQ87rGdBZuDvl6DF
         FnvS4evUgKDfNsyYi1QiyyMZ+Uj2mL/nRqSmGN+0win2PnyXERZfcQRYj74tUq9jZWir
         nUMJC5Ac0wETZUnoUooCc88FlM7+ChWN9i6bBl/sCwCfzgkECykiwXK/1eexN6gwVxBU
         dwFw==
X-Gm-Message-State: AOJu0YxAhn0smDCwmnGhQb731QMx8XG55xEpS9evPsBgscpsxCHdgpay
	tIpBdTUh0eoWCzE+pdA5xVs9A9cnVYL0M8ODcHG76N/ezH/lx8XrLAz9p7V9PMXYKIo8IZMntoj
	GBjSEFG/HPB0AsL5X3KRO/VJgD0s=
X-Google-Smtp-Source: AGHT+IHCaStd07wU3klpS6o7IPbfZ6S6S/QYZBcdYzEme6/wIzZwVOAwUPMBkVb/7RLbsCN+uMcxvqPnJJfmAE5xCII=
X-Received: by 2002:a5d:468d:0:b0:33d:14a7:c4b with SMTP id
 u13-20020a5d468d000000b0033d14a70c4bmr4659538wrq.40.1708955586749; Mon, 26
 Feb 2024 05:53:06 -0800 (PST)
MIME-Version: 1.0
References: <17B76CE67EEF38C2.24693@lists.openembedded.org>
In-Reply-To: <17B76CE67EEF38C2.24693@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Feb 2024 14:52:51 +0100
Message-ID: <CA+chaQf8rDZsKWTQNfrm8u6PGVFXtkp8g4ohu2=QopQ9tOYyMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pixman: explicitly disable openmp in native builds
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 13:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196203

On Mon, Feb 26, 2024 at 2:32=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * on some hosts (e.g. on my gentoo after recent update) it detects OpenMP=
 in do_configure:
>   Run-time dependency OpenMP found: YES 4.5
>   but then fails in do_compile as shown in:
>   http://errors.yoctoproject.org/Errors/Details/754632/
>
>   gcc  -o test/fetch-test test/fetch-test.p/fetch-test.c.o -LTOPDIR/tmp-g=
libc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-native/usr/lib -=
LTOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-nat=
ive/lib -Wl,--as-needed -Wl,--no-undefined -Wl,--enable-new-dtags -Wl,-rpat=
h-link,TOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysro=
ot-native/usr/lib -Wl,-rpath-link,TOPDIR/tmp-glibc/work/x86_64-linux/pixman=
-native/0.42.2/recipe-sysroot-native/lib -Wl,-rpath,TOPDIR/tmp-glibc/work/x=
86_64-linux/pixman-native/0.42.2/recipe-sysroot-native/usr/lib -Wl,-rpath,T=
OPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-nativ=
e/lib -Wl,-O1 '-Wl,-rpath,$ORIGIN/../pixman' -Wl,-rpath-link,TOPDIR/tmp-gli=
bc/work/x86_64-linux/pixman-native/0.42.2/build/pixman -Wl,--start-group te=
st/libtestutils.a pixman/libpixman-1.so.0.42.2 -pthread -fopenmp -fopenmp -=
lm -Wl,--end-group
>   gcc: fatal error: cannot read spec file =E2=80=98libgomp.spec=E2=80=99:=
 No such file or directory
>   compilation terminated.
>
>   it's only used in tests, so should be safe to disable for native builds
>
> * the check in meson uses /usr/include/omp.h which is provided by libomp
>   even when openmp support is disabled in native gcc in gentoo this happn=
ed
>   after switching from 17.1 profile to 23.0 which doesn't include openmp
>   USE flag by default, if you later run depclean it will uninstall libomp
>   as well which will fix this conflict in meson's OpenMP autodetection

Just FYI, even after uninstalling libomp you will get do_package failures l=
ike:
recipe-sysroot-native/usr/lib/rpm/rpmdeps: error while loading shared
libraries: libgomp.so.1: cannot open shared object file: No such file
or directory

until you manually cleansstate rpm-native to rebuild it without openmp
support (and you need to make sure not to re-use rpm-native from
sstate built on some other host with openmp enabled).

And rebuilding rpm-native without openmp support on host will
currently fail with:
| CMake Error at
/OE/build/tmp-glibc/work/x86_64-linux/rpm-native/4.19.1/recipe-sysroot-nati=
ve/usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230
(message):
|   Could NOT find OpenMP_C (missing: OpenMP_C_FLAGS OpenMP_C_LIB_NAMES)
|   (Required is at least version "4.5")

I'm not sure why openmp ended disabled in 23.0 gentoo profile, looks
like it should still be enabled through make.defaults even for 23.0:
/usr/portage/profiles/releases/17.0/make.defaults:USE=3D"${USE} fortran ope=
nmp"
/usr/portage/profiles/use.desc:openmp - Build support for the OpenMP
(support parallel computing), requires >=3Dsys-devel/gcc-4.2 built with
USE=3D"openmp"
/usr/portage/profiles/prefix/linux/make.defaults:USE=3D"${USE} openmp"

might be temporary issue as 23.0 profile is experimental and not for produc=
tion:
https://wiki.gentoo.org/wiki/Project:Toolchain/23.0_profile_transition

Regards,

> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.42.2.bb
> index 8a93f8c0fe..23ae0cbb27 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
> @@ -40,6 +40,8 @@ EXTRA_OEMESON:append:class-target:powerpc64le =3D " ${@=
bb.utils.contains("TUNE_FEA
>  EXTRA_OEMESON:append:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","n=
eon",""," -Dneon=3Ddisabled",d)}"
>  EXTRA_OEMESON:append:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","=
neon",""," -Dneon=3Ddisabled",d)}"
>
> +EXTRA_OEMESON:append:class-native =3D " -Dopenmp=3Ddisabled"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  CVE_STATUS[CVE-2023-37769] =3D "not-applicable-config: stress-test is an=
 uninstalled test"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196201): https://lists.openembedded.org/g/openembedde=
d-core/message/196201
> Mute This Topic: https://lists.openembedded.org/mt/104581651/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

