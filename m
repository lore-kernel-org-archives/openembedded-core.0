Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.2090.1608249570287707452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 15:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B8vBldYb;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id r24so431508vsg.10
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 15:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yxDkc1elfCPaNBz6ycrw7JbfRGW/Va5c5ts7FDTijOk=;
        b=B8vBldYbOaTuYOalMenY31qAoeWVz/yuWMFzIMh4r6LESOvGwcsf5lIYflHFQZjcam
         Tgj4YSlJgfudg2dRxlbGxpXHc3HPwU5LVGwrMw2nU9TCMYOnu9sUBQAwTDG3ruj8/TiR
         9X0Fao1pK+LUYO757MO8VjT56N67M2d+szdyfzGFpl9gFGvDyie6Alfa6spGRX1ZKNso
         B9gVZD35F+XrS7jgdjPRH4BbWDRqEvz9Zx+8B+dESiLcTCIeTgY7XubHzYrdy/c74yN6
         8V5+QQswE7+nZtRJl74fuwUUpbbTQtXFShQbONVbaTGpNJUHf3GkA7POTKcYEV/5SI7W
         3ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yxDkc1elfCPaNBz6ycrw7JbfRGW/Va5c5ts7FDTijOk=;
        b=LOZvNDZMDd+1Y/5YN3hamfORbu7/VkFZcG95mnt/M/7E++tjPErTBUxbdvIh6LD9nK
         vew2yX0FhaG49gOduVi+g1zdddGBc+i+erY1cTu0hzxXQH3dHD4f0q+aPZJloS4S6dkC
         aavf6xluLFv2NWnxn+VdMdYcMBlXN7x8EWiPeg3WHWS4Wq/XDlbKmwNaM1Bn3J/QRhFR
         8AzrWPcOc9YojaYs3ZBUIR/fBAVgViJO1VKYxKSKC8+2wjYF9g7ZX3TxKcn1B3DL48um
         rbjvNINoJQkdeEAF+dvgXhht5loB6WNoCj5MRTxMGfCAMyAoBLPeAxOJnv0IW+D95q7H
         7yug==
X-Gm-Message-State: AOAM533GWhfJWyhdSno3+mIt/hsWky8Rwrh4v2JKqEQ2iCG/hwYcgLSk
	wO3MpV5Ssy7FvSLXIEfFmIT2o1k7kPYM5wgBZ6Y=
X-Google-Smtp-Source: ABdhPJwVMfbBUxBP4xlI0XaYMp57hWq1T93ulJOnDmZcZ6X7CINUP90WgWP5mnx8Kv9mjV8wdoeSLANpcMFimpRFkIM=
X-Received: by 2002:a67:fb46:: with SMTP id e6mr1845549vsr.0.1608249569356;
 Thu, 17 Dec 2020 15:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com> <20201217225440.2633474-3-raj.khem@gmail.com>
In-Reply-To: <20201217225440.2633474-3-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 17 Dec 2020 15:59:18 -0800
Message-ID: <CAJ86T=VVepAL0d4d9AZnDr0auBYZyKOmz-gn3kExpaHkuOgFWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] busybox: Run mdev as daemon
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> When busybox is used for device management, kernel needs to support
> older/obsolete mechanism via CONFIG_UEVENT_HELPER and
> CONFIG_UEVENT_HELPER_PATH to enable /proc/sys/kernel/hotplug but this
> would require kernel defconfig change and will always be needed when
> mdev is used, intead run it in daemon mode
>
> Update mdev init script to run mdev in daemon mode
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox/mdev.cfg |  2 +
>  meta/recipes-core/busybox/files/mdev       | 56 +++++++++++++++-------
>  2 files changed, 41 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
> index 6aefe90e43..143e6097cb 100644
> --- a/meta/recipes-core/busybox/busybox/mdev.cfg
> +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> @@ -9,3 +9,5 @@ CONFIG_SETSID=y
>  CONFIG_CTTYHACK=y
>
>  CONFIG_FEATURE_SHADOWPASSWDS=y
> +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
> +CONFIG_FEATURE_MDEV_DAEMON=y
> diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
> index 8c9c06e96c..2fbdfb073e 100755
> --- a/meta/recipes-core/busybox/files/mdev
> +++ b/meta/recipes-core/busybox/files/mdev
> @@ -1,21 +1,43 @@
>  #!/bin/sh
> -mount -t proc proc /proc
> -mount -t sysfs sysfs /sys
> -mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
> -mkdir /dev/pts /dev/shm
> -chmod 777 /dev/shm
> -mount -t devpts devpts /dev/pts
> -touch /dev/mdev.seq
> -#sysctl -w kernel.hotplug=/sbin/mdev
> -echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> -mdev -s
> -
>  #
> -# We might have mounted something over /dev, see if /dev/initctl is there.
> +# Run the mdev daemon
>  #
> -if test ! -p /dev/initctl
> -then
> -        rm -f /dev/initctl
> -        mknod -m 600 /dev/initctl p
> -fi
> +
> +DAEMON="mdev"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +
> +start() {
> +  echo -n "Starting $DAEMON... "
> +  start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/mdev -- -df

Where do these start-stop-daemon options come from? Using -b for an
application which is designed to run as a daemon (and deliberately
telling that app to run in the foreground) looks odd, etc.

Are there bugs or limitations in mdev which you are trying to workaround?

> +  [ $? -eq 0 ] && echo "OK" || echo "ERROR"
> +
> +  # coldplug modules
> +  find /sys/ -name modalias -print0 | \
> +    xargs -0 sort -u | \
> +    tr '\n' '\0' | \
> +    xargs -0 modprobe -abq
> +}
> +
> +stop() {
> +  echo -n "Stopping $DAEMON... "
> +  start-stop-daemon -K -p $PIDFILE
> +  [ $? -eq 0 ] && echo "OK" || echo "ERROR"
> +}
> +
> +restart() {
> +  stop
> +  start
> +}
> +
> +case "$1" in
> +  start|stop|restart)
> +  "$1"
> +  ;;
> +  *)
> +  echo "Usage: $0 {start|stop|restart}"
> +  exit 1
> +esac
> +
> +exit $?
>
> --
> 2.29.2
>
>
> 
>
