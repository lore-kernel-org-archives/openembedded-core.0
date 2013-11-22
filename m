Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id B6A406CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 11:38:28 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so374525eek.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 03:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PXaE6V++z/iAmfHh3cLqJSmL8bfJUK10lDx12czR9SU=;
	b=HX2QgXbJd0z9Z2Zp25jFpOZBvdQfi971IwtOe1W/V0qwjgHwl11pSj4tQKyfOOwOp+
	gCYUE1NLfKov+C2On/BIQ154tcQhVEIwhejN6nrGqtGKXwjtWnxxokSRPW3PxhtvYqp9
	YuBQCTYnkRLf5y17KUC6slfH1gYHQtSmxHV0XUH0/N7LExNiDYwRaVYO9w8ceZm6I/0d
	p7gz24+Q6tcNsh3b1nzkfkHYHaEKbj43ZYhsoIobLFhpCzduLpFC8TqAFhYrnb2/MLlU
	pNU8A2Flrhu76T4PQISizj22S4oWEVI19JZce4SzQwOiLNbIXSyy2CCvq/6yQn9j41kC
	GIrg==
X-Received: by 10.15.94.201 with SMTP id bb49mr16310876eeb.23.1385120307496;
	Fri, 22 Nov 2013 03:38:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a45sm60320584eem.6.2013.11.22.03.38.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Nov 2013 03:38:26 -0800 (PST)
Date: Fri, 22 Nov 2013 12:38:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20131122113832.GC3708@jama>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
	<8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: depends on virtual/kernel
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
X-List-Received-Date: Fri, 22 Nov 2013 11:38:29 -0000
X-Groupsio-MsgNum: 47501
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y1+kC1Q2udlVMFpc"
Content-Disposition: inline

--y1+kC1Q2udlVMFpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2013 at 01:39:02PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
> can get built by default. Otherwise, the kernel will not get built
> unless it's required by other packages like v86d. As a result, if
> we build 'core-image-minimal' for qemumips, the kernel is not built,
> and we have 'bitbake linux-yocto' before we can use runqemu to start
> the target.

Even when it's not really build time requirement for images I understand
the scenario above and this seems like better place than packagegroup
where it was before.

My only concern is small initramfs images like
meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb:inherit image

which could in turn be DEPENDS of real virtual/kernel causing circular
dependency.

>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index bc60f0d..ccb6bf3 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -10,7 +10,7 @@ inherit gzipnative
> =20
>  LICENSE =3D "MIT"
>  PACKAGES =3D ""
> -DEPENDS +=3D "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cros=
s"
> +DEPENDS +=3D "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cros=
s virtual/kernel"
>  RDEPENDS +=3D "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
>  RRECOMMENDS +=3D "${PACKAGE_INSTALL_ATTEMPTONLY}"
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y1+kC1Q2udlVMFpc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKPQjgACgkQN1Ujt2V2gBz74QCffAomq3NKWVEin+HPrSIKTbfG
/UcAn0NqiYTFVc+LtL1l7ZL9Nth3QSbw
=HaAn
-----END PGP SIGNATURE-----

--y1+kC1Q2udlVMFpc--
