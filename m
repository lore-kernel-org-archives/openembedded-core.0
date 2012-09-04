Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8pXS-0002VK-QR
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 11:35:18 +0200
Received: by bkcik5 with SMTP id ik5so3133622bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ro6aNbc86+so47XbpMLa85nOHcx7nqEPQEKPa7IjWWk=;
	b=UaTmttADu6uXQbto2cmMIZKE7qa4ujuGoOmrN7SySa8y6D1X10Z/oMR0DuJwp8wGlt
	1K6q+4Y51HBiOHzRy6dFCafYSC5QQ878GE/8Jp2LBmcwPpbithb+bozjlAaWKQCzLbvf
	ctkdon7WKYxhqfZzaxEXrpHFDJqEPgUWVYuVrr2+RJjLdl/r0rR5ZDINnxU+6LqynE84
	18Jtdl+4A49TrW0hLpxhZ6/hiCCaA+gFwMf0zlDQRaU6rkusUz3HZ8QGJ10uXYFsHfyC
	2jAr5T5/NmPFSChIBp3gFUceKVwZMsCMk0bCBKinluvUnVtwWgI0t2lEEv3QvAzyEzlT
	+syQ==
Received: by 10.204.129.208 with SMTP id p16mr7707937bks.129.1346750577119;
	Tue, 04 Sep 2012 02:22:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm9684711bkv.11.2012.09.04.02.22.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 02:22:54 -0700 (PDT)
Date: Tue, 4 Sep 2012 11:23:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Message-ID: <20120904092321.GC3372@jama.jama.net>
References: <5040A5BB.7040601@r-finger.com>
	<20120903070832.GC3205@jama.jama.net>
	<5045C60B.1020600@r-finger.com>
MIME-Version: 1.0
In-Reply-To: <5045C60B.1020600@r-finger.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: runstrip() in package.bbclass fails when run against a kernel module
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
X-List-Received-Date: Tue, 04 Sep 2012 09:35:18 -0000
X-Groupsio-MsgNum: 28616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline

--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2012 at 10:12:43AM +0100, Tomas Frydrych wrote:
> Hi,
>=20
> On 03/09/12 08:08, Martin Jansa wrote:
> > On Fri, Aug 31, 2012 at 12:53:31PM +0100, Tomas Frydrych wrote:
> >>
> >> runstrip() in package.bbclass fails when run against a kernel module,
> >> because it tries to do a bitwise & with a 'None' argument. This throws:
> >> TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'.
> >=20
> > Was this for denzil?
> >=20
> > In master it was fixed a month ago by:
> > http://git.openembedded.org/openembedded-core/commit/meta/classes/packa=
ge.bbclass?id=3Da834ab8a6d53cae504fa112a89bab93d726539ec
> >=20
> > Don't know why they merged your patch to master too now..
>=20
> Yes, I run into the bug on Denzil and did not see the alternative fix in
> master; either one of those fixes the problem, of course.

Yes but having both in master doesn't make much sense, and someone
already asked the older fix to be merged to denzil.

>=20
> Tomas
>=20
>=20
> >=20
> > Cheers,
> >=20
> >>
> >> Tomas
> >>
> >=20
> >> From 6abe978d8e0acdb35c1abfed83e775b276b1231f Mon Sep 17 00:00:00 2001
> >> From: Tomas Frydrych <tomas@sleepfive.com>
> >> Date: Fri, 31 Aug 2012 12:02:18 +0100
> >> Subject: [PATCH] package.bbclass: fix stripping for kernel modules
> >>
> >> runstrip(path, elftype, d) does bitwise & on the elftype parameter, so=
 it has
> >> to be passed an integer. Passing None fails with: TypeError: unsupport=
ed
> >> operand type(s) for &: 'NoneType' and 'int'.
> >>
> >> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
> >> ---
> >>  meta/classes/package.bbclass |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss
> >> index 44e551f..f046fbb 100644
> >> --- a/meta/classes/package.bbclass
> >> +++ b/meta/classes/package.bbclass
> >> @@ -877,7 +877,7 @@ python split_and_strip_files () {
> >>  			for f in files:
> >>  				if not f.endswith(".ko"):
> >>  					continue
> >> -				runstrip(os.path.join(root, f), None, d)
> >> +				runstrip(os.path.join(root, f), 0, d)
> >>  	#
> >>  	# End of strip
> >>  	#
> >> --=20
> >> 1.7.10.4
> >>
> >>
> >=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >=20
> >=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBFyIkACgkQN1Ujt2V2gBwuhwCaAyuRivmiFeyNz9BFo+UTCcSX
+lkAoIkwRyJ4+60q5BQcjNm9ZiOgbnWu
=8lNb
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
