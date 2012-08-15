Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T1dru-0007ZG-Ge
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 15:42:42 +0200
Received: by wgbdr1 with SMTP id dr1so1231512wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t9hiCqI5RBnptnkzp5WdT65pQD9NG1I/MXI+L+xBZRM=;
	b=u8HBBmA4L6SyMrAFNNNWExA2UC7WCfFxhS3AcLs2xw4+QOqfhB47GbJpvHjM8Scisg
	/GTMe8t8aHsWftZzORKutDZcVuxX2doBWtSyC2xGniocQfz04QKZMbulU17xfrWCUQCa
	gWbWeLE9fEG2XLht2f/zvjI0cPFl0G8FzE4SA1XiAEcNaZ2/1T3hZamBD43lnmSDmnrr
	d/znGg+c+AXIuxZiTOqAeDzQWjA5NmC7u/nJx5y6PtaarYKNPs5OSIHEcPi4ZUCEEitm
	M/qQfoki5iDLd3exdlUXq99SRcAhqUyjrBztAj+aYuTb3RzE+xoZdDbdxF6+E/binTe+
	aQHQ==
Received: by 10.180.84.1 with SMTP id u1mr37108029wiy.15.1345037446577;
	Wed, 15 Aug 2012 06:30:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm28656878wiz.1.2012.08.15.06.30.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:30:45 -0700 (PDT)
Date: Wed, 15 Aug 2012 15:30:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120815133040.GA3108@jama.jama.net>
References: <501A8C20.8020502@mentor.com> <501A8C5C.8090503@mentor.com>
	<1345037098.538.5.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1345037098.538.5.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] systemtap-uprobes: inhibit package strip
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
X-List-Received-Date: Wed, 15 Aug 2012 13:42:42 -0000
X-Groupsio-MsgNum: 27511
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 02:24:58PM +0100, Richard Purdie wrote:
> On Thu, 2012-08-02 at 07:19 -0700, Wade Farnsworth wrote:
> > uprobes.ko is not located in /lib/modules, so it fails the check in
> > runstrip that ensures that only the debug section is stripped, leaving
> > the symbols untouched.  This prevents the module from being inserted at
> > run time.  Inhibiting package stripping fixes the problem.
> >=20
> > Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
> > ---
> >  .../systemtap/systemtap-uprobes_git.bb             |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/m=
eta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> > index b328e6b..f135a54 100644
> > --- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> > +++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> > @@ -9,6 +9,8 @@ PR =3D "r0"
> >  # On systems without CONFIG_UTRACE, this package is empty.
> >  ALLOW_EMPTY_${PN} =3D "1"
> > =20
> > +INHIBIT_PACKAGE_STRIP =3D "1"
> > +
> >  inherit module-base gettext
> > =20
> >  FILES_${PN} +=3D "${datadir}/systemtap/runtime/uprobes"
>=20
> I think we need to teach package.bbclass to identify kernel modules
> better (.ko extension?) rather than hack around this for each external
> module...

and sometimes it tries to strip foo.ko which is not binary file at all
(e.g. /usr/share/emacs/23.4/etc/tutorials/TUTORIAL.ko from emacs).

http://git.openembedded.org/meta-openembedded/commit/?id=3Dd213bfac739163eb=
932e31181e0bfecc84507f30

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlArpIAACgkQN1Ujt2V2gByhIwCdH/eXHA0cEeDVSyzFbPmTVbpz
05YAoIaKXcJYCybPIaFYJ0aGE5IzkXsR
=D+dT
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
