Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id DC37C6C765
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 15:53:14 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so2334149eek.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 07:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1q8Nlb40DCy6FEk84Hp/+zIczarcNanYPj/kV99Ajp0=;
	b=PwM20dySQ2+AhEN3JEQA+IjIFvCHxbmziX5CxLQANuBGHubNyY1pHsdRVs3Gb/fXMZ
	0KiqJ4E2moQ68SWh3cIkLTbj45BpUfe7xPkgO57Vp2KA7HIPUeYIqWZM1tJk2LwSaa3P
	076LNVcjDtiij136FZN9pxUng/cUx/qun2uEYN+wPBWnycc/pDy5LuEdVSxG3tV4XeTa
	BVj5KLrON5jlRigC3JHYtZ5UvM95ogejYcW7ZG0unPbTvcQJ2/9C4Ew3kLT4G8UdQnv2
	Wa95JgJcPt3AtXuAXykRv0KUxfk6FMpPtQYEp5eMcp0jiTA/PhO740JejqX8V2PnByKX
	dapA==
X-Received: by 10.14.5.11 with SMTP id 11mr5494093eek.57.1390837995028;
	Mon, 27 Jan 2014 07:53:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w4sm43875856eef.20.2014.01.27.07.53.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jan 2014 07:53:14 -0800 (PST)
Date: Mon, 27 Jan 2014 16:53:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140127155319.GI3718@jama>
References: <cover.1390052619.git.Martin.Jansa@gmail.com>
	<981d02338666c368a371adb1bc0a5417b4a39138.1390052619.git.Martin.Jansa@gmail.com>
	<1390834275.17424.256.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1390834275.17424.256.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] sstatesig: include native/cross/nativesdk deps in target signatures
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
X-List-Received-Date: Mon, 27 Jan 2014 15:53:15 -0000
X-Groupsio-MsgNum: 49567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7PTD44AewjTsiSV"
Content-Disposition: inline

--C7PTD44AewjTsiSV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2014 at 02:51:15PM +0000, Richard Purdie wrote:
> On Sat, 2014-01-18 at 15:02 +0100, Martin Jansa wrote:
> > * I don't have any real evidence or good statistics for this, but when
> >   comparing signature dumps from my big bitbake world builds I usually
> >   see a lot of rebuilds caused by changes in .bbclasses and only very
> >   rare would be the case where oe-core upgrade brings changes in -native
> >   recipes and no change in .bbclasses used from target recipes
> > * changing the default to include them shouldn't cause significant
> >   increase in rebuilds and sstate reuse a bit safer
> > * people working on toolchain (e.g. using gcc from AUTOREV) can easily
> >   extend sstate_rundepfilter to ignore them again (it's easier than
> >   removing existing filter), example how add own signature handler in
> >   your layer is here:
> >   https://github.com/openwebos/meta-webos/commit/9ac3a7c803e7793b3274e4=
998f167b6278db8042
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/lib/oe/sstatesig.py | 4 ----
> >  1 file changed, 4 deletions(-)
>=20
> Whilst I merged this, we do have a problem here. This change means that
> the sstate is locked to the build system architecture.
>=20
> For example, if you have a 32 bit machine, it can't use any of the
> sstate built on a 64 bit machine and vice versa.
>=20
> I'm not sure what we do about this but its a problem...

Agreed, that's bad, I was testing it in setup where we publish the
sstate archive from the builder with the same architecture and have
similar setup building just -native recipes on 32bit for 32bit devs.

So this problem should have hit us as well, I'll recheck.

> Cheers,
>=20
> Richard
>=20
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> > index 3011f16..8b0e344 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -36,10 +36,6 @@ def sstate_rundepfilter(siggen, fn, recipename, task=
, dep, depname, dataCache):
> >      if isPackageGroup(fn):
> >          return False =20
> > =20
> > -    # Drop native/cross/nativesdk dependencies from target recipes
> > -    if isNative(depname) or isCross(depname) or isNativeSDK(depname):
> > -        return False
> > -
> >      # Exclude well defined machine specific configurations which don't=
 change ABI
> >      if depname in siggen.abisaferecipes and not isImage(fn):
> >          return False
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7PTD44AewjTsiSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLmgO8ACgkQN1Ujt2V2gBzaRQCdESLQLlxfSO+m+NKFFXBHeXiW
ELEAoKWhrbEIDAZYoFuoNMAXzQv3yqD+
=kitp
-----END PGP SIGNATURE-----

--C7PTD44AewjTsiSV--
