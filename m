Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZ2NG-00078A-Rv
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 17:33:21 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so772719bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=30HroMUVW8sT4bK5k5esqWU4tnPuz/jRfGV0il5N6FI=;
	b=ABpEUlEgIUbkL6sk5wAOkLntXk1LhwHhBE1JkOEFQIQxTowwhJp1R2HJMOjOycHytg
	nDwEb338oci1ImZIxiBB0BTJdSIgHdz95qcHY6axQRGthIMpkj9dviFwrmRrBkwd0c8G
	2QX59YYZYnfzIixpqRQg3O4CXI1JaRgjbXAiMVc17J3uyjTys1o0pHLef1RAscHJJbKl
	jX7luWV+pF8UqO5rxLiWTqgn3tMX/+8jjmbwbUVOLxhL/635gzMmbn1Hfmzlehrn8vMr
	KqibJe/POTl1sIqWm2BLiBrDIokWzj79uWJ2JmXFYL1FTxOvMBPDYfYqboME0o33nne5
	bG2g==
Received: by 10.204.12.205 with SMTP id y13mr668242bky.46.1352996334718;
	Thu, 15 Nov 2012 08:18:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z22sm10763342bkw.2.2012.11.15.08.18.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 08:18:53 -0800 (PST)
Date: Thu, 15 Nov 2012 17:19:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20121115161907.GC17521@jama.jama.net>
References: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
	<1352964649-31187-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZAN=W_E+Qtox5XF7nBcMY9tN4vCCA51vcy=Hx1GDVGMwVbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=W_E+Qtox5XF7nBcMY9tN4vCCA51vcy=Hx1GDVGMwVbQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Thu, 15 Nov 2012 16:33:27 -0000
X-Groupsio-MsgNum: 31423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2012 at 08:25:20AM -0700, Chris Larson wrote:
> On Thu, Nov 15, 2012 at 12:30 AM, Martin Jansa <martin.jansa@gmail.com>wr=
ote:
>=20
> > * it's not very universal, but works with default oe-core setup and
> >   shows basic HOW-TO. It can be improved later.
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  V2: added .pyo to WHITELIST
> >      shorter filenames
> >      TMPDIR
> >      added duplicates but not shown
> >
> >  V3: use also populate-sysroot.MACHINE, manifest name for populate-sysr=
oot
> >      was changed in febeaf3d1b8917b660c7279b008d8b03337568e9
> >
> >  V4: dropped eglibc-initial work around, it was fixed in oe-core
> >
> >  scripts/sstate-sysroot-cruft.sh | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100755 scripts/sstate-sysroot-cruft.sh
> >
> > diff --git a/scripts/sstate-sysroot-cruft.sh
> > b/scripts/sstate-sysroot-cruft.sh
> > new file mode 100755
> > index 0000000..ca23dcf
> > --- /dev/null
> > +++ b/scripts/sstate-sysroot-cruft.sh
> > @@ -0,0 +1,34 @@
> > +#!/bin/sh
> > +
> > +# Used to find files installed in sysroot which are not tracked by sst=
ate
> > manifest
> > +# Update BASE
> > +
> > +BASE=3D"/OE/oe-core"
> >
>=20
> This seems interesting, but I have a few comments/concerns.
>=20
> 1) don't hardcode BASE, figure out the path relative to the script's
> location, e.g. BASE=3D"$(cd $(dirname $(dirname $0)) && pwd)"
> 2) output files shouldn't go into oe-core directly, as oe-core isn't
> guaranteed to be writable, and it's more common to expect output from a
> script like this to go relative to the current directory, or a temp
> directory
> 3) extract TMPDIR from bitbake -e, rather than hardcoding that, as that
> breaks for any distros or users which separate their tmpdirs by distro, or
> set TCLIBCAPPEND =3D ""

Ah in this case BASE is not directory with oe-core layer but one above.

I didn't want to use bitbake -e, so that this script can be executed
when some other bitbake process is running.

As said it's not really universal (I wrote it just to confirm something
and then shared it to find if someone else finds it also usefull to
improve it).

What about moving output to TMPDIR and setting TMPDIR by parameter?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlClFfsACgkQN1Ujt2V2gBz7iACeOgOBWKYTfiuSshdRFsd/Bio8
Lg4An2/ez+wBh9pmrto+uVMcvNurNGpt
=8/Qs
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
