Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BAAC46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 18:46:53 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.107291.1703702806777823118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 10:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gdS7iupc;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e7e1ddaddso2340724e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 10:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703702805; x=1704307605; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koA9In5q0K5yDUSQ4mX+47H4J1JZthMtnd3hsGTzJ5w=;
        b=gdS7iupcNMyDVOswMIhk0PMjKYidCY4T7QbfZ+V91ADhbxmiIkQ1c1uNTWl7kDQkvp
         Lxq6VuA40AJAnP4M7ixGpxhBi0w/LBwEMma7N3KeXbB/JDMxw8i/Ib0kNzCZd+WIe6fU
         fd6Io1E4eR+mEUSRgs0sd27zjV+ZXJTZ+PWIEifbhZGIjF/zlcAUVHEJc79w1/BV4uny
         YNItgf9fREu43vYjRy3X/D5O+z7/+SYMYm3hl8MP2mkP2RY5I6+UL6MPpWt7u+b8gVyW
         o3QnlvP699hrGkJhIfoOCREqXNMtzRCwNC3PxYxR0+f2x7qld4LF1mAoemk6nx//qx1w
         Aqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703702805; x=1704307605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koA9In5q0K5yDUSQ4mX+47H4J1JZthMtnd3hsGTzJ5w=;
        b=Zalwr63Gdido5mJKVMmTckyeJbbnOpYhaelnFBrUwho/LQgctQZNk4ooLpxo8jvde+
         u/SGhDLPotc0FiuGKh5pNjzCVVCQMX1HrckPgc7ntDN/jadAr6ZVPGjo3/A/TTqewQ3F
         CQPr2IqXWQ7kdNryM4g7kP5YHPLRAOCzVsZSwdxYCmvtulVPSGgWCXJa4E8GKTrmJiC/
         I/8nM0yXZN9oWLx+EnBt5zp0LmBytWveR58em9CLFROxKVoAwaoPgNDW+MGhOdWNcbKv
         ZCGp4qhdlBsdnpCr/RVDvlGAswMz+9ZFX96h39yXOp0K9w7YyhQSy1EMETP7e2JGefRo
         w38Q==
X-Gm-Message-State: AOJu0YyqNh4DxgAiwd0+YFAMb5RUcGhyKk6sVsm05mOVf9EuPNnZT/j/
	kvjsyHJ8NCSBVbvvB13WI5KlTfzkeczPybuQvVM=
X-Google-Smtp-Source: AGHT+IEhxdmzM7Ic9H38OUYf3rmg3eGDLWlqSVruifNb2B/mOeXF1FUoT0BWCxv/Cp3nkBIC+RygjADhezmCW+sfzxY=
X-Received: by 2002:a05:6512:931:b0:50e:6457:2bc2 with SMTP id
 f17-20020a056512093100b0050e64572bc2mr3680186lft.71.1703702804619; Wed, 27
 Dec 2023 10:46:44 -0800 (PST)
MIME-Version: 1.0
References: <20231224230934.831-1-alex.kiernan@gmail.com> <17A406727F961131.18684@lists.openembedded.org>
 <40a32888473597abf1b65d85e46efde7ce153d54.camel@linuxfoundation.org> <17A4560667D5D860.18684@lists.openembedded.org>
In-Reply-To: <17A4560667D5D860.18684@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 27 Dec 2023 18:46:33 +0000
Message-ID: <CAO5Uq5Qm2c-CgfxHheHYO3vgrMX8RqCF-C9U3x-G26_8dxbHCw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 0/6] Stepwise rust upgrade 1.71.1 -> 1.74.1
To: alex.kiernan@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Frederic Martinsons <frederic.martinsons@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, "Shinde, Yash" <Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 18:46:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192966

On Tue, Dec 26, 2023 at 8:59=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, Dec 25, 2023 at 10:02=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2023-12-25 at 08:40 +0000, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Sun, 2023-12-24 at 23:09 +0000, Alex Kiernan wrote:
> > > > This is the 1.74.1 rust series rebased to include a revert of
> > > > https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f=
277704d1d08a8ec
> > > > which I'm pretty sure is what's causing our filename churn. I've ch=
ecked
> > > > 1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsi=
cs
> > > > which had the issue) and in both cases we're not generating the dir=
name
> > > > based prefix - hopefully that means that the interim commits are fi=
ne
> > > > too, if not we can do the step back through the commits to find the=
 next
> > > > issue.
> > > >
> > > > I've dropped the zvariant tests as upgrading it isn't useful (since=
 it
> > > > no longer includes git crate dependency) and spurious oe-selftest
> > > > failures aren't helpful. I guess we need to include either somethin=
g
> > > > synthetic which tests git crates, or pull in
> > > > https://github.com/jthornber/thin-provisioning-tools/ from
> > > > meta-openembedded which includes a live example (though who knows f=
or
> > > > how long!)
> > > >
> > > > Assuming this does actually fix the reproducibility issue, I'll loo=
k at
> > > > how we fix the issue properly, rather than just reverting the commi=
t
> > > > which I think is our problem, but I'd like to try and get us back o=
n the
> > > > rust release train if we can!
> > > >
> > > >
> > > > Alex Kiernan (6):
> > > >   meta-selftest: Drop zvariant recipe
> > > >   rust: Upgrade 1.71.1 -> 1.72.0
> > > >   rust: Upgrade 1.72.0 -> 1.72.1
> > > >   rust: Upgrade 1.72.1 -> 1.73.0
> > > >   rust: Upgrade 1.73.0 -> 1.74.0
> > > >   rust: Upgrade 1.74.0 -> 1.74.1
> > >
> > > Sounds like a good plan, I've started a reproducibility test:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/41=
42
> > >
> > > With zvariant, we might be better replacing with a synthetic example
> > > for testing purposes?
> >
> > That build went green so I ran an a-full to double check and check
> > everything else:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6374
> >
> > Curl ptest warning was the only issue (unrelated) so it also looks
> > good.
> >
> > Looks like you might have tracked down the issue, nice work! :)
> >
> > Should I merge this as is or is there something we should do first now
> > we know where the issue is?
> >
>
> Obviously we need the upstream pieces sorting, but I don't think
> that's a blocker to merging here. Just ripping out zvariant and all
> the associated infrastructure I guess wants fixing first, though I
> think don't we need anything more complicated than:
>
> https://github.com/akiernan/hello-rs
>
> I'll try and have a look at that later.
>

The pieces I have are:

https://github.com/akiernan/hello-bin
https://github.com/akiernan/hello-lib

Which build/work fine, but the swapping it in for the zvariant tests
fails with things totally unrelated to upgrading rust, which suggest
we have more stuff to fix, so after two days looking at it, on and
off, I think just skipping the relevant test is the right thing for
now.

1.75.0 lands tomorrow, and from a quick test breaks everything again :|

--=20
Alex Kiernan

