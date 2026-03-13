Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EF2105F784
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 09:43:51 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12197.1773395022840073797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 02:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNr8p6yH;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59de8155501so1977725e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 02:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773395021; cv=none;
        d=google.com; s=arc-20240605;
        b=W2wBkoVVikqiAi3ZkoRgUgIp5pKQUEbAhws57ObsEB8mea1QGGsQAf//Qwva2PkvFC
         SLTz1euy+B8IFkytcQaMkSowex1WZhVk69JTxJSK7fZ2hmJGFmoYhiaq8Q5pyCB2hUat
         Z5KGRawPh5E0rpd+HyLXz+m2tZmRtx3oSsOw3EiuUqAycDfrJSVhTpN+vkk9IKZFK9uf
         82I0fDvtgwrSOzjfEs8jniK7cQ294zSRBkCAG0zAO03poTxMEHDRPFxOanLltAGMkqLx
         n/Fs4hlkyZPeNOmJFFYBYn/H1+C/z5MMBI8nAIZLe3ix0rCoA0aYmDeFsUbE9ivLoMUi
         GfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B//+rUgFtj2xmuAqG0VFmRzQAeGKe6NzF8TY7Pi2fKE=;
        fh=hrkLQmGwkMNz0yIusBuw6DgRFMnhyYIUuaXGM05GORk=;
        b=TWDHfVCWWBWQXiuVVV+3aVn0KghVllOcFDj0M5vABRHo0df56K1ZqdZ//8WM+DHIkk
         +IYe3XPVGMaQyUP5n/TpmKhzI7G8UXjhZDIF2PJAxSRb0cE/G0BXBbdJfBsc0YNmxuko
         y98aC9GXlT89pCKtzTOUV2mW9TA/97wpWj58LrS1ksuXKUC3AypL4qHIRYf1+Kru972e
         1Jsm5CTwxVk5ExvulVgMULnCyMiMdK4PtWDGVR+OvwX0y9LhotRejmPPKueU+elDy3Tq
         UlhfBTCzugXbjUrzLIL85xbhDyx7pC+bC8OweH4yGKVLpSyp/gUyvByQoQKCRUPgAiXe
         f0lA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773395021; x=1773999821; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B//+rUgFtj2xmuAqG0VFmRzQAeGKe6NzF8TY7Pi2fKE=;
        b=nNr8p6yHAnxgewhbu5QC3cNZynx8yeFHoaH6oH3d9tXtq93WB0dGmJjCuoML7TndOX
         kkZOXReRZgPu76jpVWF+UUBsQ2xNkbVJQSvRPMm0uz2e98qDl7eKi4/JKFFt6EUZSmBh
         3u4D//zLFeTJTg30eU31XO6aRWF/fLhCIXYh2ZxGfkpj+FCMTNZ0bcVs+LMnHWnwCP1s
         01aohX3ny9GEPp1v4t6ApeDWaTAfnsWdEeZFoFEa53oLrfMytkRjV1omF70XtoUuK5nx
         tiIgnpunVHsYD5u2CVGGY4oJRdE/ujxlyJm5YcaxLRcpfwaGr3bYfogdJ+Tsv2E1Ymrv
         uwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395021; x=1773999821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B//+rUgFtj2xmuAqG0VFmRzQAeGKe6NzF8TY7Pi2fKE=;
        b=AswnE8BC4KsnTHHI+PYpz2dXOm6FvMUmVVLfNcCe0K1LkjTB7NMkN9sofdlEAfo55p
         aJEni0jb8XLJxDEQpHaRoCU2UJzTT5H8RmPaQmcgAhK+XQiWOB0VkA1sa8IBFay3VvD+
         II+MVGg/rce8mHihA2Jm3OMnCF/EAIcPv+Fn1cM6BVVutbYBjC2yJR6fve9rKZBqciAA
         3ckM997yB9aQXb4WuX2dDopC04+h0yz+Y+6NU/mtZkDzfny1ZqCKg8JS5sH5mOfS3yuJ
         80ZJxabLEUhGU1PHkqbu5936L29iXz0a6+RYFh42nLtPJ2U/ZMOp/pvX+NVWLFKvjzYh
         mfHg==
X-Forwarded-Encrypted: i=1; AJvYcCUaQlDfWVm8rL8gfL+Ds1ejZj10h8KskHD+0sbjCK6QdM58lEWHvoOGcx8eJ3kQD1gi5/pcYEA7xnOtXFMjmuS51w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxpWquF0Naxzxudqqcy6D2kUXFqf8C/7LWH/E+1+a+cRD6I6+N
	atTDQARZEM2JTdAR4fG21BunPKmpn2b03qG7BbdVbSQgqqjN9J2RDlm66dmecXIbzJ+8ODxFFkg
	to2NNtU3Zd+x0RLro3hxEaRlH+gcY5Kc=
X-Gm-Gg: ATEYQzzkQwMeLmYP476k8qFZ4z29y2zRcD2waHFtvIK55RUDo3FEj/lXTdvKVz61Xud
	sTaogXEwv8GafdyRURO8zQP+TugFcK/G3KFHzJxlYAx4m5ii4PMyJakQSlL9cGHfuGXkez1P1TX
	7+glpiaA6iOHHX75gyTgmM8vxZ+aD0omjvHquV4cGcK34/yuoGpwY6yPBWDj2pnOMCx5Zz8p2RK
	fqUMdmm4A60Dz19CUwRxie3jesfgJNCq2G1jvuKsSBK/N+pxJEBq3km9Yj9SmwENI8f/Da3FhpS
	m2ERmRt3IA==
X-Received: by 2002:ac2:5a05:0:b0:5a1:34e8:3d9 with SMTP id
 2adb3069b0e04-5a162b193b4mr664499e87.39.1773395020312; Fri, 13 Mar 2026
 02:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260304045413.3265198-1-hongxu.jia@windriver.com> <d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com>
In-Reply-To: <d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Mar 2026 10:43:26 +0100
X-Gm-Features: AaiRm51oEu4n-ev_S9KPrBOcORuj-N61_krsswlykUdLgcyTsDNHIH38XPH0vqQ
Message-ID: <CA+chaQfjTQxPAWr0jomTZmsFRMvKh-D-=AAtfYkZxxOsZhUh3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/4] python3-setuptools: upgrade 80.9.0 -> 82.0.0
To: marcel@ziswiler.com
Cc: Hongxu Jia <hongxu.jia@windriver.com>, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233032

Don't you have meta-tensorflow included in your build and set it to
use python-3.13 instead of 3.14 as in:
https://git.yoctoproject.org/meta-tensorflow/commit/?id=3Df1b44771445970cb3=
89a50b5885356c987b8931a

3.13 is not compatible with new setuptools, I have seen the same
errors then removed meta-tensorflow and it built fine again.

Hopefully https://lists.yoctoproject.org/g/yocto-patches/message/3323
will be resolved soon.

Regards,


On Fri, Mar 13, 2026 at 10:25=E2=80=AFAM Marcel Ziswiler via
lists.openembedded.org <marcel=3Dziswiler.com@lists.openembedded.org>
wrote:
>
> Hi Hongxu Jia
>
> On Wed, 2026-03-04 at 12:54 +0800, Hongxu Jia wrote:
> > Remove python3-pkg-resources
> >
> > History v82.0.0 [1]:
> >
> > Deprecations and Removals
> > - pkg_resources has been removed from Setuptools. Most common uses of p=
kg_resources have
> >   been superseded by the importlib.resources and importlib.metadata pro=
jects. Projects
> >   and environments relying on pkg_resources for namespace packages or o=
ther behavior
> >   should depend on older versions of setuptools. (#3085)
> >
> > [1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
> [snip]
>
> Unfortunately, this seems to break all my meta-riscv machine builds:
>
> ...
> | gcc -shared -L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-=
linux/python3-cython-
> native/3.2.4/recipe-sysroot-native/usr/lib -L/var/home/sumo/Sources/riscv=
-yocto/build/tmp/work/x86_64-
> linux/python3-cython-native/3.2.4/recipe-sysroot-native/lib -Wl,--enable-=
new-dtags -Wl,-rpath-
> link,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pytho=
n3-cython-native/3.2.4/recipe-sysroot-
> native/usr/lib -Wl,-rpath-link,/var/home/sumo/Sources/riscv-yocto/build/t=
mp/work/x86_64-linux/python3-cython-
> native/3.2.4/recipe-sysroot-native/lib -Wl,-rpath,/var/home/sumo/Sources/=
riscv-yocto/build/tmp/work/x86_64-
> linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/lib -Wl,-rpat=
h,/var/home/sumo/Sources/riscv-
> yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sysr=
oot-native/lib -Wl,-O1 -Wl,--allow-
> shlib-undefined -Wl,--dynamic-linker=3D/var/home/sumo/Sources/riscv-yocto=
/build/tmp/sysroots-uninative/x86_64-
> linux/lib/ld-linux-x86-64.so.2 -pthread -isystem/var/home/sumo/Sources/ri=
scv-yocto/build/tmp/work/x86_64-
> linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/include -O2 -=
pipe -
> isystem/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pyt=
hon3-cython-native/3.2.4/recipe-
> sysroot-native/usr/include build/temp.linux-x86_64-cpython-314/var/home/s=
umo/Sources/riscv-
> yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/sources/cyt=
hon-3.2.4/Cython/Compiler/Code.o -
> L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-c=
ython-native/3.2.4/recipe-sysroot-
> native/usr/lib -o build/lib.linux-x86_64-cpython-314/Cython/Compiler/Code=
.cpython-314-x86_64-linux-gnu.so
> | running bdist_wheel
> | error: invalid command 'egg_info'
> | WARNING: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux=
/python3-cython-
> native/3.2.4/temp/run.do_compile.2101018:159 exit 1 from 'nativepython3 s=
etup.py --verbose build -j 48
> bdist_wheel --dist-dir /var/home/sumo/Sources/riscv-yocto/build/tmp/work/=
x86_64-linux/python3-cython-
> native/3.2.4/dist'
> | WARNING: Backtrace (BB generated script):
> |       #1: setuptools3_do_compile, /var/home/sumo/Sources/riscv-yocto/bu=
ild/tmp/work/x86_64-linux/python3-
> cython-native/3.2.4/temp/run.do_compile.2101018, line 159
> |       #2: do_compile, /var/home/sumo/Sources/riscv-yocto/build/tmp/work=
/x86_64-linux/python3-cython-
> native/3.2.4/temp/run.do_compile.2101018, line 149
> |       #3: main, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_6=
4-linux/python3-cython-
> native/3.2.4/temp/run.do_compile.2101018, line 166
> ERROR: Task (virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/ope=
nembedded-core/meta/recipes-
> devtools/python/python3-cython_3.2.4.bb:do_compile) failed with exit code=
 '1'
> ...
> Summary: 7 tasks failed:
>   virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-c=
ore/meta/recipes-
> devtools/python/python3-pyelftools_0.32.bb:do_compile
>     log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/p=
ython3-pyelftools-
> native/0.32/temp/log.do_compile.2101167
>   virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-c=
ore/meta/recipes-
> devtools/python/python3-markupsafe_3.0.3.bb:do_compile
>     log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/p=
ython3-markupsafe-
> native/3.0.3/temp/log.do_compile.2100841
>   virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-c=
ore/meta/recipes-
> devtools/python/python3-calver_2025.10.20.bb:do_compile
>     log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/p=
ython3-calver-
> native/2025.10.20/temp/log.do_compile.2101147
>   virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-c=
ore/meta/recipes-
> devtools/meson/meson_1.10.1.bb:do_compile
>     log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/m=
eson-
> native/1.10.1/temp/log.do_compile.2100900
>   virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-c=
ore/meta/recipes-
> devtools/python/python3-setuptools-scm_9.2.2.bb:do_compile
>     log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/p=
ython3-setuptools-scm-
> native/9.2.2/temp/log.do_compile.2100993
>   virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-c=
ore/meta/recipes-
> devtools/python/python3-mako_1.3.10.bb:do_compile
>     log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/p=
ython3-mako-
> native/1.3.10/temp/log.do_compile.2101162
>   virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-c=
ore/meta/recipes-
> devtools/python/python3-cython_3.2.4.bb:do_compile
>     log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/p=
ython3-cython-
> native/3.2.4/temp/log.do_compile.2101018
> Summary: There were 16 WARNING messages.
> Summary: There were 7 ERROR messages, returning a non-zero exit code.
>
> If I revert commit ab6b2bf7b555d3516abea6255b800fe6f9673a69 all builds fi=
ne again.
>
> Any ideas?
>
> Thanks!
>
> Cheers
>
> Marcel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233031): https://lists.openembedded.org/g/openembedde=
d-core/message/233031
> Mute This Topic: https://lists.openembedded.org/mt/118127779/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

