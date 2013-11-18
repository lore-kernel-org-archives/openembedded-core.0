Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 194FA6D12D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 16:03:59 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id e53so762671eek.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 08:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=itlrvFKqc1l3nuDXR5Djfqhi0pxMUKMtmiUeR6D6Z4w=;
	b=atUZ2MxiZmnazB6XiI+LAJX4S5tTbJw9IbiwCZ5YYR4OTvlmwNJ6/vupAghXhGdtq9
	RsEoO4tDtGMgFG0P00X9KnJkRGOs9y5yo//Pee4OuJlCekBFA+3l6+z1RP/YAwGqwmGu
	/J6cG00F79TM7OlO+B3n9cS0VUpbn8HF+ejccZSbn3gXhyi1P8x0brtLKKhl476W6qoS
	afLCQwvVzH0vWBzXzB3/sRLOueT8Abo0VKus7tm3nb4s2yQu+c7HNZSBZ8lsQlov1p+D
	EVQMwm3lZYFaonR4GBdGLX/T8I2dVABBVHopq73it2VtdE265zzVShL7SpM3T47uujac
	/x8g==
X-Received: by 10.14.38.194 with SMTP id a42mr13850154eeb.12.1384790640990;
	Mon, 18 Nov 2013 08:04:00 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm39183429eem.15.2013.11.18.08.03.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 08:04:00 -0800 (PST)
Date: Mon, 18 Nov 2013 17:04:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131118160400.GG3727@jama>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com> <20131118114000.GB3727@jama>
	<1384775852.6460.214.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1384775852.6460.214.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Mon, 18 Nov 2013 16:04:01 -0000
X-Groupsio-MsgNum: 47232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Content-Disposition: inline

--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 11:57:32AM +0000, Richard Purdie wrote:
> On Mon, 2013-11-18 at 12:40 +0100, Martin Jansa wrote:
> > On Mon, Nov 18, 2013 at 10:54:47AM +0800, ChenQi wrote:
> > > On 11/18/2013 02:57 AM, Paul Barker wrote:
> > > > Hi all,
> > > >
> > > > I've been trying to add PACKAGECONFIG options to opkg and have ran
> > > > into a dependency loop whilst building with certain options. Enabli=
ng
> > > > curl support within opkg requires a dependency on curl. curl in turn
> > > > depends on ncurses (via a few intermediate dependencies) and ncurses
> > > > uses update-alternatives causing a dependency on
> > > > virtual/update-alternatives.
> > > > PREFERRED_PROVIDER_virtual/update-alternatives is set to "opkg" in
> > > > meta/conf/distro/include/default-providers.inc and so we have a
> > > > dependency loop if curl is enabled via the new PACKAGECONFIG options
> > > > for opkg.
> > > >
> > > > I can cause the same dependency loop by setting
> > > > PREFERRED_PROVIDER_virtual/update-alternatives to "dpkg" as dpkg
> > > > directly depends on ncurses (which uses update-alternatives). So if
> > > > someone wanted to use the more powerful update-alternatives from dp=
kg
> > > > on a target system it doesn't look like that is currently possible.
> > > >
> > > > This places quite a constraint on whichever recipe PROVIDES
> > > > update-alternatives. Going forward I'm hoping to use libarchive wit=
hin
> > > > opkg and libarchive depends on bzip2 by default which uses
> > > > update-alternatives, which would cause the same problem.
> > > >
> > > > Does anyone have any clever solutions to this? Perhaps we could spl=
it
> > > > update-alternatives off into its own recipe which should be depende=
nt
> > > > on very little, allowing opkg a little more freedom in its
> > > > dependencies.
> > > >
> > > > Thanks,
> > > >
> > >=20
> > > I opened a bug some time ago for this update-alternative problem.
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4836
> > >=20
> > > It would be really helpful if you could add some input in the comment=
s=20
> > > of that bug.
> >=20
> > FWIW: current u-a implementation provided by opkg is in OE-classic and
> > was in older poky/oe-core provided also in standalone recipe
> > update-alternatives-cworth
> >=20
> > http://git.openembedded.org/openembedded/tree/recipes/update-alternativ=
es/update-alternatives-cworth_0.99.154.bb
> >=20
> > commit 44b538eedab7c255051fa3375f9f2439cd2db3dd
> > Author: Marcin Juszkiewicz <hrw@openedhand.com>
> > Date:   Wed Mar 19 15:36:01 2008 +0000
> >=20
> >     update-alternatives-cworth: dropped as they are now generated with =
opkg recipe
>=20
> Turning this back into a standalone recipe might be worthwhile and seems
> like the best way to address the problems.
>=20
> Paul: Have you any opinion of moving update-alternatives to its own
> repository separate from opkg? or just check it into OE-Core as its just
> a single script? Its not as if it really needs much from opkg at this
> point?
>=20
> I'm also wondering how it compares to the dpkg version (which is C
> iirc). Should we switch to that? Does it give better performance?

Just note from someone who broke all upgrade paths in OE-classic and
then had to add hack to resolve upgrade paths:
http://git.openembedded.org/openembedded/tree/recipes/opkg/update-alternati=
ves-merge.inc

Changing u-a implementation is very tricky for people who care about
upgrade paths.
Changing alternatives directory when switching from cworth to opkg, i.e.
=66rom
${prefix}/lib/ipkg
to
${prefix}/lib/opkg
was fatal for all systems depending on busybox/coreutils - first
upgrade selected wrong alternatives, because it didn't know about
already installed alternatives in old directory.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKKOnAACgkQN1Ujt2V2gBxXKwCbBS3rNq9gGOkdRF10Ndtf1UFF
sAwAoIb5aNo4YebeqXjacZTSE/eeosKl
=jCCp
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--
