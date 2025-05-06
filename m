Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92073C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 14:21:25 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.76980.1746541282570346731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 07:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QEs/XDg0;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad1b94382b8so452776066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746541281; x=1747146081; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WVMKmDECgYgWG2AuN0qvqH7WgXv7ExnCgjilea8j1Eg=;
        b=QEs/XDg0mBxzwWnSYKwCWBdBSM+iv7OkkiXvkUS+F9WPe1tsilvSkHjhe3XwEBesw7
         P6c3tmqZ1ahpLkkyXcA5UahM2ISXCCW5CqZPSJpzaBIyFqayLnXJZnz0Hji+E99txCPh
         qXE9+V5FqE09oNLPSHIix72elNB/M0Hon3ceYmVX6oKMjGWQF1ip5k7iomDMdAg6Uz03
         0BW/eF2vJH9ifKIpx2M0c70DSzmKrShRYmdZAkihEuADQOBIQuFo4g20/DK4RYECN67x
         zqFLQbUDVL0Yziu9CKX8FvhOMiCHkjwVaZ24n+3M42u+hbDVTXzu0ABAuaTFGcy7R9rQ
         WFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541281; x=1747146081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVMKmDECgYgWG2AuN0qvqH7WgXv7ExnCgjilea8j1Eg=;
        b=Ki360OTIf1cvCSzkifeSd2O11JG7LLjPbK7N1YCpPRDSgIEQz0dqTZe+UG3vdSFmMh
         Sm66R6Gy7QGf1OL8Zg+3yVMAmavXjoiaiw9GXOSSvZTECJGMLx2I3nMUMMn171bNMxWS
         kp7syqIytQT0of+7Z6UPFbA9YXaje8suLEzwHI4o4Osg9U4VA4R94t1CDjsbTjXHjZ9o
         6xyAxQZakQEMC+d6FnrRnGOzDNyUSaxh57qCHcRtOAqOPi5EXRCrMkL4Sn0FdtiE0NVT
         AsaUlGrNgjzG7kcGyF4btSyvXmlFbT7LnvZmmEQOCRNFYAUufrA4vdKXaQ+VTu8jQrLL
         Fq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoGE92gf4uJ1C7bkpz+bPY0xO5vq4DI+cEP+ONMbktfXzoAoyQyLeW2kodgDKFzpQuhTsz2JmcG2PJ+wT2v2HmTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzuVE2pv9fqh+SWmkdkxrT0Pk2U5ZTOE67z+otwjNJKl14cWZpo
	0PTT2oy/jpql9mv4hOcz/Pf7m5v4XfLELfAZvK8wOiBlwMqXu/YPbNbXDA==
X-Gm-Gg: ASbGnctpqy9tx/3gCubM7O9xbnbtlxTt6LdLrFVO/qVjzczFCg7fiFSSzSWd38AKlsG
	bjEqUWbbKectenv7RXYJ6WZjgQLPe2wKzbn2hwv+iagsyqojR2PHj035ompKGkZbxAJpF7VsEDd
	vKXu91x1a81ZO+mZT7iR/f1TnpnHq2iGThnUgYohRciSuIy2FpOwQwDcjT32rk0t+RDMp+LNqBH
	BRNnVtAUBmiahKDSxZagLerOZfSqpY9K0yMYTxx750gaOeq2/kAJtfe96JYXYKVB5vt/B/Nn5jf
	/NO+Qj+NaSFe84F6C7uKLz4ws/mUP0hHGdekO/kCV34bGBoh6AqI+7VMrYJCLpKmh7NLc8jOUBt
	9RGpBcwQZokS0//ZAIKI+rQ==
X-Google-Smtp-Source: AGHT+IEcPP3u63pQcywIsxyX/9uQrZowEbmdstVRO4fsFvRFnJzhaazZtgGE6/72xOVUhG9Jc33XdQ==
X-Received: by 2002:a17:907:7a8a:b0:acb:b08c:76ae with SMTP id a640c23a62f3a-ad1d453288bmr353860266b.16.1746541280616;
        Tue, 06 May 2025 07:21:20 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a2b6esm710685666b.42.2025.05.06.07.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 07:21:20 -0700 (PDT)
Date: Tue, 6 May 2025 16:21:18 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: raj.khem@gmail.com,
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <aBoa3vScMLmjacTU@toolbox>
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org>
 <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1spwEwgVaa5AM05drEsv3JGNVS4=g30JkHZpYFHBmdzhNQ@mail.gmail.com>
 <aBoSim_nkIBMMsXM@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBoSim_nkIBMMsXM@nuoska>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 14:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216051

On Tue, May 06, 2025 at 04:45:46PM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Tue, May 06, 2025 at 06:32:02AM -0700, Khem Raj via lists.openembedded.org wrote:
> > On Tue, May 6, 2025 at 6:28 AM Sathishkumar Duraisamy <
> > sathishkumar.d.cbe@gmail.com> wrote:
> > 
> > > Hi
> > >
> > > On Tue, May 6, 2025 at 6:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > >> On Tue, May 6, 2025 at 4:38 AM Sathishkumar D via
> > >> lists.openembedded.org
> > >> <sathishkumar.d.cbe=gmail.com@lists.openembedded.org> wrote:
> > >> >
> > >> > Hi all,
> > >> >
> > >> > I am also facing the same build issue. I tried to understand the issue.
> > >> From build system for both openssl and systemd,
> > >> -mbranch-protection=standard   enabled. In fact the support this flag added
> > >> long back,
> > >> https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579
> > >> and tpm2 introduces additional dependencies for systemd as in commit
> > >> https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=6eb3098e57881895e62fc811f714c2aa4ecfcf8f
> > >> .
> > >> >
> > >>
> > >> is this flag passed to linker as well ?
> > >>
> > >> Openssl:
> > > =======
> > >
> > > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto
> > > -mbranch-protection=standard -fstack-protector-strong  -O2
> > > -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> > > --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot"
> > >
> > > export CFLAGS=" -O2 -g
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=
> > >  -pipe -Wl,-z,gcs-compliant=all "
> > >
> > > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=/usr/src/debug/openssl/3.5.0
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=/usr/src/debug/openssl/3.5.0
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=
> > >  -Wl,-z,relro,-z,now"
> > >
> > > systemd
> > > ======
> > >
> > > export CC="aarch64-tdx-linux-gcc  -march=armv8-a+crypto
> > > -mbranch-protection=standard -fstack-protector-strong  -O2
> > > -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> > > --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> > >
> > > export CFLAGS=" -O2 -g
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=
> > >  -pipe
> > > --sysroot=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot"
> > >
> > > export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=/usr/src/debug/systemd/257.5
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=/usr/src/debug/systemd/257.5
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=
> > >  -ffile-prefix-map=/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=
> > >  -Wl,-z,relro,-z,now"
> > >
> > 
> > Please post exact linker command line to build libcrypto.so as well

I checked all the object files (*.o) built.
About 40 have the GCS flag not set. All of which are produced from assembler
sources using 'gcc' as the 'as' frontend with all the same flags as used for
C source files. Changing marm from 'cortex-a57+crc' to 'cortex-a57+crc+gcs'
doesn't change that.

Configuring openssl with no-arm no longer uses the optimized assembler code
and thus the resulting .so is marked with the GCS feature.

I sent a patch to the ML.
https://lore.kernel.org/all/20250506141013.2600055-1-max.oss.09@gmail.com/

Thanks Khem for the valuable feedback.

Regards
Max

> 
> FWIW, this reproduces on genericarm64 machine, poky-altcfg distro, tpm2 added to
> MACHINE_FEATURES and meta-security/meta-tpm layer added to build. It is triggered by
> "openssl" in systemd PACKAGECONFIG.
> 
> Cheers,
> 
> -Mikko
> 

