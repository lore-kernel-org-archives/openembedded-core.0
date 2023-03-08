Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55162C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 17:28:42 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.14444.1678296514917164546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 09:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rc0YNOGF;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: peron.clem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id j10so5940611qkg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678296514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjWUR2OOHngU3h3k0pcXQZjjzv73fMYceV7LO8QM7ak=;
        b=Rc0YNOGF33c2E7TKCWivGReg6ryfZiTB5/HmAbiUL/fTT7B3zRzLWymAtDqW1wYGNy
         B3wE0OPBZ7lsdB6oHsLam1LzDDqT6o0JdC4HguKZaiDIS+wmi+J3ki9HlZlAv2HUOrRz
         es8F6gZ9vn6o6CaaE7XPVIwB6H54b+mEDL9bxzOiEHYi0aUAmZkPoDNOXyJhIRj0Zfgo
         XIzs/mD/O2mn4cUslsRESyfa8veX25Z1qbi1z+kAYXWEc5suokfyKFENBoICiy40Ha3L
         bYSozG0bsEMRn1kkj+ubXKg+GxR5RcGFTVd3kYE4iJ0PqGrRMrFUlApIn49bAbSngxJS
         clpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjWUR2OOHngU3h3k0pcXQZjjzv73fMYceV7LO8QM7ak=;
        b=R0df2feZFwavJqHkJ5tkz0I0UG4Eqj5HXudTQotmrRXIJ2/7AJ5YoR2AYooWzWBecN
         UDjFYLOhvltXleAqLkGUVO4CfdWSRtQ+Ez/PYeStBrqXH/qEpUAS2F07rrAdu7YvAM8E
         fI6Lu5QU5cJ61ALZkNyMQ5j0qi1xMkazP44zb2PYj2E2l7UI4ZXK/VevS0r4Ts70j5Qf
         JzJaX+vd6/3RbPp618+DIS5FE7qWmNL1oTyi3TDoEaodMBXIwEygTHd2ouOwd4E21dCi
         BZt3IHvVU47V5Wwv/g6Z9naaEqu1V0yeV6rrsdgOBLxO+sg7wOuZ5FoZXbyqkHCmXqSi
         Ah7A==
X-Gm-Message-State: AO0yUKWBP1PJkd3yY0ndKfD64RcG4MGb+AXt9X8wuO6xiteiJy6GIlse
	5yvG+BuXTokVRv+7T+OM3D9QfjhM782tTy/rhL8=
X-Google-Smtp-Source: AK7set8qBkCVqoplzXKHAfm+mDmKgwJLSAhm2mYPv9yGhyBWK0fqkuOegCJcSFboeiM+wW7oPHL7xA6M178OBoyiKRI=
X-Received: by 2002:ae9:ee0a:0:b0:729:55b0:a86 with SMTP id
 i10-20020ae9ee0a000000b0072955b00a86mr5295350qkg.2.1678296513734; Wed, 08 Mar
 2023 09:28:33 -0800 (PST)
MIME-Version: 1.0
References: <174A8107E1CB2F32.12537@lists.openembedded.org>
In-Reply-To: <174A8107E1CB2F32.12537@lists.openembedded.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 8 Mar 2023 18:28:23 +0100
Message-ID: <CAJiuCcd7TwBYuKXSA4Civr6=GrAymm6zTvakpzP=sYpwPLQNxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: openembedded-core@lists.openembedded.org, 
	Brenda Streiff <brenda.streiff@ni.com>, peron.clem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 17:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178185

Hi Michael,

On Wed, 8 Mar 2023 at 18:14, Cl=C3=A9ment P=C3=A9ron via lists.openembedded=
.org
<peron.clem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Split out the QEMU guest agent into a separate package. The agent is
> intended to be installed within a QEMU VM guest where a user is likely
> to not want to have the rest of the QEMU installation within it.
>
> Additionally, an initscript, udev rules file, and systemd unit file are
> added to the package so that the guest agent can start automatically;
> the former two come from Debian's packaging for qemu-guest-agent.
>
> Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>
> Changes since v3:
>  - fix missing comma in udev rule
>
> Changes since v2:
>  - Add missing files
>  - rebase on top of master
>
> Changes since v1:
>  - Fix systemd-service using PN where it should not
>
>  meta/recipes-devtools/qemu/qemu.inc           | 35 +++++++-
>  .../qemu/qemu/qemu-guest-agent.init           | 84 +++++++++++++++++++
>  .../qemu/qemu/qemu-guest-agent.udev           |  2 +

In this patch,

qemu-guest-agent.init and qemu-guest-agent.udev come from the Debian
source repo.

Could you confirm that these files use the same license as the repo?
Or are they following another one?


Thanks for your help,
Regards
Clement



>  3 files changed, 120 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 1e768b560d..b41055fe5d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  RDEPENDS:${PN}-ptest =3D "bash"
>
>  require qemu-targets.inc
> -inherit pkgconfig ptest
> +inherit pkgconfig ptest update-rc.d systemd
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
>                      file://COPYING.LIB;endline=3D24;md5=3D8c5efda6cf1e1b=
03dcfd0e6c0d271c7f"
> @@ -32,6 +32,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://0001-configure-Fix-check-tcg-not-executing-any-tests.p=
atch \
>             file://0001-Revert-linux-user-add-more-compat-ioctl-definitio=
ns.patch \
>             file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-=
mou.patch \
> +           file://qemu-guest-agent.init \
> +           file://qemu-guest-agent.udev \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> @@ -132,6 +134,20 @@ do_configure[cleandirs] +=3D "${B}"
>  do_install () {
>         export STRIP=3D""
>         oe_runmake 'DESTDIR=3D${D}' install
> +
> +       # If we built the guest agent, also install startup/udev rules
> +       if [ -e "${D}${bindir}/qemu-ga" ]; then
> +               install -d ${D}${sysconfdir}/init.d/
> +               install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${sy=
sconfdir}/init.d/qemu-guest-agent
> +               sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d/q=
emu-guest-agent
> +
> +               install -d ${D}${sysconfdir}/udev/rules.d/
> +               install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${sy=
sconfdir}/udev/rules.d/60-qemu-guest-agent.rules
> +
> +               install -d ${D}${systemd_unitdir}/system/
> +               install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.ser=
vice ${D}${systemd_unitdir}/system
> +               sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_unit=
dir}/system/qemu-guest-agent.service
> +       fi
>  }
>
>  # The following fragment will create a wrapper for qemu-mips user emulat=
ion
> @@ -210,3 +226,20 @@ PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jac=
k,jack,"
>  INSANE_SKIP:${PN} =3D "arch"
>
>  FILES:${PN} +=3D "${datadir}/icons"
> +
> +# Put the guest agent in a separate package
> +PACKAGES =3D+ "${PN}-guest-agent"
> +SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> +FILES:${PN}-guest-agent +=3D " \
> +    ${bindir}/qemu-ga \
> +    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
> +    ${sysconfdir}/init.d/qemu-guest-agent \
> +    ${systemd_unitdir}/system/qemu-guest-agent.service \
> +"
> +
> +INITSCRIPT_PACKAGES =3D "${PN}-guest-agent"
> +INITSCRIPT_NAME:${PN}-guest-agent =3D "qemu-guest-agent"
> +INITSCRIPT_PARAMS:${PN}-guest-agent =3D "defaults"
> +
> +SYSTEMD_PACKAGES =3D "${PN}-guest-agent"
> +SYSTEMD_SERVICE:${PN}-guest-agent =3D "qemu-guest-agent.service"
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init b/meta=
/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> new file mode 100644
> index 0000000000..493da0ef1a
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> @@ -0,0 +1,84 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:            qemu-guest-agent
> +# Required-Start:      $remote_fs $syslog
> +# Required-Stop:       $remote_fs $syslog
> +# Default-Start:       2 3 4 5
> +# Default-Stop:                0 1 6
> +# Short-Description:   QEMU Guest Agent
> +### END INIT INFO
> +#
> +# Do not configure this file. Edit /etc/default/qemu-guest-agent
> +#
> +
> +set -e
> +
> +. /etc/init.d/functions
> +
> +PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> +DESC=3D"QEMU Guest Agent"
> +NAME=3Dqemu-ga
> +DAEMON=3D@bindir@/$NAME
> +PIDFILE=3D/var/run/$NAME.pid
> +
> +# config
> +DAEMON_ARGS=3D""
> +# default transport
> +TRANSPORT=3Dvirtio-serial:/dev/virtio-ports/org.qemu.guest_agent.0
> +NO_START=3D0
> +
> +test ! -r /etc/default/qemu-guest-agent || . /etc/default/qemu-guest-age=
nt
> +test "$NO_START" =3D "0" || exit 0
> +test -x "$DAEMON" || exit 0
> +
> +#
> +# Function that checks whenever system has necessary environment
> +# It also splits $TRANSPORT into $method and $path
> +#
> +do_check_transport() {
> +       method=3D${TRANSPORT%%:*};
> +       path=3D${TRANSPORT#*:}
> +       case "$method" in
> +           virtio-serial | isa-serial)
> +               if [ ! -e "$path" ]; then
> +                   echo "$NAME: transport endpoint not found, not starti=
ng"
> +                   return 1
> +               fi
> +               ;;
> +       esac
> +}
> +
> +case "$1" in
> +  start)
> +       do_check_transport || exit 0
> +       echo -n "Starting $DESC: "
> +       start-stop-daemon -S -p $PIDFILE -x "$DAEMON" -- \
> +               $DAEMON_ARGS -d -m "$method" -p "$path"
> +       echo "$NAME."
> +       ;;
> +  stop)
> +       echo -n "Stopping $DESC: "
> +       start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
> +       echo "$NAME."
> +       ;;
> +  status)
> +       status "$DAEMON"
> +       exit $?
> +       ;;
> +  restart|force-reload)
> +       do_check_transport || exit 0
> +       echo -n "Restarting $DESC: "
> +       start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
> +       sleep 1
> +       start-stop-daemon -S -p $PIDFILE -x "$DAEMON" -- \
> +               $DAEMON_ARGS -d -m "$method" -p "$path"
> +       echo "$NAME."
> +       ;;
> +  *)
> +       N=3D/etc/init.d/$NAME
> +       echo "Usage: $N {start|stop|status|restart|force-reload}" >&2
> +       exit 1
> +       ;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev b/meta=
/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
> new file mode 100644
> index 0000000000..47097057e3
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=3D=3D"virtio-ports", ATTR{name}=3D=3D"org.qemu.guest_agent.0",=
 \
> +  TAG+=3D"systemd", ENV{SYSTEMD_WANTS}=3D"qemu-guest-agent.service"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178181): https://lists.openembedded.org/g/openembedde=
d-core/message/178181
> Mute This Topic: https://lists.openembedded.org/mt/97477394/4240582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pe=
ron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

