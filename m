Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20248C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 15:12:06 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.185960.1703949120229215349
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 07:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZtJh1S9f;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e67e37661so7927829e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 07:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703949118; x=1704553918; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rfQJgO1yjUpeNl1xoU4KuTSu5qlNmAMpfpiu1Kgzo4=;
        b=ZtJh1S9ft8ZGzGmzAAgEqNxFgCXsJxNmolyq7X/hcKUwnApyfX0w8jIbivAqDczwFl
         RmzGwgJRdga3xrUxHqZAquomXoGroxjKTbQeYrxuToHdmWwFDtJXqcG5cmkC12QkxzMM
         YJyIXW89LiCNkH+K7cx3ZlF5gvTeV3mK8P/X5UgRSi9mZ011iqKZc0A/X4ng/ceWGJ0G
         YcttK7bzq8Mdaidq42w7sDdC78mIddPPkQpLRhIY+yf16p58fX/KafuBOd3wI3JNndQc
         0DY7HnbNUWbulQy1z9VfyirMJdyeXKwt4+HPu1CUxxNb7kwEaHllMzjkl7Ch2h9QfuBt
         LbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703949118; x=1704553918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rfQJgO1yjUpeNl1xoU4KuTSu5qlNmAMpfpiu1Kgzo4=;
        b=GYcy4YqGSPwUQclm0NLkbl37aq1m6rbvPRf66/2Hq824sKtitgU9fOzitdxV+z4vdk
         X6Ey9Sla8Afqq+nLewhrrWT4r8MSHVe3EjMcWTZ7Ap1+tFMxXe7hT/E/2YzTR5nuSvSc
         2cUcqeqS5BxwbVTaqMNQDQpeL1P4vXNgmcqziUH4qNdDnRE2Rm+yzWOVQIA/Zuj84U09
         FtmRVbuJubOoMKMjFZpDZXnpID7Yyow0/vrBSrGGOir7mgni+dZyrX/aFSQGZZEwig1b
         4A5ObZfcKDl301VzHux424JIxSWsueiYUxNy8kNmC8kiWzqHCt74umhyw2lH9yc0rAL2
         Z3lg==
X-Gm-Message-State: AOJu0Yxg9un+MUJIQUzf8ncWv/jE9zR0hDApVAjleuCCPfKH6oiIE7SM
	F6gNcVSVIcHNyTOzJomApaoMy9gB7VDVnvJoiCE=
X-Google-Smtp-Source: AGHT+IGzMYt2942m2cvZijstwBLgQtyzT8tLPU1vTQPxg3drgOA3ySDWZ9feUItNYuUO/uFPQaq3XtJnkB1f5P6ziQ4=
X-Received: by 2002:a19:750d:0:b0:50e:7673:64d4 with SMTP id
 y13-20020a19750d000000b0050e767364d4mr3609668lfe.5.1703949118143; Sat, 30 Dec
 2023 07:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20231229114435.27810-1-alex.kiernan@gmail.com> <3677ac92a92c1709b578467834abb9f392ee4332.camel@linuxfoundation.org>
In-Reply-To: <3677ac92a92c1709b578467834abb9f392ee4332.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 30 Dec 2023 15:11:46 +0000
Message-ID: <CAO5Uq5SpyUVECYEBwXX_1k3fJWAUTL+Ay0_-uvuYytEsL4K7OA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v4 00/10] Stepwise rust upgrade 1.71.1 -> 1.74.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Frederic Martinsons <frederic.martinsons@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 15:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193072

On Sat, Dec 30, 2023 at 11:08=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-12-29 at 11:44 +0000, Alex Kiernan wrote:
> > This is the 1.74.1 rust series rebased to include a revert of
> > https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f2777=
04d1d08a8ec
> > which I'm pretty sure is what's causing our filename churn. I've checke=
d
> > 1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
> > which had the issue) and in both cases we're not generating the dirname
> > based prefix - hopefully that means that the interim commits are fine
> > too, if not we can do the step back through the commits to find the nex=
t
> > issue.
> >
> > Changes in v4:
> > - Mark hello-rs as EXCLUDE_FROM_WORLD as it's not reproducible
> >
> > Changes in v3:
> > - Add hello-rs as a replacement for the tests which used zvariant
> >
> > Changes in v2:
> > - Skip zvariant based test rather than deleting it.
> >
> > Alex Kiernan (10):
> >   devtool: selftest: Fix test_devtool_modify_git_crates_subpath
> >     inequality
> >   devtool: selftest: Fix test_devtool_modify_git_crates_subpath bbappen=
d
> >     check
> >   meta-selftest: hello-rs: Simple rust test recipe
> >   devtool: selftest: Swap to hello-rs for crates testing
> >   zvariant: Drop recipe
> >   rust: Upgrade 1.71.1 -> 1.72.0
> >   rust: Upgrade 1.72.0 -> 1.72.1
> >   rust: Upgrade 1.72.1 -> 1.73.0
> >   rust: Upgrade 1.73.0 -> 1.74.0
> >   rust: Upgrade 1.74.0 -> 1.74.1
>
> Thanks for working through this, I've gone ahead and merged it :)
>
> I am a little worried that:
>
> * the test recipe isn't reproducible

This one concerns me... upstream is clearly trying to get
reproducibility yet we're seeing issues. I worry that we're doing
something which means they're not seeing it.

> * we still have the tests disabled

I think we need to find a way to engage with upstream on this - as far
as I can tell they simply don't run the tests on release code, only on
nightlies, so we're really going off-piste here.

> * the next version looks problematic

Hopefully I've found/fixed the issues - it looks like it's bugs from
poor assumptions which don't hold true in our world and at least one
FIXME in the upstream code :| Just tidying the patches and will send
it shortly.

>
> but I think we're at the point it makes sense to move to the newer
> version.
>

Thanks!



--
Alex Kiernan

