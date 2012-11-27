Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdNVk-0003VF-2N
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 16:55:48 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6800137eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 07:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=jkCiie3qMAiOYE96jbBQvAXzFWWeKRFhyX/0qXtbMIE=;
	b=ZYppHJoHM2pd6hdQRQgEmzkD/LPv4bo9pa9U1ji4yHOpTCmnHN2dbOv/jIdScF++UY
	gtUAc4Ab9pAUHL4CRVUbZT1cwIhX06szqYcWlhFmMr0gHoGznSg/HxeGYlDuFRqQBgH/
	VcjpLfxzaQTVHlYSV8ROC6LkVjX316uvokuAAjho6YtijzFL0hbC8M03LcTtPA5qkc4O
	zNPVk/VjQK8D2Xnw5/npht5jwIvL8kXiat4yG1x5EOub/Obp59/wHcZ49/GEk8lvN1XS
	fhLO8NKxoFLPOxfhSeqAe2paaHheCev10KE9+s/vi70wj+0TNi08sBHVsSZjtM6kWRF+
	4aOQ==
Received: by 10.14.3.195 with SMTP id 43mr59113098eeh.36.1354030894942;
	Tue, 27 Nov 2012 07:41:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm41349930eeg.4.2012.11.27.07.41.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 07:41:34 -0800 (PST)
Date: Tue, 27 Nov 2012 16:41:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121127154129.GC3692@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: RDEPENDS of packages created by PACKAGES_DYNAMIC not built before image rootfs
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
X-List-Received-Date: Tue, 27 Nov 2012 15:55:49 -0000
X-Groupsio-MsgNum: 31797
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline

--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

pulseaudio has
RDEPENDS_pulseaudio-module-console-kit =3D+ "consolekit"

and pulseaudio-module-console-kit is dynamic package
PACKAGES_DYNAMIC +=3D "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib=
=2E* ^libpulse-module.* "

If you have image where consolekit is pulled to image only by=20
pulseaudio-module-console-kit (e.g. through pulseaudio-server).=20
Then consolekit is not built before image do_rootfs is executed and do_root=
fs fails.

Easy way to reproduce this is to build e.g. core-image-minimal with=20
pulseaudio-module-console-kit or pulseaudio-server added to IMAGE_INSTALL.=
=20
Will fail with:
  * satisfy_dependencies_for: Cannot satisfy the following dependencies for=
 pulseaudio-server:
  *    consolekit *
  * opkg_install_cmd: Cannot install package pulseaudio-server.


Not sure what's proper fix, bitbake probably just checks that right provide=
r for=20
pulseaudio-module-console-kit is pulseaudio because of PACKAGES_DYNAMIC, bu=
t does not check=20
RDEPENDS_pulseaudio-module-console-kit after that.

We can add consolekit to build time deps like it was before, but that's jus=
t=20
work around and not correct fix.

Also filled as
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3498

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC03ykACgkQN1Ujt2V2gBw4cgCgrHgl6FY38Zp+QWfRkVl7oE+T
PBkAn05ReunaRrGsl4BFHYHxPBYMRiHZ
=Lz/S
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
