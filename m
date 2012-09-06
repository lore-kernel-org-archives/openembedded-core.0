Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9llw-0005AY-23
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 01:46:08 +0200
Received: by wgbdr1 with SMTP id dr1so1723663wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 16:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=L7vkoy+uKsl8sLzMt/tCkBxZ5siI2GkCxWoTHzPoD7A=;
	b=o1RJLdN43lpLiU8t8a976UoZ8MOYeohQzNIdlzHYs8je7ty7vi9stzLBd7wXFJfW4d
	esbP/URqog8QracF4/QfS5E7tro8tQMG3+pomiy4u6ebn4R4qwvp03dYod58z0tZnp9i
	mINE0Im65WFv2G05II850eKmUbv/m+N1ru4fvt7tbdu9jVaGltkE2BIk+SfA+kr4VlVY
	pTUo2sc5NunIlIsAVGaGsCz/0GqScmGfGr3dZl+2nlybzsjhr2K4SsNgqpcQ+N+Km3EZ
	fBD0DLSVwDi9DWSQCrmb/ia32AZ236YHFyEugHXRfRMfjR5GW5D4Sh/pW9+9BmDYDQVf
	UueQ==
Received: by 10.180.105.163 with SMTP id gn3mr8035078wib.2.1346974423154;
	Thu, 06 Sep 2012 16:33:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm9411419wiz.11.2012.09.06.16.33.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 16:33:41 -0700 (PDT)
Date: Fri, 7 Sep 2012 01:34:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120906233413.GB3487@jama.jama.net>
References: <1346792317-26563-1-git-send-email-Martin.Jansa@gmail.com>
	<1346792317-26563-2-git-send-email-Martin.Jansa@gmail.com>
	<1346974199.7493.36.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1346974199.7493.36.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] packagegroup-core-x11: split machine specific parts to separate recipe packagegroup-core-x11-server
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 23:46:08 -0000
X-Groupsio-MsgNum: 28843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline

--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2012 at 12:29:59AM +0100, Richard Purdie wrote:
> On Tue, 2012-09-04 at 22:58 +0200, Martin Jansa wrote:
> > * add new packagegroup-core-x11-server to SIGGEN_EXCLUDERECIPES_ABISAFE,
> >   so that recipes depending on it are not rebuilt after every machine
> >   swtich
> > * allows to remove task-x11-server and task-x11 from meta-oe without=20
> >   loosing any functionality
> > * be carefull with default XSERVER value which does not have=20
> >   xf86-input-mouse and xf86-input-keyboard)
> > * VIRTUAL-RUNTIME_xserver_common which defaults to x11-common in oe-cor=
e=20
> >   and xserver-common in meta-oe's task-x11
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/layer.conf                               |  1 +
> >  .../packagegroups/packagegroup-core-x11-xserver.bb | 24 ++++++++++++++=
++++++++
> >  .../packagegroups/packagegroup-core-x11.bb         | 16 ++-------------
> >  3 files changed, 27 insertions(+), 14 deletions(-)
> >  create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-co=
re-x11-xserver.bb
>=20
> This sneaked in with a load of other patches. I never meant to merge
> this as I consider it broken.
>=20
> Task packages are cheap and having them being machine specific imposes
> little overhead. Splitting this into two just increases the parsing
> overhead through the number of recipes and doesn't do much else since
> there are still machine specific packages involved, all dependencies
> still get built etc. so I really don't see the point of the added
> complexity.

Yes task-* are cheap but if such recipe is in RDEPENDS of some other
more expensive recipe then it's better when it's excluded from sstate.
=20
Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBJMvUACgkQN1Ujt2V2gBw9IgCggTOwLVzVin182r2ieTPj3m08
caQAn0jXQK48psUXPkK6T3BRcQ2iEzRE
=2UNS
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
