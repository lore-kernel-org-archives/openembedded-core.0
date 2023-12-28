Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CDAC4706F
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:59:49 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.124150.1703775582933959033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYFLCpOE;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so2725455e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703775581; x=1704380381; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWY+VhPtywrM9UjKFGLFPRt6KZNfR7DBiYrdgM/yo/c=;
        b=jYFLCpOEnMmXJnlYZhPEIHqQsUJNbtNFjEtE6zt4MqcwmrqXcdx+AaShGttXatpBNn
         z68B0LECbT4LxS2DcLuU6sGX1cMOAUHhChp5h6z7D8W64s070G5xoNquRWphzKWnxxU5
         +G9vTv6OMxPIEIHI505XJtw+EQLEZt+Api/CulMyQh7xa/5olI5HAHiY2dhSD6h1jngr
         E38LymUgsyCM2rCl+JgUsSbZWmwFTBQAJVUTlEmoALF9OWQZfmGaXW4RTNAlSdVGaT+y
         lBug2m41uKPy58SAXB59BH5in1aWkIiPRBxQLh1E3aDpyMPwAXe8W1XhznDZ+wr39uui
         tRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703775581; x=1704380381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWY+VhPtywrM9UjKFGLFPRt6KZNfR7DBiYrdgM/yo/c=;
        b=mif94LJQlOWhB99IuLF6LAfbhmH1l3W42KMQ2gAU3YpH89cCm4xW4XxfmR+qwM8Ysr
         xNT9rMBd06T7JYX/lX8wamZtIa4TVDCceavMrswcm1seLl4s9X+uK3jdtesqRGKEnkJl
         IC1JK5OtSxxE7XrS3Vtid/5VgavqwI6LmJumv20iY0b4RMl2P/WmFdEqL095ppRzoaAC
         oBEaKJXDcxPba5RcvLK0aoD0TJeB6g+yTTfvZuhgHt/l1Ds2R61n5Bm80wPiRsL+h8dV
         WK+JXxR3e11+A9tS/FAZ8SahK/+GGm6DfR/yM9vwHoLd+IWYSzHuOXrwtKe4DnB/8Sjf
         w0gA==
X-Gm-Message-State: AOJu0Yx0FhDhOBH9tfOdLUb3IKbWoqiZV7vLcRiWaT7N1d2OxN+T2SRC
	h3LiT0kef6vI3AjwGll1oEl724wsWMNHnoNh+HE=
X-Google-Smtp-Source: AGHT+IEQSfC3Yp9OxFrP+raXIi+YYKlXUbNIJeUG+2Hi+gH9RE22/qviRRbetot6P47yraqfukmvToSq6UogihVUEP4=
X-Received: by 2002:a05:6512:2348:b0:50e:7d6b:b58f with SMTP id
 p8-20020a056512234800b0050e7d6bb58fmr1247305lfu.247.1703775580686; Thu, 28
 Dec 2023 06:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20231224230934.831-1-alex.kiernan@gmail.com> <17A406727F961131.18684@lists.openembedded.org>
 <40a32888473597abf1b65d85e46efde7ce153d54.camel@linuxfoundation.org>
 <17A4560667D5D860.18684@lists.openembedded.org> <17A4C4AD324050BD.18684@lists.openembedded.org>
In-Reply-To: <17A4C4AD324050BD.18684@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 28 Dec 2023 14:59:28 +0000
Message-ID: <CAO5Uq5SWhee57ZxKq3-DOJ+KWYiCcQHh-542pKY+0y2ygfY5Gg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192983

On Wed, Dec 27, 2023 at 6:46=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Tue, Dec 26, 2023 at 8:59=E2=80=AFAM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Mon, Dec 25, 2023 at 10:02=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2023-12-25 at 08:40 +0000, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Sun, 2023-12-24 at 23:09 +0000, Alex Kiernan wrote:
> > > > > This is the 1.74.1 rust series rebased to include a revert of
> > > > > https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc92=
3f277704d1d08a8ec
> > > > > which I'm pretty sure is what's causing our filename churn. I've =
checked
> > > > > 1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrin=
sics
> > > > > which had the issue) and in both cases we're not generating the d=
irname
> > > > > based prefix - hopefully that means that the interim commits are =
fine
> > > > > too, if not we can do the step back through the commits to find t=
he next
> > > > > issue.
> > > > >
> > > > > I've dropped the zvariant tests as upgrading it isn't useful (sin=
ce it
> > > > > no longer includes git crate dependency) and spurious oe-selftest
> > > > > failures aren't helpful. I guess we need to include either someth=
ing
> > > > > synthetic which tests git crates, or pull in
> > > > > https://github.com/jthornber/thin-provisioning-tools/ from
> > > > > meta-openembedded which includes a live example (though who knows=
 for
> > > > > how long!)
> > > > >
> > > > > Assuming this does actually fix the reproducibility issue, I'll l=
ook at
> > > > > how we fix the issue properly, rather than just reverting the com=
mit
> > > > > which I think is our problem, but I'd like to try and get us back=
 on the
> > > > > rust release train if we can!
> > > > >
> > > > >
> > > > > Alex Kiernan (6):
> > > > >   meta-selftest: Drop zvariant recipe
> > > > >   rust: Upgrade 1.71.1 -> 1.72.0
> > > > >   rust: Upgrade 1.72.0 -> 1.72.1
> > > > >   rust: Upgrade 1.72.1 -> 1.73.0
> > > > >   rust: Upgrade 1.73.0 -> 1.74.0
> > > > >   rust: Upgrade 1.74.0 -> 1.74.1
> > > >
> > > > Sounds like a good plan, I've started a reproducibility test:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/=
4142
> > > >
> > > > With zvariant, we might be better replacing with a synthetic exampl=
e
> > > > for testing purposes?
> > >
> > > That build went green so I ran an a-full to double check and check
> > > everything else:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/637=
4
> > >
> > > Curl ptest warning was the only issue (unrelated) so it also looks
> > > good.
> > >
> > > Looks like you might have tracked down the issue, nice work! :)
> > >
> > > Should I merge this as is or is there something we should do first no=
w
> > > we know where the issue is?
> > >
> >
> > Obviously we need the upstream pieces sorting, but I don't think
> > that's a blocker to merging here. Just ripping out zvariant and all
> > the associated infrastructure I guess wants fixing first, though I
> > think don't we need anything more complicated than:
> >
> > https://github.com/akiernan/hello-rs
> >
> > I'll try and have a look at that later.
> >
>
> The pieces I have are:
>
> https://github.com/akiernan/hello-bin
> https://github.com/akiernan/hello-lib
>
> Which build/work fine, but the swapping it in for the zvariant tests
> fails with things totally unrelated to upgrading rust, which suggest
> we have more stuff to fix, so after two days looking at it, on and
> off, I think just skipping the relevant test is the right thing for
> now.
>

Unsurprisingly this was a complete idiot mistake I'd made... step away
from it and look at it fresh and its obvious why it didn't work! Will
send a v3 w/ a replacement for zvariant.

--=20
Alex Kiernan

