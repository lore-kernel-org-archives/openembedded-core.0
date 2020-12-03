Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.273.1607017709343210995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 09:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=icg37J4W;
 spf=pass (domain: burtonini.com, ip: 209.85.208.176, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f176.google.com with SMTP id y10so3481592ljc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 09:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=GtnpPmQQHLtvwHo++XnollObh55QHtBDX5NUyIkz0/s=;
        b=icg37J4WSC2qOt9OLXTZbVMv9lN+gZr9Y1ENFQzfOBoi3/bOk4NxNz5hgWgq39Ds/D
         mJp86sOruFUv1pI+NEyAIdxaDIzUyU9GCfg4ERx0JHktmniUwuLoL93zFAswUO4Qua2s
         o2v07WPx/TGQZNhN49vd1m0iYDZLvwcCNfOQ8BL9+K/xHBOkRpvHV9e9MDl3YNjy4aDz
         0CLHxLoS53q/NmhqTU+6UyaC/QPlRlCg7HAxa0HWtJjVOEh5Qhc5xxbLkkb3NEjwmMxN
         T8w4r6zkE/zjDuc5XIegZ74V2/MEEKPS+1ewU71LmOOdBCkJfqivUpLagHREXWdlg88v
         gdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=GtnpPmQQHLtvwHo++XnollObh55QHtBDX5NUyIkz0/s=;
        b=p+ZXYFty5cLRim4rpZDQBEVtOqQ22WIUaT8M5vuh48aOPLnaKWajlJDq5epXOxuPH4
         nHuzmjipyOF7FLrAmbOj1T5MHiTVDTNsEv5rch16yenh1Ps6o7d2xoXHFWttLT0nuS97
         MkTXO4fa2khslBZW7UR/J5s67E9LQXk3dgWZj6pcqiCYrrjF7GtjQOHA7kFrj4MV1rRu
         ObPLmqST3ckOQEDcjue9uMLztCgoeC93imKuZBm3cftjWGQ18jXRnh0rgATPw5Z+DyuP
         467eNeEuCLT8UEju+At4W0ip8h2yyfwgXL5MPfvDzHQh66Ym0sEDo79Q2SjCc2qxc7T1
         kDSw==
X-Gm-Message-State: AOAM530+5HEk/mbQr7opGr4XgW1PD6/NTkETe+8R5KQeDiFwJDMboITI
	c8MmeCbepidMGlNQER7RpxmtNdkES8gEBtC/l1Ve4Kho1/pd10aBz0w=
X-Google-Smtp-Source: ABdhPJzP1dCWpBvXHBZ8/RjOEosopCwd9kmOW5RGBMqzTHNGwenMY3DAIu+AeNyGwYeMYd8/SN0NyAdcgW1dmTrrlg4=
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr1800531ljk.352.1607017706836;
 Thu, 03 Dec 2020 09:48:26 -0800 (PST)
MIME-Version: 1.0
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 3 Dec 2020 17:48:16 +0000
Message-ID: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
Subject: Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of cores
available unless told otherwise.  This was a good idea six years
ago[1] but some modern machines are moving to very large core counts.

For example, 88 core dual Xeons are fairly common. A ThunderX2 has 256
cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altra
is dual socket 2*80=160 cores.

At this level of parallelisation the sheer amount of I/O from the
unpack storm is quite excessive.  As a strawman argument, I propose a
hard cap to the default BB_NUMBER_THREADS of -- and I'm literally
making up numbers here -- 32.  Maybe 64.  Comments?

Cheers,
Ross

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=1529ef0504542145f2b81b2dba4bcc81d5dac96e
