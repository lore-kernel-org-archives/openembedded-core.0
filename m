Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2350D606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 11:35:30 +0000 (UTC)
Received: by wgso17 with SMTP id o17so5088868wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 04:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8gUsm0u1B750+HwbmpBpt0RB3cgkaXod+8W1Mv0l69U=;
	b=eDA6pXN0fRaF82DuzEyG5LdkFanPp253tF3NLrIHMfp4oMG1vljiShcm59AWPloTzY
	+Urlv07hf6jhlwhVkIJpTU8AdFsXUe9jIJIJHCPtgKi+7CwZBgVy5DRxT9b4XPQp7G5U
	VJ+Z4yAcFN/tBzbic5VvZs/Dq8shu6Sb5Io6ykr0JyKXTqpx6mE9UAeUldhMnpMfGZVN
	xPdyMwUQqXt6Mg9+vF1jv8n8Sx9guaxVGyM1iLNtb1UtGCVT2zDOGtSCAy4TnjrAY9XH
	hNi5HhO8VMvKsKsbozZPaOP35v6nCmWtijkBT/k3937NTK3bpHD/dvhFvhLVwUFzD+5b
	e+Eg==
X-Received: by 10.180.208.46 with SMTP id mb14mr5432697wic.31.1428579331879;
	Thu, 09 Apr 2015 04:35:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id it5sm19789106wid.3.2015.04.09.04.35.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 04:35:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 9 Apr 2015 13:35:39 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150409113539.GA2340@jama>
References: <20150330172759.GC14928@jama>
	<1428405673-29955-1-git-send-email-Martin.Jansa@gmail.com>
	<1428574350.6976.6.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1428574350.6976.6.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] fontcache: allow to pass different fontconfig cache dir
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
X-List-Received-Date: Thu, 09 Apr 2015 11:35:31 -0000
X-Groupsio-MsgNum: 64171
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2015 at 11:12:30AM +0100, Richard Purdie wrote:
> On Tue, 2015-04-07 at 13:21 +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > v2: added --with-cache-dir to fontconfig EXTRA_OECONF in case that was
> >     what Ross wanted
> >=20
> >  meta/classes/fontcache.bbclass                        | 4 ++--
> >  meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb | 4 +++-
> >  scripts/postinst-intercepts/update_font_cache         | 4 +---
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bb=
class
> > index dfbdfa1..d122387 100644
> > --- a/meta/classes/fontcache.bbclass
> > +++ b/meta/classes/fontcache.bbclass
> > @@ -8,11 +8,11 @@ inherit qemu
> > =20
> >  FONT_PACKAGES ??=3D "${PN}"
> >  FONT_EXTRA_RDEPENDS ?=3D "fontconfig-utils"
> > -
> > +FONTCONFIG_CACHE_DIR ?=3D "${localstatedir}/cache/fontconfig"
]> >  fontcache_common() {
> >  if [ "x$D" !=3D "x" ] ; then
> >  	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=
=3D${MLPREFIX} bindir=3D${bindir} \
> > -		libdir=3D${libdir} base_libdir=3D${base_libdir} localstatedir=3D${lo=
calstatedir}
> > +		libdir=3D${libdir} base_libdir=3D${base_libdir} fontconfigcachedir=
=3D${FONTCONFIG_CACHE_DIR}
> >  else
> >  	fc-cache
> >  fi
> > diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb b/me=
ta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> > index 797b321..7c5b4b4 100644
> > --- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> > +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> > @@ -37,6 +37,8 @@ DEBIAN_NOAUTONAME_fontconfig-utils =3D "1"
> > =20
> >  inherit autotools pkgconfig
> > =20
> > -EXTRA_OECONF =3D " --disable-docs --with-default-fonts=3D${datadir}/fo=
nts"
> > +FONTCONFIG_CACHE_DIR ?=3D "${localstatedir}/cache/fontconfig"
> > +
> > +EXTRA_OECONF =3D " --disable-docs --with-default-fonts=3D${datadir}/fo=
nts --with-cache-dir=3D${FONTCONFIG_CACHE_DIR}"
> > =20
> >  BBCLASSEXTEND =3D "native"
> > diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/po=
stinst-intercepts/update_font_cache
> > index 3907f25..c8c6018 100644
> > --- a/scripts/postinst-intercepts/update_font_cache
> > +++ b/scripts/postinst-intercepts/update_font_cache
> > @@ -2,6 +2,4 @@
> > =20
> >  PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:=
$D/${base_libdir}\
> >  					$D${bindir}/fc-cache --sysroot=3D$D
> > -chown -R root:root $D${localstatedir}/cache/fontconfig
> > -
> > -
> > +chown -R root:root $D${fontconfigcachedir}
>=20
> This looks better but what sets fontconfigcachedir ?

It's passed in intercept call in fontcache.bbclass like other variables
used here.

People who want to change the value should do so from global scope, so
that the same value is used in fontconfig_2.11.1.bb and
fontcache.bbclass.

Once this is merged in master, I would like to see it in dizzy (and
fido) branches together with other fontconfig related fixes.

Thanks
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUmZAsACgkQN1Ujt2V2gBzszACgnMoXMLUurkGkFWBrnCwyYBmN
LZEAn3HYJeOBI2N2QuuGsqQ2xoRRQ+CP
=IIi5
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
