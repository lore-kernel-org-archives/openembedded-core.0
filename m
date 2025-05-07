Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7FEC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 18:29:35 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.3271.1746642569220250774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 11:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iOcbl1TD;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47686580529so1407341cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 11:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746642568; x=1747247368; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjdFtv4XeRs8VDmdzKZe+mMUh0LpHF7VwRFrhp5eNcg=;
        b=iOcbl1TDFlMZON6ft9NNCkP1WGYDX8ZgGzYlJf8c71q/dDxEZuCQJw6WODgItxeLXJ
         wnJvM3Z4W0tLhQ31QmUg/nfWJuPSC2XwUG0CeFcePwmlzmoJxKyLSgCMQnRAlor+dvil
         dlwzZAjH5GABw4vBi0v0HnC3ktgRDOT87sjszG+XMCc6KjH99bWlwPf78qUFKHO00Icw
         eUYVOa556Sf6pZJNgXebm4K8MGPpCUyErOIQOkCifrup0mTc0jlmFzL1zwzu4ZeDfzjt
         NjA3mDaW8ltCHmbGPnDwf2guBG0Q4+2mRl6lwhtC9EWg6NhbjWrwKv5kAuQ4HcLvxY26
         46ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746642568; x=1747247368;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjdFtv4XeRs8VDmdzKZe+mMUh0LpHF7VwRFrhp5eNcg=;
        b=HNtu2IEHh0ffiZx0oWGTxDAGq/3lyqyX8FaccFnst5qx8Y52EdXrCCBReeQ270PMn5
         3Gxu3wIexjQm/wwq7KHV4ipvPsWvjv2h5VWpLLA9ZbF+OTnbiqTUqQXs7lGiN/A30GD/
         evnRp327kQd1as/Bm7TkXnm/y5s6olvNKFthcb/o5/9hTNrfn5zkrD5WkPOKjfNUw3IC
         pu9GNC7rvHGu6i9Hst+87YUrI1cziEfdnXW1jUQ+7nxq3tasPpsXpgSHrxUUjuzglnwZ
         +73Q3L9EkymThjpFHXvFbFfATIzC7ZCZp3iMajV/CEfuHaNja6oICPFFuxKvCt42TT1i
         Zt2g==
X-Forwarded-Encrypted: i=1; AJvYcCVAisZr0tqwDGlWEwIdsYso3k4aDVJn4KvyLxmJdf7IMcGAPZFxFtODJXXNlEbiohoukr8xAU2IvgIcuHhFD1Az7Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypjBIiHEpO3pgCu9xW7cL2sVqfycWLnzHaNvVb3qB2O0AgweWn
	+t18ySHoTmjophGRRfuMSVnhUVGMsIDWe5RFggTjDkBMSY8H3kG7
X-Gm-Gg: ASbGnctBnhwyv3pqNcETm+VgQRZ8dEQP8Z8t5ykeEkyFRcvRT1Tmj/arqgzej7iDtwX
	Zkolvn35ojJ4EXLo8iYEaCKlvxZYNEFi1vwkQFQsvAu5Gz+1X3O0xtMzTttFHpI0qTX2wqpM/b7
	19cfwCKU00S0baLdzngJiGrAWaFvHIZ+NHCfbR37JPs94ohC+5U1M16KMF2B8yl/UY4WFQJZvbu
	Pk9/eTm4hkkv42K5KzTa/7l5AvdrjwXYiYwivB7ZW7b1b/eB0LH7tp/sGDPtdv3TG6Ddceuz5Ai
	U2dVWmB52UXyFT67SMr8YbgIf67Be3sHeNKLG94MBskc1VW/TF76y21ZIhMJd22VH3DR
X-Google-Smtp-Source: AGHT+IF8VfiZHo6ZAYqeXdgg4mpGWsuqWGfxsGD5fPXIlN1OYxwcqyJveQNEahJiTTBqN1tW5eSnpg==
X-Received: by 2002:ac8:5e50:0:b0:476:78a8:4356 with SMTP id d75a77b69052e-494495da45amr5476111cf.26.1746642568041;
        Wed, 07 May 2025 11:29:28 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49223457d01sm17317311cf.76.2025.05.07.11.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:29:26 -0700 (PDT)
Date: Wed, 7 May 2025 14:29:24 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: raj.khem@gmail.com,
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <20250507182924.GA700@localhost>
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org>
 <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org>
 <aBtspIFmf7KoIZ_7@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBtspIFmf7KoIZ_7@nuoska>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 18:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216125

On Wed 2025-05-07 @ 05:22:28 PM, Mikko Rapeli wrote:
> Hi,
> 
> On Wed, May 07, 2025 at 11:22:49AM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > On Tue, May 06, 2025 at 11:14:02PM -0700, Khem Raj via lists.openembedded.org wrote:
> > > On Tue, May 6, 2025 at 11:04 PM Sathishkumar Duraisamy
> > > <sathishkumar.d.cbe@gmail.com> wrote:
> > > >
> > > > On Wed, May 7, 2025 at 4:29 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >>
> > > >> On Tue, May 6, 2025 at 6:28 AM Sathishkumar Duraisamy
> > > >> <sathishkumar.d.cbe@gmail.com> wrote:
> > > >> >
> > > >> > Hi
> > > >> >
> > > >> > On Tue, May 6, 2025 at 6:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >> >>
> > > >> >> On Tue, May 6, 2025 at 4:38 AM Sathishkumar D via
> > > >> >> lists.openembedded.org
> > > >> >> <sathishkumar.d.cbe=gmail.com@lists.openembedded.org> wrote:
> > > >> >> >
> > > >> >> > Hi all,
> > > >> >> >
> > > >> >> > I am also facing the same build issue. I tried to understand the issue. From build system for both openssl and systemd, -mbranch-protection=standard   enabled. In fact the support this flag added long back, https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579 and tpm2 introduces additional dependencies for systemd as in commit https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=6eb3098e57881895e62fc811f714c2aa4ecfcf8f.
> > > >> >> >
> > > >> >>
> > > >> >> is this flag passed to linker as well ?
> > > >> >>
> > > >> > Openssl:
> > > >> > =======
> > > >> >
> > > >> > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot"
> > > >> >
> > > >> > export CFLAGS=" -O2 -g  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=  -pipe -Wl,-z,gcs-compliant=all "
> > > >> >
> > > >> > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=  -Wl,-z,relro,-z,now"
> > > >> >
> > > >> > systemd
> > > >> > ======
> > > >> >
> > > >> > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> > > >> >
> > > >> > export CFLAGS=" -O2 -g  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=  -pipe --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> > > >> >
> > > >> > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=  -Wl,-z,relro,-z,now"
> > > >> >
> > > >> >
> > > >>
> > > >> Please try adding -Wl,-z,gcs-compliant=all to systemd LDFLAGS not
> > > >> CFLAGS or to openssl flags.
> > > >
> > > >
> > > > Shortly I will build with LDFLAGS and will post the update here.
> > > >
> > > 
> > > also try adding try with -Wl,-z,gcs-report-dynamic=none to LDFLAGS in
> > > systemd and see if that helps
> > 
> > This did not seem to work. Unknown linker flag and build failure.
> 
> Trevor replied on #yocto irc that this worked so I was wrong. I must have mixed up
> testing "-Wl,-z,gcs-report-dynamic=none" which works and "-Wl,-z,gcs-compliant=all"
> which fails in systemd build with:
> 
> | ../git/meson.build:3:0: ERROR: Compiler aarch64-poky-linux-gcc -march=armv8-a+crc -mbranch-protection=standard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux/systemd/257.5/recipe-sysroot cannot compile programs.
> 
> and
> 
> $ grep error: /home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux/systemd/257.5/build/meson-logs/meson-log.txt
> /home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux/systemd/257.5/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/15.1.0/ld: error: unrecognized value '-z gcs-compliant=all'
> 
> So this in meta-security/meta-tpm systemd bbappend works:
> 
> LDFLAGS:append:aarch64 = " -Wl,-z,gcs-report-dynamic=none"
> 
> I can send this out in v2. No need to patch meson.build then.

I stumbled across this build issue via a completely different route than most
others, it seems, and certainly different than what you have described. I'm
not using meta-security and I'm not using tpm2. Therefore your patch will do
little to solve my build, and others will likely stumble across this issue by
other routes as well.

I'm using systemd's repart mechanism to repartition/resize my disks on boot to
support A/B partitioning using RAUC in meta-rockchip. To support this, I have
enabled systemd's "repart" PACKAGECONFIG, which (apparently) requires
systemd's "openssl" PACKAGECONFIG to be enabled as well. This, in systemd,
appears to be the *root* of the problem. If the user is building for aarch64,
and has enabled systemd's openssl PACKAGECONFIG, then the additional linker
flags are required. This should solve the problem for everyone?

