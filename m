Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2E4C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 22:24:07 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web08.24852.1661207044047514223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 15:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OAHQ6RIZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-333a4a5d495so332848917b3.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VDr62YGRwCDnztIecDKIolalhpx7UzMnk0IEe295RXg=;
        b=OAHQ6RIZ4WooZfcSvxX8YaDzwdpN272RbuRTaG5awG0Tds1fY+uWO0lxoviv7lt17y
         N4gokbJyr7lnsJi3Jr3k0euARbRgiklVNj1eRcEugQPX+69OBqf4Lg3I3EHOYwv7uTPQ
         N1gYHhRgzViPgYFaYfe4cG41QiPlS3jjOoAdgj/crH5cztGe18rHzg6LITjQBqpvpbqz
         JMEaQYCi0/ezfFVhv07cd+JAMt5iOHCLnJBS0hz09580L2xIbPVjtF10ev65KtsTbGkk
         gkf5SWQn0w+r2J6xPf2qXsTB8FcWj77+ZXU+sPpourlyfGc+PyNDKb3QXdwVv6BXzwee
         vowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VDr62YGRwCDnztIecDKIolalhpx7UzMnk0IEe295RXg=;
        b=IUzH4qSs1PFBlFv7c5BekEIDr2XAQCcbqNIBub9AtAJ8K/nQ/PL08MHSNTnMNVvFie
         1iAqSkUnGUjdwO1mcs6vVfl9M4QTUSsqNN5NLjp8GecQ9TkpGDEWcQ7IFyy45Bt4s4sp
         IixluNppdaqKQpnWPxvCwWS7/QtHRm5MsxJZMQQC7dzaRDZQGxYh4Z3EO72r8k2wPkJG
         P+2cdDitIjYzdZgoJ7qCGblRH4HsZ3/LATrDUZdcvXvsXmIBM5Z2EHkLeXrPun+zwqvk
         Ftk/a6VttBofShrpWgvl6yHFn0gU6I76+MtP6PDcCQi55lApeqSrkuX0UqnSVUQEU38d
         FCKg==
X-Gm-Message-State: ACgBeo3F7II5D1qA8viE98dkBYxyuwBBPyIPK76Jsh709k/gnz1CXtOZ
	1gnmeDKjWcej+DtoDsPi0Cs0JR5KO9ahvF+4wJI=
X-Google-Smtp-Source: 
 AA6agR6wkGSVs/ShzD5bQviQdO6+Z915hzH6GjAUDgdVR0V5Z1e3YMAqpufS5LH7Hk0a5Yk7/FL2DKiwpjZwNWylJF0=
X-Received: by 2002:a0d:edc2:0:b0:338:957:a719 with SMTP id
 w185-20020a0dedc2000000b003380957a719mr18537706ywe.132.1661207043023; Mon, 22
 Aug 2022 15:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220822211023.424801-1-raj.khem@gmail.com>
 <13f45c18d6265b1392f01279fec5f75e7ed80ce5.camel@linuxfoundation.org>
In-Reply-To: 
 <13f45c18d6265b1392f01279fec5f75e7ed80ce5.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Aug 2022 15:23:36 -0700
Message-ID: 
 <CAMKF1spe06ASMVEpwt8bToEvbv0CuzcpOLsbUGW+7PJrFLsCsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Use libc++ runtime when using clang with
 llvm runtime
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 22:24:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169688

On Mon, Aug 22, 2022 at 2:51 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-08-22 at 14:10 -0700, Khem Raj wrote:
> > meta-clang has options when it comes to C++ runtime, default is to use
> > gnu runtime, other options are llvm runtime and android runtime. This
> > patch helps when a distro is using llvm runtime for C/C++ runtime. It
> > informs the rust build system about right C++ runtime to configure for
> > when such a setting is used.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/rust/rust.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
> > index 284347dedc..c288903c9b 100644
> > --- a/meta/recipes-devtools/rust/rust.inc
> > +++ b/meta/recipes-devtools/rust/rust.inc
> > @@ -73,6 +73,7 @@ python do_configure() {
> >
> >      # [target.ARCH-poky-linux]
> >      host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
> > +    runtime = "target.{}".format(d.getVar('RUNTIME', True))
> >      config.add_section(host_section)
> >
> >      llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
> > @@ -107,6 +108,8 @@ python do_configure() {
> >      # [llvm]
> >      config.add_section("llvm")
> >      config.set("llvm", "static-libstdcpp", e(False))
> > +    if "llvm" in runtime:
> > +        config.set("llvm", "use-libcxx", e(True))
> >
>
> I think it is a little bit over complicated, couldn't it just be:
>
> if "llvm" in (d.getVar('RUNTIME', True) or ""):
>     config.set("llvm", "use-libcxx", e(True))
>

OK. I have pushed this into yoe/mut on contrib and testing it. I think
it will work ok.

> I'd much rather we did some kind of indirection via a variable too
> since I'm not sure OE-Core knows anything about RUNTIME, or that
> RUNTIME is a particularly good choice of name for the core.
>

Thats fine, I am not vested in name as much, although it might be used in
other places too by now. but if we were to have a convention in
OE-core which is different
thats one time bullet to bite.
I think we have few bugs open in bugzilla

https://bugzilla.yoctoproject.org/show_bug.cgi?id=11528
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9417

which attempt to bring various portions of toolchain options into
core. We have been
postponing it for quite a while. if we want to consider it something
for next LTS, this
would be right time to start.

> Cheers,
>
> Richard

