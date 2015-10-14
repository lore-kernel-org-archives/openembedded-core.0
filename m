Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 30FA2605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 14:37:37 +0000 (UTC)
Received: by wieq12 with SMTP id q12so86435859wie.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SGsX/2wnkQD9BiZwCuFntgsXNyvpM3jeyG507bVxJKU=;
	b=S1FwvzknaIr6KRi/vISWN/bafToJdYaYKrFf2NXUbq+JTzkKns51G6dP7ZyhtVP0aJ
	fvlvvF+XrGY51aIhPOHrGqKpmbPD6xv7DbyduIq5jISSXxDLL0TB9c2EpTO4FsJ2KZ7w
	cmkt73IdMVXIL3bfSnvIBcNGMtm9LHFGCj6sA5s0PAKiRLjEuXZf7cZltNWIQel7Dxar
	wl87rjamck1wHhWKnApRYjzDqi+ngG1fepzvYwimHlHcR4CakRlJH1AMNTKsH0eyaZLW
	I1h4dk9cr35HKlfAXLLgoNNsRgFudaGn9eKKK6VPbVWwtLHX6gEMrbN4/rGoDXvMlwNo
	7QqQ==
X-Received: by 10.180.198.109 with SMTP id jb13mr5020253wic.17.1444833457028; 
	Wed, 14 Oct 2015 07:37:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	he3sm10430166wjc.48.2015.10.14.07.37.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 07:37:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 16:37:51 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20151014143751.GD22448@jama>
References: <1441369348-32182-3-git-send-email-Martin.Jansa@gmail.com>
	<1441895486-26145-1-git-send-email-Martin.Jansa@gmail.com>
	<20150929155055.GA14440@jama>
MIME-Version: 1.0
In-Reply-To: <20150929155055.GA14440@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCHv2] fontcache: allow to pass extra parameters and environment to fc-cache
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
X-List-Received-Date: Wed, 14 Oct 2015 14:37:38 -0000
X-Groupsio-MsgNum: 72174
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline

--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2015 at 05:50:55PM +0200, Martin Jansa wrote:
> On Thu, Sep 10, 2015 at 04:31:26PM +0200, Martin Jansa wrote:
> > * this can be useful for passing extra parameters, pass
> >   -v by default to see what's going on in do_rootfs
> > * we need to use this for extra parameter we implemented
> >   in fontconfig:
> >   --ignore-mtime always use cache file regardless of font directory mti=
me
> >   because the checksum of fontcache generated in do_rootfs
> >   doesn't match with /usr/share/fonts directory as seen on
> >   target device causing fontconfig to re-create the cache
> >   when fontconfig is used for first time or worse create
> >   new cache in every user's home directory when /usr/
> >   filesystem is read only and cache cannot be updated.
> >=20
> >   Running FC_DEBUG=3D16 fc-cache -v on such device shows:
> >   FcCacheTimeValid dir "/usr/share/fonts" cache checksum 1441207803 dir=
 checksum 1441206149
> > * my guess is that the checksum is different, because pseudo
> >   (which is unloaded when running qemuwrapper) or because some
> >   influence of running the rootfs under qemu.
>=20
> ping
>=20
> was this postponed to 2.0? Any feedback would be nice.
>=20
> But thanks for applying the other 2, now we were able to implement this i=
n our
> layer with overlayed fontcache.bbclass and intercepts scripts.

ping2

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/fontcache.bbclass                | 19 +++++++++++++++----
> >  scripts/postinst-intercepts/update_font_cache |  4 ++--
> >  2 files changed, 17 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bb=
class
> > index d122387..8ebdfc4 100644
> > --- a/meta/classes/fontcache.bbclass
> > +++ b/meta/classes/fontcache.bbclass
> > @@ -9,12 +9,23 @@ inherit qemu
> >  FONT_PACKAGES ??=3D "${PN}"
> >  FONT_EXTRA_RDEPENDS ?=3D "fontconfig-utils"
> >  FONTCONFIG_CACHE_DIR ?=3D "${localstatedir}/cache/fontconfig"
> > +FONTCONFIG_CACHE_PARAMS ?=3D "-v"
> > +# You can change this to e.g. FC_DEBUG=3D16 to debug fc-cache issues,
> > +# something has to be set, because qemuwrapper is using this variable =
after -E
> > +# multiple variables aren't allowed because for qemu they are separated
> > +# by comma and in -n "$D" case they should be separated by space
> > +FONTCONFIG_CACHE_ENV ?=3D "FC_DEBUG=3D1"
> >  fontcache_common() {
> > -if [ "x$D" !=3D "x" ] ; then
> > -	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=
=3D${MLPREFIX} bindir=3D${bindir} \
> > -		libdir=3D${libdir} base_libdir=3D${base_libdir} fontconfigcachedir=
=3D${FONTCONFIG_CACHE_DIR}
> > +if [ -n "$D" ] ; then
> > +	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=
=3D${MLPREFIX} \
> > +		'bindir=3D"${bindir}"' \
> > +		'libdir=3D"${libdir}"' \
> > +		'base_libdir=3D"${base_libdir}"' \
> > +		'fontconfigcachedir=3D"${FONTCONFIG_CACHE_DIR}"' \
> > +		'fontconfigcacheparams=3D"${FONTCONFIG_CACHE_PARAMS}"' \
> > +		'fontconfigcacheenv=3D"${FONTCONFIG_CACHE_ENV}"'
> >  else
> > -	fc-cache
> > +	${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_CACHE_PARAMS}
> >  fi
> >  }
> > =20
> > diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/po=
stinst-intercepts/update_font_cache
> > index c8c6018..0deab3c 100644
> > --- a/scripts/postinst-intercepts/update_font_cache
> > +++ b/scripts/postinst-intercepts/update_font_cache
> > @@ -1,5 +1,5 @@
> >  #!/bin/sh
> > =20
> > -PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:=
$D/${base_libdir}\
> > -					$D${bindir}/fc-cache --sysroot=3D$D
> > +PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:=
$D/${base_libdir} \
> > +					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=3D$D ${fo=
ntconfigcacheparams}
> >  chown -R root:root $D${fontconfigcachedir}
> > --=20
> > 2.5.1
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYeaL4ACgkQN1Ujt2V2gBxZCwCggrLnbtH64PkjaYmrCIQTsjrZ
ts0Anj+G7FEQ4dKkTeZnDnu+lrpzA2WR
=aIf6
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
