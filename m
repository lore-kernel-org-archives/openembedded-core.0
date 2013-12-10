Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF1A6DB6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 14:32:16 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so2258383eek.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 06:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7IQUm1sUnB3A9Xb3iUHIjbfKjIBUhjBWVeP34viNSYs=;
	b=fXo8FBHgmDmQCcPHGnN9g1KfK/kU3NpuEKyBDV/V/FtZMdVuK8u2EfYY/jZbWRU/AG
	3e3e+y3sc2krBfKB10sA3l1qGAqhCeapus0aGTyflUoLcXAEhNMa63ArpPlqX9eccns3
	2dKCD/gJfyYNBRI6Em+voQ+bx2ccqWjMha69PVmOzPJO5Ub0+eYOWf3S9gkbE2B4kX/O
	/0W9TutviPfnUMXZskxAwKId/xjU04WWbkTiwcqrO/qlb560q37Nku4rOlYjFiNY9HZI
	VphPdR3UkROkkNMy0WXYIQzncLnjohGR0hSFQaMZk42s2BW1lhgkdeDll9M99lUF1jnC
	nBJw==
X-Received: by 10.14.114.71 with SMTP id b47mr18698670eeh.26.1386685935918;
	Tue, 10 Dec 2013 06:32:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o1sm41866550eea.10.2013.12.10.06.32.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 06:32:14 -0800 (PST)
Date: Tue, 10 Dec 2013 15:32:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20131210143234.GE3721@jama>
References: <52A6B861.30104@topic.nl>
MIME-Version: 1.0
In-Reply-To: <52A6B861.30104@topic.nl>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Figuring out why sstate-cache is no longer used for a package
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
X-List-Received-Date: Tue, 10 Dec 2013 14:32:17 -0000
X-Groupsio-MsgNum: 48067
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VuQYccsttdhdIfIP"
Content-Disposition: inline

--VuQYccsttdhdIfIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2013 at 07:44:49AM +0100, Mike Looijmans wrote:
> I've been struggling with this for a few days.
>=20
> We have a build server that build various images overnight. One of the=20
> packages in that image is "fpga-image", which takes more than an hour to =
build.
>=20
> We have been sharing the the build server's sstate-cache via HTTP and thi=
s has=20
> worked excellently up until yesterday.
>=20
> The current situation is that a client will grab everything from the=20
> buildserver's HTTP sstate-cache, potentially finishing a build from scrat=
ch in=20
> about five minutes. However, for some reason, the fpga-image does not fal=
l=20
> into this category, and eache machine insists on re-building it from scra=
tch.=20
> I've been trying to debug this, but the sstate-cache is on another machin=
e. I=20
> tried copying part of the build server's sstate-cache onto my machine, bu=
t=20
> that only results in "bitbake-diffsigs -t fpga-image .." yielding "ERROR:=
 No=20
> sigdata files found matching fpga-image .." so that apparently is a dead =
end.
>=20
> How can I determine what is causing the system to think that it needs to=
=20
> rebuild this package?

I use this script:
openembedded-core/scripts/sstate-diff-machines.sh

to create "backup" of sstate signatures and when some next build
unexpectedly doesn't reuse some sstate packages I use the script again
and compare new and old signatures to see why.

As bonus each build which populates out SSTATE_MIRROR also creates tarball
with these signatures, so I can easily download one tarball and compare
what and why won't be reused from sstate.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VuQYccsttdhdIfIP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKnJgIACgkQN1Ujt2V2gBwb2QCgmfx2Cod/CmnHe6RZ2v967cTr
NwMAoKiWC28n93JUIw2yDrcwzX9PCvCC
=e8o2
-----END PGP SIGNATURE-----

--VuQYccsttdhdIfIP--
