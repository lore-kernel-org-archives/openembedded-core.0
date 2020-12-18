Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.4825.1608263554586442988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 19:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qKbAdTab;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id j26so479326qtq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 19:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hXpRWRQ4cQss3R88+c0tVQKgRERblwxr4Mqxkye4XuY=;
        b=qKbAdTabFpy+MC+dSBildZhGveDmgcNdnz+lsY9mBVm8iRRjNzOMeq0fVJjGzoxfjt
         dZM/y/DjpNyaeKPQKCojICjFQTQ9X42hU6qEg9WAoSPNV4W4IEk33Z/gAQ9/nZq8H5hz
         0Wjw30BFRvJj2jzk00glK5va20v9na9u+n64wr0fnQbBqyTgChrEpJkdRi9HGxFGTeLP
         AdaO+m1V4Ie7XQpAm7mAIhl7lN9m/sUk7MQboDiwrWJi2WM29nmuruCMw6qwDZcteJPY
         nKm1WzGaharESfManflwZBBEwv1QcqzHx4t4EkSvACg2hJN/f04VlbCO0SJazWqeSxi1
         LNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hXpRWRQ4cQss3R88+c0tVQKgRERblwxr4Mqxkye4XuY=;
        b=LO2uNWmLRgLrlzJKWnsf2bB6GKCJBFLcWgi3Ic2ioHXZWA4D6B8/fTxWfYZkgLfpod
         +ZGPVw/3iKv3cz8UOLaB4sSdg4En1/56nJoPU8mT5WycE1yu3qkXiIFegwigJCX/9Abh
         WLwjXksYcD9MPKlVXSuI+B/DG5KqH1SuWooCHesJ6iHi9ikkUkIJcy1SIJaTtXFzLdsX
         ljm8DFpSMPukT8/BEqC9pPX1pqu/VBsFwZVsQ2gFlwDgZzZ9iR9K2GSp+NyzsIYYEHAo
         nS44XYIFLwK+4jzPi+lHS1rNfjfYR2husrtp55m+RFS+nteu4WoNp5pEW8xw0RgaoiLZ
         fWYQ==
X-Gm-Message-State: AOAM533sPL1idvS4gdJSy9CnNNQm0IXg4JmskMVDFwhTOKAzwfJJjFuF
	VMV3P46cuJhYPvkvkv3kdpZxVHZVsr673Bbd7AI=
X-Google-Smtp-Source: ABdhPJycJx3la2AopugSy/Qmsz25RetfzDJuuu5Wim2ceTRnAKlanvFE6J5YS9DskTlK4I79lqfkHrtyXpc+t2l3cQk=
X-Received: by 2002:ac8:5a0f:: with SMTP id n15mr2200165qta.88.1608263553662;
 Thu, 17 Dec 2020 19:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com> <20201217225440.2633474-3-raj.khem@gmail.com>
 <CAJ86T=VVepAL0d4d9AZnDr0auBYZyKOmz-gn3kExpaHkuOgFWg@mail.gmail.com>
In-Reply-To: <CAJ86T=VVepAL0d4d9AZnDr0auBYZyKOmz-gn3kExpaHkuOgFWg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 17 Dec 2020 19:52:07 -0800
Message-ID: <CAMKF1sqmcrgG-DhiPCE6k30wEUR_SJNRmbxZ+zdYkCK9xg6c7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] busybox: Run mdev as daemon
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 3:59 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > When busybox is used for device management, kernel needs to support
> > older/obsolete mechanism via CONFIG_UEVENT_HELPER and
> > CONFIG_UEVENT_HELPER_PATH to enable /proc/sys/kernel/hotplug but this
> > would require kernel defconfig change and will always be needed when
> > mdev is used, intead run it in daemon mode
> >
> > Update mdev init script to run mdev in daemon mode
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/busybox/busybox/mdev.cfg |  2 +
> >  meta/recipes-core/busybox/files/mdev       | 56 +++++++++++++++-------
> >  2 files changed, 41 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
> > index 6aefe90e43..143e6097cb 100644
> > --- a/meta/recipes-core/busybox/busybox/mdev.cfg
> > +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> > @@ -9,3 +9,5 @@ CONFIG_SETSID=y
> >  CONFIG_CTTYHACK=y
> >
> >  CONFIG_FEATURE_SHADOWPASSWDS=y
> > +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
> > +CONFIG_FEATURE_MDEV_DAEMON=y
> > diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
> > index 8c9c06e96c..2fbdfb073e 100755
> > --- a/meta/recipes-core/busybox/files/mdev
> > +++ b/meta/recipes-core/busybox/files/mdev
> > @@ -1,21 +1,43 @@
> >  #!/bin/sh
> > -mount -t proc proc /proc
> > -mount -t sysfs sysfs /sys
> > -mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
> > -mkdir /dev/pts /dev/shm
> > -chmod 777 /dev/shm
> > -mount -t devpts devpts /dev/pts
> > -touch /dev/mdev.seq
> > -#sysctl -w kernel.hotplug=/sbin/mdev
> > -echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> > -mdev -s
> > -
> >  #
> > -# We might have mounted something over /dev, see if /dev/initctl is there.
> > +# Run the mdev daemon
> >  #
> > -if test ! -p /dev/initctl
> > -then
> > -        rm -f /dev/initctl
> > -        mknod -m 600 /dev/initctl p
> > -fi
> > +
> > +DAEMON="mdev"
> > +PIDFILE="/var/run/$DAEMON.pid"
> > +
> > +
> > +start() {
> > +  echo -n "Starting $DAEMON... "
> > +  start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/mdev -- -df
>
> Where do these start-stop-daemon options come from? Using -b for an
> application which is designed to run as a daemon (and deliberately
> telling that app to run in the foreground) looks odd, etc.
>
> Are there bugs or limitations in mdev which you are trying to workaround?
>

its using start-stop-daemon applet from busybox which does have these options
implemented, its so that start-stop-daemon takes the control of the daemon

> > +  [ $? -eq 0 ] && echo "OK" || echo "ERROR"
> > +
> > +  # coldplug modules
> > +  find /sys/ -name modalias -print0 | \
> > +    xargs -0 sort -u | \
> > +    tr '\n' '\0' | \
> > +    xargs -0 modprobe -abq
> > +}
> > +
> > +stop() {
> > +  echo -n "Stopping $DAEMON... "
> > +  start-stop-daemon -K -p $PIDFILE
> > +  [ $? -eq 0 ] && echo "OK" || echo "ERROR"
> > +}
> > +
> > +restart() {
> > +  stop
> > +  start
> > +}
> > +
> > +case "$1" in
> > +  start|stop|restart)
> > +  "$1"
> > +  ;;
> > +  *)
> > +  echo "Usage: $0 {start|stop|restart}"
> > +  exit 1
> > +esac
> > +
> > +exit $?
> >
> > --
> > 2.29.2
> >
> >
> > 
> >
