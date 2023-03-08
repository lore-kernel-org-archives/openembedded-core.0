Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD0CC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 21:15:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5472.1678310117889737117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 13:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TJsqLG+J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id p26so10608301wmc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 13:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678310116;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OgObHD3QCgm+CZ8fsKs+eW3iAw+/rnvRwCG9617ApNs=;
        b=TJsqLG+Jz3dKIERJlMTrvm6dQ0ZYIEsnCjGrFdE3+aFWLFNh9tJHvtobVMwL8Lgi+g
         W3EX8xRDjLbtMHxJu+vUVuloFDoW4ES8eOxVhCPV8us68bmkDI9ygKkZswwqgRRK9xE9
         o3HNDeBg36g6Zsw0tbSABb042MF/8e+eXOF5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678310116;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgObHD3QCgm+CZ8fsKs+eW3iAw+/rnvRwCG9617ApNs=;
        b=elV01wae9Jc9Fr1Q3FoV2X4bNbhpJNPjlyB+wTFo5NuX99DNs2UN+8i/58hdcWcbM3
         yaw3pUG3AcGCdKUn1O46Iv6iD5GRsRolDI8JgVqjdzd55bD1nMg4Oi82x0XrxizOwtea
         U7TBeQ42TN4tlXUBAcjJt+W50mfD3Z+DPM3/2z3hmt9wvpA2vaP6ROvm+V83WZFOF7l5
         06pRd9k/Z8qgKvwXoTLpVs/Ia7JsUfWBYf3znLKElMryWdYqfHrpdjxSb68vZqzGMEyb
         rEkO6s7MLvG1FVpwceCrw5gmNveoOPBiLtzOJTQFVL0ibws0fFRb+BVYIgDKrpLSCnpK
         yxcA==
X-Gm-Message-State: AO0yUKX9MGoOfySTNZkq0oBUocjfRANhI2Zo8/ObC7MvFDaxKWjjCuAf
	B6P2JzicWTE0ldDX8jlwjmYQ/A==
X-Google-Smtp-Source: AK7set/dcrN85isCrV8JEHN/KtuOcXLw396b8OzpAPELaMNevsXMXo3i4GoRWr/n0BCZFohnj0qvdg==
X-Received: by 2002:a05:600c:468e:b0:3eb:2de8:b72a with SMTP id p14-20020a05600c468e00b003eb2de8b72amr16690152wmo.7.1678310116201;
        Wed, 08 Mar 2023 13:15:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e05:8348:1f1a:b973? ([2001:8b0:aba:5f3c:7e05:8348:1f1a:b973])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b003e209186c07sm507721wmi.19.2023.03.08.13.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:15:15 -0800 (PST)
Message-ID: <ec6b74a03d081753d02199661b5d085b353799aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Brenda Streiff
	 <brenda.streiff@ni.com>
Date: Wed, 08 Mar 2023 21:15:14 +0000
In-Reply-To: <CAJiuCccJfBbJkM1S+CwMJ0wEnRaV7k8RkKzoJTngLH2d6W1UEg@mail.gmail.com>
References: <20230308171437.35160-1-peron.clem@gmail.com>
	 <14246ffa7ccd8f1ee6b71f5002898b0b58b6bd06.camel@linuxfoundation.org>
	 <CAJiuCccJfBbJkM1S+CwMJ0wEnRaV7k8RkKzoJTngLH2d6W1UEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 21:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178198

On Wed, 2023-03-08 at 21:22 +0100, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi Richard,
>=20
> On Wed, 8 Mar 2023 at 18:31, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2023-03-08 at 18:14 +0100, Cl=C3=A9ment P=C3=A9ron wrote:
> > > Split out the QEMU guest agent into a separate package. The agent is
> > > intended to be installed within a QEMU VM guest where a user is likel=
y
> > > to not want to have the rest of the QEMU installation within it.
> > >=20
> > > Additionally, an initscript, udev rules file, and systemd unit file a=
re
> > > added to the package so that the guest agent can start automatically;
> > > the former two come from Debian's packaging for qemu-guest-agent.
> > >=20
> > > Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >=20
> > > Changes since v3:
> > >  - fix missing comma in udev rule
> > >=20
> > > Changes since v2:
> > >  - Add missing files
> > >  - rebase on top of master
> > >=20
> > > Changes since v1:
> > >  - Fix systemd-service using PN where it should not
> > >=20
> > >  meta/recipes-devtools/qemu/qemu.inc           | 35 +++++++-
> > >  .../qemu/qemu/qemu-guest-agent.init           | 84 +++++++++++++++++=
++
> > >  .../qemu/qemu/qemu-guest-agent.udev           |  2 +
> > >  3 files changed, 120 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.=
init
> > >  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.=
udev
> > >=20
> > > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devto=
ols/qemu/qemu.inc
> > > index 1e768b560d..b41055fe5d 100644
> > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> > >  RDEPENDS:${PN}-ptest =3D "bash"
> > >=20
> > >  require qemu-targets.inc
> > > -inherit pkgconfig ptest
> > > +inherit pkgconfig ptest update-rc.d systemd
> > >=20
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15=
a72fbac \
> > >                      file://COPYING.LIB;endline=3D24;md5=3D8c5efda6cf=
1e1b03dcfd0e6c0d271c7f"
> > > @@ -32,6 +32,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}=
.tar.xz \
> > >             file://0001-configure-Fix-check-tcg-not-executing-any-tes=
ts.patch \
> > >             file://0001-Revert-linux-user-add-more-compat-ioctl-defin=
itions.patch \
> > >             file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-=
sys-mou.patch \
> > > +           file://qemu-guest-agent.init \
> > > +           file://qemu-guest-agent.udev \
> > >             "
> > >  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> > >=20
> > > @@ -132,6 +134,20 @@ do_configure[cleandirs] +=3D "${B}"
> > >  do_install () {
> > >       export STRIP=3D""
> > >       oe_runmake 'DESTDIR=3D${D}' install
> > > +
> > > +     # If we built the guest agent, also install startup/udev rules
> > > +     if [ -e "${D}${bindir}/qemu-ga" ]; then
> > > +             install -d ${D}${sysconfdir}/init.d/
> > > +             install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${=
sysconfdir}/init.d/qemu-guest-agent
> > > +             sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d=
/qemu-guest-agent
> > > +
> > > +             install -d ${D}${sysconfdir}/udev/rules.d/
> > > +             install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${=
sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules
> > > +
> > > +             install -d ${D}${systemd_unitdir}/system/
> > > +             install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.s=
ervice ${D}${systemd_unitdir}/system
> > > +             sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_un=
itdir}/system/qemu-guest-agent.service
> > > +     fi
> > >  }
> > >=20
> > >  # The following fragment will create a wrapper for qemu-mips user em=
ulation
> > > @@ -210,3 +226,20 @@ PACKAGECONFIG[jack] =3D "--enable-jack,--disable=
-jack,jack,"
> > >  INSANE_SKIP:${PN} =3D "arch"
> > >=20
> > >  FILES:${PN} +=3D "${datadir}/icons"
> > > +
> > > +# Put the guest agent in a separate package
> > > +PACKAGES =3D+ "${PN}-guest-agent"
> > > +SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> > > +FILES:${PN}-guest-agent +=3D " \
> > > +    ${bindir}/qemu-ga \
> > > +    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
> > > +    ${sysconfdir}/init.d/qemu-guest-agent \
> > > +    ${systemd_unitdir}/system/qemu-guest-agent.service \
> > > +"
> > > +
> > > +INITSCRIPT_PACKAGES =3D "${PN}-guest-agent"
> > > +INITSCRIPT_NAME:${PN}-guest-agent =3D "qemu-guest-agent"
> > > +INITSCRIPT_PARAMS:${PN}-guest-agent =3D "defaults"
> > > +
> > > +SYSTEMD_PACKAGES =3D "${PN}-guest-agent"
> > > +SYSTEMD_SERVICE:${PN}-guest-agent =3D "qemu-guest-agent.service"
> > > diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init b/=
meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> > > new file mode 100644
> > > index 0000000000..493da0ef1a
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> > > @@ -0,0 +1,84 @@
> > > +#!/bin/sh
> > > +### BEGIN INIT INFO
> > > +# Provides:          qemu-guest-agent
> > > +# Required-Start:    $remote_fs $syslog
> > > +# Required-Stop:     $remote_fs $syslog
> > > +# Default-Start:     2 3 4 5
> > > +# Default-Stop:              0 1 6
> > > +# Short-Description: QEMU Guest Agent
> > > +### END INIT INFO
> > > +#
> > > +# Do not configure this file. Edit /etc/default/qemu-guest-agent
> > > +#
> >=20
> > Do we install a /etc/default/qemu-guest-agent? The whole comment block
> > above can probably be dropped including the INIT INFO as it isn't
> > applicable for us?
>=20
> Okay I will drop them,
>=20
> >=20
> > Do we need to mention which license this script is under and where it
> > came from (seemingly Debian)?
>=20
> Debian maintainer replies that it's under GPLv2, the same as the qemu pac=
kage.
>=20
> I don't know if it's fine or If I should explicitly mention the origin
> somewhere.

I would put an SPDX-License-Identifer line in the script and a comment
line saying it was originally based on a script from debian so we at
least acknowledge that.

Cheers,

Richard



