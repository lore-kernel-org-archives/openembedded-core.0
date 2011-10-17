Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFnow-00089Z-2D
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 16:05:38 +0200
Received: by bkat8 with SMTP id t8so5803673bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DLZ55Ua9OwunhemfnDYY9aE+XZ0VfDxqD8VewOrW9gg=;
	b=XirW2dbwhkrnrR0kUYf/rl8og7XxtaPYgK9eESABCpY5uEY1yOEDiK05NLffmYm/Qd
	y3GHY+qI2qM9Hr6aPZDSEPtb3OwJ6Soeb0HRajW3aF90LkdZ9v9YlQflNKhcrkZJ8f/L
	+ZVNp2pbsazycR43XfiXwOOFCl9a8i1D0+mYU=
Received: by 10.204.142.144 with SMTP id q16mr14421229bku.75.1318859986637;
	Mon, 17 Oct 2011 06:59:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm17302843bka.0.2011.10.17.06.59.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 06:59:45 -0700 (PDT)
Date: Mon, 17 Oct 2011 15:59:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111017135938.GH12684@jama.jama.net>
References: <1318855942-8677-1-git-send-email-Martin.Jansa@gmail.com>
	<1318859310.22985.114.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1318859310.22985.114.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] bitbake.conf: include only ${libdir}/${BPN}/*${SOLIBS} not whole ${libdir}/${BPN}/* in FILES_${PN}-dev
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
X-List-Received-Date: Mon, 17 Oct 2011 14:05:38 -0000
X-Groupsio-MsgNum: 11132
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="poemUeGtc2GQvHuH"
Content-Disposition: inline

--poemUeGtc2GQvHuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2011 at 02:48:29PM +0100, Phil Blundell wrote:
> On Mon, 2011-10-17 at 14:52 +0200, Martin Jansa wrote:
> > * ie syslog-ng has a lot of .so and .la files in ${libdir}/${BPN}/ and
> >   fails with this QA check:
> > | ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .s=
o: syslog-ng path
> > '/work/i586-oe-linux/syslog-ng-3.2.2-r6.1/packages-split/syslog-ng/usr/=
lib/syslog-ng/libafsocket.so'
> > * I haven't tried to rebuild from scratch to check if this changes is
> >   creating more QA issues about unpackaged files then what is trying to
> >   fix (ie in syslog-ng), that's why it's RFC
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> The subject line of this patch doesn't seem to match what it's actually
> doing. =20

Ah, sorry you're right it should be without '-dev' suffix in subject

> If there are .la or .so files in ${libdir}/${PN} that are causing a
> problem then it does seem reasonable to add them to FILES_${PN}-dev.
> But I don't think that restricting the scope of FILES_${PN} is
> desirable, or ought to be necessary.

How to do this with this order of PACKAGES, without redefining PACKAGES
itself?

PACKAGES =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-loc=
ale"

Regards,

> p.
>=20
> > ---
> >  meta/conf/bitbake.conf |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index e2c1b6f..772c09e 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -262,7 +262,7 @@ FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexec=
dir}/* ${libdir}/lib*${SOLIBS}
> >              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> >              ${base_bindir}/* ${base_sbindir}/* \
> >              ${base_libdir}/*${SOLIBS} \
> > -            ${datadir}/${BPN} ${libdir}/${BPN}/* \
> > +            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
> >              ${datadir}/pixmaps ${datadir}/applications \
> >              ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
> >              ${libdir}/bonobo/servers"
> > @@ -271,7 +271,7 @@ FILES_${PN}-doc =3D "${docdir} ${mandir} ${infodir}=
 ${datadir}/gtk-doc \
> >              ${datadir}/gnome/help"
> >  SECTION_${PN}-doc =3D "doc"
> > =20
> > -FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir=
}/*.la \
> > +FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir=
}/${BPN}/*${SOLIBSDEV} ${libdir}/*.la \
> >                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig=
 \
> >                  ${datadir}/aclocal ${base_libdir}/*.o"
> >  SECTION_${PN}-dev =3D "devel"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--poemUeGtc2GQvHuH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6cNMoACgkQN1Ujt2V2gByRDgCfbTKxf96lHO26KvP6KvUcVVzd
wbwAoLPH6YLDlElxmM27k5i9EzkkiJlK
=XK12
-----END PGP SIGNATURE-----

--poemUeGtc2GQvHuH--
