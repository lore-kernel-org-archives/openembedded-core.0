Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id DCC226041D;
	Sun, 25 Aug 2013 14:43:02 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so1146447eek.3
	for <multiple recipients>; Sun, 25 Aug 2013 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v+WLo1dkCFh8eI25Qfz8x2rAbZrE8X+KIrfHtVfpOjs=;
	b=dPQuRUDJFNtaCTwmV1KnNR/bKzOn88NiFXf8k1Li1/3sxWj00rY9um+FEUePAvGjjI
	iEftmQXasv3HUKbXMelq9aCjxnpqw7P0m9W3jXc0OZM+LiqcMye2bq77DBXkVhotBFF4
	seEmTAeS5jr1tummS0ps8ClER63uF+kTr1vwvJK9ZtxUFI5gJy9jhERG8nH95XlYguyD
	ZDRc+s242RSSjigmmYtWuq2ssuDIp76kqNgyqQ6ckrbrc8AGfsgBRD4lJah30d01LjDM
	JbitBPuRjep1Jxzt0DmJRJMDd+HET0PzIqwM4nQTOARrA7CCzbLl0/zpqDOl2o64pCYs
	OfUw==
X-Received: by 10.14.9.72 with SMTP id 48mr5997486ees.42.1377441783013;
	Sun, 25 Aug 2013 07:43:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm14383572eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 07:43:02 -0700 (PDT)
Date: Sun, 25 Aug 2013 16:44:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Message-ID: <20130825144411.GI3544@jama>
References: <8683DB7C-B756-4E61-B5EF-856E288139C4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8683DB7C-B756-4E61-B5EF-856E288139C4@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Sun, 25 Aug 2013 14:43:03 -0000
X-Groupsio-MsgNum: 43993
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a7XSrSxqzVsaECgU"
Content-Disposition: inline

--a7XSrSxqzVsaECgU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2013 at 06:37:54PM +0400, Elvis Dowson wrote:
> Hi,
>        I have modified the default qemuarm.conf file, to switch it over t=
o using ARM Cortex A9, with hard float, vfp and neon support, by applying t=
he following patch (which basically includes the tune-cortexa9.inc file).
>=20
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
> index d07084b..2ec57d8 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -1,10 +1,9 @@
>  #@TYPE: Machine
> -#@NAME: arm_versatile_926ejs
> -#@DESCRIPTION: arm_versatile_926ejs
> +#@NAME: qemuarmhf
> +#@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9 hard float.
> =20
>  require conf/machine/include/qemu.inc
> -require conf/machine/include/tune-arm926ejs.inc
> -#require conf/machine/include/tune-arm1136jf-s.inc
> +require conf/machine/include/tune-cortexa9.inc
> =20
>  KERNEL_IMAGETYPE =3D "zImage"
>=20
> I find that the kernel panics upon boot.=20
>=20
> Is it possible to have a QEMU build with support for hard float?=20

You can enable it by setting DEFAULTTUNE (see tune-cortexa9 for possible
values).

>=20
> I need this, so that I can bootstrap a Ubuntu build from scratch, using a=
 QEMU arm hard float machine, using a oe-core generated QEMU and toolchain.=
 I don't want to use the default armel or armhf emulator and toolchain prov=
ided by debian, and want to build my own version of the emulator and toolch=
ain, specifically optimized for a particular target machine.
>=20
> I've attached a screenshot below.
>=20
>=20
>=20
> Best regards,
>=20
> Elvis Dowson
>=20
>=20

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a7XSrSxqzVsaECgU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIaGDsACgkQN1Ujt2V2gBzZogCgrCYSc0UhxhARrSunUDUP/2Xo
jVQAniZyFKb3jY1k7SPrZ086rxi58Act
=534i
-----END PGP SIGNATURE-----

--a7XSrSxqzVsaECgU--
