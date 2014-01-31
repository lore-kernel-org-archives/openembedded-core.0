Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6E97B6E87D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:46:38 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so2456773eek.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wmkLfZoqmDoDg+PVuZOzJAyEyNXZym8jJtr8/CIuWyU=;
	b=mmBbpnTKdHSvnoIrhMAeBwl356N0o3WgFsA/n+6MP3WF4R2tpfglo88D4K924qz7rb
	GszmLSfWGOXj4WhLRRw7/1TYqUHRAJ1lLMWngLrAJqOtJpcSeQApo2hnpYiQpW0E6wVr
	BUZIcKgyCZcPZtuXNWHLCvJfFykpnghLaRztHKEVe2m6gfcaSodv4/NLplCbvJmxR6Ry
	AYNsX3+X/bCIDJIu6YgARXm/g99Xch0EDDI2FQmdHZCvxHTU/f+Gjg4Mpd+6PJT+gKbN
	C0n7QAljEgykbyzdz9+Gc2LY+qPJvTrhxldR+15w80k5zaeROTUs09qLu4nrp53ZVdBJ
	mxaQ==
X-Received: by 10.14.109.71 with SMTP id r47mr4405421eeg.28.1391193998444;
	Fri, 31 Jan 2014 10:46:38 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o43sm40006129eef.12.2014.01.31.10.46.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 10:46:37 -0800 (PST)
Date: Fri, 31 Jan 2014 19:46:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140131184645.GX3718@jama>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
	<9c945a5fa6dacd392f7b8af2367846450de8e8b2.1390350823.git.Martin.Jansa@gmail.com>
	<20140131173800.GW3718@jama>
MIME-Version: 1.0
In-Reply-To: <20140131173800.GW3718@jama>
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
X-List-Received-Date: Fri, 31 Jan 2014 18:46:39 -0000
X-Groupsio-MsgNum: 49739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6ysXqiu0yoUmUNJB"
Content-Disposition: inline

--6ysXqiu0yoUmUNJB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2014 at 06:38:00PM +0100, Martin Jansa wrote:
> On Wed, Jan 22, 2014 at 01:36:08AM +0100, Martin Jansa wrote:
> > * this means that recipes with ARM_INSTRUCTION_SET explicitly changed
> >   to arm will be built in feed without thumb suffix
> > * I'm not sure if the rest of system correctly supports different
> >   TUNE_PKGARCHs for different recipes, this is one of the reasons why
> >   this is WIP/RFC
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/feature-arm-thumb.inc | 17 +++++++++++--=
----
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta=
/conf/machine/include/arm/feature-arm-thumb.inc
> > index d58c4b4..09a127a 100644
> > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > @@ -5,14 +5,19 @@
> >  # but requires more instructions (140% for 70% smaller code) so may be
> >  # slower.
> >  TUNEVALID[thumb] =3D "Use thumb instructions instead of ARM"
> > -ARM_THUMB_M_OPT =3D "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION=
_SET', True) =3D=3D 'thumb']}"
> > -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${A=
RM_THUMB_M_OPT}', '', d)}"
> > +ARM_THUMB_OPT =3D "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET',=
 True) =3D=3D 'thumb']}"
> > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv4', =
 't',  '', d)}"
> > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv5', =
 't',  '', d)}"
> > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv6', =
 't',  '', d)}"
> > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7a',=
 't2', '', d)}"
> > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7r',=
 't2', '', d)}"
> > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7m',=
 't2', '', d)}"
> > +
> > +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m$=
{ARM_THUMB_OPT}', '', d)}"
> >  OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb=
', '', d)}"
> > =20
> > -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv4',=
 'thumb' ], 't', '', d)}"
> > -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5',=
 'thumb' ], 't', '', d)}"
> > -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv6',=
 'thumb' ], 't', '', d)}"
> > -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'armv7a'=
, 'thumb' ], 't2', '', d)}"
> > +# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set=
 ARM_THUMB_OPT to thumb
> > +ARMPKGSFX_THUMB .=3D "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getV=
ar('ARM_THUMB_OPT', True) =3D=3D 'thumb'] else ''}"
>=20
> In branch I've removed extra ']' in this line and moved this patch as
> last in series, because it's really not ready for merge (eglibc-initial
> fails).

Ah, there was another issue in 4/6 and "arm" TUNE_FEATURE wasn't
inherited by higher architectures, so it was correctly forcing "thumb"
mode - that's why eglibc-initial was failing and now it isn't.
=20
> Any other comments before I send v2?
>=20
> >  # Whether to compile with code to allow interworking between the two
> >  # instruction sets. This allows thumb code to be executed on a primari=
ly
> > --=20
> > 1.8.5.3
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6ysXqiu0yoUmUNJB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLr75UACgkQN1Ujt2V2gBwi6ACfXMFOVzAkunXfNDgH0BzkL20w
NskAniFlJgKe9EMbgf7wjrRhyq7h9AGO
=LI6r
-----END PGP SIGNATURE-----

--6ysXqiu0yoUmUNJB--
