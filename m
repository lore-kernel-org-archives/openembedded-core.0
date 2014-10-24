Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 44E746AC08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 06:10:59 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id bs8so386065wib.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 23:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=tuhgkoW0fmNjnprWnc0KIJXMOikMzfCuFby0YNO4yIM=;
	b=ljl8RYWy0C5E066xmS8rWtSPcf7Xb5nXQKZho+nwZpxGjNnWNTewxSGEafZASPhtNI
	mwMUd2apwUNvLeAmoIMcowoLY1k+CQR1Qyce2zkIfNnszFlZH1PqWGmV13WXdmmcPb7c
	4g1FBfjLStoJLF9v5pKNS+97+sophmHqmmTr2KhCvX9PlREHhk7E05ZQ9zAZowcvSlao
	Zk/3gQxGobJXoi0wd81N0qF78pmf3mkFVkmA2UJKTowx9MEaJHJXVn9VGvTqXQIOkvHE
	C+HELmoVU77gqW8+npa8r4sNajU3X4nBjd/UpZGUOy4LST0Zl3Dkr+gKwcTKJDUjCYux
	nEgg==
X-Gm-Message-State: ALoCoQlwzFFTO8pfpbr3/VcD9WHIXXe6ZOpqr2TlFN74uwUDfnsQGdjuhdLScEv3SxWkMHwzwpp4
X-Received: by 10.180.76.199 with SMTP id m7mr1866013wiw.40.1414131059930;
	Thu, 23 Oct 2014 23:10:59 -0700 (PDT)
Received: from ?IPv6:2001:610:612::3140:1c82:99ad:ccec?
	([2001:610:612:0:3140:1c82:99ad:ccec])
	by mx.google.com with ESMTPSA id i1sm808566wix.23.2014.10.23.23.10.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Oct 2014 23:10:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
Date: Fri, 24 Oct 2014 08:10:57 +0200
Message-Id: <73178E47-C311-4EA8-9B4C-6691A7E6B82A@dominion.thruhere.net>
References: <cover.1413960370.git.Chong.Lu@windriver.com>
	<0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
To: Chong Lu <Chong.Lu@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Oct 2014 06:11:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 22 okt. 2014, om 09:09 heeft Chong Lu <Chong.Lu@windriver.com> het =
volgende geschreven:
>=20
> The gconfd-2 will be called in org.gnome.GConf.service file and the =
path of
> gconfd-2 is ${libexecdir}, this will get following error when multilib =
exported
> in the sdk:
> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from =
install
> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
> gconf-3.2.6-r0.0.x86_64
>=20
> Move org.gnome.GConf.service to ${libdir}, then the conflict was =
fixed.

And I suspect its dbus service won't work anymore after moving the =
files. How have you tested this change?


> Add split out the client libraries into a separate package.
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
> meta/recipes-gnome/gnome/gconf_3.2.6.bb | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb =
b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> index 17fdafa..bbb13b2 100644
> --- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> +++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> @@ -19,6 +19,8 @@ SRC_URI[archive.sha256sum] =3D =
"1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e
>=20
> S =3D "${WORKDIR}/GConf-${PV}"
>=20
> +PACKAGES =3D+ "libgconf"
> +
> EXTRA_OECONF =3D "--enable-shared --disable-static --enable-debug=3Dyes =
\
>                 --disable-introspection --disable-orbit =
--with-openldap=3Dno --disable-gtk"
>=20
> @@ -37,6 +39,8 @@ do_install_append() {
> 	# this stuff is unusable
> 	rm -f ${D}${libdir}/GConf/*/*.*a
> 	rm -f ${D}${libdir}/gio/*/*.*a
> +
> +	mv ${D}${datadir}/dbus-1 ${D}${libdir}/
> }
>=20
> do_install_append_class-native() {
> @@ -47,13 +51,15 @@ do_install_append_class-native() {
> # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
> RDEPENDS_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', =
'dbus-x11', '', d)}"
> RDEPENDS_${PN}_class-native =3D ""
> +RDEPENDS_${PN} +=3D "libgconf"
>=20
> FILES_${PN} +=3D "${libdir}/GConf/* \
> -                ${libdir}/gio/*/*.so \
>                 ${datadir}/polkit* \
> -                ${datadir}/dbus-1/services/*.service \
>                 ${datadir}/dbus-1/system-services/*.service \
>                "
> +FILES_libgconf =3D "${libdir}/lib*${SOLIBS} =
${libdir}/gio/modules/*.so \
> +                  ${libdir}/dbus-1/services/*.service"
> +
> FILES_${PN}-dbg +=3D "${libdir}/*/*/.debug"
> FILES_${PN}-dev +=3D "${datadir}/sgml/gconf/gconf-1.0.dtd"
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


