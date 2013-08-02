Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8836066A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 06:52:48 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so121483eei.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 23:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3dNN2H5jmox/CmZxk2bUWrH9DkIgiX6U4qTbG+RPizg=;
	b=f4fUJQ26o6aGkNIu4zLcMOo4wFWhhemLRGZAqT5M0lv2y0ZithSHGgqm+yyBjOdlyp
	zsgMG5qxGvl6+JMCWhDP1PC1H6Fk8TTLOMkh0ga08KBONaYC4QflcafNhulKPse4JsO9
	7AegyJErUiSNgBwwU8Ky1IWLFfyCJBrBCx0WUvTJiUiG7fuNnVWr1nhKPU6GfxWqUD+/
	DuHEUHvl+s6lgSXLAnae12+bNAxZS3MzewXmxfQsV9pmTuUPCPl3/Q9tU2veRNF3ZhbF
	GsaYUzl7nfNMWEEkh70MsywfiepXUtRjv9bUf2q0a2BdpwpGB/SUYWGLuK1jnP5zx0wf
	2OKQ==
X-Received: by 10.15.91.69 with SMTP id r45mr4496291eez.79.1375426368650;
	Thu, 01 Aug 2013 23:52:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	v41sm9659587eep.10.2013.08.01.23.52.46 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 23:52:48 -0700 (PDT)
Date: Fri, 2 Aug 2013 08:53:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130802065323.GT3280@jama>
References: <1375418740-14692-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1375418740-14692-1-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-core-boot: correct runtime dependencies for non-sysvinit system
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
X-List-Received-Date: Fri, 02 Aug 2013 06:52:49 -0000
X-Groupsio-MsgNum: 42862
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bGopQmzlzQgFk3Fg"
Content-Disposition: inline

--bGopQmzlzQgFk3Fg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2013 at 09:45:40PM -0700, Saul Wold wrote:
> [YOCTO #4969]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> core
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

^^^ Something is missing and something is redundant :).

> ---
>  meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/=
meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index d69c41d..486385a 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -30,15 +30,18 @@ VIRTUAL-RUNTIME_init_manager ?=3D "sysvinit"
>  VIRTUAL-RUNTIME_initscripts ?=3D "initscripts"
>  VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> =20
> +SYSVINIT_SCRIPTS =3D "${@base_contains('MACHINE_FEATURES', 'rtc', 'busyb=
ox-hwclock', '', d)} \
> +                    modutils-initscripts \
> +                    init-ifupdown \
> +                   "
> +
>  RDEPENDS_${PN} =3D "\
>      base-files \
>      base-passwd \
>      busybox \
> -    ${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "", d=
)} \
> +    ${@base_contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}=
", "", d)} \
>      ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_=
keymaps}", "", d)} \
> -    modutils-initscripts \
>      netbase \
> -    init-ifupdown \
>      ${VIRTUAL-RUNTIME_login_manager} \
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ${VIRTUAL-RUNTIME_initscripts} \
> --=20
> 1.8.1.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bGopQmzlzQgFk3Fg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH7V2MACgkQN1Ujt2V2gBxqagCgj7yzjJrTEeeTwGoePaZqc0CM
R40AnAnPWSfD/Njh6NN4fF1pWQ+WLLA2
=JoPP
-----END PGP SIGNATURE-----

--bGopQmzlzQgFk3Fg--
