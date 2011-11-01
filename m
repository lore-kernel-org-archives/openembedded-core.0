Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLM1D-0002Bm-PZ
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 22:37:15 +0100
Received: by faas16 with SMTP id s16so7735166faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 14:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zA/NEiBzTZjrB8DD0VGRr43O9s2Y+n4K8AZh3PfJFSE=;
	b=pDO29nnVg5u2QRmlogIEfVTLF09KHDBtfPSpZM1nEuuK3zXQzOXd6pc2ezl5iP9I6W
	2UNL/WblaF+ZoqA/xsRcw0eUE/p3sBiQvuuI7GmxJcXGm9uKFZ4zCQwS49CdI9dT51zf
	CjLvtYHSufIoCh4VqHikfpsi+Bfb+bq+bxcqk=
Received: by 10.223.16.82 with SMTP id n18mr3385286faa.2.1320183066602;
	Tue, 01 Nov 2011 14:31:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a26sm1150181fac.2.2011.11.01.14.31.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 14:31:05 -0700 (PDT)
Date: Tue, 1 Nov 2011 22:30:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111101213059.GB9949@jama.jama.net>
References: <cover.1320182590.git.sgw@linux.intel.com>
	<43df49f1967ebd4e5a956c601c9865f67598d52f.1320182590.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <43df49f1967ebd4e5a956c601c9865f67598d52f.1320182590.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/4] xserver-nodm-init: Add xuser (hardcoded)
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
X-List-Received-Date: Tue, 01 Nov 2011 21:37:16 -0000
X-Groupsio-MsgNum: 11767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline

--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2011 at 02:27:17PM -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../x11-common/xserver-nodm-init.bb                |   30 +++++++-------=
-----
>  1 files changed, 11 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta=
/recipes-graphics/x11-common/xserver-nodm-init.bb
> index ea4222d..1183f0e 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Simple Xserver Init Script (no dm)"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>  SECTION =3D "x11"
> -PR =3D "r26"
> +PR =3D "r28"
>  RDEPENDS_${PN} =3D "sudo"
> =20
>  SRC_URI =3D "file://xserver-nodm \
> @@ -19,27 +19,19 @@ do_install() {
>      install xserver-nodm ${D}/etc/init.d
>      if [ "${ROOTLESS_X}" =3D "1" ] ; then
>          install -d ${D}/etc/X11
> -        install Xusername ${D}/etc/X11
> +	install Xusername ${D}/etc/X11
>      fi
>  }
> =20
> -pkg_postinst_${PN} () {
> -    if [ "x$D" !=3D "x" ] ; then
> -        exit 1
> -    fi
> -
> -    if [ -f /etc/X11/Xusername ]; then
> -        # create the rootless X user, and add user to group tty, video, =
audio
> -        username=3D`cat /etc/X11/Xusername`
> -        adduser --disabled-password $username
> -        # FIXME: use addgroup if busybox addgroup is ready
> -        sed -i -e "s/^video:.*/&${username}/g" /etc/group
> -        sed -i -e "s/^tty:.*/&${username}/g" /etc/group
> -        sed -i -e "s/^audio:.*/&${username}/g" /etc/group
> -    fi
> -}
> -
> -inherit update-rc.d
> +inherit update-rc.d useradd
> =20
>  INITSCRIPT_NAME =3D "xserver-nodm"
>  INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
> +
> +# Use fixed Xusername of xuser for now, this will need to be
> +# fixed if the Xusername changes from xuser
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D "--system --no-create-home \
> +                       --shell /bin/false --groups video,tty,audioi \

audioi?

I guess you're also using vim :)

Cheers,

> +                       --user-group xuser"
> +
> --=20
> 1.7.6.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6wZRMACgkQN1Ujt2V2gBy8EgCbBLK/1ev6JXRV1DS85ZHI2oYR
upIAn22P2Y3K+uNEglPrfuJw//nP6lv7
=Aast
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
