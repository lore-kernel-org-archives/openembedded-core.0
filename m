Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CC1C77B71
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 16:06:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.17585.1681402003244150924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 09:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=e5ZEY6Ha;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id s12so6251986wrb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681402001; x=1683994001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j7s7C0U7/6zWc6D6ThMfmFuUtM0nkXVL5SXosjbifxs=;
        b=e5ZEY6Haez+7F+nx0jMMxwL4Aetm1QSu3281hkR7f5MjXPzisLbO2r6i2mQDtnBZuM
         woJUQnlh/q86JOt84lGA4aixXhnrkJXkDIteLwLoteD1ENSSCvro6UWrXmChPqY9aIe7
         nT5Qui5PNA8YBO12Y9tswhcWrWRGazq+DME2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402001; x=1683994001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7s7C0U7/6zWc6D6ThMfmFuUtM0nkXVL5SXosjbifxs=;
        b=WrWHkDKabSKp/piEPKUNue4WHZNaYMhUaeDvGKKuNEMl3oT6/eFwUFS7D/sgWGc/Cr
         J41f2Kln36AticJLd30g5igC9jarE6pwtWaymtf9aOd087m1pYdmXj91mEo6p+hLcvz/
         CrqpUTkmkQ+P1q+ckSUHgRsRBtKMjwMx7id151F5Roi63kKRiFFVlvwkNLB46yoJInU7
         w4weQMsMDjyUnW/vAUk0dqylNAehPhOYEH/tPb6A50WzioefiK7fY+oSPYAXJFwEiO5w
         b8+Qq3yB468cLCYHFaon4KPg9OdLvGvJR4riay3dU/u76DJj83juEk72648zbXaN66tA
         nBcQ==
X-Gm-Message-State: AAQBX9cAFZBgWBMk2DzSlp78Vz7coG9sWklhyhgrlqiX5rt/AdCp6vr+
	VD5VSTULzWdPMppiLqN9LYlD3Q==
X-Google-Smtp-Source: AKy350bf33P7AbxhA3TwOebf/hQyBQd4y7J67r1Apf2mDROLEGpXqv1A5hntSWHFn/t/P4HqJYF1Kw==
X-Received: by 2002:a05:6000:10cf:b0:2e5:1ee3:df77 with SMTP id b15-20020a05600010cf00b002e51ee3df77mr1913143wrx.46.1681402001585;
        Thu, 13 Apr 2023 09:06:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b4d4:7e31:434a:3f40? ([2001:8b0:aba:5f3c:b4d4:7e31:434a:3f40])
        by smtp.gmail.com with ESMTPSA id l20-20020a7bc454000000b003ed2276cd0dsm2165457wmi.38.2023.04.13.09.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:06:41 -0700 (PDT)
Message-ID: <2d4d94781a0c5e73e642515a67691051e790bbe6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gawk: Fix ptests on musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2023 17:06:40 +0100
In-Reply-To: <CAMKF1soeEerjHoXR71gV2S7F3qdBdAaRF8EipoAu8jwPt7+Ngw@mail.gmail.com>
References: <20230413055432.1977413-1-raj.khem@gmail.com>
	 <20230413055432.1977413-2-raj.khem@gmail.com>
	 <033c81e5bd6048afcd3bf8fbee335dc52a60d429.camel@linuxfoundation.org>
	 <CAMKF1soWt0bC6S+yAwHnWeTWUQwA7P+Pp42RzE-_LVc-_nY_rg@mail.gmail.com>
	 <35ba45bfc40c7d19d2ddc708007110b088f45753.camel@linuxfoundation.org>
	 <CAMKF1soeEerjHoXR71gV2S7F3qdBdAaRF8EipoAu8jwPt7+Ngw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 16:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179982

On Thu, 2023-04-13 at 08:29 -0700, Khem Raj wrote:
> On Thu, Apr 13, 2023 at 6:44=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Thu, 2023-04-13 at 06:16 -0700, Khem Raj wrote:
> > > On Thu, Apr 13, 2023 at 3:14=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Wed, 2023-04-12 at 22:54 -0700, Khem Raj wrote:
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > >  ...0001-Provide-fixes-for-tests-on-musl.patch | 73 +++++++++++++=
++++++
> > > > >  meta/recipes-extended/gawk/gawk_5.2.1.bb      |  7 +-
> > > > >  2 files changed, 77 insertions(+), 3 deletions(-)
> > > > >  create mode 100644 meta/recipes-extended/gawk/gawk/0001-Provide-=
fixes-for-tests-on-musl.patch
> > > > >=20
> > > > > diff --git a/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-f=
or-tests-on-musl.patch b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes=
-for-tests-on-musl.patch
> > > > > new file mode 100644
> > > > > index 0000000000..4ff2466c0e
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-test=
s-on-musl.patch
> > > > > @@ -0,0 +1,73 @@
> > > > > +From 95bcf4397b6f727208f3c627b7d00dacec406d02 Mon Sep 17 00:00:0=
0 2001
> > > > > +From: Khem Raj <raj.khem@gmail.com>
> > > > > +Date: Wed, 12 Apr 2023 21:57:18 -0700
> > > > > +Subject: [PATCH] Provide fixes for tests on musl
> > > > > +
> > > > > +Fixes rebt8b1 and regx8bit
> > > > > +Disable clos1way6 [1]
> > > > > +
> > > > > +Disable commas and backsmalls1, they do not work
> > > > > +with musl-locales somehow even though we do isntall
> > > > > +en_US.UTF-8 on target
> > > > > +
> > > > > +[1] https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005=
.html
> > > > > +
> > > > > +Upstream-Status: Inappropriate [musl-specific]
> > > > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > +---
> > > > > + test/Maketests | 11 ++++-------
> > > > > +
> > > >=20
> > > > Carrying a patch like this makes me a bit nervous as:
> > > >=20
> > > > a) it is only applied for musl so it makes recipe upgrade testing a
> > > > nightmare
> > > >=20
> > > > b) there doesn't appear to be any path to upstream it, we'd just ha=
ve
> > > > to carry it indefinitely.
> > > >=20
> > > > c) the reasons for the failure don't seem to be understood.
> > >=20
> > > reasons are clear,  these tests need full locale support which we do
> > > not have with musl.
> >=20
> > The above says something quite different to what the patch says:
> >=20
> > "they do not work with musl-locales somehow"
>=20
> yeah the metadata patch subject should be improved to say disable tests

That would be clearer, yes.

> >=20
> > which sounds like nobody has looked into it.
>=20
> yes, and my localedata knowledge is limited to root cause this further sa=
dly.

Fair enough, we just need to be clear about that.

> > > > Is there something we can do to avoid having to carry this
> > > > indefinitely?
>=20
> You can do sed operations from the recipe. I don't know how that will be =
better
> than patch. btw. we are already carrying another patch to disable other t=
ests
> because I guess they fail on Autobuilder on stress but not always,
> because they worked
> fine on my ptest run.
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended=
/gawk/gawk/remove-sensitive-tests.patch
>=20
> Do we have plans to address this with upstream as well ?

The difference between that patch and the one proposed is that the one
above:

a) is unconditional
b) is clear and simple, it just deletes the tests

This means when the recipe is upgraded, the patch is obvious and
therefore straight forward to port.

Ideas:

Can we simplify the musl one to delete the tests in question?

Could we get a patch upstream which allowed us to disable tests from
the commandline to improve both cases?=20

I think we should be able to work something out but I just wanted to
make it clear the patch as it stands isn't clear enough and will cause
maintenance issues so we need to work out something better.

Cheers,

Richard


> > > > Out of interest did alpine do anything for this?
> > >=20
> > > they have patches.
> >=20
> > The same as ours or different? Was there any discussion with upstream
> > on this?
>=20
> There is one failure which is common and I have quoted upstream discussio=
n
> others are not. I dont have alpine install handy to try it out quickly
> to confirm.
>=20
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
>=20


