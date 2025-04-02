Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0490C36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 20:09:15 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.4850.1743624550502998486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 13:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0EkE5CC;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so217447e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 13:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743624549; x=1744229349; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8qrQ1aDXHoSuKDbLUaA4mn/uPLKSXDIIgz3aF3HKug=;
        b=R0EkE5CCj3pSMznociadSdHXutvuVBfZx3bIFo9Lv49fmk0B4EyPCUMKHcINdwHwm2
         PW9fFzELFtgWQHeDp64Vv+r6m0/tia7TdbtYxfwvs3C0K9jX5LlU5MNgslyz/WBWf9qg
         H6fzo6b8VbjYX63SB+Uxu8YpcVaR22fXzqwAk40aQJ8uqbd566IS6yrcGM/HTavx3lpi
         BjcUp+RMY5Ocx6UU4TrnefEPOKmoDEuGpyYiZaPbOaGrtYO4TE7i/taDkBdguODXPUeK
         kSRyqXho8IXL7hrllzegtugJVYmADfUS+iTE6DhpmQfnvDbMHujGJXwlRqJc23sJ1CSz
         vrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743624549; x=1744229349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8qrQ1aDXHoSuKDbLUaA4mn/uPLKSXDIIgz3aF3HKug=;
        b=PI6WExhm+PPDGbFgI5V89F+VVqAehgzp4cL34NMbYf6to9iDn0zoyb+RlqmcyT3xOm
         H2ZuvMohqzB6/giwf19KrHmSW8xzJXU21bQ+4oxb6VhPkieKz1hRgTrXcETyu9gDtzlQ
         coz5AyBhPWVVfr+o0Z8GqQlKBEO3bIkd2C6Gb/eK+Nu7rqUI+Ji/7zP+eMd7E05pGLp1
         0FxNvSrWcWJ8lga9MmHe/6qPOdbIZy/K8JxTo6oi7SG3rWJat3JoyVhThfDeniYaeVtT
         /Flif4JQgEldUIKEGSpZAo1B8RLhThpf5p/lgKlf7D9q3/i/GapSiMUnRsrgr+dwx0d/
         s/lw==
X-Gm-Message-State: AOJu0YzjtZqLZ5/9PoWsQETBO9hxKK2I3wmbXu87SCPxrZdC6/Qv18Ut
	E2k0BWn6I7xuTv/jyYJX1C4hXX3xxkyLBJRYsqHVpB4rwMjK1idMCFZl49toSyX/TDMOnSJamWR
	JvFONsr1OAnt275RI4lknldFe4+8=
X-Gm-Gg: ASbGncuKCM94i09/l60Iz5lvU9krQZMlFLeFfA/O1EyNUhdw0pTV+5AWOUpDLpx3TtI
	0bKaQKTyNy35oYGKehxDa4Ghb0BQ/puVn24LhxhDKH7UfrFT/KpeUTZFAxWw+JIxyclBzE/6ljx
	mCCjHmSLYoRjS4f3Au4qxDJTzW63BLKa1mKSwq9/HlFtMYI+soUSKD1YA=
X-Google-Smtp-Source: AGHT+IFwn9aJBCZJMp4Cp+ExICM3ubSNfVZAcvB84WTgc24Z0vbYPmVutMxKu4c18xBPNN3+R1q4AqoxKJZiRoQya9Y=
X-Received: by 2002:a05:6512:2204:b0:54a:f757:f8b3 with SMTP id
 2adb3069b0e04-54c1d7ff7f0mr22999e87.0.1743624548181; Wed, 02 Apr 2025
 13:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com> <20250402-connman-v1-4-2e4fbbb7caf9@gmail.com>
 <ebfc8f615d694ab3f0c060ed8d3b5c63b88cb7c8.camel@linuxfoundation.org>
In-Reply-To: <ebfc8f615d694ab3f0c060ed8d3b5c63b88cb7c8.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 2 Apr 2025 21:08:57 +0100
X-Gm-Features: AQ5f1JreSizXo4ma5rEdc5XVmxE26Zo-HHMkH03wQHLEuEDg7i1javRdg43kBOc
Message-ID: <CAO5Uq5T3xN9s5J4EqcQ5+SxmGf-pFWY-w9xrcmufbCNWxuM=1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core 4/5] connman: Add all build options as PACKAGECONFIG
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 20:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214291

On Wed, Apr 2, 2025 at 8:41=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via lists.openembedded.or=
g wrote:
> > Add all missing build options as PACKAGECONFIG items. Add CONNMAN_FIREW=
ALL to
> > select iptables or nftables (one is required).
> >
> > Set dns-backend automatically based on systemd-resolved in DISTRO_FEATU=
RES,
> > then drop "connman.service: stop systemd-resolved when we use connman" =
as we
> > now use connman's systemd-resolved support.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  ...vice-stop-systemd-resolved-when-we-use-co.patch | 26 -------
> >  meta/recipes-connectivity/connman/connman_1.44.bb  | 85 +++++++++++++-=
--------
> >  2 files changed, 50 insertions(+), 61 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.ser=
vice-stop-systemd-resolved-when-we-use-co.patch b/meta/recipes-connectivity=
/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.=
patch
> > deleted file mode 100644
> > index 4597fe68fcdf6f301247747c52b1d4636ebec631..00000000000000000000000=
00000000000000000
> > --- a/meta/recipes-connectivity/connman/connman/0001-connman.service-st=
op-systemd-resolved-when-we-use-co.patch
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -From 19aff57e4da920d9ca972903582305b4efe81ef3 Mon Sep 17 00:00:00 2001
> > -From: "Maxin B. John" <maxin.john@intel.com>
> > -Date: Mon, 12 Jun 2017 16:52:39 +0300
> > -Subject: [PATCH] connman.service: stop systemd-resolved when we use co=
nnman
> > -
> > -Stop systemd-resolved service when we use connman as network manager.
> > -
> > -Upstream-Status: Inappropriate [configuration]
> > -
> > -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ----
> > - src/connman.service.in | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/src/connman.service.in b/src/connman.service.in
> > -index 7376346..79e75d6 100644
> > ---- a/src/connman.service.in
> > -+++ b/src/connman.service.in
> > -@@ -6,6 +6,7 @@ RequiresMountsFor=3D@localstatedir@/lib/connman
> > - After=3Ddbus.service network-pre.target systemd-sysusers.service
> > - Before=3Dnetwork.target multi-user.target shutdown.target
> > - Wants=3Dnetwork.target
> > -+Conflicts=3Dsystemd-resolved.service
> > -
> > - [Service]
> > - Type=3Ddbus
> > diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/r=
ecipes-connectivity/connman/connman_1.44.bb
> > index aa9da070dec1b4aac02019ae9c3158256b534c61..2622a8ebfed0ceec7ac39fc=
f3ffad76291de5797 100644
> > --- a/meta/recipes-connectivity/connman/connman_1.44.bb
> > +++ b/meta/recipes-connectivity/connman/connman_1.44.bb
> > @@ -12,65 +12,79 @@ LICENSE  =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c=
4ca7e \
> >                      file://src/main.c;beginline=3D1;endline=3D20;md5=
=3D486a279a6ab0c8d152bcda3a5b5edc36"
> >
> > -inherit autotools pkgconfig systemd update-rc.d update-alternatives
> > -
> >  CVE_PRODUCT =3D "connman connection_manager"
> >
> >  DEPENDS  =3D "dbus glib-2.0"
> >
> >  SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
> > -           file://0001-connman.service-stop-systemd-resolved-when-we-u=
se-co.patch \
> >             file://connman \
> >             file://0002-resolve-musl-does-not-implement-res_ninit.patch=
 \
> > -           "
> > +"
> >
> >  SRC_URI[sha256sum] =3D "2be2b00321632b775f9eff713acd04ef21e31fbf388f6e=
bf45512ff4289574ff"
> >
> > +inherit autotools pkgconfig systemd update-rc.d update-alternatives
> > +
> > +RDEPENDS:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'wifi', '${W=
IRELESS_DAEMON}', '', d)}"
> >  RRECOMMENDS:${PN} =3D "connman-conf"
> > -RCONFLICTS:${PN} =3D "networkmanager"
> >
> >  EXTRA_OECONF +=3D "\
> > -    ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant \
> > -    ac_cv_path_PPPD=3D${sbindir}/pppd \
> > -    --enable-debug \
> > -    --enable-loopback \
> > -    --enable-ethernet \
> > +    --enable-datafiles \
> >      --enable-tools \
> > -    --disable-polkit \
> > -    --runstatedir=3D/run \
> > +    --runstatedir=3D'${runtimedir}' \
> > +    --with-dns-backend=3D'${@bb.utils.contains("DISTRO_FEATURES", "sys=
temd-resolved", "systemd-resolved", "internal", d)}' \
> > +    ac_cv_path_IP6TABLES_SAVE=3D${sbindir}/ip6tables-save \
> > +    ac_cv_path_IPTABLES_SAVE=3D${sbindir}/iptables-save \
> > +    ac_cv_path_PPPD=3D${sbindir}/pppd \
> > +    ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant \
> >  "
> > +
> >  # For smooth operation it would be best to start only one wireless dae=
mon at a time.
> >  # If wpa-supplicant is running, connman will use it preferentially.
> >  # Select either wpa-supplicant or iwd
> >  WIRELESS_DAEMON ??=3D "wpa-supplicant"
> >
> > -PACKAGECONFIG ??=3D "wispr iptables client\
> > -                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd',=
 d)} \
> > -                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez', '', d)} \
> > -                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'wi=
fi ${WIRELESS_DAEMON}', '', d)} \
> > +# Choose "iptables" or "nftables"
> > +CONNMAN_FIREWALL ??=3D "iptables"
> > +
> > +# Default is 16kB
> > +CONNMAN_STATS_MAX_FILE_SIZE =3D "16384"
> > +
> > +PACKAGECONFIG ??=3D "client ethernet loopback wispr ${CONNMAN_FIREWALL=
} \
> > +                   ${@bb.utils.filter('DISTRO_FEATURES', '3g bluetooth=
 nfc polkit selinux systemd usbgadget wifi', d)} \
> > +                   ${@bb.utils.filter('WIRELESS_DAEMON', 'iwd', d)} \
> >  "
> >
> > -# If you want ConnMan to support VPN, add following statement into
> > -# local.conf or distro config
> > -# PACKAGECONFIG:append:pn-connman =3D " openvpn vpnc l2tp pptp"
> > -
> > -PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${systemd_system_u=
nitdir}/ --with-tmpfilesdir=3D${sysconfdir}/tmpfiles.d/,--with-systemdunitd=
ir=3D'' --with-tmpfilesdir=3D''"
> > -PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi"
> > -PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-bluetooth, blu=
ez5, bluez5"
> > -PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono, ofono"
> > -PACKAGECONFIG[wpa-supplicant] =3D ",,wpa-supplicant,wpa-supplicant"
> > -PACKAGECONFIG[iwd] =3D "--enable-iwd,--disable-iwd,,iwd"
> > -PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
> > -PACKAGECONFIG[openvpn] =3D "--enable-openvpn --with-openvpn=3D${sbindi=
r}/openvpn,--disable-openvpn,,openvpn"
> > -PACKAGECONFIG[vpnc] =3D "--enable-vpnc --with-vpnc=3D${sbindir}/vpnc,-=
-disable-vpnc,,vpnc"
> > +PACKAGECONFIG[3g] =3D "--enable-ofono,--disable-ofono,ofono"
> > +PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth,--disable-bluetooth,b=
luez5,bluez5"
> > +PACKAGECONFIG[client] =3D "--enable-client,--disable-client,readline"
> > +PACKAGECONFIG[dundee] =3D "--enable-dundee,--disable-dundee"
> > +PACKAGECONFIG[ethernet] =3D "--enable-ethernet,--disable-ethernet"
> > +PACKAGECONFIG[hh2serial-gps] =3D "--enable-hh2serial-gps,--disable-hh2=
serial-gps"
> > +PACKAGECONFIG[iospm] =3D "--enable-iospm,--disable-iospm"
> > +PACKAGECONFIG[iptables] =3D ",,iptables,iptables,nftables"
>
> Typo above which adds nftables to the build and breaks it since
> nftables isn't in core.
>

Argh... thank you. Of course I generated almost the entire list from
sed/awk across the configure.ac (and then walked through the deps),
but not iptables/nftables :| Will get an update out in the morning.

--=20
Alex Kiernan

