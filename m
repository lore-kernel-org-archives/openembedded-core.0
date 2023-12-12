Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3C6C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 17:43:35 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.2803.1702403013030282973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 09:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XGj6tQEN;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ca208940b3so75765811fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 09:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702403011; x=1703007811; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1P/liK+3WvDIpUOIBl5I1s7jFxbMteCD05Mpi6d4sk=;
        b=XGj6tQENGFiLWVIKktUv16rLBxlgyIGsn+9adjTg4vOl4UKqtBKF1fUv2VbNWSGa++
         OFIJ/cQfFCVSQ2TyVz3fKBWEYoq4QWDQlVclwT0o0MwisF0y8eE29n3kWByQmZsHhhSy
         uaRbvACjTtCsrax6u7RM2LO3AbWt4eAmF42TADH+t/+I48RdihoF4yw7YgIerF1EjcVG
         6Y3oZ5/RCuUbLhTon3Q5xSCIIhSE/wDIUftKZGOwX+awFyPBhNisejh/7pcfAj5TiFCj
         9PRJYGnwpgzqZopekJD/e9r48uWhD57Tn27FxCs2M6iTWFPSfJAk6LcjFWkQ9OatPWf9
         JcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702403011; x=1703007811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1P/liK+3WvDIpUOIBl5I1s7jFxbMteCD05Mpi6d4sk=;
        b=azt5FPf5TLpXAJQU9Ic5NvcbbCeRUr8nZh3UBlNucAui0OL8OeJd8Nf8R0BeYMoG2n
         YsYcq5VakLvBFprliGL5kTP719wPGHyLBnrxlYZIwnUloA5d7TYtm/AbkFcwZqmJ5LAm
         1rvmrK3VvDb8Qxz1A5N44cahA2St2XRoYH6UY0TE2ybi62AaEKiNoYskwXNdfoDeep/l
         bj1HIgz4u8jleN7/ZjOdlz80vUHqQbCdTfe9XM4Pfyh8cW1P2HHf6uc8/Czi6A0wDX89
         PX10mzmOCvrKgwZx5qq1sUe+KVWcSrtHRpb8LwMS93lCDQqMrjDVElJVeV4Lq8qE0jrj
         tuvA==
X-Gm-Message-State: AOJu0Yz3v4VxYrEuMugPb7fLxcxZpTAl7yuo5jwQ6nPpl1j2vD4iP+Zi
	hKZVpps6u2JSWKd/XtwGYebUxkKUj9jd8FRO6/w=
X-Google-Smtp-Source: AGHT+IESrEFVyS78BVq+ey/1uQq9diVOf9wXAdfZM3Db/iXhWfwL90A8aISPs+gA9QUIwYKj70TefkLJjiCJP0nOm/U=
X-Received: by 2002:a05:651c:106f:b0:2cc:30dd:16b8 with SMTP id
 y15-20020a05651c106f00b002cc30dd16b8mr403547ljm.17.1702403011090; Tue, 12 Dec
 2023 09:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-7-alex.kiernan@gmail.com>
 <20231209121845ed0bfb0d@mail.local> <179F2EEFE21E3032.26830@lists.openembedded.org>
 <CAO5Uq5QA+YaNQtOgtzjNRNLc4_YBG9CxNhopgvqie6OBAo-HOQ@mail.gmail.com>
 <7cdd0aca-025f-4561-96a0-87c7fd02fbdd@windriver.com> <0fd78419-41d3-4337-b378-76d337fd2e29@windriver.com>
 <17A023B3B3F04048.13329@lists.openembedded.org>
In-Reply-To: <17A023B3B3F04048.13329@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 12 Dec 2023 17:43:18 +0000
Message-ID: <CAO5Uq5RRBtJOY5Cwif2Y-UUM-VSNkTTATuKUVCg0NGHHg7i9Hw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 7/7] rust: Upgrade 1.73.0 -> 1.74.0
To: alex.kiernan@gmail.com
Cc: randy.macleod@windriver.com, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 17:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192240

On Tue, Dec 12, 2023 at 4:51=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Tue, Dec 12, 2023 at 4:27=E2=80=AFPM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > On 2023-12-12 11:25 a.m., Randy MacLeod wrote:
> >
> > On 2023-12-12 5:41 a.m., Alex Kiernan via lists.openembedded.org wrote:
> >
> > On Sat, Dec 9, 2023 at 2:06=E2=80=AFPM Alex Kiernan via lists.openembed=
ded.org
> > <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Sat, Dec 9, 2023 at 12:18=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello Alex,
> >
> > rust 1.74.0 is not reproducible:
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rf=
bproj4/packages/diff-html/
> >
> > Thanks, I think :)
> >
> > One observation, which might be useful, these failures are all inside
> > the same module src/llvm-project/compiler-rt/lib/builtins which are
> > just a bunch of intrinsics. And as far as I can see it looks like it's
> > just the object name mangling that's not reproducible.
> >
> > FYI:
> >
> > In the weekly YP tech call, we talked about Rust and Richard said that =
he'd merge
> > 1.71 to master since it's progress and it unblocks some ptest works tha=
t Tim was working on.
> >
> > We can then just jump directly from 1.71 to 1.74 if ( when! ) we can ma=
ke that reproducible.
> >
> > Or even  to rust-1.74.1:
> >
> >    https://blog.rust-lang.org/2023/12/07/Rust-1.74.1.html
> >
>
> Yeah, I did 1.74.1 earlier today
> (https://github.com/akiernan/poky/commit/f408e74e37ac8cd6d0e4d9715317f69a=
039ad50f)
> - can post a patch for that if we want to give it a whirl? There's
> definitely some reproducibility fixes in there (e.g.
> https://github.com/rust-lang/rust/issues/112586) but I'm not convinced
> any of them are what we're seeing (which appear to really be in pieces
> of LLVM).
>

I just realised that because we now have two consecutive versions,
diffing the 1.71.1...1.72.0 trees was feasible... for the llvm-project
submodule, the changes are tiny (10 files, mostly RISCV specific or
tests, nothing that looks even slightly like the issue we're seeing).
So I suspect wherever the problem comes from its not actually inside
here.

--=20
Alex Kiernan

