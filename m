Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U07vg-0005C1-Js
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 10:56:37 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so2241070wib.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=cnTEU/MbRVvrP5w1wpVdpFsmJp6ugzYDEGs13ZCPdP8=;
	b=podGNwqjIFyMNgmsRUZHqP2akNbxizQfud1K+jg4UsnlJEGdhqIJ8bzdXyJFN/fcoM
	9EGf13N1YsxhD6RkzrlK+B48o/y9ZyuLxsCIn5OA11UgomKiDid4qJwnIUyMnZrpH9HE
	Ck8qq2yxorH8ceRCXpSbvbfPMtEGlwjOr0rSbGmKXAp8x9joGWZYIHIbcnR7hsjc4y4T
	EU/u1KC7xam1t4WMuXxSk7sdHJ68DQPgZoJn4V+StZ38xTCWCnQ+pYgberLU6DBlbrq/
	UKWzfhNjG08ugNdmXeDqDdBUD3BqDPf8pGeC9mcsPPesbzNn9Pe/MAxWLDAJX+hathSz
	QRGw==
X-Received: by 10.180.78.137 with SMTP id b9mr1172690wix.30.1359452455755;
	Tue, 29 Jan 2013 01:40:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t17sm2488977wiv.6.2013.01.29.01.40.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 01:40:54 -0800 (PST)
Date: Tue, 29 Jan 2013 10:40:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20130129094059.GI16904@jama.palm1.palmone.com>
References: <51079663.60504@topic.nl>
MIME-Version: 1.0
In-Reply-To: <51079663.60504@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Multiple MACHINE building is broken in OE-core?
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
X-List-Received-Date: Tue, 29 Jan 2013 09:56:41 -0000
X-Groupsio-MsgNum: 34617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wwX5Nmi7feudBrEr"
Content-Disposition: inline

--wwX5Nmi7feudBrEr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 10:29:07AM +0100, Mike Looijmans wrote:
> I often have several hardware boards sharing 99% of periferals and=20
> configuration. Usually they all have the exact same CPU, and the=20
> difference is in the minor details like the screen resolution.
>=20
> In "classic" OE I was used to sharing the work, by just changing the=20
> MACHINE variable I could create an image for a slightly changed board in=
=20
> a matter of minutes.
>=20
> In OE-core this seems to be horribly broken, unless there's some other=20
> procedure to follow.
>=20
> If I change the MACHINE, it insists on rebuilding all kinds of packages=
=20
> that don't need rebuilding at all. Instead of minutes, it takes an hour=
=20
> to switch machines. And if I change back, the same thing happens all=20
> over again.
>=20
> In addition to needlessly rebuilding dozens of packages for the same=20
> architecture, it often "starts" halfway through, so it tries to run the=
=20
> "deploy" phase for a package while the workspace has already been=20
> removed in the rm_work phase of the previous build. Which fails, so I=20
> have to manually reset stamps for that package and let it start over=20
> again (while usually the package shouldn't be rebuilt in the first place).
>=20
> Is building for several machines no longer supported in OE-core? Or is=20
> there some secret way of setting up directories and variables that will=
=20
> make it work as it used to?

It's more strict and every machine now has own sysroot (so it's doing a
bit more after MACHINE change then it did with OE-Classic), but it still=20
works. I'm using it like this.

Use openembedded-core/scripts/sstate-diff-machines.sh to compare your
machines and make sure that different checksums are only for
MACHINE_ARCH recipes.

Cheer,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wwX5Nmi7feudBrEr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEHmSsACgkQN1Ujt2V2gBw6DgCeL2tv7UhMeEqHit0hy1zUcgcK
QWsAnAi+3N2Y4YulSA1HGODL6k8/TcvX
=lO5u
-----END PGP SIGNATURE-----

--wwX5Nmi7feudBrEr--
