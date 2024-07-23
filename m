Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4132C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 18:25:57 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.2528.1721759149092292716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 11:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=glMwAlGY;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eefe705510so65350171fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721759147; x=1722363947; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEz+aAZtrJ27J2Zydik8Dt47AgfOkngxhDfOptBjyQU=;
        b=glMwAlGYVHW8h2PTGksBbvVgrxQ1WtuXX4VNU9lDxnUFn5bucaWRuNLM5HgoThFnX5
         rQ1+wCSObZG4A2JSr/UscvA8KoB2qXxSrJMIElIfrqeSf7If9tgkfeJsanoBGj/4W4mY
         rkq2yJ1glUe2Pj8doqsI2E3a5SRHzoBB/h6NJfUK+mHGvSJtGbume5Q/lsYtMhOGA/fE
         RtRas2JjS5GgxdIpS/ELTrxoZUs+sZJahYkpxBuWcrEmz70q2kdJmM7jBPS/0qPXgpZt
         JgBetWKgTZ0sAHnXNQWMe7OgQOQS9ip0jFL1ym+o9ckHVUJTnoXqmK+QAiKq+RtgeSK3
         VQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721759147; x=1722363947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEz+aAZtrJ27J2Zydik8Dt47AgfOkngxhDfOptBjyQU=;
        b=corOfWcvuf0wBtmk1D++yLbZkcsbZF2TL50nxpGJSzitcbVQThzEBE83uSDVmg7h7O
         La3vA2FdJO8Wv7s4eNh091b/vVx3Lu8hSE8W8WhdByEVEd7oWq0w2wvT33jxE6KfPouK
         LefNeXFaqAcRifvvEQ7A2tqOmiaaY8DknnR9R+fVOwCYZa3hnu8Ng67qIcvL4A76jryZ
         9bpE4NfxLGBZVJ61XYwU5NrKZXAyRDS/NeJoZWTVyLJIuPzaX7T5/liujzTtgRLmOj7+
         hUz82VE21Z37vl5FFJrCEACS20YUsksAopg3PUQyyc47Jtt+hNhbXwA9B8MsADK9bq9p
         71IQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1X4P7tamMfrq0ry9toccrLgrpAr56VFpf7LTmoqocAn+A0gU1tgMLaeI55upQMNAaL3krdiBRWA5265qwYvpKwK+X+wNmQ45jA3K0P1kn7WGOULC7so7J
X-Gm-Message-State: AOJu0YzZwtQNHk2AZscC4oI+fSpqRHnZ4ZGJjehfHuxy+wbauI/elboH
	RCZA8I/bnVtClnRWyHUQBp/IWjP+gY/GkK1dACSAUHWc0VwHduav10cs0uDzrRC+hfyct8tozJD
	KPFXSHRC1BpeFKA5PzUiHBMfWEEY=
X-Google-Smtp-Source: AGHT+IFmXAK8sQKclPB78rwjXkc1q2xejywcAyUN2r8ZlZ1b/l97VlLLdBGnlS1yxQL+sW4sJkt/Ok7Li5UNGNiZ8qo=
X-Received: by 2002:a2e:3612:0:b0:2f0:27e4:3a43 with SMTP id
 38308e7fff4ca-2f02b723f60mr5445421fa.11.1721759146704; Tue, 23 Jul 2024
 11:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240719164639.GN17572@denix.org> <15389.1721741918254132393@lists.openembedded.org>
 <878fe028-ade0-4646-8294-429eebdaeb14@windriver.com> <CANNYZj9_8v+c_ddG8OOYcBgOidWQdLDMj5pJeTW9uGZk8fBw=w@mail.gmail.com>
 <GV1PR07MB91201E963D38D13A90E87B9EA8A92@GV1PR07MB9120.eurprd07.prod.outlook.com>
In-Reply-To: <GV1PR07MB91201E963D38D13A90E87B9EA8A92@GV1PR07MB9120.eurprd07.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jul 2024 20:25:35 +0200
Message-ID: <CANNYZj_kNCgB_AOVSEMWLtHfRiP95WY_fX2wT_wxGXDT9mNFmA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: randy.macleod@windriver.com, openembedded-core@lists.openembedded.org, 
	Jiaying.Song.CN@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 18:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202417

But why a separate package? I don't understand why people keep
insisting on it. There's no problem and no need to give it visibility,
there's just historical baggage that we can now fix. We can just add
the symlink from core package, drop all the sed hacks and rejected
upstream patches (instead of tweaking RDEPENDS), and the only people
affected would be those mysterious python 2.x users who would have to
patch *their* scripts instead, as they should be in 2024, so that
*they* know it's way past time to get rid of 2.x.

Master can and does break builds deliberately. There's not ever a
promise to not do that.

Alex

On Tue, 23 Jul 2024 at 20:19, Konrad Weihmann <kweihmann@outlook.com> wrote=
:
>
> How about just moving it to an additional package out of the python recip=
e.
> It's almost zero effort to implement and zero effort to maintain, while
> not deliberately breaking builds (it's not that the users I know are
> keen on keeping python2).
>
> basically a PACKAGE_BEFORE_PN =3D "python3-python-symlink" +
> FILES:python3-python-symlink +=3D "${bindir}/python" will do it.
>
> And those lines will most likely never ever change again.
>
> Like this it at least allows a RCONFLICTS to be properly propagated.
>
> Followups could then replace the unanswered/rejects patches by
> RDEPENDing on that new package.
> This will also help to maintain visibility on the problem.
>
>
> On 23.07.24 19:56, Alexander Kanavin wrote:
> > I guess the recommendation to remove the symlink if needed was a bit
> > poorly thought out.
> >
> > On the other hand, I fail to see any benefit whatsoever in a separate
> > python-is-python3. If you do not have python 2.x installed on target,
> > there is no difference in whether there is a python symlink on the
> > target or not. And if you do, you still have the same clash between
> > 2.x scripts that refer to python, and 3.x scripts that refer to
> > python, and no easy way to resolve that clash.
> >
> > What I am proposing instead is this:
> >
> > - python to python3 symlink is still provided by the base package.
> > It's not accurate to say that 'patching' things from recipes to use
> > python3 is what people 'prefer', it's that up until now they were
> > forced to do it, Randy.
> >
> > - if anyone is still using python 2.x in target images in 2024 with
> > yocto master (nevermind that the public python2 layer is dead and
> > unmaintained), and is relying on python 2.x being symlinked to python,
> > they should be adjusting their scripts to point to python2 instead.
> > They no longer own the unversioned python symlink and we should not be
> > catering to them.
> >
> > Please reframe your arguments.
> >
> > Alex
> >
> > On Tue, 23 Jul 2024 at 18:44, Randy MacLeod via lists.openembedded.org
> > <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> >>
> >> On 2024-07-23 9:38 a.m., Konrad Weihmann via lists.openembedded.org wr=
ote:
> >>
> >> I also vote against it.
> >>
> >> I'm on the fence but I'll be swayed by the "against" voters.
> >>
> >> There are pros and cons to a system-wide solution but it seems that
> >> people prefer to have these problems fixed in each affected recipe.
> >> Best solution is to update the script to call and work with python3.
> >> If the upstream refuses to do that, the layer would have to carry a pa=
tch.
> >>
> >> This is how most such '/usr/bin/python' problems have been solved.
> >> It's a shame that upstream python didn't mandate a specific solution.
> >>
> >> Btw, some people could use:
> >>
> >> https://github.com/Igalia/meta-webkit/blob/main/recipes-devtools/pytho=
n/python-is-python3_1.0.bb
> >> https://github.com/Igalia/meta-webkit/commit/b2156c282a6e727100dee2515=
5fbc38d1532b573
> >> https://github.com/Igalia/meta-webkit/commit/46fbfbc58f82abc3dc8794c63=
0172d4554be0830
> >>
> >> =E2=9D=AF git log --stat 46fbfbc5
> >> commit 46fbfbc58f82abc3dc8794c630172d4554be0830
> >> Author: Carlos Alberto Lopez Perez <clopez@igalia.com>
> >> Date:   Mon Dec 19 20:29:05 2022
> >>
> >>      Add a new image and distro definition for using on the WebKit CI =
for WPE perf bots
> >>
> >>   ...
> >>
> >>      * It adds also a 'python-is-python3' recipe that creates a symlin=
k
> >>      to provide the unversioned python interpreter as python3.
> >>
> >>
> >> but both oe-core and meta-oe maintainers said on today's YP tech call =
that
> >> they would *not* carry that recipe.
> >>
> >> ../Randy
> >>
> >>
> >>
> >>
> >> While I see the convenience in dropping a lot of patches the better ap=
proach would be to add something like python-is-python3, for the ones that =
require it.
> >> (meta-webkit does provide it already https://github.com/Igalia/meta-we=
bkit/blob/main/recipes-devtools/python/python-is-python3_1.0.bb).
> >>
> >> Adding a link by the base package and recommending to the user to remo=
ve it again, would create two very unwelcome situations.
> >>
> >> a) it will clash at image assembly with an error message that will no =
easily point to the python base package
> >> b) create a need to run with a permanent remove operation on top of po=
ky (creating the need for new sstate cache artifacts)
> >>
> >> What I could see is to move the symlink into an optional package, whic=
h could be used by the few recipes that still use the "wrong" interpreter l=
ine via RDEPENDS, that would be the much cleaner solution here
> >>
> >>
> >>
> >>
> >> --
> >> # Randy MacLeod
> >> # Wind River Linux
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#202412): https://lists.openembedded.org/g/openembe=
dded-core/message/202412
> >> Mute This Topic: https://lists.openembedded.org/mt/107264938/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

