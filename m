Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67071C7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 15:14:14 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.17104.1685546047169183363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 08:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SMh0YdLo;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2afb2874e83so64713071fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685546045; x=1688138045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ecnvV/gi1o9hLS17cpAFcg1NqGsTyeIUTKUh6HLI1WY=;
        b=SMh0YdLoxSyjpBGHkM7yGEB/BfEtt1NF4ii2R2pCa8nKCu8lDsnIpDTPz/oaWDdba+
         E9Vq2DvCTa6Viz3ibV8wES59rMalwphanc/G1Up34nPb/ClE0d8kx7jbiIABcBptavb/
         aTRh19fb9n9rBG2ZKRMs3PBx6f9/iUwMWZY9efRHhA9mFJ1l1CVxA22cxWNlfQX/lAsB
         E42b8aPbpoMbTDZtNUK2Y8MJSb7Jfbrx1u617jtWgUGl0/jMJBAIgNofu/x036YPBR/x
         Ef/EJwrxyn2/8cgIRFTr2BG3vqX48nGDt1SKQV+59jeYyBdfrV0uSQN89EIbScHy4IDP
         K8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685546045; x=1688138045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecnvV/gi1o9hLS17cpAFcg1NqGsTyeIUTKUh6HLI1WY=;
        b=LMgrUgxgqiDKCBZL/aNVtiBd1gwBf7GZGQmLq1eg/4wB3Rm3mDxZCy0gpVHyISFXKd
         wUNUaTdcB5E6TrAUDFeZtO7eh1dbpYEsNjRBJnEcil5QANcXM3cYZvtFE8M2sqZz6ciC
         LRzoAa2vtLYMBSqrbQRox32vH2LCaLmlCF5Gqm0z9EMqYVaURW/UJokAnFufrCjbhyXb
         cxThd8rsIpcz+RDnOQYJr33bmpipGi8fjWGowxe9Y5XoZeq+V3e3J6MyctlQuzOGqgnZ
         J5VD7eNpvMPBpb65Oj42etlQ8wrXwD78gGQcSQLtS9HKX0Uxr7xg2oFWaGpal1yN3Rly
         uxPA==
X-Gm-Message-State: AC+VfDwzz6xR7XjlJ1LS4e8BHxaqgr4vuCGgSsofxTmFBo9Ph47V4Q0i
	ISMJbGdZhCpLZqwBJ4FyiExxDyVYkKKxfamDces=
X-Google-Smtp-Source: ACHHUZ5xcsMScjSZXn4vht+UTsIqoeARegkaKrioG+p1xkbHRIXNw4aLg9CZyXfa9h1B/SFin+dbuhXNCC6jLyxKgH8=
X-Received: by 2002:a2e:8716:0:b0:2a8:b27f:b721 with SMTP id
 m22-20020a2e8716000000b002a8b27fb721mr2906421lji.29.1685546044931; Wed, 31
 May 2023 08:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
 <CADkTA4OQJLMSqBzR3nKVX0o6YV=qa9ZPaJioU63W6B6wh6=wWA@mail.gmail.com>
 <6d3608b9-6f76-9a6a-6857-bd055b9eeb73@baylibre.com> <CADkTA4P4a-9sW6a64HhbFO3e+KmCn2gACYXkrrXRrV6mzT11ug@mail.gmail.com>
 <CANx9H-Cmf_LwwSkQJvxnmPnbuK=OiMANUCxS868JrzvAyq1C_w@mail.gmail.com> <CADkTA4POEW48bNv5KAcMev18Ji-izWDMAwRARF5b7-Ai-ssjDQ@mail.gmail.com>
In-Reply-To: <CADkTA4POEW48bNv5KAcMev18Ji-izWDMAwRARF5b7-Ai-ssjDQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 May 2023 17:13:54 +0200
Message-ID: <CANNYZj96XQ7Sx4S+mqvMCQ0qobtfzja1Y5+_XTAwbsXrEeZS1g@mail.gmail.com>
Subject: Re: [OE-core] python3 cryptic build failures
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Tim Orling <ticotimo@gmail.com>, 
	Tim Orling <tim.orling@konsulko.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000042c0d005fcfec5f7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 15:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182017

--00000000000042c0d005fcfec5f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m regularly seeing this when updating various python recipes. It=
=E2=80=99s caused
by empty versioned directories in sysroots that are leftovers from previous
versions. Doesn=E2=80=99t happen in freshly made tmpdirs.

Alex

On Wed 31. May 2023 at 16.43, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Wed, May 31, 2023 at 10:41=E2=80=AFAM Tim Orling <ticotimo@gmail.com> =
wrote:
> >
> >
> >
> > On Wed, May 31, 2023 at 7:25 AM Bruce Ashfield <bruce.ashfield@gmail.co=
m>
> wrote:
> >>
> >> On Wed, May 31, 2023 at 10:20=E2=80=AFAM Trevor Gamblin <tgamblin@bayl=
ibre.com>
> wrote:
> >> >
> >> >
> >> > On 2023-05-31 10:04, Bruce Ashfield wrote:
> >> > > On Wed, May 31, 2023 at 9:23=E2=80=AFAM Richard Purdie
> >> > > <richard.purdie@linuxfoundation.org> wrote:
> >> > >> Hi Trevor,
> >> > >>
> >> > >> I thought this issue might be something you might be able to spot
> the
> >> > >> solution with quickly.
> >> > >>
> >> > >> I had a failing python3-iniconfig build in a TMPDIR I've reused
> >> > >> heavily:
> >> > > FWIW. I see this in about 6 or 7 python recipes in my extremely
> >> > > heavily reused tmpdir.
> >> > >
> >> > > After I came back from vacation, I iterated through a -c clean on
> the
> >> > > python packages, and they always built the second time through.
> >> >
> >> > Do you recall which those are, and if it's the same ones each time i=
t
> >> > happens? I'm wondering if it may be an issue with some recipes.
> >> >
> >>
> >> roughly this set (as grepped from my history):
> >>
> >>  2783  bitbake -c clean python3-attrs; bitbake core-image-minimal
> >>  2828  bitbake -c clean python3-colorama; bitbake core-image-minimal
> >>  2829  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
> >>  2943  bitbake -c clean python3-hatch-vcs python3-hatch-vcs-native;
> >> bitbake core-image-minimal
> >>  2944  bitbake -c clean python3-attrs; bitbake core-image-minimal
> >>  2945  bitbake -c clean python3-urllib3; bitbake core-image-minimal
> >>  2946  bitbake -c clean python3-colorama; bitbake core-image-minimal
> >>  2947  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
> >>  2948  bitbake -c clean python3-iniconfig; bitbake core-image-minimal
> >>
> >> Apparently I had particular issues with colorama :)
> >>
> >> Bruce
> >>
> >
> > Do you recall when you started seeing this behavior? I=E2=80=99m wonder=
ing if it
> is related to some of the wheel build changes rburton made. But that=E2=
=80=99s just
> my spider sense=E2=80=A6
>
> As we can all attest, timelines get blurry very quickly ... but I
> recall it popping up with the same / similar error message starting in
> the last 6 months.
>
> Bruce
>
> >>
> >>
> >> > I haven't been able to recreate the issue yet, but my tmpdir is not
> very
> >> > old. When I attempt the suggested reproducer (creating the empty
> >> > directories and rerunning do_compile), it is successful. I'll keep
> >> > poking at it.
> >> >
> >> > Trevor
> >> >
> >> > >
> >> > > Bruce
> >> > >
> >> > >> ERROR: python3-iniconfig-2.0.0-r0 do_compile:
> ExecutionError('/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/temp/run.do_compile.2391637',
> 1, None, None)
> >> > >> ERROR: Logfile of failure stored in:
> /media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.=
0.0-r0/temp/log.do_compile.2391637
> >> > >> Log data follows:
> >> > >> | DEBUG: Executing shell function do_compile
> >> > >> | * Getting build dependencies for wheel...
> >> > >> |
> >> > >> | Traceback (most recent call last):
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main=
__.py",
> line 375, in main
> >> > >> |     built =3D build_call(
> >> > >> |             ^^^^^^^^^^^
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main=
__.py",
> line 208, in build_package
> >> > >> |     out =3D _build(isolation, builder, outdir, distribution,
> config_settings, skip_dependency_check)
> >> > >> |
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main=
__.py",
> line 147, in _build
> >> > >> |     return _build_in_current_env(builder, outdir, distribution,
> config_settings, skip_dependency_check)
> >> > >> |
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main=
__.py",
> line 127, in _build_in_current_env
> >> > >> |     missing =3D builder.check_dependencies(distribution)
> >> > >> |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init=
__.py",
> line 369, in check_dependencies
> >> > >> |     return {u for d in dependencies for u in check_dependency(d=
)}
> >> > >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init=
__.py",
> line 369, in <setcomp>
> >> > >> |     return {u for d in dependencies for u in check_dependency(d=
)}
> >> > >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init=
__.py",
> line 185, in check_dependency
> >> > >> |     yield from check_dependency(other_req_string,
> ancestral_req_strings + (normalised_req_string,), req.extras)
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init=
__.py",
> line 179, in check_dependency
> >> > >> |     if req.specifier and not
> req.specifier.contains(dist.version, prereleases=3DTrue):
> >> > >> |
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/sp=
ecifiers.py",
> line 905, in contains
> >> > >> |     item =3D Version(item)
> >> > >> |            ^^^^^^^^^^^^^
> >> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/ve=
rsion.py",
> line 196, in __init__
> >> > >> |     match =3D self._regex.search(version)
> >> > >> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> > >> | TypeError: expected string or bytes-like object, got 'NoneType'
> >> > >> |
> >> > >> | ERROR expected string or bytes-like object, got 'NoneType'
> >> > >> | WARNING: exit code 1 from a shell command.
> >> > >> ERROR: Task
> (/media/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.b=
b:do_compile)
> failed with exit code '1'
> >> > >>
> >> > >> I wondered why and I isolated it down to this:
> >> > >>
> >> > >> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/=
python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-pa=
ckages$
> find -type d -empty
> >> > >> ./hatchling-1.13.0.dist-info/licenses
> >> > >> ./pathspec-0.11.0.dist-info
> >> > >> ./importlib_metadata-6.0.0.dist-info
> >> > >> ./setuptools-67.4.0.dist-info
> >> > >> ./wheel-0.38.4.dist-info
> >> > >> ./installer-0.6.0.dist-info
> >> > >> ./setuptools-67.6.0.dist-info
> >> > >> ./packaging-23.0.dist-info
> >> > >> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/=
python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-pa=
ckages$
> find -type d -empty -delete
> >> > >>
> >> > >> After which the compile succeeds. These empty dist-info directori=
es
> >> > >> really upset the build. They're left behind by the sstate cleanup
> code
> >> > >> from when I have older versions of these python modules in play
> since
> >> > >> the sstate code can race over directory removal. Is there a way t=
o
> make
> >> > >> python ignore them? Otherwise should we remove them somewhere?
> >> > >>
> >> > >> I suspect you can recreate by adding these empty directories and
> >> > >> running a -c compile -f. I've seen it with plenty of other python
> >> > >> modules too.
> >> > >>
> >> > >> Cheers,
> >> > >>
> >> > >> Richard
> >> > >>
> >> > >>
> >> > >>
> >> > >>
> >> > >>
> >> > >
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182016):
> https://lists.openembedded.org/g/openembedded-core/message/182016
> Mute This Topic: https://lists.openembedded.org/mt/99241972/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000042c0d005fcfec5f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99m regularly seeing this when updating various p=
ython recipes. It=E2=80=99s caused by empty versioned directories in sysroo=
ts that are leftovers from previous versions. Doesn=E2=80=99t happen in fre=
shly made tmpdirs.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex<=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed 31. May 2023 at 16.43, Bruce Ashfield &lt;<a href=3D"mailto:bruc=
e.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">On Wed, May 31, 2023 at 10:41=E2=80=AFAM Tim Orling &lt;<a hre=
f=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, May 31, 2023 at 7:25 AM Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 31, 2023 at 10:20=E2=80=AFAM Trevor Gamblin &lt;<a hre=
f=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com<=
/a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 2023-05-31 10:04, Bruce Ashfield wrote:<br>
&gt;&gt; &gt; &gt; On Wed, May 31, 2023 at 9:23=E2=80=AFAM Richard Purdie<b=
r>
&gt;&gt; &gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt; Hi Trevor,<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I thought this issue might be something you might be=
 able to spot the<br>
&gt;&gt; &gt; &gt;&gt; solution with quickly.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I had a failing python3-iniconfig build in a TMPDIR =
I&#39;ve reused<br>
&gt;&gt; &gt; &gt;&gt; heavily:<br>
&gt;&gt; &gt; &gt; FWIW. I see this in about 6 or 7 python recipes in my ex=
tremely<br>
&gt;&gt; &gt; &gt; heavily reused tmpdir.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; After I came back from vacation, I iterated through a -c=
 clean on the<br>
&gt;&gt; &gt; &gt; python packages, and they always built the second time t=
hrough.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Do you recall which those are, and if it&#39;s the same ones =
each time it<br>
&gt;&gt; &gt; happens? I&#39;m wondering if it may be an issue with some re=
cipes.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; roughly this set (as grepped from my history):<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 2783=C2=A0 bitbake -c clean python3-attrs; bitbake core-imag=
e-minimal<br>
&gt;&gt;=C2=A0 2828=C2=A0 bitbake -c clean python3-colorama; bitbake core-i=
mage-minimal<br>
&gt;&gt;=C2=A0 2829=C2=A0 bitbake -c clean python3-jsonschema; bitbake core=
-image-minimal<br>
&gt;&gt;=C2=A0 2943=C2=A0 bitbake -c clean python3-hatch-vcs python3-hatch-=
vcs-native;<br>
&gt;&gt; bitbake core-image-minimal<br>
&gt;&gt;=C2=A0 2944=C2=A0 bitbake -c clean python3-attrs; bitbake core-imag=
e-minimal<br>
&gt;&gt;=C2=A0 2945=C2=A0 bitbake -c clean python3-urllib3; bitbake core-im=
age-minimal<br>
&gt;&gt;=C2=A0 2946=C2=A0 bitbake -c clean python3-colorama; bitbake core-i=
mage-minimal<br>
&gt;&gt;=C2=A0 2947=C2=A0 bitbake -c clean python3-jsonschema; bitbake core=
-image-minimal<br>
&gt;&gt;=C2=A0 2948=C2=A0 bitbake -c clean python3-iniconfig; bitbake core-=
image-minimal<br>
&gt;&gt;<br>
&gt;&gt; Apparently I had particular issues with colorama :)<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;<br>
&gt; Do you recall when you started seeing this behavior? I=E2=80=99m wonde=
ring if it is related to some of the wheel build changes rburton made. But =
that=E2=80=99s just my spider sense=E2=80=A6<br>
<br>
As we can all attest, timelines get blurry very quickly ... but I<br>
recall it popping up with the same / similar error message starting in<br>
the last 6 months.<br>
<br>
Bruce<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; I haven&#39;t been able to recreate the issue yet, but my tmp=
dir is not very<br>
&gt;&gt; &gt; old. When I attempt the suggested reproducer (creating the em=
pty<br>
&gt;&gt; &gt; directories and rerunning do_compile), it is successful. I&#3=
9;ll keep<br>
&gt;&gt; &gt; poking at it.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Trevor<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Bruce<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; ERROR: python3-iniconfig-2.0.0-r0 do_compile: Execut=
ionError(&#39;/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-=
iniconfig/2.0.0-r0/temp/run.do_compile.2391637&#39;, 1, None, None)<br>
&gt;&gt; &gt; &gt;&gt; ERROR: Logfile of failure stored in: /media/build/po=
ky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.d=
o_compile.2391637<br>
&gt;&gt; &gt; &gt;&gt; Log data follows:<br>
&gt;&gt; &gt; &gt;&gt; | DEBUG: Executing shell function do_compile<br>
&gt;&gt; &gt; &gt;&gt; | * Getting build dependencies for wheel...<br>
&gt;&gt; &gt; &gt;&gt; |<br>
&gt;&gt; &gt; &gt;&gt; | Traceback (most recent call last):<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/build/__main__.py&quot;, line 375, in main=
<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0built =3D build_call(<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^=
^^^^^^^^<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/build/__main__.py&quot;, line 208, in buil=
d_package<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0out =3D _build(isolation, build=
er, outdir, distribution, config_settings, skip_dependency_check)<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/build/__main__.py&quot;, line 147, in _bui=
ld<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0return _build_in_current_env(bu=
ilder, outdir, distribution, config_settings, skip_dependency_check)<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/build/__main__.py&quot;, line 127, in _bui=
ld_in_current_env<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0missing =3D builder.check_depen=
dencies(distribution)<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/build/__init__.py&quot;, line 369, in chec=
k_dependencies<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0return {u for d in dependencies=
 for u in check_dependency(d)}<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/build/__init__.py&quot;, line 369, in &lt;=
setcomp&gt;<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0return {u for d in dependencies=
 for u in check_dependency(d)}<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/build/__init__.py&quot;, line 185, in chec=
k_dependency<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0yield from check_dependency(oth=
er_req_string, ancestral_req_strings + (normalised_req_string,), req.extras=
)<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/build/__init__.py&quot;, line 179, in chec=
k_dependency<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0if req.specifier and not req.sp=
ecifier.contains(dist.version, prereleases=3DTrue):<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/packaging/specifiers.py&quot;, line 905, i=
n contains<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0item =3D Version(item)<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^=
^^^^<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp=
/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/=
usr/lib/python3.11/site-packages/packaging/version.py&quot;, line 196, in _=
_init__<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0match =3D self._regex.search(ve=
rsion)<br>
&gt;&gt; &gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^=
^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt;&gt; &gt; &gt;&gt; | TypeError: expected string or bytes-like object, g=
ot &#39;NoneType&#39;<br>
&gt;&gt; &gt; &gt;&gt; |<br>
&gt;&gt; &gt; &gt;&gt; | ERROR expected string or bytes-like object, got &#=
39;NoneType&#39;<br>
&gt;&gt; &gt; &gt;&gt; | WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt; &gt;&gt; ERROR: Task (/media/build/poky/meta/recipes-devtools=
/python/python3-iniconfig_2.0.0.bb:do_compile) failed with exit code &#39;1=
&#39;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I wondered why and I isolated it down to this:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; richard@jet:/media/build/poky/build/tmp/work/core2-6=
4-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/pytho=
n3.11/site-packages$ find -type d -empty<br>
&gt;&gt; &gt; &gt;&gt; ./hatchling-1.13.0.dist-info/licenses<br>
&gt;&gt; &gt; &gt;&gt; ./pathspec-0.11.0.dist-info<br>
&gt;&gt; &gt; &gt;&gt; ./importlib_metadata-6.0.0.dist-info<br>
&gt;&gt; &gt; &gt;&gt; ./setuptools-67.4.0.dist-info<br>
&gt;&gt; &gt; &gt;&gt; ./wheel-0.38.4.dist-info<br>
&gt;&gt; &gt; &gt;&gt; ./installer-0.6.0.dist-info<br>
&gt;&gt; &gt; &gt;&gt; ./setuptools-67.6.0.dist-info<br>
&gt;&gt; &gt; &gt;&gt; ./packaging-23.0.dist-info<br>
&gt;&gt; &gt; &gt;&gt; richard@jet:/media/build/poky/build/tmp/work/core2-6=
4-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/pytho=
n3.11/site-packages$ find -type d -empty -delete<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; After which the compile succeeds. These empty dist-i=
nfo directories<br>
&gt;&gt; &gt; &gt;&gt; really upset the build. They&#39;re left behind by t=
he sstate cleanup code<br>
&gt;&gt; &gt; &gt;&gt; from when I have older versions of these python modu=
les in play since<br>
&gt;&gt; &gt; &gt;&gt; the sstate code can race over directory removal. Is =
there a way to make<br>
&gt;&gt; &gt; &gt;&gt; python ignore them? Otherwise should we remove them =
somewhere?<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I suspect you can recreate by adding these empty dir=
ectories and<br>
&gt;&gt; &gt; &gt;&gt; running a -c compile -f. I&#39;ve seen it with plent=
y of other python<br>
&gt;&gt; &gt; &gt;&gt; modules too.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Cheers,<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Richard<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182016): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182016" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182016</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99241972/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99241972/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000042c0d005fcfec5f7--

