Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2378C10D1490
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 00:57:40 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22324.1774745853675429147
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 17:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g3n3kqOs;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d9e22176a7so1670538a34.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 17:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774745853; cv=none;
        d=google.com; s=arc-20240605;
        b=am/dMgKGHQMhnxTf09XAzCaz9oOagBqZKxEkGAd3ZP87yb9SmUYvb17FNeuKqu+fWp
         T3HyUqtiF0/CLPri+ZWr/SYJ6f9DNk95E9SS43BR2QIfou6KLi0PLJe1gIDMkwsnvxVa
         4J0EhsBm8UGHb/o4qJ0mmVJ+sdQlMclsJ5UyFkgaq6jNexueFQbBD/oq/gUp6LXTw7sx
         zXpyuGqGvg0LVzKdIIaNpIOiG4fKUy6fCYBueTlOAfnQZeK1o4u3tcqtGgBQWOAKh9sn
         +W0QKmaL0P7ycPo7uvDKxsboMHnH2qUzgNHF1tjKWNvTRwYIHfWwdQTVhoZvTZhRgPVN
         /RWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L8xT612N3bFJv3jXdW/LgLoAdpFSU8WR2EIuD/V6i3U=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=Y1D/Ub2zKX1ILwwgmS1jx/ffYuEXtFU4s5NjuEHAcSUd84fMC5hJQSMPO8QanEEHQY
         MVVOhF2R2VEaQ+la+/05jjYuurGBeQmgQmw4ened9+UgnIghpXxQnDHbo1hwU5pxHtJn
         gBp0A5b8nsc6nSrFht267R3LhFBfnCsVKcUdkHIR8hVh18HfrMa58eHjbHT0QTbX6Apa
         uwZlcVaAbAqqmvoK/knnQaK2WYED/vMGlv6GAWlUZIUlSsMo+WqgQmODQPyPGSFvFgV0
         cinFMKBEAI7E3BQs3ltFC4uWFkEFJ33/ZCY0S3X2RhooZIrFEbRclcUe5y4GFc7q/lB7
         iK4A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774745853; x=1775350653; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8xT612N3bFJv3jXdW/LgLoAdpFSU8WR2EIuD/V6i3U=;
        b=g3n3kqOs/9+d4ahCig0fOuUZIRRb3bFuPvKDwM5rSlFUSxTXJGL6FHRD1vwa1wXg7L
         Sdtq2b0UCPJl4ypIEoLjNMb1ELZHwg08zdzkhn2zHRLFiGAPHuV0eHTQZhKlWxHYlpfI
         NStIypmebKnt+58dNgYogSw5DtgPT5ZGWh0ahqzxR6OBRdTMIui8ljtrLt2hoTmI2AZB
         Xg+MiGm5o5gXATl1+s0NxD7ke2KSxYB4XLOqRp9vpuyQrgfcvxIdXQPtVCUT+WQPjFPG
         MLSzF0+BtyZuA3JxucehR2EL3sMeSzaR7BPhLvXYeuOjWbVGpWvAWn6oj1+ffJLAIp/r
         itCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774745853; x=1775350653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L8xT612N3bFJv3jXdW/LgLoAdpFSU8WR2EIuD/V6i3U=;
        b=kY+Yk2OAINRiZIzOOc4jjIZHRlLCYtvWpg8thAGUPE79XlXOlrANDhkybUtwj0rcqE
         038tnAyFW+dXTgJV1VgiqejQ8aPSh2/Gd5zwP+WlQhX48OBsv1YfOX9LPHHU+G07MbO5
         CgbVaEd/Bw0Rrfzeq269F49F8MpS1iiPZ3IbBKrP9JL6qfasEsi6B9UFz86nAhPWQxkb
         4wJ2PUQxEfue/C++p1C07uSoFU1l0Z1wSlqtvNb+rOdnsCfbr0VJZkYMzMvcpx6FF4LK
         CtHyUldmXBs6UOHBLAJkQMZBLJYZQnX3YKFrI6294fpUvZ0IVgKyKgi5gfqhfym9W8RA
         G1JQ==
X-Gm-Message-State: AOJu0Yy3UOdsIrtllGPjgCGFEGzaqftMJ6wNFfT/6T1BCeI19+Zwgzk8
	+eUkzD/5c9WD4fx8iGhT5OZlchiK2UEr3mVaIXEj1qDf0xvsWIvaK5oYb/3W44BpCVpb0b63gZl
	WbIyltJ6VbBDhhmP548nc2OJDHAHt5yFxlrIyuYc=
X-Gm-Gg: ATEYQzx+NS+tjD/1AIGVfTtsBnLrGRqK/bv/jsZ//c7LmLM8xbprqW/J231WDFWl/O8
	K7JkUpJBfN/q7go/UebkTYGx61+YDWuP2jyDiw4+yeheYqT2LPMqJ42kUGzhrIGQibqg2HUGduF
	0wv8nij4yrUREZMMkRN/IAdW1JPyFA3j16Fqw77KeQJkAKo1XhNpf0Zs+0Q0zzsVBuX5+PF/8eO
	AJO7BoS8ZUgROtoUDgND8LHeotWfKgMDL7MUkwHHKPjDM/yw6h8tMesymu4dPW8OafGeJjlGX4h
	51NzAvQF+q9IFQ7d/W4=
X-Received: by 2002:a05:6820:98e:b0:67e:2001:1f89 with SMTP id
 006d021491bc7-67e200128bamr3161154eaf.66.1774745852539; Sat, 28 Mar 2026
 17:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260326190427.2198044-1-ankur.tyagi85@gmail.com> <DHDFIRLFWLM2.MENHJ5825HET@bootlin.com>
In-Reply-To: <DHDFIRLFWLM2.MENHJ5825HET@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 29 Mar 2026 13:57:21 +1300
X-Gm-Features: AQROBzBy0mKIvYM4wWrhXhFMSN4LEwnZFahz7nVZhwg-kIPSxhmx3ID2z5DZF2k
Message-ID: <CADySD0G1Wyc0xhqVUFdMQR1FykGoXOJdn0+746idb9uDSE7nRw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] vte: upgrade 0.82.2 -> 0.84.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 00:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234137

On Fri, Mar 27, 2026 at 9:41=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Mar 26, 2026 at 8:04 PM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Drop patch which is now merged in simdutf[1] v7.7.1 used by vte[2]
> >
> > [1] https://github.com/simdutf/simdutf/commit/c6f8e887ef51bb80dd9781800=
42b9b9f4f46800f
> > [1] https://gitlab.gnome.org/GNOME/vte/-/blob/0.84.0/subprojects/simdut=
f.wrap?ref_type=3Dtags
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> Thanks for your patch.
>
> It looks like we have some build issues, at least on ARM64:
>
> ERROR: vte-0.84.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worke=
r/genericarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/temp/run.d=
o_compile.515741' failed with exit code 1
> ...
> | FAILED: [code=3D1] subprojects/simdutf/libsimdutf.a.p/meson-generated_.=
._simdutf.cpp.o
> | aarch64-poky-linux-g++ -march=3Darmv8-a+crc -mbranch-protection=3Dstand=
ard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-se=
curity -Werror=3Dformat-security --sysroot=3D/srv/pokybuild/yocto-worker/ge=
nericarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/recipe-sysroot=
 -Isubprojects/simdutf/libsimdutf.a.p -Isubprojects/simdutf -I../sources/vt=
e-0.84.0/subprojects/simdutf -fvisibility=3Dhidden -fdiagnostics-color=3Dal=
ways -D_GLIBCXX_ASSERTIONS=3D1 -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu++23 -O2 =
-g -fcanon-prefix-map -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/gener=
icarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/sources/vte-0.84.=
0=3D/usr/src/debug/vte/0.84.0 -ffile-prefix-map=3D/srv/pokybuild/yocto-work=
er/genericarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/build=3D/=
usr/src/debug/vte/0.84.0 -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/ge=
nericarm64/build/build/tmp/work/armv8a-poky-linux/vte/0.84.0/recipe-sysroot=
=3D -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/genericarm64/build/buil=
d/tmp/work/armv8a-poky-linux/vte/0.84.0/recipe-sysroot-native=3D -pipe -fvi=
sibility-inlines-hidden -fPIC -isystem../sources/vte-0.84.0/subprojects/sim=
dutf/include -Wno-undef -Wno-missing-declarations -MD -MQ subprojects/simdu=
tf/libsimdutf.a.p/meson-generated_.._simdutf.cpp.o -MF subprojects/simdutf/=
libsimdutf.a.p/meson-generated_.._simdutf.cpp.o.d -o subprojects/simdutf/li=
bsimdutf.a.p/meson-generated_.._simdutf.cpp.o -c subprojects/simdutf/simdut=
f.cpp
> | subprojects/simdutf/simdutf.cpp:1819:2: error: expected ';' after class=
 definition
> |  1819 | } // namespace arm64
> |       |  ^
> |       |  ;
> | subprojects/simdutf/simdutf.cpp:11490:52: error: definition of 'bool si=
mdutf::implementation::supported_by_runtime_system() const' is not in names=
pace enclosing 'simdutf::implementation' [-fpermissive]
> | 11490 | bool implementation::supported_by_runtime_system() const {
> |       |                                                    ^~~~~
> | subprojects/simdutf/simdutf.cpp:11531:21: error: 'implementation' in na=
mespace 'simdutf::simdutf::arm64' does not name a type
> | 11531 | static const arm64::implementation *get_arm64_singleton() {
> |       |                     ^~~~~~~~~~~~~~
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3465
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3489
>
> Can you have a look at the issue?

Hi Mathieu,

I discussed this issue with upstream
(https://github.com/simdutf/simdutf/issues/951)
Sending v2 with the fix.

cheers
Ankur
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

