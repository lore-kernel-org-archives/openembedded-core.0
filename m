Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 82D557704E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:39:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l65so13234101wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 11:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fN3AVpFVM/DhaT7MnMnRJrI5FrT+gI9/OzwLRFE+Le0=;
	b=0idbURkJNvW735aA+tmIAlcD5R8tbMTbsmoNvB6DmrapD787jEc13f/Np3IvLGg2QM
	LOiCFxHtRmk4bJyng021F67D1ch+/YQNaHeeMRUJbJiZmvqiNXvDbi/+Stiixxg4xeE4
	wtfLcFehYhsSXnZncaZ13sME6xa3ATV8DS38crTM03ymcne3xjaTTupo9nJPPm6kv2Px
	GRwm18OIsm73/ptpOH8iAcJ8IZ8qnO7HTHdh9hxIS3G4Mt3RWl7wTj9JRT+/wwZRCicz
	DXpckPUe4+vy16zNFBkZHUciNimHZfsAV+9AiC4fJ9HLsDSaP7PD/EsK6UlYIhzBl5qV
	uj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=fN3AVpFVM/DhaT7MnMnRJrI5FrT+gI9/OzwLRFE+Le0=;
	b=SMea8WReZVVz0w1ziCVxVpHKo3oOPYcsucNg6vlhoyhUfGki/aA90jOSkvn50oHqMz
	RWD2VbYkFaAcY8+A8qcE+128cQbuqnRGAo+GbrYkWGA+FqPiepuEMzXf/DJIAthSzhgx
	GZpxHQC6yRMpXwuieAZS4ByaqyyvagExjVgIuYWNToMJldn0nYfQKYy5HHSXh35n6O2t
	ifm2tm+DALA3criYe23tTG2hZPqNbMP86gTGT4BGRtoIlPIHLi+wBIoizDD+xXnpCN8N
	p9/HTmsfBR9HHkBdJ7bS3ZGoGzv+lLsBcRppzgsban4ad88sPENYhXatdgvWjkf3Fzqq
	eehA==
X-Gm-Message-State: AG10YOQAwLllR9cBZD3UTrhfzfdi2GpUkhHKuj4uzMNHGmzYLcwh5iwV+g5TwYBsBJ6R0wG3uEKYlF1zGvkhSg==
MIME-Version: 1.0
X-Received: by 10.28.98.133 with SMTP id w127mr19626888wmb.4.1453750784623;
	Mon, 25 Jan 2016 11:39:44 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 25 Jan 2016 11:39:44 -0800 (PST)
In-Reply-To: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 25 Jan 2016 11:39:44 -0800
Message-ID: <CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: Add support for busybox-init
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2016 19:39:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 12:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> in config metadata we can configure busybox based init and device
> initializer ( mdev ) using e.g.
>
> VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
> VIRTUAL-RUNTIME_login_manager = "busybox"
> VIRTUAL-RUNTIME_init_manager = "busybox"
> VIRTUAL-RUNTIME_initscripts = "initscripts"
> VIRTUAL-RUNTIME_keymaps = "keymaps"
> DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
>
> busybox can be used to provide init system
> combined with mdev it makes it a complete init
> system for really tiny systems.
>
> This patch uses above defines to configure features in busybox to enable
> the init system and mdev in a configurable manner
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox.inc       | 15 +++++++++++++++
>  meta/recipes-core/busybox/busybox/init.cfg  |  3 +++
>  meta/recipes-core/busybox/busybox/mdev.cfg  | 11 +++++++++++
>  meta/recipes-core/busybox/busybox_1.24.1.bb |  6 ++++++
>  meta/recipes-core/busybox/files/inittab     | 24 ++++++++++++++++++++++++
>  meta/recipes-core/busybox/files/rcK         | 25 +++++++++++++++++++++++++
>  meta/recipes-core/busybox/files/rcS         | 26 ++++++++++++++++++++++++++
>  meta/recipes-core/busybox/files/runlevel    | 11 +++++++++++
>  8 files changed, 121 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/init.cfg
>  create mode 100644 meta/recipes-core/busybox/busybox/mdev.cfg
>  create mode 100644 meta/recipes-core/busybox/files/inittab
>  create mode 100644 meta/recipes-core/busybox/files/rcK
>  create mode 100644 meta/recipes-core/busybox/files/rcS
>  create mode 100644 meta/recipes-core/busybox/files/runlevel
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 9541123..e5710f0 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -275,6 +275,21 @@ do_install () {
>                         install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
>                 fi
>         fi
> +        if grep "CONFIG_INIT=y" ${B}/.config; then
> +                install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
> +                install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
> +                install -D -m 0755 ${WORKDIR}/runlevel ${D}${base_sbindir}/runlevel
> +                if grep "CONFIG_FEATURE_USE_INITTAB=y" ${B}/.config; then
> +                        install -D -m 0777 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
> +                        tmp="${SERIAL_CONSOLES}"
> +                        for i in $tmp
> +                        do
> +                                j=`echo ${i} | sed s/\;/\ /g`
> +                                label=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
> +                                echo "tty$label::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> +                        done
> +                fi
> +        fi
>
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>          if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
> diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core/busybox/busybox/init.cfg
> new file mode 100644
> index 0000000..006d4c6
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/init.cfg
> @@ -0,0 +1,3 @@
> +CONFIG_INIT=y
> +CONFIG_FEATURE_USE_INITTAB=y
> +
> diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
> new file mode 100644
> index 0000000..6aefe90
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> @@ -0,0 +1,11 @@
> +CONFIG_MDEV=y
> +CONFIG_FEATURE_MDEV_CONF=y
> +CONFIG_FEATURE_MDEV_RENAME=y
> +CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
> +CONFIG_FEATURE_MDEV_EXEC=y
> +CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
> +
> +CONFIG_SETSID=y
> +CONFIG_CTTYHACK=y
> +
> +CONFIG_FEATURE_SHADOWPASSWDS=y
> diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
> index 5e19d9c..8adee53 100644
> --- a/meta/recipes-core/busybox/busybox_1.24.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
> @@ -39,6 +39,12 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://sha256sum.cfg \
>             file://getopts.cfg \
>             file://resize.cfg \
> +           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager', True) == 'busybox')]} \
> +           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager', True) == 'busybox-mdev')]} \
> +           file://inittab \
> +           file://rcS \
> +           file://rcK \
> +           file://runlevel \
>  "
>  SRC_URI_append_libc-musl = " file://musl.cfg "
>
> diff --git a/meta/recipes-core/busybox/files/inittab b/meta/recipes-core/busybox/files/inittab
> new file mode 100644
> index 0000000..bfec4a7
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/inittab
> @@ -0,0 +1,24 @@
> +# This is run first except when booting in single-user mode.
> +
> +# Startup the system
> +null::sysinit:/bin/mount -t proc proc /proc
> +null::sysinit:/bin/mount -t sysfs sysfs /sys
> +null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
> +null::sysinit:/bin/mount -o remount,rw /
> +null::sysinit:/bin/mkdir -p /dev/pts
> +null::sysinit:/bin/mount -t devpts devpts /dev/pts
> +null::sysinit:/bin/mount -a
> +
> +::sysinit:/etc/init.d/rcS
> +
> +# Stuff to do before rebooting
> +::ctrlaltdel:/sbin/reboot
> +::shutdown:/etc/init.d/rcK
> +::shutdown:/sbin/swapoff -a
> +::shutdown:/bin/umount -a -r
> +
> +# Stuff to do when restarting the init process
> +::restart:/sbin/init
> +
> +# set hostname
> +null::sysinit:/bin/busybox hostname -F /etc/hostname
> diff --git a/meta/recipes-core/busybox/files/rcK b/meta/recipes-core/busybox/files/rcK
> new file mode 100644
> index 0000000..050086e
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/rcK
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +
> +# Stop all init scripts in /etc/init.d
> +# executing them in reversed numerical order.
> +#
> +for i in /etc/rc6.d/K??*; do

Running the K?? scripts here is different to the way the Buildroot
initscipts work. It's also not clear how the order is going to be
reversed?

Maybe try to work with the Buildroot version as-is, or add some
comments to the commit message explaining why the OE and Buildroot
versions need to differ.

  https://git.busybox.net/buildroot/tree/package/initscripts/init.d/rcK

> +     # Ignore dangling symlinks (if any).
> +     [ ! -f "$i" ] && continue
> +
> +     case "$i" in
> +       *.sh)
> +           # Source shell script for speed.
> +           (
> +               trap - INT QUIT TSTP
> +               set stop
> +               . $i
> +           )
> +           ;;
> +       *)
> +           # No sh extension, so fork subprocess.
> +           $i stop
> +           ;;
> +    esac
> +done
> +
> diff --git a/meta/recipes-core/busybox/files/rcS b/meta/recipes-core/busybox/files/rcS
> new file mode 100644
> index 0000000..d18c26b
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/rcS
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +
> +# Stop all init scripts in /etc/init.d
> +# executing them in reversed numerical order.

This is a copy of the comment from rcK.

> +
> +for i in /etc/rcS.d/S??* /etc/rc5.d/S??* ;do
> +     # Ignore dangling symlinks (if any).
> +     [ ! -f "$i" ] && continue
> +
> +     case "$i" in
> +       *.sh)
> +           # Source shell script for speed.
> +           (
> +               trap - INT QUIT TSTP
> +               set stop

Should that be start? The Buildroot original is:

  https://git.busybox.net/buildroot/tree/package/initscripts/init.d/rcS

> +               . $i
> +           )
> +           ;;
> +       *)
> +           # No sh extension, so fork subprocess.
> +           $i start
> +           ;;
> +    esac
> +done
> +
> diff --git a/meta/recipes-core/busybox/files/runlevel b/meta/recipes-core/busybox/files/runlevel
> new file mode 100644
> index 0000000..866f3b5
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/runlevel
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +# busybox init does not have LSB ( sysvinit ) like initlevels
> +# so lets fake it to 5 which is what we default anyway
> +# this helps with opkg post installs where it tries to invoke
> +# update-rc.d ad post install step.
> +# for package upgrades
> +# See code in update-rc.d around line 190 where it calls runlevel
> +# program
> +#
> +echo "5"
> +
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

