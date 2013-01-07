Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TsJb9-0000iD-LE
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 21:47:08 +0100
Received: by mail-pa0-f46.google.com with SMTP id bh2so10890082pad.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 12:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4JWuYxth4jibCwQkQ5vNWLZO10lVnlmJMAWXUJSJSac=;
	b=EWlVcUfYegvPaA2ppNBmshiVebbgcDMiZkM9aAAA6d7oKK+Y6EtxVFZQSJDTrrUuyn
	ci5BNC6YYU1UUbeMhyydBWs8tdH4qDsoaAb6AKYESap/OaD3l1vP6/9loa5JybWgYeCY
	nr5MbWY+AXqVu1gy0OWgeTcpu0R7BjmGysBpyh7rjcvVwosx25Aa78t3G1hnwo7xmXjQ
	F5Y8hUk/hzA1toyHGOV540B7Owg+IKmrSj0Zzdyi+2oflWx7oCpuUE36kzLeVeozdWOt
	3qJjahPUCEDB858jPNAWtza2RVT9daaxJpqU46OeolgUXvW1C/uL4EwMc+FkCUBXdgCT
	ZtWQ==
X-Received: by 10.68.231.10 with SMTP id tc10mr187906388pbc.81.1357590717317; 
	Mon, 07 Jan 2013 12:31:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x6sm39275964pav.29.2013.01.07.12.31.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 12:31:56 -0800 (PST)
Date: Mon, 7 Jan 2013 21:31:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130107203157.GI3285@jama>
References: <1357557340-28756-1-git-send-email-Martin.Jansa@gmail.com>
	<1357558573.28649.231.camel@ted> <2814359.Bpg095F8KW@helios>
MIME-Version: 1.0
In-Reply-To: <2814359.Bpg095F8KW@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dropbear: don't use IMAGE_FEATURES
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
X-List-Received-Date: Mon, 07 Jan 2013 20:47:10 -0000
X-Groupsio-MsgNum: 33458
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vs0rQTeTompTJjtd"
Content-Disposition: inline

--vs0rQTeTompTJjtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 07, 2013 at 08:11:58PM +0000, Paul Eggleton wrote:
> On Monday 07 January 2013 11:36:13 Richard Purdie wrote:
> > On Mon, 2013-01-07 at 12:15 +0100, Martin Jansa wrote:
> > > * IMAGE_FEATURES are image specific, but dropbear recipe isn't
> > > * if you have debug-tweaks in EXTRA_IMAGE_FEATURES or added to
> > >=20
> > >   IMAGE_FEATURES in distro config, then it will set DISTRO_TYPE
> > >   to debug as expected, but if you add debug-tweaks only in
> > >   your-own-debug-image, then dropbear never sees debug-tweaks and
> > >   your-own-debug-image won't allow empty password login.
> > >=20
> > > * best way would be to patch dropbear to enable empty password by
> > >=20
> > >   runtime config or argument and enable it in ROOTFS_POSTPROCESS_COMM=
AND
> > >   like openssh_allow_empty_password does, see
> > >   http://permalink.gmane.org/gmane.network.ssh.dropbear/845
> > >=20
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >=20
> > >  meta/recipes-core/dropbear/dropbear.inc | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-core/dropbear/dropbear.inc
> > > b/meta/recipes-core/dropbear/dropbear.inc index aa313df..2c170c6 1006=
44
> > > --- a/meta/recipes-core/dropbear/dropbear.inc
> > > +++ b/meta/recipes-core/dropbear/dropbear.inc
> > > @@ -2,7 +2,7 @@ DESCRIPTION =3D "Dropbear is a lightweight SSH and SCP
> > > implementation">=20
> > >  HOMEPAGE =3D "http://matt.ucc.asn.au/dropbear/dropbear.html"
> > >  SECTION =3D "console/network"
> > >=20
> > > -INC_PR =3D "r0"
> > > +INC_PR =3D "r1"
> > >=20
> > >  # some files are from other projects and have others license terms:
> > >  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
> > >=20
> > > @@ -40,7 +40,7 @@ EXTRA_OEMAKE =3D 'MULTI=3D1 SCPPROGRESS=3D1
> > > PROGRAMS=3D"${SBINCOMMANDS} ${BINCOMMANDS}"'>=20
> > >  EXTRA_OECONF +=3D "\
> > > =20
> > >   ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam',
> > >   '--disable-pam', d)}">=20
> > > -DISTRO_TYPE ?=3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks",
> > > "debug", "",d)}" +DISTRO_TYPE ?=3D "debug"
> > >=20
> > >  do_install() {
> > > =20
> > >  	install -d ${D}${sysconfdir} \
> >=20
> > How about we ditch DISTRO_TYPE entirely and check for "debug-tweaks" in
> > DISTRO_FEATURES? This would bring it more into line with the other
> > places we do things like this.
> >=20
> > FWIW I agree this should ideally be runtime configured and we should
> > really add an enhancement request to the bugzilla for that (or patches
> > welcome).
>=20
> There's already a request open:
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2578
>=20
> I'd suggest leaving the current behaviour (poor as it may be) until that =
bug=20
> is fixed.

Building with OEBasic won't rebuild dropbear to suit IMAGE_FEATURES of
currently build image and even with OEBasicHash I don't know which
dropbear version will be used if I build 2 different images:
bitbake foo-image foo-debug-image

So changing it one way or another is IMHO improvement of current
situation until that bug is fixed properly.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vs0rQTeTompTJjtd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDrML0ACgkQN1Ujt2V2gBxSLQCgsrl42E2buh2n5Prey2V2vCYP
+gEAnisvSoJ3Pc8JSTipGE8rK+ZunAss
=U6Cl
-----END PGP SIGNATURE-----

--vs0rQTeTompTJjtd--
