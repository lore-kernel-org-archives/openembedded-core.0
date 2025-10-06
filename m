Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B719CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:19:59 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.33701.1759756797994670363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=d//KRjSy;
 spf=pass (domain: inovex.de, ip: 209.85.208.53, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-637e74e92easo8144114a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1759756796; x=1760361596; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2mjFi+ahu8yWGYe2LCWb0VFbH/zI5z2YB/vn7cYsl5c=;
        b=d//KRjSy7pZwc97cuQuTvbFup9+K46Pwi792mVWYem4RMugM2H1hdRzPXEqDARpZnY
         4MqcoIj1aV/s/px0amtw6djMwIMLqxpmCjC1q3CM++mOKyIjh6ZMHUs3IG0DeN0cFY4k
         RlDDk4rKaJPKfrMVmLZU8WiSpZqkL7jehu2xuPXTtGH5S3lsZfanowAc2V09N7DZ7Ize
         4EPe9JhZQZTUdrI9k7AqFhDJPNAI+u5TJncoJ8IwpXK9aDMwCW86hXjf0yZ3pmjA8VBZ
         g9OQ8LPv1uDKSwQg5TXQ2UjFcQide1yd38+tilQXVR2QXj+6bNBPbrHjwNEGAabKnQwu
         wq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756796; x=1760361596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mjFi+ahu8yWGYe2LCWb0VFbH/zI5z2YB/vn7cYsl5c=;
        b=uGYXoURGwtqfyrCOmQpHcoqc+UE1AkuG4JmchL7MwCMw/5xWXWF3KPzJpHoFOlctYA
         Hb59Co5xJ0Bb/CBHrPBXk7iLBuPz54yyiMjQje2dmfG5BgM6XgRGPGkZOD43qXcUcrwq
         mbHct1VpjR9Qniiust0ZZ0P21LHmdf/eBDW9KOdc4IUGZD0vzdnU8KIkFzo9QfAM0H+3
         0mo4SDTt980fLPAmLrm+83iHjuHZSzy0GHndgEAT/3Y/gu8GuesPxZmxvdgJAGsIqr2G
         Rb3Y1hVBOs5XbCS3VzPueKyGZTS1qlSroqp8BK1EXfNuHdgY4APt69qoEiYQ0Yg8g8rh
         EdEg==
X-Gm-Message-State: AOJu0Yx6SoM0956pWk6l8W5wwJAj5+LgouwosOkS+1rXC8wgZgQWH6E9
	vvjgI2lWBbAS+8SYI/ezaKapWhXunkD2cH8jzHBpd6aHZVAitV7YcsFDeeT5TEv0zuVN4zi9QW1
	DI37dOwPIlL+s5b495deeFekTPhrTWS2eKA7djLtzF1JX0CaD5j/dW+Q=
X-Gm-Gg: ASbGncszxrkZv1Uyz/mhb6XTJfBP+8ur0YxexjZMH6JDau11MgoCP718aUxMI0ATLX6
	K92L50cbuKj7a28QXArw1q/tlObgZdLy2kUTj7+xRc+3HNufA8SwdyoCQkoBFpWdwcy/vbzcWjG
	1+HxlY/r0CuSF1mR4qczkSiG7vDDrWd3RKM7QLdb1KuvuQaNh5DQt8S92HMCR/894ZUILqph/VN
	qxCF/u47Tc9qzk+BJKnlEKMKRgJdCcpm+U3gnjSIho=
X-Google-Smtp-Source: AGHT+IFuhF4XAxf56mJkYxSSHgQaXr6fn+JuuO/NZROkggI6LQ+POqtDydfahTGhE0RnlV3p9q3dW3XOBQvheuW24nM=
X-Received: by 2002:a17:906:f599:b0:b45:a03f:d172 with SMTP id
 a640c23a62f3a-b49c407397bmr1574229766b.57.1759756796160; Mon, 06 Oct 2025
 06:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
 <20251002211744.3418535-1-anna-lena.marx@inovex.de> <DDAME0P70H0A.3G3G7DPYEVKK3@bootlin.com>
 <DDB48HY9ROCL.LSTRL7ZMUFM1@bootlin.com>
In-Reply-To: <DDB48HY9ROCL.LSTRL7ZMUFM1@bootlin.com>
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
Date: Mon, 6 Oct 2025 15:19:44 +0200
X-Gm-Features: AS18NWBlTanbdEeOhbWKp5wu54f3GcQHkVEKJZRDnnlwd3LCGni26P5XN_sOedU
Message-ID: <CABFt5om2Px+=56RRDszvXg19TVPVpQN1qPt+28o-OpCL3vEoMA@mail.gmail.com>
Subject: Re: [PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, denis@denix.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224484

> > Hi Anna-Lena,
> >
> > Thanks for the new version.
> >
> > I can't explain why, but it looks like this is breaking the
> > imagefeatures.ImageFeatures.test_mandb test:
> >
> > ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['kernel-6.16.9-yocto-standard'] have failed. If the intention is to defer them to first boot,
> > then please place them into pkg_postinst_ontarget:${PN} ().
> > Deferring to first boot via 'exit 1' is no longer supported.
> > ...
> > 2025-10-05 14:14:59,584 - oe-selftest - INFO - imagefeatures.ImageFeatures.test_mandb (subunit.RemotedTestCase)
> > 2025-10-05 14:14:59,586 - oe-selftest - INFO -  ... FAIL
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2478
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2391
> >
> > I was not able to reproduce this locally, I will try to extract logs
> > from the autobuilder in the coming days to provide a bit more context.
> >
>
> Here is some log from the autobuilder, not sure it helps much:
>
>   Installing       : kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff7   17/56
>   Running scriptlet: kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff7   17/56
> %post(kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qemux86_64): scriptlet start
> %post(kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qemux86_64): execv(/bin/sh) pid 1421854
> + set -e
> + [ ! -e /srv/pokybuild/yocto-worker/oe-selftest-debian-mathieu-20251004/build/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs/lib/modules/6.16.9-yocto-standard ]
> + [ -n /srv/pokybuild/yocto-worker/oe-selftest-debian-mathieu-20251004/build/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs ]
> + depmodwrapper -a -b /srv/pokybuild/yocto-worker/oe-selftest-debian-mathieu-20251004/build/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs 6.16.9-yocto-standard kernel
> Segmentation fault
> %post(kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qemux86_64): waitpid(1421854) rc 1421854 status 8b00
> warning: %post(kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qemux86_64) scriptlet failed, exit status 139
>
> Error in POSTIN scriptlet in rpm package kernel-6.16.9-yocto-standard
>   Installing       : kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+   18/56
>   Running scriptlet: kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+   18/56
> %post(kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qemux86_64): scriptlet start
> %post(kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qemux86_64): execv(/bin/sh) pid 1421928
> + set -e
> + set +e
> + [ -n /srv/pokybuild/yocto-worker/oe-selftest-debian-mathieu-20251004/build/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs ]
> + ln -sf bzImage-6.16.9-yocto-standard /srv/pokybuild/yocto-worker/oe-selftest-debian-mathieu-20251004/build/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs/boot/bzImage
> + set -e
> %post(kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qemux86_64): waitpid(1421928) rc 1421928 status 0

Hi Mathieu,
interesting, I also can not reproduce it on my machine and cannot see
a clear dependency, but let me do some research.


> My two cents - it can be the same issue as in my first patch - wrong soname and restoring from sstate-cache.
>
> But in general, I don't like this patch as it's not addressing the switch from autotools to autosetup properly.
> Two topics in particular - it keeps autotools class and it keeps now broken code which is trying to disable zlib.
> I hope I'll find some time during the next week and send a new respin of my sqlite upgrade patch.

I agree a proper autosetup class would be the best solution for this.
I could maybe help in development or testing.

Anna

