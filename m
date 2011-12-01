Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW63z-0005m1-Gp
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:48:32 +0100
Received: by bkbzv15 with SMTP id zv15so1636201bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ioVdncVGR9lEeagzNA79lFK444AXNVxHuuShIbM5g/I=;
	b=JkElYQT2AFiZ4IFipR37MltREvvqMGNIg579pAzpZ7l8IZfope4zlCwt+yW29gUc/2
	itZmTj3kasJJ7aRxAOJ5W3JS0NL+QttCOgVx6HjvlRhlspBdwp5tmFHE08i/55ok8I3X
	myT/DhIKSjEl2Cc9XqilnRH97U6HVjkA7OxX0=
Received: by 10.204.34.148 with SMTP id l20mr7038739bkd.55.1322743309552;
	Thu, 01 Dec 2011 04:41:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h7sm11063276bkw.12.2011.12.01.04.41.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 04:41:48 -0800 (PST)
Date: Thu, 1 Dec 2011 13:41:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201124146.GD19917@jama.jama.net>
References: <cover.1322740824.git.Martin.Jansa@gmail.com>
	<9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
	<1322741889.17484.115.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1322741889.17484.115.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][oe-core 1/4] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Thu, 01 Dec 2011 12:48:32 -0000
X-Groupsio-MsgNum: 13434
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DrWhICOqskFTAXiy"
Content-Disposition: inline

--DrWhICOqskFTAXiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 12:18:09PM +0000, Richard Purdie wrote:
> On Thu, 2011-12-01 at 13:02 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-extended/sysstat/sysstat.inc       |    7 ++++++-
> >  meta/recipes-extended/sysstat/sysstat_10.0.2.bb |    2 +-
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
>=20
> I'm confused. Can't we exit 0 here since the system will have run
> populate-volatile.sh update at rootfs time or first boot as needed so we
> don't need to run it again?
>=20
> See recipes-core/dbus/dbus.inc or pulseaudio for similar examples.

Ah I didn't know about importance of return value in this case and I was
looking at=20
meta/classes/module.bbclass
meta/recipes-connectivity/avahi/avahi.inc
for similar examples.

I'll learn how it's changing behavior and why avahi has exit 1 in 2/3
and exit 0 in 1/3 postinst and then I'll send updated patch if needed,
but now I'm 5 hours late to daywork.. :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DrWhICOqskFTAXiy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XdgoACgkQN1Ujt2V2gBwnCwCfS83zBpa+Syj50ST5LbhVs1Bg
sxEAn1M1B2KUL4qKJ2CQHms9MgmEXZqZ
=8ekP
-----END PGP SIGNATURE-----

--DrWhICOqskFTAXiy--
