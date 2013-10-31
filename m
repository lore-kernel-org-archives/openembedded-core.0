Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 090B36A35B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 10:41:08 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so1284294ead.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 03:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LKNTm+qTIL2x6U8juxP0eKmipWFVWNvejBrrVwJVbMU=;
	b=gfysyEsxMqD8SlxwL8VhalQj1ZVOvEbcBybr0dks4sZuqppm3osCznmh6r+B0p/sOH
	70XR5DYtepsgaHulJdzwqvdhyuLK41B1hWR25T3M0m+DkVPGzNiGt+sSxhv2Eaez2Xky
	N0nFxZAfr6lzKtu7LU9gQRXYeUljDIb0x0yKGYtmXy8kVqDyv3h9MPLJNG+2/4MJU6uG
	aaXu6r5n8pEnrZTx/S42X9iVfvJarPZfs9PSMrKo/JLMbPEaoQCbQTZTryj/3Q2pepoY
	G4eMAcMdcDxPF3cGFKAaJFNGl61QZ2bqlune0H8bi6Ayq0mgRMI398Y/YGZLwp2ft6vz
	JA4w==
X-Received: by 10.14.122.8 with SMTP id s8mr1838416eeh.106.1383216070088;
	Thu, 31 Oct 2013 03:41:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m54sm6945847eex.2.2013.10.31.03.41.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 03:41:09 -0700 (PDT)
Date: Thu, 31 Oct 2013 11:41:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20131031104111.GI32015@jama>
References: <cover.1383214870.git.hongxu.jia@windriver.com>
	<0ab98fd1823d92b6661b60432b3ec30fd9c9a03d.1383214870.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <0ab98fd1823d92b6661b60432b3ec30fd9c9a03d.1383214870.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemu: use PACKAGECONFIG to address nss dependencies
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
X-List-Received-Date: Thu, 31 Oct 2013 10:41:09 -0000
X-Groupsio-MsgNum: 46456
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3eH4Qcq5fItR5cpy"
Content-Disposition: inline

--3eH4Qcq5fItR5cpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 06:23:01PM +0800, Hongxu Jia wrote:
> Use PACKAGECONFIG to explicitly address nss dependencies rather than
> tested by configure.
>=20
> It avoided potential errors while multiple builds shared a common
> state_cache.

There are more floating dependencies in qemu.inc, see
http://patchwork.openembedded.org/patch/56935/

and even this list isn't complete, there is also:
WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost dependency on=
  cairo gdk-pixbuf gnutls gtk+ libvte

Can you please improve it to fix them all?

>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 1b861d7..87a7275 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -83,6 +83,7 @@ do_install_append() {
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-attr,--disable-virtf=
s,libcap attr,"
>  PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"
> +PACKAGECONFIG[nss] =3D "--enable-smartcard-nss,--disable-smartcard-nss,n=
ss,"
> =20
>  # Qemu target will not build in world build for ARM or Mips
>  BROKEN_qemuarm =3D "1"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3eH4Qcq5fItR5cpy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJyM8cACgkQN1Ujt2V2gBxIYACaAqnV8wkH/5uRiDlzEPwRIt1H
hSAAmwbp/3OsP/8tXMawP8Zrbb2QalAa
=xTCt
-----END PGP SIGNATURE-----

--3eH4Qcq5fItR5cpy--
