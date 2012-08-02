Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwwiH-0002kw-Gh
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:49:21 +0200
Received: by weyr6 with SMTP id r6so5494841wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MveDCEx6JiR5yxtqmDMn6Lx/N0hOAxAfVbayrxKaAUI=;
	b=gRxna8mH0e+/zK1Q2oPqkhlTYba9MHemB6HcAbiFgPMrFtGcaSM2hld9JrfZGTyxwS
	ovOh+O/VMrDs3rb7L519hwKQOe8tj9oLdUyRH+JZbIpdCNlxf50Nzx6/f+5Y9y6g5dZw
	ielbmQhMXQY3ZHLRmKxgHn/woMB7aA/4ADJ+nf3wkft6bDEtPTP931Gp46A8ui+dwE4A
	yxMuTyOfGdbF8Z5GLk4BYgEhJNY4mf2HlzqKHwcCKpoUat/dytI4GMk+VCwzXafLhnip
	YH6kaXBxC3FM0prQyCZR91sbq01URGnzT04+7pJOeF8QfS8kzowX7JzmZDX2/lkjF/BQ
	K78g==
Received: by 10.180.100.133 with SMTP id ey5mr5295313wib.4.1343918261981;
	Thu, 02 Aug 2012 07:37:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm33927870wib.7.2012.08.02.07.37.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 07:37:40 -0700 (PDT)
Date: Thu, 2 Aug 2012 16:37:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120802143739.GU16306@jama.jama.net>
References: <20120802115012.GO16306@jama.jama.net>
	<1343909390-23651-1-git-send-email-Martin.Jansa@gmail.com>
	<C0E6E020-9EA8-4B90-B6FA-A6B99121857C@gmail.com>
MIME-Version: 1.0
In-Reply-To: <C0E6E020-9EA8-4B90-B6FA-A6B99121857C@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: fix regexp used when ld-is-gold
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
X-List-Received-Date: Thu, 02 Aug 2012 14:49:21 -0000
X-Groupsio-MsgNum: 26794
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZNotpC0yWfjHZxBL"
Content-Disposition: inline

--ZNotpC0yWfjHZxBL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 07:32:02AM -0700, Khem Raj wrote:
>=20
> On Aug 2, 2012, at 5:09 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > * with old regexp it wasn't reentrant, causing stuff like this:
> >  -LD     =3D $(CROSS_COMPILE)ld
> >  +LD     =3D $(CROSS_COMPILE)ld.bfd.bfd
> >  -LDR    =3D $(CROSS_COMPILE)ldr
> >  +LDR    =3D $(CROSS_COMPILE)ld.bfd.bfdr
> >  when do_compile was reexecuted, also breaking LDR variable and
> >  http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/u-b=
oot/u-boot/0001-config-Always-use-GNU-ld.patch
> >  when it was used together with u-boot.inc from oe-core (meta-ti is usi=
ng own u-boot.inc)
> >=20
> > * This patch is also better solution to ld-is-gold problem then regexp =
in metadata.
>=20
> It would be rather beneficial to import the u-boot patch to accommodate g=
old from meta-ti
> this helps in creating a uniform solution to same problem. u-boot patch s=
hould be upstreamed too.

Then upstream it :)

>=20
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > meta/recipes-bsp/u-boot/u-boot.inc |    2 +-
> > 1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-bo=
ot/u-boot.inc
> > index 42bdde9..a8642f0 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -34,7 +34,7 @@ SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
> >=20
> > do_compile () {
> > 	if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', =
'', d)}" =3D "ld-is-gold" ] ; then
> > -		sed -i 's/$(CROSS_COMPILE)ld/$(CROSS_COMPILE)ld.bfd/g' config.mk
> > +		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
> > 	fi
> >=20
> > 	unset LDFLAGS
> > --=20
> > 1.7.8.6
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZNotpC0yWfjHZxBL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAakLMACgkQN1Ujt2V2gBwT8wCgrXGYfv9k8tWTPoiqBuMyN8mB
0NIAniks4ypAlLc1ST6Hurz7YfaVEv0j
=zlxC
-----END PGP SIGNATURE-----

--ZNotpC0yWfjHZxBL--
