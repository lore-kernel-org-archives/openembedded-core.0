Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWoco-00082i-VQ
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 16:00:21 +0200
Received: by mail-wi0-f180.google.com with SMTP id h11so2782373wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=c4HiTZoK/bN3Vcs0kU7BpFOcqwd3JQHhtCP6UF90/RU=;
	b=O0ZV+3+o2WjCj8W7zvKe5kENWQ3T1G4Ml1TeizgIEEX5XxriE5+ijzkAEi3803VOI/
	HMTqIeEJV/4yFw6iN0kUK+0HbKCDk294AiYw1bbefxXomyT+FQYdkQZ7IOzTRuiT2mW0
	Bh0v5Z8hVQZVwSSsAKjxLeqmb9AIT9Y8aMzk6uqgUIQMPf6vAgudmue143ftCibN6kvh
	AhM8TZgquLCV2P3MbMNPicmkf5l6YOvnDl97LLsnuPgk3oA6S2wo/jO8L6Hx29FOTHrC
	cZ9jEIpN16G1FZaY0Ns9YgI6Hyw/8to23fikeladC/NmgZjPpWfwZu4XDZ8ccpbRyk1J
	4yMQ==
X-Received: by 10.194.5.4 with SMTP id o4mr90312298wjo.40.1367242945010;
	Mon, 29 Apr 2013 06:42:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a9sm20852952wiv.0.2013.04.29.06.42.23 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 06:42:24 -0700 (PDT)
Date: Mon, 29 Apr 2013 15:42:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130429134247.GJ3199@jama>
References: <1367236635-27036-1-git-send-email-ross.burton@intel.com>
	<1367236635-27036-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1367236635-27036-2-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] neard: add systemd unit file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2013 14:00:32 -0000
X-Groupsio-MsgNum: 38520
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/qIPZgKzMPM+y5U5"
Content-Disposition: inline

--/qIPZgKzMPM+y5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2013 at 12:57:15PM +0100, Ross Burton wrote:
> Add a systemd unit file, and respect the sysvinit feature when installing=
 the
> init script.
>=20
> (thanks to Jukka Rissanen for the unit file)
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../neard/neard/neard.service.in                   |   13 +++++++++
>  meta/recipes-connectivity/neard/neard_0.9.bb       |   28 +++++++++++++-=
------
>  2 files changed, 31 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-connectivity/neard/neard/neard.service.in
>=20
> diff --git a/meta/recipes-connectivity/neard/neard/neard.service.in b/met=
a/recipes-connectivity/neard/neard/neard.service.in
> new file mode 100644
> index 0000000..90e5302
> --- /dev/null
> +++ b/meta/recipes-connectivity/neard/neard/neard.service.in
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DNFC service
> +After=3Dsyslog.target
> +
> +[Service]
> +Type=3Ddbus
> +BusName=3Dorg.neard
> +Restart=3Don-failure
> +ExecStart=3D@installpath@/neard -n
> +StandardOutput=3Dnull
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-=
connectivity/neard/neard_0.9.bb
> index 2c4acb3..1442d00 100644
> --- a/meta/recipes-connectivity/neard/neard_0.9.bb
> +++ b/meta/recipes-connectivity/neard/neard_0.9.bb
> @@ -7,6 +7,7 @@ DEPENDS =3D "dbus glib-2.0 libnl"
> =20
>  SRC_URI =3D "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=
=3Dgit \
>             file://neard.in \
> +	file://neard.service.in \

Please use consistent indentation - no tabs in multiline variables.

>            "
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
> @@ -18,7 +19,7 @@ SRCREV =3D "eb486bf35e24d7d1db61350f5ab393a0c880523d"
>  PV =3D "0.10+git${SRCPV}"
>  PR =3D "r0"
> =20
> -inherit autotools pkgconfig update-rc.d
> +inherit autotools pkgconfig systemd update-rc.d
> =20
>  EXTRA_OECONF +=3D "--enable-tools"
> =20
> @@ -28,15 +29,20 @@ do_install() {
> =20
>  # This would copy neard start-stop shell and test scripts
>  do_install_append() {
> -	# start/stop
> -	install -d ${D}${sysconfdir}/init.d/
> -
> -	sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
> -		> ${D}${sysconfdir}/init.d/neard
> -
> -	chmod 0755 ${D}${sysconfdir}/init.d/neard
> -
> -	#test files
> +	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}=
; then
> +		install -d ${D}${sysconfdir}/init.d/
> +		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
> +		  > ${D}${sysconfdir}/init.d/neard
> +		chmod 0755 ${D}${sysconfdir}/init.d/neard
> +	fi
> +
> +	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)};=
 then
> +		install -d ${D}${systemd_unitdir}/system
> +		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.service.in \
> +		  > ${D}${systemd_unitdir}/system/neard.service
> +	fi
> +
> +	# Install the tests for neard-tests
>  	install -d ${D}${libdir}/neard
>  	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
>  	install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
> @@ -59,3 +65,5 @@ RDEPENDS_${PN}-tests =3D "python python-dbus python-pyg=
object"
> =20
>  INITSCRIPT_NAME =3D "neard"
>  INITSCRIPT_PARAMS =3D "defaults 64"
> +
> +SYSTEMD_SERVICE_${PN} =3D "neard.service"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/qIPZgKzMPM+y5U5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF+eNcACgkQN1Ujt2V2gBxgfgCcD5Dhlp9o3+YVC9Dk0Sd0otve
6u0AnRGBdMYC4zOmzt24cYxnNvXUG5O+
=deYA
-----END PGP SIGNATURE-----

--/qIPZgKzMPM+y5U5--
