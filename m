Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5C7C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 14:25:54 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.15766.1685543144800928896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 07:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZSWQT8bC;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-33b921e4e8fso12052995ab.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685543144; x=1688135144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIiKj2rpo/181m0T7yz5JnVlKFtbNEf0H4ulffB1cuc=;
        b=ZSWQT8bCQT8RGizWnVZVZigQK3h6xWMKwieJ7kd/j+OGdpYfqX9JB6AQiVLoWfZIfk
         UeYDRHWWUj7EsNc15C/mlv2kxWOHn+/9IObolvK1Pi/S+O52A0PLLsf6l4KqfJVQqErx
         MhXlq3iHo0H80W8qSP4jUa+UoxssX/PPfKlZroouIaWJDJFesW9PF6Mg40HuXLSU2fZz
         vUGpRSh0frDk4stYKIZznMZuDeoUoGvBtitjhhPrr3LjbcsAbvL5UFTqXIsJd1tw/nh5
         NrKlZxaJVGdMibdK01j9N4T29PVnXLTpu69f3sk3OSfZdHt+8m3RoeG+vyCyMx6s3w54
         8H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543144; x=1688135144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIiKj2rpo/181m0T7yz5JnVlKFtbNEf0H4ulffB1cuc=;
        b=eufuC8nflTLGFPa+/Fa5HxayrzgsTe40tOL98rzp2w1sZL7RjiVZu25DMIVaa0Jh58
         nW9Vq1VXWTnlIrgh4VmowIY7OY4VtsmvR/XOHos3UjCaZT0zcp8kyu/5BnRj0X5Mm9Ws
         CA2gtdJIEw6538cPt+Zi0xsqlWq5BiGu4KuIsAgMNjUQ6q8cfYl5QyzCuz74knqn1iX2
         8e+NoxF7sRVe+OPS2ptgniXwVEATm0I7UYFDJoQFCyTkTOnSHoNVrein2GA2icy2eMax
         WZIJ2f4UAGCRzSsFhsXaLMmBZCuL3LhLl784xdTeGn8QunK2gvr2+M7apu1NdnQBEP3j
         AcHQ==
X-Gm-Message-State: AC+VfDwrzy77CRH65WeVyZbDOrWT8UUc2vhz0cRW85G7pq19A3DSv8Yr
	OowdoYIxXG/n1mOMsViGn6f1Q9+GhUhjn6RQdmU=
X-Google-Smtp-Source: ACHHUZ6r2OupVzoH75lsr/3LIPDHi4e9BDmNv9IATGtfLTK48TJfgqvmHgaPyEpgYhfetUxRxqMs3iPkZaK3JzW6nU0=
X-Received: by 2002:a05:6e02:803:b0:335:a9af:ee7b with SMTP id
 u3-20020a056e02080300b00335a9afee7bmr2293261ilm.20.1685543143849; Wed, 31 May
 2023 07:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
 <CADkTA4OQJLMSqBzR3nKVX0o6YV=qa9ZPaJioU63W6B6wh6=wWA@mail.gmail.com> <6d3608b9-6f76-9a6a-6857-bd055b9eeb73@baylibre.com>
In-Reply-To: <6d3608b9-6f76-9a6a-6857-bd055b9eeb73@baylibre.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 May 2023 10:25:32 -0400
Message-ID: <CADkTA4P4a-9sW6a64HhbFO3e+KmCn2gACYXkrrXRrV6mzT11ug@mail.gmail.com>
Subject: Re: [OE-core] python3 cryptic build failures
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tim Orling <tim.orling@konsulko.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 14:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182013

On Wed, May 31, 2023 at 10:20=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.=
com> wrote:
>
>
> On 2023-05-31 10:04, Bruce Ashfield wrote:
> > On Wed, May 31, 2023 at 9:23=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> Hi Trevor,
> >>
> >> I thought this issue might be something you might be able to spot the
> >> solution with quickly.
> >>
> >> I had a failing python3-iniconfig build in a TMPDIR I've reused
> >> heavily:
> > FWIW. I see this in about 6 or 7 python recipes in my extremely
> > heavily reused tmpdir.
> >
> > After I came back from vacation, I iterated through a -c clean on the
> > python packages, and they always built the second time through.
>
> Do you recall which those are, and if it's the same ones each time it
> happens? I'm wondering if it may be an issue with some recipes.
>

roughly this set (as grepped from my history):

 2783  bitbake -c clean python3-attrs; bitbake core-image-minimal
 2828  bitbake -c clean python3-colorama; bitbake core-image-minimal
 2829  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
 2943  bitbake -c clean python3-hatch-vcs python3-hatch-vcs-native;
bitbake core-image-minimal
 2944  bitbake -c clean python3-attrs; bitbake core-image-minimal
 2945  bitbake -c clean python3-urllib3; bitbake core-image-minimal
 2946  bitbake -c clean python3-colorama; bitbake core-image-minimal
 2947  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
 2948  bitbake -c clean python3-iniconfig; bitbake core-image-minimal

Apparently I had particular issues with colorama :)

Bruce


> I haven't been able to recreate the issue yet, but my tmpdir is not very
> old. When I attempt the suggested reproducer (creating the empty
> directories and rerunning do_compile), it is successful. I'll keep
> poking at it.
>
> Trevor
>
> >
> > Bruce
> >
> >> ERROR: python3-iniconfig-2.0.0-r0 do_compile: ExecutionError('/media/b=
uild/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/tem=
p/run.do_compile.2391637', 1, None, None)
> >> ERROR: Logfile of failure stored in: /media/build/poky/build/tmp/work/=
core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.do_compile.2391637
> >> Log data follows:
> >> | DEBUG: Executing shell function do_compile
> >> | * Getting build dependencies for wheel...
> >> |
> >> | Traceback (most recent call last):
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
build/__main__.py", line 375, in main
> >> |     built =3D build_call(
> >> |             ^^^^^^^^^^^
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
build/__main__.py", line 208, in build_package
> >> |     out =3D _build(isolation, builder, outdir, distribution, config_=
settings, skip_dependency_check)
> >> |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
build/__main__.py", line 147, in _build
> >> |     return _build_in_current_env(builder, outdir, distribution, conf=
ig_settings, skip_dependency_check)
> >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
build/__main__.py", line 127, in _build_in_current_env
> >> |     missing =3D builder.check_dependencies(distribution)
> >> |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
build/__init__.py", line 369, in check_dependencies
> >> |     return {u for d in dependencies for u in check_dependency(d)}
> >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
build/__init__.py", line 369, in <setcomp>
> >> |     return {u for d in dependencies for u in check_dependency(d)}
> >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
build/__init__.py", line 185, in check_dependency
> >> |     yield from check_dependency(other_req_string, ancestral_req_stri=
ngs + (normalised_req_string,), req.extras)
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
build/__init__.py", line 179, in check_dependency
> >> |     if req.specifier and not req.specifier.contains(dist.version, pr=
ereleases=3DTrue):
> >> |                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
packaging/specifiers.py", line 905, in contains
> >> |     item =3D Version(item)
> >> |            ^^^^^^^^^^^^^
> >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3=
-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/=
packaging/version.py", line 196, in __init__
> >> |     match =3D self._regex.search(version)
> >> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> | TypeError: expected string or bytes-like object, got 'NoneType'
> >> |
> >> | ERROR expected string or bytes-like object, got 'NoneType'
> >> | WARNING: exit code 1 from a shell command.
> >> ERROR: Task (/media/build/poky/meta/recipes-devtools/python/python3-in=
iconfig_2.0.0.bb:do_compile) failed with exit code '1'
> >>
> >> I wondered why and I isolated it down to this:
> >>
> >> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/pytho=
n3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-package=
s$ find -type d -empty
> >> ./hatchling-1.13.0.dist-info/licenses
> >> ./pathspec-0.11.0.dist-info
> >> ./importlib_metadata-6.0.0.dist-info
> >> ./setuptools-67.4.0.dist-info
> >> ./wheel-0.38.4.dist-info
> >> ./installer-0.6.0.dist-info
> >> ./setuptools-67.6.0.dist-info
> >> ./packaging-23.0.dist-info
> >> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/pytho=
n3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-package=
s$ find -type d -empty -delete
> >>
> >> After which the compile succeeds. These empty dist-info directories
> >> really upset the build. They're left behind by the sstate cleanup code
> >> from when I have older versions of these python modules in play since
> >> the sstate code can race over directory removal. Is there a way to mak=
e
> >> python ignore them? Otherwise should we remove them somewhere?
> >>
> >> I suspect you can recreate by adding these empty directories and
> >> running a -c compile -f. I've seen it with plenty of other python
> >> modules too.
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#182010): https://lists.openembedded.org/g/openembe=
dded-core/message/182010
> >> Mute This Topic: https://lists.openembedded.org/mt/99241972/1050810
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

