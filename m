Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzoVQ-0001jJ-I1
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 14:12:57 +0100
Received: by mail-wi0-f171.google.com with SMTP id hn14so1372700wib.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 04:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=I863IPrYWaOIFj/VHSbz9FB84HctgL4BDSJ5wh7mgVo=;
	b=UIKWb+Kpa7SvYuOZS+XcxryMto2tSMGsJ8IobOwO33Gqtj7/IWKhigruJpoRDRbjtb
	6EMjUYg2unEDrwRv90PtaIcewJ733eyeeo0Ny05A0xMB0EOhTVd4irXsGZFCbEIT1mDb
	vJiNwgkak6gOLAEEj7GeL3VXL28MurFRdbJS4JKj766Cg+u8fSFUoWb67v7A7333Vqcp
	0qmq1HcRQQvtab68EkE2lkR8gtRWvm+78nOVQ/JVeXeiywHzNiP569rnOIrfa3KTwhDq
	+hFLEqh44RjJ/VjXtCw0Sau/ymGVZRLV9jb0ubN3nS+zCIRoIB9KpKDCoPN/Skhd0OIn
	K5ow==
X-Received: by 10.180.87.228 with SMTP id bb4mr9511718wib.31.1359377794293;
	Mon, 28 Jan 2013 04:56:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bz12sm13304598wib.5.2013.01.28.04.56.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 04:56:33 -0800 (PST)
Date: Mon, 28 Jan 2013 13:56:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130128125637.GY16904@jama.palm1.palmone.com>
References: <1359363680-4588-1-git-send-email-constantinx.musca@intel.com>
MIME-Version: 1.0
In-Reply-To: <1359363680-4588-1-git-send-email-constantinx.musca@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] migrate_localcount.bbclass: use PRAUTOINX instead of PN & PV
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
X-List-Received-Date: Mon, 28 Jan 2013 13:13:01 -0000
X-Groupsio-MsgNum: 34554
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sKosZo66cxuwvnFI"
Content-Disposition: inline

--sKosZo66cxuwvnFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 11:01:20AM +0200, Constantin Musca wrote:
> - we need to use PRAUTOINX (it covers all cases)
> - it addresses bumped PE issues

Build is still runing, but entries in prserv db look correct now,
thanks!

Cheers,

>=20
> [YOCTO #3071]
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/classes/migrate_localcount.bbclass | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migra=
te_localcount.bbclass
> index 59f14e8..3916ad4 100644
> --- a/meta/classes/migrate_localcount.bbclass
> +++ b/meta/classes/migrate_localcount.bbclass
> @@ -18,14 +18,13 @@ python migrate_localcount_handler () {
>          if not revs or not counts:
>              return
> =20
> -        srcrev =3D bb.fetch2.get_srcrev(e.data)
> -        bpv =3D pv[:pv.find(srcrev)]
> -
>          if len(revs) !=3D len(counts):
>              bb.warn("The number of revs and localcounts don't match in %=
s" % pn)
>              return
> =20
> -        version =3D 'AUTOINC-%s-%s' % (pn, bpv)
> +        version =3D e.data.getVar('PRAUTOINX', True)
> +        srcrev =3D bb.fetch2.get_srcrev(e.data)
> +        base_ver =3D 'AUTOINC-%s' % version[:version.find(srcrev)]
>          pkgarch =3D e.data.getVar('PACKAGE_ARCH', True)
>          value =3D max(int(count) for count in counts)
> =20
> @@ -40,7 +39,7 @@ python migrate_localcount_handler () {
>          flock =3D bb.utils.lockfile("%s.lock" % df)
>          with open(df, 'a') as fd:
>              fd.write('PRAUTO$%s$%s$%s =3D "%s"\n' %
> -                    (version, pkgarch, srcrev, str(value)))
> +                    (base_ver, pkgarch, srcrev, str(value)))
>          bb.utils.unlockfile(flock)
>  }
> =20
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sKosZo66cxuwvnFI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGdYUACgkQN1Ujt2V2gByGOgCfQbnQvT9rH0PAbGx2eMlpNYjQ
zFQAoLY/c5mS2r3MNBNAEqpV+OIu+txg
=s/gR
-----END PGP SIGNATURE-----

--sKosZo66cxuwvnFI--
