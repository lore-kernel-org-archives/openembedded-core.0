Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B66C001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 15:52:43 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.137865.1692114762585303294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 08:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BBNwYolV;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a43cbb432aso4363245b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692114762; x=1692719562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nOYml6QFLtjo9IMfakzwQh7adJNhZuhnv67x+OoX9d4=;
        b=BBNwYolVXQAIk11BNeZnqgvyUGBoFJpC9knELwFzTz0TUjLsJ6zX/nWpYaJGA5MHfy
         0nDjqyTZQgjdRIigBVwjrfXW5raXznvAzgCnqbTF6FhkRZosdICHTLUaTUslm7VmGWbt
         CjRBnKPEcOIpj7QnZ5AyY0REtdra1BNKqZmVc/FWcYe0/IQmeQU+WlsWjq0N5HFxNdEx
         Bbk2dIAwPZYG8KoNR6bJ9OV6WIbmjOgeWXgNyFxz0yTkLQcqS7JpArGWkrgSJoo17fCy
         sFvtapL2psNepTKxtDBUEkpgHnaNmM/j/2D13t4Cg7RrR6QkJyVsjvPQImmi3QLPbL4/
         HBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114762; x=1692719562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOYml6QFLtjo9IMfakzwQh7adJNhZuhnv67x+OoX9d4=;
        b=KPPppd0xplAXH8r82nIDkfQrhmVEtQTqcmoUROpU25ehiRMK8dFE6oRQ73OmxBCbJz
         4ggDeBag9BXQA8HjKwWPcc//P+ykuf1E2d72eFLEqfaDf2w5wLw5gEugIrzoHUac7Fbn
         yzr2bshpTG0DglWYezRSTXsXFvBiYItjv0W1qSkXH3EtKLCdUxUQzdzAQ3yQC1wbmz0B
         etZv5JAf1h0OkWVGFf/sLUmIdVkZC239BUPU9cUiUhw+K9+RTgTt1SOcWs4TGUSQlhTB
         BEwa5yTa6svtkHBsyKKRAUBhx9OP7PLBod2b60WenwGlrU8z4CvbcUD5eqsOjjRKjNqW
         si2w==
X-Gm-Message-State: AOJu0YwO4WRwCEycmOhevsd22Gwdtu36Q+GOz68UmPgkJU4QUzu27Vmi
	chRwr3m9WL+ZsNli9Srf3+qBozVJstVnlHNHHcg=
X-Google-Smtp-Source: AGHT+IEOAFiw1l6DM3IyoBs/T+sykFVGP/tkwoLybMAfYnc4XnDJnUXfRmjsEKMdpcptD3W+ruouH2Sp23yD3V7hq0Y=
X-Received: by 2002:a05:6808:19a0:b0:3a7:500a:a481 with SMTP id
 bj32-20020a05680819a000b003a7500aa481mr17882869oib.3.1692114761728; Tue, 15
 Aug 2023 08:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
 <177AED879B83B027.8497@lists.openembedded.org> <63c94494ab57f28cab43c4a856863d07fa7eb1b3.camel@linuxfoundation.org>
 <CA+cAkeq5nn9i88bmBEneb0zLOM9br75M5sS48h1XrHM4ReTxew@mail.gmail.com>
In-Reply-To: <CA+cAkeq5nn9i88bmBEneb0zLOM9br75M5sS48h1XrHM4ReTxew@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 15 Aug 2023 17:52:30 +0200
Message-ID: <CA+cAkepmbB6Gx0xAmAk5FZfizSoRZknm_6AmQsrS-NHUCfM-MQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004ac7d00602f82b51"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 15:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186077

--0000000000004ac7d00602f82b51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 13 ao=C3=BBt 2023, 16:57, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> a =C3=A9crit :

>
>
> On Sun, 13 Aug 2023 at 15:09, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Sun, 2023-08-13 at 12:22 +0100, Richard Purdie via
>> lists.openembedded.org wrote:
>> > On Sun, 2023-08-13 at 12:48 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote=
:
>> > >
>> > >
>> > > Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie
>> > > <richard.purdie@linuxfoundation.org> a =C3=A9crit :
>> > > > On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote:
>> > > > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> > > > >
>> > > > > This is an RFC for introducing a new class and recipes that
>> > > > > help building C-ABI compatible header and library around
>> > > > > rust code.
>> > > > >
>> > > > > The third patch add examples and test to demonstrate
>> > > > > the usage and the good working of this use case.
>> > > > >
>> > > > > Test have been passed with the following in local.conf:
>> > > > >
>> > > > > CORE_IMAGE_EXTRA_INSTALL:append =3D " openssh-sshd openssh-scp
>> > > > > cargo rust rust-c-lib-example-bin"
>> > > > > IMAGE_CLASSES +=3D "testimage"
>> > > > > TEST_SUITES =3D "ping ssh rust"
>> > > > > # To use slirp option in testimage.bbclass
>> > > > > TEST_RUNQEMUPARAMS =3D "slirp"
>> > > > > TEST_SERVER_IP =3D "127.0.0.1"
>> > > > > QEMU_USE_SLIRP =3D "1"
>> > > >
>> > > > In testing it showed:
>> > > >
>> > > > stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe
>> > > > cargo-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-
>> > > > devtools/rust/cargo-c_0.9.18.bb does not contain a SUMMARY. Please
>> > > > add an entry. [missing-metadata]
>> > > > stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Issue:
>> > > > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
>> > > > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
>> > > > contain a SUMMARY. Please add an entry. [missing-metadata]
>> > > > stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA Issue=
:
>> > > > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
>> > > > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
>> > > > contain a SUMMARY. Please add an entry. [missing-metadata]
>> > >
>> > > Thanks Richard, will take care of that soon.
>> > >
>> > > Can you tell me what commands do you run to have that sanity check?
>> > > It will avoid me to do the same mistake next time I'll add a recipe.
>> >
>> > It should just show up building the recipe (e.g. "bitbake cargo-c")?
>> >
>> > There are further build failures:
>> >
>> >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6361/=
steps/14/logs/stdio
>> >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6484/=
steps/14/logs/stdio
>> >
>> > and the build isn't finished yet so Is suspect there will be more.
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5606/s=
teps/15/logs/stdio
>>
>> not all of those failures are your patches but:
>>
>> 2023-08-13 12:38:57,894 - oe-selftest - INFO -
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> 2023-08-13 12:38:57,894 - oe-selftest - INFO - FAIL:
>> distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
>> 2023-08-13 12:38:57,894 - oe-selftest - INFO -
>> ----------------------------------------------------------------------
>> 2023-08-13 12:38:57,894 - oe-selftest - INFO -
>> testtools.testresult.real._StringException: Traceback (most recent call
>> last):
>>   File
>> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/sel=
ftest/cases/distrodata.py",
>> line 115, in test_maintainers
>>     self.fail("""
>>   File
>> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroo=
ts/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py",
>> line 703, in fail
>>     raise self.failureException(msg)
>> AssertionError:
>> Unable to find recipes for the following entries in maintainers.inc:
>> rust-c-lib-example
>> rust-c-lib-example-bin
>>
>
> I don't understand these, because rust-c-lib-example and
> rust-c-lib-example-bin have been added by PATCHV2 (3/4)  in meta-selftest=
.
> ./meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
> ./meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
>
> Is this because they are in meta-selftest ? Should I remove them from
> maintainers.inc ?
>
>
>> and this:
>>
>> Traceback (most recent call last):
>>   File
>> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/cor=
e/decorator/__init__.py",
>> line 35, in wrapped_f
>>     return func(*args, **kwargs)
>>            ^^^^^^^^^^^^^^^^^^^^^
>>   File
>> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/cor=
e/decorator/__init__.py",
>> line 35, in wrapped_f
>>     return func(*args, **kwargs)
>>            ^^^^^^^^^^^^^^^^^^^^^
>>   File
>> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/run=
time/cases/rust.py",
>> line 31, in test_rust_compile
>>     self.assertEqual(status, 0, msg=3Dmsg)
>> AssertionError: 127 !=3D 0 : rust compile failed, output: sh: rustc: not
>> found
>>
>> I don't understand this one either, I simply add openssh-scp in require
> package to run test_rust_compile since its setup function
> copy source on target via scp, rustc is provided by rust recipe and rust
> recipe is required to run this test. Any ideas ?
>

In fact, I do know where it's come from, I just had to look for the
docstring of the decorator OEHasPackage since it tells that the writing
@OEHasPackage(['rust', 'openssh-scp'])
means an "or" (test needs rust or openssh-scp), this is the wrong usage
since the test needs both.

The V3 of the series I just sent should correct that, I also make cargo-c
purely native but for the maintainers.inc issue, I have no clue...


>
>> probably is are, so 2 of the 6 failures. The other 4 are "mine" :/.
>>
>> Cheers,
>>
>> Richard
>>
>>

--0000000000004ac7d00602f82b51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le dim. 13 ao=C3=BBt 2023, 16:57, Fr=C3=A9d=C3=A9ric M=
artinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sun, 13 Aug 2023 at 15:09, Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2023-08-13 at 12:22=
 +0100, Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On Sun, 2023-08-13 at 12:48 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote=
:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" rel=3D"=
noreferrer noreferrer" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt; a =C3=A9crit=C2=A0:<br>
&gt; &gt; &gt; On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote=
:<br>
&gt; &gt; &gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederi=
c.martinsons@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">fre=
deric.martinsons@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; This is an RFC for introducing a new class and recipes =
that<br>
&gt; &gt; &gt; &gt; help building C-ABI compatible header and library aroun=
d<br>
&gt; &gt; &gt; &gt; rust code.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The third patch add examples and test to demonstrate<br=
>
&gt; &gt; &gt; &gt; the usage and the good working of this use case.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Test have been passed with the following in local.conf:=
<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; CORE_IMAGE_EXTRA_INSTALL:append =3D &quot; openssh-sshd=
 openssh-scp<br>
&gt; &gt; &gt; &gt; cargo rust rust-c-lib-example-bin&quot;<br>
&gt; &gt; &gt; &gt; IMAGE_CLASSES +=3D &quot;testimage&quot;<br>
&gt; &gt; &gt; &gt; TEST_SUITES =3D &quot;ping ssh rust&quot;<br>
&gt; &gt; &gt; &gt; # To use slirp option in testimage.bbclass<br>
&gt; &gt; &gt; &gt; TEST_RUNQEMUPARAMS =3D &quot;slirp&quot;<br>
&gt; &gt; &gt; &gt; TEST_SERVER_IP =3D &quot;127.0.0.1&quot;<br>
&gt; &gt; &gt; &gt; QEMU_USE_SLIRP =3D &quot;1&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; In testing it showed:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Re=
cipe<br>
&gt; &gt; &gt; cargo-c in /home/pokybuild/yocto-worker/a-full/build/meta/re=
cipes-<br>
&gt; &gt; &gt; devtools/rust/<a href=3D"http://cargo-c_0.9.18.bb" rel=3D"no=
referrer noreferrer noreferrer" target=3D"_blank">cargo-c_0.9.18.bb</a> doe=
s not contain a SUMMARY. Please<br>
&gt; &gt; &gt; add an entry. [missing-metadata]<br>
&gt; &gt; &gt; stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Is=
sue:<br>
&gt; &gt; &gt; Recipe cargo-c in /home/pokybuild/yocto-worker/a-<br>
&gt; &gt; &gt; full/build/meta/recipes-devtools/rust/<a href=3D"http://carg=
o-c_0.9.18.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">c=
argo-c_0.9.18.bb</a> does not<br>
&gt; &gt; &gt; contain a SUMMARY. Please add an entry. [missing-metadata]<b=
r>
&gt; &gt; &gt; stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA=
 Issue:<br>
&gt; &gt; &gt; Recipe cargo-c in /home/pokybuild/yocto-worker/a-<br>
&gt; &gt; &gt; full/build/meta/recipes-devtools/rust/<a href=3D"http://carg=
o-c_0.9.18.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">c=
argo-c_0.9.18.bb</a> does not<br>
&gt; &gt; &gt; contain a SUMMARY. Please add an entry. [missing-metadata]<b=
r>
&gt; &gt; <br>
&gt; &gt; Thanks Richard, will take care of that soon.=C2=A0<br>
&gt; &gt; <br>
&gt; &gt; Can you tell me what commands do you run to have that sanity chec=
k?<br>
&gt; &gt; It will avoid me to do the same mistake next time I&#39;ll add a =
recipe.=C2=A0<br>
&gt; <br>
&gt; It should just show up building the recipe (e.g. &quot;bitbake cargo-c=
&quot;)?<br>
&gt; <br>
&gt; There are further build failures:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/101=
/builds/6361/steps/14/logs/stdio" rel=3D"noreferrer noreferrer noreferrer" =
target=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/1=
01/builds/6361/steps/14/logs/stdio</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/110=
/builds/6484/steps/14/logs/stdio" rel=3D"noreferrer noreferrer noreferrer" =
target=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/1=
10/builds/6484/steps/14/logs/stdio</a><br>
&gt; <br>
&gt; and the build isn&#39;t finished yet so Is suspect there will be more.=
<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/5606/steps/15/logs/stdio" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/79/buil=
ds/5606/steps/15/logs/stdio</a><br>
<br>
not all of those failures are your patches but:<br>
<br>
2023-08-13 12:38:57,894 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
2023-08-13 12:38:57,894 - oe-selftest - INFO - FAIL: distrodata.Distrodata.=
test_maintainers (subunit.RemotedTestCase)<br>
2023-08-13 12:38:57,894 - oe-selftest - INFO - ----------------------------=
------------------------------------------<br>
2023-08-13 12:38:57,894 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos/build/met=
a/lib/oeqa/selftest/cases/distrodata.py&quot;, line 115, in test_maintainer=
s<br>
=C2=A0 =C2=A0 self.fail(&quot;&quot;&quot;<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos/build/bui=
ldtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py&q=
uot;, line 703, in fail<br>
=C2=A0 =C2=A0 raise self.failureException(msg)<br>
AssertionError: <br>
Unable to find recipes for the following entries in maintainers.inc:<br>
rust-c-lib-example<br>
rust-c-lib-example-bin<br></blockquote><div><br></div><div>I don&#39;t unde=
rstand these, because rust-c-lib-example and rust-c-lib-example-bin=C2=A0ha=
ve been added by PATCHV2 (3/4)=C2=A0 in meta-selftest.</div><div>./meta-sel=
ftest/recipes-devtools/rust/<a href=3D"http://rust-c-lib-example-bin_git.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">rust-c-lib-example-bin_gi=
t.bb</a><br>./meta-selftest/recipes-devtools/rust/<a href=3D"http://rust-c-=
lib-example_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust-c-=
lib-example_git.bb</a><br></div><div><br></div><div>Is this because they ar=
e in meta-selftest ? Should I remove them from maintainers.inc ?</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
and this:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos/build/met=
a/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos/build/met=
a/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos/build/met=
a/lib/oeqa/runtime/cases/rust.py&quot;, line 31, in test_rust_compile<br>
=C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3Dmsg)<br>
AssertionError: 127 !=3D 0 : rust compile failed, output: sh: rustc: not fo=
und<br><br></blockquote><div>I don&#39;t understand this one either, I simp=
ly add openssh-scp in require package to run test_rust_compile since its se=
tup function</div><div>copy source on target via scp, rustc is provided by =
rust recipe and rust recipe is required to run this test. Any ideas ?</div>=
</div></div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">In fact, I do know where it&#39;s come from, I just had to look f=
or the docstring of the decorator OEHasPackage since it tells that the writ=
ing=C2=A0</div><div dir=3D"auto">@OEHasPackage([&#39;rust&#39;, &#39;openss=
h-scp&#39;])=C2=A0</div><div dir=3D"auto">means an &quot;or&quot; (test nee=
ds rust or openssh-scp), this is the wrong usage since the test needs both.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">The V3 of the ser=
ies I just sent should correct that, I also make cargo-c purely native but =
for the maintainers.inc issue, I have no clue...=C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
probably is are, so 2 of the 6 failures. The other 4 are &quot;mine&quot; :=
/.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>
</blockquote></div></div></div>

--0000000000004ac7d00602f82b51--

