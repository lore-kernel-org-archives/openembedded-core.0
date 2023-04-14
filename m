Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD47C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 07:35:39 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.3792.1681457731850514327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 00:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fnMVbw2Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id v9-20020a05683024a900b006a42896c456so3330339ots.8
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 00:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681457731; x=1684049731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxBWZxrWTQ4AYHNza8n0pp5mgr/sRW+6PKa/UFKCpH4=;
        b=fnMVbw2YWDnRlbFdDCSchJa3qmwclfqXVtPE1VPrK9iIn9zDjEuLueb22YUeuio8pG
         jDzwBJxwSaOVkgFMCe+NH5CVtXcmtkRPQLHMFQSM1N2SWegCyUYQ1R6v6JmtqYWAjSHQ
         GTM/D+dl7EWnBk2/eYeAKKD/yG3rPTKorDJPZldvo9BjxzgWSxUUMCBJwm1Z9Rmm6rnU
         r7ECq36ggOQhwXXWYeBzCF87/iIkruqGngrNBdFgoFVNj7/xCfPYzQtq2AlHVtssQPO0
         kw8L/npiNTW2yMTyCyYEp5pF8Kph7D6Ra0P1s8eVH9n+xWlQWZ3yuc2LpWkwskhAuJkZ
         0dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681457731; x=1684049731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxBWZxrWTQ4AYHNza8n0pp5mgr/sRW+6PKa/UFKCpH4=;
        b=apigEL/wbigr5z4nAfoC8YSBUP7VnMRyrsf26zSA3UFdS8iqhpra4QAAbA1EslcMFe
         cZz4cPlkbgzcWKYhr6aXSdlHSU0tdYK9vGLpJFHCym/AsDUKeTfe+0jidqeXsWSdzUcq
         uAnGhKVirekpCdrHfpsrIwQMDs9c0HY/eIEgxxDOT6EiDfqoYWYVmDZh8v6uddQANA05
         HGugONKsl3/kfDq2mRux2+8xNp2zfjV7joRsTDYY0CmtV5/m3Uy0ORQKgWAducYRpJMr
         nlVcNDzq0oIixf+BrMJ00beXy9rKjHRVVbGOxUtvCEB+zNl8L2C+nfsKSCwPrVsJkdJv
         Z+ug==
X-Gm-Message-State: AAQBX9dDi/hadTXeOO1F07Xt0EPaCQG/w7RZKGBI/6AUXFbMPpzc/pA9
	oFhw11tb4gc7m8xjyFz7JF9l5aMlMze48gThqBg=
X-Google-Smtp-Source: AKy350Y355meCvbA8bkLAgRmjrDWEaIgPcYuf3t3ZABJAzWCxIagr9FKIJU7dQ9V70NnMh9TwHbb5/3uQyYHoHF1pfo=
X-Received: by 2002:a05:6830:1d88:b0:6a4:3176:feac with SMTP id
 y8-20020a0568301d8800b006a43176feacmr1197863oti.2.1681457730947; Fri, 14 Apr
 2023 00:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230413055432.1977413-1-raj.khem@gmail.com> <20230413055432.1977413-2-raj.khem@gmail.com>
 <033c81e5bd6048afcd3bf8fbee335dc52a60d429.camel@linuxfoundation.org>
 <CAMKF1soWt0bC6S+yAwHnWeTWUQwA7P+Pp42RzE-_LVc-_nY_rg@mail.gmail.com>
 <35ba45bfc40c7d19d2ddc708007110b088f45753.camel@linuxfoundation.org>
 <CAMKF1soeEerjHoXR71gV2S7F3qdBdAaRF8EipoAu8jwPt7+Ngw@mail.gmail.com> <2d4d94781a0c5e73e642515a67691051e790bbe6.camel@linuxfoundation.org>
In-Reply-To: <2d4d94781a0c5e73e642515a67691051e790bbe6.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Apr 2023 00:35:05 -0700
Message-ID: <CAMKF1sqKoAmgAMY0tJmEOAt5pVKn_q3vu-=mZ6k0BWb9sCYTAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gawk: Fix ptests on musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 07:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179991

On Thu, Apr 13, 2023 at 9:06=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-04-13 at 08:29 -0700, Khem Raj wrote:
> > On Thu, Apr 13, 2023 at 6:44=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2023-04-13 at 06:16 -0700, Khem Raj wrote:
> > > > On Thu, Apr 13, 2023 at 3:14=E2=80=AFAM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, 2023-04-12 at 22:54 -0700, Khem Raj wrote:
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > ---
> > > > > >  ...0001-Provide-fixes-for-tests-on-musl.patch | 73 +++++++++++=
++++++++
> > > > > >  meta/recipes-extended/gawk/gawk_5.2.1.bb      |  7 +-
> > > > > >  2 files changed, 77 insertions(+), 3 deletions(-)
> > > > > >  create mode 100644 meta/recipes-extended/gawk/gawk/0001-Provid=
e-fixes-for-tests-on-musl.patch
> > > > > >
> > > > > > diff --git a/meta/recipes-extended/gawk/gawk/0001-Provide-fixes=
-for-tests-on-musl.patch b/meta/recipes-extended/gawk/gawk/0001-Provide-fix=
es-for-tests-on-musl.patch
> > > > > > new file mode 100644
> > > > > > index 0000000000..4ff2466c0e
> > > > > > --- /dev/null
> > > > > > +++ b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-te=
sts-on-musl.patch
> > > > > > @@ -0,0 +1,73 @@
> > > > > > +From 95bcf4397b6f727208f3c627b7d00dacec406d02 Mon Sep 17 00:00=
:00 2001
> > > > > > +From: Khem Raj <raj.khem@gmail.com>
> > > > > > +Date: Wed, 12 Apr 2023 21:57:18 -0700
> > > > > > +Subject: [PATCH] Provide fixes for tests on musl
> > > > > > +
> > > > > > +Fixes rebt8b1 and regx8bit
> > > > > > +Disable clos1way6 [1]
> > > > > > +
> > > > > > +Disable commas and backsmalls1, they do not work
> > > > > > +with musl-locales somehow even though we do isntall
> > > > > > +en_US.UTF-8 on target
> > > > > > +
> > > > > > +[1] https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg000=
05.html
> > > > > > +
> > > > > > +Upstream-Status: Inappropriate [musl-specific]
> > > > > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > +---
> > > > > > + test/Maketests | 11 ++++-------
> > > > > > +
> > > > >
> > > > > Carrying a patch like this makes me a bit nervous as:
> > > > >
> > > > > a) it is only applied for musl so it makes recipe upgrade testing=
 a
> > > > > nightmare
> > > > >
> > > > > b) there doesn't appear to be any path to upstream it, we'd just =
have
> > > > > to carry it indefinitely.
> > > > >
> > > > > c) the reasons for the failure don't seem to be understood.
> > > >
> > > > reasons are clear,  these tests need full locale support which we d=
o
> > > > not have with musl.
> > >
> > > The above says something quite different to what the patch says:
> > >
> > > "they do not work with musl-locales somehow"
> >
> > yeah the metadata patch subject should be improved to say disable tests
>
> That would be clearer, yes.
>
> > >
> > > which sounds like nobody has looked into it.
> >
> > yes, and my localedata knowledge is limited to root cause this further =
sadly.
>
> Fair enough, we just need to be clear about that.
>
> > > > > Is there something we can do to avoid having to carry this
> > > > > indefinitely?
> >
> > You can do sed operations from the recipe. I don't know how that will b=
e better
> > than patch. btw. we are already carrying another patch to disable other=
 tests
> > because I guess they fail on Autobuilder on stress but not always,
> > because they worked
> > fine on my ptest run.
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-extend=
ed/gawk/gawk/remove-sensitive-tests.patch
> >
> > Do we have plans to address this with upstream as well ?
>
> The difference between that patch and the one proposed is that the one
> above:
>
> a) is unconditional
> b) is clear and simple, it just deletes the tests
>
> This means when the recipe is upgraded, the patch is obvious and
> therefore straight forward to port.
>
> Ideas:
>
> Can we simplify the musl one to delete the tests in question?
>
> Could we get a patch upstream which allowed us to disable tests from
> the commandline to improve both cases?
>
> I think we should be able to work something out but I just wanted to
> make it clear the patch as it stands isn't clear enough and will cause
> maintenance issues so we need to work out something better.
>

if you run make check on musl/emux86-64 then we only get one failure clos1w=
ay6
and others pass. Which matches alpine. However, I think the way ptest is co=
pying
partially the test environment seems to be the cause. I tried to pass LANG=
=3DC etc
but it did not help. Secondly, there are some surgeries the run-ptest
is also doing
which makes the test environment quite unique to yocto ptests.

Its fine to ignore this patch. I have already drove into weeds trying
to fix it, not worth it.

> Cheers,
>
> Richard
>
>
> > > > > Out of interest did alpine do anything for this?
> > > >
> > > > they have patches.
> > >
> > > The same as ours or different? Was there any discussion with upstream
> > > on this?
> >
> > There is one failure which is common and I have quoted upstream discuss=
ion
> > others are not. I dont have alpine install handy to try it out quickly
> > to confirm.
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> >
>

