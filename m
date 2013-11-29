Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id C9DFB6CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 15:38:56 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so6967541eaj.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 07:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8iY16RHNqIN/uKIQTQoKkiAjKtQaqei56K6W8CW8w4o=;
	b=rVx7YP3LHbDVNcPf6B5IXGDvOye2c62gagGl+UWJCTiHL2SHPPD4CEt6amwynKpUcL
	PvMhICtZYvNJnn9tJ7+qdRlwCrhJnVzg6AJ41/zNBGDwMzP58seodkQubW1MYQQT1S8k
	zTA2xlscp5ICUhMAlq7Lov+oO49tO2NW1JlbQ3vB0rQ9wHq1t6cdmK33d3h1n44sFebv
	HFp1pOxMN3UuNHs0pX1SdUth5v+nRrtCXMzQiHFUJJ8nRucKVTjpzvpNQt5YjJtaegbW
	8SpGTIXJ9+/hRHHl4vKo10gdJVbUmBmxLzXq5nu1BeKk7tTNGWxhXrMORzUemrNimVtT
	sAVA==
X-Received: by 10.14.122.196 with SMTP id t44mr1672571eeh.119.1385739535379;
	Fri, 29 Nov 2013 07:38:55 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm24729531eel.2.2013.11.29.07.38.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Nov 2013 07:38:54 -0800 (PST)
Date: Fri, 29 Nov 2013 16:38:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131129153856.GB2860@jama>
References: <1385735802.11222.62.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1385735802.11222.62.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Depend on virtual/kernel:do_deploy
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
X-List-Received-Date: Fri, 29 Nov 2013 15:38:57 -0000
X-Groupsio-MsgNum: 47760
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline

--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2013 at 02:36:42PM +0000, Richard Purdie wrote:
> Now that none of the packagegroups depend on virtual/kernel, we have the =
problem
> that MACHINE=3Dqemumips bitbake core-image-minimal doesn't put a kernel
> into the deploy directory. This breaks many common usecases and
> user expectations.
>=20
> To avoid this, add a dependency on the kernel deploy to image do_build ta=
sks.
> This should avoid any circular dependency issues but equally ensure users
> have their expectations met.

Acked-By: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 8217fb3..cc65e35 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -90,6 +90,8 @@ do_rootfs[depends] +=3D "makedevs-native:do_populate_sy=
sroot virtual/fakeroot-nati
>  do_rootfs[depends] +=3D "virtual/update-alternatives-native:do_populate_=
sysroot update-rc.d-native:do_populate_sysroot"
>  do_rootfs[recrdeptask] +=3D "do_packagedata"
> =20
> +do_build[depends] +=3D "virtual/kernel:do_deploy"
> +
>  def build_live(d):
>      if base_contains("IMAGE_FSTYPES", "live", "live", "0", d) =3D=3D "0"=
: # live is not set but hob might set iso or hddimg
>          d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", "1"=
, d))
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKYtRAACgkQN1Ujt2V2gBwWUwCfdUMV6kHv5ZC3upy6Q1ZWFOMf
vKAAoKdWpHVhRLnpFN7h+IDkmfpBnyET
=dp6o
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
