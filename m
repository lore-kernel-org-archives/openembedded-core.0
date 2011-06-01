Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRmPz-0000Hn-6T
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 16:29:07 +0200
Received: by wwb17 with SMTP id 17so5227247wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 07:25:56 -0700 (PDT)
Received: by 10.216.235.22 with SMTP id t22mr3720614weq.89.1306938356602;
	Wed, 01 Jun 2011 07:25:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o75sm664250weq.16.2011.06.01.07.25.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 07:25:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306938155-28804-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 1 Jun 2011 16:25:53 +0200
Message-Id: <A29DFF20-D10B-4DF3-A3F7-2268917FE69A@dominion.thruhere.net>
References: <1306938155-28804-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] avahi: enable service when using systemd
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
X-List-Received-Date: Wed, 01 Jun 2011 14:29:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

scratch that one, the RDEPENDS change makes it depend on meta-oe


Op 1 jun 2011, om 16:22 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-connectivity/avahi/avahi.inc       |   20 =
+++++++++++++++++++-
> meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    2 +-
> 2 files changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
> index 099c5a4..e631ac5 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -44,7 +44,25 @@ EXTRA_OECONF =3D "--with-distro=3Ddebian \
> PACKAGES =3D+ "avahi-systemd avahi-daemon libavahi-common =
libavahi-core libavahi-client avahi-dnsconfd libavahi-glib =
libavahi-gobject avahi-autoipd avahi-ui-utils avahi-utils libavahi-ui =
libavahi-ui-dev"
>=20
> FILES_avahi-systemd =3D "${base_libdir}/systemd"
> -RDEPENDS_avahi-systemd =3D "avahi-daemon"
> +RDEPENDS_avahi-systemd =3D "avahi-daemon systemd"
> +
> +pkg_postinst_avahi-systemd() {
> +	# can't do this offline
> +	if [ "x$D" !=3D "x" ]; then
> +		exit 1
> +	fi
> +=09
> +	systemctl enable avahi-daemon.service
> +}
> +
> +pkg_postrm_avahi-systemd() {
> +	# can't do this offline
> +	if [ "x$D" !=3D "x" ]; then
> +		exit 1
> +	fi
> +
> +	systemctl disable avahi-daemon.service
> +}
>=20
> FILES_libavahi-common =3D "${libdir}/libavahi-common.so.*"
> FILES_libavahi-core =3D "${libdir}/libavahi-core.so.*"
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb =
b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> index e63f406..9d10800 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>                     =
file://avahi-client/client.h;endline=3D23;md5=3Df4ac741a25c4f434039ba3e18c=
8674cf"
>=20
> RDEPENDS_avahi-daemon =3D "sysvinit-pidof"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> EXTRA_OECONF +=3D "--disable-gtk3"
>=20
> --=20
> 1.6.6.1
>=20



