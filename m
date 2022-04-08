Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04D8C3527D
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.1435.1649447805653499206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QumTMq6M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 20619FF804;
	Fri,  8 Apr 2022 19:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649447803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TyMIE5tF9NUEEPgamdybqdGmlf9WG9ou+AqA7bca4Uw=;
	b=QumTMq6MvxSNjJqxn/7FO0LweQI+95C1j86lGx5pFyfrzxQj6nKY4ivdg5vLmSkHNQoIpP
	zL3X/c2+ejhw7XmCzchjRNuzbmzNkQwsedgg+D/ZB5uH3CqPLJ9M3KIgH6S0HOwi8Pmccv
	DO0eSsSWNOdAfdMd20JFayXtyF13PQkk/SaTTyChDMO6BXZ8nIv8jUj0T7Z1v6V0xFzjys
	g8gwcxBWTXgLyuCz/vkiRibMIl10SZqbdAqMbpk2NnW9GnllFlp2Z8EtMyiNOuz3SYydmq
	jUAI9z0o2OftZwf/85O16QDlmE+fmFYpNgI9VQDfzLhUmglP0ypFVvZE0ECQuA==
Date: Fri, 8 Apr 2022 21:56:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Brenda Streiff <brenda.streiff@ni.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
Message-ID: <YlCTetNIpvs/i5f/@mail.local>
References: <20220407200117.7576-1-brenda.streiff@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407200117.7576-1-brenda.streiff@ni.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164174

Hello Brenda,

It seems this fails in some builds:

ERROR: lib32-qemu-6.2.0-r0 do_package: Didn't find service unit 'lib32-qemu-guest-agent.service', specified in SYSTEMD_SERVICE:lib32-qemu-guest-agent. 

Full log here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2850/steps/12/logs/stdio

On 07/04/2022 15:01:16-0500, Brenda Streiff wrote:
> Split out the QEMU guest agent into a separate package. The agent is
> intended to be installed within a QEMU VM guest where a user is likely
> to not want to have the rest of the QEMU installation within it.
> 
> Additionally, an initscript, udev rules file, and systemd unit file are
> added to the package so that the guest agent can start automatically;
> the former two come from Debian's packaging for qemu-guest-agent.
> 
> Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           | 35 +++++++-
>  .../qemu/qemu/qemu-guest-agent.init           | 84 +++++++++++++++++++
>  .../qemu/qemu/qemu-guest-agent.udev           |  2 +
>  3 files changed, 120 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 9f2fa4322e..bd1d1ea010 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
>  RDEPENDS:${PN}-ptest = "bash"
>  
>  require qemu-targets.inc
> -inherit pkgconfig ptest python3-dir
> +inherit pkgconfig ptest python3-dir update-rc.d systemd
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                      file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
> @@ -32,6 +32,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
>             file://0001-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch \
>             file://0002-virtio-net-fix-map-leaking-on-error-during-receive.patch \
> +           file://qemu-guest-agent.init \
> +           file://qemu-guest-agent.udev \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> @@ -127,6 +129,20 @@ do_configure[cleandirs] += "${B}"
>  do_install () {
>  	export STRIP=""
>  	oe_runmake 'DESTDIR=${D}' install
> +
> +	# If we built the guest agent, also install startup/udev rules
> +	if [ -e "${D}${bindir}/qemu-ga" ]; then
> +		install -d ${D}${sysconfdir}/init.d/
> +		install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${sysconfdir}/init.d/qemu-guest-agent
> +		sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d/qemu-guest-agent
> +
> +		install -d ${D}${sysconfdir}/udev/rules.d/
> +		install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules
> +
> +		install -d ${D}${systemd_unitdir}/system/
> +		install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.service ${D}${systemd_unitdir}/system
> +		sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_unitdir}/system/qemu-guest-agent.service
> +	fi
>  }
>  
>  # The following fragment will create a wrapper for qemu-mips user emulation
> @@ -199,3 +215,20 @@ PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
>  INSANE_SKIP:${PN} = "arch"
>  
>  FILES:${PN} += "${datadir}/icons"
> +
> +# Put the guest agent in a separate package
> +PACKAGES =+ "${PN}-guest-agent"
> +SUMMARY:${PN}-guest-agent = "QEMU guest agent"
> +FILES:${PN}-guest-agent += " \
> +    ${bindir}/qemu-ga \
> +    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
> +    ${sysconfdir}/init.d/qemu-guest-agent \
> +    ${systemd_unitdir}/system/qemu-guest-agent.service \
> +"
> +
> +INITSCRIPT_PACKAGES = "${PN}-guest-agent"
> +INITSCRIPT_NAME:${PN}-guest-agent = "qemu-guest-agent"
> +INITSCRIPT_PARAMS:${PN}-guest-agent = "defaults"
> +
> +SYSTEMD_PACKAGES = "${PN}-guest-agent"
> +SYSTEMD_SERVICE:${PN}-guest-agent = "${PN}-guest-agent.service"
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> new file mode 100644
> index 0000000000..493da0ef1a
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> @@ -0,0 +1,84 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:		qemu-guest-agent
> +# Required-Start:	$remote_fs $syslog
> +# Required-Stop:	$remote_fs $syslog
> +# Default-Start:	2 3 4 5
> +# Default-Stop:		0 1 6
> +# Short-Description:	QEMU Guest Agent
> +### END INIT INFO
> +#
> +# Do not configure this file. Edit /etc/default/qemu-guest-agent
> +#
> +
> +set -e
> +
> +. /etc/init.d/functions
> +
> +PATH=/sbin:/usr/sbin:/bin:/usr/bin
> +DESC="QEMU Guest Agent"
> +NAME=qemu-ga
> +DAEMON=@bindir@/$NAME
> +PIDFILE=/var/run/$NAME.pid
> +
> +# config
> +DAEMON_ARGS=""
> +# default transport
> +TRANSPORT=virtio-serial:/dev/virtio-ports/org.qemu.guest_agent.0
> +NO_START=0
> +
> +test ! -r /etc/default/qemu-guest-agent || . /etc/default/qemu-guest-agent
> +test "$NO_START" = "0" || exit 0
> +test -x "$DAEMON" || exit 0
> +
> +#
> +# Function that checks whenever system has necessary environment
> +# It also splits $TRANSPORT into $method and $path
> +#
> +do_check_transport() {
> +	method=${TRANSPORT%%:*};
> +	path=${TRANSPORT#*:}
> +	case "$method" in
> +	    virtio-serial | isa-serial)
> +		if [ ! -e "$path" ]; then
> +		    echo "$NAME: transport endpoint not found, not starting"
> +		    return 1
> +		fi
> +		;;
> +	esac
> +}
> +
> +case "$1" in
> +  start)
> +	do_check_transport || exit 0
> +	echo -n "Starting $DESC: "
> +	start-stop-daemon -S -p $PIDFILE -x "$DAEMON" -- \
> +		$DAEMON_ARGS -d -m "$method" -p "$path"
> +	echo "$NAME."
> +	;;
> +  stop)
> +	echo -n "Stopping $DESC: "
> +	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
> +	echo "$NAME."
> +	;;
> +  status)
> +	status "$DAEMON"
> +	exit $?
> +	;;
> +  restart|force-reload)
> +	do_check_transport || exit 0
> +	echo -n "Restarting $DESC: "
> +	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
> +	sleep 1
> +	start-stop-daemon -S -p $PIDFILE -x "$DAEMON" -- \
> +		$DAEMON_ARGS -d -m "$method" -p "$path"
> +	echo "$NAME."
> +	;;
> +  *)
> +	N=/etc/init.d/$NAME
> +	echo "Usage: $N {start|stop|status|restart|force-reload}" >&2
> +	exit 1
> +	;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
> new file mode 100644
> index 0000000000..8a290abbd3
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="virtio-ports", ATTR{name}=="org.qemu.guest_agent.0", \
> +  TAG+="systemd" ENV{SYSTEMD_WANTS}="qemu-guest-agent.service"
> -- 
> 2.20.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164142): https://lists.openembedded.org/g/openembedded-core/message/164142
> Mute This Topic: https://lists.openembedded.org/mt/90321828/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

