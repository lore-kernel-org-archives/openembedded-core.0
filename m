Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7749CC36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 19:42:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4155.1743622915661139852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 12:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QjQgJWq+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so611585e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 12:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743622914; x=1744227714; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JTLhJfOljnre95vfC0ZqsgSg4PUOcCrfSQRS3wid2U=;
        b=QjQgJWq+cTH2tuNornnq7gyXc/Uw2IGYPb3kIojknsPa8C4XGGjPjv2Je1Q7p9JVry
         zKgR+IX+jszCIwgIg6WuO/t/CbETUVGFrPWQDyXNuuu8RrOsBSwBfJkCd7wrfamfwPvP
         2WD/hplKz7NbwK60w5pQ3U+w2rOI9WcL0wpD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743622914; x=1744227714;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4JTLhJfOljnre95vfC0ZqsgSg4PUOcCrfSQRS3wid2U=;
        b=kU3YGOjY4lH0cDhseIwfX4s3J3jFKoi7r7D6o9ijCGw9FZK6g56qW410PqDxVbKmPR
         WJNx24DdH5I2lpaSXgruEkvcUsqA5HRNe00zAJ0g4EK1qNlfTTH9iJhKORzt1CQ4mGnV
         nlVilw2fgZ9AfCq7c/Bp+UCuub1NeaRpqWLwMLzIgnU0X3bYx/1XewSNH+BOYTk8gdqU
         RuZaTApjh3bBshFC85CqL3u9jhfq036D20AsPRejJDmLz7KTW6o1fKN8wDI54QSVaggE
         XzVD2reBEaKXIS+/Oyk+nFQ0U7jb8iw2ikTeQQq4Oz4hhm+qpkjMhdEEQfQnzVa0xdHQ
         hO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/tWczmevbhrfyWN7iSntActniRn9+cG6VZd0xmiD8BPvDziml/I3pXtE2OkbwgLIwB17UTz5ddnieEgBeYzwDUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxIhnsiyAxKW8F4XlxfFPP5youFzgPHxcQ2UxMTitXhRMiNMU8l
	H1Omy4LB8UYrxN674cYVO8qQdUHW6jmDftz+vW77kx32oO2v++mMQtj64qPadBR4amKjVO3A7mu
	x
X-Gm-Gg: ASbGncuSo5iNkkdW9uvJOiAIbj59yYpEhcB18u57jcWpNCXgxDO4R8Fh0LA43SsG4Ue
	+vN4OOJvWl+ITmANRnrAVdp4OHpT1c/0TYAvLvhmPM8dmbL4SJPNBNvR2bn97iPPYZwpJaBc+4n
	y43xeDuMmHiT5wJl0PC8menhnWGZ5BQpYbxGIXwpIY+HHibnaaUiTqVqMPuZeGJWRGYa5uiDGrU
	hUx9eVP+g+6XdRA0IG189Ou0zUsegFVCA3vy86BTgHSwNUlV+suSZabrT/FAnoEepetTb6Y+f9m
	7Y9YZrQ/Li6quvvry8IuU4QE9JOp1JILCfdsqYLDISscQjjoIffkEXwgkt86QzQkU7XEpuKsP71
	ADgdPiGOIVIxqr3j6gQqztz5I/Ave/KkpwA==
X-Google-Smtp-Source: AGHT+IHz8n5p28nhDwrKdtOozh6yH1zFYq+Z1qKIlew/0KNiyDYyOrpngcKulm6WMpjvg6DB6iTKLw==
X-Received: by 2002:a05:600c:4589:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43eb5c187e8mr33611115e9.9.1743622913952;
        Wed, 02 Apr 2025 12:41:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc5924sm30571935e9.7.2025.04.02.12.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:41:53 -0700 (PDT)
Message-ID: <ebfc8f615d694ab3f0c060ed8d3b5c63b88cb7c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH OE-Core 4/5] connman: Add all build options as
 PACKAGECONFIG
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 02 Apr 2025 20:41:52 +0100
In-Reply-To: <20250402-connman-v1-4-2e4fbbb7caf9@gmail.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
	 <20250402-connman-v1-4-2e4fbbb7caf9@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 19:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214290

On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via lists.openembedded.org =
wrote:
> Add all missing build options as PACKAGECONFIG items. Add CONNMAN_FIREWAL=
L to
> select iptables or nftables (one is required).
>=20
> Set dns-backend automatically based on systemd-resolved in DISTRO_FEATURE=
S,
> then drop "connman.service: stop systemd-resolved when we use connman" as=
 we
> now use connman's systemd-resolved support.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> =C2=A0...vice-stop-systemd-resolved-when-we-use-co.patch | 26 -------
> =C2=A0meta/recipes-connectivity/connman/connman_1.44.bb=C2=A0 | 85 ++++++=
+++++++---------
> =C2=A02 files changed, 50 insertions(+), 61 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.servi=
ce-stop-systemd-resolved-when-we-use-co.patch b/meta/recipes-connectivity/c=
onnman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.pa=
tch
> deleted file mode 100644
> index 4597fe68fcdf6f301247747c52b1d4636ebec631..0000000000000000000000000=
000000000000000
> --- a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop=
-systemd-resolved-when-we-use-co.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 19aff57e4da920d9ca972903582305b4efe81ef3 Mon Sep 17 00:00:00 2001
> -From: "Maxin B. John" <maxin.john@intel.com>
> -Date: Mon, 12 Jun 2017 16:52:39 +0300
> -Subject: [PATCH] connman.service: stop systemd-resolved when we use conn=
man
> -
> -Stop systemd-resolved service when we use connman as network manager.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ----
> - src/connman.service.in | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/connman.service.in b/src/connman.service.in
> -index 7376346..79e75d6 100644
> ---- a/src/connman.service.in
> -+++ b/src/connman.service.in
> -@@ -6,6 +6,7 @@ RequiresMountsFor=3D@localstatedir@/lib/connman
> - After=3Ddbus.service network-pre.target systemd-sysusers.service
> - Before=3Dnetwork.target multi-user.target shutdown.target
> - Wants=3Dnetwork.target
> -+Conflicts=3Dsystemd-resolved.service
> -=20
> - [Service]
> - Type=3Ddbus
> diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/rec=
ipes-connectivity/connman/connman_1.44.bb
> index aa9da070dec1b4aac02019ae9c3158256b534c61..2622a8ebfed0ceec7ac39fcf3=
ffad76291de5797 100644
> --- a/meta/recipes-connectivity/connman/connman_1.44.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.44.bb
> @@ -12,65 +12,79 @@ LICENSE=C2=A0 =3D "GPL-2.0-only"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7cc=
c2c4ca7e=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://src/main.c;beginlin=
e=3D1;endline=3D20;md5=3D486a279a6ab0c8d152bcda3a5b5edc36"
> =C2=A0
> -inherit autotools pkgconfig systemd update-rc.d update-alternatives
> -
> =C2=A0CVE_PRODUCT =3D "connman connection_manager"
> =C2=A0
> =C2=A0DEPENDS=C2=A0 =3D "dbus glib-2.0"
> =C2=A0
> =C2=A0SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz =
\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-connman.service-stop-systemd-resolved-when-we-use-co.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/connman=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0002-resolve-musl-does-not-implement-res_ninit.patch=C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> +"
> =C2=A0
> =C2=A0SRC_URI[sha256sum] =3D "2be2b00321632b775f9eff713acd04ef21e31fbf388=
f6ebf45512ff4289574ff"
> =C2=A0
> +inherit autotools pkgconfig systemd update-rc.d update-alternatives
> +
> +RDEPENDS:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'wifi', '${WIR=
ELESS_DAEMON}', '', d)}"
> =C2=A0RRECOMMENDS:${PN} =3D "connman-conf"
> -RCONFLICTS:${PN} =3D "networkmanager"
> =C2=A0
> =C2=A0EXTRA_OECONF +=3D "\
> -=C2=A0=C2=A0=C2=A0 ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant =
\
> -=C2=A0=C2=A0=C2=A0 ac_cv_path_PPPD=3D${sbindir}/pppd \
> -=C2=A0=C2=A0=C2=A0 --enable-debug \
> -=C2=A0=C2=A0=C2=A0 --enable-loopback \
> -=C2=A0=C2=A0=C2=A0 --enable-ethernet \
> +=C2=A0=C2=A0=C2=A0 --enable-datafiles \
> =C2=A0=C2=A0=C2=A0=C2=A0 --enable-tools \
> -=C2=A0=C2=A0=C2=A0 --disable-polkit \
> -=C2=A0=C2=A0=C2=A0 --runstatedir=3D/run \
> +=C2=A0=C2=A0=C2=A0 --runstatedir=3D'${runtimedir}' \
> +=C2=A0=C2=A0=C2=A0 --with-dns-backend=3D'${@bb.utils.contains("DISTRO_FE=
ATURES", "systemd-resolved", "systemd-resolved", "internal", d)}' \
> +=C2=A0=C2=A0=C2=A0 ac_cv_path_IP6TABLES_SAVE=3D${sbindir}/ip6tables-save=
 \
> +=C2=A0=C2=A0=C2=A0 ac_cv_path_IPTABLES_SAVE=3D${sbindir}/iptables-save \
> +=C2=A0=C2=A0=C2=A0 ac_cv_path_PPPD=3D${sbindir}/pppd \
> +=C2=A0=C2=A0=C2=A0 ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant =
\
> =C2=A0"
> +
> =C2=A0# For smooth operation it would be best to start only one wireless =
daemon at a time.
> =C2=A0# If wpa-supplicant is running, connman will use it preferentially.
> =C2=A0# Select either wpa-supplicant or iwd
> =C2=A0WIRELESS_DAEMON ??=3D "wpa-supplicant"
> =C2=A0
> -PACKAGECONFIG ??=3D "wispr iptables client\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', =
'3g systemd', d)} \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES'=
, 'bluetooth', 'bluez', '', d)} \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES'=
, 'wifi', 'wifi ${WIRELESS_DAEMON}', '', d)} \
> +# Choose "iptables" or "nftables"
> +CONNMAN_FIREWALL ??=3D "iptables"
> +
> +# Default is 16kB
> +CONNMAN_STATS_MAX_FILE_SIZE =3D "16384"
> +
> +PACKAGECONFIG ??=3D "client ethernet loopback wispr ${CONNMAN_FIREWALL} =
\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', =
'3g bluetooth nfc polkit selinux systemd usbgadget wifi', d)} \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('WIRELESS_DAEMON', =
'iwd', d)} \
> =C2=A0"
> =C2=A0
> -# If you want ConnMan to support VPN, add following statement into
> -# local.conf or distro config
> -# PACKAGECONFIG:append:pn-connman =3D " openvpn vpnc l2tp pptp"
> -
> -PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${systemd_system_uni=
tdir}/ --with-tmpfilesdir=3D${sysconfdir}/tmpfiles.d/,--with-systemdunitdir=
=3D'' --with-tmpfilesdir=3D''"
> -PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi"
> -PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-bluetooth, bluez=
5, bluez5"
> -PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono, ofono"
> -PACKAGECONFIG[wpa-supplicant] =3D ",,wpa-supplicant,wpa-supplicant"
> -PACKAGECONFIG[iwd] =3D "--enable-iwd,--disable-iwd,,iwd"
> -PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
> -PACKAGECONFIG[openvpn] =3D "--enable-openvpn --with-openvpn=3D${sbindir}=
/openvpn,--disable-openvpn,,openvpn"
> -PACKAGECONFIG[vpnc] =3D "--enable-vpnc --with-vpnc=3D${sbindir}/vpnc,--d=
isable-vpnc,,vpnc"
> +PACKAGECONFIG[3g] =3D "--enable-ofono,--disable-ofono,ofono"
> +PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth,--disable-bluetooth,blu=
ez5,bluez5"
> +PACKAGECONFIG[client] =3D "--enable-client,--disable-client,readline"
> +PACKAGECONFIG[dundee] =3D "--enable-dundee,--disable-dundee"
> +PACKAGECONFIG[ethernet] =3D "--enable-ethernet,--disable-ethernet"
> +PACKAGECONFIG[hh2serial-gps] =3D "--enable-hh2serial-gps,--disable-hh2se=
rial-gps"
> +PACKAGECONFIG[iospm] =3D "--enable-iospm,--disable-iospm"
> +PACKAGECONFIG[iptables] =3D ",,iptables,iptables,nftables"

Typo above which adds nftables to the build and breaks it since
nftables isn't in core.

Cheers,

Richard

