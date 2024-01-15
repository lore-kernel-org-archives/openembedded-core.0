Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4EAC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 16:59:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.87423.1705337942590961524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 08:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=czTMfjqy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63550240004;
	Mon, 15 Jan 2024 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705337940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XFvH8VshXYlaVRd5zl72Xkc3At76KeQ9APL9NJ/pdfQ=;
	b=czTMfjqy+Yj0PwaawpDfznLrPb9r1HH4R7M6fBqAeGg1QYssbBoXN2PXEaiBggAtuxLMVY
	eeg2W+PH/JKLzeHMzZFmi7HKDmjKw6sY3Xw062rHLK60Bn+UIXIrt2eENLWT3DnW+8QdAI
	r7jaS6BTH7Y2J42eeZZbb2qF19JdMK42dTa/1uqePSRKmkdCEZY3d99jh15pSY+6dno/hl
	Hh3Amr2X57L0gebVWdgsZjNbfHbHF+2mdQ1d/lacWftt32fXTkk01VCGnv+UJerDz05wi5
	Or5vX7KWAZO3Fegp6BNRmIgLr1j9voHOXcj+DTG/ppbUOzOs7Nl04lxuKgLN5w==
Date: Mon, 15 Jan 2024 17:58:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com,
	david.zuhn@sonos.com
Subject: Re: [OE-core] [PATCH] rng-tools: move to meta-oe
Message-ID: <20240115165859d332c9cb@mail.local>
References: <20240110202501.1554379-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110202501.1554379-1-Randy.MacLeod@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 16:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193691

This is breaking meta-agl-core until this gets into meta-oe:

https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3849/steps/14/logs/stdio

On 10/01/2024 15:25:01-0500, Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
> 
> Nothing in oe-core depends on rng-tools anymore:
>    e7e1bc43ca rng-tools: splitting the rng-tools systemd/sysvinit serivce as a package
> so move it to meta-oe for people who still want to run rngd
> as a service for some reason or for those who want to run rng-test.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  .../rng-tools/rng-tools/default               |  1 -
>  meta/recipes-support/rng-tools/rng-tools/init | 42 -----------
>  .../rng-tools/rng-tools/rng-tools.service     | 32 ---------
>  .../rng-tools/rng-tools_6.16.bb               | 69 -------------------
>  5 files changed, 145 deletions(-)
>  delete mode 100644 meta/recipes-support/rng-tools/rng-tools/default
>  delete mode 100644 meta/recipes-support/rng-tools/rng-tools/init
>  delete mode 100644 meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>  delete mode 100644 meta/recipes-support/rng-tools/rng-tools_6.16.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 8dc63b138e..31023021ac 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -739,7 +739,6 @@ RECIPE_MAINTAINER:pn-repo = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-resolvconf = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-rgb = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
> -RECIPE_MAINTAINER:pn-rng-tools = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-rpm = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
> deleted file mode 100644
> index b9f8e03635..0000000000
> --- a/meta/recipes-support/rng-tools/rng-tools/default
> +++ /dev/null
> @@ -1 +0,0 @@
> -EXTRA_ARGS="-r /dev/hwrng"
> diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
> deleted file mode 100644
> index 13f0ecd37c..0000000000
> --- a/meta/recipes-support/rng-tools/rng-tools/init
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -#!/bin/sh
> -#
> -# This is an init script for openembedded
> -# Copy it to @SYSCONFDIR@/init.d/rng-tools and type
> -# > update-rc.d rng-tools defaults 60
> -#
> -
> -rngd=@SBINDIR@/rngd
> -test -x "$rngd" || exit 1
> -
> -[ -r @SYSCONFDIR@/default/rng-tools ] && . "@SYSCONFDIR@/default/rng-tools"
> -
> -case "$1" in
> -  start)
> -    echo -n "Starting random number generator daemon"
> -    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
> -    echo "."
> -    ;;
> -  stop)
> -    echo -n "Stopping random number generator daemon"
> -    start-stop-daemon -K -q -n rngd
> -    echo "."
> -    ;;
> -  reload|force-reload)
> -    echo -n "Signalling rng daemon restart"
> -    start-stop-daemon -K -q -s 1 -x $rngd
> -    start-stop-daemon -K -q -s 1 -x $rngd
> -    ;;
> -  restart)
> -    echo -n "Stopping random number generator daemon"
> -    start-stop-daemon -K -q -n rngd
> -    echo "."
> -    echo -n "Starting random number generator daemon"
> -    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
> -    echo "."
> -    ;;
> -  *)
> -    echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restart|force-reload}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> deleted file mode 100644
> index 5ae2fba215..0000000000
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -[Unit]
> -Description=Hardware RNG Entropy Gatherer Daemon
> -DefaultDependencies=no
> -Conflicts=shutdown.target
> -Before=sysinit.target shutdown.target
> -ConditionVirtualization=!container
> -
> -[Service]
> -EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
> -ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
> -CapabilityBoundingSet=CAP_SYS_ADMIN
> -IPAddressDeny=any
> -LockPersonality=yes
> -MemoryDenyWriteExecute=yes
> -NoNewPrivileges=yes
> -PrivateTmp=yes
> -ProtectControlGroups=yes
> -ProtectHome=yes
> -ProtectHostname=yes
> -ProtectKernelModules=yes
> -ProtectKernelLogs=yes
> -ProtectSystem=strict
> -RestrictAddressFamilies=AF_UNIX
> -RestrictNamespaces=yes
> -RestrictRealtime=yes
> -RestrictSUIDSGID=yes
> -SystemCallArchitectures=native
> -SystemCallErrorNumber=EPERM
> -SystemCallFilter=@system-service
> -
> -[Install]
> -WantedBy=sysinit.target
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
> deleted file mode 100644
> index f0aa3ff93f..0000000000
> --- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -SUMMARY = "Random number generator daemon"
> -DESCRIPTION = "Check and feed random data from hardware device to kernel"
> -HOMEPAGE = "https://github.com/nhorman/rng-tools"
> -BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
> -LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "openssl libcap"
> -
> -SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
> -           file://init \
> -           file://default \
> -           file://rng-tools.service \
> -           "
> -SRCREV = "e061c313b95890eb5fa0ada0cd6eec619dafdfe2"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools update-rc.d systemd pkgconfig
> -
> -EXTRA_OECONF = "--without-rtlsdr"
> -
> -PACKAGECONFIG ??= "libjitterentropy"
> -PACKAGECONFIG:libc-musl = "libargp libjitterentropy"
> -
> -PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
> -PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
> -PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
> -PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2"
> -PACKAGECONFIG[qrypt] = "--with-qrypt,--without-qrypt,curl"
> -
> -INITSCRIPT_PACKAGES = "${PN}-service"
> -INITSCRIPT_NAME:${PN}-service = "rng-tools"
> -INITSCRIPT_PARAMS:${PN}-service = "start 03 2 3 4 5 . stop 30 0 6 1 ."
> -
> -SYSTEMD_PACKAGES = "${PN}-service"
> -SYSTEMD_SERVICE:${PN}-service = "rng-tools.service"
> -
> -CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
> -
> -PACKAGES =+ "${PN}-service"
> -
> -FILES:${PN}-service += " \
> -    ${sysconfdir}/init.d/rng-tools \
> -    ${sysconfdir}/default/rng-tools \
> -"
> -
> -# Refer autogen.sh in rng-tools
> -do_configure:prepend() {
> -    cp ${S}/README.md ${S}/README
> -}
> -
> -do_install:append() {
> -    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
> -    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
> -    install -Dm 0644 ${WORKDIR}/rng-tools.service \
> -                     ${D}${systemd_system_unitdir}/rng-tools.service
> -    sed -i \
> -        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -        -e 's,@SBINDIR@,${sbindir},g' \
> -        ${D}${sysconfdir}/init.d/rng-tools \
> -        ${D}${systemd_system_unitdir}/rng-tools.service
> -
> -    if [ "${@bb.utils.contains('PACKAGECONFIG', 'nistbeacon', 'yes', 'no', d)}" = "yes" ]; then
> -        sed -i \
> -            -e '/^IPAddressDeny=any/d' \
> -            -e '/^RestrictAddressFamilies=/ s/$/ AF_INET AF_INET6/' \
> -            ${D}${systemd_system_unitdir}/rng-tools.service
> -    fi
> -}
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193523): https://lists.openembedded.org/g/openembedded-core/message/193523
> Mute This Topic: https://lists.openembedded.org/mt/103649050/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

