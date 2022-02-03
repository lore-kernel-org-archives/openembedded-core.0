Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07F7C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 13:53:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.9270.1643896378035862935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 05:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=QZWzDCZ3;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DE8DA800AB;
	Thu,  3 Feb 2022 14:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643896376;
	bh=kSvAeB0+DKb8HKjpTNl503R1UHAtRTGEb6qDbiTR0/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QZWzDCZ3GBYKxFivXpQn9PPi8M15brpy8RIRUTPX0em1BhNhmZjqUs1Rcf9u4tcKb
	 nHBJkcUsd6mntMxrX5x+OMURW7L/SchZuJMkIL/+FqLxRAl+HvCk12QhechOFVRE7N
	 KWBuVXMY6Be7AM7kDrSngG69g7psbtWqCdUyIPXsHXIHJR6MEk1FVKXAx9zijxxLcF
	 rWHIH8b0gSoZClKY+PBkI1ZPqhajhDrJDfGc2STTXmWNlK58ouzmkXsSv3FHC+3NZI
	 JkSm/g/kb1ArDmFiEkqW0CJIxWeaDtzmJC7nuun2Zr7eIn3jOFuFG2zoQs1yjUTQsr
	 ijcmQaA2Cbbow==
Message-ID: <7cb83364-5a4a-c6ca-0d05-dc5f2ce7caba@denx.de>
Date: Thu, 3 Feb 2022 14:52:55 +0100
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
 <be4748fe-0168-6962-9f74-02b1207dad17@denx.de>
 <CANNYZj8tUnuM_rAdiN3G=Eqr-PsT=koHPrJnNJPR_VHfhX+NKw@mail.gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CANNYZj8tUnuM_rAdiN3G=Eqr-PsT=koHPrJnNJPR_VHfhX+NKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 13:53:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161282

On 2022-02-03 14:46, Alexander Kanavin wrote:
> The current recipe doesn't enable (or allow to enable) those=20
> alternatives, so unless someone needs them, and tests that they work,=20
> there is still no point in splitting.
>=20

That is reasonable. I was just a bit concerned about possible RDPENDS=20
for other software packages. Depending on `libseat` seems to be more=20
future-proof than `seatd` if only the library is required, whatever the=20
backend is.

But I don't feel too strongly about this, so your call ;)

> Alex
>=20
> On Thu, 3 Feb 2022 at 14:36, Claudius Heine <ch@denx.de=20
> <mailto:ch@denx.de>> wrote:
>=20
>     On 2022-02-03 14:28, Alexander Kanavin wrote:
>      > As far as I understand the library is not useful without the
>     daemon, so
>      > there is no point in packaging them separately. -dev stuff is sp=
lit
>      > automatically.
>=20
>     That is not the impression I got from the readme:
>=20
>      =C2=A0> # libseat
>      =C2=A0>
>      =C2=A0> A seat management library allowing applications to use wha=
tever
>     seat
>     management is available.
>      =C2=A0>
>      =C2=A0> Supports:
>      =C2=A0>
>      =C2=A0>=C2=A0 =C2=A0 =C2=A0seatd
>      =C2=A0>=C2=A0 =C2=A0 =C2=A0(e)logind
>      =C2=A0>=C2=A0 =C2=A0 =C2=A0embedded seatd for standalone operation
>      =C2=A0>
>      =C2=A0> Each backend can be compile-time included and is runtime
>     auto-detected or manually selected with the LIBSEAT_BACKEND environ=
ment
>     variable.
>      =C2=A0>
>      =C2=A0> Which backend is in use is transparent to the application,
>     providing
>     a simple common interface.
>=20
>     https://sr.ht/~kennylevinsen/seatd/#libseat
>     <https://sr.ht/~kennylevinsen/seatd/#libseat>
>=20
>     I guess the general question is if it makes sense to split them up
>     for OE.
>=20
>     regards,
>     Claudius
>=20
>      >
>      > Alex
>      >
>      > On Thu, 3 Feb 2022 at 13:55, Claudius Heine <ch@denx.de
>     <mailto:ch@denx.de>
>      > <mailto:ch@denx.de <mailto:ch@denx.de>>> wrote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0Hi Alexander,
>      >
>      >=C2=A0 =C2=A0 =C2=A0On 2022-02-02 19:27, Alexander Kanavin wrote:
>      >=C2=A0 =C2=A0 =C2=A0 > This is needed to run weston properly as n=
on-root in the
>     absence
>      >=C2=A0 =C2=A0 =C2=A0 > of systemd-logind, and other compositors w=
ill likely
>     require seatd
>      >=C2=A0 =C2=A0 =C2=A0 > as well.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > Signed-off-by: Alexander Kanavin <alex@lin=
utronix.de
>     <mailto:alex@linutronix.de>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:alex@linutronix.de <mailto:alex@linut=
ronix.de>>>
>      >=C2=A0 =C2=A0 =C2=A0 > ---
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0meta/conf/distro/include/maint=
ainers.inc |=C2=A0 1 +
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0meta/recipes-core/seatd/seatd/=
init=C2=A0 =C2=A0 =C2=A0 =C2=A0| 45
>      >=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0meta/recipes-core/seatd/seatd_=
0.6.3.bb
>     <http://seatd_0.6.3.bb> <http://seatd_0.6.3.bb <http://seatd_0.6.3.=
bb>>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 +++++++++++++++
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A03 files changed, 75 insertions=
(+)
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0create mode 100644 meta/recipe=
s-core/seatd/seatd/init
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0create mode 100644
>     meta/recipes-core/seatd/seatd_0.6.3.bb <http://seatd_0.6.3.bb>
>      >=C2=A0 =C2=A0 =C2=A0<http://seatd_0.6.3.bb <http://seatd_0.6.3.bb=
>>
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > diff --git a/meta/conf/distro/include/main=
tainers.inc
>      >=C2=A0 =C2=A0 =C2=A0b/meta/conf/distro/include/maintainers.inc
>      >=C2=A0 =C2=A0 =C2=A0 > index ae25287c11..cb289a0eee 100644
>      >=C2=A0 =C2=A0 =C2=A0 > --- a/meta/conf/distro/include/maintainers=
.inc
>      >=C2=A0 =C2=A0 =C2=A0 > +++ b/meta/conf/distro/include/maintainers=
.inc
>      >=C2=A0 =C2=A0 =C2=A0 > @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-r=
xvt-unicode =3D
>      >=C2=A0 =C2=A0 =C2=A0"Unassigned <unassigned@yoctoproject.org
>     <mailto:unassigned@yoctoproject.org>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:unassigned@yoctoproject.org
>     <mailto:unassigned@yoctoproject.org>>>"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sato-scre=
enshot =3D "Ross Burton
>      >=C2=A0 =C2=A0 =C2=A0<ross.burton@arm.com <mailto:ross.burton@arm.=
com>
>     <mailto:ross.burton@arm.com <mailto:ross.burton@arm.com>>>"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sbc =3D "=
Unassigned
>      >=C2=A0 =C2=A0 =C2=A0<unassigned@yoctoproject.org
>     <mailto:unassigned@yoctoproject.org>
>     <mailto:unassigned@yoctoproject.org
>     <mailto:unassigned@yoctoproject.org>>>"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-screen =3D=
 "Anuj Mittal
>      >=C2=A0 =C2=A0 =C2=A0<anuj.mittal@intel.com <mailto:anuj.mittal@in=
tel.com>
>     <mailto:anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>>>"
>      >=C2=A0 =C2=A0 =C2=A0 > +RECIPE_MAINTAINER:pn-seatd =3D "Alexander=
 Kanavin
>      >=C2=A0 =C2=A0 =C2=A0<alex.kanavin@gmail.com <mailto:alex.kanavin@=
gmail.com>
>     <mailto:alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>>"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sed =3D "=
Chen Qi
>     <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:Qi.Chen@windriver.com <mailto:Qi.Chen=
@windriver.com>>>"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-serf =3D =
"Anuj Mittal
>     <anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:anuj.mittal@intel.com <mailto:anuj.mi=
ttal@intel.com>>>"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-setserial=
 =3D "Yi Zhao
>      >=C2=A0 =C2=A0 =C2=A0<yi.zhao@windriver.com <mailto:yi.zhao@windri=
ver.com>
>     <mailto:yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>>>"
>      >=C2=A0 =C2=A0 =C2=A0 > diff --git a/meta/recipes-core/seatd/seatd=
/init
>      >=C2=A0 =C2=A0 =C2=A0b/meta/recipes-core/seatd/seatd/init
>      >=C2=A0 =C2=A0 =C2=A0 > new file mode 100644
>      >=C2=A0 =C2=A0 =C2=A0 > index 0000000000..0589c765ac
>      >=C2=A0 =C2=A0 =C2=A0 > --- /dev/null
>      >=C2=A0 =C2=A0 =C2=A0 > +++ b/meta/recipes-core/seatd/seatd/init
>      >=C2=A0 =C2=A0 =C2=A0 > @@ -0,0 +1,45 @@
>      >=C2=A0 =C2=A0 =C2=A0 > +#!/bin/sh
>      >=C2=A0 =C2=A0 =C2=A0 > +#
>      >=C2=A0 =C2=A0 =C2=A0 > +### BEGIN INIT INFO
>      >=C2=A0 =C2=A0 =C2=A0 > +# Provides: seatd
>      >=C2=A0 =C2=A0 =C2=A0 > +# Required-Start: $local_fs $remote_fs
>      >=C2=A0 =C2=A0 =C2=A0 > +# Required-Stop: $local_fs $remote_fs
>      >=C2=A0 =C2=A0 =C2=A0 > +# Default-Start:=C2=A0 =C2=A0 =C2=A02 3 4=
 5
>      >=C2=A0 =C2=A0 =C2=A0 > +# Default-Stop:=C2=A0 =C2=A0 =C2=A0 0 1 6
>      >=C2=A0 =C2=A0 =C2=A0 > +### END INIT INFO
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +killproc() {
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid=3D`/bin/p=
idof $1`
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ "$pid" !=3D=
 "" ] && kill $pid
>      >=C2=A0 =C2=A0 =C2=A0 > +}
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +case "$1" in
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 start)
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 seatd -g vide=
o -n 1 > /tmp/seatd-start-notify &
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/sea=
td-start-notify ] && exit 0
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 0.1
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/sea=
td-start-notify ] && exit 0
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 0.5
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/sea=
td-start-notify ] && exit 0
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 5
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/sea=
td-start-notify ] && exit 0
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 ;;
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 stop)
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Stoppin=
g seatd"
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 killproc seat=
d
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 ;;
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 restart)
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0$0 stop
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 1
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $0 start
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 ;;
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 *)
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "usage: =
$0 { start | stop | restart }"
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 ;;
>      >=C2=A0 =C2=A0 =C2=A0 > +esac
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +exit 0
>      >=C2=A0 =C2=A0 =C2=A0 > diff --git a/meta/recipes-core/seatd/seatd=
_0.6.3.bb
>     <http://seatd_0.6.3.bb>
>      >=C2=A0 =C2=A0 =C2=A0<http://seatd_0.6.3.bb <http://seatd_0.6.3.bb=
>>
>     b/meta/recipes-core/seatd/seatd_0.6.3.bb <http://seatd_0.6.3.bb>
>      >=C2=A0 =C2=A0 =C2=A0<http://seatd_0.6.3.bb <http://seatd_0.6.3.bb=
>>
>      >=C2=A0 =C2=A0 =C2=A0 > new file mode 100644
>      >=C2=A0 =C2=A0 =C2=A0 > index 0000000000..0e1a79dddf
>      >=C2=A0 =C2=A0 =C2=A0 > --- /dev/null
>      >=C2=A0 =C2=A0 =C2=A0 > +++ b/meta/recipes-core/seatd/seatd_0.6.3.=
bb
>     <http://seatd_0.6.3.bb> <http://seatd_0.6.3.bb <http://seatd_0.6.3.=
bb>>
>      >=C2=A0 =C2=A0 =C2=A0 > @@ -0,0 +1,29 @@
>      >=C2=A0 =C2=A0 =C2=A0 > +SUMMARY =3D "A minimal seat management da=
emon, and a universal
>      >=C2=A0 =C2=A0 =C2=A0seat management library."
>      >=C2=A0 =C2=A0 =C2=A0 > +DESCRIPTION =3D "Seat management takes ca=
re of mediating
>     access to
>      >=C2=A0 =C2=A0 =C2=A0shared devices (graphics, input), without req=
uiring the
>     applications
>      >=C2=A0 =C2=A0 =C2=A0needing access to be root."
>      >=C2=A0 =C2=A0 =C2=A0 > +HOMEPAGE =3D "https://git.sr.ht/~kennylev=
insen/seatd
>     <https://git.sr.ht/~kennylevinsen/seatd>
>      >=C2=A0 =C2=A0 =C2=A0<https://git.sr.ht/~kennylevinsen/seatd
>     <https://git.sr.ht/~kennylevinsen/seatd>>"
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +LICENSE =3D "MIT"
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +LIC_FILES_CHKSUM =3D
>      >=C2=A0 =C2=A0 =C2=A0"file://LICENSE;md5=3D715a99d2dd552e6188e74d4=
ed2914d5a"
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +SRC_URI =3D
>      >  =20
>      =C2=A0"git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branc=
h=3Dmaster
>     <http://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dma=
ster>
>      >  =20
>      =C2=A0<http://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;bran=
ch=3Dmaster <http://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branc=
h=3Dmaster>> \
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
file://init"
>      >=C2=A0 =C2=A0 =C2=A0 > +SRCREV =3D "88db55f6068c1c01d85b61aa6adff=
0a6b2a8dce8"
>      >=C2=A0 =C2=A0 =C2=A0 > +S =3D "${WORKDIR}/git"
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +inherit meson pkgconfig update-rc.d
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +PACKAGECONFIG ?=3D "libseat-builtin"
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +PACKAGECONFIG[libseat-builtin] =3D
>      >=C2=A0 =C2=A0 =C2=A0"-Dlibseat-builtin=3Denabled,-Dlibseat-builti=
n=3Ddisabled"
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +do_install:append() {
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "${VIRTU=
AL-RUNTIME_init_manager}" !=3D
>     "systemd" ]; then
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 install -Dm755 ${WORKDIR}/init
>      >=C2=A0 =C2=A0 =C2=A0${D}/${sysconfdir}/init.d/seatd
>      >=C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>      >=C2=A0 =C2=A0 =C2=A0 > +}
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 > +INITSCRIPT_NAME =3D "seatd"
>      >=C2=A0 =C2=A0 =C2=A0 > +INITSCRIPT_PARAMS =3D "start 9 5 2 . stop=
 20 0 1 6 ."
>      >=C2=A0 =C2=A0 =C2=A0 > +INHIBIT_UPDATERCD_BBCLASS =3D
>      >=C2=A0 =C2=A0 =C2=A0"${@oe.utils.conditional('VIRTUAL-RUNTIME_ini=
t_manager',
>     'systemd',
>      >=C2=A0 =C2=A0 =C2=A0'1', '', d)}"
>      >=C2=A0 =C2=A0 =C2=A0 > +
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >
>      >=C2=A0 =C2=A0 =C2=A0I was looking into seatd as well, in my recip=
e I split it up
>     a bit:
>      >
>      >=C2=A0 =C2=A0 =C2=A0```
>      >=C2=A0 =C2=A0 =C2=A0PACKAGES =3D+ "${PN}-launch libseat libseat-d=
ev"
>      >
>      >=C2=A0 =C2=A0 =C2=A0FILES:${PN} =3D "${bindir}/seatd"
>      >=C2=A0 =C2=A0 =C2=A0FILES:${PN}-launch =3D "${bindir}/seatd-launc=
h"
>      >=C2=A0 =C2=A0 =C2=A0FILES:libseat =3D "${libdir}/lib*${SOLIBS}"
>      >=C2=A0 =C2=A0 =C2=A0FILES:libseat-dev =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${includedir} ${=
FILES_SOLIBSDEV} \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/pkgcon=
fig"
>      >
>      >=C2=A0 =C2=A0 =C2=A0RDEPENDS:${PN} =3D "libseat (=3D ${EXTENDPKGV=
})"
>      >=C2=A0 =C2=A0 =C2=A0RDEPENDS:${PN}-launch =3D "${PN} (=3D ${EXTEN=
DPKGV})"
>      >=C2=A0 =C2=A0 =C2=A0RDEPENDS:libseat-dev =3D "libseat (=3D ${EXTE=
NDPKGV})"
>      >=C2=A0 =C2=A0 =C2=A0```
>      >
>      >=C2=A0 =C2=A0 =C2=A0regards,
>      >=C2=A0 =C2=A0 =C2=A0Claudius
>      >
>=20
>     --=20
>     DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Direct=
or: Wolfgang Denk
>     HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germa=
ny
>     Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email:
>     ch@denx.de <mailto:ch@denx.de>
>=20

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de

