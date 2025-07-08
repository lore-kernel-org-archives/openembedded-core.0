Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8D8C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 08:51:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.14098.1751964685653044691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 01:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h3ewKG1K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso28912945e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 01:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751964684; x=1752569484; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f55H/Enr0MysGHZgr7pE0d6Qj1QdzNoBtlhgZT+FkCI=;
        b=h3ewKG1KVoUNoff8ou1/oWlLr4Aa7/8gYncI82+zlXOQ4wgRo7PKQ+ijMt2Olu74g8
         gKyl2B4XU5VDnQKRGcw/19lcm8xPn2pHOKRepVKw68WTjCOCvO5YTRpLBSjSevgMylVR
         R7XACm8CYRU46qQzSzm0ie1M/ogyyFl4YTobE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751964684; x=1752569484;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f55H/Enr0MysGHZgr7pE0d6Qj1QdzNoBtlhgZT+FkCI=;
        b=iWDRS2KATIteKNel86aZGjXzT0PsMoGkYV3sO84NUuxv3PRVqhIKs4APiQelxT6Nfg
         DyRJuodYFuMQmTJA+W0Y8708EB/G8TBbqBwdzKquTClFyKovCjZv8p/VPwDiCyr2PGXY
         SQp6kArmksp0Ors0ADP+yF9a2noO3U600hhVzEbesrlkdo5L3BcHxzi6amrL9lnvIdxM
         c9ChqstbBVgsEDkZERAt12IQd4hdC3193cz1sj0Lsh0a9HGva0e+IBSTss34uwH1aeRc
         6egkbl888LlgF5DnWcd4+mBqs6DuzrUjGIvhE7CGcLev52GZr3FjB+kIpfQ7wf+ZVwnX
         t3tQ==
X-Gm-Message-State: AOJu0YyVegM+JIkPhWMDwKFr5WFEop4az/yqZTP36wuvwa7F0VY/2dfq
	BrFc+4RHlrIxGSqS5BgIJoUYmIhS3kU64oWLkojJN9MdcyC1Cn95gdjcJ9r39cJHBKRY58Sih/f
	/vmP2
X-Gm-Gg: ASbGncsvgHE5bo9lGhBeAB+fcEd/lov0NpOU7TTcz4ppQVwhzk+VdfJpY9EIJLU+yTy
	GTcgPkT0xtlvccqJEbH2RfvPIU+zYu0OBy17SudkGleYrtmWEi3Y6WuB9WgjzeSib8xkk3Odtdp
	7Aob5XxFuLR228fk8By7HxklmB0eZxFhWyYkMBZw7cVjpnjKDNweKVjIdbDczEmz1moVU5hPdPc
	qiaVSIpTWb1a9i4M1UEIwamabBMLWTu7mvbQhZl6WNh5HxJagJ2rmXA5uXLw6vjDIL+HtPBgtdG
	T7Xls1z2tcU/vXq8LYX0sQNj4qUhVL8QfrNtLS7F2UT9m5QlY0iJgCPkBlYuhAddEBBYI/oOapr
	KC04j4HmhFDdMMjDg5xIw7AzCmsBZTOxpANs9ug2CIZQKOReRDE8=
X-Google-Smtp-Source: AGHT+IFznuZ8c/YL2dtPfB6hePexeC3L6/23VbnPbGCz/z5R1Jcu7KHQs46f+IKU4Zx1A3A871jofQ==
X-Received: by 2002:a05:600c:1c9a:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-454cfa24c15mr9781585e9.6.1751964683579;
        Tue, 08 Jul 2025 01:51:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8fe5:d709:6d45:bcaf? ([2001:8b0:aba:5f3c:8fe5:d709:6d45:bcaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd39cb89sm15528205e9.15.2025.07.08.01.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:51:22 -0700 (PDT)
Message-ID: <5a6997577fb2fdd3736ca3e28a764bb8fe687356.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] toolchain/clang-native: Work around native
 compiles for some gcc configs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Tue, 08 Jul 2025 09:51:21 +0100
In-Reply-To: <1850367B6A0FF7B9.27764@lists.openembedded.org>
References: <1850159E80660154.13503@lists.openembedded.org>
	 <1850367B6A0FF7B9.27764@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 08:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220020

On Tue, 2025-07-08 at 08:35 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2025-07-07 at 22:33 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Some systems can have mixed development headers, such as pieces of
> > both gcc 13
> > and 14 which can cause build failures, particularly if libgcc and
> > libstdc++ for
> > gcc 13 are present but only libgcc for gcc 14 and not libstdc++
> > when the gcc
> > version is gcc 13.
> >=20
> > This patch forces clang to use the full toolchain rather than any
> > partial incomplete
> > version. It is only necessary in the native case and should also be
> > applicable to
> > compiler-rt in due source, hence making it an inc file.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes/toolchain/clang-native.bbclass | 7 +++++++
> > =C2=A01 file changed, 7 insertions(+)
> >=20
> > diff --git a/meta/classes/toolchain/clang-native.bbclass
> > b/meta/classes/toolchain/clang-native.bbclass
> > index 4de491a1cb5..c8b20ff8c40 100644
> > --- a/meta/classes/toolchain/clang-native.bbclass
> > +++ b/meta/classes/toolchain/clang-native.bbclass
> > @@ -16,3 +16,10 @@ BUILD_READELF =3D "${BUILD_PREFIX}llvm-readelf"
> > =C2=A0DEPENDS +=3D "clang-native libcxx-native compiler-rt-native"
> > =C2=A0
> > =C2=A0LDFLAGS +=3D " --rtlib=3Dlibgcc --unwindlib=3Dlibgcc"
> > +
> > +# Some systems can have mixed gcc development headers, such as
> > pieces of both gcc 13
> > +# and 14 which can cause build failures, particularly if libgcc
> > and libstdc++ for
> > +# gcc 13 are present but only libgcc for gcc 14 and not libstdc++
> > when the gcc
> > +# version is gcc 13. Force the gcc install that matches gcc itself
> > +BUILD_CFLAGS:append:class-native =3D " --gcc-install-dir=3D$(dirname
> > $(gcc -print-libgcc-file-name))"
> > +BUILD_CXXFLAGS:append:class-native =3D " --gcc-install-dir=3D$(dirname
> > $(gcc -print-libgcc-file-name))"
>=20
> Sadly on a system with buildtools tarball this doesn't work.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2052
>=20
>=20
> =C2=A0&& /srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/usr/bin/clang -isystem/srv/pokybuild/yocto-
> worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-
> linux/libcxx-native/20.1.7/recipe-sysroot-native/usr/include -O2 -
> pipe=C2=A0 --gcc-install-dir=3D/srv/pokybuild/yocto-
> worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-
> linux/usr/lib/gcc/x86_64-pokysdk-linux/14.2.0/../../../../lib/x86_64-
> pokysdk-linux/14.2.0=C2=A0=C2=A0 -isystem/srv/pokybuild/yocto-
> worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-
> linux/libcxx-native/20.1.7/recipe-sysroot-native/usr/include -
> L/srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/usr/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -
> L/srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -Wl,--enable-new-
> dtags=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -Wl,-rpath-link,/srv/pokybuild/yocto-
> worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-
> linux/libcxx-native/20.1.7/recipe-sysroot-
> native/usr/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -Wl,-rpath-
> link,/srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -Wl,-
> rpath,/srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/usr/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -Wl,-
> rpath,/srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -Wl,-O1 -Wl,--allow-shlib-
> undefined -Wl,--dynamic-linker=3D/srv/pokybuild/yocto-
> worker/reproducible/build/build-st/reproducibleA/tmp/sysroots-
> uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread -
> rtlib=3Dlibgcc -unwindlib=3Dlibgcc -stdlib=3Dlibstdc++=C2=A0 --rtlib=3Dli=
bgcc --
> unwindlib=3Dlibgcc -unwindlib=3Dlibgcc -L/srv/pokybuild/yocto-
> worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-
> linux/libcxx-native/20.1.7/recipe-sysroot-
> native/usr/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -L/srv/pokybuild/yocto-
> worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-
> linux/libcxx-native/20.1.7/recipe-sysroot-
> native/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -Wl,--enable-new-
> dtags=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -Wl,-rpath-link,/srv/pokybuild/yocto-
> worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-
> linux/libcxx-native/20.1.7/recipe-sysroot-
> native/usr/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -Wl,-rpath-
> link,/srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -Wl,-
> rpath,/srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/usr/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -Wl,-
> rpath,/srv/pokybuild/yocto-worker/reproducible/build/build-
> st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-
> sysroot-native/lib=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -Wl,-O1 -Wl,--allow-shlib-
> undefined -Wl,--dynamic-linker=3D/srv/pokybuild/yocto-
> worker/reproducible/build/build-st/reproducibleA/tmp/sysroots-
> uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread -
> rtlib=3Dlibgcc -unwindlib=3Dlibgcc -stdlib=3Dlibstdc++=C2=A0 --rtlib=3Dli=
bgcc --
> unwindlib=3Dlibgcc -unwindlib=3Dlibgcc
> CMakeFiles/cmTC_14598.dir/testCCompiler.c.o -o cmTC_14598=C2=A0=C2=A0 && =
:
> > =C2=A0=C2=A0=C2=A0 /srv/pokybuild/yocto-worker/reproducible/build/build=
-
> > st/reproducibleA/tmp/hosttools/ld: cannot find -lgcc_s: No such
> > file or directory
> > =C2=A0=C2=A0=C2=A0 clang: error: linker command failed with exit code 1=
 (use -v to
> > see invocation)
>=20
>=20
> which is because in this case, libgcc_s is in ~/yocto-
> worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-
> linux/lib
>=20
> but gcc is saying:
>=20
> ~/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-
> linux/usr/lib/x86_64-pokysdk-linux/14.2.0
>=20
> which is where the .a files are.

I did try:

BUILD_CFLAGS:append:class-native =3D " --gcc-install-dir=3D$(dirname $(gcc =
-print-file-name=3Dlibgcc_s.so))"
BUILD_CXXFLAGS:append:class-native =3D " --gcc-install-dir=3D$(dirname $(gc=
c -print-file-name=3Dlibstdc++.so))"

but that doesn't work either.

Cheers,

Richard

