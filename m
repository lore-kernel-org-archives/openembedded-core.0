Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 15DCF60990
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 09:44:42 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so1510996eek.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FkJ390u8WWXchT1DLcQji9Mamx083RF1Tki55lPdHmI=;
	b=rJAcEp1PmBw2TEKpyLUc+WYIMP5OCgyg+LrAhywgDTEfWAediUATtuvfR2b+mKzTn8
	6z/ufA8tobKThszAJPN7Hx2UrsTuk6aKKNovFkUdUA3nJDhxLD7DaQ2LoSR795trUMJZ
	zpThnWB2JIMLNCnD1btvuUO/TTWYNyN09spee+jDK6Oa73YzPZ6+RLCGpxka//PhlIUD
	0bWXsK+3GlLi8uS75S6ONgUh4OIof3zltWWo0XZOOdIUITqzDTNtSunDPDNUz3w+E6/o
	bFjkT8gxKXm94f93bjr+QuQNj6zPyvc8ZD+JJr3hDGYnp784DC5jiEpYtehTcjzT13Jj
	GKtg==
X-Received: by 10.15.48.67 with SMTP id g43mr24855774eew.17.1377510282713;
	Mon, 26 Aug 2013 02:44:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm20026776eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 02:44:42 -0700 (PDT)
Date: Mon, 26 Aug 2013 11:45:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Riku Voipio <riku.voipio@linaro.org>
Message-ID: <20130826094552.GP3544@jama>
References: <1377063923-23922-1-git-send-email-raj.khem@gmail.com>
	<CAAqcGHmnX+7CCZ9BS0s2Xut5DbuzSgu1h-a-bFsDo588iyi6dA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAqcGHmnX+7CCZ9BS0s2Xut5DbuzSgu1h-a-bFsDo588iyi6dA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Update SRC_URI and fix unpackaged empty dir
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
X-List-Received-Date: Mon, 26 Aug 2013 09:44:44 -0000
X-Groupsio-MsgNum: 44031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+W7ryvxEk4RRyt+P"
Content-Disposition: inline

--+W7ryvxEk4RRyt+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 12:37:18PM +0300, Riku Voipio wrote:
> Hi,
>=20
> On 21 August 2013 08:45, Khem Raj <raj.khem@gmail.com> wrote:
> > diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes=
-core/eglibc/eglibc-package.inc
> > index a590cce..1a23805 100644
> > --- a/meta/recipes-core/eglibc/eglibc-package.inc
> > +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> > @@ -76,6 +76,10 @@ do_install_append () {
> >         rm -f ${D}${sysconfdir}/localtime
> >         rm -rf ${D}${localstatedir}
> >
> > +       # remove empty eglibc dir
> > +       if [ -d ${D}${libdir}/eglibc ]; then
> > +               rmdir ${D}${libdir}/eglibc
> > +       fi
> >         oe_multilib_header bits/syscall.h
> >
> >         if [ -f ${D}${bindir}/mtrace ]; then
>=20
> This breaks in the case the directory exists and is not empty - which
> is the case when you build with eglibc-2.17. In that case there is a
> pt_chown binary. pt_chown is deprecated since devpts was invented, and
> now removed in 2.18.

Can we use just
rmdir --ignore-fail-on-non-empty ${D}${libdir}/eglibc
?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+W7ryvxEk4RRyt+P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIbI9AACgkQN1Ujt2V2gBxqKACgpQGx4ii5RNe7KE1RQgoY9/Ss
QZ8AoLuV/F9/tmlm48fmuebbhcHToxht
=cSXC
-----END PGP SIGNATURE-----

--+W7ryvxEk4RRyt+P--
