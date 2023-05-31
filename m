Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC2DC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 14:43:24 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.16280.1685544200922378729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 07:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DUC4yi0n;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7747f76946bso25505539f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685544200; x=1688136200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usVlYpTcCzpH4sFzmV/MX8Ifh9oDiKZoKnFVnoXzBqw=;
        b=DUC4yi0ne+fRYdjB9DhaCQyA4aQBqbzV5rc/PKqdGfqaSfsYKB/zC247H7QME4AT+r
         98zJD7XqLtuo99llJykLTTY2yp3CgxlBIB1A3+YP1+1rMiQR1C7AoLOBZBhv7ui4BG4H
         2KPjbic8Lkp/Q2BTKYwZZ2SZg+euJQEQGedCQ3qYGAqqp0coiWX0V3cEUHwFpWMUmb32
         y9wNWpumNOlQZhBd+XY4sMwuJb8dtRNKmUTd6MIws9esCsDxbHCvH94El/V10oib+3QX
         kPKH7gRjkRYMk4NZ6J944SejArVpz2VoL9T0/fgCgAqdxw97NBiJ14kt50rnzDCd1SyS
         OoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685544200; x=1688136200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usVlYpTcCzpH4sFzmV/MX8Ifh9oDiKZoKnFVnoXzBqw=;
        b=SIF5CLmmbVu0GRCs9CXys+MfDfMtTZ4KY/bBjD41A4TeaxwhpqWDABHLSfqfKzT+v5
         wXIw/xpU+PWjEvYbde08vPZ1Ep5eXnlVU7IhAWJmMcDvctcQCb1mSy9a632JuU+VbY3B
         pHcMQ1hKJaGn8SDRaX+Pt3W2nwXBaqRGVEMSrV//DYUiWQ2Ei/m929Lj9pwFeOmWmSnJ
         Iow/dFB/LzXIGZVUqQ7LahcW/uj3DWugmFSjcbiyZ1q+DnuNK2XqF/dg95cCrRzdwkQD
         8WsIAxPwvWKlSVpDQEPUXa1//na8fssZGu6sk3arzSz4KkkDt1BXjacGH5weej5YYanK
         r5tw==
X-Gm-Message-State: AC+VfDw/ZgV5qOnYtLTpUywcfo3vn/KcinjAaFH6PVtVgqjBTF4pKAgp
	88Vz+y4yOpriHSUuU7UNYSwpavhRBIRKNPw49tc=
X-Google-Smtp-Source: ACHHUZ7j8Aro0WfwhQlGO0mLiBpP7vhFdzuv7NKsedpyXKh5hc39uI0Qu+nvUFpPk7sgDbbf26KtVuwa20Mx8qCu/nY=
X-Received: by 2002:a05:6e02:3485:b0:333:49f9:a5f3 with SMTP id
 bp5-20020a056e02348500b0033349f9a5f3mr2399481ilb.2.1685544200102; Wed, 31 May
 2023 07:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
 <CADkTA4OQJLMSqBzR3nKVX0o6YV=qa9ZPaJioU63W6B6wh6=wWA@mail.gmail.com>
 <6d3608b9-6f76-9a6a-6857-bd055b9eeb73@baylibre.com> <CADkTA4P4a-9sW6a64HhbFO3e+KmCn2gACYXkrrXRrV6mzT11ug@mail.gmail.com>
 <CANx9H-Cmf_LwwSkQJvxnmPnbuK=OiMANUCxS868JrzvAyq1C_w@mail.gmail.com>
In-Reply-To: <CANx9H-Cmf_LwwSkQJvxnmPnbuK=OiMANUCxS868JrzvAyq1C_w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 May 2023 10:43:13 -0400
Message-ID: <CADkTA4POEW48bNv5KAcMev18Ji-izWDMAwRARF5b7-Ai-ssjDQ@mail.gmail.com>
Subject: Re: [OE-core] python3 cryptic build failures
To: Tim Orling <ticotimo@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tim Orling <tim.orling@konsulko.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 14:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182016

On Wed, May 31, 2023 at 10:41=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wr=
ote:
>
>
>
> On Wed, May 31, 2023 at 7:25 AM Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>>
>> On Wed, May 31, 2023 at 10:20=E2=80=AFAM Trevor Gamblin <tgamblin@baylib=
re.com> wrote:
>> >
>> >
>> > On 2023-05-31 10:04, Bruce Ashfield wrote:
>> > > On Wed, May 31, 2023 at 9:23=E2=80=AFAM Richard Purdie
>> > > <richard.purdie@linuxfoundation.org> wrote:
>> > >> Hi Trevor,
>> > >>
>> > >> I thought this issue might be something you might be able to spot t=
he
>> > >> solution with quickly.
>> > >>
>> > >> I had a failing python3-iniconfig build in a TMPDIR I've reused
>> > >> heavily:
>> > > FWIW. I see this in about 6 or 7 python recipes in my extremely
>> > > heavily reused tmpdir.
>> > >
>> > > After I came back from vacation, I iterated through a -c clean on th=
e
>> > > python packages, and they always built the second time through.
>> >
>> > Do you recall which those are, and if it's the same ones each time it
>> > happens? I'm wondering if it may be an issue with some recipes.
>> >
>>
>> roughly this set (as grepped from my history):
>>
>>  2783  bitbake -c clean python3-attrs; bitbake core-image-minimal
>>  2828  bitbake -c clean python3-colorama; bitbake core-image-minimal
>>  2829  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
>>  2943  bitbake -c clean python3-hatch-vcs python3-hatch-vcs-native;
>> bitbake core-image-minimal
>>  2944  bitbake -c clean python3-attrs; bitbake core-image-minimal
>>  2945  bitbake -c clean python3-urllib3; bitbake core-image-minimal
>>  2946  bitbake -c clean python3-colorama; bitbake core-image-minimal
>>  2947  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
>>  2948  bitbake -c clean python3-iniconfig; bitbake core-image-minimal
>>
>> Apparently I had particular issues with colorama :)
>>
>> Bruce
>>
>
> Do you recall when you started seeing this behavior? I=E2=80=99m wonderin=
g if it is related to some of the wheel build changes rburton made. But tha=
t=E2=80=99s just my spider sense=E2=80=A6

As we can all attest, timelines get blurry very quickly ... but I
recall it popping up with the same / similar error message starting in
the last 6 months.

Bruce

>>
>>
>> > I haven't been able to recreate the issue yet, but my tmpdir is not ve=
ry
>> > old. When I attempt the suggested reproducer (creating the empty
>> > directories and rerunning do_compile), it is successful. I'll keep
>> > poking at it.
>> >
>> > Trevor
>> >
>> > >
>> > > Bruce
>> > >
>> > >> ERROR: python3-iniconfig-2.0.0-r0 do_compile: ExecutionError('/medi=
a/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/=
temp/run.do_compile.2391637', 1, None, None)
>> > >> ERROR: Logfile of failure stored in: /media/build/poky/build/tmp/wo=
rk/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.do_compile.23916=
37
>> > >> Log data follows:
>> > >> | DEBUG: Executing shell function do_compile
>> > >> | * Getting build dependencies for wheel...
>> > >> |
>> > >> | Traceback (most recent call last):
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/build/__main__.py", line 375, in main
>> > >> |     built =3D build_call(
>> > >> |             ^^^^^^^^^^^
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/build/__main__.py", line 208, in build_package
>> > >> |     out =3D _build(isolation, builder, outdir, distribution, conf=
ig_settings, skip_dependency_check)
>> > >> |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/build/__main__.py", line 147, in _build
>> > >> |     return _build_in_current_env(builder, outdir, distribution, c=
onfig_settings, skip_dependency_check)
>> > >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/build/__main__.py", line 127, in _build_in_current_env
>> > >> |     missing =3D builder.check_dependencies(distribution)
>> > >> |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/build/__init__.py", line 369, in check_dependencies
>> > >> |     return {u for d in dependencies for u in check_dependency(d)}
>> > >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/build/__init__.py", line 369, in <setcomp>
>> > >> |     return {u for d in dependencies for u in check_dependency(d)}
>> > >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/build/__init__.py", line 185, in check_dependency
>> > >> |     yield from check_dependency(other_req_string, ancestral_req_s=
trings + (normalised_req_string,), req.extras)
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/build/__init__.py", line 179, in check_dependency
>> > >> |     if req.specifier and not req.specifier.contains(dist.version,=
 prereleases=3DTrue):
>> > >> |                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/packaging/specifiers.py", line 905, in contains
>> > >> |     item =3D Version(item)
>> > >> |            ^^^^^^^^^^^^^
>> > >> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packag=
es/packaging/version.py", line 196, in __init__
>> > >> |     match =3D self._regex.search(version)
>> > >> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> > >> | TypeError: expected string or bytes-like object, got 'NoneType'
>> > >> |
>> > >> | ERROR expected string or bytes-like object, got 'NoneType'
>> > >> | WARNING: exit code 1 from a shell command.
>> > >> ERROR: Task (/media/build/poky/meta/recipes-devtools/python/python3=
-iniconfig_2.0.0.bb:do_compile) failed with exit code '1'
>> > >>
>> > >> I wondered why and I isolated it down to this:
>> > >>
>> > >> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/py=
thon3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-pack=
ages$ find -type d -empty
>> > >> ./hatchling-1.13.0.dist-info/licenses
>> > >> ./pathspec-0.11.0.dist-info
>> > >> ./importlib_metadata-6.0.0.dist-info
>> > >> ./setuptools-67.4.0.dist-info
>> > >> ./wheel-0.38.4.dist-info
>> > >> ./installer-0.6.0.dist-info
>> > >> ./setuptools-67.6.0.dist-info
>> > >> ./packaging-23.0.dist-info
>> > >> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/py=
thon3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-pack=
ages$ find -type d -empty -delete
>> > >>
>> > >> After which the compile succeeds. These empty dist-info directories
>> > >> really upset the build. They're left behind by the sstate cleanup c=
ode
>> > >> from when I have older versions of these python modules in play sin=
ce
>> > >> the sstate code can race over directory removal. Is there a way to =
make
>> > >> python ignore them? Otherwise should we remove them somewhere?
>> > >>
>> > >> I suspect you can recreate by adding these empty directories and
>> > >> running a -c compile -f. I've seen it with plenty of other python
>> > >> modules too.
>> > >>
>> > >> Cheers,
>> > >>
>> > >> Richard
>> > >>
>> > >>
>> > >>
>> > >>
>> > >>
>> > >
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182013): https://lists.openembedded.org/g/openembedd=
ed-core/message/182013
>> Mute This Topic: https://lists.openembedded.org/mt/99241972/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [t=
icotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

