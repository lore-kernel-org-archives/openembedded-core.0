Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C186C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 13:30:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1146.1782566995714681386
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 06:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aDH8kj1U;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-492719b2d81so2612065e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782566994; x=1783171794; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTKVFO+NLP0eSWUdScBpfeAk4wAOY2LFDIsUkMFCCGE=;
        b=aDH8kj1UsVbCALIRNNCukqhn9fIvkzsYtISspmbIeq6MEw/NPtMfwIocKUXyp3s4+c
         NkOGaiWdrCiojpLj06qIrR75g5Eh3PJTzPjZ0LAm74hDTfp/k4qOA/QschHd7dMpPBP4
         C7rogqTK6jm8YRD6P90mL56cB+Uq/uQmMEkTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782566994; x=1783171794;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTKVFO+NLP0eSWUdScBpfeAk4wAOY2LFDIsUkMFCCGE=;
        b=FerkMyil2WcT12ziUbuCu6beKaSRb/6zrvJzgKEY8b6C2z9mywYZtDm4Wun8cdW2U7
         7PHufd484uoLyF5FXOKnuiMoJQEYBMea+EIuipg6DOik6vhg8/d2LfPQXdKPuINK2qZo
         Re2hsr3vCXaZeH2Tiqje2CqkLPH46TSW6PjbWErTkpAxHNypwiU35aN+nr3/OzT8vdjf
         QdKTCrTz977vqVV5vSQmQRM6w80o6RrRA7EAjvdSCD7vXIoEcPIDB6tx7kEu92ZCQvqy
         zHYt5ACZYWGvqgnYc8FSsv/JFkvNYvUTV2hipL2NZt5jLu2+4eD7rGnh2nSKPeDspctt
         FK5A==
X-Gm-Message-State: AOJu0Yx8EMQ4paK7vQld31lKhz8sy7vaNrniqNjWg48+T4VMSh1DCgaD
	c6qUFYw6XgJFYzzVatvg4KijsEtckAuH9f/aOGK7eAoRZ5bGfiuwRxnYLZ8ccMTvgzE=
X-Gm-Gg: AfdE7cmP5gU2jDVDFN1VVqLZuoBXQxnwQT+P49+oCD+02nmJ58rGXNNgQkc1c2OLLED
	LGaudrBmSxDX+oU7voTQOrPH7lt/EwItTCtOyb6BziNMTpD7ss+Hk8keRhAjmjqypKAo0ewmuo6
	zmiMeODjSDWhKzavAh0j2YufRelJ+ouP66jDYYnNZmXf/FtwYU9QoMr2/9F3f4OMleHQbVQqHy3
	xJC4Y6TQVVmTa2L3wgXNJRNGRrE9mx0xZr3s8Xw/wSnrYv1yvsCfxkrkg442tm2zZlZZwHqwGrv
	fUV+b7BQ7giDhDkBS4SHFQrzGD/dSN1HE43OlMjmTdOLm6tFe16UITwVb2BQi+yrJlcK2myyGIL
	naF5f7+tO1OHXAjY0vN1A7JVnuKVgjO90+V0yEJv5UuU59JgUt71Kmv9YgU1wX+z7cqYU6kK9Ad
	Imco5fNVTJV7efVkFtnv82NoYvbGdKpNWCkQtvBWu/lm3M31HgJXfHMQAPcaF7AFonNO0wTmHgQ
	xqEaA==
X-Received: by 2002:a05:600c:3b07:b0:492:5e69:c5ff with SMTP id 5b1f17b1804b1-4926fc9ce7cmr79803805e9.32.1782566993846;
        Sat, 27 Jun 2026 06:29:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa0017af279e4f5f6cc6.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17af:279e:4f5f:6cc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f9db29b15sm8388694f8f.18.2026.06.27.06.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 06:29:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 15:29:52 +0200
Message-Id: <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, <ccasciato@21sw.us>,
 <paul@pbarker.dev>, <randy.macleod@windriver.com>, <ross.burton@arm.com>,
 <sundeep.kokkonda@windriver.com>, <SunilKumar.Dora@windriver.com>,
 "Alexander Kanavin" <alex@linutronix.de>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>
Subject: Re: [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to support
 Ubuntu 26.04 on Scarthgap
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr> <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com> <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr>
In-Reply-To: <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 13:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239695

On Fri Jun 26, 2026 at 5:26 PM CEST, Yoann Congal wrote:
> On Fri Jun 26, 2026 at 4:57 PM CEST, Alexander Kanavin wrote:
>> On Fri, 26 Jun 2026 at 13:38, Yoann Congal <yoann.congal@smile.fr> wrote=
:
>>> I've hacked the backport until it passes testing:
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/408=
5
>>> ... but I'm really *NOT* sure this is the right approach. Hence this RF=
C
>>> with the patches I ended-up with.
>>>
>>> If anyone could check/review/improve these patches to help me get them
>>> to a mergable state, that'd be nice. Otherwise, I would have no other
>>> choice than never support Ubuntu 26.04 on Scarthgap.
>>
>> I had a quick look, and they're basically ok.
>>
>> The key check is to run ldd on the rust-native pieces and confirm that
>> they indeed start linking libLLVM*so dynamically after the patches (if
>> it comes from rust-llvm, it's probably named differently). E.g. on my
>> master build:
>>
>> alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ldd
>> tmp/sysroots-components/x86_64/rust-native/usr/lib/librustc_driver-5e2c7=
5e9f7705310.so
>>     linux-vdso.so.1 (0x00007f8f929d0000)
>>     libLLVM.so.22.1 =3D> not found
>>     libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f8f=
8ca00000)
>>
>> alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ldd
>> tmp/sysroots-components/x86_64/rust-native/usr/bin/rustc
>>     linux-vdso.so.1 (0x00007f3eee009000)
>>     librustc_driver-5e2c75e9f7705310.so =3D>
>> /srv/storage/alex/yocto/build-64-alt/tmp/sysroots-components/x86_64/rust=
-native/usr/bin/../lib/librustc_driver-5e2c75e9f7705310.so
>> (0x00007f3ee8400000)
>>     libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3ee820c000)
>>     libLLVM.so.22.1 =3D> not found
>>     libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f3e=
e7e00000)
>
> Ok! So that looks good, because with the patches I get:
> $ ldd tmp/sysroots-components/x86_64/rust-native/usr/bin/rustc
> 	linux-vdso.so.1 (0x00007ffc06548000)
> 	librustc_driver-686d20105d1a2cf7.so =3D> $BUILD/tmp/sysroots-components/=
x86_64/rust-native/usr/bin/../lib/librustc_driver-686d20105d1a2cf7.so (0x00=
007fcec0a00000)
> 	libstd-64729a5a222c378b.so =3D> $BUILD/tmp/sysroots-components/x86_64/ru=
st-native/usr/bin/../lib/libstd-64729a5a222c378b.so (0x00007fcec08c0000)
> 	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fcec06de000)
> 	libLLVM-17.so =3D> not found
> 	libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007fcec040=
0000)
> 	libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007fcec4d630=
00)
> 	libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007fcec0320000)
> 	$BUILD/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 =3D>=
 /lib64/ld-linux-x86-64.so.2 (0x00007fcec4d98000)
>
> And even: $ oe-run-native rust-native /bin/ldd $BUILD/tmp/work/x86_64-lin=
ux/rust-native/1.75.0/recipe-sysroot-native/usr/bin/rustc
> Getting sysroot...
> 	linux-vdso.so.1 (0x00007ffd807b1000)
> 	librustc_driver-686d20105d1a2cf7.so =3D> $BUILD/tmp/work/x86_64-linux/ru=
st-native/1.75.0/recipe-sysroot-native/usr/bin/../lib/librustc_driver-686d2=
0105d1a2cf7.so (0x00007f9ab0800000)
> 	libstd-64729a5a222c378b.so =3D> $BUILD/tmp/work/x86_64-linux/rust-native=
/1.75.0/recipe-sysroot-native/usr/bin/../lib/libstd-64729a5a222c378b.so (0x=
00007f9ab06c0000)
> 	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f9ab04de000)
> 	libLLVM-17.so =3D> $BUILD/tmp/work/x86_64-linux/rust-native/1.75.0/recip=
e-sysroot-native/usr/bin/../lib/./libLLVM-17.so (0x00007f9aab000000)
> 	libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f9aaac0=
0000)
> 	libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f9ab04be0=
00)
> 	libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007f9ab03de000)
> 	$BUILD/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 =3D>=
 /lib64/ld-linux-x86-64.so.2 (0x00007f9ab4ae2000)
>
> =3D> It does, in fact, dynamically link on the built libLLVM-17.so.

Hmm, it looks like we have the problem but around the bootstraping rustc
compiler:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4033/step=
s/12/logs/stdio l45466:
|   process didn't exit successfully: `/srv/pokybuild/yocto-worker/genericx=
86-64/build/build/tmp/work/core2-64-poky-linux/rust/1.75.0/rustc-1.75.0-src=
/build/bootstrap/debug/rustc [...] (exit status: 254)
| error: rustc interrupted by SIGSEGV, printing backtrace

I checked: it does not dynamically link to libLLVM.so
$ ldd $BUILD/tmp/work/core2-64-poky-linux/rust/1.75.0/rustc-1.75.0-src/buil=
d/bootstrap/debug/rustc
/bin/bash: warning: setlocale: LC_ALL: cannot change locale (fr_FR.utf8)
	linux-vdso.so.1 (0x00007fffc78b9000)
	libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f50950b2000=
)
	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f5094ed0000)
	$BUILD/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 =3D> /=
lib64/ld-linux-x86-64.so.2 (0x00007f509516a000)

I'll pull on that but suggestions welcome!

>
> Thanks!
>
>>
>> Alex


--=20
Yoann Congal
Smile ECS


