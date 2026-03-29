Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72480F3D5FE
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 09:06:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26464.1774775172413684991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 02:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M6869mQD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48541edecf9so44959495e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774775171; x=1775379971; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3tv8UgTnZR3i4wOLKLd8KURiKSjjBUFdDoJ7u5O8DT0=;
        b=M6869mQDz77xM14ujwEa/50pZaTwOB8Ktc3tlQjHB3psT5NxuaxAyved6Rx3A91YvD
         rnN9w6wy4PVFhtL0aEHib83bvwWnX6z/J/5jZBkhy/QeFeXoLppxkSAx4UYdeXSCn5+G
         RGYXBzOJ403nx1N467IvVjtYGBru3aSNT3RwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774775171; x=1775379971;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tv8UgTnZR3i4wOLKLd8KURiKSjjBUFdDoJ7u5O8DT0=;
        b=l6YJ2/qhOG4rxjQpdKbxcJqpFzSTuBbfKNWdceWrz8kK6BYCeqGZejtvMgxLkq07o7
         FnWSFyT2plQIihrhsV35ngdssTey03H+oEsGb7afiaf9NkvhX4fFHfCMyrfEnpmzhOUV
         ISFlT/25V5XUrGfoTeSJYeodzz5/xgvQhOKiXdTXI9VrtQxZcCW672tWqR3EParTmkea
         Fs7Lonj3b6+7cF8a2KUZ/UOFsTsnLGoKFim60UZYOKhinc04UsjHobeF+FFjrd6PsIwD
         1M0UVCSd6FuSAaIxSo8GxE3bGxewz5hRdNdOYdwt3C2TWcMq8YvXRCvRwE7q5YCTGuac
         Rwxg==
X-Forwarded-Encrypted: i=1; AJvYcCW9lsdUVXfDUZPSEPaxdzuXwZEOZfA9dF0EpiiKAS0zpG3FpmgHicd2MEl6A+eyDqgphVquTY53J3PfegHAMFUwrA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzd8xd+EnDVknCzFcl9Bd/R0MvnNb0J9JXy1HzXPGItKgQrHGNJ
	V0bGiXslnoMINGRhj20UX0Wdy7C6EDPA5P0SZqbrzhQpfJu5MUcJjODCu7vCua6dl3s=
X-Gm-Gg: ATEYQzx7LetA34+JQMC9Txf0o4bSvC2YH6HigUMk5F5WWEqfS69+6S4KuH8Hwx2+qE5
	YW7bEeDN4Dw6rNCWxZ+fvPYiZgr33tkaxDfZpoP0FxtVX/5vu16QCDCDYPRyKFWLDc1MUn/Gh/e
	cBtFCsG4XQnY8kObEusKcKrxrs5RVwgBNcK9chgSp7kz1dpT0JYjbm4tubdStDR4O+NlhdYTW0J
	YrIHmYaTz2nTyHfzXdKP+JklFLytSZbfi98c0f534EYx5JLllPc580EJKJLYZ+6TyKx/djUeJxE
	A/lyYZmLoWgSChAaz9GWXUyhn1hV5T/rfN6byHuRiCeKlZbG5Ajc6eiyI9YfBKmmzAOXpAmLV4c
	3TNzh1b7CvUK9imos/T8pmVSRPN5hlRq+p5nz9vFzXEmDyJBDE/A6mok7bj2EFnV3JxJspqL8R+
	fZQiik09yc0XYIjQD5olQ9TOPuacyLitoOwWksx79Cbgld/quVjvERHARDUeMVudf0hgZeWyuor
	vqzMrZRriLPh4Kw
X-Received: by 2002:a05:600c:6309:b0:487:1fbf:e0c5 with SMTP id 5b1f17b1804b1-48727ef678bmr170101455e9.19.1774775170713;
        Sun, 29 Mar 2026 02:06:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3a20:25ed:ae3c:7430? ([2001:8b0:aba:5f3c:3a20:25ed:ae3c:7430])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872718dfdfsm51885805e9.30.2026.03.29.02.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:06:10 -0700 (PDT)
Message-ID: <a1c78194197bd255fb88a01c8d8dca4651240ebd.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv16 0/6] Display manager proposal for x11 and
 wayland
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: otavio.salvador@ossystems.com.br
Cc: Randolph Sapp <rs@ti.com>, raj.khem@gmail.com, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de,
 otavio@ossystems.com.br, 	kexin.hao@windriver.com, paul@pbarker.dev, Ross
 Burton <ross.burton@arm.com>, 	afd@ti.com, detheridge@ti.com,
 denis@denix.org, reatmon@ti.com, 	openembedded-core@lists.openembedded.org,
 vijayp@ti.com
Date: Sun, 29 Mar 2026 10:06:08 +0100
In-Reply-To: <CAP9ODKqBUwtmzYLesb1X4s=LyGzzfAXfKOTDShW-XFc0aoDcRw@mail.gmail.com>
References: <18982E1417FE35B6.1454197@lists.openembedded.org>
	 <189D6251D8E3EDE7.1508127@lists.openembedded.org>
	 <DHCXIN4V1F1Q.1RY9TMY14L13Z@ti.com>
	 <ac09456378ad61595fa49feec71180919c7e4384.camel@linuxfoundation.org>
	 <CAP9ODKqBUwtmzYLesb1X4s=LyGzzfAXfKOTDShW-XFc0aoDcRw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 09:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234141

Hi Otavio,

On Fri, 2026-03-27 at 19:38 -0300, Otavio Salvador via lists.openembedded.o=
rg wrote:
> Em sex., 27 de mar. de 2026 =C3=A0s 14:09, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> escreveu:
> >=20
> > On Thu, 2026-03-26 at 13:35 -0500, Randolph Sapp wrote:
> > > On Mon Mar 16, 2026 at 12:25 PM CDT, Randolph Sapp via lists.openembe=
dded.org wrote:
> > > > On Fri Feb 27, 2026 at 12:31 PM CST, Randolph Sapp via lists.openem=
bedded.org wrote:
> > > > > From: Randolph Sapp <rs@ti.com>
> > > > >=20
> > > > > No functional changes. Just bumping PR to help with automated
> > > >=20
> > > > Hey Paul, have you gotten a chance to review this series yet? I've =
been told you may have some comments.
> > > >=20
> > > > Randolph
> > >=20
> > > Has anyone gotten a chance to review this yet?
> >=20
> > Paul and Ross have some thoughts but we're basically still drowning in
> > the backlog of patch review. We're all frustrated about that. This one
> > is more Ross' area of expertise than mine so I'm waiting on that.I'm
> > replying since I do feel bad we've not got to this yet.
> >=20
> > I wish it were different, I'm doing what I can with various patches but
> > I'm also behind on review for several.
> >=20
> > The challenge with this patchset is it is a fairly invasive change, it
> > does inject a go dependency into a core part of our graphics stack and
> > as such, I think we're all quite nervous about it. It has taken a lot
> > of back and forth to pass the autobuilder's tests and that in itself is
> > a bit of a worry.
>=20
> I understand the concern =E2=80=94 this is an invasive change and caution=
 is
> warranted for something that touches such a core part of the graphics
> stack.
>=20
> That said, I think it's worth recognizing that Randolph has been
> exceptionally persistent and responsive throughout this process. We're
> at v16 now, and every issue that has come up =E2=80=94 from cgo
> reproducibility to busybox-init support to autobuilder failures =E2=80=94=
 has
> been addressed. That level of commitment to getting it right speaks
> well for the long-term maintainability of this work.

I realise and fully recognise Randoplh has been really patient and
persistent, yes. I can only apologise for the length of time this is
taking, I do feel really bad about it.

I've been talking about one of the issues here in meetings recently,
specifically that patches passing on the autobuilder doesn't mean the
patches are "right", just that they don't regress our automated tests.
I think we need to make it clearer that we put patches in for testing
in parallel with other review on the basis it is easier in some ways
and can highlight issues. It doesn't negate the other half of the
process. In this case, the patches had a lot of issues there and it
took a while so there weren't regressions.

You mention the cgo reproducibility issue, I want to be mention there
are a number of other complaints in my inbox about the changes made
there, how there are regressions elsewhere caused by those changes. I
can't really ask anyone else to try and handle that so that just falls
to me, but it does reduce my bandwidth elsewhere.

Unfortunately the people who need to review and sign off on this have a
number of other things in their queues. People only have finite time
and I can't force them to do things. I'd also note that I did ask many
times in the weekly calls and other project meetings about what should
block this release and this patchset was not raised. That isn't to say
it isn't important but there are other pressing issues competing with
it.

> Regarding the Go dependency: Go support in OE-Core has a long history
> at this point and is well-maintained. I don't think introducing it as
> a dependency in the graphics stack is as risky as it might seem at
> first glance =E2=80=94 we're not pulling in something experimental.
>=20
> The problems this series solves are real. The race conditions with
> weston-init and DRM device registration, the scripting sprawl around
> xserver-nodm-init =E2=80=94 these are pain points that affect downstream
> users. emptty offers a clean, unified solution for both X11 and
> Wayland sessions.

Whilst it does solve a real world problem, that doesn't mean it should
go in without the right level of review and wider community buy-in. We
don't have that yet. There is also significant risk to changing a key
runtime component like that this close to release. Build components
aren't so bad as we have better testing, runtime is hard. The rpm 6
patchset is in a similar position - too risky for the release now.

> In my opinion, this patchset should go in.

Noted, thanks. I appreciate the review of it.

Cheers,

Richard


