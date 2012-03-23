Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBDmF-00087b-KN
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 00:20:11 +0100
Received: by wera1 with SMTP id a1so3024633wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 16:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7vPDB+hOI4FuYJdPUeJeJsXTrkYk13eEACCJ1pYZKO8=;
	b=OlDgmFzd5xzQ4smozfG24w/DxCtDwLwtx32OWpdSWB2LXIkzgw2JIIiL6ot5ewc5KL
	v87wMsCDvLUp9F3DYWKjJrXs2FK7SiGMQDaacv19HethI65G7njoKNcuI9J6WQz0GnsI
	HqenBcp7+viXrL2taCqFX8KNOKn1OEjlUKWtkORB4fnra+OWCGJ21iZYBDQ47x+98Iqr
	bG6oqC2/z4nh4X5GsaFsBHcrIKZOkrF64H07ymjxSl3F1uNxz5sQPlYXxn/e+sA4HNW4
	0SlT1AjHyfDkLfAlQMxPbmz99JulhnafBggyBTUElE8ayz6h7oA/d9se7OSMwRVyPzqc
	lIUw==
Received: by 10.180.101.231 with SMTP id fj7mr787518wib.15.1332544275024;
	Fri, 23 Mar 2012 16:11:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm17739847wib.5.2012.03.23.16.11.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 16:11:14 -0700 (PDT)
Date: Sat, 24 Mar 2012 00:11:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20120323231116.GC4604@jama.jama.net>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
	<4F6D0074.8020708@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F6D0074.8020708@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 23:20:11 -0000
X-Groupsio-MsgNum: 19640
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 12:00:04AM +0100, Andreas Oberritter wrote:
> On 23.03.2012 13:56, Martin Jansa wrote:
> > * /etc/modules-load.d/foo.conf is used by systemd like /etc/modutils/fo=
o was with sysvinit
>=20
> Martin,
>=20
> the man-page[1] for modules-load.d says that packages should install
> .conf files to /usr/lib/modules-load.d, because /etc/modules-load.d is
> reserved for the system administrator. Did you take this into account
> when you decided to support /etc/modules-load.d?

You're right, /usr/lib/modules-load.d could be possibly better option.
I've used /etc mostly because I was using it since my first systemd
image (so I was sure it works) and I don't remember seeing /usr/lib in
man page when I was reading it back then (probably overlooked or
forgot).

Is it worth updating update-modules (maybe teaching update-modules to
look into all possible systemd directories too)?

Cheers,

> Regards,
> Andreas
>=20
> [1] http://0pointer.de/public/systemd-man/modules-load.d.html
>=20
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass |   10 ++++++++--
> >  1 files changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 169df33..975ae13 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -122,6 +122,7 @@ kernel_do_install() {
> >  	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> >  	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Mod=
ule.symvers-${KERNEL_VERSION}
> >  	install -d ${D}/etc/modutils
> > +	install -d ${D}/etc/modules-load.d
> >  	install -d ${D}/etc/modprobe.d
> > =20
> >  	#
> > @@ -411,6 +412,11 @@ python populate_packages_prepend () {
> >  			for m in autoload.split():
> >  				f.write('%s\n' % m)
> >  			f.close()
> > +			name =3D '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
> > +			f =3D open(name, 'w')
> > +			for m in autoload.split():
> > +				f.write('%s\n' % m)
> > +			f.close()
> >  			postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> >  			if not postinst:
> >  				bb.fatal("pkg_postinst_%s not defined" % pkg)
> > @@ -426,7 +432,7 @@ python populate_packages_prepend () {
> >  			f.close()
> > =20
> >  		files =3D d.getVar('FILES_%s' % pkg, True)
> > -		files =3D "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modprobe.d=
/%s.conf" % (files, basename, basename, basename)
> > +		files =3D "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modules-lo=
ad.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basenam=
e, basename)
> >  		d.setVar('FILES_%s' % pkg, files)
> > =20
> >  		if vals.has_key("description"):
> > @@ -456,7 +462,7 @@ python populate_packages_prepend () {
> >  	# avoid warnings. removedirs only raises an OSError if an empty
> >  	# directory cannot be removed.
> >  	dvar =3D d.getVar('PKGD', True)
> > -	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar)]:
> > +	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar),=
 "%s/etc/modules-load.d" % (dvar)]:
> >  		if len(os.listdir(dir)) =3D=3D 0:
> >  			os.rmdir(dir)
> > =20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9tAxQACgkQN1Ujt2V2gBxQUACggsg9cmvYGYSQvvzvrlvz+7L2
5N8AoKcuXrQWp4WYedRaxP4NPb5vgeHJ
=9LYO
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
