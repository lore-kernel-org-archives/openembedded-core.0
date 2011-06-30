Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcMJq-0004XH-Si
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 20:50:30 +0200
Received: by wwi18 with SMTP id 18so2166374wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 11:46:47 -0700 (PDT)
Received: by 10.227.178.135 with SMTP id bm7mr2096143wbb.52.1309459604637;
	Thu, 30 Jun 2011 11:46:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm1822506wbh.42.2011.06.30.11.46.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 11:46:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308993885-14753-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 30 Jun 2011 20:46:37 +0200
Message-Id: <4737DFF0-539D-47D5-B62E-A183AE5CF494@dominion.thruhere.net>
References: <1308993885-14753-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/2] consolekit 0.4.5: add pam support based on distro features
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 18:50:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping=20

Op 25 jun 2011, om 11:24 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> .../recipes-support/consolekit/consolekit_0.4.5.bb |   13 =
++++++++++---
> 1 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb =
b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> index f3b1ef8..2b85455 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> @@ -2,11 +2,13 @@ DESCRIPTION =3D "ConsoleKit is a framework for =
defining and tracking users, login
> HOMEPAGE=3D"http://www.freedesktop.org/wiki/Software/ConsoleKit"
> =
BUGTRACKER=3D"https://bugs.freedesktop.org/buglist.cgi?query_format=3Dspec=
ific&product=3DConsoleKit"
>=20
> +PR =3D "r2"
> +
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>                     =
file://src/main.c;endline=3D21;md5=3D0a994e09769780220163255d8f9071c3"
>=20
> -DEPENDS =3D "dbus"
> +DEPENDS =3D "dbus ${@base_contains('DISTRO_FEATURES', 'pam', =
'libpam', '', d)}"
>=20
> inherit gnome
>=20
> @@ -18,8 +20,13 @@ SRC_URI[sha256sum] =3D =
"43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b22368
>=20
> S =3D "${WORKDIR}/ConsoleKit-${PV}"
>=20
> -EXTRA_OECONF =3D =
"--with-systemdsystemunitdir=3D${base_libdir}/systemd/system/"
> +EXTRA_OECONF =3D =
"--with-systemdsystemunitdir=3D${base_libdir}/systemd/system/ \
> +                ${@base_contains('DISTRO_FEATURES', 'pam', =
'--enable-pam-module --with-pam-module-dir=3D${libdir}/security', =
'--disable-pam-module', d)} \
> +               "
>=20
> -FILES_${PN} +=3D "${libdir}/ConsoleKit ${base_libdir} =
${datadir}/dbus-1 ${datadir}/PolicyKit"
> +FILES_${PN} +=3D "${libdir}/ConsoleKit ${base_libdir} =
${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
>=20
> +PACKAGES =3D+ "pam-plugin-ck-connector"
> +FILES_pam-plugin-ck-connector +=3D "${libdir}/security/*.so"
> +RDEPENDS_pam-plugin-ck-connector +=3D "${PN}"
>=20
> --=20
> 1.6.6.1
>=20



