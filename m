Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F453C001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 15:00:47 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.86467.1691938846734366279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 08:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ChIi9wF7;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-40fcc91258fso21442661cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691938846; x=1692543646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YPXT1fy/K68q48X4OzIfI+ZD6Cj+XE7MWQvrefttr24=;
        b=ChIi9wF7xlpPvGyJn8DV16uarhIp+4s9Lg/lPmEX7VEgJRri6BGDZk9EOBxDtg65sR
         ct27u3m2bLT2NZuL+VQUv3rib6pV8j3/o8ilOSpkCESWnRr+6PL11Y0NHFzCJJaw2biK
         kJ15fOb3/8axqWww5BOulQXl0076NnRFcwXSm145aVrMZjycMqr0RLJxCfPGR3wpCnIm
         n+pWawoV85gzGATmmarjYX2E94Qi6kvvAbT+GIHMwfYTDXPX3oP5i2+n/11E+sXVyWqo
         W2z8l9BNG4ZKpj3bXAmXkuoq55lcSs+FqshMsnPsTUUf/C4GN6J5W/G0LDiZWAywoTKB
         AyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691938846; x=1692543646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPXT1fy/K68q48X4OzIfI+ZD6Cj+XE7MWQvrefttr24=;
        b=Yq9RQXJ6zZ9x+pXgKg6s2nwm6TClFO9sjSV+8Gr3SCxVqfCBJMfX4KH1wMAuZNtyOj
         ie36rjAJi15EU3mzb1spVyUDthAjtPF+bwHwu6h2Q5cov0cPSn4IN2Z0XXVgPXkfJyOK
         TljzZNSqBFzTIMrDoAMIbdcTcigEM+PNDAfybsbY6g1XEoQKABHOtfK3neGoz1+wMZej
         VWPIM8FF8Iw1q77UcNMDelHNhm/1Xxtvs8FRp9jg+D0VJ8Sxf98LKXcyC8m9Fm9IzQI7
         KZ391EVohR5e4WM6C34M09NF6bcLSgnR7GLpVZhNSUYcB148yK5M8Gz0ddmUtiruyLJR
         7zYw==
X-Gm-Message-State: AOJu0YyIW/vRnv2gvfFoKns7xKkJjYpADr7ZRjiRC8uoYhGt6RpAWsoV
	wtyfWp5a8Uu8xWTYtsGlj9m24W2L5XwcDm4MrAmUK17rvZs=
X-Google-Smtp-Source: AGHT+IGEPZyhG963tXNwGA9wCdJdTq7KS0nRdFGKQzBDn/lv9iwn79aaUiccCQFVoGv0oxHNrzKtAvIRfKa77eR540k=
X-Received: by 2002:a0c:a9cc:0:b0:636:39ed:4dd9 with SMTP id
 c12-20020a0ca9cc000000b0063639ed4dd9mr6913381qvb.23.1691938845622; Sun, 13
 Aug 2023 08:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
 <177AED879B83B027.8497@lists.openembedded.org> <177AF35A822C5F89.12117@lists.openembedded.org>
 <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
In-Reply-To: <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 13 Aug 2023 17:00:34 +0200
Message-ID: <CA+cAkeqexEemD1vcRoVOdha8e32Wfzr-9-5z-xU3enC_Y41QoQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e005ee0602cf3518"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 15:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185888

--000000000000e005ee0602cf3518
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Aug 2023 at 16:53, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2023-08-13 at 14:09 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Sun, 2023-08-13 at 12:22 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Sun, 2023-08-13 at 12:48 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrot=
e:
> > > >
> > > >
> > > > Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > > > > On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote:
> > > > > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > > > >
> > > > > > This is an RFC for introducing a new class and recipes that
> > > > > > help building C-ABI compatible header and library around
> > > > > > rust code.
> > > > > >
> > > > > > The third patch add examples and test to demonstrate
> > > > > > the usage and the good working of this use case.
> > > > > >
> > > > > > Test have been passed with the following in local.conf:
> > > > > >
> > > > > > CORE_IMAGE_EXTRA_INSTALL:append =3D " openssh-sshd openssh-scp
> > > > > > cargo rust rust-c-lib-example-bin"
> > > > > > IMAGE_CLASSES +=3D "testimage"
> > > > > > TEST_SUITES =3D "ping ssh rust"
> > > > > > # To use slirp option in testimage.bbclass
> > > > > > TEST_RUNQEMUPARAMS =3D "slirp"
> > > > > > TEST_SERVER_IP =3D "127.0.0.1"
> > > > > > QEMU_USE_SLIRP =3D "1"
> > > > >
> > > > > In testing it showed:
> > > > >
> > > > > stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe
> > > > > cargo-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes=
-
> > > > > devtools/rust/cargo-c_0.9.18.bb does not contain a SUMMARY. Pleas=
e
> > > > > add an entry. [missing-metadata]
> > > > > stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Issue:
> > > > > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
> > > > > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
> > > > > contain a SUMMARY. Please add an entry. [missing-metadata]
> > > > > stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA Issu=
e:
> > > > > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
> > > > > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
> > > > > contain a SUMMARY. Please add an entry. [missing-metadata]
> > > >
> > > > Thanks Richard, will take care of that soon.
> > > >
> > > > Can you tell me what commands do you run to have that sanity check?
> > > > It will avoid me to do the same mistake next time I'll add a recipe=
.
> > >
> > > It should just show up building the recipe (e.g. "bitbake cargo-c")?
> > >
> > > There are further build failures:
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6361/s=
teps/14/logs/stdio
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6484/s=
teps/14/logs/stdio
> > >
> > > and the build isn't finished yet so Is suspect there will be more.
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5606/st=
eps/15/logs/stdio
> >
> > not all of those failures are your patches but:
> >
> > 2023-08-13 12:38:57,894 - oe-selftest - INFO -
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 2023-08-13 12:38:57,894 - oe-selftest - INFO - FAIL:
> distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
> > 2023-08-13 12:38:57,894 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> > 2023-08-13 12:38:57,894 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
> >   File
> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/self=
test/cases/distrodata.py",
> line 115, in test_maintainers
> >     self.fail("""
> >   File
> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroot=
s/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py",
> line 703, in fail
> >     raise self.failureException(msg)
> > AssertionError:
> > Unable to find recipes for the following entries in maintainers.inc:
> > rust-c-lib-example
> > rust-c-lib-example-bin
> >
> >
> > and this:
> >
> > Traceback (most recent call last):
> >   File
> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/core=
/decorator/__init__.py",
> line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File
> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/core=
/decorator/__init__.py",
> line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File
> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/runt=
ime/cases/rust.py",
> line 31, in test_rust_compile
> >     self.assertEqual(status, 0, msg=3Dmsg)
> > AssertionError: 127 !=3D 0 : rust compile failed, output: sh: rustc: no=
t
> found
> >
> >
> > probably is are, so 2 of the 6 failures. The other 4 are "mine" :/.
> >
>
> and a reproducibility failure:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3355/s=
teps/13/logs/stdio
>
> which leads to:
>
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230813-z_b2j=
3ha/packages/diff-html/


Argh, this makes me remember of
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090
Do you know if any of cargo based recipe is reproducible ?
Should I add EXCLUDE_FROM_WORLD in cargo-c ?


>
>
> Cheers,
>
> Richard
>
>

--000000000000e005ee0602cf3518
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 13 Aug 2023 at 16:53, Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Sun, 2023-08-13 at 14:09 +0100, Richard Purdie =
via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Sun, 2023-08-13 at 12:22 +0100, Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; On Sun, 2023-08-13 at 12:48 +0200, Fr=C3=A9d=C3=A9ric Martinsons =
wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" ta=
rget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=
=A0:<br>
&gt; &gt; &gt; &gt; On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons =
wrote:<br>
&gt; &gt; &gt; &gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto:fr=
ederic.martinsons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.co=
m</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; This is an RFC for introducing a new class and rec=
ipes that<br>
&gt; &gt; &gt; &gt; &gt; help building C-ABI compatible header and library =
around<br>
&gt; &gt; &gt; &gt; &gt; rust code.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; The third patch add examples and test to demonstra=
te<br>
&gt; &gt; &gt; &gt; &gt; the usage and the good working of this use case.<b=
r>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Test have been passed with the following in local.=
conf:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; CORE_IMAGE_EXTRA_INSTALL:append =3D &quot; openssh=
-sshd openssh-scp<br>
&gt; &gt; &gt; &gt; &gt; cargo rust rust-c-lib-example-bin&quot;<br>
&gt; &gt; &gt; &gt; &gt; IMAGE_CLASSES +=3D &quot;testimage&quot;<br>
&gt; &gt; &gt; &gt; &gt; TEST_SUITES =3D &quot;ping ssh rust&quot;<br>
&gt; &gt; &gt; &gt; &gt; # To use slirp option in testimage.bbclass<br>
&gt; &gt; &gt; &gt; &gt; TEST_RUNQEMUPARAMS =3D &quot;slirp&quot;<br>
&gt; &gt; &gt; &gt; &gt; TEST_SERVER_IP =3D &quot;127.0.0.1&quot;<br>
&gt; &gt; &gt; &gt; &gt; QEMU_USE_SLIRP =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; In testing it showed:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issu=
e: Recipe<br>
&gt; &gt; &gt; &gt; cargo-c in /home/pokybuild/yocto-worker/a-full/build/me=
ta/recipes-<br>
&gt; &gt; &gt; &gt; devtools/rust/<a href=3D"http://cargo-c_0.9.18.bb" rel=
=3D"noreferrer" target=3D"_blank">cargo-c_0.9.18.bb</a> does not contain a =
SUMMARY. Please<br>
&gt; &gt; &gt; &gt; add an entry. [missing-metadata]<br>
&gt; &gt; &gt; &gt; stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: =
QA Issue:<br>
&gt; &gt; &gt; &gt; Recipe cargo-c in /home/pokybuild/yocto-worker/a-<br>
&gt; &gt; &gt; &gt; full/build/meta/recipes-devtools/rust/<a href=3D"http:/=
/cargo-c_0.9.18.bb" rel=3D"noreferrer" target=3D"_blank">cargo-c_0.9.18.bb<=
/a> does not<br>
&gt; &gt; &gt; &gt; contain a SUMMARY. Please add an entry. [missing-metada=
ta]<br>
&gt; &gt; &gt; &gt; stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_q=
a: QA Issue:<br>
&gt; &gt; &gt; &gt; Recipe cargo-c in /home/pokybuild/yocto-worker/a-<br>
&gt; &gt; &gt; &gt; full/build/meta/recipes-devtools/rust/<a href=3D"http:/=
/cargo-c_0.9.18.bb" rel=3D"noreferrer" target=3D"_blank">cargo-c_0.9.18.bb<=
/a> does not<br>
&gt; &gt; &gt; &gt; contain a SUMMARY. Please add an entry. [missing-metada=
ta]<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Thanks Richard, will take care of that soon.=C2=A0<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Can you tell me what commands do you run to have that sanity=
 check?<br>
&gt; &gt; &gt; It will avoid me to do the same mistake next time I&#39;ll a=
dd a recipe.=C2=A0<br>
&gt; &gt; <br>
&gt; &gt; It should just show up building the recipe (e.g. &quot;bitbake ca=
rgo-c&quot;)?<br>
&gt; &gt; <br>
&gt; &gt; There are further build failures:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/101/builds/6361/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6361/st=
eps/14/logs/stdio</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/110/builds/6484/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6484/st=
eps/14/logs/stdio</a><br>
&gt; &gt; <br>
&gt; &gt; and the build isn&#39;t finished yet so Is suspect there will be =
more.<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/=
builds/5606/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5606/steps/15/=
logs/stdio</a><br>
&gt; <br>
&gt; not all of those failures are your patches but:<br>
&gt; <br>
&gt; 2023-08-13 12:38:57,894 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; 2023-08-13 12:38:57,894 - oe-selftest - INFO - FAIL: distrodata.Distro=
data.test_maintainers (subunit.RemotedTestCase)<br>
&gt; 2023-08-13 12:38:57,894 - oe-selftest - INFO - -----------------------=
-----------------------------------------------<br>
&gt; 2023-08-13 12:38:57,894 - oe-selftest - INFO - testtools.testresult.re=
al._StringException: Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos=
/build/meta/lib/oeqa/selftest/cases/distrodata.py&quot;, line 115, in test_=
maintainers<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.fail(&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos=
/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest=
/case.py&quot;, line 703, in fail<br>
&gt;=C2=A0 =C2=A0 =C2=A0raise self.failureException(msg)<br>
&gt; AssertionError: <br>
&gt; Unable to find recipes for the following entries in maintainers.inc:<b=
r>
&gt; rust-c-lib-example<br>
&gt; rust-c-lib-example-bin<br>
&gt; <br>
&gt; <br>
&gt; and this:<br>
&gt; <br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos=
/build/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_=
f<br>
&gt;=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^<br>
&gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos=
/build/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_=
f<br>
&gt;=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^<br>
&gt;=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos=
/build/meta/lib/oeqa/runtime/cases/rust.py&quot;, line 31, in test_rust_com=
pile<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg=3Dmsg)<br>
&gt; AssertionError: 127 !=3D 0 : rust compile failed, output: sh: rustc: n=
ot found<br>
&gt; <br>
&gt; <br>
&gt; probably is are, so 2 of the 6 failures. The other 4 are &quot;mine&qu=
ot; :/.<br>
&gt; <br>
<br>
and a reproducibility failure:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/3355/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3355/steps/13/log=
s/stdio</a><br>
<br>
which leads to:<br>
<br>
<a href=3D"http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230=
813-z_b2j3ha/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">http=
://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230813-z_b2j3ha/pa=
ckages/diff-html/</a></blockquote><div><br></div><div>Argh, this makes me r=
emember of=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D15090">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090</a></d=
iv><div>Do you know if any of cargo based recipe is reproducible ?</div><di=
v>Should I add EXCLUDE_FROM_WORLD in cargo-c ?</div><div>=C2=A0=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000e005ee0602cf3518--

