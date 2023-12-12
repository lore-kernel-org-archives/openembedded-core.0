Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16699C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 16:51:55 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.1424.1702399913466564470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 08:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h096Rd6s;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ca09601127so79713161fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 08:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702399912; x=1703004712; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a46EjRPdYQD2SEqcigsmGA9Y0taMFLTq46RBP4/HOGg=;
        b=h096Rd6s8u9bfEa352GLPOwE36jkb6+3JOUwG7CNOHoByux5HihAgXAZSgE6TiwLsy
         tQOeWk8JyVMAt3Thm0osJ4s3TJR+t4HXhNcjjex1gabgQU9e7Wa4DgEEhvyBm4vgNtsD
         UmLLZFzlyHW2om61Zdd7QrmTQSDDNL2hw7y2vevfWbg4NPMlzwbWipWfxQyYJYmmCkZq
         lO3I215Cr4UIBN8EHinCteviJsMoGJ/zvskmTb8OI+iIDFexatLxJ8ulFsArwJ0MnY50
         I3TeUmYF/YUJtCz+ya6ML6PvaGjNnMcLKb8LVFE/7kNv6b9Ve4fKUnSJFLfk3KUQpWVG
         l6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702399912; x=1703004712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a46EjRPdYQD2SEqcigsmGA9Y0taMFLTq46RBP4/HOGg=;
        b=ceeS1J1mdQPsakE+qGmjMNgWWjaDNRMFo4OPD+S8+tbeI/ZI8eNXKr1M9Tn+JqAbM1
         NSmsdivBfXsbNyKh2Be0L/Ny+e9aYz7XozPWNVFDUufffrdc59bDoYwBc302S4ZIhvsn
         EUqcJQIDXNQ5yarEcR5mEjLzJ6KYbqnu6NMXvNr4uJ0kBnWMmsYvhOMO8JgU9uIjF824
         72635IVDUjCgoRbwcYyiwpejRmHcIRxUOgsbelriYnU6TBP0Nqtb5X3kH8n/c4zDtG/b
         esz+kmVEiNMYeY9Hh/FFUlUwse8sw0/JlgTs0AIqoAhK/VsopNo3zpW7o7YZ2UYULFPm
         n7lg==
X-Gm-Message-State: AOJu0YxcILRgk0BrP/M7vLjiAZYv3kgAkt3CP2MPvOcLP92e2BviAPRa
	k11ir1cX73iMyNdM8RYuMVcwqFtHkfIH5Oz8lVg=
X-Google-Smtp-Source: AGHT+IE11tQT95RHQNG+mDoJpHV3BoN56Ab3xoROcAX4+gP9Ss/hm6kb6I/UMgmCVrzWh+kY6sUbiu8DK8igqVzHa3Q=
X-Received: by 2002:a05:651c:983:b0:2cb:54ac:e712 with SMTP id
 b3-20020a05651c098300b002cb54ace712mr3729892ljq.39.1702399911357; Tue, 12 Dec
 2023 08:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-7-alex.kiernan@gmail.com>
 <20231209121845ed0bfb0d@mail.local> <179F2EEFE21E3032.26830@lists.openembedded.org>
 <CAO5Uq5QA+YaNQtOgtzjNRNLc4_YBG9CxNhopgvqie6OBAo-HOQ@mail.gmail.com>
 <7cdd0aca-025f-4561-96a0-87c7fd02fbdd@windriver.com> <0fd78419-41d3-4337-b378-76d337fd2e29@windriver.com>
In-Reply-To: <0fd78419-41d3-4337-b378-76d337fd2e29@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 12 Dec 2023 16:51:39 +0000
Message-ID: <CAO5Uq5SpbNihNp=7VqgKfnYwRc77A_6DDe_YJ=nykKJHRbs8Jg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 7/7] rust: Upgrade 1.73.0 -> 1.74.0
To: randy.macleod@windriver.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 16:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192237

On Tue, Dec 12, 2023 at 4:27=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2023-12-12 11:25 a.m., Randy MacLeod wrote:
>
> On 2023-12-12 5:41 a.m., Alex Kiernan via lists.openembedded.org wrote:
>
> On Sat, Dec 9, 2023 at 2:06=E2=80=AFPM Alex Kiernan via lists.openembedde=
d.org
> <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sat, Dec 9, 2023 at 12:18=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>
> Hello Alex,
>
> rust 1.74.0 is not reproducible:
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rfbp=
roj4/packages/diff-html/
>
> Thanks, I think :)
>
> One observation, which might be useful, these failures are all inside
> the same module src/llvm-project/compiler-rt/lib/builtins which are
> just a bunch of intrinsics. And as far as I can see it looks like it's
> just the object name mangling that's not reproducible.
>
> FYI:
>
> In the weekly YP tech call, we talked about Rust and Richard said that he=
'd merge
> 1.71 to master since it's progress and it unblocks some ptest works that =
Tim was working on.
>
> We can then just jump directly from 1.71 to 1.74 if ( when! ) we can make=
 that reproducible.
>
> Or even  to rust-1.74.1:
>
>    https://blog.rust-lang.org/2023/12/07/Rust-1.74.1.html
>

Yeah, I did 1.74.1 earlier today
(https://github.com/akiernan/poky/commit/f408e74e37ac8cd6d0e4d9715317f69a03=
9ad50f)
- can post a patch for that if we want to give it a whirl? There's
definitely some reproducibility fixes in there (e.g.
https://github.com/rust-lang/rust/issues/112586) but I'm not convinced
any of them are what we're seeing (which appear to really be in pieces
of LLVM).

--=20
Alex Kiernan

