Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8906FC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 14:22:33 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.10520.1746627751940035641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 07:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=v2FpWbLp;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e9021d2b5so1301570e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746627750; x=1747232550; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cZvh6QHwvaXbTPHgKR/oYniQg1vJgLiLE6P+Rvny+c=;
        b=v2FpWbLpqW9aBf+mEJ60YqTkt9y4Qdp/qVrxv7Tjo3mjygpwzHVPQwt9OUsHfxTYnU
         2NO+nY52D0oowh7uXsDCNHdSrM3mzmB99L5/XQBAeUVEQqXcEan094yQ2G4yAFcv025x
         wLXxQAb5KWV6NbqIkQFPoGWqlSvDg1fuW69cOn+FmJrhZtGkxFi1sHfoVlUSaZDWi+Vv
         2IVaLS1Spra/4TEoCic88m3sAJmkCxpeJD06gBIoTQkZojI6/OhP/tAaoaVIzpQXiK/p
         5/m4GcfhfQVWiWf/ymXENzIu8W5zMRckJiU70TUThHJgpft4fi8E0y1m/IG/Db31z541
         l3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627750; x=1747232550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cZvh6QHwvaXbTPHgKR/oYniQg1vJgLiLE6P+Rvny+c=;
        b=PFSHr8K6pTwwRaUm1D6oVd049kI89MW6hkPYnlNMFuneJJPFjoqF6NUjLSU06Q6QzD
         YzXX7vvsBTTQBaxeioBF3gGESQg+PmwDKVPPu9PVDNoWlhJBAEqUN+gtX0TxcbKNUwdA
         n3shRtTTTCuNM72PZXYJAQIDGljj37149JHLaRQZglW52pUq+OhCbfm3P7AD96YXuubR
         565yReHUavRd/AHLtVgHBfYvW8fbwP7dvzjJVkrW9QaQT54/vk8izl54kXFjvIUhEt88
         lbIBn3o22R1qVzhgkKGyIfBQA+EoIG2crMQr9jA18C0F1HCaAlUrdGNEoNQ/pJnVd+Pb
         ls4w==
X-Forwarded-Encrypted: i=1; AJvYcCUTvgzYPl9usXeJ2cwtl74GrnIy6/xzzv/7CFQr3mYoknGLbOG6s+9YANJpo/t9yxX7fO3iFYxfjsUaBhzjLJJU5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzo4BlocL+/9Uliwe/WywFJ05w+YACVAo84Uei/snj2DSy9D6q7
	07oHpXdwESJqwmVFWVLqsEcUEczwdHzK/3eSAFVBjT2dB+XwTsAMzWAkYQrkyAI=
X-Gm-Gg: ASbGncsT5tJKKAa3qrWwb4zGvlYlT0m5yGQOZN5kj1jFSACaAoDfJ36clvMFuroz5+4
	ORkbxmAYmyF9RIwPf/gxtHJEIp/aqkrryUpR7HLdZdIi7N6FQIj9yOUcW5fYa0MJiUEwwq+BWNi
	hHx/rddlknbq5zeoZqfF0TYMgu94GPN+O06tdfgtCyu9ihMub38p7ARXnc76XMT2jTIz1gPYquW
	FxTn7DZjWmbE+khrm2dI95DOOBpV3JV0mD9s2EWjWd7ErTsw5zXYvyv0cFoHM6tdaQrfnsACa+b
	+EbgdxOSlTXr0xczCAjr2C9RxCvL7+OlHC2+6DCsVIfGXy8ALDGAmcIFzhsP7PKQAnm64YsjQA=
	=
X-Google-Smtp-Source: AGHT+IGcASU+WKIGt3vyFNCtS6aQDOlgIkk3urY4t8aH2DVAY1eniL87DnlodZbVxOGzSrc5F+kxmQ==
X-Received: by 2002:a05:6512:3b11:b0:54e:a26c:78d1 with SMTP id 2adb3069b0e04-54fb990fa2bmr1293160e87.1.1746627749957;
        Wed, 07 May 2025 07:22:29 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee07asm2395421e87.118.2025.05.07.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:22:29 -0700 (PDT)
Date: Wed, 7 May 2025 17:22:28 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: raj.khem@gmail.com, Trevor Woerner <twoerner@gmail.com>,
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <aBtspIFmf7KoIZ_7@nuoska>
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org>
 <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <183D310FC8853D5E.1749@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 14:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216113

Hi,

On Wed, May 07, 2025 at 11:22:49AM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Tue, May 06, 2025 at 11:14:02PM -0700, Khem Raj via lists.openembedded.org wrote:
> > On Tue, May 6, 2025 at 11:04 PM Sathishkumar Duraisamy
> > <sathishkumar.d.cbe@gmail.com> wrote:
> > >
> > > On Wed, May 7, 2025 at 4:29 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> On Tue, May 6, 2025 at 6:28 AM Sathishkumar Duraisamy
> > >> <sathishkumar.d.cbe@gmail.com> wrote:
> > >> >
> > >> > Hi
> > >> >
> > >> > On Tue, May 6, 2025 at 6:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >> >>
> > >> >> On Tue, May 6, 2025 at 4:38 AM Sathishkumar D via
> > >> >> lists.openembedded.org
> > >> >> <sathishkumar.d.cbe=gmail.com@lists.openembedded.org> wrote:
> > >> >> >
> > >> >> > Hi all,
> > >> >> >
> > >> >> > I am also facing the same build issue. I tried to understand the issue. From build system for both openssl and systemd, -mbranch-protection=standard   enabled. In fact the support this flag added long back, https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579 and tpm2 introduces additional dependencies for systemd as in commit https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=6eb3098e57881895e62fc811f714c2aa4ecfcf8f.
> > >> >> >
> > >> >>
> > >> >> is this flag passed to linker as well ?
> > >> >>
> > >> > Openssl:
> > >> > =======
> > >> >
> > >> > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot"
> > >> >
> > >> > export CFLAGS=" -O2 -g  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=  -pipe -Wl,-z,gcs-compliant=all "
> > >> >
> > >> > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=  -Wl,-z,relro,-z,now"
> > >> >
> > >> > systemd
> > >> > ======
> > >> >
> > >> > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> > >> >
> > >> > export CFLAGS=" -O2 -g  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=  -pipe --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> > >> >
> > >> > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=  -Wl,-z,relro,-z,now"
> > >> >
> > >> >
> > >>
> > >> Please try adding -Wl,-z,gcs-compliant=all to systemd LDFLAGS not
> > >> CFLAGS or to openssl flags.
> > >
> > >
> > > Shortly I will build with LDFLAGS and will post the update here.
> > >
> > 
> > also try adding try with -Wl,-z,gcs-report-dynamic=none to LDFLAGS in
> > systemd and see if that helps
> 
> This did not seem to work. Unknown linker flag and build failure.

Trevor replied on #yocto irc that this worked so I was wrong. I must have mixed up
testing "-Wl,-z,gcs-report-dynamic=none" which works and "-Wl,-z,gcs-compliant=all"
which fails in systemd build with:

| ../git/meson.build:3:0: ERROR: Compiler aarch64-poky-linux-gcc -march=armv8-a+crc -mbranch-protection=standard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux/systemd/257.5/recipe-sysroot cannot compile programs.

and

$ grep error: /home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux/systemd/257.5/build/meson-logs/meson-log.txt
/home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux/systemd/257.5/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/15.1.0/ld: error: unrecognized value '-z gcs-compliant=all'

So this in meta-security/meta-tpm systemd bbappend works:

LDFLAGS:append:aarch64 = " -Wl,-z,gcs-report-dynamic=none"

I can send this out in v2. No need to patch meson.build then.

Cheers,

-Mikko

