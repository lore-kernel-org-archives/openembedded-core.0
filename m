Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0806B0EC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:32:19 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id d10so2180599eaj.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nMvoSVOxXwn4W9psHGudFEAFd5C3xACRB3wFppMsVQM=;
	b=N3GlKOVJ7t/civQ+Yr2K0ANjrFvC/jmUniviLQhbOGjNaHO+0HMU/IwMId6MajTRHU
	QLzE95/78GDsp7n6kZ//MCzlWY3fQEZK4xFQdcJAb8pBZFXGGb2eePsPFRlmj7KibTOo
	JloXHrTUk0xd4tCk18i0zJ9kLRYmSllGrenN7PW35dJwVjHYBxghe/pFAwHsHDiAyIkq
	PNrnPWLVt6g/DHINU34sdUtmZyyNPxCl3oYaylzozKgNxU/xhm8DmG2G9jOMim4AV4ZH
	TyIaRA20Wsx2OutAduoSp4iZF7OKnY5Bjw09fPRXr09P6yEpfiYwM86Fas7XF1qZK1vQ
	Or+A==
X-Received: by 10.15.100.195 with SMTP id bn43mr17780579eeb.153.1373153540257; 
	Sat, 06 Jul 2013 16:32:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm27981371eeu.2.2013.07.06.16.32.19 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:32:19 -0700 (PDT)
Date: Sun, 7 Jul 2013 01:32:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20130706233226.GG3288@jama>
References: <20130705224311.GA3288@jama>
	<1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANmrjid3veZXwq_jh24qDaXBjhf3MvNV5yY+6eCg+Gr5Aw@mail.gmail.com>
	<20130706230840.GE3288@jama>
	<CABcZAN=oJ5JVRUma+N2V+8xxNZuD+WwOJqmHkEnfcY1EVGa2sA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=oJ5JVRUma+N2V+8xxNZuD+WwOJqmHkEnfcY1EVGa2sA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Sat, 06 Jul 2013 23:32:20 -0000
X-Groupsio-MsgNum: 41564
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aYDVKSzuImP48n7V"
Content-Disposition: inline

--aYDVKSzuImP48n7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2013 at 04:20:00PM -0700, Chris Larson wrote:
> On Sat, Jul 6, 2013 at 4:08 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > In this case yes, but what about allarch recipes, creating
> > binutils-cross dependency in their do_package task would probably make
> > their stamps depending on architecture.
> >
>=20
> def get_binutils_dep(d):
>     if 'target' in d.getVar('OVERRIDES', True).split():
>         return d.expand('virtual/${TARGET_PREFIX}binutils')
>     else:
>         return ''
>=20
> do_package[depends] +=3D "${@get_binutils_dep(d)}"

class-target will be in recipes which inherits allarch

that code should also respect
EXCLUDE_FROM_SHLIBS
INHIBIT_PACKAGE_DEBUG_SPLIT
INHIBIT_PACKAGE_STRIP
flags

I think objcopy is needed only with some combination of these.

With binutils-cross in BASEDEPENDS I don't know how many recipes will
need do_package -> binutils-cross.do_populate_sysroot, maybe just this
one eglibc-locale...

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aYDVKSzuImP48n7V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHYqQoACgkQN1Ujt2V2gBxujQCgg0R0YweE0R2uhbPEuPBzuY6e
L6oAn3kuRAPLbAVAn/KN7HQlBWZIQ4ZD
=Q3M1
-----END PGP SIGNATURE-----

--aYDVKSzuImP48n7V--
