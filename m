Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C11BC48294
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 14:05:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.23345.1706882754911794499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 06:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zyihysv8;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40ef6bbb61fso17854215e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 06:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706882753; x=1707487553; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9N3PyPYM+bRJ1s6OkK8UeQdXF8z/FXNSccjlP1VtyK0=;
        b=Zyihysv84B8MF/9z/SULNUD0yVN+chMt9lRZy85TZxCx7lfiWFbhNgtKyAsSF+36aR
         nSDyzRIWwIgTSxfsz1X2xMnkV5VD9XgyFuQGZ8b/a5Hl4iWtd9O/8zahivN79zXnYD7E
         SUQyBsGROsNUc5dEee4zYpVI7brXPI19wh6W3ZPTZfqbzJBF2yfrMDQ86tc7/UK8yBJG
         Ed7Ci6Vj0sDCovMXqr32BgEIiq7OuoLY4Bu3KRtA/2dQKvZ1uApf+fyqDPhLEv98tQN7
         FA26dYVezZHuF3EkLGvCEffCx4DUJxytAloC18WCVRYKnJwpbtQ+O8nat7uBeMDcnXsw
         AYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706882753; x=1707487553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9N3PyPYM+bRJ1s6OkK8UeQdXF8z/FXNSccjlP1VtyK0=;
        b=VWH1/Wtf59hA43Jliv2r8cla1N5oQnyLLSbXXmNjyd0JNUQgZgIubusGzmUXyTMFtL
         kJ7TaWoUWkcqzfTSuPmmmqUe9n0j/an4qVE/OZ2PLgAVDwVF45xXVudNfMhUQvCeazhi
         4OPSn5QrRevwXR5JDoXzrRGXddwNOdIjk6Zinx5Nlobeugt9IHnFFfTRZwExsiO4Lx62
         rgU20r6L4MOWPZbHD8AUH0+1aJNeHTZCEbcdGSJdVpkAv0qUAhwydk2yVBzxrJR1XODP
         DmmcTNBWikDeCUs5ra2rp8jTiaj33YgVbTHFK2q5TWhz35Kf+DOW7sx9AZz6VmssB31q
         jPDg==
X-Gm-Message-State: AOJu0YwDeN7woRbZiwj6IVkjcUFn7jxkTl/dXfaDc/V0lcKjFimeVmi5
	EdJRqFKenqpHT4DmrhPPIr8IbA73OeCdsO0gwzDghxeL3yoU5XCHo2owakNlY4//8awcwOLdf/c
	foEQ9vsqgtyDyeNfFwO1+QiBCKHg=
X-Google-Smtp-Source: AGHT+IEQsiIcEDKjJrVorVV9HWFm7MKSsi6WOj7vYbHjO3sCot7VpOTsHhlCPSJuoI6yVQL7Z7UGMt6y9gc4drAPlTM=
X-Received: by 2002:a5d:4e88:0:b0:33a:e526:3a49 with SMTP id
 e8-20020a5d4e88000000b0033ae5263a49mr1552024wru.23.1706882752972; Fri, 02 Feb
 2024 06:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20240126233141.1589013-1-raj.khem@gmail.com>
In-Reply-To: <20240126233141.1589013-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 2 Feb 2024 15:05:39 +0100
Message-ID: <CA+chaQcVxMyXLfaFzFxA1nAeWMrSFMA8SNOdBE7=yK7MO9sEfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] armv8/armv9: Avoid using -march when -mcpu is chosen
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Jon Mason <jdmason@kudzu.us>
Content-Type: multipart/alternative; boundary="0000000000002a126d0610669c42"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 14:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194799

--0000000000002a126d0610669c42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 12:31=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

> Current include logic goes into generic arm v8/v9 architecture tunes and
> adds corresponding -march option after synthesizing it from various tune
> fragments, this is fine for a machine which is using armv8/armv9 based
> tunes but cortex tunes are intentionally using -mcpu option based on
> selected tune value. So when cortex based default tune is selected for a
> machine, it will add both -mcpu and -march to the compiler commandline
> which can result in invalid combinations for this pair in gcc's own
> logic. This can then result in compiler warnings/errors reporting this
>
> e.g.
>
> aarch64-yoe-linux-gcc  -mcpu=3Dcortex-a72.cortex-a53
> -march=3Darmv8-a+crc+crypto -mbranch-protection=3Dstandard
> ...
> cc1: error: switch '-mcpu=3Dcortex-a72.cortex-a53' conflicts with
> '-march=3Darmv8-a+crc+crypto' switch and resulted in options '+crc+crypto=
'
> being added [-Werror]
>
> This is seen in lot of configure test results in glibc 2.39 and the
> warning is promoted to errors by gcc in some of these checks especially
> with gcc-14, the logs also show it as warning in other places in
> configure checks.
>
> mcpu option will compute relevant march implicitly as it specifies a cpu
> implementation and this will be the right value to use, therefore do not
> specify -march when -mcpu is already describing the cpu.
>

I agree that keeping mapping between mcpu and march is tricky.

Just in case someone else hits similar issue, here is one new failure
caused by this change.

It is reproducible in xnnpack, it used to build with:
-march=3Darmv8-a+crc and then -march=3Darmv8.2-a+fp16+dotprod added by xnnp=
ack
source
while with this change it ends with:
-mcpu=3Dcortex-a72+crc and -march=3Darmv8.2-a+fp16+dotprod
actually causing the issue you were trying to avoid, because tensorflow has
in some cases different expectations that what is set in TUNE_CCARGS and
needs to be fixed in tensorflow or worked around in metadata as before with=
:
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-up=
streamable/xnnpack/xnnpack.bb#L70

which will need to be extended to avoid:
FAILED:
CMakeFiles/all_microkernels.dir/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64=
-neonfp16arith-ld32.S.o

TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/recipe-sysr=
oot-native/usr/bin/aarch64-webos-linux/aarch64-webos-linux-gcc
--sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903=
/recipe-sysroot
-DFXDIV_USE_INLINE_ASSEMBLY=3D0 -DXNN_ENABLE_ARM_BF16=3D1
-DXNN_ENABLE_ARM_DOTPROD=3D1 -DXNN_ENABLE_ARM_FP16=3D1 -DXNN_ENABLE_ASSEMBL=
Y=3D1
-DXNN_ENABLE_GEMM_M_SPECIALIZATION=3D1 -DXNN_ENABLE_JIT=3D0
-DXNN_ENABLE_MEMOPT=3D1 -DXNN_ENABLE_SPARSE=3D1
-ITOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src
-ITOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/pthre=
adpool-source/include
-ITOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/FXdiv=
-source/include
-ITOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/FP16-=
source/include
-mcpu=3Dcortex-a72+crc -mbranch-protection=3Dstandard -fstack-protector-str=
ong
 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secu=
rity
-Werror=3Dreturn-type
 --sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/47588490=
3/recipe-sysroot
 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack=
/475884903/git=3D/usr/src/debug/xnnpack/475884903
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack=
/475884903/git=3D/usr/src/debug/xnnpack/475884903
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack=
/475884903/build=3D/usr/src/debug/xnnpack/475884903
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack=
/475884903/build=3D/usr/src/debug/xnnpack/475884903
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack=
/475884903/recipe-sysroot=3D
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack=
/475884903/recipe-sysroot=3D
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack=
/475884903/recipe-sysroot-native=3D
 -Wno-psabi -pthread  -fno-math-errno  -march=3Darmv8.2-a+fp16+dotprod  -O2
-MD -MT
CMakeFiles/all_microkernels.dir/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64=
-neonfp16arith-ld32.S.o
-MF
CMakeFiles/all_microkernels.dir/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64=
-neonfp16arith-ld32.S.o.d
-o
CMakeFiles/all_microkernels.dir/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64=
-neonfp16arith-ld32.S.o
-c
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S
cc1: warning: switch '-mcpu=3Dcortex-a72+crc' conflicts with
'-march=3Darmv8.2-a+fp16+dotprod' switch
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:
Assembler messages:
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:64:
Error: selected processor does not support `fmla v16.8h,v20.8h,v0.h[0]'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:65:
Error: selected processor does not support `fmla v17.8h,v21.8h,v0.h[0]'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:66:
Error: selected processor does not support `fmla v18.8h,v22.8h,v0.h[1]'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:67:
Error: selected processor does not support `fmla v19.8h,v23.8h,v0.h[1]'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:75:
Error: selected processor does not support `fadd v16.8h,v16.8h,v18.8h'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:76:
Error: selected processor does not support `fadd v17.8h,v17.8h,v19.8h'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:80:
Error: selected processor does not support `fmax v16.8h,v16.8h,v4.8h'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:81:
Error: selected processor does not support `fmax v17.8h,v17.8h,v4.8h'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:82:
Error: selected processor does not support `fmin v16.8h,v16.8h,v5.8h'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:83:
Error: selected processor does not support `fmin v17.8h,v17.8h,v5.8h'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:102:
Error: selected processor does not support `fmla v16.8h,v20.8h,v0.h[0]'
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16=
-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:103:
Error: selected processor does not support `fmla v17.8h,v21.8h,v0.h[0]'

--0000000000002a126d0610669c42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Jan 27, 2024 at 12:31=E2=80=AFAM =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Current include logic goes into generic arm v8/v9 arch=
itecture tunes and<br>
adds corresponding -march option after synthesizing it from various tune<br=
>
fragments, this is fine for a machine which is using armv8/armv9 based<br>
tunes but cortex tunes are intentionally using -mcpu option based on<br>
selected tune value. So when cortex based default tune is selected for a<br=
>
machine, it will add both -mcpu and -march to the compiler commandline<br>
which can result in invalid combinations for this pair in gcc&#39;s own<br>
logic. This can then result in compiler warnings/errors reporting this<br>
<br>
e.g.<br>
<br>
aarch64-yoe-linux-gcc=C2=A0 -mcpu=3Dcortex-a72.cortex-a53 -march=3Darmv8-a+=
crc+crypto -mbranch-protection=3Dstandard<br>
...<br>
cc1: error: switch &#39;-mcpu=3Dcortex-a72.cortex-a53&#39; conflicts with &=
#39;-march=3Darmv8-a+crc+crypto&#39; switch and resulted in options &#39;+c=
rc+crypto&#39; being added [-Werror]<br>
<br>
This is seen in lot of configure test results in glibc 2.39 and the<br>
warning is promoted to errors by gcc in some of these checks especially<br>
with gcc-14, the logs also show it as warning in other places in<br>
configure checks.<br>
<br>
mcpu option will compute relevant march implicitly as it specifies a cpu<br=
>
implementation and this will be the right value to use, therefore do not<br=
>
specify -march when -mcpu is already describing the cpu.<br></blockquote><d=
iv><br></div><div>I agree that keeping mapping between mcpu and march is tr=
icky.</div><div><br></div><div>Just in case someone else hits similar issue=
, here is one new failure caused by this change.</div><div><br></div><div>I=
t is reproducible in xnnpack, it used to build with:</div><div>-march=3Darm=
v8-a+crc and then=C2=A0-march=3Darmv8.2-a+fp16+dotprod added by xnnpack sou=
rce</div><div>while with this change it ends with:</div><div>-mcpu=3Dcortex=
-a72+crc and -march=3Darmv8.2-a+fp16+dotprod<br></div><div>actually causing=
 the issue you were trying to avoid, because tensorflow has in some cases d=
ifferent expectations that what is set in TUNE_CCARGS and needs to be fixed=
 in tensorflow or worked around in metadata as before with:</div><div><a hr=
ef=3D"https://github.com/webosose/meta-webosose/blob/master/meta-webos/reci=
pes-upstreamable/xnnpack/xnnpack.bb#L70">https://github.com/webosose/meta-w=
ebosose/blob/master/meta-webos/recipes-upstreamable/xnnpack/xnnpack.bb#L70<=
/a><br></div><div><br></div><div>which will need to be extended to avoid:</=
div><div>FAILED: CMakeFiles/all_microkernels.dir/src/f16-gemm/gen-inc/1x16i=
nc-minmax-aarch64-neonfp16arith-ld32.S.o <br>TOPDIR/BUILD/work/raspberrypi4=
_64-webos-linux/xnnpack/475884903/recipe-sysroot-native/usr/bin/aarch64-web=
os-linux/aarch64-webos-linux-gcc --sysroot=3DTOPDIR/BUILD/work/raspberrypi4=
_64-webos-linux/xnnpack/475884903/recipe-sysroot -DFXDIV_USE_INLINE_ASSEMBL=
Y=3D0 -DXNN_ENABLE_ARM_BF16=3D1 -DXNN_ENABLE_ARM_DOTPROD=3D1 -DXNN_ENABLE_A=
RM_FP16=3D1 -DXNN_ENABLE_ASSEMBLY=3D1 -DXNN_ENABLE_GEMM_M_SPECIALIZATION=3D=
1 -DXNN_ENABLE_JIT=3D0 -DXNN_ENABLE_MEMOPT=3D1 -DXNN_ENABLE_SPARSE=3D1 -ITO=
PDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src -ITOP=
DIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/pthreadpoo=
l-source/include -ITOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/47=
5884903/git/FXdiv-source/include -ITOPDIR/BUILD/work/raspberrypi4_64-webos-=
linux/xnnpack/475884903/git/FP16-source/include -mcpu=3Dcortex-a72+crc -mbr=
anch-protection=3Dstandard -fstack-protector-strong =C2=A0-O2 -D_FORTIFY_SO=
URCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dret=
urn-type =C2=A0--sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xn=
npack/475884903/recipe-sysroot =C2=A0-O2 -pipe -g -feliminate-unused-debug-=
types -fcanon-prefix-map =C2=A0-fmacro-prefix-map=3DTOPDIR/BUILD/work/raspb=
errypi4_64-webos-linux/xnnpack/475884903/git=3D/usr/src/debug/xnnpack/47588=
4903 =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-lin=
ux/xnnpack/475884903/git=3D/usr/src/debug/xnnpack/475884903 =C2=A0-fmacro-p=
refix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903=
/build=3D/usr/src/debug/xnnpack/475884903 =C2=A0-fdebug-prefix-map=3DTOPDIR=
/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/build=3D/usr/src/=
debug/xnnpack/475884903 =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspbe=
rrypi4_64-webos-linux/xnnpack/475884903/recipe-sysroot=3D =C2=A0-fmacro-pre=
fix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/r=
ecipe-sysroot=3D =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_=
64-webos-linux/xnnpack/475884903/recipe-sysroot-native=3D =C2=A0-Wno-psabi =
-pthread =C2=A0-fno-math-errno =C2=A0-march=3Darmv8.2-a+fp16+dotprod =C2=A0=
-O2 -MD -MT CMakeFiles/all_microkernels.dir/src/f16-gemm/gen-inc/1x16inc-mi=
nmax-aarch64-neonfp16arith-ld32.S.o -MF CMakeFiles/all_microkernels.dir/src=
/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S.o.d -o CMakeF=
iles/all_microkernels.dir/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neonf=
p16arith-ld32.S.o -c TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/=
475884903/git/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld3=
2.S<br>cc1: warning: switch &#39;-mcpu=3Dcortex-a72+crc&#39; conflicts with=
 &#39;-march=3Darmv8.2-a+fp16+dotprod&#39; switch<br>TOPDIR/BUILD/work/rasp=
berrypi4_64-webos-linux/xnnpack/475884903/git/src/f16-gemm/gen-inc/1x16inc-=
minmax-aarch64-neonfp16arith-ld32.S: Assembler messages:<br>TOPDIR/BUILD/wo=
rk/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16-gemm/gen-inc/1=
x16inc-minmax-aarch64-neonfp16arith-ld32.S:64: Error: selected processor do=
es not support `fmla v16.8h,v20.8h,v0.h[0]&#39;<br>TOPDIR/BUILD/work/raspbe=
rrypi4_64-webos-linux/xnnpack/475884903/git/src/f16-gemm/gen-inc/1x16inc-mi=
nmax-aarch64-neonfp16arith-ld32.S:65: Error: selected processor does not su=
pport `fmla v17.8h,v21.8h,v0.h[0]&#39;<br>TOPDIR/BUILD/work/raspberrypi4_64=
-webos-linux/xnnpack/475884903/git/src/f16-gemm/gen-inc/1x16inc-minmax-aarc=
h64-neonfp16arith-ld32.S:66: Error: selected processor does not support `fm=
la v18.8h,v22.8h,v0.h[1]&#39;<br>TOPDIR/BUILD/work/raspberrypi4_64-webos-li=
nux/xnnpack/475884903/git/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neonf=
p16arith-ld32.S:67: Error: selected processor does not support `fmla v19.8h=
,v23.8h,v0.h[1]&#39;<br>TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpa=
ck/475884903/git/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-=
ld32.S:75: Error: selected processor does not support `fadd v16.8h,v16.8h,v=
18.8h&#39;<br>TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/4758849=
03/git/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:76:=
 Error: selected processor does not support `fadd v17.8h,v17.8h,v19.8h&#39;=
<br>TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src=
/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:80: Error: se=
lected processor does not support `fmax v16.8h,v16.8h,v4.8h&#39;<br>TOPDIR/=
BUILD/work/raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16-gemm/g=
en-inc/1x16inc-minmax-aarch64-neonfp16arith-ld32.S:81: Error: selected proc=
essor does not support `fmax v17.8h,v17.8h,v4.8h&#39;<br>TOPDIR/BUILD/work/=
raspberrypi4_64-webos-linux/xnnpack/475884903/git/src/f16-gemm/gen-inc/1x16=
inc-minmax-aarch64-neonfp16arith-ld32.S:82: Error: selected processor does =
not support `fmin v16.8h,v16.8h,v5.8h&#39;<br>TOPDIR/BUILD/work/raspberrypi=
4_64-webos-linux/xnnpack/475884903/git/src/f16-gemm/gen-inc/1x16inc-minmax-=
aarch64-neonfp16arith-ld32.S:83: Error: selected processor does not support=
 `fmin v17.8h,v17.8h,v5.8h&#39;<br>TOPDIR/BUILD/work/raspberrypi4_64-webos-=
linux/xnnpack/475884903/git/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neo=
nfp16arith-ld32.S:102: Error: selected processor does not support `fmla v16=
.8h,v20.8h,v0.h[0]&#39;<br>TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/xn=
npack/475884903/git/src/f16-gemm/gen-inc/1x16inc-minmax-aarch64-neonfp16ari=
th-ld32.S:103: Error: selected processor does not support `fmla v17.8h,v21.=
8h,v0.h[0]&#39;<br></div></div></div>

--0000000000002a126d0610669c42--

