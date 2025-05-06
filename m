Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1BFC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:45:55 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.76162.1746539149722760286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 06:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fk5UIkX9;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54af20849bbso6536150e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746539148; x=1747143948; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/S2twm6yj6Om5D9K1HsTfcUUOwbSKK/v8MfJFAeaT9Y=;
        b=fk5UIkX9U3JAYRl5mg8n1sDkTA3aACiN7NmeM67R+jVnE5RsVzv/vrVI1orvxstmy9
         pJ696U/jzUni3WtIis2cZ10KmejyrZILsho4eGlH6GcT3bpModaR6hGcFfAo0bAotdZ0
         9qAvz7QKx808Ye2I4jW3IN849avWQyc0v0TapZowh45LNtPBFN5dBWj76yAUFOb/YJpR
         zAKfIFO88KDV7IxLFd3kLhfxVaIFvmvmCgLhSQH0f6B9FfwTQLfHpTuattNZCno3CCYr
         fwXTFshEYltNV2YflDYxH4l0IwKQ+3vlH1LXvExh7Dv595f2BKIjmynffdZ08hwv3Ud8
         0pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539148; x=1747143948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/S2twm6yj6Om5D9K1HsTfcUUOwbSKK/v8MfJFAeaT9Y=;
        b=AD7BvIDdTDdfjqh5Od0KbOJYy9rHfVpvhzifE1V9BosqqfjXk2gffJrLgHj8BPu1Q6
         TODgRT3sSMWQ2qqso3UVUpIDQOuuk775XfAz4MZcLcFq76M0GiUiEsZUG2qcsxOl7T5F
         4sKSnoYG38rlGJoRFfl0YmzTlPHE+UTjZhZRljqiAlkrlfoZ4JMb0MatLVPvhFviss5O
         gksrDLHPylX/D/WIj/6MrqypV5qT+9Jtjfgg1qzdxJ3SwX4Vee3G4G99EVqSKwOkiCb5
         zE019Of5hjbZz8EM5gpgwKz313fkreaW0tJJO9UU/fxsXn0sbS2frbsVVnDaAgY0D8pV
         A9TA==
X-Forwarded-Encrypted: i=1; AJvYcCX87KZi+twoK/BFlhh1QRVSv34jAYkij4T+pLdFF8j1kTGVx3WO7FlC0lQCQ+I6zbp0C8qKGpmdpe58FHnsPhTlmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy40IDbrJWYlNWyt3cpUNJLKPx0RN3gQcYPCChNm5PUw/Ka4PkG
	jVFbzXXU3M4ayHy9ICRmkP9pVUOwRaXhV4ac+8X+POZH3AXALKPMfe/taGULV7c=
X-Gm-Gg: ASbGnctxjMQszAXXE/kMSLoc5LMIucjYb41QroPb4T6iMhzoYj0KmBDNooyB48fyNvC
	vNNPTTmNfhypHqvEPWLQ6ug+YOK4ZyWmIy+VMgZJ+UodmHB2ZGnUAnWeTflIKSvMEgMqsdG6P6z
	2r15UlsulMyUcmsmNKBsGVx4M3bXe38le7zTH38xg/WnyJgAD8vMMlmBLVeU8B/LyPWRnXfgO9i
	IEVIjeUJZk4ljOvypwUtki8V8VF5KkDSCPcmbnB4bmIdohMyahZJx95yikWvEi4yFrql0c3aYpv
	p+Qs1V6jGt+RwnhGyLZZcWbdNr8yjJhB1MSnFwYPnudg1rMwktsWYHRJTC+RDwhOYj6GodOtFQ=
	=
X-Google-Smtp-Source: AGHT+IFvkvoKzvQZn0o5KjMgpEkTLPvciPoSy5j0PeYE6ibHQ9yY3rm4TNQFe5q64ZJswN2Cvlom5w==
X-Received: by 2002:a05:6512:b8c:b0:546:2fde:d2d9 with SMTP id 2adb3069b0e04-54fb4a14411mr913161e87.28.1746539147715;
        Tue, 06 May 2025 06:45:47 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f67e8sm2021489e87.212.2025.05.06.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:45:47 -0700 (PDT)
Date: Tue, 6 May 2025 16:45:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: raj.khem@gmail.com
Cc: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <aBoSim_nkIBMMsXM@nuoska>
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org>
 <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1spwEwgVaa5AM05drEsv3JGNVS4=g30JkHZpYFHBmdzhNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1spwEwgVaa5AM05drEsv3JGNVS4=g30JkHZpYFHBmdzhNQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 13:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216049

Hi,

On Tue, May 06, 2025 at 06:32:02AM -0700, Khem Raj via lists.openembedded.org wrote:
> On Tue, May 6, 2025 at 6:28 AM Sathishkumar Duraisamy <
> sathishkumar.d.cbe@gmail.com> wrote:
> 
> > Hi
> >
> > On Tue, May 6, 2025 at 6:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Tue, May 6, 2025 at 4:38 AM Sathishkumar D via
> >> lists.openembedded.org
> >> <sathishkumar.d.cbe=gmail.com@lists.openembedded.org> wrote:
> >> >
> >> > Hi all,
> >> >
> >> > I am also facing the same build issue. I tried to understand the issue.
> >> From build system for both openssl and systemd,
> >> -mbranch-protection=standard   enabled. In fact the support this flag added
> >> long back,
> >> https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579
> >> and tpm2 introduces additional dependencies for systemd as in commit
> >> https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=6eb3098e57881895e62fc811f714c2aa4ecfcf8f
> >> .
> >> >
> >>
> >> is this flag passed to linker as well ?
> >>
> >> Openssl:
> > =======
> >
> > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto
> > -mbranch-protection=standard -fstack-protector-strong  -O2
> > -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> > --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot"
> >
> > export CFLAGS=" -O2 -g
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=
> >  -pipe -Wl,-z,gcs-compliant=all "
> >
> > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=
> >  -Wl,-z,relro,-z,now"
> >
> > systemd
> > ======
> >
> > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto
> > -mbranch-protection=standard -fstack-protector-strong  -O2
> > -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> > --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> >
> > export CFLAGS=" -O2 -g
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=
> >  -pipe
> > --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> >
> > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=
> >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=
> >  -Wl,-z,relro,-z,now"
> >
> 
> Please post exact linker command line to build libcrypto.so as well

FWIW, this reproduces on genericarm64 machine, poky-altcfg distro, tpm2 added to
MACHINE_FEATURES and meta-security/meta-tpm layer added to build. It is triggered by
"openssl" in systemd PACKAGECONFIG.

Cheers,

-Mikko

