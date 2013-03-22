Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UJ7Wu-0005SQ-7j; Fri, 22 Mar 2013 20:21:33 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so3310483pbc.16
	for <multiple recipients>; Fri, 22 Mar 2013 12:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=TsFYrcBmNVnZMegir2fiiUZbHLYLhWRM4TccWv05TQA=;
	b=VWdu6r2N3+R24aEXThIT0AiZXH40hjG0ZMbdnWRzSs0CBS5xrTKA8nVNH419TFb4Kw
	TOz+LR5IhXxjnX81jPipJ9Kg+Ho0hkYCaGqm/62KUxrjJgDSlWSziJ9LVEXfstLUZDU5
	lad9j2P52GEGJuM/PBPNbhUE7KaAiQ8a6gmifrNRNmgTeR+g+e5JlIExn4C3p9twP+Jb
	RyQmrXB7ZefDOHBf9koYgV5IcVJ0v7vPBavszNGw6t7P3MwGYLbnjx3J7E1v1zq8249w
	4ffLo7iXgXLmEsmmQCweh4zXLpUOF9kBX+USBMIDKvmuH4yOF5/v3wE1f8ptuKh9oPb5
	wyXw==
X-Received: by 10.68.242.65 with SMTP id wo1mr4394215pbc.62.1363979077276;
	Fri, 22 Mar 2013 12:04:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y13sm3347066pbv.0.2013.03.22.12.04.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 12:04:36 -0700 (PDT)
Date: Fri, 22 Mar 2013 20:04:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130322190434.GV3219@jama>
References: <cover.1363973088.git.ross.burton@intel.com>
	<876b70b30d4ed72bed465147dc6ecf28f331e2f7.1363973088.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <876b70b30d4ed72bed465147dc6ecf28f331e2f7.1363973088.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/22] update-rcd.bbclass: handle both sysvinit and systemd features being present
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
X-List-Received-Date: Fri, 22 Mar 2013 19:21:35 -0000
X-Groupsio-MsgNum: 36936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ByM1h5nouWwd3kz8"
Content-Disposition: inline

--ByM1h5nouWwd3kz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2013 at 05:38:29PM +0000, Ross Burton wrote:
> Run the helper if the sysvinit feature is present, or if the systemd feat=
ure is
> present but the systemd class hasn't been inherited.  We want to run in t=
he
> latter case as systemd has sysvinit compatibility, but we don't want to a=
lways
> run so that pure systemd images don't have redundant sysvinit files.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/update-rc.d.bbclass                          |    9 ++++++-=
--
>  meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    4 ++--
>  2 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.=
bbclass
> index 65bf022..06b91c1 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -75,9 +75,12 @@ python populate_packages_updatercd () {
>          postrm +=3D d.getVar('updatercd_postrm', True)
>          d.setVar('pkg_postrm_%s' % pkg, postrm)
> =20
> -    # If the systemd class has also been inherited, then don't do anythi=
ng as
> -    # the systemd units will override anything created by update-rc.d.
> -    if not d.getVar("SYSTEMD_BBCLASS_ENABLED", True):
> +    # Run if the sysvinit feature is present, or if the systemd feature =
is present
> +    # but the systemd class hasn't been inherited.  We want to run in th=
e latter case
> +    # as systemd has sysvinit compatibility, but we don't want to always=
 so that
> +    # pure systemd images don't have redundent sysvinit files.
> +    if "sysvinit" in d.getVar("DISTRO_FEATURES").split() or \
> +       ("systemd" in d.getVar("DISTRO_FEATURES").split() and not d.getVa=
r("SYSTEMD_BBCLASS_ENABLED", True)):
>          pkgs =3D d.getVar('INITSCRIPT_PACKAGES', True)
>          if pkgs =3D=3D None:
>              pkgs =3D d.getVar('UPDATERCPN', True)
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/=
meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index b9183a8..e73b46e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -27,7 +27,7 @@ RCONFLICTS_${PN} =3D "task-core-boot"
>  VIRTUAL-RUNTIME_dev_manager ?=3D "udev"
>  VIRTUAL-RUNTIME_login_manager ?=3D "tinylogin"
>  VIRTUAL-RUNTIME_init_manager ?=3D "${DISTRO_FEATURES_INITMAN}"
> -VIRTUAL-RUNTIME_initscripts ?=3D "${@base_contains('DISTRO_FEATURES', 's=
ysvinit', 'initscripts', '',d)}"
> +VIRTUAL-RUNTIME_initscripts ?=3D "${@base_contains('DISTRO_FEATURES_INIT=
MAN', 'sysvinit', 'initscripts', '',d)}"
>  VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> =20
>  RDEPENDS_${PN} =3D "\
> @@ -42,7 +42,7 @@ RDEPENDS_${PN} =3D "\
>      ${VIRTUAL-RUNTIME_login_manager} \
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ${VIRTUAL-RUNTIME_initscripts} \
> -    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-compat-units=
', '',d)} \
> +    ${@base_contains('DISTRO_FEATURES_INITMAN', 'systemd', 'systemd-comp=
at-units', '',d)} \
>      ${VIRTUAL-RUNTIME_dev_manager} \
>      ${VIRTUAL-RUNTIME_update-alternatives} \
>      ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

Isn't DISTRO_FEATURES_INITMAN removed later in this series?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ByM1h5nouWwd3kz8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMq0IACgkQN1Ujt2V2gBxLgQCfVMojrQa9B3g15LPXNsE4fS6h
pocAn1xVmKvOLLYuAwRrFj0mVgQ/MXmT
=iN5M
-----END PGP SIGNATURE-----

--ByM1h5nouWwd3kz8--
