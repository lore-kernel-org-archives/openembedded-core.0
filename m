Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 533986DF6E;
	Thu,  5 Dec 2013 11:33:53 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so11136515ead.22
	for <multiple recipients>; Thu, 05 Dec 2013 03:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lHThadZsqxgObICczBw4P2IpWj3ks2bWosrRc7dSR6Y=;
	b=hbrgeTPA1VZxnJkHMAx2UX01enuFfPA6q8siWMwLxahysijgDeO6acPKI/ATLxRY8O
	6zJw3cWytumOPlzTMLF9MvIgWU/R2xr0Ym2kH4SjG0AsWFGJEuVoolWqIIXDkZTcV3F6
	FLo/wNe9fRZuvkylDok3lFTNf57n3d9ODRll/7QX3SoM3bpFDmkuQQkv20FmYTuqXnXc
	E0bu2jitJzF283fO/YF9l/KxAHV96HoixTKcnK3EA11WPkOONmU6+bzi/CWBbyvILSip
	luVWTzcgzkHXuXllPKr9XcQf7NIzpGevevsNJxFfvP5GT9NTQmrGiCyBZAE6U6eo9YSu
	XLVA==
X-Received: by 10.15.83.8 with SMTP id b8mr76017951eez.6.1386243232365;
	Thu, 05 Dec 2013 03:33:52 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e3sm67913338eeg.11.2013.12.05.03.33.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 03:33:51 -0800 (PST)
Date: Thu, 5 Dec 2013 12:34:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131205113403.GC3724@jama>
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
	<1386238202.25847.14.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1386238202.25847.14.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][PATCH] cmake: respect ${S} and ${B}
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
X-List-Received-Date: Thu, 05 Dec 2013 11:33:55 -0000
X-Groupsio-MsgNum: 47929
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline

--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2013 at 10:10:02AM +0000, Richard Purdie wrote:
> On Thu, 2013-12-05 at 00:38 +0000, Ross Burton wrote:
> > Hi,
> >=20
> > This is a Request For Comments because it changes behaviour of the cmak=
e class
> > and I'm not entirely knowledgeable in cmake.
> >=20
> > For some reason, cmake.bbclass doesn't use ${S} and ${B}, but instead h=
as it's
> > own variables OECMAKE_SOURCEPATH ("." by default) and OECMAKE_BUILDPATH=
 ("" by
> > default).  Those defaults meant that the build happened in the source d=
irectory,
> > which conveniently was ${S}.  Unless ${B} was also set, in which case i=
t all
> > broke.
> >=20
> > I don't see a good reason for cmake.bbclass having it's own special ver=
sions of
> > ${S} and ${B}, so this patch drops them and replicates some of the logi=
c in
> > autotools.bbclass: specifically the part where if ${S} and ${B} are dif=
ferent,
> > delete ${B} before building.  This ensures that switching machine doesn=
't re-use
> > the same build directory, which was the cause of me going back to look =
at this
> > (libproxy trying to use the nuc sysroot when I'm building for qemux86-6=
4).
> >=20
> > Some open questions:
> >=20
> > 1) As I understand it cmake has more reliable support for out-of-tree b=
uilds
> > than autotools.  If this is the case should cmake.bbclass set B ?=3D
> > "${WORKDIR}/build", or leave setting of B to separatebuilddir.inc?  Are=
 there
> > known recipes using cmake that fail with out-of-tree builds?
>=20
> separatebuilddir.inc was really a stopgap solution to see how widespread
> potential issues were. Ideally I'd like to get to the point where
> recipes flag themselves are broken with out of tree builds rather than
> having a list of ones which are compatible.
>=20
> Doing this for OE-Core is straightforward now but what about meta-oe?
>=20
> Would there be interest in trying to change that default or is it going
> to be too painful?

It would be nice to change it in smaller steps, e.g. by bbclasses.

I'm already using separate B by default in meta-qt5 and it works good.

Adding it in cmake, qmake4, then autotools.bbclass, then ... would allow
to fix meta-oe recipes in smaller chunks instead of trying to fix them
all at once. And if we change it only for few .bbclasses then it would
still be improvement.

> This means I'm in favour of changing the cmake default if we can, it
> looks like a simpler problem space than autotools.bbclass

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKgZKsACgkQN1Ujt2V2gBzvdQCgnhRw5VbAv4u6/tzbX+O5wilG
zocAn3JdyXkAS2FEiIH957SE6/Nq6+m2
=UtZG
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
