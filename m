Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THfGn-0008Uk-7P
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 20:26:37 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so125496wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 11:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=oL3Ms9Y3baC3t+SFUeTC/YGg2vpBaFe8u3js14SojJI=;
	b=kyAGEl7cQd1x3jf8NR/vd9xx5wU0OzDKM18Uf/sg5eJiQGk3o6UbJhrgGeuo3m9VZ+
	BixgoQsqGtweHA4OSc843OekGBaWpKh9BbDjakZCdeSF/Qgi6kCgt07bJ+rrOJb+qm/I
	FbK1EvS6UW/4XKJ5NXr3MB3JTHXFWnPGUze+tGS5JI/74zGMWAnU8H9tXzW5xL75WKSp
	tKiQVlx3vCWugdCqxZ1dDL98k7T3/SENn7CCgjiYYWDDakQqci4M1+P30YlLkx5JEK9R
	/qzqCMA3DewTz+vl67M+zbDB9Bhk8dH8l/qQNuHu20+7FDTuKZHjswuUQiUthN8Hs+68
	7/lw==
Received: by 10.180.8.41 with SMTP id o9mr5396299wia.3.1348856015146;
	Fri, 28 Sep 2012 11:13:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm597594wiw.7.2012.09.28.11.13.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 11:13:33 -0700 (PDT)
Date: Fri, 28 Sep 2012 20:13:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120928181345.GC3049@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: nativesdk-libgcc-s1 is now nativesdk-libgcc1
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
X-List-Received-Date: Fri, 28 Sep 2012 18:26:37 -0000
X-Groupsio-MsgNum: 30121
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Just FYI:

I don't care about upgrade path for nativesdk packages, but building
meta-toolchain-gmae was still failing for me (now when nativesdk-perl
seems fixed). This time the problem was in do_rootfs, failing to find
nativesdk-libgcc-s1.

So if you notice the same issue, you can use something like:
tmp-eglibc/deploy/ipk $ for i in `find . -name Packages `; do echo $i; grep=
 nativesdk-libgcc-s1 -B 5 $i; done | grep ^Package
to see which recipes need -c cleansstate to pick nativesdk-libgcc1.

In my case:
Package: nativesdk-db
Package: nativesdk-elfutils-binutils
Package: nativesdk-elfutils
Package: nativesdk-libcrypto1.0.0
Package: nativesdk-libcurl5
Package: nativesdk-libgmpxx4
Package: nativesdk-libltdl7
Package: nativesdk-libpython2.7-1.0
Package: nativesdk-libsdl-1.2-0
Package: nativesdk-libssl1.0.0
Package: nativesdk-openssl-engines
Package: nativesdk-openssl
Package: nativesdk-unfs-server

or
tmp-eglibc/deploy/ipk $ for i in `find . -name Packages `; do echo $i; grep=
 nativesdk-libgcc-s1 -A 10 $i; done | grep ^OE: | sort -u | sed 's/OE: //g'=
 | xargs
nativesdk-db nativesdk-elfutils nativesdk-gmp nativesdk-openssl nativesdk-p=
ython nativesdk-unfs-server
to see oe names directly

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBl6NkACgkQN1Ujt2V2gBzYAACgpBhpmjov69N3zBOeGuy/XS/w
L5oAn37Y45svfSih4f7Qr8d3iQDqVI+M
=ZIyd
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
