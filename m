Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7BD6BF82
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 11:26:42 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so2309497eae.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=txC3qt2Z6MXkkGGWHcEEmeGxGQhH//C5LGeKTLQlw8k=;
	b=PSZFUaM93/UTuNj5h3P8X9gpQhJHAlOJdoYbeg4n76MTR+3f/PR1BuUDnjLOsaRUdq
	grcCYEWgM5OSYLqUlmqiMVJB9+hQsU3v/T5rnAHOJ1kLMPTjDcHJePoGzaWomczbPMWM
	CBBe2cNPrWDGtUGm53TkrSpoYBNSJrroqDOZXaqcjy9hR+f8BVEWGVVeU9vD9X2q21HO
	+T8mzlm4Wx/gVGGGiewrk+HeEBlpiMYi6ulOYR4/EnEyTjqnSA5xKi+RjYY1N9QH5wAG
	t++iVM7kVxT7Wi+X2TMZD2OjdludpJ4FgQ0+mSxz/t0KdiaA12QICoVPUUa8qSVmYwuZ
	UbPA==
X-Received: by 10.15.64.1 with SMTP id n1mr37152697eex.15.1378121202632;
	Mon, 02 Sep 2013 04:26:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm21278756eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 04:26:42 -0700 (PDT)
Date: Mon, 2 Sep 2013 13:27:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130902112759.GA3544@jama>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
	<1373152387-19393-3-git-send-email-Martin.Jansa@gmail.com>
	<1378120938.1059.184.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1378120938.1059.184.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 3/4] package.bbclass: add SHLIBSSEARCHDIRS to define where to search for shlib providers
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
X-List-Received-Date: Mon, 02 Sep 2013 11:26:43 -0000
X-Groupsio-MsgNum: 44373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wrbmJCjDMpeEYJph"
Content-Disposition: inline

--wrbmJCjDMpeEYJph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2013 at 12:22:18PM +0100, Richard Purdie wrote:
> On Sun, 2013-07-07 at 01:13 +0200, Martin Jansa wrote:
> > * when package contains some files matching "^.*\.so", but in directory
> >   not default linker search paths (e.g. /opt/package/bundled-lib/libfoo=
=2Eso)
> >   don't register it as libfoo provider, because it's possible that there
> >   is different package providing libfoo.so in ${libdir} and that would
> >   be better shlib provider for other packages to depend on
> > * recipes providing libs intentionally in some other directory can
> >   define own SHLIBSSEARCHDIRS value
> >=20
> > [YOCTO #4628]
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/package.bbclass | 26 +++++++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index 6c3ca56..3713fd3 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1307,6 +1307,9 @@ SHLIBSDIRS =3D "${@getshlibsdirs(d)}"
> >  SHLIBSDIR =3D "${TMPDIR}/pkgdata/${PACKAGE_ARCH}${TARGET_VENDOR}-${TAR=
GET_OS}/shlibs"
> >  SHLIBSWORKDIR =3D "${PKGDESTWORK}/shlibs"
> > =20
> > +# default search path when searching for shlibs provided by package
> > +SHLIBSSEARCHDIRS ?=3D "${baselib} ${libdir}"
> > +
> >  python package_do_shlibs() {
> >      import re, pipes
>=20
> Did you end up setting SHLIBSSEARCHDIRS for many recipes out of
> interest?

No, but I was testing it only with world builds which won't cause any
fatal error when something is missing in shlibs providers.

Maybe I should revert it in my build and compare runtime deps after
another build (I'll do this when jenkins server is free again).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wrbmJCjDMpeEYJph
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIkdj8ACgkQN1Ujt2V2gByzDwCfYGEMZefB4LPKa5R0/NmEyq1r
IfUAnjSopmJUVK3CcXaZ54YVNRsauW9y
=DhmO
-----END PGP SIGNATURE-----

--wrbmJCjDMpeEYJph--
