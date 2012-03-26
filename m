Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCFGA-00051l-J9
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 21:07:18 +0200
Received: by wgbdr12 with SMTP id dr12so3756899wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kn4uOCzEZ0KUHMjTHgzPux4ttwpZBBA1OOtN/mZB2T4=;
	b=FBmj4YT/HX3ajo1p3gh6mbwCgVRJmuWn70rw8GgKQPXYPArq51TMPJlUDjBQK4jQrP
	bQe3gkgjMj6c1a7qLJlQCDU9Q3iJCkkae4EXLq0eHadwIBzcNJ7kE/xggYbxD+YGDUOK
	rJpgnbSN/sKKelOcorbWXF4aHkhmTHbk0m0704+vLQHMtjMiJVzJv8j6st/4ry8qEiP4
	SsQ/l//pxhOeUM6ChT9YNO0k1Mz6FM0t9xNx1ZqIs0ONxOcmmKPQl/fJ0WAmfeF8Ko/Y
	t9y/5fIEvcOOEltW0QtJv4t8jjZE5dP3IpYQ42gRiaDiLrbh3EylJOGa0QWStrHLCc3N
	GD7g==
Received: by 10.180.94.33 with SMTP id cz1mr21106230wib.13.1332788298612;
	Mon, 26 Mar 2012 11:58:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw5sm43020987wib.0.2012.03.26.11.58.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 11:58:17 -0700 (PDT)
Date: Mon, 26 Mar 2012 20:58:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20120326185815.GA18447@jama.jama.net>
References: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
	<4e31dfddbb238cd5e3c2ce19a49996e113419212.1332507302.git.Martin.Jansa@gmail.com>
	<4F70B998.3070405@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F70B998.3070405@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] kernel.bbclass: use symlinks for modutils files
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
X-List-Received-Date: Mon, 26 Mar 2012 19:07:18 -0000
X-Groupsio-MsgNum: 19773
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2012 at 11:46:48AM -0700, Darren Hart wrote:
> What is the motivation?

RP's review comment.
=20
> On 03/23/2012 05:56 AM, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass |    8 +++-----
> >  1 files changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 975ae13..54ed7f7 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -407,16 +407,14 @@ python populate_packages_prepend () {
> >  		# appropriate modprobe commands to the postinst
> >  		autoload =3D d.getVar('module_autoload_%s' % basename, True)
> >  		if autoload:
> > -			name =3D '%s/etc/modutils/%s' % (dvar, basename)
> > -			f =3D open(name, 'w')
> > -			for m in autoload.split():
> > -				f.write('%s\n' % m)
> > -			f.close()
> >  			name =3D '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
> >  			f =3D open(name, 'w')
> >  			for m in autoload.split():
> >  				f.write('%s\n' % m)
> >  			f.close()
> > +			modutils_name =3D '%s/etc/modutils/%s' % (dvar, basename)
> > +			modutils_target =3D '../modules-load.d/%s.conf' % (basename)
> > +			os.symlink(modutils_target, modutils_name)
>=20
> This basically undoes what was added in 1/2 and replaces it with
> symblinks right?
>=20
> If so, just do it as symlinks in the first place.

I have't squashed them because=20
[PATCH 1/6] kernel.bbclass: populate /etc/modules-load.d/ with module_autol=
oad
was already applied to meta-oe's kernel.bbclass copy, before I got RP's
review this patchset here, so I wanted to keep those patches 1to1.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9wvEcACgkQN1Ujt2V2gBwI7QCfbbHTv/NhRAhncBGa5eGnD9kj
wKQAoICwKU8NJKx8xYeTNl4VJ9cf/M6O
=K1K9
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
