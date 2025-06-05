Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6ACDC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 19:53:53 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.17526.1749153230507953911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 12:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C67eldaa;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e6bddc30aso13168407b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 12:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749153229; x=1749758029; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrx0BlYX8tH0knpOFbEXs3/gpOMoKl3IepPomKjDbPk=;
        b=C67eldaa7zxToSXKhEjPVD7RFlj3CnkXGJWpQn57Hqeg+76Nus2gZsDZnhlzo3FXnt
         Z4t8gItTza0lpUFeAT1gCNLKKnsUJTFnMYV75nE/xB5xxFofKxBxTjs7zjkaLbqmSqcN
         a7QW5KxIOtfouqvgROc47tXQ9/YE2VVOuU8FIGChXsBsjsR4VBGnUikfqTtSxwNTw+Z0
         8cU18n8owzS2oHBYx536kCEKdkrs0YgYzac13826KEVPEOnZIvFE9vnCGsLzgSXuxMbo
         fS7dWtOwjtFlQAci4bk514Vd9JhbC93OoLsgZA0c/l7ciFAskXbfWujzGotGVr/d6yOo
         th0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749153229; x=1749758029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrx0BlYX8tH0knpOFbEXs3/gpOMoKl3IepPomKjDbPk=;
        b=NESMcdo+6kUQScSAMsOlSA+D5Ptbwf86VgOUHPWtvazB/ynedAcWZWB3v2w52yyK7T
         90GHHbFP7fTAorrQ1Sa4dxhRVV1KiUhIP3A9YvQrtHOzxiSv01XkmnmEMxgkd2n6MO84
         sH4U6tqgXAZB0cgp+stnOq6aBtETsXv4jRWBHh0QQGhyIIEyIs4iYxtmq1mHnd8bhLpE
         mED2/9PEDvEKVOQqHCGkFEjYybjhxOtqyQ3fd1hAUutqW0IPn2lVqri3tfi6K4krnuPD
         /ZodKOwxxfFS5JH190jDdl9wwoIzPyLuiKh/5Hliaq73sV2kJndzNg+l8e6apc8hyteW
         SYaA==
X-Forwarded-Encrypted: i=1; AJvYcCUgEgbyoovKJjmPiUbOjAeWM/4zMnwbxIChGQ1pLIquZJ2ccVtsszy/iEJPcHdY2z3wsVbNNBADKKlluaZxRsPWIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKIuSyOGdsO05F4xYg+6tA7J9l93wbH2839UPlRT7MGmZZjze5
	ETM9nTT2Wk4tQvtq43dXFWqW9wCuR8mhpbACDwotRLEBW+HvLPUb90jSCCA8RdTG7ySUxCfzY/2
	HQ2c3HoHVSKN8Y0/z687w+7FY89jHyUk=
X-Gm-Gg: ASbGncvDGqLnRukzwUQB7d/mNsMdZ2aSh2zXF2nS0XDmN5vHcQeux1n+NU/Arj1eImU
	GZMchVRFyKf3ptMPvOPyYu19OxiuLs0Z2w5IP90jf2OgjnVGXfS99OFJu12F8ms21LNF8ZES7QZ
	aRWN44qd+3cPsys1hu6Y+rTHVbW1bu2vP5sGYJ2JrSdGpBjPM5EB2Fk+xE8BvNYq/NermVuL0=
X-Google-Smtp-Source: AGHT+IH6w7Gvizn4syviwH1DkYmKmqLy018DT9uLU1egy7T1pVUWWO+g6nSjSSZ3GZ0l84UnMtwpFeoeYf4zLCHCqmw=
X-Received: by 2002:a05:690c:368a:b0:710:f74b:61d0 with SMTP id
 00721157ae682-710f76685fbmr11137187b3.7.1749153229544; Thu, 05 Jun 2025
 12:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <26D43BA4-43AE-4D40-8533-8D443F804F97@arm.com> <440c4178-40b0-47c7-b7dc-1e0ee9cf65b0@gmail.com>
 <20250605194043.nzlanfitchaedeyb@hiago-nb>
In-Reply-To: <20250605194043.nzlanfitchaedeyb@hiago-nb>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jun 2025 12:53:23 -0700
X-Gm-Features: AX0GCFv1bYWnxIJ2ILTO-ai8tbJNdBCBHA7DaNCSBhfSXdNgqth0gUznif3ZFVk
Message-ID: <CAMKF1srYrrHALtb3MzfdPKZOBv_Vc9CvDbK9oXv=bK+echkugg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libgcrypt: fix compile error for t-thread-local
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Hongxu Jia <hongxu.jia@windriver.com>, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 19:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218081

On Thu, Jun 5, 2025 at 12:40=E2=80=AFPM Hiago De Franco <hiagofranco@gmail.=
com> wrote:
>
> Hi Ross, Khem,
>
> On Thu, Jun 05, 2025 at 01:44:08PM +0000, Ross Burton wrote:
> > On 2 Jun 2025, at 21:55, Hiago De Franco via lists.openembedded.org <hi=
agofranco=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > Currently the libgcrypt-native build is failing with the following
> > > error:
> > >
> > > | ld: t_thread_local-t-thread-local.o: in function `main':
> > > | t-thread-local.c:(.text.startup+0x187): undefined reference to `pth=
read_create'
> > > | ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference to =
`pthread_join'
> > >
> > > Backport the fix from upstream and add "-lpthread" to
> > > "t_thread_local_CFLAGS" to make the compilation successfull, similar =
to
> > > what 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> > > does.
> >
> > This has been merged but I=E2=80=99m curious: in what situations does t=
his fail? The commit talks about NetBSD and we=E2=80=99re not seeing this o=
n the autobuilder cluster.
>
> The NetBSD part is from the commit I backported, because I saw this was
> fixed upstream. Looks they were the first to see this issue.
>
> I am not sure why the autobuilder was not able to catch it, we do
> nightly builds of oe-core master with our hardware and the upgrade of
> libgcrypt recipe introduced a regression were all our machines were
> broken.
>
> I attached the do_compile log failure, but the issue happends here:
>
> build/tmp/hosttools/ld: t-thread-local.o: in function `main':
> t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_c=
reate'
> /build/tmp/hosttools/ld: t-thread-local.c:(.text.startup+0x1d0): undefine=
d reference to `pthread_join'
>


My guess is that you are using glibc before pthread merge into libc.so
which could be alma-8 distro or some such
we do have alma-8 nodes on AB but I guess this escaped building on alma-8 h=
osts.

Whats your build distro  and version of glibc on it

> [...]
>
> ERROR: Task (virtual:native:layers/openembedded-core/meta/recipes-support=
/libgcrypt/libgcrypt_1.11.1.bb:do_compile) failed with exit code '1'
>
> >
> > Ross
>
> On Thu, Jun 05, 2025 at 09:46:52AM -0700, Khem Raj wrote:
> >
> >
> > On 6/5/25 6:44 AM, Ross Burton via lists.openembedded.org wrote:
> > > On 2 Jun 2025, at 21:55, Hiago De Franco via lists.openembedded.org <=
hiagofranco=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > Currently the libgcrypt-native build is failing with the following
> > > > error:
> > > >
> > > > | ld: t_thread_local-t-thread-local.o: in function `main':
> > > > | t-thread-local.c:(.text.startup+0x187): undefined reference to `p=
thread_create'
> > > > | ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference t=
o `pthread_join'
> > > >
> > > > Backport the fix from upstream and add "-lpthread" to
> > > > "t_thread_local_CFLAGS" to make the compilation successfull, simila=
r to
> > > > what 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patc=
h
> > > > does.
> >
> > I wonder if the -pthread should be added instead of -lpthread since its
> > adding to CFLAGS and not LDFLAGS
>
> When I saw the patch upstream I just had to add the -lpthread and the iss=
ue
> was gone. Not sure if it was the correct approach, if it is not them I
> can subbmit another patch.
>
> >
> > >
> > > This has been merged but I=E2=80=99m curious: in what situations does=
 this fail? The commit talks about NetBSD and we=E2=80=99re not seeing this=
 on the autobuilder cluster.
> > >
> >
> > My guess is that pthread check in configure is failing. If we can see
> > config.log from build dir for this package we can get a better idea.
>
> Good point, I checked and looks like it is correctly configured:
>
> checking for pthread_create in -lpthread... yes
>
> But after that the do_compile fails. I also attched the do_configure log
> here.
>
> >
> > > Ross
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#218020): https://lists.openembedded.org/g/openemb=
edded-core/message/218020
> > > Mute This Topic: https://lists.openembedded.org/mt/113436606/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
>
> Best Regards,
> Hiago.

