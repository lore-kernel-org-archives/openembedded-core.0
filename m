Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SoAMb-0004S2-Tj
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 11:34:41 +0200
Received: by wibhq4 with SMTP id hq4so2406248wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tDx+JGr4rD1SyrstzBodvyR+bZr93ZUMUjaTRWi942w=;
	b=BsfOz2dTnDSi+D8WaonMYBgSpeOYEzslnQZiPuxiRO5Jz9uszMGXhSnrH52QuNg+H8
	Di0OgxZvhlUENVWAzLfn+2Tu5vGCyQNz4Xr3mwskGlYvfjx5sw3/n+/I4t2wpa1tDSNV
	hXW8HvgWMEMUY5DxkZstvAnZnG3+pVcDN9kw855LGnCWyaH+3DMdJSbpnb+X61qrn4lR
	ngeexKeFGca4G3L5vc028aEdnHXhfuMGoJWqB37enBwhO2pJqJtOL0427nOh55J54TMC
	OJ4//VduAKmK+hrKX9HiIOs5GlbG+vr3v/HF2PfcDklk3FDdOEUAXo8Lp7KIHvjQ0L8L
	Yqjg==
Received: by 10.180.105.135 with SMTP id gm7mr27906402wib.10.1341825812818;
	Mon, 09 Jul 2012 02:23:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm33538087wid.1.2012.07.09.02.23.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jul 2012 02:23:30 -0700 (PDT)
Date: Mon, 9 Jul 2012 11:23:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120709092332.GA6308@jama.jama.net>
References: <alpine.DEB.2.02.1207081227430.27741@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1207081227430.27741@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: more pedantry -- looking to clarify layers definition, BBPATH, BBFILES, etc.
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
X-List-Received-Date: Mon, 09 Jul 2012 09:34:42 -0000
X-Groupsio-MsgNum: 24872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 08, 2012 at 01:59:48PM -0400, Robert P. J. Day wrote:
>=20
>   (most of this is sort of self-evident but it's not documented as
> well as it could be so i just want to make sure i have it exactly
> right.)
>=20
>   snippets of some layer.conf files:
>=20
> oe-core:
>=20
> BBPATH .=3D ":${LAYERDIR}"
> BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb"
>=20
> meta-hob:
>=20
> BBPATH :=3D "${BBPATH}:${LAYERDIR}"
> BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
>=20
> meta-yocto:
>=20
> BBPATH :=3D "${LAYERDIR}:${BBPATH}"
> BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
>             ${LAYERDIR}/recipes-*/*/*.bbappend"
>=20
>   note how meta-hob *appends* itself to BBPATH, while meta-yocto
> *prepends* itself.  is there no possibility that this will cause some
> confusion based on how BBPATH is used to resolve the location of class
> or conf files?  i realize you should try to avoid that sort of
> conflict but it still seems possible that someone might choose the
> names of some files badly and the unpredictable ordering in BBPATH
> will cause grief, no?

Yes, order is important and prepending makes it harder for person
writting bblayers.conf to influence it:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/024914.html

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/018115=
=2Ehtml:
BBFILE_PRIORITY controls recipe priority. BBLAYERS order controls
BBPATH order which in turn controls bbclass/config priority, as things
stand today.

See also this thread for more details:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032387.html

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/6oxQACgkQN1Ujt2V2gBzFuwCbB6cWYTj2dYv/pEJjt56FXBCI
7ZoAn3pHCNV+f7Ecy6gyh2DVSUUyOVoE
=BGzB
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
