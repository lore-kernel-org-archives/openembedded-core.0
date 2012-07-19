Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrjQd-0004GA-TG
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 07:37:35 +0200
Received: by weyr6 with SMTP id r6so1398396wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XhHEN0OpEM1mYbnXLx6pHoYbytIzQWut0eMCXYeRRXg=;
	b=HgXqcsHrGC525IrTy6KBRe/JCsHhU7Z7O0L6a8pmuedLBuCFpo+P9Iyx2jZHKXbE3V
	UdOhqxdalSnGKqcVbK0d8WJMZ1+Cv5yS6WCwWBZgVLLtpqLy68H3i8ED/U1JzM+jJ3ok
	YsH2b3bD53eWywjmZi0RxfXlC5tcybkKCoNKxtRd4UtXbvn/y8k9ZLExT7CE1R/zWyYw
	1ZmDUOfKu2BG7MzoC2/6ySOqwqoK5rtw4/rQJCAFgX7m/LsObLDYRmU2J2NJxipKhgPI
	CAjt/kXcJclMvR2Vg9AvYBitnUV0oomiZ3Cu0qgkIzElxM2MVB0VkmN/lC5dYKjfmQZw
	7HpA==
Received: by 10.180.107.2 with SMTP id gy2mr12752418wib.2.1342675574414;
	Wed, 18 Jul 2012 22:26:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm36573994wiv.11.2012.07.18.22.26.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 22:26:13 -0700 (PDT)
Date: Thu, 19 Jul 2012 07:26:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120719052624.GB3331@jama.jama.net>
References: <007BD92917A2324FA403BCF9A464CF841FF701EF@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF841FF701EF@ALA-MBB.corp.ad.wrs.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: modifying inittab (for example)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 05:37:36 -0000
X-Groupsio-MsgNum: 25682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 11:29:43PM +0000, Slater, Joseph wrote:
> Suppose we want to boot to different runlevels for different images.  We =
could modify the default inittab
> to reflect that.  We could modify it in various ways, but I don't think t=
he exact mechanism much matters.
>=20
> What is an interesting question is WHEN we modify it.
>=20
> One way would be to  have a small piece of code and invoke it during imag=
e creation using
> something like
>=20
> ROOTFS_POSTPROCESS_COMMAND +=3D "sato_image_pp ; "
>=20
> in our sato-image.bb recipe.  This doesn't require creating any new featu=
res.

This doesn't work very well for images with package management, when user=
=20
upgrades installed packages, he can get new sysvinit-inittab which will
reset runlevel in all types of images to same value.

> But, we could also do it when we build sysvinit-inittab.  I think, if we =
did that, we would need a feature,
> probably a DISTRO_FEATURE, that was set in some conf file.

This doesn't work too, if you have just one sysvinit-inittab recipe then
it's used for all images -> so again same runlevel in all.

> Is there a preference for one way or the other?

You can create different inittab recipes for each runlevel you want and
then make sure that only right inittab package is pulled to each image.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAHmoAACgkQN1Ujt2V2gBzP5QCfTdOvpHOpnito4aufZc+T6Voj
O6gAn3EgdWRInMz0KJ9lHeT4zkOphd4u
=Y3JZ
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
