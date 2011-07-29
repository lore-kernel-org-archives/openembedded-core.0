Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qmqds-0006xn-6T
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 19:14:32 +0200
Received: by fxg11 with SMTP id 11so2763006fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 10:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SJb6Jr4MAxyD9Oht7ZS5DAp5ntujDxH+ffysxAAiTSk=;
	b=fVExojR0vMyjbpt2hDUOVGYkQx11VTMKohN6u60rdCo3DuiRQ1pgbTMkO0iW9nXEeH
	qoBUzuEJaWDMGvuj3+4eLBofJq4QrboVlAGq5cmwCifeDStNWkLWkRKqrPC+clM/59Ei
	41b9hHYXag6c3G5LZWS8lUf9nfi2HgHhgEf8U=
Received: by 10.223.1.201 with SMTP id 9mr2107199fag.91.1311959415415;
	Fri, 29 Jul 2011 10:10:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e10sm1201960fak.42.2011.07.29.10.10.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 10:10:14 -0700 (PDT)
Date: Fri, 29 Jul 2011 19:10:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110729171007.GO15286@jama.jama.net>
References: <20110729163912.GN15286@jama.jama.net>
	<1311959073-16925-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1311959073-16925-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] feature-arm-thumb: respect ARM_INSTRUCTION_SET
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
X-List-Received-Date: Fri, 29 Jul 2011 17:14:32 -0000
X-Groupsio-MsgNum: 7074
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iEWWOZ/QYGWEaBRW"
Content-Disposition: inline

--iEWWOZ/QYGWEaBRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2011 at 07:04:33PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../conf/machine/include/arm/feature-arm-thumb.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/c=
onf/machine/include/arm/feature-arm-thumb.inc
> index b580168..e7d392e 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -5,7 +5,8 @@
>  # but requires more instructions (140% for 70% smaller code) so may be
>  # slower.
>  TUNEVALID[thumb] =3D "Use thumb instructions instead of ARM"
> -TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthum=
b", "-mno-thumb", d)}"
> +ARM_THUMB_M_OPT =3D "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_IN=
STRUCTION_SET', d, 1) =3D=3D 'thumb']}"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_=
THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
>  OVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb",=
 "", d)}"
> =20
>  # Note armv7 will hit on armv7a as well
> --=20
> 1.7.6
>=20

This seems to work, but be aware that _armv4t override is not respected
anymore :/.

I was using something like this to set default ARM_INSTRUCTION_SET from
distro config:

PREFERRED_ARM_INSTRUCTION_SET_armv4t   =3D "thumb"
PREFERRED_ARM_INSTRUCTION_SET_armv5te  =3D "thumb"
PREFERRED_ARM_INSTRUCTION_SET_armv5teb =3D "thumb"
PREFERRED_ARM_INSTRUCTION_SET         ?=3D  "arm"
ARM_INSTRUCTION_SET =3D "${PREFERRED_ARM_INSTRUCTION_SET}"

but from -e output it's clear that it's ignored
# PREFERRED_ARM_INSTRUCTION_SET_armv4t=3Dthumb
PREFERRED_ARM_INSTRUCTION_SET_armv4t=3D"thumb"
# PREFERRED_ARM_INSTRUCTION_SET=3Darm
PREFERRED_ARM_INSTRUCTION_SET=3D"arm"
# PREFERRED_ARM_INSTRUCTION_SET_armv5te=3Dthumb
PREFERRED_ARM_INSTRUCTION_SET_armv5te=3D"thumb"
# PREFERRED_ARM_INSTRUCTION_SET_armv5teb=3Dthumb
PREFERRED_ARM_INSTRUCTION_SET_armv5teb=3D"thumb"
# ARM_INSTRUCTION_SET=3D${PREFERRED_ARM_INSTRUCTION_SET}
ARM_INSTRUCTION_SET=3D"arm"

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iEWWOZ/QYGWEaBRW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4y6W8ACgkQN1Ujt2V2gBy7KQCgr938DHNiVxKtjYHJRpCeE0DV
IzwAniNyGnyhqMZP09xrBpxnAUGAojAw
=ypp+
-----END PGP SIGNATURE-----

--iEWWOZ/QYGWEaBRW--
