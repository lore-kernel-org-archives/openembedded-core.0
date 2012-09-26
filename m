Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGqhs-0007nq-RP
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:27:12 +0200
Received: by wibhj13 with SMTP id hj13so1756298wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FPOeiJ1ehiKdS2OtGda1t74owXGj6718YJJpBWyU3nw=;
	b=EnoTxAGZmt5DhSkDT2rU8q+IVR9cwcczmgl1I37H/ydJa7ZWVhg0DGXaeFKTIvBfou
	HFU8495TT6NydruZaD1xzqyGly8s32BhXqvXpcdOVMCGTGCz2YK0SCZg6OSscWtC0thG
	ue8nk4CJL7lC8eSsYN6X9HtsUlflyP+oVxnOcCvA6EpRJWjqbzkQm1hdsEBU9JDbU9HY
	XpTHxy9+FB6PWE6ijKQ2TEuKZLQ9AHE0cBm4pWtXMS5r0TvGyoQscSuRpfTwiwyjQsnZ
	tuPMMxxNgntSeqP46LFkQLr96tXDVDud8JqCU3Fq6yBZ8EsWMOOdDoORLeT6rjh4LPO2
	VKPA==
Received: by 10.180.82.164 with SMTP id j4mr1008724wiy.18.1348661659505;
	Wed, 26 Sep 2012 05:14:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm6554769wid.1.2012.09.26.05.14.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 05:14:17 -0700 (PDT)
Date: Wed, 26 Sep 2012 14:14:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120926121425.GH3313@jama.jama.net>
References: <1348660947.31293.105.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348660947.31293.105.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass, module.bbclass: Make update-modules optional
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
X-List-Received-Date: Wed, 26 Sep 2012 12:27:13 -0000
X-Groupsio-MsgNum: 29907
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Content-Disposition: inline

--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 01:02:26PM +0100, Phil Blundell wrote:
> The update-modules mechanism is something of a historical relic and it is=
n't
> entirely clear that it has a great deal of value nowadays.  Also, it caus=
es a

What's replacement of this nowadays? IIRC without g_ether autoload I
don't get working usb networking on first boot, which sucks.

Cheers,

> problem when building a read-only rootfs since update-modules itself refu=
ses
> to configure offline.
>=20
> Allow DISTROs to circumvent this whole thing by declaring (via DISTRO_FEA=
TURES)
> that they don't wish to use update-modules.  This is backfilled for exist=
ing
> distributions and will have to be marked as CONSIDERED by those who actua=
lly
> don't want it.
>=20
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/classes/kernel.bbclass |   24 ++++++++++++++++--------
>  meta/classes/module.bbclass |    2 +-
>  meta/conf/bitbake.conf      |    2 +-
>  3 files changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index fdef1be..d3af67c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -398,10 +398,12 @@ python populate_packages_prepend () {
> =20
>          dvar =3D d.getVar('PKGD', True)
> =20
> +        use_update_modules =3D oe.utils.contains('DISTRO_FEATURES', 'upd=
ate-modules', True, False, d)
> +
>          # If autoloading is requested, output /etc/modules-load.d/<name>=
=2Econf and append
>          # appropriate modprobe commands to the postinst
>          autoload =3D d.getVar('module_autoload_%s' % basename, True)
> -        if autoload:
> +        if autoload and use_update_modules:
>              name =3D '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
>              f =3D open(name, 'w')
>              for m in autoload.split():
> @@ -415,15 +417,16 @@ python populate_packages_prepend () {
> =20
>          # Write out any modconf fragment
>          modconf =3D d.getVar('module_conf_%s' % basename, True)
> -        if modconf:
> +        if modconf and use_update_modules:
>              name =3D '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
>              f =3D open(name, 'w')
>              f.write("%s\n" % modconf)
>              f.close()
> =20
> -        files =3D d.getVar('FILES_%s' % pkg, True)
> -        files =3D "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.con=
f" % (files, basename, basename)
> -        d.setVar('FILES_%s' % pkg, files)
> +        if use_update_modules:
> +            files =3D d.getVar('FILES_%s' % pkg, True)
> +            files =3D "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s=
=2Econf" % (files, basename, basename)
> +            d.setVar('FILES_%s' % pkg, files)
> =20
>          if vals.has_key("description"):
>              old_desc =3D d.getVar('DESCRIPTION_' + pkg, True) or ""
> @@ -441,12 +444,17 @@ python populate_packages_prepend () {
>      module_regex =3D '^(.*)\.k?o$'
>      module_pattern =3D 'kernel-module-%s'
> =20
> -    postinst =3D d.getVar('pkg_postinst_modules', True)
> -    postrm =3D d.getVar('pkg_postrm_modules', True)
> +    use_update_modules =3D oe.utils.contains('DISTRO_FEATURES', 'update-=
modules', True, False, d)
> +    if use_update_modules:
> +        postinst =3D d.getVar('pkg_postinst_modules', True)
> +        postrm =3D d.getVar('pkg_postrm_modules', True)
> +    else:
> +        postinst =3D None
> +        postrm =3D None
>      do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.bi=
n$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s'=
, recursive=3DTrue, extra_depends=3D'')
>      do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.fw=
$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s',=
 recursive=3DTrue, extra_depends=3D'')
>      do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.ci=
s$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s'=
, recursive=3DTrue, extra_depends=3D'')
> -    do_split_packages(d, root=3D'/lib/modules', file_regex=3Dmodule_rege=
x, output_pattern=3Dmodule_pattern, description=3D'%s kernel module', posti=
nst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, ex=
tra_depends=3D'update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
> +    do_split_packages(d, root=3D'/lib/modules', file_regex=3Dmodule_rege=
x, output_pattern=3Dmodule_pattern, description=3D'%s kernel module', posti=
nst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, ex=
tra_depends=3D'%skernel-%s' % (['', 'update-modules '][use_update_modules],=
 d.getVar("KERNEL_VERSION", True)))
> =20
>      # If modules-load.d and modprobe.d are empty at this point, remove t=
hem to
>      # avoid warnings. removedirs only raises an OSError if an empty
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index c721202..e8d32eb 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -1,4 +1,4 @@
> -RDEPENDS +=3D "kernel-image update-modules"
> +RDEPENDS_${PN} +=3D "kernel-image ${@oe.utils.contains('DISTRO_FEATURES'=
, 'update-modules', 'update-modules', '', d)}"
>  DEPENDS +=3D "virtual/kernel"
> =20
>  inherit module-base
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3496d2b..5196018 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -724,7 +724,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?=3D ""
>  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?=3D ""
>  IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
> =20
> -DISTRO_FEATURES_BACKFILL =3D "pulseaudio"
> +DISTRO_FEATURES_BACKFILL =3D "pulseaudio update-modules"
>  DISTRO_FEATURES_append =3D "${@oe.utils.features_backfill("DISTRO_FEATUR=
ES",d)}"
> =20
>  MACHINE_FEATURES_BACKFILL =3D "rtc"
> --=20
> 1.7.10.4
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBi8aEACgkQN1Ujt2V2gBxoFACcCIfKA2dSimIRQxpqOQfkGRdB
JYcAn1U2EetrwI+7U/UoWHfzgjI3x6Fp
=vj2F
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--
