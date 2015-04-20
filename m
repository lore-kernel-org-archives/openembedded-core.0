Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2599C65CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 10:16:43 +0000 (UTC)
Received: by widdi4 with SMTP id di4so85436818wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=QK007SXpYxUZx0d1kKcQz/j3/FZGR4lW84KrynhIV1k=;
	b=aBQ+vvHPrcpDdKltzrvcj2eemHiICt6TuGik7y/iHp6VJfdfEjOxMLZ7BHfZBfAesx
	qrtqHvR28I73yDSg1HgIfClgioGUXcaMqxC4Y+kzjP0+owrLCKd+k/YSNSusbEY6U3S1
	BYTTcj3I0ZUalJywKuEskGHuucryJiqsHEHA1dOt0FL6YBlf6IPEkN/zpE2Z1zLN+rWR
	OxU39ieKgbfO+NSyodNUNKfmcaXlvMcN5RLVqp6Jx9K6H4HlGWhm9Qvo+DDJzcwBjGJK
	Eavw1ORHdyXbgsktOM6l7Uo2fhRI151Bl4OiLU1Xqr2e0z0Fqeo1nmhPpXcyBowPMVPf
	u6hg==
X-Received: by 10.194.192.226 with SMTP id hj2mr30050426wjc.51.1429525003199; 
	Mon, 20 Apr 2015 03:16:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id i6sm17127576wjf.29.2015.04.20.03.16.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 03:16:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Apr 2015 12:16:46 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150420101646.GA3686@jama>
References: <20150330172759.GC14928@jama>
	<1428405673-29955-1-git-send-email-Martin.Jansa@gmail.com>
	<1428574350.6976.6.camel@linuxfoundation.org>
	<20150409113539.GA2340@jama>
MIME-Version: 1.0
In-Reply-To: <20150409113539.GA2340@jama>
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
X-List-Received-Date: Mon, 20 Apr 2015 10:16:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2015 at 01:35:39PM +0200, Martin Jansa wrote:
> On Thu, Apr 09, 2015 at 11:12:30AM +0100, Richard Purdie wrote:
> > On Tue, 2015-04-07 at 13:21 +0200, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > > v2: added --with-cache-dir to fontconfig EXTRA_OECONF in case that was
> > >     what Ross wanted
> > >=20
> > >  meta/classes/fontcache.bbclass                        | 4 ++--
> > >  meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb | 4 +++-
> > >  scripts/postinst-intercepts/update_font_cache         | 4 +---
> > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.=
bbclass
> > > index dfbdfa1..d122387 100644
> > > --- a/meta/classes/fontcache.bbclass
> > > +++ b/meta/classes/fontcache.bbclass
> > > @@ -8,11 +8,11 @@ inherit qemu
> > > =20
> > >  FONT_PACKAGES ??=3D "${PN}"
> > >  FONT_EXTRA_RDEPENDS ?=3D "fontconfig-utils"
> > > -
> > > +FONTCONFIG_CACHE_DIR ?=3D "${localstatedir}/cache/fontconfig"
> ]> >  fontcache_common() {
> > >  if [ "x$D" !=3D "x" ] ; then
> > >  	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=
=3D${MLPREFIX} bindir=3D${bindir} \
> > > -		libdir=3D${libdir} base_libdir=3D${base_libdir} localstatedir=3D${=
localstatedir}
> > > +		libdir=3D${libdir} base_libdir=3D${base_libdir} fontconfigcachedir=
=3D${FONTCONFIG_CACHE_DIR}
> > >  else
> > >  	fc-cache
> > >  fi
> > > diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb b/=
meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> > > index 797b321..7c5b4b4 100644
> > > --- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> > > +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> > > @@ -37,6 +37,8 @@ DEBIAN_NOAUTONAME_fontconfig-utils =3D "1"
> > > =20
> > >  inherit autotools pkgconfig
> > > =20
> > > -EXTRA_OECONF =3D " --disable-docs --with-default-fonts=3D${datadir}/=
fonts"
> > > +FONTCONFIG_CACHE_DIR ?=3D "${localstatedir}/cache/fontconfig"
> > > +
> > > +EXTRA_OECONF =3D " --disable-docs --with-default-fonts=3D${datadir}/=
fonts --with-cache-dir=3D${FONTCONFIG_CACHE_DIR}"
> > > =20
> > >  BBCLASSEXTEND =3D "native"
> > > diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/=
postinst-intercepts/update_font_cache
> > > index 3907f25..c8c6018 100644
> > > --- a/scripts/postinst-intercepts/update_font_cache
> > > +++ b/scripts/postinst-intercepts/update_font_cache
> > > @@ -2,6 +2,4 @@
> > > =20
> > >  PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir=
}:$D/${base_libdir}\
> > >  					$D${bindir}/fc-cache --sysroot=3D$D
> > > -chown -R root:root $D${localstatedir}/cache/fontconfig
> > > -
> > > -
> > > +chown -R root:root $D${fontconfigcachedir}
> >=20
> > This looks better but what sets fontconfigcachedir ?
>=20
> It's passed in intercept call in fontcache.bbclass like other variables
> used here.
>=20
> People who want to change the value should do so from global scope, so
> that the same value is used in fontconfig_2.11.1.bb and
> fontcache.bbclass.
>=20
> Once this is merged in master, I would like to see it in dizzy (and
> fido) branches together with other fontconfig related fixes.

The other fontconfig related fix:
fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
was merged to dizzy recently, so now dizzy is broken for us, because
this one (and the one fixing permissions) are missing :/.

Do you expect more changes for this patch or was my explanation enough
to get it accepted?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

