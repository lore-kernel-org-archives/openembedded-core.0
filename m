Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7C26D12D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:58:22 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so2533581eak.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y2EqZCySyRr8SAfcDRV5UqLABN5+cVQ4rQY1egl+SH0=;
	b=xTIqJTvzXNaE5Fcnjk647shc931Qhcgd4eZvJpBZIZZ9/RNDk9WNetzTIyfuDFOvBm
	/rZxdcLaSUw6bjuNLsWVtCsA8WHnQJsEWCNm6aQ3y8jmto2gvoMPPEuLd8Q8z+XxmWpm
	Rq+LfPTEWTlvS+fPNS4GajVY+CxnK3aY6qRAakCtWokfDuUYSsx3BwHbWW644jIuML6O
	GiOEbYme0Nk3Yok8yrl0beucelwIHWBxM17j+tKIC1bO9LmKcEShB1mzThFNNO9jClmx
	PkgATVkGzPsxgsZuO4h1SgWZR9ScSJzeVZUz62r383h0W6x/lA3fhG/8ghbL8t9AmT0f
	D5CA==
X-Received: by 10.14.107.133 with SMTP id o5mr471834eeg.110.1384790303973;
	Mon, 18 Nov 2013 07:58:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm39116891eem.21.2013.11.18.07.58.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 07:58:23 -0800 (PST)
Date: Mon, 18 Nov 2013 16:58:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131118155824.GF3727@jama>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
	<1384777875.6460.228.camel@ted> <20131118155442.GE3727@jama>
MIME-Version: 1.0
In-Reply-To: <20131118155442.GE3727@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] allarch: Always inhibit default dependencies and set empty TARGET_PREFIX
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
X-List-Received-Date: Mon, 18 Nov 2013 15:58:23 -0000
X-Groupsio-MsgNum: 47230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline

--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 04:54:42PM +0100, Martin Jansa wrote:
> On Mon, Nov 18, 2013 at 12:31:15PM +0000, Richard Purdie wrote:
> > On Sun, 2013-11-17 at 14:52 +0100, Martin Jansa wrote:
> > > * typical case where we inherit allarch and override PACKAGE_ARCH
> > >   are packagegroup recipes, but those need default dependencies
> > >   inhibited even when they are MACHINE_ARCH or TUNE_PKGARCH.
> > >   I don't know about any recipe which inherits allarch and needs
> > >   default dependencies.
> >=20
> > The code there was added to allow the allarch class to be enabled or
> > disabled. I don't remember exactly why we needed to do that however it
> > was added for a reason and making part of it unconditional again will
> > probably break whyever we made it optional :(.
>=20
> I think that use case was MACHINE_ARCH packagegroups loosing -gnueabi
> suffix, so that everything except packagegroups (or other MACHINE_ARCH
> allarch recipes) was built in workdir:
> MACHINE-oe-linux-gnueabi
> and packagegroups in
> MACHINE-oe-linux
>=20
> I don't think we had the use case where we needed to conditionally keep
> default deps (but of course my memory isn't perfect and I can be wrong).
> =20
> > I can understand how you came to this conclusion though. Which cases is
> > this causing problems for?
> >=20
> > > * set empty TARGET_PREFIX
> > >   This has a bit weird reason caused by unsupported setup where
> > >   external-toolchain is used in some DISTRO only for some MACHINEs
> > >   and internal is used for other MACHINEs.
> > >   Because external-toolchain usually comes with different TARGET_PREF=
IX
> > >   it was causing allarch recipes to have different signatures even
> > >   when they don't use toolchain at all.
> > >   Empty TARGET_PREFIX also helps to find allarch recipes which still
> > >   have default dependency on e.g. virtual/${TARGET_PREFIX}gcc.
> >=20
> > This seems ok, I'd have taken it if it was a separate patch.
>=20
> It's related to above, because "thanks" to empty TARGET_PREFIX I've
> found few MACHINE_ARCH+allarch recipes in meta-webos which weren't using
> toolchain, but default deps had nonexistent "virtual/gcc".

Ah sorry this wasn't very accurate, I've found it with earlier version
of this patch which was unconditionally inhibiting default deps only for
packagegroup.bbclass not allarch.bbclass where it should be.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKKOSAACgkQN1Ujt2V2gByr2QCeKqoG5q5YFKJzUeLor7jZS4yP
D/0An0Vm4qToUQHrhTq4eTP8wqFy5yR8
=kxf9
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--
