Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.2684.1592900407284847010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 01:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z/mO5tcb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id o8so359267wmh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=j0Ig5u7ATg/Rm7MmIZhD07a0maM6FCyb/IHUerJxFgo=;
        b=Z/mO5tcb2M/LjTF+j15u7T+Ex8iHPWoTPn0l7YJRVdqZV6NKfUvVnloXhFd7TXRf6X
         XXDoC58lNMjsc181+WvIhmmfmtoK8FZ1uEUOP1RX0ICZzE/NV2FvKDVWTIhhgqvwgvaL
         AOBXuGU64SiW0C/3OTiw0YeVtxW6BTZa55mxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j0Ig5u7ATg/Rm7MmIZhD07a0maM6FCyb/IHUerJxFgo=;
        b=o2WA9ov74HD6j79OgL30tJXP9FwkBsbhajyb3QeXOHcshxz1VNNNaAwK5YdWOeYRDY
         KpmF5fAi5mGz8cRnG+Jt1p25bwl7ARTksbOTWbWuhnMrcklUfVu9ag7q2N8a0KTDA+T0
         6tbwKXUNBW+TFInsWbGtu4CVR+AIwPK5RR1xtwiMh4OeOn35WmgPwj6YCKvX1I7JbMAY
         d6TXuAnFpA6GTy99EVCr+5WK1LFs/cDP6GlqzmAOq43yer+p0y1yLo1mxM4duQyWtAni
         vBSDYYsYoxzOt7KcWN30nit7lH/yQ81n5J0RCjPbeganNEy1N7PQ3IHDJ7k2t7ITy66+
         GYgA==
X-Gm-Message-State: AOAM532BkOYk3cYhVns2UmtjgiLNiYhtWsjvGYsbjZPsMtw8lPBfK9kz
	NXV4FLm+X+3tEIViuDja1bWedw==
X-Google-Smtp-Source: ABdhPJzrlXCR0QcAxsCwRygTnMvLOqtxrpT6tXYs7beztVyZ7+U55Hm5gXPQ3dNXablf1qjuGHvuuA==
X-Received: by 2002:a7b:cb4c:: with SMTP id v12mr22544084wmj.43.1592900405801;
        Tue, 23 Jun 2020 01:20:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j24sm19260948wrd.43.2020.06.23.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 01:20:05 -0700 (PDT)
Message-ID: <68c8ab0777b1b8e43d4d9cd7a0032a84efd39ea8.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2020 09:20:03 +0100
In-Reply-To: <161AF559DCEBF3F0.4124@lists.openembedded.org>
References: <20200622105717.108062-1-alex.kiernan@gmail.com>
	 <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
	 <CAO5Uq5R-oXNuqoVPpoC288smwDH459tjik6aB=B1+aOsT+dayA@mail.gmail.com>
	 <161AF559DCEBF3F0.4124@lists.openembedded.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-22 at 20:46 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2020-06-22 at 19:53 +0100, Alex Kiernan wrote:
> > On Mon, Jun 22, 2020 at 6:34 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Mon, 2020-06-22 at 11:57 +0100, Alex Kiernan wrote:
> > > > Generate output for each contaminated path so it's visible in the main
> > > > log file, then enable rootfs_check_host_user_contaminated by default.
> > > > 
> > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > ---
> > > > 
> > > > Changes in v2:
> > > > - expose each contaminated path in the main log
> > > > 
> > > >  meta/classes/rootfs-postcommands.bbclass | 9 ++++-----
> > > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > > 
> > > Thanks, this is definitely more helpful. Some warnings in the test
> > > build:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/2046
> > > 
> > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd
> > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm.bak
> > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/state
> > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2073
> > > 
> > > step3b: WARNING: core-image-sato-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/cache/fontconfig/CACHEDIR.TAG
> > > 
> > > which does raise more questions.
> > > 
> > 
> > I'm having no luck reproducing either of these locally :|
> 
> They don't reproduce on the autobuilder either. We're probably going to
> need to open a bug in bugzilla and enter these there listing the target
> that caused it and the host it was on.
> 
> Hopefully we'll see a pattern emerge.
> 
> Or maybe the pseudo fix I posted will make it all go away. I can live
> in hope right?!
> 
> Either way, I think this patch is going to be a longer journey until we
> figure out what is happening.

Last nights build also gave warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2055

step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /usr/bin/crontab
step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/spool/cron

which means the pseudo patch doesn't fix it.

Cheers,

Richard

