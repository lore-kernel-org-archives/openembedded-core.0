Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4ik-0003TJ-0B
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:39:58 +0100
Received: by wibhm17 with SMTP id hm17so1708176wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=54IrJYjgFb3YmlgBT0zs2CY/ku1QlMitjFbVGS+XCDs=;
	b=cnmso8xpyQ8zUE7u0Wl1zRcNdL8qnmI3GgMkZO3H8QujCb07vR2U7rebc+6BFliaTa
	RT7iUNvgNLN5QyOlLttLSbe557b5a4Vhs3evA2MzIwZroDsMJMaxRDVS/k9efFcYE1Zi
	dgg5O1x3SKgCgkbdyxMG/TEa90Yht/PUY6JWmLqbm+6f/J2/Koyqc1rxBfLd7tGJFrJz
	10y0hWITvapUXT4Y0oM6QFWTXJNcYiW63/5eih26E4oMk8sPMtlMGkVUIKA759fX2+vT
	+QP2tp3+JXeyKb1b4Tp+VBRCxZjeCErR7Ail37sJ7f5PzOy6P0MM6x2XvcVgL+zqcvYz
	hZ3Q==
Received: by 10.180.89.130 with SMTP id bo2mr6625744wib.17.1332509461849;
	Fri, 23 Mar 2012 06:31:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm13879607wib.5.2012.03.23.06.31.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 06:31:01 -0700 (PDT)
Date: Fri, 23 Mar 2012 14:31:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120323133102.GG3879@jama.jama.net>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<0f5173c469e4ae3e5155d5d3f0643d3a63e25b91.1332507302.git.Martin.Jansa@gmail.com>
	<4F6C79A8.30403@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4F6C79A8.30403@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] kernel.bbclass: fix extra + in kernelrelease
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
X-List-Received-Date: Fri, 23 Mar 2012 13:39:58 -0000
X-Groupsio-MsgNum: 19548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bFsKbPszpzYNtEU6"
Content-Disposition: inline

--bFsKbPszpzYNtEU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 09:24:56AM -0400, Bruce Ashfield wrote:
> On 12-03-23 08:56 AM, Martin Jansa wrote:
> > * see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-Decem=
ber/014308.html
>=20
> I was just looking at this in the past day or so and was
> wondering where it had gone. Saved me the effort!
>=20

Please bump PR in kernel recipes you care about (I did for mine.. )

> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>=20
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   meta/classes/kernel.bbclass |    6 ++++++
> >   1 files changed, 6 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 5e4cdd4..736768e 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -204,6 +204,12 @@ sysroot_stage_all_append() {
> >   }
> >
> >   kernel_do_configure() {
> > +	# fixes extra + in /lib/modules/2.6.37+
> > +	# $ scripts/setlocalversion . =3D>  +
> > +	# $ make kernelversion =3D>  2.6.37
> > +	# $ make kernelrelease =3D>  2.6.37+
> > +	touch ${B}/.scmversion
> > +
> >   	# Copy defconfig to .config if .config does not exist. This allows
> >   	# recipes to manage the .config themselves in do_configure_prepend().
> >   	if [ -f "${WORKDIR}/defconfig" ]&&  [ ! -f "${B}/.config" ]; then
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bFsKbPszpzYNtEU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sexYACgkQN1Ujt2V2gBwz2QCgqNAcvE2ZnABCwi8cgESLKGue
noUAn3juWza9qLuZLCT5TZJZotclwMbp
=QEzf
-----END PGP SIGNATURE-----

--bFsKbPszpzYNtEU6--
