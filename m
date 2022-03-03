Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C14C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 23:06:08 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.992.1646348766842611355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 15:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cCLlkQaR;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id b13so5160127qkj.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 15:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GJhKQCvfv5+utyetohzEhIXOv4+o1PMH6554OwQ3aw=;
        b=cCLlkQaR2gJouiIu+7tYljaliY/4NrCtEpGKDGGXbWEX7b8pEUse87bVzC9BWfuDTn
         Xn0uez3Wsp3WIaPvEUqkq0vhsn5u4V85UJXsI28VP6Eq5vWkC5vTDw2GO0CTMFF+CG1m
         WnIgTST+64T0Iug4amwHRZVuv4M/Qz8uXjq6Sn7VptWo1h3b5QriEfxZPd7KHN+f/im8
         8UwlVVw1EMfzFoc2t0/vymCUhAjr91+g6cDLY75nwNq7bAOUh+SofJRZLdGXFYWImDQS
         D6sPVeQWlFkvYZz5AH41JCoCTdvuYcR4qAIa45MCQT/Q04VirKL0Y36a5JiD3tj45t8C
         /oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GJhKQCvfv5+utyetohzEhIXOv4+o1PMH6554OwQ3aw=;
        b=V+6tc+5Z8pSFhaKg6T5cubUG/tkYtaULbS9LENuP51+f1aplE3E+FzDTH+gRNZJsWQ
         TBKzNNA6sNnAhUo4fIcS+eC4JcBtcYv24Q8CjTaUsbmnkGjx4kn7EVZV/aiN6y84qFe6
         /TyDbtYoZrwgUzjv3p0129amPveR2T7yzAR2EiE2uRjgQblgYQRWyJ4ZY4hOmwQcA911
         mgv5f+Nfp5wnBfbRht+aM53jPbwwZUADzggb6Rd6U6F92tMmkOQik9JVdyeLi1cGgaQ9
         dwz2dlITTqePx+3rc5QCbJzdAx11me+B3o7UPtrsgKgrvTwyFkpyudmiJAMcyrfjN5HK
         buaw==
X-Gm-Message-State: AOAM530T5qLBhpoE0BND6igoAXaBqO5mKedZodib5Ej79xEEcAT1d4ib
	//+CgWAPDk36sCVcIzMisUR5AbsR29K+I5fLUJA=
X-Google-Smtp-Source: 
 ABdhPJwCQMtgm4L90jc2tnMmnyt6xvEx+/sp85FIeUJ3Z5frQ/BLM3mzrb/7nqIlLZ6iGqXc8rmu2SMY4kCf7KJrAZs=
X-Received: by 2002:a37:b541:0:b0:475:4524:bb4b with SMTP id
 e62-20020a37b541000000b004754524bb4bmr959397qkf.149.1646348765879; Thu, 03
 Mar 2022 15:06:05 -0800 (PST)
MIME-Version: 1.0
References: <20220301041346.1703440-1-raj.khem@gmail.com>
 <3912ca5523901721837cd3200b9c685cd5561313.camel@linuxfoundation.org>
In-Reply-To: 
 <3912ca5523901721837cd3200b9c685cd5561313.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2022 15:05:39 -0800
Message-ID: 
 <CAMKF1soDJbtUY1qrkGXjUw86XzNSF+4VD3fv=Kr8MuqXR7tjGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libical: Pass TOOLCHAIN_OPTIONS via CFLAGS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 23:06:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162703

On Thu, Mar 3, 2022 at 2:53 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-02-28 at 20:13 -0800, Khem Raj wrote:
> > This ensures that right sysroot is used during build, otherwise we see
> > warnings in build about using wrong sysroot and it fails explicitly with
> > clang
> >
> > x86_64-yoe-linux-ld: warning: library search path "/usr/lib/gcc/x86_6
> > 4-pc-linux-gnu/11.2.0/../../../../lib64" is unsafe for cross-compilation
> >
> > x86_64-yoe-linux-ld: cannot find /usr/lib/clang/14.0.0/lib/linux/libc
> > lang_rt.builtins-x86_64.a: No such file or directory
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-support/libical/libical_3.0.14.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.14.bb
> > index 717eb11e125..879ad8ed595 100644
> > --- a/meta/recipes-support/libical/libical_3.0.14.bb
> > +++ b/meta/recipes-support/libical/libical_3.0.14.bb
> > @@ -18,6 +18,8 @@ UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
> >
> >  inherit cmake pkgconfig gobject-introspection vala
> >
> > +CFLAGS += "${TOOLCHAIN_OPTIONS}"
> > +
> >  DEPENDS += "libical-native"
> >
> >  PACKAGECONFIG ??= "icu glib"
>
>
> I gave this (and the cmake patch) a go and whilst it mostly worked, it doesn't
> work on arm (qemuarm or beaglebone):
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4855
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/3774
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4829
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3715
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/4825
>
> Any ideas?

I think we need to check why CC is being passed here from env
explicitly when invoking g-ir-scanner-wrapper, which is bare compiler
without TOOLCHAIN_OPTIONS and this cmd seems to not
respect CFLAGS

| [95/112] cd /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical
&& /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot-native/usr/bin/cmake
-E env "CC='/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc'"
/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot/usr/bin/g-ir-scanner-wrapper
--c-include=libical/ical.h --pkg-export libical
--identifier-prefix=ical
-I/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/libical-3.0.14/src/libical
/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical/ical.h
--namespace=ICal --nsversion=3.0 --no-libtool --library=ical
--include=GObject-2.0
-L/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/lib
--output /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical/ICal-3.0.gir
--accept-unprefixed

I will take a look later today.

btw. is this the only failure left ?

>
> Cheers,
>
> Richard
>

