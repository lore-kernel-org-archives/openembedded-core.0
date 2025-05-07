Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA174C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 08:23:01 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.3704.1746606173874300127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 01:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=c2nQ5dZu;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54ac9d57173so698244e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 01:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746606172; x=1747210972; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EBquaZ5GyRoAhogCJE6gwcT+Jm2cMWfZT5GwOHS0neY=;
        b=c2nQ5dZuFM8Y+gxlsp1FUZ6rEfVk7VUVoY/5j56xYJJ1YCci6J3kk3CEbgz7hOiD4s
         UqBRSvlMR2UcdULkEgCjUzOhRHHekVf1aVDTFRsoOeNvRMHbYHs+4mC5rnY1BAJyvARL
         e9Vzy4JQeq9g9Bykm9vDScQh8nCS++jnXfE4DPatcTWHnK7QURsXN/2+HFalyS5XWCK8
         5RcNwIgXaDM7blw2Z6bc4uhX5m+jKjKUBoj68UQ4Qu2wzWwO7kjLaLF8hKuH2LpHLL/t
         WapBm6Qq7ppQH2B3vs7sWzdcBYnmXWGblSH1WyTTbB4QQ5sakoPNcn986WIjGyyq/1GT
         Pkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746606172; x=1747210972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBquaZ5GyRoAhogCJE6gwcT+Jm2cMWfZT5GwOHS0neY=;
        b=LrnmtAm/UMWdqwfzZtB3m4zYrfSdbcOWA6E7oWuHld3upeRvZDpKJIPU25crpPCxc2
         rwpUrFx8NSxqS/Wmh56NZz2pKwgoYq44ieXWr+VErE5DNnzguyjq4oR+Jgkw8gakNfVw
         FmcilodFfnQbmFf5quclX4vxlRJllxO3L8eOBAlaVizKc/+eQXf09FDlnpktd6dn6piF
         0eKbJWQfrsTxPjkDwUECsVoQ4++kkaeasHMFjf09FviuWEpcFC/xA3Qh2h0LXQ4+c1R4
         7tDIL4pB674mmMWc3QpSSrZBw5zzAj13uBNShGV3/pPN+A6uVb4EU4dDZb1mgnadY341
         g8KA==
X-Forwarded-Encrypted: i=1; AJvYcCVDnpjxjr2tFAp7gWA31DZjj4WvHddXLwwELabwYk5q7g17DuHgtsLTUszWrc0NjwAETwB9gDgqoiU5GVEGnguWyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwAMKW1yT0vYMIqX0+rJA2PhtNgzmEvgXM+ZwbCgyVrlzTQPfPC
	i8m1lI1EAyljNo8wIiUI9sgV+GHE3uRNVitXi0kwp29Iqy03OBr7WYeeMKdwXNM=
X-Gm-Gg: ASbGncuIQUzJ1H/6JHENKrhaQb08arhYLS18XrnQ7TF7sa1axwrjyHwpO4nnq5x4A1g
	eWmbzwjCMzwgXszRRcfxeEdGbn6UqBMIt8YqzUsNabHvErhKS6CerQVktIZlutDJ/JyHWUuP5T5
	6KzTL1W2SRERzdum2MAHUoshaNw3XJN7fvs9z8hIN+eeGqpA84AYcgiA2UWvdLhl+uGlpwnd3EN
	di+snKJao2xduNhjg6BLrBk7pAxYjGx6vhYCpNRYTJCrMjgTFwP4+v4KTVevhmXNJkRDMW0dhcu
	lT9l1vMbJ6BK/MlvDS+AIntCw9k0J4221oLFEr26JeTOqDIsDsnB57Ps4m4P3J9A2Ymii/y9Gw=
	=
X-Google-Smtp-Source: AGHT+IEI3+v7CjTdjQy7mVsXlWK8BfAcapC1Hf2JnQp1zmgQqtpyydARjGJL7NCRhX9y3U14VMnT+w==
X-Received: by 2002:a2e:bc86:0:b0:30d:6270:a3b4 with SMTP id 38308e7fff4ca-326abe728a8mr10774811fa.15.1746606171694;
        Wed, 07 May 2025 01:22:51 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017792sm22348441fa.35.2025.05.07.01.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:22:51 -0700 (PDT)
Date: Wed, 7 May 2025 11:22:49 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: raj.khem@gmail.com
Cc: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <aBsYWfktzSV3um-Z@nuoska>
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org>
 <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216101

Hi,

On Tue, May 06, 2025 at 11:14:02PM -0700, Khem Raj via lists.openembedded.org wrote:
> On Tue, May 6, 2025 at 11:04 PM Sathishkumar Duraisamy
> <sathishkumar.d.cbe@gmail.com> wrote:
> >
> > On Wed, May 7, 2025 at 4:29 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Tue, May 6, 2025 at 6:28 AM Sathishkumar Duraisamy
> >> <sathishkumar.d.cbe@gmail.com> wrote:
> >> >
> >> > Hi
> >> >
> >> > On Tue, May 6, 2025 at 6:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> On Tue, May 6, 2025 at 4:38 AM Sathishkumar D via
> >> >> lists.openembedded.org
> >> >> <sathishkumar.d.cbe=gmail.com@lists.openembedded.org> wrote:
> >> >> >
> >> >> > Hi all,
> >> >> >
> >> >> > I am also facing the same build issue. I tried to understand the issue. From build system for both openssl and systemd, -mbranch-protection=standard   enabled. In fact the support this flag added long back, https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579 and tpm2 introduces additional dependencies for systemd as in commit https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=6eb3098e57881895e62fc811f714c2aa4ecfcf8f.
> >> >> >
> >> >>
> >> >> is this flag passed to linker as well ?
> >> >>
> >> > Openssl:
> >> > =======
> >> >
> >> > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot"
> >> >
> >> > export CFLAGS=" -O2 -g  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=  -pipe -Wl,-z,gcs-compliant=all "
> >> >
> >> > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=  -Wl,-z,relro,-z,now"
> >> >
> >> > systemd
> >> > ======
> >> >
> >> > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> >> >
> >> > export CFLAGS=" -O2 -g  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=  -pipe --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> >> >
> >> > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=  -Wl,-z,relro,-z,now"
> >> >
> >> >
> >>
> >> Please try adding -Wl,-z,gcs-compliant=all to systemd LDFLAGS not
> >> CFLAGS or to openssl flags.
> >
> >
> > Shortly I will build with LDFLAGS and will post the update here.
> >
> 
> also try adding try with -Wl,-z,gcs-report-dynamic=none to LDFLAGS in
> systemd and see if that helps

This did not seem to work. Unknown linker flag and build failure.

I think disabling linker warnings as errors in systemd is the way out for now.

Cheers,

-Mikko

