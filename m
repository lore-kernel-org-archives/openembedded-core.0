Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id CC3C765CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 13:14:43 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id gl10so4452915lab.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wbsmzIgTVneKxqcGuEww1ttlwVYcc6wrRsrh+rooOXk=;
	b=SYGw//EgHTpjNz1Pik8UHU9LOAdpiWj8iiHpU/hU05Rj9T/YFvZiO48YNB0YC/4Igv
	Lg4mVtdCIoDSjsVvKcgErFH583fmkUkGxJssC7D54Hnsndf5eLorxfpxmSohrmmMx4GM
	C5mZZZu9fLIDOuQMXPIC3q+YdHbp8jm8t8LnBqLOc/Px+JBgnohiNsDR0cDTwOFuR65/
	OoYjTmJ/l6RG8ZJem6NT2Zp3WR2mu6Pqz51olXjd7/pN7Ez1v8ZDXpttonLNE1rbSK5Y
	0LWopXTNUKBfdAAkYS2I92W5e78y8J85S/CNdeTtHuLSlPR8p8lXNP0U8mNX2WxXjCz8
	hm3w==
X-Received: by 10.152.87.82 with SMTP id v18mr29468269laz.17.1408367684365;
	Mon, 18 Aug 2014 06:14:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x1sm10525868lae.43.2014.08.18.06.14.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Aug 2014 06:14:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Aug 2014 15:14:43 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140818131443.GL3660@jama>
References: <1408366010.1669.11.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1408366010.1669.11.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Allarch and packagegroup improvement proposal
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
X-List-Received-Date: Mon, 18 Aug 2014 13:14:46 -0000
X-Groupsio-MsgNum: 56690
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+2GlJm56SCtLHYlr"
Content-Disposition: inline

--+2GlJm56SCtLHYlr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2014 at 01:46:50PM +0100, Richard Purdie wrote:
> As some people are already painfully aware, the current way packagegroup
> and allarch interact with the sstate signatures is painful.
>=20
> Some example problem cases:
>=20
> * An allarch package of scripts with an interpretor dependency (e.g perl)
>=20
> * A packagegroup with dependencies on something which is debian renamed=
=20
>   e.g. build-essentials on libgmp=20
>=20
>=20
> Currently, packagegroups default to allarch and have their sstate
> dependencies truncated. This means that when something like gmp
> rebuilds, it can change package name thanks to debian renaming but the
> packagegroup referencing the old name remains, causing image creation
> failures.
>=20
> So the "obvious" fix is to stop truncating the dependencies? Well, that
> means that the allarch package is written out every time machine changes
> to a different arch.
>=20
> So we need to make packagegroups PACKAGE_ARCH specific? Well, this still
> doesn't solve the problem of allarch packages having ever greater
> problems with things like dependencies on perl.

Well then maybe that allarch package with perl dependency shouldn't be
marked as allarch.

> An alternative solution I'm wondering about to address both issues is:
>=20
> * the sstatesig packagegroup code for dependencies handling should only
> trigger for allarch=20
> * we add a sanity test that checks if renaming has happened for
> packagegroup dependencies and warn if it has.
>=20
> The trouble is the sstatesig code doesn't have the full data store, only
> a limited cross section so it can't check if PACKAGE_ARCH =3D=3D all, only
> if the class is inherited. We therefore probably need to change
> packagegroup to do conditional class inclusion (which is possible with
> the modern code base at least). The use of the class can be tested from
> the sstatesig code and hence indicate allarch.
>=20
>=20
> For the second part, we could add something like:
>=20
> +    if bb.data.inherits_class('packagegroup', d) and bb.data.inherits_cl=
ass('allarch', d):   =20
> +        if set(deps) !=3D set(new_depends):
> +            bb.warn("allarch packagegroup %s has renamed dependency %s" =
% (pkg, str(set(deps) ^ set(new_depends))))=20
>=20
> to runtime_mapping_rename in package.bbclass which tells us which
> packagegroups need to move to be PACKAGE_ARCH. Unfortunately, a quick
> run of OE-Core shows:
>=20
> WARNING: allarch packagegroup packagegroup-core-sdk has renamed dependenc=
y set(['libgomp', 'libgomp1'])
> WARNING: allarch packagegroup packagegroup-core-x11-base has renamed depe=
ndency set(['dbus-1', 'dbus'])
> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target has=
 renamed dependency set(['libgcc1', 'libgcc-s-dev', 'libstdc++', 'libc6-dev=
', 'libgcc-dev', 'libgcc', 'libc6', 'eglibc-dbg', 'libc6-dbg', 'eglibc-dev'=
, 'eglibc-thread-db', 'eglibc', 'libthread-db1', 'libstdc++6'])
> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dbg=
 has renamed dependency set(['libgcc-s-dbg', 'eglibc-dbg', 'libc6-dbg', 'li=
bgcc-dbg'])
> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dev=
 has renamed dependency set(['libgcc-s-dev', 'libc6-dev', 'libgcc-dev', 'eg=
libc-dev'])
> WARNING: allarch packagegroup packagegroup-core-x11-sato-base has renamed=
 dependency set(['libsdl-1.2-0', 'libsdl'])
> WARNING: allarch packagegroup packagegroup-core-x11-sato-base-dbg has ren=
amed dependency set(['libsdl-dbg', 'libsdl-1.2-dbg'])
> WARNING: allarch packagegroup packagegroup-core-x11-sato-base-dev has ren=
amed dependency set(['libsdl-dev', 'libsdl-1.2-dev'])
> WARNING: allarch packagegroup packagegroup-core-sdk has renamed dependenc=
y set(['libgomp', 'libgomp1'])
> WARNING: allarch packagegroup packagegroup-core-x11-base has renamed depe=
ndency set(['dbus-1', 'dbus'])
> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target has=
 renamed dependency set(['libgcc1', 'libgcc-s-dev', 'libstdc++', 'libc6-dev=
', 'libgcc-dev', 'libgcc', 'libc6', 'eglibc-dbg', 'libc6-dbg', 'eglibc-dev'=
, 'eglibc-thread-db', 'eglibc', 'libthread-db1', 'libstdc++6'])
> WARNING: allarch packagegroup packagegroup-core-x11-sato-base has renamed=
 dependency set(['libsdl-1.2-0', 'libsdl'])
> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dbg=
 has renamed dependency set(['libgcc-s-dbg', 'eglibc-dbg', 'libc6-dbg', 'li=
bgcc-dbg'])
> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dev=
 has renamed dependency set(['libgcc-s-dev', 'libc6-dev', 'libgcc-dev', 'eg=
libc-dev'])
> WARNING: allarch packagegroup packagegroup-core-buildessential has rename=
d dependency set(['libstdc++', 'libstdc++6'])
> WARNING: allarch packagegroup packagegroup-core-buildessential has rename=
d dependency set(['libstdc++', 'libstdc++6'])
>=20
> so we do have the problem in a number of places.
>=20
> Does anyone have any thoughts?

I'm in favor of removing default allarch and setting correct
PACKAGE_ARCH manually in the packagegroup recipes like we do elsewhere.

packagegroups are small and "rebuilt" quickly, so I don't mind
"building" them once per TUNE_PKGARCH or even once per MACHINE_ARCH like
we do for couple of them already.

I can even find few changes from me on ML which do exactly that.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+2GlJm56SCtLHYlr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPx/EMACgkQN1Ujt2V2gBwvewCfcufL31siUCo4ivmQT4aunuhz
hB0AnRFOGxQ7nG8x9w0ATXypevUJgvRc
=RCdX
-----END PGP SIGNATURE-----

--+2GlJm56SCtLHYlr--
