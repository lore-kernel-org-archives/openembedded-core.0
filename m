Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6134960991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:01:01 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 22BCF4B014E;
	Thu, 30 May 2013 09:00:56 +0200 (CEST)
Date: Thu, 30 May 2013 09:00:55 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130530090055.5495d737@e6520eb>
In-Reply-To: <1369864411.14887.255.camel@ted>
References: <1369863047-3105-1-git-send-email-eric@eukrea.com>
	<1369864411.14887.255.camel@ted>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: depend on gdk-pixbuf-native
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
X-List-Received-Date: Thu, 30 May 2013 07:01:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Wed, 29 May 2013 22:53:31 +0100,
Richard Purdie <richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Wed, 2013-05-29 at 23:30 +0200, Eric B=C3=A9nard wrote:
> > it's using scripts from scripts/postinst-intercepts/ which contain
> > gdk-pixbuf-query-loaders so it should depend on gdk-pixbuf-native
> > else the host binary will be used and it will try to update the
> > host's cache
> >=20
> > [YOCTO #4572]
> >=20
> > Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> > ---
> > fix the same problem in dylan
> >=20
> >  meta/classes/image.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 04db533..6c16a1a 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -10,7 +10,7 @@ inherit gzipnative
> > =20
> >  LICENSE =3D "MIT"
> >  PACKAGES =3D ""
> > -DEPENDS +=3D "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cr=
oss"
> > +DEPENDS +=3D "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cr=
oss gdk-pixbuf-native"
> >  RDEPENDS +=3D "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_IN=
STALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
> >  RRECOMMENDS +=3D "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
>=20
> Ah, this has made me realise what the real problem is and that there is
> a better way to fix this. We need to add
>=20
> DEPENDS +=3D "gdk-pixbuf-native"
>=20
> to pixbufcache.bbclass and gtk-icon-cache.bbclass then people not using
> those things don't get the dependency added.
>=20
I tried on gtk-icon-cache and that didn't work ... seems I missed
pixbufcache.bbclass ;-)

Eric

