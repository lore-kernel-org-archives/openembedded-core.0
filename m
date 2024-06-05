Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8DAC27C53
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 10:12:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.11687.1717582317080075772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 03:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=ETPNERIf;
 spf=pass (domain: snapchat.com, ip: 209.85.218.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a68b5f18fc5so470114166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717582315; x=1718187115; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a/djQvQMUMInEwePPNhubPUy0DdabeSh6LFulW3gipo=;
        b=ETPNERIfEmQeGCeaMD3ytkhZ27CMuzuO/HOfhpeKlURs7dFu5PK5OUEqdRE4niKZvQ
         1M6nSOmaSlB1VxZ36du0Rn6I55hZSwXmQyTJ2wlLpaqxoD6ruQLMemzj9LRNsUEyrbdw
         +7YFcpDttIfk4jbN/jPWd8x2XJRCPQI0fTgDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717582315; x=1718187115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/djQvQMUMInEwePPNhubPUy0DdabeSh6LFulW3gipo=;
        b=eJrBtncjDIq32wH5zhHh3S+D+YriRn7/E1tsyAucZOgZkAk5mefkF8qzNQ6j0cYUF5
         klzSkNkWld3KB02IEufU8kWP6T3aCTknZdOPxJC2jm46suLbb/U5CpM3XHe+jdTbajCg
         gEUHfGg2B/h1BuEfnXwjmywI/dtVvPMo7ve4FQWn0/pw9sdXJyQNGF8nraGQFQqeuSKN
         o8ug7/D/KD8pT5KZ4YMeg63NXqGeqBavx+WEZL2CoiuIaQD1qAWtR8bVlyepU2IEiCd2
         Dgm2tqO1oraFrnzUNsCLOWfjdZ0QFeO6S6MkMtwxInCnbQqShOzCkQdoUSipNVW8bxUR
         T20Q==
X-Gm-Message-State: AOJu0Ywry76GMBeuEuGR71kmGLTvQ9VMbRDD7aUkuXm6zetNYBJJ2tjn
	uv7DeA24mmfMiTYUFV/3Fp2GkyKroooVVcM4fzI30kPFaeqCi2nWE0Qa8u6Ap7e7HK7W5kERyMT
	q1UFy1NlKwOm5DBqDOgTUcGqN27JBhBJV4b+aqA==
X-Google-Smtp-Source: AGHT+IG4lGwgfEqhtapugXECgC8yvP52uGA6vB08GXvzFaE6U723+E5ulxS0q6+sNkudajBiKbNVY3jn4DuvOHfMS54=
X-Received: by 2002:a17:906:dca:b0:a69:67e3:57fd with SMTP id
 a640c23a62f3a-a69a002272dmr137346266b.47.1717582315306; Wed, 05 Jun 2024
 03:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240529100853.1162640-1-ecordonnier@snap.com>
 <80be0806edba87cb67f7f5711fb9c83516fb860d.camel@linuxfoundation.org>
 <17D44D900E0F42D1.15404@lists.openembedded.org> <CAHUKmYY53BOSRdFvxwsTeDOXfurLbvJ9yS6by-K4mR1OshvFRg@mail.gmail.com>
 <17D5840BB429ED6B.21428@lists.openembedded.org> <efb2d0c37c60615dd0dc6bb2b71b3d8f8dfa98b7.camel@linuxfoundation.org>
 <CAHUKmYa1kyhrJQ8C3o9zyx15FvjzxdBs5D=4GUU-33T7v53NSA@mail.gmail.com>
 <57260bcac841a038fc1e0af5dad1d66f28dd111c.camel@linuxfoundation.org>
 <CAHUKmYbGNATvoBq2pUFbvOF_HK922onqQctMn444_9Jaz1XxaA@mail.gmail.com> <d3de56017f5df0786dc58d50308d9c76dfdd85cb.camel@linuxfoundation.org>
In-Reply-To: <d3de56017f5df0786dc58d50308d9c76dfdd85cb.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Wed, 5 Jun 2024 12:11:44 +0200
Message-ID: <CAHUKmYZ=gzOW5TaPgNPyOL_zYRLcjQyF5Qdw278mLLn_kq9Dzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: fix regression in minidebuginfo test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c6e754061a21cbdc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 10:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200360

--000000000000c6e754061a21cbdc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I'm assuming you meant "How about we add runtime coverage to the selftest"
(it got autocorrected to "How are we all runtime coverage to the selftest")=
.

I'll have a look at adding this to selftest to ensure that the test is
executed, however for context you had suggested another solution in
https://lists.openembedded.org/g/openembedded-core/topic/102891486#msg19149=
5
, which is why I hadn't done it initially  (it is not a problem at all, I
can change the implementation, I'm just making sure you still have the
context since the previous conversation was 6 months ago):

"I was looking at your patches and thinking we might want to enable
minidebuginfo in poky or perhaps OE-Core by default too."

"We could assume we'll end up enabling this by default and if we do
that, we could add a new runtime tests if it is configured knowing it
will be by default in some of our builds."

"and include running things under runqemu to test target pieces but a
runtime test may be enough for this feature."

On Tue, Jun 4, 2024 at 2:32=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2024-06-04 at 13:58 +0200, Etienne Cordonnier wrote:
> > I'm talking specifically about test_systemd_coredump_minidebuginfo
> > (the minidebuginfo test which I wrote
> > in meta/lib/oeqa/runtime/cases/systemd.py, not the tests
> > in meta/lib/oeqa/selftest/cases/minidebuginfo.py).
>
> Ok, sorry, I'm struggling to remember all the right context!
>
> I get nervous about blanket distro changes as whilst it adds test
> coverage to minidebuginfo, it also removes test coverage from other
> things (the non-mini systemd case).
>
> How are we all runtime coverage to the selftest in question, so it
> boots and runs the systemd selftests?
>
> Specifically, we'd add config along the lines of:
>
>
> DISTRO_FEATURES:append =3D " systemd"
> TEST_SUITES =3D "ping ssh systemd"
>
> and then add a:
>
> bitbake('-c testimage core-image-minimal')
>
> to that testcase in selftest, which would then ensure we do run the
> right tests?
>
> If we want to test both the systemd and non-systemd cases we could add
> a second test to selftest instead which covers this?
>
> Cheers,
>
> Richard
>

--000000000000c6e754061a21cbdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>I&#39;m assuming you meant &quot;How about =
we add runtime coverage=C2=A0to the selftest&quot; (it got autocorrected to=
 &quot;How are we all runtime coverage=C2=A0to the selftest&quot;).<br><br>=
I&#39;ll have a look at adding this to selftest to ensure that the test is =
executed, however for context you had suggested another solution in <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/topic/102891486#msg1=
91495">https://lists.openembedded.org/g/openembedded-core/topic/102891486#m=
sg191495</a> , which is why I hadn&#39;t done it initially=C2=A0 (it is not=
 a problem at all, I can change the implementation, I&#39;m just making sur=
e you still have the context since the previous conversation was 6 months a=
go):<br><br>&quot;I was looking at your patches and thinking we might want =
to enable<br>minidebuginfo in poky or perhaps OE-Core by default too.&quot;=
<br><br>&quot;We could assume we&#39;ll end up enabling this by default and=
 if we do<br>that, we could add a new runtime tests if it is configured kno=
wing it<br>will be by default in some of our builds.&quot;<br><br>&quot;and=
 include running things under runqemu to test target pieces but a<br>runtim=
e test may be enough for this feature.&quot;=C2=A0</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 4, 2024 at 2:=
32=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 202=
4-06-04 at 13:58 +0200, Etienne Cordonnier wrote:<br>
&gt; I&#39;m talking specifically about=C2=A0test_systemd_coredump_minidebu=
ginfo<br>
&gt; (the minidebuginfo test which I wrote<br>
&gt; in=C2=A0meta/lib/oeqa/runtime/cases/systemd.py, not the tests<br>
&gt; in=C2=A0meta/lib/oeqa/selftest/cases/minidebuginfo.py).<br>
<br>
Ok, sorry, I&#39;m struggling to remember all the right context!<br>
<br>
I get nervous about blanket distro changes as whilst it adds test<br>
coverage to minidebuginfo, it also removes test coverage from other<br>
things (the non-mini systemd case).<br>
<br>
How are we all runtime coverage to the selftest in question, so it<br>
boots and runs the systemd selftests?<br>
<br>
Specifically, we&#39;d add config along the lines of:<br>
<br>
<br>
DISTRO_FEATURES:append =3D &quot; systemd&quot;<br>
TEST_SUITES =3D &quot;ping ssh systemd&quot;<br>
<br>
and then add a:<br>
<br>
bitbake(&#39;-c testimage core-image-minimal&#39;)<br>
<br>
to that testcase in selftest, which would then ensure we do run the<br>
right tests?<br>
<br>
If we want to test both the systemd and non-systemd cases we could add<br>
a second test to selftest instead which covers this?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000c6e754061a21cbdc--

