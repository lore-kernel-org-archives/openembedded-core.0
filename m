Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id CC48060043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 07:56:40 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so93146959wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 00:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XWrSZufX1I2GnSda5in3nsQZM9jExfFkO94Yv50FLf0=;
	b=EoFiXIhkYDaBx8mbZcr04ZzNILnMxyQL2zc0dnNNUCThvqSwcepcEOGoII3GK1vOEQ
	WubIpl1mp2NZXi5VIJocA2pZTTM1ZKJkF6f67z/qeJCGDxrzrrUq1BYDSLcpI/MftwPL
	AwqSHltlkQHgJRqsK24Vgq5GUbyxitoXmjCGiGkGfNynqadg2aDUQP44fE4Y3Fiax4il
	V7VmDs+J2icgokE0vpolvUkXQ1ird/1TjtoVaxUaHzJLjr4/aqi5eQtGCqVoQL7CvsKB
	11YyIOYE+kY+B5zzVOAMep6ndAEfl8TmLECf0eV3NeqCOTg8OeoY26dUl72GmOm7jnUv
	dOvA==
X-Received: by 10.194.86.161 with SMTP id q1mr10839720wjz.18.1439884600110;
	Tue, 18 Aug 2015 00:56:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	uo6sm25246792wjc.1.2015.08.18.00.56.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 00:56:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 09:56:43 +0200
To: "Belal, Awais" <Awais_Belal@mentor.com>
Message-ID: <20150818075643.GB2458@jama>
References: <2021B186DC632746BD5A3CE32F12BD28FAB93191@EU-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28FAB93191@EU-MBX-03.mgc.mentorg.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issue with debian packaging - packagegroup-core-x11
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
X-List-Received-Date: Tue, 18 Aug 2015 07:56:44 -0000
X-Groupsio-MsgNum: 69552
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2015 at 02:08:48PM +0000, Belal, Awais wrote:
> Hi guys,
>=20
> I have run into a do_rootfs failure which is only evident when debian pac=
kaging is used. The issue roots up due to incompatibility of xserver-nodm-i=
nit between oe-core and meta-oe. I see that it has been discussed quite a f=
ew times. It also seems that debian packaging (apt-get I believe) is unable=
 to handle the package dependencies accurately in this case. The dependency=
 chain (when both oe-core and meta-oe are used) is as follows:
>=20
> packagegroup-core-x11-utils ---> x11-common
>                                                   \
>                                                    \--> xserver-nodm-init=
 --> xserver-common
>=20
> x11-common does not get installed because xserver-common conflicts and re=
places it. But then installation of packagegroup-core-x11-utils fails becau=
se it does not see x11-common installed. This failure, as said earlier, is =
only visible with debian packaging hence I believe it is either a bug in pa=
ckaging or it simply does not support such a case. I tested this more gener=
ically by creating two empty packages 'a' and 'b', where 'b' RCONFLICTS and=
 RREPLACES 'a'. If I add both these packages to my image's RDEPENDS the do_=
rootfs fails with same error. I am not very familiar with debian packaging =
hence I cannot comment whether this is a fault from package manager or the =
recipe (xserver-common) so I though it best to ask here.
> Doing an RPROVIDES_${PN} =3D "x11-common" in xserver-common fixes the iss=
ue but fires up:
> NOTE: multiple providers are available for runtime x11-common (x11-common=
, xserver-common)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match x11-common
>=20
> Any pointers will be highly appreciated!

Set VIRTUAL-RUNTIME_xserver_common =3D "xserver-common" in your DISTRO.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXS5ToACgkQN1Ujt2V2gBwZ8wCfWAPZUtvIO6oo6bk7k7cKndPd
tIYAn0fXzH5yaPfT5QvGeFQ0MZENc+br
=bvxF
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
