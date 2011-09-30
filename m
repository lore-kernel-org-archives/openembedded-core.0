Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9b47-0005XV-Dv
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:15:39 +0200
Received: by fxi1 with SMTP id 1so2944401fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HQSffM+1kmPKQ8zhlFNSDBiYPsU/WhpRl9vetnzjGho=;
	b=VCaCHXfWNoC8xvcLvDaj1FaGvi6yVmbgS1g7v3bZ5y2hI4hz97SvMBi9Jm5xtK6KBH
	H6IvJijW8KBHkSxD7VqhyDhvMiR0BIJU/JbBkyVZGkiOtRfHKEiguAXXoGMb/SLYtLnb
	87OKCIp0gcjLX3TmWrsTOKbIpoyNPnaNRgCjw=
Received: by 10.223.29.203 with SMTP id r11mr5573820fac.10.1317381007722;
	Fri, 30 Sep 2011 04:10:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f25sm6259559faf.7.2011.09.30.04.10.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 04:10:06 -0700 (PDT)
Date: Fri, 30 Sep 2011 13:10:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930111001.GB15856@jama.jama.net>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<2c12e32cc688b78bbaedc026532f5dfb3e118c39.1317367429.git.Martin.Jansa@gmail.com>
	<1317380619.12332.154.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317380619.12332.154.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 11/13] libdrm: improve packaging
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
X-List-Received-Date: Fri, 30 Sep 2011 11:15:39 -0000
X-Groupsio-MsgNum: 10273
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline

--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 12:03:32PM +0100, Richard Purdie wrote:
> On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/drm/libdrm.inc       |    7 ++++---
> >  meta/recipes-graphics/drm/libdrm_2.4.26.bb |    2 +-
> >  meta/recipes-graphics/drm/libdrm_git.bb    |    2 +-
> >  3 files changed, 6 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphi=
cs/drm/libdrm.inc
> > index 1ad9dc3..20d7f1f 100644
> > --- a/meta/recipes-graphics/drm/libdrm.inc
> > +++ b/meta/recipes-graphics/drm/libdrm.inc
> > @@ -15,7 +15,8 @@ DEPENDS +=3D " libpciaccess"
> > =20
> >  inherit autotools pkgconfig
> > =20
> > -PACKAGES =3D+ "libdrm-tests"
> > -FILES_libdrm-tests =3D "${bindir}/dr* ${bindir}/mode*"
> > +PACKAGES =3D+ "${PN}-tests ${PN}-drivers ${PN}-kms"
> > +FILES_${PN}-tests =3D "${bindir}/dr* ${bindir}/mode*"
> > +FILES_${PN}-drivers =3D "${libdir}/libdrm_*.so.*"
> > +FILES_${PN}-kms =3D "${libdir}/libkms*.so.*"
> > =20
> > -LEAD_SONAME =3D "libdrm.so"
>=20
> I want to make it *really* clear that this breaks anything depending on
> libdrm for oe-core users.
>=20
> This is exactly why I think the whole PR bump thing is stupid, braindead
> and simply wrong since the current fix is to go and find anything using
> libdrm and bump those PR values too.
>=20
> Of course we could add a "LIBDRM_INC_PR" in the core and bump that when
> libdrm changes.
>=20
> The trouble is following this path to its logical conclusion, we
> basically turn our automated build system into a set of manual changes
> where we compute dependency chains by hand.
>=20
> Sorry to labour this point but I do want people to understand why we
> need to take some pain in the short term and improve what we're doing...
>=20
> I will take the patch since I value getting meta-oe cleaned up and I'll
> add in a patch bumping PR for xserver/mesa but I'm not happy.

If you take also patch for xserver/mesa upgrade then extra PR bump won't
be needed :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6Fo4gACgkQN1Ujt2V2gByFAACgjW2dzicGKX4RNWR56BqejoX2
gp4AoIDl54B8uGG3yUO3TZa/0JjTt9pl
=cBew
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
