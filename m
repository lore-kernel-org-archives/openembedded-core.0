Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UDLbU-0003G8-4c; Wed, 06 Mar 2013 22:10:29 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so6535778pbb.27
	for <multiple recipients>; Wed, 06 Mar 2013 12:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GCmnczbjZwUauNgVZT6cUcjXaeS5KznoIVgRscLMkJ8=;
	b=IIcqBY1pxWqCYPCtorOUrRLoK3VEAUIXQhvDwrFFJzzh9eMsAR5Kxhn98v/e3zO4OF
	1iXR8iii1L/W8Nfz/VjW1BFpALHOHi5X5eS7ATPKWsBHB/Vnb6p5K4TbcIZ6XzoAWCFs
	hxDGncAUFjGdt4JJelr+T2wXWOdtGHUMStc5p7KFUVG5sLNKQkvmoQBOlo35yL2B8HzW
	CXMebuQQwlCycCGd0mmANUz7L/Kq5a7+jy8NnApEt7TwUduwxot3E4sZlI1dN4YWE3CX
	hknYgTRZcrpyt/s/w+1/lk1jXSerRas4+Weak+MLoaBGBR8QEHCQk1bN38W9kS0PTB8d
	xfwg==
X-Received: by 10.68.134.100 with SMTP id pj4mr48964140pbb.12.1362603226516;
	Wed, 06 Mar 2013 12:53:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ub1sm32788654pbc.5.2013.03.06.12.53.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 12:53:45 -0800 (PST)
Date: Wed, 6 Mar 2013 21:53:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130306205339.GF32228@jama.dyndns-home.com>
References: <20130305131417.4F97A50394@opal>
MIME-Version: 1.0
In-Reply-To: <20130305131417.4F97A50394@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Missing gst-plugins-good package Was: [oe-commits] Richard Purdie : recipes: Fix ALLOW_EMPTY with no package specified
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
X-List-Received-Date: Wed, 06 Mar 2013 21:10:31 -0000
X-Groupsio-MsgNum: 36295
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
Content-Disposition: inline

--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 01:14:17PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: fe81bd4f600877e63433184cfc2e22c33bb77db6
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dfe81bd4f600877e63433184cfc2e22c33bb77db6
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sun Mar  3 15:54:29 2013 +0000
>=20
> recipes: Fix ALLOW_EMPTY with no package specified
>=20
> There are various usages of ALLOW_EMPTY with no packages specified. This
> is not recommended syntax, nor is it likely to be supported in the future.
> This patch improves the references in OE-Core, either removing them if th=
ey're
> pointless (e.g. when PACKAGES=3D"") or specifying which package it applie=
s to.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> @@ -24,8 +24,6 @@ python populate_packages_prepend () {
>      d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
>  }
> =20
> -ALLOW_EMPTY =3D "1"
> -
>  PACKAGES +=3D "${PN}-apps ${PN}-meta ${PN}-glib"
>  FILES_${PN}-apps =3D "${bindir}"

This change is correct ('ALLOW_EMPTY_' + metapkg is set few lines above).

Just wanted to warn others that I've found few examples in other layers
which were RDEPENDing also on ${PN} not metapkg and after this cleanup
some packages were failing to install in rootfs.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE3rNMACgkQN1Ujt2V2gBxK/QCgn3bvfs4UI/q0tXHVwVveMakD
vbQAoJnT6GYe5SZOQx6Gx0Bc94EfIO/F
=rKnJ
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
