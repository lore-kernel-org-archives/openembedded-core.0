Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1EDC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 21:18:04 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.95609.1705353477948316283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 13:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8zc+lrP;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5961a2726aaso4938304eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705353477; x=1705958277; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mocwvoN2+OWJ+GlhcBqcBJuCY638b86g079IHGmAw+s=;
        b=W8zc+lrPp2UYDkSmue7x5F+Cx2H5kKvupzwf82VDj1IzoPY60w67vdi0wPFbZzRtWj
         w9vQtvFE2cyC9u+0vTTJkJVAGuEAZZkiL9ms+R5f3kv8f3gaFeTOS3CIVvDLcF3jXywN
         920IZmBdnHIY60HhVpRO6Xi9Yk0eXbqNfk8CzTM0yZNltgoAUDPEYzUGJMt8EKvzdZL4
         6I83ys625iNnKwbTc7XftwaKLgBJQmZWHYyPnhaq+lBf9kMqz4HXRKt2nWA3RttJiI22
         iviNkjC1PYWC+ufTzsNwZ16IOebLiOSbLG597JtwEm+Sk5naNQcVFL1RGH3Cd9C9AeBH
         TumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705353477; x=1705958277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mocwvoN2+OWJ+GlhcBqcBJuCY638b86g079IHGmAw+s=;
        b=Ndo+T0tVCmV7Z7SVrkd49s1DaMgI0ObTC9iPZO4xVnhDncgHsjE0SnSzxB5TSEkd76
         LKvUl6J/KJ2FjnGCQz2lKmppKTfg/uBlVod0MbrNMfZ1f+jIAnxJ5Jw/1T+L683WYD1x
         MhrHFQ3JkltK19Mb/6BfkucKYzkZY4oameQUToMSjY91tN5YUgmYnq1pgIo3Y7FCUQop
         SW6/HTtzvtqzf1pVdndiTCsRZDTJlw33vZNaBX3I6hy85NLkLR9VC6mE2KUxjw9Qinw1
         KemSSx+TDc5KIZtEwrZ/EKyQThNNpNFU10e8QymiYNuXpeBMzGZ6g5oPCeY49wgvinQd
         I58g==
X-Gm-Message-State: AOJu0YwJ9f8yoH0pOKYJmA12QFu6SV0EDCoIVFzaF4EsPZyX7JS7B+Wn
	rEq9diSEAjhmmXW3BWi67do46nPjlxxzK1ki2ok=
X-Google-Smtp-Source: AGHT+IGJOonZweJhU3xiLmJDhaifOqqV2xArBdB8vmxbdD+01fJ+SRftsQgVGvXdqUL/D6PHb1LG/6lJmccgdvb3MIU=
X-Received: by 2002:a05:6870:1608:b0:206:7e48:71a4 with SMTP id
 b8-20020a056870160800b002067e4871a4mr5639525oae.100.1705353476944; Mon, 15
 Jan 2024 13:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20240110202501.1554379-1-Randy.MacLeod@windriver.com>
 <20240115165859d332c9cb@mail.local> <cfa90344-0753-4ae1-9979-2c0f12a33d50@windriver.com>
In-Reply-To: <cfa90344-0753-4ae1-9979-2c0f12a33d50@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jan 2024 13:17:31 -0800
Message-ID: <CAMKF1sqCguovAJM70ce=npcTy5A4upghK6kE5yisNYGP8+DO6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: move to meta-oe
To: randy.macleod@windriver.com
Cc: alexandre.belloni@bootlin.com, stephane.desneux@iot.bzh, 
	jsmoeller@linuxfoundation.org, openembedded-core@lists.openembedded.org, 
	anuj.mittal@intel.com, david.zuhn@sonos.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 21:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193802

On Mon, Jan 15, 2024 at 12:20=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2024-01-15 11:58 a.m., Alexandre Belloni via lists.openembedded.org wr=
ote:
>
> This is breaking meta-agl-core until this gets into meta-oe:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3849/s=
teps/14/logs/stdio
>

Thanks for reporting, this patch should be in master meta-openembedded
with today's update lot.

> Thanks Alexandre.
>
>
> Stephane, Jan-Simon,
>
> Is rng-tools actually still a requirement for meta-agl ?
> It was added back in 2018 but the kernel algorithm improved as of 5.6:
> https://lists.openembedded.org/g/openembedded-core/message/178518
>
> ../Randy
>
> commit c55cb9e43a4ff26224cd917f91c057f15535ee3b
> Author: Stephane Desneux <stephane.desneux@iot.bzh>
> Date:   Thu Sep 6 17:53:26 2018
>
>     agl-profile-core/packagegroup-agl-core-boot: add rng-tools
>
>     On some boards (typically Minnowboard Max), the kernel's random numbe=
r entropy
>     pool may fill too slowly.  As a consequence, if many processes ask fo=
r random
>     data at the same time, the reads on /dev/random are blocked until the=
 entropy
>     pool has been filled.
>
>     This patch adds rng-tools in the core images: the rngd daemon will st=
art at boot
>     and fill the entropy pool.
>
>     Bug-AGL: SPEC-1655
>
>     Change-Id: Icbcf6a9ea685774dd13e33597689a3fd05aaadf4
>     Signed-off-by: Stephane Desneux <stephane.desneux@iot.bzh>
>
>
> On 10/01/2024 15:25:01-0500, Randy MacLeod via lists.openembedded.org wro=
te:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Nothing in oe-core depends on rng-tools anymore:
>    e7e1bc43ca rng-tools: splitting the rng-tools systemd/sysvinit serivce=
 as a package
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
>  delete mode 100644 meta/recipes-support/rng-tools/rng-tools/rng-tools.se=
rvice
>  delete mode 100644 meta/recipes-support/rng-tools/rng-tools_6.16.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 8dc63b138e..31023021ac 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -739,7 +739,6 @@ RECIPE_MAINTAINER:pn-repo =3D "Unassigned <unassigned=
@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-resolvconf =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-rgb =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia <hongxu.jia@windriver.com>"
> -RECIPE_MAINTAINER:pn-rng-tools =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-rpcsvc-proto =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-rpm =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-rsync =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/reci=
pes-support/rng-tools/rng-tools/default
> deleted file mode 100644
> index b9f8e03635..0000000000
> --- a/meta/recipes-support/rng-tools/rng-tools/default
> +++ /dev/null
> @@ -1 +0,0 @@
> -EXTRA_ARGS=3D"-r /dev/hwrng"
> diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes=
-support/rng-tools/rng-tools/init
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
> -rngd=3D@SBINDIR@/rngd
> -test -x "$rngd" || exit 1
> -
> -[ -r @SYSCONFDIR@/default/rng-tools ] && . "@SYSCONFDIR@/default/rng-too=
ls"
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
> -    echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restar=
t|force-reload}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b=
/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> deleted file mode 100644
> index 5ae2fba215..0000000000
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -[Unit]
> -Description=3DHardware RNG Entropy Gatherer Daemon
> -DefaultDependencies=3Dno
> -Conflicts=3Dshutdown.target
> -Before=3Dsysinit.target shutdown.target
> -ConditionVirtualization=3D!container
> -
> -[Service]
> -EnvironmentFile=3D-@SYSCONFDIR@/default/rng-tools
> -ExecStart=3D@SBINDIR@/rngd -f $EXTRA_ARGS
> -CapabilityBoundingSet=3DCAP_SYS_ADMIN
> -IPAddressDeny=3Dany
> -LockPersonality=3Dyes
> -MemoryDenyWriteExecute=3Dyes
> -NoNewPrivileges=3Dyes
> -PrivateTmp=3Dyes
> -ProtectControlGroups=3Dyes
> -ProtectHome=3Dyes
> -ProtectHostname=3Dyes
> -ProtectKernelModules=3Dyes
> -ProtectKernelLogs=3Dyes
> -ProtectSystem=3Dstrict
> -RestrictAddressFamilies=3DAF_UNIX
> -RestrictNamespaces=3Dyes
> -RestrictRealtime=3Dyes
> -RestrictSUIDSGID=3Dyes
> -SystemCallArchitectures=3Dnative
> -SystemCallErrorNumber=3DEPERM
> -SystemCallFilter=3D@system-service
> -
> -[Install]
> -WantedBy=3Dsysinit.target
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/reci=
pes-support/rng-tools/rng-tools_6.16.bb
> deleted file mode 100644
> index f0aa3ff93f..0000000000
> --- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -SUMMARY =3D "Random number generator daemon"
> -DESCRIPTION =3D "Check and feed random data from hardware device to kern=
el"
> -HOMEPAGE =3D "https://github.com/nhorman/rng-tools"
> -BUGTRACKER =3D "https://github.com/nhorman/rng-tools/issues"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -DEPENDS =3D "openssl libcap"
> -
> -SRC_URI =3D "git://github.com/nhorman/rng-tools.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> -           file://init \
> -           file://default \
> -           file://rng-tools.service \
> -           "
> -SRCREV =3D "e061c313b95890eb5fa0ada0cd6eec619dafdfe2"
> -
> -S =3D "${WORKDIR}/git"
> -
> -inherit autotools update-rc.d systemd pkgconfig
> -
> -EXTRA_OECONF =3D "--without-rtlsdr"
> -
> -PACKAGECONFIG ??=3D "libjitterentropy"
> -PACKAGECONFIG:libc-musl =3D "libargp libjitterentropy"
> -
> -PACKAGECONFIG[libargp] =3D "--with-libargp,--without-libargp,argp-standa=
lone,"
> -PACKAGECONFIG[libjitterentropy] =3D "--enable-jitterentropy,--disable-ji=
tterentropy,libjitterentropy"
> -PACKAGECONFIG[libp11] =3D "--with-pkcs11,--without-pkcs11,libp11 openssl=
"
> -PACKAGECONFIG[nistbeacon] =3D "--with-nistbeacon,--without-nistbeacon,cu=
rl libxml2"
> -PACKAGECONFIG[qrypt] =3D "--with-qrypt,--without-qrypt,curl"
> -
> -INITSCRIPT_PACKAGES =3D "${PN}-service"
> -INITSCRIPT_NAME:${PN}-service =3D "rng-tools"
> -INITSCRIPT_PARAMS:${PN}-service =3D "start 03 2 3 4 5 . stop 30 0 6 1 ."
> -
> -SYSTEMD_PACKAGES =3D "${PN}-service"
> -SYSTEMD_SERVICE:${PN}-service =3D "rng-tools.service"
> -
> -CFLAGS +=3D " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
> -
> -PACKAGES =3D+ "${PN}-service"
> -
> -FILES:${PN}-service +=3D " \
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
> -    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-to=
ols
> -    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
> -    install -Dm 0644 ${WORKDIR}/rng-tools.service \
> -                     ${D}${systemd_system_unitdir}/rng-tools.service
> -    sed -i \
> -        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -        -e 's,@SBINDIR@,${sbindir},g' \
> -        ${D}${sysconfdir}/init.d/rng-tools \
> -        ${D}${systemd_system_unitdir}/rng-tools.service
> -
> -    if [ "${@bb.utils.contains('PACKAGECONFIG', 'nistbeacon', 'yes', 'no=
', d)}" =3D "yes" ]; then
> -        sed -i \
> -            -e '/^IPAddressDeny=3Dany/d' \
> -            -e '/^RestrictAddressFamilies=3D/ s/$/ AF_INET AF_INET6/' \
> -            ${D}${systemd_system_unitdir}/rng-tools.service
> -    fi
> -}
> --
> 2.34.1
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193798): https://lists.openembedded.org/g/openembedde=
d-core/message/193798
> Mute This Topic: https://lists.openembedded.org/mt/103649050/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

