Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A4DC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 13:36:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.9033.1643895378516932176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 05:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=S9iK5VMv;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CEFD680FF1;
	Thu,  3 Feb 2022 14:36:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643895375;
	bh=2sjvKJNMIifR67ZAJ7pjGWJWyREugYQAHhkHCQV/Y08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S9iK5VMvKtDznWsHLWS6A0KkPp/ZMRgKgYDWf1CYtHks00oqs/U4V6oJuQlYP4b+B
	 Zm9NGOGubhYQRTFJsTeu6wWcLFuiKliaIwYTTz+528VppFrRuUlZWqEq0aqQ0QTlhr
	 yLS3tjyj4t35kp8AjPrQHvZU4CKreOnVt0yhSd+s6MxBdyI51FQvdlIpg0c/pUwNLH
	 kzKsJdHSjXjZnKwYv9XEXd8OzVhIRfRXi5fklZ1gemJGnThUjVPs/NSX9Fq+GiQsvV
	 GPwwwWmxoEohjyRT+XHwrAF3DMihDRy3Lyb5Pyn0MiU5+uo4VyX9/g7q6OJsz1PHnh
	 GUd5yZDQ5y/YQ==
Message-ID: <be4748fe-0168-6962-9f74-02b1207dad17@denx.de>
Date: Thu, 3 Feb 2022 14:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH 01/33] seatd: add recipe
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
 <8f129c19-a070-e1fe-d868-960fee2b77e6@denx.de>
 <CANNYZj9u_a17B1R+ufNCQe=jao6sExGrGWdAb_5t7_T2y-a4GA@mail.gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CANNYZj9u_a17B1R+ufNCQe=jao6sExGrGWdAb_5t7_T2y-a4GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 13:36:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161280

On 2022-02-03 14:28, Alexander Kanavin wrote:
> As far as I understand the library is not useful without the daemon, so=
=20
> there is no point in packaging them separately. -dev stuff is split=20
> automatically.

That is not the impression I got from the readme:

 > # libseat
 >
 > A seat management library allowing applications to use whatever seat=20
management is available.
 >
 > Supports:
 >
 >     seatd
 >     (e)logind
 >     embedded seatd for standalone operation
 >
 > Each backend can be compile-time included and is runtime=20
auto-detected or manually selected with the LIBSEAT_BACKEND environment=20
variable.
 >
 > Which backend is in use is transparent to the application, providing=20
a simple common interface.

https://sr.ht/~kennylevinsen/seatd/#libseat

I guess the general question is if it makes sense to split them up for OE=
.

regards,
Claudius

>=20
> Alex
>=20
> On Thu, 3 Feb 2022 at 13:55, Claudius Heine <ch@denx.de=20
> <mailto:ch@denx.de>> wrote:
>=20
>     Hi Alexander,
>=20
>     On 2022-02-02 19:27, Alexander Kanavin wrote:
>      > This is needed to run weston properly as non-root in the absence
>      > of systemd-logind, and other compositors will likely require sea=
td
>      > as well.
>      >
>      > Signed-off-by: Alexander Kanavin <alex@linutronix.de
>     <mailto:alex@linutronix.de>>
>      > ---
>      >=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc |=C2=A0 1 +
>      >=C2=A0 =C2=A0meta/recipes-core/seatd/seatd/init=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 45
>     ++++++++++++++++++++++++
>      >=C2=A0 =C2=A0meta/recipes-core/seatd/seatd_0.6.3.bb <http://seatd=
_0.6.3.bb>=20
>      =C2=A0| 29 +++++++++++++++
>      >=C2=A0 =C2=A03 files changed, 75 insertions(+)
>      >=C2=A0 =C2=A0create mode 100644 meta/recipes-core/seatd/seatd/ini=
t
>      >=C2=A0 =C2=A0create mode 100644 meta/recipes-core/seatd/seatd_0.6=
.3.bb
>     <http://seatd_0.6.3.bb>
>      >
>      > diff --git a/meta/conf/distro/include/maintainers.inc
>     b/meta/conf/distro/include/maintainers.inc
>      > index ae25287c11..cb289a0eee 100644
>      > --- a/meta/conf/distro/include/maintainers.inc
>      > +++ b/meta/conf/distro/include/maintainers.inc
>      > @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt-unicode =3D
>     "Unassigned <unassigned@yoctoproject.org
>     <mailto:unassigned@yoctoproject.org>>"
>      >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burto=
n
>     <ross.burton@arm.com <mailto:ross.burton@arm.com>>"
>      >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sbc =3D "Unassigned
>     <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
>      >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-screen =3D "Anuj Mittal
>     <anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>>"
>      > +RECIPE_MAINTAINER:pn-seatd =3D "Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>      >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sed =3D "Chen Qi <Qi.Chen@windr=
iver.com
>     <mailto:Qi.Chen@windriver.com>>"
>      >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-serf =3D "Anuj Mittal <anuj.mit=
tal@intel.com
>     <mailto:anuj.mittal@intel.com>>"
>      >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-setserial =3D "Yi Zhao
>     <yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>>"
>      > diff --git a/meta/recipes-core/seatd/seatd/init
>     b/meta/recipes-core/seatd/seatd/init
>      > new file mode 100644
>      > index 0000000000..0589c765ac
>      > --- /dev/null
>      > +++ b/meta/recipes-core/seatd/seatd/init
>      > @@ -0,0 +1,45 @@
>      > +#!/bin/sh
>      > +#
>      > +### BEGIN INIT INFO
>      > +# Provides: seatd
>      > +# Required-Start: $local_fs $remote_fs
>      > +# Required-Stop: $local_fs $remote_fs
>      > +# Default-Start:=C2=A0 =C2=A0 =C2=A02 3 4 5
>      > +# Default-Stop:=C2=A0 =C2=A0 =C2=A0 0 1 6
>      > +### END INIT INFO
>      > +
>      > +killproc() {
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid=3D`/bin/pidof $1`
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ "$pid" !=3D "" ] && kill $pid
>      > +}
>      > +
>      > +case "$1" in
>      > +=C2=A0 start)
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 seatd -g video -n 1 > /tmp/seatd-st=
art-notify &
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] && e=
xit 0
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 0.1
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] && e=
xit 0
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 0.5
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] && e=
xit 0
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 5
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] && e=
xit 0
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
>      > +=C2=A0 ;;
>      > +
>      > +=C2=A0 stop)
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Stopping seatd"
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 killproc seatd
>      > +=C2=A0 ;;
>      > +
>      > +=C2=A0 restart)
>      > +=C2=A0 =C2=A0 =C2=A0$0 stop
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 1
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $0 start
>      > +=C2=A0 ;;
>      > +
>      > +=C2=A0 *)
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "usage: $0 { start | stop | re=
start }"
>      > +=C2=A0 ;;
>      > +esac
>      > +
>      > +exit 0
>      > diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb
>     <http://seatd_0.6.3.bb> b/meta/recipes-core/seatd/seatd_0.6.3.bb
>     <http://seatd_0.6.3.bb>
>      > new file mode 100644
>      > index 0000000000..0e1a79dddf
>      > --- /dev/null
>      > +++ b/meta/recipes-core/seatd/seatd_0.6.3.bb <http://seatd_0.6.3=
.bb>
>      > @@ -0,0 +1,29 @@
>      > +SUMMARY =3D "A minimal seat management daemon, and a universal
>     seat management library."
>      > +DESCRIPTION =3D "Seat management takes care of mediating access=
 to
>     shared devices (graphics, input), without requiring the application=
s
>     needing access to be root."
>      > +HOMEPAGE =3D "https://git.sr.ht/~kennylevinsen/seatd
>     <https://git.sr.ht/~kennylevinsen/seatd>"
>      > +
>      > +LICENSE =3D "MIT"
>      > +
>      > +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D715a99d2dd552e6188e74d4ed2914d5a"
>      > +
>      > +SRC_URI =3D
>     "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmas=
ter
>     <http://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dma=
ster> \
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init"
>      > +SRCREV =3D "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
>      > +S =3D "${WORKDIR}/git"
>      > +
>      > +inherit meson pkgconfig update-rc.d
>      > +
>      > +PACKAGECONFIG ?=3D "libseat-builtin"
>      > +
>      > +PACKAGECONFIG[libseat-builtin] =3D
>     "-Dlibseat-builtin=3Denabled,-Dlibseat-builtin=3Ddisabled"
>      > +
>      > +do_install:append() {
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "${VIRTUAL-RUNTIME_init_manage=
r}" !=3D "systemd" ]; then
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install=
 -Dm755 ${WORKDIR}/init
>     ${D}/${sysconfdir}/init.d/seatd
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>      > +}
>      > +
>      > +INITSCRIPT_NAME =3D "seatd"
>      > +INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
>      > +INHIBIT_UPDATERCD_BBCLASS =3D
>     "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd',
>     '1', '', d)}"
>      > +
>      >
>=20
>     I was looking into seatd as well, in my recipe I split it up a bit:
>=20
>     ```
>     PACKAGES =3D+ "${PN}-launch libseat libseat-dev"
>=20
>     FILES:${PN} =3D "${bindir}/seatd"
>     FILES:${PN}-launch =3D "${bindir}/seatd-launch"
>     FILES:libseat =3D "${libdir}/lib*${SOLIBS}"
>     FILES:libseat-dev =3D " \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${includedir} ${FILES_SOLIBSDEV} \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/pkgconfig"
>=20
>     RDEPENDS:${PN} =3D "libseat (=3D ${EXTENDPKGV})"
>     RDEPENDS:${PN}-launch =3D "${PN} (=3D ${EXTENDPKGV})"
>     RDEPENDS:libseat-dev =3D "libseat (=3D ${EXTENDPKGV})"
>     ```
>=20
>     regards,
>     Claudius
>=20

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de

