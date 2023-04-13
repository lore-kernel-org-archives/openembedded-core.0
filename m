Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7748C77B73
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 15:30:03 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.16640.1681399799693071299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 08:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Z2LwFKQY;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id x22-20020a9d6296000000b006a42c37ddcdso2017750otk.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681399799; x=1683991799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBwnWOSY6hArLxPJ4TEe5awA4/XcXl3WSri7Zz6Tjkg=;
        b=Z2LwFKQY2FiZjSeR8pas2NEFR1IL9xHmdhLT6WXa5R9AryNsOlYLgtCGMDdZb5Cszg
         vn5xbkjNT8Fm7OAFV+yyYl62gKr3mrSawZTufoJYUDI0sWPE8IjAXvEzlUxDOtn9iYjP
         GLsoUKUOJZpOu7sMZY5z8jz5ONqhDvyb80D60wlVIImf9JzLrHtsRKKFLnx2Cp56VShv
         RG36hi48NctNKvJv9cwQbXNnfwpvNGtXNMeZmI/6N05JaldNXXvSQ+3aTLAysfCvkYrP
         nSE0rgS9qaQYRpPN6R9SPVmZLRgt3dGMYDQ9E5hcRIqV6qCEVc+NATE5AD04fvOwnah1
         FapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681399799; x=1683991799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBwnWOSY6hArLxPJ4TEe5awA4/XcXl3WSri7Zz6Tjkg=;
        b=aO63NDGlVtD2WigWuQj/uHxBkNRreI1tM6RU7Ua7hrNaCd6iieRa1xVl33FvhWnaK0
         dQbFI1EDdcV29qkNCyfBMnHPUysRlNAeYpURCZa95CDgtPPYgqCWIRlIg91VoDbnEri5
         wzn4OruQxPYg7vqZGDd72kzzc2XPV3mL4wXvFx2w2urHUYxks/Nf4KQovFSScWI5e2Jc
         Q7dFPy0G4iMaeiZXtK6u4oL67Xsr5sto46ifrfYj8Rg1d2b0hd9GdudsFPCwG3K61/5l
         ZbmaiRcTPHVikaJEmeXcD2Z/iWAm85gLVPrksgWB8df3BEcbCJ8GAxYRfLRzoM0TcUUa
         06WQ==
X-Gm-Message-State: AAQBX9eJ67PFfrMzoL4UwymCkdqPuVmsWf/6NqY0of05tqrtOUgdisAT
	0rfosFhQhKTeyt2jw3h+ytkDXEHK3oXgJu6GtI9ECEq0iK4=
X-Google-Smtp-Source: AKy350bi/7gHZPguho3dYXC9HOwHHwl1uQ4ERMsNRnI0dvAlcQYKxQ582uE3CH2uG+Ic3ccb1nxaHIEK/rOLTfvWTOI=
X-Received: by 2002:a9d:64da:0:b0:6a3:8d70:b404 with SMTP id
 n26-20020a9d64da000000b006a38d70b404mr621966otl.2.1681399798682; Thu, 13 Apr
 2023 08:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230413055432.1977413-1-raj.khem@gmail.com> <20230413055432.1977413-2-raj.khem@gmail.com>
 <033c81e5bd6048afcd3bf8fbee335dc52a60d429.camel@linuxfoundation.org>
 <CAMKF1soWt0bC6S+yAwHnWeTWUQwA7P+Pp42RzE-_LVc-_nY_rg@mail.gmail.com> <35ba45bfc40c7d19d2ddc708007110b088f45753.camel@linuxfoundation.org>
In-Reply-To: <35ba45bfc40c7d19d2ddc708007110b088f45753.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Apr 2023 08:29:32 -0700
Message-ID: <CAMKF1soeEerjHoXR71gV2S7F3qdBdAaRF8EipoAu8jwPt7+Ngw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gawk: Fix ptests on musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 15:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179980

On Thu, Apr 13, 2023 at 6:44=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-04-13 at 06:16 -0700, Khem Raj wrote:
> > On Thu, Apr 13, 2023 at 3:14=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2023-04-12 at 22:54 -0700, Khem Raj wrote:
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  ...0001-Provide-fixes-for-tests-on-musl.patch | 73 +++++++++++++++=
++++
> > > >  meta/recipes-extended/gawk/gawk_5.2.1.bb      |  7 +-
> > > >  2 files changed, 77 insertions(+), 3 deletions(-)
> > > >  create mode 100644 meta/recipes-extended/gawk/gawk/0001-Provide-fi=
xes-for-tests-on-musl.patch
> > > >
> > > > diff --git a/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for=
-tests-on-musl.patch b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-f=
or-tests-on-musl.patch
> > > > new file mode 100644
> > > > index 0000000000..4ff2466c0e
> > > > --- /dev/null
> > > > +++ b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-=
on-musl.patch
> > > > @@ -0,0 +1,73 @@
> > > > +From 95bcf4397b6f727208f3c627b7d00dacec406d02 Mon Sep 17 00:00:00 =
2001
> > > > +From: Khem Raj <raj.khem@gmail.com>
> > > > +Date: Wed, 12 Apr 2023 21:57:18 -0700
> > > > +Subject: [PATCH] Provide fixes for tests on musl
> > > > +
> > > > +Fixes rebt8b1 and regx8bit
> > > > +Disable clos1way6 [1]
> > > > +
> > > > +Disable commas and backsmalls1, they do not work
> > > > +with musl-locales somehow even though we do isntall
> > > > +en_US.UTF-8 on target
> > > > +
> > > > +[1] https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.h=
tml
> > > > +
> > > > +Upstream-Status: Inappropriate [musl-specific]
> > > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > +---
> > > > + test/Maketests | 11 ++++-------
> > > > +
> > >
> > > Carrying a patch like this makes me a bit nervous as:
> > >
> > > a) it is only applied for musl so it makes recipe upgrade testing a
> > > nightmare
> > >
> > > b) there doesn't appear to be any path to upstream it, we'd just have
> > > to carry it indefinitely.
> > >
> > > c) the reasons for the failure don't seem to be understood.
> >
> > reasons are clear,  these tests need full locale support which we do
> > not have with musl.
>
> The above says something quite different to what the patch says:
>
> "they do not work with musl-locales somehow"

yeah the metadata patch subject should be improved to say disable tests

>
> which sounds like nobody has looked into it.

yes, and my localedata knowledge is limited to root cause this further sadl=
y.

>
> > > Is there something we can do to avoid having to carry this
> > > indefinitely?

You can do sed operations from the recipe. I don't know how that will be be=
tter
than patch. btw. we are already carrying another patch to disable other tes=
ts
because I guess they fail on Autobuilder on stress but not always,
because they worked
fine on my ptest run.

https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/g=
awk/gawk/remove-sensitive-tests.patch

Do we have plans to address this with upstream as well ?

> > >
> > > Out of interest did alpine do anything for this?
> >
> > they have patches.
>
> The same as ours or different? Was there any discussion with upstream
> on this?

There is one failure which is common and I have quoted upstream discussion
others are not. I dont have alpine install handy to try it out quickly
to confirm.

>
> Cheers,
>
> Richard
>

