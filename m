Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C8CCD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 11:28:36 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.8615.1712316513454539296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 04:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cePE0TMa;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d6eedf3e99so30662441fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 04:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712316512; x=1712921312; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbzQIruk2pJ8jgVwq1D5vzNblrJThrM+2exgxk6IWKg=;
        b=cePE0TMalpygo+vP2tFVlxxaJdEeTE8EJILMZ3YubR8OMObo4qaN5gp6qQXDNyT61j
         HrYqEnJ7VNaNYGIQdWkaPd9ShhYLrsXXLZOklK/91wcrFwU5mcaoBIqZFOOQXqw6Pih5
         rW6VRicsVMCeJrngYXf0U2U31LX3i2+wYpJWIEybPXaVN7FCqhaFFoXRioFit41EFLVg
         VwFKxuaWWI+6UjL1/sVEgWm2p67whxDuHMNxTV3JHPD3+IFpmwQOHUpL+/Q7skV+xXaq
         YLkqGOlhjbUkNTgi9tlgllv19G7PNzBpi8+VICo8RATmZy82R4OM54Kf3popi0SPl/TC
         LgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712316512; x=1712921312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbzQIruk2pJ8jgVwq1D5vzNblrJThrM+2exgxk6IWKg=;
        b=FCDDzHr+l16eeJPKLWLjHK+74NjLGP72baImcUmb6uLFXuEjWPBLnwk+w11EG/Hiu4
         exk3wfCLfyfu2nZqchFn/wv7caxs3zWbtWlMePb8+hf/YdbprFqeVQOPiOFheLfeYBw1
         lEocj4k1IhL1wx3N+zQurrMfwdoxrg4qcW2YroIe7cSNpQiBSy8PNcIWb8MGz7A1Nmp8
         FxWDJn2Psi1Jg/j0g5CEzclcS3jnJuwduLj6HHxaSfnmCshLOWN3nzyGjWv6Z3hsglR3
         4LmhgypKUEsdQ8LPzu1o2XPae5GsqXY8QRwEjnbjxuBggfazLSfTBs1sG8uPV/L3ehHQ
         l+bA==
X-Gm-Message-State: AOJu0Yxf11zY/stMFsoQ/Mi38y0z6Rw8Ww3sTzrX9HOYiue/RTj/w5HF
	ud8YW+iAAhBelrtNkSz1dKkR6fU68g1gwdAoh77QG5Vs3cuzInfKb14ZKhi3p+ZeCwJVrg9O72i
	9n6oMq90nWl6P3IT2opRY4O6pOlA=
X-Google-Smtp-Source: AGHT+IH2JqB+fDIYB1M0oKbEN3s1XzoAcIIwYdmo1Npyj8/nq5e6cyCx8kSGbIBGRmDcBCzHERWbeUus9TuKxrA7jAI=
X-Received: by 2002:a2e:be06:0:b0:2d8:6672:ff01 with SMTP id
 z6-20020a2ebe06000000b002d86672ff01mr649920ljq.24.1712316511226; Fri, 05 Apr
 2024 04:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org>
In-Reply-To: <6447.1712221622103634934@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 5 Apr 2024 12:28:20 +0100
Message-ID: <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 11:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197983

On Thu, Apr 4, 2024 at 10:07=E2=80=AFAM Yash Shinde via lists.openembedded.=
org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On Wed, Apr 3, 2024 at 05:51 PM, Alex Kiernan wrote:
>
> Hi Sundeep (or anyone else with insight on this!)
>
> How do you go about debugging rust oe-selftest failures? I've bumped
> everything up to 1.77 (https://github.com/akiernan/poky) but
> oe-selftest fails for reasons that aren't immediately obvious to me...
>
> https://gist.github.com/akiernan/6cc6131c1ec3af866098a9318679cf1b
>
> Any clues?
>
> --
> Alex Kiernan
>
>
>
>
> Hi Alex,
>
> I faced the same errors when I was working on to upgrade rust from 1.75 t=
o 1.76. I discussed it with rust upstream here, https://github.com/rust-lan=
g/rust/issues/122075 and the following change solves those failures,
>
> https://github.com/rust-lang/rust/issues/122075#issuecomment-1985153524
>
> PR- https://github.com/rust-lang/rust/pull/122205/commits/5aece7fad06baaa=
745784d118db862b3e3ccf7f8
>
>
>
>
>
> After this change was backported to poky, the rust build was successful b=
ut it was seen that not all the tests are executed.
>
> While discussing upstream, it was known that removing the --doc option fr=
om python3 src/bootstrap/bootstrap.py test --exclude<some excluded test cas=
es list> --doc --no-fail-fast --bless --target x86_64-poky-linux-gnu  cmd i=
n oeqa/selftest/cases/rust.py file execute the other tests also.
>
>
>
>
>
> But, while doing so another set of failures are observed as mentioned in =
https://github.com/rust-lang/rust/issues/122285
>
> Complete log using --doc option-  https://gist.github.com/Yashinde145/7db=
6bd4a064021bf756b0c0dd6c8777c
>
> Complete log without using --doc option-  https://gist.github.com/Yashind=
e145/036a934f0523307859f7c855b83ecfd6 (this file is truncated in gist due t=
o large size, please see Complete raw file)
>
> I am not very familiar to these failures but  trying to understand them.
>

Feels like you're way ahead of me. I'll have a bit more of a poke at
it when I've some time, but it feels like we may be mostly waiting on
upstream (and a big +1 for getting them engaged!)

--=20
Alex Kiernan

