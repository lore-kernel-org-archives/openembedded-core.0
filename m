Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5910DC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 14:41:14 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.16219.1685544070375781076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 07:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HxoV4t2C;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-56896c77434so28703597b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685544069; x=1688136069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lx2QW1YpgemMIwiD20Ac0/rnaovI0H/TUKT52fiYzT8=;
        b=HxoV4t2C65N8oqz+nc18GkOYTKfsMuVPAuwyyyNyPYEYDX+EVL/dos9wqfWdjIVxVk
         vegx4M6jbNDMI61xx8EUpOa4g6p4ArKyMm9ImHQhvxFuKKIiECRIUMf9ba/+KKtgL0jT
         rlU0LMFdmfT5g202PQtwIh5CqGkQqXELiF4nyi1cAm/51mZRzDRZMzNe931TBPZ1ZspS
         sbaPbmBOvChuaSCVv5OoDusrt5CX2zdXDdLKc7Ute8XJypQQs3l1agpuaBOi8zSDPcKF
         0Q/o3zWX2lCbJBiOi5gvs0RVQ+vySeCdn6T24ITDsLvogQN22RV1I2NKjfw+mTBV0RzF
         Psmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685544069; x=1688136069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx2QW1YpgemMIwiD20Ac0/rnaovI0H/TUKT52fiYzT8=;
        b=C8NOxE3iL9uWGRoBZTEFEIBprkiEgejI08j5VVvYvQbEgiXB92GQDDAbhzGVOtffqo
         OBhfcQglP3WUo+blOOmLD5ItLgMo+lDC+7VCqa/hGinzvo4qIXyIUMsDxnrjiTcyUBqG
         LkfMmxRiPCIlq9SXZVAE3o755WC4G4Hy64OONdwDsVlCw6Zbzbv8FuzZxiAct1f25lL7
         zSrcsSGIgVgJQIXILjNJj9t6qcr0XK1P4KZIj6PiY3k0hX692XUB6AHNUX7lJf65xkWf
         YEmJUttfo0WL3dGhn0YAN6lSziz3EKUy2EgOSw+6kQ/Vgry5OoeFaSpM39JBDvBxfZ1F
         12FA==
X-Gm-Message-State: AC+VfDx/P843vbSytqaLdY0G6UHB3kgn+H3+8z9fyveznWk361jGT3RG
	44eCIIASvPEO61doPXinaoSl7SMfXhnaADV9Csc=
X-Google-Smtp-Source: ACHHUZ7VGFKVWwNlyoU4GO3wMX6P1kin6rwrWhHOE1m42yndJInVCwOMyrSa+xVUxrhw9CO6KJqF+Q4xFJ0FetA4yAM=
X-Received: by 2002:a81:4f0e:0:b0:568:8b24:fd5f with SMTP id
 d14-20020a814f0e000000b005688b24fd5fmr6637090ywb.7.1685544068919; Wed, 31 May
 2023 07:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
 <CADkTA4OQJLMSqBzR3nKVX0o6YV=qa9ZPaJioU63W6B6wh6=wWA@mail.gmail.com>
 <6d3608b9-6f76-9a6a-6857-bd055b9eeb73@baylibre.com> <CADkTA4P4a-9sW6a64HhbFO3e+KmCn2gACYXkrrXRrV6mzT11ug@mail.gmail.com>
In-Reply-To: <CADkTA4P4a-9sW6a64HhbFO3e+KmCn2gACYXkrrXRrV6mzT11ug@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 31 May 2023 07:40:57 -0700
Message-ID: <CANx9H-Cmf_LwwSkQJvxnmPnbuK=OiMANUCxS868JrzvAyq1C_w@mail.gmail.com>
Subject: Re: [OE-core] python3 cryptic build failures
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tim Orling <tim.orling@konsulko.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007b356d05fcfe4f66"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 14:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182015

--0000000000007b356d05fcfe4f66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 7:25 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Wed, May 31, 2023 at 10:20=E2=80=AFAM Trevor Gamblin <tgamblin@baylibr=
e.com>
> wrote:
> >
> >
> > On 2023-05-31 10:04, Bruce Ashfield wrote:
> > > On Wed, May 31, 2023 at 9:23=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > >> Hi Trevor,
> > >>
> > >> I thought this issue might be something you might be able to spot th=
e
> > >> solution with quickly.
> > >>
> > >> I had a failing python3-iniconfig build in a TMPDIR I've reused
> > >> heavily:
> > > FWIW. I see this in about 6 or 7 python recipes in my extremely
> > > heavily reused tmpdir.
> > >
> > > After I came back from vacation, I iterated through a -c clean on the
> > > python packages, and they always built the second time through.
> >
> > Do you recall which those are, and if it's the same ones each time it
> > happens? I'm wondering if it may be an issue with some recipes.
> >
>
> roughly this set (as grepped from my history):
>
>  2783  bitbake -c clean python3-attrs; bitbake core-image-minimal
>  2828  bitbake -c clean python3-colorama; bitbake core-image-minimal
>  2829  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
>  2943  bitbake -c clean python3-hatch-vcs python3-hatch-vcs-native;
> bitbake core-image-minimal
>  2944  bitbake -c clean python3-attrs; bitbake core-image-minimal
>  2945  bitbake -c clean python3-urllib3; bitbake core-image-minimal
>  2946  bitbake -c clean python3-colorama; bitbake core-image-minimal
>  2947  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
>  2948  bitbake -c clean python3-iniconfig; bitbake core-image-minimal
>
> Apparently I had particular issues with colorama :)
>
> Bruce
>
>
Do you recall when you started seeing this behavior? I=E2=80=99m wondering =
if it is
related to some of the wheel build changes rburton made. But that=E2=80=99s=
 just my
spider sense=E2=80=A6

>
> > I haven't been able to recreate the issue yet, but my tmpdir is not ver=
y
> > old. When I attempt the suggested reproducer (creating the empty
> > directories and rerunning do_compile), it is successful. I'll keep
> > poking at it.
> >
> > Trevor
> >
> > >
> > > Bruce
> > >
> > >> ERROR: python3-iniconfig-2.0.0-r0 do_compile:
> ExecutionError('/media/build/poky/build/tmp/work/core2-64-poky-linux/pyth=
on3-iniconfig/2.0.0-r0/temp/run.do_compile.2391637',
> 1, None, None)
> > >> ERROR: Logfile of failure stored in:
> /media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.=
0.0-r0/temp/log.do_compile.2391637
> > >> Log data follows:
> > >> | DEBUG: Executing shell function do_compile
> > >> | * Getting build dependencies for wheel...
> > >> |
> > >> | Traceback (most recent call last):
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main=
__.py",
> line 375, in main
> > >> |     built =3D build_call(
> > >> |             ^^^^^^^^^^^
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main=
__.py",
> line 208, in build_package
> > >> |     out =3D _build(isolation, builder, outdir, distribution,
> config_settings, skip_dependency_check)
> > >> |
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main=
__.py",
> line 147, in _build
> > >> |     return _build_in_current_env(builder, outdir, distribution,
> config_settings, skip_dependency_check)
> > >> |
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main=
__.py",
> line 127, in _build_in_current_env
> > >> |     missing =3D builder.check_dependencies(distribution)
> > >> |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init=
__.py",
> line 369, in check_dependencies
> > >> |     return {u for d in dependencies for u in check_dependency(d)}
> > >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init=
__.py",
> line 369, in <setcomp>
> > >> |     return {u for d in dependencies for u in check_dependency(d)}
> > >> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init=
__.py",
> line 185, in check_dependency
> > >> |     yield from check_dependency(other_req_string,
> ancestral_req_strings + (normalised_req_string,), req.extras)
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init=
__.py",
> line 179, in check_dependency
> > >> |     if req.specifier and not req.specifier.contains(dist.version,
> prereleases=3DTrue):
> > >> |
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/sp=
ecifiers.py",
> line 905, in contains
> > >> |     item =3D Version(item)
> > >> |            ^^^^^^^^^^^^^
> > >> |   File
> "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2=
.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/ve=
rsion.py",
> line 196, in __init__
> > >> |     match =3D self._regex.search(version)
> > >> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >> | TypeError: expected string or bytes-like object, got 'NoneType'
> > >> |
> > >> | ERROR expected string or bytes-like object, got 'NoneType'
> > >> | WARNING: exit code 1 from a shell command.
> > >> ERROR: Task
> (/media/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.b=
b:do_compile)
> failed with exit code '1'
> > >>
> > >> I wondered why and I isolated it down to this:
> > >>
> > >> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/pyt=
hon3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packa=
ges$
> find -type d -empty
> > >> ./hatchling-1.13.0.dist-info/licenses
> > >> ./pathspec-0.11.0.dist-info
> > >> ./importlib_metadata-6.0.0.dist-info
> > >> ./setuptools-67.4.0.dist-info
> > >> ./wheel-0.38.4.dist-info
> > >> ./installer-0.6.0.dist-info
> > >> ./setuptools-67.6.0.dist-info
> > >> ./packaging-23.0.dist-info
> > >> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/pyt=
hon3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packa=
ges$
> find -type d -empty -delete
> > >>
> > >> After which the compile succeeds. These empty dist-info directories
> > >> really upset the build. They're left behind by the sstate cleanup co=
de
> > >> from when I have older versions of these python modules in play sinc=
e
> > >> the sstate code can race over directory removal. Is there a way to
> make
> > >> python ignore them? Otherwise should we remove them somewhere?
> > >>
> > >> I suspect you can recreate by adding these empty directories and
> > >> running a -c compile -f. I've seen it with plenty of other python
> > >> modules too.
> > >>
> > >> Cheers,
> > >>
> > >> Richard
> > >>
> > >>
> > >>
> > >>
> > >>
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182013):
> https://lists.openembedded.org/g/openembedded-core/message/182013
> Mute This Topic: https://lists.openembedded.org/mt/99241972/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007b356d05fcfe4f66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 31, 2023 at 7:25 AM Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, May 31, 2023 at 10:20=E2=
=80=AFAM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" target=
=3D"_blank">tgamblin@baylibre.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 2023-05-31 10:04, Bruce Ashfield wrote:<br>
&gt; &gt; On Wed, May 31, 2023 at 9:23=E2=80=AFAM Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;&gt; Hi Trevor,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I thought this issue might be something you might be able to =
spot the<br>
&gt; &gt;&gt; solution with quickly.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I had a failing python3-iniconfig build in a TMPDIR I&#39;ve =
reused<br>
&gt; &gt;&gt; heavily:<br>
&gt; &gt; FWIW. I see this in about 6 or 7 python recipes in my extremely<b=
r>
&gt; &gt; heavily reused tmpdir.<br>
&gt; &gt;<br>
&gt; &gt; After I came back from vacation, I iterated through a -c clean on=
 the<br>
&gt; &gt; python packages, and they always built the second time through.<b=
r>
&gt;<br>
&gt; Do you recall which those are, and if it&#39;s the same ones each time=
 it<br>
&gt; happens? I&#39;m wondering if it may be an issue with some recipes.<br=
>
&gt;<br>
<br>
roughly this set (as grepped from my history):<br>
<br>
=C2=A02783=C2=A0 bitbake -c clean python3-attrs; bitbake core-image-minimal=
<br>
=C2=A02828=C2=A0 bitbake -c clean python3-colorama; bitbake core-image-mini=
mal<br>
=C2=A02829=C2=A0 bitbake -c clean python3-jsonschema; bitbake core-image-mi=
nimal<br>
=C2=A02943=C2=A0 bitbake -c clean python3-hatch-vcs python3-hatch-vcs-nativ=
e;<br>
bitbake core-image-minimal<br>
=C2=A02944=C2=A0 bitbake -c clean python3-attrs; bitbake core-image-minimal=
<br>
=C2=A02945=C2=A0 bitbake -c clean python3-urllib3; bitbake core-image-minim=
al<br>
=C2=A02946=C2=A0 bitbake -c clean python3-colorama; bitbake core-image-mini=
mal<br>
=C2=A02947=C2=A0 bitbake -c clean python3-jsonschema; bitbake core-image-mi=
nimal<br>
=C2=A02948=C2=A0 bitbake -c clean python3-iniconfig; bitbake core-image-min=
imal<br>
<br>
Apparently I had particular issues with colorama :)<br>
<br>
Bruce<br>
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Do you recall wh=
en you started seeing this behavior? I=E2=80=99m wondering if it is related=
 to some of the wheel build changes rburton made. But that=E2=80=99s just m=
y spider sense=E2=80=A6</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; I haven&#39;t been able to recreate the issue yet, but my tmpdir is no=
t very<br>
&gt; old. When I attempt the suggested reproducer (creating the empty<br>
&gt; directories and rerunning do_compile), it is successful. I&#39;ll keep=
<br>
&gt; poking at it.<br>
&gt;<br>
&gt; Trevor<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Bruce<br>
&gt; &gt;<br>
&gt; &gt;&gt; ERROR: python3-iniconfig-2.0.0-r0 do_compile: ExecutionError(=
&#39;/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig=
/2.0.0-r0/temp/run.do_compile.2391637&#39;, 1, None, None)<br>
&gt; &gt;&gt; ERROR: Logfile of failure stored in: /media/build/poky/build/=
tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.do_compile=
.2391637<br>
&gt; &gt;&gt; Log data follows:<br>
&gt; &gt;&gt; | DEBUG: Executing shell function do_compile<br>
&gt; &gt;&gt; | * Getting build dependencies for wheel...<br>
&gt; &gt;&gt; |<br>
&gt; &gt;&gt; | Traceback (most recent call last):<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/build/__main__.py&quot;, line 375, in main<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0built =3D build_call(<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^<=
br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/build/__main__.py&quot;, line 208, in build_package=
<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0out =3D _build(isolation, builder, outdi=
r, distribution, config_settings, skip_dependency_check)<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/build/__main__.py&quot;, line 147, in _build<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0return _build_in_current_env(builder, ou=
tdir, distribution, config_settings, skip_dependency_check)<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<=
br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/build/__main__.py&quot;, line 127, in _build_in_cur=
rent_env<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0missing =3D builder.check_dependencies(d=
istribution)<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/build/__init__.py&quot;, line 369, in check_depende=
ncies<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0return {u for d in dependencies for u in=
 check_dependency(d)}<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/build/__init__.py&quot;, line 369, in &lt;setcomp&g=
t;<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0return {u for d in dependencies for u in=
 check_dependency(d)}<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/build/__init__.py&quot;, line 185, in check_depende=
ncy<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0yield from check_dependency(other_req_st=
ring, ancestral_req_strings + (normalised_req_string,), req.extras)<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/build/__init__.py&quot;, line 179, in check_depende=
ncy<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0if req.specifier and not req.specifier.c=
ontains(dist.version, prereleases=3DTrue):<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/packaging/specifiers.py&quot;, line 905, in contain=
s<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0item =3D Version(item)<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0File &quot;/media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.11/site-packages/packaging/version.py&quot;, line 196, in __init__<b=
r>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0match =3D self._regex.search(version)<br=
>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^=
^^^^^^^^^^^^^^^<br>
&gt; &gt;&gt; | TypeError: expected string or bytes-like object, got &#39;N=
oneType&#39;<br>
&gt; &gt;&gt; |<br>
&gt; &gt;&gt; | ERROR expected string or bytes-like object, got &#39;NoneTy=
pe&#39;<br>
&gt; &gt;&gt; | WARNING: exit code 1 from a shell command.<br>
&gt; &gt;&gt; ERROR: Task (/media/build/poky/meta/recipes-devtools/python/p=
ython3-iniconfig_2.0.0.bb:do_compile) failed with exit code &#39;1&#39;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I wondered why and I isolated it down to this:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-li=
nux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/sit=
e-packages$ find -type d -empty<br>
&gt; &gt;&gt; ./hatchling-1.13.0.dist-info/licenses<br>
&gt; &gt;&gt; ./pathspec-0.11.0.dist-info<br>
&gt; &gt;&gt; ./importlib_metadata-6.0.0.dist-info<br>
&gt; &gt;&gt; ./setuptools-67.4.0.dist-info<br>
&gt; &gt;&gt; ./wheel-0.38.4.dist-info<br>
&gt; &gt;&gt; ./installer-0.6.0.dist-info<br>
&gt; &gt;&gt; ./setuptools-67.6.0.dist-info<br>
&gt; &gt;&gt; ./packaging-23.0.dist-info<br>
&gt; &gt;&gt; richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-li=
nux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/sit=
e-packages$ find -type d -empty -delete<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; After which the compile succeeds. These empty dist-info direc=
tories<br>
&gt; &gt;&gt; really upset the build. They&#39;re left behind by the sstate=
 cleanup code<br>
&gt; &gt;&gt; from when I have older versions of these python modules in pl=
ay since<br>
&gt; &gt;&gt; the sstate code can race over directory removal. Is there a w=
ay to make<br>
&gt; &gt;&gt; python ignore them? Otherwise should we remove them somewhere=
?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I suspect you can recreate by adding these empty directories =
and<br>
&gt; &gt;&gt; running a -c compile -f. I&#39;ve seen it with plenty of othe=
r python<br>
&gt; &gt;&gt; modules too.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Cheers,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Richard<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182013): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182013" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182013</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99241972/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
99241972/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007b356d05fcfe4f66--

