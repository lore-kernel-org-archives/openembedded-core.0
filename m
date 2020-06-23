Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.3157.1592902877219417941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TB3xPO+0;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id c16so7572903ioi.9
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 02:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CAzSbyLNpvkcOwcCCR3DKhNY3BaVtDgRBOaFefr9+Lo=;
        b=TB3xPO+0CJuMNga6E0StxJlj2TNygIuKuWnSkYx8ee0mZMpluNlLYvyJaW74ESyZWh
         x+Dx6xkhGtgFkxPdC6Rz65OD9e8f+j/j72FnIHy9XCXsi5WgOWP3cS73SwolWEv5p78v
         1/7+AFzVIHxoopbh932VOPs2+obfgikkN/pO/N+degNO5qazviCKwA5/1RgzVpu9ly+O
         3B3XjN0VsQbabKv/o8EmRcnHcFhIPs56lNy2CR+0Y6S6CvXK0bd4BDJnzrr8opBaNM5z
         NPBCPNvslj6F3SCrfRF96+LOYtauyiWvI1VxJUopBM6wlAfvzIiaeRSBlBX09GMGGQvN
         Zbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CAzSbyLNpvkcOwcCCR3DKhNY3BaVtDgRBOaFefr9+Lo=;
        b=PSEvvPtzOz7ejbTOrt9AhvnjWfq8PlM7WLnZfyaNedArQJfpUI66LuHdozDUDan2cX
         vCMU7Qu+cbkhEOWqAaYYytkKUO4TnEeGzUqNpXWgiWfBJObBvQRZZ7OOjMQDkokTwk/w
         bzAxv6wuYr9ixsORdpTiUGAhzpxKabX56PRJty1IPzLNy3etKOrH4qaxptnuaa8o/qTD
         ZxM9Y5cqWbxnbiMsP1WgSlITmpI+t1sdaZNoau0HsvIT3SHRvbWlFE3Hn0/It7kl9vNQ
         zuxZOTLikEhF2WEdFnTzCXy8CMt2fuw1XP28k6oyb+fb9HQuL4RBWfQkNgQR56sAa8jf
         giHQ==
X-Gm-Message-State: AOAM530i+AfmQiClqq9bbVq3aUQX90G1I0SNTvYpjktyJGoj3NvrAnvB
	jlFfRT6uqfNZH7fCf34FblUf9xLTy+PJ9hZEi8o=
X-Google-Smtp-Source: ABdhPJxo2IKOXzYQo+y2jJcnv/qsWINKYhYgVRfQkoWSc06nVNWK8zvkrv9MpY6fzqwNW+ei/vefew8w3Vf3hhrbRE0=
X-Received: by 2002:a6b:197:: with SMTP id 145mr24094711iob.77.1592902876550;
 Tue, 23 Jun 2020 02:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200622105717.108062-1-alex.kiernan@gmail.com>
 <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
 <CAO5Uq5R-oXNuqoVPpoC288smwDH459tjik6aB=B1+aOsT+dayA@mail.gmail.com>
 <161AF559DCEBF3F0.4124@lists.openembedded.org> <68c8ab0777b1b8e43d4d9cd7a0032a84efd39ea8.camel@linuxfoundation.org>
In-Reply-To: <68c8ab0777b1b8e43d4d9cd7a0032a84efd39ea8.camel@linuxfoundation.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Tue, 23 Jun 2020 10:01:05 +0100
Message-ID: <CAO5Uq5ShcQMYSYT5YFOa7i3sbAGP_dVWKrcPTiK3zPKFZZfvGw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 23, 2020 at 9:20 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-06-22 at 20:46 +0100, Richard Purdie via lists.openembedded.org wrote:
> > On Mon, 2020-06-22 at 19:53 +0100, Alex Kiernan wrote:
> > > On Mon, Jun 22, 2020 at 6:34 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Mon, 2020-06-22 at 11:57 +0100, Alex Kiernan wrote:
> > > > > Generate output for each contaminated path so it's visible in the main
> > > > > log file, then enable rootfs_check_host_user_contaminated by default.
> > > > >
> > > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > > ---
> > > > >
> > > > > Changes in v2:
> > > > > - expose each contaminated path in the main log
> > > > >
> > > > >  meta/classes/rootfs-postcommands.bbclass | 9 ++++-----
> > > > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > > >
> > > > Thanks, this is definitely more helpful. Some warnings in the test
> > > > build:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/2046
> > > >
> > > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd
> > > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm.bak
> > > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/state
> > > > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2073
> > > >
> > > > step3b: WARNING: core-image-sato-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/cache/fontconfig/CACHEDIR.TAG
> > > >
> > > > which does raise more questions.
> > > >
> > >
> > > I'm having no luck reproducing either of these locally :|
> >
> > They don't reproduce on the autobuilder either. We're probably going to
> > need to open a bug in bugzilla and enter these there listing the target
> > that caused it and the host it was on.
> >
> > Hopefully we'll see a pattern emerge.
> >
> > Or maybe the pseudo fix I posted will make it all go away. I can live
> > in hope right?!
> >
> > Either way, I think this patch is going to be a longer journey until we
> > figure out what is happening.
>
> Last nights build also gave warnings:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2055
>
> step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /usr/bin/crontab
> step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/spool/cron
>

Interestingly both of those have file permissions which aren't simple
ugo-rwx type things.

-- 
Alex Kiernan
