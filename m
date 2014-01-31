Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5C96E987
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 17:37:54 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so2490635eaj.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y2v6K4/X4KhZfKpaK5egAZWHREGp7LWv0pt/hJU7hk4=;
	b=s8mihEFLWpM6fnaocGVpkCX5nVtXcndVOR4r/5Wvnm3/cONJbB8rWhrxKD5/dgFjNZ
	ISnARVjEexAPxIlgi2zxnBDZP1YDsU2DyqkzGKDzk8mSen1+UfStGYmzu+r32A5ggFeD
	bMZNUuz91BJBF/KUzaBdH0xSs/cVn4Q8BA3uSrTN2/09QyQrVPokzquNrOiS+AopOXHY
	OWxg7yeqjr6sp6dAWlMMRg8V+4lqDYqXC2Klv9nl8RhsFznVnrnZ/Zj6i4AhJVmVB60m
	UHZ1Qr0IkFLwclg/KyEmJqpE6ajsBSWuXICCdvoAaF+U/CjgRJlE5uidsqrrYv+PIANA
	Jzow==
X-Received: by 10.14.53.1 with SMTP id f1mr25913379eec.24.1391189875045;
	Fri, 31 Jan 2014 09:37:55 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k6sm39402916eep.17.2014.01.31.09.37.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 09:37:53 -0800 (PST)
Date: Fri, 31 Jan 2014 18:38:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140131173800.GW3718@jama>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
	<9c945a5fa6dacd392f7b8af2367846450de8e8b2.1390350823.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9c945a5fa6dacd392f7b8af2367846450de8e8b2.1390350823.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][RFC][WIP 3/6] feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Fri, 31 Jan 2014 17:37:54 -0000
X-Groupsio-MsgNum: 49735
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YPAu9GJT3m1iC0FS"
Content-Disposition: inline

--YPAu9GJT3m1iC0FS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 01:36:08AM +0100, Martin Jansa wrote:
> * this means that recipes with ARM_INSTRUCTION_SET explicitly changed
>   to arm will be built in feed without thumb suffix
> * I'm not sure if the rest of system correctly supports different
>   TUNE_PKGARCHs for different recipes, this is one of the reasons why
>   this is WIP/RFC
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 17 +++++++++++----=
--
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/c=
onf/machine/include/arm/feature-arm-thumb.inc
> index d58c4b4..09a127a 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -5,14 +5,19 @@
>  # but requires more instructions (140% for 70% smaller code) so may be
>  # slower.
>  TUNEVALID[thumb] =3D "Use thumb instructions instead of ARM"
> -ARM_THUMB_M_OPT =3D "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_S=
ET', True) =3D=3D 'thumb']}"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${ARM=
_THUMB_M_OPT}', '', d)}"
> +ARM_THUMB_OPT =3D "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET', T=
rue) =3D=3D 'thumb']}"
> +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv4',  '=
t',  '', d)}"
> +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv5',  '=
t',  '', d)}"
> +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  '=
t',  '', d)}"
> +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', '=
t2', '', d)}"
> +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', '=
t2', '', d)}"
> +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', '=
t2', '', d)}"
> +
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${A=
RM_THUMB_OPT}', '', d)}"
>  OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb',=
 '', d)}"
> =20
> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv4', '=
thumb' ], 't', '', d)}"
> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', '=
thumb' ], 't', '', d)}"
> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv6', '=
thumb' ], 't', '', d)}"
> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv7a', =
'thumb' ], 't2', '', d)}"
> +# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set A=
RM_THUMB_OPT to thumb
> +ARMPKGSFX_THUMB .=3D "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar=
('ARM_THUMB_OPT', True) =3D=3D 'thumb'] else ''}"

In branch I've removed extra ']' in this line and moved this patch as
last in series, because it's really not ready for merge (eglibc-initial
fails).

Any other comments before I send v2?

>  # Whether to compile with code to allow interworking between the two
>  # instruction sets. This allows thumb code to be executed on a primarily
> --=20
> 1.8.5.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YPAu9GJT3m1iC0FS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLr33gACgkQN1Ujt2V2gBxm9gCeOMzL71w5aUjyuGSyjnY9Y4PQ
5MIAn11K6YLbk/+6eRVzLrXX1WybqUJg
=lmEC
-----END PGP SIGNATURE-----

--YPAu9GJT3m1iC0FS--
