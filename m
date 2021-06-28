Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.9130.1624874527722028171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 03:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GHb4gF/5;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id t3so24989337edc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=oS7ShXAw+SD9PpSxvVNzngvJ1Elcsobs3GK2XRq3yaE=;
        b=GHb4gF/5M3qIaAZTr+nVrG7ksSnGMBQPl98lqWPuJpgL/pp8vmndSNffb5Y8Nfu01E
         wKewL7OgFXrNUkjhHGDx44sdEk4qtW5A0TObaqwBFjQIQIGTpxlcqe7mB3BGZvJ8T38c
         ue1wVuLddYb2DQ7/njtsXxAYoO4p/Hjtau3ZJbP9BbrdogujPsZmzAQRTI8g8wGJyUCn
         xUoElnApuM5Bmmw8iS3mEoD7ry1IHp62CZGIXJpsMObgLMSEUX/mk2ycmhJHgdGf3S7P
         mFaYx3KxjSJ9rhqMO3lUO08eb/Olr7FcAH4XtU6tba+/nHutpJz+UmJ0fY/C4694LQfR
         hcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oS7ShXAw+SD9PpSxvVNzngvJ1Elcsobs3GK2XRq3yaE=;
        b=KDs75la6dJTdOX2x4gVWBKI8VQzpCLMAWKf6Sz3KEdAtHbPMGaJWFEBEHU/+oLnI9q
         NGcq3nQAUOpNR7Ss+XsIUh2kUAxzwLMbg0vQJchyrv1MVA/DNY0QnpzX947ehIgJ2m8o
         H0la49zdvywvneJwZ9ushX73ORp/jxnp25vdb1p7bvntK1G3R6bQYtm054ZatLz/vvF7
         PYuLvH98lltcZ8Kd2bmXjjiW6nYI0ykiy109/S39uC66bISo7NvMC3EEcz3gZWeQ4RVV
         UIjmy64rPqbDAcP2f12f3SqzN5kH4acaXPnzGpwLCBTb+DbOX21v0n1cTl/9Q4+OFcXi
         uhPQ==
X-Gm-Message-State: AOAM5328r6myzcHrRTHhx3r0EWfGBIbF3X8EOswZxbpjEzwmmwNw3mIB
	nGh93hkDEWmR4treyi+g35Aqq3yrJa4ajar6MKosMoKhl70=
X-Google-Smtp-Source: ABdhPJx94scP5UF4/54+OukH9KA1Ft6SkSK7ZHDZa5IxdJm7my60sm1RvXTkES1ypCxjgaODk5FfpCpykrsIUoPRkeM=
X-Received: by 2002:a05:6402:95a:: with SMTP id h26mr32217562edz.114.1624874526134;
 Mon, 28 Jun 2021 03:02:06 -0700 (PDT)
MIME-Version: 1.0
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Mon, 28 Jun 2021 12:01:55 +0200
Message-ID: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
Subject: RFC: pulseaudio vs. meson vs. neon
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

during a core-image-sato build for armv4 I got one single build
failure with pulseaudio.

This happens after commit 80bbea0 pulseaudio: switch build system from
Autotools to Meson. In the commit text it is evidenced:

"
With Meson there's no option for disabling Neon optimizations if the
compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
because the build system adds -mfpu=neon at the end of the compiler
command line, overriding any earlier -mfpu options. This shouldn't be
a problem, because PulseAudio detects at runtime whether the CPU
supports Neon instructions.
"

At the moment to build pulseaudio for armv4/5 I have reverted to using
autotools.


There was around a patch but has not been merged.
https://lists.openembedded.org/g/openembedded-core/message/146375

Maybe a v2 will be accepted?

Cheers
A.A.
