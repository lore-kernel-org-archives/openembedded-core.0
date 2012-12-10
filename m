Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiCbz-0007R9-La
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 00:18:11 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1296982eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 15:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GLAoobatBy4lHEnAN8ePXyccOhvRgtCP/MI0NneJr7g=;
	b=R6e1JKYILJv9kAUrgY3hqtSeC1ZKSHjmpFwjSrwJ4jSuGmQMF24Du5ynL5Yc/VK6Rp
	d9clHI8KAGPx730SQgW2hCiO1LoZJaXJtGG+mk0z/vIzNddvmxUrHsWdWm5N6qSKJIv0
	3YWE78ZmkarnqaomAAVVjdJIyKb/VVFv1bnRKOoaIfhEIrlw7qxTLP0hcO3TF/gJtkr3
	G1xX0eXnCm2i6RxoqcEk0v/e07dsoPjD/JtfboFuvfd/BDgJihRatqGeJWbSjDXRGpb3
	Br4idxtKd+GgqOx/WTy5VR0bbZdbde3gkYkQY08pK8QDEhhrZC98mK52MVOWfoFnjG0z
	aeyg==
Received: by 10.14.223.135 with SMTP id v7mr54303709eep.41.1355180620387;
	Mon, 10 Dec 2012 15:03:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm46201220eeg.4.2012.12.10.15.03.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 15:03:39 -0800 (PST)
Date: Tue, 11 Dec 2012 00:03:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20121210230353.GA11623@jama.jama.net>
References: <alpine.DEB.2.02.1212061253340.15222@oneiric>
	<50C0E055.4070105@windriver.com>
	<alpine.DEB.2.02.1212061316510.16942@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1212061316510.16942@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: slightly confused about .bbappend file and FILESPATH
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
X-List-Received-Date: Mon, 10 Dec 2012 23:18:11 -0000
X-Groupsio-MsgNum: 32476
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 06, 2012 at 01:19:57PM -0500, Robert P. J. Day wrote:
> On Thu, 6 Dec 2012, Mark Hatle wrote:
>=20
> > On 12/6/12 12:03 PM, Robert P. J. Day wrote:
> > >
> > >    currently writing a tutorial page on how .bbappend files and
> > > FILESPATH work, and i wanted to use a live example, but now i'm
> > > confused.
> >
> > The way it works is the same way as PATH in the shell.  It's just a set=
 of
> > search paths.
> >
> > >    using meta-ti layer, i chose to build core-image-minimal for a
> > > beagleboard, for which the meta-ti layer has the following under
> > > recipes-core/netbase/ that i want to use as an example:
> > >
> > > $ find
> > > .
> > > ./netbase_5.0.bbappend
> > > ./netbase-5.0
> > > ./netbase-5.0/beagleboard
> > > ./netbase-5.0/beagleboard/interfaces
> > > $
> > >
> > > where the .bbappend file contains only:
> > >
> > > THISDIR :=3D "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> >
> > I believe this is the default value of 'THISDIR' already, so there is no
> > reason to specify it in the .bbappend itself.
> >
> > > FILESPATH =3D. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> >
> > In this example, it's incorrect.  As you have a directory named
> > "netbase-5.0", so your FILESPATH should be: ${THISDIR}/${PN}-${PV}
>=20
>   ok, so that's just a bug in the setting of FILESPATH in that one
> example?  whew.  i was seriously wondering how badly i misunderstood
> how this feature worked.
>=20
>   as soon as my beagle core-image-minimal finishes building, i should
> be able to trivially check that the interfaces file used to populate
> the rootfs image is the one from oe-core and not the one that should
> have come from meta-ti.

See FILESEXTRAPATHS in other bbappends and

meta/classes/base.bbclass:FILESPATH =3D "${@base_set_filespath(["${FILE_DIR=
NAME}/${BP}","${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"

+ definition of fce base_set_filespath:
meta/classes/utils.bbclass:def base_set_filespath(path, d):

Cheers,

>=20
>   thanks.
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDGalkACgkQN1Ujt2V2gBxU0gCdEEZ8KNraNzWGy9lH/47+3HSZ
nzUAnAjza7dd9tsmZO23h2LoXPhmwCUl
=umva
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
