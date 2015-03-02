Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 24E867385A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 18:15:14 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id hy10so1332398vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 10:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=c1H19Woc6E2+/QQkpADJZS8IDy7wEzmrFrZziYfA4Pg=;
	b=CDcJqodV/aWTl9MkpeO5Wut/+SP2ujA+8O1JAZBpsm6q2xrneFS4LbwR2rG2dXzizm
	i3FRk+dVANrvnpW82Uu9akb0TMbus7x33mj+Tbz/YgesrCTm64XCqPHTpn9HUcUMQHsP
	d1CvNALM13VzGxpRhmI9S5u3fA5rhyPvleR0xYlsiqDay9Eo0ZkwZNJ8oC3OH1XUB02N
	fF5mo7doDIfuoVRSr3I/TMHYO66cqyf0krOdLXCNxR+EnXzvL4l4iLHkugWkwBcm1Iuh
	zKOvNTyfD0U+3/jJ04bAet0b8BlurmxS81trp6bjgLmkseRByZdes/yCEkk8FMqnKrE9
	Aw5Q==
X-Gm-Message-State: ALoCoQlE2EeMzScKalLXqYa1HmIu2JnPp2UUxZ2vx4Xbyzf+kaoKrX6nwlY3FGLzpydbphUt+cEx
MIME-Version: 1.0
X-Received: by 10.52.135.241 with SMTP id pv17mr25606776vdb.25.1425320115652; 
	Mon, 02 Mar 2015 10:15:15 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.52.38.225 with HTTP; Mon, 2 Mar 2015 10:15:15 -0800 (PST)
In-Reply-To: <1425291126-1729-1-git-send-email-laszlo.papp@polatis.com>
References: <1425291126-1729-1-git-send-email-laszlo.papp@polatis.com>
Date: Mon, 2 Mar 2015 18:15:15 +0000
X-Google-Sender-Auth: 4wGn_nkkXY00dfQhrhpfha-v2_4
Message-ID: <CAOMwXhOV8f+XfFGtmrSNU6FPW_uSW5Cp_q1onK=q9jcURcyN+g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Mon, 02 Mar 2015 18:15:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 2, 2015 at 10:12 AM, Laszlo Papp <lpapp@kde.org> wrote:
> Signed-off-by: Laszlo Papp <laszlo.papp@polatis.com>
> ---
>  meta/recipes-core/busybox/busybox.inc             | 12 +++--
>  meta/recipes-core/busybox/busybox_1.23.1.bb       |  2 +
>  meta/recipes-core/busybox/files/busybox-ntpd      | 54 +++++++++++++++++++++++
>  meta/recipes-core/busybox/files/busybox-ntpd.conf |  2 +
>  4 files changed, 67 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/files/busybox-ntpd
>  create mode 100644 meta/recipes-core/busybox/files/busybox-ntpd.conf
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 0769d92..b33d624 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -19,7 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
>  export EXTRA_LDFLAGS = "${LDFLAGS}"
>  export EXTRA_OEMAKE += "'LD=${CCLD}'"
>
> -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> +PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-ntpd"
>
>  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> @@ -27,15 +27,17 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfd
>  FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>  FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
>  FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
> +FILES_${PN}-ntpd = "${sysconfdir}/init.d/busybox-ntpd ${sysconfdir}/busybox-ntpd.conf"
>
> -INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
> +INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-ntpd"
>
>  INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
>  INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
>  INITSCRIPT_NAME_${PN}-mdev = "mdev"
>  INITSCRIPT_PARAMS_${PN}-mdev = "start 03 S ."
>  INITSCRIPT_NAME_${PN}-syslog = "syslog"
> -INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
> +INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
> +INITSCRIPT_NAME_${PN}-ntpd = "busybox-ntpd"
>
>  SYSTEMD_PACKAGES = "${PN}-syslog"
>  SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
> @@ -273,6 +275,10 @@ do_install () {
>                         install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
>                 fi
>         fi
> +    if grep "CONFIG_NTPD=y" ${B}/.config; then
> +        install -m 0755 ${WORKDIR}/busybox-ntpd ${D}${sysconfdir}/init.d/
> +        install -m 0644 ${WORKDIR}/busybox-ntpd.conf ${D}${sysconfdir}/
> +    fi
>
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>          if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
> diff --git a/meta/recipes-core/busybox/busybox_1.23.1.bb b/meta/recipes-core/busybox/busybox_1.23.1.bb
> index 1742390..8e57381 100644
> --- a/meta/recipes-core/busybox/busybox_1.23.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.23.1.bb
> @@ -31,6 +31,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://recognize_connmand.patch \
>             file://busybox-cross-menuconfig.patch \
>             file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
> +           file://busybox-ntpd \
> +           file://busybox-ntpd.conf \
>  "
>
>  SRC_URI[tarball.md5sum] = "5c94d6301a964cd91619bd4d74605245"
> diff --git a/meta/recipes-core/busybox/files/busybox-ntpd b/meta/recipes-core/busybox/files/busybox-ntpd
> new file mode 100644
> index 0000000..b318cda
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/busybox-ntpd
> @@ -0,0 +1,54 @@
> +#!/bin/sh
> +
> +### BEGIN INIT INFO
> +# Provides:
> +# Required-Start:    $local_fs $remote_fs $network $syslog
> +# Required-Stop:     $local_fs $remote_fs $network $syslog
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: Small busybox ntp server
> +# Description:       busybox-ntpd is a small and fast busybox ntp applet
> +### END INIT INFO
> +
> +DAEMON=/sbin/ntpd
> +NAME=ntpd
> +DESC="Busybox NTP Daemon"
> +source /etc/busybox-ntpd.conf
> +ARGS="-p $PEER"
> +
> +test -f $DAEMON || exit 0
> +
> +set -e
> +
> +case "$1" in
> +    start)
> +        if [ -z "$PEER" ]; then
> +            echo "PEER needs to be specified"
> +        else
> +            start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
> +            echo "done."
> +        fi
> +        ;;
> +    stop)
> +        echo -n "stopping $DESC: $NAME... "
> +        start-stop-daemon -K -n $NAME
> +        echo "done."
> +        ;;
> +    restart)
> +        echo "restarting $DESC: $NAME... "
> +        $0 stop
> +        $0 start
> +        echo "done."
> +        ;;
> +    reload)
> +        echo -n "reloading $DESC: $NAME... "
> +        killall -HUP $(basename ${DAEMON})
> +        echo "done."
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|restart|reload}"
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-core/busybox/files/busybox-ntpd.conf b/meta/recipes-core/busybox/files/busybox-ntpd.conf
> new file mode 100644
> index 0000000..9d9255c
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/busybox-ntpd.conf
> @@ -0,0 +1,2 @@
> +# Specify your peer.
> +# PEER=pool.ntp.org
> --
> 2.3.0

Actually after I raised this "hackish" approach on the busybox mailing
list last year, the maintainer seems to have liked my idea to get it
supported via proper configuration:
http://lists.busybox.net/pipermail/busybox-cvs/2014-March/034533.html

Therefore, I think my change ought to modified to reflect that logic.

