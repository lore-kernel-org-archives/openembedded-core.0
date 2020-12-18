Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.5943.1608271672518695702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 22:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JWA/b+Xx;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id h6so783371vsr.6
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 22:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COYz6NArzplcL7Umg54HPMlO/QKAsS6wYXPXwijKj9A=;
        b=JWA/b+Xx7ipxFF5O4csueFcdd47kxcbdbC3CND1QmGt01TT5sRH6rh7mJMsLzAgGeI
         UZgMQNzgAqSzl7GAeFyn+zqsmrxZB5DhuREnW9/JP8Ue3P14ZwmEm4pY0b8gbvP9A7Gw
         CYlAm7HUDDsfZp648GndGsVsGReD5iRzu5F8uApdSnmEh+81P2uI4hLKS22Nl8JnPLL/
         TLV4L4aH5e7z37P4fgkMN15P2w+V7XNTEsMgMztDKUChOtKNQfodm1qVy5aw5wF6wI5E
         PnY3EwH+HMNmwkuGC7bDaapzINQ3G0K9cDTA5VO52wPO/SHIXv+UOZ9gK3w29K4ERTth
         Aduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COYz6NArzplcL7Umg54HPMlO/QKAsS6wYXPXwijKj9A=;
        b=Ccy76eejUJPmJQ/unyhCaqzrPM105T7MOCWit2xWPt81Mvx0HL1tV7AkqFX4rZ2FW2
         v5EtHVDsqo7th4fLlN2ZRgti/xyychfiMqF46HomZdVDNqt4NxYav6FrgEziyQgTUlO0
         ptf9kG/qxsKrVxB36laox86a0yJTZrLrECNYdfHo2WY9r5a9RxBK7FA6hzsORCDg6SY6
         /9DE6Qe73pRjiqlqRaaMy3d7Psr518x6MOEh5w31sTL+gnnogx4fMsdCUIKzyCiohsKv
         xGHi8oeYCaCsosbjIFB6ZYPgTB7q7FMdK+Zl+x7+6UtMRg3voKB8CvC29JeKCknPt6Cr
         bJkw==
X-Gm-Message-State: AOAM530+tl/jYxqshUdRExDIMJdwgcZL6B2JTCkZgCXjRbCZTCXR4YsJ
	lUsk1wKYc+XZbEXZkttX5qj/LvFpvfMULQDhyQM=
X-Google-Smtp-Source: ABdhPJyvdmQMB/vkVC2vsl7CI7ZRfIV8rR9MEQ8k2X5e6Tm3wOPsTcDOVtdqD/BD2KcYWUgNSY62QrYCr1TtwcA1KyY=
X-Received: by 2002:a67:3354:: with SMTP id z81mr2562367vsz.18.1608271671528;
 Thu, 17 Dec 2020 22:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com> <20201217225440.2633474-3-raj.khem@gmail.com>
 <CAJ86T=VVepAL0d4d9AZnDr0auBYZyKOmz-gn3kExpaHkuOgFWg@mail.gmail.com> <CAMKF1sqmcrgG-DhiPCE6k30wEUR_SJNRmbxZ+zdYkCK9xg6c7g@mail.gmail.com>
In-Reply-To: <CAMKF1sqmcrgG-DhiPCE6k30wEUR_SJNRmbxZ+zdYkCK9xg6c7g@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 17 Dec 2020 22:07:40 -0800
Message-ID: <CAJ86T=XE6Woyb7-yXKyQpGi+CqqZOc2PK9vkyBVZypiLa69_dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] busybox: Run mdev as daemon
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 7:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 3:59 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > When busybox is used for device management, kernel needs to support
> > > older/obsolete mechanism via CONFIG_UEVENT_HELPER and
> > > CONFIG_UEVENT_HELPER_PATH to enable /proc/sys/kernel/hotplug but this
> > > would require kernel defconfig change and will always be needed when
> > > mdev is used, intead run it in daemon mode
> > >
> > > Update mdev init script to run mdev in daemon mode
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/busybox/busybox/mdev.cfg |  2 +
> > >  meta/recipes-core/busybox/files/mdev       | 56 +++++++++++++++-------
> > >  2 files changed, 41 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
> > > index 6aefe90e43..143e6097cb 100644
> > > --- a/meta/recipes-core/busybox/busybox/mdev.cfg
> > > +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> > > @@ -9,3 +9,5 @@ CONFIG_SETSID=y
> > >  CONFIG_CTTYHACK=y
> > >
> > >  CONFIG_FEATURE_SHADOWPASSWDS=y
> > > +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
> > > +CONFIG_FEATURE_MDEV_DAEMON=y
> > > diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
> > > index 8c9c06e96c..2fbdfb073e 100755
> > > --- a/meta/recipes-core/busybox/files/mdev
> > > +++ b/meta/recipes-core/busybox/files/mdev
> > > @@ -1,21 +1,43 @@
> > >  #!/bin/sh
> > > -mount -t proc proc /proc
> > > -mount -t sysfs sysfs /sys
> > > -mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
> > > -mkdir /dev/pts /dev/shm
> > > -chmod 777 /dev/shm
> > > -mount -t devpts devpts /dev/pts
> > > -touch /dev/mdev.seq
> > > -#sysctl -w kernel.hotplug=/sbin/mdev
> > > -echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> > > -mdev -s
> > > -
> > >  #
> > > -# We might have mounted something over /dev, see if /dev/initctl is there.
> > > +# Run the mdev daemon
> > >  #
> > > -if test ! -p /dev/initctl
> > > -then
> > > -        rm -f /dev/initctl
> > > -        mknod -m 600 /dev/initctl p
> > > -fi
> > > +
> > > +DAEMON="mdev"
> > > +PIDFILE="/var/run/$DAEMON.pid"
> > > +
> > > +
> > > +start() {
> > > +  echo -n "Starting $DAEMON... "
> > > +  start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/mdev -- -df
> >
> > Where do these start-stop-daemon options come from? Using -b for an
> > application which is designed to run as a daemon (and deliberately
> > telling that app to run in the foreground) looks odd, etc.
> >
> > Are there bugs or limitations in mdev which you are trying to workaround?
>
> its using start-stop-daemon applet from busybox which does have these options
> implemented, its so that start-stop-daemon takes the control of the daemon

The question is not whether start-stop-daemon supports using PID files
but whether the busybox mdev application supports creating them.

It looks like although most of the busybox daemons do, mdev does not:

.../busybox-1.32.0 $ grep -r write_pidfile *
debianutils/start_stop_daemon.c:        write_pidfile(pidfile);
include/libbb.h:void write_pidfile(const char *path) FAST_FUNC;
include/libbb.h:void write_pidfile_std_path_and_ext(const char *path) FAST_FUNC;
include/libbb.h:#define write_pidfile_std_path_and_ext(path)  ((void)0)
include/libbb.h:#define write_pidfile(path)  ((void)0)
libbb/pidfile.c:void FAST_FUNC write_pidfile(const char *path)
libbb/pidfile.c:void FAST_FUNC write_pidfile_std_path_and_ext(const char *name)
libbb/pidfile.c:    write_pidfile(buf);
miscutils/watchdog.c:    write_pidfile_std_path_and_ext("watchdog");
miscutils/crond.c:    write_pidfile_std_path_and_ext("crond");
networking/ifplugd.c:    write_pidfile(pidfile_name);
networking/ntpd.c:        write_pidfile_std_path_and_ext("ntpd");
networking/inetd.c:    write_pidfile_std_path_and_ext("inetd");
networking/udhcp/dhcpc.c:    write_pidfile(client_data.pidfile);
networking/udhcp/dhcpc.c:    write_pidfile(client_data.pidfile);
networking/udhcp/dhcpd.c:    write_pidfile(server_data.pidfile);
networking/udhcp/d6_dhcpc.c:    write_pidfile(client_data.pidfile);
networking/udhcp/d6_dhcpc.c:    write_pidfile(client_data.pidfile);
sysklogd/syslogd.c:    write_pidfile_std_path_and_ext("syslogd");
sysklogd/klogd.c:    write_pidfile_std_path_and_ext("klogd");
util-linux/acpid.c:    write_pidfile(opt_pidfile);
