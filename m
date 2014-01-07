Return-Path: <darren.hart@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 684BF6C6D6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 18:11:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 07 Jan 2014 10:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,620,1384329600"; 
	d="asc'?scan'208";a="454978860"
Received: from fmsmsx105.amr.corp.intel.com ([10.19.9.36])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2014 10:11:16 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
	FMSMSX105.amr.corp.intel.com (10.19.9.36) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 7 Jan 2014 10:11:16 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.40]) by
	FMSMSX112.amr.corp.intel.com ([169.254.3.89]) with mapi id
	14.03.0123.003; Tue, 7 Jan 2014 10:11:15 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH] kernel: use oldnoconfig instead of yes '' |
	make oldconfig
Thread-Index: AQHPC7N+ail4eH7Ys0GRGJPgvwBzhpp52kQAgAAMeYCAAAl6AIAAJhmA
Date: Tue, 7 Jan 2014 18:11:15 +0000
Message-ID: <1389118253.5785.25.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20140107143558.GQ3709@jama> <52CC1B45.9010808@free-electrons.com>
	<20140107155432.GS3709@jama>
In-Reply-To: <20140107155432.GS3709@jama>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.196.146]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 18:11:18 -0000
X-Groupsio-MsgNum: 48662
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-nPuO09t8Y5VVcrD23Hrs"

--=-nPuO09t8Y5VVcrD23Hrs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-01-07 at 16:54 +0100, Martin Jansa wrote:
> On Tue, Jan 07, 2014 at 04:20:37PM +0100, Alexandre Belloni wrote:
> > On 07/01/2014 15:35, Martin Jansa wrote:
> > > On Tue, Jan 07, 2014 at 03:18:37PM +0100, Alexandre Belloni wrote:
> > >> When using a defconfig, using yes '' | make oldconfig may not result=
 in
> > >> the correct configuration being set. For example:
> > >=20
> > >>  $ grep USB_ETH .config
> > >>  CONFIG_USB_ETH=3Dy
> > >>  CONFIG_USB_ETH_RNDIS=3Dy
> > >>  CONFIG_USB_ETH_EEM=3Dy
> > >>  $ make savedefconfig
> > >>  scripts/kconfig/conf --savedefconfig=3Ddefconfig Kconfig
> > >>  $ cp defconfig .config
> > >>  =E2=80=98defconfig=E2=80=99 -> =E2=80=98.config=E2=80=99
> > >>  $ yes '' | make oldconfig
> > >>  [...]
> > >>  #
> > >>  # configuration written to .config
> > >>  #
> > >>  $ grep USB_ETH .config
> > >>  CONFIG_USB_ETH=3Dm
> > >>  CONFIG_USB_ETH_RNDIS=3Dy
> > >>  CONFIG_USB_ETH_EEM=3Dy
> > >>
> > >> Using make olddefconfig solves that but we'll use oldnoconfig for
> > >> backward compatibility with older kernels.
> > >=20
> > > Looks good, I have few kernel recipes where I had to fixup resulting
> > > .config after "make savedefconfig", "yes '' | make oldconfig" combo
> > > exactly because of some =3Dy changing to -m.
> > >=20
> > > 1) Do you know since when oldnoconfig is supported?
> > >=20
> > > IIRC oldest kernel I've in BSPs is 2.6.24.=20
> >=20
> > oldnoconfig seems to be present since 2.6.36. olddefconfig is an alias
> > that appeared with fb16d8912db5268f29706010ecafff74b971c58d which is
> > present since v3.7.
> >=20
> > Then hat about using:
> >=20
> > oe_runmake oldnoconfig || yes '' | oe_runmake oldconfig
>=20
> Looks safer (assuming that oldnoconfig will return error only in cases
> where oldnoconfig target doesn't exist in Makefile, otherwise fall-back
> to yes '' could be a bit confusing).
>=20
> In worst case you can add KERNEL_VERSION check or show bb.warn when
> oldnoconfig isn't supported.

Please check for the functionality, not KERNEL_VERSION. The
KERNEL_VERSION doesn't allow for backports and such which might add this
ability. Grep the Makefile for the target, for example, if the above OR
statement isn't adequate.

As Bruce stated, it seems that the fix would be to use the updated
Kconfig, not default to setting things to NO. The problem with that
approach is it doesn't accept defaults for non-specified options (which
when updating kernel versions, is often the preferred approach).


--=20
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


--=-nPuO09t8Y5VVcrD23Hrs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAABAgAGBQJSzEMtAAoJEKbMaAwKp364HygIAIpUIdipKJAR9pLlQ1+pPGR7
rVEqTKZR+QUX7UQlNTsZLxLozm/3E6GZbLz+3Zvv7Y4DmSH3TlAqOxRUFVaeHjt1
s6FYASgMP+ZKmu4gKsJEcgTi0HKFBJBlt852XicqmC+uj96Cgn6dpwzAVCjwPKWT
7VN4vwR0NTtM21k9ZVldUItiPO8RY+x0LwUoOmKcFzDuskDA/jvA5j5bq/guTvZr
+n2g5g9XPiYzfZ4IaNkifPZh+Ufhvf4XPJKVfF037t5pfSTU/CoK4IIFPSASDUa4
vxcRVN6DjuL4jVSDlZVCA2iert7fjC271P+XjLKxWdl6+h5rcJIRqWHNlUWEbLY=
=VT+v
-----END PGP SIGNATURE-----

--=-nPuO09t8Y5VVcrD23Hrs--
