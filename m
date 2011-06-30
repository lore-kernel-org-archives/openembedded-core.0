Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcMJu-0004XS-HR
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 20:50:34 +0200
Received: by wwi14 with SMTP id 14so1046662wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 11:46:50 -0700 (PDT)
Received: by 10.227.3.4 with SMTP id 4mr140319wbl.35.1309459610698;
	Thu, 30 Jun 2011 11:46:50 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm1822506wbh.42.2011.06.30.11.46.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 11:46:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308993885-14753-2-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 30 Jun 2011 20:46:49 +0200
Message-Id: <4B08B537-6B8E-499C-BC58-443044A825B1@dominion.thruhere.net>
References: <1308993885-14753-1-git-send-email-koen@dominion.thruhere.net>
	<1308993885-14753-2-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] consolekit 0.4.5: remove patch that forcibly disables consolekit
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
X-List-Received-Date: Thu, 30 Jun 2011 18:50:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 25 jun 2011, om 11:24 heeft Koen Kooi het volgende geschreven:

> Polkit support is actually needed for consolekit to function properly, =
without you get things like:
>=20
> 	** (gnome-panel:547): WARNING **: Could not ask session manager =
if shut down is available: Timeout was reached
>=20
> Various applications will timeout and less well written ones will =
crash (e.g. the clock applet).
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> .../recipes-support/consolekit/consolekit_0.4.5.bb |    7 +++----
> .../consolekit/files/nopolkit.patch                |   18 =
------------------
> 2 files changed, 3 insertions(+), 22 deletions(-)
> delete mode 100644 =
meta/recipes-support/consolekit/files/nopolkit.patch
>=20
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb =
b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> index 2b85455..c934d0f 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> @@ -2,18 +2,17 @@ DESCRIPTION =3D "ConsoleKit is a framework for =
defining and tracking users, login
> HOMEPAGE=3D"http://www.freedesktop.org/wiki/Software/ConsoleKit"
> =
BUGTRACKER=3D"https://bugs.freedesktop.org/buglist.cgi?query_format=3Dspec=
ific&product=3DConsoleKit"
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>                     =
file://src/main.c;endline=3D21;md5=3D0a994e09769780220163255d8f9071c3"
>=20
> -DEPENDS =3D "dbus ${@base_contains('DISTRO_FEATURES', 'pam', =
'libpam', '', d)}"
> +DEPENDS =3D "dbus polkit ${@base_contains('DISTRO_FEATURES', 'pam', =
'libpam', '', d)}"
>=20
> inherit gnome
>=20
> -SRC_URI =3D =
"http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.=
bz2 \
> -           file://nopolkit.patch"
> +SRC_URI =3D =
"http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.=
bz2"
> SRC_URI[md5sum] =3D "f2657f93761206922d558471a936fbc3"
> SRC_URI[sha256sum] =3D =
"43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b223686b9c38"
>=20
> diff --git a/meta/recipes-support/consolekit/files/nopolkit.patch =
b/meta/recipes-support/consolekit/files/nopolkit.patch
> deleted file mode 100644
> index a0d9d06..0000000
> --- a/meta/recipes-support/consolekit/files/nopolkit.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: ConsoleKit-0.4.3/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ConsoleKit-0.4.3.orig/configure.ac	2010-10-26 =
22:34:03.000000000 +0800
> -+++ ConsoleKit-0.4.3/configure.ac	2010-11-28 15:28:26.000000000 =
+0800
> -@@ -55,10 +55,7 @@
> -   gthread-2.0 >=3D $GLIB_REQUIRED_VERSION
> - )
> -=20
> --PKG_CHECK_MODULES(POLKIT,
> --  polkit-gobject-1 >=3D $POLKIT_REQUIRED_VERSION,
> --  have_polkit=3Dyes,
> --  have_polkit=3Dno)
> -+have_polkit=3Dno
> - if test "x$have_polkit" =3D "xyes" ; then
> -        AC_DEFINE(HAVE_POLKIT, [], [Define if we have polkit])
> - fi
> --=20
> 1.6.6.1
>=20



