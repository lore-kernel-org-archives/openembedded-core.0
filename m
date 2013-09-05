Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9EC616F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:00:08 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so848611eaj.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+IY/7OVuGuoAfT5n5FGCLBo/hniX/IVszLQWAK4kxIA=;
	b=y6LA/lm0rrZYxav2Fs0KWalfQvHzF+i2ECimRbYRUL5fFni3z8yX+j6casDiaQ3XRQ
	ouSvH4Ygx0/fYG8vwRJpH9Qkpbef9opU03uf06ysGVxUlGmLupGCWMZU/hDN5cGhfsYP
	cSK3hCIvUsvGC5FnAeolTsZRVqjJWoAaZwsTp0/9TbFpybZRcEmvdKJe18SCbL7FlGCb
	950Zf9VQHxei27IIA8Y6dVp46/DNG2LEmjDtsC3t+6R1uwHDdipOLrKBi8/SaM/nlUb2
	112tTu0/3N5nFFzX3tInuJnvaql3J5edX0zMKhF6xm/kLzuPzR9CdvUdni03nM0mKsdC
	Qzww==
X-Received: by 10.14.37.4 with SMTP id x4mr13130563eea.16.1378382409508;
	Thu, 05 Sep 2013 05:00:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm48083963eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 05:00:09 -0700 (PDT)
Date: Thu, 5 Sep 2013 14:01:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130905120129.GJ11500@jama>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
	<20130828083339.GI3544@jama> <1378381217.32427.49.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1378381217.32427.49.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/4] package.bbclass: move reading shlibs providers to separate function
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
X-List-Received-Date: Thu, 05 Sep 2013 12:00:08 -0000
X-Groupsio-MsgNum: 44561
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8tZVdKiiYitVG083"
Content-Disposition: inline

--8tZVdKiiYitVG083
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2013 at 12:40:17PM +0100, Richard Purdie wrote:
> On Wed, 2013-08-28 at 10:33 +0200, Martin Jansa wrote:
> > On Sun, Jul 07, 2013 at 01:13:04AM +0200, Martin Jansa wrote:
> > > * prepare for reading shlibs providers only from dependency tree of
> > >   current recipe
> > >=20
> > > [YOCTO #4628]
> >=20
> > Any comment on this patchset?
> >=20
> > I'm using first 3 commits for some time in world builds and they helped
> > me to discover some unexpected shlib providers (and fix them by setting
> > PRIVATE_LIBS).
>=20
> I've run some tests with this and I do like the patches however there
> are some issues. Some are minor and easily fixed, some are more
> problematic but I'll try and list them:
>=20
> * Patch 1/4 is missing a () from a funciton. Easily fixed, mentioned=20
>   for completeness
> * In 2/4, I locally removed the continue from the "ignoring xxx" loop=20
>   since it doesn't make the build any more deterministic, its still a=20
>   race over which package builds first but it is a change in=20
>   behaviour. We may decide to change behaviour but that should be a=20
>   separate patch. Also need to update the message after the change.
> * In 3/4, the regexp is not anchored. Libraries places in subdirs of=20
>   libdir should not match this code, neither should things in /foo/lib.=
=20
>   The tweaks below ensure the regexp matches the correct things and=20
>   avoids modules in ${libdir}/${PN}/. This is correct but gives another=
=20
>   problem I'll come back to.
> * 4/4 isn't complete. Again I like the idea but we probably need help=20
>   from bitbake for it. Its the wrong point in the development cycle to=20
>   start thinking about it.
>=20
> The problem in 3/4 is clear with something like gstreamer verses
> gstreamer1.0. These install into ${libdir}/PN/ so they are safe well
> behaved recipes but they trigger spurious warnings with the patch :(. We
> can "fix" with:
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 569599c..5fc6cda 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1337,7 +1337,7 @@ python package_do_shlibs() {
>              dir =3D dir[1:]
>          if shlibs_search_dirs_re_txt:
>              shlibs_search_dirs_re_txt +=3D "|"
> -        shlibs_search_dirs_re_txt +=3D "(^.*/%s/.*$)" % dir
> +        shlibs_search_dirs_re_txt +=3D "(^/%s/[^/]*$)" % dir
>      shlibs_search_dirs_re =3D re.compile(shlibs_search_dirs_re_txt)
>      bb.debug(2, "will use following RE to search for provides sonames %s=
" % shlibs_search_dirs_re_txt)
> =20
> @@ -1398,12 +1398,13 @@ python package_do_shlibs() {
>              if m:
>                  this_soname =3D m.group(1)
>                  if not this_soname in sonames:
> -                    if shlibs_search_dirs_re.match(file):
> +                    targetfile =3D file.replace(pkgdest + "/" + pkg, "")
> +                    if shlibs_search_dirs_re.match(targetfile):
>                          # if library is private (only used by package) t=
hen do not build shlib for it
>                          if not private_libs or -1 =3D=3D private_libs.fi=
nd(this_soname):
>                              sonames.append(this_soname)
>                      else:
> -                        bb.debug(2, "ignoring soname %s from %s, because=
 path doesn't match %s" % (this_soname, file, shlibs_search_dirs_re_txt))
> +                        bb.debug(2, "ignoring soname %s from %s, because=
 path doesn't match %s" % (this_soname, targetfile, shlibs_search_dirs_re_t=
xt))
>                  if libdir_re.match(os.path.dirname(file)):
>                      needs_ldconfig =3D True
>                  if snap_symlinks and (os.path.basename(file) !=3D this_s=
oname):
>=20
> So this is nice, however the shlibs code doesn't just handle the libs in
> the default search path. Its also used when say something in
> ${libdir}/${PN} links against something else in that directory. Bitbake
> looks up the soname and then adds in RDEPENDS on the appropriate
> packages. This does assume there is a valid RPATH in the library but
> that is usually the case.
>=20
> So by including this code as it stands, we'd drop a number of
> autogenerated RDEPENDS for more unusual libraries in the system outside
> of ${libdir}. We can't do that.
>=20
> So what can we do? When we process shlibs, we need to record the paths
> of the things providing given sonames. They're either in the default
> search path, or in specific directories. When we then process another
> library, we can look at the RPATH it uses and then only match things in
> the search paths (default or otherwise).
>=20
> Sadly, this is fairly major surgery to the shlibs code and at the
> current point of the release cycle, not something we can start.
>=20
> So in summary, I do like the patchset at lot and it is showing up real
> problems (emgd conflicting with mesa is something my builds are
> currently corrupted with) however I don't think the patches are right
> yet and we may need some more involved changes to get them there. I do
> think its worth doing but its probably 1.6 material.

Thanks for review, I'll include your changes in jansa/shlib-providers
branch and when jenkins gets less busy I'll build world with and without
these patches included to compare autogenerated RDEPENDS.

I agree it's too late for 1.5, I'll try to post updated version with
RDEPENDS-diff as soon as 1.6. window opens.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8tZVdKiiYitVG083
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIocpkACgkQN1Ujt2V2gBwDCgCeNPPcSeEREnfuDTfG+7pPEo2w
t7YAn1gcJuLpS09JePjWCCNSSz+tgxzV
=kGre
-----END PGP SIGNATURE-----

--8tZVdKiiYitVG083--
