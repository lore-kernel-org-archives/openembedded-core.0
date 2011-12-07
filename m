Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYJ2g-0005us-Gl
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 16:04:18 +0100
Received: by eekb15 with SMTP id b15so505639eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 06:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Qmq9nXwjSz+svanK7sh9jJWcCy/Y81i33EazRGboECw=;
	b=M/HMJhNN/41KcYdubHL21qDDZf+bD8nIpjNhsTlZZ8IAZq4E+oTW7zm8ufMk9r3IM9
	ikZIajhYGh7OFVVCk1unnsgTHfXIH2kR9XCxLjrPRuDO/1SfUi7ujvzlgpjXuf7FaOy8
	mfxFOwF9GRsYA8DqJkTjosmAYY8V8FrI844Oc=
Received: by 10.14.2.3 with SMTP id 3mr3506268eee.155.1323269850167;
	Wed, 07 Dec 2011 06:57:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm6464546eeb.4.2011.12.07.06.57.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 06:57:29 -0800 (PST)
Date: Wed, 7 Dec 2011 15:57:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207145727.GF3897@jama.jama.net>
References: <cover.1323160412.git.Martin.Jansa@gmail.com>
	<822c669a79e5f30bda467bc3a6f7b3c92377af22.1323160412.git.Martin.Jansa@gmail.com>
	<1323262134.30601.7.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1323262134.30601.7.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][oe-core 1/3] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Wed, 07 Dec 2011 15:04:18 -0000
X-Groupsio-MsgNum: 13737
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Content-Disposition: inline

--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 12:48:54PM +0000, Richard Purdie wrote:
> On Tue, 2011-12-06 at 09:35 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-extended/sysstat/sysstat.inc       |    7 ++++++-
> >  meta/recipes-extended/sysstat/sysstat_10.0.3.bb |    2 +-
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-e=
xtended/sysstat/sysstat.inc
> > index 2936f96..ca40ab5 100644
> > --- a/meta/recipes-extended/sysstat/sysstat.inc
> > +++ b/meta/recipes-extended/sysstat/sysstat.inc
> > @@ -22,7 +22,12 @@ do_install() {
> >  }
> > =20
> >  pkg_postinst_${PN} () {
> > -        /etc/init.d/populate-volatile.sh update
> > +        if [ -n "$D" ]; then
> > +                exit 1
> > +        fi
> > +        if [ -e /etc/init.d/populate-volatile.sh ]; then
> > +                /etc/init.d/populate-volatile.sh update
> > +        fi
> >  }
>=20
> The subject commit message and the code match now, thanks :)
>=20
> My only other question is whether we need to run this at first boot
> time? At first boot after rootfs, populate-volatile will run anyway. We
> therefore don't need to run the update as a postinst on device as part
> of first boot as well as it will always be covered if present.
>=20
> I therefore think this should be an "exit 0" and the commit message
> should be:
>=20
> "sysstat: don't run populate-volatile.sh update in do_rootfs, first boot
> or without populate-volatile.sh"
>=20
> Does that make sense?

Ah, this can work as long as nobody tries to add some default /etc/volatile=
=2Ecache=20
to image to start image with default set of volatiles before opkg
postinsts are started.

I'll send updated version as you want so you can pick better variant
(and I'll be happy too with -e /etc/init.d/populate-volatile.sh false).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7fftcACgkQN1Ujt2V2gBzo8gCgq3aNOVtoSJiVx12mBY23rXLo
NBsAn3soYU9ZZdFd3VOGHLGEFISYgq6p
=/G89
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
