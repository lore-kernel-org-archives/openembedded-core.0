Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862CCC6FD19
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 21:31:49 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.5865.1678311101932679110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 13:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dqodO714;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: peron.clem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id p12so42558qki.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678311101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbRlrzTkqUHoJYWenpxnDliwL76OlFpfXsp2kQlbvIw=;
        b=dqodO714BMG5olW5kChhaUmoidVkeiVBifaBUcF/09oa4cA8DXLXxHVPtKiczKQygX
         AthJ7M1m3BsNFuDBNqk7DDzcKuUw6yvKmeRVcXmi1e69VEIkDOdgo8oFK8M4i+G2nYow
         djnv7u58cc1ReEDmwZTNCT7nVPemUmOcGg1lYmk3XDB2/idJ7VuBioW4jdKedxN/9530
         8dsjNpYRwLPwa+zIJeT6Dq3o3KESJPGEs2PXP0PcLLb7CLmbF/8L6zV8baEFwzr9Ki52
         2A1trPaYi19tYD6u4zZl2C+498N1iQewTQMLYMQpN29qcSSznHEpNazkP9jwAqO8dBCs
         EPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbRlrzTkqUHoJYWenpxnDliwL76OlFpfXsp2kQlbvIw=;
        b=B0QfWauewA9MpCmx88s5HVICccWedAKlY34U6eri8AKWGo6lQnCnjkuFMLn+iLVBlo
         CuAiHoTFmItZaywJTGDUMlzgjL9aiZNXi7NarMKPMDJpZXF3bU8JDDAp7xJA1CfCLpPW
         WDjkzpjuMQqkBYR8+GQALRCcA+KlFiL7pvOEL3QVeztDHmQaYivOnEvq4xQwfd8+o019
         WrR78FY2hlUgNk2sq8hem9j9CaIcV3ANtWO30kogk5CLJxn4SJNciAxxe037sr4R2r7F
         wlMtp5kF/Ak+Tod5qiCmNr40ZKFnAJIQjo/6cAlCBoXpmJCgBRtMoHPADlnK8VbvdOtZ
         kYKw==
X-Gm-Message-State: AO0yUKVYTX8BJRrJJtIVw2BBUPbxHcD0lLaRp5fGkveqI0znwsNHm/8x
	p/5sbZc5q9ZyB2PzwSh/wU4xOhNmK/xp5II/S98=
X-Google-Smtp-Source: AK7set8gj1pZd7p0T5V2tc25nCFwnGCNbaaAPEiMtco79xfjoPapSaVS5ZHDhrlpC7AdxP+Wi+khQ2RgvV9jtmvTJbE=
X-Received: by 2002:a05:620a:682:b0:742:72ce:2710 with SMTP id
 f2-20020a05620a068200b0074272ce2710mr4246716qkh.2.1678311100891; Wed, 08 Mar
 2023 13:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20230308171437.35160-1-peron.clem@gmail.com> <14246ffa7ccd8f1ee6b71f5002898b0b58b6bd06.camel@linuxfoundation.org>
 <CAJiuCccJfBbJkM1S+CwMJ0wEnRaV7k8RkKzoJTngLH2d6W1UEg@mail.gmail.com> <ec6b74a03d081753d02199661b5d085b353799aa.camel@linuxfoundation.org>
In-Reply-To: <ec6b74a03d081753d02199661b5d085b353799aa.camel@linuxfoundation.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 8 Mar 2023 22:31:29 +0100
Message-ID: <CAJiuCceTVexe7fgWxLcnzEWF25sUEMA_DVB4EqJC2XAh9DTo1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Michael Tokarev <mjt@tls.msk.ru>
Cc: openembedded-core@lists.openembedded.org, 
	Brenda Streiff <brenda.streiff@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 21:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178199

On Wed, 8 Mar 2023 at 22:15, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-03-08 at 21:22 +0100, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Richard,
> >
> > On Wed, 8 Mar 2023 at 18:31, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2023-03-08 at 18:14 +0100, Cl=C3=A9ment P=C3=A9ron wrote:
> > > > Split out the QEMU guest agent into a separate package. The agent i=
s
> > > > intended to be installed within a QEMU VM guest where a user is lik=
ely
> > > > to not want to have the rest of the QEMU installation within it.
> > > >
> > > > Additionally, an initscript, udev rules file, and systemd unit file=
 are
> > > > added to the package so that the guest agent can start automaticall=
y;
> > > > the former two come from Debian's packaging for qemu-guest-agent.
> > > >
> > > > Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >
> > > > Changes since v3:
> > > >  - fix missing comma in udev rule
> > > >
> > > > Changes since v2:
> > > >  - Add missing files
> > > >  - rebase on top of master
> > > >
> > > > Changes since v1:
> > > >  - Fix systemd-service using PN where it should not
> > > >
> > > >  meta/recipes-devtools/qemu/qemu.inc           | 35 +++++++-
> > > >  .../qemu/qemu/qemu-guest-agent.init           | 84 +++++++++++++++=
++++
> > > >  .../qemu/qemu/qemu-guest-agent.udev           |  2 +
> > > >  3 files changed, 120 insertions(+), 1 deletion(-)
> > > >  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agen=
t.init
> > > >  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agen=
t.udev
> > > >
> > > > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-dev=
tools/qemu/qemu.inc
> > > > index 1e768b560d..b41055fe5d 100644
> > > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > > @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> > > >  RDEPENDS:${PN}-ptest =3D "bash"
> > > >
> > > >  require qemu-targets.inc
> > > > -inherit pkgconfig ptest
> > > > +inherit pkgconfig ptest update-rc.d systemd
> > > >
> > > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e=
15a72fbac \
> > > >                      file://COPYING.LIB;endline=3D24;md5=3D8c5efda6=
cf1e1b03dcfd0e6c0d271c7f"
> > > > @@ -32,6 +32,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${P=
V}.tar.xz \
> > > >             file://0001-configure-Fix-check-tcg-not-executing-any-t=
ests.patch \
> > > >             file://0001-Revert-linux-user-add-more-compat-ioctl-def=
initions.patch \
> > > >             file://0002-Revert-linux-user-fix-compat-with-glibc-2.3=
6-sys-mou.patch \
> > > > +           file://qemu-guest-agent.init \
> > > > +           file://qemu-guest-agent.udev \
> > > >             "
> > > >  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> > > >
> > > > @@ -132,6 +134,20 @@ do_configure[cleandirs] +=3D "${B}"
> > > >  do_install () {
> > > >       export STRIP=3D""
> > > >       oe_runmake 'DESTDIR=3D${D}' install
> > > > +
> > > > +     # If we built the guest agent, also install startup/udev rule=
s
> > > > +     if [ -e "${D}${bindir}/qemu-ga" ]; then
> > > > +             install -d ${D}${sysconfdir}/init.d/
> > > > +             install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}=
${sysconfdir}/init.d/qemu-guest-agent
> > > > +             sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init=
.d/qemu-guest-agent
> > > > +
> > > > +             install -d ${D}${sysconfdir}/udev/rules.d/
> > > > +             install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}=
${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules
> > > > +
> > > > +             install -d ${D}${systemd_unitdir}/system/
> > > > +             install -m 0644 ${S}/contrib/systemd/qemu-guest-agent=
.service ${D}${systemd_unitdir}/system
> > > > +             sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_=
unitdir}/system/qemu-guest-agent.service
> > > > +     fi
> > > >  }
> > > >
> > > >  # The following fragment will create a wrapper for qemu-mips user =
emulation
> > > > @@ -210,3 +226,20 @@ PACKAGECONFIG[jack] =3D "--enable-jack,--disab=
le-jack,jack,"
> > > >  INSANE_SKIP:${PN} =3D "arch"
> > > >
> > > >  FILES:${PN} +=3D "${datadir}/icons"
> > > > +
> > > > +# Put the guest agent in a separate package
> > > > +PACKAGES =3D+ "${PN}-guest-agent"
> > > > +SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> > > > +FILES:${PN}-guest-agent +=3D " \
> > > > +    ${bindir}/qemu-ga \
> > > > +    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
> > > > +    ${sysconfdir}/init.d/qemu-guest-agent \
> > > > +    ${systemd_unitdir}/system/qemu-guest-agent.service \
> > > > +"
> > > > +
> > > > +INITSCRIPT_PACKAGES =3D "${PN}-guest-agent"
> > > > +INITSCRIPT_NAME:${PN}-guest-agent =3D "qemu-guest-agent"
> > > > +INITSCRIPT_PARAMS:${PN}-guest-agent =3D "defaults"
> > > > +
> > > > +SYSTEMD_PACKAGES =3D "${PN}-guest-agent"
> > > > +SYSTEMD_SERVICE:${PN}-guest-agent =3D "qemu-guest-agent.service"
> > > > diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init =
b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> > > > new file mode 100644
> > > > index 0000000000..493da0ef1a
> > > > --- /dev/null
> > > > +++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> > > > @@ -0,0 +1,84 @@
> > > > +#!/bin/sh
> > > > +### BEGIN INIT INFO
> > > > +# Provides:          qemu-guest-agent
> > > > +# Required-Start:    $remote_fs $syslog
> > > > +# Required-Stop:     $remote_fs $syslog
> > > > +# Default-Start:     2 3 4 5
> > > > +# Default-Stop:              0 1 6
> > > > +# Short-Description: QEMU Guest Agent
> > > > +### END INIT INFO
> > > > +#
> > > > +# Do not configure this file. Edit /etc/default/qemu-guest-agent
> > > > +#
> > >
> > > Do we install a /etc/default/qemu-guest-agent? The whole comment bloc=
k
> > > above can probably be dropped including the INIT INFO as it isn't
> > > applicable for us?
> >
> > Okay I will drop them,
> >
> > >
> > > Do we need to mention which license this script is under and where it
> > > came from (seemingly Debian)?
> >
> > Debian maintainer replies that it's under GPLv2, the same as the qemu p=
ackage.
> >
> > I don't know if it's fine or If I should explicitly mention the origin
> > somewhere.
>
> I would put an SPDX-License-Identifer line in the script and a comment
> line saying it was originally based on a script from debian so we at
> least acknowledge that.

Something like this?

# SPDX-License-Identifier: GPL-2.0-only
# Initially written by: Michael Tokarev <mjt@tls.msk.ru>
# For QEMU Debian downstream package

Thanks,

>
> Cheers,
>
> Richard
>
>

