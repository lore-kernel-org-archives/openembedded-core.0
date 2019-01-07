Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE037BEAD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1D778183C3;
	Mon,  7 Jan 2019 17:43:15 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id H3NU6kKWz_Ul; Mon,  7 Jan 2019 17:43:14 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id F031B1830E;
	Mon,  7 Jan 2019 17:43:13 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D51F81E079;
	Mon,  7 Jan 2019 17:43:13 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C98D21E076;
	Mon,  7 Jan 2019 17:43:13 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  7 Jan 2019 17:43:13 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id BD43C2BB6;
	Mon,  7 Jan 2019 17:43:13 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 7 Jan 2019 17:43:13 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 7 Jan 2019 17:43:13 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jonas Bonn <jonas@norrbonn.se>
Thread-Topic: [OE-core] [PATCH v2 3/5] systemd: create preset files instead of
	installing in image
Thread-Index: AQHUorXsVEXuwj4wrU+txCQyOBUa1KWkB4AQ
Date: Mon, 7 Jan 2019 16:43:13 +0000
Message-ID: <ea694a7d32b44158870c954912b1ecb7@XBOX04.axis.com>
References: <20190102161144.11264-1-jonas@norrbonn.se>
	<20190102161144.11264-4-jonas@norrbonn.se>
In-Reply-To: <20190102161144.11264-4-jonas@norrbonn.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/5] systemd: create preset files instead of	installing in image
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
X-List-Received-Date: Mon, 07 Jan 2019 16:43:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Jonas Bonn
> Sent: den 2 januari 2019 17:12
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2 3/5] systemd: create preset files instead
> of installing in image
>=20
> At first boot, systemd will create the /etc/systemd/system directory
> from service preset files.  As such, for a normal, writable /etc
> (writable rootfs), there is no need to set up this directory at image
> creation time.
>=20
> This patch changes the systemd machinery to create preset files and to
> rely on systemd to do the service enablement.
>=20
> This breaks the read-only-rootfs case; there's a fix for this in a
> follow-up patch.
>=20
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> ---
>  meta/classes/systemd.bbclass | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
>=20
> diff --git a/meta/classes/systemd.bbclass
> b/meta/classes/systemd.bbclass
> index c7b784dea8..cf3b5de4a1 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -16,43 +16,32 @@ python __anonymous() {
>      # from doing any work so that pure-systemd images don't have redunda=
nt init
>      # files.
>      if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
> -        d.appendVar("DEPENDS", " systemd-systemctl-native")
> -        d.appendVar("PACKAGE_WRITE_DEPS", " systemd-systemctl-native")
>          if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, Fa=
lse, d):
>              d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
>  }
>=20
>  systemd_postinst() {
> -OPTS=3D""
> -
>  if [ -n "$D" ]; then
> -    OPTS=3D"--root=3D$D"
> +	exit 0
>  fi
>=20
>  if type systemctl >/dev/null 2>/dev/null; then
> -	if [ -z "$D" ]; then
> -		systemctl daemon-reload
> -	fi
> -
> -	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE_ESCAPED}
> +	systemctl daemon-reload
> +	systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
>=20
> -	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
> +	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
>  		systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
>  	fi
>  fi
>  }
>=20
>  systemd_prerm() {
> -OPTS=3D""
> -
>  if [ -n "$D" ]; then
> -    OPTS=3D"--root=3D$D"
> +	exit 0
>  fi
>=20
>  if type systemctl >/dev/null 2>/dev/null; then
> -	if [ -z "$D" ]; then
> -		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
> -	fi
> +	systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
>=20
>  	systemctl $OPTS disable ${SYSTEMD_SERVICE_ESCAPED}
>  fi
> @@ -177,12 +166,22 @@ python systemd_populate_packages() {
>                  else:
>                      bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist=
" % (pkg_systemd, service))
>=20
> +    def systemd_create_presets(pkg):
> +        action =3D get_package_var(d, 'SYSTEMD_AUTO_ENABLE', pkg)
> +        presetf =3D oe.path.join(d.getVar("PKGD"), "/lib/systemd/system-=
preset/98-%s.preset" % pkg)

Using "/lib" above does not take into account the usrmerge distro=20
feature. My suggestion is to use ${nonarch_base_libdir} instead of=20
/lib, or maybe even better is to use ${systemd_unitdir} instead of=20
/lib/systemd, i.e.:

        presetf =3D oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdi=
r "), "/system-preset/98-%s.preset" % pkg)

> +        bb.utils.mkdirhier(os.path.dirname(presetf))
> +        with open(presetf, 'a') as fd:
> +            for service in d.getVar('SYSTEMD_SERVICE_%s' % pkg).split():
> +                fd.write("%s %s\n" % (action,service))
> +        d.appendVar("FILES_%s" % pkg, " /lib/systemd/system-preset/98-%s=
.preset" % pkg)

Same here. Use "${systemd_unitdir}" instead of "/lib/systemd".

> +
>      # Run all modifications once when creating package
>      if os.path.exists(d.getVar("D")):
>          for pkg in d.getVar('SYSTEMD_PACKAGES').split():
>              systemd_check_package(pkg)
>              if d.getVar('SYSTEMD_SERVICE_' + pkg):
>                  systemd_generate_package_scripts(pkg)
> +                systemd_create_presets(pkg)
>          systemd_check_services()
>  }
>=20
> --
> 2.19.1

//Peter


