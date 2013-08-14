Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 61272600A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 10:58:25 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so4819049eek.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+Q+N3o9zGcgZaUWC3NaK5Z3Qer8EA44w1DDUs/gIn9s=;
	b=zex7zLFs0TNU2o44+kalVpG6dzjJg9tKApxw2WBD+r8GB4VNzfpjYVeVoa0KzNS/yI
	NnWUNpvA6UezsVHxBs751Ti+cCz0QPe4SodOKG05omd1xJzoutJ51ikmuGS99koaUxij
	G1BqDaLtaQ0wEd2lU7itcZG2QNERhzt24Em3QH9VkloIxeUodIIXXNdazuVABrI3Xpem
	HreyRMrPZRx8wMEPVr0XwOQ2SkrFZniBGLtU8aKw9t7R82ZRRZqat+Bl9st3O7zXZWHw
	pIRZ2w4Bm5D/iCxfjCaIFaCsP6VeWw0DUe3nsc/yjVLMypEdyEqnhUyojSDJYXi4cVEF
	om5Q==
X-Received: by 10.15.64.1 with SMTP id n1mr14334863eex.15.1376477905158;
	Wed, 14 Aug 2013 03:58:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm74136635eev.3.2013.08.14.03.58.24 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 03:58:24 -0700 (PDT)
Date: Wed, 14 Aug 2013 12:59:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130814105915.GU17945@jama>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com> <520B1595.3060909@windriver.com>
	<20130814065609.GQ17945@jama> <1376477217.22952.5.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1376477217.22952.5.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Wed, 14 Aug 2013 10:58:26 -0000
X-Groupsio-MsgNum: 43314
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O0IT7rLmWuveAsNR"
Content-Disposition: inline

--O0IT7rLmWuveAsNR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 11:46:57AM +0100, Richard Purdie wrote:
> On Wed, 2013-08-14 at 08:56 +0200, Martin Jansa wrote:
> > On Wed, Aug 14, 2013 at 01:28:53PM +0800, Rongqing Li wrote:
> > >=20
> > >=20
> > > On 08/14/2013 03:02 AM, Saul Wold wrote:
> > > > On 08/13/2013 01:20 AM, rongqing.li@windriver.com wrote:
> > > >> From: "Roy.Li" <rongqing.li@windriver.com>
> > > >>
> > > >> sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, t=
hen
> > > >> sstate_create_package will store SSTATE_BUILDDIR into a archive fi=
le by
> > > >> tar, but once other packages install the same file into sysroot, t=
he
> > > >> creating the archive file will fail with below error:
> > > >>
> > > >>      DEBUG: Executing shell function sstate_create_package
> > > >>      tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file chan=
ged
> > > >> as we read it
> > > >>
> > > >> This kind of error is harmless, use --ignore-failed-read to ignore=
 it.
> > > >>
> > > > I am not sure it's so harmless, what if the file is corrupted, then=
 we
> > > > have a bad sstate tarball.  You have identified the part of the root
> > > > cause being the hardlink, but what if the file actually does change
> > > > (which would be a different bug potentially), then your packaging a
> > > > differet set of macros (in this case) with the sysroot.
> > > >
> > > >
> > > > Sau!
> > >=20
> > >=20
> > > The file is not corrupted, and the file content is not changed,  "tar"
> > > said xorg-macros.m4 file is changed, since the number of links of
> > > xorg-macros.m4 has changed when other packages is doing configuration
> > > and call autotools_copy_aclocal to make a hardlink to ${ACLOCALDIR}
> > >=20
> > > If this fix can be accepted, I will rework the commit header.
> >=20
> > I think there is still some other issue.
> >=20
> > I haven't seen this on ext4 filesystems, but with reiserfs I was able to
> > reproduce "cp: will not create hard link" issue, e.g.:
> >=20
> > do_populate_lic_setscene task failing in sstate_install with=20
> > cp: will not create hard link `/OE/deploy/licenses/recipe' to directory=
 `/OE/deploy/licenses/recipe' (same path)
> >=20
> > or
> > ERROR: Error executing a python function in pn.bb:
> > CalledProcessError: Command 'cp -afl /OE/work/armv7a-vfp-neon-oe-linux-=
gnueabi/pn/1.0/pkgdata/* /OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi' retu=
rned non-zero exit status 1 with output=20
> > cp: warning: source file `/OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/=
1.0/pkgdata/pn' specified more than once
>=20
> This sounds like a race issue in reiserfs to me...

True, I assume the same until someone else is able to reproduce it on
some other filesystem.

Any idea how to confirm this theory at least to add warning in
documentation that using reiserfs on build partition is causing random
build failures?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O0IT7rLmWuveAsNR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILYwMACgkQN1Ujt2V2gBwtCACgtHr8TOIs8qVmbPGt5j+/EjlS
nHsAoLYO3ydLEVR1J+GSRywgGgY9VBLJ
=g097
-----END PGP SIGNATURE-----

--O0IT7rLmWuveAsNR--
