Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D092C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 14:02:41 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web12.9383.1643896960112486618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 06:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CgApo+ao;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id w18so1989566uar.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=78CYv8+5RzvI2gPD6ItEYkWPV8bVf5IZMFcnk9GzbS4=;
        b=CgApo+aoN2C4iWMImUtpacd/YFspU8P/V7d3FuENx4vBiMzNh/v5ZLwm4qojH15mBi
         wfqB/1IwAAqYACNLm2N+h47gz6jxyz1h2Ffg/6XElNz/jcmYCHWtdd9oMmiBZBiBTVgP
         e6tVW6G7ufytJPqTQjELhUylBW+Dnh34WSX1tSBb9uKRANzuEAf8CKCqnZhyTqk7fSdu
         8ot5e+ixhHXdt9baUcJ+i60skHzx4cMyd1oHLbI5Sn/Dvc3Q2ePlehD7OBXmorOTotZ3
         qHnjWRjjZxk5/RM6yrxLrSixur3ncqpB7qbDs5x/0qQaVCy/stAZUFKFri1yctRttFeN
         jJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=78CYv8+5RzvI2gPD6ItEYkWPV8bVf5IZMFcnk9GzbS4=;
        b=dJrGm/uzV+43K44mIUVuPoqiVwm/ew8oW7DWIjiVwqIzTndi+mcyXW4t7jRSJn8OEs
         pVX1fDYWajdkzYNmIaCLUYbAbTzFfxKMvXNStE9JruBJAUXw88hQtF3DmRSVfSrE/Xxb
         giBEpxPc1+bYEKnFbW7oebZrWBAvoAuLR4DmLRU1i11x15Y7NWP9osrKuiuD06FH+iKb
         0iddvwqA1+8g2nV/NZmP/206EHqy4n63lOmT46VK/SH2bxjjYgnWXgWffmKXqP2PMpBU
         e3tIj0VITVOA7lTiGIBf9/qM4BWMf3eXgbjcbq4Ml6To6l507AjBCAaERMzKWYaC4cT4
         y0bQ==
X-Gm-Message-State: AOAM533o1GfoWoPdFruGGG/riNkHaJFKR/l6fX+B2dD8fJIsJapPQmUv
	0dt/Lnd49WyaZuM1FG4iMKDc72bjos/wL1m9aOI=
X-Google-Smtp-Source: 
 ABdhPJxID6Y5mur3dHhID2nhvS9829L23Q/yBDfer52bsYnnpw53hiRApxOXtR1zjsrs75LtW37KFcCYzRV7zq37788=
X-Received: by 2002:a67:a401:: with SMTP id n1mr12823054vse.38.1643896959124;
 Thu, 03 Feb 2022 06:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20220202182758.919991-1-alex@linutronix.de>
 <8f129c19-a070-e1fe-d868-960fee2b77e6@denx.de>
 <CANNYZj9u_a17B1R+ufNCQe=jao6sExGrGWdAb_5t7_T2y-a4GA@mail.gmail.com>
 <be4748fe-0168-6962-9f74-02b1207dad17@denx.de>
 <CANNYZj8tUnuM_rAdiN3G=Eqr-PsT=koHPrJnNJPR_VHfhX+NKw@mail.gmail.com>
 <7cb83364-5a4a-c6ca-0d05-dc5f2ce7caba@denx.de>
In-Reply-To: <7cb83364-5a4a-c6ca-0d05-dc5f2ce7caba@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Feb 2022 15:02:27 +0100
Message-ID: 
 <CANNYZj9UnHPGsC80Usq4inFFQvTJMVKdCeo+BjJOSDiBCt=ipQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/33] seatd: add recipe
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000004bc74305d71d96b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 14:02:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161283

--0000000000004bc74305d71d96b8
Content-Type: text/plain; charset="UTF-8"

Shared library RDEPENDS don't need to be explicitly listed in consumer
recipes, you only need to have DEPENDS contains the seatd recipe so it's
present at build time. Bitbake magic will figure out which package provides
the library automatically.

Alex

On Thu, 3 Feb 2022 at 14:52, Claudius Heine <ch@denx.de> wrote:

> On 2022-02-03 14:46, Alexander Kanavin wrote:
> > The current recipe doesn't enable (or allow to enable) those
> > alternatives, so unless someone needs them, and tests that they work,
> > there is still no point in splitting.
> >
>
> That is reasonable. I was just a bit concerned about possible RDPENDS
> for other software packages. Depending on `libseat` seems to be more
> future-proof than `seatd` if only the library is required, whatever the
> backend is.
>
> But I don't feel too strongly about this, so your call ;)
>
> > Alex
> >
> > On Thu, 3 Feb 2022 at 14:36, Claudius Heine <ch@denx.de
> > <mailto:ch@denx.de>> wrote:
> >
> >     On 2022-02-03 14:28, Alexander Kanavin wrote:
> >      > As far as I understand the library is not useful without the
> >     daemon, so
> >      > there is no point in packaging them separately. -dev stuff is
> split
> >      > automatically.
> >
> >     That is not the impression I got from the readme:
> >
> >       > # libseat
> >       >
> >       > A seat management library allowing applications to use whatever
> >     seat
> >     management is available.
> >       >
> >       > Supports:
> >       >
> >       >     seatd
> >       >     (e)logind
> >       >     embedded seatd for standalone operation
> >       >
> >       > Each backend can be compile-time included and is runtime
> >     auto-detected or manually selected with the LIBSEAT_BACKEND
> environment
> >     variable.
> >       >
> >       > Which backend is in use is transparent to the application,
> >     providing
> >     a simple common interface.
> >
> >     https://sr.ht/~kennylevinsen/seatd/#libseat
> >     <https://sr.ht/~kennylevinsen/seatd/#libseat>
> >
> >     I guess the general question is if it makes sense to split them up
> >     for OE.
> >
> >     regards,
> >     Claudius
> >
> >      >
> >      > Alex
> >      >
> >      > On Thu, 3 Feb 2022 at 13:55, Claudius Heine <ch@denx.de
> >     <mailto:ch@denx.de>
> >      > <mailto:ch@denx.de <mailto:ch@denx.de>>> wrote:
> >      >
> >      >     Hi Alexander,
> >      >
> >      >     On 2022-02-02 19:27, Alexander Kanavin wrote:
> >      >      > This is needed to run weston properly as non-root in the
> >     absence
> >      >      > of systemd-logind, and other compositors will likely
> >     require seatd
> >      >      > as well.
> >      >      >
> >      >      > Signed-off-by: Alexander Kanavin <alex@linutronix.de
> >     <mailto:alex@linutronix.de>
> >      >     <mailto:alex@linutronix.de <mailto:alex@linutronix.de>>>
> >      >      > ---
> >      >      >   meta/conf/distro/include/maintainers.inc |  1 +
> >      >      >   meta/recipes-core/seatd/seatd/init       | 45
> >      >     ++++++++++++++++++++++++
> >      >      >   meta/recipes-core/seatd/seatd_0.6.3.bb
> >     <http://seatd_0.6.3.bb> <http://seatd_0.6.3.bb <
> http://seatd_0.6.3.bb>>
> >      >       | 29 +++++++++++++++
> >      >      >   3 files changed, 75 insertions(+)
> >      >      >   create mode 100644 meta/recipes-core/seatd/seatd/init
> >      >      >   create mode 100644
> >     meta/recipes-core/seatd/seatd_0.6.3.bb <http://seatd_0.6.3.bb>
> >      >     <http://seatd_0.6.3.bb <http://seatd_0.6.3.bb>>
> >      >      >
> >      >      > diff --git a/meta/conf/distro/include/maintainers.inc
> >      >     b/meta/conf/distro/include/maintainers.inc
> >      >      > index ae25287c11..cb289a0eee 100644
> >      >      > --- a/meta/conf/distro/include/maintainers.inc
> >      >      > +++ b/meta/conf/distro/include/maintainers.inc
> >      >      > @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt-unicode =
> >      >     "Unassigned <unassigned@yoctoproject.org
> >     <mailto:unassigned@yoctoproject.org>
> >      >     <mailto:unassigned@yoctoproject.org
> >     <mailto:unassigned@yoctoproject.org>>>"
> >      >      >   RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton
> >      >     <ross.burton@arm.com <mailto:ross.burton@arm.com>
> >     <mailto:ross.burton@arm.com <mailto:ross.burton@arm.com>>>"
> >      >      >   RECIPE_MAINTAINER:pn-sbc = "Unassigned
> >      >     <unassigned@yoctoproject.org
> >     <mailto:unassigned@yoctoproject.org>
> >     <mailto:unassigned@yoctoproject.org
> >     <mailto:unassigned@yoctoproject.org>>>"
> >      >      >   RECIPE_MAINTAINER:pn-screen = "Anuj Mittal
> >      >     <anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>
> >     <mailto:anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>>>"
> >      >      > +RECIPE_MAINTAINER:pn-seatd = "Alexander Kanavin
> >      >     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>
> >     <mailto:alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>>"
> >      >      >   RECIPE_MAINTAINER:pn-sed = "Chen Qi
> >     <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>
> >      >     <mailto:Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com
> >>>"
> >      >      >   RECIPE_MAINTAINER:pn-serf = "Anuj Mittal
> >     <anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>
> >      >     <mailto:anuj.mittal@intel.com <mailto:anuj.mittal@intel.com
> >>>"
> >      >      >   RECIPE_MAINTAINER:pn-setserial = "Yi Zhao
> >      >     <yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>
> >     <mailto:yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>>>"
> >      >      > diff --git a/meta/recipes-core/seatd/seatd/init
> >      >     b/meta/recipes-core/seatd/seatd/init
> >      >      > new file mode 100644
> >      >      > index 0000000000..0589c765ac
> >      >      > --- /dev/null
> >      >      > +++ b/meta/recipes-core/seatd/seatd/init
> >      >      > @@ -0,0 +1,45 @@
> >      >      > +#!/bin/sh
> >      >      > +#
> >      >      > +### BEGIN INIT INFO
> >      >      > +# Provides: seatd
> >      >      > +# Required-Start: $local_fs $remote_fs
> >      >      > +# Required-Stop: $local_fs $remote_fs
> >      >      > +# Default-Start:     2 3 4 5
> >      >      > +# Default-Stop:      0 1 6
> >      >      > +### END INIT INFO
> >      >      > +
> >      >      > +killproc() {
> >      >      > +        pid=`/bin/pidof $1`
> >      >      > +        [ "$pid" != "" ] && kill $pid
> >      >      > +}
> >      >      > +
> >      >      > +case "$1" in
> >      >      > +  start)
> >      >      > +        seatd -g video -n 1 > /tmp/seatd-start-notify &
> >      >      > +        [ -s /tmp/seatd-start-notify ] && exit 0
> >      >      > +        sleep 0.1
> >      >      > +        [ -s /tmp/seatd-start-notify ] && exit 0
> >      >      > +        sleep 0.5
> >      >      > +        [ -s /tmp/seatd-start-notify ] && exit 0
> >      >      > +        sleep 5
> >      >      > +        [ -s /tmp/seatd-start-notify ] && exit 0
> >      >      > +        exit 1
> >      >      > +  ;;
> >      >      > +
> >      >      > +  stop)
> >      >      > +        echo "Stopping seatd"
> >      >      > +        killproc seatd
> >      >      > +  ;;
> >      >      > +
> >      >      > +  restart)
> >      >      > +     $0 stop
> >      >      > +        sleep 1
> >      >      > +        $0 start
> >      >      > +  ;;
> >      >      > +
> >      >      > +  *)
> >      >      > +        echo "usage: $0 { start | stop | restart }"
> >      >      > +  ;;
> >      >      > +esac
> >      >      > +
> >      >      > +exit 0
> >      >      > diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb
> >     <http://seatd_0.6.3.bb>
> >      >     <http://seatd_0.6.3.bb <http://seatd_0.6.3.bb>>
> >     b/meta/recipes-core/seatd/seatd_0.6.3.bb <http://seatd_0.6.3.bb>
> >      >     <http://seatd_0.6.3.bb <http://seatd_0.6.3.bb>>
> >      >      > new file mode 100644
> >      >      > index 0000000000..0e1a79dddf
> >      >      > --- /dev/null
> >      >      > +++ b/meta/recipes-core/seatd/seatd_0.6.3.bb
> >     <http://seatd_0.6.3.bb> <http://seatd_0.6.3.bb <
> http://seatd_0.6.3.bb>>
> >      >      > @@ -0,0 +1,29 @@
> >      >      > +SUMMARY = "A minimal seat management daemon, and a
> universal
> >      >     seat management library."
> >      >      > +DESCRIPTION = "Seat management takes care of mediating
> >     access to
> >      >     shared devices (graphics, input), without requiring the
> >     applications
> >      >     needing access to be root."
> >      >      > +HOMEPAGE = "https://git.sr.ht/~kennylevinsen/seatd
> >     <https://git.sr.ht/~kennylevinsen/seatd>
> >      >     <https://git.sr.ht/~kennylevinsen/seatd
> >     <https://git.sr.ht/~kennylevinsen/seatd>>"
> >      >      > +
> >      >      > +LICENSE = "MIT"
> >      >      > +
> >      >      > +LIC_FILES_CHKSUM =
> >      >     "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
> >      >      > +
> >      >      > +SRC_URI =
> >      >
> >       "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master
> >     <http://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master>
> >      >
> >       <
> http://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master <
> http://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master>> \
> >      >      > +           file://init"
> >      >      > +SRCREV = "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
> >      >      > +S = "${WORKDIR}/git"
> >      >      > +
> >      >      > +inherit meson pkgconfig update-rc.d
> >      >      > +
> >      >      > +PACKAGECONFIG ?= "libseat-builtin"
> >      >      > +
> >      >      > +PACKAGECONFIG[libseat-builtin] =
> >      >     "-Dlibseat-builtin=enabled,-Dlibseat-builtin=disabled"
> >      >      > +
> >      >      > +do_install:append() {
> >      >      > +        if [ "${VIRTUAL-RUNTIME_init_manager}" !=
> >     "systemd" ]; then
> >      >      > +                install -Dm755 ${WORKDIR}/init
> >      >     ${D}/${sysconfdir}/init.d/seatd
> >      >      > +        fi
> >      >      > +}
> >      >      > +
> >      >      > +INITSCRIPT_NAME = "seatd"
> >      >      > +INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> >      >      > +INHIBIT_UPDATERCD_BBCLASS =
> >      >     "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager',
> >     'systemd',
> >      >     '1', '', d)}"
> >      >      > +
> >      >      >
> >      >
> >      >     I was looking into seatd as well, in my recipe I split it up
> >     a bit:
> >      >
> >      >     ```
> >      >     PACKAGES =+ "${PN}-launch libseat libseat-dev"
> >      >
> >      >     FILES:${PN} = "${bindir}/seatd"
> >      >     FILES:${PN}-launch = "${bindir}/seatd-launch"
> >      >     FILES:libseat = "${libdir}/lib*${SOLIBS}"
> >      >     FILES:libseat-dev = " \
> >      >              ${includedir} ${FILES_SOLIBSDEV} \
> >      >              ${libdir}/pkgconfig"
> >      >
> >      >     RDEPENDS:${PN} = "libseat (= ${EXTENDPKGV})"
> >      >     RDEPENDS:${PN}-launch = "${PN} (= ${EXTENDPKGV})"
> >      >     RDEPENDS:libseat-dev = "libseat (= ${EXTENDPKGV})"
> >      >     ```
> >      >
> >      >     regards,
> >      >     Claudius
> >      >
> >
> >     --
> >     DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> >     HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> >     Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email:
> >     ch@denx.de <mailto:ch@denx.de>
> >
>
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de
>

--0000000000004bc74305d71d96b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Shared library RDEPENDS don&#39;t need to be explicit=
ly listed in consumer recipes, you only need to have DEPENDS contains the s=
eatd recipe so it&#39;s present at build time. Bitbake magic will figure ou=
t which package provides the library automatically.</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 3 Feb 2022 at 14:52, Claudius Heine &lt;<a href=3D"=
mailto:ch@denx.de">ch@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 2022-02-03 14:46, Alexander Kanavin wrote:<=
br>
&gt; The current recipe doesn&#39;t enable (or allow to enable) those <br>
&gt; alternatives, so unless someone needs them, and tests that they work, =
<br>
&gt; there is still no point in splitting.<br>
&gt; <br>
<br>
That is reasonable. I was just a bit concerned about possible RDPENDS <br>
for other software packages. Depending on `libseat` seems to be more <br>
future-proof than `seatd` if only the library is required, whatever the <br=
>
backend is.<br>
<br>
But I don&#39;t feel too strongly about this, so your call ;)<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Thu, 3 Feb 2022 at 14:36, Claudius Heine &lt;<a href=3D"mailto:ch@d=
enx.de" target=3D"_blank">ch@denx.de</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@denx.de<=
/a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022-02-03 14:28, Alexander Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; As far as I understand the library is not use=
ful without the<br>
&gt;=C2=A0 =C2=A0 =C2=A0daemon, so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; there is no point in packaging them separatel=
y. -dev stuff is split<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; automatically.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That is not the impression I got from the readme:<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; # libseat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; A seat management library allowing appl=
ications to use whatever<br>
&gt;=C2=A0 =C2=A0 =C2=A0seat<br>
&gt;=C2=A0 =C2=A0 =C2=A0management is available.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Supports:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0seatd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0(e)logind<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0embedded seatd for s=
tandalone operation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Each backend can be compile-time includ=
ed and is runtime<br>
&gt;=C2=A0 =C2=A0 =C2=A0auto-detected or manually selected with the LIBSEAT=
_BACKEND environment<br>
&gt;=C2=A0 =C2=A0 =C2=A0variable.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Which backend is in use is transparent =
to the application,<br>
&gt;=C2=A0 =C2=A0 =C2=A0providing<br>
&gt;=C2=A0 =C2=A0 =C2=A0a simple common interface.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://sr.ht/~kennylevinsen/seatd/#libs=
eat" rel=3D"noreferrer" target=3D"_blank">https://sr.ht/~kennylevinsen/seat=
d/#libseat</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://sr.ht/~kennylevinsen/seatd/#=
libseat" rel=3D"noreferrer" target=3D"_blank">https://sr.ht/~kennylevinsen/=
seatd/#libseat</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I guess the general question is if it makes sense t=
o split them up<br>
&gt;=C2=A0 =C2=A0 =C2=A0for OE.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Claudius<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Alex<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Thu, 3 Feb 2022 at 13:55, Claudius Heine &=
lt;<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@denx.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ch@denx.de" target=3D"=
_blank">ch@denx.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:ch@denx.de" targ=
et=3D"_blank">ch@denx.de</a> &lt;mailto:<a href=3D"mailto:ch@denx.de" targe=
t=3D"_blank">ch@denx.de</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Hi Alexander,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 2022-02-02 19:27, Alexa=
nder Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; This is needed to ru=
n weston properly as non-root in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0absence<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; of systemd-logind, a=
nd other compositors will likely<br>
&gt;=C2=A0 =C2=A0 =C2=A0require seatd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; as well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_blank">al=
ex@linutronix.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex@linutronix.de" ta=
rget=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a> &lt;mailto:=
<a href=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de<=
/a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/con=
f/distro/include/maintainers.inc |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/rec=
ipes-core/seatd/seatd/init=C2=A0 =C2=A0 =C2=A0 =C2=A0| 45<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/rec=
ipes-core/seatd/<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=
=3D"_blank">seatd_0.6.3.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://seatd_0.6.3.bb</a>&gt; &lt;<a href=3D"http:/=
/seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">http://seatd_0.6.3.bb=
</a> &lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">http://seatd_0.6.3.bb</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++++++++++++=
+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A03 files =
changed, 75 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0create m=
ode 100644 meta/recipes-core/seatd/seatd/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0create m=
ode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-core/seatd/<a href=3D"http://seatd_0.6=
.3.bb" rel=3D"noreferrer" target=3D"_blank">seatd_0.6.3.bb</a> &lt;<a href=
=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">http://seat=
d_0.6.3.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seat=
d_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">http://seatd_0.6.3.bb</a> =
&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">=
http://seatd_0.6.3.bb</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/co=
nf/distro/include/maintainers.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0b/meta/conf/distro/include=
/maintainers.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index ae25287c11..cb=
289a0eee 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -684,6 +684,7 @@ =
RECIPE_MAINTAINER:pn-rxvt-unicode =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;Unassigned &lt;<a hr=
ef=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoct=
oproject.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:unassigned@yoctoprojec=
t.org" target=3D"_blank">unassigned@yoctoproject.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.o=
rg</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:unassigned@yoctoprojec=
t.org" target=3D"_blank">unassigned@yoctoproject.org</a>&gt;&gt;&gt;&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_M=
AINTAINER:pn-sato-screenshot =3D &quot;Ross Burton<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:ross=
.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a> &lt;mailto:<a hr=
ef=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ross.burton@arm.com" t=
arget=3D"_blank">ross.burton@arm.com</a> &lt;mailto:<a href=3D"mailto:ross.=
burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;&gt;&gt;&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_M=
AINTAINER:pn-sbc =3D &quot;Unassigned<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:unas=
signed@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.org</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:unassigned@yoctoprojec=
t.org" target=3D"_blank">unassigned@yoctoproject.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:unassigned@yoctoprojec=
t.org" target=3D"_blank">unassigned@yoctoproject.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:unassigned@yoctoprojec=
t.org" target=3D"_blank">unassigned@yoctoproject.org</a>&gt;&gt;&gt;&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_M=
AINTAINER:pn-screen =3D &quot;Anuj Mittal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:anuj=
.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a> &lt;mailto:<=
a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:anuj.mittal@intel.com"=
 target=3D"_blank">anuj.mittal@intel.com</a> &lt;mailto:<a href=3D"mailto:a=
nuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&gt;&g=
t;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +RECIPE_MAINTAINER:p=
n-seatd =3D &quot;Alexander Kanavin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto=
:<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@g=
mail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;&g=
t;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_M=
AINTAINER:pn-sed =3D &quot;Chen Qi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a> &lt;mailto:<a href=3D"mailto:Qi.Chen@=
windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a> &lt;m=
ailto:<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@wi=
ndriver.com</a>&gt;&gt;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_M=
AINTAINER:pn-serf =3D &quot;Anuj Mittal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=
=3D"_blank">anuj.mittal@intel.com</a> &lt;mailto:<a href=3D"mailto:anuj.mit=
tal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a> &lt;m=
ailto:<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mitta=
l@intel.com</a>&gt;&gt;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_M=
AINTAINER:pn-setserial =3D &quot;Yi Zhao<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:yi.z=
hao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a> &lt;mailto:<=
a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:yi.zhao@windriver.com"=
 target=3D"_blank">yi.zhao@windriver.com</a> &lt;mailto:<a href=3D"mailto:y=
i.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&gt;&g=
t;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/re=
cipes-core/seatd/seatd/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-core/seatd/=
seatd/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..05=
89c765ac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-c=
ore/seatd/seatd/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,45 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#!/bin/sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +### BEGIN INIT INFO=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Provides: seatd<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Required-Start: $=
local_fs $remote_fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Required-Stop: $l=
ocal_fs $remote_fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Default-Start:=C2=
=A0 =C2=A0 =C2=A02 3 4 5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Default-Stop:=C2=
=A0 =C2=A0 =C2=A0 0 1 6<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +### END INIT INFO<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +killproc() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pid=3D`/bin/pidof $1`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [ &quot;$pid&quot; !=3D &quot;&quot; ] &amp;&amp; kill $pid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +case &quot;$1&quot;=
 in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 start)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 seatd -g video -n 1 &gt; /tmp/seatd-start-notify &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] &amp;&amp; exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sleep 0.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] &amp;&amp; exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sleep 0.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] &amp;&amp; exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sleep 5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] &amp;&amp; exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 stop)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;Stopping seatd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 killproc seatd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 restart)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0$0 stop<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $0 start<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 *)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;usage: $0 { start | stop | restart }&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/re=
cipes-core/seatd/<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">seatd_0.6.3.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://seatd_0.6.3.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seat=
d_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">http://seatd_0.6.3.bb</a> =
&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">=
http://seatd_0.6.3.bb</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-core/seatd/<a href=3D"http://seatd_0=
.6.3.bb" rel=3D"noreferrer" target=3D"_blank">seatd_0.6.3.bb</a> &lt;<a hre=
f=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">http://sea=
td_0.6.3.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seat=
d_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">http://seatd_0.6.3.bb</a> =
&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">=
http://seatd_0.6.3.bb</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..0e=
1a79dddf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-c=
ore/seatd/<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">seatd_0.6.3.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://seatd_0.6.3.bb</a>&gt; &lt;<a href=3D"http:/=
/seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">http://seatd_0.6.3.bb=
</a> &lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">http://seatd_0.6.3.bb</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,29 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SUMMARY =3D &quot;A=
 minimal seat management daemon, and a universal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0seat management library.&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +DESCRIPTION =3D &qu=
ot;Seat management takes care of mediating<br>
&gt;=C2=A0 =C2=A0 =C2=A0access to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0shared devices (graphics, =
input), without requiring the<br>
&gt;=C2=A0 =C2=A0 =C2=A0applications<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0needing access to be root.=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +HOMEPAGE =3D &quot;=
<a href=3D"https://git.sr.ht/~kennylevinsen/seatd" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.sr.ht/~kennylevinsen/seatd</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.sr.ht/~kennylevinsen/sea=
td" rel=3D"noreferrer" target=3D"_blank">https://git.sr.ht/~kennylevinsen/s=
eatd</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git=
.sr.ht/~kennylevinsen/seatd" rel=3D"noreferrer" target=3D"_blank">https://g=
it.sr.ht/~kennylevinsen/seatd</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.sr.ht/~kennylevinsen/sea=
td" rel=3D"noreferrer" target=3D"_blank">https://git.sr.ht/~kennylevinsen/s=
eatd</a>&gt;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +LICENSE =3D &quot;M=
IT&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +LIC_FILES_CHKSUM =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;file://LICENSE;md5=
=3D715a99d2dd552e6188e74d4ed2914d5a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;git://<a href=3D"http://git.sr.ht/~ken=
nylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" targe=
t=3D"_blank">git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaste=
r</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://git.sr.ht/~kennylevinsen/seat=
d;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">ht=
tp://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://git.sr.ht/~kennylevins=
en/seatd;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bl=
ank">http://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster=
</a> &lt;<a href=3D"http://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;=
branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">http://git.sr.ht/~ken=
nylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster</a>&gt;&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0file://init&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRCREV =3D &quot;88=
db55f6068c1c01d85b61aa6adff0a6b2a8dce8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +S =3D &quot;${WORKD=
IR}/git&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +inherit meson pkgco=
nfig update-rc.d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +PACKAGECONFIG ?=3D =
&quot;libseat-builtin&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +PACKAGECONFIG[libse=
at-builtin] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dlibseat-builtin=3D=
enabled,-Dlibseat-builtin=3Ddisabled&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +do_install:append()=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ &quot;${VIRTUAL-RUNTIME_init_manager}&quot; !=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;systemd&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -Dm755 ${WORKDIR}/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0${D}/${sysconfdir}/init.d/=
seatd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +INITSCRIPT_NAME =3D=
 &quot;seatd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +INITSCRIPT_PARAMS =
=3D &quot;start 9 5 2 . stop 20 0 1 6 .&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +INHIBIT_UPDATERCD_B=
BCLASS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;${@oe.utils.conditio=
nal(&#39;VIRTUAL-RUNTIME_init_manager&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;systemd&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&#39;1&#39;, &#39;&#39;, d=
)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I was looking into seatd a=
s well, in my recipe I split it up<br>
&gt;=C2=A0 =C2=A0 =C2=A0a bit:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0```<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0PACKAGES =3D+ &quot;${PN}-=
launch libseat libseat-dev&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0FILES:${PN} =3D &quot;${bi=
ndir}/seatd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0FILES:${PN}-launch =3D &qu=
ot;${bindir}/seatd-launch&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0FILES:libseat =3D &quot;${=
libdir}/lib*${SOLIBS}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0FILES:libseat-dev =3D &quo=
t; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${includedir} ${FILES_SOLIBSDEV} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${libdir}/pkgconfig&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0RDEPENDS:${PN} =3D &quot;l=
ibseat (=3D ${EXTENDPKGV})&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0RDEPENDS:${PN}-launch =3D =
&quot;${PN} (=3D ${EXTENDPKGV})&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0RDEPENDS:libseat-dev =3D &=
quot;libseat (=3D ${EXTENDPKGV})&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0```<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Claudius<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0=
 Managing Director: Wolfgang Denk<br>
&gt;=C2=A0 =C2=A0 =C2=A0HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Gr=
oebenzell, Germany<br>
&gt;=C2=A0 =C2=A0 =C2=A0Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80=
 Email:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@=
denx.de</a> &lt;mailto:<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@d=
enx.de</a>&gt;<br>
&gt; <br>
<br>
-- <br>
DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Director: Wolf=
gang Denk<br>
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany<br>
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: <a href=3D"mailt=
o:ch@denx.de" target=3D"_blank">ch@denx.de</a><br>
</blockquote></div>

--0000000000004bc74305d71d96b8--

