Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rm5NG-0004Pv-8O
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jan 2012 16:18:30 +0100
Received: by wibhm17 with SMTP id hm17so1047150wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jan 2012 07:10:56 -0800 (PST)
Received: by 10.180.94.102 with SMTP id db6mr4321904wib.0.1326553855989;
	Sat, 14 Jan 2012 07:10:55 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q7sm6842251wix.5.2012.01.14.07.10.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Jan 2012 07:10:55 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
Date: Sat, 14 Jan 2012 16:10:55 +0100
Message-Id: <C049B63B-A0B3-4FFF-85AF-C9ECEA3FAEF9@dominion.thruhere.net>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] tzdata_2011n: provide pkg_postinst and timezone defaults
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
X-List-Received-Date: Sat, 14 Jan 2012 15:18:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jan. 2012, om 14:07 heeft Andrea Adami het volgende geschreven:

> * Take the extra bits in do_install from meta-openembedded
> * and add pkg_postinst script (adapted from Gentoo).
> * Default to 'Universal' timezone, present in the base package
> * and allow override using DEFAULT_TIMEZONE variable.
> * /etc/localtime and /etc/timezone are purposedly not packaged.
> * Bump PR
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> meta/recipes-extended/tzdata/tzdata_2011n.bb |   55 =
+++++++++++++++++++++++++-
> 1 files changed, 53 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-extended/tzdata/tzdata_2011n.bb =
b/meta/recipes-extended/tzdata/tzdata_2011n.bb
> index de9281a..862a196 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2011n.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2011n.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "PD"
> LIC_FILES_CHKSUM =3D =
"file://asia;beginline=3D2;endline=3D3;md5=3D06468c0e84ef4d4c97045a4a29b08=
234"
> DEPENDS =3D "tzcode-native"
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> RCONFLICTS=3D "timezones timezone-africa timezone-america =
timezone-antarctica \
>              timezone-arctic timezone-asia timezone-atlantic \
> @@ -19,6 +19,8 @@ SRC_URI[tzdata.sha256sum] =3D =
"a343e542486b2b8ebdeca474eed79f1c04f69420ca943c2b9bd
>=20
> S =3D "${WORKDIR}"
>=20
> +DEFAULT_TIMEZONE ?=3D "Universal"
> +
> TZONES=3D "africa antarctica asia australasia europe northamerica =
southamerica  \
>          factory solar87 solar88 solar89 etcetera backward systemv \
>         "
> @@ -41,7 +43,56 @@ do_install () {
>         # libc is removing zoneinfo files from package
>         cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
>         cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
> -	chown -R root:root ${D}
> +
> +        # Install defaults
> +        install -d ${D}${sysconfdir}
> +        echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
> +        cp -pP ${S}/${datadir}/zoneinfo/${DEFAULT_TIMEZONE} =
${D}${sysconfdir}/localtime

Shouldn't that be an 'ln -sf' instead of a 'cp'?



