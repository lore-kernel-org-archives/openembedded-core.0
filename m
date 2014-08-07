Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EAC8361FE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 17:35:02 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so4475492wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fHKoUUEUsMjsTZMoDeXFsBJhoNxZNnMeol7zB+hPyNw=;
	b=XkwKO0gpL01jEsrX//ueKP+ntDpDwmCXGwFZzFT+20RgDROtrrrar5aucUrE0xYRSJ
	jfBQpa+oZEXRPt3vaJB6hGIqqeXlJp0Qk/cwpXI2VQw602aBDI0w2ROZq4y+ZG1LRhnu
	9piJuFXE6p7T5EU8OywpSkheraDG6mh3E9Uk27SJ++Vmp8ku4oThXgrLSDOWUy8zOXjJ
	UkWAzEtQhC2Dc6djQJRkDHvq5hZkh8qdbCgTuot83wYzegMbVykXcY4bZqpyhlg6HEqI
	ou4Bc1WwFKoUd9svyYaagJym3a1P4bPDXiWQWWLE0DsnPDmh7T5x2+I+dOgfVeX9cFvO
	XU7g==
X-Received: by 10.194.92.196 with SMTP id co4mr26401029wjb.4.1407432903092;
	Thu, 07 Aug 2014 10:35:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hp6sm1559059wib.23.2014.08.07.10.35.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 10:35:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Aug 2014 19:35:32 +0200
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20140807173532.GX14848@jama>
References: <1407357515-6147-1-git-send-email-paul.gortmaker@windriver.com>
	<167343D1-FE42-441A-B126-F189C129EF2B@dominion.thruhere.net>
	<53E383AA.9010202@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53E383AA.9010202@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: drop patch that unconditionally mangles manpages
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
X-List-Received-Date: Thu, 07 Aug 2014 17:35:03 -0000
X-Groupsio-MsgNum: 56116
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l4GQ7sizse6iPvDe"
Content-Disposition: inline

--l4GQ7sizse6iPvDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 09:48:26AM -0400, Paul Gortmaker wrote:
> On 14-08-07 01:33 AM, Koen Kooi wrote:
> >=20
> > Op 6 aug. 2014, om 22:38 heeft Paul Gortmaker <paul.gortmaker@windriver=
=2Ecom> het volgende geschreven:
> >=20
> >> commit 841ec528ec04e64bd09ff10f8d9ad2d6e3aac05d ("coreutils: update
> >> to upstream version 9.21") added a patch which bypassed the check
> >> for perl and hence defaults to using the dummy man page for all
> >> of the coreutils manpages.  This results in all manpages looking like:
> >>
> >>  NAME
> >>       chmod - a GNU coreutils 8.22 program
> >>
> >>  DESCRIPTION
> >>       OOOPS!   Due to the lack of perl on the build system, we were un=
able to
> >>       create a proper manual page for chmod.
> >>
> >> It is unclear why the test was disabled, but since it clearly
> >> causes the manpages to be useless, we need to drop this patch.
> >=20
> > That all might be true, but DEPENDS doesn't list 'perl' or 'perl-native=
', so this commit is wrong.
>=20
> Wrong might be overstated.  The patch unconditionally disables a
> _check_ for perl.  So if perl is there, it is used; if it is absent,
> it is not.  Given that there really is no excuse for shipping
> broken manpages, one could argue that a DEPENDS on perl-native
> is sensible, and if that is what it takes to get the broken patch
> dropped, I'll add one.

undeterministic build results mean it's broken

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l4GQ7sizse6iPvDe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPjuOQACgkQN1Ujt2V2gBxvsQCfaRq0c6AuckM152adgii6oRKp
w20AoIdBFfzwrRaHkej+z4TWaJXMHr9k
=8G79
-----END PGP SIGNATURE-----

--l4GQ7sizse6iPvDe--
