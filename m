Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CBBC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 23:15:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.1050.1646349343973852863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 15:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ACLnCmT7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id q20so1703286wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 15:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vrNQcMi+TUOHtK9DMqraCEV4oDdTVO13OjBo5WRuaPM=;
        b=ACLnCmT7mKpVnlV9Fe6zS76HQ8ZtQJyIMffY1d9L+vPl5dV8XLzAAeteML4qIWQiEk
         hsgJZBFLmh4nNTk0UuSAwSQSLMm2fxcR+8FiBJVkoYFVO6xPqXezfHt5ommTpQJbzGdU
         xGg7kNnukxZgly82tTWtSo1pKGS9+kVio4DtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vrNQcMi+TUOHtK9DMqraCEV4oDdTVO13OjBo5WRuaPM=;
        b=HhKljst+TSqjUPGI8ntAljHQa5OWGZTtXP6AXZqqnR8Y6LJEp6geRltDkL262gGuTA
         VSXQG4u2b6ZqzMaPi+F36PYFVEpaTNBReUarWBy7a5H3y4Wm8WwYAc3Tqsb1vXl6mCw2
         2IFxqcGyScUkbJxhvVaKp+VWu//E86hskjSK7uUTuK+w7jtsuqkerS9ajBF1ByEuyOIc
         UTYfDyfNsWGUtua61jcYuBNEMYU3rzyH2/tR7wNZfRx6x+0EkFkkStB87YQapkQbNo1j
         QWnEyWQ5mfkISieFrbLeCh8wsZ41ICwZaFDauw6M9GdTDbonrPpOI5AgvlzWZ21bWbn5
         /T8w==
X-Gm-Message-State: AOAM533WkjAvHJCabQcQrGz2nefOp5PtKtVAyYjI6eOCm88gEijKm3MX
	w4itiODJ7Vwr4w0MQnszy3p/KA==
X-Google-Smtp-Source: 
 ABdhPJwvyuItqb2pgP3lRQoNCgE7AwHbqWGI6VQsCfayXIwYgLzWJbS2ZBP+DfAf8Fm6a9tOisRCXQ==
X-Received: by 2002:a05:600c:2250:b0:383:bab2:9df5 with SMTP id
 a16-20020a05600c225000b00383bab29df5mr5514794wmm.162.1646349342319;
        Thu, 03 Mar 2022 15:15:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af?
 ([2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c418200b00380e4fa28b8sm9294442wmh.23.2022.03.03.15.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 15:15:41 -0800 (PST)
Message-ID: 
 <df36f0c75a79adeda5d6f57297efaccb4fd54bda.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libical: Pass TOOLCHAIN_OPTIONS via CFLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Jose Quaresma
	 <quaresma.jose@gmail.com>
Date: Thu, 03 Mar 2022 23:15:40 +0000
In-Reply-To: 
 <CAMKF1soDJbtUY1qrkGXjUw86XzNSF+4VD3fv=Kr8MuqXR7tjGA@mail.gmail.com>
References: <20220301041346.1703440-1-raj.khem@gmail.com>
	 <3912ca5523901721837cd3200b9c685cd5561313.camel@linuxfoundation.org>
	 <CAMKF1soDJbtUY1qrkGXjUw86XzNSF+4VD3fv=Kr8MuqXR7tjGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 23:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162704

On Thu, 2022-03-03 at 15:05 -0800, Khem Raj wrote:
> On Thu, Mar 3, 2022 at 2:53 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Mon, 2022-02-28 at 20:13 -0800, Khem Raj wrote:
> > > This ensures that right sysroot is used during build, otherwise we see
> > > warnings in build about using wrong sysroot and it fails explicitly with
> > > clang
> > > 
> > > x86_64-yoe-linux-ld: warning: library search path "/usr/lib/gcc/x86_6
> > > 4-pc-linux-gnu/11.2.0/../../../../lib64" is unsafe for cross-compilation
> > > 
> > > x86_64-yoe-linux-ld: cannot find /usr/lib/clang/14.0.0/lib/linux/libc
> > > lang_rt.builtins-x86_64.a: No such file or directory
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-support/libical/libical_3.0.14.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.14.bb
> > > index 717eb11e125..879ad8ed595 100644
> > > --- a/meta/recipes-support/libical/libical_3.0.14.bb
> > > +++ b/meta/recipes-support/libical/libical_3.0.14.bb
> > > @@ -18,6 +18,8 @@ UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
> > > 
> > >  inherit cmake pkgconfig gobject-introspection vala
> > > 
> > > +CFLAGS += "${TOOLCHAIN_OPTIONS}"
> > > +
> > >  DEPENDS += "libical-native"
> > > 
> > >  PACKAGECONFIG ??= "icu glib"
> > 
> > 
> > I gave this (and the cmake patch) a go and whilst it mostly worked, it doesn't
> > work on arm (qemuarm or beaglebone):
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4855
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/3774
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4829
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3715
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/4825
> > 
> > Any ideas?
> 
> I think we need to check why CC is being passed here from env
> explicitly when invoking g-ir-scanner-wrapper, which is bare compiler
> without TOOLCHAIN_OPTIONS and this cmd seems to not
> respect CFLAGS
> 
> > [95/112] cd /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical
> && /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot-native/usr/bin/cmake
> -E env "CC='/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc'"
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot/usr/bin/g-ir-scanner-wrapper
> --c-include=libical/ical.h --pkg-export libical
> --identifier-prefix=ical
> -I/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/libical-3.0.14/src/libical
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical/ical.h
> --namespace=ICal --nsversion=3.0 --no-libtool --library=ical
> --include=GObject-2.0
> -L/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/lib
> --output /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical/ICal-3.0.gir
> --accept-unprefixed
> 
> I will take a look later today.

Thanks, I'll be asleep shortly I hope! :)

> 
> btw. is this the only failure left ?
> 

For that patch in core, yes, I think so.

Cheers,

Richard

> 


