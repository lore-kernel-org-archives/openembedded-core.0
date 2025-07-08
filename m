Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82835C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 07:36:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.13313.1751960158252544338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 00:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bmjS9muX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3013650f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 00:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751960156; x=1752564956; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hc5v2qVnAuLXiJ7ciENEf2jMOu+QnGqRkfoT9XKyhW8=;
        b=bmjS9muXPxjWsjNcASSXWZl+HTzgIrJEnpc3R0xNAluLiPVNfh93abJpwUGWs1BR4w
         lH4iKwUXUvAbOsBfbj6YJ3h+B3BMHDn9DoSgmQYf7c6MrKLminNm5fRCshNWH54L869m
         IOslauia5qX+vmD1Ib1wKOwPLqnGbNVqSWAwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960156; x=1752564956;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hc5v2qVnAuLXiJ7ciENEf2jMOu+QnGqRkfoT9XKyhW8=;
        b=kxVkTWYLM+on+Lfq7fN1e92L8YCSijpofSkt8pncrk9LpX7Mv3ynKh0gUxyLNQmKcY
         6LzhugmRlmQPBlBxzYHt3dWFoABF1Zyi0fSmygHaCbeqzYM8KYKmYwFE/WvbNEziiUZN
         gPI1uNM2EqgJYwbpXQAwxKuTcJfrdyIV617yVZdzCmIbXEqxoZ+wfItX+3VFOQA8oYb3
         h4woKIgnvO0/agxdliHAf1NJUj10cI1b+UcRhGASWR4rcLKqnYfnEFJNBD4gAjtSh/Ut
         LnIoP/546aQqDDQMoVdEMaNQh5UnhSYRV/WGVYyf32Xgl1J5ln8PXZKA/OXQjnTyUIn7
         NA4g==
X-Gm-Message-State: AOJu0Yx3929GMgTduQ+e7k0WRA5vYBmB3bpVqZeaaB1erQd49Q+gU5GG
	qK8Wabts6XKZRFLtff01m9XA8ds73LgeCVjIQ1+T+mKNoAe7rNCM01WkU2DBPbvJnIjO3S0h/pA
	zP4cu
X-Gm-Gg: ASbGncudT+T7tauqzTIjoaAhyX3WD+RM+h8YvLfzuCTf2OG3SLqHwZWNE8hWjPoepVZ
	Nmh9MRA/6SWHTKzpL2B7rnfjuqsGrO1Exmci6mUNcPOPf/JvWGR2ilMWVgckb5LUENKk9K8ZVz6
	VYQ7QvwjTCr9nFLEI3FCgSWAmvbmZrD7YFnG8eHwqbAJpxTkcwnBKhx0ioeR5SR4m29ytcObt4D
	Y5ywNMaLzFbL7EFdyJxYtZvjghD/wE/qBIkl6jTjhngaj28SOd+NpfRKv2MiY3VyVrsAuN717rH
	+gMufD64fOg5PAxFTf6aDtI8ZHZcWup3V7zrWi9E8XQBGUNQAsIVDbsRfBhVWaFwWkmAOlfz6A/
	IhNJD6MGDbEUv8n/+zCAu0nmeQzlw8BqpeMwSIaVJGIyjDvV3TyQ=
X-Google-Smtp-Source: AGHT+IEWkWpamdyAyiMueMWlvSg8okHpKBCoodPQ2KCSa6H3l+9ga6GHJmBpY5i9IVqh71vrr0og3w==
X-Received: by 2002:a05:6000:41e4:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3b4970315b3mr11449298f8f.33.1751960156006;
        Tue, 08 Jul 2025 00:35:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8fe5:d709:6d45:bcaf? ([2001:8b0:aba:5f3c:8fe5:d709:6d45:bcaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd3d2661sm13814565e9.19.2025.07.08.00.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:35:55 -0700 (PDT)
Message-ID: <3e3befd518eeab35a32de9c6e73474e5aa50e899.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] toolchain/clang-native: Work around native
 compiles for some gcc configs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Tue, 08 Jul 2025 08:35:54 +0100
In-Reply-To: <1850159E80660154.13503@lists.openembedded.org>
References: <1850159E80660154.13503@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220013

On Mon, 2025-07-07 at 22:33 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> Some systems can have mixed development headers, such as pieces of both g=
cc 13
> and 14 which can cause build failures, particularly if libgcc and libstdc=
++ for
> gcc 13 are present but only libgcc for gcc 14 and not libstdc++ when the =
gcc
> version is gcc 13.
>=20
> This patch forces clang to use the full toolchain rather than any partial=
 incomplete
> version. It is only necessary in the native case and should also be appli=
cable to
> compiler-rt in due source, hence making it an inc file.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/classes/toolchain/clang-native.bbclass | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/meta/classes/toolchain/clang-native.bbclass b/meta/classes/t=
oolchain/clang-native.bbclass
> index 4de491a1cb5..c8b20ff8c40 100644
> --- a/meta/classes/toolchain/clang-native.bbclass
> +++ b/meta/classes/toolchain/clang-native.bbclass
> @@ -16,3 +16,10 @@ BUILD_READELF =3D "${BUILD_PREFIX}llvm-readelf"
> =C2=A0DEPENDS +=3D "clang-native libcxx-native compiler-rt-native"
> =C2=A0
> =C2=A0LDFLAGS +=3D " --rtlib=3Dlibgcc --unwindlib=3Dlibgcc"
> +
> +# Some systems can have mixed gcc development headers, such as pieces of=
 both gcc 13
> +# and 14 which can cause build failures, particularly if libgcc and libs=
tdc++ for
> +# gcc 13 are present but only libgcc for gcc 14 and not libstdc++ when t=
he gcc
> +# version is gcc 13. Force the gcc install that matches gcc itself
> +BUILD_CFLAGS:append:class-native =3D " --gcc-install-dir=3D$(dirname $(g=
cc -print-libgcc-file-name))"
> +BUILD_CXXFLAGS:append:class-native =3D " --gcc-install-dir=3D$(dirname $=
(gcc -print-libgcc-file-name))"

Sadly on a system with buildtools tarball this doesn't work.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2052


 && /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/t=
mp/work/x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/usr/bin/cla=
ng -isystem/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproduc=
ibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/usr/=
include -O2 -pipe  --gcc-install-dir=3D/srv/pokybuild/yocto-worker/reproduc=
ible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-poky=
sdk-linux/14.2.0/../../../../lib/x86_64-pokysdk-linux/14.2.0   -isystem/srv=
/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/=
x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/usr/include -L/srv/=
pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/x=
86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/usr/lib             =
            -L/srv/pokybuild/yocto-worker/reproducible/build/build-st/repro=
ducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/l=
ib                         -Wl,--enable-new-dtags                         -=
Wl,-rpath-link,/srv/pokybuild/yocto-worker/reproducible/build/build-st/repr=
oducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/=
usr/lib                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker=
/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-linux/libcxx-nat=
ive/20.1.7/recipe-sysroot-native/lib                         -Wl,-rpath,/sr=
v/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work=
/x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/usr/lib           =
              -Wl,-rpath,/srv/pokybuild/yocto-worker/reproducible/build/bui=
ld-st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-sysro=
ot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -=
Wl,--dynamic-linker=3D/srv/pokybuild/yocto-worker/reproducible/build/build-=
st/reproducibleA/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so=
.2 -pthread -rtlib=3Dlibgcc -unwindlib=3Dlibgcc -stdlib=3Dlibstdc++  --rtli=
b=3Dlibgcc --unwindlib=3Dlibgcc -unwindlib=3Dlibgcc -L/srv/pokybuild/yocto-=
worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-linux/libc=
xx-native/20.1.7/recipe-sysroot-native/usr/lib                         -L/s=
rv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/wor=
k/x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/lib              =
           -Wl,--enable-new-dtags                         -Wl,-rpath-link,/=
srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/wo=
rk/x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/usr/lib         =
                -Wl,-rpath-link,/srv/pokybuild/yocto-worker/reproducible/bu=
ild/build-st/reproducibleA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recip=
e-sysroot-native/lib                         -Wl,-rpath,/srv/pokybuild/yoct=
o-worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-linux/li=
bcxx-native/20.1.7/recipe-sysroot-native/usr/lib                         -W=
l,-rpath,/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducib=
leA/tmp/work/x86_64-linux/libcxx-native/20.1.7/recipe-sysroot-native/lib   =
                      -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-lin=
ker=3D/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA=
/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread -rtl=
ib=3Dlibgcc -unwindlib=3Dlibgcc -stdlib=3Dlibstdc++  --rtlib=3Dlibgcc --unw=
indlib=3Dlibgcc -unwindlib=3Dlibgcc CMakeFiles/cmTC_14598.dir/testCCompiler=
.c.o -o cmTC_14598   && :
|     /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA=
/tmp/hosttools/ld: cannot find -lgcc_s: No such file or directory
|     clang: error: linker command failed with exit code 1 (use -v to see i=
nvocation)


which is because in this case, libgcc_s is in ~/yocto-worker/reproducible/b=
uild/buildtools/sysroots/x86_64-pokysdk-linux/lib

but gcc is saying:

~/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/=
usr/lib/x86_64-pokysdk-linux/14.2.0

which is where the .a files are.

Cheers,

Richard


