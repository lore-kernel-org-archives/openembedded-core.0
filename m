Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.6989.1610445461269072768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 01:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JIF80wKo;
 spf=pass (domain: konsulko.com, ip: 209.85.167.173, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f173.google.com with SMTP id 9so1766602oiq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 01:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mkYAj28UgXZXLLqRC1EIh4EXNXrEuiS0J3B09ZGKYxw=;
        b=JIF80wKoSiL0NTR6LkxYq0g6EFKNAeLESiUEEHBgq40LxbkZazOfJ1LFiykOeupIs6
         3zYLh1NOc54csYSLSqkyCNXPQE/1EJ+ZuZ+W9GSFGSdzFc0JLbX5sHvubnKO5DQEhUYg
         48xfNGzpL4KawSI0hLGuxmZhuPNbzODxpO0yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mkYAj28UgXZXLLqRC1EIh4EXNXrEuiS0J3B09ZGKYxw=;
        b=gpEdM8bT/ppWafvnhrqw28KEaTLnpJKd9cJofFMNpynaMQRBe2LVesV9vnNEx4ypJV
         Nt19RJ7odEKLr1SkRwBxL0grREXbt0SqzjHHnuMMAuvQzlprMKp6OA0Jzjt/m8OrGCBM
         BMYszKFsAdLe8gHXZFoIXqAPHZshi42YN7Rw94h5Gqgx6hZ3Xx8s0J7jUQ4dPeT0uT4i
         /I8RKnofe+zOoTd5rDMZu0mb70amvj6SAOEZGR2P9+eVD0U3cxHSN1pRD3KSPMOcU0fl
         oSGr5hPSEg3fM5LAO1bP0tm3b8YMQ7ipTgdhw1iHNTK6EtYf0/ZuMGvMU91VPrJd8RIv
         tTdw==
X-Gm-Message-State: AOAM5303zUq6ulKNQitZd4HSbdrRTiNNLGXBC3XClMhEkfBJVYTgKKyy
	GzZw3dgUjDCPb5PbNvTPsFAKema07XwJnyF/h1wR4A==
X-Google-Smtp-Source: ABdhPJwcAeOYbEqow4IXHovK/sSRzxwy9SS8LTqqP8YdM8zgQqQXE8dQiW3wiZF7jEa8lMxsq0hjtRiMFLOikM9Ctgo=
X-Received: by 2002:aca:fd0d:: with SMTP id b13mr1800020oii.27.1610445460585;
 Tue, 12 Jan 2021 01:57:40 -0800 (PST)
MIME-Version: 1.0
References: <1610369123-220800-1-git-send-email-michael.ho@bmw.de> <0badccec72779f05f2480c4320902c5b73b4d156.camel@linuxfoundation.org>
In-Reply-To: <0badccec72779f05f2480c4320902c5b73b4d156.camel@linuxfoundation.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 12 Jan 2021 09:57:30 +0000
Message-ID: <CAM9ZRVt-CUsk=AFjQuORScVkFpcQhBCNkj78tsUPi43FBPFxWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Ho <Michael.Ho@bmw.de>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Jan 2021 at 09:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-01-11 at 13:45 +0100, Michael Ho wrote:
> > From: Michael Ho <Michael.Ho@bmw.de>
> >
> > Switch do_populate_sdk for the ipk package manager to use a separate ta=
rget
> > opkg config file and separate the lockfiles restricting do_rootfs and
> > do_populate_sdk from running in parallel.
> >
> > This way if an image recipe includes a dependency to do_populate_sdk by
> > default then it will run in parallel to do_rootfs saving time compared =
to the
> > sequential execution.
> >
> > Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> > ---
> >  meta/classes/package_ipk.bbclass       | 1 +
> >  meta/classes/rootfs_ipk.bbclass        | 4 ++--
> >  meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++
> >  3 files changed, 9 insertions(+), 2 deletions(-)
>
> I have to admit I'm very nervous about this change. The races we've
> seen betweem rootfs and sdk can be quite unusual.
>
> I did put this in for testing and we saw:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2938
>
> which in the pseudo.log shows:
>
> path mismatch [2 links]: ino 372706913 db '/home/pokybuild/yocto-worker/b=
eaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-ima=
ge-sato/1.0-r0/tmp-wic' req '/home/pokybuild/yocto-worker/beaglebone/build/=
build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/s=
dk/image/opt/poky/3.2+snapshot/sysroots/cortexa8hf-neon-poky-linux-gnueabi/=
usr/src/debug/puzzles'.
> path mismatch [2 links]: ino 372706913 db '/home/pokybuild/yocto-worker/b=
eaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-ima=
ge-sato/1.0-r0/tmp-wic' req '/home/pokybuild/yocto-worker/beaglebone/build/=
build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/s=
dk/image/opt/poky/3.2+snapshot/sysroots/cortexa8hf-neon-poky-linux-gnueabi/=
usr/src/debug/puzzles'.
>
> its hard to know if this is due to this patch or possibly Paul's wic
> changes as both were in this test series. I suspect it won't reproduce
> every time since its a race.

Those path mismatches do seem to show that the `tmp-wic` directory was
removed outside of a pseudo context. That would point the finger at my
patches.

wic does delete its temporary working directory when exiting
(http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/scripts/lib/wic/plugin=
s/imager/direct.py?h=3Dmaster-next&id=3Db86e5b32f767b69bb770f6060cb784b15b1=
47f22#n268)
but that should be ok as wic itself is running under pseudo when
invoked by bitbake. So when do_image_wic finishes, the path to
`tmp-wic` should no longer be present in the pseudo db. The error seen
here may be due to a race condition but the underlying question of
whether `tmp-wic` is removed outside a pseudo context (leaving the
path in the db) should hopefully be deterministic. Is there a way to
query the pseudo db to see if a path is present or not? I'd like to
try that after running do_image_wic.

Thanks,

--=20
Paul Barker
Konsulko Group
