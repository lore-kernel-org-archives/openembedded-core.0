Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1CEB660E07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:49:08 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so4060543eaj.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q4JUNXeOF7JLLIcjuNzFQOWIdfikC7o+EQ86FHPpSQ4=;
	b=jhd/odI4/XFVm78PG5Ow4d/b1c+SxmXHMWzxetH4dJliASB+A57WMiHOX4iI4lesHJ
	xAPxYH1MFnAS2ZOeaVsBpW89KmGkDQrpzWWadSZL9v3/ESsaW5XaL5QVySEoeyNyxVhl
	VrXOaxsAn5e7b7CAJV4KJ26s97WDXNxpcCvbCTmtMblVE6QkZ9T2yQce28hssrh444bL
	U0lCv56BTMozaLW5ODl6yldlSMjNhawfcQAwdJcVn4BEimzDCE2pDDobuPAEpze71J2w
	kicS12W7vVHAcjsZBvwyGmDhwblgV6QYw8HTRlHzr66jb7d7P3+OAxKrgAV9Du7vcf7D
	DmDg==
X-Received: by 10.14.176.195 with SMTP id b43mr26774038eem.39.1390351749779;
	Tue, 21 Jan 2014 16:49:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id u7sm20705941eep.11.2014.01.21.16.49.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:49:09 -0800 (PST)
Date: Wed, 22 Jan 2014 01:49:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140122004909.GO4100@jama>
References: <1390347792-24649-1-git-send-email-Martin.Jansa@gmail.com>
	<1390347792-24649-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1390347792-24649-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH 2/2] feature-arm-thumb: Fix missing t2 suffix for armv7a MACHINEs
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
X-List-Received-Date: Wed, 22 Jan 2014 00:49:10 -0000
X-Groupsio-MsgNum: 49324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zipuvUKAEymKn2g"
Content-Disposition: inline

--6zipuvUKAEymKn2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 12:43:12AM +0100, Martin Jansa wrote:
> * unfortunatelly that note about armv7 matching also armv7a is no
>   longer valid since armv7 include in armv7 was replaced with
>   armv6+neon in this commit:
>=20
>   commit 75b8adbc042e0f65fb1286bc550d02becd3b6aea
>   Author: Khem Raj <raj.khem@gmail.com>
>   Date:   Tue Mar 27 18:37:45 2012 -0700
>=20
>     tune/armv7: Delete
>=20
>   since then thumb and arm feeds had the same architecture
> * be aware that this will rename lots of feeds

Can someone confirm that t2 should be included for armv7m or armv7r?

It looks like armv7m definitely should include it, but it doesn't even have
thumb in TUNE_FEATURES for the only armv7m user we have in oe-core cortexm3:

tune-cortexm3.inc:TUNE_FEATURES_tune-cortexm3 =3D "armv7m vfp cortexm3"
tune-cortexm3.inc:PACKAGE_EXTRA_ARCHS_tune-cortexm3 =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7at} armv7m-vfp"

tune-cortexr4.inc:TUNE_FEATURES_tune-cortexr4 =3D "armv7r vfp cortexr4"
tune-cortexr4.inc:PACKAGE_EXTRA_ARCHS_tune-cortexr4 =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7at} armv7r-vfp"

Anyway I'm sending a bit bigger RFC/WIP patchset to address this.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/c=
onf/machine/include/arm/feature-arm-thumb.inc
> index bd754be..fa3a4e5 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -9,11 +9,10 @@ ARM_THUMB_M_OPT =3D "${@['-marm', '-mthumb'][d.getVar('=
ARM_INSTRUCTION_SET', True)
>  TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", " ${ARM=
_THUMB_M_OPT}", "", d)}"
>  OVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb",=
 "", d)}"
> =20
> -# Note armv7 will hit on armv7a as well
>  ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "=
thumb" ], "t", "", d)}"
>  ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "=
thumb" ], "t", "", d)}"
>  ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "=
thumb" ], "t", "", d)}"
> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "=
thumb" ], "t2", "", d)}"
> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv7a", =
"thumb" ], "t2", "", d)}"
> =20
>  # Whether to compile with code to allow interworking between the two
>  # instruction sets. This allows thumb code to be executed on a primarily
> --=20
> 1.8.5.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6zipuvUKAEymKn2g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLfFYUACgkQN1Ujt2V2gBznOACfaANTqIAa0WtiSeojriD0JGJu
JB4Anjgk11WbPO27TDaD3qQcig6eTk+6
=Qg0x
-----END PGP SIGNATURE-----

--6zipuvUKAEymKn2g--
