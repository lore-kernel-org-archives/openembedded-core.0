Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC9AC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 20:23:09 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.3937.1678306981037467149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 12:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pXNmsUsC;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: peron.clem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id m4so18045qvq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 12:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678306980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ1b3rUVqqCiveC4I7IRLtCQ454iKBud64Ou1zYB5cE=;
        b=pXNmsUsCsYTWHkZq2kSyJBw2I5Mac1vPACJa6bZDB4AzO3r9mSeoRf/ufQ0+CMg1ep
         W9NfLHAfKf0vlUeb7/lArBoMzhMoQ9XXpD1b7bTVgY/5rUEI0OqDh2Rqd22Auy9VISKl
         j9PX7smsP7r0lBddOmemjD3DORqBNkh80hPk8rnmow9GO3u5k8n4157OejembNDsP3Hf
         6oikOJ/wxva+V2df9PODeix6tUieWs5uutBCkvU1r/S8Yihj7fSwYNVtB/NEiTuG8t+T
         fPFkF8PQ8EaqV2dPpK5Tx/Q6bQPb9eEEvwO99G/Cppdfuqbodur6tx00gJ1fcV3urGa2
         3xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678306980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJ1b3rUVqqCiveC4I7IRLtCQ454iKBud64Ou1zYB5cE=;
        b=u+6AeEszERb1LV280AP+XwbBp3Pj4NYYUHylm1mwqCT/bruMsa9DR2MHh6OTNxP7II
         sd9xCunHhwIQSAEn/+KWpc7gpW+zWR/EL8o+KttP26HfKe3wtZOutgHyaKhixhgfMrvI
         SRb61iondMcyCEkuRpoYCgxllUEa6xFuGVpxTPGIvk0w5BnIvRoKqOkoNck6TiCZzS8N
         Mhey+I6l+rvezDxUxB01hIc4CsAlrcjv/2HBi/7zoMvLka/zQMz/l1HXrNt3wQNrzX9t
         6LfG42Ntuvi4LFIk5fuBkAn5zntJ2pqQ6e+lq1iXuPCesNxQUpX66VFYuvXvswNv8rpK
         N7/w==
X-Gm-Message-State: AO0yUKUrDn9mQZnN2armu1tBvuIQxq5m0U7Mc5eotXRqawHODMKCI+p8
	6vIgnCixPpfsSouMpuSy9Y3KRWJ+QOqjPpibTmA=
X-Google-Smtp-Source: AK7set9Ats1p2ZULC56QtTiWJ8Ea8v+vf0t/fZk/P4S3f2x8kZt7eiMpzbVG8c4RMXcTq1lPWmSfwjmbeAyUz5nQfFE=
X-Received: by 2002:a05:6214:1767:b0:56f:378:951 with SMTP id
 et7-20020a056214176700b0056f03780951mr5447448qvb.1.1678306979950; Wed, 08 Mar
 2023 12:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20230308171437.35160-1-peron.clem@gmail.com> <14246ffa7ccd8f1ee6b71f5002898b0b58b6bd06.camel@linuxfoundation.org>
In-Reply-To: <14246ffa7ccd8f1ee6b71f5002898b0b58b6bd06.camel@linuxfoundation.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 8 Mar 2023 21:22:49 +0100
Message-ID: <CAJiuCccJfBbJkM1S+CwMJ0wEnRaV7k8RkKzoJTngLH2d6W1UEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Brenda Streiff <brenda.streiff@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 20:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178197

Hi Richard,

On Wed, 8 Mar 2023 at 18:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-03-08 at 18:14 +0100, Cl=C3=A9ment P=C3=A9ron wrote:
> > Split out the QEMU guest agent into a separate package. The agent is
> > intended to be installed within a QEMU VM guest where a user is likely
> > to not want to have the rest of the QEMU installation within it.
> >
> > Additionally, an initscript, udev rules file, and systemd unit file are
> > added to the package so that the guest agent can start automatically;
> > the former two come from Debian's packaging for qemu-guest-agent.
> >
> > Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >
> > Changes since v3:
> >  - fix missing comma in udev rule
> >
> > Changes since v2:
> >  - Add missing files
> >  - rebase on top of master
> >
> > Changes since v1:
> >  - Fix systemd-service using PN where it should not
> >
> >  meta/recipes-devtools/qemu/qemu.inc           | 35 +++++++-
> >  .../qemu/qemu/qemu-guest-agent.init           | 84 +++++++++++++++++++
> >  .../qemu/qemu/qemu-guest-agent.udev           |  2 +
> >  3 files changed, 120 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.in=
it
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.ud=
ev
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index 1e768b560d..b41055fe5d 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> >  RDEPENDS:${PN}-ptest =3D "bash"
> >
> >  require qemu-targets.inc
> > -inherit pkgconfig ptest
> > +inherit pkgconfig ptest update-rc.d systemd
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a7=
2fbac \
> >                      file://COPYING.LIB;endline=3D24;md5=3D8c5efda6cf1e=
1b03dcfd0e6c0d271c7f"
> > @@ -32,6 +32,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
> >             file://0001-configure-Fix-check-tcg-not-executing-any-tests=
.patch \
> >             file://0001-Revert-linux-user-add-more-compat-ioctl-definit=
ions.patch \
> >             file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sy=
s-mou.patch \
> > +           file://qemu-guest-agent.init \
> > +           file://qemu-guest-agent.udev \
> >             "
> >  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > @@ -132,6 +134,20 @@ do_configure[cleandirs] +=3D "${B}"
> >  do_install () {
> >       export STRIP=3D""
> >       oe_runmake 'DESTDIR=3D${D}' install
> > +
> > +     # If we built the guest agent, also install startup/udev rules
> > +     if [ -e "${D}${bindir}/qemu-ga" ]; then
> > +             install -d ${D}${sysconfdir}/init.d/
> > +             install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${sy=
sconfdir}/init.d/qemu-guest-agent
> > +             sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d/q=
emu-guest-agent
> > +
> > +             install -d ${D}${sysconfdir}/udev/rules.d/
> > +             install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${sy=
sconfdir}/udev/rules.d/60-qemu-guest-agent.rules
> > +
> > +             install -d ${D}${systemd_unitdir}/system/
> > +             install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.ser=
vice ${D}${systemd_unitdir}/system
> > +             sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_unit=
dir}/system/qemu-guest-agent.service
> > +     fi
> >  }
> >
> >  # The following fragment will create a wrapper for qemu-mips user emul=
ation
> > @@ -210,3 +226,20 @@ PACKAGECONFIG[jack] =3D "--enable-jack,--disable-j=
ack,jack,"
> >  INSANE_SKIP:${PN} =3D "arch"
> >
> >  FILES:${PN} +=3D "${datadir}/icons"
> > +
> > +# Put the guest agent in a separate package
> > +PACKAGES =3D+ "${PN}-guest-agent"
> > +SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> > +FILES:${PN}-guest-agent +=3D " \
> > +    ${bindir}/qemu-ga \
> > +    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
> > +    ${sysconfdir}/init.d/qemu-guest-agent \
> > +    ${systemd_unitdir}/system/qemu-guest-agent.service \
> > +"
> > +
> > +INITSCRIPT_PACKAGES =3D "${PN}-guest-agent"
> > +INITSCRIPT_NAME:${PN}-guest-agent =3D "qemu-guest-agent"
> > +INITSCRIPT_PARAMS:${PN}-guest-agent =3D "defaults"
> > +
> > +SYSTEMD_PACKAGES =3D "${PN}-guest-agent"
> > +SYSTEMD_SERVICE:${PN}-guest-agent =3D "qemu-guest-agent.service"
> > diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init b/me=
ta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> > new file mode 100644
> > index 0000000000..493da0ef1a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> > @@ -0,0 +1,84 @@
> > +#!/bin/sh
> > +### BEGIN INIT INFO
> > +# Provides:          qemu-guest-agent
> > +# Required-Start:    $remote_fs $syslog
> > +# Required-Stop:     $remote_fs $syslog
> > +# Default-Start:     2 3 4 5
> > +# Default-Stop:              0 1 6
> > +# Short-Description: QEMU Guest Agent
> > +### END INIT INFO
> > +#
> > +# Do not configure this file. Edit /etc/default/qemu-guest-agent
> > +#
>
> Do we install a /etc/default/qemu-guest-agent? The whole comment block
> above can probably be dropped including the INIT INFO as it isn't
> applicable for us?

Okay I will drop them,

>
> Do we need to mention which license this script is under and where it
> came from (seemingly Debian)?

Debian maintainer replies that it's under GPLv2, the same as the qemu packa=
ge.

I don't know if it's fine or If I should explicitly mention the origin
somewhere.

Best,
Clement

>
> Cheers,
>
> Richard

