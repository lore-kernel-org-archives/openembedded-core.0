Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF39165D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 18:58:50 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so142901071wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 10:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cZ5ZVpY9bgP5tbOb3DG9DC77RMP37iz0YQ20leviuzM=;
	b=0bj8mbmAR3xd0uId5eRFfF5WC5bIuxgRWON7Pgi2FpoLDvwFnqmK5mvL61fb52T2dj
	gTe7RioUEvM7mu2WiMR8QR18SBJg+VZplxdfQSpDf4jqREL7GHuOyPYjobS2/W5iaINK
	O84EoSZ30b3GCNluaUt0a04AVrMHA2HczWGXCxhVRcyws7fE5g0SX22IcPxd0DRJ+1W6
	62DBEGzeFAzCyIqL3o8c8euBcTuB9JlPfejjqM0FP4dMkgKA9v2XTtKUAmHSE+ANdadT
	P62Ug2pEgnB6Aq5FFvnrzP6We0w3XbI2SWpUHt3+FmtpszwkHzHdySKNgbfbfXH4VnZP
	FM3Q==
X-Received: by 10.28.3.133 with SMTP id 127mr31474124wmd.101.1448909930932;
	Mon, 30 Nov 2015 10:58:50 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh6sm37000662wjb.0.2015.11.30.10.58.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Nov 2015 10:58:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Nov 2015 19:59:42 +0100
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20151130185942.GC2250@jama>
References: <1448905304-21681-1-git-send-email-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1448905304-21681-1-git-send-email-alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] weston-init: add a native systemd unit file
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
X-List-Received-Date: Mon, 30 Nov 2015 18:58:51 -0000
X-Groupsio-MsgNum: 74148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline

--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2015 at 07:41:44PM +0200, Alexander Kanavin wrote:
> Previously weston was started by systemd via a classic init script
>=20
> [YOCTO #5582]
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb             | 13 ++++++++++=
---
>  meta/recipes-graphics/wayland/weston-init/weston.service | 15 ++++++++++=
+++++
>  2 files changed, 25 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.serv=
ice
>=20
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-=
graphics/wayland/weston-init.bb
> index fc2e4f8..35fd055 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -1,17 +1,22 @@
> -SUMMARY =3D "Startup script for the Weston Wayland compositor"
> +SUMMARY =3D "Startup script and systemd unit file for the Weston Wayland=
 compositor"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937=
c2bc47fbc49d690"
> =20
> -SRC_URI =3D "file://init"
> +SRC_URI =3D "file://init \
> +           file://weston.service"
> =20
>  S =3D "${WORKDIR}"
> =20
>  do_install() {
>  	install -d ${D}/${sysconfdir}/init.d
>  	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
> +
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m0644 ${WORKDIR}/weston.service ${D}${systemd_unitdir}/=
system

Don't mix tabs and spaces for indentation.

>  }
> =20
> -inherit allarch update-rc.d distro_features_check
> +inherit allarch update-rc.d distro_features_check systemd
> +
>  # rdepends on weston which depends on virtual/egl
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
> =20
> @@ -19,3 +24,5 @@ RDEPENDS_${PN} =3D "weston kbd"
> =20
>  INITSCRIPT_NAME =3D "weston"
>  INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
> +
> +SYSTEMD_SERVICE_${PN} =3D "weston.service"
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/m=
eta/recipes-graphics/wayland/weston-init/weston.service
> new file mode 100644
> index 0000000..4f1f7ff
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston-init/weston.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=3DWeston Wayland compositor startup
> +RequiresMountsFor=3D/run
> +
> +[Service]
> +User=3Droot
> +EnvironmentFile=3D-/etc/default/weston
> +Environment=3D"XDG_RUNTIME_DIR=3D/run/user/root"
> +ExecStartPre=3D/bin/mkdir -p /run/user/root
> +ExecStartPre=3D/bin/chmod 0700 /run/user/root
> +ExecStart=3D/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> +
> --=20
> 2.6.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZcnJ0ACgkQN1Ujt2V2gBzwnQCfRSGd3wjwhFcq+QEwW9fTJmLC
avUAniDZbbiAndseOL4Hxj4HvniR/6qi
=0Y0x
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
